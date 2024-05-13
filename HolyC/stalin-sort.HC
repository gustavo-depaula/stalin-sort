/*
Original by:
Austin Sierra
Last Edit:
12 May 2024

Sorts an array by non-decreasing elements

Parameters:
 array- pointer to an I64 array
 count- number of elements in the array
 eleSize- size of elements in the array
*/

U0 StalinSort(I64 *array,I64 count,I64 eleSize)
{
  if(count<=1)
    return;
  
  I64 i;  
  I64 *current = &array[0];
  I64 *next;
  Bool purgeInProgress=FALSE;

  for(i=0;i<count-1;i++,current++)
  {
   next= array[i+1];
   if(next<*current)
   {
    purgeInProgress=TRUE;
    MemSet(&array[i+1],0,sizeof(eleSize));
    current--;
    
   }
   else
   {
    if(purgeInProgress)
    {
     I64 *replaceIndex = current;
     replaceIndex++;
     MemCpy(replaceIndex,&array[i+1],sizeof(eleSize));
     MemSet(&array[i+1],0,sizeof(eleSize));
    }
   }
  }

  //Five Year Plan Complete Ahead of Schedule!
  purgeInProgress=FALSE;
  //Communism Achieved!
  //Congratulations Comrade!
}


