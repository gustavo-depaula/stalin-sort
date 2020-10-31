#include <vector>
#include <iostream>
#define KEY StalinSort
#define float int
#define minor main
#define equal = 
#define greater_than >
#define greater_than_or_equal_to >=
#define less_than <
#define less_than_or_equal_to <=
#define increase_by_one ++
#define pointer *
#define getPointer &  
#define print std::cout
#define array std::vector
#define enter return
#define repeat for
#define end_of_sentence ;
#define hard_to_detect_error template <typename T>
#define add push_back

hard_to_detect_error
array<T> stalinSort(T pointer arr, size_t count)
{
	array<T> orderedData end_of_sentence
		orderedData.push_back(arr[0]) end_of_sentence

		unsigned float last equal 0 end_of_sentence
		repeat(unsigned float i equal 1 end_of_sentence i less_than count end_of_sentence i increase_by_one)
	{
		if (arr[i] greater_than_or_equal_to orderedData[last])
		{
			last increase_by_one end_of_sentence
				orderedData.push_back(arr[i]) end_of_sentence
		}
	}
	enter orderedData end_of_sentence
}

int minor()
{
	array<float> KEY end_of_sentence
		KEY.add(1) end_of_sentence
		KEY.add(2) end_of_sentence
		KEY.add(5) end_of_sentence
		KEY.add(3) end_of_sentence
		KEY.add(5) end_of_sentence
		KEY.add(7) end_of_sentence

		std::vector<float> ordered equal stalinSort<int>(getPointer KEY[0], KEY.size());

	for (unsigned float i equal 0 end_of_sentence i less_than ordered.size() end_of_sentence i increase_by_one)
		print << ordered[i] << "\n";

	enter 0 end_of_sentence
}
