# Boot.dev - Learning Mono-repo

This repository contains local implementations of Boot.dev challenges for various courses including Python, Go, and C.

## Repository Structure

- `learn-go/`: "Learn Go" course challenges and module files.
- `learn-c/`: "Learn C" course challenges.
- `dsa-python/`: "DSA in Python" course challenges.
- `scripts/`: Unified scripts for managing challenges.

## Creating a New Challenge

Use the `scripts/new-challenge` script to scaffold a new challenge directory with boilerplate code.

### Usage

```bash
./scripts/new-challenge [<lang>] <chapter> <NN> "Challenge Title" ["Chapter Title"] [--no-code]
```

- `<lang>`: Optional language (go, learn-go, c). Defaults to go.
- `<chapter>`: Chapter number.
- `<NN>`: Challenge number.
- `"Challenge Title"`: Human-readable title.
- `"Chapter Title"`: Optional human-readable chapter title.
- `--no-code`: Skip boilerplate code/test file generation.

### Examples

- **Go challenge** (implicit language):
  ```bash
  ./scripts/new-challenge 04 01 "Message" "Structs"
  ```
- **Go challenge** (explicit language):
  ```bash
  ./scripts/new-challenge go 04 01 "Message" "Structs"
  ```
- **C challenge**:
  ```bash
  ./scripts/new-challenge c 01 01 "Hello World" "Basics"
  ```
- **Quiz without code**:
  ```bash
  ./scripts/new-challenge 05 02 "Quiz" "Interfaces" --no-code
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
