#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage:
  $0 [<lang>] <chapter> <NN> "Challenge Title" ["Chapter Title"] [--no-code]

Languages:
  go, learn-go (default: go), c

Examples:
  $0 12 01 "concurrency" "channels"              # Creates in learn-go/challenges/
  $0 go 04 01 "Message" "Structs"                # Explicit language
  $0 c 01 01 "Hello World" "Basics"              # C challenge
  $0 04 01 "Quiz" "Structs" --no-code            # No implementation files
EOF
  exit 2
}

if [ $# -lt 3 ]; then
  usage
fi

# Detect language: if first arg is a known language, use it; otherwise assume go
lang=""
args=()
for arg in "$@"; do
  if [ -z "$lang" ] && [[ "$arg" =~ ^(go|learn-go|c)$ ]]; then
    lang="$arg"
  else
    args+=("$arg")
  fi
done

# Default to go if not specified
lang="${lang:-go}"

# Now parse positional args from remaining
if [ ${#args[@]} -lt 3 ]; then
  usage
fi

chapter_num=$(printf "%02d" "$((10#${args[0]}))")
challenge_num=$(printf "%02d" "$((10#${args[1]}))")
challenge_title="${args[2]}"
chapter_title="${args[3]:-}"

# Check for --no-code flag
no_code=false
for arg in "${args[@]:3}"; do
  if [ "$arg" = "--no-code" ]; then
    no_code=true
  fi
done

# Sanitize strings for directory names
sanitize_dir() {
  printf "%s" "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/-/g' \
    | sed -E 's/^-+|-+$//g'
}

# Build directory structure
chapter_slug=$(sanitize_dir "$chapter_title")
if [ -n "$chapter_title" ]; then
  if [ -z "$chapter_slug" ]; then
    echo "error: chapter title \"$chapter_title\" did not produce a valid slug" >&2
    exit 1
  fi
  chapter_dirname="${chapter_num}-${chapter_slug}"
else
  chapter_dirname="${chapter_num}"
fi

challenge_dir_slug=$(sanitize_dir "$challenge_title")
if [ -z "$challenge_dir_slug" ]; then
  echo "error: challenge title \"$challenge_title\" did not produce a valid slug" >&2
  exit 1
fi

slug="${challenge_num}-${challenge_dir_slug}"

# Detect challenges root directory (smart detection for flexibility)
if [ -d "learn-go/challenges" ]; then
  challenges_root="learn-go/challenges"
elif [ -d "go/challenges" ]; then
  challenges_root="go/challenges"
elif [ -d "challenges" ]; then
  challenges_root="challenges"
else
  challenges_root="${lang}/challenges"
fi

base_dir="${challenges_root}/${chapter_dirname}/${slug}"

# Safety check
if [ -e "$base_dir" ]; then
  echo "error: $base_dir already exists" >&2
  exit 1
fi

mkdir -p "$base_dir"

# Create chapter README if needed
if [ -n "$chapter_title" ]; then
  chapter_readme="${challenges_root}/${chapter_dirname}/README.md"
  if [ ! -e "$chapter_readme" ]; then
    cat > "$chapter_readme" <<EOF
# $chapter_title

Chapter: $chapter_dirname

This chapter contains challenges for: $chapter_title
EOF
  fi
fi

# Create challenge README
cat > "$base_dir/README.md" <<EOF
# $challenge_title

Challenge: $slug
Chapter: $chapter_dirname

Replace this with the challenge description and instructions.
EOF

# Generate language-specific boilerplate
if [ "$no_code" = false ]; then
  file_base="${challenge_dir_slug//-/_}"
  
  case "$lang" in
    go|learn-go)
      cat > "$base_dir/${file_base}.go" <<'EOF'
package main

import "fmt"

func main() {
	fmt.Println("Hello from challenge")
}
EOF
      cat > "$base_dir/${file_base}_test.go" <<'EOF'
package main

import "testing"

func TestChallenge(t *testing.T) {
	// Add test logic here
}
EOF
      ;;
    c)
      cat > "$base_dir/main.c" <<'EOF'
#include <stdio.h>

int main() {
    printf("Hello from challenge\n");
    return 0;
}
EOF
      cat > "$base_dir/Makefile" <<'EOF'
CC = gcc
CFLAGS = -Wall -Wextra -g

all: main

main: main.c
	$(CC) $(CFLAGS) -o main main.c

clean:
	rm -f main

run: main
	./main
EOF
      ;;
    *)
      echo "error: unsupported language: $lang" >&2
      exit 1
      ;;
  esac
fi

# Output summary
echo "✓ Created $base_dir"
echo "Files:"
if [ "$no_code" = false ]; then
  case "$lang" in
    go|learn-go)
      echo " - ${file_base}.go"
      echo " - ${file_base}_test.go"
      ;;
    c)
      echo " - main.c"
      echo " - Makefile"
      ;;
  esac
fi
echo " - README.md"
if [ -n "$chapter_title" ]; then
  echo "Chapter README: ${challenges_root}/${chapter_dirname}/README.md"
fi
if [ "$no_code" = false ]; then
  case "$lang" in
    go|learn-go)
      echo ""
      echo "Run tests: go test ./$base_dir -v"
      ;;
    c)
      echo ""
      echo "Run: cd $base_dir && make run"
      ;;
  esac
fi
