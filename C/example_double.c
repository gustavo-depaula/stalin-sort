// compilation: cc example_double.c stalin_sort.c

#include <stdio.h>
#include "stalin_sort.h"

int cmp_doubles(const void *arg1, const void *arg2)
{
	double a = (* (double *) arg1);
	double b = (* (double *) arg2);

	return (a == b) ? 0 : ((a > b) ? 1 : -1);
}

void print_double_arr(double *arr, size_t sz)
{
	for (int i = 0; i < sz; ++i)
		printf("%lg    ", *(arr++));
	printf("\n");
}

int main()
{
	double arr[] = {1.0, 2.5, 3.0, -1, 7, 2.5, 15};
	size_t arr_sz = sizeof(arr) / sizeof(double);

	printf("unsorted array:\n");
	print_double_arr(arr, arr_sz); // 1 2.5 3 -1 7 2.5 15

	stalin_sort(arr, &arr_sz, sizeof(double), cmp_doubles);

	printf("sorted array:\n");
	print_double_arr(arr, arr_sz); // 1 2.5 3 7 15

	return 0;
}