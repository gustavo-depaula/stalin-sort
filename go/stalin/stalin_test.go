package stalin

import (
	"reflect"
	"sort"
	"testing"
)

func TestSort(t *testing.T) {
	golden := []struct {
		Got, Want []int
	}{
		{
			[]int{1, 2, 10, 3, 2, 4, 15, 6, 30, 20},
			[]int{1, 2, 10, 15, 30},
		},
	}

	for _, gold := range golden {
		list := make([]int, len(gold.Got))
		copy(list, gold.Got)
		n := Sort(list)

		got := list[:n]
		if !reflect.DeepEqual(got, gold.Want) {
			t.Errorf("%v: got %v, want %v", gold.Got, got, gold.Want)
		}

		remaining := list[n:]
		if !reflect.DeepEqual(remaining, make([]int, len(remaining))) {
			t.Errorf("%v: remaining not zero: %v", gold.Got, remaining)
		}
	}
}

func BenchmarkSort(b *testing.B) {
	sample := []int{1, 2, 10, 3, 2, 4, 15, 6, 30, 20}
	list := make([]int, len(sample))

	b.Run("stalin", func(b *testing.B) {
		for i := 0; i < b.N; i++ {
			copy(list, sample)
			Sort(list)
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
