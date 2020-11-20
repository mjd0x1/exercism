package hamming

import (
	"errors"
)

//Distance ...Calculate Hamming Distance
func Distance(a, b string) (int, error) {

	checkCell := func(a, b byte) int {
		value := 0
		if a != b {
			value = 1
		}
		return value
	}

	if len(a) != len(b) {
		return 0, errors.New("Must be the same length")
	}
	if (len(a) == len(b)) && a == "" {
		return 0, nil
	}

	sum := 0
	for i := 0; i < len(a); i++ {
		sum += checkCell(a[i], b[i])
	}
	return sum, nil
}
