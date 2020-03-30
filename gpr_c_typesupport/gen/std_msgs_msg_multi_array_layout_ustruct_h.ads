pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with std_msgs_msg_multi_array_dimension_ustruct_h;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with stddef_h;

package std_msgs_msg_multi_array_layout_ustruct_h is

  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from std_msgs:msg/MultiArrayLayout.idl
  -- generated code does not contain a copyright notice
  -- Constants defined in the message
  -- Include directives for member types
  -- Member 'dim'
  -- Struct defined in msg/MultiArrayLayout in the package std_msgs.
   type std_msgs_u_msg_u_MultiArrayLayout is record
      dim : aliased std_msgs_msg_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension_u_Sequence;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__struct.h:27
      data_offset : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__struct.h:28
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_MultiArrayLayout);  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__struct.h:25

  -- Struct for a sequence of std_msgs__msg__MultiArrayLayout.
   type std_msgs_u_msg_u_MultiArrayLayout_u_Sequence is record
      data : access std_msgs_u_msg_u_MultiArrayLayout;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__struct.h:34
      size : aliased stddef_h.size_t;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__struct.h:36
      capacity : aliased stddef_h.size_t;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__struct.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_MultiArrayLayout_u_Sequence);  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__struct.h:32

  --/ The number of valid items in data
  --/ The number of allocated items in data
end std_msgs_msg_multi_array_layout_ustruct_h;
