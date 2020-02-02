#include <iostream>
#include <iterator>

#include "stalin_sort.h"

template <typename ContainerT>
void print(ContainerT&& container)
{
    std::copy(begin(container), end(container), std::ostream_iterator<typename std::remove_reference_t<ContainerT>::value_type>(std::cout, " "));
}

template <typename ContainerT>
int expect_equal(const ContainerT& lhs, const ContainerT& rhs)
{
    int result = 0;
    if (std::distance(begin(lhs), end(lhs)) == std::distance(begin(rhs), end(rhs)) &&
            std::equal(begin(lhs), end(lhs), begin(rhs))) {
        std::cout << "pass\n";
    } else {
        std::cout << "FAIL\n";
        std::cout << "Expected: "; print(rhs); std::cout << '\n';
        std::cout << "Actual:   "; print(lhs); std::cout << '\n';
        result = 1;
    }
    return result;
}

int main()
{
    int fail_count = 0;
    {
        std::vector<int> vec = { 1, 2, 6, 2, 7, 9, 1, 3, 12 };
        vec.erase(stalin_sort(vec.begin(), vec.end()), vec.end());
        fail_count += expect_equal(vec, std::vector<int>{ 1, 2, 6, 7, 9, 12 });
    }
    {
        std::vector<int> vec = { 10, 10, 1 };
        vec.erase(stalin_sort(vec.begin(), vec.end()), vec.end());
        fail_count += expect_equal(vec, std::vector<int>{ 10, 10 });
    }
    {
        std::vector<int> vec = { 1, 2};
        vec.erase(stalin_sort(vec.begin(), vec.end()), vec.end());
        fail_count += expect_equal(vec, std::vector<int>{ 1, 2 });
    }
    {
        std::vector<int> vec = { 1, 0};
        vec.erase(stalin_sort(vec.begin(), vec.end()), vec.end());
        fail_count += expect_equal(vec, std::vector<int>{ 1 });
    }
    {
        std::vector<int> vec = { 1 };
        vec.erase(stalin_sort(vec.begin(), vec.end()), vec.end());
        fail_count += expect_equal(vec, std::vector<int>{ 1 });
    }
    {
        std::vector<int> vec;
        vec.erase(stalin_sort(vec.begin(), vec.end()), vec.end());
        fail_count += expect_equal(vec, std::vector<int>{});
    }
    std::cout << fail_count << " tests failed.\n";
}
