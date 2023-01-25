/*
 * lab1.c
 *
 *  Created on: Jan 27, 2021
 *      Author: 15103
 */
#include<stdio.h>

#include <stdio.h>
int main() {


    int repAmount,typoPlacement;





    printf("Enter the number of repetitions for the punishment phrase: ");
    scanf("%d",&repAmount);


    if (0<repAmount){
    	printf("Enter the repetition count when you wish to introduce a typo: ");
        scanf("%d",&typoPlacement);

        if(0<typoPlacement && typoPlacement <=repAmount){

            for(int i ; i<repAmount; i++){
            	if(i+1 != typoPlacement){
            		printf("C Programming language is the best! ");
            	}
            	else{
            		printf("C Programming lnguage is the bet! ");
            	}
            }


            
        }
        else{
        	printf("\nYou have entered an invalid value for the typo placement! ");
        }


    }
    else{
    	printf("\nYou have entered an invalid value for the number of repetitions! ");
    	}



return 0;
}
