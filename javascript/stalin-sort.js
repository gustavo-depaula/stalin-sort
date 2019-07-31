function stalinSort(array) {
  if (!Array.isArray(array)) throw new TypeError('Argument must be an Array!');

  let [holder] = array;
  return array.filter((el, i) => {
    if (i === 0) return true;
    if(el >= holder) {
      holder = el;
      return true;
    }
    return false;
  });
}

module.exports = stalinSort
