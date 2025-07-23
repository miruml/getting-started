cmake_minimum_required(VERSION 3.16)
project(miru-sdk-example)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# use FetchContent to download and build miru
set(MIRU_FETCH_BOOST ON)
set(MIRU_BUILD_TESTS OFF)
set(MIRU_BUILD_EXAMPLES OFF)

execute_process(
    COMMAND git rev-parse --abbrev-ref HEAD
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE CURRENT_BRANCH
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

message(STATUS "Building with Miru C++ SDK branch: ${CURRENT_BRANCH}")

include(FetchContent)
FetchContent_Declare(
    miru
    GIT_REPOSITORY https://github.com/miruml/cpp-sdk.git 
    GIT_TAG ${CURRENT_BRANCH} # replace with desired tag/branch/commit
    GIT_SUBMODULES "" # disable submodule cloning since the openapi repository inside the cpp-sdk repository is private
)
FetchContent_MakeAvailable(miru)

# build the examples copied from the miru repository
add_subdirectory(examples)