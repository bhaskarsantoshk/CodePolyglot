package main

func canConstruct(ransomnote string, magazine string) bool {
	freq := make([]int, 26)
	for _, c := range magazine {
		freq[c-'a']++
	}

	for _, c := range magazine {
		freq[c-'a']--
		if freq[c-'a'] < 0 {
			return false
		}
	}

	return true
}
