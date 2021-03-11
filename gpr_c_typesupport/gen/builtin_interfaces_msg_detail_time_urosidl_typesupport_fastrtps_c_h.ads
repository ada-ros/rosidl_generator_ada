pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Extensions;
limited with rosidl_runtime_c_message_type_support_struct_h;

package builtin_interfaces_msg_detail_time_urosidl_typesupport_fastrtps_c_h is

  -- generated from rosidl_typesupport_fastrtps_c/resource/idl__rosidl_typesupport_fastrtps_c.h.em
  -- with input from builtin_interfaces:msg/Time.idl
  -- generated code does not contain a copyright notice
   function get_serialized_size_builtin_interfaces_u_msg_u_Time (untyped_ros_message : System.Address; current_alignment : stddef_h.size_t) return stddef_h.size_t  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/time__rosidl_typesupport_fastrtps_c.h:19
   with Import => True, 
        Convention => C, 
        External_Name => "get_serialized_size_builtin_interfaces__msg__Time";

   function max_serialized_size_builtin_interfaces_u_msg_u_Time (full_bounded : access Extensions.bool; current_alignment : stddef_h.size_t) return stddef_h.size_t  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/time__rosidl_typesupport_fastrtps_c.h:24
   with Import => True, 
        Convention => C, 
        External_Name => "max_serialized_size_builtin_interfaces__msg__Time";

   function rosidl_typesupport_fastrtps_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Time return access constant rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/time__rosidl_typesupport_fastrtps_c.h:30
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_typesupport_fastrtps_c__get_message_type_support_handle__builtin_interfaces__msg__Time";

end builtin_interfaces_msg_detail_time_urosidl_typesupport_fastrtps_c_h;
