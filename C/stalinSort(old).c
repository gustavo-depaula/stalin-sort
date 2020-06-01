#include <stdio.h>

int stalinSort(int *arr, int size, int *sortedArr) {
    int newSize = 1;
    int i;

    sortedArr[0] = arr[0];
    for (i = 1; i < size; ++i) {
        if (arr[i] >= sortedArr[newSize-1]) {
            ++newSize;
            sortedArr[newSize-1] = arr[i];
        }
    }

    return newSize;
}

int main(void) {
    int i, newSize;
    int sortedArr[10];
    int array[10] = {1, 2, 4, 3, 6, 8, 0, 9, 5, 7};

    newSize = stalinSort(array, 10, sortedArr);

    for (i = 0; i < newSize; ++i)
        printf("%i ", sortedArr[i]);

    printf("\n");
    return 0;
}
