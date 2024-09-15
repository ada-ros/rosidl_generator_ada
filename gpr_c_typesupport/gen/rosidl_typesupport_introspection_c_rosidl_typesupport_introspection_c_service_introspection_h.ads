pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_message_introspection_h;

package rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_service_introspection_h is

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
  --/ This struct provides introspection information for one service definition.
  --/ A service is comprised of two interfaces: the request and the response.
  --/ The namespace in which the service resides, e.g. "example_messages__srv" for
  --/ example_messages/srv
   type rosidl_typesupport_introspection_c_u_ServiceMembers_s is record
      service_namespace_u : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/service_introspection.h:32
      service_name_u : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/service_introspection.h:34
      request_members_u : access constant rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_message_introspection_h.rosidl_typesupport_introspection_c_u_MessageMembers_s;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/service_introspection.h:36
      response_members_u : access constant rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_message_introspection_h.rosidl_typesupport_introspection_c_u_MessageMembers_s;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/service_introspection.h:38
      event_members_u : access constant rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_message_introspection_h.rosidl_typesupport_introspection_c_u_MessageMembers_s;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/service_introspection.h:40
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/service_introspection.h:28

  --/ The name of the service, e.g. "AddTwoInts"
  --/ A pointer to the introspection information structure for the request interface.
  --/ A pointer to the introspection information structure for the response interface.
  --/ A pointer to the introspection information structure for the event interface.
   subtype rosidl_typesupport_introspection_c_u_ServiceMembers is rosidl_typesupport_introspection_c_u_ServiceMembers_s;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/service_introspection.h:41

end rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_service_introspection_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
