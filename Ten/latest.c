#include <stdio.h>

int main(void)
{
  int ch = 0;
  int chCount = 0;
  int wordCount = 0;
  int lineCount = 0;
  int fewChar = 0;
  int fewWord = 0;
  int totalWrd = 0;
  int totalCh = 0;
  int totalLine = 0;
  int newLine = 0;
printf("%d.", newLine);

  while((ch = getchar()) != EOF)
    {
      if (ch == '\n')
        {
          lineCount++;
          totalLine += lineCount;
          newLine = newLine + 1;
          printf("%d\n", newLine);
          printf("%d, %d \n", wordCount, chCount);
                  }
      if(fewWord < wordCount)
        {
          fewWord += wordCount;
  }
      if(fewChar < chCount)
        {
          fewChar += chCount;
        }

      if( ch != ' ' || ch != '\n' || ch != '\t')
      {

        chCount++;
          totalCh += chCount;
        }

      if(ch == ' ')
        {
          wordCount++;
          totalWrd+=wordCount;
  }

    }
  printf("\n%d lines, %d words, %d characters\n", totalLine, totalWrd, totalCh)\
;
  printf("line %d has the fewest words with %d \n",  lineCount, fewWord);
  printf("line %d has the fewest characters with %d\n",  lineCount, fewChar);

  return 0;
}
