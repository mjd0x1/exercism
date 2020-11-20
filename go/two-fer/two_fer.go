// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package twofer should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package twofer

//ShareWith ...Return modified name string
func ShareWith(name string) string {
	return "One for " + ChooseName(name) + ", one for me."
}

//ChooseName ...Choose string name
func ChooseName(name string) string {
	x := ""
	if name == "" {
		x = "you"
	} else {
		x = name
	}
	return x
}
