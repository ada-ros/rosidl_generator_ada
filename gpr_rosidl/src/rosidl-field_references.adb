package body ROSIDL.Field_References is

   use Types;

   function Ref (C : Field.Container) return Reference is
   begin
--        Put_Line ("At Field_References.get");
--        Put_Line ("Typeid:" & Type_Id'Img);
--        Put_Line ("Requested:" & Field.Get_Member (C).Type_Id_U'Img);

      if Id (Natural (Field.Get_Member (C).Type_Id_U)) /= Type_Id then
         raise Constraint_Error with
           "Type mismatch: asked for [" & Types.Name (Type_Id) &
           "] but field is [" & Types.Name (Id (Natural (Field.Get_Member (C).Type_Id_U))) & "]";
      else
         return Reference'(Element => To_Value_Ptr (Field.Get_Field_Ptr (C)));
      end if;
   end Ref;

end ROSIDL.Field_References;
