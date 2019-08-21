package stalinsort

import (
	"sort"
	"testing"
)

func TestSortInts(t *testing.T) {
	for _, c := range []struct {
		in, out []int
	}{
		{
			in:  []int{1, 2, 10, 3, 2, 4, 15, 6, 30, 20},
			out: []int{1, 2, 10, 15, 30},
		},
		{
			in:  []int{78, 33, 100, 61, 65, 72, 11, 66, 89, 3},
			out: []int{78, 100},
		},
		{
			in:  []int{2, 2, 3, 1, 10},
			out: []int{2, 2, 3, 10},
		},
		{
			in:  []int{1, 2, 10, 3, 2, 4, 15, 6, 30, 20},
			out: []int{1, 2, 10, 15, 30},
		},
		// this test specifically to ensure we do >=.
		{
			in:  []int{1, 2, 2, 3, 2, 5},
			out: []int{1, 2, 2, 3, 5},
		},
	} {
		c.in = c.in[:SortInts(c.in)]
		n := len(c.in)
		if nn := len(c.out); n != nn {
			t.Fatalf("expected %#v got %#v", c.out, c.in)
		}
		for i := 0; i < n; i++ {
			if c.in[i] != c.out[i] {
				t.Fatalf("expected %#v got %#v", c.out, c.in)
			}
		}
	}
}

func BenchmarkSortInts(b *testing.B) {
	sample := []int{1, 2, 10, 3, 2, 4, 15, 6, 30, 20}
	list := make([]int, len(sample))

	b.Run("stalin", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			copy(list, sample)
			SortInts(list)
		}
	})

	b.Run("quick", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			copy(list, sample)
			sort.Ints(list)
		}
	})

	b.Run("overhead", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			copy(list, sample)
		}
	})
}
