local playerVeh = func.add_player_feature("Vehicle Options", "parent", 0)
local playerMalic = func.add_player_feature("Malicious Options", "parent", 0)
local playerTroll = func.add_player_feature("Trolling Options", "parent", 0)
local playerTeleport = func.add_player_feature("Teleport Options", "parent", 0)
local playerEvents = func.add_player_feature("Script Events", "parent", 0)
local playerMisc = func.add_player_feature("Miscellaneous", "parent", 0)
local playerDrops = func.add_player_feature("Drops", "parent", playerMisc.id)

func.add_player_feature("Go Ghosted To Player", "toggle", 0, function(feat, pid)
	while feat.on do
		NETWORK.SET_RELATIONSHIP_TO_PLAYER(pid, feat.on)
		system.wait(0)
	end
end)

func.add_player_feature("Send SMS", "action", 0, function(feat, pid)
	local status, msg = input.get("Input your sms", "", 100, 0)    
	if status == 0 then
		player.send_player_sms(pid, msg)
	end
end)

func.add_player_feature("Force Remove", "action", playerMalic.id, function(feat, pid)
	if pid ~= player.player_id() then
		network.force_remove_player(pid)
	end
end)

func.add_player_feature("Remove For Cheating", "action", playerMalic.id, function(feat, pid)
	if pid ~= player.player_id() then
		network.force_remove_player(pid)
		
		for i=0, 31 do	
			if player.is_player_valid(i) and i ~= pid then
				script.trigger_script_event_2(1 << i, scriptEvents.sendMessage.hash, player.player_id(), player.get_player_name(pid).." has been removed for cheating")
			end
		end
	end
end)

func.add_player_feature("Script Kick", "action", playerMalic.id, function(feat, pid)
	local sk = menu.get_feature_by_hierarchy_key("online.online_players.player_" .. pid .. ".script_kick")
	sk:toggle()
end)

func.add_player_feature("Next Gen Crash", "action", playerMalic.id, function(feat, pid)
	local Position = player.get_player_coords(pid)
    Position.x = Position.x + 5
    Position.y = Position.y + 5
    streaming.request_model(3253274834)
    if streaming.has_model_loaded(3253274834) then
        local Vehicle = vehicle.create_vehicle(3253274834, Position, Position.z, true, false)
        vehicle.set_vehicle_mod_kit_type(Vehicle, 0)
        vehicle.set_vehicle_mod(Vehicle, 0, vehicle.get_num_vehicle_mods(Vehicle, 0)-1, true)
    end
end)

func.add_player_feature("Sound Crash", "action", playerMalic.id, function(feat, pid)
	local time = utils.time_ms() + 2000
	while time > utils.time_ms() do
		local netsoundpos = player.get_player_coords(pid)
		for i = 1, 10 do
			audio.play_sound_from_coord(-1, '5s', netsoundpos, 'MP_MISSION_COUNTDOWN_SOUNDSET', true, 45, false)
		end
		system.wait(0)
	end	
end)

func.add_player_feature("Script Crash", "action", playerMalic.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.crash.hash, pid, {player.player_id(), -72614, 63007, 59027, -12012, -26996, 33398, pid})
end)

func.add_player_feature("Meanie Potato", "action", playerMalic.id, function(feat, pid)
	local hash = 1267718013
	while not streaming.has_model_loaded(hash) do
		streaming.request_model(hash)
		coroutine.yield(10)
	end
	native.call(0x977DB4641F6FC3DB, player.player_id(), hash) 
	native.call(0x239A3351AC1DA385, PLAYER.PLAYER_PED_ID(), player.get_player_coords(pid).x, player.get_player_coords(pid).y, 500, false, true, true) --SET_ENTITY_COORDS_NO_OFFSET
	
	for i = 0, 15 do
		native.call(0xB282DC6EBD803C75,PLAYER.PLAYER_PED_ID(), 4222310262, 1000, false) --GIVE_DELAYED_WEAPON_TO_PED
		native.call(0x16E42E800B472221, PLAYER.PLAYER_PED_ID()) --FORCE_PED_TO_OPEN_PARACHUTE
	end
end)

func.add_player_feature("Potatos Revenge", "action", playerMalic.id, function(feat, pid)
	if network.is_session_started() and script.get_host_of_this_script() ~= player.player_id() then
        if menu.get_feature_by_hierarchy_key("online.lobby.force_script_host") ~= nil then
            menu.get_feature_by_hierarchy_key("online.lobby.force_script_host"):toggle()
        end
    end
	system.yield(20)
	local pos1 = player.get_player_coords(pid)
	local pos2 = player.get_player_coords(pid)	
	local objecthash = gameplay.get_hash_key("prop_cd_lamp") 
	local object = object.create_object(objecthash, pos1, true, false)
		entity.set_entity_visible(object, false, 0)	
		vehicle.create_vehicle(2038858402, pos2, 0, true, false)
		system.yield(9000)
		entity.delete_entity(object)
end)

