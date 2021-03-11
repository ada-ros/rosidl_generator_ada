message("ADA GENERATOR files: ${rosidl_generate_interfaces_ABS_IDL_FILES}")
message("ADA GENERATOR tuples: ${rosidl_generate_interfaces_IDL_TUPLES}")

# Configure the file that links in all C typesupport
ada_import_msgs(${PROJECT_NAME})

# Gather all the stuff the generator will need

# Add a target for the generator with the arguments
add_custom_command(
  OUTPUT /tmp/asdf.out
  COMMAND echo RUNNING ADA GENERATOR  
  COMMAND touch /tmp/asdf.out
  COMMAND rosidl_ada_generator
  DEPENDS ada_generator
  COMMENT "Generating Ada code for ROS interfaces"
  VERBATIM
)

# Add a target for its library project
# ada_add_library(
#    asdf_lib                    # target
#    rosidl_generator_ada        # folder
#    rosidl.gpr                  # project
#)

add_custom_target(asdf_lib ALL
    COMMENT "Custom target for ADA GENERATOR"
    DEPENDS /tmp/asdf.out
    VERBATIM
)

# Make the library project depend on the generated gpr file
# add_dependencies(asdf_lib /tmp/asdf.out)

# VITAL INFORMATION ON HOW TRULY BORKED ALL OF THIS IS:
# https://samthursfield.wordpress.com/2015/11/21/cmake-dependencies-between-targets-and-files-and-custom-commands/