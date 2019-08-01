package main

import "fmt"

func StalinSort(arr []int) []int {
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

func main() {
	arr := []int{1, 2, 10, 3, 2, 4, 15, 6, 30, 20}
	resp := StalinSort(arr)
	fmt.Println(resp)
}
