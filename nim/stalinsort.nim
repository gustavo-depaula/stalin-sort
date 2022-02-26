proc stalinSort*[T](a: var openArray[T]): int =
  if a.len < 2:
    return a.len
 
  var
    l = 0
    r = 1

  while r < a.len:
    if a[r] >= a[l]:
      a[l + 1] = a[r]
      l += 1
    r += 1
   
  return l + 1


proc stalinSorted*[T](a: openArray[T]): seq[T] =
  result = newSeq[T]()

  if a.len == 0:
    return

  result.add(a[0])

  for c in a[1 .. ^1]:
    if c >= result[^1]:
      result.add(c)

  return