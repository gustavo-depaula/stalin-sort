#!/bin/sh


echo "Original list"
seq 9
echo "Sorted List"
seq 9 | perl -f stalin-sort-oneline.pl
echo

echo "Original list"
seq 9 -1 1
echo "Sorted List"
seq 9 -1 2 | perl -f stalin-sort-oneline.pl
echo


echo "Original list"
shuf -i 1-9 -n 10 | tee /tmp/test_file.$$
echo "Sorted List"
cat /tmp/test_file.$$ | perl -f stalin-sort-oneline.pl
rm /tmp/test_file.$$
echo

