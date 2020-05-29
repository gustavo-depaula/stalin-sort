#include "stalin_sort.h"
#include <string.h> // for memcpy, memset

/* Сортирует массив в порядке неубывания
 *
 * arr - начало массива
 * count - число элементов
 * size - размер одного элемента
 * cmp - указатель на функцию сравнения
 * 
 * Размер отсортированного массива записывается в count
 * Освободившиеся места заполняются нулями
 */
void stalin_sort( void *arr, size_t *count, size_t size,
           		  int (*cmp)(const void *, const void *) )
{
	if (*count <= 1)
		return;

	void *last = arr; // последний отсортированный элемент
	void *current = arr + size; // текущий рассматриваемый элемент 

	while (--*count)
	{
		if ( cmp(current, last) >= 0 && current > (last += size))
			memcpy(last, current, size);
		current += size;
	}

	last += size;
	memset(last, 0, current - last); // Заполняем остаток массива нулями. Это удобно при сортировке символов и строк

	*count = (last - arr) / size;
}