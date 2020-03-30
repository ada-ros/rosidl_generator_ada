pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with std_msgs_msg_multi_array_layout_ustruct_h;
with Interfaces.C.Extensions;
with stddef_h;

package std_msgs_msg_multi_array_layout_ufunctions_h is

  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from std_msgs:msg/MultiArrayLayout.idl
  -- generated code does not contain a copyright notice
  --/ Initialize msg/MultiArrayLayout message.
  --*
  -- * If the init function is called twice for the same message without
  -- * calling fini inbetween previously allocated memory will be leaked.
  -- * \param[in,out] msg The previously allocated message pointer.
  -- * Fields without a default value will not be initialized by this function.
  -- * You might want to call memset(msg, 0, sizeof(
  -- * std_msgs__msg__MultiArrayLayout
  -- * )) before or use
  -- * std_msgs__msg__MultiArrayLayout__create()
  -- * to allocate and initialize the message.
  -- * \return true if initialization was successful, otherwise false
  --  

   function std_msgs_u_msg_u_MultiArrayLayout_u_init (msg : access std_msgs_msg_multi_array_layout_ustruct_h.std_msgs_u_msg_u_MultiArrayLayout) return Extensions.bool;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__functions.h:36
   pragma Import (C, std_msgs_u_msg_u_MultiArrayLayout_u_init, "std_msgs__msg__MultiArrayLayout__init");

  --/ Finalize msg/MultiArrayLayout message.
  --*
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure std_msgs_u_msg_u_MultiArrayLayout_u_fini (msg : access std_msgs_msg_multi_array_layout_ustruct_h.std_msgs_u_msg_u_MultiArrayLayout);  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__functions.h:44
   pragma Import (C, std_msgs_u_msg_u_MultiArrayLayout_u_fini, "std_msgs__msg__MultiArrayLayout__fini");

  --/ Create msg/MultiArrayLayout message.
  --*
  -- * It allocates the memory for the message, sets the memory to zero, and
  -- * calls
  -- * std_msgs__msg__MultiArrayLayout__init().
  -- * \return The pointer to the initialized message if successful,
  -- * otherwise NULL
  --  

   function std_msgs_u_msg_u_MultiArrayLayout_u_create return access std_msgs_msg_multi_array_layout_ustruct_h.std_msgs_u_msg_u_MultiArrayLayout;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__functions.h:56
   pragma Import (C, std_msgs_u_msg_u_MultiArrayLayout_u_create, "std_msgs__msg__MultiArrayLayout__create");

  --/ Destroy msg/MultiArrayLayout message.
  --*
  -- * It calls
  -- * std_msgs__msg__MultiArrayLayout__fini()
  -- * and frees the memory of the message.
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure std_msgs_u_msg_u_MultiArrayLayout_u_destroy (msg : access std_msgs_msg_multi_array_layout_ustruct_h.std_msgs_u_msg_u_MultiArrayLayout);  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__functions.h:67
   pragma Import (C, std_msgs_u_msg_u_MultiArrayLayout_u_destroy, "std_msgs__msg__MultiArrayLayout__destroy");

  --/ Initialize array of msg/MultiArrayLayout messages.
  --*
  -- * It allocates the memory for the number of elements and calls
  -- * std_msgs__msg__MultiArrayLayout__init()
  -- * for each element of the array.
  -- * \param[in,out] array The allocated array pointer.
  -- * \param[in] size The size / capacity of the array.
  -- * \return true if initialization was successful, otherwise false
  -- * If the array pointer is valid and the size is zero it is guaranteed
  -- # to return true.
  --  

   function std_msgs_u_msg_u_MultiArrayLayout_u_Sequence_u_init (c_array : access std_msgs_msg_multi_array_layout_ustruct_h.std_msgs_u_msg_u_MultiArrayLayout_u_Sequence; size : stddef_h.size_t) return Extensions.bool;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__functions.h:83
   pragma Import (C, std_msgs_u_msg_u_MultiArrayLayout_u_Sequence_u_init, "std_msgs__msg__MultiArrayLayout__Sequence__init");

  --/ Finalize array of msg/MultiArrayLayout messages.
  --*
  -- * It calls
  -- * std_msgs__msg__MultiArrayLayout__fini()
  -- * for each element of the array and frees the memory for the number of
  -- * elements.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure std_msgs_u_msg_u_MultiArrayLayout_u_Sequence_u_fini (c_array : access std_msgs_msg_multi_array_layout_ustruct_h.std_msgs_u_msg_u_MultiArrayLayout_u_Sequence);  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__functions.h:95
   pragma Import (C, std_msgs_u_msg_u_MultiArrayLayout_u_Sequence_u_fini, "std_msgs__msg__MultiArrayLayout__Sequence__fini");

  --/ Create array of msg/MultiArrayLayout messages.
  --*
  -- * It allocates the memory for the array and calls
  -- * std_msgs__msg__MultiArrayLayout__Sequence__init().
  -- * \param[in] size The size / capacity of the array.
  -- * \return The pointer to the initialized array if successful, otherwise NULL
  --  

   function std_msgs_u_msg_u_MultiArrayLayout_u_Sequence_u_create (size : stddef_h.size_t) return access std_msgs_msg_multi_array_layout_ustruct_h.std_msgs_u_msg_u_MultiArrayLayout_u_Sequence;  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__functions.h:106
   pragma Import (C, std_msgs_u_msg_u_MultiArrayLayout_u_Sequence_u_create, "std_msgs__msg__MultiArrayLayout__Sequence__create");

  --/ Destroy array of msg/MultiArrayLayout messages.
  --*
  -- * It calls
  -- * std_msgs__msg__MultiArrayLayout__Sequence__fini()
  -- * on the array,
  -- * and frees the memory of the array.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure std_msgs_u_msg_u_MultiArrayLayout_u_Sequence_u_destroy (c_array : access std_msgs_msg_multi_array_layout_ustruct_h.std_msgs_u_msg_u_MultiArrayLayout_u_Sequence);  -- /opt/ros/dashing/include/std_msgs/msg/multi_array_layout__functions.h:118
   pragma Import (C, std_msgs_u_msg_u_MultiArrayLayout_u_Sequence_u_destroy, "std_msgs__msg__MultiArrayLayout__Sequence__destroy");

end std_msgs_msg_multi_array_layout_ufunctions_h;
