file(GLOB_RECURSE helpers_cpp_files "./*.cpp")
file(GLOB_RECURSE helpers_cu_files "./*.cu")

set(MESHOPT_DIR "${RIM_ROOT}/external/meshoptimizer")

file(GLOB_RECURSE meshopt_cpp_files "${MESHOPT_DIR}/src/*.cpp")
include_directories("${RIM_ROOT}/external/tinyobjloader")
# include_directories("/home/bjm/physic_sim/RIM_ubuntu/external/tinyobjloader/tiny_obj_loader.h")
include_directories("/home/bjm/physic_sim/RIM_ubuntu/external/tinyobjloader")

add_library(rim_helpers SHARED ${helpers_cpp_files} ${helpers_cu_files} ${meshopt_cpp_files})

target_include_directories(rim_helpers PRIVATE "${RIM_ROOT}/external/tinyobjloader")

target_link_libraries(rim_helpers OpenMP::OpenMP_CXX)
