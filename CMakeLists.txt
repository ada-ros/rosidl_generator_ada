cmake_minimum_required(VERSION 3.5)

project(rosidl_generator_ada)

set(${PROJECT_NAME}_MAJOR_VERSION 0)
set(${PROJECT_NAME}_MINOR_VERSION 1)
set(${PROJECT_NAME}_PATCH_VERSION 0)
set(${PROJECT_NAME}_VERSION
        ${${PROJECT_NAME}_MAJOR_VERSION}.${${PROJECT_NAME}_MINOR_VERSION}.${${PROJECT_NAME}_PATCH_VERSION})
set(PROJECT_VERSION ${${PROJECT_NAME}_VERSION})

message(" ")
message("${PROJECT_NAME} version ${PROJECT_VERSION}")

if(BUILD_TESTING)
    # Silence a warning (?)
endif()

find_package(builtin_interfaces REQUIRED)
find_package(rosidl_generator_c REQUIRED)
find_package(rosidl_typesupport_introspection_c REQUIRED)
find_package(rosidl_generator_c REQUIRED)
find_package(std_msgs REQUIRED)

find_package(rclada_common REQUIRED)


# Generate autobinding for std types and rosidl_typesupport_c
ada_import_c_libraries(${std_msgs_LIBRARIES})

ada_find_package_include_dir(_builtin_include ${builtin_interfaces_DIR})
ada_find_package_include_dir(_generator_include ${rosidl_generator_c_DIR})
ada_find_package_include_dir(_stdmsgs_include ${std_msgs_DIR})
ada_find_package_include_dir(_introspection_include ${rosidl_typesupport_introspection_c_DIR})

file(GLOB _headers
        "${_builtin_include}/builtin_interfaces/msg/*.h"
        "${_stdmsgs_include}/std_msgs/msg/*.h"
        "${_generator_include}/rosidl_generator_c/*.h"
        "${_introspection_include}/rosidl_typesupport_introspection_c/*.h")

set(_includes "${_builtin_include};${_stdmsgs_include};${_generator_include};${_introspection_include}")

ada_generate_binding(
        ada_binding_rosidl_typesupport_c
        gpr_c_typesupport
        "${_includes}"
        ${_headers})

# Compile & install the high-level rosidl binding and its deps
ada_add_library(ada_dl gpr_rosidl/dl-ada)
ada_add_library(ada_rosidl gpr_rosidl)

add_dependencies(ada_rosidl ada_binding_rosidl_typesupport_c)

# Export package
ada_export_package()

#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#    message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
