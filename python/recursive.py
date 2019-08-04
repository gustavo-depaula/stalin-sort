def sort(xs, max_val=float('-inf')):
  if len(xs) < 1:
    return []
  elif xs[0] >= max_val:
    return [xs[0]] + sort(xs[1:], xs[0])
  else:
    return sort(xs[1:], max_val)


from test_utils import test_all

test_all(sort)
