# modules

Challenge: 05-modules
Chapter: 11-packages-and-modules

Go programs are organized into *packages*. A package is a directory of Go code that's all compiled together. Functions, types, variables, and constants defined in one source file are visible to **all other source files within the same package (directory)**.

A *repository* contains one or more *modules*. A module is a collection of Go packages that are released together.

![module.png](../_attachments/IyRpjCm-1280x544.png)

## One Module Per Repo (Usually)

A file named `go.mod` at the root of a project declares the module. It contains:

- the module path
- The version of the Go language your project requires
- Optionally, any external package dpenedencies your project has

The module path is just the imoprt path prefix for all packages within the module. Here's an example of a `go.mod` file:

```go
module github.com/bootdotdev/exampleproject

go 1.25.1

require github.com/google/examplepackage v1.3.0
```

Each module's path not only serves as an import path prefix for the packages within but *also indicates where the go command should look to download it*. For example, to download the `module golang.org/x/tools`, the go command would consult the repository located at [tools](https://golang.org/x/tools).

> An "import path" is a string used to import a package. A package's import path is its module path joined with its subdirectory within the module. For example, the module `github.com/google/go-cmp` contains a package in the directory `cmp/`. That package's import path is `github.com/google/go-cmp/cmp`. Packages in the standard library do not have a module path prefix.

-- Paraphrased from [Golang.org's code organisation](https://golang.org/doc/code#Organization)

## Only Github?

You don't *need* to publish your code to a remote repository before you can build it. A module can be defined locally without belonging to a remote repo. However, it's a good habit to keep a copy of all your projects on *some* remote server, like Github.

## Question 1

What is a Go module?

## Answer 1

- [ ] An executable main package
- [ ] A library package
- [ ] A file of Go code
- [x] A collection of packages that are released together

## Question 2

Do packages in the standard library have a module path prefix?

## Answer 2

- [ ] Yes
- [x] No

## Question 3

What is an import path?

## Answer 3

- [ ] An HTTP connection
- [x] A module path + package subdirectory
- [ ] A RESTful server
