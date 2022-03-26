import random from math
export CFCPunt

util.AddNetworkString "CFCPunt_ExpressDispleasure"

CFCPunt.onPunt = (_, ent) ->
CFCPunt.getSound = () -> CFCPunt.sounds[random 1, CFCPunt.soundCount]
CFCPunt.getPhysVolume = (ent) ->
    phys = ent\GetPhysicsObject!

    -- Put it right in the "normal" range if we can't figure it out
    return 30001 unless IsValid phys

    phys\GetVolume! or 30001

CFCPunt.getEntVolume = (ent) ->
    mins, maxes = ent\GetHitBoxBounds 0, 0

    -- If we can't get the volume like this, try an alternative method
    if not (mins and maxes)
        return CFCPunt.getPhysVolume ent

    v = maxes - mins
    v.x * v.y * v.z

CFCPunt.getPitch = (ev) ->
    range = switch true
        when ev > 500000 {50, 75} -- > 500,000
        when ev > 180000 {75, 90} -- 180,000 - 500,000
        when ev > 30000  {90, 110} -- 30,000 - 180,000
        when ev > 10000 {110, 125} -- 10,000 - 30,000
        else {125, 150} -- < 10,000

    random unpack range

hook.Add "GravGunPunt", "CFCPunt_ExpressDispleasure", (_, ent) ->
    entVolume = CFCPunt.getEntVolume ent
    pitch = CFCPunt.getPitch entVolume

    soundPath = CFCPunt.getSound!
    playingSound = ent.playingPuntSound

    ent\StopSound ent.playingPuntSound if playingSound
    ent.playingPuntSound = soundPath

    net.Start "CFCPunt_ExpressDispleasure"
    net.WriteEntity ent
    net.WriteString soundPath
    net.WriteUInt pitch, 8
    net.Broadcast!
