package body ROSIDL is

   ----------
   -- Head --
   ----------

   function Head (S : String; Separator : Character := '.') return String is
   begin
      for I in S'Range loop
         if S (I) = Separator then
            return S (S'First .. I - 1);
         end if;
      end loop;

      return S;
   end Head;

   ----------
   -- Tail --
   ----------

   function Tail (S : String; Separator : Character := '.') return String is
   begin
      for I in S'Range loop
         if S (I) = Separator then
            return S (I + 1 .. S'Last);
         end if;
      end loop;

      return "";
   end Tail;

end ROSIDL;
