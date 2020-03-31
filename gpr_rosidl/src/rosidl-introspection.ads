with C_Strings;

with Rosidl_Typesupport_Introspection_C_Message_Introspection_H;
use  Rosidl_Typesupport_Introspection_C_Message_Introspection_H;

with Rosidl_Typesupport_Introspection_C_Service_Introspection_H;
use  Rosidl_Typesupport_Introspection_C_Service_Introspection_H;

package ROSIDL.Introspection is

   subtype Service_Members_Meta is Rosidl_Typesupport_Introspection_C_U_ServiceMembers;
   subtype Message_Members_Meta is Rosidl_Typesupport_Introspection_C_U_MessageMembers;
   subtype Message_Member_Meta  is Rosidl_Typesupport_Introspection_C_U_MessageMember;

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
                               Msg   : String) return Message_Class;
   function Get_Message_Class (C     : access constant Message_Members_Meta) return Message_Class;

   function Package_Name (This : Message_Class) return Namespace;
   function Message_Name (This : Message_Class) return String;

   function Size (This : Message_Class) return Natural;

   function To_C (This : Message_Class) return access constant Message_Members_Meta;


   type Service_Class is tagged private;

   function Get_Service_Class (Ns  : Namespace;
                               Srv : String) return Service_Class;

   function Package_Name (This : Service_Class) return Namespace;
   function Service_Name (This : Service_Class) return String;

   function Get_Request_Class  (This : Service_Class) return Message_Class'Class;
   function Get_Response_Class (This : Service_Class) return Message_Class'Class;

   function To_C (This : Service_Class) return access constant Service_Members_Meta;

private

   function Get_Msg_Introspect (Ns  : Namespace;
                                Msg : String)
                                return access constant Message_Members_Meta;

   function Get_Srv_Introspect (Ns  : Namespace;
                                Srv : String)
                                return access constant Service_Members_Meta;


   type Message_Class is tagged record
      C          : access constant Message_Members_Meta;
   end record;

   function Get_Message_Class (Ns  : Namespace;
                               Msg : String) return Message_Class is
     (C => Get_Msg_Introspect (Ns, Msg));

   function Get_Message_Class (C          : access constant Message_Members_Meta)
                               return Message_Class is
     (C => C);

   function Package_Name (This : Message_Class) return Namespace is
      (Namespace (C_Strings.Value (This.C.Message_Namespace_U)));

   function Message_Name (This : Message_Class) return String is
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

   function Package_Name (This : Service_Class) return Namespace is
     (Namespace (C_Strings.Value (This.C.Service_Namespace_U)));

   function Service_Name (This : Service_Class) return String is
     (C_Strings.Value (This.C.Service_Name_U));

   function Get_Request_Class  (This : Service_Class) return Message_Class'Class is
     (Message_Class'(C => This.C.Request_Members_U));

   function Get_Response_Class (This : Service_Class) return Message_Class'Class is
     (Message_Class'(C => This.C.Response_Members_U));

   function To_C (This : Service_Class) return access constant Service_Members_Meta is
     (This.C);

end ROSIDL.Introspection;
