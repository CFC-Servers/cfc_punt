if SERVER
    AddCSLuaFile "cfc_punt/client/init.lua"
    AddCSLuaFile "cfc_punt/client/options.lua"
    AddCSLuaFile "cfc_punt/client/sounder.lua"
    include "cfc_punt/server/init.lua"
else
    include "cfc_punt/client/init.lua"
