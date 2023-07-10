require("this_is_needed\\natives")

-- Globals for Fun Menu
utility = {}
blips_table = {}

function utility.get_distance_between_coords(pos1, pos2)
    distance = math.sqrt((pos1.x - pos2.x)^2 + (pos1.y - pos2.y)^2 + (pos1.z - pos2.z)^2)
    return distance
end

function utility.add_blip(blipped_entity, blip_id)
    blips_table[#blips_table + 1] = ui.add_blip_for_entity(blipped_entity)
    ui.set_blip_sprite(blips_table[#blips_table], blip_id)
    return blips_table[#blips_table]
end

function utility.unload_anim(anim_dict, anim_set)
    return streaming.remove_anim_dict(anim_dict), streaming.remove_anim_set(anim_set)
end

-- provided by kektram
function utility.request_anim_set(anim_set)
    local time <const> = utils.time_ms() + 500
    streaming.request_anim_set(anim_set)
    while time > utils.time_ms() and not streaming.has_anim_set_loaded(anim_set) do
        system.yield(0)
    end
    return streaming.has_anim_set_loaded(anim_set)
end

function utility.request_anim_dict_and_set(anim_dict, anim_set)
    local time <const> = utils.time_ms() + 500
    streaming.request_anim_dict(anim_dict)
    streaming.request_anim_set(anim_set)
    while time > utils.time_ms() and not streaming.has_anim_set_loaded(anim_set) and not streaming.has_anim_dict_loaded(anim_dict) do
        system.yield(0)
    end
    return streaming.has_anim_dict_loaded(anim_dict), streaming.has_anim_set_loaded(anim_set)
end

function utility.request_model(model)
    local time <const> = utils.time_ms() + 500
    streaming.request_model(model)
    while time > utils.time_ms() and not streaming.has_model_loaded(model) do
        system.yield(0)
    end
    return streaming.has_model_loaded(model)
end

function utility.request_ptfx(ptfx_asset)
    local time <const> = utils.time_ms() + 500
    graphics.set_next_ptfx_asset(ptfx_asset)
    graphics.request_named_ptfx_asset(ptfx_asset)
    while time > utils.time_ms() and not graphics.has_named_ptfx_asset_loaded(ptfx_asset) do
        system.yield(0)
    end
    return graphics.has_named_ptfx_asset_loaded(ptfx_asset)
end

-- provided by ERR_NET_ARRAY
function utility.custom_ammo_shooter(model_hash, pid)
    if ped.is_ped_shooting(player.get_player_ped(pid)) then
        local junk, pos = ped.get_ped_last_weapon_impact(player.get_player_ped(pid))
        if (model_hash <= 72) then
            fire.add_explosion(pos, model_hash, true, false, 0, pid)
        elseif (streaming.is_model_a_ped(model_hash)) then
            requestModel(model_hash)
            local _ped = ped.create_ped(1, model_hash, pos, 0, true, false)
            streaming.set_model_as_no_longer_needed(model_hash)
        elseif (streaming.is_model_an_object(model_hash)) then
            requestModel(model_hash)
            object.create_object(model_hash, pos, true, false)
            streaming.set_model_as_no_longer_needed(model_hash)
        end
    end
end

-- From 2take1Script functions
function utility.request_control(entity_model, time)
    if (entity.is_an_entity(entity_model)) then
        if (not network.has_control_of_entity(entity_model)) then
            network.request_control_of_entity(entity_model)
            time = time or 50
            local new_time = utils.time_ms() + time

            while (entity.is_an_entity(entity_model) and not network.has_control_of_entity(entity_model)) do
                system.wait(0)
                network.request_control_of_entity(entity_model)

                if (new_time < utils.time_ms()) then
                    return false
                end
            end
        end
        return network.has_control_of_entity(entity_model)
    end
    return false
end

function utility.request_control_no_delay(entity_model, time)
    if (entity.is_an_entity(entity_model)) then
        if (not network.has_control_of_entity(entity_model)) then
            network.request_control_of_entity(entity_model)
        end
        return network.has_control_of_entity(entity_model)
    end
    return false
end

-- From gif.lua
function utility.rgb_to_int(r, g, b, a)
    a = a or 255
    return ((r&0x0ff) << 0x00) | ((g&0x0ff) << 0x08) | ((b&0x0ff) << 0x10) | ((a&0x0ff) << 0x18)
end

-- Provided by Gee-Man
function _GF_raycast_vector(_ign_ent)
    _ign_ent = _ign_ent or 0
    local target = 17 -- use the website to determine different targets using bitshift
    local pos = player.get_player_coords(player.player_id())
    local my_pos = pos
    local my_rot = cam.get_gameplay_cam_rot()

    if player.is_player_in_any_vehicle(player.player_id()) then
        my_pos = entity.get_entity_coords(player.get_player_vehicle(player.player_id())) + v3(0, 0, 2)
        pos = entity.get_entity_coords(player.get_player_vehicle(player.player_id()))
    end

    my_rot:transformRotToDir()
    my_rot = my_rot * 1000
    pos = pos + my_rot 
    local hit, ray_pos, ray_surf, ray_mat, ray_ent = worldprobe.raycast(my_pos ,pos, target, _ign_ent)
    local time = utils.time_ms() + 100

    while not hit and time > utils.time_ms() do
        system.yield(10)
        pos = player.get_player_coords(player.player_id())
        my_pos = pos
        if player.is_player_in_any_vehicle(player.player_id()) then
            my_pos = entity.get_entity_coords(player.get_player_vehicle(player.player_id())) + v3(0, 0, 2)
            pos = entity.get_entity_coords(player.get_player_vehicle(player.player_id()))
        end
        my_rot = cam.get_gameplay_cam_rot()
        my_rot:transformRotToDir()
        my_rot = my_rot * 1000
        pos = pos + my_rot 
        hit, ray_pos, ray_surf, ray_mat, ray_ent = worldprobe.raycast(my_pos, pos, target, _ign_ent)
    end
    return hit, ray_pos
end

-- Provided by Proddy
function getOffsetFromCam(distance)
	local pos = player.get_player_coords(player.player_id())
	local rot = cam.get_gameplay_cam_rot()
	rot:transformRotToDir()
	rot = rot * distance
	return pos + rot
end

function getAllVehiclesInPlayerRange(pid, range)
	local returnVal = {}
	local vehicles = vehicle.get_all_vehicles()
	local pos = player.get_player_coords(pid)
	for i = 1, #vehicles do
		local veh = vehicles[i]
		if entity.get_entity_coords(veh):magnitude(pos) <= range then
			returnVal[#returnVal + 1] = veh
		end
	end
	return returnVal
end

function getAllPedsInPlayerRange(pid, range)
	local returnVal = {}
	local peds = ped.get_all_peds()
	local pos = player.get_player_coords(pid)
	for i = 1, #peds do
		local _ped = peds[i]
		if entity.get_entity_coords(_ped):magnitude(pos) <= range then
			returnVal[#returnVal + 1] = _ped
		end
	end
	return returnVal
end

-- Absolutely skidded from noob#9000
function utility.rainbow(speed)
	speed = speed * 0.25
	local time = utils.time_ms() / 1000
	local r = math.floor(math.sin(time * speed + 0) * 127 + 128)
	local g = math.floor(math.sin(time * speed + 2) * 127 + 128)
	local b = math.floor(math.sin(time * speed + 4) * 127 + 128)
	return r, g, b
end

function requestControlOnce(ent)
	if network.has_control_of_entity(ent) then
		return true
	end
	
	network.request_control_of_entity(ent)
	system.wait(0)
	return network.has_control_of_entity(ent)
end

function utility.hex_to_rgb(hex)
    hex = hex:gsub("#","")
    r = tonumber("0x"..hex:sub(1, 2))
    g = tonumber("0x"..hex:sub(3, 4))
    g = tonumber("0x"..hex:sub(5, 6))
    return r, g, b
end

function utility.hex_to_rgba(hex)
    hex = hex:gsub("#","")
    r = tonumber("0x"..hex:sub(1, 2))
    g = tonumber("0x"..hex:sub(3, 4))
    b = tonumber("0x"..hex:sub(5, 6))
    a = hex:sub(8, 10)
    return r, g, b, a
end

local allowed_models = {
    [gameplay.get_hash_key("mp_m_freemode_01")] = true,
    [gameplay.get_hash_key("mp_f_freemode_01")] = true
}

function utility.check_player_validity(pid)
    pid = pid or player.player_id()
    return player.is_player_valid(pid) and allowed_models[player.get_player_model(pid)]
end

function utility.get_free_seats(veh, all_free_seats)
    local seats, seat = {}, nil
    local seat_count = vehicle.get_vehicle_model_number_of_seats(entity.get_entity_model_hash(veh))
    for seat_index = -1, (seat_count - 2) do
        if (natives.VEHICLE.IS_VEHICLE_SEAT_FREE(veh, seat_index, true)) then       
            if seat == nil then
                seat = seat_index
            end
            seats[#seats + 1] = seat_index
        end
    end
    if all_free_seats then
        return seats
    end
    return seat
end

function utility.draw_text_on_entity(ent, text)
    if (not entity.is_an_entity(ent)) then
        menu.notify("Not a valid entity.")
    end

    local player_pos = player.get_player_coords(player.player_id())
    local entity_pos = entity.get_entity_coords(ent)
    local minimum, maximum = entity.get_entity_model_dimensions(ent)
    local b1, s1

    if (maximum ~= nil) then
        b1, s1 = graphics.project_3d_coord_rel(entity_pos + v3(0, 0, maximum.z))
    end

    if (entity.is_entity_visible(ent) or utility.get_distance_between_coords(player_pos, entity_pos) < 500) then
        if b1 == true then
            scriptdraw.draw_text(text, s1, v2(), 1.0, utility.rgb_to_int(255, 255, 255, 255), eDrawTextFlags.TEXTFLAG_CENTER, 5)
        end
    end
end

-- Thanks Gee-Man
function utility.yield(feat, wait_time)
    local time  = utils.time_ms() + wait_time
    while time > utils.time_ms() and feat.on do
        system.wait()
    end
end

function utility.clean_up(ent)
    if ent and entity.is_an_entity(ent) then
        local cleanup_thread = menu.create_thread(function()
            utility.request_control(ent)
            entity.set_entity_as_mission_entity(ent, true, true)
            entity.delete_entity(ent)
        end)
    end
end

function utility.is_entity_valid(ent)
    return (ent and entity.is_an_entity(ent) and not entity.is_entity_dead(ent))
end

return utility