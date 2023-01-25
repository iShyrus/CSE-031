#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Declarations of the two functions you will implement
// Feel free to declare any helper functions
void printPuzzle(char** arr, int n);
void searchPuzzle(char** arr, int n, char** list, int listSize);

// Main function, DO NOT MODIFY (except line 52 if your output is not as expected -- see the comment there)!!!	
int main(int argc, char **argv) {
    int bSize = 15;
	if (argc != 2) {
		fprintf(stderr, "Usage: %s <puzzle file name>\n", argv[0]);
		return 2;
	}
    int i, j;
    FILE *fptr;
    char **block = (char**)malloc(bSize * sizeof(char*));
	char **words = (char**)malloc(50 * sizeof(char*));

    // Open file for reading puzzle
    fptr = fopen(argv[1], "r");
    if (fptr == NULL) {
        printf("Cannot Open Puzzle File!\n");
        return 0;
    }

	// Read puzzle block into 2D arrays
    for(i = 0; i < bSize; i++) {
        *(block+i) = (char*)malloc(bSize * sizeof(char));

        fscanf(fptr, "%c %c %c %c %c %c %c %c %c %c %c %c %c %c %c\n", *(block+i), *(block+i)+1, *(block+i)+2, *(block+i)+3, *(block+i)+4, *(block+i)+5, *(block+i)+6, *(block+i)+7, *(block+i)+8, *(block+i)+9, *(block+i)+10, *(block+i)+11, *(block+i)+12, *(block+i)+13, *(block+i)+14 );
    }
	fclose(fptr);

	// Open file for reading word list
	fptr = fopen("states.txt", "r");
	if (fptr == NULL) {
        printf("Cannot Open Words File!\n");
        return 0;
    }
	
	// Save words into arrays
	for(i = 0; i < 50; i++) {
		*(words+i) = (char*)malloc(20 * sizeof(char));
		fgets(*(words+i), 20, fptr);		
	}
	
	// Remove newline characters from each word (except for the last word)
	for(i = 0; i < 49; i++) {
		*(*(words+i) + strlen(*(words+i))-1) = '\0'; // Change -2 to -1 if line 58 outputs words with the last character missing
	}
	
	// Print out word list
	printf("Printing list of words:\n");
	for(i = 0; i < 50; i++) {
		printf("%s\n", *(words + i));		
	}
	printf("\n");
	
	// Print out original puzzle grid
    printf("Printing puzzle before search:\n");
    printPuzzle(block, bSize);
	printf("\n");

	// Call searchPuzzle to find all words in the puzzle
	searchPuzzle(block, bSize, words, 50);
	printf("\n");
	
	// Print out final puzzle grid with found words in lower case
    printf("Printing puzzle after search:\n");
    printPuzzle(block, bSize);
	printf("\n");
	







    return 0;
}

void printPuzzle(char** arr, int n){

   for(int i = 0 ; i <15 ; i++){
	   for(int j = 0; j < 15; j++){
		printf("%c ",*(*(arr+i)+j));
	   }
	printf("\n");


   }
 }




void searchPuzzle(char** arr, int n, char** list, int listSize) {

//CHECKS FOR FIRST WORD
 for(int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
             for(int s = 0 ; s <listSize ; s++){
   				         int size  = strlen(*(list+s));                  
                if(((*(*(arr+i)+j)))== *(*(list+s)+0) || ((*(*(arr+i)+j)))-32== *(*(list+s)+0)){


///////////////////////////////////////////////////////////// HORIZONTAL
	 int p =1;
     int ctr = 0;
              while( ((*(*(arr+i)+j+p))) == *(*(list+s)+p) || ((*(*(arr+i)+j+p))) +32== *(*(list+s)+p)){
                            ctr++;
                            if(ctr==size-1){
                                printf("Word Found: ");
                              printf("%s\n",*(list+s));
                                
                                for(int k=0; k<size; k++){
                                    if(*(*(arr+i)+j+k)<96){
                                     (*(*(arr+i)+j+k))=(*(*(arr+i)+j+k)) +32;
                                    }
                                }
                            }

                            p++;
                        }

///////////////////////////////////////////////////////////// VERTICAL TOP TO BOTTOM
            
        if(i<=n-2){
        p =1;
        ctr = 0;
             while( ((*(*(arr+i+p)+j))) == *(*(list+s)+p) || ((*(*(arr+i+p)+j))) +32== *(*(list+s)+p) && p+i<n ){

                 ctr++;

                            if(ctr==size-1){
                            printf("Word Found: ");

                              printf("%s\n",*(list+s));
                                
                                for(int k=0; k<size; k++){
                                    if(*(*(arr+i+k)+j)<96){
                                     (*(*(arr+i+k)+j))=(*(*(arr+i+k)+j)) +32;
                                    }
                                }
                            }

                    if (i+p<n-1){   //makes it so that it does not go out of bounds
                            p++;
                    }
                    else {  
                        break;      
                    }



                        }
    
        }
    


///////////////////////////////////////////////// DIAGONAL TOP RIGHT TO BOTTOM LEFT


            
            
        if(i<=n-2){
      p =1;
      ctr = 0;
             while( ((*(*(arr+i+p)+j+p))) == *(*(list+s)+p) || ((*(*(arr+i+p)+j+p))) +32== *(*(list+s)+p) && p+i<n ){

                 ctr++;

                            if(ctr==size-1){
                            printf("Word Found: ");

                              printf("%s\n",*(list+s));
                                
                                for(int k=0; k<size; k++){
                                    if(*(*(arr+i+k)+j+k)<96){
                                     (*(*(arr+i+k)+j+k))=(*(*(arr+i+k)+j+k)) +32;
                                    }
                                }
                            }


                    if (i+p<n-1){
                            p++;
                    }
                    else {
                        break;
                    }



                        }
    
        }


///////////////////////////////////////////////// BOTTOM TO TOP




            
        if(i>=3){
      p =1;
      ctr = 0;
             while(((*(*(arr+i-p)+j))) == *(*(list+s)+p)||((*(*(arr+i-p)+j))) +32== *(*(list+s)+p) ){

                 ctr++;

                            if(ctr==size-1){
                             printf("Word Found: ");
                              printf("%s\n",*(list+s));
                                
                                for(int k=0; k<size; k++){
                                    if(*(*(arr+i-k)+j)<96){
                                     (*(*(arr+i-k)+j))=(*(*(arr+i-k)+j)) +32;
                                    }
                                }
                            }


                 if (i-p>0){
                            p++;
                    }
                    else {
                        break;
                    }



                        }
    
        }

//////////////////////////////////////////////////////////////// BOTTOM LEFT TO TOP RIGHT



            
        if(i>=3){
      p =1;
      ctr = 0;
             while( ((*(*(arr+i-p)+j+p))) == *(*(list+s)+p) || ((*(*(arr+i-p)+j+p))) +32== *(*(list+s)+p) ){

                 ctr++;

                            if(ctr==size-1){
                        printf("Word Found: ");
                              printf("%s\n",*(list+s));
                                
                                for(int k=0; k<size; k++){
                                    if(*(*(arr+i-k)+j+k)<96){
                                     (*(*(arr+i-k)+j+k))=(*(*(arr+i-k)+j+k)) +32;
                                    }
                                }
                            }


                   if (i-p>0){
                            p++;
                    }
                    else {
                        break;
                    }


                        }
    
        }


///////////////////////////////////////////////////////////////////////////////////






                }



   }
        }
 }



















}

