
if not menu.is_trusted_mode_enabled(1 << 2) then     -- Natives Trusted Mode check
    menu.notify("Turn on trusted natives to use GameCrunchScript")
    menu.exit()
end

if menu.is_trusted_mode_enabled(1 << 2) then 
    menu.notify("Version: 2.0-P")
end

menuRoot = menu.add_feature("GameCrunchScript", "parent", 0)

-- Discord server: https://discord.gg/qjbBDtaxjX 
-- ==========================
-- Self Features


self = menu.add_feature("Self", "parent", menuRoot.id)

menu.add_feature("Boost pad", "action", self.id, function()
    local coords = player.get_player_coords(player.player_id())
    coords.z = coords.z - 0.6
    local heading = player.get_player_heading(player.player_id())
    local heading = heading + 80
    local boostPad = object.create_object(3287988974, coords, true, true)
    entity.set_entity_heading(boostPad, heading)
end)

-- ==========================
-- Online Features


-- onlineRoot = menu.add_feature("Online", "parent", menuRoot.id)


-- ==========================
-- Other Player Features

playerRoot = menu.add_player_feature("GameCrunchScript", "parent", 0)

-- ================
-- Friendly features
friendlyRoot = menu.add_player_feature("Friendly", "parent", playerRoot.id)

    menu.add_player_feature("Boost pad other player", "action", friendlyRoot.id, function(feat, pid)
    local coords = player.get_player_coords(pid)
    coords.z = coords.z - 0.6
    local heading = player.get_player_heading(pid)
    local heading = heading + 80
    local boostPad = object.create_object(3287988974, coords, true, true)
    entity.set_entity_heading(boostPad, heading)
    end)

    menu.add_player_feature("Drop RP", "toggle", friendlyRoot.id, function(feat, pid)  
        while feat.on do
          local coords = player.get_player_coords(pid)
          coords.z = coords.z + 1.5
          local dropDelay = 1500 -- Change this to adjust the drop rate
          local figure = gameplay.get_hash_key("vw_prop_vw_colle_prbubble")
          streaming.request_model(figure)
           if(streaming.has_model_loaded(figure) ~= true) then 
            streaming.request_model(figure)
           end
          native.call(0x673966A0C0FD7171, -1009939663, coords.x, coords.y, coords.z, 0, 1, figure, false, true)
          system.yield(dropDelay)
        end
    end)


    menu.add_player_feature("Drop Cards", "toggle", friendlyRoot.id, function(feat, pid)  
        menu.notify("Players can only collect 54 cards per session")
        while feat.on do
          local coords = player.get_player_coords(pid)
          coords.z = coords.z + 1.5
          local dropDelay = 1500 -- Change this to adjust the drop rate
          local card = gameplay.get_hash_key("vw_prop_vw_lux_card_01a")
          streaming.request_model(card)
           if(streaming.has_model_loaded(card) ~= true) then 
            streaming.request_model(card)
           end
          native.call(0x673966A0C0FD7171, -1009939663, coords.x, coords.y, coords.z, 0, 1, card, false, true)
          system.yield(dropDelay)
        end
    end)

-- ==========================
-- Trolling features
trollingRoot = menu.add_player_feature("Trolling", "parent", playerRoot.id)

menu.add_player_feature("Asteroid smash", "action", trollingRoot.id, function(feat, pid)
    local coords = player.get_player_coords(pid)
    coords.z = coords.z + 15
    local asteroid = object.create_object(3751297495, coords, true, true)
    native.call(0x1718DE8E3F2823CA, asteroid, true)
end)

menu.add_player_feature("Ragdoll loop", "toggle", trollingRoot.id, function(feat, pid)
    while feat.on do 
        local coords = player.get_player_coords(pid)
        coords.z = coords.z - 2
        fire.add_explosion(coords, 11, false, true, 1, 0)
        system.yield(10)
    end
end)

menu.add_player_feature("Ragdoll", "action", trollingRoot.id, function(feat, pid)
    while feat.on do 
        local coords = player.get_player_coords(pid)
        coords.z = coords.z - 2
        fire.add_explosion(coords, 11, false, true, 1, 0)
        system.yield(10)
    end
end)

menu.add_player_feature("Flame loop", "toggle", trollingRoot.id, function(feat, pid)
    while feat.on do 
        local coords = player.get_player_coords(pid)
        coords.z = coords.z - 2
        fire.add_explosion(coords, 12, true, false, 1, 0)
        system.yield(25)
    end
end)

menu.add_player_feature("Water loop", "toggle", trollingRoot.id, function(feat, pid)
    while feat.on do 
        local coords = player.get_player_coords(pid)
        coords.z = coords.z - 2
        fire.add_explosion(coords, 13, true, false, 1, 0)
        system.yield(25)
    end
end)

menu.add_player_feature("Crap trail", "toggle", trollingRoot.id, function(feat, pid)
    while feat.on do 
        local coords = player.get_player_coords(pid)
        coords.z = coords.z + 1.5
        fire.add_explosion(coords, 35, false, false, 1, 0)
        system.yield(65)
    end
end)

menu.add_player_feature("Flame path", "toggle", trollingRoot.id, function(feat, pid)
    while feat.on do 
        local coords = player.get_player_coords(pid)
        fire.add_explosion(coords, 38, true, false, 1, 0)
        system.yield(65)
    end
end)


-- ===
-- Sounds

soundRoot = menu.add_player_feature("Sounds", "parent", trollingRoot.id)

menu.add_player_feature("Hurt there ears", "toggle", soundRoot.id, function(feat, pid)
    while feat.on do
        local coords = player.get_player_coords(pid)
        audio.play_sound_from_coord(-1, "BED", coords, "WASTEDSOUNDS", true, 5, false)
        audio.play_sound_from_coord(-1, "Crash", coords, "DLC_HEIST_HACKING_SNAKE_SOUNDS", true, 5, false)
        audio.play_sound_from_coord(-1, "BASE_JUMP_PASSED", coords, "HUD_AWARDS", true, 5, false)
        system.yield(20)
    end
end)

menu.add_player_feature("Wasted sound", "toggle", soundRoot.id, function(feat, pid)
    while feat.on do
        local coords = player.get_player_coords(pid)
        audio.play_sound_from_coord(1, "BED", coords, "WASTEDSOUNDS", true, 5, false)
        system.yield(5800)
    end
end)

menu.add_player_feature("Yacht horn", "toggle", soundRoot.id, function(feat, pid)
    while feat.on do 
        local coords = player.get_player_coords(pid)
        audio.play_sound_from_coord(-1, "Horn", coords, "DLC_Apt_Yacht_Ambient_Soundset", true, 5, false)
        system.yield(3000)
    end
end)

menu.add_player_feature("Buzz", "toggle", soundRoot.id, function(feat, pid)
    while feat.on do 
        local coords = player.get_player_coords(pid)
        audio.play_sound_from_coord(-1, "Crash", coords, "DLC_HEIST_HACKING_SNAKE_SOUNDS", true, 5, false)
        system.yield(1700)
    end
end)

menu.add_player_feature("Mission Success sound", "toggle", soundRoot.id, function(feat, pid)
    while feat.on do 
        local coords = player.get_player_coords(pid)
        audio.play_sound_from_coord(1, "BASE_JUMP_PASSED", coords, "HUD_AWARDS", true, 5, false)
        system.yield(1250)
    end
end)