func.add_player_feature("Destroy Personal Vehicle", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.destroyPersonalVehicle.hash, pid, {pid, pid}) --destroy personal
	script.trigger_script_event(scriptEvents.vehicleKick.hash, pid, {pid, 0, 0, 0, 0, 1, pid, math.min(2147483647, gameplay.get_frame_count())}) --kickout
end)

func.add_player_feature("Godmode Be Gone", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.cameraManipulation.hash, pid, {player.player_id(), -1762807505, 0})
end)

func.add_player_feature("Vehicle Kick", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.vehicleKick.hash, pid, {pid, 0, 0, 0, 0, 1, pid, math.min(2147483647, gameplay.get_frame_count())}) --kickout
end)

func.add_player_feature("Force Into Data Breach", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.jobInvite.hash, pid, {pid, 6})
end)

func.add_player_feature("Force Into Severe Weather", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.jobInvite.hash, pid, {pid, 0})
end)

func.add_player_feature("Force Into Work Dispute", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.jobInvite.hash, pid, {pid, 7})
end)

func.add_player_feature("Force Into Loading Screen", "action", playerEvents.id, function(feat, pid)
	if pid ~= player.player_id() then
		script.trigger_script_event(scriptEvents.loadingscreen.hash, pid, {pid, 0, 32, network.network_hash_from_player(pid),
		-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0})
	end
end)

func.add_player_feature("Force Into Cayo", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.cayo.hash, pid, {player.player_id(), 1})
end)

func.add_player_feature("Force Into Cutscene", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.cutscene.hash, pid, {pid, 0, 1})
end)

func.add_player_feature("Penthouse Invite", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.penthouse.hash, player.player_id(), {0, 124, pid})
end)

func.add_player_feature("Apartment Invite", "action", playerEvents.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.apartmentInivte.hash, pid, {pid, 0})
end)

local fakeInvites = func.add_player_feature("Invalid Invites", "parent", playerEvents.id)

func.add_player_feature("Los Santos Customs Invite", "action", fakeInvites.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.fakeInvite.hash, pid, {0, 124})
end)

func.add_player_feature("Los Santos GolfClub Invite", "action", fakeInvites.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.fakeInvite.hash, pid, {0, 123})
end)

func.add_player_feature("Hookies Invite", "action", fakeInvites.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.fakeInvite.hash, pid, {0, 122})
end)

func.add_player_feature("Pitchers Invite", "action", fakeInvites.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.fakeInvite.hash, pid, {0, 120})
end)

func.add_player_feature("Vehicle Godmode", "value_str", playerVeh.id, function(feat, pid)
	while feat.on do
		if ped.is_ped_in_any_vehicle(player.get_player_ped(pid)) then
			if feat.value == 0 then
				network.request_control_of_entity(player.get_player_vehicle(pid))
				while not network.has_control_of_entity(player.get_player_vehicle(pid)) and utils.time_ms() + 10000 > utils.time_ms() do
					system.wait(0)
				end

				if network.has_control_of_entity(player.get_player_vehicle(pid)) then
					ENTITY.SET_ENTITY_PROOFS(ped.get_vehicle_ped_is_using(player.get_player_ped(pid)), true, true, true, true, true, true, true, true)
				end
			end

			if feat.value == 1 then
				network.request_control_of_entity(player.get_player_vehicle(pid))
				while not network.has_control_of_entity(player.get_player_vehicle(pid)) and utils.time_ms() + 10000 > utils.time_ms() do
					system.wait(0)
				end

				if network.has_control_of_entity(player.get_player_vehicle(pid)) then
					ENTITY.SET_ENTITY_PROOFS(ped.get_vehicle_ped_is_using(player.get_player_ped(pid)), false, false, false, false, false, false, false, false)
				end
			end
		end
	system.wait(0)
	end
end):set_str_data({"Give", "Remove"})

