// compilation: cc example-stalin.c stalin-sort.c

#include "stalin-sort.h"
#include <string.h>
#include <stdio.h>

// Compares char by ASCII - code
int cmp_chars(const void *arg1, const void *arg2)
{
	return (* (char *) arg1) - (* (char *) arg2);
}

int main()
{
	char text[] = "!!! REASSUMPTION !!!";
	size_t text_sz = sizeof(text);

	printf("entered:   %s\n", text); // '!!! REASSUMPTION !!!'

	stalin_sort(text, &text_sz, sizeof(char), cmp_chars);
	
	printf("sorted:    %s\n", text); // '!!!RSSU'

	printf("reversed:  "); // 'USSR!!!'
	while (text_sz--) // printing sorted array from back to front
		putchar(text[text_sz]);
	putchar('\n');
}