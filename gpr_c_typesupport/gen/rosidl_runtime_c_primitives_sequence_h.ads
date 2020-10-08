pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with Interfaces.C.Extensions;
with x86_64_linux_gnu_bits_stdint_intn_h;

package rosidl_runtime_c_primitives_sequence_h is

   --  unsupported macro: ROSIDL_RUNTIME_C__PRIMITIVE_SEQUENCE(STRUCT_NAME,TYPE_NAME) typedef struct rosidl_runtime_c__ ## STRUCT_NAME ## __Sequence { TYPE_NAME * data; size_t size; size_t capacity; } rosidl_runtime_c__ ## STRUCT_NAME ## __Sequence;
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
  -- sequence types for all basic types
   type rosidl_runtime_c_u_float_u_Sequence is record
      data : access float;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:31
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:31
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:31
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:31

   type rosidl_runtime_c_u_double_u_Sequence is record
      data : access double;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:32
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:32
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:32
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:32

   type rosidl_runtime_c_u_long_double_u_Sequence is record
      data : access long_double;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:33
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:33
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:33
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:33

   type rosidl_runtime_c_u_char_u_Sequence is record
      data : access signed_char;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:34
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:34
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:34
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:34

   type rosidl_runtime_c_u_wchar_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:35
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:35
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:35
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:35

   type rosidl_runtime_c_u_boolean_u_Sequence is record
      data : access Extensions.bool;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:36
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:36
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:36
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:36

   type rosidl_runtime_c_u_octet_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:37
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:37
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:37
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:37

   type rosidl_runtime_c_u_uint8_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:38
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:38
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:38
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:38

   type rosidl_runtime_c_u_int8_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_intn_h.int8_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:39
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:39
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:39
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:39

   type rosidl_runtime_c_u_uint16_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:40
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:40
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:40
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:40

   type rosidl_runtime_c_u_int16_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:41
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:41
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:41
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:41

   type rosidl_runtime_c_u_uint32_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:42
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:42
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:42
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:42

   type rosidl_runtime_c_u_int32_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:43
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:43
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:43
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:43

   type rosidl_runtime_c_u_uint64_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:44
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:44
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:44
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:44

   type rosidl_runtime_c_u_int64_u_Sequence is record
      data : access x86_64_linux_gnu_bits_stdint_intn_h.int64_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:45
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:45
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:45
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:45

  -- emulate legacy API
   subtype rosidl_runtime_c_u_bool_u_Sequence is rosidl_runtime_c_u_boolean_u_Sequence;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:49

   subtype rosidl_runtime_c_u_byte_u_Sequence is rosidl_runtime_c_u_octet_u_Sequence;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:51

   subtype rosidl_runtime_c_u_float32_u_Sequence is rosidl_runtime_c_u_float_u_Sequence;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:53

   subtype rosidl_runtime_c_u_float64_u_Sequence is rosidl_runtime_c_u_double_u_Sequence;  -- /opt/ros/foxy/include/rosidl_runtime_c/primitives_sequence.h:55

end rosidl_runtime_c_primitives_sequence_h;
