module StalinSort = struct 

    let rec stalinSort = function
        | [] -> []
        | [x] -> [x]
        | x :: y :: tail -> if x <= y  then  x :: stalinSort (y :: tail) else stalinSort (x :: tail)

end