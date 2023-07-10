--Made by Squidbq#3331
--Credit for helping to 'RulyPancake the 5th#1345'

local file_editing = {}

local isenabled = false
local feature = {}
local firsttimeloading = true

function file_editing.write(file, text)
    if file and text then
        io.output(file)
        io.write(text)
        io.close(file)
    end
end

local file = io.open(utils.get_appdata_path("PopstarDevs", "2Take1Menu").."\\scripts\\Godmode\\Settings.ini", "r")
		for line in file:lines() do
			if string.find(line, "Shoot gods = true") then
                isenabled = true
            end
        end


local local_parent = menu.add_feature("Remove Godmode", "parent", 0)
local player_parent = menu.add_player_feature("Squids Godmode Remover", "parent", 0)

feature["Shoot gods"] = menu.add_feature("Shoot gods", "toggle", local_parent.id, function(f)
    while true do
        isenabled = f.on
        system.yield(0)
        if f.on then
            for pid = 0, 31 do
                if player.is_player_valid(pid) then
                    if pid ~= player.player_id() then
                        if entity.is_entity_a_ped(player.get_entity_player_is_aiming_at(player.player_id())) then
                            if ped.is_ped_a_player(player.get_entity_player_is_aiming_at(player.player_id())) then
                                if player.get_entity_player_is_aiming_at(player.player_id()) == player.get_player_ped(pid) then
                                    if player.is_player_god(pid) and interior.get_interior_from_entity(player.get_player_ped(pid)) == 0 then
                                        script.trigger_script_event_2(1 << pid, -1388926377, player.player_id(), -1762807505)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

menu.add_player_feature("Kill Godmode Player", "action", player_parent.id, function(f, pid)
    local model = gameplay.get_hash_key("khanjali")
    local playerpos = player.get_player_coords(pid) + v3(0, 0, 3)

    streaming.request_model(model)
    while not streaming.has_model_loaded(model) do
        streaming.request_model(model)
        system.yield(0)
    end
    
    local pos = player.get_player_coords(pid)
    local heading = player.get_player_heading(pid)
    local distance = 2
    heading = math.rad((heading - 180) * -1)
    pos.x = pos.x + (math.sin(heading) * -distance)
    pos.y = pos.y + (math.cos(heading) * -distance)

    local vehicle1 = vehicle.create_vehicle(model, pos + v3(0, 0, 3), player.get_player_heading(pid), true, false)
    local vehicle2 = vehicle.create_vehicle(model, playerpos, 0, true, false)
    local vehicle3 = vehicle.create_vehicle(model, playerpos, 0, true, false)
    local vehicle4 = vehicle.create_vehicle(model, playerpos, 0, true, false)

    network.request_control_of_entity(vehicle1)
    network.request_control_of_entity(vehicle2)
    network.request_control_of_entity(vehicle3)
    network.request_control_of_entity(vehicle4)

    entity.attach_entity_to_entity(vehicle2, vehicle1, 0, v3(0, 3, 0), v3(0, 0, -180), false, true, false, 0, true)
    entity.attach_entity_to_entity(vehicle3, vehicle1, 0, v3(0, 3, 0), v3(0, 0, -180), false, true, false, 0, true)
    entity.attach_entity_to_entity(vehicle4, vehicle1, 0, v3(0, 3, 0), v3(0, 0, -180), false, true, false, 0, true)

    entity.set_entity_visible(vehicle1, false)
    menu.notify("Cleanup in 7.5 seconds...",nil,5, 0x00FF00)
    system.wait(7500)
    menu.notify("Cleaning...",nil,5, 0x00FF00)
    entity.delete_entity(vehicle1)
    entity.delete_entity(vehicle2)
    entity.delete_entity(vehicle3)
    entity.delete_entity(vehicle4)
end)

menu.add_player_feature("Give shoot gods", "toggle", player_parent.id, function(f,pid)
    while f.on do
        system.yield(0)
        for pids = 0, 31 do
            if player.is_player_valid(pids) then
                if pids ~= pid and pids ~= player.player_id() then
                    if entity.is_entity_a_ped(player.get_entity_player_is_aiming_at(pid)) then
                        if ped.is_ped_a_player(player.get_entity_player_is_aiming_at(pid)) then
                            if player.get_entity_player_is_aiming_at(pid) == player.get_player_ped(pids) then
                                if player.is_player_god(pids) and interior.get_interior_from_entity(player.get_player_ped(pids)) == 0 then
                                    script.trigger_script_event_2(1 << pids, -1388926377, pid, -1762807505)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

menu.add_feature("Save","action",local_parent.id, function(f)
    file_editing.write(io.open(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\scripts\\Godmode\\", "") .. "\\Settings.ini", "w"), "")
    file_editing.write(io.open(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\scripts\\Godmode\\", "") .. "\\Settings.ini", "a"), "Shoot gods = "..tostring(isenabled))
    menu.notify("Config saved!",nil,5, 0x00FF00)
end)

if firsttimeloading then
    feature["Shoot gods"].on = isenabled
    firsttimeloading = false
    if isenabled then
        menu.notify("Loaded Shoot Gods!\nState: 'ON'",nil,5, 0x00FF00)
    else
        menu.notify("Loaded Shoot Gods!\nState: 'OFF'",nil,5, 0x00FF00)
    end
end