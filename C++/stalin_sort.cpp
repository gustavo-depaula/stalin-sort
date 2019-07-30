#include <iostream>
#include <vector>

void stalinSort(std::vector<int> &arr, std::vector<int> &sorted)
{
    sorted.push_back(arr[0]);
    for (int i = 1, j = 0; i < arr.size(); i++)
    {
        if (arr[i] > arr[j])
        {
            sorted.push_back(arr[i]);
            j++;
        }
    }
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
