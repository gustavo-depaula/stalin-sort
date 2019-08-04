import timeit

# tests a sort function on list of lengths 10 to ten million.
def benchmark(sort_fun):
  length_exponents = [1, 2, 3, 4, 5, 6, 7]
  repetitions = 10
  for exponent in length_exponents:
    length = 10 ** exponent
    res = benchmark_length(sort_fun, length, repetitions)
    print(f'Sorting {repetitions} lists of length 10^{exponent} took {res} seconds.')

def benchmark_length(sort_fun, length, repetitions):
  res = timeit.timeit(stmt='sort_fun(xs)', setup=f'from random import choices; xs = choices(range(10000), k={length})', globals={'sort_fun': sort_fun}, number=repetitions)
  return res
