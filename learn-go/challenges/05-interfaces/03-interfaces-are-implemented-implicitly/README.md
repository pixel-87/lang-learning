# Interfaces are Implemented Implicitly

Challenge: 03-interfaces-are-implemented-implicitly
Chapter: 05-interfaces

A type implements an interface by implementing its methods. Unlike in many other languages, there is no explicit declaration of intent, there is no "implements" keyword.

Implicit interfaces *decouple* the definition of an interface from its implementation. You may add methods to a type and in the process be unknowingly implementing various interfaces, and that's *okay*.

## Question 1

How is an interface fulfilled?

## Answer 1

- [x] A type has all the required interface's methods defined on it.
- [ ] A struct embeds the interface in its definition.

## Question 2

Can a type fulfill multiple interfaces?

## Answer 2

- [x] Yes, why not?
- [ ] Never
