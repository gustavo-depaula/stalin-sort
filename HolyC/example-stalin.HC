/*
Original by:
Austin Sierra
Last Edit:
12 May 2024

Sorts an array by non-decreasing elements
This is the test script for stalin-sort.HC
*/


Cd(__DIR__);;
#include "stalin-sort.HC";

#define ASIZE 10

//TEST 1
U0 Test1()
{
 I64 *array = CAlloc(sizeof(I64) * ASIZE);
 array[0] = 1;
 array[1] = 2;
 array[2] = 2; 
 array[3] = 1; 
 array[4] = 5; 
 array[5] = 6; 
 array[6] = 1; 
 array[7] = 8; 
 array[8] = 9; 
 array[9] = 10;  


 "\nBEFORE:\n";
 I64 i =0;
 for(i=0;i<ASIZE;i++)
 {
   "%d,",array[i];
 }
 "\n\n";


 StalinSort(array,ASIZE,sizeof(I64));
 "\nAFTER:\n";
 for(i=0;i<ASIZE;i++)
 {
  "%d,",array[i];
 }
 "\n\n";
}

Test1;
