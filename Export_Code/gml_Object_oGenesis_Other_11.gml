if (hp <= 0)
{
    state = 100
    statetime = 0
    alarm[10] = 1
    alarm[11] = 300
    if (oControl.mod_fusion == 0)
    {
        mus_fadeout(musGenesis)
        oMusicV2.bossbgm = 0
    }
    global.event[307] = 1
    dead = 1
    if (instance_exists(oClient) && oClient.connected)
    {
        with (oClient)
            event_user(8)
    }
}
else
    sfx_play(sndGenesisHit)
