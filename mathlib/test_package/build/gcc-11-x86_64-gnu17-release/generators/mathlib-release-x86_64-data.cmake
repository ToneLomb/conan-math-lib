########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

set(mathlib_COMPONENT_NAMES "")
if(DEFINED mathlib_FIND_DEPENDENCY_NAMES)
  list(APPEND mathlib_FIND_DEPENDENCY_NAMES )
  list(REMOVE_DUPLICATES mathlib_FIND_DEPENDENCY_NAMES)
else()
  set(mathlib_FIND_DEPENDENCY_NAMES )
endif()

########### VARIABLES #######################################################################
#############################################################################################
set(mathlib_PACKAGE_FOLDER_RELEASE "/home/tonelomb/.conan2/p/b/mathl10da254219b95/p")
set(mathlib_BUILD_MODULES_PATHS_RELEASE )


set(mathlib_INCLUDE_DIRS_RELEASE "${mathlib_PACKAGE_FOLDER_RELEASE}/include")
set(mathlib_RES_DIRS_RELEASE )
set(mathlib_DEFINITIONS_RELEASE )
set(mathlib_SHARED_LINK_FLAGS_RELEASE )
set(mathlib_EXE_LINK_FLAGS_RELEASE )
set(mathlib_OBJECTS_RELEASE )
set(mathlib_COMPILE_DEFINITIONS_RELEASE )
set(mathlib_COMPILE_OPTIONS_C_RELEASE )
set(mathlib_COMPILE_OPTIONS_CXX_RELEASE )
set(mathlib_LIB_DIRS_RELEASE "${mathlib_PACKAGE_FOLDER_RELEASE}/lib")
set(mathlib_BIN_DIRS_RELEASE "${mathlib_PACKAGE_FOLDER_RELEASE}/bin")
set(mathlib_LIBRARY_TYPE_RELEASE SHARED)
set(mathlib_IS_HOST_WINDOWS_RELEASE 0)
set(mathlib_LIBS_RELEASE mathlib)
set(mathlib_SYSTEM_LIBS_RELEASE )
set(mathlib_FRAMEWORK_DIRS_RELEASE )
set(mathlib_FRAMEWORKS_RELEASE )
set(mathlib_BUILD_DIRS_RELEASE )
set(mathlib_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(mathlib_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${mathlib_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${mathlib_COMPILE_OPTIONS_C_RELEASE}>")
set(mathlib_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${mathlib_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${mathlib_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${mathlib_EXE_LINK_FLAGS_RELEASE}>")


set(mathlib_COMPONENTS_RELEASE )