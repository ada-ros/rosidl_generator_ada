pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with x86_64_linux_gnu_bits_stdint_intn_h;
limited with rcutils_rcutils_allocator_h;
with System;
with Interfaces.C.Extensions;
limited with rosidl_runtime_c_rosidl_runtime_c_type_hash_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h;
limited with rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h;

package rosidl_runtime_c_rosidl_runtime_c_service_type_support_struct_h is

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
   type rosidl_service_type_support_t;
   type rosidl_service_typesupport_handle_function is access function (arg1 : access constant rosidl_service_type_support_t; arg2 : Interfaces.C.Strings.chars_ptr) return access constant rosidl_service_type_support_t
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:34

   type anon_array1537 is array (0 .. 15) of aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;
   type rosidl_service_introspection_info_s is record
      event_type : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:39
      stamp_sec : aliased x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:40
      stamp_nanosec : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:41
      client_gid : aliased anon_array1537;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:42
      sequence_number : aliased x86_64_linux_gnu_bits_stdint_intn_h.int64_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:43
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:37

   subtype rosidl_service_introspection_info_t is rosidl_service_introspection_info_s;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:44

  --/ Creates a ServiceEvent message for the service.
  --*
  -- * Instantiates a ServiceEvent message with the given info and request/response message.
  -- * The message is allocated using the given allocator and must be deallocated using
  -- * the rosidl_service_introspection_destroy_handle
  -- *
  -- * \param[in] info POD fields of service_msgs/msg/ServiceEventInfo to be passed from rcl
  -- * \param[in] allocator The allocator to use for allocating the ServiceEvent message
  -- * \param[in] request_message type-erased handle to request message from rcl. Can be NULL.
  -- * \param[in] response_message type-erased handle to request message from rcl. Can be NULL.
  -- * \return The built ServiceEvent message. Will return NULL if the message could not be built.
  -- * 

   type rosidl_event_message_create_handle_function_function is access function
        (arg1 : access constant rosidl_service_introspection_info_t;
         arg2 : access rcutils_rcutils_allocator_h.rcutils_allocator_s;
         arg3 : System.Address;
         arg4 : System.Address) return System.Address
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:58

  --/ Destroys a ServiceEvent message
  --*
  -- * Destroys a ServiceEvent message returned by a rosidl_service_introspection_message_create_handle
  -- * by calling the corresponding __fini function then deallocating
  -- *
  -- * \param[in] event_message The message to destroy.
  -- * \param[in] allocator The allocator to use for deallocating the message.
  --  

   type rosidl_event_message_destroy_handle_function_function is access function (arg1 : System.Address; arg2 : access rcutils_rcutils_allocator_h.rcutils_allocator_s) return Extensions.bool
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:72

   type rosidl_service_get_type_hash_function is access function (arg1 : access constant rosidl_service_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_hash_h.rosidl_type_hash_s
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:77

   type rosidl_service_get_type_description_function is access function (arg1 : access constant rosidl_service_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:80

   type rosidl_service_get_type_description_sources_function is access function (arg1 : access constant rosidl_service_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeSource_u_Sequence
   with Convention => C;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:83

  --/ Contains rosidl service type support data
  --/ String identifier for the type_support.
   type rosidl_service_type_support_t is record
      typesupport_identifier : Interfaces.C.Strings.chars_ptr;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:89
      data : System.Address;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:91
      func : rosidl_service_typesupport_handle_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:93
      request_typesupport : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:95
      response_typesupport : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:97
      event_typesupport : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:99
      event_message_create_handle_function : rosidl_event_message_create_handle_function_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:101
      event_message_destroy_handle_function : rosidl_event_message_destroy_handle_function_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:103
      get_type_hash_func : rosidl_service_get_type_hash_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:105
      get_type_description_func : rosidl_service_get_type_description_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:107
      get_type_description_sources_func : rosidl_service_get_type_description_sources_function;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:109
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:86

  --/ Pointer to the service type support library
  --/ Pointer to the service type support handler function
  --/ Service request message typesupport
  --/ Service response message typesupport
  --/ Service event message typesupport
  --/ Pointer to function to create the introspection message
  --/ Pointer to function to finalize the introspection message
  --/ Pointer to function to get the hash of the message's description
  --/ Pointer to function to get the description of the type
  --/ Pointer to function to get the text of the sources that defined the description of the type
  --/ Get the service type support handle specific to this identifier.
  --*
  -- * The handle's message typesupport identifier function is returned or if the parameters are NULL
  -- * then an assert will happen.
  -- *
  -- * \param handle Handle to service type support
  -- * \param identifier The typesupport identifier to get the handle function for
  -- * \return The associated service typesupport handle function.
  --  

   function get_service_typesupport_handle (handle : access constant rosidl_service_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_service_type_support_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:122
   with Import => True, 
        Convention => C, 
        External_Name => "get_service_typesupport_handle";

  --/ Get the service type support handle function specific to this identifier.
  --*
  --* If the identifier is the same as this handle's typesupport_identifier the handle is simply
  --* returned or if the parameters are NULL then an assert will happen.
  -- *
  -- * \param handle Handle to service type support
  -- * \param identifier The typesupport identifier to get the handle function for
  -- * \return if the identifier match's the handle's identifier then the handle's function
  -- *   is returned.
  --  

   function get_service_typesupport_handle_function (handle : access constant rosidl_service_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_service_type_support_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/service_type_support_struct.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "get_service_typesupport_handle_function";

  --/ Get the service type support given a provided action and package.
  -- * \param PkgName Name of the package that contains the service
  -- * \param SrvSubfolder name of the subfolder (for example: srv)
  -- * \param SrvName service name
  -- * \return a rosidl_service_type_support_t struct if founded, otherwise NULL.
  --  

end rosidl_runtime_c_rosidl_runtime_c_service_type_support_struct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
