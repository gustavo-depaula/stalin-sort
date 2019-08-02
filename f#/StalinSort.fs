open System

 module Seq =
    let stalinSort s =
        // `acc` must be non-empty
        let rec impl acc rest =
            if (Seq.isEmpty rest) then acc
            elif (Seq.last acc) <= (Seq.head rest) then impl (Seq.append acc (Seq.singleton (Seq.head rest))) (Seq.tail rest)
            else impl acc (Seq.tail rest)

        if (Seq.isEmpty s) then s
        else impl (Seq.singleton (Seq.head s)) (Seq.tail s)


[<EntryPoint>]
let main argv =
    let test s =
        printfn "before:"
        s |> Seq.iter (printf "%d ")
        printfn ""

        printfn "after:"
        (Seq.stalinSort s) |> Seq.iter (printf "%d ")
        printfn ""

    test [1; 2; 4; 3; 8; 0; 9; 5; 7]
    printfn ""

    test [1; 2; 4; 4; 3]

    0
