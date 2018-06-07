with Ada.Finalization;

generic
   type Element_Type (<>) is limited private;
--     type Element_Access is access Element_Type;
package Shared_Pointers with Preelaborate is

   type Shared (Element : not null access Element_Type) is private
     with Implicit_Dereference => Element;
   
   function Make_Shared (Element : access Element_Type) return Shared;
   
private 

   type Shared (Element : access Element_Type) is 
     new Ada.Finalization.Controlled with
      record
         References : access Natural;
      end record;
   
   overriding procedure Adjust     (This : in out Shared);
   overriding procedure Finalize   (This : in out Shared);
   
end Shared_Pointers;
