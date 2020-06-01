/* Example of sorting integers
 *
 * compilation: cc example-int.c stalin-sort.c
 * (or any other compiler)
 *
 * Also you can just copy stalin-sort() function from stalin-sort.c
 */

#include "stalin-sort.h"
#include <stdio.h>

/* Usual comparator for ints
 * Returns ​an integer value < 0 if arg1 < arg2,
 * value > 0 if arg1 > arg2,
 * value = 0 if arg1 == arg2
 */
int cmp_ints(const void *arg1, const void *arg2)
{
	return (* (int *) arg1) - (* (int *) arg2);
}

void print_int_arr(int *arr, size_t sz)
{
	for (size_t i = 0; i < sz; ++i)
		printf("%d    ", *(arr++));
	printf("\n");
}

int main()
{
	int arr[] = {1, 2, 3, -1, 7, 2, 15};
	size_t arr_sz = sizeof(arr) / sizeof(int);

	printf("unsorted array:\n");
	print_int_arr(arr, arr_sz); // 1 2 3 -1 7 2 15

	stalin_sort(arr, &arr_sz, sizeof(int), cmp_ints);

	printf("sorted array:\n");
	print_int_arr(arr, arr_sz); // 1 2 3 7 15

	return 0;
}