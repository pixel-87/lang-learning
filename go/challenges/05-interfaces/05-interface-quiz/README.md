# Interface quiz

Challenge: 05-interface-quiz
Chapter: 05-interfaces

Remember, interfaces are collections of method signatures. A type "implements" an interface if it has all of the methods of the given signature defined on it.

``` go
type shape interface {
    area() float64
}
```

If a type in your code implements an `area` method, with the same signature (e.g. accepts nothing and returns a `float64`), then that object is said to *implement* the `shape` interface.

``` go
type circle struct {
    radius float64
}

func (c circle) area() float64 {
    return 3.14 * c.radius * c.radius
}
```

This is different from *most other languages*, where you have to *explicitly* assign an interface to an object, like with Java:
``` Java
class Circle implements shape
```

## Question 1

Go uses the `____` keyword to show that a type implements an interface.

## Answer 1

- [x] There is no keyword in Go
- [ ] inherits
- [ ] implements
- [ ] fulfills

## Question 2

In the example given, the `____` type implements the `____` interface.

## Answer 2

- [ ] shape, circle
- [ ] shape, area
- [x] circle, shape
- [ ] circle, area

