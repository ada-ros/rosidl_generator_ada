with Ada.Unchecked_Deallocation;

package body Shared_Pointers is

   ------------
   -- Adjust --
   ------------

   overriding procedure Adjust     (This : in out Shared) is
   begin
      if This.References /= null then
         This.References.all := This.References.all + 1;
      end if;
   end Adjust;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize   (This : in out Shared) is
   begin
      if This.References /= null then
         This.References.all := This.References.all - 1;
         if This.References.all = 0 then
            declare
               type Elem_Ptr is access all Element_Type;
               type Nat_Ptr  is access all Natural;
               procedure Free is new Ada.Unchecked_Deallocation (Element_Type, Elem_Ptr);
               procedure Free is new Ada.Unchecked_Deallocation (Natural,      Nat_Ptr);

               Ptr : Elem_Ptr := Elem_Ptr (This.Element);
               Nat : Nat_Ptr  := Nat_Ptr  (This.References);
            begin
               Free (Ptr);
               Free (Nat);
            end;
         end if;
      end if;
   end Finalize;

   -----------------
   -- Make_Shared --
   -----------------

   function Make_Shared (Element : access Element_Type) return Shared is
     (Ada.Finalization.Controlled with
      Element    => Element,
      References => new Natural'(1));

end Shared_Pointers;
