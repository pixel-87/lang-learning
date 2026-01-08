# mutations

Challenge: 02-mutations
Chapter: 09-maps

### Insert an Element

```go
m[key] = elem
```

### Get an Element

```go
delete(m, key)
```

### Check if a Key Exists

```go
elem, ok := m[key]
```

- If `key` is in `m`, then `ok` is `true` and `elem` is the value as expected.
- If `key` is not in the map then `ok` is `false` and `elem` is the zero value for the map's element type.

## Assignment

It's important to keep up with privacy regulations and to respect our user's data. We need a function that will delete user records.

Complete the `deleteIfNecessary` function. The `user` struct has a `scheduledForDeletion` field that determines if they are scheduled for deletion or not. 

1. - [ ] If the user doesn't exist in the map, return the error `not found`.
2. - [ ] If they exist but aren't scheduled for deletion, return `deleted` as `false` with no errors.
3. - [ ] If they exist and are scheduled for deletion, return `deleted` as `true` with no errors and delete their record from the map.

> [!TIP]
> Like slices, maps are also passed by reference into functions. This means that when a map is passed into a function we write, we can *make changes to the original* - we don't have a copy.
