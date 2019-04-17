pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Extensions;
limited with rosidl_generator_c_message_type_support_struct_h;

package std_msgs_msg_multi_array_dimension_urosidl_typesupport_fastrtps_c_h is

  -- generated from
  -- rosidl_typesupport_fastrtps_c/resource/msg__rosidl_typesupport_fastrtps_c.h.em
  -- generated code does not contain a copyright notice
   function get_serialized_size_std_msgs_u_msg_u_MultiArrayDimension (untyped_ros_message : System.Address; current_alignment : stddef_h.size_t) return stddef_h.size_t;  -- /opt/ros/crystal/include/std_msgs/msg/multi_array_dimension__rosidl_typesupport_fastrtps_c.h:21
   pragma Import (C, get_serialized_size_std_msgs_u_msg_u_MultiArrayDimension, "get_serialized_size_std_msgs__msg__MultiArrayDimension");

   function max_serialized_size_std_msgs_u_msg_u_MultiArrayDimension (full_bounded : access Extensions.bool; current_alignment : stddef_h.size_t) return stddef_h.size_t;  -- /opt/ros/crystal/include/std_msgs/msg/multi_array_dimension__rosidl_typesupport_fastrtps_c.h:26
   pragma Import (C, max_serialized_size_std_msgs_u_msg_u_MultiArrayDimension, "max_serialized_size_std_msgs__msg__MultiArrayDimension");

   function rosidl_typesupport_fastrtps_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_MultiArrayDimension return access constant rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/crystal/include/std_msgs/msg/multi_array_dimension__rosidl_typesupport_fastrtps_c.h:32
   pragma Import (C, rosidl_typesupport_fastrtps_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_MultiArrayDimension, "rosidl_typesupport_fastrtps_c__get_message_type_support_handle__std_msgs__msg__MultiArrayDimension");

end std_msgs_msg_multi_array_dimension_urosidl_typesupport_fastrtps_c_h;
