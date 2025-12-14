# Anonymous Stucts in Go

Challenge: 03-anonymous-stucts-in-go
Chapter: 04-structs

Anonymous Structs in Go

An anonymous struct is just like a normal struct, but it is defined without a name and therefore cannot be referenced elsewhere in the code.

To create an anonymous struct, just instantiate the instance immediately using a second pair of brackets after declaring the type:

``` go
myCar := struct {
  brand string
  model string
} {
  brand: "Toyota",
  model: "Camry",
}
```

You can even nest anonymous structs as fields within other structs:

``` go
type car struct {
  brand string
  model string
  doors int
  mileage int
  // wheel is a field containing an anonymous struct
  wheel struct {
    radius int
    material string
  }
}

var myCar = car{
  brand:   "Rezvani",
  model:   "Vengeance",
  doors:   4,
  mileage: 35000,
  wheel: struct {
    radius   int
    material string
  }{
    radius:   35,
    material: "alloy",
  },
}
```

When Should You Use an Anonymous Struct?

In general, prefer named structs. Named structs make it easier to read and understand your code, and they have the nice side-effect of being reusable. I sometimes use anonymous structs when I know I won't ever need to use a struct again. For example, sometimes I'll use one to create the shape of some JSON data in HTTP handlers.

If a struct is only meant to be used once, then it makes sense to declare it in such a way that developers down the road won't be tempted to accidentally use it again.

You can read more about anonymous structs here if you're curious.
When Should You Use an Anonymous Struct?

In general, prefer named structs. Named structs make it easier to read and understand your code, and they have the nice side-effect of being reusable. I sometimes use anonymous structs when I know I won't ever need to use a struct again. For example, sometimes I'll use one to create the shape of some JSON data in HTTP handlers.

If a struct is only meant to be used once, then it makes sense to declare it in such a way that developers down the road won't be tempted to accidentally use it again.

You can read more about anonymous structs here if you're curious.

## Question 1

What is a good reason to use an anonymous struct?

## Answer 1

- [] You're worried about user privacy.
- [] You're worried about security.
- [] You need your code to be faster.
- [x] Is is only being used once.

## Question 2

What's one advantage of using an anonymous struct?

## Answer 2

- [x] Anonymous structs prevent you from re-using a struct definition you never inteded to re-use.
- [] Anonymous structs make your code run faster.
- [] Anonymous structs can be compiled more quickly.

