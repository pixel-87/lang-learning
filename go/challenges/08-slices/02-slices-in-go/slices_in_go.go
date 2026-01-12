package main

import (
	"errors"
)

const (
	planFree = "free"
	planPro  = "pro"
)

func getMessageWithRetriesForPlan(plan string, messages [3]string) ([]string, error) {
	switch plan {
	case "pro":
		return messages[:], nil
	case "free":
		return messages[:2], nil
	default:
		return nil, errors.New("unsupported plan")
	}
}

