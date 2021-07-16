package clock

import (
	"fmt"
)

type Clock struct {
	hours   int
	minutes int
}

func (c Clock) get_minutes() int {
	return c.hours*60 + c.minutes
}

func to_clock(minutes int) Clock {
	h := minutes / 60
	if h < 0 {
		h = 24 + h%24
	} else {
		h = h % 24
	}
	m := minutes % 60
	if m < 0 {
		h -= 1
		m += 60
	}

	return Clock{hours: h, minutes: m}
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d", c.hours) + ":" + fmt.Sprintf("%02d", c.minutes)
}

func (c Clock) Add(minutes int) Clock {
	clock_mins := c.get_minutes()
	if clock_mins < 60 {
		clock_mins += 24 * 60
	}
	return to_clock(clock_mins + minutes)

}

func (c Clock) Subtract(minutes int) Clock {
	return c.Add(minutes * -1)
}

func New(hours int, minutes int) Clock {

	c := Clock{0, 0}
	return c.Add(minutes + hours*60)
}
