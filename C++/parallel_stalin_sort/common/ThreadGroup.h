#pragma once

#include <cstdint>
#include <vector>
#include "SyncableThread.h"


template<typename... _Args>
class ThreadGroup {
public:
    ThreadGroup(uint32_t threads, void(&function)(_Args...));

    void setArgs(uint32_t threadIndex, const _Args&... args);

    void start();
    void synchronousStart();
    void join() const;
    std::vector<const IJoinable*> getJoinHandles() const;

    uint32_t size() const;

private:
    std::shared_mutex syncMutex;
    std::vector<SyncableThread<_Args...>> threads;
    std::vector<std::tuple<_Args...>> args;
};


template<typename... _Args>
ThreadGroup<_Args...>::ThreadGroup(uint32_t threads, void(&function)(_Args...)) : 
    syncMutex(),
    threads(threads, SyncableThread<_Args...>(function, syncMutex)),
    args(threads) {}

template<typename... _Args>
void ThreadGroup<_Args...>::setArgs(uint32_t threadIndex, const _Args&... args){
    if (threadIndex >= this->args.size()) {
        throw std::out_of_range("Invalid thread index");
    }
    this->args[threadIndex] = std::make_tuple(args...);
}

template<typename... _Args>
void ThreadGroup<_Args...>::start(){
    for (uint32_t i = 0; i < threads.size(); i++){
        threads[i].start(std::get<_Args>(args[i])...);
    }
}

template<typename... _Args>
void ThreadGroup<_Args...>::synchronousStart(){
    std::unique_lock<std::shared_mutex> lock(syncMutex);
    start();
    lock.unlock();
}

template<typename... _Args>
void ThreadGroup<_Args...>::join() const {
    for (uint32_t i = 0; i < threads.size(); i++){
        threads[i].join();
    }
}

template<typename... _Args>
std::vector<const IJoinable*> ThreadGroup<_Args...>::getJoinHandles() const {
    std::vector<const IJoinable*> handles;
    handles.reserve(threads.size());
    for (uint32_t i = 0; i < threads.size(); i++){
        handles.push_back(&threads[i]);
    }
    return handles;
}

template<typename... _Args>
uint32_t ThreadGroup<_Args...>::size() const {
    return threads.size();
}