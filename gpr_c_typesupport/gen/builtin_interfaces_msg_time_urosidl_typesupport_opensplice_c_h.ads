pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c_message_type_support_struct_h;

package builtin_interfaces_msg_time_urosidl_typesupport_opensplice_c_h is

  -- generated from
  -- rosidl_typesupport_opensplice_c/resource/msg__rosidl_typesupport_opensplice_c.h.em
  -- generated code does not contain a copyright notice
   function rosidl_typesupport_opensplice_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Time return access constant rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/bouncy/include/builtin_interfaces/msg/time__rosidl_typesupport_opensplice_c.h:20
   pragma Import (C, rosidl_typesupport_opensplice_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Time, "rosidl_typesupport_opensplice_c__get_message_type_support_handle__builtin_interfaces__msg__Time");

end builtin_interfaces_msg_time_urosidl_typesupport_opensplice_c_h;
