with Ada.Finalization;
with Ada.Streams;

with Rosidl_Typesupport_Introspection_C_Message_Introspection_H; use Rosidl_Typesupport_Introspection_C_Message_Introspection_H;

with ROSIDL.Support;

with System;

package ROSIDL.Dynamic is

   --  Facilities that use dynamic introspection.
   --  Pros: do not require the dreadful code-from-template generators
   --  Cons: might incur a speed penalty, runtime-only checks
   
   type Message (<>) is tagged limited private
     with Variable_Indexing => Reference;
   
   type Void is null record;
   type Ref_Type (Reserved : access Void) is tagged limited private
     with Implicit_Dereference => Reserved;
   --  The Reserved access is not intended to be used directly, see, accesors below
   
   -------------------------
   -- Message subprograms --
   -------------------------   
   
   function Init (Pkg : String;  -- ROS2 package declaring the msg; e.g. std_msgs
                  Msg : String)  -- Type of the message / name of *.msg e.g. string
                  return Message;
   
   function Reference (This  : in out Message'Class;
                       Field :        String) return Ref_Type;
   
   function To_Ptr (This : in out Message) return System.Address;
   --  Returns the raw C ptr used by receiving/sending functions
   
   function Typesupport (This : Message) return ROSIDL.Typesupport.Msg_Support_Ptr;
   
   function Typesupport (Pkg, Msg : String) return ROSIDL.Typesupport.Msg_Support_Ptr;
   
   --------------------------
   -- Ref_type subprograms --
   --------------------------   
   
   function Get_String (Ref : Ref_Type) return String;
   
private 
   
   type Message is new Ada.Finalization.Limited_Controlled with record
      Msg         : System.Address;
      
      Introspect  : access constant Rosidl_Typesupport_Introspection_C_U_MessageMembers;
      Typesupport : ROSIDL.Typesupport.Msg_Support_Ptr;
      
      Fini,
      Destroy     : Support.Proc_Addr;
   end record;
   
   overriding procedure Finalize (This : in out Message);
   
   type Ref_Type (Reserved : not null access Void) is tagged limited 
      record
         Member : access constant Rosidl_Typesupport_Introspection_C_U_MessageMember; -- Metadata about the field
         Ptr    : System.Address; -- The raw C data
      end record;

end ROSIDL.Dynamic;
