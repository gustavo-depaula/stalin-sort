#let stalin_sort(l) = {
  let n = l.len()
  let bigger = 0
  let b = ()

  for elem in l {
    if elem >= bigger {
      bigger = elem
      b.push(elem)
    }
  }
  return b
}

#stalin_sort((1,2,8,5,7,9,1,1))
