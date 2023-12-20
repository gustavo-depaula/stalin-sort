#include <array>
#include <iterator>
#include <vector>

#include <catch2/catch_test_macros.hpp>

#include <stalin_sort.hpp>

TEST_CASE("Can Stalin this vector", "[vector]")
{
    std::vector<int> vec{1, 3, 2, 4, 5};

    std::vector<int> sorted;

    stalin_sort(vec.cbegin(), vec.cend(), std::back_inserter(sorted));

    REQUIRE(sorted == std::vector{1, 3, 4, 5});
}

TEST_CASE("Can Stalin this array", "[array]")
{
    SECTION("With numbers")
    {
        const std::array arr { 1, 2, 5, 3, 5, 7 };
        
        std::vector<int> sorted;

        stalin_sort(std::cbegin(arr), std::cend(arr), std::back_inserter(sorted));

        REQUIRE(sorted == std::vector{1, 2, 5, 5, 7});
    }

    SECTION("With array of chars")
    {
        const std::array arr {'a', 'd', 'b', 'f', 't', 'b'};
        std::vector<char> sorted;
        
        stalin_sort(std::cbegin(arr), std::cend(arr), std::back_inserter(sorted));
        REQUIRE(sorted == std::vector{'a', 'd', 'f', 't'});
    }
}
