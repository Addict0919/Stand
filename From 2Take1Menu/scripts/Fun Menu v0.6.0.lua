local natives = require("this_is_needed\\natives")
local npc = require("this_is_needed\\npc_functions")
local outfit = require("this_is_needed\\outfit_functions")
local utility = require("this_is_needed\\other_functions")
local scaleform = require("this_is_needed\\scaleform_lib")

local fun_menu_pages = {}
local fun_menu_features = {}
local fun_menu_threads = {}
local settings = {}
local scaleforms = {}
local entities = {}

local fun_menu_ver = "Fun Menu v0.6.0"

local w_key = MenuKey()
w_key:push_vk(0x57)

if (not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES)) then
    menu.notify("Enable the Natives trusted mode flag before using Fun Menu.")
    menu.exit()
    return
end

event.add_event_listener('exit', function()
    for i = 1, #blips_table do
        ui.remove_blip(blips_table[i])
    end

    for i = 1, #entities do
        entity.set_entity_as_mission_entity(entities[i], true, true)
        entity.delete_entity(entities[i])
    end

    menu.notify("Cleaning up spawned entities and blips... Cleanup Successful. Bye!", fun_menu_ver)
end)

fun_menu_pages["main_menu"] = menu.add_feature("Fun Menu", "parent", 0)
fun_menu_pages["festive"] = menu.add_feature("Festive Stuff", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["ptfx_stuff"] = menu.add_feature("PTFX Stuff", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["alert_screens"] = menu.add_feature("Alert Screens", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["vehicle_stuff"] = menu.add_feature("Vehicle Stuff", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["ozark_text"] = menu.add_feature("Øzark Text", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["self"] = menu.add_feature("Self", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["npc_stuff"] = menu.add_feature("NPC Stuff", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["pets"] = menu.add_feature("Pets", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["world_stuff"] = menu.add_feature("World Stuff", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["miscellaneous"] = menu.add_feature("Miscellaneous", "parent", fun_menu_pages["main_menu"].id)
fun_menu_pages["player_fun_menu"] = menu.add_player_feature("Fun Menu", "parent", 0)

--[[
Fun Menu
  + Added various tooltips for features
  + Added "World Stuff" submenu
  + Added "Clean Up"
  * Updated "Trusted Mode" check
  * Renamed various features
  * Improved various features
  Festive Stuff
    + Added placeable fireworks
    * Updated firework show features
  Vehicle Stuff
    + Added "Spin Vehicle"
    * Updated "Angry Planes"
    * Updated "Vehicle Magnet Gun"
    AI Driving
      * Improved various AI driving features
  Ozark Text
    * Improved the Ozark text features
  Self
    + Added "Copy Random Player Headblend"
    + Added "Copy Random Player Outfit"
    + Added "Character Looks" submenu
    * Updated "Play Dead"
    * Updated "Spin Around"
    Character Looks
      * Moved character customization features here
      Random Outfits
        + Added "Copy Random Player Outfit"
  NPC Stuff
    + Added "Turn NPCs Into Clones"
    + Added "Turn NPCs Into Freemode Peds"
    * Reorganized this submenu
    - Removed animal spawning
    Followers
      * Improved various follower features
  Pets
    * Reworked the pets feature
  World Stuff
    + Added weather mixing
    + Added various weather effects
    + Added saturation effects
    + Added "Aggressive Water"
    + Added "Get Current Weather"
  Miscellaneous
    + Added "Type in Reverse"
    + Added "Move on X Axis"
    + Added "Move on Y Axis"
    + Added "Convert from RGB to BGR"
]]

--    ______ ______ _____ ______ ____ _    __ ______   _____ ______ __  __ ______ ______
--   / ____// ____// ___//_  __//  _/| |  / // ____/  / ___//_  __// / / // ____// ____/
--  / /_   / __/   \__ \  / /   / /  | | / // __/     \__ \  / /  / / / // /_   / /_    
-- / __/  / /___  ___/ / / /  _/ /   | |/ // /___    ___/ / / /  / /_/ // __/  / __/    
--/_/    /_____/ /____/ /_/  /___/   |___//_____/   /____/ /_/   \____//_/    /_/       
function shoot_random_firework(coords, ped_owner, height)
    gameplay.shoot_single_bullet_between_coords(coords + v3(math.random(-10, 10), math.random(-10, 10), 0), coords + v3(0, 0, 20), 0, gameplay.get_hash_key("weapon_firework"), ped_owner, true, false, height)
end

--[[
function shoot_single_firework(coords, x, y, rot_z, ped_owner, height)
    gameplay.shoot_single_bullet_between_coords(coords + v3(x, y, 0), coords + v3(0, 0, rot_z), 0, gameplay.get_hash_key("weapon_firework"), ped_owner, true, false, height)
end

function shoot_line_firework(coords, x, y, rot_z, ped_owner, height, wait_time)
    for i = 1, 4 do 
        gameplay.shoot_single_bullet_between_coords(coords + v3(x + i, y, 0), coords + v3(0, 0, rot_z), 0, gameplay.get_hash_key("weapon_firework"), ped_owner, true, false, height)
        system.wait(wait_time)
    end
end]]

fun_menu_features["horsetrack_firework_show"] = menu.add_feature("Vespucci Beach Firework Show", "toggle", fun_menu_pages["festive"].id, function(feat)
    local firework_coords = v3(-1950, -960, 2)

    if (not weapon.has_ped_got_weapon(player.player_ped(), gameplay.get_hash_key("weapon_firework"))) then
        weapon.give_delayed_weapon_to_ped(player.player_ped(), gameplay.get_hash_key("weapon_firework"), 0, true)
        weapon.set_ped_ammo(player.player_ped(), gameplay.get_hash_key("weapon_firework"), 20)
    end

    while feat.on do
        shoot_random_firework(firework_coords, player.player_ped(), math.random(150, 300))

        if (math.random(1, 50) == 27) then
            shoot_single_firework(firework_coords, 8, 8, 300, player.player_ped(), 100)
            shoot_single_firework(firework_coords, -8, 8, 300, player.player_ped(), 100)
            shoot_single_firework(firework_coords, 8, -8, 300, player.player_ped(), 100)
            shoot_single_firework(firework_coords, -8, -8, 300, player.player_ped(), 100)
        end
        if (math.random(1, 150) == 67) then
            for i = 1, 4 do
                system.wait(100)
                shoot_single_firework(firework_coords, 8, i + 8, 300, player.player_ped(), 100)
                shoot_single_firework(firework_coords, -8, -i - 8, 300, player.player_ped(), 100)
            end
        end
        system.wait(math.random(2, 8) * 100)
    end
end)
fun_menu_features["horsetrack_firework_show"].hint = "Host a firework show at the #FF4FC5EC#casino horsetrack#DEFAULT# for others to enjoy!"

fun_menu_features["vespucci_firework_show"] = menu.add_feature("Horsetrack Firework Show", "toggle", fun_menu_pages["festive"].id, function(feat)
    local firework_coords = v3(1139, 130, 80)

    if (not weapon.has_ped_got_weapon(player.player_ped(), gameplay.get_hash_key("weapon_firework"))) then
        weapon.give_delayed_weapon_to_ped(player.player_ped(), gameplay.get_hash_key("weapon_firework"), 0, true)
        weapon.set_ped_ammo(player.player_ped(), gameplay.get_hash_key("weapon_firework"), 20)
    end

    while feat.on do
        shoot_random_firework(firework_coords, player.player_ped(), math.random(150, 300))

        if (math.random(1, 50) == 27) then
            shoot_single_firework(firework_coords, 8, 8, 300, player.player_ped(), 100)
            shoot_single_firework(firework_coords, -8, 8, 300, player.player_ped(), 100)
            shoot_single_firework(firework_coords, 8, -8, 300, player.player_ped(), 100)
            shoot_single_firework(firework_coords, -8, -8, 300, player.player_ped(), 100)
        end
        if (math.random(1, 150) == 67) then
            for i = 1, 4 do
                system.wait(100)
                shoot_single_firework(firework_coords, 8, i + 8, 300, player.player_ped(), 100)
                shoot_single_firework(firework_coords, -8, -i - 8, 300, player.player_ped(), 100)
            end
        end
        system.wait(math.random(2, 8) * 100)
    end
end)
fun_menu_features["vespucci_firework_show"].hint = "Host a firework show at #FF4FC5EC#Vespucci Beach#DEFAULT# for others to enjoy!"

fun_menu_features["create_firework_show"] = menu.add_feature("Create a Firework Show", "toggle", fun_menu_pages["festive"].id, function(feat)
    local firework_coords = player.get_player_coords(player.player_id())

    if (not weapon.has_ped_got_weapon(player.player_ped(), gameplay.get_hash_key("weapon_firework"))) then
        weapon.give_delayed_weapon_to_ped(player.player_ped(), gameplay.get_hash_key("weapon_firework"), 0, true)
        weapon.set_ped_ammo(player.player_ped(), gameplay.get_hash_key("weapon_firework"), 20)
    end

    while feat.on do
        shoot_random_firework(firework_coords, player.player_ped(), math.random(150, 300))

        if (math.random(1, 50) == 27) then
            shoot_single_firework(firework_coords, 8, 8, 300, player.player_ped(), 100)
            shoot_single_firework(firework_coords, -8, 8, 300, player.player_ped(), 100)
            shoot_single_firework(firework_coords, 8, -8, 300, player.player_ped(), 100)
            shoot_single_firework(firework_coords, -8, -8, 300, player.player_ped(), 100)
        end
        if (math.random(1, 150) == 67) then
            for i = 1, 4 do
                system.wait(100)
                shoot_single_firework(firework_coords, 8, i + 8, 300, player.player_ped(), 100)
                shoot_single_firework(firework_coords, -8, -i - 8, 300, player.player_ped(), 100)
            end
        end
        system.wait(math.random(2, 8) * 100)
    end
end)
fun_menu_features["create_firework_show"].hint = "Make your own firework show for others to enjoy!"

fun_menu_features["give_firework_launchers"] = menu.add_feature("Give Firework Launchers to Everyone", "action", fun_menu_pages["festive"].id, function(feat)
    menu.notify("Gave everyone in current session a firework launcher.", fun_menu_ver)
    for i = 0, 31 do
        weapon.give_delayed_weapon_to_ped(player.get_player_ped(i), gameplay.get_hash_key("weapon_firework"), 0, true)
        weapon.set_ped_ammo(player.get_player_ped(i), gameplay.get_hash_key("weapon_firework"), 20)
        system.wait(150)
    end
end)

fun_menu_features["give_snowballs"] = menu.add_feature("Give Snowballs to Everyone", "action", fun_menu_pages["festive"].id, function(feat)
    menu.notify("Gave everyone in current session snowballs.", fun_menu_ver)
    for i = 0, 31 do
        weapon.give_delayed_weapon_to_ped(player.get_player_ped(i), gameplay.get_hash_key("weapon_snowball"), 0, true)
        weapon.set_ped_ammo(player.get_player_ped(i), gameplay.get_hash_key("weapon_snowball"), 20)
        system.wait(150)
    end
end)

local placed_fireworks = {}
local firework_list = {
    {
    name = "Firework Cylinder",
    model = gameplay.get_hash_key("ind_prop_firework_02")
    },
    {
    name = "Firework Box",
    model = gameplay.get_hash_key("ind_prop_firework_03")
    }
}

local firework_boxes = {}
for k, v in ipairs(firework_list) do
    menu.add_feature("Place a " .. v.name, "action", fun_menu_pages["festive"].id, function(feat)
        local firework_model = v.model
        local rot = entity.get_entity_rotation(player.player_ped())
        rot:transformRotToDir()

        firework_boxes[#firework_boxes + 1] = object.create_object(firework_model, player.get_player_coords(player.player_id()) + v3(0, 0, -1) + rot, true, true)
        entities[#entities + 1] = firework_boxes[#firework_boxes]
        utility.request_ptfx("scr_indep_fireworks")

        menu.create_thread(function()
            local firework_box = firework_boxes[#firework_boxes]
            placed_fireworks[#placed_fireworks + 1] = menu.add_feature(v.name, "toggle", fun_menu_pages["current_fireworks"].id, function(feat)
                local text = 5
                local time = utils.time_ms() + 1000
                while (feat.on and text >- 1 and entity.is_an_entity(firework_box)) do 
                    utility.draw_text_on_entity(firework_box, tostring(text))
                    if (time < utils.time_ms()) then
                        text = text - 1
                        time = utils.time_ms() + 1000
                    end
                    system.wait()
                end

                if feat.on then
                    if (firework_model == gameplay.get_hash_key("ind_prop_firework_02")) then
                        natives.GRAPHICS.SET_PARTICLE_FX_NON_LOOPED_COLOUR(math.random(), math.random(), math.random())
                        utility.request_ptfx("scr_indep_fireworks")
                        graphics. start_networked_ptfx_non_looped_on_entity("scr_indep_firework_fountain", firework_box, v3(), v3(), 0.25)
                    elseif (firework_model == gameplay.get_hash_key("ind_prop_firework_03")) then
                        for i = 1, 8 do
                            natives.GRAPHICS.SET_PARTICLE_FX_NON_LOOPED_COLOUR(math.random(), math.random(), math.random())
                            utility.request_ptfx("scr_indep_fireworks")
                            graphics. start_networked_ptfx_non_looped_on_entity("scr_indep_firework_starburst", firework_box, v3(0, 0, -1), v3(math.random(1, 10), math.random(1, 10), 0), 1.0)
                            utility.yield(feat, 500)
                        end
                    end
                end
            end)

            placed_fireworks[#placed_fireworks].hint = "test"
            menu.create_thread(function()
                local firework_box = firework_boxes[#firework_boxes]
                local key = #placed_fireworks

                while not placed_fireworks[key].on do
                    system.wait(6000)
                    if placed_fireworks[key].on then
                        local time = utils.time_ms() + 5000
                        while (placed_fireworks[key].on and time > utils.time_ms()) do 
                            system.wait()
                        end
                        if (time <= utils.time_ms()) then
                            break
                        end
                    end
                end

                local time = utils.time_ms() + 4000
                while (placed_fireworks[key].on and time > utils.time_ms()) do
                    system.wait()
                end

                menu.delete_feature(placed_fireworks[key].id)
                entity.set_entity_as_mission_entity(firework_box, true, true)
                entity.delete_entity(firework_box)
                graphics.remove_named_ptfx_asset("scr_indep_fireworks")
            end)
        end)
        
    end)
end

fun_menu_pages["current_fireworks"] = menu.add_feature("Current Fireworks", "parent", fun_menu_pages["festive"].id)
fun_menu_pages["current_fireworks"].hint = "View the list of fireworks you placed."

--    ____  ______ ______ _  __    _____ ______ __  __ ______ ______
--   / __ \/_  __// ____/| |/ /   / ___//_  __// / / // ____// ____/
--  / /_/ / / /  / /_    |   /    \__ \  / /  / / / // /_   / /_    
-- / ____/ / /  / __/   /   |    ___/ / / /  / /_/ // __/  / __/    
--/_/     /_/  /_/     /_/|_|   /____/ /_/   \____//_/    /_/       
                                                                  

--[[local ptfx_color = {
    R = 255,
    G = 100,
    B = 100
}

function hex2RGB(hex)
    hex = hex:gsub("#","")

    ptfx_color = {
        R = tonumber("0x"..hex:sub(1, 2)..".0"),
        G = tonumber("0x"..hex:sub(3, 4)..".0"),
        B = tonumber("0x"..hex:sub(5, 6)..".0"),
    }
end

menu.add_feature("PTFX Color", "action", fun_menu_pages["ptfx_stuff"].id, function(feat)
    local _input, k = input.get("Type in a hex color code.", "ffffff", 6, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    menu.notify("PTFX color set to " .. k, fun_menu_ver)
    hex2RGB(k)zt
end)]]--

local ptfx_loaded = false
local ptfx_executed = false

fun_menu_features["cosmetic_bleed_out"] = menu.add_feature("Cosmetic Bleed Out", "toggle", fun_menu_pages["ptfx_stuff"].id, function(feat)
    while (feat.on) do
        graphics.set_next_ptfx_asset("core")

        if (ptfx_loaded == false or ptfx_executed == false) then
            ptfx_loaded = utility.request_ptfx("core")
            ptfx_executed = true
        end

        graphics.start_networked_ptfx_non_looped_on_entity("blood_stab", player.player_ped(), v3(0, 0.07, 0.3), v3(-50, 0, 0), 2)
        fire.add_explosion(player.get_player_coords(player.player_id()), 39, false, true, 0, player.player_id())
        system.wait(1000)
    end

    if (not feat.on) then
        graphics.remove_named_ptfx_asset("core")
        ptfx_loaded = false
        ptfx_executed = false
    end
end)

fun_menu_features["bloody_mess"] = menu.add_feature("Bloody Mess", "toggle", fun_menu_pages["ptfx_stuff"].id, function(feat)
    while (feat.on) do
        graphics.set_next_ptfx_asset("scr_solomon3")

        if (ptfx_loaded == false or ptfx_executed == false) then
            ptfx_loaded = utility.request_ptfx("scr_solomon3")
            ptfx_executed = true
        end
        graphics.start_networked_ptfx_non_looped_on_entity("scr_trev4_747_blood_impact", player.player_ped(), v3(0, 0, 1), v3(-90, 0, 0), 1)
        system.wait(1000)
    end

    if (not feat.on) then
        graphics.remove_named_ptfx_asset("scr_solomon3")
        ptfx_loaded = false
        ptfx_executed = false
    end
end)

fun_menu_features["dragon_breath"] = menu.add_feature("Dragon Breath", "value_str", fun_menu_pages["ptfx_stuff"].id, function(feat)
    menu.notify("You will probably want to use godmode for this PTFX.", fun_menu_ver)
    local breath_scale = 0
    if (feat.value == 0) then
        breath_scale = 0.5
    elseif (feat.value == 1) then
        breath_scale = 2
    end

    while (feat.on) do
        graphics.set_next_ptfx_asset("core")

        if (ptfx_loaded == false or ptfx_executed == false) then
            ptfx_loaded = utility.request_ptfx("core")
            ptfx_executed = true;
        end
        graphics.start_networked_ptfx_non_looped_on_entity("ent_sht_flame", player.player_ped(), v3(0, 0.07, 0.625), v3(-90, 0, 0), breath_scale)
        system.wait(7700)
    end

    if (not feat.on) then
        graphics.remove_named_ptfx_asset("core")
        ptfx_loaded = false
        ptfx_executed = false
    end
end):set_str_data({"Little Breath", "Big Breath"})

fun_menu_features["trails"] = menu.add_feature("Trails", "toggle", fun_menu_pages["ptfx_stuff"].id, function(feat)
    while (feat.on) do
        local success, head_pos = ped.get_ped_bone_coords(player.player_ped(), 31086, v3())
        while not success do
            success, head_pos = ped.get_ped_bone_coords(player.player_ped(), 31086, v3())
            system.wait(10)
        end

        graphics.set_next_ptfx_asset("scr_powerplay")

        if (ptfx_loaded == false or ptfx_executed == false) then
            ptfx_loaded = utility.request_ptfx("scr_powerplay")
            ptfx_executed = true
        end --v3(0, 0.07, 0.625)
        graphics.start_networked_ptfx_non_looped_on_entity("sp_powerplay_beast_appear_trails", player.player_ped(), v3(0, 0.07, 0.625), v3(-90, 0, 0), 1.5)
        --graphics.start_networked_ptfx_non_looped_at_coord("sp_powerplay_beast_appear_trails", head_pos, v3(), 1.5, false, false, false)
        system.wait(500)
    end

    if (not feat.on) then
        graphics.remove_named_ptfx_asset("scr_powerplay")
        ptfx_loaded = false
        ptfx_executed = false
    end
end)

--    ___     __     ______ ____  ______   _____  ______ ____   ______ ______ _   __ _____
--   /   |   / /    / ____// __ \/_  __/  / ___/ / ____// __ \ / ____// ____// | / // ___/
--  / /| |  / /    / __/  / /_/ / / /     \__ \ / /    / /_/ // __/  / __/  /  |/ / \__ \ 
-- / ___ | / /___ / /___ / _, _/ / /     ___/ // /___ / _, _// /___ / /___ / /|  / ___/ / 
--/_/  |_|/_____//_____//_/ |_| /_/     /____/ \____//_/ |_|/_____//_____//_/ |_/ /____/  
fun_menu_features["alert_screen"] = menu.add_feature("Alert Screen", 'value_str', fun_menu_pages["alert_screens"].id, function(feat)
    local screens = {
        "You have been banned from Grand Theft Auto Online permanently.",
        "You're attempting to access GTA Online servers with an altered version of the game.",
        "There has been an error with this session.",
        "You have been suspended from Grand Theft Auto Online Online until ".. os.date("%m/%d/%Y", os.time() + 2700000) ..". \nIn addition, your Grand Theft Auto Online characters(s) will be reset."
    }

    scaleforms["alert_screen"] = graphics.request_scaleform_movie("POPUP_WARNING")
    while feat.on do
        show_alert_screen(scaleforms["alert_screen"], 500.0, "alert", screens[feat.value + 1], "Return to Grand Theft Auto V.", true, 0, "")
        graphics.draw_scaleform_movie_fullscreen(scaleforms["alert_screen"], 255, 255, 255, 255, 0)
        system.wait(0)
    end

    if (not feat.on) then
        graphics.set_scaleform_movie_as_no_longer_needed(scaleforms["alert_screen"])
    end
end)fun_menu_features["alert_screen"]:set_str_data({"Banned", "Altered Game", "Session Error", "Suspended"})
fun_menu_features["alert_screen"].hint = "~r~ = #FF3131DC#Red#DEFAULT#\n~o~ = #FF3485FB#Orange#DEFAULT#\n~y~ = #FF4FC5EC#Yellow#DEFAULT#\n~g~ = #FF70C970#Green#DEFAULT#\n~b~ = #FFE1B35C#Blue#DEFAULT#\n\z
~p~ = #FFDE6482#Purple#DEFAULT#\n~q~ = #FF9235C8#Pink#DEFAULT#\n~w~ or ~s~ = #FFECECEC#White#DEFAULT#\n~c~ or ~t~ = #FF8A8A8A#Gray#DEFAULT#\n~m~ = #FF626262#Dark Gray#DEFAULT#\n~u~ or ~l~ = Black\n\n\z
Type the color codes into the input boxes for the alert screens and you will get colored text."

fun_menu_features["numerical_alert_screen"] = menu.add_feature("Set # Value for Alert", 'value_str', fun_menu_pages["alert_screens"].id, function(feat)
    local _input, k = input.get("Type in custom number value for use in some alert screens.", "-9999", 999, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        feat.on = false
        return HANDLER_POP
    end

    local numerical_screens = {
        "Rockstar Game Services have corrected your GTA Dollars by $".. k .. "~w~.",
        "Congratulations, you have been awarded $ " .. k .. "~w~.",
        "Rockstar Game Services have corrected your RP levels to " .. k .. "~w~RP.",
    }

    scaleforms["alert_screen"] = graphics.request_scaleform_movie("POPUP_WARNING")
    while feat.on do
        show_alert_screen(scaleforms["alert_screen"], 500.0, "alert", numerical_screens[feat.value + 1], "", true, 0, "")
        graphics.draw_scaleform_movie_fullscreen(scaleforms["alert_screen"], 255, 255, 255, 255, 0)
        system.wait(0)
    end

    if (not feat.on) then
        graphics.set_scaleform_movie_as_no_longer_needed(scaleforms["alert_screen"])
    end
end)fun_menu_features["numerical_alert_screen"]:set_str_data({"Money Correct", "Money Awarded", "RP Correct"})
fun_menu_features["numerical_alert_screen"].hint = "~r~ = #FF3131DC#Red#DEFAULT#\n~o~ = #FF3485FB#Orange#DEFAULT#\n~y~ = #FF4FC5EC#Yellow#DEFAULT#\n~g~ = #FF70C970#Green#DEFAULT#\n~b~ = #FFE1B35C#Blue#DEFAULT#\n\z
~p~ = #FFDE6482#Purple#DEFAULT#\n~q~ = #FF9235C8#Pink#DEFAULT#\n~w~ or ~s~ = #FFECECEC#White#DEFAULT#\n~c~ or ~t~ = #FF8A8A8A#Gray#DEFAULT#\n~m~ = #FF626262#Dark Gray#DEFAULT#\n~u~ or ~l~ = Black\n\n\z
Type the color codes into the input boxes for the alert screens and you will get colored text."

fun_menu_features["custom_alert_screen"] = menu.add_feature("Custom Alert Screen", 'toggle', fun_menu_pages["alert_screens"].id, function(feat)
    local _input, k = input.get("Type in alert screen text", "", 999, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        feat.on = false
        return HANDLER_POP
    end

    scaleforms["alert_screen"] = graphics.request_scaleform_movie("POPUP_WARNING")
    while feat.on do
        show_alert_screen(scaleforms["alert_screen"], 500.0, "alert", k, "", true, 0, "")
        graphics.draw_scaleform_movie_fullscreen(scaleforms["alert_screen"], 255, 255, 255, 255, 0)
        system.wait(0)
    end

    if (not feat.on) then
        graphics.set_scaleform_movie_as_no_longer_needed(scaleforms["alert_screen"])
    end
end)
fun_menu_features["custom_alert_screen"].hint = "~r~ = #FF3131DC#Red#DEFAULT#\n~o~ = #FF3485FB#Orange#DEFAULT#\n~y~ = #FF4FC5EC#Yellow#DEFAULT#\n~g~ = #FF70C970#Green#DEFAULT#\n~b~ = #FFE1B35C#Blue#DEFAULT#\n\z
~p~ = #FFDE6482#Purple#DEFAULT#\n~q~ = #FF9235C8#Pink#DEFAULT#\n~w~ or ~s~ = #FFECECEC#White#DEFAULT#\n~c~ or ~t~ = #FF8A8A8A#Gray#DEFAULT#\n~m~ = #FF626262#Dark Gray#DEFAULT#\n~u~ or ~l~ = Black\n\n\z
Type the color codes into the input boxes for the alert screens and you will get colored text."

fun_menu_features["custom_ban_screen"] = menu.add_feature("Ban Screen with Custom Reason", 'toggle', fun_menu_pages["alert_screens"].id, function(feat)
    local _input, k = input.get("Type in ban reason text", "", 999, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        feat.on = false
        return HANDLER_POP
    end

    scaleforms["alert_screen"] = graphics.request_scaleform_movie("POPUP_WARNING")
    while feat.on do
        show_alert_screen(scaleforms["alert_screen"], 500.0, "alert", "You have been banned from Grand Theft Auto Online permanently.", "Reason: " .. k .. "\n~w~Return to Grand Theft Auto V.", true, 0, "")
        graphics.draw_scaleform_movie_fullscreen(scaleforms["alert_screen"], 255, 255, 255, 255, 0)
        system.wait(0)
    end

    if (not feat.on) then
        graphics.set_scaleform_movie_as_no_longer_needed(scaleforms["alert_screen"])
    end
end)
fun_menu_features["custom_ban_screen"].hint = "~r~ = #FF3131DC#Red#DEFAULT#\n~o~ = #FF3485FB#Orange#DEFAULT#\n~y~ = #FF4FC5EC#Yellow#DEFAULT#\n~g~ = #FF70C970#Green#DEFAULT#\n~b~ = #FFE1B35C#Blue#DEFAULT#\n\z
~p~ = #FFDE6482#Purple#DEFAULT#\n~q~ = #FF9235C8#Pink#DEFAULT#\n~w~ or ~s~ = #FFECECEC#White#DEFAULT#\n~c~ or ~t~ = #FF8A8A8A#Gray#DEFAULT#\n~m~ = #FF626262#Dark Gray#DEFAULT#\n~u~ or ~l~ = Black\n\n\z
Type the color codes into the input boxes for the alert screens and you will get colored text."

-- _    __ ______ __  __ ____ ______ __     ______   _____ ______ __  __ ______ ______
--| |  / // ____// / / //  _// ____// /    / ____/  / ___//_  __// / / // ____// ____/
--| | / // __/  / /_/ / / / / /    / /    / __/     \__ \  / /  / / / // /_   / /_    
--| |/ // /___ / __  /_/ / / /___ / /___ / /___    ___/ / / /  / /_/ // __/  / __/    
--|___//_____//_/ /_//___/ \____//_____//_____/   /____/ /_/   \____//_/    /_/       
fun_menu_pages["personal_vehicle_stuff"] = menu.add_feature("Player Vehicle Options", "parent", fun_menu_pages["vehicle_stuff"].id)
fun_menu_pages["ai_driving_stuff"] = menu.add_feature("AI Driving", "parent", fun_menu_pages["vehicle_stuff"].id)

local drive_to_waypoint = false
fun_menu_features["drive_to_waypoint"] = menu.add_feature("Drive to Waypoint", "toggle", fun_menu_pages["ai_driving_stuff"].id, function(feat)
    if (feat.on) then
        drive_to_waypoint = true
    else
        drive_to_waypoint = false
    end
end)

fun_menu_features["chauffer"] = menu.add_feature("Chauffer", "toggle", fun_menu_pages["ai_driving_stuff"].id, function(feat)
    local driver, seats, seat

    if (player.is_player_in_any_vehicle(player.player_id()) and not streaming.is_model_a_heli(entity.get_entity_model_hash(player.player_vehicle()))) then
        seats = utility.get_free_seats(player.player_vehicle(), true)
        if (#seats > 0) then
            seat = seats[math.random(1, #seats)]
        end

        ped.set_ped_into_vehicle(player.player_ped(), player.player_vehicle(), seat)

        utility.request_model(gameplay.get_hash_key("s_m_m_highsec_04"))
        driver = ped.create_ped(5, gameplay.get_hash_key("s_m_m_highsec_04"), player.get_player_coords(player.player_id()), 165, true, false)
        streaming.set_model_as_no_longer_needed(gameplay.get_hash_key("s_m_m_highsec_04"))
        entities[#entities + 1] = driver
        utility.request_control(driver)
        ped.set_ped_into_vehicle(driver, player.player_vehicle(), -1)
        vehicle.set_vehicle_engine_on(player.player_vehicle(), true, true, false)

        while (feat.on) do
            if (drive_to_waypoint) then
                local waypoint = ui.get_waypoint_coord()
                ai.task_vehicle_drive_to_coord(driver, player.player_vehicle(), v3(waypoint.x, waypoint.y, 0), 22.0, -1, gameplay.get_hash_key(player.player_vehicle()), 0, 0.0, 1.0)
            else
                ai.task_vehicle_drive_wander(driver, player.player_vehicle(), 25.0, 786859)
            end
            system.wait(500)
        end
    else
        menu.notify("You need to be in a ground vehicle to use this feature.", fun_menu_ver)
        feat.on = false
        return
    end

    if (not feat.on) then
        utility.clean_up(driver)
        ped.set_ped_into_vehicle(player.player_ped(), player.player_vehicle(), -1)
    end
end)

fun_menu_features["heli_chauffer"] = menu.add_feature("Helicopter Chauffer", "toggle", fun_menu_pages["ai_driving_stuff"].id, function(feat)
    local driver, seats, seat
    local waypoint = ui.get_waypoint_coord()

    if (player.is_player_in_any_vehicle(player.player_id()) and streaming.is_model_a_heli(entity.get_entity_model_hash(player.player_vehicle()))) then
        if (not drive_to_waypoint) then
            menu.notify("Enable \"Drive to Waypoint\" before using the helicopter chauffer.")
            feat.on = false
            return
        end

        seats = utility.get_free_seats(player.player_vehicle(), true)
        if (#seats > 0) then
            seat = seats[math.random(1, #seats)]
        end

        utility.request_control(player.player_vehicle())
        menu.notify(player.player_vehicle())
        ped.set_ped_into_vehicle(player.player_ped(), player.player_vehicle(), seat)

        utility.request_model(gameplay.get_hash_key("s_m_m_highsec_04"))
        driver = ped.create_ped(5, gameplay.get_hash_key("s_m_m_highsec_04"), player.get_player_coords(player.player_id()), 165, true, false)
        streaming.set_model_as_no_longer_needed(gameplay.get_hash_key("s_m_m_highsec_04"))
        entities[#entities + 1] = driver
        ped.set_ped_into_vehicle(driver, player.player_vehicle(), -1)
        vehicle.set_vehicle_engine_on(player.player_vehicle(), true, true, false)
        vehicle.set_heli_blades_full_speed(player.player_vehicle())

        while (feat.on) do
            local waypoint = ui.get_waypoint_coord()
            ai.task_vehicle_drive_to_coord(driver, player.player_vehicle(), v3(waypoint.x, waypoint.y, 0), 50.0, -1, gameplay.get_hash_key(player.player_vehicle()), 0, 0.0, 1.0)
            system.wait(500)
        end
    
        if (not feat.on and driver and entity.is_an_entity(driver)) then
            utility.request_control(driver)
            entity.set_entity_as_mission_entity(driver, true, true)
            entity.delete_entity(driver)
            ped.set_ped_into_vehicle(player.player_ped(), player.player_vehicle(), -1)
        end
    else
        menu.notify("You need to be in a helicopter to use this feature.", fun_menu_ver)
        feat.on = false
        return
    end
end)

menu.add_feature("Angry Planes", "toggle", fun_menu_pages["vehicle_stuff"].id, function(feat)
    local spawned_planes = {}
    local spawned_pilots = {}
    local player_coords
    local pos
    local ped_model = gameplay.get_hash_key("s_m_y_blackops_01")
    local planes = {
        "alphaz1", "howard", "molotok", "starling", "velum2", "vestra", "velum", "tula", "stunt", "strikeforce",
        "seabreeze", "rogue", "pyro", "nokota", "mammatus", "duster", "dodo", "cuban800", "besra"
    }
    local plane_models = {}
    for i = 1, #planes do
        plane_models[#plane_models + 1] = gameplay.get_hash_key(planes[i])
    end

    while (feat.on) do
        player_coords = player.get_player_coords(player.player_id())

        for i = 1, 24 do
            if (not utility.is_entity_valid(spawned_planes[i]) or not utility.is_entity_valid(spawned_pilots[i])) then
                pos = player_coords + v3(math.random(-100, 100), math.random(-100, 100), 150 + math.random(0, 20))
                utility.clean_up(spawned_planes[i])
                utility.clean_up(spawned_pilots[i])

                random_plane = plane_models[math.random(1, #plane_models)]

                utility.request_model(random_plane)
                spawned_planes[i] = vehicle.create_vehicle(random_plane, pos, math.random(-180, 180), true, false)
                entities[#entities + 1] = spawned_planes[i]
                streaming.set_model_as_no_longer_needed(random_plane)
                
                utility.request_model(ped_model)
                spawned_pilots[i] = ped.create_ped(5, ped_model, pos, 165, true, false)
                entities[#entities + 1] = spawned_pilots[i]
                streaming.set_model_as_no_longer_needed(ped_model)
                
                ped.set_ped_into_vehicle(spawned_pilots[i], spawned_planes[i], -1)
                vehicle.set_vehicle_engine_on(spawned_planes[i], true, true, false)
                vehicle.set_vehicle_forward_speed(spawned_planes[i], 50.0)
                vehicle.control_landing_gear(spawned_planes[i], 3)
                ped.set_ped_combat_attributes(spawned_pilots[i], 1, true)
                
                
                
                -- i think the ai stuff should be put into a thread to continue giving commands
                ai.task_vehicle_drive_to_coord(spawned_pilots[i], spawned_planes[i], player_coords + v3(0, 0, math.random(0, 50)), 100.0, -1, random_plane, 0, 0.0, 1.0)
                --ai.task_vehicle_follow(spawned_pilots[i], spawned_planes[i], player.get_player_ped(player.player_id()), 30, 786859, 30)
                system.wait(1000)
                menu.notify("new plane spawned")
            end
        end
        utility.yield(feat, 3000)
    end 

    if (not feat.on) then
        for i = 1, #spawned_planes do
            utility.clean_up(spawned_planes[i])
            utility.clean_up(spawned_pilots[i])
        end
    end
end)

fun_menu_features["no_traction"] = menu.add_feature("No Traction", "toggle", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        feat.on = false
        return
    end

    while (feat.on) do
        vehicle.set_vehicle_reduce_grip(player.player_vehicle(), true)
        system.wait(1000)
    end

    if (not feat.on) then
        vehicle.set_vehicle_reduce_grip(player.player_vehicle(), false)
    end
end)

fun_menu_features["custom_vehicle_color"] = menu.add_feature("Custom Vehicle Color", "action", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        return
    end

    local _input, k = input.get("Type in a hex color code.", "ffffff", 6, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    menu.notify("Vehicle color set to " .. k:sub(1, 6), fun_menu_ver, 10, "0x"..k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))
    vehicle.set_vehicle_custom_primary_colour(player.player_vehicle(), tonumber("0x" .. k))
    vehicle.set_vehicle_custom_secondary_colour(player.player_vehicle(), tonumber("0x" .. k))
    vehicle.set_vehicle_custom_wheel_colour(player.player_vehicle(), tonumber("0x" .. k))
    vehicle.set_vehicle_neon_lights_color(player.player_vehicle(), tonumber("0x" .. k))
end)
fun_menu_features["custom_vehicle_color"].hint = "Change the entire vehicle's color to the inputted hex value."

fun_menu_features["custom_primary_color"] = menu.add_feature("Custom Primary Color", "action", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        return
    end

    local _input, k = input.get("Type in a hex color code.", "ffffff", 6, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    menu.notify("Primary vehicle color set to " .. k:sub(1, 6), fun_menu_ver, 10, "0x"..k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))
    vehicle.set_vehicle_custom_primary_colour(player.player_vehicle(), tonumber("0x" .. k))
end)
fun_menu_features["custom_primary_color"].hint = "Change the vehicle's primary color to the inputted hex value."

fun_menu_features["custom_secondary_color"] = menu.add_feature("Custom Secondary Color", "action", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        return
    end

    local _input, k = input.get("Type in a hex color code.", "ffffff", 6, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    menu.notify("Secondary vehicle color set to " .. k:sub(1, 6), fun_menu_ver, 10, "0x"..k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))
    vehicle.set_vehicle_custom_secondary_colour(player.player_vehicle(), tonumber("0x" .. k))
end)
fun_menu_features["custom_secondary_color"].hint = "Change the vehicle's secondary color to the inputted hex value."

fun_menu_features["custom_wheel_color"] = menu.add_feature("Custom Wheel Color", "action", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        return
    end

    local _input, k = input.get("Type in a hex color code.", "ffffff", 6, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    menu.notify("Wheel color set to " .. k:sub(1, 6), fun_menu_ver, 10, "0x"..k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))
    vehicle.set_vehicle_custom_wheel_colour(player.player_vehicle(), tonumber("0x" .. k))
end)
fun_menu_features["custom_wheel_color"].hint = "Change the vehicle's wheel color to the inputted hex value."

fun_menu_features["custom_neon_color"] = menu.add_feature("Custom Neon Color", "action", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        return
    end

    local _input, k = input.get("Type in a hex color code.", "ffffff", 6, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    menu.notify("Vehicle neon color set to " .. k:sub(1, 6), fun_menu_ver, 10, "0x"..k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))
    vehicle.set_vehicle_neon_lights_color(player.player_vehicle(), tonumber("0x" .. k))
end)
fun_menu_features["custom_neon_color"].hint = "Change the vehicle's neon color to the inputted hex value."

fun_menu_features["modded_chrome_color"] = menu.add_feature("Modded Chrome Color", "action", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        return
    end

    
    local _input, k = input.get("Type in a hex color code.", "ffffff", 6, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end
    vehicle.set_vehicle_colors(player.player_vehicle(), 120, 120)
    vehicle.set_vehicle_extra_colors(player.player_vehicle(), 120, 120)
    system.wait(200)

    menu.notify("Vehicle color set to " .. k:sub(1, 6), fun_menu_ver, 10, "0x"..k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))

    vehicle.set_vehicle_custom_primary_colour(player.player_vehicle(), tonumber("0x" .. k))
    vehicle.set_vehicle_custom_secondary_colour(player.player_vehicle(), tonumber("0x" .. k))
    vehicle.set_vehicle_custom_pearlescent_colour(player.player_vehicle(), tonumber("0x" .. k))
    vehicle.set_vehicle_custom_wheel_colour(player.player_vehicle(), tonumber("0x" .. k))
end)

fun_menu_features["unchrome_vehicle"] = menu.add_feature("Unchrome Vehicle", "action", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        return
    end

    
    vehicle.set_vehicle_colors(player.player_vehicle(), 0, 0)
    vehicle.set_vehicle_extra_colors(player.player_vehicle(), 0, 0)
end)

fun_menu_features["rainbow_vehicle"] = menu.add_feature("Rainbow Vehicle", "slider", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        feat.on = false
        return
    end

    
    while feat.on do
        local r, g, b = utility.rainbow(feat.value)
        vehicle.set_vehicle_custom_primary_colour(player.player_vehicle(), utility.rgb_to_int(r, g, b))
        vehicle.set_vehicle_custom_secondary_colour(player.player_vehicle(), utility.rgb_to_int(r, g, b))
        vehicle.set_vehicle_custom_pearlescent_colour(player.player_vehicle(), utility.rgb_to_int(r, g, b))
        vehicle.set_vehicle_custom_wheel_colour(player.player_vehicle(), utility.rgb_to_int(r, g, b))
        vehicle.set_vehicle_neon_lights_color(player.player_vehicle(), utility.rgb_to_int(r, g, b))
        system.wait()
    end
end)
fun_menu_features["rainbow_vehicle"].max = 20.0
fun_menu_features["rainbow_vehicle"].min = 1.0
fun_menu_features["rainbow_vehicle"].mod = 1.0
fun_menu_features["rainbow_vehicle"].value = 10.0

fun_menu_features["vehicle_jump"] = menu.add_feature("Vehicle Jump", "action_value_str", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        return
    end

    local jump_heights = {3, 6, 9}
    local existing_velocity = entity.get_entity_velocity(player.player_vehicle())
    entity.set_entity_velocity(player.player_vehicle(), v3(existing_velocity.x, existing_velocity.y, jump_heights[feat.value+1]))
end):set_str_data({"Low Jump", "Medium Jump", "High Jump"})

fun_menu_features["change_vehicle_seat"] = menu.add_feature("Change Vehicle Seat", "autoaction_value_i", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        return
    end

    if (player.is_player_in_any_vehicle(player.player_id())) then
        ped.set_ped_into_vehicle(player.player_ped(), player.player_vehicle(), feat.value)
        fun_menu_features["change_vehicle_seat"].max = vehicle.get_vehicle_model_number_of_seats(entity.get_entity_model_hash(player.player_vehicle())) - 2
    else
        menu.notify("You're not in a vehicle!", "")
    end
end)
fun_menu_features["change_vehicle_seat"].max = -1
fun_menu_features["change_vehicle_seat"].min = -1
fun_menu_features["change_vehicle_seat"].value = -1

fun_menu_features["vehicle_spin_around"] = menu.add_feature("Spin Vehicle", "slider", fun_menu_pages["personal_vehicle_stuff"].id, function(feat)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        feat.on = false
        return
    end

    local degrees = -180
    while feat.on do
        if (not w_key:is_down()) then
            if (degrees == 180) then
                degrees = -180
            end

            entity.set_entity_heading(player.player_vehicle(), degrees)
            degrees = degrees + feat.value
        end
        system.wait()
    end
end)
fun_menu_features["vehicle_spin_around"].max = 40
fun_menu_features["vehicle_spin_around"].min = 20
fun_menu_features["vehicle_spin_around"].mod = 5
fun_menu_features["vehicle_spin_around"].value = 20

menu.add_feature("Alter Traffic Color", "value_str", fun_menu_pages["vehicle_stuff"].id, function(feat)
    local vehicles
    while (feat.on) do
        vehicles = vehicle.get_all_vehicles()
        fun_menu_threads["alter_traffic_color"] = menu.create_thread(function()
            while (feat.on) do
                for i = 1, #vehicles do
                    utility.request_control(vehicles[i])
                    if (feat.value == 0) then
                        vehicle.set_vehicle_custom_primary_colour(vehicles[i], utility.rgb_to_int(255, 70, 160))
                        vehicle.set_vehicle_custom_secondary_colour(vehicles[i], utility.rgb_to_int(255, 70, 160))
                        vehicle.set_vehicle_custom_pearlescent_colour(vehicles[i], utility.rgb_to_int(255, 70, 160))
                    elseif (feat.value == 1) then
                        vehicle.set_vehicle_custom_primary_colour(vehicles[i], utility.rgb_to_int(0, 0, 0))
                        vehicle.set_vehicle_custom_secondary_colour(vehicles[i], utility.rgb_to_int(0, 0, 0))
                        vehicle.set_vehicle_custom_pearlescent_colour(vehicles[i], utility.rgb_to_int(0, 0, 0)) 
                    end
                end
                system.wait(500)
            end
        end)
        system.wait(500)
        menu.delete_thread(fun_menu_threads["alter_traffic_color"])
    end

    if (not feat.on) then
		if fun_menu_threads["alter_traffic_color"] then
			menu.delete_thread(fun_menu_threads["alter_traffic_color"])
		end
	end
end):set_str_data({"AHAIRDRESSERSCAR", "IWANTITPAINTEDBLACK"})

fun_menu_features["custom_traffic_color"] = menu.add_feature("Custom Traffic Color", "toggle", fun_menu_pages["vehicle_stuff"].id, function(feat)
    local vehicles
    local _input, k = input.get("Type in a hex color code.", "ffffff", 6, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        feat.on = false
        return HANDLER_POP
    end

    while (feat.on) do
        vehicles = vehicle.get_all_vehicles()
        fun_menu_threads["custom_traffic_color"] = menu.create_thread(function()
            while (feat.on) do
                for i = 1, #vehicles do
                    utility.request_control(vehicles[i])
                    vehicle.set_vehicle_custom_primary_colour(vehicles[i], tonumber("0x" .. k))
                    vehicle.set_vehicle_custom_secondary_colour(vehicles[i], tonumber("0x" .. k))
                end
                system.wait(500)
            end
        end)
        system.wait(500)
        menu.delete_thread(fun_menu_threads["custom_traffic_color"])
    end

    if (not feat.on) then
		if fun_menu_threads["custom_traffic_color"] then
			menu.delete_thread(fun_menu_threads["custom_traffic_color"])
		end
	end
end)

fun_menu_features["crazy_vehicles"] = menu.add_feature("Crazy Vehicles", "value_str", fun_menu_pages["vehicle_stuff"].id, function(feat)
    local vehicles
    while (feat.on) do
        vehicles = vehicle.get_all_vehicles()
        for i = 1, #vehicles do
            if (vehicles[i] ~= ped.get_vehicle_ped_is_using(player.player_ped())) then
                utility.request_control(vehicles[i])
                local driver = vehicle.get_ped_in_vehicle_seat(vehicles[i], -1)
                utility.request_control(driver)
                
                if (feat.value == 0) then
                    ai.task_vehicle_drive_wander(driver, vehicles[i], 50.0, 1024)
                elseif (feat.value == 1) then
                    vehicle.set_vehicle_reduce_grip(vehicles[i], true)
                    ai.task_vehicle_drive_wander(driver, vehicles[i], 100.0, 4981308)
                end
            end
        end
        system.wait(10)
    end

    if (not feat.on) then
        for i = 1, #vehicles do
            vehicle.set_vehicle_reduce_grip(vehicles[i], false)
        end
    end
        
end):set_str_data({"v1", "v2"})

fun_menu_features["vehicles_leak_oil"] = menu.add_feature("Vehicles Leak Oil", "toggle", fun_menu_pages["vehicle_stuff"].id, function(feat)
    local vehicles
    while (feat.on) do
        vehicles = vehicle.get_all_vehicles()
        for i = 1, #vehicles do
            utility.request_control(vehicles[i])
            vehicle.set_vehicle_engine_torque_multiplier_this_frame(vehicles[i], math.random(1.0, 10.0))
            fire.add_explosion(entity.get_entity_coords(vehicles[i]), 67, false, false, 0, player.player_id())
            system.wait(10)
        end
    end
end)

fun_menu_features["launch_random_vehicles"] = menu.add_feature("Launch Random Vehicles", "toggle", fun_menu_pages["vehicle_stuff"].id, function(feat)
    local vehicles
    while (feat.on) do
        vehicles = vehicle.get_all_vehicles()
        fun_menu_threads["launch_random_vehicles_req_control"] = menu.create_thread(function()
            while (feat.on) do
                for i = 1, #vehicles do
                    if (vehicles[i] ~= ped.get_vehicle_ped_is_using(player.player_ped())) then
                        utility.request_control(vehicles[i])
                        entity.set_entity_velocity(vehicles[i], v3(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180)))
                    end
                end
                system.wait(500)
            end
        end)
        system.wait(500)
        menu.delete_thread(fun_menu_threads["launch_random_vehicles_req_control"])
    end

    if (not feat.on) then
        if fun_menu_threads["launch_random_vehicles_req_control"] then
            menu.delete_thread(fun_menu_threads["launch_random_vehicles_req_control"])
        end
    end
end)

fun_menu_features["anti_gravity_vehicles"] = menu.add_feature("Anti-Gravity Vehicles", "toggle", fun_menu_pages["vehicle_stuff"].id, function(feat)
    local vehicles
    while (feat.on) do
        vehicles = vehicle.get_all_vehicles()
        fun_menu_threads["anti_gravity_vehicles"] = menu.create_thread(function()
            while (feat.on) do
                for i = 1, #vehicles do
                    if (vehicles[i] ~= ped.get_vehicle_ped_is_using(player.player_ped())) then
                        utility.request_control(vehicles[i])
                        vehicle.set_vehicle_gravity_amount(vehicles[i], 0.0)
                        entity.set_entity_velocity(vehicles[i], v3(0, 0, 1))
                    end
                end
                system.wait(500)
            end
        end)
        system.wait(500)
        menu.delete_thread(fun_menu_threads["anti_gravity_vehicles"])
    end

    if (not feat.on) then
		if fun_menu_threads["anti_gravity_vehicles"] then
			menu.delete_thread(fun_menu_threads["anti_gravity_vehicles"])
		end
	end
end)

fun_menu_features["bouncing_vehicles"] = menu.add_feature("Bouncing Vehicles", "value_str", fun_menu_pages["vehicle_stuff"].id, function(feat)
    local jump_heights = {3, 6, 9}
    local vehicles
    while (feat.on) do
        vehicles = vehicle.get_all_vehicles()
        for i = 1, #vehicles do
            utility.request_control(vehicles[i])
            local existing_velocity = entity.get_entity_velocity(vehicles[i])
            entity.set_entity_velocity(vehicles[i], v3(existing_velocity.x, existing_velocity.y, jump_heights[feat.value+1]))
            system.wait(25)
        end
    end
end):set_str_data({"Low Jump", "Medium Jump", "High Jump"})

-- Thanks Proddy
fun_menu_features["vehicle_magnet_gun"] = menu.add_feature("Vehicle Magnet Gun", "value_i", fun_menu_pages["vehicle_stuff"].id, function(feat)
	while feat.on do
		if player.is_player_free_aiming(player.player_id()) then
			local offset = getOffsetFromCam(30)
			local vehicles = getAllVehiclesInPlayerRange(player.player_id(), feat.value)
			local r, g, b = utility.rainbow(10)
			graphics.draw_marker(28, offset, v3(0, 90, 0), v3(0, 90, 0), v3(0.5, 0.5, 0.5), r, g, b, 35, false, false, 2, false, nil, "MarkerTypeDebugSphere", false)
			local myVeh = ped.get_vehicle_ped_is_using(player.player_ped())
			for i = 1, #vehicles do
				local veh = vehicles[i]
				if veh ~= myVeh and utility.request_control(veh) then
					local vehPos = entity.get_entity_coords(veh)
					local vect = v3(offset.x, offset.y, offset.z)
					vect = vect - vehPos
                    vect = vect * 1
                    entity.apply_force_to_entity(veh, 1, vect.x, vect.y, vect.z, 0, 0, 0.5, false, true)
				end
			end
		end
		system.wait()
	end
end)
fun_menu_features["vehicle_magnet_gun"].min = 35
fun_menu_features["vehicle_magnet_gun"].max = 140
fun_menu_features["vehicle_magnet_gun"].mod = 5
fun_menu_features["vehicle_magnet_gun"].value = 70
fun_menu_features["vehicle_magnet_gun"].hint = "Magnetically attract vehicles into a cluster from far away. Magnet range can be adjusted between #FF4FC5EC#35m#DEFAULT# and #FF4FC5EC#140m#DEFAULT#."

--   ____  _____    ___     ____   __ __    ______ ______ _  __ ______
--  / __ \/__  /   /   |   / __ \ / //_/   /_  __// ____/| |/ //_  __/
-- / / / /  / /   / /| |  / /_/ // ,<       / /  / __/   |   /  / /   
--/ /_/ /  / /__ / ___ | / _, _// /| |     / /  / /___  /   |  / /    
--\____/  /____//_/  |_|/_/ |_|/_/ |_|    /_/  /_____/ /_/|_| /_/     
local r, g, b, a = 255, 255, 255, 175
local r2, g2, b2, a2 = 255, 100, 100, 255
local ozark_texts = {
    "Hello we did an exit scam lol",
    "Put me in coach.",
    "We partnered with other cheat providers after we exit scammed for more monies.",
    "BTC miner activated!",
    "Øzark v27 is out now!",
    "Dear beloved Øzark users, READ THIS MESSAGE IN ITS ENTIRETY.",
    "ØzArK oN tOp!!!!!!1111!one!!111",
    "2take1 on top!!!!!",
    "blah blah blah we exit scammed you suckers!!!!!11!!!one111!!",
    "We aRe BetTer ThAn 2TaKE1!!!!111!!one!!!1111!!",
    "We took months to do a menu UI rewrite when it should have taken 1 month at the most lmao",
    "We added a money drop option after the patch just so you can get banned faster.",
    "Øzark exit scam lmao",
    "exit scammed ya suckers",
    "Øzark on bottom lol",
    "We totally got a CnD from TakeTwo lmaoooooo"
}

fun_menu_features["ozark_text_color"] = menu.add_feature("Øzark Text Color", "action", fun_menu_pages["ozark_text"].id, function(feat)
    local _input, k = input.get("Type in a hex color code.", "ffffff 175", 10, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    menu.notify("Color set to " .. k:sub(1, 6) .. " with alpha value of " .. k:sub(8, 10), fun_menu_ver, 10, "0x"..k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))
    r, g, b, a = utility.hex_to_rgba(k)
end)

fun_menu_features["ozark_f4_text_color"] = menu.add_feature("Øzark F4 Text Color", "action", fun_menu_pages["ozark_text"].id, function(feat)
    local _input, k = input.get("Type in a hex color code.", "ff6464 255", 10, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    menu.notify("Color set to " .. k:sub(1, 6) .. " with alpha value of " .. k:sub(8, 10), fun_menu_ver, 10, "0x"..k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))
    r2, g2, b2, a2 = utility.hex_to_rgba(k)
end)

local function displayOzarkText(r, g, b, a, r2, g2, b2, a2, value)
    ui.set_text_scale(0.4)
    ui.set_text_font(0)
    ui.set_text_centre(0)
    ui.set_text_color(r2, g2, b2, a2)
    if (value == 0) then
        ui.draw_text('F4', v2(0.5, 0.1))
    elseif (value == 1) then
        ui.draw_text('NUMPAD -', v2(0.5, 0.1))
    end

    ui.set_text_scale(0.4)
    ui.set_text_font(0)
    ui.set_text_centre(0)
    ui.set_text_color(r, g, b, a)
end

fun_menu_features["uppercase_ozark_text"] = menu.add_feature("Use UPPERCASE TEXT", "toggle", fun_menu_pages["ozark_text"].id, function(feat)
    settings["uppercase_ozark_text"] = feat.on
end)
fun_menu_features["uppercase_ozark_text"].on = settings["uppercase_ozark_text"]

fun_menu_features["random_ozark_f4_text"] = menu.add_feature("Random Øzark F4 Text", 'value_str', fun_menu_pages["ozark_text"].id, function(feat)
    local x = math.random(1, #ozark_texts)
    while (feat.on) do
        displayOzarkText(r, g, b, a, r2, g2, b2, a2, feat.value)
        if (settings["uppercase_ozark_text"]) then
            ui.draw_text(ozark_texts[x]:upper(), v2(0.5, 0.075))
        elseif (not settings["uppercase_ozark_text"]) then
            ui.draw_text(ozark_texts[x], v2(0.5, 0.075))
        end
        system.wait()
    end
end):set_str_data({"F4", "NUMPAD minus"})

fun_menu_features["put_me_in_coach_text"] = menu.add_feature("Put Me in Coach Text", 'value_str', fun_menu_pages["ozark_text"].id, function(feat)
    while (feat.on) do
        displayOzarkText(r, g, b, a, r2, g2, b2, a2, feat.value)
        if (settings["uppercase_ozark_text"]) then
            ui.draw_text("PUT ME IN COACH", v2(0.5, 0.075))
        elseif (not settings["uppercase_ozark_text"]) then
            ui.draw_text("Put Me in Coach", v2(0.5, 0.075))
        end
        system.wait(0)
    end
end):set_str_data({"F4", "NUMPAD minus"})

--   ______ __  __ ___     ____   ___    ______ ______ ______ ____     __    ____   ____   __ __ _____
--  / ____// / / //   |   / __ \ /   |  / ____//_  __// ____// __ \   / /   / __ \ / __ \ / //_// ___/
-- / /    / /_/ // /| |  / /_/ // /| | / /      / /  / __/  / /_/ /  / /   / / / // / / // ,<   \__ \ 
--/ /___ / __  // ___ | / _, _// ___ |/ /___   / /  / /___ / _, _/  / /___/ /_/ // /_/ // /| | ___/ / 
--\____//_/ /_//_/  |_|/_/ |_|/_/  |_|\____/  /_/  /_____//_/ |_|  /_____/\____/ \____//_/ |_|/____/  
fun_menu_pages["character_looks"] = menu.add_feature("Character Looks", "parent", fun_menu_pages["self"].id)
fun_menu_pages["character_looks"].hint = "Various features for customizing your character."

fun_menu_pages["random_outfits"] = menu.add_feature("Random Outfits", "parent", fun_menu_pages["character_looks"].id)
menu.add_feature("Random Tux Outfit", "action", fun_menu_pages["random_outfits"].id, function(feat)
    outfit.wipe_outfit(player.player_ped())
    outfit.random_tuxedo_outfit(player.player_ped())
end)

fun_menu_features["random_tropical_outfit"] = menu.add_feature("Random Tropical Outfit", "action", fun_menu_pages["random_outfits"].id, function(feat)
    outfit.wipe_outfit(player.player_ped())
    outfit.random_tropical_outfit(player.player_ped())
end)

fun_menu_features["random_beach_outfit"] = menu.add_feature("Random Beach Outfit", "action", fun_menu_pages["random_outfits"].id, function(feat)
    outfit.wipe_outfit(player.player_ped())
    outfit.random_beach_outfit(player.player_ped())
end)

fun_menu_features["random_golf_outfit"] = menu.add_feature("Random Golf Outfit", "action", fun_menu_pages["random_outfits"].id, function(feat)
    outfit.wipe_outfit(player.player_ped())
    outfit.random_golf_outfit(player.player_ped())
end)

fun_menu_features["copy_random_player_outfit"] = menu.add_feature("Copy Random Player Outfit", "action", fun_menu_pages["random_outfits"].id, function(feat)
    local pid
    repeat
        pid = math.random(0, 31)
        system.wait()
    until (utility.check_player_validity(pid))

    outfit.copy_outfit(player.get_player_ped(pid), player.player_ped())
end)

fun_menu_features["go_to_menu_outfitter"] = menu.add_feature("Go to Outfitter", "action", fun_menu_pages["character_looks"].id, function(feat)
    local outfitter = menu.get_feature_by_hierarchy_key("local.outfitter")
    if (outfitter ~= nil) then
        outfitter:toggle()
    end
end)

fun_menu_features["make_self_barefoot"] = menu.add_feature("Make Self Barefoot", "action", fun_menu_pages["character_looks"].id, function(feat)
    outfit.barefoot(player.player_ped())
end)

fun_menu_features["make_self_shirtless"] = menu.add_feature("Make Self Shirtless", "action", fun_menu_pages["character_looks"].id, function(feat)
    outfit.shirtless(player.player_ped())
end)

fun_menu_features["make_self_old_person"] = menu.add_feature("Make Self an Old Person", "action", fun_menu_pages["character_looks"].id, function(feat)
    local codger_colors = {
        hair_color = select(math.random(1, 3), 26, 27, 28),
        hair_highlight_color = select(math.random(1, 3), 26, 27, 28)
    }
    ped.set_ped_head_overlay(player.player_ped(), 3, 14, 1.0)
    ped.set_ped_hair_colors(player.player_ped(), codger_colors["hair_color"], codger_colors["hair_highlight_color"]) -- hair colors
    ped.set_ped_head_overlay_color(player.player_ped(), 1, 1, codger_colors["hair_color"], codger_colors["hair_highlight_color"]) -- facial hair colors
end)

fun_menu_features["random_face_features"] = menu.add_feature("Random Face Features", "action_value_str", fun_menu_pages["character_looks"].id, function(feat)
    if (feat.value == 0) then
        npc.extra_face_features(player.player_ped())
    elseif (feat.value == 1) then
        npc.extra_face_features(player.player_ped())
        npc.more_extra_face_features(player.player_ped())
    end
end):set_str_data({"Base Face Features", "Extra Face Features"})

fun_menu_features["random_headblend"] = menu.add_feature("Random Headblend", "action_value_str", fun_menu_pages["character_looks"].id, function(feat)
    npc.wipe_head_blend(player.player_ped())
    if (feat.value == 0) then
        npc.randomize_head_blend(player.player_ped())
    elseif (feat.value == 1) then
        npc.randomize_head_blend(player.player_ped())
        npc.extra_face_features(player.player_ped())
    elseif (feat.value == 2) then
        npc.randomize_head_blend(player.player_ped())
        npc.extra_face_features(player.player_ped())
        npc.more_extra_face_features(player.player_ped())
    end
end):set_str_data({"Base Face Shape", "w/ Face Features", "w/ More Face Features"})

fun_menu_features["copy_random_player_headblend"] = menu.add_feature("Copy Random Player Headblend", "action", fun_menu_pages["character_looks"].id, function(feat)
    local pid = math.random(0, 31)
    repeat
        pid = math.random(0, 31)
        system.wait()
    until (utility.check_player_validity(pid))

    npc.wipe_head_blend(player.player_ped())
    npc.copy_headblend(player.get_player_ped(pid), player.player_ped())
end)
fun_menu_features["copy_random_player_headblend"].hint = "Copy the headblend of a random player in the current session to your character."

fun_menu_features["random_skin_tone"] = menu.add_feature("Random Skin Tone", "action", fun_menu_pages["character_looks"].id, function(feat)
    npc.randomize_skin_tone(player.player_ped())
end)

fun_menu_features["wipe_head_blend"] = menu.add_feature("Wipe Headblend", "action", fun_menu_pages["character_looks"].id, function(feat)
    npc.wipe_head_blend(player.player_ped())
end)

fun_menu_features["random_funky_hair_color"] = menu.add_feature("Random Funky Hair Color", "action", fun_menu_pages["character_looks"].id, function(feat)
    local funky_hair = math.random(30, 54)
    ped.set_ped_hair_colors(player.player_ped(), funky_hair, funky_hair) -- hair colors
    ped.set_ped_head_overlay_color(player.player_ped(), 1, 1, funky_hair, funky_hair) -- facial hair colors
end)

fun_menu_features["hair_disco"] = menu.add_feature("Hair Disco", "toggle", fun_menu_pages["character_looks"].id, function(feat)
    while (feat.on) do
        ped.set_ped_hair_colors(player.player_ped(), math.random(30, 54), math.random(30, 54)) -- hair colors
        ped.set_ped_head_overlay_color(player.player_ped(), 1, 1, math.random(30, 54), math.random(30, 54)) -- facial hair colors
        system.wait(50)
    end
end)

fun_menu_features["wetness"] = menu.add_feature("Wetness", "slider", fun_menu_pages["self"].id, function(feat)
    if (feat.on) then
        natives.PED.SET_PED_WETNESS_HEIGHT(player.player_ped(), feat.value)
    else
        natives.PED.CLEAR_PED_WETNESS(player.player_ped())
    end
end)
fun_menu_features["wetness"].max = 1.0
fun_menu_features["wetness"].min = -1.0
fun_menu_features["wetness"].mod = 0.05
fun_menu_features["wetness"].value = -1.0

 
fun_menu_features["spin_around"] = menu.add_feature("Spin Around", "slider", fun_menu_pages["self"].id, function(feat)
    local degrees = -180
    while feat.on do
        if (not w_key:is_down()) then
            if (degrees == 180) then
                degrees = -180
            end

            entity.set_entity_heading(player.player_ped(), degrees)
            degrees = degrees + feat.value
        end
        system.wait()
    end
end)
fun_menu_features["spin_around"].max = 40
fun_menu_features["spin_around"].min = 20
fun_menu_features["spin_around"].mod = 5
fun_menu_features["spin_around"].value = 20

fun_menu_features["spin_around_360"] = menu.add_feature("Spin Around 360", "toggle", fun_menu_pages["self"].id, function(feat)
    while (feat.on) do
        if (not w_key:is_down()) then
            entity.set_entity_rotation(player.player_ped(), v3(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180)))
        end
        system.wait()
    end
end)

fun_menu_features["play_dead"] = menu.add_feature("Play Dead", "value_str", fun_menu_pages["self"].id, function(feat)
    if (not ped.can_ped_ragdoll(player.player_ped())) then
        ped.set_ped_can_ragdoll(player.player_ped(), true)
    end

    if (feat.on) then
        utility.request_anim_dict_and_set("facials@gen_male@base", "dead_1")
        utility.request_anim_dict_and_set("facials@gen_male@base", "dead_2")

        fun_menu_threads["play_dead_thread"] = menu.create_thread(function()
            while (feat.on) do
                if (feat.value == 0) then
                    ped.set_ped_to_ragdoll(player.player_ped(), 1500, 0, 0)
                elseif (feat.value == 1) then
                    ped.set_ped_to_ragdoll(player.player_ped(), 1500, 0, 0)
                    natives.PED.PLAY_FACIAL_ANIM(player.player_ped(), "dead_1", "facials@gen_male@base")
                elseif (feat.value == 2) then
                    ped.set_ped_to_ragdoll(player.player_ped(), 1500, 0, 0)
                    natives.PED.PLAY_FACIAL_ANIM(player.player_ped(), "dead_2", "facials@gen_male@base")
                end
                system.wait()
            end
        end)
    end

    if (not feat.on) then
        menu.delete_thread(fun_menu_threads["play_dead_thread"])
    end
end)fun_menu_features["play_dead"]:set_str_data({"No Facial Anim", "Facial Anim 1", "Facial Anim 2"})
fun_menu_features["play_dead"].hint = "Does what it says on the tin. Can glitch your ped when doing certain things such as sitting down."

fun_menu_features["clumsiness"] = menu.add_feature("Clumsiness", "value_str", fun_menu_pages["self"].id, function(feat)
    while (feat.on) do 
        if (feat.value == 0) then
            ped.set_ped_to_ragdoll(player.player_ped(), math.random(1, 25) * 100, math.random(1, 25) * 100, math.random(-25, 25))
            system.wait(math.random(10, 30) * 1000)
        elseif (feat.value == 1) then
            if ped.is_ped_ragdoll(player.player_ped()) then
                natives.PED.SET_PED_RAGDOLL_ON_COLLISION(player.player_ped(), false)
            else
                natives.PED.SET_PED_RAGDOLL_ON_COLLISION(player.player_ped(), true)
            end
            system.wait(1000)
        end
    end
    
    if (not feat.on) then
        natives.PED.SET_PED_RAGDOLL_ON_COLLISION(player.player_ped(), false)
    end
end):set_str_data({"Clumsy", "Very Clumsy"})

fun_menu_features["trip_on_something"] = menu.add_feature("Trip on Something", "action", fun_menu_pages["self"].id, function(feat)
    ped.set_ped_to_ragdoll(player.player_ped(), math.random(1, 25) * 100, math.random(1, 25) * 100, math.random(-25, 25))
end)

--    _   __ ____   ______   _____ ______ __  __ ______ ______
--   / | / // __ \ / ____/  / ___//_  __// / / // ____// ____/
--  /  |/ // /_/ // /       \__ \  / /  / / / // /_   / /_    
-- / /|  // ____// /___    ___/ / / /  / /_/ // __/  / __/    
--/_/ |_//_/     \____/   /____/ /_/   \____//_/    /_/       
fun_menu_pages["follower_menu"] = menu.add_feature("Followers", "parent", fun_menu_pages["npc_stuff"].id)
fun_menu_pages["follower_menu"].hint = "Avoid using follower features in small interior spaces or #FF0000FF#the follower(s) will bug out#DEFAULT#!"

fun_menu_pages["follower_settings"] = menu.add_feature("Follower Settings", "parent", fun_menu_pages["follower_menu"].id)
fun_menu_pages["edit_followers"] = menu.add_feature("Edit Followers", "parent", fun_menu_pages["follower_menu"].id)

local follower_peds = {}
local outfits_value
fun_menu_features["follower_outfits"] = menu.add_feature("Follower(s)' Outfits", "autoaction_value_str", fun_menu_pages["follower_settings"].id, function(val)
    outfits_value = val
end):set_str_data({"Tuxedo", "Tropical"})

fun_menu_features["followers_enter_vehicles"] = menu.add_feature("Can Followers Enter Vehicle?", "action_value_str", fun_menu_pages["follower_settings"].id, function(val)
    

    if (val.value == 0) then
        for i = 1, #follower_peds do
            if (player.is_player_in_any_vehicle(player.player_id())) then
                ped.set_ped_into_vehicle(follower_peds[i], player.player_vehicle(), vehicle.get_free_seat(player.player_vehicle()))
            else
                ai.task_leave_vehicle(follower_peds[i], player.player_vehicle(), 1)
            end
        end
    else
        for i = 1, #follower_peds do
            ai.task_leave_vehicle(follower_peds[i], player.player_vehicle(), 1)
        end
    end
end):set_str_data({"Yes", "No"})

fun_menu_features["follower_count"] = menu.add_feature("Follower Count", "autoaction_value_i", fun_menu_pages["follower_settings"].id)
fun_menu_features["follower_count"].min = 1
fun_menu_features["follower_count"].max = 5
fun_menu_features["follower_count"].mod = 1
fun_menu_features["follower_count"].value = 1

fun_menu_features["follower_range"] = menu.add_feature("Follower Wander Range", "autoaction_value_i", fun_menu_pages["follower_settings"].id)
fun_menu_features["follower_range"].min = 5
fun_menu_features["follower_range"].max = 30
fun_menu_features["follower_range"].mod = 1
fun_menu_features["follower_range"].value = 2

fun_menu_features["follower_wander"] = menu.add_feature("Wandering Follower(s)?", "toggle", fun_menu_pages["follower_settings"].id, function(feat)
    settings["wandering_follower"] = feat.on
end)
fun_menu_features["follower_wander"].on = settings["wandering_follower"]

fun_menu_features["edit_follower_outfits"] = menu.add_feature("Alter Follower(s)' Outfits", "action_value_str", fun_menu_pages["edit_followers"].id, function(feat)
    for i = 1, #follower_peds do
        utility.request_control(follower_peds[i])

        if (feat.value == 0) then
            outfit.wipe_outfit(follower_peds[i])
            outfit.random_tuxedo_outfit(follower_peds[i])
        elseif (feat.value == 1) then
            outfit.wipe_outfit(follower_peds[i])
            outfit.random_tropical_outfit(follower_peds[i])
        elseif (feat.value == 2) then
            outfit.wipe_outfit(follower_peds[i])
            outfit.random_golf_outfit(follower_peds[i])
        elseif (feat.value == 3) then
            local pid = math.random(0, 31)
            repeat
                pid = math.random(0, 31)
                system.wait()
            until (utility.check_player_validity(pid))

            outfit.wipe_outfit(follower_peds[i])
            outfit.copy_outfit(player.get_player_ped(pid), follower_peds[i])
        end
    end
end):set_str_data({"Tuxedo", "Tropical", "Golf", "Random Player Outfit"})

fun_menu_features["make_followers_old_codgers"] = menu.add_feature("Make Follower(s) Old Codgers", "action", fun_menu_pages["edit_followers"].id, function(feat)
    local codger_colors = {
        hair_color = select(math.random(1, 3), 26, 27, 28),
        hair_highlight_color = select(math.random(1, 3), 26, 27, 28)
    }

    for i = 1, fun_menu_features["follower_count"].value do
        ped.set_ped_head_overlay(follower_peds[i], 3, 14, 1.0)
        ped.set_ped_hair_colors(follower_peds[i], codger_colors["hair_color"], codger_colors["hair_highlight_color"]) -- hair colors
        ped.set_ped_head_overlay_color(follower_peds[i], 1, 1, codger_colors["hair_color"], codger_colors["hair_highlight_color"]) -- facial hair colors
    end
end)

fun_menu_features["randomize_follower_hairstyle"] = menu.add_feature("Randomize Followers' Hairstyle", "action", fun_menu_pages["edit_followers"].id, function(feat)
    for i = 1, fun_menu_features["follower_count"].value do
        npc.randomize_hair_styles(follower_peds[i])
    end
end)

fun_menu_features["make_followers_barefoot"] = menu.add_feature("Make Follower(s) Barefoot", "action", fun_menu_pages["edit_followers"].id, function(feat)
    for i = 1, #follower_peds do
        outfit.barefoot(follower_peds[i])
    end
end)

fun_menu_features["make_followers_shirtless"] = menu.add_feature("Make Follower(s) Shirtless", "action", fun_menu_pages["edit_followers"].id, function(feat)
    for i = 1, #follower_peds do
        outfit.shirtless(follower_peds[i])
    end
end)

fun_menu_features["follower_random_face_features"] = menu.add_feature("Random Face Features", "action_value_str", fun_menu_pages["edit_followers"].id, function(feat)
    for i = 1, #follower_peds do
        if (feat.value == 0) then
            npc.extra_face_features(follower_peds[i])
        elseif (feat.value == 1) then
            npc.extra_face_features(follower_peds[i])
            npc.more_extra_face_features(follower_peds[i])
        end
    end
end):set_str_data({"Base Face Features", "Extra Face Features"})

fun_menu_features["follower_random_headblend"] = menu.add_feature("Random Headblend", "action_value_str", fun_menu_pages["edit_followers"].id, function(feat)
    for i = 1, #follower_peds do
        npc.wipe_head_blend(follower_peds[i])
        if (feat.value == 0) then
            npc.randomize_head_blend(follower_peds[i])
        elseif (feat.value == 1) then
            npc.randomize_head_blend(follower_peds[i])
            npc.extra_face_features(follower_peds[i])
        elseif (feat.value == 2) then
            npc.randomize_head_blend(follower_peds[i])
            npc.extra_face_features(follower_peds[i])
            npc.more_extra_face_features(follower_peds[i])
        end
    end
end):set_str_data({"Base Face Shape", "w/ Face Features", "w/ More Face Features"})

fun_menu_features["follower_random_player_headblend"] = menu.add_feature("Copy Random Player Headblend", "action", fun_menu_pages["edit_followers"].id, function(feat)
    for i = 1, #follower_peds do
        local pid = math.random(0, 31)
        repeat
            pid = math.random(0, 31)
            system.wait()
        until (utility.check_player_validity(pid))

        npc.wipe_head_blend(follower_peds[i])
        npc.copy_headblend(player.get_player_ped(pid), follower_peds[i])
    end
end)

fun_menu_features["follower_random_player_headblend"].hint = "Copy the headblend of a random player in the current session to any spawned followers."

fun_menu_features["follower_random_skin_tone"] = menu.add_feature("Random Skin Tone", "action", fun_menu_pages["edit_followers"].id, function(feat)
    for i = 1, #follower_peds do
        npc.randomize_skin_tone(follower_peds[i])
    end
end)

fun_menu_features["spawn_clone_followers"] = menu.add_feature("Spawn Clone Follower(s)", "toggle", fun_menu_pages["follower_menu"].id, function(feat)
    if (not utility.check_player_validity()) then
        menu.notify("Change your ped model to a freemode ped model before using this feature!", fun_menu_ver)
        feat.on = false
        return
    end

    local freemode_ped
    if (player.is_player_female(player.player_id())) then
        freemode_ped = gameplay.get_hash_key("mp_f_freemode_01")
    else
        freemode_ped = gameplay.get_hash_key("mp_m_freemode_01")
    end

    for i = 1, fun_menu_features["follower_count"].value do
        follower_peds[i] = ped.create_ped(1, freemode_ped, player.get_player_coords(player.player_id()) + v3(math.random(-2, 2), math.random(-2, 2), 0), math.random(0, 359), true, false)
        npc.create_clone(player.player_ped(), follower_peds[i])

        if (outfits_value == nil) then
            outfit.wipe_outfit(follower_peds[i])
            outfit.random_tuxedo_outfit(follower_peds[i])  
        elseif (outfits_value.value == 0) then
            outfit.wipe_outfit(follower_peds[i])
            outfit.random_tuxedo_outfit(follower_peds[i])
        elseif (outfits_value.value == 1) then
            outfit.wipe_outfit(follower_peds[i])
            outfit.random_tropical_outfit(follower_peds[i])
        end
        system.wait(100)
        entities[#entities + 1] = follower_peds[i]
        utility.add_blip(follower_peds[i], 280)
    end

    while feat.on do
        for i = 1, fun_menu_features["follower_count"].value do
            utility.request_control(follower_peds[i])

            if (utility.get_distance_between_coords(player.get_player_coords(player.player_id()), entity.get_entity_coords(follower_peds[i])) <= fun_menu_features["follower_range"].value + 1) then
                if (settings["wandering_follower"]) then
                    ai.task_go_to_coord_by_any_means(follower_peds[i], player.get_player_coords(player.player_id()) + v3(math.random(-fun_menu_features["follower_range"].value, fun_menu_features["follower_range"].value), math.random(-fun_menu_features["follower_range"].value, fun_menu_features["follower_range"].value), 0), 1, 0, true, 1, 0.0)
                end
            else
                ai.task_goto_entity(follower_peds[i], player.player_ped(), -1, -1, 25.0)
            end
        end
        utility.yield(feat, 5000)
    end

    if (not feat.on or not utility.is_entity_valid(follower_peds[i])) then
        for i = 1, fun_menu_features["follower_count"].value do
            utility.clean_up(follower_peds[i])
            system.wait(250)
        end

        fun_menu_features["follower_wander"].on = false
        settings["wandering_follower"] = false
    end
end)
fun_menu_features["spawn_clone_followers"].hint = "Spawn 1-5 clones of your character."

fun_menu_features["spawn_followers"] = menu.add_feature("Spawn Follower(s)", "value_str", fun_menu_pages["follower_menu"].id, function(feat)
    local freemode_ped

    for i = 1, fun_menu_features["follower_count"].value do
        if (math.random(1, 2) == 1) then
            freemode_ped = gameplay.get_hash_key("mp_f_freemode_01")
        else
            freemode_ped = gameplay.get_hash_key("mp_m_freemode_01")
        end

        utility.request_model(freemode_ped)

        follower_peds[i] = ped.create_ped(1, freemode_ped, player.get_player_coords(player.player_id()) + v3(math.random(-2, 2), math.random(-2, 2), 0), math.random(0, 359), true, false)
        if (feat.value == 0) then
            npc.extra_face_features(follower_peds[i])
            npc.randomize_head_blend(follower_peds[i])
        elseif (feat.value == 1) then
            npc.randomize_head_blend(follower_peds[i])
            npc.extra_face_features(follower_peds[i])
        elseif (feat.value == 2) then
            npc.randomize_head_blend(follower_peds[i])
            npc.extra_face_features(follower_peds[i])
            npc.more_extra_face_features(follower_peds[i])
        end

        if (outfits_value == nil) then
            outfit.wipe_outfit(follower_peds[i])
            outfit.random_tuxedo_outfit(follower_peds[i])
        elseif (outfits_value.value == 0) then
            outfit.wipe_outfit(follower_peds[i])
            outfit.random_tuxedo_outfit(follower_peds[i])
        elseif (outfits_value.value == 1) then
            outfit.wipe_outfit(follower_peds[i])
            outfit.random_tropical_outfit(follower_peds[i])
        end
        system.wait(100)
        entities[#entities + 1] = follower_peds[i]
        utility.add_blip(follower_peds[i], 280)
    end

    while feat.on do
        for i = 1, fun_menu_features["follower_count"].value do
            utility.request_control(follower_peds[i])

            if (utility.get_distance_between_coords(player.get_player_coords(player.player_id()), entity.get_entity_coords(follower_peds[i])) <= fun_menu_features["follower_range"].value + 1) then
                if (settings["wandering_follower"]) then
                    ai.task_go_to_coord_by_any_means(follower_peds[i], player.get_player_coords(player.player_id()) + v3(math.random(-fun_menu_features["follower_range"].value, fun_menu_features["follower_range"].value), math.random(-fun_menu_features["follower_range"].value, fun_menu_features["follower_range"].value), 0), 1, 0, true, 1, 0.0)
                end
            else
                ai.task_goto_entity(follower_peds[i], player.player_ped(), -1, -1, 25.0)
            end
        end
        utility.yield(feat, 5000)
    end
    
    if (not feat.on or not utility.is_entity_valid(follower_peds[i])) then
        for i = 1, fun_menu_features["follower_count"].value do
            utility.clean_up(follower_peds[i])
            system.wait(250)
        end

        fun_menu_features["follower_wander"].on = false
        settings["wandering_follower"] = false
    end
end):set_str_data({"Base Face Shape", "w/ Face Features", "w/ More Face Features"})

fun_menu_features["turn_npcs_into_clones"] = menu.add_feature("Turn NPCs Into Clones", "toggle", fun_menu_pages["npc_stuff"].id, function(feat)
    if (not utility.check_player_validity()) then
        menu.notify("Change your ped model to a freemode ped model before using this feature!", fun_menu_ver)
        feat.on = false
        return
    end

    local nearby_peds = {}
    local replaced_peds = {}
    if (player.is_player_female(player.player_id())) then
        freemode_ped = gameplay.get_hash_key("mp_f_freemode_01")
    else
        freemode_ped = gameplay.get_hash_key("mp_m_freemode_01")
    end

    utility.request_model(freemode_ped)
    while (feat.on) do
        nearby_peds = getAllPedsInPlayerRange(player.player_id(), 70)
        for i = 1, #nearby_peds do
            if (not ped.is_ped_a_player(nearby_peds[i]) and entity.get_entity_model_hash(nearby_peds[i]) ~= freemode_ped and not ped.is_ped_in_any_vehicle(nearby_peds[i])) then
                replaced_ped = ped.create_ped(1, freemode_ped, entity.get_entity_coords(nearby_peds[i]), entity.get_entity_heading(nearby_peds[i]), true, false)
                npc.create_clone(player.player_ped(), replaced_ped)
                ai.task_wander_standard(replaced_ped, 1.0, true)
                entity.set_entity_as_mission_entity(replaced_ped, true, true)

                if (math.random(0, 15) == 5) then
                    ped.set_ped_component_variation(replaced_ped, 6, 34, 0, 0) -- feet
                end

                entities[#entities + 1] = replaced_ped
                utility.request_control(nearby_peds[i])
                entity.set_entity_as_mission_entity(nearby_peds[i], true, true)
                entity.delete_entity(nearby_peds[i])
            end
            system.wait(50)
        end
        system.wait(2000)
    end
end)

fun_menu_features["turn_npcs_into_freemode_peds"] = menu.add_feature("Turn NPCs Into Freemode Peds", "toggle", fun_menu_pages["npc_stuff"].id, function(feat)
    local nearby_peds = {}
    local replaced_peds = {}
    local freemode_ped

    if (math.random(1, 2) == 1) then
        freemode_ped = gameplay.get_hash_key("mp_f_freemode_01")
    else
        freemode_ped = gameplay.get_hash_key("mp_m_freemode_01")
    end

    utility.request_model(freemode_ped)
    while (feat.on) do
        nearby_peds = getAllPedsInPlayerRange(player.player_id(), 70)
        for i = 1, #nearby_peds do
            if (not ped.is_ped_a_player(nearby_peds[i]) and entity.get_entity_model_hash(nearby_peds[i]) ~= freemode_ped and not ped.is_ped_in_any_vehicle(nearby_peds[i])) then
                replaced_ped = ped.create_ped(1, freemode_ped, entity.get_entity_coords(nearby_peds[i]), entity.get_entity_heading(nearby_peds[i]), true, false)
                npc.randomize_head_blend(replaced_ped)
                npc.extra_face_features(replaced_ped)

                local x = math.random(1, 2)
                if (x == 1) then
                    outfit.wipe_outfit(replaced_ped)
                    outfit.random_golf_outfit(replaced_ped)
                elseif (x == 2) then
                    outfit.wipe_outfit(replaced_ped)
                    outfit.random_tuxedo_outfit(replaced_ped)
                end

                ai.task_wander_standard(replaced_ped, 1.0, true)
                entity.set_entity_as_mission_entity(replaced_ped, true, true)

                entities[#entities + 1] = replaced_ped
                utility.request_control(nearby_peds[i])
                entity.set_entity_as_mission_entity(nearby_peds[i], true, true)
                entity.delete_entity(nearby_peds[i])
            end
            system.wait(50)
        end
        system.wait(2000)
    end
end)


--    ____   ______ ______ _____
--   / __ \ / ____//_  __// ___/
--  / /_/ // __/    / /   \__ \ 
-- / ____// /___   / /   ___/ / 
--/_/    /_____/  /_/   /____/  
   
local spawned_pets = {}
local pet_list = {
    { 
    name = "Cat",
    species = "Cat, Shorthair",
    model = gameplay.get_hash_key("A_C_Cat_01"),
    anim_dict = "creatures@cat@amb@world_cat_sleeping_ground@base",
    anim_string = "base",
    },
    { 
    name = "Retriever",
    species = "Dog, Retriever",
    model = gameplay.get_hash_key("A_C_Retriever"),
    anim_dict = "creatures@retriever@amb@world_dog_sitting@base",
    anim_string = "base",
    },
    { 
    name = "Pug",
    species = "Dog, Pug",
    model = gameplay.get_hash_key("A_C_Pug"),
    anim_dict = "creatures@pug@amb@world_dog_sitting@base",
    anim_string = "base",
    },
    { 
    name = "Rottweiler",
    species = "Dog, Rottweiler",
    model = gameplay.get_hash_key("A_C_Rottweiler"),
    anim_dict = "creatures@rottweiler@amb@world_dog_sitting@base",
    anim_string = "base",
    },
}

fun_menu_pages["current_pets"] = menu.add_feature("Current Pets", "parent", fun_menu_pages["pets"].id)
fun_menu_pages["current_pets"].hint = "View the list of pets you spawned."

fun_menu_features["draw_pet_names_onscreen"] = menu.add_feature("Draw Pet Names Onscreen", "toggle", fun_menu_pages["pets"].id, function(feat)
    settings["draw_pet_names_onscreen"] = feat.on
end)
fun_menu_features["draw_pet_names_onscreen"].on = settings["draw_pet_names_onscreen"]

fun_menu_features["wandering_pets"] = menu.add_feature("Wandering Pets", "toggle", fun_menu_pages["pets"].id, function(feat)
    settings["wandering_pets"] = feat.on
end)
fun_menu_features["wandering_pets"].on = settings["wandering_pets"]

for k, v in ipairs(pet_list) do
    menu.add_feature("Get a " .. v.name, "action", fun_menu_pages["pets"].id, function(feat)
        local _input, pet_name = input.get("Type pet name.", "", -1, 0)
        if _input == 1 then
            return HANDLER_CONTINUE
        end
        if _input == 2 then
            return HANDLER_POP
        end

        local pet
        local model = v.model
        spawned_pets[#spawned_pets + 1] = menu.add_feature(v.name, "toggle", fun_menu_pages["current_pets"].id, function(feat)
            if feat.on then
                local anim_dict, anim_string = v.anim_dict, v.anim_string

                utility.request_model(model)
                pet = ped.create_ped(5, model, player.get_player_coords(player.player_id()) + v3(math.random(-2, 2), math.random(-2, 2), 0), 0, true, false)
                entities[#entities + 1] = pet
                entity.set_entity_god_mode(pet, true)
                utility.add_blip(pet, 442)
                utility.request_anim_dict_and_set(anim_dict, anim_string)

                while (feat.on) do
                    utility.request_control(pet)
                    if settings["wandering_pets"] then
                        ai.stop_anim_task(pet, anim_dict, anim_string, 1.0)
                        npc.entity_ai(pet, player.player_ped(), anim_dict, anim_string)
                    else
                        ai.task_play_anim(pet, anim_dict, anim_string, 8.0, 0, -1, 9, 0, false, false, false)
                    end
                    system.wait(5000)
                end
            end
        end)

        spawned_pets[#spawned_pets].hint = "Pet Name: " .. pet_name .. "\nPet Species: " .. v.species
        spawned_pets[#spawned_pets].on = true
        menu.create_thread(function()
            local key = #spawned_pets
            while spawned_pets[key].on do
                if settings["draw_pet_names_onscreen"] then
                    utility.draw_text_on_entity(pet, pet_name)
                end
                system.wait()
            end
            entity.set_entity_as_mission_entity(pet, true, true)
            entity.delete_entity(pet)
            utility.unload_anim(anim_dict, anim_string)
            streaming.set_model_as_no_longer_needed(model)
            menu.delete_feature(spawned_pets[key].id)
        end)
    end)
end

--_       __   ____     ____     __     ____ 
--| |     / /  / __ \   / __ \   / /    / __ \
--| | /| / /  / / / /  / /_/ /  / /    / / / /
--| |/ |/ /  / /_/ /  / _, _/  / /___ / /_/ / 
--|__/|__/   \____/  /_/ |_|  /_____//_____/  
fun_menu_pages["saturation_effects"] = menu.add_feature("Saturation Effects", "parent", fun_menu_pages["world_stuff"].id)

fun_menu_features["50s_gta"] = menu.add_feature("GTA in the 50s", "toggle", fun_menu_pages["saturation_effects"].id, function(feat)
    if (feat.on) then
        for region = 0, 1 do
            for frame = 0, 12 do
                timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "postfx_desaturation", 0)
            end
        end
    else
        for region = 0, 1 do
            for frame = 0, 12 do
                timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "postfx_desaturation", 1.0)
            end
        end
    end
end)

fun_menu_features["vibrant_gta"] = menu.add_feature("Vibrant GTA", "toggle", fun_menu_pages["saturation_effects"].id, function(feat)
    if (feat.on) then
        for region = 0, 1 do
            for frame = 0, 12 do
                timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "postfx_desaturation", 1.70)
            end
        end
    else
        for region = 0, 1 do
            for frame = 0, 12 do
                timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "postfx_desaturation", 1.0)
            end
        end
    end
end)

fun_menu_features["custom_saturation"] = menu.add_feature("Custom Saturation", "toggle", fun_menu_pages["saturation_effects"].id, function(feat)
    local _input, k = input.get("Type a numerical value from 0 to 255", "", 3, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        feat.on = false
        return HANDLER_POP
    end
    
    if (feat.on) then
        for region = 0, 1 do
            for frame = 0, 12 do
                timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, k, feat.value)
            end
        end
    else
        for region = 0, 1 do
            for frame = 0, 12 do
                timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "postfx_desaturation", 1.0)
            end
        end
    end
end)


local weather_type_one
local weather_type_two
fun_menu_features["weather_type_1"] = menu.add_feature("Weather Type 1", "action_value_str", fun_menu_pages["world_stuff"].id, function(feat)
    weather_type_one = feat.str_data[feat.value+1]
end):set_str_data({"CLEAR", "EXTRASUNNY", "CLOUDS", "OVERCAST", "RAIN", "CLEARING", "THUNDER", "SMOG", "FOGGY", "XMAS", "SNOWLIGHT", "BLIZZARD", "HALLOWEEN"})

fun_menu_features["weather_type_2"] = menu.add_feature("Weather Type 2", "action_value_str", fun_menu_pages["world_stuff"].id, function(feat)
    weather_type_two = feat.str_data[feat.value+1]
end):set_str_data({"CLEAR", "EXTRASUNNY", "CLOUDS", "OVERCAST", "RAIN", "CLEARING", "THUNDER", "SMOG", "FOGGY", "XMAS", "SNOWLIGHT", "BLIZZARD", "HALLOWEEN"})

fun_menu_features["weather_mix"] = menu.add_feature("Mix Weather", "action_slider", fun_menu_pages["world_stuff"].id, function(feat)
    menu.notify(gameplay.get_hash_key(weather_type_one))
    menu.notify(gameplay.get_hash_key(weather_type_two))
    natives.MISC.SET_CURR_WEATHER_STATE(gameplay.get_hash_key(weather_type_one), gameplay.get_hash_key(weather_type_two), feat.value)
end)
fun_menu_features["weather_mix"].min = 0.00
fun_menu_features["weather_mix"].max = 1.0
fun_menu_features["weather_mix"].mod = 0.05
fun_menu_features["weather_mix"].value = 0.5

fun_menu_features["aggressive_water"] = menu.add_feature("Aggressive Water", "toggle", fun_menu_pages["world_stuff"].id, function(feat)
    if (feat.on) then
        water.set_waves_intensity(40.0)
    else
        water.reset_waves_intensity()
    end
end)

fun_menu_features["asteroid_shower"] = menu.add_feature("Asteroid Shower", "toggle", fun_menu_pages["world_stuff"].id, function(feat)
    local spawned_asteroids = {}
    utility.request_model(3751297495)

    while (feat.on) do
        local asteroid = object.create_object(3751297495, player.get_player_coords(player.player_id()) + v3(math.random(-250, 250), math.random(-250, 250), math.random(120, 240)), true, true)
        utility.request_control(asteroid)
        streaming.set_model_as_no_longer_needed(3751297495)
        entity.apply_force_to_entity(asteroid, 3, math.random(-50, 50), math.random(-50, 50), -5000, 0, 0, 0, false, true)

        spawned_asteroids[#spawned_asteroids + 1] = asteroid
        entities[#entities + 1] = asteroid

        fun_menu_threads["asteroid_downforce"] = menu.create_thread(function()
            while feat.on do
                for i = 1, #spawned_asteroids do
                    entity.apply_force_to_entity(spawned_asteroids[i], 3, math.random(-50, 50), math.random(-50, 50), -5000, 0, 0, 0, false, true)
                    system.wait()
                end
            end
        end)

        for i = 1, #spawned_asteroids do
            if (natives.ENTITY.GET_ENTITY_HEIGHT_ABOVE_GROUND(spawned_asteroids[i]) < 25) then
                utility.request_control(spawned_asteroids[i])
                graphics.set_next_ptfx_asset("scr_xm_orbital")
                utility.request_ptfx("scr_xm_orbital")
                fire.add_explosion(entity.get_entity_coords(spawned_asteroids[i]) - v3(0, 0, 10), 59, true, false, 1, 0)
                graphics.start_networked_ptfx_non_looped_at_coord("scr_xm_orbital_blast", entity.get_entity_coords(spawned_asteroids[i]) - v3(0, 0, 10), v3(0, 180, 0), 10.0, true, true, true)
                
                utility.clean_up(spawned_asteroids[i])
            end
        end
        system.wait(1000)
        menu.delete_thread(fun_menu_threads["asteroid_downforce"])
    end

    if (not feat.on) then
        for i = 1, #spawned_asteroids do
            utility.request_control(spawned_asteroids[i])
            entity.set_entity_as_no_longer_needed(spawned_asteroids[i])
            entity.delete_entity(spawned_asteroids[i])
        end
        menu.delete_thread(fun_menu_threads["asteroid_downforce"])
        spawned_asteroids = {}
    end
end)

fun_menu_features["neutron_star"] = menu.add_feature("Neutron Star", "action", fun_menu_pages["world_stuff"].id, function(feat)
    for region = 0, 1 do
        for frame = 0, 12 do
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "sky_sun_col_r", 0.0)
        end
    end
end)

fun_menu_features["modify_lightning"] = menu.add_feature("Modify Lightning", "action_slider", fun_menu_pages["world_stuff"].id, function(feat)    
    if (natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME() == gameplay.get_hash_key("THUNDER") or natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME() == gameplay.get_hash_key("HALLOWEEN")) then
        for region = 0, 1 do
            for frame = 0, 12 do
                timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "vfxlightning_intensity_mult", feat.value)
            end
        end
    end
end)
fun_menu_features["modify_lightning"].min = 0.0
fun_menu_features["modify_lightning"].max = 10.0
fun_menu_features["modify_lightning"].mod = 0.5
fun_menu_features["modify_lightning"].value = 1.0

fun_menu_features["blood_moon"] = menu.add_feature("Blood Moon", "action", fun_menu_pages["world_stuff"].id, function()
    for region = 0, 1 do
        for frame = 0, 12 do
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "sky_moon_col_r", 7.45)
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "sky_moon_col_g", 2.65)
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "sky_moon_col_b", 0.5)

            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "sky_cloud_mid_col_r", 6.25)
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "sky_cloud_mid_col_g", 1.15)
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "sky_cloud_mid_col_b", 0.20)

            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "fog_moon_col_r", 15.0)
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "fog_moon_col_g", 0)
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "fog_moon_col_g", 0)

            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "sky_moon_iten", 0.0)
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, "sky_moon_scatter_inten", 10.3)
        end
    end
end)

fun_menu_features["moon_size"] = menu.add_feature("Change Moon Size", "value_str", fun_menu_pages["world_stuff"].id, function(feat)
    local moon_size, moon_influence, scatter_intensity
    local weather_hash = natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME()
    local time = utils.time_ms() + 5000

    for region = 0, 1 do
        for frame = 0, 12 do
            moon_size = timecycle.get_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_disc_size")
            moon_influence = timecycle.get_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_influence_radius")
            scatter_intensity = timecycle.get_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_scatter_inten")
        end
    end

    while feat.on do
        if time < utils.time_ms() then
            weather_hash = natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME()
            time = utils.time_ms() + 5000
        end

        if (feat.value == 0) then
            for region = 0, 1 do
                for frame = 0, 12 do
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_disc_size", 47)
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_influence_radius", 35.75)
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_scatter_inten", 35.5)
                end
            end
        elseif (feat.value == 1) then
            for region = 0, 1 do
                for frame = 0, 12 do
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_disc_size", 255)
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_influence_radius", 190.75)
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_scatter_inten", 160.5)
                end
            end
        end
        system.wait()
    end
    
    if (not feat.on) then
        for region = 0, 1 do
            for frame = 0, 12 do
                timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_disc_size", moon_size)
                timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_influence_radius", moon_influence)
                timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_moon_scatter_inten", scatter_intensity)
            end
        end
    end
end):set_str_data({"Big Moon", "Supermassive Moon"})

fun_menu_features["sun_size"] = menu.add_feature("Change Sun Size", "value_str", fun_menu_pages["world_stuff"].id, function(feat)
    local sun_size, sun_influence, scatter_intensity
    local weather_hash = natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME()
    local time = utils.time_ms() + 5000

    for region = 0, 1 do
        for frame = 0, 12 do
            sun_size = timecycle.get_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_disc_size")
            sun_influence = timecycle.get_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_influence_radius")
            scatter_intensity = timecycle.get_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_scatter_inten")
        end
    end

    while feat.on do
        if time < utils.time_ms() then
            weather_hash = natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME()
            time = utils.time_ms() + 5000
        end

        if (feat.value == 0) then
            for region = 0, 1 do
                for frame = 0, 12 do
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_disc_size", 47)
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_influence_radius", 35.75)
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_scatter_inten", 35.5)
                end
            end
        elseif (feat.value == 1) then
            for region = 0, 1 do
                for frame = 0, 12 do
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_disc_size", 255)
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_influence_radius", 225.75)
                    timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_scatter_inten", 180.5)
                end
            end
        end
        system.wait()
    end
    
    if (not feat.on) then
        for region = 0, 1 do
            for frame = 0, 12 do
                timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_disc_size", sun_size)
                timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_influence_radius", sun_influence)
                timecycle.set_timecycle_keyframe_var(weather_hash, region, frame, "sky_sun_scatter_inten", scatter_intensity)
            end
        end
    end
end):set_str_data({"Big Sun", "Supermassive Sun"})

fun_menu_features["get_current_weather"] = menu.add_feature("Get Current Weather", "action", fun_menu_pages["world_stuff"].id, function(feat)
    local weathers = {
        [gameplay.get_hash_key("CLEAR")] = "Clear",
        [gameplay.get_hash_key("NEUTRAL")] = "Neutral",
        [gameplay.get_hash_key("EXTRASUNNY")] = "Extra Sunny", 
        [gameplay.get_hash_key("CLOUDS")] = "Cloudy", 
        [gameplay.get_hash_key("OVERCAST")] = "Overcast", 
        [gameplay.get_hash_key("RAIN")] = "Rainy", 
        [gameplay.get_hash_key("CLEARING")] = "Clearing", 
        [gameplay.get_hash_key("THUNDER")] = "Thunderstorm", 
        [gameplay.get_hash_key("SMOG")] = "Polluted", 
        [gameplay.get_hash_key("FOGGY")] = "Foggy", 
        [gameplay.get_hash_key("XMAS")] = "White Christmas Snow",
        [gameplay.get_hash_key("SNOW")] = "Snowing",
        [gameplay.get_hash_key("SNOWLIGHT")] = "Lightly Snowing", 
        [gameplay.get_hash_key("BLIZZARD")] = "Blizzard", 
        [gameplay.get_hash_key("HALLOWEEN")] = "Halloween"
        
    }
    menu.notify("Current Weather Hash: " .. natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME() .. "\nCurrent Weather Name: " .. (weathers[natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME()] or "Unknown"), fun_menu_ver)
    print("Current Weather Hash: " .. natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME() .. "\nCurrent Weather Name: " .. (weathers[natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME()] or "Unknown"))
end)

fun_menu_features["modify_weather_element"] = menu.add_feature("Modify Weather Element", "action_value_f", fun_menu_pages["world_stuff"].id, function(feat)
    local _input, k = input.get("Type in a weather element to modify.", "", -1, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end
    
    for region = 0, 1 do
        for frame = 0, 12 do
            timecycle.set_timecycle_keyframe_var(natives.MISC.GET_PREV_WEATHER_TYPE_HASH_NAME(), region, frame, k, feat.value)
        end
    end
end)
fun_menu_features["modify_weather_element"].min = 0.0
fun_menu_features["modify_weather_element"].max = 255.0
fun_menu_features["modify_weather_element"].mod = 1.0
fun_menu_features["modify_weather_element"].value = 0.0

fun_menu_features["clear_weather_override"] = menu.add_feature("Clear Weather Override", "action", fun_menu_pages["world_stuff"].id, function(feat)
    gameplay.clear_override_weather()
end)

--    __  ___ ____ _____  ______ ______ __     __     ___     _   __ ______ ____   __  __ _____
--   /  |/  //  _// ___/ / ____// ____// /    / /    /   |   / | / // ____// __ \ / / / // ___/
--  / /|_/ / / /  \__ \ / /    / __/  / /    / /    / /| |  /  |/ // __/  / / / // / / / \__ \ 
-- / /  / /_/ /  ___/ // /___ / /___ / /___ / /___ / ___ | / /|  // /___ / /_/ // /_/ / ___/ / 
--/_/  /_//___/ /____/ \____//_____//_____//_____//_/  |_|/_/ |_//_____/ \____/ \____/ /____/                                                                                              
fun_menu_features["snowball_explosion"] = menu.add_feature("Snowball Explosion", "value_i", fun_menu_pages["miscellaneous"].id, function(feat)
    while feat.on do
        fire.add_explosion(player.get_player_coords(player.player_id()) - v3(0, 0, 0.5), 39, true, true, 0, player.player_id())
        system.wait(feat.value)
    end
end)
fun_menu_features["snowball_explosion"].min = 500
fun_menu_features["snowball_explosion"].max = 1000
fun_menu_features["snowball_explosion"].mod = 50
fun_menu_features["snowball_explosion"].value = 750
fun_menu_features["snowball_explosion"].hint = "Delay between snowballs in milliseconds."

fun_menu_features["rockstar_chat"] = menu.add_feature("Rockstar Chat", "action_value_str", fun_menu_pages["miscellaneous"].id, function(feat)
    local _input, k = input.get("Type to chat.", "test", -1, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    local special_icons = {
        "¦",
        "∑",
        "Ω"
    }

    network.send_chat_message(string.format(special_icons[feat.value + 1].." %s", k), false)
end)fun_menu_features["rockstar_chat"]:set_str_data({"R* Verified Icon", "R* Icon", "Lock Icon"})

-- thanks Gee-Man
fun_menu_features["minecraft_gun"] = menu.add_feature("Minecraft Gun", "value_str", fun_menu_pages["miscellaneous"].id, function(feat)
    local junk, pos,temp_block,time
    local spawned_blocks = {}
    local sandblocks = {
        "prop_mb_sandblock_01",
        "prop_mb_sandblock_02",
        "prop_mb_sandblock_03_cr",
        "prop_mb_sandblock_04",
        "prop_mb_sandblock_05_cr"
    }
    local block = gameplay.get_hash_key(sandblocks[feat.value + 1])
    local function ask_control(_ent)
        for i=1, 50 do
            if not entity.is_an_entity(_ent) then
                return false
            elseif network.has_control_of_entity(_ent) then
                return true
            else
                network.request_control_of_entity(_ent)
                system.wait(1)
            end
        end
        if entity.is_an_entity(_ent) then
            return network.has_control_of_entity(_ent)
        end
        return false
    end

    local function remove_temp()
        if temp_block ~= nil then
            ask_control(temp_block)
            entity.set_entity_as_no_longer_needed(temp_block)
            entity.delete_entity(temp_block)
            temp_block = nil
        end
    end

    while (feat.on) do
        while (feat.on) and player.is_player_free_aiming(player.player_id()) do    
            system.wait()
            if block ~= gameplay.get_hash_key(sandblocks[feat.value + 1]) then -- silly, but it allows changing the block while aiming
                remove_temp()
                block = gameplay.get_hash_key(sandblocks[feat.value + 1])
            end
            junk, pos = _GF_raycast_vector(temp_block)
            if junk then
                if temp_block == nil then
                    utility.request_model(block)
                    temp_block = object.create_object(block, pos, true, false)
                    
                    --entity.set_entity_collision(temp_block,false,false) -- just an option
                    
                    streaming.set_model_as_no_longer_needed(block)
                elseif ped.is_ped_shooting(player.player_ped()) then
                    time = utils.time_ms() + 169 
                    while player.is_player_free_aiming(player.player_id()) and time > utils.time_ms() do --to prevent multiple spawns with fast firing weapon
                        system.wait()
                    end
                    
                    --ask_control(temp_block) -- just an option
                    --entity.set_entity_collision(temp_block,true,true)  -- just an option
                    
                    spawned_blocks[#spawned_blocks + 1] = temp_block
                    temp_block = nil
                elseif ask_control(temp_block) then
                    entity.set_entity_coords_no_offset(temp_block, pos)
                end
            end
        end
        remove_temp()
        system.wait()
    end
    if (not feat.on) then
        for i = 1, #spawned_blocks do
            if ask_control(spawned_blocks[i]) then
                entity.set_entity_as_no_longer_needed(spawned_blocks[i])
                entity.delete_entity(spawned_blocks[i])        
            end
        end
        spawned_blocks = {} -- i dont think this is necessary
    end
end)fun_menu_features["minecraft_gun"]:set_str_data({"Singular", "Row of 3", "Stacked Row of 3", "Corner", "Dead-end"})

-- thanks Gee-Man
fun_menu_features["fire_aura"] = menu.add_feature("Fire Aura", "value_i", fun_menu_pages["miscellaneous"].id, function(feat)
    local nearby_peds
    local actually_nearby_peds = {}
    local already_burned = {}
    local time = utils.time_ms() - 1
    while (feat.on) do
        if time < utils.time_ms() then
            nearby_peds = ped.get_all_peds()
            actually_nearby_peds = {}
            already_burned = {}
            for i = 1, #nearby_peds do
                if not ped.is_ped_a_player(nearby_peds[i]) and player.get_player_coords(player.player_id()):magnitude(entity.get_entity_coords(nearby_peds[i])) <= feat.value then
                    actually_nearby_peds[#actually_nearby_peds+1] = nearby_peds[i]
                end
            end
            time = utils.time_ms() + 500
        end
        for i = 1, #actually_nearby_peds do
            if (entity.is_an_entity(actually_nearby_peds[i])) then
                if not entity.is_entity_on_fire(actually_nearby_peds[i]) and not entity.is_entity_dead(actually_nearby_peds[i]) and not already_burned[actually_nearby_peds[i]] and not ped.is_ped_in_any_vehicle(actually_nearby_peds[i]) then
                    fire.add_explosion(entity.get_entity_coords(actually_nearby_peds[i]), 3, false, false, 0.0, actually_nearby_peds[i])
                    already_burned[actually_nearby_peds[i]] = true
                end
            end
        end
        graphics.draw_marker(28, player.get_player_coords(player.player_id()), v3(0, 90, 0), v3(0, 90, 0), v3(feat.value, feat.value, feat.value), 0, 255, 0, 35, false, false, 2, false, nil, "MarkerTypeDebugSphere", false)
        system.wait()
    end
end)
fun_menu_features["fire_aura"].max = 100
fun_menu_features["fire_aura"].min = 5
fun_menu_features["fire_aura"].mod = 5
fun_menu_features["fire_aura"].value = 15

fun_menu_features["emp_aura"] = menu.add_feature("EMP Aura", "value_i", fun_menu_pages["miscellaneous"].id, function(feat)
    local nearby_peds
    local actually_nearby_peds = {}
    local already_burned = {}
    local time = utils.time_ms() - 1
    while (feat.on) do
        if time < utils.time_ms() then
            nearby_peds = ped.get_all_peds()
            actually_nearby_peds = {}
            already_burned = {}
            for i = 1, #nearby_peds do
                if not ped.is_ped_a_player(nearby_peds[i]) and player.get_player_coords(player.player_id()):magnitude(entity.get_entity_coords(nearby_peds[i])) <= feat.value then
                    actually_nearby_peds[#actually_nearby_peds+1] = nearby_peds[i]
                end
            end
            time = utils.time_ms() + 500
        end
        for i = 1, #actually_nearby_peds do
            if (entity.is_an_entity(actually_nearby_peds[i])) then
                if not entity.is_entity_on_fire(actually_nearby_peds[i]) and not entity.is_entity_dead(actually_nearby_peds[i]) and not already_burned[actually_nearby_peds[i]] and ped.is_ped_in_any_vehicle(actually_nearby_peds[i]) then
                    fire.add_explosion(entity.get_entity_coords(actually_nearby_peds[i]), 65, false, false, 0.0, actually_nearby_peds[i])
                    already_burned[actually_nearby_peds[i]] = true
                end
            end
        end
        graphics.draw_marker(28, player.get_player_coords(player.player_id()), v3(0, 90, 0), v3(0, 90, 0), v3(feat.value, feat.value, feat.value), 0, 255, 0, 35, false, false, 2, false, nil, "MarkerTypeDebugSphere", false)
        system.wait()
    end
    --draw_marker(Any type, v3 pos, v3 dir, v3 rot, v3 scale, int red, int green, int blue, int alpha, bool bobUpAndDown, bool faceCam, int a12, bool rotate, string|nil textureDict, string|nil textureName, bool drawOntEnts)
end)
fun_menu_features["emp_aura"].max = 100
fun_menu_features["emp_aura"].min = 5
fun_menu_features["emp_aura"].mod = 5
fun_menu_features["emp_aura"].value = 15

fun_menu_features["news"] = menu.add_feature("News", "toggle", fun_menu_pages["miscellaneous"].id, function(feat)
    local news = graphics.request_scaleform_movie("BREAKING_NEWS")

    while not graphics.has_scaleform_movie_loaded(news) do
        system.wait(0)
    end

    graphics.begin_scaleform_movie_method(news, "SET_TEXT")
    graphics.scaleform_movie_method_add_param_texture_name_string("fewqfwqefqewqweffewqfeqw")
    graphics.scaleform_movie_method_add_param_texture_name_string("You have been banned from Grand Theft Auto Online permanently.")
    graphics.end_scaleform_movie_method(news)
    while (feat.on) do
        graphics.draw_scaleform_movie_fullscreen(news, 255, 255, 255, 255, 0)
        system.wait(0)
    end
    graphics.set_scaleform_movie_as_no_longer_needed(news)
end)

fun_menu_features["become_black_hole"] = menu.add_feature("Become the Black Hole", "toggle", fun_menu_pages["miscellaneous"].id, function(feat)
	while feat.on do
        if menu.get_feature_by_hierarchy_key("local.player_options.god") ~= nil then
            menu.get_feature_by_hierarchy_key("local.player_options.god").on = true
        end
        
        local offset = player.get_player_coords(player.player_id())
        local vehicles = getAllVehiclesInPlayerRange(player.player_id(), 140)
        local myVeh = ped.get_vehicle_ped_is_using(player.player_ped())
        graphics.draw_marker(28, offset, v3(0, 90, 0), v3(0, 90, 0), v3(1.5, 1.5, 1.5), 0, 0, 0, 255, false, false, 2, false, nil, "MarkerTypeDebugSphere", false)
        for i = 1, #vehicles do
            local veh = vehicles[i]
            if veh ~= myVeh and utility.request_control(veh) then
                local vehPos = entity.get_entity_coords(veh)
                local vect = v3(offset.x, offset.y, offset.z)
                vect = vect - vehPos
                vect = vect * 0.5
                entity.apply_force_to_entity(veh, 1, vect.x, vect.y, vect.z, 0, 0, 0.5, false, true)
            end
        end
        system.wait()
	end

    if (not feat.on) then
        menu.get_feature_by_hierarchy_key("local.player_options.god").on = false
    end
end)

fun_menu_features["type_in_reverse"] = menu.add_feature("Type in Reverse", "action", fun_menu_pages["miscellaneous"].id, function(feat)
	local _input, k = input.get("Type what to say", "2take1", -1, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        feat.on = false
        return HANDLER_POP
    end

    network.send_chat_message(string.reverse(k), true)
end)

fun_menu_features["move_on_x_axis"] = menu.add_feature("Move on X Axis", "action_value_f", fun_menu_pages["miscellaneous"].id, function(feat)
	local plyr_coords = entity.get_entity_coords(player.player_ped())
    entity.set_entity_coords_no_offset(player.player_ped(), plyr_coords + v3(feat.value, 0, 0))
end)
fun_menu_features["move_on_x_axis"].min = 0.01
fun_menu_features["move_on_x_axis"].max = 0.1
fun_menu_features["move_on_x_axis"].mod = 0.01
fun_menu_features["move_on_x_axis"].value = 0.01

fun_menu_features["move_on_y_axis"] = menu.add_feature("Move on Y Axis", "action_value_f", fun_menu_pages["miscellaneous"].id, function(feat)
	local plyr_coords = entity.get_entity_coords(player.player_ped())
    entity.set_entity_coords_no_offset(player.player_ped(), plyr_coords + v3(0, feat.value, 0))
end)
fun_menu_features["move_on_y_axis"].min = 0.01
fun_menu_features["move_on_y_axis"].max = 0.1
fun_menu_features["move_on_y_axis"].mod = 0.01
fun_menu_features["move_on_y_axis"].value = 0.01

fun_menu_features["convert_rgb_bgr"] = menu.add_feature("Convert from RGB to BGR", "action", fun_menu_pages["miscellaneous"].id, function(feat)
    local _input, k = input.get("Type in a hex color code.", "ffffff", 6, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        return HANDLER_POP
    end

    menu.notify("Color set to " .. k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2), fun_menu_ver, 10, "0x"..k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))
    print(k:sub(5, 6)..k:sub(3, 4)..k:sub(1, 2))
end)



fun_menu_features["cleanup"] = menu.add_feature("Clean Up", "action", fun_menu_pages["main_menu"].id, function(feat)
	for i = 1, #blips_table do
        ui.remove_blip(blips_table[i])
    end

    for i = 1, #entities do
        utility.clean_up(entities[i])
    end

    menu.notify("Cleaned up spawned entities and blips.", fun_menu_ver)
end)
fun_menu_features["cleanup"].hint = "Cleans up every entity and blip you spawned using Fun Menu."

--    ____   __     ___ __  __ ______ ____     ______ ______ ___   ______ __  __ ____   ______ _____
--   / __ \ / /    /   |\ \/ // ____// __ \   / ____// ____//   | /_  __// / / // __ \ / ____// ___/
--  / /_/ // /    / /| | \  // __/  / /_/ /  / /_   / __/  / /| |  / /  / / / // /_/ // __/   \__ \ 
-- / ____// /___ / ___ | / // /___ / _, _/  / __/  / /___ / ___ | / /  / /_/ // _, _// /___  ___/ / 
--/_/    /_____//_/  |_|/_//_____//_/ |_|  /_/    /_____//_/  |_|/_/   \____//_/ |_|/_____/ /____/  

fun_menu_features["player_autopilot"] = menu.add_player_feature("Autopilot to Player", "toggle", fun_menu_pages["player_fun_menu"].id, function(feat, pid)
    if (not player.is_player_in_any_vehicle(player.player_id())) then
        menu.notify("You need to be in a vehicle to use this feature.", fun_menu_ver)
        feat.on = false
        return
    end

    while feat.on do
        ai.task_vehicle_drive_to_coord(player.player_ped(), ped.get_vehicle_ped_is_using(player.player_ped()), player.get_player_coords(pid), 50.0, -1, ped.get_vehicle_ped_is_using(player.player_ped()), 786859, 1, 1.0)
        system.wait(2000)
    end
end)

fun_menu_features["copy_player_outfit"] = menu.add_player_feature("Copy Player Outfit", "action", fun_menu_pages["player_fun_menu"].id, function(feat, pid)
    outfit.copy_outfit(player.get_player_ped(pid), player.player_ped())
end)
fun_menu_features["copy_player_outfit"].hint = "Similar to Steal Outfit but it does not copy hair."

fun_menu_features["player_floppa_gun"] = menu.add_player_feature("Floppa Gun", "toggle", fun_menu_pages["player_fun_menu"].id, function(feat, pid)
    if feat.on then
        utility.custom_ammo_shooter(307287994, pid)
    end
    return HANDLER_CONTINUE
end)

fun_menu_features["player_orbital_gun"] = menu.add_player_feature("Orbital Gun", "toggle", fun_menu_pages["player_fun_menu"].id, function(feat, pid)
    if feat.on then
        utility.custom_ammo_shooter(72, pid)
    end
    return HANDLER_CONTINUE
end)

fun_menu_features["player_custom_explosion_gun"] = menu.add_player_feature("Custom Explosion Gun", "toggle", fun_menu_pages["player_fun_menu"].id, function(feat, pid)
    local _input, k = input.get("Type in an explosion ID.", "12", 2, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        feat.on = false
        return HANDLER_POP
    end

    while feat.on do
        utility.custom_ammo_shooter(tonumber(k), pid)
        system.wait(0)
    end
end)

fun_menu_features["player_custom_entity_gun"] = menu.add_player_feature("Custom Entity Gun", "toggle", fun_menu_pages["player_fun_menu"].id, function(feat, pid)
    local _input, k = input.get("Type in an entity hash.", "307287994", 20, 0)
    if _input == 1 then
        return HANDLER_CONTINUE
    end
    if _input == 2 then
        feat.on = false
        return HANDLER_POP
    end

    while feat.on do
        utility.custom_ammo_shooter(tonumber(k), pid)
        system.wait(0)
    end
end)
