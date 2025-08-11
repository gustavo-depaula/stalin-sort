#pragma once

#include "common/ThreadGroup.h"
#include "common/ParallelStalinSortArr.h"
#include "common/standardStalinSort.h"
#include "common/stalinSortMerge.h"


/// @brief Performs a parallel Stalin sort on the given array. Gives performance improvements only on large arrays (more than a few million elements).
/// @tparam T - Type of the elements in the array.
/// @param array - Pointer to the array to be sorted.
/// @param tableSize - Size of the array.
/// @param threadCount - Number of threads to use for sorting.
/// @param comparator - Comparator function to use for sorting.
/// @return - The new size of the array after sorting.
template<typename T>
uint32_t stalinSort(T* array, uint32_t tableSize, uint32_t threadCount, comparatorSignature<T>& comparator = &decreasingComparator<T>);


template<typename T>
class ParallelStalinSort {
public:
    ParallelStalinSort(uint32_t threadCount, comparatorSignature<T>& comparator);

    uint32_t sort(T* array, uint32_t tableSize); 

private:
    ThreadGroup<ParallelStalinSortArr<T>*, comparatorSignature<T>*> sortThreads;
    ThreadGroup<uint32_t, std::vector<ParallelStalinSortArr<T>>*, const std::vector<const IJoinable*>*, comparatorSignature<T>*> mergeThreads;
    const std::vector<const IJoinable*> mergeThreadsHandles;
    comparatorSignature<T>& comparator;

    void setupThreads(std::vector<ParallelStalinSortArr<T>>& dividedData);
};



template<typename T>
ParallelStalinSort<T>::ParallelStalinSort(uint32_t threadCount, comparatorSignature<T>& comparator) :
    sortThreads(threadCount, standardStalinSort<T>),
    mergeThreads(threadCount / 2, stalinSortMerge<T>),
    mergeThreadsHandles(mergeThreads.getJoinHandles()),
    comparator(comparator) {}

template<typename T>
uint32_t ParallelStalinSort<T>::sort(T* array, uint32_t tableSize){
    if (tableSize <= this->sortThreads.size()) {
        return standardStalinSort(array, tableSize, comparator);
    }

    std::vector<ParallelStalinSortArr<T>> dividedData = ParallelStalinSortArr<T>(array, tableSize).divide(sortThreads.size());
    setupThreads(dividedData);

    sortThreads.start();
    sortThreads.join();
    mergeThreads.synchronousStart();
    mergeThreads.join();

    return dividedData[0].dataLength;
}

template<typename T>
void ParallelStalinSort<T>::setupThreads(std::vector<ParallelStalinSortArr<T>>& dividedData){
    for (uint32_t i = 0; i < sortThreads.size(); i++){
        sortThreads.setArgs(i, &dividedData[i], comparator);
    }
    for (uint32_t i = 0; i < mergeThreads.size(); i++){
        mergeThreads.setArgs(i, i, &dividedData, &mergeThreadsHandles, &comparator);
    }
}


template<typename T>
uint32_t stalinSort(T* array, uint32_t tableSize, uint32_t threadCount, comparatorSignature<T>& comparator) {
    return ParallelStalinSort<T>(threadCount, comparator).sort(array, tableSize);
};