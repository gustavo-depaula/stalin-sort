
# pairs of input - output
test_cases = [([1, 2, 3, 4, 5], [1, 2, 3, 4, 5]), # sorted list
              ([5, 4, 3, 2, 1], [5]), # reversed list
              ([], []), # empty list
              ([2], [2]), # one element
              ([1, 1], [1, 1]), # duplicate
              ([2, 2, 2], [2, 2, 2]), # triplicate
              ([1, 2, 5, 3, 4, 7], [1, 2, 5, 7]), # out of order
              (['a', 'c', 'b'], ['a', 'c'])] # non-numbers

# test sort_fun on all test cases defined above.
def test_all(sort_fun):
  for xs, expected in test_cases:
    print(f'testing with input {xs}, expecting output {expected}.')
    result = sort_fun(xs)
    print(f'output was {result}')
    assert(result == expected)
