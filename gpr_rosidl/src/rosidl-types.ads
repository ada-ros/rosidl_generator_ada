with Interfaces.C;

with Rosidl_Generator_C_String_H; use Rosidl_Generator_C_String_H;

package ROSIDL.Types is
   
   package C renames Interfaces.C;

   --  Types with same restrictions as ROS2 ones:
   --  Some can be used as-is in message accessors, others have Adaified versions
   
   type Ids is (Unknown_Id,
                
                Bool_Id,
                Byte_Id,
                Char_Id,
                
                Float32_Id,
                Float64_Id,
                
                Int8_Id,
                Uint8_Id,
                
                Int16_Id,
                Uint16_Id,
                
                Int32_Id,
                Uint32_Id,
                
                Int64_Id,
                Uint64_Id,
                
                String_Id,
                
                Message_Id);
                
   
   type Bool is new C.Unsigned_Char;
   
   type Byte is new Natural range 0 .. 2**8 - 1 with
     Convention => C,
     Size       => 8;
   
   type Char is new C.Char;
   
   type Float32 is new C.C_Float;
   type Float64 is new C.Double;
   
   type Int8  is new C.Signed_Char;
   type Uint8 is new C.Unsigned_Char;
   
   type Int16  is new C.Short;
   type Uint16 is new C.Unsigned_Short;
   
   type Int32  is new C.Int;
   type Uint32 is new C.Unsigned;
   
   type Int64  is new C.Long;
   type Uint64 is new C.Unsigned_Long;
   
   ----------
   -- Name --
   ----------

   function Name (Id : Ids) return String;
   
   -------------
   -- Size_Of --
   -------------

   function Size_Of (Id : Ids) return Positive;
   --  bytes
   
   -----------
   -- To_Id --
   -----------

   function Id  (C_Id : Uint8) return Ids;
   function "+" (C_Id : Uint8) return Ids renames Id;
   
   function Id  (C_Id : Natural) return Ids is (Id (Uint8 (C_Id)));
   function "+" (C_Id : Natural) return Ids renames Id;
   
private
   
   pragma Warnings (Off);
   use all type Uint8_T;
   pragma Warnings (On);
   
   pragma Assert (Ids'Pos (Bool_Id)    = Rti_Bool_Id);  
   pragma Assert (Ids'Pos (Byte_Id)    = Rti_Byte_Id);
   pragma Assert (Ids'Pos (Char_Id)    = Rti_Char_Id);
   pragma Assert (Ids'Pos (Float32_Id) = Rti_Float32_Id);
   pragma Assert (Ids'Pos (Float64_Id) = Rti_Float64_Id);
   pragma Assert (Ids'Pos ( Int8_Id)   = Rti_Int8_Id);
   pragma Assert (Ids'Pos (Uint8_Id)   = Rti_Uint8_Id);
   pragma Assert (Ids'Pos ( Int16_Id)  = Rti_Int16_Id);
   pragma Assert (Ids'Pos (Uint16_Id)  = Rti_Uint16_Id);
   pragma Assert (Ids'Pos ( Int32_Id)  = Rti_Int32_Id);
   pragma Assert (Ids'Pos (Uint32_Id)  = Rti_Uint32_Id);
   pragma Assert (Ids'Pos ( Int64_Id)  = Rti_Int64_Id);
   pragma Assert (Ids'Pos (Uint64_Id)  = Rti_Uint64_Id);
   pragma Assert (Ids'Pos (String_Id)  = Rti_String_Id);   
   pragma Assert (Ids'Pos (Message_Id) = Rti_Message_Id);
   
   ----------
   -- Name --
   ----------

   function Name (Id : Ids) return String is 
     (case Id is 
         when Bool_Id    => "Bool",
         when Byte_Id    => "Byte",
         when Char_Id    => "Char",       
         when Float32_Id => "Float32",
         when Float64_Id => "Float64",
         when Int8_Id    => "Int8",
         when Uint8_Id   => "UInt8",
         when Int16_Id   => "Int16",
         when Uint16_Id  => "UInt16",
         when Int32_Id   => "Int32",
         when Uint32_Id  => "UInt32",
         when Int64_Id   => "Int64",      
         when Uint64_Id  => "UInt64",
         when String_Id  => "String",
         when Message_Id => "Message",
         when others     => raise Program_Error with "unknown type id");
   
   -------------
   -- Size_Of --
   -------------

   function Size_Of (Id : Ids) return Positive is 
     ((case Id is 
          when Bool_Id    => Bool'Size,
          when Byte_Id    => Byte'Size,
          when Char_Id    => Char'Size,         
          when Float32_Id => Float32'Size,
          when Float64_Id => Float64'Size,
          when Int8_Id    => Int8'Size, 
          when Uint8_Id   => Uint8'Size, 
          when Int16_Id   => Int16'Size, 
          when Uint16_Id  => Uint16'Size, 
          when Int32_Id   => Int32'Size, 
          when Uint32_Id  => Uint32'Size, 
          when Int64_Id   => Int64'Size,   
          when Uint64_Id  => Uint64'Size,
          when String_Id  => Rosidl_Generator_C_U_String'Size,
          when others     => raise Constraint_Error with "Message field has unknown size") 
      / 8);
   
   -----------
   -- To_Id --
   -----------

   function Id (C_Id : Uint8) return Ids is (Ids'Val (Natural (C_Id)));

end Rosidl.Types;
