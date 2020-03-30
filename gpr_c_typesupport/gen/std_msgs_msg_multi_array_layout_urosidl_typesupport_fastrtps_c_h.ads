pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Extensions;
limited with rosidl_generator_c_message_type_support_struct_h;

package std_msgs_msg_multi_array_layout_urosidl_typesupport_fastrtps_c_h is

  -- generated from rosidl_typesupport_fastrtps_c/resource/idl__rosidl_typesupport_fastrtps_c.h.em
  -- with input from std_msgs:msg/MultiArrayLayout.idl
  -- generated code does not contain a copyright notice
   function get_serialized_size_std_msgs_u_msg_u_MultiArrayLayout (untyped_ros_message : System.Address; current_alignment : stddef_h.size_t) return stddef_h.size_t;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__rosidl_typesupport_fastrtps_c.h:19
   pragma Import (C, get_serialized_size_std_msgs_u_msg_u_MultiArrayLayout, "get_serialized_size_std_msgs__msg__MultiArrayLayout");

   function max_serialized_size_std_msgs_u_msg_u_MultiArrayLayout (full_bounded : access Extensions.bool; current_alignment : stddef_h.size_t) return stddef_h.size_t;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__rosidl_typesupport_fastrtps_c.h:24
   pragma Import (C, max_serialized_size_std_msgs_u_msg_u_MultiArrayLayout, "max_serialized_size_std_msgs__msg__MultiArrayLayout");

   function rosidl_typesupport_fastrtps_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_MultiArrayLayout return access constant rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__rosidl_typesupport_fastrtps_c.h:30
   pragma Import (C, rosidl_typesupport_fastrtps_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_MultiArrayLayout, "rosidl_typesupport_fastrtps_c__get_message_type_support_handle__std_msgs__msg__MultiArrayLayout");

end std_msgs_msg_multi_array_layout_urosidl_typesupport_fastrtps_c_h;
