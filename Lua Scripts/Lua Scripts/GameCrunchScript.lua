util.toast("GameCrunchScript Version 3.0-S")  
util.require_natives(1640181023)
menu.divider(menu.my_root(), "GameCrunch Script")

local self = menu.list(menu.my_root(), "Self", {}, "Features relating to your character") -- Self root
-- local online = menu.list(menu.my_root(), "Online", {}, "Features relating to GTA-online") -- Online root
local credits = menu.list(menu.my_root(), "Credits", {}, "Just credits") -- Credits root

-- =================================================
-- Self Features

menu.action(self, "Boost pad", {}, "Spawns a boost pad in-front of yourself", function() 
    local coords = players.get_position(players.user())
    coords.z = coords.z - 0.6
    local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local heading = ENTITY.GET_ENTITY_HEADING(player)
    local heading = heading + 80
    local boostpad = entities.create_object(3287988974, coords)
    ENTITY.SET_ENTITY_HEADING(boostpad, heading)
end)

menu.action(self, "Horizontal boost pad", {}, "Spawns a horizontal boost pad in-front of yourself", function() 
    local coords = players.get_position(players.user())
    coords.z = coords.z - 0.6
    local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local heading = ENTITY.GET_ENTITY_HEADING(player)
    local boostpad = entities.create_object(-388593496, coords)
    ENTITY.SET_ENTITY_HEADING(boostpad, heading)
end)

menu.toggle_loop(self, "Never wanted", {}, "Alternative to locking your wanted level to zero, kind of useless but whatever", function()
util.set_local_player_wanted_level(0)
end)

-- =================================================
-- Online Features

--[[

-- Auto-kick Chat spammers (Unfinished)

msgTime = 0
function timeLastMsg()
    msgTime = msgTime + 1
    util.yield(1)
    if msgTime >= 300 then 
        msgTime = 0
end

players.on_join(function(pid) 

    if kickSpammers then 
        chat.on_message(msgSender, reservedSender)
        timeLastMsg()
        local sender = players.get_name(message_sender)
    end
end)

menu.toggle_loop(online, "Auto-kick chat spammers", {}, "False positives should be rare but could potentially happen", function()
    kickSpammers = toggle
end)

]]
-- ===============

-- Join the discord
menu.hyperlink(menu.my_root(), "Join the Republic of GameCrunch", "https://discord.gg/qjbBDtaxjX")

-- =================================================
-- Credits
menu.action(credits, "SoulReaper", {}, "Helped in #programming", function()
end)

menu.action(credits, "Lance", {}, "I looked at LanceScript to figure out how to spawn objects", function()
end)

menu.action(credits, "The Milk Man", {}, "Donated some OP lua crashes", function()
end)
-- =================================================

-- Other Player Features

