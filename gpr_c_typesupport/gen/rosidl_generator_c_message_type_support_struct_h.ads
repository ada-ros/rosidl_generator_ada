pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package rosidl_generator_c_message_type_support_struct_h is

   --  arg-macro: procedure ROSIDL_GET_MSG_TYPE_SUPPORT (PkgName, MsgSubfolder, MsgName)
   --    ROSIDL_TYPESUPPORT_INTERFACE__MESSAGE_SYMBOL_NAME( rosidl_typesupport_c, PkgName, MsgSubfolder, MsgName)()
  -- Copyright 2015-2016 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
   type rosidl_message_typesupport_handle_function is access function (arg1 : access constant rosidl_message_type_support_t; arg2 : Interfaces.C.Strings.chars_ptr) return access constant rosidl_message_type_support_t;
   pragma Convention (C, rosidl_message_typesupport_handle_function);  -- /opt/ros/crystal/include/rosidl_generator_c/message_type_support_struct.h:28

   type rosidl_message_type_support_t is record
      typesupport_identifier : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/crystal/include/rosidl_generator_c/message_type_support_struct.h:33
      data : System.Address;  -- /opt/ros/crystal/include/rosidl_generator_c/message_type_support_struct.h:34
      func : rosidl_message_typesupport_handle_function;  -- /opt/ros/crystal/include/rosidl_generator_c/message_type_support_struct.h:35
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_message_type_support_t);  -- /opt/ros/crystal/include/rosidl_generator_c/message_type_support_struct.h:31

   function get_message_typesupport_handle (handle : access constant rosidl_message_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_message_type_support_t;  -- /opt/ros/crystal/include/rosidl_generator_c/message_type_support_struct.h:39
   pragma Import (C, get_message_typesupport_handle, "get_message_typesupport_handle");

   function get_message_typesupport_handle_function (handle : access constant rosidl_message_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_message_type_support_t;  -- /opt/ros/crystal/include/rosidl_generator_c/message_type_support_struct.h:43
   pragma Import (C, get_message_typesupport_handle_function, "get_message_typesupport_handle_function");

end rosidl_generator_c_message_type_support_struct_h;
