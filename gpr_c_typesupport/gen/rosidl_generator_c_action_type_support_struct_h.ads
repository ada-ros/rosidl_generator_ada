pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c_service_type_support_struct_h;
limited with rosidl_generator_c_message_type_support_struct_h;

package rosidl_generator_c_action_type_support_struct_h is

   --  arg-macro: procedure ROSIDL_GET_ACTION_TYPE_SUPPORT (PkgName, Name)
   --    ROSIDL_TYPESUPPORT_INTERFACE__ACTION_SYMBOL_NAME( rosidl_typesupport_c, PkgName, action, Name)()
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
   type rosidl_action_type_support_t is record
      goal_service_type_support : access constant rosidl_generator_c_service_type_support_struct_h.rosidl_service_type_support_t;  -- /opt/ros/dashing/include/rosidl_generator_c/action_type_support_struct.h:32
      result_service_type_support : access constant rosidl_generator_c_service_type_support_struct_h.rosidl_service_type_support_t;  -- /opt/ros/dashing/include/rosidl_generator_c/action_type_support_struct.h:33
      cancel_service_type_support : access constant rosidl_generator_c_service_type_support_struct_h.rosidl_service_type_support_t;  -- /opt/ros/dashing/include/rosidl_generator_c/action_type_support_struct.h:34
      feedback_message_type_support : access constant rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/dashing/include/rosidl_generator_c/action_type_support_struct.h:35
      status_message_type_support : access constant rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/dashing/include/rosidl_generator_c/action_type_support_struct.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_action_type_support_t);  -- /opt/ros/dashing/include/rosidl_generator_c/action_type_support_struct.h:30

end rosidl_generator_c_action_type_support_struct_h;
