// Package stalin is efficient and dangerous.
// This is free software released into the public domain.
package stalin

// Sort orders list and returns the new length.
// Any remaining integers are set to zero.
func Sort(list []int) int {
	if len(list) < 2 {
		return len(list)
	}

	n := 1
	highest := list[0]
	for i := 1; i < len(list); i++ {
		next := list[i]
		if next > highest {
			highest = next
			list[n] = next
			n++
		}
	}

	// no trace
	for i := n; i < len(list); i++ {
		list[i] = 0
	}

	return n
}
