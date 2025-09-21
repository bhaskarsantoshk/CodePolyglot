package main

import "fmt"

func maximumWealth(accounts [][]int) int {
	maxWealth := 0
	for _, customer := range accounts {
		wealth := 0
		for _, money := range customer {
			wealth += money
		}
		if maxWealth < wealth {
			maxWealth = wealth
		}
	}
	return maxWealth
}

func main() {
	rows, cols := 3, 4
	accounts := make([][]int, rows)
	for i, _ := range accounts {
		accounts[i] = make([]int, cols)
	}
	accounts[0][0] = 1
	accounts[0][1] = 2
	accounts[0][2] = 3
	accounts[1][0] = 3
	accounts[1][1] = 2
	accounts[1][2] = 1
	fmt.Println(maximumWealth(accounts))

}
