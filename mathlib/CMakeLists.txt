cmake_minimum_required(VERSION 3.0)

project(mathlib VERSION 1.0.1)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_library(mathlib SHARED
    src/mathlib.cpp
)
target_include_directories(mathlib
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include/mathlib
)

# Installe la bibliothèque et ses fichiers associés
install(TARGETS mathlib
    EXPORT mathlibTargets       # Crée les fichiers nécessaires pour find_package
    LIBRARY DESTINATION lib     # Bibliothèques dynamiques (.so, .dll)
    ARCHIVE DESTINATION lib     # Bibliothèques statiques (.a, .lib)
    RUNTIME DESTINATION bin     # Exécutables et .dll sous Windows
    INCLUDES DESTINATION include # Où installer les fichiers d'en-tête
)

# Installe les fichiers d'en-tête publics
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/mathlib/
        DESTINATION include/mathlib)
