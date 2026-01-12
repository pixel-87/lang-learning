package main

import (
	"errors"
)

var emptyStringErr = errors.New("status cannot be empty")
var maxStringLenErr = errors.New("status exceeds 140 characters")

func validateStatus(status string) error {
	if status == "" {
	return emptyStringErr 
	}
	if len(status) > 140 {
		return maxStringLenErr
	}
	return nil
}

