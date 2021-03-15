--  with Ada.Characters.Handling;
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
      Handle : DL.Handle;
   begin
      if Libname = "" or else not Generator_Mode then
         Handle := Dl.Open;
      else

         --  First try with the lib name without path (dl loader will look up

         begin
            Handle := Dl.Open (Libname);
         exception
            when DL.Symbol_Error =>

               --  Try locating the library in the ament index

               Handle := Dl.Open (Ament.Index.Find_Library (Libname));
         end;
      end if;

      return DL.Sym (Handle, Symname);
   end Get_Symbol;

   -------------------
   -- Print_Address --
   -------------------

   procedure Print_Address (Addr : System.Address; Prefix : String := "Address: ") is
   begin
      Put_Line (Prefix & System.Address_Image (Addr));
   end Print_Address;

end ROSIDL.Symbols;
