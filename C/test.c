#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

#include "stalin_sort.h"

// To specify in which translation unit the implementation will live
// since it is marked as inline
size_t stalin_sort(int *restrict, const int *restrict, size_t);

#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))

void test_stalin_sort()
{
    static const int provided[] = { 1, 2, 4, 3, 6, 8, 0, 9, 5, 7 };
    static const int expected[] = { 1, 2, 4, 6, 8, 9 };

    int sorted[ARRAY_SIZE(provided)];
    const size_t new_count = stalin_sort(sorted, provided, ARRAY_SIZE(provided));

    printf("exp\tact\n- size\n%lu\t%lu\n", new_count, ARRAY_SIZE(expected));
    assert(ARRAY_SIZE(expected) == new_count);

    puts("- values");
    for (size_t i = 0; i < new_count; ++i)
    {
        printf("%d\t%d\n", expected[i], sorted[i]);
        assert(expected[i] == sorted[i]);
    }

    puts("Stalin sort test passed");
}

int main()
{
    test_stalin_sort();

    return EXIT_SUCCESS;
}
