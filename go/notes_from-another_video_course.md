# Go
* developed in 2007 and open sourced in 2009

## Motivation behind creating Go
* Infrastructure evolved significantly – multi-core processors, cloud environments, and large-scale computation clusters became common.
* Needed to support scalable, distributed systems with dynamic workloads.
* Existing languages couldn’t fully exploit concurrency – often handling only one task at a time.
* Challenges in multithreading include:
  - multiple users editing the same document
  - multiple users booking at the same time
  - effective concurrency handling
* While languages like Java and C++ support concurrency on multi-core systems, their code tends to be complex.
* Go was designed for multi-core concurrency with simplicity in mind.
* Concurrency in Go is lightweight, efficient, and easy to use.

## Main use case of Go

* For high-performance applications
* Running on large-scale, distributed systems

## Key Characteristics

- **Simple, readable syntax** like dynamically typed languages (e.g., Python)
- **Efficiency and safety** of statically typed, lower-level languages (e.g., C++)
- Designed for **server-side use**: microservices, web apps, and database services
- Powers modern infrastructure tools like **Docker**, **Kubernetes**, etc.
- **Minimalist syntax**, easy to learn and write
- **Resource efficient** and performant
- **Fast build, startup, and runtime**
- **Compiles quickly into a single static binary**

## Setup
* GOROOT - where the Go sdk is installed
* GPATH - workspace for Go projects and packages

## Arrays vs Slices
* fixed size and variable size
* array: moreTasks := [10]string{"go APIs", "go routines", "go channels"}
* slice : moreTasks := []string{"go APIs", "go routines", "go channels"}

Example:
```go
package main

import "fmt"

func main() {
    // Array: fixed size
    var arr = [3]string{"go APIs", "go routines", "go channels"}
    fmt.Println("Array:", arr)

    // Slice: dynamic size
    slice := []string{"go APIs", "go routines"}
    fmt.Println("Initial Slice:", slice)

    // Append an element to the slice
    slice = append(slice, "go channels")
    fmt.Println("Updated Slice:", slice)
}
```
## Functions

* Functions in Go are first-class citizens – you can assign them to variables, pass them as arguments, and return them from other functions.
* They are defined using the `func` keyword.
* Parameters can be passed by value (copy) or by reference (using pointers).
* Syntax:
  ```go
  func functionName(param1 type1, param2 type2) returnType {
      // function body
  }
  ```

* Example of assigning a function to a variable:
  ```go
  package main

  import "fmt"

  func greet(name string) string {
      return "Hello, " + name
  }

  func main() {
      // Assigning function to a variable
      var sayHello func(string) string = greet
      fmt.Println(sayHello("Go"))
  }
  ```
## Web in Go

Go provides powerful support for web development through its standard `net/http` package, without needing external frameworks.

### Key Features

- Lightweight and efficient HTTP server  
- Built-in concurrency (each request is handled in a separate goroutine)  
- Ideal for REST APIs, static content, and microservices

### Core Components

- `http.HandleFunc(pattern, handler)`  
  Maps a URL path to a handler function.

- `http.ListenAndServe(addr, handler)`  
  Starts the HTTP server on the specified address.

### Handler Function Signature

```go
func(w http.ResponseWriter, r *http.Request)
```

- `http.ResponseWriter` is used to send responses.  
- `*http.Request` contains request details like method, headers, URL, etc.

### Minimal Example

```go
package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", helloUser)

    fmt.Println("Server running at http://localhost:8080")
    http.ListenAndServe(":8080", nil)
}

func helloUser(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello, Web in Go!")
}
```

### Notes

- The `nil` in `ListenAndServe` uses the default ServeMux (router).
- You can register multiple handlers for different paths like `/login`, `/home`, etc.
- For larger apps, use custom routers or frameworks like `gorilla/mux` (optional).

