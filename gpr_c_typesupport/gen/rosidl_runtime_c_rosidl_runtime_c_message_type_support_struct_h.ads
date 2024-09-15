pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with rosidl_runtime_c_rosidl_runtime_c_type_hash_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h;
with System;

package rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h is

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
   type rosidl_message_type_support_t;
   type rosidl_message_typesupport_handle_function is access function (arg1 : access constant rosidl_message_type_support_t; arg2 : Interfaces.C.Strings.chars_ptr) return access constant rosidl_message_type_support_t
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:31

   type rosidl_message_get_type_hash_function is access function (arg1 : access constant rosidl_message_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_hash_h.rosidl_type_hash_s
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:35

   type rosidl_message_get_type_description_function is access function (arg1 : access constant rosidl_message_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:38

   type rosidl_message_get_type_description_sources_function is access function (arg1 : access constant rosidl_message_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeSource_u_Sequence
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:41

  --/ Contains rosidl message type support data
  --/ String identifier for the type_support.
   type rosidl_message_type_support_t is record
      typesupport_identifier : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:47
      data : System.Address;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:49
      func : rosidl_message_typesupport_handle_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:51
      get_type_hash_func : rosidl_message_get_type_hash_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:53
      get_type_description_func : rosidl_message_get_type_description_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:55
      get_type_description_sources_func : rosidl_message_get_type_description_sources_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:57
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:44

  --/ Pointer to the message type support library
  --/ Pointer to the message type support handler function
  --/ Pointer to function to get the hash of the message's description
  --/ Pointer to function to get the description of the type
  --/ Pointer to function to get the text of the sources that defined the description of the type
  --/ Return a rosidl_message_type_support_t struct with members set to `NULL`.
   function rosidl_get_zero_initialized_message_type_support_handle return rosidl_message_type_support_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_get_zero_initialized_message_type_support_handle";

  --/ Get the message type support handle specific to this identifier.
  --*
  -- * The handle's message typesupport identifier function is returned or if the parameters are NULL
  -- * then an assert will happen.
  -- *
  -- * \param handle Handle to message type support
  -- * \param identifier The typesupport identifier to get the handle function for
  -- * \return The associated message typesupport handle function.
  --  

   function get_message_typesupport_handle (handle : access constant rosidl_message_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_message_type_support_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:74
   with Import => True, 
        Convention => C, 
        External_Name => "get_message_typesupport_handle";

  -- Get the message type support handle function specific to this identifier.
  --*
  -- * If the identifier is the same as this handle's typesupport_identifier the handle is simply
  -- * returned or if the parameters are NULL then an assert will happen.
  -- *
  -- * \param handle Handle to message type support
  -- * \param identifier The typesupport identifier to get the handle function for
  -- * \return if the identifier match's the handle's identifier then the handle's function
  -- *   is returned.
  --  

   function get_message_typesupport_handle_function (handle : access constant rosidl_message_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_message_type_support_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/message_type_support_struct.h:88
   with Import => True, 
        Convention => C, 
        External_Name => "get_message_typesupport_handle_function";

  --/ Get the message type support given a provided action and package.
  -- * \param PkgName Name of the package that contains the message
  -- * \param MsgSubfolder name of the subfolder (for example: msg)
  -- * \param MsgName message name
  -- * \return a rosidl_message_type_support_t struct if founded, otherwise NULL.
  --  

end rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
