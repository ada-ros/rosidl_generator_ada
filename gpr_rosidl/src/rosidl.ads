with Interfaces.C; pragma Unreferenced (Interfaces.C);
with Interfaces.C.Extensions;

with X86_64_Linux_Gnu_Bits_Stdint_Uintn_H;

package ROSIDL is

   type Message_Info is record
      Intra_Process : Boolean;
   end record;

   --  DO NOT CROSS --

   package C renames Interfaces.C;

   subtype Uint8_T is X86_64_Linux_Gnu_Bits_Stdint_Uintn_H.Uint8_T;

private

   function Rti_Bool_Id    return Uint8_T with Import, Convention => C;
   function Rti_Byte_Id    return Uint8_T with Import, Convention => C;
   function Rti_Char_Id    return Uint8_T with Import, Convention => C;
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

   function Head (S : String; Separator : Character := '.') return String;
   --  Whole string if no separator found
   function Tail (S : String; Separator : Character := '.') return String;
   --  Empty if no separator found

   package CX renames Interfaces.C.Extensions;

   pragma Warnings (Off);
   use all type CX.Bool;
   pragma Warnings (On);

   Bool_False : constant CX.Bool := CX.Bool'First;
   --  Saves future problems with CX.bool being made a new Boolean instead of char

   function Bool (Ret : CX.Bool) return Boolean is (Ret /= Bool_False);

end ROSIDL;
