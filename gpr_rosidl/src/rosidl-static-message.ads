with ROSIDL.Dynamic;
with ROSIDL.Typesupport;

with System.Address_To_Access_Conversions;

generic
   Pkg   : Package_Name;    -- Package declaring the message
   Name  : String;          -- Complete message name (includes _Request, etc for services/actions)
   Part  : Interface_Parts;
   type C_Message is limited private; -- The generated message struct
package ROSIDL.Static.Message is

   --  This package is automatically instantiated by the static message
   --  generator for every non-primitive message type. Users are not
   --  expected to manually instantiate them (although it is doable), since an
   --  instance will be found at the corresponding generated package at
   --  ROSIDL.Static.Namespace.Message.Name.

   subtype Raw_Message is C_Message;
   --  Re-Export due to visibility problems

   Support : constant Typesupport.Message_Support;
   --  Support to create messages of this type

   package Conversions is new System.Address_To_Access_Conversions (C_Message);

   subtype C_Message_Access is Conversions.Object_Pointer;

   --  Proper message type for RCLAda users

   type Message is new Wrapped_Message with private;
   --  Use this type for RAII managed memory

   function Data (This : Message) return C_Message_Access;
   --  Access the underlying fields in the raw C C_Message type

   function Dynamic (This : Message) return ROSIDL.Dynamic.Message;
   --  Access the same message via introspection

   overriding function Address (This : Message) return System.Address;

   function To_Message_Access (Ptr : System.Address)
                               return C_Message_Access
                               renames Conversions.To_Pointer;

   function New_Message (From : ROSIDL.Dynamic.Message) return Message;
   --  Not generally useful, unless for some reason you want to use an untyped
   --  message and later see it through a typed veil. This is evidently
   --  type-unsafe. The result MUST NOT outlive the message it is used for
   --  creation, as a pointer is stored internally (all messages are limited).
   --  The original From message will not be destroyed either on 'Result going
   --  out of scope.

   --  Shared message, only for blocking client calls.

   type Shared_Message (Data     : access C_Message;
                        Dynamic  : access ROSIDL.Dynamic.Message)
   is tagged private with Implicit_Dereference => Data;

   function New_Shared_Message (From : ROSIDL.Dynamic.Shared_Message)
                                return Shared_Message;

private

   type Message is new Wrapped_Message with record
      Ptr   : C_Message_Access;
      Owned : Boolean := True; -- If True we will destroy Ptr.all
   end record;

   overriding procedure Initialize (This : in out Message);
   overriding procedure Finalize (This : in out Message);

   function Data (This : Message) return C_Message_Access is (This.Ptr);

   function Create return C_Message_Access;
   --  Returns a freshly allocated raw message struct, ready for use (its
   --  members are recursively allocated by ROS2).

   procedure Destroy (This : in out C_Message_Access);
   --  Created messages must be freed at some point. This will be null after
   --  the call.

   type Shared_Message (Data     : access C_Message;
                        Dynamic  : access ROSIDL.Dynamic.Message)
   is tagged record
      Shared_Raw : ROSIDL.Dynamic.Shared_Message (Dynamic);
   end record;

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
