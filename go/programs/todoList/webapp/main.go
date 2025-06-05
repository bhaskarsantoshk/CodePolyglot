package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", helloUser)
	http.ListenAndServe(":8080", nil)
}

func helloUser(writer http.ResponseWriter, request *http.Request) {
	greeting := "Hello World"
	fmt.Fprintln(writer, greeting)
}
