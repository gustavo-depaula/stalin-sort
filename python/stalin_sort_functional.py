from functools import reduce
from typing import NamedTuple, List
from math import inf


class State(NamedTuple):
    max_val: float = -inf
    ordered_list: List[float] = []


def sort_step(acc: State, number: float) -> State:
    if acc.max_val <= number:
        ordered_list = acc.ordered_list + [number]
        return State(
            max_val=number,
            ordered_list=ordered_list
        )
    return acc


def sort(l: List[float]) -> List[float]:
    return reduce(sort_step, l, State()).ordered_list


if __name__ == '__main__':
    TEST_LISTS = [
        [1, 2, 3, 4, 5, 6, 7, 8, 9],  # ordered
        [9, 8, 7, 6, 5, 4, 3, 2, 1],  # reversed
        [1, 3, 2, 5, 4, 7, 6, 9, 8],  # mixed
        [1, 5, 2, 4],  # mixed
    ]

    for ordered_list in TEST_LISTS:
        sorted_list = sort(ordered_list)
        print(f"Original: {ordered_list}")
        print(f"Sorted: {sorted_list}")
