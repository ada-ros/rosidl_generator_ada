with Ada.Unchecked_Conversion;

with ROSIDL.Support;

with System;

package body ROSIDL.Typesupport is

   ------------------------
   -- Get_Message_Handle --
   ------------------------

   function Get_Message_Handle (Pkg, Msg : String) return ROSIDL.Typesupport.Msg_Support_Handle is
      type Get_Typesupport is access function return ROSIDL.Typesupport.Msg_Support_Handle with Convention => C;
      function To_Get_Typesupport is new Ada.Unchecked_Conversion (System.Address, Get_Typesupport);
   begin
      return TS : constant ROSIDL.Typesupport.Msg_Support_Handle := To_Get_Typesupport (Support.Get_Msg_Typesupport (Pkg, Msg)).all do
         --           Support.Print_Address (TS.all'Address, "typesupport:");
         null;
      end return;
   end Get_Message_Handle;

end ROSIDL.Typesupport;
