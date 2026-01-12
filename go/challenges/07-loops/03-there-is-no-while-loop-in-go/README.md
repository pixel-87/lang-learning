# there is no while loop in go

Challenge: 03-there-is-no-while-loop-in-go
Chapter: 07-loops

Most programming languages have a concept of a `while` loop. Because Go allows for the ommission of sections of a `for` loop, a `while` loop is just a `for` loop that only has a CONDITION.

```go
for CONDITION {
    // do some stuff while CONDITION is true
}
```

For example:

```go
plantheight := 1
for plantheight < 5 {
    fmt.Println("Still growing! current height:", plantheight)
    plantheight++
}
fmt.Println("plant has grown to ", plantheight, "inches")
```

Which prints:

```
still growing! current height: 1
still growing! current height: 2
still growing! current height: 3
still growing! current height: 4
plant has grown to 5 inches
```

Go also allows for you to ommit the condition entirely to create an infinite loop:

```go
for {
    // loop forever
}
```

## Assignment

We have an interesting new cost structure from our SMS vendor. They charge exponentially more money for each consecutive text we send! Let's write a function that calculates how many messages we can send in a given batch given a `costMultiplier` and a `maxCostInPennies`.


Assignment

We have an interesting new cost structure from our SMS vendor. They charge exponentially more money for each consecutive text we send! Let's write a function that calculates how many messages we can send in a given batch given a costMultiplier and a maxCostInPennies.

In a nutshell, the first message costs a penny, and each message after that costs the same as the previous message multiplied by the `costMultiplier`.

There is a bug in the code! Add a condition to the `for` loop to fix the bug. The loop should stop when balance is equal to or less than 0. So what condition should the `for` loop evaluate?

