with Ada.Unchecked_Conversion;

with Interfaces.C.Strings;

package C_Strings with Preelaborate is

   package C  renames Interfaces.C;
   package CS renames Interfaces.C.Strings;
   
   Null_Ptr : CS.Chars_Ptr renames CS.Null_Ptr;
   
   type C_String (<>) is tagged private;
   
   function To_C (S : String) return C_String;
   
   function To_Ptr (Str                   : C_String;
                    Null_Instead_Of_Empty : Boolean := True) 
                    return CS.Chars_Ptr;
   
   function To_Ptr (S : String) return CS.Chars_Ptr;
   
private
   
   use all type C.Size_T;
   
   type C_String (Len : C.size_t) is tagged record
      Cstr : aliased C.Char_Array (1 .. Len);
   end record;
   --  Convenience type for the many conversions       
   
   ----------
   -- To_C --
   ----------

   function To_C (S : String) return C_String is
     (Len => S'Length + 1, 
      Cstr => C.To_C (S));   
   
   type Char_Access is access constant C.Char;
   
   ------------------------------
   -- Char_Access_To_Chars_Ptr --
   ------------------------------

   function Char_Access_To_Chars_Ptr is new 
     Ada.Unchecked_Conversion (Char_Access, CS.Chars_Ptr);
   
   ------------
   -- To_Ptr --
   ------------

   function To_Ptr (Str                   : C_String;
                    Null_Instead_Of_Empty : Boolean := True) 
                    return CS.Chars_Ptr is
     (if Null_Instead_Of_Empty and then Str.Len = 0 
      then Null_Ptr
      else Char_Access_To_Chars_Ptr (Str.Cstr (Str.Cstr'First)'Unchecked_Access));
   --  This obviously presumes the pointer won't be kept elsewhere.
   --  We shall see if this blows up in our face or what.
   
   ------------
   -- To_Ptr --
   ------------

   function To_Ptr (S : String) return CS.Chars_Ptr is  (To_C (S).To_Ptr);

end C_Strings;
