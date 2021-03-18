private with AAA.Strings;

private with Ada.Unchecked_Conversion;

with C_Strings;

with Rosidl.Types;

with Rosidl_Typesupport_Introspection_C_Message_Introspection_H;
use  Rosidl_Typesupport_Introspection_C_Message_Introspection_H;

with Rosidl_Typesupport_Introspection_C_Service_Introspection_H;
use  Rosidl_Typesupport_Introspection_C_Service_Introspection_H;

package ROSIDL.Introspection is

   subtype Service_Members_Meta is Rosidl_Typesupport_Introspection_C_U_ServiceMembers;
   --  Class info for a service

   subtype Message_Members_Meta is Rosidl_Typesupport_Introspection_C_U_MessageMembers;
   --  Class info for a message

   subtype Message_Member_Meta  is Rosidl_Typesupport_Introspection_C_U_MessageMember;
   --  Field info within a message

   type Message_Members_Meta_Ptr is access constant Message_Members_Meta with
     Convention   => C,
     Storage_Size => 0;
   pragma No_Strict_Aliasing (Message_Members_Meta_Ptr);

   type Service_Members_Meta_Ptr is access constant Service_Members_Meta with
     Convention   => C,
     Storage_Size => 0;

   --  Ada wrapper

   type Message_Class is tagged private;

   function Get_Message_Class (Ns    : Namespace;
                               Msg   : Message_Name) return Message_Class;
   function Get_Message_Class (C     : access constant Message_Members_Meta) return Message_Class;

   function Name_Space (This : Message_Class) return Namespace;
   function Msg_Name (This : Message_Class) return Message_Name;

   function Size (This : Message_Class) return Natural;

   function To_C (This : Message_Class) return access constant Message_Members_Meta;

   function Member (This : Message_Class;
                    I    : Positive)
                    return Message_Member_Meta
     with Pre => I <= This.Member_Count;

   function Member_Class (This : Message_Class;
                          I    : Positive)
                          return Message_Class;
   --  For a member which is of type message, return its class. Otherwise
   --  raises Constraint_Error. Cannot use precondition because of bug box
   --  in gnat 9.3.

   function Member_Count (This : Message_Class) return Positive;

   function Member_Offset (This : Message_Class;
                           I    : Positive)
                           return Types.Bytes
     with Pre => I <= This.Member_Count;

   function Member_Size (This : Message_Class;
                         I    : Positive)
                         return Types.Bytes
     with Pre => I <= This.Member_Count;

   type Service_Class is tagged private;

   function Get_Service_Class (Ns  : Namespace;
                               Srv : String) return Service_Class;

   function Name_Space (This : Service_Class) return Namespace;
   function Service_Name (This : Service_Class) return String;

   function Get_Request_Class  (This : Service_Class) return Message_Class'Class;
   function Get_Response_Class (This : Service_Class) return Message_Class'Class;

   function To_C (This : Service_Class) return access constant Service_Members_Meta;

private

   function Get_Msg_Introspect (Ns   : Namespace;
                                Msg  : Message_Name)
                                return access constant Message_Members_Meta;

   function Get_Srv_Introspect (Ns  : Namespace;
                                Srv : String)
                                return access constant Service_Members_Meta;


   type Message_Class is tagged record
      C          : access constant Message_Members_Meta;
   end record;

   function Get_Message_Class (Ns   : Namespace;
                               Msg  : Message_Name) return Message_Class is
     (C => Get_Msg_Introspect (Ns, Msg));

   function Get_Message_Class (C          : access constant Message_Members_Meta)
                               return Message_Class is
     (C => C);

   function Name_Space (This : Message_Class) return Namespace is
     (Namespace (C_Strings.Value (This.C.Message_Namespace_U)));

   function Msg_Name (This : Message_Class) return Message_Name is
      (C_Strings.Value (This.C.Message_Name_U));

   function Size (This : Message_Class) return Natural is
      (Natural (This.C.Size_Of_U));

   function To_C (This : Message_Class) return access constant Message_Members_Meta is
     (This.C);


   type Service_Class is tagged record
      C          : access constant Service_Members_Meta;
   end record;

   function Get_Service_Class (Ns  : Namespace;
                               Srv : String) return Service_Class is
     (C => Get_Srv_Introspect (Ns, Srv));

   function Name_Space (This : Service_Class) return Namespace is
     (Namespace (C_Strings.Value (This.C.Service_Namespace_U)));

   function Service_Name (This : Service_Class) return String is
     (C_Strings.Value (This.C.Service_Name_U));

   function Get_Request_Class  (This : Service_Class) return Message_Class'Class is
     (Message_Class'(C => This.C.Request_Members_U));

   function Get_Response_Class (This : Service_Class) return Message_Class'Class is
     (Message_Class'(C => This.C.Response_Members_U));

   function To_C (This : Service_Class) return access constant Service_Members_Meta is
     (This.C);

   ------------
   -- Member --
   ------------

   type Members_Array is array (Positive range <>) of aliased Introspection.Message_Member_Meta
     with Convention => C;

   type Members_Array_Ptr is access constant Members_Array (Positive);
   type Members_C_Ptr is access constant Rosidl_Typesupport_Introspection_C_U_MessageMember;

   function To_Member_Array_Ptr is
     new Ada.Unchecked_Conversion (Members_C_Ptr, Members_Array_Ptr);

   function Member (This : Message_Class;
                    I    : Positive)
                    return Message_Member_Meta
   is (To_Member_Array_Ptr (This.To_C.Members_U) (I));

   ------------------
   -- Member_Count --
   ------------------

   function Member_Count (This : Message_Class) return Positive
   is (Positive (This.To_C.Member_Count_U));

   -------------------
   -- Member_Offset --
   -------------------

   function Member_Offset (This : Message_Class;
                           I    : Positive)
                           return Types.Bytes
   is (Types.Bytes (This.Member (I).Offset_U));

   -----------------
   -- Member_Size --
   -----------------

   function Member_Size (This : Message_Class;
                         I    : Positive)
                         return Types.Bytes
   is (if I = This.Member_Count
       then Types.Bytes (This.To_C.Size_Of_U) - This.Member_Offset (I)
       else This.Member_Offset (I + 1) - This.Member_Offset (I));

end ROSIDL.Introspection;
