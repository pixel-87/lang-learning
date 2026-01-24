package main

func bulkSend(numMessages int) float64 {
	fee := 0.0
	for i := 0; i < numMessages; i++ {
		fee += 1 + float64(i) * 0.01 
	}
	return fee
}
