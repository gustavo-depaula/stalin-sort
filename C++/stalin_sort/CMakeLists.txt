cmake_minimum_required(VERSION 3.24)

project(stalin_sort LANGUAGES CXX)

option(ENABLE_TESTS "Enable tests" OFF)

add_library(project_options INTERFACE)

target_compile_options(project_options 
    INTERFACE
        -Wall
        -Wextra
)

add_library(stalin_sort INTERFACE)

target_link_libraries(stalin_sort
    INTERFACE
        project_options
)

target_include_directories(stalin_sort
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

if (${ENABLE_TESTS})
    add_subdirectory(tests)
    enable_testing()
endif()
