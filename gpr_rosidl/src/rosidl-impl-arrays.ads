with Ada.Unchecked_Conversion;

with Rosidl_Runtime_C_Primitives_Sequence_H;
use  Rosidl_Runtime_C_Primitives_Sequence_H;

with System;

package ROSIDL.Impl.Arrays is

   --  subtype Unconstrained_Array is Rosidl_Generator_C_U_Byte_U_Sequence;
   --  We use the Byte one but it's type-independent (datatype is pointed to).

   --  subtype Unconstrained_Element is X86_64_Linux_Gnu_Bits_Stdint_Uintn_H.Uint8_T;
   --  Abstract contents; not the size of an actual element, used to see the
   --  array as a memory region.

   --  From the particular cases in rosidl_generator_c/primitives_sequence.h

   type Unconstrained_Array is record
      Data     : System.Address;
      Size     : aliased C.Size_T;
      Capacity : aliased C.Size_T;
   end record;
   pragma Convention (C_Pass_By_Copy, Unconstrained_Array);

   --  Safety net
   pragma Assert (Unconstrained_Array'Size =
                    Rosidl_Runtime_C_U_Byte_U_Sequence'Size);


   type Unconstrained_Array_Ptr is access all Unconstrained_Array with
     Convention   => C,
     Storage_Size => 0;

   function To_Unconstrained_Array is
      new Ada.Unchecked_Conversion (System.Address, Unconstrained_Array_Ptr);

end ROSIDL.Impl.Arrays;
