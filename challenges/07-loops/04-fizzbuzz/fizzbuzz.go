package main

import "fmt"

func fizzbuzz() {
	for i := range 100 {
		n := i + 1
		switch {
		case n % 15 == 0:
			fmt.Println("fizzbuzz")
		case n % 5 == 0:
			fmt.Println("fizz")
		case n % 3 == 0:
			fmt.Println("buzz")
		default:
			fmt.Println(n)
		}
	}
}

// don't touch below this line

func main() {
	fizzbuzz()
}

