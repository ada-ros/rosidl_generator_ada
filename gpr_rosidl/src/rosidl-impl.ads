with Ada.Containers.Indefinite_Holders;

with ROSIDL.Dynamic;

package ROSIDL.Impl is

   --  Root for packages that do not concern clients

   package Message_Holders is
     new Ada.Containers.Indefinite_Holders (Dynamic.Shared_Message, Dynamic."=");

   subtype Message_Holder is Message_Holders.Holder;

   function To_Holder (Msg : Dynamic.Shared_Message) return Message_Holder;

private

   function To_Holder (Msg : Dynamic.Shared_Message) return Message_Holder is
     (Message_Holders.To_Holder (Msg));

end ROSIDL.Impl;
