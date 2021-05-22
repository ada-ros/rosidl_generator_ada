with Ada.Text_IO; use Ada.Text_IO;

with Ament.Index;

with DL;

with System.Address_Image;

package body ROSIDL.Symbols is

   ----------------
   -- Get_Symbol --
   ----------------

   function Get_Symbol (Symname : String;
                        Libname : String := "")
                        return System.Address
   is
   begin
         --  First try with the lib name without path (dl loader will look up

      declare
         Handle : constant DL.Handle :=
                    Dl.Open (if Libname = "" or else not Generator_Mode
                             then ""
                             else Libname);
      begin
         return DL.Sym (Handle, Symname);
      end;

   exception
      --  Try locating the library in the ament index

      when DL.Symbol_Error =>
         declare
            Handle : constant DL.Handle := Dl.Open (Ament.Index.Find_Library (Libname));
         begin
            return DL.Sym (Handle, Symname);
         end;
   end Get_Symbol;

   -------------------
   -- Print_Address --
   -------------------

   procedure Print_Address (Addr : System.Address; Prefix : String := "Address: ") is
   begin
      Put_Line (Prefix & System.Address_Image (Addr));
   end Print_Address;

end ROSIDL.Symbols;
