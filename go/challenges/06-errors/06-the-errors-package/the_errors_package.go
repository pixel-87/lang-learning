package main

import (
	"errors"
)

var divideByZeroErr = errors.New("no dividing by 0")

func divide(x, y float64) (float64, error) {
	if y == 0 {
		return 0, divideByZeroErr
	}
	return x / y, nil
}

