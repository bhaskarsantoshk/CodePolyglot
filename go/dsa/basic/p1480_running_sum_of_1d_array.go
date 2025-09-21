package main

import "fmt"

func runningSum(nums []int) []int {
	result := make([]int, len(nums))
	sum := 0
	for i, num := range nums {
		sum += num
		result[i] = sum
	}
	return result
}

func main() {
	nums := []int{1, 2, 3, 4, 5}
	fmt.Println(runningSum(nums)) // Output: [1, 3, 6, 10, 15]
}
