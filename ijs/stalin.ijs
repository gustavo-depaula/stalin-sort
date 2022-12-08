NB. Stalin sort in J
NB. 1. Compute an array with the cumulative maximums
NB. 2. Compute mask indicating which are equal to their cumulative maximum
NB. 3. Keep only those

   stalin =. #~ >./\ = ]

NB. Tests (mostly the same as the APL file)
   stalin i. 15 NB. stalin 0..14
NB. 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14
   stalin |. i. 15 NB. stalin 14..0
NB. 14
   stalin 3 1 2 5 5 4 7 6 9 8
NB. 3 5 5 7 9
   stalin 1 2 4 5 6 8 0 9 5 7
NB. 1 2 4 5 6 8 9
   stalin 9 8 7 6 5 4 3 2 1 0
NB. 9
   stalin 1 3 2 5 4 7 0 9 8 6
NB. 1 3 5 7 9
   stalin 1 3 3 2 5 6 6
NB. 1 3 3 5 6 6
   stalin 2 1 5 4 8
NB. 2 5 8
   stalin 1 2 3 1 2 3 4 1 2 3 4 5
NB. 1 2 3 3 4 4 5
