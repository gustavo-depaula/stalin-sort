export function stalinSort<T>(arr: T[]): T[] {
  return arr.reduce(
    (prev, next) =>
      !prev.length || next >= prev[prev.length - 1] ? [...prev, next] : prev,
    []
  );
}
