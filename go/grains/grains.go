package grains

import (
	"errors"
	//"math"
)

func Square(input int) (uint64, error) {

	if input < 1 {
		return 0, errors.New("cannot have 0 or -ive exponentiation")
	}
	if input > 64 {
		return 0, errors.New("exponentiation cannot be more than 64")
	}
	if input == 1 {
		return 1, nil
	}
	return 2 << (input - 2), nil
	//return uint64(math.Pow(2.0, float64(input)-1.0)), nil

}

func Total() uint64 {
	return 18446744073709551615
}
