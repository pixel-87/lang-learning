package main

func sum(nums ...int) int {
	tot := 0
	for _, v := range nums {
		tot += v
	}
	return tot
}
