with Ada.Unchecked_Conversion;

with Interfaces.C.Extensions;

with Rosidl_Typesupport_Introspection_C_Message_Introspection_H; use Rosidl_Typesupport_Introspection_C_Message_Introspection_H;

with ROSIDL.Types;

with System;

package ROSIDL.Support is

   -- Unholy messes to deal with C pointers that are everywhere in ROS2
   -- No need to dive here for users

   package C  renames Interfaces.C;
   package CX renames Interfaces.C.Extensions;

   subtype Message_Members_Meta is Rosidl_Typesupport_Introspection_C_U_MessageMembers;
   subtype Message_Member_Meta  is Rosidl_Typesupport_Introspection_C_U_MessageMember;

   function To_Boolean (B : Types.Bool) return Boolean is (Integer (B) /= 0);

   type Func_Ret_Addr is access function return System.Address with Convention => C;
   function To_Func is new Ada.Unchecked_Conversion (System.Address, Func_Ret_Addr);

   type Func_Addr_Ret_Bool is access function (Addr : System.Address) return CX.Bool with Convention => C;
   function To_Func is new Ada.Unchecked_Conversion (System.Address, Func_Addr_Ret_Bool);

   type Proc_Addr is access procedure (Addr : System.Address) with Convention => C;
   function To_Proc is new Ada.Unchecked_Conversion (System.Address, Proc_Addr);

   type Kinds is (Message, Service);

   function Get_Symbol (Name : String) return System.Address;

   --  INFO: use readelf -Ws <lib.so> to list symbols even without debug info.

   function Get_Message_Function (Namespace : String;
                                  Msg       : String;
                                  Suffix    : String)
                                  return System.Address is
     (Get_Symbol (Namespace & "__" & Msg &  "__" & Suffix));

--  OLD WAY pre-dashing:
--                    (case Kind is
--                              when Message => "__msg__",
--                              when Service => "__srv__") & Msg &  "__" & Suffix));

   generic
      type Container (<>) is limited private;
      with function Get_Member (C : Container) return access constant Message_Member_Meta;
      with function Get_Field_Ptr (C : Container) return System.Address;
   package Field_Accessor is
      --  This package is used as signature for Field_References
   end Field_Accessor;

   procedure Print_Address (Addr : System.Address; Prefix : String := "Address: ");

end ROSIDL.Support;
