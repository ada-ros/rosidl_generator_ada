pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h;
with Interfaces.C.Extensions;
limited with rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_hash_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h;
limited with rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h;
with stddef_h;

package rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ufunctions_h is

  -- DO NOT EDIT MANUALLY - this copied file managed by copy_type_description_generated_sources.bash
  -- generated from rosidl_generator_c/resource/idl__functions.h.em
  -- with input from type_description_interfaces:msg/KeyValue.idl
  -- generated code does not contain a copyright notice
  --/ Initialize msg/KeyValue message.
  --*
  -- * If the init function is called twice for the same message without
  -- * calling fini inbetween previously allocated memory will be leaked.
  -- * \param[in,out] msg The previously allocated message pointer.
  -- * Fields without a default value will not be initialized by this function.
  -- * You might want to call memset(msg, 0, sizeof(
  -- * rosidl_runtime_c__type_description__KeyValue
  -- * )) before or use
  -- * rosidl_runtime_c__type_description__KeyValue__create()
  -- * to allocate and initialize the message.
  -- * \return true if initialization was successful, otherwise false
  --  

   function rosidl_runtime_c_u_type_description_u_KeyValue_u_init (msg : access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue) return Extensions.bool  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:40
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__init";

  --/ Finalize msg/KeyValue message.
  --*
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure rosidl_runtime_c_u_type_description_u_KeyValue_u_fini (msg : access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue)  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:48
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__fini";

  --/ Create msg/KeyValue message.
  --*
  -- * It allocates the memory for the message, sets the memory to zero, and
  -- * calls
  -- * rosidl_runtime_c__type_description__KeyValue__init().
  -- * \return The pointer to the initialized message if successful,
  -- * otherwise NULL
  --  

   function rosidl_runtime_c_u_type_description_u_KeyValue_u_create return access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:60
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__create";

  --/ Destroy msg/KeyValue message.
  --*
  -- * It calls
  -- * rosidl_runtime_c__type_description__KeyValue__fini()
  -- * and frees the memory of the message.
  -- * \param[in,out] msg The allocated message pointer.
  --  

   procedure rosidl_runtime_c_u_type_description_u_KeyValue_u_destroy (msg : access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue)  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:71
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__destroy";

  --/ Check for msg/KeyValue message equality.
  --*
  -- * \param[in] lhs The message on the left hand size of the equality operator.
  -- * \param[in] rhs The message on the right hand size of the equality operator.
  -- * \return true if messages are equal, otherwise false.
  --  

   function rosidl_runtime_c_u_type_description_u_KeyValue_u_are_equal (lhs : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue; rhs : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue) return Extensions.bool  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:81
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__are_equal";

  --/ Copy a msg/KeyValue message.
  --*
  -- * This functions performs a deep copy, as opposed to the shallow copy that
  -- * plain assignment yields.
  -- *
  -- * \param[in] input The source message pointer.
  -- * \param[out] output The target message pointer, which must
  -- *   have been initialized before calling this function.
  -- * \return true if successful, or false if either pointer is null
  -- *   or memory allocation fails.
  --  

   function rosidl_runtime_c_u_type_description_u_KeyValue_u_copy (input : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue; output : access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue) return Extensions.bool  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__copy";

  --/ Retrieve pointer to the hash of the description of this type.
   function rosidl_runtime_c_u_type_description_u_KeyValue_u_get_type_hash (type_support : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_hash_h.rosidl_type_hash_s  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__get_type_hash";

  --/ Retrieve pointer to the description of this type.
   function rosidl_runtime_c_u_type_description_u_KeyValue_u_get_type_description (type_support : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_description_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeDescription  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__get_type_description";

  --/ Retrieve pointer to the single raw source text that defined this type.
   function rosidl_runtime_c_u_type_description_u_KeyValue_u_get_individual_type_description_source (type_support : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeSource  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__get_individual_type_description_source";

  --/ Retrieve pointer to the recursive raw sources that defined the description of this type.
   function rosidl_runtime_c_u_type_description_u_KeyValue_u_get_type_description_sources (type_support : access constant rosidl_runtime_c_rosidl_runtime_c_message_type_support_struct_h.rosidl_message_type_support_t) return access constant rosidl_runtime_c_rosidl_runtime_c_type_description_type_source_ustruct_h.rosidl_runtime_c_u_type_description_u_TypeSource_u_Sequence  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__get_type_description_sources";

  --/ Initialize array of msg/KeyValue messages.
  --*
  -- * It allocates the memory for the number of elements and calls
  -- * rosidl_runtime_c__type_description__KeyValue__init()
  -- * for each element of the array.
  -- * \param[in,out] array The allocated array pointer.
  -- * \param[in] size The size / capacity of the array.
  -- * \return true if initialization was successful, otherwise false
  -- * If the array pointer is valid and the size is zero it is guaranteed
  -- # to return true.
  --  

   function rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence_u_init (c_array : access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence; size : stddef_h.size_t) return Extensions.bool  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:137
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__Sequence__init";

  --/ Finalize array of msg/KeyValue messages.
  --*
  -- * It calls
  -- * rosidl_runtime_c__type_description__KeyValue__fini()
  -- * for each element of the array and frees the memory for the number of
  -- * elements.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence_u_fini (c_array : access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence)  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__Sequence__fini";

  --/ Create array of msg/KeyValue messages.
  --*
  -- * It allocates the memory for the array and calls
  -- * rosidl_runtime_c__type_description__KeyValue__Sequence__init().
  -- * \param[in] size The size / capacity of the array.
  -- * \return The pointer to the initialized array if successful, otherwise NULL
  --  

   function rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence_u_create (size : stddef_h.size_t) return access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:160
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__Sequence__create";

  --/ Destroy array of msg/KeyValue messages.
  --*
  -- * It calls
  -- * rosidl_runtime_c__type_description__KeyValue__Sequence__fini()
  -- * on the array,
  -- * and frees the memory of the array.
  -- * \param[in,out] array The initialized array pointer.
  --  

   procedure rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence_u_destroy (c_array : access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence)  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__Sequence__destroy";

  --/ Check for msg/KeyValue message array equality.
  --*
  -- * \param[in] lhs The message array on the left hand size of the equality operator.
  -- * \param[in] rhs The message array on the right hand size of the equality operator.
  -- * \return true if message arrays are equal in size and content, otherwise false.
  --  

   function rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence_u_are_equal (lhs : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence; rhs : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence) return Extensions.bool  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__Sequence__are_equal";

  --/ Copy an array of msg/KeyValue messages.
  --*
  -- * This functions performs a deep copy, as opposed to the shallow copy that
  -- * plain assignment yields.
  -- *
  -- * \param[in] input The source array pointer.
  -- * \param[out] output The target array pointer, which must
  -- *   have been initialized before calling this function.
  -- * \return true if successful, or false if either pointer
  -- *   is null or memory allocation fails.
  --  

   function rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence_u_copy (input : access constant rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence; output : access rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ustruct_h.rosidl_runtime_c_u_type_description_u_KeyValue_u_Sequence) return Extensions.bool  -- /opt/ros/jazzy/include/rosidl_runtime_c/rosidl_runtime_c/type_description/key_value__functions.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "rosidl_runtime_c__type_description__KeyValue__Sequence__copy";

end rosidl_runtime_c_rosidl_runtime_c_type_description_key_value_ufunctions_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
