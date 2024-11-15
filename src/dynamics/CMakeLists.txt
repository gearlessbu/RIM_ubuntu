file(GLOB_RECURSE dynamics_cpp_files "./*.cpp")
file(GLOB_RECURSE dynamics_cu_files "./*.cu")

find_path(FreeImage_Include_Dir FreeImage.h)
find_library(SIFTGPU_LIBRARY freeimage)
include_directories(${FreeImage_Include_Dir})

add_library(rim_dynamics SHARED ${dynamics_cpp_files} ${dynamics_cu_files})

target_link_libraries(rim_dynamics rim_cuda OpenMP::OpenMP_CXX ${CUDA_LIBRARIES} freeimage cublas)