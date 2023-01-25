
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

struct Node {
    int iValue;
    float fValue;
    struct Node *next;
};

int main() {

    struct Node *head = (struct Node*) malloc(sizeof(struct Node));
    head->iValue = 5;
    head->fValue = 3.14;
	
printf("Head Address %d\n",&head);
printf("Head Value %d\n",head);
printf("\n");
printf("IValue Address %d\n",&head->iValue);
printf("FValue Address %d\n",&head->fValue);
printf("\n");

printf("\nNext Address %d\n",&head->next);	
	
	return 0;
}