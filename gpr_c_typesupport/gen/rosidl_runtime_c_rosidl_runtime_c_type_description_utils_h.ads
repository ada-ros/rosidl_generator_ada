pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_stdint_uintn_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_field_ustruct_h;
with Interfaces.C.Strings;
with System;
with rcutils_rcutils_types_rcutils_ret_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h;
limited with rcutils_rcutils_allocator_h;
limited with rcutils_rcutils_types_hash_map_h;
with Interfaces.C.Extensions;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h;
with stddef_h;

package rosidl_runtime_c_rosidl_runtime_c_type_description_utils_h is

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
  --*
  -- * \file Utilities for manipulating type_description_interfaces C message structs.
  -- *
  -- * Every instance of a non-message struct (e.g. hash map) borrows, whereas the message structs copy.
  -- * Hence, lifetime should be managed by the message structs.
  --  

   ROSIDL_RUNTIME_C_TYPE_DESCRIPTION_UTILS_SEQUENCE_TYPE_ID_MASK : aliased constant x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:46
   with Import => True, 
        Convention => CPP, 
        External_Name => "_ZL61ROSIDL_RUNTIME_C_TYPE_DESCRIPTION_UTILS_SEQUENCE_TYPE_ID_MASK";

  -- =================================================================================================
  -- GET BY NAME
  -- =================================================================================================
  --/ Get the first Field, matching by name.
  --*
  -- * The `field` output arg must be passed in pointing to `NULL`.
  -- * It will remain pointing to `NULL` if no matching `Field` is found.
  -- *
  -- * Ownership:
  -- * - The output `Field` borrows the `fields` arg's `Field` element. It is not authorized to
  -- *   deallocate it and cannot outlive the owner it borrows from.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] fields array of fields to search through
  -- * \param[in] name field name of the field to look for
  -- * \param[out] field the first field with field name that matches the name arg.
  -- *   Must point to `NULL`, outputs pointing to `NULL` if not found.
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_NOT_FOUND if no `Field` with a matching name is found, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_find_field
     (fields : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_field_ustruct_h.rosidl_runtime_c_u_type_description_u_Field_u_Sequence;
      name : Interfaces.C.Strings.chars_ptr;
      field : System.Address) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_find_field";

  --/ Get the first referenced IndividualTypeDescription, matching by type name.
  --*
  -- * The `referenced_type` output arg must be passed in pointing `NULL`.
  -- * It will remain pointing to `NULL` if no matching `IndividualTypeDescription` is found.
  -- *
  -- * Ownership:
  -- * - The output `IndividualTypeDescription` borrows the `referenced_types` arg's
  -- *   `IndividualTypeDescription` element.
  -- *   It is not authorized to deallocate it and it cannot outlive the `referenced_types` it borrows
  -- *   from.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] referenced_types array of referenced individual type descriptions to search through
  -- * \param[in] type_name name of the referenced referenced individual type description to look for
  -- * \param[out] referenced_type the first individual type description with type name that matches the
  -- *   type_name arg. Must point to `NULL`, outputs pointing to `NULL` if not found.
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_NOT_FOUND if no `IndividualTypeDescription` with matching name is found, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_find_referenced_type_description
     (referenced_types : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription_u_Sequence;
      type_name : Interfaces.C.Strings.chars_ptr;
      referenced_type : System.Address) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_find_referenced_type_description";

  -- =================================================================================================
  -- HASH MAPS
  -- =================================================================================================
  --/ Construct a hash map of an `IndividualTypeDescription`'s `Field` objects, keyed by field name.
  --*
  -- * NOTE: The `hash_map` output arg must be passed in pointing to `NULL`.
  -- *
  -- * Ownership:
  -- * - The caller assumes ownership of the output `rcutils_hash_map_t` and must free it and its
  -- *   elements, but NOT finalize its values.
  -- * - The output `rcutils_hash_map_t` has values that borrows the `individual_description` arg's
  -- *   `Field` objects. It is not authorized to deallocate them and it cannot outlive the owner it
  -- *   borrows from.
  -- *   - Finalizing the `rcutils_hash_map_t` should not result in the map's values getting finalized.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] individual_description the individual type description to get the fields from
  -- * \param[in] allocator the allocator to use through out the lifetime of the hash_map
  -- * \param[out] hash_map `rcutils_hash_map_t` to be initialized, containing `Field` objects keyed by
  -- *   their field names. Must point to `NULL`, outputs pointing to `NULL` if error.
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_get_field_map
     (individual_description : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription;
      allocator : access constant rcutils_rcutils_allocator_h.rcutils_allocator_s;
      hash_map : System.Address) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_get_field_map";

  --/ Construct a hash map of an `IndividualTypeDescription__Sequence`'s `IndividualTypeDescription`
  --/ objects, keyed by type name.
  --*
  -- * The `hash_map` output arg must be passed in pointing to `NULL`.
  -- * Furthermore, if the input `referenced_types` sequence has types with identical names but
  -- * differing structures, this function will return `RCUTILS_RET_INVALID_ARGUMENT` and fail.
  -- *
  -- * Ownership:
  -- * - The caller assumes ownership of the output `rcutils_hash_map_t` and must free it and its
  -- *   elements, but NOT finalize its values.
  -- * - The output `rcutils_hash_map_t` has values that borrows the `referenced_types` arg's
  -- *   `IndividualTypeDescription` elements. It is not authorized to deallocate them and it cannot
  -- *   outlive the `referenced_types` it borrows from.
  -- *   - Finalizing the output `rcutils_hash_map_t` should not result in its values getting finalized.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] referenced_types the referenced individual type descriptions to get the referenced
  -- *                             types from
  -- * \param[in] allocator the allocator to use through out the lifetime of the hash_map
  -- * \param[out] hash_map `rcutils_hash_map_t` to be initialized, containing
  -- *   `IndividualTypeDescription` objects keyed by their type names.
  -- *  Must point to `NULL`, outputs pointing to `NULL` if error.
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_get_referenced_type_description_map
     (referenced_types : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription_u_Sequence;
      allocator : access constant rcutils_rcutils_allocator_h.rcutils_allocator_s;
      hash_map : System.Address) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_get_referenced_type_description_map";

  -- =================================================================================================
  -- DESCRIPTION VALIDITY
  -- =================================================================================================
  --/ Return a map of only the referenced type descriptions that are recursively necessary.
  --*
  -- * The `seen_map` output arg must be passed in pointing to `NULL`.
  -- * It's a parameter so it can be passed into subsequent recursive calls to traverse nested types.
  -- *
  -- * A referenced type description is recursively necessary if it is either:
  -- *   - Needed by a field of the main IndividualTypeDescription
  -- *   - Needed by a field of any prior necessary referenced type descriptions (hence recursive)
  -- *
  -- * For more clarity, an unnecessary referenced type description will not be
  -- * referenced when parsing a TypeDescription, and hence can be excluded.
  -- *
  -- * Ownership:
  -- * - The caller assumes ownership of the output `rcutils_hash_map_t` and must free it and its
  -- *   elements, but NOT finalize its values.
  -- * - The output `rcutils_hash_map_t` has values that borrows the `referenced_types_map` arg's
  -- *   `IndividualTypeDescription` values. It is not authorized to deallocate them and it cannot
  -- *   outlive owner it borrows from.
  -- *   - Finalizing the output `rcutils_hash_map_t` should not result in its values getting finalized.
  -- *
  -- * Procedure:
  -- *   1. Create seen map
  -- *   2. [Iterate through fields]:
  -- *     3. If field is not nested type or field's nested type is seen in the seen map:
  -- *       - Continue
  -- *     4. If nested type is missing in referenced types or nested type name is empty:
  -- *       - Throw error
  -- *     5. Else:
  -- *       - Add to seen map
  -- *       - Recurse on referenced type
  -- *   6. Output seen map
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] main_type_description the main individual type description to check the fields of
  -- * \param[in] referenced_types_map a map of referenced `IndividualTypeDescription` objects from the
  -- *   main individual type description's parent `TypeDescription` object, keyed by their type names.
  -- * \param[in] allocator the allocator to use through out the lifetime of the hash_map.
  -- * \param[in,out] seen_map `rcutils_hash_map_t` of seen necessary `IndividualTypeDescription`
  -- *                         objects keyed by their type names. Used in recursive calls. Must point to
  -- *                         `NULL` for user's top level call, outputs pointing to `NULL` if error.
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_NOT_FOUND if passed referenced types are missing necessary types, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_get_necessary_referenced_type_descriptions_map
     (main_type_description : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription;
      referenced_types_map : access constant rcutils_rcutils_types_hash_map_h.rcutils_hash_map_s;
      allocator : access constant rcutils_rcutils_allocator_h.rcutils_allocator_s;
      seen_map : System.Address) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:262
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_get_necessary_referenced_type_descriptions_map";

  --/ Deep copy a map of individual type descriptions into a new IndividualTypeDescription__Sequence.
  --*
  -- * The `sequence` output arg must be passed in pointing to `NULL`.
  -- *
  -- * This method also validates that each IndividualTypeDescription in the map has a type name that
  -- * matches the key it was indexed by.
  -- *
  -- * Ownership:
  -- * - The caller assumes ownership of the output `IndividualTypeDescription__Sequence` and must free
  -- *   it.
  -- * - The output `IndividualTypeDescription__Sequence` deep copies the values from the `hash_map` arg
  -- *   and so has a separate lifetime from the `hash_map`.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] hash_map the referenced type descriptions map to convert (via deep copy) to a sequence
  -- * \param[out] sequence the `IndividualTypeDescription__Sequence` containing copies of the
  -- *   `IndividualTypeDescription` objects stored in the values of the input `hash_map` arg.
  -- *   Must point to `NULL`, outputs pointing to `NULL` if error.
  -- * \param[in] sort sorts the referenced type descriptions if true, best effort
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_copy_init_sequence_from_referenced_type_descriptions_map
     (hash_map : access constant rcutils_rcutils_types_hash_map_h.rcutils_hash_map_s;
      sequence : System.Address;
      sort : Extensions.bool) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:301
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_copy_init_sequence_from_referenced_type_descriptions_map";

  --/ Helper comparison function for the sorting function
   function rosidl_runtime_c_type_description_utils_referenced_type_description_sequence_sort_compare (lhs : System.Address; rhs : System.Address) return int  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:309
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_referenced_type_description_sequence_sort_compare";

   function rosidl_runtime_c_type_description_utils_sort_referenced_type_descriptions_in_place (sequence : access rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription_u_Sequence) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:314
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_sort_referenced_type_descriptions_in_place";

  --/ Remove unnecessary referenced type descriptions from a sequence of referenced types.
  --*
  -- * IndividualTypeDescription elements are COPY ASSIGNED in-place, and the original sequence is
  -- * shrunken afterwards.
  -- *
  -- * DOES NOT SORT AFTER PRUNING! Call sort separately.
  --  

   function rosidl_runtime_c_type_description_utils_prune_referenced_type_descriptions_in_place (main_type_description : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription; referenced_types : access rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription_u_Sequence) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:326
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_prune_referenced_type_descriptions_in_place";

  --/ Check if field is valid
  --*
  -- * A field is valid if:
  -- *   - Its name is not empty
  -- *     - Note this does not check for valid chars/double underscores
  -- *   - Its field type:
  -- *     - Is set
  -- *     - Has a non-empty nested type name if nested
  --  

   function rosidl_runtime_c_type_description_utils_field_is_valid (field : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_field_ustruct_h.rosidl_runtime_c_u_type_description_u_Field) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:341
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_field_is_valid";

  --/ Check if individual type description is valid
  --*
  -- * An individual type description is valid if:
  -- *   - Its type name is not empty
  -- *     - Note this does not check for valid chars etc.
  -- *   - All of its fields are valid
  -- *   - It does not have duplicate fields
  --  

   function rosidl_runtime_c_type_description_utils_individual_type_description_is_valid (description : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:354
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_individual_type_description_is_valid";

  --/ Check if type description is valid
  --*
  -- * An type description is valid if:
  -- *   - Its main individual type description is valid
  -- *   - Its referenced type descriptions are:
  -- *     - Not duplicated
  -- *     - Not missing necessary type descriptions
  -- *     - Have no unnecessary type descriptions
  -- *     - Individually valid
  -- *     - Sorted
  --  

   function rosidl_runtime_c_type_description_utils_type_description_is_valid (description : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:370
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_type_description_is_valid";

  --/ This is on a best effort basis, it won't work if the fields of the main or necessary referenced
  --/ types are invalid. It prunes then sorts.
   function rosidl_runtime_c_type_description_utils_coerce_to_valid_type_description_in_place (type_description : access rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:377
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_coerce_to_valid_type_description_in_place";

  -- =================================================================================================
  -- DESCRIPTION CONSTRUCTION
  -- =================================================================================================
  --/ Construct a new populated `Field` object.
  --*
  -- * NOTE: The `field` output arg must be passed in pointing to `NULL`.
  -- *
  -- * Ownership:
  -- * - The caller assumes ownership of the output `Field` and must free it and its members.
  -- * - The char * members are copied.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] name the name of the field
  -- * \param[in] name_length the string length of `name` (not counting the null terminator)
  -- * \param[in] type_id the type id of the field (follows the type_description_interfaces definition)
  -- * \param[in] capacity capacity of the field (if it is an array or sequence)
  -- * \param[in] string_capacity capacity of string elements (if the field is an array or sequence of
  -- *                            strings)
  -- * \param[in] nested_type_name the nested type name of the field (if it is a nested type)
  -- * \param[in] nested_type_name_length the string length of `nested_type_name` (not counting the null
  -- *                                    terminator)
  -- * \param[in] default_value literal default value of the field as a string, as it appeared in the
  -- *                          original message definition
  -- * \param[in] default_value_length the string length of `default_value` (not counting the null
  -- *                                    terminator)
  -- * \param[out] field `Field` to be initialized. Must point to `NULL`, outputs pointing to `NULL` if
  -- *                   error.
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_create_field
     (name : Interfaces.C.Strings.chars_ptr;
      name_length : stddef_h.size_t;
      type_id : x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;
      capacity : x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;
      string_capacity : x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;
      nested_type_name : Interfaces.C.Strings.chars_ptr;
      nested_type_name_length : stddef_h.size_t;
      default_value : Interfaces.C.Strings.chars_ptr;
      default_value_length : stddef_h.size_t;
      field : System.Address) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:423
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_create_field";

  --/ Construct a new populated `IndividualTypeDescription` object, with fields sequence of size 0.
  --*
  -- * NOTE: The `individual_description` output arg must be passed in pointing to `NULL`.
  -- *
  -- * Ownership:
  -- * - The caller assumes ownership of the output `IndividualTypeDescription` and must free it and its
  -- *   members.
  -- * - The char * members are copied.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] type_name the name of the individual type description
  -- * \param[in] type_name_length the string length of `type_name` (not counting the null terminator)
  -- * \param[out] individual_description `IndividualTypeDescription` to be initialized. Must point to
  -- *                                    `NULL`, outputs pointing to `NULL` if error.
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_create_individual_type_description
     (type_name : Interfaces.C.Strings.chars_ptr;
      type_name_length : stddef_h.size_t;
      individual_description : System.Address) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:458
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_create_individual_type_description";

  --/ Construct a new populated `TypeDescription` object, with fields and referenced types sequences
  --/ of size 0.
  --*
  -- * NOTE: The `description` output arg must be passed in pointing to `NULL`.
  -- *
  -- * Ownership:
  -- * - The caller assumes ownership of the output `TypeDescription` and must free it and its
  -- *   members.
  -- * - The char * members are copied.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] type_name the name of the type description's main individual type
  -- * \param[in] type_name_length the string length of `type_name` (not counting the null terminator)
  -- * \param[out] type_description `TypeDescription` to be initialized. Must point to `NULL`,
  -- *                                    outputs pointing to `NULL` if error.
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_create_type_description
     (type_name : Interfaces.C.Strings.chars_ptr;
      type_name_length : stddef_h.size_t;
      type_description : System.Address) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:491
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_create_type_description";

  --/ Append a `Field` to an `IndividualTypeDescription`, extending the sequence.
  --*
  -- *
  -- * Ownership:
  -- * - A deep-copy of the `field` is appended to `individual_type_description` on success, the
  -- *   `individual_type_description` is then responsible for freeing the copied `field`.
  -- * - The ownership of the input `field` is not transferred, it must still be freed.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in,out] individual_type_description the individual type description to append to, noop on
  -- *                                            failure
  -- * \param[in,out] field the field to append
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_append_field (individual_type_description : access rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription; field : access rosidl_runtime_c_rosidl_runtime_c_type_description_field_ustruct_h.rosidl_runtime_c_u_type_description_u_Field) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:521
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_append_field";

  --/ Append a referenced `IndividualTypeDescription` to a `TypeDescription`, extending it.
  --*
  -- *
  -- * Ownership:
  -- * - A deep-copy of the `referenced_type_description` is appended to `type_description` on success,
  -- *   the `type_description` is then responsible for freeing the copied
  -- *   `referenced_type_description`.
  -- * - The ownership of the input `referenced_type_description` is not transferred, it must still be
  -- *   freed.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in,out] type_description the type description to append to, noop on failure
  -- * \param[in,out] individual_type_description the individual type description to append
  -- * \param[in] sort sorts the referenced type descriptions if true, best effort
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

   function rosidl_runtime_c_type_description_utils_append_referenced_individual_type_description
     (type_description : access rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription;
      referenced_type_description : access rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription;
      sort : Extensions.bool) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:553
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_append_referenced_individual_type_description";

  --/ Append a referenced `TypeDescription` to a `TypeDescription`, extending it with recursive types.
  --*
  -- *
  -- * Ownership:
  -- * - A deep-copy of the `type_description_to_append` object's main individual type description is
  -- *   appended to `type_description` on success, the `type_description` is then responsible for
  -- *   freeing the copied individual type descriptions.
  -- * - Deep-copies of the `type_description_to_append` object's referenced individual type
  -- *   descriptions are appended to `type_description` on success, the `type_description` is then
  -- *   responsible for freeing the copied individual type descriptions (or the remaining ones if
  -- *   they are pruned).
  -- * - The ownership of the input `type_description` is not transferred, it must still be
  -- *   freed.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in,out] type_description the type description to append to, noop on failure
  -- * \param[in,out] type_description the type description to append
  -- * \param[in] coerce_to_valid coerces input type_description to valid before output if true
  -- *                            (pruning and sorting), best effort
  -- * \return #RCUTILS_RET_OK if successful, or
  -- * \return #RCUTILS_RET_BAD_ALLOC if memory allocation fails, or
  -- * \return #RCUTILS_RET_INVALID_ARGUMENT for invalid arguments, or
  -- * \return #RCUTILS_RET_ERROR if an unknown error occurs.
  --  

  -- This adds the type description's main description as a referenced type, and all necessary
  -- referenced types. Then it prunes and sorts the resulting referenced types sequence.
   function rosidl_runtime_c_type_description_utils_append_referenced_type_description
     (type_description : access rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription;
      type_description_to_append : access rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription;
      coerce_to_valid : Extensions.bool) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:593
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_append_referenced_type_description";

  -- Create a type description from a referenced description, then validate if coerce_to_valid is true
  -- This is done by copy!! This allocates memory and the caller is responsible for deallocating the
  -- output
  -- Create a type description from a referenced description, then validate if coerce_to_valid is true
  -- This is done by copy!! This allocates memory and the caller is responsible for deallocating the
  -- output
   function rosidl_runtime_c_type_description_utils_get_referenced_type_description_as_type_description
     (referenced_descriptions : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription_u_Sequence;
      referenced_description : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription;
      output_description : System.Address;
      coerce_to_valid : Extensions.bool) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:615
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_get_referenced_type_description_as_type_description";

  --/ In-place replace substrings in an individual description's type name and nested names in fields
  --*
  -- * This means the `IndividualTypeDescription`'s' type_name will get replaced and all references
  -- * to any nested_type_names in the description's fields.
  -- *
  -- * NOTE(methylDragon): This method is pretty inefficient because it doesn't do checking and will
  -- *                     re-copy all names.
  --  

   function rosidl_runtime_c_type_description_utils_repl_individual_type_description_type_names_in_place
     (individual_type_description : access rosidl_runtime_c_rosidl_runtime_c_type_description_individual_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_IndividualTypeDescription;
      from : Interfaces.C.Strings.chars_ptr;
      to : Interfaces.C.Strings.chars_ptr) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:632
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_repl_individual_type_description_type_names_in_place";

  --/ In-place replace substrings across all type names (and references to those names)
  --*
  -- * This means all `IndividualTypeDescription` type_names will get replaced, in the main description
  -- * and referenced type descriptions, and also all references to those names (nested_type_name.)
  -- *
  -- * NOTE(methylDragon): This method is pretty inefficient because it doesn't do checking and will
  -- *                     re-copy all names.
  --  

   function rosidl_runtime_c_type_description_utils_repl_all_type_description_type_names_in_place
     (type_description : access rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription;
      from : Interfaces.C.Strings.chars_ptr;
      to : Interfaces.C.Strings.chars_ptr) return rcutils_rcutils_types_rcutils_ret_h.rcutils_ret_t  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description_utils.h:647
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c_type_description_utils_repl_all_type_description_type_names_in_place";

end rosidl_runtime_c_rosidl_runtime_c_type_description_utils_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
