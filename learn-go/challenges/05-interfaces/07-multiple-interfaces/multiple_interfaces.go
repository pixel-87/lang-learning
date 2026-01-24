package main

import (
	"fmt"
)

func (e email) cost() int {
	cost := 5
	if e.isSubscribed == true {
		cost = 2
	}
	return cost * len(e.body)
}


func (e email) format() string {
	subscribed := "Not Subscribed"
	if e.isSubscribed == true {
		subscribed = "Subscribed"
	}
	return fmt.Sprintf("'%v' | %v", e.body, subscribed)
}

type expense interface {
	cost() int
}

type formatter interface {
	format() string
}

type email struct {
	isSubscribed bool
	body string
}
