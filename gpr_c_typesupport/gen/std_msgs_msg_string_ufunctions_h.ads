pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with std_msgs_msg_string_ustruct_h;
with Interfaces.C.Extensions;
with stddef_h;

package std_msgs_msg_string_ufunctions_h is

  -- generated from rosidl_generator_c/resource/msg__functions.h.em
  -- generated code does not contain a copyright notice
  --/ Initialize std_msgs/String message.
  --*
  -- * If the init function is called twice for the same message without
  -- * calling fini inbetween previously allocated memory will be leaked.
  -- * \param[in,out] msg The previously allocated message pointer.
  -- * Fields without a default value will not be initialized by this function.
  -- * You might want to call memset(msg, 0, sizeof(std_msgs__msg__String)) before
  -- * or use std_msgs__msg__String__create() to allocate and initialize the message.
  -- * \return true if initialization was successful, otherwise false
  --  

   function std_msgs_u_msg_u_String_u_init (msg : access std_msgs_msg_string_ustruct_h.std_msgs_u_msg_u_String) return Extensions.bool;  -- /home/jano/local/ros2/ros2_bouncy/install/std_msgs/include/std_msgs/msg/string__functions.h:32
   pragma Import (C, std_msgs_u_msg_u_String_u_init, "std_msgs__msg__String__init");

  --/ Finalize std_msgs/String message.
  --*
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure std_msgs_u_msg_u_String_u_fini (msg : access std_msgs_msg_string_ustruct_h.std_msgs_u_msg_u_String);  -- /home/jano/local/ros2/ros2_bouncy/install/std_msgs/include/std_msgs/msg/string__functions.h:40
   pragma Import (C, std_msgs_u_msg_u_String_u_fini, "std_msgs__msg__String__fini");

  --/ Create std_msgs/String message.
  --*
  -- * It allocates the memory for the message, sets the memory to zero, and
  -- * calls std_msgs__msg__String__init().
  -- * \return The pointer to the initialized message if successful,
  -- * otherwise NULL
  --  

   function std_msgs_u_msg_u_String_u_create return access std_msgs_msg_string_ustruct_h.std_msgs_u_msg_u_String;  -- /home/jano/local/ros2/ros2_bouncy/install/std_msgs/include/std_msgs/msg/string__functions.h:51
   pragma Import (C, std_msgs_u_msg_u_String_u_create, "std_msgs__msg__String__create");

  --/ Destroy std_msgs/String message.
  --*
  -- * It calls std_msgs__msg__String__fini() and frees the memory of the message.
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure std_msgs_u_msg_u_String_u_destroy (msg : access std_msgs_msg_string_ustruct_h.std_msgs_u_msg_u_String);  -- /home/jano/local/ros2/ros2_bouncy/install/std_msgs/include/std_msgs/msg/string__functions.h:60
   pragma Import (C, std_msgs_u_msg_u_String_u_destroy, "std_msgs__msg__String__destroy");

  --/ Initialize array of std_msgs/String messages.
  --*
  -- * It allocates the memory for the number of elements and
  -- * calls std_msgs__msg__String__init() for each element of the array.
  -- * \param[in,out] array The allocated array pointer.
  -- * \param[in] size The size / capacity of the array.
  -- * \return true if initialization was successful, otherwise false
  -- * If the array pointer is valid and the size is zero it is guaranteed
  -- # to return true.
  --  

   function std_msgs_u_msg_u_String_u_Array_u_init (c_array : access std_msgs_msg_string_ustruct_h.std_msgs_u_msg_u_String_u_Array; size : stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_bouncy/install/std_msgs/include/std_msgs/msg/string__functions.h:75
   pragma Import (C, std_msgs_u_msg_u_String_u_Array_u_init, "std_msgs__msg__String__Array__init");

  --/ Finalize array of std_msgs/String messages.
  --*
  -- * It calls std_msgs__msg__String__fini() for each element of the array and
  -- * frees the memory for the number of elements.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure std_msgs_u_msg_u_String_u_Array_u_fini (c_array : access std_msgs_msg_string_ustruct_h.std_msgs_u_msg_u_String_u_Array);  -- /home/jano/local/ros2/ros2_bouncy/install/std_msgs/include/std_msgs/msg/string__functions.h:85
   pragma Import (C, std_msgs_u_msg_u_String_u_Array_u_fini, "std_msgs__msg__String__Array__fini");

  --/ Create array of std_msgs/String messages.
  --*
  -- * It allocates the memory for the array and
  -- * calls std_msgs__msg__String__Array__init().
  -- * \param[in] size The size / capacity of the array.
  -- * \return The pointer to the initialized array if successful, otherwise NULL
  --  

   function std_msgs_u_msg_u_String_u_Array_u_create (size : stddef_h.size_t) return access std_msgs_msg_string_ustruct_h.std_msgs_u_msg_u_String_u_Array;  -- /home/jano/local/ros2/ros2_bouncy/install/std_msgs/include/std_msgs/msg/string__functions.h:96
   pragma Import (C, std_msgs_u_msg_u_String_u_Array_u_create, "std_msgs__msg__String__Array__create");

  --/ Destroy array of std_msgs/String messages.
  --*
  -- * It calls std_msgs__msg__String__Array__fini() on the array,
  -- * and frees the memory of the array.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure std_msgs_u_msg_u_String_u_Array_u_destroy (c_array : access std_msgs_msg_string_ustruct_h.std_msgs_u_msg_u_String_u_Array);  -- /home/jano/local/ros2/ros2_bouncy/install/std_msgs/include/std_msgs/msg/string__functions.h:106
   pragma Import (C, std_msgs_u_msg_u_String_u_Array_u_destroy, "std_msgs__msg__String__Array__destroy");

end std_msgs_msg_string_ufunctions_h;
