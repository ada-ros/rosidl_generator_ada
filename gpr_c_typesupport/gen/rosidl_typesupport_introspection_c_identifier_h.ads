pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package rosidl_typesupport_introspection_c_identifier_h is

  -- Copyright 2014-2015 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
   rosidl_typesupport_introspection_c_u_identifier : Interfaces.C.Strings.chars_ptr  -- /opt/ros/foxy/include/rosidl_typesupport_introspection_c/identifier.h:26
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_typesupport_introspection_c__identifier";

end rosidl_typesupport_introspection_c_identifier_h;
