# slices review

Challenge: 03-slices-review
Chapter: 08-slices

Slices wrap arrays to give a more general, powerful, and convenient interface to sequences of data. Except for items with explicit dimensions such as transformation matrices, most array programming in Go is done with slices rather than simple arrays.

Slices hold references to an underlying array, and if you assign one slice to another, both refer to the **same** array. If a function takes a slice argument, any changes it makes to the elements of the slice *will be visbile to the caller*, analogous to passing a [pointer](https://en.wikipedia.org/wiki/Pointer_%28computer_programming%29) (we'll cover pointers later) to the underlying array. A Read function can therefore accept a slice argument rather than a pointer and a count; the length within the slice sets an upper limit of how much data to read. Here is the signature of the [Read()](https://pkg.go.dev/os#File.Read) method of the `File` type in package `os`

referenced from [Effective Go](https://golang.org/doc/effective_go.html#slices).

```go
func (f *File) Read(buf []byte) (n int, err error)
``````

## Question 1

Which references the other?

## Answer 1

- [x] Slices reference arrays
- [ ] Arrays reference slices

## Question 2

Multiples slices can point to the same array

## Answer 2

- [x] True
- [ ] False

## Question 3

A function that only has access to a slice can modify the elements of the underlying array

## Answer 3

- [x] True
- [ ] False
