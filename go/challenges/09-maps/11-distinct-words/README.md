# distinct words

Challenge: 11-distinct-words
Chapter: 09-maps

Complete the `countDistinctWords` function using a `map`. It should take a slice of strings and return the total count of distinct words across all the strings. Assume words are separated by spaces. Casing should not matter. (e.g., "Hello" and "hello" should be considered the same word).

For example:

```go
messages := []string{"Hello world", "hello there", "General Kenobi"}
count := countDistinctWords(messages)
```

`count` should be 5 as the distinct words are "hello", "world", "there", "general" and "Kenobi" irrespective of casing.

## Tips

- Go's [strings package](https://pkg.go.dev/strings) can be very helpful here. Specifically the [Fields method](https://pkg.go.dev/strings#Fields) and the [ToLower](https://pkg.go.dev/strings#ToLower) method.

- Since all that matters is counting distinct words, we don't care about the value of each key in the map. You can use `struct{}{}` as the value of your map key. This empty struct uses **no memory**. For example, both `map[string]bool` and `map[string]struct{}` can track unique words, but they use different amount of memory:

```go
distinctWordsBool := make(map[string]bool)
distinctWordsStruct := make(map[string]struct{})

distinctWordsBool["hello"] = true         // Uses 1 byte for the bool value
distinctWordsStruct["hello"] = struct{}{} // Uses 0 bytes for the empty struct
```
