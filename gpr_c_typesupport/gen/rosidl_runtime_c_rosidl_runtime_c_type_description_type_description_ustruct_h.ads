pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h;
with stddef_h;

package rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h is

  -- DO NOT EDIT MANUALLY - this copied file managed by copy_type_description_generated_sources.bash
  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from type_description_interfaces:msg/TypeDescription.idl
  -- generated code does not contain a copyright notice
  -- Constants defined in the message
  -- Include directives for member types
  -- Member 'type_description'
  -- Member 'referenced_type_descriptions'
  --/ Struct defined in msg/TypeDescription in the package type_description_interfaces.
  --*
  --  * Represents a complete type description, including the type itself as well as the types it references.
  --  

  --/ Description of the type.
   type rosidl_runtime_c_u_type_description_u_TypeDescription is record
      type_description : aliased rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_description__struct.h:32
      referenced_type_descriptions : aliased rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription_u_Sequence;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_description__struct.h:34
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_description__struct.h:29

  --/ Descriptions of all referenced types, recursively.
  -- Struct for a sequence of rosidl_runtime_c__type_description__TypeDescription.
   type rosidl_runtime_c_u_type_description_u_TypeDescription_u_Sequence is record
      data : access rosidl_runtime_c_u_type_description_u_TypeDescription;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_description__struct.h:40
      size : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_description__struct.h:42
      capacity : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_description__struct.h:44
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/type_description__struct.h:38

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
