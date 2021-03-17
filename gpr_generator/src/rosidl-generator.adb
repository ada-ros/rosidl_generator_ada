with AAA.Strings;

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO; use Ada.Text_IO;

--  with C_Strings;

procedure ROSIDL.Generator is

   Project_Dir : constant String := "rosidl_generator_ada";

   procedure Create_Interface (Name : String;
                               Kind : Interface_Kinds);

   procedure Create_Parent_Package (Portion : String);
   --  Create empty packages in the hierarchy: ROSIDL.Static.Pkg_Name.Messages

   procedure Create_Project;

   function Identify_Package return String;

   function Pkg_Name_To_File (Name : String) return String;
   --  Convert a package name into the expected GNAT filename

   procedure Write_In_Place (V : AAA.Strings.Vector; File : String);
   --  Dump to file a vector in the expected location for the generator

   ----------------------
   -- Create_Interface --
   ----------------------

   procedure Create_Interface (Name : String;
                               Kind : Interface_Kinds)
   is

      procedure Create_Message (Name : String; Part : Interface_Parts);
      function Create_Struct return Vector;

      --------------------
      -- Create_Message --
      --------------------

      procedure Create_Message (Name : String; Part : Interface_Parts) is
         Ns  : constant String := Identify_Package;
         Pkg : constant String := To_Mixed_Case (Identify_Package);
         --  Tab : constant String := "   ";
         O   : AAA.Strings.Vector;

         Pkg_Name : constant String :=
                      "ROSIDL.Static."
                      & Pkg & "."
                      & (case Kind is
                            when Message => "Messages",
                            when Service => "Services",
                            when Action  => "Actions") & "."
                      & To_Mixed_Case (Name);

         Pkg_File : constant String := Pkg_Name_To_File (Pkg_Name);
      begin
         Put_Line ("Creating Ada types for "
                   & Identify_Package & "/" & Name);

         O.Append ("with ROSIDL.Static.Message;");
         O.Append ("with ROSIDL.Types;");
         O.New_Line;
         O.Append_Line ("package " & Pkg_Name & " is");
         O.New_Line;

         O.Append ("   --  This is a generated file; do not edit manually.");
         O.New_Line;

         O.Append ("   use ROSIDL;");
         O.New_Line;

         --  The message proper

         O.Append (Create_Struct.Indent);
         O.New_Line;

         --  The utils for the message

         O.Append_Line ("   package Handling is new");
         O.Append_Line ("     ROSIDL.Static.Message");
         O.Append_Line ("       (Pkg  => """ & Ns & """,");
         O.Append_Line ("        Name => """ & Name & """,");
         O.Append_Line ("        Part => ROSIDL."
                        & To_Mixed_Case (Part'Image) & ",");
         O.Append_Line ("        Msg  => Message);");

         --  The end! :'(

         O.New_Line;
         O.Append_Line ("end " & Pkg_Name & ";");

         Write_In_Place (O, Pkg_File);
      end Create_Message;

      -------------------
      -- Create_Struct --
      -------------------

      function Create_Struct return Vector is
         V : Vector;
      begin
         V.Append_Line ("type Message is limited record");
         V.Append_Line ("   I : Integer;");
         V.Append_Line ("end record");
         V.Append_Line ("  with Convention => C;");

         return V;
      end Create_Struct;

   begin
      case Kind is
         when Message =>
            Create_Parent_Package (Identify_Package & ".Messages");
            Create_Message (Name, Message);
         when Service =>
            Create_Parent_Package (Identify_Package & ".Services");
            Create_Message (Name & "_Request", Request);
            Create_Message (Name & "_Response", Response);
         when others =>
            Put_Line ("Skipping message creation for kind " & Kind'Image);
      end case;
   end Create_Interface;

   ---------------------------
   -- Create_Parent_Package --
   ---------------------------

   procedure Create_Parent_Package (Portion : String) is
      Pkg_Name : constant String := "ROSIDL.Static." & To_Mixed_Case (Portion);
      Pkg_File : constant String := Pkg_Name_To_File (Pkg_Name);
      O : AAA.Strings.Vector;
   begin
      O.Append_Line ("package " & Pkg_Name & " is");
      O.Append_Line ("end " & Pkg_Name & ";");

      Write_In_Place (O, Pkg_File);
   end Create_Parent_Package;

   --------------------
   -- Create_Project --
   --------------------

   procedure Create_Project is
      O : AAA.Strings.Vector;
      Name : constant String := "ros2_interfaces_" & Identify_Package;
   begin
      O.Append      ("with ""rosidl"";");
      O.Append_Line ("library project " & To_Mixed_Case (Name) & " is");
      O.Append      ("   for Languages use (""Ada"");");
      O.Append_Line ("   for Library_Name use """ & Name & """;");
      O.Append_Line ("   for Source_Dirs use (""."");");
      O.Append      ("   for Object_Dir use ""obj"";");
      O.Append      ("   for Library_Dir use ""lib"";");
      O.Append      ("   for Library_Kind use ""Static"";");
      O.Append_Line ("end " & To_Mixed_Case (Name) & ";");

      Write_In_Place (O, Name & ".gpr");
   end Create_Project;

   ----------------------
   -- Identify_Package --
   ----------------------

   function Identify_Package return String is
      --  Full        : constant String := Full_Name (Arguments (1));
   begin
      return Simple_Name
        (Containing_Directory
           (Containing_Directory (Full_Name (Argument (1)))));
   end Identify_Package;

   ----------------------
   -- Pkg_Name_To_File --
   ----------------------

   function Pkg_Name_To_File (Name : String) return String
   is (To_Lower_Case (Replace (Name, ".", "-")) & ".ads");

   --------------------
   -- Write_In_Place --
   --------------------

   procedure Write_In_Place (V : AAA.Strings.Vector; File : String) is
   begin
      Set_Directory (Project_Dir);
      V.Write (File);
      Set_Directory ("..");
   end Write_In_Place;

----------------------
-- ROSIDL.Generator --
----------------------

begin
   Put_Line ("Ada generator invoked for package " & Identify_Package);
   for I in 1 .. Argument_Count loop
      Put_Line ("#" & I'Image & ": " & Argument  (I));
   end loop;

   if Argument_Count = 0 then
      return;
   end if;

   --  Project destination folder

   if not Exists (Project_Dir) then
      Create_Directory (Project_Dir);
   end if;

   --  Create project and messages

   Create_Project;
   Create_Parent_Package (Identify_Package);

   for I in 1 .. Argument_Count loop
      Create_Interface (Name => Base_Name (Argument (I)),
                        Kind => To_Kind (Extension (Argument (I))));
   end loop;

end ROSIDL.Generator;
