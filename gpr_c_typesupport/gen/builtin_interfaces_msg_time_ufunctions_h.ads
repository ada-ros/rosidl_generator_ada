pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with builtin_interfaces_msg_time_ustruct_h;
with Interfaces.C.Extensions;
with stddef_h;

package builtin_interfaces_msg_time_ufunctions_h is

  -- generated from rosidl_generator_c/resource/msg__functions.h.em
  -- generated code does not contain a copyright notice
  --/ Initialize builtin_interfaces/Time message.
  --*
  -- * If the init function is called twice for the same message without
  -- * calling fini inbetween previously allocated memory will be leaked.
  -- * \param[in,out] msg The previously allocated message pointer.
  -- * Fields without a default value will not be initialized by this function.
  -- * You might want to call memset(msg, 0, sizeof(builtin_interfaces__msg__Time)) before
  -- * or use builtin_interfaces__msg__Time__create() to allocate and initialize the message.
  -- * \return true if initialization was successful, otherwise false
  --  

   function builtin_interfaces_u_msg_u_Time_u_init (msg : access builtin_interfaces_msg_time_ustruct_h.builtin_interfaces_u_msg_u_Time) return Extensions.bool;  -- /opt/ros/bouncy/include/builtin_interfaces/msg/time__functions.h:32
   pragma Import (C, builtin_interfaces_u_msg_u_Time_u_init, "builtin_interfaces__msg__Time__init");

  --/ Finalize builtin_interfaces/Time message.
  --*
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Time_u_fini (msg : access builtin_interfaces_msg_time_ustruct_h.builtin_interfaces_u_msg_u_Time);  -- /opt/ros/bouncy/include/builtin_interfaces/msg/time__functions.h:40
   pragma Import (C, builtin_interfaces_u_msg_u_Time_u_fini, "builtin_interfaces__msg__Time__fini");

  --/ Create builtin_interfaces/Time message.
  --*
  -- * It allocates the memory for the message, sets the memory to zero, and
  -- * calls builtin_interfaces__msg__Time__init().
  -- * \return The pointer to the initialized message if successful,
  -- * otherwise NULL
  --  

   function builtin_interfaces_u_msg_u_Time_u_create return access builtin_interfaces_msg_time_ustruct_h.builtin_interfaces_u_msg_u_Time;  -- /opt/ros/bouncy/include/builtin_interfaces/msg/time__functions.h:51
   pragma Import (C, builtin_interfaces_u_msg_u_Time_u_create, "builtin_interfaces__msg__Time__create");

  --/ Destroy builtin_interfaces/Time message.
  --*
  -- * It calls builtin_interfaces__msg__Time__fini() and frees the memory of the message.
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Time_u_destroy (msg : access builtin_interfaces_msg_time_ustruct_h.builtin_interfaces_u_msg_u_Time);  -- /opt/ros/bouncy/include/builtin_interfaces/msg/time__functions.h:60
   pragma Import (C, builtin_interfaces_u_msg_u_Time_u_destroy, "builtin_interfaces__msg__Time__destroy");

  --/ Initialize array of builtin_interfaces/Time messages.
  --*
  -- * It allocates the memory for the number of elements and
  -- * calls builtin_interfaces__msg__Time__init() for each element of the array.
  -- * \param[in,out] array The allocated array pointer.
  -- * \param[in] size The size / capacity of the array.
  -- * \return true if initialization was successful, otherwise false
  -- * If the array pointer is valid and the size is zero it is guaranteed
  -- # to return true.
  --  

   function builtin_interfaces_u_msg_u_Time_u_Array_u_init (c_array : access builtin_interfaces_msg_time_ustruct_h.builtin_interfaces_u_msg_u_Time_u_Array; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/bouncy/include/builtin_interfaces/msg/time__functions.h:75
   pragma Import (C, builtin_interfaces_u_msg_u_Time_u_Array_u_init, "builtin_interfaces__msg__Time__Array__init");

  --/ Finalize array of builtin_interfaces/Time messages.
  --*
  -- * It calls builtin_interfaces__msg__Time__fini() for each element of the array and
  -- * frees the memory for the number of elements.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Time_u_Array_u_fini (c_array : access builtin_interfaces_msg_time_ustruct_h.builtin_interfaces_u_msg_u_Time_u_Array);  -- /opt/ros/bouncy/include/builtin_interfaces/msg/time__functions.h:85
   pragma Import (C, builtin_interfaces_u_msg_u_Time_u_Array_u_fini, "builtin_interfaces__msg__Time__Array__fini");

  --/ Create array of builtin_interfaces/Time messages.
  --*
  -- * It allocates the memory for the array and
  -- * calls builtin_interfaces__msg__Time__Array__init().
  -- * \param[in] size The size / capacity of the array.
  -- * \return The pointer to the initialized array if successful, otherwise NULL
  --  

   function builtin_interfaces_u_msg_u_Time_u_Array_u_create (size : stddef_h.size_t) return access builtin_interfaces_msg_time_ustruct_h.builtin_interfaces_u_msg_u_Time_u_Array;  -- /opt/ros/bouncy/include/builtin_interfaces/msg/time__functions.h:96
   pragma Import (C, builtin_interfaces_u_msg_u_Time_u_Array_u_create, "builtin_interfaces__msg__Time__Array__create");

  --/ Destroy array of builtin_interfaces/Time messages.
  --*
  -- * It calls builtin_interfaces__msg__Time__Array__fini() on the array,
  -- * and frees the memory of the array.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Time_u_Array_u_destroy (c_array : access builtin_interfaces_msg_time_ustruct_h.builtin_interfaces_u_msg_u_Time_u_Array);  -- /opt/ros/bouncy/include/builtin_interfaces/msg/time__functions.h:106
   pragma Import (C, builtin_interfaces_u_msg_u_Time_u_Array_u_destroy, "builtin_interfaces__msg__Time__Array__destroy");

end builtin_interfaces_msg_time_ufunctions_h;
