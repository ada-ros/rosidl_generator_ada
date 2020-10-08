pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with stddef_h;

package rosidl_runtime_c_string_h is

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
  --/ An array of 8-bit characters terminated by a null byte.
  --/ The pointer to the first character, the sequence ends with a null byte.
   type rosidl_runtime_c_u_String is record
      data : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/foxy/include/rosidl_runtime_c/string.h:26
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/string.h:28
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/string.h:30
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/string.h:23

  --/ The length of the string (excluding the null byte).
  --/ The capacity represents the number of allocated bytes (including the null byte).
   type rosidl_runtime_c_u_String_u_Sequence is record
      data : access rosidl_runtime_c_u_String;  -- /opt/ros/foxy/include/rosidl_runtime_c/string.h:33
      size : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/string.h:33
      capacity : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/string.h:33
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/string.h:33

end rosidl_runtime_c_string_h;
