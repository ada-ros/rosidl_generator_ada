pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with std_msgs_msg_detail_multi_array_dimension_ustruct_h;
with Interfaces.C.Extensions;
with stddef_h;

package std_msgs_msg_detail_multi_array_dimension_ufunctions_h is

  -- generated from rosidl_generator_c/resource/idl__functions.h.em
  -- with input from std_msgs:msg/MultiArrayDimension.idl
  -- generated code does not contain a copyright notice
  --/ Initialize msg/MultiArrayDimension message.
  --*
  -- * If the init function is called twice for the same message without
  -- * calling fini inbetween previously allocated memory will be leaked.
  -- * \param[in,out] msg The previously allocated message pointer.
  -- * Fields without a default value will not be initialized by this function.
  -- * You might want to call memset(msg, 0, sizeof(
  -- * std_msgs__msg__MultiArrayDimension
  -- * )) before or use
  -- * std_msgs__msg__MultiArrayDimension__create()
  -- * to allocate and initialize the message.
  -- * \return true if initialization was successful, otherwise false
  --  

   function std_msgs_u_msg_u_MultiArrayDimension_u_init (msg : access std_msgs_msg_detail_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension) return Extensions.bool  -- /opt/ros/foxy/include/std_msgs/msg/detail/multi_array_dimension__functions.h:36
   with Import => True, 
        Convention => C, 
        External_Name => "std_msgs__msg__MultiArrayDimension__init";

  --/ Finalize msg/MultiArrayDimension message.
  --*
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure std_msgs_u_msg_u_MultiArrayDimension_u_fini (msg : access std_msgs_msg_detail_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension)  -- /opt/ros/foxy/include/std_msgs/msg/detail/multi_array_dimension__functions.h:44
   with Import => True, 
        Convention => C, 
        External_Name => "std_msgs__msg__MultiArrayDimension__fini";

  --/ Create msg/MultiArrayDimension message.
  --*
  -- * It allocates the memory for the message, sets the memory to zero, and
  -- * calls
  -- * std_msgs__msg__MultiArrayDimension__init().
  -- * \return The pointer to the initialized message if successful,
  -- * otherwise NULL
  --  

   function std_msgs_u_msg_u_MultiArrayDimension_u_create return access std_msgs_msg_detail_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension  -- /opt/ros/foxy/include/std_msgs/msg/detail/multi_array_dimension__functions.h:56
   with Import => True, 
        Convention => C, 
        External_Name => "std_msgs__msg__MultiArrayDimension__create";

  --/ Destroy msg/MultiArrayDimension message.
  --*
  -- * It calls
  -- * std_msgs__msg__MultiArrayDimension__fini()
  -- * and frees the memory of the message.
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure std_msgs_u_msg_u_MultiArrayDimension_u_destroy (msg : access std_msgs_msg_detail_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension)  -- /opt/ros/foxy/include/std_msgs/msg/detail/multi_array_dimension__functions.h:67
   with Import => True, 
        Convention => C, 
        External_Name => "std_msgs__msg__MultiArrayDimension__destroy";

  --/ Initialize array of msg/MultiArrayDimension messages.
  --*
  -- * It allocates the memory for the number of elements and calls
  -- * std_msgs__msg__MultiArrayDimension__init()
  -- * for each element of the array.
  -- * \param[in,out] array The allocated array pointer.
  -- * \param[in] size The size / capacity of the array.
  -- * \return true if initialization was successful, otherwise false
  -- * If the array pointer is valid and the size is zero it is guaranteed
  -- # to return true.
  --  

   function std_msgs_u_msg_u_MultiArrayDimension_u_Sequence_u_init (c_array : access std_msgs_msg_detail_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/foxy/include/std_msgs/msg/detail/multi_array_dimension__functions.h:83
   with Import => True, 
        Convention => C, 
        External_Name => "std_msgs__msg__MultiArrayDimension__Sequence__init";

  --/ Finalize array of msg/MultiArrayDimension messages.
  --*
  -- * It calls
  -- * std_msgs__msg__MultiArrayDimension__fini()
  -- * for each element of the array and frees the memory for the number of
  -- * elements.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure std_msgs_u_msg_u_MultiArrayDimension_u_Sequence_u_fini (c_array : access std_msgs_msg_detail_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension_u_Sequence)  -- /opt/ros/foxy/include/std_msgs/msg/detail/multi_array_dimension__functions.h:95
   with Import => True, 
        Convention => C, 
        External_Name => "std_msgs__msg__MultiArrayDimension__Sequence__fini";

  --/ Create array of msg/MultiArrayDimension messages.
  --*
  -- * It allocates the memory for the array and calls
  -- * std_msgs__msg__MultiArrayDimension__Sequence__init().
  -- * \param[in] size The size / capacity of the array.
  -- * \return The pointer to the initialized array if successful, otherwise NULL
  --  

   function std_msgs_u_msg_u_MultiArrayDimension_u_Sequence_u_create (size : stddef_h.size_t) return access std_msgs_msg_detail_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension_u_Sequence  -- /opt/ros/foxy/include/std_msgs/msg/detail/multi_array_dimension__functions.h:106
   with Import => True, 
        Convention => C, 
        External_Name => "std_msgs__msg__MultiArrayDimension__Sequence__create";

  --/ Destroy array of msg/MultiArrayDimension messages.
  --*
  -- * It calls
  -- * std_msgs__msg__MultiArrayDimension__Sequence__fini()
  -- * on the array,
  -- * and frees the memory of the array.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure std_msgs_u_msg_u_MultiArrayDimension_u_Sequence_u_destroy (c_array : access std_msgs_msg_detail_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension_u_Sequence)  -- /opt/ros/foxy/include/std_msgs/msg/detail/multi_array_dimension__functions.h:118
   with Import => True, 
        Convention => C, 
        External_Name => "std_msgs__msg__MultiArrayDimension__Sequence__destroy";

end std_msgs_msg_detail_multi_array_dimension_ufunctions_h;
