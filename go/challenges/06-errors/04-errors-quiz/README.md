# errors quiz

Challenge: 04-errors-quiz
Chapter: 06-errors

Go programs express errors with `error` values. Error-values are any type that impolements the simple built-in [error interface](https://blog.golang.org/error-handling-and-go).

Keep in mind that the way Go handles errors is fairly unique. Most languages treat errors as something special and different. For example, Python raises exception types and JavaScript throws and catches errors. In Go, an `error` is just another value that we handle like any other value - however we want! There aren't any special keywords for dealing with them.

## Question 1

What is the underlying type of an error?

## Answer 1

- [ ] Struct
- [ ] String
- [x] Interface

## Question 2

Can a type be an error and also fulfilll another inteface?

- [x] Yes
- [ ] No
