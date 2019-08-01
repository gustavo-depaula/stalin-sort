#!/bin/bash
stalin_sort(){
 (max=$1
 if [[ "$@" =~ ^[0-9\ ]+$ ]];then
  #numeric
  for i in "$@";do
    if [[ $max -gt $i ]];then continue;fi
    echo $i;max=$i
  done 
 else
  #lexical
  for i in "$@";do
     if [[ $max > $i ]];then continue;fi
     echo $i;max=$i
   done
 fi)|xargs
}
#TEST
#stalin_sort 1 2 10 3 4 5 15 6 30 20
#stalin_sort a c b a c d
#stalin_sort 1 a 2 b 3 c
