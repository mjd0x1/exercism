package raindrops

import (
	"strconv"
)

type raindrop struct {
	k string
	v int
}

//Convert ...Convert numbers to Pling Plang Plong
func Convert(input int) string {

	values := []raindrop{raindrop{k: "Pling", v: 3},
		raindrop{k: "Plang", v: 5},
		raindrop{k: "Plong", v: 7}}

	output := ""
	for _, drop := range values {
		if input%drop.v == 0 {
			output += drop.k
		}
	}

	if output != "" {
		return output
	}
	return strconv.Itoa(input)

}
