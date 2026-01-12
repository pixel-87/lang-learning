# count instances

Challenge: 05-count-instances
Chapter: 09-maps

Remember that you can check if a key is already present in a map bu using the second return value from the index operation.

You can combine an `if` statement with an assignment operation to use the variables inside the `if` block:

```go
names := map[string]int{}
missingNames := []string{}

if _, ok := names["Denna"]; !ok {
    // if the key doesn't exist yet,
    // append the name to the missingNames slice
    missingNames = append(missingNames, "Denna")
}
```

## assignment

Each time a user is sent a message, their username is logged in a slice. We want a more efficient way to count how many messages each user recieved.

Implement the `updateCounts` function. It takes as input:

- `messagedUsers`: a slice of strings.
- `validUsers`: a map of `string -> int`.

It should should update teh `validUsers` map with the number of times each user has recieved a message. Each `string` in the slice is a username, but they may not be valid. Only update the message count of valid users.

So, if "benji" is in the map and appears in the slice 3 times, they key "benji" in the map should have the value 3.
