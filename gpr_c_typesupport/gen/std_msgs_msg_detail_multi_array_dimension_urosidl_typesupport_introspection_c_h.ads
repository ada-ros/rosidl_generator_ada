pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_runtime_c_message_type_support_struct_h;

package std_msgs_msg_detail_multi_array_dimension_urosidl_typesupport_introspection_c_h is

  -- generated from rosidl_typesupport_introspection_c/resource/idl__rosidl_typesupport_introspection_c.h.em
  -- with input from std_msgs:msg/MultiArrayDimension.idl
  -- generated code does not contain a copyright notice
   function rosidl_typesupport_introspection_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_MultiArrayDimension return access constant rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t  -- /opt/ros/foxy/include/std_msgs/msg/detail/multi_array_dimension__rosidl_typesupport_introspection_c.h:20
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_typesupport_introspection_c__get_message_type_support_handle__std_msgs__msg__MultiArrayDimension";

end std_msgs_msg_detail_multi_array_dimension_urosidl_typesupport_introspection_c_h;
