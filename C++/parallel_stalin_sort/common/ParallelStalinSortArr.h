#pragma once

#include <cstdint>
#include <vector>
#include <stdexcept>


template<typename T>
class ParallelStalinSortArr{
public:
    ParallelStalinSortArr() = delete;
    ParallelStalinSortArr(T* array, const uint32_t allocatedLength);
    ParallelStalinSortArr(T* array, const uint32_t allocatedLength, const uint32_t dataLength);

    const T& firstElement() const;
    const T& lastElement() const;

    std::vector<ParallelStalinSortArr<T>> divide(const uint32_t subArrayCount);
    void merge(ParallelStalinSortArr<T>& nextSubArray, bool (&comparator)(const T&, const T&));

    uint32_t dataLength;
    T* array;

private:
    uint32_t allocatedLength;

    uint32_t findFirstMatchingElementIndex(const T& element, bool (&comparator)(const T&, const T&));
};



template<typename T>
ParallelStalinSortArr<T>::ParallelStalinSortArr(T* array, const uint32_t allocatedLength): 
    dataLength(allocatedLength), 
    allocatedLength(allocatedLength), 
    array(array) {}

template<typename T>
ParallelStalinSortArr<T>::ParallelStalinSortArr(T* array, const uint32_t allocatedLength, const uint32_t dataLength): 
    dataLength(dataLength), 
    allocatedLength(allocatedLength), 
    array(array) {}

template<typename T>
const T& ParallelStalinSortArr<T>::firstElement() const {
    return array[0];
}

template<typename T>
const T& ParallelStalinSortArr<T>::lastElement() const {
    return array[dataLength-1];
}

template<typename T>
std::vector<ParallelStalinSortArr<T>> ParallelStalinSortArr<T>::divide(const uint32_t subArrayCount){
    uint32_t minDataPerSubArr = dataLength / subArrayCount;
    uint32_t restOfData = dataLength - minDataPerSubArr * subArrayCount;
    uint32_t tableIterator = 0;
    std::vector<ParallelStalinSortArr<T>> out;
    out.reserve(subArrayCount);

    for (uint32_t i = 0; i < subArrayCount; i++){
        uint32_t applicableRestOfData = restOfData != 0;
        restOfData -= applicableRestOfData;
        uint32_t tableSliceLength = minDataPerSubArr + applicableRestOfData;
        out.push_back(ParallelStalinSortArr(&array[tableIterator], tableSliceLength));
        tableIterator += tableSliceLength;
    }

    return out;
}

template<typename T>
void ParallelStalinSortArr<T>::merge(ParallelStalinSortArr<T>& nextSubArray, bool (&comparator)(const T&, const T&)){
    this->allocatedLength += nextSubArray.allocatedLength;

    uint32_t firstMatchingElementIndex = 0;
    if (comparator(this->lastElement(), nextSubArray.lastElement()) == false){
        return;
    } else if (comparator(this->lastElement(), nextSubArray.firstElement()) == false){
        firstMatchingElementIndex = nextSubArray.findFirstMatchingElementIndex(this->lastElement(), comparator);
    }

    for (uint32_t i = firstMatchingElementIndex; i < nextSubArray.dataLength; i++){
        this->array[this->dataLength] = nextSubArray.array[i];
        this->dataLength++;
    }
}

template<typename T>
uint32_t ParallelStalinSortArr<T>::findFirstMatchingElementIndex(const T& element, bool (&comparator)(const T&, const T&)){
    uint32_t searchIndex = dataLength / 2;
    uint32_t searchInterval = dataLength / 4;
    while (searchInterval > 1){
        if (comparator(element, array[searchIndex]) == true) {
            searchIndex += searchInterval;
        } else {
            searchIndex -= searchInterval;
        }
        searchInterval /= 2;
    }
    
    if (comparator(element, array[searchIndex]) == true) {
        do {
            searchIndex--;
        } while (searchIndex != uint32_t(-1) && comparator(element, array[searchIndex]) == true);
        searchIndex++;
    } else {
        do {
            searchIndex++;
        } while (searchIndex < dataLength && comparator(element, array[searchIndex]) == false);
    }
    return searchIndex;
}