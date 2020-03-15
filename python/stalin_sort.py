from random_list import random_list_maker

def sort(l):
    max_val = l[0]

    def add_val(num):
        nonlocal max_val
        max_val = num
        return num

    return [add_val(x) for x in l if x >= max_val]


ordered_list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
sorted_list = sort(ordered_list)
print("Original: {0}\nSorted: {1}\n".format(ordered_list, sorted_list))

reversed_list = [9, 8, 7, 6, 5, 4, 3, 2, 1]
sorted_list = sort(reversed_list)
print("Original: {0}\nSorted: {1}\n".format(reversed_list, sorted_list))

mixed_list = [1, 3, 2, 5, 4, 7, 6, 9, 8]
sorted_list = sort(mixed_list)
print("Original: {0}\nSorted: {1}\n".format(mixed_list, sorted_list))

test_list = [1, 5, 2, 4]
sorted_list = sort(test_list)
print("Original: {0}\nSorted: {1}\n".format(test_list, sorted_list))

random_list = random_list_maker(10)
sorted_list = sort(random_list)
print("Original: {0}\nSorted: {1}\n".format(random_list, sorted_list))