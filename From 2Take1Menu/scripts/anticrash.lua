require("natives-1614644776")


wo = menu.list(menu.my_root(), "World Objects", {}, "", function(); end)

menu.action(wo, "Are Models Loaded?", {}, "", function()
    local hash = util.joaat("v_res_d_dildo_f")
    if STREAMING.HAS_MODEL_LOADED(hash) then
        util.toast("v_res_d_dildo_f Model Loaded")
    else
        util.toast("v_res_d_dildo_f Model Not Loaded")
    end

end)


menu.action(wo, "Load Dildo", {}, "", function()
    local myped = PLAYER.GET_PLAYER_PED(PLAYER.PLAYER_ID())
        local hash = util.joaat("v_res_d_dildo_f")
        if not STREAMING.HAS_MODEL_LOADED(hash) then
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, 130, -1310, 30)
            STREAMING.REQUEST_MODEL(hash)
            util.yield(0)
        end
        STREAMING.REQUEST_MODEL(hash)
        util.yield(100)
end)

menu.action(wo, "Unload Dildo", {}, "", function()
        local hash = util.joaat("v_res_d_dildo_f")
        if STREAMING.HAS_MODEL_LOADED(hash) then
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            util.yield(0)
        end
end)



while true do
    util.yield()
end