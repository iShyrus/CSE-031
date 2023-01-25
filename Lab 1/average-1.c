#include <stdio.h>

int main(){


    int positiveCount=0,positiveSum=0, positiveAverage, negativeCount=0,negativeSum=0, negativeAverage, integerCount=1;



    while (integerCount!=0)
    {
        printf("Please enter an integer: ");
        scanf("%d", &integerCount);

        if(integerCount>0){
            positiveCount+= 1;
            positiveSum+=integerCount;
        }

        else if(integerCount<0){
            negativeCount+=1;
            negativeSum+=integerCount;
        }
    }


printf("\n");

    
    if(positiveCount>0){
        positiveAverage=positiveSum/positiveCount;
        printf("Positive average: %d \n", positiveAverage );
    }
    if(negativeCount>0){
        negativeAverage=negativeSum/negativeCount;
        printf("Negative average: %d \n", negativeAverage);
    }
    return 0;
}