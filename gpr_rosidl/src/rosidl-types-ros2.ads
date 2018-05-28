with Interfaces.C;

package ROSIDL.Types.ROS2 is
   
   package C renames Interfaces.C;

   --  Types with same restrictions as ROS2 ones:
   
   subtype Byte is Natural range 0 .. 2 ** 8 - 1;
   
   subtype Float32 is Float;
   subtype Float64 is Long_Float;
   
   subtype Int8  is C.Signed_Char;
   subtype Uint8 is C.Unsigned_Char;
   
   subtype Int16  is C.Short;
   subtype Uint16 is C.Unsigned_Short;
   
   subtype Int32  is C.Int;
   subtype Uint32 is C.Unsigned;
   
   subtype Int64  is C.Long;
   subtype Uint64 is C.Unsigned_Long;
   
end ROSIDL.Types.ROS2;
