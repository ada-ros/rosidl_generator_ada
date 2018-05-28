with Interfaces.C;

package Rosidl.Types is
   
   package C renames Interfaces.C;

   --  Predefined types and their Ada equivalents
   
   function Type_Name (Id : Positive) return String;
   
private

   use type Uint8_T;
   
   function Type_Name (Id : Uint8_T) return String is 
     (if    Id = Rti_Bool_Id then    "boolean"
      elsif Id = Rti_Byte_Id then    "byte"
      elsif Id = Rti_Float32_Id then "float32"
      elsif Id = Rti_Float64_Id then "float64"
      elsif Id = Rti_Int8_Id then    "int8"
      elsif Id = Rti_Uint8_Id then   "uint8"
      elsif Id = Rti_Int16_Id then   "int16"
      elsif Id = Rti_Uint16_Id then  "uint16"
      elsif Id = Rti_Int32_Id then   "int32"
      elsif Id = Rti_Uint32_Id then  "uint32"
      elsif Id = Rti_Int64_Id then   "int64"        
      elsif Id = Rti_Uint64_Id then  "uint64"
      elsif Id = Rti_String_Id then  "string"
      elsif Id = Rti_Message_Id then "message"
      else                           "unknown (id:" & Id'Img & ")");

   
   function Type_Name (Id : Positive) return String is
     (Type_Name (Uint8_T (Id)));

end Rosidl.Types;
