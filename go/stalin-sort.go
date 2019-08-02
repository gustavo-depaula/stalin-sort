package stalinSort

func SortInts(arr []int) []int {
	sorted := make([]int, 0)

	for i := 0; i < len(arr); i++ {
		if i == 0 {
			sorted = append(sorted, arr[i])
		} else if arr[i] > sorted[len(sorted)-1] {
			sorted = append(sorted, arr[i])
		}
	}

	return sorted
}
