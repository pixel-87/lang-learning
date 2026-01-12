package main

type cost struct {
	day   int
	value float64
}

func getDayCosts(costs []cost, day int) []float64 {
	dayCosts := []float64{}
	for _, v := range costs {
		if v.day == day {
			dayCosts = append(dayCosts, v.value)
		}
	}
	return dayCosts
}
