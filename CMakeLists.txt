cmake_minimum_required(VERSION 3.5)

project(rosidl_generator_ada VERSION 0.1.0)

find_package(rclada_common REQUIRED)

ada_begin_package()

find_package(builtin_interfaces REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(rosidl_generator_c REQUIRED)
# find_package(rosidl_runtime_c REQUIRED)
find_package(rosidl_typesupport_interface REQUIRED)
find_package(rosidl_typesupport_introspection_c REQUIRED)
find_package(std_msgs REQUIRED)

# Register message generator
install(DIRECTORY cmake
        DESTINATION share/${PROJECT_NAME})
ament_register_extension(
        "rosidl_generate_idl_interfaces"
        "rosidl_generator_ada"
        "${PROJECT_SOURCE_DIR}/cmake/rosidl_generator_ada_generate_interfaces.cmake")

# message("XXXXXXXXXXXXXX ${rosidl_typesupport_interface_INCLUDE_DIRS}")

# Generate import project for rosidl_typesupport_interface/macros.h
ada_import_c_headers(typesupport_interface ${rosidl_typesupport_interface_INCLUDE_DIRS})

# Generate autobinding for std types and rosidl_typesupport_c
ada_import_c_libraries(${std_msgs_LIBRARIES})

ada_find_package_include_dir(_builtin_include ${builtin_interfaces_DIR})
ada_find_package_include_dir(_generator_include ${rosidl_generator_c_DIR})
#ada_find_package_include_dir(_runtime_include ${rosidl_runtime_c_DIR})
ada_find_package_include_dir(_stdmsgs_include ${std_msgs_DIR})
ada_find_package_include_dir(_typesupport_interface_include ${rosidl_typesupport_interface_DIR})
ada_find_package_include_dir(_typesupport_introspection_include ${rosidl_typesupport_introspection_c_DIR})

file(GLOB _headers
        "${_builtin_include}/builtin_interfaces/msg/*.h"
        "${_generator_include}/rosidl_generator_c/*.h"
#        "${_stdmsgs_include}/std_msgs/msg/*.h"
        "${_stdmsgs_include}/std_msgs/msg/multi_array*.h" # This should suffice
        "${_stdmsgs_include}/std_msgs/msg/string*.h" # This should suffice
        "${_typesupport_introspection_include}/rosidl_typesupport_introspection_c/*.h"
        # CUSTOM ADDITIONS
        /usr/include/stdint.h
        )

list(APPEND _includes
        ${_builtin_include}
        ${_generator_include}
#        ${_runtime_include}
        ${_stdmsgs_include}
        ${_typesupport_interface_include}
        ${_typesupport_introspection_include})

ada_generate_binding(
        ada_binding_rosidl_typesupport_c
        gpr_c_typesupport
        c_typesupport.gpr
        "${_includes}"
        ${_headers})

# Compile & install the high-level rosidl binding and its deps
ada_add_library(cstrings gpr_rosidl/dl-ada/cstrings c_strings.gpr)

ada_add_library(ada_dl gpr_rosidl/dl-ada dl.gpr)
add_dependencies(ada_dl cstrings)

ada_add_library(ada_rosidl gpr_rosidl rosidl.gpr)
add_dependencies(ada_rosidl ada_dl ada_binding_rosidl_typesupport_c)

# Generations of test messages
rosidl_generate_interfaces(${PROJECT_NAME}
        msg/Test.msg
        srv/Test.srv
        DEPENDENCIES std_msgs
        )

ada_end_package()
