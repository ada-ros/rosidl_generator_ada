pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with rosidl_runtime_c_rosidl_runtime_c_string_h;
with stddef_h;

package rosidl_runtime_c_rosidl_runtime_c_type_description_field_type_ustruct_h is

  -- DO NOT EDIT MANUALLY - this copied file managed by copy_type_description_generated_sources.bash
  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from type_description_interfaces:msg/FieldType.idl
  -- generated code does not contain a copyright notice
  -- Constants defined in the message
  --/ Constant 'FIELD_TYPE_NOT_SET'.
  --*
  --  * A constant for each type supported according to:
  --  *   http://design.ros2.org/articles/legacy_interface_definition.html
  --  * and:
  --  *   http://design.ros2.org/articles/idl_interface_definition.html
  --  * Order is loosely coupled to the order of appearance in the IDL 4.2 spec:
  --  *  https://www.omg.org/spec/IDL/4.2
  --  * Layout of constants across the 0-255 decimal values in the uint8:
  --  *
  --  * - 000    : Reserved for "not set"
  --  * - 001-048: Primitive types, strings, and reserved space for future primitive types
  --  * - 049-096: Fixed sized array of primitive and string types
  --  * - 097-144: Bounded Sequences of primitive and string types
  --  * - 145-192: Unbounded Sequences of primitive and string types
  --  * - 193-255: Reserved space for future array/sequence-like types
  --  

  --/ Constant 'FIELD_TYPE_NESTED_TYPE'.
  --*
  --  * Nested type defined in other .msg/.idl files.
  --  

  --/ Constant 'FIELD_TYPE_INT8'.
  --*
  --  * Integer Types
  --  

  --/ Constant 'FIELD_TYPE_UINT8'.
  --/ Constant 'FIELD_TYPE_INT16'.
  --/ Constant 'FIELD_TYPE_UINT16'.
  --/ Constant 'FIELD_TYPE_INT32'.
  --/ Constant 'FIELD_TYPE_UINT32'.
  --/ Constant 'FIELD_TYPE_INT64'.
  --/ Constant 'FIELD_TYPE_UINT64'.
  --/ Constant 'FIELD_TYPE_FLOAT'.
  --*
  --  * Floating-Point Types
  --  

  --/ Constant 'FIELD_TYPE_DOUBLE'.
  --/ Constant 'FIELD_TYPE_LONG_DOUBLE'.
  --/ Constant 'FIELD_TYPE_CHAR'.
  --*
  --  * Char and WChar Types
  --  

  --/ Constant 'FIELD_TYPE_WCHAR'.
  --/ Constant 'FIELD_TYPE_BOOLEAN'.
  --*
  --  * Boolean Type
  --  

  --/ Constant 'FIELD_TYPE_BYTE'.
  --*
  --  * Byte/Octet Type
  --  

  --/ Constant 'FIELD_TYPE_STRING'.
  --*
  --  * String Types
  --  

  --/ Constant 'FIELD_TYPE_WSTRING'.
  --/ Constant 'FIELD_TYPE_FIXED_STRING'.
  --*
  --  * Fixed String Types
  --  

  --/ Constant 'FIELD_TYPE_FIXED_WSTRING'.
  --/ Constant 'FIELD_TYPE_BOUNDED_STRING'.
  --*
  --  * Bounded String Types
  --  

  --/ Constant 'FIELD_TYPE_BOUNDED_WSTRING'.
  --/ Constant 'FIELD_TYPE_NESTED_TYPE_ARRAY'.
  --*
  --  * Fixed Sized Array Types
  --  

  --/ Constant 'FIELD_TYPE_INT8_ARRAY'.
  --/ Constant 'FIELD_TYPE_UINT8_ARRAY'.
  --/ Constant 'FIELD_TYPE_INT16_ARRAY'.
  --/ Constant 'FIELD_TYPE_UINT16_ARRAY'.
  --/ Constant 'FIELD_TYPE_INT32_ARRAY'.
  --/ Constant 'FIELD_TYPE_UINT32_ARRAY'.
  --/ Constant 'FIELD_TYPE_INT64_ARRAY'.
  --/ Constant 'FIELD_TYPE_UINT64_ARRAY'.
  --/ Constant 'FIELD_TYPE_FLOAT_ARRAY'.
  --/ Constant 'FIELD_TYPE_DOUBLE_ARRAY'.
  --/ Constant 'FIELD_TYPE_LONG_DOUBLE_ARRAY'.
  --/ Constant 'FIELD_TYPE_CHAR_ARRAY'.
  --/ Constant 'FIELD_TYPE_WCHAR_ARRAY'.
  --/ Constant 'FIELD_TYPE_BOOLEAN_ARRAY'.
  --/ Constant 'FIELD_TYPE_BYTE_ARRAY'.
  --/ Constant 'FIELD_TYPE_STRING_ARRAY'.
  --/ Constant 'FIELD_TYPE_WSTRING_ARRAY'.
  --/ Constant 'FIELD_TYPE_FIXED_STRING_ARRAY'.
  --/ Constant 'FIELD_TYPE_FIXED_WSTRING_ARRAY'.
  --/ Constant 'FIELD_TYPE_BOUNDED_STRING_ARRAY'.
  --/ Constant 'FIELD_TYPE_BOUNDED_WSTRING_ARRAY'.
  --/ Constant 'FIELD_TYPE_NESTED_TYPE_BOUNDED_SEQUENCE'.
  --*
  --  * Bounded Sequence Types
  --  

  --/ Constant 'FIELD_TYPE_INT8_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_UINT8_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_INT16_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_UINT16_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_INT32_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_UINT32_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_INT64_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_UINT64_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_FLOAT_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_DOUBLE_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_LONG_DOUBLE_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_CHAR_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_WCHAR_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_BOOLEAN_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_BYTE_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_STRING_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_WSTRING_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_FIXED_STRING_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_FIXED_WSTRING_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_BOUNDED_STRING_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_BOUNDED_WSTRING_BOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_NESTED_TYPE_UNBOUNDED_SEQUENCE'.
  --*
  --  * Unbounded Sequence Types
  --  

  --/ Constant 'FIELD_TYPE_INT8_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_UINT8_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_INT16_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_UINT16_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_INT32_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_UINT32_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_INT64_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_UINT64_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_FLOAT_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_DOUBLE_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_LONG_DOUBLE_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_CHAR_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_WCHAR_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_BOOLEAN_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_BYTE_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_STRING_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_WSTRING_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_FIXED_STRING_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_FIXED_WSTRING_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_BOUNDED_STRING_UNBOUNDED_SEQUENCE'.
  --/ Constant 'FIELD_TYPE_BOUNDED_WSTRING_UNBOUNDED_SEQUENCE'.
  -- Include directives for member types
  -- Member 'nested_type_name'
  -- constants for array fields with an upper bound
  -- nested_type_name
  --/ Struct defined in msg/FieldType in the package type_description_interfaces.
  --*
  --  * Represents the type of a field and related meta-data.
  --  

  --/ Identifying number for the type of the field, using one of the above constants.
   type rosidl_runtime_c_u_type_description_u_FieldType is record
      type_id : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field_type__struct.h:624
      capacity : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field_type__struct.h:629
      string_capacity : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field_type__struct.h:636
      nested_type_name : aliased rosidl_runtime_c_rosidl_runtime_c_string_h.rosidl_runtime_c_u_String;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field_type__struct.h:643
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field_type__struct.h:621

  --/ Only used when the type is an array or a bounded sequence.
  --/ In the case of an array, this is the fixed capacity of the array.
  --/ In the case of a bounded sequence, this is the maximum capacity of the sequence.
  --/ In all other cases this field is unused.
  --/ Only used when the type is a fixed or bounded string/wstring, or a array/sequence of those.
  --/ In the case of a fixed string/wstring, it is the fixed length of the string.
  --/ In the case of a bounded string/wstring, it is the maximum capacity of the string.
  --/ In the case of an array/sequence of fixed string/wstring, it is the fixed length of the strings.
  --/ In the case of an array/sequence of bounded string/wstring, it is the maximum capacity of the strings.
  --/ It is not currently possible to have different string capacities per element in the array/sequence.
  --/ Only used when the type is a nested type or array/sequence of nested types.
  --/ This is limited to 255 characters.
  --/ TODO(wjwwood): this 255 character limit was chosen due to this being the limit
  --/   for DDSI-RTPS based middlewares, which is the most commonly used right now.
  --/   We lack a ROS 2 specific limit in our design documents, but we should update
  --/   this and/or link to the design doc when that is available.
  -- Struct for a sequence of rosidl_runtime_c__type_description__FieldType.
   type rosidl_runtime_c_u_type_description_u_FieldType_u_Sequence is record
      data : access rosidl_runtime_c_u_type_description_u_FieldType;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field_type__struct.h:649
      size : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field_type__struct.h:651
      capacity : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field_type__struct.h:653
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/field_type__struct.h:647

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_runtime_c_rosidl_runtime_c_type_description_field_type_ustruct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
