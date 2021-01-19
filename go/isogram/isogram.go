package isogram

import (
	"unicode"
)

//IsIsogram checks whether word is an isogram ...
func IsIsogram(input string) bool {

	chars := make(map[rune]int)
	for _, elem := range input {
		if val, ok := chars[unicode.ToLower(elem)]; ok {
			if val == 1 {
				return false
			}

		} else {
			if unicode.IsLetter(elem) {
				chars[unicode.ToLower(elem)] = 1
			}
		}
	}
	return true
}
