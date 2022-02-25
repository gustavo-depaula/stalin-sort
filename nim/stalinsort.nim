proc stalinSorted*[T](a: openArray[T]): seq[T] =
  result = newSeq[T]()

  if a.len == 0:
    return

  result.add(a[0])

  for c in a[1 .. ^1]:
    if c >= result[^1]:
      result.add(c)

  return