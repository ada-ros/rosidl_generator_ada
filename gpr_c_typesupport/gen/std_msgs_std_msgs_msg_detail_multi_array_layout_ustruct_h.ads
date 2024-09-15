pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with std_msgs_std_msgs_msg_detail_multi_array_dimension_ustruct_h;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with stddef_h;

package std_msgs_std_msgs_msg_detail_multi_array_layout_ustruct_h is

  -- generated from rosidl_generator_c/resource/idl__struct.h.em
  -- with input from std_msgs:msg/MultiArrayLayout.idl
  -- generated code does not contain a copyright notice
  -- IWYU pragma: private, include "std_msgs/msg/multi_array_layout.h"
  -- Constants defined in the message
  -- Include directives for member types
  -- Member 'dim'
  --/ Struct defined in msg/MultiArrayLayout in the package std_msgs.
  --*
  --  * This was originally provided as an example message.
  --  * It is deprecated as of Foxy
  --  * It is recommended to create your own semantically meaningful message.
  --  * However if you would like to continue using this please use the equivalent in example_msgs.
  --  

  --/ The multiarray declares a generic multi-dimensional array of a
  --/ particular data type.  Dimensions are ordered from outer most
  --/ to inner most.
  --/
  --/ Accessors should ALWAYS be written in terms of dimension stride
  --/ and specified outer-most dimension first.
  --/
  --/ multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
  --/
  --/ A standard, 3-channel 640x480 image with interleaved color channels
  --/ would be specified as:
  --/
  --/ dim[0].label  = "height"
  --/ dim[0].size   = 480
  --/ dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
  --/ dim[1].label  = "width"
  --/ dim[1].size   = 640
  --/ dim[1].stride = 3*640 = 1920
  --/ dim[2].label  = "channel"
  --/ dim[2].size   = 3
  --/ dim[2].stride = 3
  --/
  --/ multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
  --/ Array of dimension properties
   type std_msgs_u_msg_u_MultiArrayLayout is record
      dim : aliased std_msgs_std_msgs_msg_detail_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension_u_Sequence;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_layout__struct.h:59
      data_offset : aliased x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_layout__struct.h:61
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_layout__struct.h:33

  --/ padding bytes at front of data
  -- Struct for a sequence of std_msgs__msg__MultiArrayLayout.
   type std_msgs_u_msg_u_MultiArrayLayout_u_Sequence is record
      data : access std_msgs_u_msg_u_MultiArrayLayout;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_layout__struct.h:67
      size : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_layout__struct.h:69
      capacity : aliased stddef_h.size_t;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_layout__struct.h:71
   end record
   with Convention => C_Pass_By_Copy;  -- /opt/ros/jazzy/include/std_msgs/std_msgs/msg/detail/multi_array_layout__struct.h:65

  --/ The number of valid items in data
  --/ The number of allocated items in data
end std_msgs_std_msgs_msg_detail_multi_array_layout_ustruct_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
