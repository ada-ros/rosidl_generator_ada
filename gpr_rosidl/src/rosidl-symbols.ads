with Ada.Unchecked_Conversion;

private with AAA.Strings;

with Interfaces.C.Extensions;

with Rosidl_Typesupport_Introspection_C_Message_Introspection_H;
use  Rosidl_Typesupport_Introspection_C_Message_Introspection_H;

with System;

package ROSIDL.Symbols is

   Generator_Mode : Boolean := True;
   --  When True, symbol lookup exhaustively looks for libraries in the ament
   --  index and current folder. Otherwise, only linked objects are used.

   --  Unholy messes to deal with C pointers that are everywhere in ROS2
   --  No need to dive here for users

   package C  renames Interfaces.C;
   package CX renames Interfaces.C.Extensions;

   subtype Message_Members_Meta is Rosidl_Typesupport_Introspection_C_U_MessageMembers;
   subtype Message_Member_Meta  is Rosidl_Typesupport_Introspection_C_U_MessageMember;

   type Func_Ret_Addr is access function return System.Address with Convention => C;
   function To_Func is new Ada.Unchecked_Conversion (System.Address, Func_Ret_Addr);

   type Func_Addr_Ret_Bool is access function (Addr : System.Address) return CX.Bool with Convention => C;
   function To_Func is new Ada.Unchecked_Conversion (System.Address, Func_Addr_Ret_Bool);

   type Proc_Addr is access procedure (Addr : System.Address) with Convention => C;
   function To_Proc is new Ada.Unchecked_Conversion (System.Address, Proc_Addr);

   function Get_Message_Function (Pkg    : Namespace;
                                  Name   : Message_Name;
                                  Op     : String)
                                  return System.Address;
   --  Returns functions to create/destroy/etc messages
   --  E.g.: symbol std_msgs__msg__String__init is found in library
   --  libstd_msgs__rosidl_generator_c.so

   function Get_Typesupport_Function (Pkg  : Namespace;
                                      Kind : Interface_Kinds;
                                      Name : Message_Name)
                                      return System.Address;
   --  Return the function that returns a typesupport for requested interface,
   --  to create subscriptions, topics, services, clients, etc

   function Get_Introspection_Function (Pkg  : Namespace;
                                        Kind : Interface_Kinds;
                                        Name : Message_Name)
                                        return System.Address;
   --  Returns the function that returns an introspection struct for the interface,
   --  for our internal use to access fields, sizes, etc

   --  INFO: use readelf -Ws <lib.so> to list symbols even without debug info.

   generic
      type Container (<>) is limited private;
      with function Get_Member (C : Container) return access constant Message_Member_Meta;
      with function Get_Field_Ptr (C : Container) return System.Address;
   package Field_Accessor is
      --  This package is used as signature for Field_References
   end Field_Accessor;

   procedure Print_Address (Addr : System.Address; Prefix : String := "Address: ");

private

   function Contains (Full, Sub : String) return Boolean
   is (for some I in Full'Range =>
          I + Sub'Length - 1 in Full'Range and then
          Full (I .. I + Sub'Length - 1) = Sub);

   function Get_Symbol (Symname : String;
                        Libname : String := "")
                        return System.Address;
   --  If the libname is "" only symbols in linked ".so" files can be found.
   --  Otherwise, any should do.

   ----------------------------
   -- Get_Interface_Function --
   ----------------------------

   function Get_Message_Function (Pkg    : Namespace;
                                  Name   : Message_Name;
                                  Op     : String)
                                  return System.Address is
     (Get_Symbol
        (Symname => String (Pkg) & "__" & Name &  "__" & Op,
         Libname => "lib" & String (Fix_Ns (Pkg)) & "__rosidl_generator_c.so"));
   --  rclada__msg__Test__create
   --  rclada__msg__Test__destroy
   --  rclada__msg__Test__fini
   --  rclada__msg__Test__init
   --  rclada__msg__Test__Sequence__create
   --  rclada__msg__Test__Sequence__destroy
   --  rclada__msg__Test__Sequence__fini
   --  rclada__msg__Test__Sequence__init
   --  rclada__srv__Test_Request__create
   --  rclada__srv__Test_Request__destroy
   --  rclada__srv__Test_Request__fini
   --  rclada__srv__Test_Request__init
   --  rclada__srv__Test_Request__Sequence__create
   --  rclada__srv__Test_Request__Sequence__destroy
   --  rclada__srv__Test_Request__Sequence__fini
   --  rclada__srv__Test_Request__Sequence__init
   --  rclada__srv__Test_Response__create
   --  rclada__srv__Test_Response__destroy
   --  rclada__srv__Test_Response__fini
   --  rclada__srv__Test_Response__init
   --  rclada__srv__Test_Response__Sequence__create
   --  rclada__srv__Test_Response__Sequence__destroy
   --  rclada__srv__Test_Response__Sequence__fini
   --  rclada__srv__Test_Response__Sequence__init
   --  act symbol: TODO
   --  LIB:        libstd_msgs__rosidl_generator_c.so

   type Handle_Kinds is (Typesupport, Introspection);

   -----------------------
   -- Get_Handle_Symbol --
   -----------------------
   --  Regular supports and introspection supports share naming that we can reuse
   function Get_Handle_Symbol (Support : Handle_Kinds;
                               Pkg     : Namespace;
                               Kind    : Interface_Kinds;
                               Name    : String)
                               return String
   is ("rosidl_typesupport_"
       & (case Support is
             when Introspection => "introspection_",
             when Typesupport   => "")
       & "c__get" & Long_Tag (Kind) & "type_support_handle__"
       & S (Pkg) & "__" & Name);

   ------------------------------
   -- Get_Typesupport_Function --
   ------------------------------

   function Get_Typesupport_Function (Pkg  : Namespace;
                                      Kind : Interface_Kinds;
                                      Name : String)
                                      return System.Address
   is (Get_Symbol
       (Symname => Get_Handle_Symbol (Typesupport, Pkg, Kind, Name),
        Libname => "lib" & String (Fix_Ns (Pkg)) & "__rosidl_typesupport_c.so"));
   --  msg symbol: rosidl_typesupport_c__get_message_type_support_handle__rclada__msg__Test
   --  srv symbol: rosidl_typesupport_c__get_message_type_support_handle__rclada__srv__Test_Request
   --  srv symbol: rosidl_typesupport_c__get_message_type_support_handle__rclada__srv__Test_Response
   --  srv symbol: rosidl_typesupport_c__get_service_type_support_handle__rclada__srv__Test
   --  LIB:        librclada__rosidl_typesupport_c.so

   --------------------------------
   -- Get_Introspection_Function --
   --------------------------------

   function Get_Introspection_Function (Pkg  : Namespace;
                                        Kind : Interface_Kinds;
                                        Name : String)
                                        return System.Address
   is (Get_Symbol
       (Symname => Get_Handle_Symbol (Introspection, Pkg, Kind, Name),
        Libname => "lib" & String (Fix_Ns (Pkg)) & "__rosidl_typesupport_introspection_c.so"));
   --  msg: rosidl_typesupport_introspection_c__get_message_type_support_handle__rclada__msg__Test
   --  srv: rosidl_typesupport_introspection_c__get_service_type_support_handle__rclada__srv__Test
   --  req: rosidl_typesupport_introspection_c__get_message_type_support_handle__rclada__srv__Test_Response
   --  rsp: rosidl_typesupport_introspection_c__get_message_type_support_handle__rclada__srv__Test_Request
   --  LIB: librclada__rosidl_typesupport_introspection_c.so

end ROSIDL.Symbols;
