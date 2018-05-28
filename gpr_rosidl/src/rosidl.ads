with Rosidl_Generator_C_Message_Type_Support_Struct_H; use Rosidl_Generator_C_Message_Type_Support_Struct_H;

with X86_64_Linux_Gnu_Bits_Stdint_Uintn_H;

package ROSIDL is

   package Typesupport is

      type Msg_Support_Ptr is access constant rosidl_message_type_support_t
        with Storage_Size => 0;

      pragma No_Strict_Aliasing (Msg_Support_Ptr);

   end Typesupport;

   subtype Uint8_T is X86_64_Linux_Gnu_Bits_Stdint_Uintn_H.Uint8_T;
   use all type Uint8_T;

private

   function Rti_Bool_Id    return Uint8_T with Import, Convention => C;
   function Rti_Byte_Id    return Uint8_T with Import, Convention => C;
   function Rti_Float32_Id return Uint8_T with Import, Convention => C;
   function Rti_Float64_Id return Uint8_T with Import, Convention => C;
   function Rti_Int8_Id    return Uint8_T with Import, Convention => C;
   function Rti_Uint8_Id   return Uint8_T with Import, Convention => C;
   function Rti_Int16_Id   return Uint8_T with Import, Convention => C;
   function Rti_Uint16_Id  return Uint8_T with Import, Convention => C;
   function Rti_Int32_Id   return Uint8_T with Import, Convention => C;
   function Rti_Uint32_Id  return Uint8_T with Import, Convention => C;
   function Rti_Int64_Id   return Uint8_T with Import, Convention => C;
   function Rti_Uint64_Id  return Uint8_T with Import, Convention => C;
   function Rti_String_Id  return Uint8_T with Import, Convention => C;
   function Rti_Message_Id return Uint8_T with Import, Convention => C;

end ROSIDL;
