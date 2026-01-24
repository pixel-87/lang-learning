package main

func createMatrix(rows, cols int) [][]int {
	matrix := make([][]int, rows)
	for i := range rows {
		matrix[i] = make([]int, cols)
		for j := range cols {
			matrix[i][j] = i * j
		}
	}
	return matrix
}
