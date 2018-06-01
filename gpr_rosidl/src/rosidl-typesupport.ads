with C_Strings;

with Rosidl_Generator_C_Message_Type_Support_Struct_H; 
use  Rosidl_Generator_C_Message_Type_Support_Struct_H;

with ROSIDL.Introspection;

with System;

package ROSIDL.Typesupport is   
   
   --  C equivalent  --
   
   type Msg_Support_Handle is access constant Rosidl_Message_Type_Support_T with
     Convention   => C, 
     Storage_Size => 0;
   pragma No_Strict_Aliasing (Msg_Support_Handle); 
   
   function Get_Message_Handle (Pkg, Msg : String) return Msg_Support_Handle;
   
   --  ADA BINDING  --
   
   type Message_Support is tagged private;
   --  Ada wrapper with keeps track of the introspection class
   
   function Get_Message_Support (Pkg, Msg : String) return Message_Support;   
   
   function Data (This : Message_Support) return System.Address;
   
   function Identifier (This : Message_Support) return String;      
   
   function Message_Class (This : Message_Support) return Introspection.Message_Class;
   
   function To_C (This : Message_Support) return Msg_Support_Handle;      
   
private 
   
   type Message_Support is tagged record
      C : Msg_Support_Handle;
      
      Msg_Class : Introspection.Message_Class;
   end record;
   
   function Get_Message_Support (Pkg, Msg : String) return Message_Support is
     (C         => Get_Message_Handle (Pkg, Msg),
      Msg_Class => Introspection.Get_Message_Class (Pkg, Msg));
   
   function Data (This : Message_Support) return System.Address is
      (This.C.Data);
   
   function Identifier (This : Message_Support) return String is
     (C_Strings.Value (This.C.Typesupport_Identifier));
   
   function Message_Class (This : Message_Support) return Introspection.Message_Class is
      (This.Msg_Class);
   
   function To_C (This : Message_Support) return Msg_Support_Handle is
      (This.C);

end ROSIDL.Typesupport;
