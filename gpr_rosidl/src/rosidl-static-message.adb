with ROSIDL.Dynamic.Extras;
with ROSIDL.Symbols;

package body ROSIDL.Static.Message is

   use type Msg_Access;

   C_Create : constant Symbols.Func_Ret_Addr :=
                Symbols.To_Func
                  (Symbols.Get_Message_Function
                     (Pkg  => To_Ns (Pkg, Kind (Part)),
                      Name => Name,
                      Op   => "create"));

   C_Destroy : constant Symbols.Proc_Addr := Symbols.To_Proc
     (Symbols.Get_Message_Function
        (Pkg  => To_Ns (Pkg, Kind (Part)),
         Name => Name,
         Op   => "destroy"));

   -------------
   -- Address --
   -------------

   overriding function Address (This : Message) return System.Address
   is (This.Ptr.all'Address);

   ------------
   -- Create --
   ------------

   function Create return Msg_Access is
   begin
      return To_Message_Access (C_Create.all);
   end Create;

   -------------
   -- Destroy --
   -------------

   procedure Destroy (This : in out Msg_Access) is
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
      Destroy (This.Ptr);
   end Finalize;

end ROSIDL.Static.Message;
