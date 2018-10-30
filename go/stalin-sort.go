package main

import "fmt"

func StalinSort(arr []int) []int {
	sorted := []int{1}
	for i := 1; i < len(arr); i++ {
		if arr[i] > sorted[len(sorted)-1] {
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
