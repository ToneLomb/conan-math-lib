########## MACROS ###########################################################################
#############################################################################################

# Requires CMake > 3.15
if(${CMAKE_VERSION} VERSION_LESS "3.15")
    message(FATAL_ERROR "The 'CMakeDeps' generator only works with CMake >= 3.15")
endif()

if(mathlib_FIND_QUIETLY)
    set(mathlib_MESSAGE_MODE VERBOSE)
else()
    set(mathlib_MESSAGE_MODE STATUS)
endif()

include(${CMAKE_CURRENT_LIST_DIR}/cmakedeps_macros.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/mathlibTargets.cmake)
include(CMakeFindDependencyMacro)

check_build_type_defined()

foreach(_DEPENDENCY ${mathlib_FIND_DEPENDENCY_NAMES} )
    # Check that we have not already called a find_package with the transitive dependency
    if(NOT ${_DEPENDENCY}_FOUND)
        find_dependency(${_DEPENDENCY} REQUIRED ${${_DEPENDENCY}_FIND_MODE})
    endif()
endforeach()

set(mathlib_VERSION_STRING "1.0.1")
set(mathlib_INCLUDE_DIRS ${mathlib_INCLUDE_DIRS_RELEASE} )
set(mathlib_INCLUDE_DIR ${mathlib_INCLUDE_DIRS_RELEASE} )
set(mathlib_LIBRARIES ${mathlib_LIBRARIES_RELEASE} )
set(mathlib_DEFINITIONS ${mathlib_DEFINITIONS_RELEASE} )


# Only the last installed configuration BUILD_MODULES are included to avoid the collision
foreach(_BUILD_MODULE ${mathlib_BUILD_MODULES_PATHS_RELEASE} )
    message(${mathlib_MESSAGE_MODE} "Conan: Including build module from '${_BUILD_MODULE}'")
    include(${_BUILD_MODULE})
endforeach()


