#include <utility>
#include <boost/hana/tuple.hpp>
#include <boost/hana/functional/arg.hpp>
#include <boost/hana/equal.hpp>

namespace hana = boost::hana;

// 最終的に tuple を作る際のヘルパー関数
template <auto ... args, auto ...i>
inline constexpr auto make_tuple_helper(std::index_sequence<i...>) noexcept
{
    return hana::make_tuple(hana::arg<i>(args...)...);
}

// 実装です
// ソート済みの、1 ベースの index を返します
template <auto itr, auto end, auto ... args, auto ... result_index>
inline constexpr decltype(auto) stalin_impl(const std::index_sequence<result_index...>& seq) noexcept
{
    // ストッパーです
    if constexpr (itr + 1 == end)
        if constexpr (hana::arg<itr>(args...) > hana::arg<end>(args...))
            return seq; // 粛清！
        else 
            return std::index_sequence<result_index..., end>{}; // 同胞にします

    // 次の要素の値が、現在の要素未満の場合に粛清します！
    else if constexpr (hana::arg<itr>(args...) > hana::arg<itr + 1>(args...))
        return stalin_impl<itr + 1, end, args...>(seq); // 粛清して再帰！

    else
        // 次の要素を同胞にして再帰！
        return stalin_impl<itr + 1, end, args...>(std::index_sequence<result_index..., itr + 1>{});
}

// スターリンソートの関数
template <auto ... args>
inline constexpr auto stalin_sort() noexcept
{
    if constexpr (sizeof...(args) == 0 or sizeof...(args) == 1) 
        return hana::make_tuple(args...); // 自明なものです
    else return make_tuple_helper<args...>(stalin_impl<1, sizeof...(args), args...>(std::index_sequence<1>{}));
}

auto main() -> int
{
    static_assert(stalin_sort<>() == hana::make_tuple()); // コンパイル時にソート完了！
    static_assert(stalin_sort<0>() == hana::make_tuple(0));
    static_assert(stalin_sort<2,3>() == hana::make_tuple(2, 3));
    static_assert(stalin_sort<2,1,3>() == hana::make_tuple(2, 3));
    static_assert(stalin_sort<2,1,3,3,2,5,6>() == hana::make_tuple(2,3,3,5,6));
}

