package main

import "fmt"

func fizzBuzz(n int) []string {
	result := make([]string, n)
	for i := range n + 1 {
		if (i+1)%3 == 0 && (i+1)%5 == 0 {
			result[i] = "FizzBuzz"
		} else if (i+1)%3 == 0 {
			result[i] = "Fizz"
		} else if (i+1)%3 == 0 {
			result[i] = "Buzz"
		} else {
			result[i] = fmt.Sprintf("%d", i)
		}
	}
	return result
}
