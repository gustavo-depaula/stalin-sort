package stalin_sort

stalin_sort :: proc(arr: []int) -> [dynamic]int {
   ordered := [dynamic]int{}
   if len(arr) == 0 {
      return ordered
   }
   append(&ordered, arr[0])
   for v in arr[1:] {
      if v >= ordered[len(ordered) - 1] {
         append(&ordered, v)
      }
   }
   return ordered
}
