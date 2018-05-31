--  with Ada.Text_IO; use Ada.Text_IO;

with ROSIDL.Types;

package body ROSIDL.Field_References is

   function Get (C : Field.Container) return Reference is
   begin
--        Put_Line ("At Field_References.get");
--        Put_Line ("Typeid:" & Type_Id'Img);
--        Put_Line ("Requested:" & Field.Get_Member (C).Type_Id_U'Img);

      if Field.Get_Member (C).Type_Id_U /= Type_Id Then
         raise Constraint_Error with
           "Type mismatch: asked for [" & Types.Name (Type_Id) &
           "] but field is [" & Types.Name (Field.Get_Member (C).Type_Id_U) & "]";
      else
         return Reference'(Element => To_Value_Ptr (Field.Get_Field_Ptr (C)));
      end if;
   end Get;

end ROSIDL.Field_References;
