file(GLOB_RECURSE gui_cpp_files "./*.cpp")
file(GLOB_RECURSE gui_cu_files "./*.cu")

# set(Imgui_Include_Dir "${FLUID_ROOT}/external/imgui-1.65")
# # set(FreeImage_LIBRARY "${FLUID_ROOT}/external/FreeImage-CMake/FreeImage/build")

# find_path(Imgui_Include_Dir imgui.h)
# find_library(SIFTGPU_LIBRARY imgui)
# # find_library(SIFTGPU_LIBRARY freeimage)
# include_directories(${Imgui_Include_Dir})

set(IMGUI_DIR ${RIM_ROOT}/external/imgui-1.65)

# add_library(imgui STATIC
#     ${IMGUI_DIR}/imgui.cpp
#     ${IMGUI_DIR}/imgui_draw.cpp
#     ${IMGUI_DIR}/imgui_widgets.cpp
# )

# # Path to the source directory of ImGui
# set(IMGUI_SOURCE_DIR "/home/bjm/physic_sim/RIM_ubuntu/external/imgui-1.65")

# # Path to the binary directory (choose a build directory where CMake can generate files)
# set(IMGUI_BINARY_DIR "/home/bjm/physic_sim/RIM_ubuntu/build/imgui")

# # Create the binary directory if it doesn't exist
# file(MAKE_DIRECTORY ${IMGUI_BINARY_DIR})

# # Add ImGui as a subdirectory with the source and binary directories
# add_subdirectory(${IMGUI_SOURCE_DIR} ${IMGUI_BINARY_DIR})

# add_library(rim_gui SHARED ${gui_cpp_files} ${gui_cu_files})

add_library(rim_gui SHARED ${gui_cpp_files} ${gui_cu_files} 
            ${IMGUI_DIR}/imgui.cpp
            ${IMGUI_DIR}/imgui_widgets.cpp
            ${IMGUI_DIR}/imgui_impl_opengl3.cpp
            ${IMGUI_DIR}/imgui_impl_glfw.cpp
            ${IMGUI_DIR}/imgui_draw.cpp
            ${IMGUI_DIR}/imgui_demo.cpp)

target_link_libraries(rim_gui OpenMP::OpenMP_CXX rim_managers)