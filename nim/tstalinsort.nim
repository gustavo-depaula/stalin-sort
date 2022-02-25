import stalinsort

var arr = newSeq[int]()
doAssert stalinSorted(arr) == @[]

arr = @[1]
doAssert stalinSorted(arr) == @[1]

arr = @[1, 2, 5, 3, 5, 7]
doAssert stalinSorted(arr) == @[1, 2, 5, 5, 7]