--func.add_player_feature("Gift Vehicle", "action", playerVeh.id, function(feat, pid)    
--	local veh = ped.get_vehicle_ped_is_using(player.get_player_ped(pid))
--	
--	if veh ~= 0 then
--		 if requestControl(veh) then
--			local pHash = network.network_hash_from_player(pid)
--			local pl_veh
--
--			decorator.decor_register("Player_Vehicle", 3)
--			decorator.decor_register("Previous_Owner", 3)
--			decorator.decor_register("Vehicle_Reward", 3)
--			decorator.decor_register("MPBitset", 3)
--			decorator.decor_register("Veh_Modded_By_Player", 3)
--
--			if entity.is_entity_visible(veh) == 1 then
--				if decorator.decor_exists_on(veh, "Player_Vehicle") == 1 then
--					decorator.decor_set_int(veh, "Player_Vehicle", pHash)
--				else
--					pl_veh = decorator.decor_get_int(veh, "Player_Vehicle")
--					decorator.decor_set_int(veh, "Player_Vehicle", pHash)
--				end
--				if pl_veh and pl_veh ~= -1 then
--					decorator.decor_set_int(veh, "Previous_Owner", pl_veh)
--				end
--			end
--
--			if decorator.decor_exists_on(veh, "Vehicle_Reward") == 0 then
--				decorator.decor_set_bool(veh, "Vehicle_Reward", true)
--				decorator.decor_set_int(veh, "Vehicle_Reward", pHash)
--			end
--
--			local veh_modd = decorator.decor_get_int(veh, "Veh_Modded_By_Player")
--			
--			if veh_modd ~= 0 and veh_modd ~= -1 then
--				decorator.decor_set_int(veh, "Veh_Modded_By_Player", -1)
--			end
--			func.notification("Gained control")
--		else
--			func.notification("Failed To Gain control")
--		 end
--	end
--end)
---------

func.add_player_feature("Give Bounty", "action", playerMisc.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.bounty, pid, {69, pid, 1, 10000, 0, 1,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, script.get_global_i(1920255 + 9), script.get_global_i(1920255 + 10)})
end)

local wanted = func.add_player_feature("Give Wanted", "action_value_i", playerMisc.id, function(feat, pid)    
	PLAYER.SET_PLAYER_WANTED_LEVEL(pid, feat.value)
end)
wanted.min = 0
wanted.max = 5
wanted.value = 1

func.add_player_feature("Trick Or Treat", "action", playerMisc.id, function(f, pid)
	script.trigger_script_event(scriptEvents.peyote.hash , pid, {pid, 8, -5, 1, 1, 1}) 
end)

func.add_player_feature("Send Mugger", "action", playerMisc.id, function(f, pid)
	script.set_global_i(globals["mugger"] + 1 + (player.player_id() * 834) + 141, pid)
	script.set_global_i(globals["mugger"] + 1 + (player.player_id() * 834) + 140, 0)
end)

func.add_player_feature("Copy player to spoof profile", "action", playerMisc.id, function(f, pid)
	savePlayerToSpoofer(pid)
end)

-----------

func.add_player_feature("Spawn Ped", "action_value_str", playerDrops.id, function(feat, pid)
	SpawnPed(feat.value, 100, pid)
end):set_str_data(pedList)

func.add_player_feature("Create Pickup", "action_value_str", playerDrops.id, function(f, pid)
	local pos = player.get_player_coords(pid)
	OBJECT.CREATE_AMBIENT_PICKUP(gameplay.get_hash_key(pickups[f.value+1]), pos.x, pos.y, pos.z, 1, 1, 528555233, false, true)
end):set_str_data(pickups)

func.add_player_feature("Rain Object", "value_str", playerDrops.id, function(feat, pid)
	streaming.request_model(gameplay.get_hash_key(objects[feat.value+1]))
	if streaming.has_model_loaded(gameplay.get_hash_key(objects[feat.value+1])) then
		while feat.on do
				if player.is_player_valid(pid) then
					local bags = object.create_object(gameplay.get_hash_key(objects[feat.value+1]), player.get_player_coords(pid), true, true)
					entity.set_entity_no_collsion_entity(bags, player.get_player_ped(pid), false)
					entity.set_entity_heading(bags, player.get_player_heading(pid))
					entity.set_entity_coords_no_offset(bags, player.get_player_coords(pid))
				end
			system.wait(40)
		end
	end	
end):set_str_data(objects)

func.add_player_feature("Rank up", "action", playerDrops.id, function(f, pid)
	func.notification("I cant garuntee the saftey of this")
	for i = 0, 9 do
		script.trigger_script_event(scriptEvents.peyote.hash, pid, {pid, 0, i, 1, 1, 1})
		script.trigger_script_event(scriptEvents.peyote.hash, pid, {pid, 1, i, 1, 1, 1})
		script.trigger_script_event(scriptEvents.peyote.hash, pid, {pid, 3, i, 1, 1, 1})
		script.trigger_script_event(scriptEvents.peyote.hash, pid, {pid, 10, i, 1, 1, 1})
	end
end)

func.add_player_feature("RP Drop", "toggle", playerDrops.id, function(feat, pid)
	streaming.request_model(1025210927)
	while feat.on do	
		if streaming.has_model_loaded(1025210927) then
			native.call(0x673966A0C0FD7171, 0x2C014CA6, player.get_player_coords(pid), 0, 1, 1025210927, 0, 1)
		end
		system.wait(5)
	end		
end)

