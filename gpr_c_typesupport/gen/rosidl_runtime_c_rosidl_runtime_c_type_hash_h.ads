pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with rcutils_rcutils_allocator_h;
with System;
with rcutils_rcutils_types_rcutils_ret_h;
with Interfaces.C.Strings;

package rosidl_runtime_c_rosidl_runtime_c_type_hash_h is

   ROSIDL_TYPE_HASH_VERSION_UNSET : constant := 0;  --  /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_hash.h:25
   --  unsupported macro: ROSIDL_TYPE_HASH_SIZE RCUTILS_SHA256_BLOCK_SIZE

  -- Copyright 2023 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
  --/ A ROS 2 interface type hash per REP-2011 RIHS standard.
   type anon_array1174 is array (0 .. 31) of aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;
   type rosidl_type_hash_s is record
      version : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_hash.h:36
      value : aliased anon_array1174;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_hash.h:37
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_hash.h:34

   subtype rosidl_type_hash_t is rosidl_type_hash_s;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_hash.h:38

  --/ Get a new zero-initialized type hash structure.
  --*
  -- * Note that the version equals ROSIDL_TYPE_HASH_VERSION_UNSET.
  --  

   function rosidl_get_zero_initialized_type_hash return rosidl_type_hash_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_hash.h:46
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_get_zero_initialized_type_hash";

  --/ Convert type hash to a standardized string representation.
  --*
  -- * Follows format RIHS{version}_{value}.
  -- *
  -- * \param[in] type_hash Type hash to convert to string
  -- * \param[in] allocator Allocator to use for allocating string space
  -- * \param[out] output_string Handle to a pointer that will be set
  -- *   to the newly allocated null-terminated string representation.
  -- * \return RCUTILS_RET_INVALID_ARGUMENT if any pointer arguments are null or allocator invalid
  -- * \return RCUTILS_RET_BAD_ALLOC if space could not be allocated for resulting string
  -- * \return RCUTILS_RET_OK otherwise
  --  

   function rosidl_stringify_type_hash
     (type_hash : access constant rosidl_type_hash_t;
      allocator : rcutils_rcutils_allocator_h.rcutils_allocator_t;
      output_string : System.Address) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_hash.h:62
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_stringify_type_hash";

  --/ Parse a stringified type hash to a struct.
  --*
  -- * \param[in] type_hash_string Null-terminated string with the hash representation
  -- * \param[out] hash_out Preallocated structure to be filled with parsed hash information.
  -- *   hash_out->version will be 0 if no version could be parsed,
  -- *   but if a version could be determined this field will be set even if an error is returned
  -- * \return RCTUILS_RET_INVALID_ARGUMENT on any null pointer argumunts, or malformed hash string.
  -- * \return RCUTILS_RET_OK otherwise
  --  

   function rosidl_parse_type_hash_string (type_hash_string : Interfaces.C.Strings.chars_ptr; hash_out : access rosidl_type_hash_t) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_hash.h:78
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_parse_type_hash_string";

end rosidl_runtime_c_rosidl_runtime_c_type_hash_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
