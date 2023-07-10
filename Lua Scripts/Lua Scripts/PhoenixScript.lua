util.require_natives("natives-1640181023")
local resource_dir = filesystem.resources_dir()
if not filesystem.exists(resource_dir) then
	util.toast("resource directory not found. notification system will be less of a bruh")
else
	util.register_file(resource_dir .. "bruhzowski.ytd")
end

local version = 16


local colors = {
green = 184,
red = 6,
yellow = 190,
black = 2,
white = 1,
gray = 3,
pink = 201,
purple = 49,
blue = 11
}

function notification(message, color)
	HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)
	local picture
	if not filesystem.exists(resource_dir) then
		picture = "CHAR_SOCIAL_CLUB"
	else
		picture = "bruhzowski"
	end
	GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 1)
	while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
		util.yield()
	end
	util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
	if color == colors.green or color == colors.red then
		subtitle = "~u~Notification"
	elseif color == colors.black then
		subtitle = "~c~Notification"
	else
		subtitle = "~u~Notification"
	end
	HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, "Mike", true, 4, "PhoenixScript", subtitle)

	HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)
	util.log(message)
end

local function v3(x, y, z)
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if z == nil then z = 0 end
end

local function RequestControlOfEnt(entity)
	local tick = 0
	local tries = 0
	NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
	while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick <= 1000 do
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
		tick = tick + 1
		tries = tries + 1
		if tries == 50 then 
			util.yield()
			tries = 0
		end
	end
	return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity)
end

local function do_fade_in(pid) 
    CAM.DO_SCREEN_FADE_OUT(500)
    util.yield(500)
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " on")
    orbital_cannon_effects(true)
    util.yield(1000)
    CAM.DO_SCREEN_FADE_IN(1000)
    waiting = false
end
local function do_fade_out(pid)
    util.yield(2500)
    CAM.DO_SCREEN_FADE_OUT(1000)
    util.yield(1000)
    orbital_cannon_effects(false)
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off;nightvision off")
    util.yield(1000)
    CAM.DO_SCREEN_FADE_IN(1000)
    waiting = false
end
function orbital_cannon_effects(on)
    if on then
        menu.trigger_commands("becomeorbitalcannon on;nightvision on;fov 130")
    else 
        menu.trigger_commands("becomeorbitalcannon off;fov 0;nightvision off")
    end
end
local function orbital(pid) 
    for i = 0, 30 do 
        pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        for j = -2, 2 do 
            for k = -2, 2 do 
                local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x + j, pos.y + j, pos.z + (30 - i), 29, 999999.99, true, false, 8)
            end
        end
        util.yield(20)
    end
end

cages = {}
local function cage_player(pos)
	local object_hash = util.joaat("prop_gold_cont_01b")
	pos.z = pos.z-0.9
	
	STREAMING.REQUEST_MODEL(object_hash)
	while not STREAMING.HAS_MODEL_LOADED(object_hash) do
		util.yield()
	end
	local object1 = OBJECT.CREATE_OBJECT(object_hash, pos.x, pos.y, pos.z, true, true, true)
	cages[#cages + 1] = object1																			

	local object2 = OBJECT.CREATE_OBJECT(object_hash, pos.x, pos.y, pos.z, true, true, true)
	cages[#cages + 1] = object2
	
	if object1 == 0 or object2 ==0 then
		notification("Something Went Wrong Creating Cages", colors.red)
	end
	ENTITY.FREEZE_ENTITY_POSITION(object1, true)
	ENTITY.FREEZE_ENTITY_POSITION(object2, true)
	local rot  = ENTITY.GET_ENTITY_ROTATION(object2)
	rot.x = -180
	rot.y = -180
	ENTITY.SET_ENTITY_ROTATION(object2, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(object_hash)
end


local function for_table_do(table,with_access,func)
	for i,ent in ipairs(table) do
		if with_access then
			if not RequestControlOfEnt(ent) then goto skip end
		end
		func(ent)
		::skip::
	end
end


local function get_player_veh(pid,with_access)
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)	
	if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
		local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
		if not with_access then
			return vehicle
		end
		if RequestControlOfEnt(vehicle) then
			return vehicle
		end
	end
	return 0
end

local function tp_veh_to(pid,x,y,z)
	local tries = 0
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
		local vehicle = get_player_veh(pid,false)	
		while tries <= 1000 do
			if RequestControlOfEnt(vehicle) then			
				ENTITY.SET_ENTITY_COORDS_NO_OFFSET(vehicle, x, y, z, 0, 0, 1);
				tries = tries + 1
			end
		end
	end
end

local function upgrade_vehicle(player)
	local vehicle = get_player_veh(player,true)
	if vehicle then
		DECORATOR.DECOR_SET_INT(vehicle, "MPBitset", 0)
		VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
		for i = 0 ,50 do
			VEHICLE.SET_VEHICLE_MOD(vehicle, i, VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, i) - 1, false)
		end	
		VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0)
		VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle,0, 0, 0)
		VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 22, true)
		VEHICLE._SET_VEHICLE_XENON_LIGHTS_COLOR(vehicle, 10)
		VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 18, true)
		VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 20, true)
		for i = 0 ,4 do
			if not VEHICLE._IS_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i) then
				VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, true)
			end
		end
		VEHICLE._SET_VEHICLE_NEON_LIGHTS_COLOUR(vehicle, 255, 0, 255)
		VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "727")
	end
end

local function launch_vehicle(pid)
	local vehicle = get_player_veh(pid,true)
	if vehicle then
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, 10000, true, false, true)
	end
end

local function northp_vehicle(pid)
	local vehicle = get_player_veh(pid,true)
	if vehicle then
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 10000, 0, true, false, true)
	end
end

local function send_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
end

util.toast("2")
drift = false
function drift(toggle)

	if drift then
		while true do
			local veh = entities.get_user_vehicle_as_handle()
			if veh then
				if PAD.IS_CONTROL_PRESSED(1, 61) then
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, true)
				else
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, false)
				end
			end        
			util.yield()
		end
	end
end

selectedplayer = {}
for b = 0, 31 do
    selectedplayer[b] = false
end
excludeselected = false

cmd_id = {}
for i = 0, 31 do
	cmd_id[i] = 0
end

