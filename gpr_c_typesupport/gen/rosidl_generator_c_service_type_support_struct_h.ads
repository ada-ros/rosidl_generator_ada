pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package rosidl_generator_c_service_type_support_struct_h is

   --  arg-macro: procedure ROSIDL_GET_SRV_TYPE_SUPPORT (PkgName, SrvSubfolder, SrvName)
   --    ROSIDL_TYPESUPPORT_INTERFACE__SERVICE_SYMBOL_NAME( rosidl_typesupport_c, PkgName, SrvSubfolder, SrvName)()
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
   type rosidl_service_typesupport_handle_function is access function (arg1 : access constant rosidl_service_type_support_t; arg2 : Interfaces.C.Strings.chars_ptr) return access constant rosidl_service_type_support_t;
   pragma Convention (C, rosidl_service_typesupport_handle_function);  -- /opt/ros/dashing/include/rosidl_generator_c/service_type_support_struct.h:29

   type rosidl_service_type_support_t is record
      typesupport_identifier : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/dashing/include/rosidl_generator_c/service_type_support_struct.h:34
      data : System.Address;  -- /opt/ros/dashing/include/rosidl_generator_c/service_type_support_struct.h:35
      func : rosidl_service_typesupport_handle_function;  -- /opt/ros/dashing/include/rosidl_generator_c/service_type_support_struct.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_service_type_support_t);  -- /opt/ros/dashing/include/rosidl_generator_c/service_type_support_struct.h:32

   function get_service_typesupport_handle (handle : access constant rosidl_service_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_service_type_support_t;  -- /opt/ros/dashing/include/rosidl_generator_c/service_type_support_struct.h:40
   pragma Import (C, get_service_typesupport_handle, "get_service_typesupport_handle");

   function get_service_typesupport_handle_function (handle : access constant rosidl_service_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_service_type_support_t;  -- /opt/ros/dashing/include/rosidl_generator_c/service_type_support_struct.h:44
   pragma Import (C, get_service_typesupport_handle_function, "get_service_typesupport_handle_function");

end rosidl_generator_c_service_type_support_struct_h;
