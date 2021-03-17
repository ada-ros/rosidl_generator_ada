with ROSIDL.Typesupport;

with System.Address_To_Access_Conversions;

generic
   Pkg   : Package_Name;    -- Package declaring the message
   Name  : String;          -- Complete message name (includes _Request, etc for services/actions)
   Part  : Interface_Parts;
   type Msg is limited private; -- The generated message struct
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
   --  Returns the appropriate support for this kind of message (plain,
   --  request, response, etc).

private

   function Support return Typesupport.Message_Support
   is (case Part is
          when ROSIDL.Message =>
             Typesupport.Get_Message_Support (Pkg, Name),
          when Request =>
             Typesupport.Get_Service_Support (Pkg, Name).Request_Support,
          when Response =>
             Typesupport.Get_Service_Support (Pkg, Name).Response_Support,
          when others =>
             raise Program_Error with "Unimplemented: " & Part'Image);

end ROSIDL.Static.Message;
