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


   ------------------
   -- Member_Class --
   ------------------

   function Member_Class (This : Message_Class;
                          I    : Positive)
                          return Message_Class
   is
      function To_Class_Ptr is
        new Ada.Unchecked_Conversion (System.Address,
                                      Message_Members_Meta_Ptr);
   begin
      if Types.Ids (This.Member (I).Type_Id_U) in Types.Message_Id then
         return Message_Class'
           (C => To_Class_Ptr (This.Member (I).Members_U.Data));
      else
         raise Constraint_Error
           with "Expected message field, but it is of type "
           & Types.Name (Types.Ids (This.Member (I).Type_Id_U));
      end if;
   end Member_Class;

end ROSIDL.Introspection;
