with ROSIDL.Dynamic;
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

   Support : constant Typesupport.Message_Support;
   --  Support to create messages of this type

   package Conversions is new System.Address_To_Access_Conversions (Msg);

   subtype Msg_Access is Conversions.Object_Pointer;

   type Message is new Wrapped_Message with private;
   --  Use this type for RAII managed memory

   function Data (This : Message) return Msg_Access;
   --  Access the underlying fields in the raw C msg type

   function Dynamic (This : Message) return ROSIDL.Dynamic.Message;
   --  Access the same message via introspection

   overriding function Address (This : Message) return System.Address;

   function To_Message_Access (Ptr : System.Address)
                               return Msg_Access
                               renames Conversions.To_Pointer;

private

   type Message is new Wrapped_Message with record
      Ptr : Msg_Access;
   end record;

   overriding procedure Initialize (This : in out Message);
   overriding procedure Finalize (This : in out Message);

   function Data (This : Message) return Msg_Access is (This.Ptr);

   function Create return Msg_Access;
   --  Returns a freshly allocated raw message struct, ready for use (its
   --  members are recursively allocated by ROS2).

   procedure Destroy (This : in out Msg_Access);
   --  Created messages must be freed at some point. This will be null after
   --  the call.

   Support : constant Typesupport.Message_Support :=
     (case Part is
          when ROSIDL.Message =>
             Typesupport.Get_Message_Support (Pkg, Name),
          when Request =>
             Typesupport.Get_Service_Support (Pkg, Name).Request_Support,
          when Response =>
             Typesupport.Get_Service_Support (Pkg, Name).Response_Support,
          when others =>
             raise Program_Error with "Unimplemented: " & Part'Image);

end ROSIDL.Static.Message;
