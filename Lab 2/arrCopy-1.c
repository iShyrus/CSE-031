#include<stdio.h>
#include<stdlib.h> //needed to be included for malloc
#include<string.h>

void printArr(int *a, int size, char *name){

if(name =="Original"){
    printf("Original array's contents:");
}
if(name =="Copied"){
    printf("Copied array's contents:");
}
    int i;

    for(i=0; i<size; i++){

        printf(" %d", *(a+i));

    }

    printf("\n");

}

int* arrCopy(int *a, int size){
    int *copy = (int *)malloc(sizeof(int)*size);

    int i;

    for(i=0; i<size; i++){

        copy[i] = *(a+i);

    }

    return copy;
}

int main(){
    int n;
    int *arr;
    int *arr_copy;
    int i;

    printf("Enter the size of array you wish to create: ");
    scanf("%d", &n);

    //Dynamically create an int array of n items
    arr = (int *)malloc(sizeof(int)*n);


    //Ask user to input content of array
    for(i=0; i<n; i++){

        printf("Enter array content #%d: ", i+1);

        scanf("%d", &arr[i]);

    }


	
/*************** YOU MUST NOT MAKE CHANGES BEYOND THIS LINE! ***********/
	
	//Print original array
    printArr(arr, n, "Original");

	//Copy array
    arr_copy = arrCopy(arr, n);

	//Print new array
    printArr(arr_copy, n, "Copied");

    printf("\n");

    return 0;
}