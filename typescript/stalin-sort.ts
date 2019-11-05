export function stalinSort(arr: number[]): number[] {
  return arr.reduce<number[]>((prev, next) =>
    !prev.length ||
      next >= prev[prev.length - 1] ?
      [...prev, next] :
      prev
  , []);
}