with Ada.Text_IO; use Ada.Text_IO;

with DL;

with System.Address_Image;

package body ROSIDL.Support is

   use all type System.Address;

   type TSI_Access is access constant Rosidl_Typesupport_Introspection_C_U_MessageMembers;

   ------------------------
   -- Get_Msg_Introspect --
   ------------------------

   function Get_Msg_Introspect (Pkg, Msg : String)
                                return access constant Rosidl_Typesupport_Introspection_C_U_MessageMembers is
      -- rosidl_typesupport_introspection_c__get_message_type_support_handle__std_msgs__msg__String
      type Get_Introspect is access function return Typesupport.Msg_Support_Ptr with Convention => C;
      function To_Get_Introspect is new Ada.Unchecked_Conversion (System.Address, Get_Introspect);

      TS : constant Typesupport.Msg_Support_Ptr :=
             To_Get_Introspect (Get_Symbol ("rosidl_typesupport_introspection_c__get_message_type_support_handle__" & Pkg & "__msg__" & Msg)).all;

      function To_TSI_Ptr is new Ada.Unchecked_Conversion (System.Address, TSI_Access);
   begin
      return To_TSI_Ptr (TS.Data);
   end Get_Msg_Introspect;

   ----------------
   -- Get_Symbol --
   ----------------

   function Get_Symbol (Name : String) return System.Address is
      Handle : constant DL.Handle := DL.Open ("lib" & Name & "__rosidl_typesupport_c.so");
   begin
      return Addr : constant System.Address := DL.Sym (Handle, Name) do
         if Addr = System.Null_Address then
            raise Program_Error with "Symbol [" & Name & "] could not be found";
         else
            null;
            -- Print_Address (Addr, "Address [Get_Symbol]: ");
         end if;
      end return;
   end Get_Symbol;

   -------------------
   -- Print_Address --
   -------------------

   procedure Print_Address (Addr : System.Address; Prefix : String := "Address: ") is
   begin
      Put_Line (Prefix & System.Address_Image (Addr));
   end Print_Address;

end ROSIDL.Support;
