cmake_minimum_required(VERSION 3.26.0)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/stm32_gcc.cmake)

project(Example0 C CXX ASM)


set(STARTUP_SRC 
${CMAKE_CURRENT_SOURCE_DIR}/startup_stm32f302r8tx.s 
${CMAKE_CURRENT_SOURCE_DIR}/syscalls.c 
${CMAKE_CURRENT_SOURCE_DIR}/sysmem.c
)

add_library(Startup ${STARTUP_SRC})

set_property(GLOBAL PROPERTY ST7735S_LINK_OPTIONS "${LINKER_FLAGS}")        # these two lines are needed to compile for stm32!
set_property(GLOBAL PROPERTY ST7735S_COMPILE_OPTIONS "${COMPILE_FLAGS}")

add_subdirectory(External/ST7735S_LIB)

add_library(Driver driver.c)   # this lib you should create providing functions marked as extern in st7735s_config.h (see README)

add_executable(${PROJECT_NAME} main.c)

target_link_options(${PROJECT_NAME} PRIVATE ${LINKER_FLAGS})
target_link_options(Startup PRIVATE ${LINKER_FLAGS})
target_link_options(Driver PRIVATE ${LINKER_FLAGS})

target_compile_options(${PROJECT_NAME} PRIVATE ${COMPILE_FLAGS})
target_compile_options(Startup PRIVATE ${COMPILE_FLAGS})
target_compile_options(Driver PRIVATE ${COMPILE_FLAGS})

target_link_libraries(${PROJECT_NAME} Startup)
target_link_libraries(${PROJECT_NAME} ST7735S)

target_include_directories(${PROJECT_NAME} PRIVATE External/ST7735S_LIB)
target_include_directories(Driver PRIVATE External/ST7735S_LIB)

target_link_libraries(ST7735S Driver)