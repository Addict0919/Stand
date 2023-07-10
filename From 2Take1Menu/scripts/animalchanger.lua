local animalmodelchanger = menu.add_feature("Animal Script", "parent")

animalmodelchanger = menu.add_feature("Change Lobby Into Animals", "action", animalmodelchanger.id, function(f)
    for pid = 0, 31 do
        script.trigger_script_event(-1178972880 , pid, {pid, 8, math.random(0, 1000), 1, 1, 1})
    end
end)

local kachow = menu.add_feature("Ka-Chow", "parent")

kachow = menu.add_feature("Crash People", "toggle", kachow.id, function(f)
    if player.is_player_in_any_vehicle(player.player_id(GetLocalPed)) then
        local jet = vehicle.get_vehicle_brand(player.get_player_vehicle(pid, GetLocalPed, false))
		natives.SET_ENTITY_PROOFS(jet, true, true, true, true, true, true, true, true)
		if pid ~= player.player_id(to_ply)  then
            local asda = player.get_player_ped(pid, to_ply)
            player.get_player_coords(pid, jet, asda.x, asda.y, asda.z + 50, false, false, false, true) 
            to_ply = to_ply +1
        else 
            if to_ply >= 32 then to_ply = 0 end
            to_ply = to_ply +1 
            local let_coords = math.random(1)
            player.get_player_coords(pid, jet, let_coords, let_coords, let_coords, false, false, false, true)
		end
			entity.set_entity_velocity(jet, v3(0, 0, 0)) -- velocity sync fuck
			entity.set_entity_rotation(jet, 0, 0, 0, 2, true) -- rotation sync fuck
			local pedpos = player.get_player_coords(pid, GetLocalPed())
			pedpos.z = pedpos.z + 10
		for i = 1, 2 do
			local s_plane = vehicle.create_vehicle(0x2062352D, player.get_player_coords(player.player_id()) + v3(5, 0, 0), 0, true, false)
			streaming.request_model(0x2062352D)
            local veha1 = vehicle.create_vehicle(pedpos, 0)
            entity.attach_entity_to_entity(veha1, jet, 0, 0, 0, 0, 5 + (2 * i), 0, 0, 0, 0, 0, 0, 1000, true,
                true, true, true, 2)
        end
        AddEntityToList("Plane: ", jet, true)
        system.wait(5000)
        for i = 1, 50 do
            entity.set_entity_coords_no_offset(jet, 252, 2815, 120, false, false, false) -- far away teleport (sync fuck)
            system.wait()
        end
    else
        system.wait("Alert | You are not in a vehicle")
		streaming.request_model(0x39D6E83F)
		local spawn_in = vehicle.create_vehicle(0x39D6E83F, player.get_player_coords(player.player_id()) + v3(5, 0, 0), 0, true, false)
		ped.set_ped_into_vehicle(player.get_player_ped(player.player_id()), spawn_in, -1)
    end
end)