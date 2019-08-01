/proc/stalin_sort(list/L, compare=/proc/default_compare)
    for (var/i = 1; i < L.len; i++)
        var/a = L[i]
        var/b = L[i+1]

        var/cmp = call(compare)(a, b)
        if (cmp > 0)
            L.Cut(i+1, i+2)
            i--;


/proc/default_compare(a, b)
    if (a > b)
        return 1
    
    if (a < b)
        return -1
    
    return 0


/proc/main()
    var/list/L = list(1, 3, 2, 5, 3, 10, 6, 5)
    stalin_sort(L)
    world.log << json_encode(L)


// Boiler plate to get a sane main()-like method.
/ZZZ/New()
    main()
    shutdown()

/var/ZZZ/zzz = new