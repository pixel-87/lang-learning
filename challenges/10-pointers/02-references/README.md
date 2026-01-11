# references

Challenge: 02-references
Chapter: 10-pointers

It's possible to define an empty pointer. For example, an empty pointer to an integer:

```go
var p *int

fmt.Printf("value of p: %v\n", p)
// value of p: <nil>
```

Its zero value is `nil`, which means it doesn't point to any memory address. Empty pointers are also called "nil pointers".

Instead of starting with a nil pointer, it's common to use the `&` operator to get a pointer to its operand:

```go
myString := "hello"      // myString is just a string
myStringPtr := &myString // myStringPtr is a pointer to myString's address

fmt.Printf("value of myStringPtr: %v\n", myStringPtr)
// value of myStringPtr: 0x140c050
```

## Dereference

The `*` operator dereferences a pointer to get the original value.

```go
*myStringPtr = "world"                              // set myString through the pointer
fmt.Printf("value of myString: %s\n", *myStringPtr) // read myString through the pointer
// value of myString: world
```

Unlike C, Go has no pointer arthmetic.

## Assignment

Complete the `removeProfranity` function.

It should use the [strings.ReplaceAll](https://pkg.go.dev/strings#ReplaceAll) function to replace all instances of following words in the input `message` with asterisks.


| Word | Replacement|
| -------------- | --------------- |
| fubb | **** |
| shiz | **** |
| witch | ***** |


It should *update* the value in the pointer and return nothing.

Do *not* alter the function signature.
