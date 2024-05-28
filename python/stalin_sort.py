from typing import Callable


def sort[T](sequence: list[T], /, *, key: Callable[[T, T], bool] | None = None, reverse: bool = False) -> list[T]:
    if not sequence:
        return sequence

    if key:
        if reverse:
            def criteria(x, y) -> bool:
                return not key(x, y)
        else:
            def criteria(x, y) -> bool:
                return key(x, y)
    else:
        if reverse:
            def criteria(x, y) -> bool:
                return x <= y
        else:
            def criteria(x, y) -> bool:
                return x >= y

    max_val = sequence[0]
    return [max_val := x for x in sequence if criteria(x, max_val)]


if __name__ == '__main__':
    from random import randint
    from test_utils import test_all


    def get_random_numbers(length, min_val=0, max_val=100):
        return [randint(min_val, max_val) for _ in range(length)]


    def test(sequence):
        print(f'Original: {sequence}')
        print(f'Sorted: {sort(sequence)}')
        print()


    test([1, 2, 3, 4, 5, 6, 7, 8, 9])  # ordered_list
    test([9, 8, 7, 6, 5, 4, 3, 2, 1])  # reversed_list
    test([1, 3, 2, 5, 4, 7, 6, 9, 8])  # mixed_list
    test([1, 5, 2, 4])  # test_list
    test(get_random_numbers(10))  # random_list

    test_all(sort)
