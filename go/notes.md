# Go

- Open-source programming language designed by Robert Griesemer, Rob Pike, and Ken Thompson.
- Statically typed ( means variable types are explicitly declared ) but also has some dynamically typed language features
- Compiled language ( source code gets translated into machine code before execution )
- Support for Cross Compilation
- Functional programming language
- Built with Concurrency in mind
- Not a truly object-oriented but has the concept of *interfaces*
- No classes
- No immutable variables
- No implicit conversions
- No Exceptions
- Not suited for realtime software ( due to garbage collection and automatic memory management )
- Has a minimalistic approach

# Need for Go

- efficient and fast compilation, fast execution, and ease of programming.
- Network communication, concurrency, and parallelization support
- Fast building speed
- Efficient memory management

# Typical Go

- Filenames consist of small letters with .go extension, can have underscores (_)
- 25 reserved key words ( example: chan, const, defer, fallthrough, go, select , etc. )
- 36 pre-declared identifiers ( example: bool, copy, real, close, cap, int, real, recover, etc. )
- Go is case-sensitive
- _ is a blank identifier
- functions can be anonymous ( no name functions )
- No need to end every line with `;` , however if we write two statements in one line, we need to use `;`
- Every go file belongs to only one package , a package can comprise of many go files. File name and package name are generally not the same
- first line has to be the package name the go file belongs to
- A standalone executable belongs to `main` package. Even if you use one package, you can divide go functionality with smaller files that all belong to package `main`
- By convention, each directory contains one package, the package is compiled as one unit.
- To build a program, the packages , files within will be compiled in the correct order. package dependencies determine the order
- To import a package and it’s functionality into go file - use `import pkg_name` - This will load the public declarations from the compiled package
- Identifiers of code-object in a package have to be unique. Same identifiers can be used in different packages. ( pkg1.Object and pkg2.Object )
- If an identifier starts with upper case letter, it is said to be exported and will be available outside the package
- package can also be given an alias
- func functionName()
- `main` function as a starting point is required. must have no arguments
- `func Multiply(x, y int) int { return x * y }`
- No underscores in method names , names of things in Go must be concise , no Get is needed , you can name methods that return objects as Noun.
- Types can be elementary ( `int`, `float` ), composite ( `struct`, `array`, `map`, `slice`, `channel` ), and interfaces
- `var x int`
- `type IZ int`
- `var a IZ = 0`
- Type casting : `var a float32 = 3.14; fmt.Println(int(a))`
- `const PI = 3.14159`
- `const name string = "bruce wayne"`
- Go does not have traditional enumerations, but `iota` can be used to create enumerated constants. `iota` is a pre-declared identifier representing the untyped integer ordinal number of the current item in a `const` declaration.
- `var identifier type`
- `var identifier type = value`
- `var num int = 5` , `var num = 5` and `num := 5` are all same

## Go commands

* `go build` - Compiles the packages.
* `go run` - Compiles and runs Go programs.
* `go fmt` - Formats Go source code.
* `go install` - Compiles and installs packages and dependencies.
* `go get` - Downloads and installs packages and dependencies.
* `go test` - Runs tests for the specified packages.
