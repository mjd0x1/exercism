//Package to check Isogram ...
package isogram

import (
	"strings"
	"unicode"
)

//IsIsogram checks whether word is an isogram ...
func IsIsogram(input string) bool {

	for _, elem := range input {
		if unicode.IsLetter(elem) && strings.Count(strings.ToLower(input), string(unicode.ToLower(elem))) > 1 {
			return false
		}
	}

	return true
}
