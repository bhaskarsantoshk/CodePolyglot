# Go

```go
package main //

import "fmt"

func main() {
	fmt.Print("Hello World!")
}
```

## packges
* package == project == workspace
* files that belong to same package should have the name of the package in their first line . Eg. `package main`
* two types - executable ( main program, runnable program - package name will be main ) , reusable ( helpers/ lib )
* `package main` - executable package, must have a func called `main`, when you use `go build`, you get an executable

## import statemnet
* when you use `import "fmt"`, it means we are giving the current main package access to all the code in "fmt" package ( standard library of go, more can be found in golang.org/pkg )

## func
* to declare function ( to tell go to do things )
