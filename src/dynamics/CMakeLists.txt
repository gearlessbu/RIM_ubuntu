file(GLOB_RECURSE dynamics_cpp_files "./*.cpp")
file(GLOB_RECURSE dynamics_cu_files "./*.cu")

add_library(rim_dynamics SHARED ${dynamics_cpp_files} ${dynamics_cu_files})

target_link_libraries(rim_dynamics OpenMP::OpenMP_CXX)