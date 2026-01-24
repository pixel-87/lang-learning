# omitting conditionals from a for loop in go

Challenge: 02-omitting-conditionals-from-a-for-loop-in-go
Chapter: 07-loops

Loops in Go can omit sections of a for loop. For example, the `condition` (middle part) can be omited which causes the loop to run forever.

```go
for INITIAL; ; AFTER {
    // do something forever
}
```

## Assignment

Complete the `maxMessages` function. Given a cost threshold, it should calculate the maximum number of messages that can be sent.

Ech message costs `100` pennies, plus an additional fee. The structure is:

- 1st message: `100 + 0`
- 2nd message: `100 + 1`
- 3rd message: `100 + 2`
- 4th message: `100 + 3`
