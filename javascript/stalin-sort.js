function stalinSort (array) {
  const sorted = [array[0]];
  for (let i = 1; i < array.length; ++i) {
    if (array[i] > array[i-1]) {
      sorted.push(array[i])
    }
  }
  return sorted
}

module.exports = stalinSort
