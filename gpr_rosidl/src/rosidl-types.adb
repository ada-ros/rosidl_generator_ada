with Rosidl_Runtime_C_String_Functions_H; use Rosidl_Runtime_C_String_Functions_H;

with Stddef_H;

package body ROSIDL.Types is

   ----------------
   -- Set_String --
   ----------------

   procedure Set_String (Str  : aliased in out ROS_String;
                         Text : String) is
   begin
      --  Note: to avoid a copy here, we are horribly casting Text. Should this
      --  cause problems, there should be safer means by copying Text (C_Strings).
      pragma Assert
        (Rosidl_Runtime_C_U_String_U_Assignn
           (Str   => Rosidl_Runtime_C_U_String (Str)'Unrestricted_Access,
            Value => C_Strings.Unchecked_To_Ptr (Text (Text'First)'Unrestricted_Access),
            N     => Stddef_H.Size_T (Text'Length)));
   end Set_String;

end ROSIDL.Types;
