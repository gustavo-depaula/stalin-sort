#ifndef STALIN_SORT_HPP
#define STALIN_SORT_HPP

#include <iterator>

#if __cplusplus == 202002L
template <std::input_iterator Iter,
          std::sentinel_for<Iter> Sentinel,
          std::weakly_incrementable OIter>
          requires std::indirectly_writable<OIter, std::iter_value_t<Iter>>
constexpr void stalin_sort(Iter first, Sentinel last, OIter out)
#elif __cplusplus > 199711L && __cplusplus <= 201703L
    template <typename Iter, typename OIter>
    constexpr void stalin_sort(Iter first, Iter last, OIter out)
#else
    template <typename Iter, typename OIter>
    void stalin_sort(Iter first, Iter last, OIter out)
#endif
{
    auto biggest = *first++;
    *out++ = biggest;

    for (auto & it = first; it != last; ++it)
    {
        const auto value = *it;

        if (value >= biggest) {
            biggest = value;
            *out++ = value;
        }
    }
}

#endif
