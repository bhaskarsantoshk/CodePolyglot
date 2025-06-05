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
## functions
* entire block of code as a variable

* parameters ( information can be passed into functions as local variables/ or sometimes addresses )
