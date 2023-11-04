cmake_minimum_required(VERSION 3.24)

find_package(Catch2 3 REQUIRED)

include(CTest)

add_executable(tests_cxx_20
    ${CMAKE_CURRENT_SOURCE_DIR}/stalin_sort_tests.cpp
)

target_compile_features(tests_cxx_20 PRIVATE cxx_std_20)

target_link_libraries(tests_cxx_20
    PRIVATE
        Catch2::Catch2WithMain
        stalin_sort
    INTERFACE
        project_options
)

add_test(NAME tests_cxx_20 COMMAND tests_cxx_20)

add_executable(tests_cxx_17
    ${CMAKE_CURRENT_SOURCE_DIR}/stalin_sort_tests.cpp
)

target_compile_features(tests_cxx_17 PRIVATE cxx_std_17)

target_link_libraries(tests_cxx_17
    PRIVATE
        Catch2::Catch2WithMain
        stalin_sort
    INTERFACE
        project_options
)
add_test(NAME tests_cxx_17 COMMAND tests_cxx_17)

add_executable(tests_cxx_98
    ${CMAKE_CURRENT_SOURCE_DIR}/stalin_sort_tests.cpp
)

target_compile_features(tests_cxx_98 PRIVATE cxx_std_98)

target_link_libraries(tests_cxx_98
    PRIVATE
        Catch2::Catch2WithMain
        stalin_sort
    INTERFACE
        project_options
)
add_test(NAME tests_cxx_98 COMMAND tests_cxx_98)
