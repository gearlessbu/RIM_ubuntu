file(GLOB_RECURSE managers_cpp_files "./*.cpp")
file(GLOB_RECURSE managers_cu_files "./*.cu")

set(FreeImage_Include_Dir "${RIM_ROOT}/external/FreeImage-CMake/FreeImage/Source")
set(FreeImage_LIBRARY "${RIM_ROOT}/external/FreeImage-CMake/FreeImage/build")

find_path(FreeImage_Include_Dir FreeImage.h)
find_library(SIFTGPU_LIBRARY freeimage)
include_directories(${FreeImage_Include_Dir})

add_library(rim_managers SHARED ${managers_cpp_files} ${managers_cu_files})

target_link_libraries(rim_managers OpenMP::OpenMP_CXX rim_helpers freeimage)