pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with stddef_h;
limited with rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h;
with Interfaces.C.Extensions;
with System;
with rosidl_runtime_c_rosidl_runtime_c_message_initialization_h;

package rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_message_introspection_h is

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
  --/ Structure used to describe a single field of an interface type.
  --/ The name of the field.
   type rosidl_typesupport_introspection_c_u_MessageMember_s is record
      name_u : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:32
      type_id_u : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:36
      string_upper_bound_u : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:38
      members_u : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:41
      is_key_u : aliased Extensions.bool;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:43
      is_array_u : aliased Extensions.bool;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:46
      array_size_u : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:48
      is_upper_bound_u : aliased Extensions.bool;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:51
      offset_u : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:53
      default_value_u : System.Address;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:55
      size_function : access function (arg1 : System.Address) return stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:57
      get_const_function : access function (arg1 : System.Address; arg2 : stddef_h.size_t) return System.Address;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:60
      get_function : access function (arg1 : System.Address; arg2 : stddef_h.size_t) return System.Address;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:63
      fetch_function : access procedure
           (arg1 : System.Address;
            arg2 : stddef_h.size_t;
            arg3 : System.Address);  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:70
      assign_function : access procedure
           (arg1 : System.Address;
            arg2 : stddef_h.size_t;
            arg3 : System.Address);  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:78
      resize_function : access function (arg1 : System.Address; arg2 : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:80
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:29

  --/ The type of the field as a value of the field types enum
  --/ rosidl_typesupport_introspection_c_field_types.
  --/ e.g. rosidl_typesupport_introspection_c__ROS_TYPE_FLOAT
  --/ If the field is a string, the upper bound on the length of the string.
  --/ If the type_id_ value is rosidl_typesupport_introspection_c__ROS_TYPE_MESSAGE,
  --/ this points to an array describing the fields of the sub-interface.
  --/ True if this field is annotated as `@key`, false otherwise.
  --/ True if this field is an array type, false if it is any other type. An
  --/ array has the same value for / type_id_.
  --/ If is_array_ is true, this contains the number of members in the array.
  --/ If is_array_ is true, this specifies if the array has a maximum size. If it is true, the
  --/ value in array_size_ is the maximum size.
  --/ The bytes into the interface's in-memory representation that this field can be found at.
  --/ If the interface has a default value, this points to it.
  --/ If is_array_ is true, a pointer to a function that gives the size of one member of the array.
  --/ If is_array_ is true, a pointer to a function that gives a const pointer to the member of the
  --/ array indicated by index.
  --/ If is_array_ is true, a pointer to a function that gives a pointer to the member of the
  --/ array indicated by index.
  --/ Pointer to a function that fetches (i.e. copies) an item from
  --/ an array or sequence member. It takes a pointer to the member,
  --/ an index (which is assumed to be valid), and a pointer to a
  --/ pre-allocated value (which is assumed to be of the correct type).
  --/
  --/ Available for array and sequence members.
  --/ Pointer to a function that assigns (i.e. copies) a value to an
  --/ item in an array or sequence member. It takes a pointer to the
  --/ member, an index (which is assumed to be valid), and a pointer
  --/ to an initialized value (which is assumed to be of the correct
  --/ type).
  --/
  --/ Available for array and sequence members.
  --/ If is_array_ is true, a pointer to a function that resizes the array.
   subtype rosidl_typesupport_introspection_c_u_MessageMember is rosidl_typesupport_introspection_c_u_MessageMember_s;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:81

  --/ Structure used to describe all fields of a single interface type.
  --/ The namespace in which the interface resides, e.g. "example_messages__msg" for
  --/ example_messages/msg
   type rosidl_typesupport_introspection_c_u_MessageMembers_s is record
      message_namespace_u : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:88
      message_name_u : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:90
      member_count_u : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:92
      size_of_u : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:94
      has_any_key_member_u : aliased Extensions.bool;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:96
      members_u : access constant rosidl_typesupport_introspection_c_u_MessageMember;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:98
      init_function : access procedure (arg1 : System.Address; arg2 : rosidl_runtime_c_rosidl_runtime_c_message_initialization_h.rosidl_runtime_c_u_message_initialization);  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:100
      fini_function : access procedure (arg1 : System.Address);  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:102
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:84

  --/ The name of the interface, e.g. "Int16"
  --/ The number of fields in the interface
  --/ The size of the interface structure in memory
  --/ A boolean value indicating if there are any members annotated as `@key` in the structure.
  --/ A pointer to the array that describes each field of the interface
  --/ The function used to initialise the interface's in-memory representation
  --/ The function used to clean up the interface's in-memory representation
   subtype rosidl_typesupport_introspection_c_u_MessageMembers is rosidl_typesupport_introspection_c_u_MessageMembers_s;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/message_introspection.h:103

end rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_message_introspection_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
