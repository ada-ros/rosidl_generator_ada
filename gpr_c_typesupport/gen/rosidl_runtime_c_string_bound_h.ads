pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with stddef_h;

package rosidl_runtime_c_string_bound_h is

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
  --/ Upper boundary for #rosidl_runtime_c__String or #rosidl_runtime_c__U16String.
  --/ The number of characters in the string (excluding the null character).
   type rosidl_runtime_c_u_String_u_bound is record
      bound : aliased stddef_h.size_t;  -- /opt/ros/foxy/include/rosidl_runtime_c/string_bound.h:24
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/string_bound.h:21

end rosidl_runtime_c_string_bound_h;
