with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

with C_Strings;

with Interfaces.C.Strings;

with Rosidl_Generator_C_String_Functions_H; use Rosidl_Generator_C_String_Functions_H;

with Std_Msgs_Msg_String_Ustruct_H; use Std_Msgs_Msg_String_Ustruct_H;

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

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize (This : in out Message) is
   begin
      if This.Msg /= System.Null_Address then
         This.Fini    (This.Msg);
         This.Destroy (This.Msg);
         This.Msg   := System.Null_Address;
      end if;
   end Finalize;

   -----------------
   -- Get_Boolean --
   -----------------

   function Get_Boolean (Ref : aliased in out Ref_Type) return Boolean is
      (Support.To_Boolean (Ref.As_Bool));

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

      Init   : constant Support.Func_Addr_Ret_Bool :=
                 Support.To_Func (Support.Get_Message_Function (Pkg, Msg, "init"));
   begin
      return M : Message do
         M.Msg := Create.all;

         if not Support.To_Boolean (Init (M.Msg)) then
            raise Program_Error with "Message failed to initialize";
         end if;

         M.Support := ROSIDL.Typesupport.Get_Message_Support (Pkg, Msg);

         --  Functions we'll need at destroy time:
         M.Fini    := Support.To_Proc (Support.Get_Message_Function (Pkg, Msg, "fini"));
         M.Destroy := Support.To_Proc (Support.Get_Message_Function (Pkg, Msg, "destroy"));
      end return;
   end Init;

   ----------------
   -- Introspect --
   ----------------

   function Introspect (This : Message) return Introspection.Message_Class is
      (This.Support.Message_Class);

   --------------------
   -- Print_Metadata --
   --------------------

   procedure Print_Metadata (This : Message) is

      procedure Print_Member (M : Introspection.Message_Member_Meta) is
      begin
         Put_Line ("=== " & C_Strings.Value (M.Name_U) & " ===");
         Put_Line ("              Type id:" & M.Type_Id_U'Img);
         Put_Line ("   String upper bound:" & M.String_Upper_Bound_U'Img);
         Put_Line ("              members: (rosidl_message_type_support_t *)");
         Put_Line ("             Is array:" & M.Is_Array_U'Img);
         Put_Line ("           Array size:" & M.Array_Size_U'Img);
         Put_Line ("       Is upper bound:" & M.Is_Upper_Bound_U'Img);
         Put_Line ("               Offset:" & M.Offset_U'Img);
         Put_Line ("        Default value: (void*)");
      end Print_Member;

      --  These declarations have to be unfortunately repeated since they depend on the dynamic upper bound
      type Member_Array is array (1 .. This.Introspect.To_C.Member_Count_U) of aliased Introspection.Message_Member_Meta
        with Convention => C;
      type Array_Ptr is access Member_Array with Convention => C;
      function To_Array_Ptr is new Ada.Unchecked_Conversion (Member_Metadata_Ptr, Array_Ptr);
      Members : aliased constant Array_Ptr := To_Array_Ptr (This.Introspect.To_C.Members_U);
   begin
      Put_Line ("************************************************************");
      Put_Line ("    Message: " & This.Introspect.Package_Name & "/" & This.Introspect.Message_Name);
      Put_Line ("       Size:"  & This.Introspect.Size'Img & " bytes");
      Put_Line ("Field count:" & Members'Length'Img);
      for Member of Members.all loop
         Print_Member (Member);
      end loop;
   end Print_Metadata;

   ---------------
   -- Reference --
   ---------------

   function Reference (This  : in out Message'Class;
                       Field :        String) return Ref_Type
   is
      use System.Storage_Elements;

      type Member_Array is array (1 .. This.Introspect.To_C.Member_Count_U) of aliased Introspection.Message_Member_Meta
        with Convention => C;

      type Array_Ptr is access Member_Array with Convention => C;

      function To_Array_Ptr is new Ada.Unchecked_Conversion (Member_Metadata_Ptr, Array_Ptr);

      Members : aliased constant Array_Ptr := To_Array_Ptr (This.Introspect.To_C.Members_U);
   begin
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

   function To_Ptr (This : in out Message) return System.Address is (This.Msg);

   -----------------
   -- Typesupport --
   -----------------

   function Typesupport (This : Message) return ROSIDL.Typesupport.Message_Support
     is (This.Support);

end ROSIDL.Dynamic;
