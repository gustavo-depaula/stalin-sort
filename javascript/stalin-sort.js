function stalinSort(array) {
  if (!Array.isArray(array)) throw new TypeError('Argument must be an Array!');

  return array.reduce((prev, next) =>
    !prev.length ||
      next >= prev[prev.length - 1] ?
        [...prev, next] :
        prev
  , []);
}

module.exports = stalinSort
