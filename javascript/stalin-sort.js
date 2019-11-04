function stalinSort(array) {
  if (!Array.isArray(array)) throw new TypeError('Argument must be an Array!');

  return array.reduce((prev, next) => {
    if(prev.length === 0) return [next]
    if(next >= prev[prev.length - 1]) return [...prev, next]
    return prev
  }, []);
}

module.exports = stalinSort
