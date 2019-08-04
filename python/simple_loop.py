def sort(xs):
  max_val=float('-inf')
  result = []
  for x in xs:
    if x >= max_val:
      result.append(x)
      max_val = x
  return result


from test_utils import test_all
from benchmark import benchmark, benchmark_length

test_all(sort)
