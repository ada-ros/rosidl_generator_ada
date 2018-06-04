with Std_Msgs_Msg_Multi_Array_Dimension_Ustruct_H; use Std_Msgs_Msg_Multi_Array_Dimension_Ustruct_H;
with Std_Msgs_Msg_Multi_Array_Layout_Ustruct_H;    use Std_Msgs_Msg_Multi_Array_Layout_Ustruct_H;

package ROSIDL.Impl.Matrices is

   --  These are the "MultiArrays" in ROS2 lingo
   
   type Layout_Ptr is access constant Std_Msgs_U_Msg_U_MultiArrayLayout 
     with Convention => C;
   
   subtype Multi_Array_Dimension is Std_Msgs_U_Msg_U_MultiArrayDimension;
   
   type Dimension_Ptr is access constant Multi_Array_Dimension
     with Convention => C;
   
   type Indices is array (Positive range <>) of Positive;
   
   function Offset (Index  : Indices;
                    Layout : access constant Std_Msgs_U_Msg_U_MultiArrayLayout)
                    return   Natural
     with Pre => Index'First = 1; -- Should be true but just in case!
   --  Computes the offset over some initial address, as explained in 
   --    std_msgs/msg/MultiArrayLayout.msg
   --  This presumes element size 1, so it must be multiplied by the actual
   --    matrix component size

end ROSIDL.Impl.Matrices;
