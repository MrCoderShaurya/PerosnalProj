#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <unistd.h>

int main(){

   char o[50] = "Start";
  if (strcmp (o,"Y")==0){
    
    printf("Start?");
    scanf("%49s",o);
     printf("...\n");
    sleep(1);
      printf("....\n");
    sleep(1);
      printf(".....\n");
    
  FILE *fptr;
  int temp,i;
  srand(time(0));

  fptr = fopen("temp_log.txt", "w");

  printf("Temp Reading: \n");
  for (int i = 0; i < 10; i++){
    temp = 20 + rand() % 21;
    printf("Reading %d: %d 'C",i,temp);
    fprintf(fptr,"Reading %d: %d 'C\n",i,temp);
    }
  fclose(fptr);
  printf("\n All readings have been saved to temp_log.txt");
  return 0;
  } else {
    printf("Error: Invalid Input");
  }
  }