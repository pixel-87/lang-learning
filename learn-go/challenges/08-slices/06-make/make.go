package main

func getMessageCosts(messages []string) []float64 {
	messageCost := make([]float64, len(messages))

	for i, v := range messages {
		messageCost[i] = float64(len(v)) * 0.01
	}
	return messageCost
}

