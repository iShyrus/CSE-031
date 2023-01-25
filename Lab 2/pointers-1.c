#include <stdio.h>
int main() {
int x=0, y=0, *px, *py;
int arr[10];

for(int i=0; i<10;i++){
    arr[i]=0;
}


printf("%d\n", x);
printf("%d\n", y);
printf("%d\n", arr[0]);


px=&x;
py=&y;
printf("%p\n", px);
printf("%p\n", py);

printf("\n");

//addresses
printf("%p\n", &x);
printf("%p\n", &y);


//#6
for(int i=0;i<10;i++){
    printf("%d ",*(&arr[0]+1));
}
printf("\n");
//#7
if (&arr[0]==arr){
    printf("#7\n");
}

printf(" %p",&arr);

return 0;
}
