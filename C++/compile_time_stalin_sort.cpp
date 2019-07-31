#include <iostream>
#include <utility>

template<int...Seq>
using seq = std::integer_sequence<int, Seq...>;

template<class Result, size_t RestSize, int Target, int ...Rest>
struct stalin_sort_impl_01;


template <class Result>
struct stalin_sort_stopper {
    using result = Result;
};
template<class Result, int CompTarget, int...Next>
constexpr stalin_sort_impl_01<Result, sizeof...(Next), CompTarget, Next...> stalin_sort_next_wrapper(seq<CompTarget,Next...>) {};
template<class Result>
constexpr stalin_sort_stopper<Result> stalin_sort_next_wrapper(seq<>){};


template<int I, int... Seq>
constexpr seq<Seq...,I> insert(seq<Seq...>) {};

template<class Result, bool Comp, int CompTarget, int InsertTarget, int ...Rest>
struct stalin_sort_impl_comp_insert_01 {
    using next = seq<CompTarget, Rest...>;
    using result = Result;
};

template<class Result, int CompTarget, int InsertTarget, int ...Rest>
struct stalin_sort_impl_comp_insert_01<Result, true, CompTarget, InsertTarget, Rest...> {
    using next = seq<CompTarget, Rest...>;
    using result = decltype(insert<InsertTarget>(Result{}));
};

template<class Result, class Next>
struct stalin_sort_holder_detail : decltype(stalin_sort_next_wrapper<Result>(Next{})) {};
template<class Holder>
struct stalin_sort_holder : stalin_sort_holder_detail<typename Holder::result,typename Holder::next> {};

template<class Result, int A, int B, int ...Rest>
struct stalin_sort_impl_comp_insert :
    stalin_sort_holder<
        stalin_sort_impl_comp_insert_01<Result, (A <= B), (A <= B) ? B:A, B, Rest...>
    > {};

template<class Result, size_t RestSize, int Target, int ...Rest>
struct stalin_sort_impl_01 : stalin_sort_impl_comp_insert<Result, Target, Rest...> {};

template<class Result, int Target, int ...Rest>
struct stalin_sort_impl_01<Result, 0u, Target, Rest...> {
    using result = Result;
};

template<int Target, int...Rest>
struct stalin_sort : stalin_sort_impl_01<seq<Target>, sizeof...(Rest), Target, Rest...> {};

// printer
template<int Head, int ...Tail>
void print_impl() {
    auto& out = std::cout;
    out << Head;
    using expander = int[];
    (void)expander{0, (void(out << ',' << Tail), 0)...};
    out << std::endl;
}


template<int ...Seq>
void print(seq<Seq...>) {
    print_impl<Seq...>();
}



int main() {
    print(typename stalin_sort<0>::result{}); // => 0
    print(typename stalin_sort<2,3>::result{});
    print(typename stalin_sort<2,1,3>::result{}); // => 2,3
    print(typename stalin_sort<1,2,3,4,5>::result{}); // => 1,2,3,4,5
    print(typename stalin_sort<2,1,3,3,2,5,6>::result{}); // => 2,3,3,5,6
    return 0;
}