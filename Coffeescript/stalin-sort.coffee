array = [
 1
 2
 5
 4
 6
 6
 8
 7
]

sortedArray = []

stalinSort = (array, sorted) ->
  i = 0
  bigger = 0
  while i < array.length
    if array[i] >= bigger
      bigger = array[i]
      sortedArray.push(array[i])
    i++
  sorted
sortedArray = stalinSort(array, sortedArray)
console.log(sortedArray)
