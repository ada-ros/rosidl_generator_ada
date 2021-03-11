with ROSIDL.Typesupport;

with System.Address_To_Access_Conversions;

generic
   Pkg  : Namespace;    -- Package declaring the message
   Name : String;       -- Message name
   type Msg is private; -- The generated message struct
package ROSIDL.Static.Message is

   --  This package is automatically instantiated by the static message
   --  generator for every non-primitive message type. Users are not
   --  expected to manually instantiate them (although it is doable), since an
   --  instance will be found at the corresponding generated package at
   --  ROSIDL.Static.Namespace.Message.Name.

   package Conversions is
     new System.Address_To_Access_Conversions (Msg);

   subtype Msg_Access is Conversions.Object_Pointer;

   function To_Message_Access (Ptr : System.Address)
                               return Msg_Access
                               renames Conversions.To_Pointer;

   function Support return Typesupport.Message_Support;

private

   function Support return Typesupport.Message_Support
   is (Typesupport.Get_Message_Support (Ns  => Pkg,
                                        Msg => Name));

end ROSIDL.Static.Message;
