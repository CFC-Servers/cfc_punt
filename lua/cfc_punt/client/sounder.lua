return net.Receive("CFCPunt_ExpressDispleasure", function()
  if not (CFCPunt.isEnabled:GetBool()) then
    return 
  end
  local ent = net.ReadEntity()
  local soundPath = net.ReadString()
  local pitch = net.ReadUInt(8)
  if not (IsValid(ent)) then
    return 
  end
  local playingSound = ent.playingPuntSound
  if playingSound then
    ent:StopSound(ent.playingPuntSound)
  end
  ent.playingPuntSound = soundPath
  return ent:EmitSound(soundPath, 70, pitch, 1, CHAN_AUTO)
end)
