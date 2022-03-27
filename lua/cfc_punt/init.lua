if SERVER then
  AddCSLuaFile("cfc_punt/client/init.lua")
  AddCSLuaFile("cfc_punt/client/options.lua")
  AddCSLuaFile("cfc_punt/client/sounder.lua")
  return include("cfc_punt/server/init.lua")
else
  return include("cfc_punt/client/init.lua")
end
