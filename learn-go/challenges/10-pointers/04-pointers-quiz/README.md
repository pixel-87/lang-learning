# pointers quiz

Challenge: 04-pointers-quiz
Chapter: 10-pointers

```go
package main

func main() {
    var x int = 50
    var y *int = &x
    *y = 100
}
```

## Question 1

What is the value of *y after the code on the left executes?

## Answer 1

- [ ] nil
- [ ] a memory address pointing to x
- [ ] 50
- [x] 100

## Question 2

What is the value of x after the entire code block on the left executes?

## Answer 2

- [ ] nil
- [ ] a memory address pointing to x
- [ ] 50
- [x] 100
