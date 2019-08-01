/proc/stalin_sort(list/L, compare=/proc/default_compare)
    if (L.len == 0)
        return list()

    var/list/out = list()

    var/highest = L[1]
    for (var/element in L)
        var/cmp = call(compare)(highest, element)
        if (cmp <= 0)
            highest = element;
            out[++out.len] = element;

    return out


/proc/default_compare(a, b)
    if (a > b)
        return 1

    if (a < b)
        return -1

    return 0


/proc/main()
    var/list/L = stalin_sort(list(1, 3, 3, 3, 2, 2, 2, 5, 3, 10, 6, 5))
    world.log << json_encode(L)


// Boiler plate to get a sane main()-like method.
/ZZZ/New()
    main()
    shutdown()

/var/ZZZ/zzz = new