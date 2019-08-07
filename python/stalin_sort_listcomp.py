# To use, define an array `mixed` and run `next(ss_listcomp)`
# just as in the tests

ss_listcomp = \
(
    # core part
    [l for l in [[float('-inf')]] 
       for i in mixed
           if l[-1]<=i and not l.append(i)
    ][0][1:]

# infinite generator that always returns the core part
for il in [[None]] for _ in il if not il.append(None))


# tests
if __name__ == "__main__":
    import random
    from stalin_sort import sort # from same directory
    mixed = list(range(2**10))
    for _ in range(100):
        random.shuffle(mixed)
        assert next(ss_listcomp) == sort(mixed)
    print("all tests passed")
