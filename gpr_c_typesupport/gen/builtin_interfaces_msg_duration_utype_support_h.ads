pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c_message_type_support_struct_h;

package builtin_interfaces_msg_duration_utype_support_h is

  -- generated from rosidl_generator_c/resource/msg__type_support.h.em
  -- generated code does not contain a copyright notice
  -- Forward declare the get type support functions for this type.
   function rosidl_typesupport_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Duration return access constant rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/crystal/include/builtin_interfaces/msg/duration__type_support.h:20
   pragma Import (C, rosidl_typesupport_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Duration, "rosidl_typesupport_c__get_message_type_support_handle__builtin_interfaces__msg__Duration");

end builtin_interfaces_msg_duration_utype_support_h;
