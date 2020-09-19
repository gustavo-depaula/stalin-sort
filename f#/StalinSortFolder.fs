// stalinSort : x:'a list -> 'a list when 'a : comparison
let stalinSort x =
    let folder acc v =
        match List.last acc with
        | max when max <= v -> acc @ [v]
        | _ -> acc
    match x with
    | [] -> []
    | head :: tail -> List.fold folder [head] tail
