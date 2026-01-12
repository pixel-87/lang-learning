#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage:
  $0 <lang> <chapter> <NN> "Challenge Title" ["Chapter Title"] [--no-code]

Languages:
  go, c

Examples:
  $0 go 04 01 "Message" "Structs"
  $0 c 01 01 "Hello World" "Basics"
EOF
  exit 2
}

if [ $# -lt 4 ]; then
  usage
fi

lang=$1
shift

# pad a number to two digits (1 -> 01)
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

# check for --no-code flag
no_code=false
for arg in "$@"; do
  if [ "$arg" = "--no-code" ]; then
    no_code=true
    break
  fi
done

# build chapter directory name
if [ -n "$chapter_title" ]; then
  chapter_slug=$(sanitize_dir "$chapter_title")
  chapter_dirname="${chapter_num}-${chapter_slug}"
else
  chapter_dirname="${chapter_num}"
fi

challenge_dir_slug=$(sanitize_dir "$challenge_title")
slug="${challenge_num}-${challenge_dir_slug}"
base_dir="${lang}/challenges/${chapter_dirname}/${slug}"

# safety: don't overwrite existing challenge
if [ -e "$base_dir" ]; then
  echo "error: $base_dir already exists" >&2
  exit 1
fi

mkdir -p "$base_dir"

# Chapter README
if [ -n "$chapter_title" ]; then
  chapter_readme="${lang}/challenges/${chapter_dirname}/README.md"
  if [ ! -e "$chapter_readme" ]; then
    cat > "$chapter_readme" <<EOF
# $chapter_title

Chapter: $chapter_dirname

This chapter contains $lang challenges for: $chapter_title
EOF
  fi
fi

# Challenge README
cat > "$base_dir/README.md" <<EOF
# $challenge_title

Challenge: $slug
Chapter: $chapter_dirname

Replace this with the challenge description and instructions.
EOF

if [ "$no_code" = false ]; then
  case "$lang" in
    go)
      file_base="${challenge_dir_slug//-/_}"
      cat > "$base_dir/${file_base}.go" <<EOF
package main

import "fmt"

func main() {
	fmt.Println("Hello from $challenge_title")
}
EOF
      cat > "$base_dir/${file_base}_test.go" <<EOF
package main

import "testing"

func TestChallenge(t *testing.T) {
	// Add test logic here
}
EOF
      echo "Created $base_dir"
      echo "Run tests: go test ./$base_dir -v"
      ;;
    c)
      cat > "$base_dir/main.c" <<EOF
#include <stdio.h>

int main() {
    printf("Hello from $challenge_title\\n");
    return 0;
}
EOF
      cat > "$base_dir/Makefile" <<EOF
CC = gcc
CFLAGS = -Wall -Wextra -g

all: main

main: main.c
	\$(CC) \$(CFLAGS) -o main main.c

clean:
	rm -f main

run: main
	./main
EOF
      echo "Created $base_dir"
      echo "To run: cd $base_dir && make run"
      ;;
    *)
      echo "Unsupported language: $lang"
      exit 1
      ;;
  esac
fi
