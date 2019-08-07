def sort(xs):
  if len(xs) < 1:
    return xs
  max_val=xs[0]
  result = []
  for x in xs:
    if x >= max_val:
      result.append(x)
      max_val = x
  return result


from test_utils import test_all
from benchmark import benchmark

test_all(sort)
benchmark(sort)
