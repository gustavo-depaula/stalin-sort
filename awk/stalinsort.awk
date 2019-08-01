{max=$1;for(i=1;i<NF;i++){if(max<=$i){print$i;max=$i}}}
#TEST
#echo 1 2 10 3 4 5 15 6 30 20|awk -f stalinsort.awk
#echo a c b a c d|awk -f stalinsort.awk
