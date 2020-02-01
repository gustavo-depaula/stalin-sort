// stalin_sort implementation
#include <iterator>

// printer and test headers
#include <iostream>
#include <vector>

// Stalin sort a given range. Return an iterator to the new end of the range.
// Use the custom compare to
template <class InputIt, class OutputIt, class Compare>
OutputIt stalin_sort(InputIt start, InputIt finish, OutputIt result, const Compare& comp)
{
	// Handle the zero-length edge case.
	if (start == finish)
		return result;

	auto current_highest = *start;
	++start;
	*result = current_highest;
	++result;

	while (start != finish)
	{
		if (comp(*start,current_highest))
		{
			++start;
		}
		else
		{
			current_highest = *start;
			++start;
			*result = current_highest;
			++result;
		}
	}
	return result;
}

// Stalin sort a given range. Return an iterator to the new end of the range. 
template <class InputIt, class OutputIt>
OutputIt stalin_sort(InputIt start, InputIt finish, OutputIt result)
{
	using DataType = decltype(*start);
	auto comp = [](const DataType& l, const DataType& r)
	{
		return !(r < l);
	};
	return stalin_sort(start, finish, result, comp);
}

void stalinSort(const std::vector<int> &arr, std::vector<int> &sorted)
{
	stalin_sort(begin(arr), end(arr), std::back_inserter(sorted));
}
int main()
{
    std::vector<int> arr = {1, 2, 4, 3, 8, 0, 9, 5, 7};
    std::vector<int> sortedArr;

    stalinSort(arr, sortedArr);

    std::cout << "before\n";
    for (int a : arr)
    {
        std::cout << a << ", ";
    }
    std::cout << "\nafter\n";
    for (int a : sortedArr)
    {
        std::cout << a << ", ";
    }
    std::cout << "\n";

    return 0;
}
