add_subdirectory(support_lib)


add_executable(main main.cpp)
target_compile_features(main PUBLIC cxx_std_17)
