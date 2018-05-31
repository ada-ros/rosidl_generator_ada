with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

with C_Strings;

with Interfaces.C.Strings;

with Rosidl_Generator_C_String_Functions_H; use Rosidl_Generator_C_String_Functions_H;

with Std_Msgs_Msg_String_Ustruct_H; use Std_Msgs_Msg_String_Ustruct_H;

with System.Address_Image;
with System.Storage_Elements;

package body ROSIDL.Dynamic is

   package CS renames Interfaces.C.Strings;

   use all type System.Address;

   Global_Void : aliased Void;

   ---------------------
   -- Metadata access --
   ---------------------

   type Member_Metadata_Ptr is access constant Introspection.Message_Member_Meta
     with Convention => C;

   ----------
   -- Bind --
   ----------

   function Bind (Is_Field   : Boolean;
                  Data       : System.Address;
                  Introspect : access constant Introspection.Message_Members_Meta)
                  return       Message'Class
   is
      Pkg : constant String := C_Strings.Value (Introspect.Package_Name_U);
      Msg : constant String := C_Strings.Value (Introspect.Message_Name_U);

      Support : constant ROSIDL.Typesupport.Message_Support :=
                  ROSIDL.Typesupport.Get_Message_Support (Pkg, Msg);
   begin
      return This : Message (Is_Field => Is_Field) do
         This.Msg     := Data;
         This.Support := Support;
         --  Couldn't be done with an aggregate because of gnat bug
      end return;
   end Bind;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize (This : in out Message) is
   begin
      if (not This.Is_Field) and then This.Msg /= System.Null_Address then
         This.Destroy (This.Msg);
         This.Msg   := System.Null_Address;
      end if;
   end Finalize;

   -----------------
   -- Get_Boolean --
   -----------------

   function Get_Boolean (Ref : aliased in out Ref_Type) return Boolean is
     (Support.To_Boolean (Ref.As_Bool));

   -----------------------
   -- Get_Introspection --
   -----------------------

   function Get_Introspection (Ref : Ref_Type)
                               return access constant Introspection.Message_Members_Meta
   is
      function To_Ptr Is
        new Ada.Unchecked_Conversion (System.Address,
                                      Introspection.Message_Members_Meta_Ptr);
   begin
      if Ref.Member.Type_Id_U /= Types.Message_Id then
         raise Constraint_Error with "Only valid for message fields";
      else
         return To_Ptr (Ref.Member.Members_U.Data);
      end if;
   end Get_Introspection;

   -----------------
   -- Get_Message --
   -----------------

   function Get_Message (Ref : Ref_Type) return Message'Class is
   begin
      if Ref.Member.Type_Id_U /= Types.Message_Id then
         raise Constraint_Error with "Only valid for message fields";
      else
         return Bind (True,
                      Ref.Ptr,
                      Ref.Get_Introspection);
      end if;
   end Get_Message;

   ----------------
   -- Get_String --
   ----------------

   function Get_String (Ref : Ref_Type) return String is
      type Str_Ptr is access constant Std_Msgs_U_Msg_U_String with Convention => C;
      function To_Str_Ptr is new Ada.Unchecked_Conversion (System.Address, Str_Ptr);
   begin
      if Ref.Member.Type_Id_U /= Rti_String_Id then
         raise Constraint_Error with "Field is not of type string but " & Types.Name (Ref.Member.Type_Id_U);
      else
         return CS.Value (To_Str_Ptr (Ref.Ptr).Data.Data);
      end if;
   end Get_String;

   ----------
   -- Init --
   ----------

   function Init (Pkg : String;  -- ROS2 package declaring the msg; e.g. std_msgs
                  Msg : String)  -- Type of the message / name of *.msg e.g. string
                  return Message is
      (Init (ROSIDL.Typesupport.Get_Message_Support (Pkg, Msg)));

   ----------
   -- Init --
   ----------

   function Init (Msg_Support : ROSIDL.Typesupport.Message_Support) return Message
   is
      Pkg : constant String := Msg_Support.Message_Class.Package_Name;
      Msg : constant String := Msg_Support.Message_Class.Message_Name;

      Create : constant Support.Func_Ret_Addr :=
                 Support.To_Func (Support.Get_Message_Function (Pkg, Msg, "create"));
   begin
      return M : Message (Is_Field => False) do
         M.Msg := Create.all;

         M.Support := ROSIDL.Typesupport.Get_Message_Support (Pkg, Msg);

         --  Functions we'll need at destroy time:
         M.Destroy := Support.To_Proc (Support.Get_Message_Function (Pkg, Msg, "destroy"));
      end return;
   end Init;

   ----------------
   -- Introspect --
   ----------------

   function Introspect (This : Message) return Introspection.Message_Class is
     (This.Support.Message_Class);

   -----------
   -- Print --
   -----------

   procedure Print (This : Ref_Type) is
   begin
      Put_Line ("Reserved: " & Boolean'Image (This.Reserved /= null));
      Put_Line ("  Member: " & Boolean'Image (This.Member /= null));
      Put_Line ("     Ptr: " & Address_Image (This.Ptr));
   end Print;

   --------------------
   -- Print_Metadata --
   --------------------

   procedure Print_Metadata (This : Message; Prefix : String := "") is

      procedure Print_Member (M : Introspection.Message_Member_Meta; Data_Ptr : System.address) is
         function To_Addr is new Ada.Unchecked_Conversion
           (ROSIDL.Typesupport.Msg_Support_Handle, System.Address);
      begin
         Put_Line (Prefix & "=== " & C_Strings.Value (M.Name_U) & " ===");
         Put_Line (Prefix & "              Type id:" & M.Type_Id_U'Img & " (" & Types.Name (M.Type_Id_U) & ")");
         Put_Line (Prefix & "   String upper bound:" & M.String_Upper_Bound_U'Img);
         Put_Line (Prefix & "              members: (rosidl_message_type_support_t *) " & System.Address_Image (To_Addr (M.Members_U)));
         Put_Line (Prefix & "             Is array:" & M.Is_Array_U'Img);
         Put_Line (Prefix & "           Array size:" & M.Array_Size_U'Img);
         Put_Line (Prefix & "       Is upper bound:" & M.Is_Upper_Bound_U'Img);
         Put_Line (Prefix & "               Offset:" & M.Offset_U'Img);
         Put_Line (Prefix & "        Default value: (void*)");
         Put_Line (Prefix & "             Data ptr: (void*) " & System.Address_Image (Data_Ptr));


         if M.Type_Id_U = Types.Message_Id then
            This.Reference (C_Strings.Value (M.Name_U))
              .Get_Message
              .Print_Metadata (Prefix & "--| ");
         end if;
      end Print_Member;

      --  These declarations have to be unfortunately repeated since they depend on the dynamic upper bound
      type Member_Array is array (1 .. This.Introspect.To_C.Member_Count_U) of aliased Introspection.Message_Member_Meta
        with Convention => C;
      type Array_Ptr is access Member_Array with Convention => C;
      function To_Array_Ptr is new Ada.Unchecked_Conversion (Member_Metadata_Ptr, Array_Ptr);
      Members : aliased constant Array_Ptr := To_Array_Ptr (This.Introspect.To_C.Members_U);
   begin
      Put_Line (Prefix & "************************************************************");
      Put_Line (Prefix & "    Message: " & This.Introspect.Package_Name & "/" & This.Introspect.Message_Name);
      Put_Line (Prefix & "       Size:"  & This.Introspect.Size'Img & " bytes");
      Put_Line (Prefix & "Field count:" & Members'Length'Img);
      for Member of Members.all loop
         Print_Member (Member, This.Reference (C_Strings.Value (Member.Name_U)).Ptr);
      end loop;
   end Print_Metadata;

   ---------------
   -- Reference --
   ---------------

   function Reference (This  : Message'Class;
                       Field : String) return Ref_Type
   is
      use System.Storage_Elements;

      type Member_Array is array (1 .. This.Introspect.To_C.Member_Count_U) of aliased Introspection.Message_Member_Meta
        with Convention => C;

      type Array_Ptr is access Member_Array with Convention => C;

      function To_Array_Ptr is new Ada.Unchecked_Conversion (Member_Metadata_Ptr, Array_Ptr);

      Members : aliased constant Array_Ptr := To_Array_Ptr (This.Introspect.To_C.Members_U);

      First   : constant String := Head (Field);
      Rest    : constant String := Tail (Field);
   begin
      if Rest /= "" then
         return This (First).Get_Message.Reference (Rest);
      else
         for Member of Members.all loop
            if CS.Value (Member.Name_U) = Field then
               if Support.To_Boolean (Member.Is_Array_U) then
                  raise Program_Error with "Access to array fields unimplemented yet";
               else
                  --  Put_Line ("Field offset is" & Member.Offset_U'Img);
                  return (Reserved => Global_Void'Access,
                          Member   => Member'Unchecked_Access,
                          Ptr      => This.Msg + Storage_Offset (Member.Offset_U));
               end if;
            end if;
         end loop;

         raise Constraint_Error with "Field [" & Field & "] not found in message";
      end if;
   end Reference;

   -----------------
   -- Set_Boolean --
   -----------------

   procedure Set_Boolean (Ref : aliased in out Ref_Type; Bool : Boolean) is
   begin
      Ref.As_Bool := (if Bool then 1 else 0);
   end Set_Boolean;

   ----------------
   -- Set_String --
   ----------------

   procedure Set_String (Ref : Ref_Type; Str : String) is
      type Str_Ptr is access Std_Msgs_U_Msg_U_String with Convention => C;
      function To_Str_Ptr is new Ada.Unchecked_Conversion (System.Address, Str_Ptr);
   begin
      if Ref.Member.Type_Id_U /= Rti_String_Id then
         raise Constraint_Error with "Field is not of type string but " & Types.Name (Ref.Member.Type_Id_U);
      else
         if not Support.To_Boolean
           (Rosidl_Generator_C_U_String_U_Assign
              (To_Str_Ptr (Ref.Ptr).Data'Access,
               C_Strings.To_C (Str).To_Ptr))
         then
            raise Constraint_Error with "Setting string value failed";
         end if;
      end if;
   end Set_String;

   ------------
   -- To_Ptr --
   ------------

   function To_Ptr (This : Message) return System.Address is (This.Msg);

   -----------------
   -- Typesupport --
   -----------------

   function Typesupport (This : Message) return ROSIDL.Typesupport.Message_Support
     is (This.Support);

end ROSIDL.Dynamic;
