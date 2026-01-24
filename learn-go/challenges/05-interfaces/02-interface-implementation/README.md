# Interface Implementation

Challenge: 02-interface-implementation
Chapter: 05-interfaces

Interfaces are implemented *implicitly*. 

A type never declares that it implements a given interface. If an interface exists and a type has the proper methods defined, then the type automatically fulfills that interface. 

> [!tip]
> A quick way of checking whether a struct implements an interface is to declare a function that takes an interface as an argument. If the function can take the struct as an argument, then the struct implements the interface. 

## Assignment
At Textio we have full-time employees and contract employees. We have been tasked with making a more general `employee` interface so that dealing with different employee types is simpler.

1. - [] Run the code. You should see an error indicating the `contractor` type oes not fufill the `employee` interface.
2. - [] implement the missing `getSalary` method for the `contractor` type so that it fulfills the `employee` interface.
    - A contractor's salary is their hourly pay multiplied by how many hours they work per year.



