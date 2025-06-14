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
	printTasks(moreTasks)

	moreTasks = addTask("go grpc", moreTasks) // capture the returned slice
	printTasks(moreTasks)
}

func printTasks(tasks []string) {
	for index, task := range tasks {
		fmt.Printf("%d - %s\n", index+1, task)
	}
}

func addTask(newTask string, tasks []string) []string {
	tasks = append(tasks, newTask)
	return tasks
}
