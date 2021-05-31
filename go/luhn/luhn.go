//Package luhn to check valid per luhn number ...
package luhn

import (
	"strconv"
	"strings"
)

//Valid checks valid per luhn number ...
func Valid(input string) bool {
	a := strings.ReplaceAll(input, " ", "")

	if len(a) == 1 {
		return false
	}

	sum := 0
	alternate := len(a)%2 == 0

	for _, v := range a {
		m, err := strconv.Atoi(string(v))
		if err != nil {
			return false
		}

		if alternate {
			m *= 2
			if m > 9 {
				m -= 9
			}
		}
		sum += m

		alternate = !alternate
	}
	return sum%10 == 0
}
