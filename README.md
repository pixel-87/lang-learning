# Language Learning - Boot.dev Challenges

This repository contains local implementations of Boot.dev challenges for Go and C.

## Repository Structure

- `go/`: Contains Golang challenges, scripts, and module files.
- `c/`: Contains C challenges and Makefiles.
- `scripts/`: Unified scripts for managing challenges.

## Setting Up a New Challenge

Use the `scripts/new.sh` script to create a new challenge directory with boilerplate code.

### Usage

```bash
./scripts/new.sh <lang> <chapter> <NN> "Challenge Title" ["Chapter Title"] [--no-code]
```

- `<lang>`: Either `go` or `c`.
- `<chapter>`: Chapter number (e.g., 04).
- `<NN>`: Challenge number (zero-padded).
- `"Challenge Title"`: Human-readable title.
- `"Chapter Title"`: Optional human-readable chapter title.
- `--no-code`: Skip creating source files.

### Examples

- **Go**: `./scripts/new.sh go 04 01 "Structs in Go" "Structs"`
- **C**: `./scripts/new.sh c 01 01 "Hello World" "Basics"`

## Running Challenges

### Go
To run tests for a Go challenge:
```bash
go test ./go/challenges/<chapter>/<challenge> -v
```

### C
To run a C challenge:
```bash
cd c/challenges/<chapter>/<challenge>
make run
```

## Nix Environment

This project uses Nix for a reproducible development environment.
- `nix develop`: Enter the shell with all tools (Go, GCC, Make, etc.)
- `nix build`: Build the Go project.
