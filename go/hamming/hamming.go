package hamming

import (
	"errors"
)

//Distance ...Calculate Hamming Distance
func Distance(a, b string) (int, error) {

	if len(a) != len(b) {
		return 0, errors.New("must be the same length")
	}

	sum := 0
	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			sum++
		}
	}
	return sum, nil
}
