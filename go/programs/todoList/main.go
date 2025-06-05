package main

import "fmt"

func main() {
	var taskOne = "go course"
	fmt.Println(taskOne)

	taskTwo := "go advanced"
	fmt.Println(taskTwo)

	moreTasks := []string{"go APIs", "go routines", "go channels"}
	for _, task := range moreTasks {
		fmt.Println(task)
	}
}
