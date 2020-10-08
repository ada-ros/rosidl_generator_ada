pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package rosidl_runtime_c_message_initialization_h is

  -- Copyright 2017 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
   type rosidl_runtime_c_u_message_initialization is 
     (ROSIDL_RUNTIME_C_MSG_INIT_ALL,
      ROSIDL_RUNTIME_C_MSG_INIT_SKIP,
      ROSIDL_RUNTIME_C_MSG_INIT_ZERO,
      ROSIDL_RUNTIME_C_MSG_INIT_DEFAULTS_ONLY)
   with Convention => C;  -- /opt/ros/foxy/include/rosidl_runtime_c/message_initialization.h:18

  -- Initialize all fields of the message, either with the default value
  -- (if the field has one), or with an empty value (generally 0 or an
  -- empty string).
  -- Skip initialization of all fields of the message.  It is up to the user to
  -- ensure that all fields are initialized before use.
  -- Initialize all fields of the message to an empty value (generally 0 or an
  -- empty string).
  -- Initialize all fields of the message that have defaults; all other fields
  -- are left untouched.
end rosidl_runtime_c_message_initialization_h;
