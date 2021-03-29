cmake_minimum_required(VERSION 3.5)

project(rosidl_generator_ada VERSION 0.1.0)

find_package(rclada_common REQUIRED)

ada_begin_package()

find_package(builtin_interfaces REQUIRED)        # Needed for actions
find_package(rosidl_default_generators REQUIRED) # To register our generator
find_package(rosidl_runtime_c REQUIRED)          # Base string type
find_package(rosidl_typesupport_introspection_c REQUIRED) # We rely heavily on introspection features
find_package(std_msgs REQUIRED) # For the multiarrays. We use this in the dynamic binding,
                                # but since this is deprecated by ROS2, it could conceivably
                                # be removed at some point

# COPIED FROM rosidl_generator_c, not sure it does anything useful in our case
ament_index_register_resource("rosidl_generator_packages")

# Register message generator

install(DIRECTORY cmake
        DESTINATION share/${PROJECT_NAME})
ament_register_extension(
        "rosidl_generate_idl_interfaces"        # extension point
        ${PROJECT_NAME}                         # package name
        "cmake/rosidl_generator_ada_generate_interfaces.cmake")

# Import the standard ROS2 string headers
ada_import_c_libraries(${rosidl_runtime_c_LIBRARIES})

ada_find_package_include_dir(_builtin_include ${builtin_interfaces_DIR})
ada_find_package_include_dir(_runtime_include ${rosidl_runtime_c_DIR})
ada_find_package_include_dir(_stdmsgs_include ${std_msgs_DIR})
ada_find_package_include_dir(_typesupport_introspection_include ${rosidl_typesupport_introspection_c_DIR})

file(GLOB _headers
        "${_builtin_include}/builtin_interfaces/msg/*.h"
        "${_builtin_include}/builtin_interfaces/msg/detail/*.h"
        "${_runtime_include}/rosidl_runtime_c/*.h"
        "${_stdmsgs_include}/std_msgs/msg/detail/multi_array*.h" # This should suffice
        "${_typesupport_introspection_include}/rosidl_typesupport_introspection_c/*.h"
        # CUSTOM ADDITIONS
        /usr/include/stdint.h
        )

# Paths where the headers we need are located
list(APPEND _includes
        ${_builtin_include}
        ${_runtime_include}
        ${_stdmsgs_include}
        ${_typesupport_introspection_include})

# Minimal headers we need for our binding
ada_generate_binding(
        ada_binding_rosidl_typesupport_c
        gpr_c_typesupport
        c_typesupport.gpr
        "${_includes}"
        ${_headers})

ada_add_library(ada_dl gpr_rosidl/dl-ada dl.gpr)

ada_add_library(ada_rosidl gpr_rosidl rosidl.gpr)
add_dependencies(ada_rosidl
        ada_dl
        ada_binding_rosidl_typesupport_c)

# Add the generator project with its dependency
ada_add_executables(
        ada_generator # target
        gpr_generator # folder
        bin           # outdir
        rosidl_ada_generator # exe name
        )
add_dependencies(ada_generator
        ada_rosidl)

ada_end_package()
