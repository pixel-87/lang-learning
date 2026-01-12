# append

Challenge: 11-append
Chapter: 08-slices

The built-in append function is used to dynamically add elements to a slice:

```go
func append(slice []Type, elems ...Type) []Type
```

If the underlying array is not large enough, `append()` will create a new underlying array and point the return slice to it.

Notice that `append()` is variadic, the following are are all valid:

```go
slice = append(slice, oneThing)
slice = append(slice, oneThing, secondThing)
slice = append(slice, anotherSlice...)
```

## Assignment

We've been asked to add a feature that extracts costs for a given day.

Complete the `getDayCosts()` function using `append()` function. It accepts a slice of `cost` structs and a day `int`, and it returns a `float64` slice containing that day's costs. A day may have multiple costs.

If there are no costs for that day, return an empty, non-nil slice.
