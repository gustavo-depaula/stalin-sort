export function stalinSort(arr: number[]): number[] {
  return arr.reduce((prev: number[], next: number) => {
    if(prev.length === 0) return [next]
    if(next >= prev[prev.length - 1]) return [...prev, next]
    return prev
  }, []);
}