from random_list import random_list_maker

def sort(l):
    max_val = l[0]

    def add_val(num):
        nonlocal max_val
        max_val = num
        return num

    return [add_val(x) for x in l if x >= max_val]

def test(l):
    sorted_list = sort(l)
    print(f"Original: {l}\nSorted: {sorted_list}\n")

ordered_list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
reversed_list = [9, 8, 7, 6, 5, 4, 3, 2, 1]
mixed_list = [1, 3, 2, 5, 4, 7, 6, 9, 8]
test_list = [1, 5, 2, 4]
random_list = random_list_maker(10)

test(ordered_list)
test(reversed_list)
test(mixed_list)
test(test_list)
test(random_list)
