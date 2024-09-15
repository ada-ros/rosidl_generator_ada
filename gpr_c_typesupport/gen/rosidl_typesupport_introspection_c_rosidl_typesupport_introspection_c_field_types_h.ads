pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_field_types_h is

  -- Copyright 2014-2015 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
  --/ Possible types for message fields on a ROS message
  --/ The equivalent OMG IDL and C types of the different fields can be found
  --/ at http://design.ros2.org/articles/idl_interface_definition.html#type-mapping
   subtype rosidl_typesupport_introspection_c_field_types is unsigned;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_FLOAT : constant rosidl_typesupport_introspection_c_field_types := 1;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_DOUBLE : constant rosidl_typesupport_introspection_c_field_types := 2;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_LONG_DOUBLE : constant rosidl_typesupport_introspection_c_field_types := 3;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_CHAR : constant rosidl_typesupport_introspection_c_field_types := 4;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_WCHAR : constant rosidl_typesupport_introspection_c_field_types := 5;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_BOOLEAN : constant rosidl_typesupport_introspection_c_field_types := 6;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_OCTET : constant rosidl_typesupport_introspection_c_field_types := 7;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_UINT8 : constant rosidl_typesupport_introspection_c_field_types := 8;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_INT8 : constant rosidl_typesupport_introspection_c_field_types := 9;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_UINT16 : constant rosidl_typesupport_introspection_c_field_types := 10;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_INT16 : constant rosidl_typesupport_introspection_c_field_types := 11;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_UINT32 : constant rosidl_typesupport_introspection_c_field_types := 12;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_INT32 : constant rosidl_typesupport_introspection_c_field_types := 13;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_UINT64 : constant rosidl_typesupport_introspection_c_field_types := 14;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_INT64 : constant rosidl_typesupport_introspection_c_field_types := 15;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_STRING : constant rosidl_typesupport_introspection_c_field_types := 16;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_WSTRING : constant rosidl_typesupport_introspection_c_field_types := 17;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_MESSAGE : constant rosidl_typesupport_introspection_c_field_types := 18;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_FLOAT32 : constant rosidl_typesupport_introspection_c_field_types := 1;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_FLOAT64 : constant rosidl_typesupport_introspection_c_field_types := 2;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_BOOL : constant rosidl_typesupport_introspection_c_field_types := 6;
   rosidl_typesupport_introspection_c_field_types_rosidl_typesupport_introspection_c_u_ROS_TYPE_BYTE : constant rosidl_typesupport_introspection_c_field_types := 7;  -- /opt/ros/jazzy/include/rosidl_typesupport_introspection_c/rosidl_typesupport_introspection_c/field_types.h:28

  --/ Equivalent to float in C types.
  --/ Equivalent to double in C types.
  --/ Equivalent to long double in C types.
  --/ Equivalent to unsigned char in C types.
  --/ Equivalent to char16_t in C types.
  --/ Equivalent to _Bool in C types.
  --/ Equivalent to unsigned char in C types.
  --/ Equivalent to uint8_t in C types.
  --/ Equivalent to int8_t in C types.
  --/ Equivalent to uint16_t in C types.
  --/ Equivalent to int16_t in C types.
  --/ Equivalent to uint32_t in C types.
  --/ Equivalent to int32_t in C types.
  --/ Equivalent to uint64_t in C types.
  --/ Equivalent to int64_t in C types.
  --/ Equivalent to char * in C types.
  --/ Equivalent to char16_t * in C types.
  --/ An embedded message type.
  --/ For backward compatibility only.
  --/ For backward compatibility only.
  --/ For backward compatibility only.
  --/ For backward compatibility only.
end rosidl_typesupport_introspection_c_rosidl_typesupport_introspection_c_field_types_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
