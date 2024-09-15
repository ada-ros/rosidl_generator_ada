pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with rosidl_runtime_c_rosidl_runtime_c_string_h;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with stddef_h;

package std_msgs_std_msgs_msg_detail_multi_array_dimension_ustruct_h is

  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from std_msgs:msg/MultiArrayDimension.idl
  -- generated code does not contain a copyright notice
  -- IWYU pragma: private, include "std_msgs/msg/multi_array_dimension.h"
  -- Constants defined in the message
  -- Include directives for member types
  -- Member 'label'
  --/ Struct defined in msg/MultiArrayDimension in the package std_msgs.
  --*
  --  * This was originally provided as an example message.
  --  * It is deprecated as of Foxy
  --  * It is recommended to create your own semantically meaningful message.
  --  * However if you would like to continue using this please use the equivalent in example_msgs.
  --  

  --/ label of given dimension
   type std_msgs_u_msg_u_MultiArrayDimension is record
      label : aliased rosidl_runtime_c_rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_dimension__struct.h:36
      size : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_dimension__struct.h:38
      stride : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_dimension__struct.h:40
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_dimension__struct.h:33

  --/ size of given dimension (in type units)
  --/ stride of given dimension
  -- Struct for a sequence of std_msgs__msg__MultiArrayDimension.
   type std_msgs_u_msg_u_MultiArrayDimension_u_Sequence is record
      data : access std_msgs_u_msg_u_MultiArrayDimension;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_dimension__struct.h:46
      size : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_dimension__struct.h:48
      capacity : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_dimension__struct.h:50
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_dimension__struct.h:44

  --/ The number of valid items in data
  --/ The number of allocated items in data
end std_msgs_std_msgs_msg_detail_multi_array_dimension_ustruct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
