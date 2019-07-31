(datatype number-list

  ___________________
  [] : number-list;
  
  X: number; Y : number-list;
  ==========================
  [X | Y] : number-list;)


(define stalin-sort
  {number-list --> number-list}
  
  []            -> []
  [X Y | Rest]  -> (stalin-sort [X | Rest]) where (> X Y)
  [X | Rest]    -> [X | (stalin-sort Rest)])


\* Tests *\
(map stalin-sort
     [[3 1 2 5 5 4 7 6 9 8]
      [1 2 4 5 6 8 0 9 5 7]
      [9 8 7 6 5 4 3 2 1 0]
      [1 3 2 5 4 7 0 9 8 6]])

\* This should fail out of type incorrectness *\
\* (stalin-sort [1 2 + 3 4 5]) *\
