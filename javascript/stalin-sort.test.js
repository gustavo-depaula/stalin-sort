const stalinSort = require('./stalin-sort')

const testCases = [
  [[1, 2, 3, 4, 5], [1, 2, 3, 4, 5]],
  [[5, 4, 3, 2, 1], [5]],
  [[], []],
  [[2], [2]],
  [[1, 1], [1, 1]],
  [[2, 2, 2], [2, 2, 2]],
  [[1, 2, 5, 3, 4, 7], [1, 2, 5, 7]],
  [['a', 'c', 'b'], ['a', 'c']],
]

test.each(testCases)('%s -> %s ', (input, expected) =>
  expect(stalinSort(input)).toEqual(expected)
)
