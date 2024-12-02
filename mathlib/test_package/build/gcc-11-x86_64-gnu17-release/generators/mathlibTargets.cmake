# Load the debug and release variables
file(GLOB DATA_FILES "${CMAKE_CURRENT_LIST_DIR}/mathlib-*-data.cmake")

foreach(f ${DATA_FILES})
    include(${f})
endforeach()

# Create the targets for all the components
foreach(_COMPONENT ${mathlib_COMPONENT_NAMES} )
    if(NOT TARGET ${_COMPONENT})
        add_library(${_COMPONENT} INTERFACE IMPORTED)
        message(${mathlib_MESSAGE_MODE} "Conan: Component target declared '${_COMPONENT}'")
    endif()
endforeach()

if(NOT TARGET mathlib::mathlib)
    add_library(mathlib::mathlib INTERFACE IMPORTED)
    message(${mathlib_MESSAGE_MODE} "Conan: Target declared 'mathlib::mathlib'")
endif()
# Load the debug and release library finders
file(GLOB CONFIG_FILES "${CMAKE_CURRENT_LIST_DIR}/mathlib-Target-*.cmake")

foreach(f ${CONFIG_FILES})
    include(${f})
endforeach()