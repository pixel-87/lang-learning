package main

func getMessageWithRetries(primary, secondary, tertiary string) ([3]string, [3]int) {
	var ints [3]int
	strings := [3]string{primary, secondary, tertiary}
	
	tot := 0
	for i := range 3 {
		tot += len(strings[i])
		ints[i] = tot
	}
	return strings, ints
}
