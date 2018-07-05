pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with rosidl_typesupport_introspection_c_message_introspection_h;

package rosidl_typesupport_introspection_c_service_introspection_h is

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
   type rosidl_typesupport_introspection_c_u_ServiceMembers is record
      package_name_u : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_bouncy/install/rosidl_typesupport_introspection_c/include/rosidl_typesupport_introspection_c/service_introspection.h:28
      service_name_u : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_bouncy/install/rosidl_typesupport_introspection_c/include/rosidl_typesupport_introspection_c/service_introspection.h:29
      request_members_u : access constant rosidl_typesupport_introspection_c_message_introspection_h.rosidl_typesupport_introspection_c_u_MessageMembers;  -- /home/jano/local/ros2/ros2_bouncy/install/rosidl_typesupport_introspection_c/include/rosidl_typesupport_introspection_c/service_introspection.h:30
      response_members_u : access constant rosidl_typesupport_introspection_c_message_introspection_h.rosidl_typesupport_introspection_c_u_MessageMembers;  -- /home/jano/local/ros2/ros2_bouncy/install/rosidl_typesupport_introspection_c/include/rosidl_typesupport_introspection_c/service_introspection.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_typesupport_introspection_c_u_ServiceMembers);  -- /home/jano/local/ros2/ros2_bouncy/install/rosidl_typesupport_introspection_c/include/rosidl_typesupport_introspection_c/service_introspection.h:26

end rosidl_typesupport_introspection_c_service_introspection_h;
