
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

 int main() {
	int num;
	int *ptr;
	int **handle;

	num = 14;
	ptr = (int *)malloc(2 * sizeof(int));
	*ptr = num;
	handle = (int **)malloc(1 * sizeof(int *));
	*handle = ptr;

printf("%d\n",&num);
printf("%d\n",&ptr);
printf("%p\n",&ptr);
printf("%d\n",&ptr);
printf("%d\n",&handle);
printf("%p\n",&handle);

	return 0;
} 

