#ifndef STALIN_SORT_HPP
#define STALIN_SORT_HPP

#include <algorithm>

template <typename FwdIter, typename Compare = std::less<>>
FwdIter stalin_sort(FwdIter first, FwdIter last, Compare comp = Compare())
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

#endif // STALIN_SORT_HPP
