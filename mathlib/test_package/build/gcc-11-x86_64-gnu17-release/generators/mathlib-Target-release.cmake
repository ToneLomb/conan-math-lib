# Avoid multiple calls to find_package to append duplicated properties to the targets
include_guard()########### VARIABLES #######################################################################
#############################################################################################
set(mathlib_FRAMEWORKS_FOUND_RELEASE "") # Will be filled later
conan_find_apple_frameworks(mathlib_FRAMEWORKS_FOUND_RELEASE "${mathlib_FRAMEWORKS_RELEASE}" "${mathlib_FRAMEWORK_DIRS_RELEASE}")

set(mathlib_LIBRARIES_TARGETS "") # Will be filled later


######## Create an interface target to contain all the dependencies (frameworks, system and conan deps)
if(NOT TARGET mathlib_DEPS_TARGET)
    add_library(mathlib_DEPS_TARGET INTERFACE IMPORTED)
endif()

set_property(TARGET mathlib_DEPS_TARGET
             APPEND PROPERTY INTERFACE_LINK_LIBRARIES
             $<$<CONFIG:Release>:${mathlib_FRAMEWORKS_FOUND_RELEASE}>
             $<$<CONFIG:Release>:${mathlib_SYSTEM_LIBS_RELEASE}>
             $<$<CONFIG:Release>:>)

####### Find the libraries declared in cpp_info.libs, create an IMPORTED target for each one and link the
####### mathlib_DEPS_TARGET to all of them
conan_package_library_targets("${mathlib_LIBS_RELEASE}"    # libraries
                              "${mathlib_LIB_DIRS_RELEASE}" # package_libdir
                              "${mathlib_BIN_DIRS_RELEASE}" # package_bindir
                              "${mathlib_LIBRARY_TYPE_RELEASE}"
                              "${mathlib_IS_HOST_WINDOWS_RELEASE}"
                              mathlib_DEPS_TARGET
                              mathlib_LIBRARIES_TARGETS  # out_libraries_targets
                              "_RELEASE"
                              "mathlib"    # package_name
                              "${mathlib_NO_SONAME_MODE_RELEASE}")  # soname

# FIXME: What is the result of this for multi-config? All configs adding themselves to path?
set(CMAKE_MODULE_PATH ${mathlib_BUILD_DIRS_RELEASE} ${CMAKE_MODULE_PATH})

########## GLOBAL TARGET PROPERTIES Release ########################################
    set_property(TARGET mathlib::mathlib
                 APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                 $<$<CONFIG:Release>:${mathlib_OBJECTS_RELEASE}>
                 $<$<CONFIG:Release>:${mathlib_LIBRARIES_TARGETS}>
                 )

    if("${mathlib_LIBS_RELEASE}" STREQUAL "")
        # If the package is not declaring any "cpp_info.libs" the package deps, system libs,
        # frameworks etc are not linked to the imported targets and we need to do it to the
        # global target
        set_property(TARGET mathlib::mathlib
                     APPEND PROPERTY INTERFACE_LINK_LIBRARIES
                     mathlib_DEPS_TARGET)
    endif()

    set_property(TARGET mathlib::mathlib
                 APPEND PROPERTY INTERFACE_LINK_OPTIONS
                 $<$<CONFIG:Release>:${mathlib_LINKER_FLAGS_RELEASE}>)
    set_property(TARGET mathlib::mathlib
                 APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
                 $<$<CONFIG:Release>:${mathlib_INCLUDE_DIRS_RELEASE}>)
    # Necessary to find LINK shared libraries in Linux
    set_property(TARGET mathlib::mathlib
                 APPEND PROPERTY INTERFACE_LINK_DIRECTORIES
                 $<$<CONFIG:Release>:${mathlib_LIB_DIRS_RELEASE}>)
    set_property(TARGET mathlib::mathlib
                 APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
                 $<$<CONFIG:Release>:${mathlib_COMPILE_DEFINITIONS_RELEASE}>)
    set_property(TARGET mathlib::mathlib
                 APPEND PROPERTY INTERFACE_COMPILE_OPTIONS
                 $<$<CONFIG:Release>:${mathlib_COMPILE_OPTIONS_RELEASE}>)

########## For the modules (FindXXX)
set(mathlib_LIBRARIES_RELEASE mathlib::mathlib)
