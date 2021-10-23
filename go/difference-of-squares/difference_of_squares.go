package diffsquares

import "math"

func SumOfSquares(number int) int {

	return int(number * (number + 1) * (2*number + 1) / 6)

}

func SquareOfSum(number int) int {

	x := float64(number)
	return int(math.Pow(x*(x+1), 2) / 4)
}

func Difference(number int) int {
	return SquareOfSum(number) - SumOfSquares(number)
}

/*
func Sum(n int, f func(int) int) int {

	sum := 0
	for x := 1; x <= n; x++ {
		sum += f(x)
	}
	return sum

}

func SumOfSquares(number int) int {

	squares := func(x int) int { return int(math.Pow(float64(x), 2.0)) }
	return Sum(number, squares)

}

func SquareOfSum(number int) int {

	identity := func(x int) int { return x }
	return int(math.Pow(float64(Sum(number, identity)), 2.0))
}

func Difference(number int) int {
	return SquareOfSum(number) - SumOfSquares(number)
}
*/
