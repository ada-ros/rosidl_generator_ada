with Ada.Finalization;

with ROSIDL.Field_References;
with ROSIDL.Introspection;
with ROSIDL.Support;
with ROSIDL.Typesupport;
with ROSIDL.Types;

with System;

package ROSIDL.Dynamic is

   --  Facilities that use dynamic introspection.
   --  Pros: do not require the dreadful code-from-template generators
   --  Cons: might incur a speed penalty, runtime-only checks
   
   type Message (<>) is tagged limited Private with 
     Variable_Indexing => Reference;
   
   type Void is null record;
   type Ref_Type (Reserved : not null access Void) is tagged limited private
     with Implicit_Dereference => Reserved;
   --  The Reserved access is not intended to be used directly, see, accesors below
   
   type Ref_Access is access all Ref_Type;
   --  We use this complete type to be able to use Ref_Type in generics right here.
   --  Since Ref_Type is limited private, it should be safe
   
   -------------------------
   -- Message subprograms --
   -------------------------         
   
   function Init (Pkg : String;  -- ROS2 package declaring the msg; e.g. std_msgs
                  Msg : String)  -- Type of the message / name of *.msg e.g. string
                  return Message;
   
   function Init (Msg_Support : Typesupport.Message_Support) return Message;
   
   function Reference (This  : in out Message'Class;
                       Field :        String) return Ref_Type;
   
   function To_Ptr (This : in out Message) return System.Address;
   --  Returns the raw C ptr used by receiving/sending functions
   
   function Introspect (This : Message) return Introspection.Message_Class;
   
   function Typesupport (This : Message) return ROSIDL.Typesupport.Message_Support;
   
   procedure Print_Metadata (This : Message);
   --  Development helper, dumps message metadata
   
   --------------------------
   -- Ref_type subprograms --
   --------------------------   
   
   --  Preparations
   
   function Get_Access (Ref : aliased in out Ref_Type) return Ref_Access;
   function Get_Member (Ref : Ref_Access) return access constant Support.Message_Member_Meta;
   function Get_Ptr    (Ref : Ref_Access) return System.Address;
                                   
   package FA is new Support.Field_Accessor (Ref_Access,
                                             Get_Member,
                                             Get_Ptr);
   
   package Bool_Ref is new Field_References (FA, Types.Bool_Id, Types.Bool);
   package Byte_Ref is new Field_References (FA, Types.Byte_Id, Types.Byte);
   
   package Float32_Ref is new Field_References (FA, Types.Float32_Id, Types.Float32);
   package Float64_Ref is new Field_References (FA, Types.Float64_Id, Types.Float64);
   
   package Int8_Ref  is new Field_References (FA, Types.Int8_Id,  Types.Int8);
   package Uint8_Ref is new Field_References (FA, Types.Uint8_Id, Types.Uint8);
   
   package Int16_Ref  is new Field_References (FA, Types.Int16_Id,  Types.Int16);
   package Uint16_Ref is new Field_References (FA, Types.Uint16_Id, Types.Uint16);
   
   package Int32_Ref  is new Field_References (FA, Types.Int32_Id,  Types.Int32);
   package Uint32_Ref is new Field_References (FA, Types.Uint32_Id, Types.Uint32);
   
   package Int64_Ref  is new Field_References (FA, Types.Int64_Id,  Types.Int64);
   package Uint64_Ref is new Field_References (FA, Types.Uint64_Id, Types.Uint64);
   
   --  ACCESSORS
   --  As_* serve as both read/write for compatible C types
   --  Get_*/Set_* are needed when conversions to/from Ada types take place
   --  Some kind of trick with internal controlled could be attempted...
   --    but it would not work anyway for indefinite types (String)
   
   function As_Bool (Ref : aliased in out Ref_Type) return Bool_Ref.Reference is (Bool_Ref.Get (Ref'Access));
   
   function  Get_Boolean (Ref : aliased in out Ref_Type) return Boolean;
   procedure Set_Boolean (Ref : aliased in out Ref_Type; Bool : Boolean);
   
   function As_Byte (Ref : aliased in out Ref_Type) return Byte_Ref.Reference is (Byte_Ref.Get (Ref'Access));
   
   function As_Float32 (Ref : aliased in out Ref_Type) return Float32_Ref.Reference is (Float32_Ref.Get (Ref'Access));
   function As_Float64 (Ref : aliased in out Ref_Type) return Float64_Ref.Reference is (Float64_Ref.Get (Ref'Access));
   
   function As_Int8  (Ref : aliased in out Ref_Type) return  Int8_Ref.Reference is ( Int8_Ref.Get (Ref'Access));
   function As_Uint8 (Ref : aliased in out Ref_Type) return Uint8_Ref.Reference is (Uint8_Ref.Get (Ref'Access));
   
   function As_Int16  (Ref : aliased in out Ref_Type) return  Int16_Ref.Reference is ( Int16_Ref.Get (Ref'Access));
   function As_Uint16 (Ref : aliased in out Ref_Type) return Uint16_Ref.Reference is (Uint16_Ref.Get (Ref'Access));
   
   function As_Int32  (Ref : aliased in out Ref_Type) return  Int32_Ref.Reference is ( Int32_Ref.Get (Ref'Access));
   function As_Uint32 (Ref : aliased in out Ref_Type) return Uint32_Ref.Reference is (Uint32_Ref.Get (Ref'Access));
   
   function As_Int64  (Ref : aliased in out Ref_Type) return  Int64_Ref.Reference is ( Int64_Ref.Get (Ref'Access));
   function As_Uint64 (Ref : aliased in out Ref_Type) return Uint64_Ref.Reference is (Uint64_Ref.Get (Ref'Access));
   
   function Get_String (Ref : Ref_Type) return String;
   procedure Set_String (Ref : Ref_Type; Str : String);
   
private 
   
   type Message is new Ada.Finalization.Limited_Controlled with record
      Msg     : System.Address;
      
      Support : ROSIDL.Typesupport.Message_Support;
      
      Fini,
      Destroy : ROSIDL.Support.Proc_Addr;
   end record;
   
   overriding procedure Finalize (This : in out Message);
   
   type Ref_Type (Reserved : not null access Void) is tagged limited 
      record
         Member : access constant Introspection.Message_Member_Meta; -- Metadata about the field
         Ptr    : System.Address; -- The raw C data
      end record;
   
   function Get_Access (Ref : aliased in out Ref_Type) return Ref_Access is (Ref'Access);
   
   function Get_Member (Ref : Ref_Access) return access constant Support.Message_Member_Meta is (Ref.Member);
   
   function Get_Ptr    (Ref : Ref_Access) return System.Address is (Ref.Ptr);

end ROSIDL.Dynamic;
