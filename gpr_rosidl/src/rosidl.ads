with AAA.Strings;

with Interfaces.C; pragma Unreferenced (Interfaces.C);
with Interfaces.C.Extensions;

with X86_64_Linux_Gnu_Bits_Stdint_Uintn_H;

package ROSIDL is

   type Package_Name is new String
     with Dynamic_Predicate =>
       not AAA.Strings.Contains (String (Package_Name), "__");
   --  A plain package name, e.g., rclada

   type Namespace is new String
     with Dynamic_Predicate => AAA.Strings.Contains (String (Namespace), "__");
   --  A package name plus its interface scope (__msg, __srv)

   subtype Message_Name is String;
   --  Note that message names include their function in a service/action:
   --  Test (plain topic)
   --  and, for internal use (not needed by users):
   --  Test__Sequence (array of plain topic msg)
   --  Test_Request/Test_Response (service msgs)
   --  Test_Request__Sequence

   subtype Service_Name is String;
   --  The plain name the user sees

   type Message_Info is record
      Intra_Process : Boolean;
   end record;

   type Interface_Kinds is (Message, Service, Action);
   --  Interfaces offered by ROS2 to exchange information

   function Short_Tag (Kind : Interface_Kinds) return String;
   --  __msg__, __srv__, __action__

   function To_Kind (Short_Name : String) return Interface_Kinds;
   --  Convert an extension .msg, .srv, .action to the appropriate kind

   type Interface_Parts is (Message,
                            Service, Request, Response,
                            Action, Goal, Result, Feedback);
   --  This is used to access typesupports internally; hence the mix of concepts

   function Kind (Part : Interface_Parts) return Interface_Kinds;

   --  DO NOT CROSS --

   package C renames Interfaces.C;

   subtype Uint8_T is X86_64_Linux_Gnu_Bits_Stdint_Uintn_H.Uint8_T;

private

   -------
   -- S --
   -------

   function S (Ns : Namespace) return String is (String (Ns));

   use AAA.Strings;

   ------------
   -- Fix_Ns --
   ------------

   function Fix_Ns (Ns : Namespace) return Package_Name
   is (Package_Name
       (Replace
        (Replace
         (S (Ns), "__srv", ""),
         "__msg", "")));

   ----------
   -- Kind --
   ----------

   function Kind (Part : Interface_Parts) return Interface_Kinds
   is (case Part is
          when Message => Message,
          when Service | Request | Response => Service,
          when Action | Goal | Result | Feedback => Action);

   -----------
   -- To_Ns --
   -----------

   function To_Ns (Pkg : Package_Name; Kind : Interface_Kinds) return Namespace
   is (case Kind is
          when Message => Namespace (Pkg & "__msg"),
          when Service => Namespace (Pkg & "__srv"),
          when others  =>
             raise Program_Error with "Unimplemented: " & Kind'Image);

   -----------
   -- To_Ns --
   -----------

   function To_Ns (Srv : Service_Name; Kind : Interface_Kinds) return Namespace
   is (To_Ns (Package_Name (Srv), Kind));

   function Rti_Bool_Id    return Uint8_T with Import, Convention => C;
   function Rti_Byte_Id    return Uint8_T with Import, Convention => C;
   function Rti_Char_Id    return Uint8_T with Import, Convention => C;
   function Rti_Float32_Id return Uint8_T with Import, Convention => C;
   function Rti_Float64_Id return Uint8_T with Import, Convention => C;
   function Rti_Int8_Id    return Uint8_T with Import, Convention => C;
   function Rti_Uint8_Id   return Uint8_T with Import, Convention => C;
   function Rti_Int16_Id   return Uint8_T with Import, Convention => C;
   function Rti_Uint16_Id  return Uint8_T with Import, Convention => C;
   function Rti_Int32_Id   return Uint8_T with Import, Convention => C;
   function Rti_Uint32_Id  return Uint8_T with Import, Convention => C;
   function Rti_Int64_Id   return Uint8_T with Import, Convention => C;
   function Rti_Uint64_Id  return Uint8_T with Import, Convention => C;
   function Rti_String_Id  return Uint8_T with Import, Convention => C;
   function Rti_Message_Id return Uint8_T with Import, Convention => C;

   function Head (S : String; Separator : Character := '.') return String;
   --  Whole string if no separator found
   function Tail (S : String; Separator : Character := '.') return String;
   --  Empty if no separator found

   package CX renames Interfaces.C.Extensions;

   pragma Warnings (Off);
   use all type CX.Bool;
   pragma Warnings (On);

   ---------------
   -- Short_Tag --
   ---------------

   function Short_Tag (Kind : Interface_Kinds) return String
   --  Return the internal substring used to prefix symbols
   is (case Kind is
          when Message => "__msg__",
          when Service => "__srv__",
          when Action  => raise Program_Error with "Unimplemented");

   --------------
   -- Long_Tag --
   --------------

   function Long_Tag (Kind : Interface_Kinds) return String
   --  Return the internal substring used to prefix symbols
   is (case Kind is
          when Message => "_message_",
          when Service => "_service_",
          when Action  => raise Program_Error with "Unimplemented");

   -------------
   -- To_Kind --
   -------------

   function To_Kind (Short_Name : String) return Interface_Kinds
   is (if Short_Name = "msg" then Message
       elsif Short_Name = "srv" then Service
       elsif Short_Name = "action" then Action
       else raise Program_Error with "Unimplemented: " & Short_Name);

end ROSIDL;
