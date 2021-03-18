private with Ada.Unchecked_Conversion;

with C_Strings;

with Interfaces.C.Extensions;

with Rosidl_Runtime_C_String_H; use Rosidl_Runtime_C_String_H;

with ROSIDL.Type_Helpers;

with System.Storage_Elements;

package ROSIDL.Types is

   package Helpers renames Type_Helpers;

   subtype Bytes is Natural;

   package C renames Interfaces.C;

   --  Types with same restrictions as ROS2 ones:
   --  Some can be used as-is in message accessors, others have Adaified versions

   type Ids is new Uint8_T;

   Bool_Id,
   Byte_Id,
   Char_Id,

   Float32_Id,
   Float64_Id,

   Int8_Id,
   Uint8_Id,

   Int16_Id,
   Uint16_Id,

   Int32_Id,
   Uint32_Id,

   Int64_Id,
   Uint64_Id,

   String_Id,

   Message_Id : constant Ids;

   function Is_Scalar (Id : Ids) return Boolean
   is (Id < String_Id);

   type Bool is new C.Extensions.bool;
   type Bool_Array is array (Positive range <>) of Bool with Convention => C;

   type Byte is new Natural range 0 .. 2**8 - 1 with
     Convention => C,
     Size       => 8;
   type Byte_Array is array (Positive range <>) of Byte with Convention => C;

   type Char is new C.Char;
   type Char_Array is array (Positive range <>) of Char with Convention => C;

   type Float32 is new C.C_Float;
   type Float32_Array is array (Positive range <>) of Float32 with Convention => C;
   package Float32_Sequences is new Type_Helpers.Sequences (Float32);
   subtype Float32_Sequence is Float32_Sequences.Sequence;

   type Float64 is new C.Double;
   type Float64_Array is array (Positive range <>) of Float64 with Convention => C;

   type Int8  is new C.Signed_Char;
   type Int8_Array is array (Positive range <>) of Int8 with Convention => C;
   package Int8_Sequences is new Type_Helpers.Sequences (Int8);
   subtype Int8_Sequence is Int8_Sequences.Sequence;

   type Uint8 is new C.Unsigned_Char;
   type Uint8_Array is array (Positive range <>) of Uint8 with Convention => C;

   type Int16  is new C.Short;
   type Int16_Array is array (Positive range <>) of Int16 with Convention => C;

   type Uint16 is new C.Unsigned_Short;
   type Uint16_Array is array (Positive range <>) of Uint16 with Convention => C;

   type Int32  is new C.Int;
   type Int32_Array is array (Positive range <>) of Int32 with Convention => C;

   type Uint32 is new C.Unsigned;
   type Uint32_Array is array (Positive range <>) of Uint32 with Convention => C;

   type Int64  is new C.Long;
   type Int64_Array is array (Positive range <>) of Int64 with Convention => C;

   type Uint64 is new C.Unsigned_Long;
   type Uint64_Array is array (Positive range <>) of Uint64 with Convention => C;
   package Uint64_Sequences is new Type_Helpers.Sequences (Uint64);
   subtype Uint64_Sequence is Uint64_Sequences.Sequence;

   --  The String type is a bit special in that we need our own functions to
   --  access/modify it conveniently from Ada. being unable to wrap it into a
   --  tagged type (as that would change its size), we must resort to regular
   --  functions :'(

   --  The base string type is declared in package rosidl_runtime_c, not to be
   --  confused with std_msgs/String (which, as it only wraps the former, is
   --  in practice the same currently, but only because nothing is added).

   type ROS_String is new Rosidl_Runtime_C_U_String;
   pragma Assert (ROS_String'Size = Rosidl_Runtime_C_U_String'Size);

   function Capacity (Str : ROS_String) return Natural;
   --  Space already allocated for the string. Replacing with a shorter string
   --  might not cause a reallocation. (Not implemented by ROS or here last
   --  time checked, 2021-03-11).

   function Get_String (Str : ROS_String) return String;
   --  Convenience to get an Ada string from the ROS C type
   function "+" (Str : ROS_String) return String renames Get_String;
   --  To be able to "use type"

   procedure Set_String (Str  : aliased in out ROS_String;
                         Text : String);
   --  NOTE! This won't check or honor length of bounded strings! A longer
   --  string will be assigned without issue. It is unclear if at a later time
   --  the DDS transport will complain, or cut the string, or what. FIXME:
   --  check here with the message metadata. Problem: not trivial to get the
   --  precise field info in O(1). Since the field is directly accessible
   --  (otherwise we are back to dynamic access), no elegant solution is in
   --  sight. Perhaps non-elementary fields should be hidden and accessed only
   --  via an enum type with the field names. Probably too convoluted. OTOH,
   --  that might help with keeping a tagged wrapper on the message, and
   --  dynamic references could be reused but with O(1) access? Food for
   --  thought in a future version.

   type Reserved is array (Positive range <>)
     of System.Storage_Elements.Storage_Element
       with Pack;
   --  Used for unsupported types in the static generator

   ----------
   -- Name --
   ----------

   function Name (Id : Ids) return String;

   -------------
   -- Size_Of --
   -------------

   function Size_Of (Id : Ids) return Bytes;

   -----------
   -- To_Id --
   -----------

   function Id  (C_Id : Uint8) return Ids;
   function "+" (C_Id : Uint8) return Ids renames Id;

   function Id  (C_Id : Natural) return Ids is (Id (Uint8 (C_Id)));
   function "+" (C_Id : Natural) return Ids renames Id;

