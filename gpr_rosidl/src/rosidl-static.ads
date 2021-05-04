with Ada.Finalization;
with System;

package ROSIDL.Static is

   --  A wrapped message is our RAII version of the generated structs that
   --  match the C messages. This minimal common functionality is used in
   --  the statically typed topics.

   type Wrapped_Message is abstract new Ada.Finalization.Limited_Controlled
   --  Making it controlled already simplifies things later
   with null record;

   function Address (This : Wrapped_Message) return System.Address is abstract;

end ROSIDL.Static;
