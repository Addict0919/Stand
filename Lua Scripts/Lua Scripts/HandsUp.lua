util.require_natives(1651208000)
while true do
    if PAD.IS_CONTROL_PRESSED(1, 323) then
        while not STREAMING.HAS_ANIM_DICT_LOADED("random@mugging3") do
            STREAMING.REQUEST_ANIM_DICT("random@mugging3")
            util.yield(100)
        end
        if not ENTITY.IS_ENTITY_PLAYING_ANIM(PLAYER.PLAYER_PED_ID(), "random@mugging3", "handsup_standing_base", 3) then
            WEAPON.SET_CURRENT_PED_WEAPON(PLAYER.PLAYER_PED_ID(), MISC.GET_HASH_KEY("WEAPON_UNARMED"), true)
            TASK.TASK_PLAY_ANIM(PLAYER.PLAYER_PED_ID(), "random@mugging3", "handsup_standing_base", 3, 3, -1, 51, 0, false, false, false)
            STREAMING.REMOVE_ANIM_DICT("random@mugging3")
            PED.SET_ENABLE_HANDCUFFS(PLAYER.PLAYER_PED_ID(), true)
        end
    end
    if PAD.IS_CONTROL_RELEASED(1, 323) and ENTITY.IS_ENTITY_PLAYING_ANIM(PLAYER.PLAYER_PED_ID(), "random@mugging3", "handsup_standing_base", 3) then
        TASK.CLEAR_PED_SECONDARY_TASK(PLAYER.PLAYER_PED_ID())
        PED.SET_ENABLE_HANDCUFFS(PLAYER.PLAYER_PED_ID(), false)
    end
    util.yield()
end