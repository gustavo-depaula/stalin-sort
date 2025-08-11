#pragma once

#include "ThreadGroup.h"
#include "ParallelStalinSortArr.h"
#include "standardStalinSort.h"


template<typename T>
void stalinSortMerge(uint32_t threadIndex, std::vector<ParallelStalinSortArr<T>>* arrays, const std::vector<const IJoinable*>* threads, comparatorSignature<T>* comparator) {
    std::vector<ParallelStalinSortArr<T>>& arraysRef = *arrays;
    const std::vector<const IJoinable*>& threadsRef = *threads;

    uint32_t mergeIncrementor = 1;
    ParallelStalinSortArr<T>& workArray = arraysRef[threadIndex * 2];
    uint32_t mergeArrIndex = threadIndex * 2 + 1;

    while (true){
        workArray.merge(arraysRef[mergeArrIndex], *comparator);
        
        uint32_t mergeThreadIndex = threadIndex | mergeIncrementor;
        mergeArrIndex = mergeThreadIndex * 2;
        if (mergeThreadIndex == threadIndex || mergeArrIndex >= arraysRef.size() || mergeThreadIndex >= threadsRef.size()){
            break;
        }
        threadsRef[mergeThreadIndex]->join();
        mergeIncrementor <<= 1;
    }

    if (threadIndex == threadsRef.size() - 1 && (arraysRef.size() & 0x1) == 0x1) {
        mergeArrIndex = arraysRef.size() - 1;
        workArray.merge(arraysRef[mergeArrIndex], *comparator);
    }
}