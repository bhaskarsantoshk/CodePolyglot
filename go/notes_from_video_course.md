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

```go
package main

import "fmt"

func main() {
	var card string = "Ace of Spades" // var - to create a new variable, card ( name of the variable ), string ( type ) , Ace of Spades ( value assigned)
	fmt.Println(card)
}
```

* Go is a statically typed language( Java, C++ , Go, etc. ), hence we need to declare the type
* Basic go types : bool, string, int, float64 etc.
* `var card string = "Ace of Spades"` can also be written like `card  := "Ace of Spades"` // Go compiler can figure out the type
* `:=` is used only for the first initialization

```go
card  := "Ace of Spades"
card  = "Five of Diamonds"
```

```go
package main
 
import "fmt"
 
deckSize := 20 // ./prog.go:5:1: syntax error: non-declaration statement outside function body
 
func main() {
  fmt.Println(deckSize)
}
```
* Valid
```go
package main

import "fmt"

func main() {
	var deckSize int
	deckSize = 52
	fmt.Println(deckSize)
}

```

* Valid
```go
package main

import "fmt"

var deckSize int

func main() {
	deckSize = 50
	fmt.Println(deckSize)
}
```

* Returbn type
```go
package main

import "fmt"

func main() {
	card := newCard()
	fmt.Println(card)
}

func newCard() string {
	return "Five of Diamonds"
}

```

## Arrays and Slices
* Arrays - Fixed length list of things
* Slice - an array that can grow or shrink
* Slices and Arrays must be defined with a data type, every record inside must be of the same type

```go
package main

import "fmt"

func main() {
	cards := []string{"Ace of Diamonds", newCard()}
	cards = append(cards, "Six of Spades")
	fmt.Println(cards)
}

func newCard() string {
	return "Five of Diamonds"
}
```

```
% go run main.go
[Ace of Diamonds Five of Diamonds Six of Spades]
```

```go
package main

import "fmt"

func main() {
	cards := []string{"Ace of Diamonds", newCard()}
	cards = append(cards, "Six of Spades")
	for i, card := range cards {
		fmt.Println(i, card)
	}
}

func newCard() string {
	return "Five of Diamonds"
}
```

```
% go run main.go
0 Ace of Diamonds
1 Five of Diamonds
2 Six of Spades
```

* `for index (index of the element in the array), card ( current card we're iterating over) := range cards(take the slice of cards and loop over it)` 
