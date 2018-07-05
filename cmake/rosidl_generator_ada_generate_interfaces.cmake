message(STATUS "ADA GENERATOR: ${rosidl_generate_interfaces_IDL_FILES}")

# Configure the file that links in all C typesupport
ada_import_msgs(${PROJECT_NAME})