cmake_minimum_required(VERSION 3.22)

project(rim CXX)

set(CMAKE_BUILD_TYPE Release)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CUDA_STANDARD 17)
if(RIM_OPENGL)
add_definitions(-DRIM_OPENGL)
endif()

add_definitions(-DRIM_CUDA)
add_definitions(-DRIM_ROOT="${RIM_ROOT}")

find_package(OpenGL)
find_package(GLUT)
find_package(glfw3)
find_package(GLEW REQUIRED)
find_package(OpenMP REQUIRED)

include_directories("${RIM_ROOT}/include/")
include_directories("${RIM_ROOT}/external/eigen-3.2.10/")
include_directories("${RIM_ROOT}/external/glm-0.9.9.2/")
include_directories("${RIM_ROOT}/external/imgui-1.65/")
include_directories("${RIM_ROOT}/external/json/")
include_directories("${RIM_ROOT}/external/meshoptimizer/")
include_directories("${RIM_ROOT}/external/tinyobjloader/")

enable_language("CUDA")
# set(CMAKE_CUDA_FLAGS "-arch=sm_70 -g -G -O3 --expt-relaxed-constexpr -lcublas")
set(CMAKE_CUDA_ARCHITECTURES 70 89)
# set(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS};--expt-extended-lambda")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} --expt-extended-lambda")
# Warnings suppressed in the lastest Eigen. When using an old version we manually suppress them here.
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=815")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=20011")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=20012")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=20013")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=20014")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=20015")

# Warning created by me
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=177")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=179")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=225")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=550")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=1650")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=832")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=20050")
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -Xcudafe --diag_suppress=20208")

add_subdirectory("src")