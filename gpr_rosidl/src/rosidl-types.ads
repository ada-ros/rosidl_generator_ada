with Interfaces.C;

with Rosidl_Generator_C_String_H; use Rosidl_Generator_C_String_H;

package Rosidl.Types is
   
   package C renames Interfaces.C;

   --  Types with same restrictions as ROS2 ones:
   --  Some can be used as-is in message accessors, others have Adaified versions
   
   subtype Bool is C.Unsigned_Char;
   
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
   
   ----------
   -- Name --
   ----------

   function Name (Id : Uint8_t) return String;
   
   function Size_Of (Id : Uint8_T) return Positive;
   --  bytes
   
   --  Ids of message types
   
   Bool_Id    : constant Uint8_t;
   Byte_Id    : constant Uint8_t;
   Float32_Id : constant Uint8_t;
   Float64_Id : constant Uint8_t;
   Int8_Id    : constant Uint8_t;
   Uint8_Id   : constant Uint8_t;
   Int16_Id   : constant Uint8_t;
   Uint16_Id  : constant Uint8_t;
   Int32_Id   : constant Uint8_t;
   Uint32_Id  : constant Uint8_t;
   Int64_Id   : constant Uint8_t;
   Uint64_Id  : constant Uint8_t;
   String_Id  : constant Uint8_t;
   Message_Id : constant Uint8_t;
   
private
   
   Bool_Id    : constant Uint8_T := Rti_Bool_Id;
   Byte_Id    : constant Uint8_T := Rti_Byte_Id;
   Float32_Id : constant Uint8_T := Rti_Float32_Id;
   Float64_Id : constant Uint8_T := Rti_Float64_Id;
   Int8_Id    : constant Uint8_T := Rti_Int8_Id;
   Uint8_Id   : constant Uint8_T := Rti_Uint8_Id;
   Int16_Id   : constant Uint8_T := Rti_Int16_Id;
   Uint16_Id  : constant Uint8_T := Rti_Uint16_Id;
   Int32_Id   : constant Uint8_T := Rti_Int32_Id;
   Uint32_Id  : constant Uint8_T := Rti_Uint32_Id;
   Int64_Id   : constant Uint8_T := Rti_Int64_Id;
   Uint64_Id  : constant Uint8_T := Rti_Uint64_Id;
   String_Id  : constant Uint8_T := Rti_String_Id;
   Message_Id : constant Uint8_T := Rti_Message_Id;
   
   ----------
   -- Name --
   ----------

   function Name (Id : Uint8_T) return String is 
     (if    Id = Rti_Bool_Id then    "boolean"
      elsif Id = Rti_Byte_Id then    "byte"
      elsif Id = Rti_Float32_Id then "float32"
      elsif Id = Rti_Float64_Id then "float64"
      elsif Id = Rti_Int8_Id then    "int8"
      elsif Id = Rti_Uint8_Id then   "uint8"
      elsif Id = Rti_Int16_Id then   "int16"
      elsif Id = Rti_Uint16_Id then  "uint16"
      elsif Id = Rti_Int32_Id then   "int32"
      elsif Id = Rti_Uint32_Id then  "uint32"
      elsif Id = Rti_Int64_Id then   "int64"        
      elsif Id = Rti_Uint64_Id then  "uint64"
      elsif Id = Rti_String_Id then  "string"
      elsif Id = Rti_Message_Id then "message"
      else                           "unknown (id:" & Id'Img & ")");
   
   function Size_Of (Id : Uint8_T) return Positive is 
     ((if    Id = Rti_Bool_Id then     Bool'Size
      elsif Id = Rti_Byte_Id then     Byte'Size
      elsif Id = Rti_Float32_Id then  Float32'Size
      elsif Id = Rti_Float64_Id then  Float64'Size
      elsif Id = Rti_Int8_Id then      Int8'Size 
      elsif Id = Rti_Uint8_Id then    Uint8'Size 
      elsif Id = Rti_Int16_Id then     Int16'Size 
      elsif Id = Rti_Uint16_Id then   Uint16'Size 
      elsif Id = Rti_Int32_Id then     Int32'Size 
      elsif Id = Rti_Uint32_Id then   Uint32'Size 
      elsif Id = Rti_Int64_Id then     Int64'Size   
      elsif Id = Rti_Uint64_Id then   Uint64'Size
      elsif Id = Rti_String_Id then   Rosidl_Generator_C_U_String'Size
      else raise Constraint_Error with "Message field has unknown size") / 8
     );

end Rosidl.Types;
