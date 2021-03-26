if SERVER
    AddCSLuaFile "cfc_punt/client/init.lua"
    AddCSLuaFile "cfc_punt/client/options.lua"
    AddCSLuaFile "cfc_punt/client/sounder.lua"
    AddCSLuaFile "cfc_punt/client/sounds.lua"
else
    include "cfc_punt/client/init.lua"
