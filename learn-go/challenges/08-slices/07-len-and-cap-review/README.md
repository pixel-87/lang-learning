# len and cap review

Challenge: 07-len-and-cap-review
Chapter: 08-slices

The length of a slice may be changed as long as it still fits within the limits of the underlying array; just assign it to a slice of itself. The capacity of a slice, accessible by the built-in function `cap`, reports the maximum length the slice may assume. Here is a function to append data to a slice. If the data exceeds the capacity, the slice is reallocated. The resulting slice is returned. The function uses the fact that len and `cap` are legal when applied to the `nil` slice, and return `0`.

Referenced from [Effective Go](https://golang.org/doc/effective_go.html#slices).

```go
func Append(slice, data []byte) []byte {
    l := len(slice)
    if l + len(data) > cap(slice) {  // reallocate
        // Allocate double what's needed, for future growth.
        newSlice := make([]byte, (l+len(data))*2)
        // The copy function is predeclared and works for any slice type.
        copy(newSlice, slice)
        slice = newSlice
    }
    slice = slice[0:l+len(data)]
    copy(slice[l:], data)
    return slice
}
```

## Question 1

What does the cap() function return?

## Answer 1

- [x] The maximum length of the slice before reallocation of the array is necessary.
- [ ] The last element of the slice.

## Question 2

What does the len() function return?

## Answer 2

- [x] The maximum length of the slice before reallocation of the array is necessary.
- [x] The current length of the slice.

## Question 3

What do len() and cap() do when a slice is nil?

- [x] Return 0.
- [ ] Panic.
