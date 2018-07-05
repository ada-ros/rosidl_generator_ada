pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_stdint_intn_h;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with stddef_h;

package builtin_interfaces_msg_duration_ustruct_h is

  -- generated from rosidl_generator_c/resource/msg__struct.h.em
  -- generated code does not contain a copyright notice
  --/ Struct of message builtin_interfaces/Duration
   type builtin_interfaces_u_msg_u_Duration is record
      sec : aliased x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /home/jano/local/ros2/ros2_bouncy/install/builtin_interfaces/include/builtin_interfaces/msg/duration__struct.h:19
      nanosec : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /home/jano/local/ros2/ros2_bouncy/install/builtin_interfaces/include/builtin_interfaces/msg/duration__struct.h:20
   end record;
   pragma Convention (C_Pass_By_Copy, builtin_interfaces_u_msg_u_Duration);  -- /home/jano/local/ros2/ros2_bouncy/install/builtin_interfaces/include/builtin_interfaces/msg/duration__struct.h:17

  --/ Struct for an array of messages
   type builtin_interfaces_u_msg_u_Duration_u_Array is record
      data : access builtin_interfaces_u_msg_u_Duration;  -- /home/jano/local/ros2/ros2_bouncy/install/builtin_interfaces/include/builtin_interfaces/msg/duration__struct.h:26
      size : aliased stddef_h.size_t;  -- /home/jano/local/ros2/ros2_bouncy/install/builtin_interfaces/include/builtin_interfaces/msg/duration__struct.h:28
      capacity : aliased stddef_h.size_t;  -- /home/jano/local/ros2/ros2_bouncy/install/builtin_interfaces/include/builtin_interfaces/msg/duration__struct.h:30
   end record;
   pragma Convention (C_Pass_By_Copy, builtin_interfaces_u_msg_u_Duration_u_Array);  -- /home/jano/local/ros2/ros2_bouncy/install/builtin_interfaces/include/builtin_interfaces/msg/duration__struct.h:24

  --/ The number of valid items in data
  --/ The number of allocated items in data
end builtin_interfaces_msg_duration_ustruct_h;
