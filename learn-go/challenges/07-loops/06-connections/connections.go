package main

func countConnections(groupSize int) int {
	total := 0
	for i := range groupSize {
		total += i
	}
	return total
}
