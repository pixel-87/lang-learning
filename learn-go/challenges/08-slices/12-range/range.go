package main

import (
	"slices"
)

func indexOfFirstBadWord(msg []string, badWords []string) int {
	for i, v := range msg {
		if slices.Contains(badWords, v) {
			return i
		}
	}
	return -1
}

