pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c_u16string_h;
with Interfaces.C.Extensions;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with stddef_h;
with Interfaces.C.Strings;

package rosidl_generator_c_u16string_functions_h is

  -- Copyright 2015-2018 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
  --/ Initialize a rosidl_generator_c__U16String structure.
  -- The contents of rosidl_generator_c__U16String are initialized to a single null character.
  -- * The string initially has size 0 and capacity 1.
  -- * Size represents the size of the contents of the string, while capacity represents the overall
  -- * storage of the string (counting the null terminator).
  -- * All strings must be null-terminated.
  --  

   function rosidl_generator_c_u_U16String_u_init (str : access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:37
   pragma Import (C, rosidl_generator_c_u_U16String_u_init, "rosidl_generator_c__U16String__init");

   procedure rosidl_generator_c_u_U16String_u_fini (str : access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String);  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:41
   pragma Import (C, rosidl_generator_c_u_U16String_u_fini, "rosidl_generator_c__U16String__fini");

   function rosidl_generator_c_u_U16String_u_assignn
     (str : access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String;
      value : access x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t;
      n : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:45
   pragma Import (C, rosidl_generator_c_u_U16String_u_assignn, "rosidl_generator_c__U16String__assignn");

   function rosidl_generator_c_u_U16String_u_assignn_from_char
     (str : access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String;
      value : Interfaces.C.Strings.chars_ptr;
      n : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:50
   pragma Import (C, rosidl_generator_c_u_U16String_u_assignn_from_char, "rosidl_generator_c__U16String__assignn_from_char");

   function rosidl_generator_c_u_U16String_u_assign (str : access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String; value : access x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:55
   pragma Import (C, rosidl_generator_c_u_U16String_u_assign, "rosidl_generator_c__U16String__assign");

   function rosidl_generator_c_u_U16String_u_len (value : access x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t) return stddef_h.size_t;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:60
   pragma Import (C, rosidl_generator_c_u_U16String_u_len, "rosidl_generator_c__U16String__len");

   function rosidl_generator_c_u_U16String_u_resize (str : access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String; n : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:64
   pragma Import (C, rosidl_generator_c_u_U16String_u_resize, "rosidl_generator_c__U16String__resize");

   function rosidl_generator_c_u_U16String_u_Sequence_u_init (sequence : access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:69
   pragma Import (C, rosidl_generator_c_u_U16String_u_Sequence_u_init, "rosidl_generator_c__U16String__Sequence__init");

   procedure rosidl_generator_c_u_U16String_u_Sequence_u_fini (sequence : access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:74
   pragma Import (C, rosidl_generator_c_u_U16String_u_Sequence_u_fini, "rosidl_generator_c__U16String__Sequence__fini");

   function rosidl_generator_c_u_U16String_u_Sequence_u_create (size : stddef_h.size_t) return access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String_u_Sequence;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:79
   pragma Import (C, rosidl_generator_c_u_U16String_u_Sequence_u_create, "rosidl_generator_c__U16String__Sequence__create");

   procedure rosidl_generator_c_u_U16String_u_Sequence_u_destroy (sequence : access rosidl_generator_c_u16string_h.rosidl_generator_c_u_U16String_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/u16string_functions.h:83
   pragma Import (C, rosidl_generator_c_u_U16String_u_Sequence_u_destroy, "rosidl_generator_c__U16String__Sequence__destroy");

end rosidl_generator_c_u16string_functions_h;
