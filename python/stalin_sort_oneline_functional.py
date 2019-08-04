from functools import reduce


def stalin_sort(l):
    return reduce(lambda a, b: a + [b] if a[-1] <= b else a, l[1:], l and [l[0]])


if __name__ == '__main__':
    zero_to_eight = list(range(9))
    long_list = list(range(10 ** 5))
    assert stalin_sort([]) == []
    assert stalin_sort([3]) == [3]
    assert stalin_sort([3, 2, 1]) == [3]
    assert stalin_sort(zero_to_eight) == zero_to_eight
    assert stalin_sort(long_list) == long_list
    assert stalin_sort(list(reversed(zero_to_eight))) == [8]
    assert stalin_sort(list(reversed(long_list))) == [long_list[-1]]
