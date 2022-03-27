local random
random = math.random
util.AddNetworkString("CFCPunt_ExpressDispleasure")
CFCPunt.onPunt = function(_, ent) end
CFCPunt.getSound = function()
  return CFCPunt.sounds[random(1, CFCPunt.soundCount)]
end
CFCPunt.getPhysVolume = function(ent)
  local phys = ent:GetPhysicsObject()
  if not (IsValid(phys)) then
    return 30001
  end
  return phys:GetVolume() or 30001
end
CFCPunt.getEntVolume = function(ent)
  local mins, maxes = ent:GetHitBoxBounds(0, 0)
  if not (mins and maxes) then
    return CFCPunt.getPhysVolume(ent)
  end
  local v = maxes - mins
  return v.x * v.y * v.z
end
CFCPunt.getPitch = function(ev)
  local range
  local _exp_0 = true
  if (ev > 500000) == _exp_0 then
    range = {
      50,
      75
    }
  elseif (ev > 180000) == _exp_0 then
    range = {
      75,
      90
    }
  elseif (ev > 30000) == _exp_0 then
    range = {
      90,
      110
    }
  elseif (ev > 10000) == _exp_0 then
    range = {
      110,
      125
    }
  else
    range = {
      125,
      150
    }
  end
  return random(unpack(range))
end
return hook.Add("GravGunPunt", "CFCPunt_ExpressDispleasure", function(_, ent)
  local entVolume = CFCPunt.getEntVolume(ent)
  local pitch = CFCPunt.getPitch(entVolume)
  local soundPath = CFCPunt.getSound()
  local playingSound = ent.playingPuntSound
  if playingSound then
    ent:StopSound(ent.playingPuntSound)
  end
  ent.playingPuntSound = soundPath
  net.Start("CFCPunt_ExpressDispleasure")
  net.WriteEntity(ent)
  net.WriteString(soundPath)
  net.WriteUInt(pitch, 8)
  return net.Broadcast()
end)
