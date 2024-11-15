add_subdirectory("cuda")
add_subdirectory("dynamics")
add_subdirectory("gui")
add_subdirectory("helpers")
add_subdirectory("immersed")
add_subdirectory("managers")

add_executable(main "./main.cu" "./common.cu")
target_link_libraries(main rim_helpers rim_gui rim_managers rim_immersed rim_dynamics OpenMP::OpenMP_CXX glfw OpenGL::GL GLEW::GLEW ${CUDA_LIBRARIES})