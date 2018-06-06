with Ada.Finalization;
with Ada.Strings.Fixed;

with ROSIDL.Field_References;
with ROSIDL.Introspection;
with ROSIDL.Support;
with ROSIDL.Typesupport;
with ROSIDL.Types;

with Std_Msgs_Msg_Multi_Array_Dimension_Ustruct_H; use Std_Msgs_Msg_Multi_Array_Dimension_Ustruct_H;
with Std_Msgs_Msg_Multi_Array_Layout_Ustruct_H;    use Std_Msgs_Msg_Multi_Array_Layout_Ustruct_H;

with System;

package ROSIDL.Dynamic is

   --  Facilities that use dynamic introspection.
   --  Pros: do not require the dreadful code-from-template generators
   --  Cons: might incur a speed penalty, runtime-only checks
   
   --  Intended usage:
   --  Message ("fieldname").As_Type                 (for read/write)
   --  Message ("fieldname").Get_Type                (for read-only)
   --  Message ("fieldname").Set_Type (Value)        (for write only)

   --  For nested messages use: Message ("field.child").etc
   
   type Message (<>) is tagged limited private with 
     Constant_Indexing => Reference;
   
   type Void is null record;
   type Ref_Type (Reserved : access constant Void) is tagged limited private
     with Implicit_Dereference => Reserved;
   --  The Reserved access is not intended to be used directly, see, accesors below
   
   type Ref_Access is access constant Ref_Type;
   --  We use this complete type to be able to use Ref_Type in generics right here.
   --  Since Ref_Type is limited private, it should be safe
      
   procedure Print (This : Ref_Type);
   --  Debug
   
   -------------------------
   -- Message subprograms --
   -------------------------         
   
   function Init (Pkg : String;  -- ROS2 package declaring the msg; e.g. std_msgs
                  Msg : String)  -- Type of the message / name of *.msg e.g. string
                  return Message;
   
   function Init (Msg_Support : Typesupport.Message_Support) return Message;
   
   function Reference (This  : Message;
                       Field : String) return Ref_Type'Class;
   
   function Field (This  : Message;
                   Field : String) return Ref_Type'Class renames Reference;
   
   function To_Ptr (This : Message) return System.Address;
   --  Returns the raw C ptr used by receiving/sending functions
   
   function Introspect (This : Message) return Introspection.Message_Class;
   
   function Typesupport (This : Message) return ROSIDL.Typesupport.Message_Support;
   
   procedure Print_Metadata (This : Message; Prefix : String := "");
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
   
   function As_Bool (Ref : aliased Ref_Type) return Bool_Ref.Reference is (Bool_Ref.Ref (Ref'Access));
   
   function  Get_Boolean (Ref : aliased in out Ref_Type) return Boolean;
   procedure Set_Boolean (Ref : aliased in out Ref_Type; Bool : Boolean);
   
   function As_Byte (Ref : aliased Ref_Type) return Byte_Ref.Reference is (Byte_Ref.Ref (Ref'Access));
   
   function As_Float32 (Ref : aliased Ref_Type) return Float32_Ref.Reference is (Float32_Ref.Ref (Ref'Access));
   function As_Float64 (Ref : aliased Ref_Type) return Float64_Ref.Reference is (Float64_Ref.Ref (Ref'Access));
   
   function As_Int8  (Ref : aliased Ref_Type) return  Int8_Ref.Reference is ( Int8_Ref.Ref (Ref'Access));
   function As_Uint8 (Ref : aliased Ref_Type) return Uint8_Ref.Reference is (Uint8_Ref.Ref (Ref'Access));
   
   function As_Int16  (Ref : aliased Ref_Type) return  Int16_Ref.Reference is ( Int16_Ref.Ref (Ref'Access));
   function As_Uint16 (Ref : aliased Ref_Type) return Uint16_Ref.Reference is (Uint16_Ref.Ref (Ref'Access));
   
   function As_Int32  (Ref : aliased Ref_Type) return  Int32_Ref.Reference is ( Int32_Ref.Ref (Ref'Access));
   function As_Uint32 (Ref : aliased Ref_Type) return Uint32_Ref.Reference is (Uint32_Ref.Ref (Ref'Access));
   
   function As_Int64  (Ref : aliased Ref_Type) return  Int64_Ref.Reference is ( Int64_Ref.Ref (Ref'Access));
   function As_Uint64 (Ref : aliased Ref_Type) return Uint64_Ref.Reference is (Uint64_Ref.Ref (Ref'Access));
   
   function Get_Message (Ref : Ref_Type) return Message'Class;
   
   function Get_String (Ref : Ref_Type) return String;
   procedure Set_String (Ref : Ref_Type; Str : String);
   
   ------------
   -- ARRAYS --
   ------------
   
   type Array_View (<>) is tagged limited private with
     Constant_Indexing => Array_Element;
   
   function As_Array (Ref : Ref_Type) return Array_View'Class;
   
   function Capacity (Arr : Array_View) return Natural;
   
   function Element (Arr   : Array_View; 
                     Index : Positive) return Ref_Type'Class;
   
   function Array_Element (Arr   : Array_View; 
                           Index : Positive) return Ref_Type'Class renames Element;
   
   type Array_Kinds is (Static, Bounded, Dynamic);
   
   function Kind (Arr : Array_View) return Array_Kinds;
   --  Static arrays are declared with size in the .msg and cannot be resized
   --  Bounded arrays are generated as dynamic arrays.
   --  Dynamic arrays have same size and capacity, and have to be allocated
   --    with Resize prior to being used
   
   function Length (Arr : Array_View) return Natural;
   
   procedure Resize (Arr : Array_View; Length : Natural);
   --  Reallocates space for a dynamic array
   --  Raises for a static array
   
   --------------
   -- MATRICES --
   --------------
   -- "MultyArrays"
   
   type Matrix_View (<>) is tagged limited private
     with Constant_Indexing => Matrix_Element;
   
   type Matrix_Indices is array (Positive range <>) of Positive;
   
   type Dimension_Naming_Function is access function (Dim : Positive) return String;
   
   function Default_Names (Dim : Positive) return String is
      ("dim" & Ada.Strings.Fixed.Trim (Dim'Img, Ada.Strings.Both)); 
   
   function As_Array (Mat : Matrix_View) return Array_View'Class;
   --  Return the linear array view of this matrix data
   
   function As_Matrix (Ref : Ref_Type'Class) return Matrix_View;
   
   function Capacity (Mat : Matrix_View; Dimension : Positive) return Natural;
   
   function Dimensions (Mat : Matrix_View) return Natural;
   
   function Element (Mat : Matrix_View;
                     Pos : Matrix_Indices) 
                     return Ref_Type'Class with
     Pre => Pos'First = 1;
   
   function Matrix_Element (Mat : Matrix_View; Pos : Matrix_Indices) 
                            return Ref_Type'Class renames Element;
   
   function Label (Mat : Matrix_View; Dimension : Positive) return String;
   
   function Length (Mat : Matrix_View; Dimension : Positive) return Natural;   
   
   procedure Resize (Mat     : Matrix_View;
                     Lengths : Matrix_Indices;
                     Names   : Dimension_Naming_Function := Default_Names'Access) with
     Pre => Lengths'First = 1;
         
   function Size (Mat : Matrix_View) return Natural;
   --  Total number of elements
   
   function Stride (Mat : Matrix_View; Dimension : Positive) return Natural;   
   --  Says the amount of elements that are "below" this dimension, per row
   --  See std_msgs/msg/MultiArrayLayout.mgs for explanations
   
private  
   
   Global_Void : aliased Void;
      
   type Message (Is_Field : Boolean) is new Ada.Finalization.Limited_Controlled with record
      Msg      : System.Address;      
      Support  : ROSIDL.Typesupport.Message_Support;      
      case Is_Field is 
         when False => Destroy  : ROSIDL.Support.Proc_Addr;
         when True  => null; -- Field messages are not finalized; its done by their parent
      end case;
   end record;
   
   function Bind (Is_Field   : Boolean;
                  Data       : System.Address;
                  Introspect : access constant Introspection.Message_Members_Meta)
                  return Message'Class;
   
   overriding procedure Finalize (This : in out Message);
   
   type Ref_Type (Reserved : access constant Void) is tagged limited 
      record
         Member : access constant Introspection.Message_Member_Meta; -- Metadata about the field
         Ptr    : System.Address; -- The raw C data
      end record;
   
   function Get_Introspection (Ref : Ref_Type) 
                               return access constant Introspection.Message_Members_Meta;
   --  Only valid for message members!
   
   function Get_Access (Ref : aliased in out Ref_Type) return Ref_Access is (Ref'Access);
   
   function Get_Member (Ref : Ref_Access) return access constant Support.Message_Member_Meta is (Ref.Member);
   
   function Get_Ptr    (Ref : Ref_Access) return System.Address is (Ref.Ptr);   
   
   
   type Array_View is 
     tagged limited record
      Member : access constant Introspection.Message_Member_Meta;
      Ptr    : System.Address;
   end record;
   
   function Get_Introspection (Member : access constant Introspection.Message_Member_Meta)
                               return access constant Introspection.Message_Members_Meta;
   --  Get the members metadata of a meessage member field
   --  That is, go down the hierarchy of messages
   
   function Get_Introspection (Ref : Ref_Type) 
                               return access constant Introspection.Message_Members_Meta is
     (Get_Introspection (Ref.Member));
   
   
   type Matrix_View is tagged limited record
      Member : access constant Introspection.Message_Member_Meta;
      Ptr    : System.Address;
   end record;
   --  A matrix view points to the base field which contains a XxxxMultyArray.msg
   --  that is, containing both "layout" and "data" fields
   
      
   function As_Message (Mat : Matrix_View) return Message'Class;
   --  Rebind the contents as the message which encapsulates the layout and data
   
   function Get_Dimension (Mat : Matrix_View; Dim : Positive) return access Std_Msgs_U_Msg_U_MultiArrayDimension;
   
   function Get_Layout (Mat : Matrix_View) return access constant Std_Msgs_U_Msg_U_MultiArrayLayout;
   
   function Linear_Index (Mat : Matrix_View; Pos : Matrix_Indices) return Positive;

end ROSIDL.Dynamic;
