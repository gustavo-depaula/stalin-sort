#include <stdio.h>
#include <stdlib.h>

#define max(a, b) ((a)>(b)?(a):(b))

int* stalin_sort(int* arr, int size, int* newsz) {
	int newSize = 0, maxv = arr[0];

	// compute new size
	for (int i=0; i < size; ++i) {
		newSize += (arr[i] >= maxv);
		maxv = max(arr[i], maxv);
	}

	// fill new array
	int _ar[newSize], k=1;
	_ar[0] = arr[0];
	for (int i=1; i < size; ++i)
		if (arr[i] >= _ar[k-1]) _ar[k++] = arr[i];

	// move sorted items to end of original array
	int j = size - newSize;
	for (int i=0; i < newSize; ++i, ++j)
		arr[j] = _ar[i];

	*newsz = newSize;
	return arr + (size - newSize);
}

int main(int argc, char const *argv[]) {
    int i, newSize = 1;
    int *sortedArr;
    int array[10] = {1, 2, 4, 3, 6, 8, 0, 9, 5, 7};
    
    sortedArr = stalin_sort(array, 10, &newSize);

    for (i = 0; i < newSize; ++i)
        (void) printf("%i ", sortedArr[i]);

    (void) printf("\n");

    return 0;
}
