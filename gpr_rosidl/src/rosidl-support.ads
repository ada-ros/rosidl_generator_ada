with Ada.Unchecked_Conversion;

with Interfaces.C.Extensions;

with Rosidl_Typesupport_Introspection_C_Message_Introspection_H; use Rosidl_Typesupport_Introspection_C_Message_Introspection_H;

with System;

package ROSIDL.Support is
   
   -- Unholy messes to deal with C pointers that are everywhere in ROS2
   -- No need to dive here for users
   
   package C  renames Interfaces.C;
   package CX renames Interfaces.C.Extensions;
   
   use all type C.Plain_Char;
   
   function To_Boolean (B : CX.Bool) return Boolean is (B /= C.Plain_Char'Val (0));

   type Func_Ret_Addr is access function return System.Address with Convention => C;
   function To_Func is new Ada.Unchecked_Conversion (System.Address, Func_Ret_Addr);
   
   type Func_Addr_Ret_Bool is access function (Addr : System.Address) return CX.Bool with Convention => C;
   function To_Func is new Ada.Unchecked_Conversion (System.Address, Func_Addr_Ret_Bool);
   
   type Proc_Addr is access procedure (Addr : System.Address) with Convention => C;
   function To_Proc is new Ada.Unchecked_Conversion (System.Address, Proc_Addr);
   
   function Get_Symbol (Name : String) return System.Address;
   
   function Get_Message_Function (Pkg    : String;
                                  Msg    : String;
                                  Suffix : String) 
                                  return System.Address is
     (Get_Symbol (Pkg & "__msg__" & Msg & "__" & Suffix));
   
   function Get_Msg_Introspect (Pkg, Msg : String) 
                                return access constant Rosidl_Typesupport_Introspection_C_U_MessageMembers;
   -- std_msgs__msg__rosidl_typesupport_introspection_c__Bool_message_type_support_handle

   function Get_Msg_Typesupport (Pkg, Msg : String) return System.Address is
     (Get_Symbol ("rosidl_typesupport_c__get_message_type_support_handle__" &
                    Pkg & "__msg__" & Msg));
   -- rosidl_typesupport_c__get_message_type_support_handle__std_msgs__msg__Bool
   
   
   procedure Print_Address (Addr : System.Address; Prefix : String := "Address: ");
   
end ROSIDL.Support;
