#include "ament_index_cpp/get_resources.hpp"
#include "ament_index_cpp/get_package_prefix.hpp"
#include <cstring>
#include <iostream>
#include <string>

//  Returns the library name up to the __ part, e.g.:
//  /opt/ros/foxy/lib/libbuiltin_interfaces__
//  Then you can append the part you want:
//  /opt/ros/foxy/lib/libbuiltin_interfaces__rosidl_typesupport_c.so or whatever
std::string get_typesupport_library_path(const std::string & package_name)
{
  try {
    const char * filename_prefix;
    const char * filename_extension;
    const char * dynamic_library_folder;

    filename_prefix = "lib";
    filename_extension = ".so";
    dynamic_library_folder = "/lib/";

    std::string package_prefix;
    try {
      package_prefix = ament_index_cpp::get_package_prefix(package_name);
    } catch (ament_index_cpp::PackageNotFoundError & e) {
      std::cerr << "ERROR: could not find package at rosidl_ada::ament_query "
                << package_name << ": " << e.what() << std::endl;
      return "";
    }

    auto library_path = package_prefix + dynamic_library_folder + filename_prefix +
    package_name + "__";

    return library_path;
  } catch (std::exception & e) {
    std::cerr << "ERROR: unexpected at rosidl_ada::ament_query: "
              << e.what() << std::endl;
    return "";
  }
}

extern "C" {
  //  Caller has to free the memory
  const char * rosidl_ada_find_support_lib(const char * package_name)
  {
    auto loc = get_typesupport_library_path(package_name);

    if (loc == "")
      return NULL;

    char * dst = (char*)malloc(loc.size() + 1);
    strcpy(dst, loc.c_str());
    return dst;
  }
}
