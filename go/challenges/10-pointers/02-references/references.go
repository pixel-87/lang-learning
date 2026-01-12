package main

import (
	"strings"
)

func removeProfanity(message *string) {
	profanity := map[string]string{
		"fubb": "****",
		"shiz": "****",
		"witch": "*****",
	}

	for badword, replacement := range profanity {
		*message = strings.ReplaceAll(*message, badword, replacement)
	}
}