local chaos, gravity, speed = false, true, 100

	menu.action(menu.my_root(), "Bring me to the player list", {}, "", function()
		menu.trigger_commands("playerlist")
	end)

	custselc = menu.list(menu.my_root(), "Custom Selection", {}, "", function(); end)

	menu.toggle(custselc, "Exclude Selected", {}, "", function(on_toggle)
		if on_toggle then
			excludeselected = true
		else
			excludeselected = false
		end
	end)

	menu.divider(custselc, "Actions")

	menu.action(custselc, "Kick", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                    menu.trigger_commands("kick " .. PLAYER.GET_PLAYER_NAME(pids))
					util.yield()
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                    menu.trigger_commands("kick " .. PLAYER.GET_PLAYER_NAME(pids))
					util.yield()
				end
			end
		end
	end)

	menu.action(custselc, "Ban Voice Chat", {}, "May lag your game when in progress", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					for i = 1, 30 do
						menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pids))
						menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pids))
						util.yield()
					end
					notification("Ban Voice Chat has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					for i = 1, 30 do
						menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pids))
						menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pids))
						util.yield()
					end
					notification("Ban Voice Chat has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			end
		end
	end)


	menu.action(custselc, "Block Passive", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                    send_script_event(1114091621, pids, {pids, 1})
                    send_script_event(1859990871, pids, {pids, 1})
					util.yield()
					notification("Block Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                    send_script_event(1114091621, pids, {pids, 1})
                    send_script_event(1859990871, pids, {pids, 1})
					util.yield()
					notification("Block Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			end
		end
	end)
    menu.action(custselc, "Unblock Passive", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                    send_script_event(1114091621, pids, {pids, 0})
                    send_script_event(2033772643, pids, {pids, 0})
					util.yield()
					notification("Unblock Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                    send_script_event(1114091621, pids, {pids, 0})
                    send_script_event(2033772643, pids, {pids, 0})
					util.yield()
					notification("Unblock Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			end
		end
	end)


	menu.action(custselc, "Vehicle Kick", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
					menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
					menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			end
		end
	end)


	menu.action(custselc, "CEO Ban", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("ceoban" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("CEO Ban has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("ceoban" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("CEO Ban has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			end
		end
	end)

	menu.action(custselc, "Crash", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("crash" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("SE Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("crash" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("SE Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.black)
				end
			end
		end
	end)

	menu.divider(custselc, "Players")

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

	util.toast("3")
	protex = menu.list(menu.my_root(), "Protections", {}, "", function(); end)
	
	menu.action(protex, "Force Stop all sound events", {"stopsounds"}, "", function()
		for i=-1,100 do
			AUDIO.STOP_SOUND(i)
			AUDIO.RELEASE_SOUND_ID(i)
		end
	end)

	menu.action(protex, "Remove Attachments", {"remove attachments"}, "Cleans your ped of all attachments by regenerating it", function()
		notification("Removing Attachments", colors.black)
		if PED.IS_PED_MALE(PLAYER.PLAYER_PED_ID()) then
			menu.trigger_commands("mpmale")
		else
			menu.trigger_commands("mpfemale")
		end
	
	end)

	menu.click_slider(protex,"Clear Entities", {"clearentities", "clearworld"}, "1 = peds, 2 = vehicles, 3 = objects, 4 = pickups, 5 = all \n note that this excludes players and their vehicles", 1, 5, 1, 1, function(on_change)
		if on_change == 1 then
			local count = 0
			for k,ent in pairs(entities.get_all_peds_as_handles()) do
				if not PED.IS_PED_A_PLAYER(ent) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end
			notification(count .. " Peds have been yeeted", colors.green)
		end
		if on_change == 2 then
			local count = 0
			for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
				local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
				if not PED.IS_PED_A_PLAYER(PedInSeat) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end
			notification(count .. " vehicles have been yeeted", colors.green)
			return
		end
		if on_change == 3 then
			local count = 0
			for k,ent in pairs(entities.get_all_objects_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			notification(count .. " objects have been yeeted", colors.green)
			return
		end
		if on_change == 4 then
			local count = 0
			for k, ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			notification(count .. " pickups have been yeeted", colors.green)
			return
		end
		if on_change == 5 then
			local count = 0
			for k, ent in pairs(entities.get_all_peds_as_handles()) do
				if not PED.IS_PED_A_PLAYER(ent) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end

			for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
				local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
				if not PED.IS_PED_A_PLAYER(PedInSeat) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end

			for k,ent in pairs(entities.get_all_objects_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
		


			for k,ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			notification(count .. " entities have been yeeted", colors.green)
			return
		end
	end)

	menu.action(protex, "Super cleanse", {"cleanseworld"}, "Attempt to yeet every single entity without exception. Not recommended", function(on_click)
		local ct = 0
		notification("World is being purified", colors.black)
		for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
			entities.delete_by_handle(ent)

			ct = ct + 1
		end
		util.toast("yeeted all vehicles")
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not PED.IS_PED_A_PLAYER(ent) then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)

			end
			ct = ct + 1
		end
		util.toast("yeeted all peds")
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			if ent ~= PLAYER.PLAYER_PED_ID() then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				ct = ct + 1
			end
		end
		util.toast("yeeted all objects")
		notification("Purification complete, yeeted " .. ct .. " entities", colors.black)
	end)

	menu.divider(protex, "Crash Protections")
	
	
	menu.toggle(protex, "Toggle Block all Network Events", {}, "This breaks the game, so only leave it on if you are worried about an incoming modder attack", function(on_toggle)
		local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
		local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
		if on_toggle then
			menu.trigger_command(BlockNetEvents)
			notification("Toggling block all network events on... stay safe homie", colors.green)
		else
			menu.trigger_command(UnblockNetEvents)
			notification("toggling block all network events off...", colors.red)
		end
	end)


	menu.toggle(protex, "Toggle Block all Incoming Syncs", {}, "This breaks the game, so only leave it on if you are worried about an incoming modder attack", function(on_toggle)
		local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
		local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
		if on_toggle then
			menu.trigger_command(BlockIncSyncs)
			notification("Toggling block all incoming syncs on... stay safe homie", colors.green)
		else
			menu.trigger_command(UnblockIncSyncs)
			notification("toggling block all incoming syncs off...", colors.red)
		end
	end)

	menu.toggle(protex, "Toggle Block all Outgoing Syncs", {}, "This breaks the game, and other players will not receive any updates from your client", function(on_toggle)
		if on_toggle then
			notification("Toggling block all outgoing syncs on", colors.green)
			menu.trigger_commands("desyncall on")
		else
			notification("Toggling block all outgoing syncs off", colors.red)
			menu.trigger_commands("desyncall off")
		end
	end)

	menu.toggle(protex, "Toggle Anticrashcam", {"acc"}, "Put this here for redundancy", function(on_toggle)
		if on_toggle then
			notification("Toggling anticrashcam... stay safe homie", colors.green)
			menu.trigger_commands("anticrashcam on")
			menu.trigger_commands("potatomode on")
		else
			notification("Toggling anticrashcam off...", colors.red)
			menu.trigger_commands("anticrashcam off")
			menu.trigger_commands("potatomode off")
		end
	end)



	menu.toggle(protex, "Toggle Panic Mode", {"panic"}, "This will render you basically uncrashable at the cost of disrupting all gameplay", function(on_toggle)
		local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
		local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
		local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
		local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
		if on_toggle then
			notification("toggling panic mode on... stay safe homie", colors.green)
			menu.trigger_commands("desyncall on")
			menu.trigger_command(BlockIncSyncs)
			menu.trigger_command(BlockNetEvents)
			menu.trigger_commands("anticrashcamera on")
		else
			notification("toggling panic mode off...", colors.red)
			menu.trigger_commands("desyncall off")
			menu.trigger_command(UnblockIncSyncs)
			menu.trigger_command(UnblockNetEvents)
			menu.trigger_commands("anticrashcamera off")
		end
	end)

	menu.divider(protex, "Modder Detections")
	menu.action(protex,"Check Stats", {"check stats"}, "Red sus",function(on)
			for pid = 0, 31 do
				local rp = players.get_rank(pid)
				local money = players.get_money(pid)
				local kd = players.get_kd(pid)
				if rp == 120 or rp == 720 or rp >= 1000 then
					notification(PLAYER.GET_PLAYER_NAME(pid) .. " Is Sus: Modded RP", colors.red)
				end
				if money >= 500000000 then
					notification(PLAYER.GET_PLAYER_NAME(pid) .. " Is Sus: Modded Money", colors.red)
				end
				if kd <= -1 or kd >= 50 then
					notification(PLAYER.GET_PLAYER_NAME(pid) .. " Is Sus: Modded KD", colors.red)
				end
			end
	end)

	worldchaos = menu.list(menu.my_root(), "Chaos", {}, "", function(); end)
	menu.divider(worldchaos, "Chaos mode")

	menu.toggle(worldchaos, "Enable", {"chaos"}, "", function(on)
		if on then
			chaos = true
		else
			chaos = false
		end
	end, false)

	menu.toggle(worldchaos, "Gravity", {"chaosgrav"}, "", function(on)
		if on then
			gravity = true
		else
			gravity = false
		end
	end, true)

	menu.click_slider(worldchaos, "Power", {"chaospower"}, "", 30, 300, 100, 10, function(s)
	speed = s
	end)


	menu.divider(worldchaos, "Oppressor blacklisting")
	kick_players = false
	menu.toggle(worldchaos, "On", {"antioppressor"}, "Automatically kicks players off oppressor mkii's", function(on)
		kick_players = on
	end, false)

	lock_vehicle = false
	menu.toggle(worldchaos, "Lock vehicle", {"lockmk2"}, "Permanently locks the vehicle to prevent further use", function(on)
		lock_vehicle = on
	end, false)

	target_self = false
	menu.toggle(worldchaos, "Target self", {"targetselfmk2"}, "Targets your mk2's as well (this is stupid)", function(on)
		target_self = on
	end, false)

	target_friends = false
	menu.toggle(worldchaos, "Target friends", {"targetfriendsmk2"}, "Targets your friends' mk2's as well", function(on)
		target_friends = on
	end, false)

	menu.divider(worldchaos, "Other Shit")

	objectghosting = false
	menu.toggle(worldchaos, "Disable Vehicle Collision with Objects", {"GhostObjects"}, "Pairs well with ghostvehicles in stand", function(enabled)
		objectghosting = enabled
	end)

	drift = false
	menu.toggle(worldchaos, "Shift to Drift", {"driftmode"}, "", function(on_toggle)
		drift = on_toggle
	end)

	local dont_stop = false
	menu.toggle_loop(worldchaos,"Vehicle Fly Nearby vehicles", {"vehflyall"}, "basically 'impulse like sport mode' but applied to every vehicle", function()
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
				cam_pos = CAM.GET_GAMEPLAY_CAM_ROT(0)
    			ENTITY.SET_ENTITY_ROTATION(veh, cam_pos.x, cam_pos.y, cam_pos.z, 1, true);
				local locspeed = speed*10
				local locspeed2 = speed
				if PAD.IS_CONTROL_PRESSED(0, 61) then
					locspeed = locspeed*2
					locspeed2 = locspeed2*2
				end
				if PAD.IS_CONTROL_PRESSED(2, 71) then
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, speed, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, locspeed)
					end
				end
				if PAD.IS_CONTROL_PRESSED(2, 72) then
					local lsp = speed
					if not PAD.IS_CONTROL_PRESSED(0, 61) then 
						lsp = speed * 2
					end
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, 0 - (lsp), 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0 - (locspeed));
					end
			   end
				if PAD.IS_CONTROL_PRESSED(2, 63) then
					local lsp = (0 - speed)*2
					if not PAD.IS_CONTROL_PRESSED(0, 61) then 
						lsp = 0 - speed
					end
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, (lsp), 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0 - (locspeed), 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1);
					end
				end
				if PAD.IS_CONTROL_PRESSED(2, 64) then
					local lsp = speed
					if not PAD.IS_CONTROL_PRESSED(0, 61) then 
						lsp = speed*2
					end
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, lsp, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, locspeed, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					end
				end
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.action(worldchaos,"Make all Cars Drive Backwards", {"backwards"}, "", function()
		local local_veh = get_player_veh(PLAYER.PLAYER_ID(),false)
		for_table_do(entities.get_all_vehicles_as_handles(),true,function(ent)
			if ent == local_veh then return end
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(ent, -2147483647)
		end)
	end)

	menu.action(worldchaos,"Kill all Engines", {"killall"}, "",function()
		local local_veh = get_player_veh(PLAYER.PLAYER_ID(),false)
		for_table_do(entities.get_all_vehicles_as_handles(),true,function(ent) 
			if ent == local_veh then return end
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(ent, -4000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(ent, -4000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(ent, -4000)
		end)
	end)

	menu.toggle_loop(worldchaos, "Ultra Instinct", {"ultrainstinct"}, "Whis... Goku's done it, hasnt he? He's finally achieved it. \n note that the game's netcode is too shit for this to work 100% effectively.", function()
		local MyPed = PLAYER.PLAYER_PED_ID()
		local OtherPlayers = players.list(false, true, true)
		for pid = 1, #OtherPlayers do
			if PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(pid, MyPed) then
				local coords = ENTITY.GET_ENTITY_COORDS(MyPed, true)
				rotation = ENTITY.GET_ENTITY_ROTATION(MyPed, 5)
				ENTITY.SET_ENTITY_COORDS_NO_OFFSET(MyPed, coords.x + math.random(- 2, 2), coords.y + math.random(-2, 2), coords.z, rotation.x, rotation.y, rotation.z)
				util.yield(250)
			end
		end
	end)

local function update_join(pid)
	local name = players.get_name(pid)
	cmd_id[pid] = menu.toggle(custselc, name, {}, "PID - ".. pid, function(on_toggle)
		if on_toggle then
			selectedplayer[pid] = true
		else
			selectedplayer[pid] = false
		end
	end)
end

local function update_leave(pid)
	menu.delete(cmd_id[pid])
end

GenerateFeatures = function(pid)
	cage = util.joaat("prop_gascage01")
	ladder = 1888301071
	ground = -1951226014
	attach = 1
	veh_to_attach = 1

	function v3_2(x, y, z)
        if x == nil then
            x = 0
        end
        if y == nil then
            y = 0
        end
        if z == nil then
            z = 0
        end
    end



	function spawn_ped(ped_name, pid)
		local V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local ped_hash = util.joaat(ped_name)
		STREAMING.REQUEST_MODEL(ped_hash)
		while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
			util.yield()
		end
	
		aab = v3()
        aab = ENTITY.GET_ENTITY_COORDS(V3, true)
	
		local ped = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

		coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-2, 2)
        coords_ped.y = coords_ped.y + math.random(-2, 2)
        coords_ped.z = coords_ped.z

        ENTITY.SET_ENTITY_COORDS(ped, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
		ENTITY.SET_ENTITY_VISIBLE(ped, false)
		notification("Spawned [" .. ped_name .. "] on " .. PLAYER.GET_PLAYER_NAME(pid), colors.green)
	end



	dvdr = menu.divider(menu.player_root(pid), "PhoenixScript")
	main = menu.list(menu.player_root(pid), "PhoenixScript", {}, "", function(); end)

	vehopts = menu.list(main, "Vehicle Events", {}, "Works only if you are standing near to selected player", function(); end) -- blatant vehfucker3000 skid here
	
	lock_sub_vehicle_tab = menu.list(vehopts, "Lock Options", {}, "", function(); end)
	mov_sub_vehicle_tab = menu.list(vehopts, "Movement Options", {}, "", function(); end)
	troll_sub_vehicle_tab = menu.list(vehopts, "Trolling Options", {}, "", function(); end)
	health_sub_vehicle_tab = menu.list(vehopts, "Health and Appearance Options", {}, "", function(); end)
	detach_sub_vehicle_tab = menu.list(vehopts, "Detach Options", {}, "", function(); end)
	plane_sub_vehicle_tab = menu.list(vehopts, "Plane and Helicopter Options", {}, "", function(); end)

	menu.action(vehopts,"Spawn them a vehicle", {}, "Spawns a vehicle on target player", function()
		menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " ")
		notification("now type the name of the vehicle in the command box", colors.black)
	end)

	menu.action(health_sub_vehicle_tab,"Repair Vehicle", {"fixveh"}, "Repairs player's vehicle", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_FIXED(vehicle)
		end
	end)

	menu.action(troll_sub_vehicle_tab,"COCK Plate Text", {"cockplate"}, "Sets player's vehicle plate text to COCK", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "COCK") 
		end
	end)

	menu.action(troll_sub_vehicle_tab,"TRASH Plate Text", {"trashplate"}, "Sets player's vehicle plate text to TRASH", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "TRASH")
		end
	end)

	menu.action(health_sub_vehicle_tab,"Repair Vehicle Shell", {"fixvehshl"}, "Repairs player's vehicle but don't repair it's engine", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DEFORMATION_FIXED(vehicle)
		end
	end)

	menu.action(health_sub_vehicle_tab,"Quick Upgrade Vehicle", {"ugveh"}, "Upgrades player's vehicle",function()
		upgrade_vehicle(pid)
	end)

	menu.action(health_sub_vehicle_tab,"Disable Invincibility", {"removeinv"}, "Removes invincibility from player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false) 
		end
	end)

	menu.action(health_sub_vehicle_tab,"Enable Invincibility", {"giveinv"}, "Gives invincibility to player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true) 
		end
	end)

	menu.action(health_sub_vehicle_tab,"Destroy Engine", {"killveh"}, "Destroys vehicle engine", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, -4000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, -4000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, -4000)
		end
	end)

	menu.action(health_sub_vehicle_tab,"Revive Engine", {"reviveh"}, "Revives vehicle engine", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, 1000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, 1000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, 1000)
		end
	end)

	menu.action(health_sub_vehicle_tab,"Explode Vehicle", {"explodeveh"}, "Explodes vehicle",function()
		local vehicle = get_player_veh(pid,false)
		if vehicle then
			VEHICLE.ADD_VEHICLE_PHONE_EXPLOSIVE_DEVICE(vehicle)
			VEHICLE.DETONATE_VEHICLE_PHONE_EXPLOSIVE_DEVICE()
		end
	end)

	menu.action(mov_sub_vehicle_tab,"Reset Acceleration", {"reacc"}, "Resets max speed of vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 1) 
		end
	end)

	menu.action(mov_sub_vehicle_tab,"Boost Acceleration", {"boostacc"}, "Sets max speed of vehicle to 9999999",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 9999999) 
		end
	end)

	menu.action(mov_sub_vehicle_tab,"Trash Acceleration", {"tacc"}, "Sets max speed of vehicle to INT_MIN",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, -2147483647) 
		end
	end)
		
	menu.action(mov_sub_vehicle_tab,"East", {"eastveh"}, "Boosts player's vehicle in the East direction",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 10000, 0, 0, true, false, true)
		end
	end)

	menu.action(mov_sub_vehicle_tab,"West", {"westveh"}, "Boosts player's vehicle in the West direction",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, -10000, 0, 0, true, false, true)
		end
	end)

	menu.action(mov_sub_vehicle_tab,"South", {"southveh"}, "Boosts player's vehicle in the South direction",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, -10000, 0, true, false, true)
		end
	end)

	menu.action(mov_sub_vehicle_tab,"North", {"northveh"}, "Boosts player's vehicle in the North direction",function()
		northp_vehicle(pid)
	end)

	menu.action(mov_sub_vehicle_tab,"Launch Up", {"launchup"}, "Shoots player up",function()
		launch_vehicle(pid)
	end)

	menu.action(mov_sub_vehicle_tab,"Launch Down", {"launchdown"}, "Shoots player down",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, -10000, true, false, true)
		end
	end)

	menu.action(detach_sub_vehicle_tab,"Detach Trailer", {"detachtrailer"}, "Detaches attached trailer",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
		end
	end)

	menu.action(detach_sub_vehicle_tab,"Detach from Cargobob", {"detachcbob"}, "Detaches from Cargobob",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle) 
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Lock Doors", {"lockveh"}, "Locks the doors",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 4) 
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Unlock Doors", {"unlockveh"}, "Unlocks the doors",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 1)		
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Make Vehicle Drivable", {"engineon"}, "Makes player's vehicle drivable again",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_UNDRIVEABLE(vehicle, false)		
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Make Vehicle Undrivable", {"engineoff"}, "Makes player's vehicle undrivable",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_UNDRIVEABLE(vehicle, true)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Deploy Landing Gear", {"landing1"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.CONTROL_LANDING_GEAR(vehicle, 0)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Retract Landing Gear", {"landing0"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.CONTROL_LANDING_GEAR(vehicle, 3)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Disable Cargobob's Hook", {"nohook"}, "Disables cargobob's hook. when used, that cargobob's hook will no longer work",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.REMOVE_PICK_UP_ROPE_FOR_CARGOBOB(vehicle)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Strong Turbulence", {"turb1"}, "Makes turbulence stronger",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(vehicle, 1.0)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"No Turbulence", {"turb0"}, "Makes turbulence weaker",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(vehicle, 0.0)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Set Propeller Speed at 100%", {"propel100"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_HELI_BLADES_SPEED(vehicle, 1.0)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Set Propeller Speed at 0%", {"propel0"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_HELI_BLADES_SPEED(vehicle, 0.0)		
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Lock that bitch in", {"blockcar"}, "Locks the doors, paints the car Hot Pink, changes plate text to 'LOCKED'",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 4) 
			VEHICLE.SET_VEHICLE_COLOURS(vehicle, 135, 135)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "LOCKED")
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Release that bitch out", {"bunlockcar"}, "Unlocks the doors, paints the vehicle Green, changes plate text to 'URFREE'",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 1)
			VEHICLE.SET_VEHICLE_COLOURS(vehicle, 92, 92)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "URFREE")		
		end
	end)

	menu.action(mov_sub_vehicle_tab,"Teleport to me", {"tp2me"}, "Tries to teleport player's vehicle to you",function()
		local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), true)
		tp_veh_to(pid,coords.x,coords.y,coords.z)
	end)
	menu.action(mov_sub_vehicle_tab,"Teleport to ocean", {"tp2sea"}, "Tries to teleport player's vehicle to the ocean",function()	
		tp_veh_to(pid, -15000, -15000,0)
	end)


	
	griefing = menu.list(main, "Griefing", {}, "", function(); end)

	cage_options = menu.list(griefing, "Cage Options", {}, "")
	
	menu.divider(cage_options, "Cage Options")

	menu.action(cage_options, "Simple", {"cage"}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped) 
		if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
			menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
			util.yield(300)
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				notification("Failed to kick player out of the vehicle", colors.red)
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
				return
			end
			menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
			pos =  ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) --if not it could place the cage at the wrong position
		end
		cage_player(pos)
	end)
	
	menu.action(cage_options, "First Job", {"foodtruckcage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = 4022605402
		STREAMING.REQUEST_MODEL(hash)

		while not STREAMING.HAS_MODEL_LOADED(hash) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)

	
	menu.action(cage_options, "Married Simulator", {"doghousecage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = -1782242710
		STREAMING.REQUEST_MODEL(hash)
		
		while not STREAMING.HAS_MODEL_LOADED(hash) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)

		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)
		
	menu.action(cage_options, "Christmas Time", {"jollycage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = 238789712
		STREAMING.REQUEST_MODEL(hash)
		
		while not STREAMING.HAS_MODEL_LOADED(hash) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)
		
	menu.action(cage_options, "Christmas Time v2", {"jollycage2"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = util.joaat("ch_prop_tree_02a")
		STREAMING.REQUEST_MODEL(hash)

		while not STREAMING.HAS_MODEL_LOADED(hash) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .75, pos.y, pos.z - .5, true, true, false) -- front
		local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .75, pos.y, pos.z - .5, true, true, false) -- back
		local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .75, pos.z - .5, true, true, false) -- left
		local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .75, pos.z - .5, true, true, false) -- right
		local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .5, true, true, false) -- above
		cages[#cages + 1] = cage_object
		cages[#cages + 1] = cage_object
		util.yield(15)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)
		
	menu.action(cage_options, "Christmas Time v3", {"jollycage3"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = util.joaat("ch_prop_tree_03a")
		STREAMING.REQUEST_MODEL(hash)

		while not STREAMING.HAS_MODEL_LOADED(hash) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .75, pos.y, pos.z - .5, true, true, false) -- front
		local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .75, pos.y, pos.z - .5, true, true, false) -- back
		local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .75, pos.z - .5, true, true, false) -- left
		local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .75, pos.z - .5, true, true, false) -- right
		local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .5, true, true, false) -- above
		cages[#cages + 1] = cage_object
		cages[#cages + 1] = cage_object
		util.yield()
		--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		--rot.y = 90
		--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)

	menu.action(cage_options, "'Safe' Space", {"safecage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = 1089807209
		STREAMING.REQUEST_MODEL(hash)

		while not STREAMING.HAS_MODEL_LOADED(hash) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - 1, pos.y, pos.z - .5, true, true, false) -- front
		local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + 1, pos.y, pos.z - .5, true, true, false) -- back
		local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + 1, pos.z - .5, true, true, false) -- left
		local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - 1, pos.z - .5, true, true, false) -- right
		local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) -- above
		cages[#cages + 1] = cage_object

		ENTITY.FREEZE_ENTITY_POSITION(cage_object, true)
		ENTITY.FREEZE_ENTITY_POSITION(cage_object2, true)
		ENTITY.FREEZE_ENTITY_POSITION(cage_object3, true)
		ENTITY.FREEZE_ENTITY_POSITION(cage_object4, true)
		ENTITY.FREEZE_ENTITY_POSITION(cage_object5, true)
		util.yield(15)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)

	menu.action(cage_options, "Average X-Force User", {"trashcage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = 684586828
		STREAMING.REQUEST_MODEL(hash)

		while not STREAMING.HAS_MODEL_LOADED(hash) do
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, false)
		local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + 1, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)

	menu.action(cage_options, "money cage", {"moneycage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = util.joaat("bkr_prop_moneypack_03a")
		STREAMING.REQUEST_MODEL(hash)

		while not STREAMING.HAS_MODEL_LOADED(hash) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z, true, true, false) -- front
		local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z, true, true, false) -- back
		local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z, true, true, false) -- left
		local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z, true, true, false) -- right

		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z + .25, true, true, false) -- front
		local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z + .25, true, true, false) -- back
		local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z + .25, true, true, false) -- left
		local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z + .25, true, true, false) -- right

		local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) -- above
		cages[#cages + 1] = cage_object
		cages[#cages + 1] = cage_object
		util.yield(15)
		local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		rot.y = 90
		--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)

	menu.action(cage_options, "Stunt Tube", {"stuntcage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		STREAMING.REQUEST_MODEL(2081936690)

		while not STREAMING.HAS_MODEL_LOADED(2081936690) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(2081936690, pos.x, pos.y, pos.z, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)
		local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		rot.y = 90
		ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)
							
	local cage_loop = false
	menu.toggle(cage_options, "automatic", {"autocage"}, "Cage them in a trap. If they get out... Do it again. No, I'll do it for you actually", function(on)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local a = ENTITY.GET_ENTITY_COORDS(player_ped) --first position
		cage_loop = on
		if cage_loop then
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
				util.yield(300)
				if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
					notification("Failed to kick player out of the vehicle", colors.red)
					menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
					return
				end
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
				a =  ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
			end
			cage_player(a)
		end
		while cage_loop do
			local b = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) --current position
			local ba = {x = b.x - a.x, y = b.y - a.y, z = b.z - a.z} 
			if math.sqrt(ba.x * ba.x + ba.y * ba.y + ba.z * ba.z) >= 4 then --now I know there's a native to find distance between coords but I like this >_<
				a = b
				if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
					goto continue
				end
				cage_player(a)
				notification(PLAYER.GET_PLAYER_NAME(pid).." was out of the cage. Doing it again", colors.black)
				::continue::
			end
			util.yield(1000)
		end
	end)

	menu.action(cage_options, "Slowly Burn Them To Death", {}, "use this to slowly kill the poor caged person (ONLY WORKS WITH SOME CAGES)", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = util.joaat("prop_beach_fire")
		STREAMING.REQUEST_MODEL(hash)

		while not STREAMING.HAS_MODEL_LOADED(hash) do
			STREAMING.REQUEST_MODEL(hash)	
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1.75, true, true, false) -- front

		cages[#cages + 1] = cage_object

		local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		rot.y = 90
	end)

	menu.action(cage_options, "Release Player", {"release"}, "Attempts to delete spawned cages, for more complicated traps it will delete one side.", function() -- ez fix but lazy
		for key, value in pairs(cages) do
			entities.delete_by_handle(value)
		end
	end)

	local trolly_vehicles = menu.list(griefing, "Trolly Vehicles")

	function set_ent_face_ent(ent1, ent2) --All credits to Ren for suggesting me this function
		local pos1 = ENTITY.GET_ENTITY_COORDS(ent1)
		local pos2 = ENTITY.GET_ENTITY_COORDS(ent2)
		local dx = pos2.x - pos1.x
		local dy = pos2.y - pos1.y
		local heading = MISC.GET_HEADING_FROM_VECTOR_2D(dx, dy)
		return ENTITY.SET_ENTITY_HEADING(ent1, heading)
	end
	function add_blip_for_entity(entity, blipSprite, colour)
		local blip_ptr = memory.alloc()
		local blip = HUD.ADD_BLIP_FOR_ENTITY(entity)
		memory.write_int(blip_ptr, blip)
		HUD.SET_BLIP_SPRITE(blip, blipSprite)
		HUD.SET_BLIP_COLOUR(blip, colour)
		HUD.SHOW_HEIGHT_ON_BLIP(blip, false)
		HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(ENTITY.GET_ENTITY_HEADING(entity)))
		util.create_thread(function()
			local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
			while NETWORK.NETWORK_DOES_ENTITY_EXIST_WITH_NETWORK_ID(netId) do
				HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(ENTITY.GET_ENTITY_HEADING(entity)))
				if ENTITY.IS_ENTITY_DEAD(NETWORK.NET_TO_ENT(netId)) then
					break	
				end
				util.yield()
			end
			HUD.SET_BLIP_DISPLAY(blip, 0)
			--HUD.REMOVE_BLIP(memory.read_int(blip_ptr))
			memory.free(blip_ptr)
		end)
		return blip
	end

	local config_list = {
		['controls'] = {
			['Vehicle Weapons'] = 86,
			['Airstrike Aircraft'] = 86
		},
		['driving style'] = {
			['Bandito Driving Style'] = 786988
		}
	}
	local function delete_entities_by_model(model)
		local hash = util.joaat(model)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			for k, vehicle in pairs(entities.get_all_vehicles_as_handles()) do
				if ENTITY.GET_ENTITY_MODEL(vehicle) == hash then
					for k, ped in pairs(entities.get_all_peds_as_handles()) do
						if PED.GET_VEHICLE_PED_IS_IN(ped, true) == vehicle then
							if not PED.IS_PED_A_PLAYER(ped) then
								ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, false, false); entities.delete_by_handle(ped)
							else
								goto continue
							end
						end
					end
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle, false, false); entities.delete_by_handle(vehicle)
					::continue::
				end
			end
			return
		end
		if STREAMING.IS_MODEL_A_PED(hash) then
			for k, ped in pairs(entities.get_all_peds_as_handles()) do
				if ENTITY.GET_ENTITY_MODEL(ped) == hash then
					if not PED.IS_PED_A_PLAYER(ped) then
						ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, false, false); entities.delete_by_handle(ped)
					end
				end
			end
			return
		end
		for k, object in pairs(entities.get_all_objects_as_handles()) do
			if ENTITY.GET_ENTITY_MODEL(object) == hash then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, false, false); entities.delete_by_handle(object)
			end
		end
	end

	local function spawn_trolly_vehicle(pid, vehicleHash, pedHash)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		local coords_ptr, nodeId = memory.alloc(), memory.alloc()
		local coords
		if not PATHFIND.GET_RANDOM_VEHICLE_NODE(pos.x, pos.y, pos.z, 100, 0, 0, 0, coords_ptr, nodeId) then
			pos.x = pos.x + math.random(-20,20)
			pos.y = pos.y + math.random(-20,20)
			PATHFIND.GET_CLOSEST_VEHICLE_NODE(pos.x, pos.y, pos.z, coords_ptr, 1, 100, 2.5)
			coords = memory.read_vector3(coords_ptr)
		else
			coords = memory.read_vector3(coords_ptr)
		end
		memory.free(coords_ptr); memory.free(nodeId)

		local vehicle = entities.create_vehicle(vehicleHash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
			local tick = 0
			while not ENTITY.DOES_ENTITY_EXIST(vehicle) and tick <= 10 do
				vehicle = entities.create_vehicle(vehicleHash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
				tick = tick + 1
				util.yield()
			end
		end
		VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
		for i = 0, 50 do
			VEHICLE.SET_VEHICLE_MOD(vehicle, i, VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, i) - 1, false)
		end
		VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
		VEHICLE.SET_VEHICLE_IS_CONSIDERED_BY_PLAYER(vehicle, false)
		set_ent_face_ent(vehicle, player_ped)

		local driver = entities.create_ped(5, pedHash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		PED.SET_PED_COMBAT_ATTRIBUTES(driver, 1, true)
		PED.SET_PED_INTO_VEHICLE(driver, vehicle, -1)
		PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
		TASK.TASK_VEHICLE_MISSION_PED_TARGET(driver, vehicle, player_ped, 6, 500.0, config_list['driving style']['Bandito Driving Style'], 0.0, 0.0, true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedHash); STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicleHash)
		return vehicle, driver
	end
	
	local bandito_godmode = false
	
	menu.divider(trolly_vehicles, "Bandito")
	
	menu.click_slider(trolly_vehicles, 'Send Bandito', {'sendbandito'}, '', 1,25,1,1, function(quantity)
		local bandito_hash = util.joaat("rcbandito")
		local ped_hash = util.joaat('mp_m_freemode_01')
		STREAMING.REQUEST_MODEL(bandito_hash); STREAMING.REQUEST_MODEL(ped_hash)
		while not STREAMING.HAS_MODEL_LOADED(bandito_hash) and not STREAMING.HAS_MODEL_LOADED(ped_hash) do
			util.yield()
		end
		for i = 1, quantity do
			local bandito, driver = spawn_trolly_vehicle(pid, bandito_hash, ped_hash)
			add_blip_for_entity(bandito, 646, 4)
			ENTITY.SET_ENTITY_INVINCIBLE(bandito, bandito_godmode)
			ENTITY.SET_ENTITY_VISIBLE(driver, false, 0)
			notification("Spawned some annoying ass cars", colors.green)
			util.yield(150)
		end
	end)

	menu.toggle(trolly_vehicles, "Invincible", {}, "", function(on)
		bandito_godmode = on
	end, false)

	menu.action(trolly_vehicles, "Delete Banditos", {}, "", function()
		delete_entities_by_model("rcbandito")
	end)

-------------------------------------
--GO KART
-------------------------------------

	local gokart_godmode = false
	menu.divider(trolly_vehicles, 'Go-Kart')

	menu.click_slider(trolly_vehicles, 'Send Go-Kart', {'sendgokart'}, '',1, 15, 1, 1, function(quantity)
		local vehicleHash = util.joaat("veto2")
		local pedHash = util.joaat('mp_m_freemode_01')
		
		while not STREAMING.HAS_MODEL_LOADED(vehicleHash) and not STREAMING.HAS_MODEL_LOADED(pedHash) do
			STREAMING.REQUEST_MODEL(vehicleHash)
			STREAMING.REQUEST_MODEL(pedHash)
			util.yield()
		end
		for i = 1, quantity do
			local gokart, driver = spawn_trolly_vehicle(pid, vehicleHash, pedHash)
			add_blip_for_entity(gokart, 748, 5)
			ENTITY.SET_ENTITY_INVINCIBLE(gokart, gokart_godmode)
			VEHICLE.SET_VEHICLE_COLOURS(gokart, 89, 0)
			VEHICLE.TOGGLE_VEHICLE_MOD(gokart, 18, true)
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(gokart, 250)
			ENTITY.SET_ENTITY_INVINCIBLE(driver, gokart_godmode)
			PED.SET_PED_COMPONENT_VARIATION(driver, 3, 111, 13, 2)
			PED.SET_PED_COMPONENT_VARIATION(driver, 4, 67, 5, 2)
			PED.SET_PED_COMPONENT_VARIATION(driver, 6, 101, 1, 2)
			PED.SET_PED_COMPONENT_VARIATION(driver, 8, -1, -1, 2)
			PED.SET_PED_COMPONENT_VARIATION(driver, 11, 148, 5, 2)
			PED.SET_PED_PROP_INDEX(driver, 0, 91, 0, true)
			util.yield(150)
		end
	end)

	menu.toggle(trolly_vehicles, 'Invincible Go-Kart', {}, '', function(toggle)
		gokart_godmode = toggle
	end)

	menu.action(trolly_vehicles, 'Delete Go-Karts', {}, '', function()
		delete_entities_by_model('veto2')
	end)

	orbliterate = menu.list(griefing, "Orbliterate", {"orbliterate"}, "")
	menu.action(orbliterate, "Orbliterate", {}, "Press once to target, twice to fire. Stop spectating to cancel :)", function(on_click)
        if pid ~= players.user() then
			if waiting then
				do_fade_in(pid)
				notification("Click again to fire!", colors.black)
				return 
			end
			waiting = true
			if not NETWORK.NETWORK_IS_IN_SPECTATOR_MODE() then
				do_fade_in(pid)
				return
			end
			util.toast("FIRE!")
			orbital(pid) 
			do_fade_out(pid)
		end
			
    end)
	menu.action(orbliterate, "Unfuck Orbliterate", {"unfuckorbliterate"}, "If you somehow get it stuck, try this to undo it", function(on_click)
		do_fade_out(pid)
	end)

	menu.action(griefing, "Monkey Drop", {"monkeydrop"}, "", function()
		PlayerName = PLAYER.GET_PLAYER_NAME(pid)
		
		local hash = util.joaat("a_c_chimp")
		while not STREAMING.HAS_MODEL_LOADED(hash) do
			STREAMING.REQUEST_MODEL(hash)
			util.yield()
		end
		for i = 1, 69 do
			PlayerCoords = NETWORK._NETWORK_GET_PLAYER_COORDS(pid)
			MonkeCoords = {
				["x"] = PlayerCoords.x,
				["y"] = PlayerCoords.y,
				["z"] = PlayerCoords.z + 3
			}
			entities.create_ped(28, hash, MonkeCoords, 0)
			util.yield(50)
		end
	end)

	menu.action(griefing,"Volatol Spam Player", {}, "spams volatols on target player, huge AOE", function() -- cpu burn simulator v2
		while not STREAMING.HAS_MODEL_LOADED(447548909) do
			STREAMING.REQUEST_MODEL(447548909)
			util.yield(10)
		end
		local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        local OldCoords = ENTITY.GET_ENTITY_COORDS(self_ped) --save location
		ENTITY.SET_ENTITY_COORDS_NO_OFFSET(self_ped, 24, 7643.5, 19, true, true, true)

		notification("Started lagging the fuck out of him", colors.black)
		menu.trigger_commands("anticrashcamera on")
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
		spam_amount = 150
		while spam_amount >= 1 do
			entities.create_vehicle(447548909, PlayerPedCoords, 0)
			spam_amount = spam_amount - 1
			util.yield(10)
		end
		notification("Done", colors.green) -- cpu burned congrats
		menu.trigger_commands("anticrashcamera off")
	end)
----------------------------------------------------------------------------------------------------------------------- attacker buzzard --------------------------------------------------------

	local gunner_weapon_list = {              --these are the buzzard's gunner weapons 
	{"Combat MG", "weapon_combatmg"},
	{"RPG", "weapon_rpg"}
}

buzzard_entities = {}
function spawn_buzzard(pid, gunner_weapon, collision)
	local player_ped =  PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
	pos.x = pos.x + math.random(-20, 20)
	pos.y = pos.y + math.random(-20, 20)
	pos.z = pos.z + math.random(20, 40)

	PED.SET_PED_RELATIONSHIP_GROUP_HASH(player_ped, util.joaat("PLAYER"))

	local heli_hash = util.joaat("buzzard2")
	local ped_hash = util.joaat("s_m_y_blackops_01")
	STREAMING.REQUEST_MODEL(ped_hash)
	STREAMING.REQUEST_MODEL(heli_hash)
	while not STREAMING.HAS_MODEL_LOADED(ped_hash) or not STREAMING.HAS_MODEL_LOADED(heli_hash) do
		util.yield()
	end
	local heli = entities.create_vehicle(heli_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
	buzzard_entities[#buzzard_entities + 1] = heli
	
	if not collision then
		VEHICLE._DISABLE_VEHICLE_WORLD_COLLISION(heli)
	end
	
	ENTITY.SET_ENTITY_INVINCIBLE(heli, buzzard_godmode)
	ENTITY.SET_ENTITY_VISIBLE(heli, buzzard_visible, 0)	
	VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, true)
	VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli)
		
	local pilot = entities.create_ped(5, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
	buzzard_entities[#buzzard_entities + 1] = pilot
	
	PED.SET_PED_RELATIONSHIP_GROUP_HASH(pilot, util.joaat("ARMY"))
	ENTITY.SET_ENTITY_VISIBLE(pilot, buzzard_visible, 0)
	PED.SET_PED_INTO_VEHICLE(pilot, heli, -1)
	PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilot, true)

	PED.SET_PED_MAX_HEALTH(pilot, 500)
	ENTITY.SET_ENTITY_HEALTH(pilot, 500)
	ENTITY.SET_ENTITY_INVINCIBLE(pilot, buzzard_godmode)
	--TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(pilot, 500, 0)

	local gunner = {}
	for i  = 1,2 do
		gunner[i] = entities.create_ped(29, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		buzzard_entities[#buzzard_entities + 1] = gunner[i]
		PED.SET_PED_INTO_VEHICLE(gunner[i], heli, i)
		WEAPON.GIVE_WEAPON_TO_PED(gunner[i], util.joaat(gunner_weapon) , 9999, false, true)
		PED.SET_PED_COMBAT_ATTRIBUTES(gunner[i], 20 --[[ they can shoot from vehicle ]], true)
		--PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(gunner[i], true)
		PED.SET_PED_MAX_HEALTH(gunner[i], 500)
		ENTITY.SET_ENTITY_HEALTH(gunner[i], 500)
		ENTITY.SET_ENTITY_INVINCIBLE(gunner[i], buzzard_godmode)
		ENTITY.SET_ENTITY_VISIBLE(gunner[i], buzzard_visible, 0)
		PED.SET_PED_SHOOT_RATE(gunner[i], 1000)
		PED.SET_PED_RELATIONSHIP_GROUP_HASH(gunner[i], util.joaat("ARMY"))
		TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(gunner[i], 1000, 0)
	end
	
	util.create_tick_handler(function()
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("ARMY"), util.joaat("PLAYER"))
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("PLAYER"), util.joaat("ARMY"))
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(0, util.joaat("ARMY"), util.joaat("ARMY"))
	end)

	notification("Buzzard sent to "..PLAYER.GET_PLAYER_NAME(pid), colors.black)
	return pilot, heli
end	

	local buzzard_options = menu.list(griefing, "Enemy Buzzard", {}, "")

	menu.divider(buzzard_options, "Enemy Buzzard")

	buzzard_visible = true
	local gunner_weapon = "weapon_combatmg"
	
	menu.action(buzzard_options, "Spawn Buzzard", {}, "", function()
		local pilot, heli = spawn_buzzard(pid, gunner_weapon, collision)

		while ENTITY.GET_ENTITY_HEALTH(pilot) > 0 do
			local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
			local a = ENTITY.GET_ENTITY_COORDS(player_ped)
			local b = ENTITY.GET_ENTITY_COORDS(heli)
			if MISC.GET_DISTANCE_BETWEEN_COORDS(a.x, a.y, a.z, b.x, b.y, b.z, true) > 90 then
				TASK.TASK_HELI_CHASE(pilot, player_ped, 0, 0, 50)
			else
				TASK.TASK_HELI_MISSION(pilot, heli, 0, player_ped, a.x, a.y, a.z, 23, 30, -1, -1, 10, 10, 5, 0)
			end
			util.yield()
		end
	end)

	menu.divider(buzzard_options, "Settings")

	menu.toggle(buzzard_options, "Invincible", {}, "", function(on)
		buzzard_godmode = on
	end, false)
	
	local menu_gunner_weapon_list = menu.list(buzzard_options, "Gunners Weapon")
	menu.divider(menu_gunner_weapon_list, "Gunner Weapon List")

	for i = 1, #gunner_weapon_list do
		menu.action(menu_gunner_weapon_list, gunner_weapon_list[i][1], {}, "", function()
			gunner_weapon = gunner_weapon_list[i][2]
			notification("Now gunners will shoot with "..gunner_weapon_list[i][1].."s", colors.black)
		end)
	end

	menu.toggle(buzzard_options, "Visible", {}, "You shouldn't be that toxic to turn this off", function(on)
		buzzard_visible = on
	end, true)

	menu.toggle(buzzard_options, "Collision", {}, "When it's turned off disables world collision for Buzzard. Playes can still destroy the vehicle", function(on)
		collision = on
	end, false)

	menu.action(buzzard_options, "Delete All", {}, "Deletes all Buzzards you've spawned", function()
		for key, value in pairs(buzzard_entities) do
			entities.delete_by_handle(value)
		end
	end)

	menu.action(griefing,"Spawn Attacker Tank", {}, "", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		if table_kidnap == nil then
			table_kidnap = {}
		end
        hash = util.joaat("rhino")
        ped_hash = util.joaat("MP_M_Cocaine_01")

        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)

            while not STREAMING.HAS_MODEL_LOADED(hash) do

                util.yield()
            end

            local aab = 
			{
				x = -5784.258301,
				y = -8289.385742,
				z = -136.411270
			}

            ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
            ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)

            table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
                                              CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
            while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                STREAMING.REQUEST_MODEL(ped_hash)
                util.yield()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
                true, true, false, 0, false)

            coords_ped = v3()
            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
            coords_ped.x = coords_ped.x + math.random(-20, 20)
            coords_ped.y = coords_ped.y + math.random(-20, 20)
            coords_ped.z = coords_ped.z

            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)

            VEHICLE.SET_VEHICLE_ENGINE_ON(table_kidnap[veh_to_attach], true, true, false)
            TASK.TASK_VEHICLE_SHOOT_AT_PED(ped_to_drive, V3, 1)
            TASK.TASK_VEHICLE_CHASE(ped_to_drive, V3)

            util.yield(1)
            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)

            --util.toast(os.date("%H:%M:%S") .. " DONE", TOAST_ABOVE_MAP)
        end
	end)

	menu.action(griefing,"Kidnap Player", {}, "", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

		if table_kidnap == nil then
			table_kidnap = {}
		end

        hash = util.joaat("stockade")
        ped_hash = util.joaat("MP_M_Cocaine_01")

        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)

            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end

            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)

            local aab = 
			{
				x = -5784.258301,
				y = -8289.385742,
				z = -136.411270
			}

            ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
            ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, true)

            table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
            CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
            while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                STREAMING.REQUEST_MODEL(ped_hash)
                util.yield()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

            ENTITY.SET_ENTITY_INVINCIBLE(ped_to_drive, true)
            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
                true, true, false, 0, false)
            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z - 1, false, false, false,
                false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
            TASK.TASK_VEHICLE_DRIVE_WANDER(ped_to_drive, table_kidnap[veh_to_attach], 20, 16777216)

            util.yield(500)

            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)

            --util.toast(os.date("%H:%M:%S") .. " DONE", TOAST_ABOVE_MAP)

        end
	end)

	menu.action(griefing,"Deliver Player to you", {"deliver"}, "Kidnaps the target and brings them to your current location", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

		if table_kidnap == nil then
			table_kidnap = {}
		end

        hash = util.joaat("stockade")
        ped_hash = util.joaat("MP_M_Cocaine_01")

        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)

            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end

            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)

            local aab = 
			{
				x = -5784.258301,
				y = -8289.385742,
				z = -136.411270
			}


            ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
            ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, true)

            table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
            CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
            while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                STREAMING.REQUEST_MODEL(ped_hash)
                util.yield()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
			local PlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
			local PedCoords = ENTITY.GET_ENTITY_COORDS(PlayerPed)
            ENTITY.SET_ENTITY_INVINCIBLE(ped_to_drive, true)
            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
                true, true, false, 0, false)
            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z - 1, false, false, false,
                false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
            --TASK.TASK_VEHICLE_DRIVE_WANDER(ped_to_drive, table_kidnap[veh_to_attach], 20, 16777216)
			TASK.TASK_VEHICLE_DRIVE_TO_COORD(ped_to_drive, table_kidnap[veh_to_attach], PedCoords.x, PedCoords.y, PedCoords.z, 30, 1, hash, 4, 5, 0)

            util.yield(500)

            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)

            --util.toast(os.date("%H:%M:%S") .. " DONE", TOAST_ABOVE_MAP)

        end
	end)

	menu.action(griefing,"Ban Voice Chat", {}, "May lag your game when in progress", function(on)
		if pid ~= players.user() then
			for i = 1, 30 do
				menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pid))
				util.yield()
			end
		end
	end)

	menu.toggle(griefing,"Report Spam", {}, "May lag your game when in progress", function(on)
		spam = on
		while spam do
			if pid ~= players.user() then
				menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportannoying " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reporthate " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportexploits " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportbugabuse " .. PLAYER.GET_PLAYER_NAME(pid))
			end
			util.yield()
		end
	end)

	menu.toggle(griefing,"Commend Spam", {}, "May lag your game when in progress", function(on)
		spam = on
		while spam do
			if pid ~= players.user() then
				menu.trigger_commands("commendfriendly " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("commendhelpful " .. PLAYER.GET_PLAYER_NAME(pid))
			end
			util.yield()
		end
	end)

	passivemode = menu.list(griefing, "Passive Mode", {}, "", function(); end)

	menu.action(passivemode,"Block", {}, "", function()
		if players.exists(pid) then
			send_script_event(1114091621, pid, {pid, 1})
			send_script_event(1859990871, pid, {pid, 1})
		end
	end)

	menu.action(passivemode,"Unblock", {}, "", function()
		if players.exists(pid) then
			send_script_event(1114091621, pid, {pid, 0})
			send_script_event(2033772643, pid, {pid, 0})
		end
	end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- gotta give adequate space for these super op lua crashes

	crashes = menu.list(main, "Crash", {}, "OP LUA CRASHES!1!!", function(); end)

	local begcrash = {
		"Hey bro, it would be pretty poggers to close your game for me",
		"pwease cwash yowour game fowor me",
		"Close your game. I'm not asking.",
		"Please close your game, please please please please please",
	}

	menu.action(crashes, "Beg Crash", {}, "Asks them nicely to close their game for you", function()
		menu.trigger_commands("smstext" .. PLAYER.GET_PLAYER_NAME(pid).. " " .. begcrash[math.random(1, #begcrash)])
		util.yield()
		menu.trigger_commands("smssend" .. PLAYER.GET_PLAYER_NAME(pid))
	end)

	menu.action(crashes, "Car Crash", {}, "Don't drink and drive, folks", function()
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " on")
		util.yield(1500)
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
			local veh1 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords1, PlayerCoords.z, 180, true, false, true)
			local veh2 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords2, PlayerCoords.z, 0, true, false, true)
			-- Do stuff with veh ...
			ENTITY.SET_ENTITY_VELOCITY(veh1, 0, -100, 0)
			ENTITY.SET_ENTITY_VELOCITY(veh2, 0, 100, 0)
		end
		util.yield(5000)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
	end)

end



misc = menu.list(menu.my_root(), "Miscellaneous", {}, "", function(); end)

spoofpresets = menu.list(misc, "IP Spoofer Repository", {}, "Stand's default GeoIP may show wrong location on some presets", function(); end)

	menu.action(spoofpresets, "Enable IP Spoofer", {}, "", function()
		menu.trigger_commands("spoofip on")
	end)

	menu.action(spoofpresets, "Disable IP Spoofer", {}, "", function()
		menu.trigger_commands("spoofip off")
	end)

	menu.divider(spoofpresets, "Fun IP Presets")

	menu.action(spoofpresets, "Computer Problem Solving (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.146." .. tostring(math.random(48, 123)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "US Department of Defense", {}, "", function()
		menu.trigger_commands("spoofedip " .. "155.21." .. tostring(math.random(224, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "NASA (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.169." .. tostring(math.random(48, 123)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Apple (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "17.234." .. tostring(math.random(0, 127)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Akamai (NL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "23.66." .. tostring(math.random(16, 31)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Microsoft (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "40.89." .. tostring(math.random(224, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Microsoft (NL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "51.144." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	t2spoofpresets = menu.list(spoofpresets, "Take-Two", {}, "", function(); end)
	
	menu.action(t2spoofpresets, "Take-Two (UK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.227." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (US)", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "192.81." .. tostring(math.random(240, 244)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "139.138." .. tostring(math.random(231, 232)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(t2spoofpresets, "Take-Two (AU)", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "139.138.226." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "139.138.244." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(t2spoofpresets, "Take-Two (DE)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.233." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (ES)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.247." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (HU)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.236." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (CZ)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.237." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (IN)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.224." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (SG)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.228." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (JP)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.229." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (CN)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.230." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (HK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.238." .. tostring(math.random(0, 255)))
	end)

	menu.divider(spoofpresets, "VPN IP Presets")

	octospoofpresets = menu.list(spoofpresets, "OVH", {}, "", function(); end)

	menu.action(octospoofpresets, "OVH (AU)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.99." .. tostring(math.random(232, 234)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(octospoofpresets, "OVH (DE)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "145.239.235." .. tostring(math.random(40, 111)))
	end)

	menu.action(octospoofpresets, "OVH (UK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "51.89.208." .. tostring(math.random(88, 95)))
	end)

	menu.action(octospoofpresets, "OVH (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "51.81.119." .. tostring(math.random(0, 15)))
	end)

	menu.action(octospoofpresets, "OVH (CA)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "192.99.250." .. tostring(math.random(208, 223)))
	end)

	tempestpresets = menu.list(spoofpresets, "Tempest Hosting", {}, "", function(); end)

	menu.action(tempestpresets, "Tempest Hosting (US-NY)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.252." .. tostring(math.random(128, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (US-CA)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.252." .. tostring(math.random(0, 127)))
	end)
	
	menu.action(tempestpresets, "Tempest Hosting (US-FL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.254." .. tostring(math.random(128, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (CA)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(128, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (NL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(0, 127)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (UK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.255." .. tostring(math.random(0, 127)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (RU)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(127, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (JP)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.254." .. tostring(math.random(0, 127)))
	end)

	menu.divider(spoofpresets, "Residential IP Presets")

	menu.action(spoofpresets, "Russia", {}, "", function()
		sel = math.random(1,3)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "109.252." .. tostring(math.random(40, 45)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "92.100." .. tostring(math.random(178, 182)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "217.107." .. tostring(math.random(82, 98)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "95.24." .. tostring(math.random(0, 31)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "China", {}, "", function()
		menu.trigger_commands("spoofedip " .. "42.123." .. tostring(math.random(0, 31)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Australia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.168." .. tostring(math.random(40, 53)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "USA Chicago", {}, "", function()
		menu.trigger_commands("spoofedip " .. "73.110." .. tostring(math.random(149, 151)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "USA Baltimore", {}, "", function()
		menu.trigger_commands("spoofedip " .. "69.67." .. tostring(math.random(80, 95)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "USA Texas", {}, "AT&T / IBM", function()
		menu.trigger_commands("spoofedip " .. "198.81.193." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Germany", {}, "", function()
		sel = math.random(1,4)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "84.56." .. tostring(math.random(218, 231)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "46.223." .. tostring(math.random(234, 251)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "93." .. tostring(math.random(192, 255)) .. "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "89.14." .. tostring(math.random(120, 124)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Italy", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "5.89." .. tostring(math.random(190, 197)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "217.200." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Netherlands", {}, "", function()
		sel = math.random(1,4)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "217.123." .. tostring(math.random(124, 125)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "217." .. tostring(math.random(100, 105)) .. "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "139.156." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "94.212." .. tostring(math.random(40, 47)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "France", {}, "", function()
		menu.trigger_commands("spoofedip " .. "2.10." .. tostring(math.random(134, 151)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "United Kingdom", {}, "", function()
		sel = math.random(1,4)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "81.109." .. tostring(math.random(120, 130)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "217.33." .. tostring(math.random(88, 90)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "2.217." .. tostring(math.random(20, 30)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "86.0." .. tostring(math.random(54, 60)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Ireland", {}, "", function()
		menu.trigger_commands("spoofedip " .. "84.203." .. tostring(math.random(0, 10)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Switzerland", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "85.0." .. tostring(math.random(41, 43)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "84.73." .. tostring(math.random(0, 115)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Austria", {}, "", function()
		menu.trigger_commands("spoofedip " .. "194.166." .. tostring(math.random(250, 252)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Denmark", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "83.92." .. tostring(math.random(121, 124)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "87.104." .. tostring(math.random(64, 127)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Belgium", {}, "", function()
		menu.trigger_commands("spoofedip " .. "94.111." .. tostring(math.random(2, 4)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Spain", {}, "", function()
		menu.trigger_commands("spoofedip " .. "93.176." .. tostring(math.random(154, 155)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Portugal", {}, "", function()
		menu.trigger_commands("spoofedip " .. "94.61." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Norway", {}, "", function()
		menu.trigger_commands("spoofedip " .. "80.213." .. tostring(math.random(174, 181)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Finland", {}, "", function()
		menu.trigger_commands("spoofedip " .. "88.113." .. tostring(math.random(64, 83)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Sweden", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "78.72." .. tostring(math.random(240, 245)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "151.252." .. tostring(math.random(128, 172)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Slovakia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "90.64." .. tostring(math.random(50, 55)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Romania", {}, "", function()
		menu.trigger_commands("spoofedip " .. "79.117." .. tostring(math.random(0, 127)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Poland", {}, "", function()
		sel = math.random(1,3)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "178.36." .. tostring(math.random(221, 229)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "193.17." .. tostring(math.random(174, 174)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "217." .. tostring(math.random(96, 99)) .. "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Czech Republic", {}, "", function()
		menu.trigger_commands("spoofedip " .. "185.91." .. tostring(math.random(164, 166)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Bulgaria", {}, "", function()
		menu.trigger_commands("spoofedip " .. "90.154." .. tostring(math.random(162, 164)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Slovenia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "77.111." .. tostring(math.random(53, 53)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Croatia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "185.133." .. tostring(math.random(132, 135)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Albania", {}, "", function()
		menu.trigger_commands("spoofedip " .. "79.106." .. tostring(math.random(160, 191)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Lithuania", {}, "", function()
		menu.trigger_commands("spoofedip " .. "90.140." .. tostring(math.random(13, 13)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Hungary", {}, "", function()
		menu.trigger_commands("spoofedip " .. "84.2." .. tostring(math.random(137, 137)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Greece", {}, "", function()
		menu.trigger_commands("spoofedip " .. "2.85." .. tostring(math.random(227, 227)) .. "." .. tostring(math.random(0, 255)))
	end)

ColorRepo = menu.list(misc, "Color Repository", {"colorrepo"}, "", function(); end)
BasicColors = menu.list(ColorRepo, "Basic Colors", {}, "", function(); end)
SecondaryColors = menu.list(ColorRepo, "Secondary Colors", {}, "", function(); end)

menu.action(BasicColors, "Red", {"red"}, "Copies a red hex value to your clipboard", function()
	util.copy_to_clipboard("ff0000")
end)

menu.action(BasicColors, "Green", {"green"}, "Copies a green hex value to your clipboard", function()
	util.copy_to_clipboard("00ff00")
end)

menu.action(BasicColors, "Blue", {"blue"}, "Copies a blue hex value to your clipboard", function()
	util.copy_to_clipboard("0000ff")
end)

menu.action(BasicColors, "Yellow", {"yellow"}, "Copies a yellow hex value to your clipboard", function()
	util.copy_to_clipboard("ffff00")
end)

menu.action(BasicColors, "Purple", {"purple"}, "Copies a purple hex value to your clipboard", function()
	util.copy_to_clipboard("800080")
end)

menu.action(BasicColors, "Orange", {"orange"}, "Copies an orange hex value to your clipboard", function()
	util.copy_to_clipboard("ffa500")
end)

menu.action(BasicColors, "White", {"white"}, "Copies a white hex value to your clipboard", function()
	util.copy_to_clipboard("ffffff")
end)

menu.action(BasicColors, "Black", {"black"}, "Copies a black hex value to your clipboard", function()
	util.copy_to_clipboard("000000")
end)

menu.action(SecondaryColors, "Magenta", {"magenta"}, "Magenta color for magenta menu", function()
	util.copy_to_clipboard("ff00FF")
end)

menu.action(SecondaryColors, "CEO of Crash", {"ceoofcrash"}, "The color I personally use, in case you wanted it", function()
	util.copy_to_clipboard("00ffa8")
end)

joining = false
menu.toggle(misc, "Player Joining Notifications", {}, "", function(on_toggle)
	if on_toggle then
		joining = true
	else
		joining = false
	end
end)

menu.action(misc, "Fix Casino Heist", {}, "If you've bricked your casino heist by not doing the scoping mission, give this a try :)", function()
	STATS.STAT_SET_INT(util.joaat("MP0_H3OPT_POI"), 0, true)
	STATS.STAT_SET_INT(util.joaat("MP0_H3OPT_ACCESSPOINTS"), 0, true)
end)


faketype = menu.list(misc, "Spoof Typing indicator", {}, "", function(); end)

menu.action(faketype, "Start Fake Typing", {}, "Will show a typing indicator above your nickname and also make other menus think that you're typing in chat", function()
	menu.trigger_commands("hidetyping off")
	for pids = 0, 31 do
		if players.exists(pids) and pids ~= players.user() then
			send_script_event(747270864, pids, {players.user(), pids, 6769})
		end
	end
end)

menu.action(faketype, "Stop Fake Typing", {}, "", function()
	for pids = 0, 31 do
		if players.exists(pids) and pids ~= players.user() then
			send_script_event(-990958325, pids, {players.user(), pids, 7556})
		end
	end
end)

menu.toggle(faketype, "Anti-Type", {}, "AKA 'Suppress Typing Indicator', hides the fact that you're typing", function(on)
	if on then
		menu.trigger_commands("hidetyping on")
	else
		menu.trigger_commands("hidetyping off")
	end
end)

notification("PhoenixScript v16 has been successfully loaded!", colors.green)

async_http.init('pastebin.com', '/raw/j8iZnWjV', function(authver)
	if tonumber(authver) ~= version then -- why the fuck do i have to tonumber this when its literally already a number :waitwhat:
		util.toast(version .. " " .. authver)
		notification("A new version of PhoenixScript is available!", colors.black)
		menu.hyperlink(menu.my_root(), "Get the latest version of PhoenixScript", "https://discord.gg/M2HUysGy3Q")
	end
end, function()
	notification("Failed to check for updates.", colors.black)
end)
async_http.dispatch()

local InitialPlayersList = players.list(true, true, true)
for i = 1, #InitialPlayersList do
	GenerateFeatures(InitialPlayersList[i])
end

players.on_join(function(pid)
	while true do
		if joining then
			notification(PLAYER.GET_PLAYER_NAME(pid) .. " joined", colors.black)
		end
		util.yield()
	end
end)

players.on_join(GenerateFeatures)
players.on_leave(update_leave)
players.on_join(update_join)
--util.on_stop(cleanup)

--for vehicle chaos
util.create_thread(function()
	while true do
		if (chaos) then
			vehicles = entities.get_all_vehicles_as_handles()
			cur_players = players.list(true,true,true)
			for k,v in pairs(vehicles) do
				driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(v, -1)
				if(PED.GET_PED_TYPE(driver) > 4) then
					VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(v, false, true)
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(v, speed)
					VEHICLE.SET_VEHICLE_GRAVITY(v, gravity)
				end
			end
		end
		util.yield()
	end
end)

	-- for car drifting
util.create_thread(function()
	while true do
		if drift then
			local veh = entities.get_user_vehicle_as_handle()
			if veh then
				if PAD.IS_CONTROL_PRESSED(1, 61) then
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, true)
				else
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, false)
				end
			end        
		end
		util.yield()
	end
end)



--for oppressor blacklist
util.create_thread(function()
	while true do
		if kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("oppressor2")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

-- object ghosting
util.create_thread(function()
	while true do
		if objectghosting then
			local PlayerPed = PLAYER.GET_PLAYER_PED(players.user())
			local PedVehicle = PED.GET_VEHICLE_PED_IS_USING(PlayerPed)
			if PED.IS_PED_IN_ANY_VEHICLE(PlayerPed) then
				local collision = entities.get_all_objects_as_handles()
				for i = 1, #collision do
					ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(collision[i], PedVehicle, false)
					ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(PedVehicle, collision[i], false)    -- unfortunately theres no way to force collision to reenable afaik so you just have to wait it out and travel to a new area which loads new objects
				end
			end
		end
	util.yield(500)
	end
end)
util.on_stop(function()
	notification("cya nerd", colors.black)
end)