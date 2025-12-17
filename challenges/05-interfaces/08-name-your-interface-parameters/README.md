# name your interface parameters

Challenge: 08-name-your-interface-parameters
Chapter: 05-interfaces

Consider the following interface:

``` go
type Copier interface {
    Copy(string, string) int
}
```

This is a valid interface, but based on the code alone, can you deduce what *kinds* of strings you should pass into the `Copy` function?

We know the function signature expects 2 string types, but what are they? Filenames? URLs? Raw string data? for that matter, what the heck is that int that's being returned?

Let's add some named parameters and return data to make it more clear.

``` go
type Copier interface {
    Copy(sourceFile string, destinationFile string) (bytesCopied int)
}
```

Much better. We can see what the expectations are now. The first parameter is the `sourceFile`, the second parameter is the `destinationFile`, and `bytesCopied`, and integer, is returned.

## Question 1

Are you required to name the arguments of an interface in order for your code to compile properly?

## Answer 1

- [ ] yes
- [x] no

## Question 2

Why would name your interface's method's parameters?

## Answer 2

- [x] Readability and clarity
- [ ] Memory savings
- [ ] Execution speed
