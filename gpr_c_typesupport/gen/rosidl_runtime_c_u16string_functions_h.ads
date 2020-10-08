pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_runtime_c_u16string_h;
with Interfaces.C.Extensions;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with stddef_h;
with Interfaces.C.Strings;

package rosidl_runtime_c_u16string_functions_h is

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
  --/ Initialize a rosidl_runtime_c__U16String structure.
  -- The contents of rosidl_runtime_c__U16String are initialized to a single null character.
  -- * The string initially has size 0 and capacity 1.
  -- * Size represents the size of the contents of the string, while capacity represents the overall
  -- * storage of the string (counting the null terminator).
  -- * All strings must be null-terminated.
  -- * The rosidl_runtime_c__U16String structure should be deallocated using the given function
  -- * rosidl_runtime_c__U16String__fini() when it is no longer needed.
  -- * Calling this function with an already initialized U16 string sequence structure will leak
  -- * memory.
  -- *
  -- * \param[inout] str a pointer to a U16 string structure
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or the memory allocation failed
  --  

   function rosidl_runtime_c_u_U16String_u_init (str : access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:45
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__init";

  --/ Deallocate the memory of the rosidl_runtime_c__U16String structure.
  --* Calling the function with an already deallocated sequence is a no-op.
  --*
  --* \param[inout] str a pointer to a U16 string structure to be finalized
  -- 

   procedure rosidl_runtime_c_u_U16String_u_fini (str : access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String)  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:55
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__fini";

  --/ Assign the uint16_t value of n characters to the rosidl_runtime_c__U16String structure.
  -- * This function returns `false` if memory cannot be allocated,
  -- * if the input uint16_t pointer is null or if the size is higher than SIZE_MAX.
  -- * In both cases no error message is set.
  -- *
  -- * \param[inout] str a pointer to a U16 string structure
  -- * \param[in] value points to a sequence of 16 bit chars
  -- * \param[in] n size of the value string
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or if the passed value pointer is null or if the size is higher than SIZE_MAX
  -- *   or if the memory reallocation failed.
  --  

   function rosidl_runtime_c_u_U16String_u_assignn
     (str : access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String;
      value : access x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t;
      n : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:72
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__assignn";

  --/ Assign the c string pointer value of n characters to the rosidl_runtime_c__U16String structure.
  -- * This function is identical to rosidl_runtime_c__U16String__assignn() except the type of the
  -- * value is c string pointer
  -- *
  -- * \see rosidl_runtime_c__U16String__assignn()
  -- *
  -- * \param[inout] str a pointer to a U16 string structure
  -- * \param[in] value points to a sequence of 16 bit chars
  -- * \param[in] n size of the value string
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or if the passed value pointer is null or if the size is higher than SIZE_MAX
  -- *   or if the memory reallocation failed.
  --  

   function rosidl_runtime_c_u_U16String_u_assignn_from_char
     (str : access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String;
      value : Interfaces.C.Strings.chars_ptr;
      n : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:91
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__assignn_from_char";

  --/ Assign the uint16_t pointer to the rosidl_runtime_c__U16String structure.
  -- * This function is identical to rosidl_runtime_c__U16String__assignn() except the length of the
  -- * uint16_t does not have to be given.
  -- * rosidl_runtime_c__U16String__len() is being used to determine the length of the passed string.
  -- *
  -- * \see rosidl_runtime_c__U16String__assignn()
  -- *
  -- * \param[inout] str a pointer to a rosidl_runtime_c__U16String structure
  -- * \param[in] value points to a sequence of 16 bit chars
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or if the passed value pointer is null or if the size is higher than SIZE_MAX
  -- *   or if the memory reallocation failed.
  --  

   function rosidl_runtime_c_u_U16String_u_assign (str : access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String; value : access x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__assign";

  --/ Get the length of the uint16_t pointer.
  -- * This function returns the length of the input value pointer.
  -- *
  -- * \param[in] value points to a sequence of 16 bit chars for which the first null char is
  -- *   determined
  -- * \return the size of the input value pointer or zero if the pointer is NULL
  --  

   function rosidl_runtime_c_u_U16String_u_len (value : access x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t) return stddef_h.size_t  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__len";

  --/ Resize the uint16_t pointer.
  -- * This function resize the input value pointer.
  -- *
  -- * \param[in] n the new size of the internal buffer
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or if the size is higher than SIZE_MAX or if the memory reallocation failed.
  --  

   function rosidl_runtime_c_u_U16String_u_resize (str : access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String; n : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:135
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__resize";

  --/ Initialize a U16 string sequence structure.
  -- * The rosidl_runtime_c__U16String__Sequence is initialized to the size passed to the function.
  -- * The U16 string sequence structure should be deallocated using the given
  -- * function rosidl_runtime_c__U16String__Sequence__fini() when it is no longer needed.
  -- * Calling this function with an already initialized U16 string sequence structure will leak
  -- * memory.
  -- *
  -- * \param[inout] sequence a pointer to a U16 string sequence structure
  -- * \param[in] size represents the size of the U16 string
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or the memory allocation failed
  --  

   function rosidl_runtime_c_u_U16String_u_Sequence_u_init (sequence : access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:153
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__Sequence__init";

  --/ Deallocate the memory of the string sequence structure.
  -- * Calling the function with an already deallocated sequence is a no-op.
  -- *
  -- * \param[inout] sequence a pointer to a U16 string to be finalized
  --  

   procedure rosidl_runtime_c_u_U16String_u_Sequence_u_fini (sequence : access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:164
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__Sequence__fini";

  --/ Create a U16 string sequence structure with a specific size.
  -- * The U16 string sequence initially has size and capacity equal to the size
  -- * argument.
  -- * The U16 string sequence structure should be deallocated using the given
  -- * function rosidl_runtime_c__U16String__Sequence__destroy() when it is no longer needed.
  -- *
  -- * \param[in] size of the desired U16 string
  -- * \return a U16 string sequence if initialization was successfully, otherwise NULL.
  --  

   function rosidl_runtime_c_u_U16String_u_Sequence_u_create (size : stddef_h.size_t) return access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String_u_Sequence  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:179
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__Sequence__create";

  --/ Destroy a U16 string sequence structure.
  -- * Calling the function with an already deallocated sequence is a no-op.
  -- *
  -- * \param[inout] sequence a pointer to a U16 string sequence to be finalized
  --  

   procedure rosidl_runtime_c_u_U16String_u_Sequence_u_destroy (sequence : access rosidl_runtime_c_u16string_h.rosidl_runtime_c_u_U16String_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/u16string_functions.h:189
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__U16String__Sequence__destroy";

end rosidl_runtime_c_u16string_functions_h;
