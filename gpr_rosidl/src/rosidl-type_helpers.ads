with Interfaces.C;

package ROSIDL.Type_Helpers is

   --  To help to create types for the static generator

   subtype Size_T is Interfaces.C.Size_T;

   ---------------
   -- Sequences --
   ---------------
   --  These encapsulate dynamically sized/bounded arrays

   generic
      type Elements is limited private;
   package Sequences is

      --  See, e.g., rosidl_runtime_c_primitives_sequence_h

      --  NOTE: THESE ARE ALL 1-BASED, TO FOLLOW ADA TRADITION

      type Element_Array is array (1 .. Size_T'Last) of Elements
        with Convention => C;
      --  Ginormous, but not intended to be instanced but to avoid fat bounds

      type Elements_Ptr is access Element_Array with Convention => C;

      --  This is frankly disgustingly low level, but until we can have a
      --  nice Ada way of using dot notation on plain records, accessing
      --  these message members would be pain otherwise, and the pointer has
      --  to be exposed anyway to allow modification in place.

      type Sequence is record
         Data     : Elements_Ptr;
         Size     : Size_T; -- The actual number of elements in Data
         Capacity : Size_T; -- The reserved memory, >= Size
      end record with Convention => C_Pass_By_Copy;

   end Sequences;

end ROSIDL.Type_Helpers;
