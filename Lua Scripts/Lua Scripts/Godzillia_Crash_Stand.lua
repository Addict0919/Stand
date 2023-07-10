util.require_natives()

local function fallback_kick(pid)
    local kicks_ref = menu.ref_by_rel_path(menu.player_root(pid), "Kick")
    local blacklist_ref = menu.ref_by_rel_path(kicks_ref, "Blacklist")
    local be_alone_ref = menu.ref_by_path("Online>Session>Be Alone")
    local breakup_ref = menu.ref_by_rel_path(kicks_ref, "Breakup")

    if host == my_pid then
        menu.trigger_command(blacklist_ref)
    elseif pid == players.user() then
        menu.trigger_command(be_alone_ref)
    else
        menu.trigger_command(breakup_ref)
    end
    util.yield(169)
end

local function block_syncs_except_pid(pid, on_off)
    for index, player in ipairs(players.list(false, true, true)) do
        if player ~= pid then
            local timeout_ref = menu.ref_by_rel_path(menu.player_root(player), "Timeout")
            menu.trigger_command(timeout_ref, (on_off and "on" or "off"))
        end
    end
end

local function request_model(model_name)
    local hash = util.joaat(model_name)
    if STREAMING.IS_MODEL_VALID(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        return true, hash
    end
    util.log("request_model received invalid model " .. model_name)
    return false, nil
end

local function request_control(ent)
    if not NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent) then
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
        util.log("request_control is requesting control of entity with handle " .. tostring(ent))
    end
end



local function generate_features(pid)

    menu.divider(menu.player_root(pid), "Godzillia Crash")

    local crash_list = menu.list(menu.player_root(pid), "Crash")

    menu.action(crash_list, "Godzillia Crash", {""}, "",  function(index, value)
        if not disable_kick then
            fallback_kick(pid)
        end
 for i = 1, 50 do
       		menu.trigger_commands("steamroll" .. players.get_name(pid))
        end
        util.toast("GODZILLIA CRASH ACTIVATED")
    end)
end

menu.toggle(menu.my_root(), "Disable Fallback Kick", { "fallback" }, "Enabling this disables kicking with crashes.", function(toggle)
    disable_kick = toggle
end)

players.on_join(generate_features)
players.dispatch_on_join()

util.keep_running()