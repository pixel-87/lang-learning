# package naming

Challenge: 02-package-naming
Chapter: 11-packages-and-modules

By *convention*, a package's name is the same as the last element of its import path. For instance, the `math/rand` package comprises files that being with:

```go
package rand
```

That said, package names aren't *required* to match their import path. For example, I could write a new package name with the path github.com/textio/rand and name the package random:

```go
package random
```

While the above is possible, it is discouraged for the sake of consistency.

## One Package / Directory

A directory of Go code aan have **at most** one package. All `.go` files in a single directory must all belong to the same package. If they don't, an error will be thrown by the compiler. This is true for main and library packages alike.

## Question 1

What would be the conventional package name of a package with the path github.com/wagslane/parser?

## Answer 1

- [ ] wagslane
- [x] parser
- [ ] go-parser
- [ ] github.com

## Question 2

Given the import path of path/to/rand, which of these is a valid package name.

- [ ] spam
- [ ] random
- [ ] rand
- [ ] path
- [x] Any of these
