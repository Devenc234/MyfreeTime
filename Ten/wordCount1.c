#include <stdio.h>

int main(void)
{
  int ch = 0;
  char prevCh='\n';
  int charCount = 0;
  int wordCount = 0;
  int minChar = 2147483647,minCharLine=0;
  int minWord = 2147483647,minWordLine=0;
  int totalWord = 0;
  int totalChar = 0;
  int lines = 1;
printf("%d. ", lines);

  while((ch = getchar()) != EOF){

      if( ch != ' '|| ch != '\t' || ch != '\n'){
        charCount++;
      }
      if((ch == ' '||ch == '\t' || ch == '\n') && (prevCh!=' ' && prevCh != '\t'&& prevCh!='\n' )){
          wordCount++;
      }
      if (ch == '\n'){
        if(wordCount <= minWord){
            minWord = wordCount;
            minCharLine = lines;
        }
        if(charCount <= minChar ){
            minChar = charCount;
            minWordLine = lines;
        }
        lines +=1;
        charCount--;
        totalWord += wordCount;
        totalChar += charCount;
        printf(" [%d, %d] \n", wordCount, charCount);
        printf("%d. ", lines);
        wordCount=0;
        charCount=0;
        prevCh = ch;
        continue;
      }

      prevCh = ch;
      printf("%c",ch);
  }

  printf("\n%d lines, %d words, %d characters\n", lines, totalWord, totalChar);
  printf("line %d has the fewest characters with %d \n",  minCharLine, minChar);
  printf("line %d has the fewest words with %d\n",  minWordLine, minWord);
  return 0;
}
