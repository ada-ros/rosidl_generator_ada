with Ada.Unchecked_Conversion;

with ROSIDL.Symbols;
with ROSIDL.Typesupport;

with System;

package body ROSIDL.Introspection is

   type MTSI_Access is access constant Message_Members_Meta;
   type STSI_Access is access constant Service_Members_Meta;

   function To_MTSI_Ptr is new Ada.Unchecked_Conversion (System.Address, MTSI_Access);
   function To_STSI_Ptr is new Ada.Unchecked_Conversion (System.Address, STSI_Access);

   ------------------------
   -- Get_Msg_Introspect --
   ------------------------

   function Get_Msg_Introspect (Ns   : Namespace;
                                Msg  : String)
                                return access constant Message_Members_Meta is
      type Get_Introspect is access function return Typesupport.Msg_Support_Handle with Convention => C;
      function To_Get_Introspect is new Ada.Unchecked_Conversion (System.Address, Get_Introspect);

      TS : constant Typesupport.Msg_Support_Handle :=
             To_Get_Introspect
               (Symbols.Get_Introspection_Function
                  (Pkg  => Ns,
                   Kind => Message,
                   Name => Msg)).all;
   begin
      return To_MTSI_Ptr (TS.Data);
   end Get_Msg_Introspect;

   ------------------------
   -- Get_Srv_Introspect --
   ------------------------

   function Get_Srv_Introspect (Ns  : Namespace;
                                Srv : String)
                                return access constant Service_Members_Meta is
      type Get_Introspect is access function return Typesupport.Srv_Support_Handle with Convention => C;
      function To_Get_Introspect is new Ada.Unchecked_Conversion (System.Address, Get_Introspect);

      TS : constant Typesupport.Srv_Support_Handle :=
             To_Get_Introspect
               (Symbols.Get_Introspection_Function
                  (Pkg  => Ns,
                   Kind => Service,
                   Name => Srv)).all;
   begin
      return To_STSI_Ptr (TS.Data);
   end Get_Srv_Introspect;

end ROSIDL.Introspection;
