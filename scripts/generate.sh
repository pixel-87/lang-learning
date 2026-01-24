#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<EOF
Usage:
  $0 <course_slug> <chapter> <lesson> "Lesson Title" ["Chapter Title"] [--lang <lang>] [--no-code]

Arguments:
  course_slug:   The directory name for the course (e.g., dsa-python, learn-go).
  chapter:       Chapter number (e.g., 4).
  lesson:        Lesson number (e.g., 1).
  Lesson Title:  Title of the lesson.
  Chapter Title: Title of the chapter (optional).

Options:
  --lang <lang>: Force language (python, go, c, js). If not provided, inferred from course_slug.
  --no-code:     Do not generate code files, only directories and READMEs.

Examples:
  $0 dsa-python 1 1 "Stack Implementation" "Data Structures"
  $0 learn-go 4 1 "Structs" --lang go
EOF
  exit 2
}

if [ $# -lt 4 ]; then
  usage
fi

course_slug="$1"
shift

# Detect language from course_slug if not specified later
lang=""
if [[ "$course_slug" == *"python"* ]]; then
  lang="python"
elif [[ "$course_slug" == *"go"* ]]; then
  lang="go"
elif [[ "$course_slug" == *"javascript"* ]] || [[ "$course_slug" == *"js"* ]]; then
  lang="js"
elif [[ "$course_slug" == *"c"* ]] && [[ "$course_slug" != *"css"* ]]; then # naive check
  lang="c"
fi

# Parse args
chapter_in="$1"
lesson_in="$2"
lesson_title="$3"
chapter_title="${4:-}"
shift 3
if [ -n "$chapter_title" ]; then
    # Check if next arg is a flag or part of arguments
    if [[ "$chapter_title" == --* ]]; then
        # Actually chapter_title was optional, so if $4 starts with --, it's a flag, and chapter_title is empty
        # But wait, I assigned $4 to chapter_title.
        # Let's clean this up.
        :
    else
        shift 1
    fi
else
    # $4 was empty or missing
    :
fi

# Process flags
no_code=false
while [ $# -gt 0 ]; do
  case "$1" in
    --lang)
      lang="$2"
      shift 2
      ;;
    --no-code)
      no_code=true
      shift
      ;;
    -*)
      # If chapter_title was actually a flag (because user skipped the optional arg), handle it?
      # The usage says: <course> <chapter> <lesson> "Title" ["Chapter Title"]
      # If user does: valid valid valid "Title" --lang python
      # Then $4 ("Chapter Title") will be "--lang".
      # We should detect this.
      if [[ "$chapter_title" == --* ]]; then
          # Shift back the 'flag' that was captured as chapter_title
          # And unset chapter_title
          set -- "$chapter_title" "$@"
          chapter_title=""
          continue
      fi
      ;;
    *)
      # Should not happen unless extra args
      shift
      ;;
  esac
done

if [ -z "$lang" ] && [ "$no_code" = false ]; then
    echo "Error: Could not infer language from course slug '$course_slug'. Please use --lang <lang>."
    exit 1
fi

# Helpers
pad2() { printf "%02d" "$((10#$1))"; }
sanitize_dir() {
  printf "%s" "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/-/g' \
    | sed -E 's/^-+|-+$//g'
}

chapter_num=$(pad2 "$chapter_in")
lesson_num=$(pad2 "$lesson_in")

# Build paths
if [ -n "$chapter_title" ]; then
  chapter_slug=$(sanitize_dir "$chapter_title")
  chapter_dirname="${chapter_num}-${chapter_slug}"
else
  chapter_dirname="${chapter_num}"
fi

lesson_slug_files=$(sanitize_dir "$lesson_title")
full_lesson_dirname="${lesson_num}-${lesson_slug_files}"

base_dir="${course_slug}/challenges/${chapter_dirname}/${full_lesson_dirname}"

if [ -e "$base_dir" ]; then
  echo "Error: Directory '$base_dir' already exists."
  exit 1
fi

mkdir -p "$base_dir"

# Chapter README
chapter_readme="${course_slug}/challenges/${chapter_dirname}/README.md"
if [ ! -e "$chapter_readme" ] && [ -n "$chapter_title" ]; then
  cat > "$chapter_readme" <<EOF
# $chapter_title

Chapter: $chapter_num
EOF
fi

# Lesson README
cat > "$base_dir/README.md" <<EOF
# $lesson_title

Course: $course_slug
Chapter: $chapter_title ($chapter_num)
Lesson: $lesson_num

## Instructions

(Paste instructions here)
EOF

if [ "$no_code" = false ]; then
  case "$lang" in
    python)
      cat > "$base_dir/main.py" <<EOF
def main():
    print("Hello from $lesson_title")

if __name__ == "__main__":
    main()
EOF
      echo "Created Python lesson at $base_dir"
      echo "Run: python3 $base_dir/main.py"
      ;;
    go)
      # Create Go file
      cat > "$base_dir/main.go" <<EOF
package main

import "fmt"

func main() {
	fmt.Println("Hello from $lesson_title")
}
EOF
      echo "Created Go lesson at $base_dir"
      echo "Run: go run ./$base_dir"
      ;;
    c)
       cat > "$base_dir/main.c" <<EOF
#include <stdio.h>

int main() {
    printf("Hello from $lesson_title\\n");
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
       echo "Created C lesson at $base_dir"
       echo "Run: cd $base_dir && make run"
       ;;
    js|javascript)
       cat > "$base_dir/index.js" <<EOF
console.log("Hello from $lesson_title");
EOF
       echo "Created JS lesson at $base_dir"
       echo "Run: node $base_dir/index.js"
       ;;
    *)
       echo "Language '$lang' is not fully supported for templating yet, but directory created."
       ;;
  esac
fi
