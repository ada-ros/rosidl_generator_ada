with ROSIDL.Dynamic.Extras;
with ROSIDL.Symbols;

package body ROSIDL.Static.Message is

   use type C_Message_Access;

   C_Create : constant Symbols.Func_Ret_Addr :=
                Symbols.To_Func
                  (Symbols.Get_Message_Function
                     (Pkg  => To_Ns (Pkg, Kind (Part)),
                      Name => Name & Part_Symbol_Suffix (Part),
                      Op   => "create"));

   C_Destroy : constant Symbols.Proc_Addr := Symbols.To_Proc
     (Symbols.Get_Message_Function
        (Pkg  => To_Ns (Pkg, Kind (Part)),
         Name => Name & Part_Symbol_Suffix (Part),
         Op   => "destroy"));

   -------------
   -- Address --
   -------------

   overriding function Address (This : Message) return System.Address
   is (This.Ptr.all'Address);

   ------------
   -- Create --
   ------------

   function Create return C_Message_Access is
   begin
      return To_Message_Access (C_Create.all);
   end Create;

   -------------
   -- Destroy --
   -------------

   procedure Destroy (This : in out C_Message_Access) is
   begin
      if This /= null then
         C_Destroy (This.all'Address);
         This := null;
      end if;
   end Destroy;

   -------------
   -- Dynamic --
   -------------

   function Dynamic (This : Message) return ROSIDL.Dynamic.Message is
   begin
      return ROSIDL.Dynamic.Extras.Bind (This.Ptr.all'Address, Support);
   end Dynamic;

   ----------------
   -- Initialize --
   ----------------

   overriding procedure Initialize (This : in out Message) is
   begin
      This.Ptr := Create;
   end Initialize;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize (This : in out Message) is
   begin
      if This.Owned then
         Destroy (This.Ptr);
      end if;
   end Finalize;

   -----------------
   -- New_Message --
   -----------------

   function New_Message (From : ROSIDL.Dynamic.Message) return Message
   is (Message'(Ada.Finalization.Limited_Controlled with
                Ptr   => To_Message_Access (From.To_Ptr),
                Owned => False));

   ------------------------
   -- New_Shared_Message --
   ------------------------

   function New_Shared_Message (From : ROSIDL.Dynamic.Shared_Message)
                                return Shared_Message
   is (Shared_Message'(Data       => To_Message_Access (From.Msg.To_Ptr),
                       Dynamic    => From.Msg,
                       Shared_Raw => From));

end ROSIDL.Static.Message;
