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

   type Message_Support is tagged private;

   function Get_Message_Support (Ns  : Namespace;
                                 Msg : String) return Message_Support;

   function Get_Request_Support (Ns  : Namespace;
                                 Msg : String) return Message_Support;

   function Get_Response_Support (Ns  : Namespace;
                                  Msg : String) return Message_Support;

   --  C equivalent  --
   --  These aren't needed by clients
   --  DO NOT CROSS (as a client of the library)

   type Msg_Support_Handle is access constant Rosidl_Message_Type_Support_T with
     Convention   => C,
     Storage_Size => 0;
   pragma No_Strict_Aliasing (Msg_Support_Handle);

--     function Get_Message_Handle (Pkg, Msg : String) return Msg_Support_Handle;

   type Srv_Support_Handle is access constant Rosidl_Service_Type_Support_T with
     Convention => C,
     Storage_Size => 0;

   --  ADA BINDING  --

   function Data (This : Message_Support) return System.Address;

   function Identifier (This : Message_Support) return String;

   function Message_Class (This : Message_Support) return Introspection.Message_Class;

   function To_C (This : Message_Support) return Msg_Support_Handle;


   type Service_Support is tagged private;

   function Get_Service_Support (Ns  : Namespace;
                                 Srv : String) return Service_Support;

   function Request_Support (This : Service_Support'Class) return Message_Support;

   function Response_Support (This : Service_Support'Class) return Message_Support;

   function To_C (This : Service_Support) return Srv_Support_Handle;

private

   type Get_Message_Typesupport_Handle_Func_Access is
     access function return ROSIDL.Typesupport.Msg_Support_Handle with Convention => C;

   type Get_Service_Typesupport_Handle_Func_Access is
     access function return ROSIDL.Typesupport.Srv_Support_Handle with Convention => C;

   function To_Func is new Ada.Unchecked_Conversion
     (System.Address, Get_Message_Typesupport_Handle_Func_Access);

   function To_Func is new Ada.Unchecked_Conversion
     (System.Address, Get_Service_Typesupport_Handle_Func_Access);

   function Get_Typesupport_Handle_Func (Ns  : Namespace;
                                         Msg : String)
                                         return Get_Message_Typesupport_Handle_Func_Access is
     (To_Func
        (Symbols.Get_Typesupport_Function
             (Pkg  => Ns,
              Kind => Message,
              Part => Message,
              Name => Msg)));

   type Message_Support is tagged record
      C         : Msg_Support_Handle;
      Msg_Class : Introspection.Message_Class;
   end record;

   function Get_Support (Ns  : Namespace;
                         Msg : String) return Message_Support is
     (C         => Get_Typesupport_Handle_Func     (Ns, Msg).all,
      Msg_Class => Introspection.Get_Message_Class (Ns, Msg));

   function Data (This : Message_Support) return System.Address is
      (This.C.Data);

   function Identifier (This : Message_Support) return String is
     (C_Strings.Value (This.C.Typesupport_Identifier));

   function Message_Class (This : Message_Support) return Introspection.Message_Class is
      (This.Msg_Class);

   function To_C (This : Message_Support) return Msg_Support_Handle is (This.C);



   function Get_Message_Support (Ns  : Namespace;
                                 Msg : String) return Message_Support is
      (Get_Support (Ns & "__msg", Msg));

   function Get_Request_Support (Ns  : Namespace;
                                 Msg : String) return Message_Support is
      (Get_Support (Ns, Msg & "_Request"));

   function Get_Response_Support (Ns  : Namespace;
                                  Msg : String) return Message_Support is
      (Get_Support (Ns, Msg & "_Response"));




   type Service_Support is tagged record
      C         : Srv_Support_Handle;
      Srv_Class : Introspection.Service_Class;
   end record;

   function Request_Support (This : Service_Support'Class) return Message_Support is
     (Get_Request_Support (This.Srv_Class.Package_Name,
                           This.Srv_Class.Service_Name));

   function Response_Support (This : Service_Support'Class) return Message_Support is
     (Get_Response_Support (This.Srv_Class.Package_Name,
                            This.Srv_Class.Service_Name));

   function Get_Srv_Typesupport (Ns  : Namespace;
                                 Srv : String) return System.Address is
     (Symbols.Get_Symbol
        ("rosidl_typesupport_c__get_service_type_support_handle__" & String (Ns) & "__srv__" & Srv));
   --  E.g.: rosidl_typesupport_c__get_service_type_support_handle__example_interfaces__srv__AddTwoInts

   function Get_Service_Support (Ns  : Namespace;
                                 Srv : String) return Service_Support is
     (C         => To_Func (Get_Srv_Typesupport (Ns, Srv)).all,
      Srv_Class => Introspection.Get_Service_Class (Ns, Srv));

   function To_C (This : Service_Support) return Srv_Support_Handle is (This.C);

end ROSIDL.Typesupport;
