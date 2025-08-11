#pragma once

#include <thread>
#include <shared_mutex>
#include <mutex>
#include <stdexcept>
#include "IJoinable.h"


template<typename... _Args>
class SyncableThread : public IJoinable {
public:
    SyncableThread(void(&function)(_Args...), std::shared_mutex& syncMutex);
    ~SyncableThread();

    void start(const _Args&... args);
    void join() const override;

    bool isRunning() const;

private:
    bool running;
    std::thread* thread;
    std::shared_mutex& syncMutex;
    void(&function)(_Args...);
    
    void threadFunction(const _Args&... args);
};

template<typename... _Args>
SyncableThread<_Args...>::SyncableThread(void(&function)(_Args...), std::shared_mutex& syncMutex): 
    function(function), 
    running(false), 
    thread(nullptr), 
    syncMutex(syncMutex) {}

template<typename... _Args>
SyncableThread<_Args...>::~SyncableThread(){
    if (thread != nullptr){
        delete thread;
    }
}

template<typename... _Args>
void SyncableThread<_Args...>::start(const _Args&... args){
    if (running) {
        throw std::runtime_error("Cannot start thread while thread is running");
    }
    if (thread != nullptr){
        thread->join();
        delete thread;
    }
    thread = new std::thread(&SyncableThread<_Args...>::threadFunction, this, args...);
}

template<typename... _Args>
void SyncableThread<_Args...>::join() const {
    if (thread != nullptr && thread->joinable()) {
        thread->join();
    }
}

template<typename... _Args>
bool SyncableThread<_Args...>::isRunning() const {
    return running;
}

template<typename... _Args>
void SyncableThread<_Args...>::threadFunction(const _Args&... args){
    std::shared_lock<std::shared_mutex> lock(syncMutex);
    running = true;
    function(args...);
    running = false;
    lock.unlock();
}