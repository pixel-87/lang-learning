# effective go

Challenge: 05-effective-go
Chapter: 09-maps

Read the following paraphrased sections from [effective Go regarding maps](https://go.dev/doc/effective_go#maps):

## Like Slice, Maps Hold References

Like slices, maps hold references to an underlying data structure. If you pass a map to a function that changes the contents of the map, the changes will be visible in the caller.

## Map Literals

Maps can be constructed using the usual composite literal syntax with colon-separated key-value pairs, so it's easy to build them during initialisation.

```go
var timeZone = map[string]int{
    "UTC":  0*60*60,
    "EST": -5*60*60,
    "CST": -6*60*60,
    "MST": -7*60*60,
    "PST": -8*60*60,
}
```

## Missing Keys

An attempt to fetch a map value with a key that is not present in the map will return the zero value for the type of the entries in the map. For instance, if the map contains integers, looking up a non-existent key will return 0. A set can be implemented as a map with value type bool. Set the map entry to true to put the value in the set, and then test it by simple indexing.

```go
attended := map[string]bool{
    "Ann": true,
    "Joe": true,
    ...
}

if attended[person] { // will be false if person is not in the map
    fmt.Println(person, "was at the meeting")
}
```

Sometimes you need to distinguish a mssing entry from a zero value. Is there an entry for "UTC" or is that 0 because it's not in the map at all? You can discriminate with a form of multiple assignments.

```go
var seconds int
var ok bool
seconds, ok = timeZone[tz]
```

For obvious reaons, this is called the "comma ok" idiom. In this example, if tz is present, seconds will be set appropriately and ok will be true; if not, seconds will be set to zero and ok will be false. Here's a function that puts it together with a nice error report.

```go
func offset(tz string) int {
    if seconds, ok := timeZone[tz]; ok {
        return seconds
    }
    log.Println("unknown time zone:", tz)
    return 0
}
```

Now we can redo the first example of a set by using a more efficient map with empty structs, which don't take up any space in memory:

```go
attended := map[string]struct{}{
    "Ann": {},
    "Joe": {},
    ...
}

if _, ok := attended[person]; ok {
    fmt.Println(person, "was at the meeting")
}
```

## Deleting Map Entries

To delete a map entry, use the built-in `delete` function, whose arguments are the map and the key to be deleted. It's safe to do this even if the key is already absent from the map.

```go
delete(timeZone, "PDT")  // Now on Standard Time
```

## Question 1

Maps can have at most `___` value(s) associated with the same key.

## Answer 1

- [ ] Any number of
- [ ] 3
- [ ] 2
- [x] 1

## Question 2

Attempting to get a value from a map where the key doesn't exist...

## Answer 2

- [x] Returns the zero value
- [ ] Returns the closest value
- [ ] Panics

## Question 3

A function can mutate the values stored in a map and those changes `___` the original values.

## Answer 3

- [ ] Do not affect
- [x] affect

## Question 4

What does the second return value from a retrieve operation in a map indicate?

## Answer 4

- [ ] A boolean that indicates whether the value at the key is a zero value.
- [ ] A boolean that indicates whether the value at the key is a nil value.
- [x] A boolean that indicates whether the key exists.
