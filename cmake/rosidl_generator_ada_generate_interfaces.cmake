# message("ADA GENERATOR files: ${rosidl_generate_interfaces_ABS_IDL_FILES}")
# message("ADA GENERATOR tuples: ${rosidl_generate_interfaces_IDL_TUPLES}")

set(_output_path "${CMAKE_CURRENT_BINARY_DIR}/rosidl_generator_c/${PROJECT_NAME}")
set(_generated_gpr "") # Files we intend to generate, to use them as dependencies

# Configure the file that links in all C typesupport
ada_import_msgs(${PROJECT_NAME})

# Gather all the stuff the generator will need

# Identify packages and interfaces, to recreate the project file we will generate
foreach(_abs_idl_file ${rosidl_generate_interfaces_ABS_IDL_FILES})
  get_filename_component(_parent_folder "${_abs_idl_file}" DIRECTORY) # Containing folder (msg/srv/action)
  get_filename_component(_iface_kind "${_parent_folder}" NAME)        # msg/src/action
  get_filename_component(_parent_folder "${_parent_folder}" NAME)     # Package, with path
  get_filename_component(_idl_name "${_abs_idl_file}" NAME_WE)        # The actual interface name

  # string_camel_case_to_lower_case_underscore("${_idl_name}" _header_name) # Name used for files -> SensorScan -> sensor_scan

  list(APPEND _generated_gpr "${_output_path}/${_parent_folder}/rosidl_static_${_iface_kind}_${_idl_name}")
endforeach()

# Add a target for the generator with the arguments
add_custom_command(
  OUTPUT ${_generated_gpr}
  COMMAND echo "Running Ada generator"
  COMMAND touch /tmp/asdf.out
  COMMAND rosidl_ada_generator ${rosidl_generate_interfaces_ABS_IDL_FILES}
  DEPENDS ada_generator
  COMMENT "Generating Ada code for ROS interfaces"
  VERBATIM
)

# Avoid multiple generations by grouping the generator command under a common custom target
add_custom_target(generated_ada_ifaces ALL
    COMMENT "Custom target for ADA GENERATOR"
    DEPENDS ${_generated_gpr}
    VERBATIM
)

# Add a target for each library project
foreach(_abs_idl_file ${rosidl_generate_interfaces_ABS_IDL_FILES})
  get_filename_component(_parent_folder "${_abs_idl_file}" DIRECTORY) # Containing folder (msg/srv/action)
  get_filename_component(_iface_kind "${_parent_folder}" NAME)        # msg/src/action
  get_filename_component(_parent_folder "${_parent_folder}" NAME)     # Package, with path
  get_filename_component(_idl_name "${_abs_idl_file}" NAME_WE)        # The actual interface name
  set(_target_lib "rosidl_static_${_iface_kind}_${_idl_name}")

  # Until we have the generated libraries, do nothing

  # Build the library for each interface
  #ada_add_library(
  #  ${_target_lib}              # target
  #  rosidl_generator_ada        # folder
  #  rosidl.gpr                  # project
  #)  

  # That depends on the generated files
  # add_dependencies(${_target_lib} generated_ada_ifaces)  
endforeach()

# VITAL INFORMATION ON HOW TRULY BORKED ALL OF THIS IS:
# https://samthursfield.wordpress.com/2015/11/21/cmake-dependencies-between-targets-and-files-and-custom-commands/