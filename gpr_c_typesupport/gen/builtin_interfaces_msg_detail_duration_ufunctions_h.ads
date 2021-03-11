pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with builtin_interfaces_msg_detail_duration_ustruct_h;
with Interfaces.C.Extensions;
with stddef_h;

package builtin_interfaces_msg_detail_duration_ufunctions_h is

  -- generated from rosidl_generator_c/resource/idl__functions.h.em
  -- with input from builtin_interfaces:msg/Duration.idl
  -- generated code does not contain a copyright notice
  --/ Initialize msg/Duration message.
  --*
  -- * If the init function is called twice for the same message without
  -- * calling fini inbetween previously allocated memory will be leaked.
  -- * \param[in,out] msg The previously allocated message pointer.
  -- * Fields without a default value will not be initialized by this function.
  -- * You might want to call memset(msg, 0, sizeof(
  -- * builtin_interfaces__msg__Duration
  -- * )) before or use
  -- * builtin_interfaces__msg__Duration__create()
  -- * to allocate and initialize the message.
  -- * \return true if initialization was successful, otherwise false
  --  

   function builtin_interfaces_u_msg_u_Duration_u_init (msg : access builtin_interfaces_msg_detail_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration) return Extensions.bool  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/duration__functions.h:36
   with Import => True, 
        Convention => C, 
        External_Name => "builtin_interfaces__msg__Duration__init";

  --/ Finalize msg/Duration message.
  --*
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Duration_u_fini (msg : access builtin_interfaces_msg_detail_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration)  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/duration__functions.h:44
   with Import => True, 
        Convention => C, 
        External_Name => "builtin_interfaces__msg__Duration__fini";

  --/ Create msg/Duration message.
  --*
  -- * It allocates the memory for the message, sets the memory to zero, and
  -- * calls
  -- * builtin_interfaces__msg__Duration__init().
  -- * \return The pointer to the initialized message if successful,
  -- * otherwise NULL
  --  

   function builtin_interfaces_u_msg_u_Duration_u_create return access builtin_interfaces_msg_detail_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/duration__functions.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "builtin_interfaces__msg__Duration__create";

  --/ Destroy msg/Duration message.
  --*
  -- * It calls
  -- * builtin_interfaces__msg__Duration__fini()
  -- * and frees the memory of the message.
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Duration_u_destroy (msg : access builtin_interfaces_msg_detail_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration)  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/duration__functions.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "builtin_interfaces__msg__Duration__destroy";

  --/ Initialize array of msg/Duration messages.
  --*
  -- * It allocates the memory for the number of elements and calls
  -- * builtin_interfaces__msg__Duration__init()
  -- * for each element of the array.
  -- * \param[in,out] array The allocated array pointer.
  -- * \param[in] size The size / capacity of the array.
  -- * \return true if initialization was successful, otherwise false
  -- * If the array pointer is valid and the size is zero it is guaranteed
  -- # to return true.
  --  

   function builtin_interfaces_u_msg_u_Duration_u_Sequence_u_init (c_array : access builtin_interfaces_msg_detail_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/duration__functions.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "builtin_interfaces__msg__Duration__Sequence__init";

  --/ Finalize array of msg/Duration messages.
  --*
  -- * It calls
  -- * builtin_interfaces__msg__Duration__fini()
  -- * for each element of the array and frees the memory for the number of
  -- * elements.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Duration_u_Sequence_u_fini (c_array : access builtin_interfaces_msg_detail_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration_u_Sequence)  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/duration__functions.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "builtin_interfaces__msg__Duration__Sequence__fini";

  --/ Create array of msg/Duration messages.
  --*
  -- * It allocates the memory for the array and calls
  -- * builtin_interfaces__msg__Duration__Sequence__init().
  -- * \param[in] size The size / capacity of the array.
  -- * \return The pointer to the initialized array if successful, otherwise NULL
  --  

   function builtin_interfaces_u_msg_u_Duration_u_Sequence_u_create (size : stddef_h.size_t) return access builtin_interfaces_msg_detail_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration_u_Sequence  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/duration__functions.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "builtin_interfaces__msg__Duration__Sequence__create";

  --/ Destroy array of msg/Duration messages.
  --*
  -- * It calls
  -- * builtin_interfaces__msg__Duration__Sequence__fini()
  -- * on the array,
  -- * and frees the memory of the array.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure builtin_interfaces_u_msg_u_Duration_u_Sequence_u_destroy (c_array : access builtin_interfaces_msg_detail_duration_ustruct_h.builtin_interfaces_u_msg_u_Duration_u_Sequence)  -- /opt/ros/foxy/include/builtin_interfaces/msg/detail/duration__functions.h:118
   with Import => True, 
        Convention => C, 
        External_Name => "builtin_interfaces__msg__Duration__Sequence__destroy";

end builtin_interfaces_msg_detail_duration_ufunctions_h;
