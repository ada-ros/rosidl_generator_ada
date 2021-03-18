with AAA.Strings;

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO; use Ada.Text_IO;

with C_Strings;

with ROSIDL.Introspection;
with ROSIDL.Types;
with ROSIDL.Typesupport;

procedure ROSIDL.Generator is

   Tab            : constant String := "   ";
   Project_Dir    : constant String := "rosidl_generator_ada";
   Manual_Warning : constant String :=
                      "   --  This is a generated file; do not edit manually.";

   function Ada_Name (Name : String) return String;
   --  Ensures Name is a valid record field name in Ada

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

   --------------
   -- Ada_Name --
   --------------

   function Ada_Name (Name : String) return String
   is
      --  TODO: blacklist Ada reserved words
   begin
      if Contains (Name, "__") then
         return Ada_Name (Replace (Name, "__", "_"));
      elsif Name (Name'First) = '_' then
         return Ada_Name ("U_" & Name);
      else
         return To_Mixed_Case (Name);
      end if;
   end Ada_Name;

   ----------------------
   -- Create_Interface --
   ----------------------

   procedure Create_Interface (Name : String;
                               Kind : Interface_Kinds)
   is

      function S (C : C_Strings.Chars_Ptr) return String
      is (C_Strings.Value (C));

      Ros_Package : constant String := Identify_Package;

      procedure Create_Message (Name : String; Part : Interface_Parts);
      procedure Create_Service (Name : String);

      --------------------
      -- Create_Message --
      --------------------

      procedure Create_Message (Name : String; Part : Interface_Parts) is
         Pkg : constant String := To_Mixed_Case (Identify_Package);
         O   : AAA.Strings.Vector;

         Bounds : Vector;
         --  Contains bounds definitions for sequences

         function Create_Field (Msg_Class : Introspection.Message_Class;
                                I         : Positive;
                                Max_Len   : Positive)
                                return String;
         function Create_Struct (Part : Interface_Parts) return Vector;

         ------------------
         -- Create_Field --
         ------------------

         function Create_Field (Msg_Class : Introspection.Message_Class;
                                I         : Positive;
                                Max_Len   : Positive)
                             return String
         is
            use Types;
            V      : Vector;
            Member : constant Introspection.Message_Member_Meta :=
                       Msg_Class.Member (I);
            Name   : constant String := Ada_Name (S (Member.name_u));

            procedure Reserved;
            procedure Reserved is
            begin
               V.Append_To_Last_Line
                 ("Types.Reserved (1 .."
                  & Msg_Class.Member_Size (I)'Image & ");");
            end Reserved;

            Padded_Name : constant String :=
                            Ada_Name (S (Member.name_u))
                            & String'(1 .. Max_Len - Name'Length + 1 => ' ');

         begin
            V.Append_Line (Padded_Name & ": ");

            --  SCALAR
            if Is_Scalar (Ids (Member.type_id_u)) then

               --  SCALAR ARRAY
               if Boolean (Member.is_array_u) then

                  --  SCALAR ARRAY DYNAMIC
                  if Member.array_size_u in 0 then
                     V.Append_To_Last_Line
                       ("Types." & Types.Name (Ids (Member.type_id_u))
                        & "_Sequence;");

                     --  SCALAR ARRAY BOUNDED
                  elsif Member.is_upper_bound_u in True then
                     V.Append_To_Last_Line
                       ("Types." & Types.Name (Ids (Member.type_id_u))
                        & "_Sequence;");

                     Bounds.Append_Line
                       (Padded_Name & ": constant :="
                        & Member.array_size_u'Image & ";");
                  else
                     --  SCALAR ARRAY STATIC
                     V.Append_To_Last_Line
                       ("Types." & Types.Name (Ids (Member.type_id_u))
                        & "_Array (1 .." & Member.array_size_u'Image & ");");
                  end if;

               else
                  --  SCALAR ATOMIC
                  V.Append_To_Last_Line
                    ("Types." & Types.Name (Ids (Member.type_id_u)) & ";");
               end if;

               --  STRING (bounded or not, the same type is used...)
            elsif Ids (Member.type_id_u) in Types.String_Id then
               V.Append_To_Last_Line ("Types.ROS_String;");

            else
               Reserved;
            end if;

            return V.First_Element;
         end Create_Field;

         -------------------
         -- Create_Struct --
         -------------------

         function Create_Struct (Part : Interface_Parts) return Vector is
            V : Vector;

            Support : constant ROSIDL.Typesupport.Message_Support :=
                        (case Kind is
                            when Message =>
                              ROSIDL.Typesupport.Get_Message_Support
                                (Pkg => Package_Name (Ros_Package),
                                 Msg => Name),
                            when Service =>
                              (case Part is
                                  when Request  =>
                                     ROSIDL.Typesupport.Get_Request_Support
                                       (Pkg => Package_Name (Ros_Package),
                                        Srv => Create_Interface.Name),
                                  when Response =>
                                     ROSIDL.Typesupport.Get_Response_Support
                                       (Pkg => Package_Name (Ros_Package),
                                        Srv => Create_Interface.Name),
                               when others   =>
                                  raise Program_Error with "Unimplemented"),
                            when others  =>
                               raise Program_Error with "Unimplemented");

            Max_Name_Len : Natural := 0;
         begin
            V.Append ("type Message is limited record");

            for I in 1 .. Support.Message_Class.Member_Count loop
               Max_Name_Len :=
                 Natural'Max
                   (Max_Name_Len,
                    Ada_Name
                      (S (Support.Message_Class.Member (I).name_u))'Length);
            end loop;

            for I in 1 .. Support.Message_Class.Member_Count loop
               V.Append_Line
                 (Tab & Tab &
                    Create_Field (Support.Message_Class, I, Max_Name_Len));
            end loop;

            V.Append
              (Empty_Vector
               &         "end record"
               &         "  with Convention => C;"
               --  & String'("       Size => "
               --    & Natural'(Support.Message_Class.Size * 8)'Image & ";")
               & ""
               & String'("pragma Assert (Message'Size ="
                 & Natural'(Support.Message_Class.Size * 8)'Image
                 & ", ""Got size: "" & Message'Size'Image"
                 & ");"));

            return V;
         end Create_Struct;

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

         O.Append (Manual_Warning);
         O.New_Line;

         O.Append ("   use ROSIDL;");
         O.New_Line;

         --  The message proper

         O.Append (Create_Struct (Part).Indent);
         O.New_Line;

         --  Bounds

         if not Bounds.Is_Empty then
            Bounds := Bounds.Indent;
            Bounds.Prepend ("package Bounds is");
            Bounds.Append ("end Bounds;");
            O.Append (Bounds.Indent);
            O.New_Line;
         end if;

         --  Sequences

         O.Append_Line
           (Tab
            & "package Sequences is new Types.Helpers.Sequences (Message);");
         O.Append_Line (Tab & "subtype Sequence is Sequences.Sequence;");
         O.New_Line;

         --  The utils for the message

         O.Append_Line ("   package Handling is new");
         O.Append_Line ("     ROSIDL.Static.Message");
         O.Append_Line ("       (Pkg  => """ & Ros_Package & """,");
         O.Append_Line ("        Name => """ & Name & """,");
         O.Append_Line ("        Part => ROSIDL."
                        & To_Mixed_Case (Part'Image) & ",");
         O.Append_Line ("        Msg  => Message);");

         --  The end! :'(

         O.New_Line;
         O.Append_Line ("end " & Pkg_Name & ";");

         Write_In_Place (O, Pkg_File);
      end Create_Message;

      --------------------
      -- Create_Service --
      --------------------

      procedure Create_Service (Name : String) is
         Pkg_Lower : constant String := Identify_Package;
         Pkg : constant String := To_Mixed_Case (Pkg_Lower);
         Pkg_Name : constant String :=
                      "ROSIDL.Static."
                      & Pkg & ".Services."
                      & To_Mixed_Case (Name);
         Pkg_File : constant String := Pkg_Name_To_File (Pkg_Name);
         O   : AAA.Strings.Vector;
      begin
         O.Append ("with ROSIDL.Typesupport;");
         O.New_Line;

         O.Append_Line ("package " & Pkg_Name & " is");
         O.New_Line;

         O.Append (Manual_Warning);
         O.New_Line;

         O.Append ("   use ROSIDL;");
         O.New_Line;

         O.Append_Vector
           (Empty_Vector
            & "   package Handling is"
            & ""
            & "      Support : constant Typesupport.Service_Support :="
            & "        Typesupport.Get_Service_Support"
            & String'("          (Pkg => """ & Pkg_Lower & """,")
            & String'("           Srv => """ & Name & """);")
            & ""
            & "   end Handling;"
            & "");

         O.Append_Line ("end " & Pkg_Name & ";");

         Write_In_Place (O, Pkg_File);
      end Create_Service;

   begin
      case Kind is
         when Message =>
            Create_Parent_Package (Identify_Package & ".Messages");
            Create_Message (Name, Message);
         when Service =>
            Create_Parent_Package (Identify_Package & ".Services");
            Create_Service (Name);
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
      O.Append      ("   package Compiler is");
      O.Append    ("      for Switches (""Ada"") use (""-gnatao"", ""-O2"");");
      O.Append      ("   end Compiler;");
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
