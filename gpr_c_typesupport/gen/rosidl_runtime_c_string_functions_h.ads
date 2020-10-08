pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_runtime_c_string_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with stddef_h;

package rosidl_runtime_c_string_functions_h is

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
  --/ Initialize a rosidl_runtime_c__String structure.
  -- * The contents of rosidl_runtime_c__String are initialized to a single null character ('\0').
  -- * The string initially has size 0 and capacity 1.
  -- * Size represents the size of the contents of the string, while capacity represents the overall
  -- * storage of the string (counting the null terminator).
  -- * All strings must be null-terminated.
  -- * The rosidl_runtime_c__String structure should be deallocated using the given function
  -- * rosidl_runtime_c__String__fini() when it is no longer needed.
  -- * Calling this function with an already initialized U16 string sequence structure will leak
  -- * memory.
  -- *
  -- * \param[inout] str a pointer to a rosidl_runtime_c__String structure
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or the memory allocation failed
  --  

   function rosidl_runtime_c_u_String_u_init (str : access rosidl_runtime_c_string_h.rosidl_runtime_c_u_String) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/string_functions.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__String__init";

  --/ Deallocate the memory of the rosidl_runtime_c__String structure.
  --* Calling the function with an already deallocated sequence is a no-op.
  --*
  --* \param[inout] str a pointer to a rosidl_runtime_c__String structure to be finalized
  -- 

   procedure rosidl_runtime_c_u_String_u_fini (str : access rosidl_runtime_c_string_h.rosidl_runtime_c_u_String)  -- /opt/ros/foxy/include/rosidl_runtime_c/string_functions.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__String__fini";

  --/ Assign the c string pointer of n characters to the rosidl_runtime_c__String structure.
  -- * \param[inout] str a pointer to a string structure
  -- * \param[in] value c string pointer to be assigned
  -- * \param[in] n size of the value string
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or if the passed value pointer is null or if the size is higher than SIZE_MAX
  -- *   or if the memory reallocation failed.
  --  

   function rosidl_runtime_c_u_String_u_assignn
     (str : access rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;
      value : Interfaces.C.Strings.chars_ptr;
      n : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/string_functions.h:69
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__String__assignn";

  --/ Assign the c string pointer to the rosidl_runtime_c__String structure.
  -- *
  -- * This function is identical to rosidl_runtime_c__String__assignn() except the length of the
  -- * c string does not have to be given and therefore the c string must be null terminated.
  -- *
  -- * \see rosidl_runtime_c__String__assignn()
  -- *
  -- * \param[inout] str a pointer to a rosidl_runtime_c__String structure
  -- * \param[in] value c string pointer to be assigned
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or if the passed value pointer is null or if the size is higher than SIZE_MAX
  -- *   or if the memory reallocation failed.
  --  

   function rosidl_runtime_c_u_String_u_assign (str : access rosidl_runtime_c_string_h.rosidl_runtime_c_u_String; value : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/string_functions.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__String__assign";

  --/ Initialize a rosidl_runtime_c__String__Sequence__init structure.
  -- * The rosidl_runtime_c__String__Sequence is initialized with the size passed to the function.
  -- * The rosidl_runtime_c__String__Sequence structure should be deallocated using the given function
  -- * rosidl_runtime_c__String__Sequence__fini() when it is no longer needed.
  -- * Calling this function with an already initialized U16 string sequence structure will leak
  -- * memory.
  -- *
  -- * \param[inout] sequence a pointer to a string sequence
  -- * \param[in] size represents the size of the string sequence
  -- * \return true if successful, false if the passed string pointer is null
  -- *   or the memory allocation failed
  --  

   function rosidl_runtime_c_u_String_u_Sequence_u_init (sequence : access rosidl_runtime_c_string_h.rosidl_runtime_c_u_String_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/rosidl_runtime_c/string_functions.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__String__Sequence__init";

  --/ Deallocate the memory of the string sequence structure.
  -- * Calling the function with an already deallocated sequence is a no-op.
  -- *
  -- * \param[inout] sequence a pointer to a string sequence to be finalized
  --  

   procedure rosidl_runtime_c_u_String_u_Sequence_u_fini (sequence : access rosidl_runtime_c_string_h.rosidl_runtime_c_u_String_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/string_functions.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__String__Sequence__fini";

  --/ Create a rosidl_runtime_c__String__Sequence structure with a specific size.
  -- * The string sequence initially has size and capacity equal to the size argument passed to the
  -- * function.
  -- * The rosidl_runtime_c__String__Sequence structure should be deallocated using the given function
  -- * rosidl_runtime_c__String__Sequence__destroy() when it is no longer needed.
  -- *
  -- * \param[in] size of the desired string sequence
  -- * \return a string sequence if initialization was successfully, otherwise NULL.
  --  

   function rosidl_runtime_c_u_String_u_Sequence_u_create (size : stddef_h.size_t) return access rosidl_runtime_c_string_h.rosidl_runtime_c_u_String_u_Sequence  -- /opt/ros/foxy/include/rosidl_runtime_c/string_functions.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__String__Sequence__create";

  --/ Destroy a rosidl_runtime_c__String__Sequence structure.
  -- * Calling the function with an already deallocated sequence is a no-op.
  -- *
  -- * \param[inout] sequence a pointer to a string sequence to be finalized
  --  

   procedure rosidl_runtime_c_u_String_u_Sequence_u_destroy (sequence : access rosidl_runtime_c_string_h.rosidl_runtime_c_u_String_u_Sequence)  -- /opt/ros/foxy/include/rosidl_runtime_c/string_functions.h:142
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__String__Sequence__destroy";

end rosidl_runtime_c_string_functions_h;
