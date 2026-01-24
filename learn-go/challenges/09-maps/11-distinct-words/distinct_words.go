package main

import (
	"strings"
)

func countDistinctWords(messages []string) int {
	words := map[string]struct{}{}
	for _, v := range messages {
		for word := range strings.FieldsSeq(strings.ToLower(v)){
			if _, ok := words[word]; !ok {
				words[word] = struct{}{}
			}
		}
	}
	return len(words)
}

