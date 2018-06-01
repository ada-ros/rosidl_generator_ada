with Ada.Unchecked_Conversion;

with System;

package ROSIDL.Impl.Arrays is
   
   --  From the particular cases in rosidl_generator_c/primitives_array.h
   type Unconstrained_Array is record
      data     : System.Address; 
      size     : aliased C.size_t;
      capacity : aliased C.size_t;
   end record;
   pragma Convention (C_Pass_By_Copy, Unconstrained_Array); 
   
   type Unconstrained_Array_Ptr is access all Unconstrained_Array with 
     Convention   => C,
     Storage_Size => 0;
       
   function To_Unconstrained_Array is
      new Ada.Unchecked_Conversion (System.Address, Unconstrained_Array_Ptr);

end ROSIDL.Impl.Arrays;
