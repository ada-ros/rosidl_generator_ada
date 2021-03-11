pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_runtime_c_message_type_support_struct_h;

package builtin_interfaces_msg_detail_duration_urosidl_typesupport_introspection_c_h is

  -- generated from rosidl_typesupport_introspection_c/resource/idl__rosidl_typesupport_introspection_c.h.em
  -- with input from builtin_interfaces:msg/Duration.idl
  -- generated code does not contain a copyright notice
   function rosidl_typesupport_introspection_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Duration return access constant rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/duration__rosidl_typesupport_introspection_c.h:20
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_typesupport_introspection_c__get_message_type_support_handle__builtin_interfaces__msg__Duration";

end builtin_interfaces_msg_detail_duration_urosidl_typesupport_introspection_c_h;
