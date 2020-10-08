pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_runtime_c_primitives_sequence_h;
with stddef_h;
with Interfaces.C.Extensions;

package rosidl_runtime_c_primitives_sequence_functions_h is

   --  unsupported macro: ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(STRUCT_NAME) ROSIDL_GENERATOR_C_PUBLIC bool rosidl_runtime_c__ ## STRUCT_NAME ## __Sequence__init( rosidl_runtime_c__ ## STRUCT_NAME ## __Sequence * sequence, size_t size);
   --  unsupported macro: ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(STRUCT_NAME) ROSIDL_GENERATOR_C_PUBLIC void rosidl_runtime_c__ ## STRUCT_NAME ## __Sequence__fini( rosidl_runtime_c__ ## STRUCT_NAME ## __Sequence * sequence);
   --  arg-macro: procedure ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FUNCTIONS (STRUCT_NAME)
   --    ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(STRUCT_NAME) ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(STRUCT_NAME)
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
  --*
  -- * \def ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(STRUCT_NAME)
  -- *
  -- * \brief Allocate the memory for the sequence.
  -- *
  -- * Calling the function with an already allocated sequence will leak the
  -- * previously allocated memory.
  -- *
  -- * param sequence a pointer to a sequence struct
  -- * param size the number of items to allocate in the sequence, both sequence
  -- *   fields `size` and `capacity` are set to this parameter
  -- * return true if successful, false if the passed sequence pointer is null
  -- *   or the memory allocation failed
  --  

  --*
  -- * \def ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(STRUCT_NAME)
  -- *
  -- * \brief Deallocate the memory of the sequence.
  -- *
  -- * Calling the function with an already deallocated sequence is a no-op.
  -- *
  -- * param sequence a pointer to a sequence struct
  --  

  --*
  -- * \def ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FUNCTIONS(STRUCT_NAME)
  -- *
  -- * \brief See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(STRUCT_NAME) and
  -- * #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(STRUCT_NAME)
  --  

  --*
  -- * \defgroup primitives_sequence_functions__basic_types Sequence functions for all basic types.
  --  

  --*@{ 
   function rosidl_runtime_c_u_float_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_float_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__float__Sequence__init";

   procedure rosidl_runtime_c_u_float_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_float_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__float__Sequence__fini";

   function rosidl_runtime_c_u_double_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_double_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__double__Sequence__init";

   procedure rosidl_runtime_c_u_double_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_double_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:79
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__double__Sequence__fini";

   function rosidl_runtime_c_u_long_double_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_long_double_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__long_double__Sequence__init";

   procedure rosidl_runtime_c_u_long_double_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_long_double_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__long_double__Sequence__fini";

   function rosidl_runtime_c_u_char_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_char_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__char__Sequence__init";

   procedure rosidl_runtime_c_u_char_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_char_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__char__Sequence__fini";

   function rosidl_runtime_c_u_wchar_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_wchar_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__wchar__Sequence__init";

   procedure rosidl_runtime_c_u_wchar_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_wchar_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:82
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__wchar__Sequence__fini";

   function rosidl_runtime_c_u_boolean_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_boolean_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__boolean__Sequence__init";

   procedure rosidl_runtime_c_u_boolean_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_boolean_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__boolean__Sequence__fini";

   function rosidl_runtime_c_u_octet_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_octet_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__octet__Sequence__init";

   procedure rosidl_runtime_c_u_octet_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_octet_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:84
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__octet__Sequence__fini";

   function rosidl_runtime_c_u_uint8_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_uint8_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__uint8__Sequence__init";

   procedure rosidl_runtime_c_u_uint8_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_uint8_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:85
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__uint8__Sequence__fini";

   function rosidl_runtime_c_u_int8_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_int8_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__int8__Sequence__init";

   procedure rosidl_runtime_c_u_int8_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_int8_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:86
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__int8__Sequence__fini";

   function rosidl_runtime_c_u_uint16_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_uint16_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__uint16__Sequence__init";

   procedure rosidl_runtime_c_u_uint16_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_uint16_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__uint16__Sequence__fini";

   function rosidl_runtime_c_u_int16_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_int16_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__int16__Sequence__init";

   procedure rosidl_runtime_c_u_int16_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_int16_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__int16__Sequence__fini";

   function rosidl_runtime_c_u_uint32_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_uint32_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__uint32__Sequence__init";

   procedure rosidl_runtime_c_u_uint32_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_uint32_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:89
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__uint32__Sequence__fini";

   function rosidl_runtime_c_u_int32_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_int32_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__int32__Sequence__init";

   procedure rosidl_runtime_c_u_int32_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_int32_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:90
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__int32__Sequence__fini";

   function rosidl_runtime_c_u_uint64_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_uint64_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:91
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__uint64__Sequence__init";

   procedure rosidl_runtime_c_u_uint64_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_uint64_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:91
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__uint64__Sequence__fini";

   function rosidl_runtime_c_u_int64_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_int64_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__int64__Sequence__init";

   procedure rosidl_runtime_c_u_int64_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_int64_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:92
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__int64__Sequence__fini";

  --*@} 
  --*
  -- * \defgroup primitives_sequence_functions__legacy Sequence functions for legacy types for backward compatibility.
  --  

  --*@{ 
  --* See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(bool)  
   function rosidl_runtime_c_u_bool_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_boolean_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__bool__Sequence__init";

  --* See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(bool)  
   procedure rosidl_runtime_c_u_bool_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_boolean_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:105
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__bool__Sequence__fini";

  --* See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(byte)  
   function rosidl_runtime_c_u_byte_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_octet_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__byte__Sequence__init";

  --* See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(byte)  
   procedure rosidl_runtime_c_u_byte_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_octet_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__byte__Sequence__fini";

  --* See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(float32)  
   function rosidl_runtime_c_u_float32_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_float_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:119
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__float32__Sequence__init";

  --* See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(float32)  
   procedure rosidl_runtime_c_u_float32_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_float_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__float32__Sequence__fini";

  --* See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_INIT(float64)  
   function rosidl_runtime_c_u_float64_u_Sequence_u_init (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_double_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__float64__Sequence__init";

  --* See #ROSIDL_RUNTIME_C__DECLARE_PRIMITIVE_SEQUENCE_FINI(float64)  
   procedure rosidl_runtime_c_u_float64_u_Sequence_u_fini (sequence : access rosidl_runtime_c_primitives_sequence_h.rosidl_runtime_c_u_double_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence_functions.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__float64__Sequence__fini";

  --*@} 
end rosidl_runtime_c_primitives_sequence_functions_h;
