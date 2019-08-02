#include <stdio.h>
#include <stdlib.h>

/*
 * sort array 'arr' of size 'size'.
 * result is in 'arr' itself.
 *
 * Dynamic memory does not make a O(n), 
 *   so this is real O(n)
 *
 * */
int stalinSort( int *arr, int size )
{
    int i;
    int j;

    for (i = 1, j = 0; i < size; ++i) {
        if( arr[i] >= arr[j] )	{
            ++j;
            arr[j] = arr[i];
        }
    }

    /* returns new size */
    return j + 1;
}

int main(int argc, char const *argv[]) {
    int i, newSize;
    int array[10] = {1, 2, 4, 3, 6, 8, 0, 9, 5, 7};
   
    newSize = stalinSort(array, 10);

    for (i = 0; i < newSize; ++i)
        (void) printf("%i ", array[i]);

    (void) printf("\n");

    return 0;
}
