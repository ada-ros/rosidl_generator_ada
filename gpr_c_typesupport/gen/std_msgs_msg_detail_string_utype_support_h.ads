pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_runtime_c_message_type_support_struct_h;

package std_msgs_msg_detail_string_utype_support_h is

  -- generated from rosidl_generator_c/resource/idl__type_support.h.em
  -- with input from std_msgs:msg/String.idl
  -- generated code does not contain a copyright notice
  -- Forward declare the get type support functions for this type.
   function rosidl_typesupport_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_String return access constant rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t  -- /opt/ros/foxy/include/std_msgs/msg/detail/string__type_support.h:22
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_typesupport_c__get_message_type_support_handle__std_msgs__msg__String";

end std_msgs_msg_detail_string_utype_support_h;
