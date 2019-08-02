export function stalinSort(arr: number[]): number[] {
  let temp = arr[0] - 1;
  return arr.filter(el => {
    if (temp < el) {
      temp = el;
      return true;
    }
    return false;
  });
}
