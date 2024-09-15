pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with rosidl_runtime_c_rosidl_runtime_c_string_h;
with stddef_h;

package rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h is

  -- DO NOT EDIT MANUALLY - this copied file managed by copy_type_description_generated_sources.bash
  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from type_description_interfaces:msg/TypeSource.idl
  -- generated code does not contain a copyright notice
  -- Constants defined in the message
  -- Include directives for member types
  -- Member 'type_name'
  -- Member 'encoding'
  -- Member 'raw_file_contents'
  --/ Struct defined in msg/TypeSource in the package type_description_interfaces.
  --*
  --  * Represents the original source of a ROS 2 interface definition.
  --  

  --/ ROS interface type name, in PACKAGE/NAMESPACE/TYPENAME format.
   type rosidl_runtime_c_u_type_description_u_TypeSource is record
      type_name : aliased rosidl_runtime_c_rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_source__struct.h:33
      encoding : aliased rosidl_runtime_c_rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_source__struct.h:40
      raw_file_contents : aliased rosidl_runtime_c_rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_source__struct.h:43
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_source__struct.h:30

  --/ The type of the original source file, typically matching the file extension.
  --/ Well-known encodings: "idl", "msg", "srv", "action", "dynamic", "implicit".
  --/ "dynamic" specifies a type created programmatically by a user, thus having no source.
  --/ "implicit" specifies a type created automatically as a subtype of a
  --/ complex type (service or action) - such as the request message for a service.
  --/ Implicit types will have no contents, the full source will be available on the parent srv/action.
  --/ Dumped contents of the interface definition source file.
  --/ If `encoding` is "dynamic" or "implicit", this field will be empty.
  -- Struct for a sequence of rosidl_runtime_c__type_description__TypeSource.
   type rosidl_runtime_c_u_type_description_u_TypeSource_u_Sequence is record
      data : access rosidl_runtime_c_u_type_description_u_TypeSource;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_source__struct.h:49
      size : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_source__struct.h:51
      capacity : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_source__struct.h:53
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_source__struct.h:47

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
