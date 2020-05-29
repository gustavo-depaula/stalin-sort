#ifndef _STALIN_SORT_H_
#define _STALIN_SORT_H_

#include <stddef.h> // for size_t

void stalin_sort( void *arr, size_t *count, size_t size,
           		  int (*cmp)(const void *, const void *) );

#endif // _STALIN_SORT_H_