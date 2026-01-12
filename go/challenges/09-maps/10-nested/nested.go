package main

func getNameCounts(names []string) map[rune]map[string]int {
	nameCount := map[rune]map[string]int{}

	for _, name := range names {
		runes := []rune(name)
		firstChar := runes[0]

		if _, ok := nameCount[firstChar]; !ok {
			nameCount[firstChar] = make(map[string]int)
		}
		nameCount[runes[0]][name]++
	}
	return nameCount
}
