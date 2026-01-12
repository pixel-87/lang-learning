# Empty Struct

Challenge: 08-empty-struct
Chapter: 04-structs

[Empty structs](https://dave.cheney.net/2014/03/25/the-empty-struct) are used in Go as a [unary](https://en.wikipedia.org/wiki/Unary_operation) value.

``` go
// anonymous empty struct type
empty := struct{}{}

// named empty struct type
type emptyStruct struct{}
empty := emptyStruct{}
```

The cool thing about empty structs is that they're the smallest possible type in Go: they take up **zero bytes of memory.**

[memoryUsage](../_attachments/memoryUsage.png)

Later in this course, you'll see how and when they're used: it's suprising often! Mostly with maps and channels.

## Question 1

Why does the empty anonymous struct have two pairs of braces? `struct{}{}`

## Answer 1

- [ ] It doesn't, it's a syntax error
- [ ] Because the Go developers like to flex their 200 WPM typing speed
- [x] `struct{}` is the type (empty struct) and `{}` is the value (empty struct literal)

## Question 2

Which is ordered from least -> most memory usage?

## Answer 2

- [ ] uint16, bool, int64, struct{}
- [ ] strct{}, uint16, bool int64
- [x] struct{}, bool, uint16, int64
- [ ] bool, struct{}, uint16, int64

