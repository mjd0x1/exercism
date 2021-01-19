package scrabble

import "strings"

func buildMap(letters map[string]int, toAdd []string, value int) map[string]int {

	for _, x := range toAdd {
		letters[x] = value
	}
	return letters

}

//Score calculate value of scrabble word...
func Score(word string) int {

	allLetters := make(map[string]int)
	allLetters = buildMap(allLetters, []string{"A", "E", "I", "O", "U", "L", "N", "R", "S", "T"}, 1)
	allLetters = buildMap(allLetters, []string{"D", "G"}, 2)
	allLetters = buildMap(allLetters, []string{"B", "C", "M", "P"}, 3)
	allLetters = buildMap(allLetters, []string{"F", "H", "V", "W", "Y"}, 4)
	allLetters = buildMap(allLetters, []string{"K"}, 5)
	allLetters = buildMap(allLetters, []string{"J", "X"}, 8)
	allLetters = buildMap(allLetters, []string{"Q", "Z"}, 10)

	sum := 0
	for _, v := range word {
		sum += allLetters[strings.ToUpper(string(v))]
	}
	return sum
}
