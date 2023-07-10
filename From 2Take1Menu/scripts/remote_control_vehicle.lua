
if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then 
    menu.notify("Natives trustedmode is required to run this script")
	return
end

menu.add_player_feature("control player's car", "toggle", 0, function(f, pid)
	local isSpectate = menu.get_feature_by_hierarchy_key("online.online_players.player_"..tostring(pid)..".spectate_player")
	while f.on do
		if isSpectate.on == false then
			if tostring(player.get_player_vehicle(player.player_id())) ~= tostring(player.get_player_vehicle(pid)) then
				menu.notify("you are not specating this player, enabling specate player.")
				isSpectate.on = true
			end
		end
		if player.is_player_in_any_vehicle(pid) then
			if controls.is_control_pressed(0, 32) then -- W
				while native.call(0x648EE3E7F38877DD, 0, 32):__tonumber() == 0 do
					native.call(0xC429DCEEB339E129, player.get_player_ped(pid), player.get_player_vehicle(pid), 23, 150) --VEHICLE_TEMP_ACTION
					system.wait(0)
				end
			elseif controls.is_control_pressed(0, 33) then -- S
				while native.call(0x648EE3E7F38877DD, 0, 33):__tonumber() == 0 do
					native.call(0xC429DCEEB339E129, player.get_player_ped(pid), player.get_player_vehicle(pid), 28, 150) --VEHICLE_TEMP_ACTION
					system.wait(0)
				end
			elseif controls.is_control_pressed(0, 34) then -- A
				while native.call(0x648EE3E7F38877DD, 0, 34):__tonumber() == 0 do
					native.call(0xC429DCEEB339E129, player.get_player_ped(pid), player.get_player_vehicle(pid), 7, 150) --VEHICLE_TEMP_ACTION
					system.wait(0)
				end
			elseif controls.is_control_pressed(0, 35) then -- D
				while native.call(0x648EE3E7F38877DD, 0, 35):__tonumber() == 0 do
					native.call(0xC429DCEEB339E129, player.get_player_ped(pid), player.get_player_vehicle(pid), 8, 150) --VEHICLE_TEMP_ACTION
					system.wait(0)
				end
			end
		else
			menu.notify("player is not in a vehicle")
			system.wait(1000)
		end
		system.wait()
	end
	if not f.on then
		isSpectate.on = false
	end
end)