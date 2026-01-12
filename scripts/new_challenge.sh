#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage:
  $0 <chapter> <NN> "Challenge Title" ["Chapter Title"] [--no-code]
Examples:
  $0 04 01 "Message" "Structs"
  $0 04 01 "Message"         # no chapter title -> chapter dir is '04'
  $0 04 01 "Multiple Choice Question" --no-code  # skips code/test files
EOF
  exit 2
}

if [ $# -lt 3 ]; then
  usage
fi

# pad a number to two digits (1 -> 01)
# Use base-10 forced arithmetic so values like '08' don't get treated as octal.
# $((10#$1)) forces decimal interpretation even when input has a leading zero.
pad2() { printf "%02d" "$((10#$1))"; }

# sanitize a string for use in directory names (lowercase, non-alnum -> -, trim -)
sanitize_dir() {
  printf "%s" "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/-/g' \
    | sed -E 's/^-+|-+$//g'
}

# parse args
chapter_num=$(pad2 "$1")        # numeric chapter (zero-padded)
challenge_num=$(pad2 "$2")      # numeric challenge (zero-padded)
challenge_title="$3"            # required
chapter_title="${4:-}"          # optional

# check for --no-code flag (removes it from args if present)
no_code=false
if [ "${!#}" = "--no-code" ]; then
  no_code=true
  set -- "${@:1:$(($#-1))}"
fi

# build chapter directory name: either "04" or "04-structs"
if [ -n "$chapter_title" ]; then
  chapter_slug=$(sanitize_dir "$chapter_title")
  if [ -z "$chapter_slug" ]; then
    echo "error: chapter title \"$chapter_title\" did not produce a valid slug" >&2
    exit 1
  fi
  chapter_dirname="${chapter_num}-${chapter_slug}"
else
  chapter_dirname="${chapter_num}"
fi

# challenge slug derived from challenge_title, used in directory name
challenge_dir_slug=$(sanitize_dir "$challenge_title")
if [ -z "$challenge_dir_slug" ]; then
  echo "error: challenge title \"$challenge_title\" did not produce a valid slug" >&2
  exit 1
fi

slug="${challenge_num}-${challenge_dir_slug}"    # e.g. "01-message"
base_dir="go/challenges/${chapter_dirname}/${slug}" # e.g. "go/challenges/04-structs/01-message"

# filename base uses underscores (hello-world -> hello_world)
file_base="${challenge_dir_slug//-/_}"
go_file="${file_base}.go"
test_file="${file_base}_test.go"
readme_file="README.md"

# safety: don't overwrite existing challenge
if [ -e "$base_dir" ]; then
  echo "error: $base_dir already exists" >&2
  exit 1
fi

# create chapter dir (parents) and challenge dir
mkdir -p "$base_dir"

# If a chapter title was provided, create a chapter README with the human title
if [ -n "$chapter_title" ]; then
  chapter_readme="go/challenges/${chapter_dirname}/README.md"
  if [ ! -e "$chapter_readme" ]; then
    cat > "$chapter_readme" <<EOF
# $chapter_title

Chapter: $chapter_dirname

This chapter contains challenges for: $chapter_title
EOF
  fi
fi

# write implementation file
if [ "$no_code" = false ]; then
  cat > "$base_dir/$go_file" <<'EOF'
package main

// Implement the challenge here.
// This file was generated from the challenge title.
func main() {}
EOF
fi

# write test file
if [ "$no_code" = false ]; then
  cat > "$base_dir/$test_file" <<'EOF'
package main

import "testing"

func TestPlaceholder(t *testing.T) {
    t.Log("replace this with real tests")
}
EOF
fi

# small challenge README using the human titles
cat > "$base_dir/$readme_file" <<EOF
# $challenge_title

Challenge: $slug
Chapter: $chapter_dirname

Replace this with the challenge description and instructions.
EOF

echo "Created $base_dir"
echo "Files:"
if [ "$no_code" = false ]; then
  echo " - $go_file"
  echo " - $test_file"
fi
echo " - $readme_file"
if [ -n "$chapter_title" ]; then
  echo "Chapter README: go/challenges/${chapter_dirname}/README.md"
fi
if [ "$no_code" = false ]; then
  echo "Run tests: go test ./$base_dir -v"
fi