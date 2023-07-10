util.require_natives("natives-1651208000")

-- stackoverflow is love
-- https://stackoverflow.com/a/67917666
local function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

local kills_ptr = memory.alloc_int()
local deaths_ptr = memory.alloc_int()

util.create_tick_handler(function()

    -- thank you Sapphire for helping me with reading/writing globals and helping me fix the ratio not being written with the new update c:
    global_kills  = memory.script_global(1853348 + 1 + (players.user() * 834) + 205 + 28)
    global_deaths = memory.script_global(1853348 + 1 + (players.user() * 834) + 205 + 29)
    global_ratio  = memory.script_global(1853348 + 1 + (players.user() * 834) + 205 + 26)

    kills_stat_hash  = util.joaat("MPPLY_KILLS_PLAYERS")
    deaths_stat_hash = util.joaat("MPPLY_DEATHS_PLAYER")
    ratio_stat_hash  = util.joaat("MPPLY_KILL_DEATH_RATIO")

    STATS.STAT_GET_INT(kills_stat_hash, kills_ptr, -1)
    STATS.STAT_GET_INT(deaths_stat_hash, deaths_ptr, -1)

    get_stat_kills  = memory.read_int(kills_ptr)
    get_stat_deaths = memory.read_int(deaths_ptr)

    get_global_kills  = memory.read_int(global_kills)
    get_global_deaths = memory.read_int(global_deaths)

    if get_global_kills == get_stat_kills then
        cur_kills = get_global_kills
    else
        cur_kills = get_stat_kills
    end

    if get_global_deaths == get_stat_deaths then
        cur_deaths = get_global_deaths
    else
        cur_deaths = get_stat_deaths
    end

end)

if util.is_session_started() then

    menu.divider(menu.my_root(), "Current KD")

    local cur_kills_display = menu.action(menu.my_root(), "Current Kills:   " .. cur_kills, { "" }, "Shows current kills.", function()  end)

    local cur_death_display = menu.action(menu.my_root(), "Current Deaths:   " .. cur_deaths, { "" }, "Shows current deaths.", function()   end)

    local cur_ratio_display = menu.action(menu.my_root(), "Current Ratio:   " .. cur_kills / cur_deaths, { "" }, "Shows current ratio.", function()   end)

    menu.divider(menu.my_root(), "New KD")

    local kills_slider_value = cur_kills
    local deaths_slider_value = cur_deaths

    local new_kills = menu.slider(menu.my_root(), "New Kills Amount", {"killsamount"}, "Selects the number of kills.", -2147483647, 2147483647, cur_kills, 1, function(value)
        kills_slider_value = value
    end)

    local new_deaths = menu.slider(menu.my_root(), "New Deaths Amount", {"deathsamount"}, "Selects the number of deaths.", -2147483647, 2147483647, cur_deaths, 1, function(value)
        deaths_slider_value = value
    end)

    util.create_tick_handler(function()
        new_ratio = round(menu.get_value(new_kills) / menu.get_value(new_deaths), 2)
    end)

    local new_ratio_display = menu.action(menu.my_root(), "New Ratio: " .. round(new_ratio, 2), { "" }, "Shows new ratio.", function()  end)

    menu.action(menu.my_root(), "Set KD", { "setkd" }, "Sets your KD.", function()
        memory.write_int(global_kills, kills_slider_value)
        memory.write_int(global_deaths, deaths_slider_value)
        memory.write_float(global_ratio, new_ratio)
        STATS.STAT_SET_INT(kills_stat_hash, kills_slider_value, true)
        STATS.STAT_SET_INT(deaths_stat_hash, deaths_slider_value, true)
        STATS.STAT_SET_FLOAT(ratio_stat_hash, new_ratio, true)
        util.toast("Set your KD ratio to " .. new_ratio .. " c:")
    end)

    util.create_tick_handler(function()
        menu.set_menu_name(cur_kills_display, "Current Kills: " .. cur_kills)
        menu.set_menu_name(cur_death_display, "Current Deaths: " .. cur_deaths)
        menu.set_menu_name(cur_ratio_display, "Current Ratio: " .. round(cur_kills/cur_deaths, 2))
        menu.set_menu_name(new_ratio_display, "New Ratio: " .. round(new_ratio, 2))
    end)
else
    util.yield(169)
    util.toast("You have to be online!")
    util.stop_script()
end

util.keep_running()