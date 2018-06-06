with Ada.Unchecked_Conversion;

with C_Strings;

with Rosidl_Generator_C_Message_Type_Support_Struct_H; 
use  Rosidl_Generator_C_Message_Type_Support_Struct_H;

with Rosidl_Generator_C_Service_Type_Support_Struct_H;
use  Rosidl_Generator_C_Service_Type_Support_Struct_H;

with ROSIDL.Introspection;
with ROSIDL.Support;

with System;

package ROSIDL.Typesupport is   
      
   type Message_Support is tagged private;
   
   function Get_Message_Support (Pkg, Msg : String) return Message_Support;
   
   function Get_Request_Support (Pkg, Msg : String) return Message_Support;
   
   function Get_Response_Support (Pkg, Msg : String) return Message_Support;
   
   --  C equivalent  --
   --  These aren't needed by clients
   
   type Msg_Support_Handle is access constant Rosidl_Message_Type_Support_T with
     Convention   => C, 
     Storage_Size => 0;
   pragma No_Strict_Aliasing (Msg_Support_Handle); 
   
--     function Get_Message_Handle (Pkg, Msg : String) return Msg_Support_Handle;
   
   type Srv_Support_Handle is access constant Rosidl_Service_Type_Support_T with
     Convention => C,
     Storage_Size => 0;
   
   --  ADA BINDING  --
   
   function Get_Support (Kind     : Support.Kinds;
                         Pkg, Msg : String) return Message_Support;   
   
   function Data (This : Message_Support) return System.Address;
   
   function Identifier (This : Message_Support) return String;      
   
   function Kind (This : Message_Support) return Support.Kinds;
   
   function Message_Class (This : Message_Support) return Introspection.Message_Class;
   
   function To_C (This : Message_Support) return Msg_Support_Handle;      
   
   
   type Service_Support is tagged private;
   
   function Get_Service_Support (Pkg, Srv : String) return Service_Support;
   
   function Request_Support (This : Service_Support'Class) return Message_Support;
   
   function Response_Support (This : Service_Support'Class) return Message_Support;
   
   function To_C (This : Service_Support) return Srv_Support_Handle;
   
private 
   
   use all type Support.Kinds;
              
   type Get_Message_Typesupport_Handle_Func_Access Is
     access function return ROSIDL.Typesupport.Msg_Support_Handle with Convention => C;
   
   type Get_Service_Typesupport_Handle_Func_Access Is
     access function return ROSIDL.Typesupport.Srv_Support_Handle with Convention => C;
   
   function To_Func is new Ada.Unchecked_Conversion 
     (System.Address, Get_Message_Typesupport_Handle_Func_Access);
   
   function To_Func is new Ada.Unchecked_Conversion 
     (System.Address, Get_Service_Typesupport_Handle_Func_Access);
   
   function Get_Typesupport_Handle_Func (Kind     : Support.Kinds;
                                         Pkg, Msg : String) 
                                         return Get_Message_Typesupport_Handle_Func_Access is
     (To_Func
        (Support.Get_Symbol 
             (case Kind is
                 when Message => "rosidl_typesupport_c__get_message_type_support_handle__" & Pkg & "__msg__" & Msg,
                 when Service => "rosidl_typesupport_c__get_message_type_support_handle__" & Pkg & "__srv__" & Msg)));
   
   type Message_Support is tagged record
      C         : Msg_Support_Handle;  
      Kind      : Support.Kinds;
      Msg_Class : Introspection.Message_Class;
   end record;
   
   function Get_Support (Kind     : Support.Kinds;
                         Pkg, Msg : String) return Message_Support is
     (C         => Get_Typesupport_Handle_Func     (Kind, Pkg, Msg).all,
      Kind      => Kind,
      Msg_Class => Introspection.Get_Message_Class (Pkg, Msg, Kind));
   
   function Data (This : Message_Support) return System.Address is
      (This.C.Data);
   
   function Identifier (This : Message_Support) return String is
     (C_Strings.Value (This.C.Typesupport_Identifier));
   
   function Kind (This : Message_Support) return Support.Kinds is (This.Kind);
   
   function Message_Class (This : Message_Support) return Introspection.Message_Class is
      (This.Msg_Class);
   
   function To_C (This : Message_Support) return Msg_Support_Handle is (This.C);
   
   
      
   
   function Get_Message_Support (Pkg, Msg : String) return Message_Support is
      (Get_Support (Message, Pkg, Msg));
   
   function Get_Request_Support (Pkg, Msg : String) return Message_Support is
      (Get_Support (Service, Pkg, Msg & "_Request"));
   
   function Get_Response_Support (Pkg, Msg : String) return Message_Support is
      (Get_Support (Service, Pkg, Msg & "_Response"));

   
   
   
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
   
   function Get_Srv_Typesupport (Pkg, Srv : String) return System.Address is
     (Support.Get_Symbol 
        ("rosidl_typesupport_c__get_service_type_support_handle__" & Pkg & "__srv__" & Srv));
   -- rosidl_typesupport_c__get_service_type_support_handle__example_interfaces__srv__AddTwoInts
   
   function Get_Service_Support (Pkg, Srv : String) return Service_Support is
     (C   => To_Func (Get_Srv_Typesupport (Pkg, Srv)).all,
      Srv_Class => Introspection.Get_Service_Class (Pkg, Srv));
   
   function To_C (This : Service_Support) return Srv_Support_Handle is (This.C);
   
end ROSIDL.Typesupport;
