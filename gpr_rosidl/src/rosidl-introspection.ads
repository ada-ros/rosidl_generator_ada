with C_Strings;

with Rosidl_Typesupport_Introspection_C_Message_Introspection_H; use Rosidl_Typesupport_Introspection_C_Message_Introspection_H;

package ROSIDL.Introspection is
      
   subtype Message_Members_Meta is Rosidl_Typesupport_Introspection_C_U_MessageMembers;
   subtype Message_Member_Meta  is Rosidl_Typesupport_Introspection_C_U_MessageMember; 
   
   type Message_Members_Meta_Ptr is access constant Rosidl_Typesupport_Introspection_C_U_MessageMembers with
     Convention => C,
     Storage_Size => 0;
   pragma No_Strict_Aliasing (Message_Members_Meta_Ptr);
   
   --  Ada wrapper
   
   type Message_Class is tagged private;
   
   function Get_Message_Class (Pkg, Msg : String) return Message_Class;   
   function Get_Message_Class (C : access constant Message_Members_Meta) return Message_Class;   
   
   function Package_Name (This : Message_Class) return String;
   function Message_Name (This : Message_Class) return String;
   
   function Size (This : Message_Class) return Natural;
   
   function To_C (This : Message_Class) return access constant Message_Members_Meta;
   
   --  Low level C 
   
   function Get_Msg_Introspect (Pkg, Msg : String) 
                                return access constant Rosidl_Typesupport_Introspection_C_U_MessageMembers;
   -- std_msgs__msg__rosidl_typesupport_introspection_c__Bool_message_type_support_handle

private
   
   type Message_Class is tagged record
      C : access constant Message_Members_Meta;
   end record;
   
   function Get_Message_Class (Pkg, Msg : String) return Message_Class is
     (C => Get_Msg_Introspect (Pkg, Msg));
   
   function Get_Message_Class (C : access constant Message_Members_Meta) return Message_Class is
      (C => C);
   
   function Package_Name (This : Message_Class) return String is
      (C_Strings.Value (This.C.Package_Name_U));
      
   function Message_Name (This : Message_Class) return String is
      (C_Strings.Value (This.C.Message_Name_U));   
   
   function Size (This : Message_Class) return Natural is
      (Natural (This.C.Size_Of_U));
   
   function To_C (This : Message_Class) return access constant Message_Members_Meta is
      (This.C);
   
end ROSIDL.Introspection;
