with Ada.Exceptions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

with C_Strings;

with Interfaces.C.Strings;

with ROSIDL.Impl.Arrays;

with Rosidl_Generator_C_String_Functions_H; use Rosidl_Generator_C_String_Functions_H;

--  with Std_Msgs_Msg_Multi_Array_Dimension_Ufunctions_H; use Std_Msgs_Msg_Multi_Array_Dimension_Ufunctions_H;
with Std_Msgs_Msg_String_Ustruct_H;                   use Std_Msgs_Msg_String_Ustruct_H;

with System.Address_Image;
with System.Storage_Elements;

package body ROSIDL.Dynamic is

   package CS renames Interfaces.C.Strings;
   package CX renames Support.CX;

   use all type Interfaces.C.Size_T;
   pragma Warnings (Off);
   use all type Uint8_T;
   pragma Warnings (On);
   use all type System.Address;
   use all type Types.Ids;

   -------------------
   -- Array_Element --
   -------------------

   function Array_Element (Arr   : Array_View;
                           Index : Cursor) return Ref_Type'Class is
     (Arr.Array_Element (Index.Pos));

   --------------
   -- As_Array --
   --------------

   function As_Array (Ref : Ref_Type) return Array_View'Class is
   begin
      if Ref.Member.Is_Array_U /= Bool_False Then
         return Array_View'(Msg_Kind => Ref.Kind,
                            Member   => Ref.Member,
                            Ptr      => Ref.Ptr);
      else
         raise Constraint_Error with "Field is not an array";
      end if;
   end As_Array;

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

   ------------
   -- Length --
   ------------

   function Capacity (Arr : Array_View) return Natural is
     (if Arr.Kind = Static
      then Natural (Arr.Member.Array_Size_U)
      else Natural (Impl.Arrays.To_Unconstrained_Array (Arr.Ptr).Capacity));

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

   -------------
   -- Element --
   -------------

   function Element (Arr   : Array_View;
                     Index : Positive) return Ref_Type'Class
   is
      use System.Storage_Elements;

      function Get_Item_Addr (Base : System.Address) return System.Address is
        (Base + Storage_Offset ((Index - 1) *
                                (if Id (Natural (Arr.Member.Type_Id_U)) = Types.Message_Id
                                 then Integer (Get_Introspection (Arr.Member).Size_Of_U)
                                 else Types.Size_Of (Id (Natural (Arr.Member.Type_Id_U))))));

   begin
      if Index > Arr.Length then
         raise Constraint_Error with
           "Out of bounds, index:" & Index'Img & "; last:" & Arr.Length'Img;
      end if;

      if Arr.Kind = Static then
         return Ref_Type'(Global_Void'Access,
                          Arr.Msg_Kind,
                          Arr.Member,
                          Get_Item_Addr (Arr.Ptr));
      else
         return Ref_Type'(Global_Void'Access,
                          Arr.Msg_Kind,
                          Arr.Member,
                          Get_Item_Addr (Impl.Arrays.To_Unconstrained_Array (Arr.Ptr).Data));
      end if;
   end Element;

   -----------------
   -- Get_Boolean --
   -----------------

   function Get_Boolean (Ref : aliased in out Ref_Type) return Boolean is
     (Support.To_Boolean (Ref.As_Bool));

   -----------------------
   -- Get_Introspection --
   -----------------------

   function Get_Introspection (Member : access constant Introspection.Message_Member_Meta)
                               return access constant Introspection.Message_Members_Meta
   is
      function To_Members_Ptr Is
        new Ada.Unchecked_Conversion (System.Address,
                                      Introspection.Message_Members_Meta_Ptr);
   begin
      if Id (Natural (Member.Type_Id_U)) /= Types.Message_Id then
         raise Constraint_Error with "Only valid for message fields";
      else
         return To_Members_Ptr (Member.Members_U.Data);
      end if;
   end Get_Introspection;

   -----------------
   -- Get_Message --
   -----------------

   function Get_Message (Ref : Ref_Type) return Message'Class is
   begin
      if Id (Natural (Ref.Member.Type_Id_U)) /= Types.Message_Id then
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
         raise Constraint_Error with "Field is not of type string but " & Types.Name (Id (Natural (Ref.Member.Type_Id_U)));
      else
         return CS.Value (To_Str_Ptr (Ref.Ptr).Data.Data);
      end if;
   end Get_String;

   ----------
   -- Init --
   ----------

   function Init (Msg_Support : ROSIDL.Typesupport.Message_Support) return Message
   is
      Pkg : constant String := Msg_Support.Message_Class.Package_Name;
      Msg : constant String := Msg_Support.Message_Class.Message_Name;

      Create : constant Support.Func_Ret_Addr :=
                 Support.To_Func (Support.Get_Message_Function (Msg_Support.Kind, Pkg, Msg, "create"));
   begin
      return M : Message (Is_Field => False) do
         begin
            M.Msg := Create.all;

            M.Support := Msg_Support;

            --  Functions we'll need at destroy time:
            M.Destroy := Support.To_Proc (Support.Get_Message_Function (Msg_Support.Kind, Pkg, Msg, "destroy"));
         exception
            when E : others =>
               Put_Line ("Dynamic.Msg.Init: " & Ada.Exceptions.Exception_Information (E));
               raise;
         end;
      end return;
   end Init;

   ----------
   -- Init --
   ----------

   function Init_Shared (Msg_Support : ROSIDL.Typesupport.Message_Support)
                  return Shared_Message
   is
      pragma Warnings (Off);
      Msg : constant access Message := new Message'(Init (Msg_Support));
      pragma Warnings (On);
   begin
      return (Msg => Msg,
              Ptr => Shared_Messages.Make_Shared (Msg));
   end Init_Shared;

   ----------------
   -- Introspect --
   ----------------

   function Introspect (This : Message) return Introspection.Message_Class is
     (This.Support.Message_Class);

   ----------
   -- Kind --
   ----------

   function Kind (Arr : Array_View) return Array_Kinds is
     (if    Arr.Member.Array_Size_U      = 0   then Dynamic
      elsif Bool (Arr.Member.Is_Upper_Bound_U) then Bounded
      else                                          Static);

   ------------
   -- Length --
   ------------

   function Length (Arr : Array_View) return Natural is
     (case Arr.Kind is
         when Static => Arr.Capacity,
         when others => Natural (Impl.Arrays.To_Unconstrained_Array (Arr.Ptr).Size));

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
         type GFA is access function (arg1 : System.Address; arg2 : C.size_t) return System.Address;
         type GSA is access function (arg1 : System.Address) return C.size_t;
         type RFA is access function (arg1 : System.Address; arg2 : C.size_t) return Support.CX.Bool;
         function To_Addr is new Ada.Unchecked_Conversion (GFA, System.Address);
         function To_Addr is new Ada.Unchecked_Conversion (GSA, System.Address);
         function To_Addr is new Ada.Unchecked_Conversion (RFA, System.Address);
         function To_Addr is new Ada.Unchecked_Conversion
           (ROSIDL.Typesupport.Msg_Support_Handle, System.Address);
         Name : constant String := C_Strings.Value (M.Name_U);
      begin
         Put_Line (Prefix & "=== " & Name & " ===");
         Put_Line (Prefix & "              Type id:" & M.Type_Id_U'Img & " (" & Types.Name (Id (Natural (M.Type_Id_U))) & ")");
         Put_Line (Prefix & "   String upper bound:" & M.String_Upper_Bound_U'Img);
         Put_Line (Prefix & "              members: (rosidl_message_type_support_t *) " & System.Address_Image (To_Addr (M.Members_U)));

         Put_Line (Prefix & "             Is array:" & M.Is_Array_U'Img);
         if Bool (M.Is_Array_U) then
            declare
               Arr : constant Array_View'Class := This.Reference (Name).As_Array;
               --  Indexing instead of calling reference causes a bug here
            begin
               Put_Line (Prefix & "           Array kind: " & Arr.Kind'Img);
               Put_Line (Prefix & "Array size (declared):"  & M.Array_Size_U'Img);
               Put_Line (Prefix & "  Array size (actual):"  & Arr.Length'Img);
               Put_Line (Prefix & "       Array capacity:"  & Arr.Capacity'Img);
            end;
         end if;

         Put_Line (Prefix & "     Has bounded size:" & M.Is_Upper_Bound_U'Img);
         Put_Line (Prefix & "               Offset:" & M.Offset_U'Img);
         Put_Line (Prefix & "        Default value: (void*)");
         Put_Line (Prefix & "             Data ptr: (void*) " & System.Address_Image (Data_Ptr));
         Put_Line (Prefix & "        size_function: " & System.Address_Image (To_Addr (M.size_function)));
         Put_Line (Prefix & "         get_function: " & System.Address_Image (To_Addr (M.get_function)));
         Put_Line (Prefix & "   get_const_function: " & System.Address_Image (To_Addr (M.get_const_function)));
         Put_Line (Prefix & "      resize_function: " & System.Address_Image (To_Addr (M.resize_function)));

         if Id (Natural (M.Type_Id_U)) = Types.Message_Id then
            This.Reference (C_Strings.Value (M.Name_U))
              .Get_Message
                .Print_Metadata (Prefix & "--| ");
         end if;
      end Print_Member;

      Members : array (1 .. This.Introspect.To_C.Member_Count_U)
                   of aliased Introspection.Message_Member_Meta with
        Convention => C,
        Import,
        Address => This.Introspect.To_C.Members_U.all'Address;
   begin
      Put_Line (Prefix & "************************************************************");
      Put_Line (Prefix & "    Message: " & This.Introspect.Package_Name & "/" & This.Introspect.Message_Name);
      Put_Line (Prefix & "       Size:"  & This.Introspect.Size'Img & " bytes");
      Put_Line (Prefix & "Field count:" & Members'Length'Img);
      for Member of Members loop
         Print_Member (Member, This.Reference (C_Strings.Value (Member.Name_U)).Ptr);
      end loop;
   end Print_Metadata;

   ---------------
   -- Reference --
   ---------------

   function Reference (This  : Message;
                       Field : String) return Ref_Type'Class
   is
      use System.Storage_Elements;

--        type Member_Array is array (1 .. This.Introspect.To_C.Member_Count_U) of aliased Introspection.Message_Member_Meta
--          with Convention => C;
--
--        type Array_Ptr is access Member_Array with Convention => C;
--
--        function To_Array_Ptr is new Ada.Unchecked_Conversion (Member_Metadata_Ptr, Array_Ptr);
--
--        Members : aliased constant Array_Ptr := To_Array_Ptr (This.Introspect.To_C.Members_U);

      Members : array (1 .. This.Introspect.To_C.Member_Count_U)
                   of aliased Introspection.Message_Member_Meta with
        Convention => C,
        Import,
        Address => This.Introspect.To_C.Members_U.all'Address;

      First   : constant String := Head (Field);
      Rest    : constant String := Tail (Field);
   begin
      if Rest /= "" then
         return This (First).Get_Message.Reference (Rest);
      else
         for Member of Members loop
            if CS.Value (Member.Name_U) = Field then
               --  Put_Line ("Field offset is" & Member.Offset_U'Img);
               return Ref_Type'(Reserved => Global_Void'Access,
                                Kind     => This.Support.Kind,
                                Member   => Member'Unchecked_Access,
                                Ptr      => This.Msg + Storage_Offset (Member.Offset_U));
            end if;
         end loop;

         raise Constraint_Error with "Field [" & Field & "] not found in message";
      end if;
   end Reference;

   ------------
   -- Resize --
   ------------

   procedure Resize (Arr : Array_View; Length : Natural) is

      type Init is access function (Arr : System.Address; Size : C.Size_T) return CX.Bool with Convention => C;
      type Fini is access procedure (Arr : System.Address) with Convention => C;

      function Init_Func is new Ada.Unchecked_Conversion (System.Address, Init);
      function Fini_Proc is new Ada.Unchecked_Conversion (System.Address, Fini);

      procedure Resize (Pkgname, Typename : String) is
         --  bool
         --  rosidl_generator_c__String__Array__init(
         --    rosidl_generator_c__String__Array * array, size_t size);
      begin
         Fini_Proc (Support.Get_Message_Function (Arr.Msg_Kind, Pkgname, Typename & "__Array", "fini")).all (Arr.Ptr);

         if not Bool (Init_Func (Support.Get_Message_Function (Arr.Msg_Kind, Pkgname, Typename & "__Array", "init")).all (Arr.Ptr, C.Size_T (Length))) then
            raise Program_Error with "Array initialization failed";
         end if;

         if Arr.Capacity /= Length then
            raise Program_Error with "Array capacity is not the requested one";
         end if;
      end Resize;

   begin
      if Arr.Kind = Static then
         raise Constraint_Error with "Cannot resize static arrays";
      elsif Arr.Kind = Bounded and then Length >= Natural (Arr.Member.Array_Size_U) then
         raise Constraint_Error with "Cannot resize beyond max bounded length:" & Arr.Member.Array_Size_U'Img;
      end if;

      if Id (Natural (Arr.Member.Type_Id_U)) = Types.Message_Id then
         Resize (C_Strings.Value (Get_Introspection (Arr.Member).Package_Name_U),
                 C_Strings.Value (Get_Introspection (Arr.Member).Message_Name_U));
      else
         Resize ("std_msgs", Types.Name (Id (Natural (Arr.Member.Type_Id_U))));
      end if;
   end Resize;

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
         raise Constraint_Error with "Field is not of type string but " & Types.Name (Id (Natural (Ref.Member.Type_Id_U)));
      elsif Ref.Member.String_Upper_Bound_U /= 0 and Then
        Str'Length > Natural (Ref.Member.String_Upper_Bound_U)
      then
         raise Constraint_Error with "String exceeds bounded string length:" & Ref.Member.String_Upper_Bound_U'Img;
      else
         if not Bool (Rosidl_Generator_C_U_String_U_Assign
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


   --------------
   -- MATRICES --
   --------------

   function As_Array (Mat : Matrix_View) return Array_View'Class is
     (Mat.As_Message.Reference ("data").As_Array);

   ---------------
   -- As_Matrix --
   ---------------

   function As_Matrix (Ref : Ref_Type'Class) return Matrix_View is
     ((Member => Ref.Member,
       Ptr    => Ref.Ptr));

   ----------------
   -- As_Message --
   ----------------

   function As_Message (Mat : Matrix_View) return Message'Class is
     (Bind (Is_Field   => True,
            Data       => Mat.Ptr,
            Introspect => Get_Introspection (Mat.Member)));

   --------------
   -- Capacity --
   --------------

   function Capacity (Mat : Matrix_View; Dimension : Positive) return Natural is
     (Natural (Mat.Get_Dimension (Dimension).Size));

   ----------------
   -- Dimensions --
   ----------------

   function Dimensions (Mat : Matrix_View) return Natural is
      (Natural (Mat.Get_Layout.Dim.Size));

   -------------
   -- Element --
   -------------

   function Element (Mat : Matrix_View;
                     Pos : Matrix_Indices)
                     return Ref_Type'Class is
     (Mat.As_Array.Element (Mat.Linear_Index (Pos)));

   -------------------
   -- Get_Dimension --
   -------------------

   function Get_Dimension (Mat : Matrix_View; Dim : Positive) return access Std_Msgs_U_Msg_U_MultiArrayDimension is
      Dimensions : aliased array (1 .. Mat.Get_Layout.Dim.Size) of aliased Std_Msgs_U_Msg_U_MultiArrayDimension with
        Import,
        Convention => C,
        Address    => Mat.Get_Layout.Dim.Data.all'Address; -- First element
   begin
      return Dimensions (C.Size_T (Dim))'Unchecked_Access; -- Safe because although declare in stack, it is actually from the message heap
   end Get_Dimension;

   ----------------
   -- Get_Layout --
   ----------------

   function Get_Layout (Mat : Matrix_View) return access constant Std_Msgs_U_Msg_U_MultiArrayLayout is
      Layout : aliased Std_Msgs_U_Msg_U_MultiArrayLayout with
        Import,
        Convention => C,
        Address    => Mat.As_Message.Reference ("layout").Ptr;
   begin
      return Layout'Unchecked_Access; -- Safe because although declare in stack, it is actually from the message heap
   end Get_Layout;

   -----------
   -- Label --
   -----------

   function Label (Mat : Matrix_View; Dimension : Positive) return String is
     (C_Strings.Value (Mat.Get_Dimension (Dimension).Label.Data));

   ------------
   -- Length --
   ------------

   function Length (Mat : Matrix_View; Dimension : Positive) return Natural is
     (Natural (Mat.Get_Dimension (Dimension).Size));

   ------------------
   -- Linear_Index --
   ------------------

   function Linear_Index (Mat : Matrix_View;
                          Pos : Matrix_Indices)
                          return Positive
   is
   begin
      if Pos'Length /= Mat.Dimensions then
         raise Constraint_Error with "Index invalid:" &
           Pos'Length'Img & " dimensions given," &
           Mat.dimensions'Img & " in matrix";
      end if;

      -- Note: dim_stride[0] is not used but exists, ROS2 arrays are 0-based
      -- multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
      return Result : Positive := Pos (Pos'Last) do
         for I in 1 .. Pos'Last - 1 loop
            Result := Result + (Mat.Stride (I + 1) * (Pos (I) - 1));
         end loop;
      end return;
   end Linear_Index;

   ----------
   -- Size --
   ----------

   function Size (Mat : Matrix_View) return Natural is
   begin
      if Mat.Dimensions = 0 then
         return 0;
      else
         return Ret : Natural := 1 do
            for I in 1 .. Natural (Mat.Get_Layout.Dim.Size) loop
               Ret := Ret * Mat.Length (I);
            end loop;
         end return;
      end if;
   end Size;

   ------------
   -- Resize --
   ------------

   procedure Resize (Mat     : Matrix_View;
                     Lengths : Matrix_Indices;
                     Names   : Dimension_Naming_Function := Default_Names'Access)
   is
--        Dim_Array : aliased Std_Msgs_U_Msg_U_MultiArrayDimension_U_Array with
--          Import,
--          Convention => C,
--          Address    => Mat.Get_Layout.Dim'Address;
   begin
      --  Create layout thing:
      Mat.As_Message.Reference ("layout.data_offset").As_Uint32 := 0;
      --  TODO: when should this be nonzero??
      Mat.As_Message.Reference ("layout.dim").As_Array.Resize (Lengths'Length);

       for I in reverse Lengths'Range loop
         Mat.Get_Dimension (I).Size   := C.Unsigned (Lengths (I));
         Mat.Get_Dimension (I).Stride := C.Unsigned (Lengths (I) *
           (if I = Lengths'Last
            then 1
            else Natural (Mat.Get_Dimension (I + 1).Stride)));

         Mat.As_Message.Field ("layout.dim").As_Array.Element (I).Get_Message.Field ("label").Set_String (Names (I));
      end loop;

      --  Resize the actual data vector:
      Mat.As_Message.Reference ("data").As_Array.Resize (Mat.Size);
   end Resize;

   ------------
   -- Stride --
   ------------

   function Stride (Mat : Matrix_View; Dimension : Positive) return Natural is
     (Natural (Mat.Get_Dimension (Dimension).Stride));

   ---------------
   -- ITERATORS --
   ---------------

   type Arr_Iterator is limited new Array_Iterators.Forward_Iterator with record
      Last : Natural;
   end record;

   overriding function First (I : Arr_Iterator) return Cursor is
     (Pos   => 1,
      Valid => 1 <= I.Last);

   overriding function Next  (I        : Arr_Iterator;
                              Position : Cursor) return Cursor is
     (Pos   => Position.Pos + 1,
      Valid => Position.Pos < I.Last);

   function Iterate (Arr : Array_View) return Array_Iterators.Forward_Iterator'Class is
     (Arr_Iterator'(Last => Arr.Length));

end ROSIDL.Dynamic;
