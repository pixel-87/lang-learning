# Boot.dev - Learning Mono-repo

This repository contains local implementations of Boot.dev challenges for various courses including Python, Go, and C.

## Repository Structure

- `learn-go/`: "Learn Go" course challenges and module files.
- `learn-c/`: "Learn C" course challenges.
- `dsa-python/`: "DSA in Python" course challenges.
- `scripts/`: Unified scripts for managing challenges.

## Setting Up a New Lesson

Use the `scripts/generate.sh` script to create a new lesson directory with boilerplate code.

### Usage

```bash
./scripts/generate.sh <course_slug> <chapter> <lesson> "Lesson Title" ["Chapter Title"] [--lang <lang>] [--no-code]
```

- `course_slug`: The directory name for the course (e.g., `dsa-python`, `learn-go`).
- `<chapter>`: Chapter number.
- `<lesson>`: Lesson number.
- `"Lesson Title"`: Human-readable title.
- `"Chapter Title"`: Optional human-readable chapter title.
- `--lang <lang>`: Force language (python, go, c, js). If not provided, inferred from `course_slug`.

### Examples

- **DSA in Python**:
  ```bash
  ./scripts/generate.sh dsa-python 1 1 "Stack Implementation" "Data Structures"
  ```
- **Go**:
  ```bash
  ./scripts/generate.sh learn-go 4 1 "Structs" --lang go
  ```

## Running Challenges

### Python
To run a Python lesson:
```bash
python3 dsa-python/challenges/<chapter>-<slug>/<lesson>-<slug>/main.py
```

### Go
To run a Go lesson:
```bash
go run ./learn-go/challenges/<chapter>/<lesson>
```

### C
To run a C lesson:
```bash
cd learn-c/challenges/<chapter>/<lesson>
make run
```

## Nix Environment

This project uses Nix for a reproducible development environment.
- `nix develop`: Enter the shell with all tools (Go, GCC, Make, Python, etc.)
- `nix build`: Build the Go project.
