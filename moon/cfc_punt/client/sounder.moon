net.Receive "CFCPunt_ExpressDispleasure", () ->
    return unless CFCPunt.isEnabled\GetBool!

    ent = net.ReadEntity!
    soundPath = net.ReadString!
    pitch = net.ReadUInt 8

    return unless IsValid ent

    playingSound = ent.playingPuntSound

    ent\StopSound ent.playingPuntSound if playingSound
    ent.playingPuntSound = soundPath

    ent\EmitSound soundPath, 70, pitch, 1, CHAN_AUTO
