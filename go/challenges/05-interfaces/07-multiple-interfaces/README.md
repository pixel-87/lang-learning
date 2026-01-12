# Multiple Interfaces

Challenge: 07-multiple-interfaces
Chapter: 05-interfaces

A type can implement any number of interfaces in Go. For example, the [empty interface](https://go.dev/tour/methods/14), `interface{}`, is always implemented by every type because it has no requirements.

## Assignment

Complete the required methods so that the `email` type implements both the `expense` and `formatter` interfaces.

Complete the `cost()` method:
1. - [ ] If the email is not "subscribed", then the cost is `5` cents for each character in the body.
2. - [ ] If it is, then the cost is `2` cents per character.
3. - [ ] Return the total cost of the entire email in cents.

Complete the `format()` method.
1. - [ ] It should return a string in this format:
`'CONTENT' | subscribed`

2. - [ ] If the email is not subscribed, change the second part to "Not Subscribed":
`'CONTENT' | Not Subscribed`

The single quotes are included in the string, and `CONTENT` is the email's body. For example:
`'Hello, World!' | Subscribed`

> [!TIP]
> You may want to import the `fmt` package and use `Sprintf`.
