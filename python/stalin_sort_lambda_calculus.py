STALIN_SORT = lambda l: (
    # Y-combinator
    lambda f: (lambda x: f(x(x)))(lambda x: f(lambda *args: x(x)(*args)))
)(
    # fold/reduce
    lambda f: lambda arr, init, func: func(arr[0], f(arr[1:], init, func))
    if arr
    else init
)(
    # https://github.com/gustavo-depaula/stalin-sort/blob/master/python/stalin_sort_oneline_functional.py#L4
    # func to be reduced
    l,
    [],
    (
        lambda item, arr: [item]
        if not arr
        else [item] + arr
        if item <= arr[0]
        else [item] + arr[1:]
    ),
)

print(STALIN_SORT([]))
print(STALIN_SORT([0]))
print(STALIN_SORT([1, 2, 3, 4]))
print(STALIN_SORT([1, 3, 2, 4]))
print(STALIN_SORT([1, 4, 3, 2]))
print(STALIN_SORT([4, 3, 2, 1]))
