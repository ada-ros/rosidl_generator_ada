with Ada.Unchecked_Conversion;

with ROSIDL.Support;
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

   function Get_Msg_Introspect (Ns  : Namespace;
                                Msg : String)
                                return access constant Message_Members_Meta is
      -- rosidl_typesupport_introspection_c__get_message_type_support_handle__std_msgs__msg__String
      type Get_Introspect is access function return Typesupport.Msg_Support_Handle with Convention => C;
      function To_Get_Introspect is new Ada.Unchecked_Conversion (System.Address, Get_Introspect);

      TS : constant Typesupport.Msg_Support_Handle :=
             To_Get_Introspect (Support.Get_Symbol
                                ("rosidl_typesupport_introspection_c__get_message_type_support_handle__"
                                   & String (Ns) & "__" & Msg)).all;
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
             To_Get_Introspect (Support.Get_Symbol
                                ("rosidl_typesupport_introspection_c__get_service_type_support_handle__"
                                   & String (Ns)
                                   & "__srv__"
                                   & Srv)).all;
   begin
      return To_STSI_Ptr (TS.Data);
   end Get_Srv_Introspect;

end ROSIDL.Introspection;
