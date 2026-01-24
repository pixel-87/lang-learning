package main

func maxMessages(thresh int) int {
	totalCost := 0
	messagesSent := 0
	for i := 0; ; i++ {
		fee := 100 + i

		if totalCost + fee > thresh {
			break
		} 

		totalCost += fee
		messagesSent++

	}
	return messagesSent
}