private

   Bool_Id    : constant Ids := Ids (Rti_Bool_Id);
   Byte_Id    : constant Ids := Ids (Rti_Byte_Id);
   Char_Id    : constant Ids := Ids (Rti_Char_Id);
   Float32_Id : constant Ids := Ids (Rti_Float32_Id);
   Float64_Id : constant Ids := Ids (Rti_Float64_Id);
   Int8_Id    : constant Ids := Ids (Rti_Int8_Id);
   Uint8_Id   : constant Ids := Ids (Rti_Uint8_Id);
   Int16_Id   : constant Ids := Ids (Rti_Int16_Id);
   Uint16_Id  : constant Ids := Ids (Rti_Uint16_Id);
   Int32_Id   : constant Ids := Ids (Rti_Int32_Id);
   Uint32_Id  : constant Ids := Ids (Rti_Uint32_Id);
   Int64_Id   : constant Ids := Ids (Rti_Int64_Id);
   Uint64_Id  : constant Ids := Ids (Rti_Uint64_Id);
   String_Id  : constant Ids := Ids (Rti_String_Id);
   Message_Id : constant Ids := Ids (Rti_Message_Id);

   pragma Warnings (Off);
   use all type Uint8_T;
   pragma Warnings (On);

   ----------
   -- Name --
   ----------

   function Name (Id : Ids) return String is
     (if    Id = Bool_Id    then "Bool"
      elsif Id = Byte_Id    then "Byte"
      elsif Id = Char_Id    then "Char"
      elsif Id = Float32_Id then "Float32"
      elsif Id = Float64_Id then "Float64"
      elsif Id = Int8_Id    then "Int8"
      elsif Id = Uint8_Id   then "UInt8"
      elsif Id = Int16_Id   then "Int16"
      elsif Id = Uint16_Id  then "UInt16"
      elsif Id = Int32_Id   then "Int32"
      elsif Id = Uint32_Id  then "UInt32"
      elsif Id = Int64_Id   then "Int64"
      elsif Id = Uint64_Id  then "UInt64"
      elsif Id = String_Id  then "String"
      elsif Id = Message_Id then "Message"
      else raise Program_Error with "unknown type id");
   --  Cannot be a case because these aren't static constants.

   -------------
   -- Size_Of --
   -------------

   function Size_Of (Id : Ids) return Bytes is
     ((if    Id = Bool_Id    then Bool'Size
       elsif Id = Byte_Id    then Byte'Size
       elsif Id = Char_Id    then Char'Size
       elsif Id = Float32_Id then Float32'Size
       elsif Id = Float64_Id then Float64'Size
       elsif Id = Int8_Id    then Int8'Size
       elsif Id = Uint8_Id   then Uint8'Size
       elsif Id = Int16_Id   then Int16'Size
       elsif Id = Uint16_Id  then Uint16'Size
       elsif Id = Int32_Id   then Int32'Size
       elsif Id = Uint32_Id  then Uint32'Size
       elsif Id = Int64_Id   then Int64'Size
       elsif Id = Uint64_Id  then Uint64'Size
       elsif Id = String_Id  then Rosidl_Runtime_C_U_String'Size
       else raise Constraint_Error with "Message field has unknown size")
      / 8);

   -----------
   -- To_Id --
   -----------

   function Id (C_Id : Uint8) return Ids is (Ids'Val (Natural (C_Id)));

   --------------
   -- Capacity --
   --------------

   function Capacity (Str : ROS_String) return Natural
   is (Natural (Str.Capacity));

   ----------------
   -- Get_String --
   ----------------

   function Get_String (Str : ROS_String) return String
   is (C_Strings.Value (Str.Data));

end Rosidl.Types;
