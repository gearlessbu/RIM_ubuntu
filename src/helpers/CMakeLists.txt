file(GLOB_RECURSE helpers_cpp_files "./*.cpp")
file(GLOB_RECURSE helpers_cu_files "./*.cu")

add_library(rim_helpers SHARED ${helpers_cpp_files} ${helpers_cu_files})

target_link_libraries(rim_helpers OpenMP::OpenMP_CXX)