pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Extensions;
limited with rosidl_generator_c_message_type_support_struct_h;

package std_msgs_msg_string_urosidl_typesupport_fastrtps_c_h is

  -- generated from
  -- rosidl_typesupport_fastrtps_c/resource/msg__rosidl_typesupport_fastrtps_c.h.em
  -- generated code does not contain a copyright notice
   function get_serialized_size_std_msgs_u_msg_u_String (untyped_ros_message : System.Address; current_alignment : stddef_h.size_t) return stddef_h.size_t;  -- /opt/ros/crystal/include/std_msgs/msg/string__rosidl_typesupport_fastrtps_c.h:21
   pragma Import (C, get_serialized_size_std_msgs_u_msg_u_String, "get_serialized_size_std_msgs__msg__String");

   function max_serialized_size_std_msgs_u_msg_u_String (full_bounded : access Extensions.bool; current_alignment : stddef_h.size_t) return stddef_h.size_t;  -- /opt/ros/crystal/include/std_msgs/msg/string__rosidl_typesupport_fastrtps_c.h:26
   pragma Import (C, max_serialized_size_std_msgs_u_msg_u_String, "max_serialized_size_std_msgs__msg__String");

   function rosidl_typesupport_fastrtps_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_String return access constant rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/crystal/include/std_msgs/msg/string__rosidl_typesupport_fastrtps_c.h:32
   pragma Import (C, rosidl_typesupport_fastrtps_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_String, "rosidl_typesupport_fastrtps_c__get_message_type_support_handle__std_msgs__msg__String");

end std_msgs_msg_string_urosidl_typesupport_fastrtps_c_h;
