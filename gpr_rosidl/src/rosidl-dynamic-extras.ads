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
                Destroy  => Symbols.To_Proc
                  (Symbols.Get_Message_Function
                     (Pkg  => Support.Message_Class.Name_Space,
                      Name => Support.Message_Class.Msg_Name,
                      Op   => "destroy")),
                Msg      => From,
                Support  => Support));
   --  The Destroy lookup could be avoided at the calling point, as this is
   --  already available in the static message packages. To bear in mind if
   --  it ends being too expensive.

end ROSIDL.Dynamic.Extras;
