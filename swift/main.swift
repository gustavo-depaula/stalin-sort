// To execute this code
// > swiftc main.swift StalinSort.swift -o main
// > ./main

let inputs = [
    [1, 2, 10, 3, 4, 5, 15, 6, 30, 20],
    [1, 2, 10, 3, 4, 5, 15, 6, 30, 30],
]

inputs.forEach { arr in
    print("Before")
    print(arr)
    print("After")
    print(arr.stalinSort())
}
