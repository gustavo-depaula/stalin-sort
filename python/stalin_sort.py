from random_list import random_list_maker


def sort(sequence: list) -> list:
    if sequence:
        max_val = sequence[0]
        return [max_val := x for x in sequence if x >= max_val]
    return sequence


def test(sequence):
    print(f'Original: {sequence}')
    print(f'Sorted: {sort(sequence)}')
    print()


if __name__ == '__main__':

    test([1, 2, 3, 4, 5, 6, 7, 8, 9])  # ordered_list
    test([9, 8, 7, 6, 5, 4, 3, 2, 1])  # reversed_list
    test([1, 3, 2, 5, 4, 7, 6, 9, 8])  # mixed_list
    test([1, 5, 2, 4])  # test_list
    test(random_list_maker(10))  # random_list
