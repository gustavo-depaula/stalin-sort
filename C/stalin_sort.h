#ifndef STALIN_SORT_H
#define STALIN_SORT_H

#include <stdlib.h>

inline size_t stalin_sort(int *restrict dest, const int *restrict src, size_t count)
{
    dest[0] = src[0];
    size_t new_count = 1;

    for (size_t i = 1; i < count; ++i)
    {
        if (src[i] >= dest[new_count - 1])
        {
            dest[new_count++] = src[i];
        }
    }

    return new_count;
}

#endif // STALIN_SORT_H
