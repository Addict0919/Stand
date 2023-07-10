util.require_natives("natives-1663599433-uno")
util.keep_running()

util.toast("Welcome to .AngerWave. Script\n" .. "\n" .. "This Menu Is For somthing.\n" .. "\n" .. "Enjoy\n" .. "\n" .. "Template Made by Candy")

util.log("████████╗███████╗███╗░░░███╗██████╗░██╗░░░░░░█████╗░████████╗███████╗")
util.log("╚══██╔══╝██╔════╝████╗░████║██╔══██╗██║░░░░░██╔══██╗╚══██╔══╝██╔════╝")
util.log("░░░██║░░░█████╗░░██╔████╔██║██████╔╝██║░░░░░███████║░░░██║░░░█████╗░░") -- Text Used By This Website: https://fsymbols.com/text-art/
util.log("░░░██║░░░██╔══╝░░██║╚██╔╝██║██╔═══╝░██║░░░░░██╔══██║░░░██║░░░██╔══╝░░")
util.log("░░░██║░░░███████╗██║░╚═╝░██║██║░░░░░███████╗██║░░██║░░░██║░░░███████╗")
util.log("░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝")

---------------------------------------------------------------------------------------------------------------------------------------

-- Script Header Name

local translations = {}
setmetatable(translations, {
    __index = function (self, key)
        return key
    end
})

local festive_div = menu.divider(menu.my_root(), ".AngerWave. Script")
local loading_frames = {'!', '! !', '! ! !', '! ! ! !', ' ! ! ! ! ! ! ! ! !', '! ! ! !', '! ! !', '! !', '!'}
util.create_tick_handler(function()
    for _, frame in pairs(loading_frames) do
        menu.set_menu_name(festive_div, frame .. ' ' .. translations.AngerWave_Script .. ' ' .. frame)
        util.yield(100)
    end
end)

--------------------------------------------------------------------------------------------------------------------

Protex = menu.list(menu.my_root(), "Protections", {}, "", function() end)

menu.divider(Protex, "Protections")

menu.toggle(Protex, "Example Of toggle", {""}, "", function(on_toggle)
    if on_toggle then
        -- Code Here
    else
        -- Code Here
    end
end)



menu.action(menu.my_root(), "Yeet", {"ye"}, "Instantly sending yourself to desktop.", function()
    menu.trigger_commands("yeet")
end)

menu.action(menu.my_root(), "Restart GTA V", {"restartgta"}, "Restarts your game, closes it Online. You will need to reinject (duh).", function(on_click)
    MISC.RESTART_GAME("E574A662ACAEFBB1")
end)

menu.action(menu.my_root(), "Restart Script", {"restartaddictlua"}, "Restarts the script to check for updates. Or you may prefer it on hotkey to make it the first script in players list making spectate option faster to find.", function ()
    util.restart_script()
end)

---------------------------------------------------------------------------------------------------------------------------------------

-- Player's List Code

players.on_join(function(pid)

menu.divider(menu.player_root(pid), ".AngerWave.")

local Vehicle_Events = menu.list(menu.player_root(pid), "Vehicle Events", {"vehicleevents", ""})
local Trolling = menu.list(menu.player_root(pid), "Trolling", {"trolling", ""})
local Crashing = menu.list(menu.player_root(pid), "Crashing", {"crashing"}, "")
local Kicks = menu.list(menu.player_root(pid), "Kicks", {"kicks"}, "")
local Friendly = menu.list(menu.player_root(pid), "Friendly", {"friendly", ""})

menu.action(menu.player_root(pid), "Spectate", {"spec"}, "", function()
    if pids == PLAYER.PLAYER_ID() then
        util.toast("Spectating " .. PLAYER.GET_PLAYER_NAME(pids))
        return
    else
    end
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid))
    local hash = util.joaat("baller")
    local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            util.yield()
        end
        local Coords1 = PlayerCoords.y + 10
        local Coords2 = PlayerCoords.y - 10
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
    end
end)

menu.divider(Vehicle_Events, "Vehicle Events")

menu.action(Vehicle_Events, "Vehicle Events", {}, "", function()
end)

menu.divider(Trolling, "Trolling")

menu.action(Trolling, "Trolling", {}, "", function()
end)

menu.divider(Crashing, "Crashing")

menu.action(Crashing, "Crashing", {}, "", function()
end)

menu.divider(Kicks, "Kicks")

menu.action(Kicks, "Kicks", {}, "", function()
end)

menu.divider(Friendly, "Friendly")

menu.action(Friendly, "Friendly", {}, ".", function()

    end)
end)

players.dispatch_on_join()
util.keep_running()