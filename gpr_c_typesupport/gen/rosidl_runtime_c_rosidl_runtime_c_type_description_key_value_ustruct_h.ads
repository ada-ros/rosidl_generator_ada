pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with rosidl_runtime_c_rosidl_runtime_c_string_h;
with stddef_h;

package rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h is

  -- DO NOT EDIT MANUALLY - this copied file managed by copy_type_description_generated_sources.bash
  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from type_description_interfaces:msg/KeyValue.idl
  -- generated code does not contain a copyright notice
  -- Constants defined in the message
  -- Include directives for member types
  -- Member 'key'
  -- Member 'value'
  --/ Struct defined in msg/KeyValue in the package type_description_interfaces.
  --*
  --  * Represents an arbitrary key-value pair for application-specific information.
  --  

   type rosidl_runtime_c_u_type_description_u_KeyValue is record
      key : aliased rosidl_runtime_c_rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__struct.h:31
      value : aliased rosidl_runtime_c_rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__struct.h:32
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__struct.h:29

  -- Struct for a sequence of rosidl_runtime_c__type_description__KeyValue.
   type rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence is record
      data : access rosidl_runtime_c_u_type_description_u_KeyValue;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__struct.h:38
      size : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__struct.h:40
      capacity : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__struct.h:42
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__struct.h:36

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
