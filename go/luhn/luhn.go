//Package luhn to check valid per luhn number ...
package luhn

import (
	"strconv"
	"strings"
)

//Valid checks valid per luhn number ...
func Valid(input string) bool {
	a := strings.Join(strings.Split(input, " "), "")

	if len(a) == 1 {
		return false
	}

	sum := 0
	for i := len(a) - 1; i >= 0; i-- {
		m, err := strconv.Atoi(string(a[i]))
		if err != nil {
			return false
		}
		if ((len(a) - i) % 2) == 0 {
			check := m*2 - 9
			if check > 0 {
				sum += check
			} else {
				sum += m * 2
			}
		} else {
			sum += m
		}
	}
	return sum%10 == 0
}
