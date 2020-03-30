pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rosidl_generator_c_string_h;
with stddef_h;

package std_msgs_msg_string_ustruct_h is

  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from std_msgs:msg/String.idl
  -- generated code does not contain a copyright notice
  -- Constants defined in the message
  -- Include directives for member types
  -- Member 'data'
  -- Struct defined in msg/String in the package std_msgs.
   type std_msgs_u_msg_u_String is record
      data : aliased rosidl_generator_c_string_h.rosidl_generator_c_u_String;  -- /opt/ros/dashing/include/std_msgs/msg/string__struct.h:27
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_String);  -- /opt/ros/dashing/include/std_msgs/msg/string__struct.h:25

  -- Struct for a sequence of std_msgs__msg__String.
   type std_msgs_u_msg_u_String_u_Sequence is record
      data : access std_msgs_u_msg_u_String;  -- /opt/ros/dashing/include/std_msgs/msg/string__struct.h:33
      size : aliased stddef_h.size_t;  -- /opt/ros/dashing/include/std_msgs/msg/string__struct.h:35
      capacity : aliased stddef_h.size_t;  -- /opt/ros/dashing/include/std_msgs/msg/string__struct.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_String_u_Sequence);  -- /opt/ros/dashing/include/std_msgs/msg/string__struct.h:31

  --/ The number of valid items in data
  --/ The number of allocated items in data
end std_msgs_msg_string_ustruct_h;
