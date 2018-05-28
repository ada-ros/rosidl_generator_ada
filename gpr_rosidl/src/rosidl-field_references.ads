with Ada.Unchecked_Conversion;

with ROSIDL.Support;
with ROSIDL.Types;

with System;

generic
   with package Field is new Support.Field_Accessor (<>);
   
   Type_Id : Uint8_T; -- The ROS id from field_types.h
   type Value is limited private;
package ROSIDL.Field_References is

   type Reference (Element : not null access Value) is limited private with
     Implicit_Dereference => Element;
   
   function Get (C : Field.Container) return Reference;
   
private 
   
   type Value_Ptr is access Value with Convention => C;
   
   function To_Value_Ptr is new Ada.Unchecked_Conversion (System.Address,
                                                          Value_Ptr);
   
   type Reference (Element : not null access Value) is limited null record;
   
   ---------
   -- Get --
   ---------

   function Get (C : Field.Container) return Reference is
     (if Field.Get_Member (C).Type_Id_U /= Type_Id 
      then raise Constraint_Error with 
        "Type mismatch: asked for [" & Types.Name (Type_Id) &
        "] but field is [" & Types.Name (Field.Get_Member (C).Type_Id_U) & "]"
      else Reference'(Element => To_Value_Ptr (Field.Get_Field_Ptr (C))));

end ROSIDL.Field_References;
