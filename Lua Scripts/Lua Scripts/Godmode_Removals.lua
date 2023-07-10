util.require_natives(1640181023)
local function player(pid)   

menu.divider(menu.player_root(pid), "Godmode Removals")
menu.action(menu.player_root(pid), "Kill Godmode Player", {"killgodmode"}, "Note: this will not work if they have no ragdoll on", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("khanjali")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, false)
    util.yield(7500)
    entities.delete_by_handle(vehicle1)
end) 

menu.toggle_loop(menu.player_root(pid), "Remove Godmode", {"removegm"}, "removes the players godmode by forcing camera forward. blocked by most menus", function()
    if not players.exists(pid) then
        util.stop_thread()
    end
    util.trigger_script_event(1 << pid, {801199324, pid, 869796886, math.random(0, 9999)})
    end)
end

players.on_join(player)
players.dispatch_on_join()
util.keep_running()