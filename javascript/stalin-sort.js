function stalinSort(array) {
  if (!Array.isArray(array)) {
    throw new TypeError('stalinSort: Argument must be an Array')
  }
  let i = 1
  let j = 1
  for (; i < array.length; i++) {
    if (array[i] >= array[j - 1]) {
      array[j] = array[i]
      j++
    }
  }
  array.length = j
  return array
}

module.exports = stalinSort;