func.add_player_feature("Fake Money Bag Drop", "toggle", playerTroll.id, function(feat, pid)
	streaming.request_model(gameplay.get_hash_key("prop_money_bag_01"))		
	while feat.on do
		local bags = object.create_object(gameplay.get_hash_key("prop_money_bag_01"), player.get_player_coords(pid), true, true)
		entity.set_entity_no_collsion_entity(bags, player.get_player_ped(pid), false)
			entity.set_entity_coords_no_offset(bags, player.get_player_coords(pid))
			entity.set_entity_heading(bags, player.get_player_heading(pid))
		system.wait(40)
	end		
end)

func.add_player_feature("Fake Money Drop", "toggle", playerTroll.id, function(feat, pid)
	streaming.request_model(gameplay.get_hash_key("bkr_prop_scrunched_moneypage"))		
	local bags = object.create_object(gameplay.get_hash_key("bkr_prop_scrunched_moneypage"), player.get_player_coords(pid), true, true)
	entity.set_entity_no_collsion_entity(bags, player.get_player_ped(pid), false)
	while feat.on do
			entity.set_entity_coords_no_offset(bags, player.get_player_coords(pid))
			entity.set_entity_heading(bags, player.get_player_heading(pid))
		system.wait(10)
	end		
end)

func.add_player_feature("Cage", "action", playerTroll.id, function(feat, pid)
	if NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) then
		if ped.is_ped_in_any_vehicle(player.get_player_ped(pid)) then
			ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
		end
		object.create_object(2718056036, player.get_player_coords(pid), true, false)
	end
end)

func.add_player_feature("Kinetic Emp", "action", playerTroll.id, function(feat, pid)
	createExplosion(63, player.get_player_coords(pid))
end)

func.add_player_feature("Water Jet", "action", playerTroll.id, function(feat, pid)
	createExplosion(13, player.get_player_coords(pid))
end)

func.add_player_feature("Fire Jet", "action", playerTroll.id, function(feat, pid)
	createExplosion(12, player.get_player_coords(pid))
end)

func.add_player_feature("Steam Jet", "action", playerTroll.id, function(feat, pid)
	createExplosion(11, player.get_player_coords(pid))
end)

func.add_player_feature("Cash Removed ", "action", playerTroll.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.message.hash, pid, {pid, -290070531, 2147483647}) --cash removed
end)

func.add_player_feature("Cash Stolen", "action", playerTroll.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.message.hash, pid, {pid, -1640162684, 2147483647}) --cash removed
end)

func.add_player_feature("Cash banked", "action", playerTroll.id, function(feat, pid)
	script.trigger_script_event(scriptEvents.message.hash, pid, {pid, -849958015, 2147483647}) --cash banked
end)
-------

func.add_player_feature("Teleport To Player", "action", playerTeleport.id, function(feat, pid)
	entity.set_entity_coords_no_offset(PLAYER.PLAYER_PED_ID(), player.get_player_coords(pid))		
end)

local function teleportVehicle(pid, pos)
	local targetPed = player.get_player_ped(pid)
	if not ped.is_ped_in_any_vehicle(targetPed, false) then
		return
	end
	local vehicle = ped.get_vehicle_ped_is_using(targetPed, false)
	if requestControl(vehicle) then
		entity.set_entity_coords_no_offset(vehicle, pos)
	end
end

--func.add_player_feature("Teleport Player To Me", "action", playerTeleport.id, function(feat, pid)
--	if pid ~= player.player_id() then
--		script.trigger_script_event(pid, -555356783, {pid, 1, 32, network.network_hash_from_player(pid), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1})
--		
--		system.wait(2000)
--		
--		teleportVehicle(player.get_player_ped(pid), player.get_player_coords(player.player_id()))
--	end
--end)

func.add_player_feature("Teleport Peds To Player", "action", playerTeleport.id, function(feat, pid)
    local peds = ped.get_all_peds()
    local myped = player.get_player_ped(player.player_id())
    for i=1, #peds do
        if peds[i] ~= myped then
            entity.set_entity_coords_no_offset(peds[i], player.get_player_coords(pid))
        end
    end
end)

func.add_player_feature("Teleport Vehicles To Player", "action", playerTeleport.id, function(feat, pid)
    local vehs = vehicle.get_all_vehicles()
    local myvehicle =  ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
    for i=1, #vehs do
        if myvehicle ~= nil then
            if vehs[i] ~= myvehicle then
                entity.set_entity_coords_no_offset(vehs[i], player.get_player_coords(pid))
            end
        end
    end
end)