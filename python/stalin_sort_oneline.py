# this function can be written in one-line.
stalin_sort = (
    (lambda func, censor:
        (lambda raw_arr:
            func(func, censor(raw_arr))
        )
    )
    (
        # first argument: do main process for sorting.
        (lambda func, arr:
            # terminal processes
            []                             if not arr          else
            arr                            if len(arr) == 1    else
            # if purge is not needed
            [arr[0], *func(func, arr[1:])] if arr[0] <= arr[1] else
            # if purge is needed
            func(func, [arr[0], *arr[2:]])
        ),
        # second argument: censor the arguments.
        (lambda raw_arr:
            # check whether parameters are too many
            (lambda arr:
                (_ for _ in []).throw(
                    # We should not make subclass from BaseException, but Stalin is special.
                    type('StalinPurge', (BaseException,), {}), 'array is too long'
                ) if 1024 < len(arr) else arr
            )
            (
                # check whether parameters only consist of number instance
                (lambda raw_arr: 
                    (_ for _ in []).throw(
                        type('StalinPurge', (BaseException,), {}), 'spy is found.'
                    ) if not all(isinstance(e, (int, float, )) for e in raw_arr) else raw_arr
                )
                (raw_arr)
            )
        )
    )
)


if __name__ == '__main__':
    lists_for_test = [
        [3, 1, 4, 1, 5, 9, 2],
        [9, 8, 7, 6, 5, 4, 3, 2, 1],    # reversed
        [1.732, 1, 1.414, 2, 2.236],    # includes floating value
        [0] * 2000,                     # huge
        [2, 7, 1, 'spam', 8],           # includes objects that are not number
    ]

    for src in lists_for_test:
        try:
            dst = stalin_sort(src)
        except BaseException as e:
            print(f'{type(e).__name__}: {e}')
            continue

        print(dst)
