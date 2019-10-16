module main

import stalin_sort

fn main(){
	assert stalin_sort.sort( [1, 2, 3, 4, 5] ).str() == '[1, 2, 3, 4, 5]'
	assert stalin_sort.sort( [1, 4, 2, 3, 7] ).str() == '[1, 4, 7]'
	assert stalin_sort.sort( [1, 2, 2, 5, 4] ).str() == '[1, 2, 2, 5]'
	assert stalin_sort.sort( [5, 1, 2, 3, 4] ).str() == '[5]'
	assert stalin_sort.sort( [1, 5, 2, 3, 4] ).str() == '[1, 5]'
	assert stalin_sort.sort( [1, 1, 1, 1, 1] ).str() == '[1, 1, 1, 1, 1]'
}
