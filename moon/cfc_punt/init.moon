if SERVER
    AddCSLuaFile "client/init.lua"
    AddCSLuaFile "client/options.lua"
    AddCSLuaFile "client/sounder.lua"
    AddCSLuaFile "client/sounds.lua"
else
    include "client/init.lua"
