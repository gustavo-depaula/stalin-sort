// Learn more about F# at http://fsharp.org

open System

let rec StalinSort x =
        match x with
        | [] -> []
        | [x] -> [x]
        | x :: xs  ->
            match xs with
            | [] -> [x]
            | [y] -> if x <= y then [x; y] else [x]
            | y :: ys -> if x <= y then [x] @ (StalinSort ([y] @ ys)) else (StalinSort ([x] @ ys))

[<EntryPoint>]
let main argv =
    let nonsorted_list_1 = [1; 2; 4; 3; 6; 8; 0; 9; 5; 7]
    let sorted_list_1 = StalinSort nonsorted_list_1

    let nonsorted_list_2 = [1; 2; 1; 1; 4; 3; 9]
    let sorted_list_2 = StalinSort nonsorted_list_2

    Console.WriteLine("{0}", System.String.Join(", ", sorted_list_1))
    Console.WriteLine("{0}", System.String.Join(", ", sorted_list_2))
    0
