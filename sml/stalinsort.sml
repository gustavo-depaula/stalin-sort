fun stalin_sort f nil = nil
  | stalin_sort f (c :: cs) = c :: stalin_sort_rec f cs c

and stalin_sort_rec f nil prev = nil
  | stalin_sort_rec f (e :: es) prev =
    if f e prev then
        stalin_sort_rec f es prev
    else
        e :: stalin_sort_rec f es e

(*
    - fun int_lt x y = x < y;
    - val stalin_sort_int = stalin_sort int_lt;

    - stalin_sort_int [1, 2, 3, 4];
    val it = [1,2,3,4] : int list

    - stalin_sort_int [1, 2, 5, 4];
    val it = [1,2,5] : int list

    - stalin_sort_int [1, 2, 10, 3, 2, 4, 15, 6, 30, 20];
    val it = [1,2,10,15,30] : int list

    - stalin_sort_int [1,3,2,7,6,7,34];
    val it = [1,3,7,7,34] : int list
*)
