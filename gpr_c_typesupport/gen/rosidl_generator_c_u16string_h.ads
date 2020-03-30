pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stdint_h;
with stddef_h;

package rosidl_generator_c_u16string_h is

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
  --/ U16String struct
  --/ The pointer to the first character.
  -- using uint_least16_t to match a C++ std::u16string
   type rosidl_generator_c_u_U16String is record
      data : access stdint_h.uint_least16_t;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string.h:26
      size : aliased stddef_h.size_t;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string.h:28
      capacity : aliased stddef_h.size_t;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string.h:30
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_U16String);  -- /opt/ros/dashing/include/rosidl_generator_c/u16string.h:23

  --/ The length of the u16string (excluding the null byte).
  --/ The capacity represents the number of allocated characters (including the null byte).
   type rosidl_generator_c_u_U16String_u_Sequence is record
      data : access rosidl_generator_c_u_U16String;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string.h:33
      size : aliased stddef_h.size_t;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string.h:33
      capacity : aliased stddef_h.size_t;  -- /opt/ros/dashing/include/rosidl_generator_c/u16string.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_U16String_u_Sequence);  -- /opt/ros/dashing/include/rosidl_generator_c/u16string.h:33

end rosidl_generator_c_u16string_h;
