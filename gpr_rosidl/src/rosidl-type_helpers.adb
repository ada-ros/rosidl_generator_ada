package body ROSIDL.Type_Helpers is

   ---------------
   -- Sequences --
   ---------------

   package body Sequences is

      ------------
      -- Resize --
      ------------

      procedure Resize (This : in out Sequence; Capacity : Natural) is
      begin
         raise Program_Error with "unimplemented";
      end Resize;

   end Sequences;

end ROSIDL.Type_Helpers;
