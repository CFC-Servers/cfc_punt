import random from math
import sounds, soundCount from CFCPunt
export CFCPunt

CFCPunt.getSound = () -> sounds[random 1, soundCount]
CFCPunt.getPitch = (ev) ->
    range = switch true
        when ev > 50000 {1, 50}
        when ev > 40000 {50, 75}
        when ev > 30000 {75, 100}
        when ev > 20000 {100, 125}
        when ev > 10000 {125, 200}
        else {200, 255}

    random unpack range

CFCPunt.onPunt = (_, ent) ->
    return unless CFCPunt.isEnabled\GetBool!

    phys = ent\GetPhysicsObject!
    pitch = 100

    if IsValid phys then
        entVolume = phys\GetVolume!
        pitch = CFCPunt.getPitch entVolume

    soundPath = CFCPunt.getSound!

    print soundPath, pitch
    ent\EmitSound soundPath, 150, pitch, 1, CHAN_BODY

hook.Add "GravGunPunt", "CFCPunt_ExpressDispleasure", CFCPunt.onPunt
