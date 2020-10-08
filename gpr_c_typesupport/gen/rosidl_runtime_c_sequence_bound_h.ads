pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package rosidl_runtime_c_sequence_bound_h is

   --  arg-macro: procedure ROSIDL_GET_SEQUENCE_BOUNDS (PkgName, MsgSubfolder, MsgName)
   --    ROSIDL_BOUNDS_INTERFACE__MESSAGE_SYMBOL_NAME( rosidl_typesupport_c, PkgName, MsgSubfolder, MsgName)()
  -- Copyright 2015-2018 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
   type rosidl_runtime_c_u_Sequence_u_bound;
   type rosidl_runtime_c_u_bound_handle_function is access function (arg1 : access constant rosidl_runtime_c_u_Sequence_u_bound; arg2 : Interfaces.C.Strings.chars_ptr) return access constant rosidl_runtime_c_u_Sequence_u_bound
   with Convention => C;  -- /opt/ros/foxy/include/rosidl_runtime_c/sequence_bound.h:28

  --/ String identifier for the type_support.
   type rosidl_runtime_c_u_Sequence_u_bound is record
      typesupport_identifier : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/foxy/include/rosidl_runtime_c/sequence_bound.h:34
      data : System.Address;  -- /opt/ros/foxy/include/rosidl_runtime_c/sequence_bound.h:36
      func : rosidl_runtime_c_u_bound_handle_function;  -- /opt/ros/foxy/include/rosidl_runtime_c/sequence_bound.h:37
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/foxy/include/rosidl_runtime_c/sequence_bound.h:31

  --/ Pointer to type support handle function
  --/ Get the message bounds handle specific to this identifier.
  --*
  -- * The handle's sequence bound is simply returned or if the parameters are NULL then an assert
  -- * will happen.
  -- *
  -- * \param handle Handle to service type support
  -- * \param identifier The identifier to get the handle for
  -- * \return The associated sequence bound handle function.
  --  

   function get_sequence_bound_handle (handle : access constant rosidl_runtime_c_u_Sequence_u_bound; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_runtime_c_u_Sequence_u_bound  -- /opt/ros/foxy/include/rosidl_runtime_c/sequence_bound.h:50
   with Import => True, 
        Convention => C, 
        External_Name => "get_sequence_bound_handle";

  --/ Get the message bounds handle function specific to this identifier.
  --*
  -- * If the identifier is the same as this handle function's identifier the handle is simply returned
  -- * or if the parameters are NULL then an assert will happen.
  -- *
  -- * \param handle Handle to service type support
  -- * \param identifier The identifier to get the handle function for
  -- * \return if the identifier match's the handle's identifier then the handle's function
  -- *   is returned.
  --  

   function get_sequence_bound_handle_function (handle : access constant rosidl_runtime_c_u_Sequence_u_bound; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_runtime_c_u_Sequence_u_bound  -- /opt/ros/foxy/include/rosidl_runtime_c/sequence_bound.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "get_sequence_bound_handle_function";

  --/ Get the sequence bounds given a provided action and package.
  -- * \param PkgName Name of the package that contains the message
  -- * \param MsgSubfolder name of the subfolder (foe example: msg)
  -- * \param MsgName message name
  -- * \return a rosidl_message_bounds_t struct if founded, otherwise NULL.
  --  

end rosidl_runtime_c_sequence_bound_h;
