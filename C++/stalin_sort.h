#pragma once

#include <algorithm>

template <typename FwdIter, typename Compare>
FwdIter stalin_sort(FwdIter first, FwdIter last, Compare comp)
{
    if (first == last) {
        return last;
    }
    auto max = first;
    auto result = ++first;
    for (; first != last; ++first) {
        if (comp(*first, *max)) {
            continue;
        }
        if (result != first) {
            *result = *first;
        }
        ++max;
        ++result;
    }
    return result;
}

template <typename FwdIter>
FwdIter stalin_sort(FwdIter first, FwdIter last)
{
    return stalin_sort(first, last, std::less<>{});
}
