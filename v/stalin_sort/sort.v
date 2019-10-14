module stalin_sort

pub fn sort(input_arr []int) []int {
	if input_arr.len == 0 { return input_arr }
	mut sorted_arr := [input_arr[0]]

	for i := 1; i < input_arr.len; i++ {
		if input_arr[i] >= sorted_arr.last() { sorted_arr << input_arr[i] }
	}
	return sorted_arr
}
