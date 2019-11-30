/*
 * Tyler Brennan
 * CPSC275 F 2019
 */

#include <stdio.h>
#include <ctype.h>    // Imported to use tolower()

#define STRLEN 50

extern char cipher(char c, int direction,  int shift);

void main(void){
  char string[STRLEN], loop;
  int direction, shift, i;
  loop = 'y';
  while(loop != 'n'){
    printf("Enter a string:\n");
    scanf("%s", string);
    printf("Encrypt (1) or Decrypt (2)\n");
    scanf("%d", &direction);
    printf("Shift:\n");
    scanf("%d", &shift);
    for(i = 0; i < STRLEN; i++)
      string[i] = cipher(string[i], direction, shift);
    printf("Do another (Y/N)\n");
    scanf("%c", &loop);
    loop = tolower(loop);
  }
}
