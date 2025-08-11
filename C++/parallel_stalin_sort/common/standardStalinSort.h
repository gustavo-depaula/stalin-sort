#pragma once

#include <cstdint>
#include "ParallelStalinSortArr.h"


template<typename T>
using comparatorSignature = bool (const T&, const T&);

template<typename T>
bool decreasingComparator(const T& a, const T& b){
    return a >= b;
}

template<typename T>
uint32_t standardStalinSort(T* array, uint32_t tableSize, comparatorSignature<T>& comparator = &decreasingComparator<T>){
    uint32_t endOfData = 0;
    uint32_t i = 1;
    for (; i < tableSize; i++){
        if (comparator(array[endOfData], array[i]) == false){
            break;
        }
        endOfData++;
    }
    for (; i < tableSize; i++){
        if (comparator(array[endOfData], array[i]) == true){
            endOfData++;
            array[endOfData] = array[i];
        }
    }
    return endOfData + 1;
}

template<typename T>
void standardStalinSort(ParallelStalinSortArr<T>* array, comparatorSignature<T>* comparator = &decreasingComparator<T>){
    array->dataLength = standardStalinSort<T>(array->array, array->dataLength, *comparator);
}