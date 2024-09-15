pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
limited with rosidl_runtime_c_rosidl_runtime_c_type_hash_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h;
limited with rosidl_runtime_c_rosidl_runtime_c_service_type_support_struct_h;
limited with rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h;

package rosidl_runtime_c_rosidl_runtime_c_action_type_support_struct_h is

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
   type rosidl_action_type_support_t;
   type rosidl_action_get_type_hash_function is access function (arg1 : access constant rosidl_action_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_hash_h.rosidl_type_hash_s
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:32

   type rosidl_action_get_type_description_function is access function (arg1 : access constant rosidl_action_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:35

   type rosidl_action_get_type_description_sources_function is access function (arg1 : access constant rosidl_action_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeSource_u_Sequence
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:38

  --/ Contains rosidl action type support data.
  -- * Actions are built based on services(goal, result and cancel) and message (feedback and status).
  --  

   type rosidl_action_type_support_t is record
      goal_service_type_support : access constant rosidl_runtime_c_rosidl_runtime_c_service_type_support_struct_h.rosidl_service_type_support_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:46
      result_service_type_support : access constant rosidl_runtime_c_rosidl_runtime_c_service_type_support_struct_h.rosidl_service_type_support_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:47
      cancel_service_type_support : access constant rosidl_runtime_c_rosidl_runtime_c_service_type_support_struct_h.rosidl_service_type_support_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:48
      feedback_message_type_support : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:49
      status_message_type_support : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:50
      get_type_hash_func : rosidl_action_get_type_hash_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:52
      get_type_description_func : rosidl_action_get_type_description_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:54
      get_type_description_sources_func : rosidl_action_get_type_description_sources_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:56
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/action_type_support_struct.h:44

  --/ Pointer to function to get the hash of the action's description
  --/ Pointer to function to get the description of the type
  --/ Pointer to function to get the text of the sources that defined the description of the type
  --/ Get the action type support given a provided action and package.
  -- * \param PkgName name of the package that contains the action
  -- * \param Name action name
  -- * \return a rosidl_action_type_support_t struct if found, otherwise NULL.
  --  

end rosidl_runtime_c_rosidl_runtime_c_action_type_support_struct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
