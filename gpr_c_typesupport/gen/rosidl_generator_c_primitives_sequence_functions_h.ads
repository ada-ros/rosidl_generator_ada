pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c_primitives_sequence_h;
with stddef_h;
with Interfaces.C.Extensions;

package rosidl_generator_c_primitives_sequence_functions_h is

   --  unsupported macro: ROSIDL_GENERATOR_C__DECLARE_PRIMITIVE_SEQUENCE_FUNCTIONS(STRUCT_NAME,TYPE_NAME) ROSIDL_GENERATOR_C_PUBLIC bool rosidl_generator_c__ ## STRUCT_NAME ## __Sequence__init( rosidl_generator_c__ ## STRUCT_NAME ## __Sequence * sequence, size_t size); ROSIDL_GENERATOR_C_PUBLIC void rosidl_generator_c__ ## STRUCT_NAME ## __Sequence__fini( rosidl_generator_c__ ## STRUCT_NAME ## __Sequence * sequence);
  -- Copyright 2015 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
  -- array functions for all basic types
   procedure rosidl_generator_c_u_float_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_float_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:39
   pragma Import (C, rosidl_generator_c_u_float_u_Sequence_u_fini, "rosidl_generator_c__float__Sequence__fini");

   function rosidl_generator_c_u_float_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_float_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:39
   pragma Import (C, rosidl_generator_c_u_float_u_Sequence_u_init, "rosidl_generator_c__float__Sequence__init");

   procedure rosidl_generator_c_u_double_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_double_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:40
   pragma Import (C, rosidl_generator_c_u_double_u_Sequence_u_fini, "rosidl_generator_c__double__Sequence__fini");

   function rosidl_generator_c_u_double_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_double_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:40
   pragma Import (C, rosidl_generator_c_u_double_u_Sequence_u_init, "rosidl_generator_c__double__Sequence__init");

   procedure rosidl_generator_c_u_long_double_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_long_double_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:41
   pragma Import (C, rosidl_generator_c_u_long_double_u_Sequence_u_fini, "rosidl_generator_c__long_double__Sequence__fini");

   function rosidl_generator_c_u_long_double_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_long_double_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:41
   pragma Import (C, rosidl_generator_c_u_long_double_u_Sequence_u_init, "rosidl_generator_c__long_double__Sequence__init");

   procedure rosidl_generator_c_u_char_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_char_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:42
   pragma Import (C, rosidl_generator_c_u_char_u_Sequence_u_fini, "rosidl_generator_c__char__Sequence__fini");

   function rosidl_generator_c_u_char_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_char_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:42
   pragma Import (C, rosidl_generator_c_u_char_u_Sequence_u_init, "rosidl_generator_c__char__Sequence__init");

   procedure rosidl_generator_c_u_wchar_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_wchar_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:43
   pragma Import (C, rosidl_generator_c_u_wchar_u_Sequence_u_fini, "rosidl_generator_c__wchar__Sequence__fini");

   function rosidl_generator_c_u_wchar_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_wchar_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:43
   pragma Import (C, rosidl_generator_c_u_wchar_u_Sequence_u_init, "rosidl_generator_c__wchar__Sequence__init");

   procedure rosidl_generator_c_u_boolean_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_boolean_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:44
   pragma Import (C, rosidl_generator_c_u_boolean_u_Sequence_u_fini, "rosidl_generator_c__boolean__Sequence__fini");

   function rosidl_generator_c_u_boolean_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_boolean_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:44
   pragma Import (C, rosidl_generator_c_u_boolean_u_Sequence_u_init, "rosidl_generator_c__boolean__Sequence__init");

   procedure rosidl_generator_c_u_octet_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_octet_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:45
   pragma Import (C, rosidl_generator_c_u_octet_u_Sequence_u_fini, "rosidl_generator_c__octet__Sequence__fini");

   function rosidl_generator_c_u_octet_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_octet_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:45
   pragma Import (C, rosidl_generator_c_u_octet_u_Sequence_u_init, "rosidl_generator_c__octet__Sequence__init");

   procedure rosidl_generator_c_u_uint8_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_uint8_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:46
   pragma Import (C, rosidl_generator_c_u_uint8_u_Sequence_u_fini, "rosidl_generator_c__uint8__Sequence__fini");

   function rosidl_generator_c_u_uint8_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_uint8_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:46
   pragma Import (C, rosidl_generator_c_u_uint8_u_Sequence_u_init, "rosidl_generator_c__uint8__Sequence__init");

   procedure rosidl_generator_c_u_int8_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_int8_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:47
   pragma Import (C, rosidl_generator_c_u_int8_u_Sequence_u_fini, "rosidl_generator_c__int8__Sequence__fini");

   function rosidl_generator_c_u_int8_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_int8_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:47
   pragma Import (C, rosidl_generator_c_u_int8_u_Sequence_u_init, "rosidl_generator_c__int8__Sequence__init");

   procedure rosidl_generator_c_u_uint16_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_uint16_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:48
   pragma Import (C, rosidl_generator_c_u_uint16_u_Sequence_u_fini, "rosidl_generator_c__uint16__Sequence__fini");

   function rosidl_generator_c_u_uint16_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_uint16_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:48
   pragma Import (C, rosidl_generator_c_u_uint16_u_Sequence_u_init, "rosidl_generator_c__uint16__Sequence__init");

   procedure rosidl_generator_c_u_int16_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_int16_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:49
   pragma Import (C, rosidl_generator_c_u_int16_u_Sequence_u_fini, "rosidl_generator_c__int16__Sequence__fini");

   function rosidl_generator_c_u_int16_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_int16_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:49
   pragma Import (C, rosidl_generator_c_u_int16_u_Sequence_u_init, "rosidl_generator_c__int16__Sequence__init");

   procedure rosidl_generator_c_u_uint32_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_uint32_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:50
   pragma Import (C, rosidl_generator_c_u_uint32_u_Sequence_u_fini, "rosidl_generator_c__uint32__Sequence__fini");

   function rosidl_generator_c_u_uint32_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_uint32_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:50
   pragma Import (C, rosidl_generator_c_u_uint32_u_Sequence_u_init, "rosidl_generator_c__uint32__Sequence__init");

   procedure rosidl_generator_c_u_int32_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_int32_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:51
   pragma Import (C, rosidl_generator_c_u_int32_u_Sequence_u_fini, "rosidl_generator_c__int32__Sequence__fini");

   function rosidl_generator_c_u_int32_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_int32_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:51
   pragma Import (C, rosidl_generator_c_u_int32_u_Sequence_u_init, "rosidl_generator_c__int32__Sequence__init");

   procedure rosidl_generator_c_u_uint64_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_uint64_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:52
   pragma Import (C, rosidl_generator_c_u_uint64_u_Sequence_u_fini, "rosidl_generator_c__uint64__Sequence__fini");

   function rosidl_generator_c_u_uint64_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_uint64_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:52
   pragma Import (C, rosidl_generator_c_u_uint64_u_Sequence_u_init, "rosidl_generator_c__uint64__Sequence__init");

   procedure rosidl_generator_c_u_int64_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_int64_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:53
   pragma Import (C, rosidl_generator_c_u_int64_u_Sequence_u_fini, "rosidl_generator_c__int64__Sequence__fini");

   function rosidl_generator_c_u_int64_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_int64_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:53
   pragma Import (C, rosidl_generator_c_u_int64_u_Sequence_u_init, "rosidl_generator_c__int64__Sequence__init");

  -- emulate legacy API
   function rosidl_generator_c_u_bool_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_boolean_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:57
   pragma Import (C, rosidl_generator_c_u_bool_u_Sequence_u_init, "rosidl_generator_c__bool__Sequence__init");

   procedure rosidl_generator_c_u_bool_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_boolean_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:60
   pragma Import (C, rosidl_generator_c_u_bool_u_Sequence_u_fini, "rosidl_generator_c__bool__Sequence__fini");

   function rosidl_generator_c_u_byte_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_octet_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:64
   pragma Import (C, rosidl_generator_c_u_byte_u_Sequence_u_init, "rosidl_generator_c__byte__Sequence__init");

   procedure rosidl_generator_c_u_byte_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_octet_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:67
   pragma Import (C, rosidl_generator_c_u_byte_u_Sequence_u_fini, "rosidl_generator_c__byte__Sequence__fini");

   function rosidl_generator_c_u_float32_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_float_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:71
   pragma Import (C, rosidl_generator_c_u_float32_u_Sequence_u_init, "rosidl_generator_c__float32__Sequence__init");

   procedure rosidl_generator_c_u_float32_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_float_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:74
   pragma Import (C, rosidl_generator_c_u_float32_u_Sequence_u_fini, "rosidl_generator_c__float32__Sequence__fini");

   function rosidl_generator_c_u_float64_u_Sequence_u_init (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_double_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:78
   pragma Import (C, rosidl_generator_c_u_float64_u_Sequence_u_init, "rosidl_generator_c__float64__Sequence__init");

   procedure rosidl_generator_c_u_float64_u_Sequence_u_fini (sequence : access rosidl_generator_c_primitives_sequence_h.rosidl_generator_c_u_double_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/primitives_sequence_functions.h:81
   pragma Import (C, rosidl_generator_c_u_float64_u_Sequence_u_fini, "rosidl_generator_c__float64__Sequence__fini");

end rosidl_generator_c_primitives_sequence_functions_h;
