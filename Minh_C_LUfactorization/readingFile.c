#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void main(){

    FILE *fptr,*readptr;
    char filename[15] = "infile.txt";
    float A[20][20]= {0};

    // printf("Enter the filename to be opened \n");
    // scanf("%s", filename);


    /*  open the file for reading */
    fptr = fopen(filename, "r");
    readptr = fopen(filename, "r");
    if (fptr == NULL)
    {
        printf("Cannot open file \n");
        exit(0);
    }

    int rows,cols;
    int i=0,j=0;
    char ch,delimeter;
    ch = fgetc(fptr);
    while (ch != EOF)
    {
        fscanf(readptr,"%f",&A[i][j++]);
        ch = fgetc(fptr);
        delimeter = fgetc(fptr);
        if(ch =='\n' || delimeter =='\n'){
          i++;
          cols = j-1;
          j=0;
        }

    }

    rows = i;
    printf("rows = %d, cols = %d\n",rows,cols );
    fclose(fptr);

    rows =10;
    cols=10;
    printf("Input matrix:\n");
    for(int i=0;i<rows;i++){
      for(int j=0; j<cols; j++){
        printf("%f  ",A[i][j]);
      }printf("\n");
    }

    // FILE *myFile;
    // myFile = fopen("somenumbers.txt", "r");
    //
    // //read file into array
    // int numberArray[16];
    // int i;
    //
    // for (i = 0; i < 16; i++)
    // {
    //     fscanf(myFile, "%d", &numberArray[i]);
    // }
    //
    // for (i = 0; i < 16; i++)
    // {
    //     printf("Number is: %d\n\n", numberArray[i]);
    // }
    // return 0;

}
