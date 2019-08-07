def sort(l):
    return [x for max_val in l[:1] for x in l if x >= max_val for max_val in (x,)]


if __name__ == '__main__':
    TEST_LISTS = [
        [1, 2, 3, 4, 5, 6, 7, 8, 9], 
        [9, 8, 7, 6, 5, 4, 3, 2, 1], 
        [1, 3, 2, 5, 4, 7, 6, 9, 8], 
        [1, 5, 2, 4], 
    ]

    for original_list in TEST_LISTS:
        sorted_list = sort(original_list)
        print(f"Original: {original_list}")
        print(f"Sorted: {sorted_list}")
