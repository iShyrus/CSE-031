#include<stdio.h>

int main(){

int m=0,n=0,m1,n1,total;

n1=&n;
m1=&m;

total=m1+n1;

printf("%d", total);

}