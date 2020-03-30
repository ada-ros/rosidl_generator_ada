pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;

package rosidl_generator_c_string_bounds_h is

  -- Copyright 2018 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
  --/ String struct
  --/ The length of the string (excluding the null byte).
   type rosidl_generator_c_u_String_u_bounds is record
      bounds : aliased stddef_h.size_t;  -- /opt/ros/dashing/include/rosidl_generator_c/string_bounds.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_String_u_bounds);  -- /opt/ros/dashing/include/rosidl_generator_c/string_bounds.h:21

end rosidl_generator_c_string_bounds_h;
