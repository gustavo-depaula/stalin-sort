package stalin_sort

import "core:testing"
import "core:slice"

@test
test :: proc(t: ^testing.T) {
   tests := [?][2][]int{
      {[]int{1, 2, 2, 5, 4, 6, 2, 7}, []int{1, 2, 2, 5, 6, 7}},
      {[]int{}, []int{}},
      {[]int{1}, []int{1}},
      {[]int{1, 2, 3}, []int{1, 2, 3}},
      {[]int{3, 2, 1}, []int{3}},
   }

   for test in tests {
      sorted := stalin_sort(test[0])
      defer delete(sorted)
      testing.expect(t, slice.equal(sorted[:], test[1]))
   }
}
