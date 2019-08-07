#include <utility>
#include <boost/hana/tuple.hpp>
#include <boost/hana/functional/arg.hpp>
#include <boost/hana/equal.hpp>

// for print result
#include <iostream>
#include <boost/hana/for_each.hpp>

namespace hana = boost::hana;

template <auto ... args, auto ... i>
inline constexpr auto make_tuple_helper(std::index_sequence<i...>) noexcept
{
    return hana::make_tuple(hana::arg<i>(args...)...);
}

template <auto itr, auto end, auto ... args, auto ... result_indexes>
inline constexpr auto stalin_impl(std::index_sequence<result_indexes...>) noexcept
{
    if constexpr (sizeof...(args) == 0) return std::index_sequence<>{};

    else if constexpr (itr == end) 
        return std::index_sequence<result_indexes...>{};

    else if constexpr (hana::arg<hana::arg<sizeof...(result_indexes)>(result_indexes...)>(args...)
         > hana::arg<itr + 1>(args...))

        return stalin_impl<itr + 1, end, args...>(
             std::index_sequence<result_indexes...>{}
        );

    else return stalin_impl<itr + 1, end, args...>(
        std::index_sequence<result_indexes..., itr + 1>{}
    );
}

template <auto ... args>
inline constexpr auto stalin_sort() noexcept
{
    return make_tuple_helper<args...>(
        stalin_impl<1, sizeof...(args), args...>(std::index_sequence<1>{})
    );
}

auto main() -> int
{
    static_assert(stalin_sort<>() == hana::make_tuple()); // sorted at compile time
    static_assert(stalin_sort<0>() == hana::make_tuple(0));
    static_assert(stalin_sort<2,3>() == hana::make_tuple(2, 3));
    static_assert(stalin_sort<2,1,3>() == hana::make_tuple(2, 3));
    static_assert(stalin_sort<2,1,3,3,2,5,6>() == hana::make_tuple(2,3,3,5,6));
    
    // print
    constexpr auto result = stalin_sort<3, 1, 4, 1, 5>();
    hana::for_each(result, [](const auto& x){ std::cout << x << " "; }); // 3 4 5
}
