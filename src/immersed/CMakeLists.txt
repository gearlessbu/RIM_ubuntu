file(GLOB_RECURSE immersed_cpp_files "./*.cpp")
file(GLOB_RECURSE immersed_cu_files "./*.cu")

add_library(rim_immersed SHARED ${immersed_cpp_files} ${immersed_cu_files})

target_link_libraries(rim_immersed OpenMP::OpenMP_CXX rim_helpers rim_managers)