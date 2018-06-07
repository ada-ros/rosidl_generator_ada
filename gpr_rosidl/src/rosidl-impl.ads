with Ada.Containers.Indefinite_Holders;

with ROSIDL.Dynamic;

package ROSIDL.Impl is

   --  Root for packages that do not concern clients

   package Message_Holders Is
     new Ada.Containers.Indefinite_Holders (Dynamic.Shared_Message, Dynamic."=");

   subtype Message_Holder is Message_Holders.Holder;

end ROSIDL.Impl;
