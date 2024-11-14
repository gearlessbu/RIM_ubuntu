file(GLOB_RECURSE cuda_cpp_files "./*.cpp")
file(GLOB_RECURSE cuda_cu_files "./*.cu")

add_library(rim_cuda SHARED ${cuda_cpp_files} ${cuda_cu_files})

target_link_libraries(rim_cuda OpenMP::OpenMP_CXX rim_dynamics)