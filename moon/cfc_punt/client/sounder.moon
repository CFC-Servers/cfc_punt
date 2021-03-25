import sounds, soundCount from CFCPunt
export CFCPunt

CFCPunt.getSound = () -> sounds[random 1, soundCount]
CFCPunt.getPitch = (ev) ->
    switch ev
        when ev > 50000 1
        when ev > 40000 50
        when ev > 30000 75
        when ev > 20000 100
        when ev > 10000 150
        when ev > 5000 200
        else 255

CFCPunt.onPunt = (_, ent)
    return unless CFCPunt.isEnabled\GetBool!

    phys = ent\GetPhysicsObject!
    pitch = 100

    if IsValid phys then
        entVolume = phys\GetVolume!
        pitch = getPitch entVolume

    soundPath = CFCPunt.getSound!
    ent\EmitSound soundPath, 120, pitch, 1, CHAN_BODY

hook.Add "GravGunPunt", "CFCPunt_ExpressDispleasure", CFCPunt.onPunt
