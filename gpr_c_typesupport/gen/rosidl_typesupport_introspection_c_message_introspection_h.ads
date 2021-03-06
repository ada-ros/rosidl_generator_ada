pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with stddef_h;
limited with rosidl_runtime_c_message_type_support_struct_h;
with Interfaces.C.Extensions;
with System;
with rosidl_runtime_c_message_initialization_h;

package rosidl_typesupport_introspection_c_message_introspection_h is

  -- Copyright 2014-2015 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
   type rosidl_typesupport_introspection_c_u_MessageMember is record
      name_u : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:29
      type_id_u : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:30
      string_upper_bound_u : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:31
      members_u : access constant rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:32
      is_array_u : aliased Extensions.bool;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:33
      array_size_u : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:34
      is_upper_bound_u : aliased Extensions.bool;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:35
      offset_u : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:36
      default_value_u : System.Address;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:37
      size_function : access function (arg1 : System.Address) return stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:38
      get_const_function : access function (arg1 : System.Address; arg2 : stddef_h.size_t) return System.Address;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:39
      get_function : access function (arg1 : System.Address; arg2 : stddef_h.size_t) return System.Address;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:40
      resize_function : access function (arg1 : System.Address; arg2 : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:41
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:27

   type rosidl_typesupport_introspection_c_u_MessageMembers is record
      message_namespace_u : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:46
      message_name_u : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:47
      member_count_u : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:48
      size_of_u : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:49
      members_u : access constant rosidl_typesupport_introspection_c_u_MessageMember;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:50
      init_function : access procedure (arg1 : System.Address; arg2 : rosidl_runtime_c_message_initialization_h.rosidl_runtime_c_u_message_initialization);  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:51
      fini_function : access procedure (arg1 : System.Address);  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:52
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/message_introspection.h:44

end rosidl_typesupport_introspection_c_message_introspection_h;
