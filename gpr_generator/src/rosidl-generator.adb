with Ada.Command_Line; use Ada.Command_Line;
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO; use Ada.Text_IO;

with Ament.Index;

--  with C_Strings;

with GNAT.OS_Lib; use GNAT.OS_Lib;

--  with ROSIDL.Typesupport;

procedure ROSIDL.Generator is

   --  function Query (Pack : C_Strings.Chars_Ptr) return C_Strings.Chars_Ptr
   --    with Import, Convention => C,
   --      External_Name => "rosidl_ada_find_support_lib";

begin
   Put_Line ("GENERATOR INVOKED, HALLELUJAH, HALLELUJAH");
   Put_Line ("Arguments:" & Argument_Count'Image);
   for I in 1 .. Argument_Count loop
      Put_Line ("#" & I'Image & ": " & Argument  (I));
   end loop;

   --  Put_Line ("TEST LIB: "
   --          & C_Strings.Value (Query
   --            (C_Strings.To_C ("rclada").To_Ptr)));

   Put_Line ("AMENT_PREFIX_PATH="
             & Getenv ("AMENT_PREFIX_PATH").all);
   Put_Line ("CWD=" & Current_Directory);
   Put_Line ("TEST LIB: "
             & Ament.Index.Find_Library ("librclada__rosidl_typesupport_c.so"));
end ROSIDL.Generator;
