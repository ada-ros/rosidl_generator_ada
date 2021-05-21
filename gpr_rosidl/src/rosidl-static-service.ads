with ROSIDL.Static.Message;
with ROSIDL.Typesupport;

generic
   Pkg   : Package_Name;    -- Package declaring the message
   Name  : String;          -- Service name
   with package Request_Handling is new Static.Message (Part => Request,
                                                        others => <>);
   with package Response_Handling is new Static.Message (Part => Response,
                                                         others => <>);
package ROSIDL.Static.Service is

   --  This package is automatically instantiated by the static service
   --  generator for every service type. Users are not expected to
   --  manually instantiate them (although it is doable), since an
   --  instance will be found at the corresponding generated package
   --  at ROSIDL.Static.Namespace.Services.Name.

   --  Re-export names that somehow are not visible otherwise in clients
   package Req_Handling renames Request_Handling;
   package Resp_Handling renames Response_Handling;

   subtype Request_Raw_Message is Request_Handling.Msg;
   subtype Response_Raw_Message is Response_Handling.Msg;

   subtype Request_Message is Request_Handling.Message;
   subtype Response_Message is Request_Handling.Message;

   Support : constant Typesupport.Service_Support;
   --  Support to create services of this type

   Request_Support  : Typesupport.Message_Support renames Request_Handling.Support;
   Response_Support : Typesupport.Message_Support renames Response_Handling.Support;
   --  Supports needed for the request/responses

private

   Support : constant Typesupport.Service_Support :=
        Typesupport.Get_Service_Support
          (Pkg => Pkg,
           Srv => Name);

end ROSIDL.Static.Service;