players.on_join(function(pid)

    -- Root setup
    menu.divider(menu.player_root(pid), "GameCrunch Script")
    local playerRoot = menu.list(menu.player_root(pid), "GameCrunch Script", {"gcScript"}, "")
    local friendly = menu.list(playerRoot, "Friendly", {}, "")
    local trolling = menu.list(playerRoot, "Trolling", {}, "")
    
    -- =================================================
    -- Friendly features

    menu.action(friendly, "Boost pad", {}, "Spawns a boost pad in-front of the player", function() 
        local coords = players.get_position(pid)
        coords.z = coords.z - 0.6
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local heading = ENTITY.GET_ENTITY_HEADING(player)
        local heading = heading + 80
        local boostpad = entities.create_object(3287988974, coords)
        ENTITY.SET_ENTITY_HEADING(boostpad, heading)
    end)

    menu.action(friendly, "Horizontal Boost pad", {}, "Spawns a horizontal boost pad in-front of the player", function() 
        local coords = players.get_position(pid)
        coords.z = coords.z - 0.6
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local heading = ENTITY.GET_ENTITY_HEADING(player)
        local boostpad = entities.create_object(-388593496, coords)
        ENTITY.SET_ENTITY_HEADING(boostpad, heading)
    end)

    --[[
    function getVehicle()
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local isVehicle = PED.IS_PED_IN_ANY_VEHICLE(player, true)
        if isVehicle == true then 
            local vehicle = PED.GET_VEHICLE_PED_IS_IN(player, false)
            return vehicle
        end 
        return 0 
    end

    --[[
    menu.toggle_loop(friendly, "Give horn boost", {}, "Give the target horn-boost", function()  -- Causes self-crash
        local vehicle = getVehicle()
        local forward = ENTITY.GET_ENTITY_FORWARD_VECTOR(vehicle)
        while PLAYER.IS_PLAYER_PRESSING_HORN(pid) == true do 
            ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, forward.x, forward.y, forward.z, 0.0, 0.0, 0.0, false, true, true, true, true)
        end 
    end)
    

    -- RP DROP
    --[[

    local dropRP = menu.list(friendly, "Drop RP", {}, "")
    rpdropDelay = 1500

    menu.slider(dropRP, "RP drop delay", {}, "Delay for the RP drop", 100, 10000, 1500, 100, function(rpDelay)
        rpDropDelay = rpDelay
    end)

    menu.toggle_loop(dropRP, "Drop RP", {}, "RP drop but with adjustable delay", function() (commented out because not ban tested)
        local coords = players.get_position(pid)
        coords.z = coords.z + 1.5
        local figure = MISC.GET_HASH_KEY("vw_prop_vw_colle_prbubble")
        STREAMING.REQUEST_MODEL(figure)
        if STREAMING.HAS_MODEL_LOADED(figure) == false then  
            STREAMING.REQUEST_MODEL(figure)
        end
        OBJECT.CREATE_AMBIENT_PICKUP(-1009939663, coords.x, coords.y, coords.z, 0, 1, figure, false, true)
        util.yield(rpDropDelay)
    end)

    -- Card drop 

    local dropCard = menu.list(friendly, "Drop Cards", {}, "")
    cardDropDelay = 1500

    menu.slider(dropCard, "Card drop delay", {}, "Delay for the Card drop", 100, 10000, 1500, 100, function(cardDelay)  (commented out because not ban tested)
        cardDropDelay = cardDelay
    end)

    menu.toggle_loop(dropCard, "Drop Cards", {}, "Players can only pickup 54 cards per session, Note this hasn't been tested for bans but it should be safe", function()
        local coords = players.get_position(pid)
        coords.z = coords.z + 1.5
        local card = MISC.GET_HASH_KEY("vw_prop_vw_lux_card_01a")
        STREAMING.REQUEST_MODEL(card)
        if STREAMING.HAS_MODEL_LOADED(card) == false then  
            STREAMING.REQUEST_MODEL(card)
        end
        OBJECT.CREATE_AMBIENT_PICKUP(-1009939663, coords.x, coords.y, coords.z, 0, 1, card, false, true)
        util.yield(cardDropDelay)
    end)
]]
-- =================================================
    -- Trolling features

    menu.action(trolling, "Asteroid Smash", {}, "Crush the player with an asteroid", function() 
        local coords = players.get_position(pid)
        coords.z = coords['z'] + 15.0
        local asteroid = entities.create_object(3751297495, coords)
        ENTITY.SET_ENTITY_DYNAMIC(asteroid, true)
    end)

    menu.action(trolling, "Vehicle slow-down", {}, "Spawns a vehicle slow-down pad in-front of them", function() 
        local coords = players.get_position(pid)
        coords.z = coords.z - 0.4
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local heading = ENTITY.GET_ENTITY_HEADING(player)
        local heading = heading + 80
        local boostpad = entities.create_object(-227275508, coords)
        ENTITY.SET_ENTITY_HEADING(boostpad, heading)
    end)

    menu.toggle_loop(trolling, "Ragdoll loop", {}, "Keeps target ragdolled", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 11, 1, false, true, 0, true)
        util.yield(10)
    end)

    menu.action(trolling, "Ragdoll", {}, "Ragdoll the target once", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 11, 1, false, true, 0, true)
    end)

    menu.toggle_loop(trolling, "Flame loop", {}, "Spam fire beneath the target", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 12, 1, true, false, 0, false)
        util.yield(25)
    end)

    menu.toggle_loop(trolling, "Water Jet loop", {}, "Spam water jets beneath the target", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 13, 1, true, false, 0, false)
        util.yield(25)
    end)

    menu.toggle_loop(trolling, "Crap trail", {}, "", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] + 1.5
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 35, 0, false, false, 0, false)
        util.yield(65)
    end)

    menu.toggle_loop(trolling, "Flame path", {}, "They better run", function()
        local coords = players.get_position(pid)
        --coords.z = coords['z'] + 1.5
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 38, 0, false, false, 0, false)
        util.yield(65)
    end)

    -- ================================================================================
    -- SOUNDS

    local sounds = menu.list(trolling, "Sounds", {}, "")

    menu.toggle_loop(sounds, "Hurt there ears", {}, "Do a little trolling", function()
        local coords = players.get_position(pid)
        AUDIO.PLAY_SOUND_FROM_COORD(-1, "BED", coords.x, coords.y, coords.z, "WASTEDSOUNDS", true, 5, false)
        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Crash", coords.x, coords.y, coords.z, "DLC_HEIST_HACKING_SNAKE_SOUNDS", true, 5, false)
        AUDIO.PLAY_SOUND_FROM_COORD(-1, "BASE_JUMP_PASSED", coords.x, coords.y, coords.z, "HUD_AWARDS", true, 5, false)
        util.yield(20)
    end)

    menu.toggle_loop(sounds, "Wasted Sound", {}, "", function()
        local coords = players.get_position(pid)
        AUDIO.PLAY_SOUND_FROM_COORD(1, "BED", coords.x, coords.y, coords.z, "WASTEDSOUNDS", true, 5, false)
        util.yield(5800)
    end)

    menu.toggle_loop(sounds, "Yacht Horn", {}, "", function()
        local coords = players.get_position(pid)
        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Horn", coords.x, coords.y, coords.z, "DLC_Apt_Yacht_Ambient_Soundset", true, 5, false)
        util.yield(3000)
    end)

    menu.toggle_loop(sounds, "Buzz", {}, "", function()
        local coords = players.get_position(pid)
        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Crash", coords.x, coords.y, coords.z, "DLC_HEIST_HACKING_SNAKE_SOUNDS", true, 5, false)
        util.yield(1700)
    end)

    menu.toggle_loop(sounds, "Mission Sucess sound", {}, "", function()
        local coords = players.get_position(pid)
        AUDIO.PLAY_SOUND_FROM_COORD(1, "BASE_JUMP_PASSED", coords.x, coords.y, coords.z, "HUD_AWARDS", true, 5, false)
        util.yield(1250)
    end)

    -- ====================================================================================

    menu.action(trolling, "Announce based-level", {}, "", function()
    local basedLevel = math.random(100)
    local basedPercentage = players.get_name(pid).. " Is ".. basedLevel.. "% based"
    chat.send_message(basedPercentage, false, true, true)
    end)

    menu.action(trolling, "Tell them to kill themselves", {}, "POV: lost a discord argument", function() 
    local kys = "Hey " .. players.get_name(pid) .. ' you should kill yourself NOW!' 
    chat.send_message(kys, false, true, true)
    end)
    
end)
players.dispatch_on_join()
util.keep_running()