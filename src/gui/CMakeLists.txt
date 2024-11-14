file(GLOB_RECURSE gui_cpp_files "./*.cpp")
file(GLOB_RECURSE gui_cu_files "./*.cu")

add_library(rim_gui SHARED ${gui_cpp_files} ${gui_cu_files})

target_link_libraries(rim_gui OpenMP::OpenMP_CXX rim_managers)