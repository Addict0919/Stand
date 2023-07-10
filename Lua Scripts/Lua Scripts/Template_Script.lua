util.require_natives("natives-1663599433-uno")
util.keep_running()

-- A Script Template Made by Candy

-- Change everything that says 'name' to you're script name.

util.toast("Welcome to NAME Script\n" .. "\n" .. "This Menu Is For somthing.\n" .. "\n" .. "Enjoy\n" .. "\n" .. "Template Made by Candy")

util.log("████████╗███████╗███╗░░░███╗██████╗░██╗░░░░░░█████╗░████████╗███████╗")
util.log("╚══██╔══╝██╔════╝████╗░████║██╔══██╗██║░░░░░██╔══██╗╚══██╔══╝██╔════╝")
util.log("░░░██║░░░█████╗░░██╔████╔██║██████╔╝██║░░░░░███████║░░░██║░░░█████╗░░") -- Text Used By This Website: https://fsymbols.com/text-art/
util.log("░░░██║░░░██╔══╝░░██║╚██╔╝██║██╔═══╝░██║░░░░░██╔══██║░░░██║░░░██╔══╝░░")
util.log("░░░██║░░░███████╗██║░╚═╝░██║██║░░░░░███████╗██║░░██║░░░██║░░░███████╗")
util.log("░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝")

---------------------------------------------------------------------------------------------------------------------------------------

-- Credits List

local Credits = menu.list(menu.my_root(), "Credits", {""}, "")
---------------------------------------------------------------------------------
menu.divider(Credits, "Great Coders <3")
---------------------------------------------------------------------------------
menu.action(Credits, "NAME", {}, "Details.", function() end)
menu.action(Credits, "NAME", {}, "Details.", function() end)
menu.action(Credits, "NAME", {}, "Details.", function() end)
---------------------------------------------------------------------------------
menu.divider(Credits, "Great Supporters <3")
---------------------------------------------------------------------------------
menu.action(Credits, "NAME", {}, "Details.", function() end)
menu.action(Credits, "NAME", {}, "Details.", function() end)
menu.action(Credits, "NAME", {}, "Details.", function() end)
---------------------------------------------------------------------------------

-- Script Header Name

local translations = {}
setmetatable(translations, {
    __index = function (self, key)
        return key
    end
})

local festive_div = menu.divider(menu.my_root(), "NAME Script")
local loading_frames = {'!', '! !', '! ! !', '! ! ! !', ' ! ! ! ! ! ! ! ! !', '! ! ! !', '! ! !', '! !', '!'}
util.create_tick_handler(function()
    for _, frame in pairs(loading_frames) do
        menu.set_menu_name(festive_div, frame .. ' ' .. translations.Name_Script .. ' ' .. frame)
        util.yield(100)
    end
end)

--------------------------------------------------------------------------------------------------------------------

Self_Menu = menu.list(menu.my_root(), "Self", {}, "", function() end)

menu.divider(Self_Menu, "Self")

menu.toggle(Self_Menu, "Example Of toggle", {""}, "", function(on_toggle)
    if on_toggle then
        -- Code Here
    else
        -- Code Here
    end
end)
--------------------------------------------------------------------------------------------------------------------

World_Menu = menu.list(menu.my_root(), "World", {}, "", function() end)

menu.divider(World_Menu, "World")

menu.toggle(World_Menu, "Example Of toggle", {""}, "", function(on_toggle)
    if on_toggle then
        -- Code Here
    else
        -- Code Here
    end
end)

--------------------------------------------------------------------------------------------------------------------

Cash_Menu = menu.list(menu.my_root(), "Recovery", {}, "", function() end)

menu.divider(Cash_Menu, "Recovery")

menu.toggle(Cash_Menu, "Example Of toggle", {""}, "", function(on_toggle)
    if on_toggle then
        -- Code Here
    else
        -- Code Here
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

--------------------------------------------------------------------------------------------------------------------

custselc = menu.list(menu.my_root(), "Select Players", {}, "", function(); end)

menu.toggle(custselc, "Exclude Selected", {"excludepussies"}, "", function(on_toggle)
    if on_toggle then
        excludeselected = true
    else
        excludeselected = false
    end
end)

menu.action(custselc, "Go to Players List", {"gotopl"}, "Shotcut for players list.", function()
    menu.trigger_commands("playerlist")
end)

menu.divider(custselc, "Select Players")

selectedplayer = {}
for b = 0, 31 do
    selectedplayer[b] = false
end
excludeselected = false

cmd_id = {}
for i = 0, 31 do
    cmd_id[i] = 0
end

menu.toggle(custselc, "Blast Kick", {}, "Blocks Joins And Kicks Them.", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("breakup" .. PLAYER.GET_PLAYER_NAME(pids))
                menu.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("breakup" .. PLAYER.GET_PLAYER_NAME(pids))
                menu.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        end
    end
end)

menu.toggle(custselc, "Block Player", {}, "", function()
    for pids = 0, 31 do
        if excludeselected then
            if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        else
            if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                menu.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
                util.yield()
            end
        end
    end
end)

menu.divider(custselc, "Select Players")

for pids = 0, 31 do
    if players.exists(pids) then
        cmd_id[pids] = menu.toggle(custselc, tostring(PLAYER.GET_PLAYER_NAME(pids)), {}, "PID - ".. pids, function(on_toggle)
            if on_toggle then
                selectedplayer[pids] = true
            else
                selectedplayer[pids] = false
            end
        end)
    end
end


menu.action(menu.my_root(), "Yeet", {"ye"}, "Instantly sending yourself to desktop.", function()
    menu.trigger_commands("yeet")
end)

menu.action(menu.my_root(), "Yeet Roulette", {"yeetroulette"}, "Take a chance by instantly sending yourself to desktop or use the Restart GTA V Option.", function()
    local pick = math.random(6)
    if pick == 4 then 
        menu.show_command_box("say " .. "I loose.")
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        util.log("I loose.")
        util.yield(200)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        menu.trigger_commands("ye")
    else
        util.toast("Lucky Bastard ;)")
		menu.show_command_box("say " .. "I got lucky.")
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        util.yield(200)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
    end
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.action(menu.my_root(), "Restart GTA V", {"restartgta"}, "Restarts your game, closes it Online. You will need to reinject (duh).", function(on_click)
    MISC.RESTART_GAME("E574A662ACAEFBB1")
    util.yield(3000)
    menu.trigger_commands("ye")
    menu.trigger_commands("yeet")
end)


menu.action(menu.my_root(), "Restart Script", {"restartaddictlua"}, "Restarts the script to check for updates. Or you may prefer it on hotkey to make it the first script in players list making spectate option faster to find.", function ()
    util.restart_script()
end)

---------------------------------------------------------------------------------------------------------------------------------------

-- Player's List Code

players.on_join(function(pid)

menu.divider(menu.player_root(pid), "NAME")

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