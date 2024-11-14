file(GLOB_RECURSE managers_cpp_files "./*.cpp")
file(GLOB_RECURSE managers_cu_files "./*.cu")

add_library(rim_managers SHARED ${managers_cpp_files} ${managers_cu_files})

target_link_libraries(rim_managers OpenMP::OpenMP_CXX rim_helpers)