pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Extensions;
limited with rosidl_generator_c_message_type_support_struct_h;

package builtin_interfaces_msg_duration_urosidl_typesupport_fastrtps_c_h is

  -- generated from rosidl_typesupport_fastrtps_c/resource/idl__rosidl_typesupport_fastrtps_c.h.em
  -- with input from builtin_interfaces:msg/Duration.idl
  -- generated code does not contain a copyright notice
   function get_serialized_size_builtin_interfaces_u_msg_u_Duration (untyped_ros_message : System.Address; current_alignment : stddef_h.size_t) return stddef_h.size_t;  -- /opt/ros/dashing/include/builtin_interfaces/msg/duration__rosidl_typesupport_fastrtps_c.h:19
   pragma Import (C, get_serialized_size_builtin_interfaces_u_msg_u_Duration, "get_serialized_size_builtin_interfaces__msg__Duration");

   function max_serialized_size_builtin_interfaces_u_msg_u_Duration (full_bounded : access Extensions.bool; current_alignment : stddef_h.size_t) return stddef_h.size_t;  -- /opt/ros/dashing/include/builtin_interfaces/msg/duration__rosidl_typesupport_fastrtps_c.h:24
   pragma Import (C, max_serialized_size_builtin_interfaces_u_msg_u_Duration, "max_serialized_size_builtin_interfaces__msg__Duration");

   function rosidl_typesupport_fastrtps_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Duration return access constant rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/dashing/include/builtin_interfaces/msg/duration__rosidl_typesupport_fastrtps_c.h:30
   pragma Import (C, rosidl_typesupport_fastrtps_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Duration, "rosidl_typesupport_fastrtps_c__get_message_type_support_handle__builtin_interfaces__msg__Duration");

end builtin_interfaces_msg_duration_urosidl_typesupport_fastrtps_c_h;
