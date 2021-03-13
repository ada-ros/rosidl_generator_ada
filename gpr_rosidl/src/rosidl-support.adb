--  with Ada.Characters.Handling;
with Ada.Text_IO; use Ada.Text_IO;

with DL;

with GNAT.OS_Lib; use GNAT.OS_Lib;

with System.Address_Image;

package body ROSIDL.Support is

   use all type System.Address;

   ----------------
   -- Get_Symbol --
   ----------------

   function Get_Symbol (Name : String) return System.Address is
      Handle : constant DL.Handle :=
                 DL.Open ("lib" & Name & "__rosidl_typesupport_c.so");
   begin
      Put_Line ("AMENT_PREFIX_PATH="
                & Getenv ("AMENT_PREFIX_PATH").all);

      return Addr : constant System.Address := DL.Sym (Handle, Name) do
         if Addr = System.Null_Address then
            raise Program_Error with "Symbol [" & Name & "] could not be found";
         else
            null;
            --  Print_Address (Addr, "Address [Get_Symbol]: ");
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
