pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with rosidl_runtime_c_rosidl_runtime_c_string_h;
with rosidl_runtime_c_rosidl_runtime_c_type_description_field_type_ustruct_h;
with stddef_h;

package rosidl_runtime_c_rosidl_runtime_c_type_description_field_ustruct_h is

  -- DO NOT EDIT MANUALLY - this copied file managed by copy_type_description_generated_sources.bash
  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from type_description_interfaces:msg/Field.idl
  -- generated code does not contain a copyright notice
  -- Constants defined in the message
  -- Include directives for member types
  -- Member 'name'
  -- Member 'default_value'
  -- Member 'type'
  --/ Struct defined in msg/Field in the package type_description_interfaces.
  --*
  --  * Represents a single field in a type.
  --  

  --/ Name of the field.
   type rosidl_runtime_c_u_type_description_u_Field is record
      name : aliased rosidl_runtime_c_rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field__struct.h:34
      c_type : aliased rosidl_runtime_c_rosidl_runtime_c_type_description_field_type_ustruct_h.rosidl_runtime_c_u_type_description_u_FieldType;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field__struct.h:36
      default_value : aliased rosidl_runtime_c_rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field__struct.h:39
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field__struct.h:31

  --/ Type of the field, including details about the type like length, nested name, etc.
  --/ Literal default value of the field as a string, as it appeared in the original
  --/ message description file, whether that be .msg/.srv/.action or .idl.
  -- Struct for a sequence of rosidl_runtime_c__type_description__Field.
   type rosidl_runtime_c_u_type_description_u_Field_u_Sequence is record
      data : access rosidl_runtime_c_u_type_description_u_Field;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field__struct.h:45
      size : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field__struct.h:47
      capacity : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field__struct.h:49
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field__struct.h:43

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_runtime_c_rosidl_runtime_c_type_description_field_ustruct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
