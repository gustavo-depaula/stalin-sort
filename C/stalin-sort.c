#include "stalin-sort.h"
#include <string.h> // for memcpy, memset

/* Sorts array by non-decreasing
 * Interface is similar to qsort
 *
 * arr - array begin
 * count - number of elements in array
 * size - sizeof of 1 element
 * cmp - pointer on comparison function
 * 
 * Size of sorted array is written to count
 * Freed space is filled by zeros
 */
void stalin_sort( void *arr, size_t *count, size_t size,
           		  int (*cmp)(const void *, const void *) )
{
	if (*count <= 1)
		return;

	void *last = arr; // last sorted element
	void *current = arr + size; // current considered element

	while (--*count)
	{
		if ( cmp(current, last) >= 0 && current > (last += size))
			memcpy(last, current, size);
		current += size;
	}

	last += size;
	memset(last, 0, current - last); // Writing zeros to freed space in array. It is convenient when sorting chars or c-strs

	*count = (last - arr) / size;
}