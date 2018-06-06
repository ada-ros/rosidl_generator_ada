with Ada.Unchecked_Conversion;

with ROSIDL.Support;
with ROSIDL.Types;

with System;

generic
   with package Field is new Support.Field_Accessor (<>);
   
   Type_Id : Types.Ids; -- The ROS id from field_types.h
   type Value is private;
package ROSIDL.Field_References is

   type Reference (Element : not null access Value) is limited private with
     Implicit_Dereference => Element;
   
   function Ref (C : Field.Container) return Reference;
   
private 
   
   type Value_Ptr is access Value with Convention => C;
   
   function To_Value_Ptr is new Ada.Unchecked_Conversion (System.Address,
                                                          Value_Ptr);
   
   type Reference (Element : not null access Value) is limited null record;

end ROSIDL.Field_References;
