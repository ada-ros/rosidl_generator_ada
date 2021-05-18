package ROSIDL.Dynamic.Extras is

   --  Used by the static message facilities. Not really useful for users.

   function Bind (From    : System.Address;
                  Support : ROSIDL.Typesupport.Message_Support)
                  return Message;

private

   function Bind (From    : System.Address;
                  Support : ROSIDL.Typesupport.Message_Support)
                  return Message
   is (Message'(Ada.Finalization.Limited_Controlled with
                Is_Field => False,
                Destroy  => null,
                Msg      => From,
                Support  => Support,
                Owned    => False));
   --  As this is a view controlled in the static type, the dynamic view is not
   --  Owned, nor needs Destroy to be ever called, so it can be null.

end ROSIDL.Dynamic.Extras;
