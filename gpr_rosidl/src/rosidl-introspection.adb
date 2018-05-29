with Ada.Unchecked_Conversion;

with ROSIDL.Support;
with ROSIDL.Typesupport;

with System;

package body ROSIDL.Introspection is

   type TSI_Access is access constant Rosidl_Typesupport_Introspection_C_U_MessageMembers;

   ------------------------
   -- Get_Msg_Introspect --
   ------------------------

   function Get_Msg_Introspect (Pkg, Msg : String)
                                return access constant Rosidl_Typesupport_Introspection_C_U_MessageMembers is
      -- rosidl_typesupport_introspection_c__get_message_type_support_handle__std_msgs__msg__String
      type Get_Introspect is access function return Typesupport.Msg_Support_Handle with Convention => C;
      function To_Get_Introspect is new Ada.Unchecked_Conversion (System.Address, Get_Introspect);

      TS : constant Typesupport.Msg_Support_Handle :=
             To_Get_Introspect (Support.Get_Symbol ("rosidl_typesupport_introspection_c__get_message_type_support_handle__" & Pkg & "__msg__" & Msg)).all;

      function To_TSI_Ptr is new Ada.Unchecked_Conversion (System.Address, TSI_Access);
   begin
      return To_TSI_Ptr (TS.Data);
   end Get_Msg_Introspect;

end ROSIDL.Introspection;
