/*
Exercise: Maps
Implement WordCount. It should return a map of the counts of each “word” in the string s.
*/

package main

import (
	"golang.org/x/tour/wc"
	"strings"
)

func WordCount(s string) map[string]int {
    counts := make(map[string] int)
	words := strings.Fields(s)
	for _, word := range words{
	    counts[word]++
	}
	return counts
}

func main() {
	wc.Test(WordCount)
}
