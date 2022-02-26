import stalinsort

block:
  var
    arr1: array[0, int]
    size1 = arr1.stalinSort
  doAssert size1 == 0
  doAssert arr1 == []

  var
    arr2 = [1]
    size2 = arr2.stalinSort
  doAssert size2 == 1
  doAssert arr2[0 .. size2 - 1] == @[1]

  var
    arr3 = [1, 2, 5, 3, 5, 7]
    size3 = arr3.stalinSort
  doAssert size3 == 5
  doAssert arr3[0 .. size3 - 1] == @[1, 2, 5, 5, 7]

block:
  var
    arr1 = newSeq[int]()
  doAssert arr1.stalinSorted == @[]

  var
    arr2 = @[1]
  doAssert arr2.stalinSorted == @[1]

  var
    arr3 = @[1, 2, 5, 3, 5, 7]
  doAssert arr3.stalinSorted == @[1, 2, 5, 5, 7]