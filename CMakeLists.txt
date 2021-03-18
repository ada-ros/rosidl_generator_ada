cmake_minimum_required(VERSION 3.5)

project(rosidl_generator_ada VERSION 0.1.0)

find_package(rclada_common REQUIRED)

ada_begin_package()

find_package(builtin_interfaces REQUIRED)        # Needed for actions
find_package(rosidl_default_generators REQUIRED) # To register our generator
find_package(rosidl_runtime_c REQUIRED)          # Base string type
# find_package(rosidl_typesupport_c REQUIRED)
# find_package(rosidl_typesupport_interface REQUIRED)
find_package(rosidl_typesupport_introspection_c REQUIRED)
find_package(std_msgs REQUIRED)

# COPIED FROM rosidl_generator_c, not sure it does anything useful in our case
ament_index_register_resource("rosidl_generator_packages")

# Register message generator

install(DIRECTORY cmake
        DESTINATION share/${PROJECT_NAME})
ament_register_extension(
        "rosidl_generate_idl_interfaces"        # extension point
        ${PROJECT_NAME}                         # package name
        "cmake/rosidl_generator_ada_generate_interfaces.cmake")

# Generate import project for rosidl_typesupport_interface/macros.h
# ada_import_c_headers(typesupport_interface ${rosidl_typesupport_interface_INCLUDE_DIRS})

# Generate autobinding for std types and rosidl_typesupport_c
# ada_import_c_libraries(${std_msgs_LIBRARIES})

# Import the std msgs that are used later by the rosidl high-level binding.
# This dependency should probably be eliminated, it also introduces a
# circularity that will probably preclude building our rclada ros packages
# simultaneously with the rest of ros2.
ada_import_interfaces(std_msgs)

# GENERATOR packages have been moved into RUNTIME packages at the C RCL, to
# allow applications not to depend on generators. It seems we can also get by
# by using the runtime versions. This happened with FOXY.

# See https://github.com/ros2/rosidl/issues/446
# And also https://index.ros.org/doc/ros2/Releases/Release-Foxy-Fitzroy/#new-features-in-this-ros-2-release

ada_find_package_include_dir(_builtin_include ${builtin_interfaces_DIR})
# ada_find_package_include_dir(_generator_include ${rosidl_generator_c_DIR})
ada_find_package_include_dir(_runtime_include ${rosidl_runtime_c_DIR})
ada_find_package_include_dir(_stdmsgs_include ${std_msgs_DIR})
#ada_find_package_include_dir(_typesupport_interface_include ${rosidl_typesupport_interface_DIR})
ada_find_package_include_dir(_typesupport_introspection_include ${rosidl_typesupport_introspection_c_DIR})

file(GLOB _headers
        "${_builtin_include}/builtin_interfaces/msg/*.h"
        "${_builtin_include}/builtin_interfaces/msg/detail/*.h"
        "${_runtime_include}/rosidl_runtime_c/*.h"
#        "${_stdmsgs_include}/std_msgs/msg/*.h"
        "${_stdmsgs_include}/std_msgs/msg/detail/multi_array*.h" # This should suffice
#        "${_stdmsgs_include}/std_msgs/msg/detail/string*.h" # This should suffice
        "${_typesupport_introspection_include}/rosidl_typesupport_introspection_c/*.h"
        # CUSTOM ADDITIONS
        /usr/include/stdint.h
        )

list(APPEND _includes
        ${_builtin_include}
        ${_runtime_include}
        ${_stdmsgs_include}
#        ${_typesupport_interface_include}
        ${_typesupport_introspection_include})

ada_generate_binding(
        ada_binding_rosidl_typesupport_c
        gpr_c_typesupport
        c_typesupport.gpr
        "${_includes}"
        ${_headers})

ada_add_library(ada_dl gpr_rosidl/dl-ada dl.gpr)

ada_add_library(ada_rosidl gpr_rosidl rosidl.gpr)
add_dependencies(ada_rosidl ada_dl ada_binding_rosidl_typesupport_c)

# Add the generator project with its dependency
ada_add_executables(
        ada_generator # target
        gpr_generator # folder
        bin           # outdir
        rosidl_ada_generator # exe name
        )
add_dependencies(ada_generator ada_rosidl)

ada_end_package()
