with Ada.Unchecked_Conversion;

package body ROSIDL.Impl.Matrices is

   ------------
   -- Offset --
   ------------

   function Offset (Index  : Indexes;
                    Layout : access constant Std_Msgs_U_Msg_U_MultiArrayLayout)
                    return   Natural
   is
   begin
      if Index'Length /= Natural (Layout.Dim.Size) then
         raise Constraint_Error with "Index invalid:" &
           Index'Length'Img & " dimensions given," &
           Layout.Dim.Size'Img & " in struct";
      end if;

      -- Note: dim_stride[0] is not used but exists, ROS2 arrays are 0-based
      -- multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
      declare
         Dims : array (1 .. Natural (Layout.Dim.Size)) of aliased Multi_Array_Dimension with
           Import,
           Convention => C,
           Address    => Layout.Dim.Data.all'Address;
      begin
         return Result : Natural := Natural (Layout.Data_Offset) + Index (Index'Last) do
            for I in 2 .. Index'Last loop
               Result := Result + Natural (Dims (I).Stride) * (I - 1);
            end loop;
         end return;
      end;
   end Offset;

end ROSIDL.Impl.Matrices;
