package stalinsort

import "fmt"

// SortInts will perform StalinSort on a and will return the size of the sorted
// slice.
// 	a := []int{1, 2, 3, 6, 4}
//	a = a[:SortInts(a)]
func SortInts(a []int) (n int) {
	if len(a) == 0 {
		return 0
	}
	b := a[:1]
	for i := 1; i < len(a); i++ {
		if a[i] >= b[len(b)-1] {
			fmt.Printf("%d is >= %d\n", a[i], b[len(b)-1])
			b = append(b, a[i])
		}
	}
	return len(b)
}
