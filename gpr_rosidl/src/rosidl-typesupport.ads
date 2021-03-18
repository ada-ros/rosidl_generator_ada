with Ada.Unchecked_Conversion;

with C_Strings;

with Rosidl_Runtime_C_Message_Type_Support_Struct_H;
use  Rosidl_Runtime_C_Message_Type_Support_Struct_H;

with Rosidl_Runtime_C_Service_Type_Support_Struct_H;
use  Rosidl_Runtime_C_Service_Type_Support_Struct_H;

with ROSIDL.Introspection;
with ROSIDL.Symbols;

with System;

package ROSIDL.Typesupport is

   ------------
   -- Topics --
   ------------

   type Message_Support is tagged private;

   function Get_Message_Support (Pkg : Package_Name;
                                 Msg : Message_Name) return Message_Support;

   function Data (This : Message_Support) return System.Address;

   function Identifier (This : Message_Support) return String;

   function Message_Class (This : Message_Support) return Introspection.Message_Class;

   --------------
   -- Services --
   --------------

   type Service_Support is tagged private;

   function Get_Service_Support (Pkg : Package_Name;
                                 Srv : Service_Name) return Service_Support;

   function Request_Support (This : Service_Support'Class) return Message_Support;

   function Response_Support (This : Service_Support'Class) return Message_Support;

   function Get_Request_Support (Pkg : Package_Name;
                                 Srv : Service_Name)
                                 return Message_Support
   is (Get_Service_Support (Pkg, Srv).Request_Support);

   function Get_Response_Support (Pkg : Package_Name;
                                  Srv : Service_Name)
                                  return Message_Support
   is (Get_Service_Support (Pkg, Srv).Response_Support);

   -------------
   -- Actions --
   -------------
   --  TODO: add thick level binding on top of current thin binding

   --  C equivalent  --
   --  These aren't needed by regular users
   --  These can't be hidden without much boilerplate
   --  DO NOT CROSS (as a user of the library) --------------------------------

   type Msg_Support_Handle is access constant Rosidl_Message_Type_Support_T with
     Convention   => C,
     Storage_Size => 0;
   pragma No_Strict_Aliasing (Msg_Support_Handle);

--     function Get_Message_Handle (Pkg, Msg : String) return Msg_Support_Handle;

   type Srv_Support_Handle is access constant Rosidl_Service_Type_Support_T with
     Convention => C,
     Storage_Size => 0;

   function To_C (This : Message_Support) return Msg_Support_Handle;

   function To_C (This : Service_Support) return Srv_Support_Handle;

private

   type Get_Message_Typesupport_Handle_Func_Access is
     access function return ROSIDL.Typesupport.Msg_Support_Handle with Convention => C;

   type Get_Service_Typesupport_Handle_Func_Access is
     access function return ROSIDL.Typesupport.Srv_Support_Handle with Convention => C;

   function To_Msg_Support_Func is new Ada.Unchecked_Conversion
     (System.Address, Get_Message_Typesupport_Handle_Func_Access);

   function To_Srv_Support_Func is new Ada.Unchecked_Conversion
     (System.Address, Get_Service_Typesupport_Handle_Func_Access);

   type Message_Support is tagged record
      C         : Msg_Support_Handle;
      Msg_Class : Introspection.Message_Class;
   end record;

   ----------
   -- Data --
   ----------

   function Data (This : Message_Support) return System.Address is
      (This.C.Data);

   ----------------
   -- Identifier --
   ----------------

   function Identifier (This : Message_Support) return String is
     (C_Strings.Value (This.C.Typesupport_Identifier));

   -------------------
   -- Message_Class --
   -------------------

   function Message_Class (This : Message_Support) return Introspection.Message_Class is
      (This.Msg_Class);

   ----------
   -- To_C --
   ----------

   function To_C (This : Message_Support) return Msg_Support_Handle is (This.C);

   -------------------------
   -- Get_Message_Support --
   -------------------------

   function Get_Message_Support (Pkg : Package_Name;
                                 Msg : Message_Name) return Message_Support is
     (C         => To_Msg_Support_Func (Symbols.Get_Typesupport_Function
                                        (Pkg  => To_Ns (Pkg, Message),
                                         Kind => Message,
                                         Name => Msg)).all,
      Msg_Class => Introspection.Get_Message_Class (To_Ns (Pkg, Message), Msg));

   type Service_Support is tagged record
      C         : Srv_Support_Handle;
      Srv_Class : Introspection.Service_Class;
   end record;

   ---------------------
   -- Request_Support --
   ---------------------

   function Request_Support (This : Service_Support'Class) return Message_Support is
     (Message_Support'
        (C         => To_Msg_Support_Func (Symbols.Get_Typesupport_Function
                                        (Pkg  => This.Srv_Class.Name_Space,
                                         Kind => Message,
                                         Name => This.Srv_Class.Service_Name & "_Request")).all,
         Msg_Class => Introspection.Get_Message_Class (This.Srv_Class.Name_Space,
                                                       This.Srv_Class.Service_Name & "_Request")));

   ----------------------
   -- Response_Support --
   ----------------------

   function Response_Support (This : Service_Support'Class) return Message_Support is
     (Message_Support'
        (C         => To_Msg_Support_Func (Symbols.Get_Typesupport_Function
                                           (Pkg  => This.Srv_Class.Name_Space,
                                            Kind => Message,
                                            Name => This.Srv_Class.Service_Name & "_Response")).all,
         Msg_Class => Introspection.Get_Message_Class (This.Srv_Class.Name_Space,
                                                       This.Srv_Class.Service_Name & "_Response")));

   -------------------------
   -- Get_Service_Support --
   -------------------------

   function Get_Service_Support (Pkg : Package_Name;
                                 Srv : Service_Name) return Service_Support is
     (C         => To_Srv_Support_Func (Symbols.Get_Typesupport_Function
                                        (Pkg  => To_Ns (Pkg, Service),
                                         Kind => Service,
                                         Name => Srv)).all,
      Srv_Class => Introspection.Get_Service_Class (To_Ns (Pkg, Service), Srv));

   ----------
   -- To_C --
   ----------

   function To_C (This : Service_Support) return Srv_Support_Handle is (This.C);

end ROSIDL.Typesupport;
