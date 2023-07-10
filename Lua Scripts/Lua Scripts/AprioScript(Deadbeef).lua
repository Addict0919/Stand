--- Credit :  Len's
--            Jay Montana     
--            dom736®       

util.keep_running()
util.require_no_lag("natives_JM36-STD-G_USC_NS-1672085524")

------------------Local

deleteMissionEnts = false
notification = true

local unreleased_vehicles = {
    "boor",
	"broadway",
	"eudora",
	"everon2",
	"issi8",
	"panthere",
	"powersurge",
	"r300",
	"virtue",
}
local modded_weapons = {
    "weapon_railgun",
}
local modded_vehicles = {
    "dune2",
    "dilettante2",
    "asea2",
    "cutter",
    "mesa2",
    "jet",
    "skylift",
    "policeold1",
    "policeold2",
    "armytrailer2",
    "towtruck",
    "towtruck2",
    "cargoplane",
}
local colors = {
	green = 184,
	red = 6,
	yellow = 190,
	black = 2,
	white = 1,
	gray = 3,
	pink = 201,
	purple = 49, --, 21, 96
	blue = 11
}
selectedplayer = {}
for b = 0, 31 do
	selectedplayer[b] = false
end
excludeselected = false

     --::: op Lua Crash :::

local begcrash = {
	"Hey bro, it would be pretty poggers to close your game for me",
	"Close your game. I'm not asking.",
	"Please close your game, please please please please please",
}
local interior_stuff = {0, 233985, 169473, 169729, 169985, 170241, 177665, 177409, 185089, 184833, 184577, 163585, 167425, 167169}

-------------------function

function notification(message, color)
	HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)
	util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
	if color == colors.green or color == colors.red then
		subtitle = "~u~Notification"
	elseif color == colors.black then
		subtitle = "~c~Notification"
	else
		subtitle = "~u~Notification"
	end

	HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)
	util.log(message)
end
function send_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
end
function dist(pos1, pos2)
	return math.sqrt((pos1.x - pos2.x)*(pos1.x - pos2.x)+(pos1.y - pos2.y)*(pos1.y - pos2.y)+(pos1.z - pos2.z)*(pos1.z - pos2.z))
end
function CreateVehicle(Hash, Pos, Heading, Invincible)
    STREAMING.REQUEST_MODEL(Hash)
    while not STREAMING.HAS_MODEL_LOADED(Hash) do util.yield() end
    local SpawnedVehicle = entities.create_vehicle(Hash, Pos, Heading)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
    if Invincible then
        ENTITY.SET_ENTITY_INVINCIBLE(SpawnedVehicle, true)
    end
    return SpawnedVehicle
end
function CreatePed(index, Hash, Pos, Heading)
    STREAMING.REQUEST_MODEL(Hash)
    while not STREAMING.HAS_MODEL_LOADED(Hash) do util.yield() end
    local SpawnedVehicle = entities.create_ped(index, Hash, Pos, Heading)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
    return SpawnedVehicle
end
function control_vehicle(pid, callback, opts)
    local vehicle = get_player_vehicle_in_control(pid, opts)
    if vehicle > 0 then
        callback(vehicle)
    elseif opts == nil or opts.silent ~= true then
        util.toast("PLAYER_OUT_OF_RANGE")
    end
end
function show_busyspinner(text)
    HUD.BEGIN_TEXT_COMMAND_BUSYSPINNER_ON("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text)
    HUD.END_TEXT_COMMAND_BUSYSPINNER_ON(2)
end
-- Gets the player's vehicle, attempts to request control. Returns 0 if unable to get control
function get_player_vehicle_in_control(pid, opts)
    local my_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()) -- Needed to turn off spectating while getting control
    local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    -- Calculate how far away from target
    local pos1 = ENTITY.GET_ENTITY_COORDS(target_ped)
    local pos2 = ENTITY.GET_ENTITY_COORDS(my_ped)
    local dist = SYSTEM.VDIST2(pos1.x, pos1.y, 0, pos2.x, pos2.y, 0)
    local was_spectating = NETWORK.NETWORK_IS_IN_SPECTATOR_MODE() -- Needed to toggle it back on if currently spectating
    -- If they out of range (value may need tweaking), auto spectate.
    local vehicle = PED.GET_VEHICLE_PED_IS_IN(target_ped, true)
    if opts and opts.near_only and vehicle == 0 then
        return 0
    end
    if vehicle == 0 and target_ped ~= my_ped and dist > 340000 and not was_spectating then
        util.toast("AUTO_SPECTATE")
        show_busyspinner(util.format("AUTO_SPECTATE"))
        NETWORK.NETWORK_SET_IN_SPECTATOR_MODE(true, target_ped)
        -- To prevent a hard 3s loop, we keep waiting upto 3s or until vehicle is acquired
        local loop = (opts and opts.loops ~= nil) and opts.loops or 30 -- 3000 / 100
        while vehicle == 0 and loop > 0 do
            util.yield(100)
            vehicle = PED.GET_VEHICLE_PED_IS_IN(target_ped, true)
            loop = loop - 1
        end
        HUD.BUSYSPINNER_OFF()
    end
    if vehicle > 0 then
        if NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vehicle) then
            return vehicle
        end
        -- Loop until we get control
        local netid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(vehicle)
        local has_control_ent = false
        local loops = 15
        NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netid, true)
        -- Attempts 15 times, with 8ms per attempt
        while not has_control_ent do
            has_control_ent = NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle)
            loops = loops - 1
            -- wait for control
            util.yield(15)
            if loops <= 0 then
                break
            end
        end
    end
    if not was_spectating then
        NETWORK.NETWORK_SET_IN_SPECTATOR_MODE(false, target_ped)
    end
    return vehicle
end

local function getPlayerVehicleName(ped)
    local playersVehicle = PED.GET_VEHICLE_PED_IS_IN(ped)
    local vehHash = ENTITY.GET_ENTITY_MODEL(playersVehicle)
    if vehHash == 0 then return end
    return util.get_label_text(VEHICLE.GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(vehHash))
end
local function request_model(hash, timeout)
    timeout = timeout or 3
    STREAMING.REQUEST_MODEL(hash)
    local end_time = os.time() + timeout
    repeat
        util.yield()
    until STREAMING.HAS_MODEL_LOADED(hash) or os.time() >= end_time
    return STREAMING.HAS_MODEL_LOADED(hash)
end
local function setAttribute(attacker)
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 46, true)

    PED.SET_PED_COMBAT_RANGE(attacker, 4)
    PED.SET_PED_COMBAT_ABILITY(attacker, 3)
end
local function get_transition_state(pid)
    return memory.read_int(memory.script_global(((0x2908D3 + 1) + (pid * 0x1C5)) + 230))
end
local function get_interior_player_is_in(pid)
    return memory.read_int(memory.script_global(((0x2908D3 + 1) + (pid * 0x1C5)) + 243)) 
end

--------------------menu

protex = menu.list(menu.my_root(), "Protections", {}, "", function(); end)

menu.toggle(protex, "Block all Network Events", {}, "This breaks the game!!!", function(on_toggle)
	local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
	local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
	if on_toggle then
		menu.trigger_command(BlockNetEvents)
		notification("block all network events stay safe :)))", colors.green)
	else
		menu.trigger_command(UnblockNetEvents)
		notification("Unblock all network events", colors.red)
	end
end)

menu.toggle(protex, "Block all Incoming Syncs", {}, "This breaks the game!!!", function(on_toggle)
	local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
	local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
	if on_toggle then
		menu.trigger_command(BlockIncSyncs)
		notification("block all incoming syncs stay safe ;)))", colors.green)
	else
		menu.trigger_command(UnblockIncSyncs)
		notification("Unblock all incoming syncs", colors.red)
	end
end)

menu.toggle(protex, "Block all Outgoing Syncs", {}, "This breaks the game!!!", function(on_toggle)
	if on_toggle then
		notification("block all outgoing syncs", colors.green)
		menu.trigger_commands("desyncall on")
	else
		notification("Unblock all outgoing syncs", colors.red)
		menu.trigger_commands("desyncall off")
	end
end)

menu.toggle(protex, "Anti Crash", {}, "This will render you uncrashable, Block All", function(on_toggle)
	local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
	local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
	local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
	local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
	if on_toggle then
		notification("toggling anti crash on... stay safe homie", colors.green)
		menu.trigger_commands("desyncall on")
		menu.trigger_command(BlockIncSyncs)
		menu.trigger_command(BlockNetEvents)
		menu.trigger_commands("anticrashcamera on")
	else
		notification("toggling anti crash off...", colors.red)
		menu.trigger_commands("desyncall off")
		menu.trigger_command(UnblockIncSyncs)
		menu.trigger_command(UnblockNetEvents)
		menu.trigger_commands("anticrashcamera off")
	end
end)

menu.click_slider(protex,"Clear Entities", {"cleararea"}, "1 = peds, 2 = vehicles, 3 = objects, 4 = pickups, 5 = all", 1, 5, 1, 1, function(on_change)
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
		notification(count .. "Clear Area Managed", colors.green)
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
		notification(count .. "Clear Area Managed", colors.green)
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
		notification(count .. "Clear Area Managed", colors.green)
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
		notification(count .. "Clear Area Managed", colors.green)
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
		notification(count .. "Clear Area Managed", colors.green)
		return
	end
end)

menu.action(protex, "Force Stop sound events", {"stopsounds"}, "", function()
	for i=-1,100 do
		AUDIO.STOP_SOUND(i)
		AUDIO.RELEASE_SOUND_ID(i)
	end
end)

menu.action(protex, "Remove Attachments", {"remove attachments"}, "Cleans your ped of all attachments by regenerating it", function()
	notification("Removing Attachments", colors.green)
	if PED.IS_PED_MALE(PLAYER.PLAYER_PED_ID()) then
		menu.trigger_commands("mpmale")
	else
		menu.trigger_commands("mpfemale")
	end
end)

menu.action(protex, "Ban Voice Chat", {}, "May lag your game when in progress, BETA", function()
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

Detex = menu.list(menu.my_root(), "Detections", {}, "", function(); end)

menu.toggle_loop(Detex, "Bypass Drip Feed Vehicle", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(unreleased_vehicles) do
            if modelHash == util.joaat(name) then
                notification("Is Driving An Unreleased Vehicle " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
            end
        end
    end
end)

menu.toggle_loop(Detex, "Rail Gun", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        for i, hash in ipairs(modded_weapons) do
            local weapon_hash = util.joaat(hash)
            if WEAPON.HAS_PED_GOT_WEAPON(player, weapon_hash, false) then
				notification("Is Using A Rail Gun " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
                break
            end
        end
    end
end)

menu.toggle_loop(Detex, "Weapon In Interior", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        if players.is_in_interior(pid) and WEAPON.IS_PED_ARMED(player, 7) then
			notification("Has A Weapon In An Interior " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
            break
        end
    end
end)

menu.toggle_loop(Detex, "Modded Animation", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        if PED.IS_PED_USING_ANY_SCENARIO(player) then
			notification("Is In A Modded Scenario " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
        end
    end 
end)

menu.toggle_loop(Detex, "Modded Vehicle", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(modded_vehicles) do
            if modelHash == util.joaat(name) then
				notification("Is Driving A Modded Vehicle " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
                break
            end
        end
    end
end)

menu.toggle_loop(Detex, "Super Run", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local ped_speed = (ENTITY.GET_ENTITY_SPEED(ped)* 2.236936)
        if not util.is_session_transition_active() and get_interior_player_is_in(pid) == 0 and get_transition_state(pid) ~= 0 and not PED.IS_PED_DEAD_OR_DYING(ped) 
        and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and not PED.IS_PED_IN_ANY_VEHICLE(ped, false)
        and not TASK.IS_PED_STILL(ped) and not PED.IS_PED_JUMPING(ped) and not ENTITY.IS_ENTITY_IN_AIR(ped) and not PED.IS_PED_CLIMBING(ped) and not PED.IS_PED_VAULTING(ped)
        and v3.distance(ENTITY.GET_ENTITY_COORDS(players.user_ped(), false), players.get_position(pid)) <= 300.0 and ped_speed > 30 then
			notification("Is Using Super Run " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
            break
        end
    end
end)

menu.toggle_loop(Detex, "Spectate", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        for i, interior in ipairs(interior_stuff) do
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            if not util.is_session_transition_active() and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior
            and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and not PED.IS_PED_DEAD_OR_DYING(ped) then
                if v3.distance(ENTITY.GET_ENTITY_COORDS(players.user_ped(), false), players.get_cam_pos(pid)) < 15.0 and v3.distance(ENTITY.GET_ENTITY_COORDS(players.user_ped(), false), players.get_position(pid)) > 20.0 then
					notification("Is Spectating You " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
                    break
                end
            end
        end
    end
end)

menu.toggle_loop(Detex, "Super Drive", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)
        local veh_speed = (ENTITY.GET_ENTITY_SPEED(vehicle)* 2.236936)
        local class = VEHICLE.GET_VEHICLE_CLASS(vehicle)
        if class ~= 15 and class ~= 16 and veh_speed >= 180 and VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1) and players.get_vehicle_model(pid) ~= util.joaat("oppressor") then -- not checking opressor mk1 cus its stinky
			notification("Is Using Super Drive " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
            break
        end
    end
end)

menu.toggle_loop(Detex, "No Clip", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local ped_ptr = entities.handle_to_pointer(ped)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)
        local oldpos = players.get_position(pid)
        util.yield()
        local currentpos = players.get_position(pid)
        local vel = ENTITY.GET_ENTITY_VELOCITY(ped)
        if not util.is_session_transition_active() and players.exists(pid)
        and get_interior_player_is_in(pid) == 0 and get_transition_state(pid) ~= 0
        and not PED.IS_PED_IN_ANY_VEHICLE(ped, false) 
        and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and not PED.IS_PED_DEAD_OR_DYING(ped)
        and not PED.IS_PED_CLIMBING(ped) and not PED.IS_PED_VAULTING(ped) and not PED.IS_PED_USING_SCENARIO(ped)
        and not TASK.GET_IS_TASK_ACTIVE(ped, 160) and not TASK.GET_IS_TASK_ACTIVE(ped, 2)
        and v3.distance(ENTITY.GET_ENTITY_COORDS(players.user_ped(), false), players.get_position(pid)) <= 395.0 
        and ENTITY.GET_ENTITY_HEIGHT_ABOVE_GROUND(ped) > 5.0 and not ENTITY.IS_ENTITY_IN_AIR(ped) and entities.player_info_get_game_state(ped_ptr) == 0
        and oldpos.x ~= currentpos.x and oldpos.y ~= currentpos.y and oldpos.z ~= currentpos.z 
        and vel.x == 0.0 and vel.y == 0.0 and vel.z == 0.0 then
			notification("Is Using NoClip " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
            break
        end
    end
end)

menu.toggle_loop(Detex, "Teleport", {}, "", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        if not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and not PED.IS_PED_DEAD_OR_DYING(ped) then
            local oldpos = players.get_position(pid)
            util.yield(250)
            local currentpos = players.get_position(pid)
            for i, interior in ipairs(interior_stuff) do
                if v3.distance(oldpos, currentpos) > 500 and oldpos.x ~= currentpos.x and oldpos.y ~= currentpos.y and oldpos.z ~= currentpos.z and get_interior_player_is_in(pid) == interior then
					notification("Is teleported " .. PLAYER.GET_PLAYER_NAME(pid), colors.yellow)
                end
            end
        end
    end
end)

veh = menu.list(menu.my_root(), "Vehicle Options", {}, "", function(); end)

local pedTable = {}
local copHash = util.joaat('s_m_y_cop_01')
menu.toggle_loop(veh, 'Player Target Mk II', {}, '', function()
    if getPlayerVehicleName(players.user_ped()) != 'Oppressor Mk II' then
        for pid, entity in pairs(pedTable) do
            entities.delete_by_handle(entity)
            pedTable[pid] = nil
        end
        return
    end
    STREAMING.REQUEST_MODEL(copHash)
	while not STREAMING.HAS_MODEL_LOADED(copHash) do
        util.yield() 
    end
    local playerList = players.list(false, true, true)
    for _, pid in pairs(playerList) do
        if not pedTable[pid] and PED.IS_PED_ON_FOOT(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) then
            pedTable[pid] = entities.create_ped(26, copHash, NETWORK._NETWORK_GET_PLAYER_COORDS(pid), 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(pedTable[pid], PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0, 0, 0, 0, 0, 0, 0, true, false, false, 0, false)
        end
    end
    for pid, entity in pairs(pedTable) do
        if ENTITY.IS_ENTITY_DEAD(entity) then
            pedTable[pid] = entities.create_ped(26, copHash, NETWORK._NETWORK_GET_PLAYER_COORDS(pid), 0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(pedTable[pid], PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 0, 0, 0, 0, 0, 0, 0, true, false, false, 0, false)
        end
        if not players.exists(pid) then
            entities.delete_by_handle(entity)
            pedTable[pid] = nil
        end
    end
end, function()
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(copHash)
    for pid, entity in pairs(pedTable) do
        entities.delete_by_handle(entity)
        pedTable[pid] = nil
    end
end)
---------------------------Online Player

GenerateFeatures = function(pid)

    menu.divider(menu.player_root(pid),"Aprio Script")
    parent  = menu.list(menu.player_root(pid), "Online Player" ,{}, "Online Player.", function();end)

	Vehicle = menu.list(parent, "Vehicle Options", {}, "", function(); end)

	menu.action(Vehicle, "Repair Vehicle", {"repairvehicle"}, "", function()
        control_vehicle(pid, function(vehicle)
            VEHICLE.SET_VEHICLE_FIXED(vehicle)
        end)
    end)

    menu.action(Vehicle, "Clean Vehicle", {"cleanvehicle"}, "", function()
        control_vehicle(pid, function(vehicle)
            GRAPHICS.REMOVE_DECALS_FROM_VEHICLE(vehicle)
            VEHICLE.SET_VEHICLE_DIRT_LEVEL(vehicle, 0.0)
        end)
    end)

    menu.action(Vehicle, "Kill Engine", {"killengine"}, "", function()
        control_vehicle(pid, function(vehicle)
            VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, -4000)
        end)
    end)

    menu.action(Vehicle, "Delete Vehicle", {"deletevehicle"}, "VEH_DELETE_DESC", function()
        control_vehicle(pid, function(vehicle)
            entities.delete_by_handle(vehicle)
        end)
    end)

    menu.action(Vehicle, "Change Station Radio", {}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        if not PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            util.toast("Player isn't in a vehicle. :/")
            return
        end
        AUDIO.SET_RADIO_TO_STATION_NAME("RADIO_22_DLC_BATTLE_MIX1_RADIO")
    end)

	Trolling_Options = menu.list(parent, "Trolling Options", {}, "", function(); end)

	menu.action(Trolling_Options,"Explode player", {"explode"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pId))
		pos.z = pos.z - 1.0
		FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 7, 1.0, true, false, 0, false)
	end)

	menu.action(Trolling_Options,"40.000 kw player", {"electrocute"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pId))
		pos.z = pos.z - 1.0
		FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 70, 1.0, true, false, 0, false)
	end)

	menu.toggle_loop(Trolling_Options,"Water Loop", {}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pId))
		pos.z = pos.z - 1.0
		FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 13, 1.0, true, false, 0, false)
	end)

	menu.toggle_loop(Trolling_Options,"Flame Loop", {}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pId))
		pos.z = pos.z - 1.0
		FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 12, 1.0, true, false, 0, false)
	end)

	SE_Options = menu.list(parent, "Script Event", {}, "", function(); end)

	passivemode = menu.list(SE_Options, "Passive Mode", {}, "", function(); end)

	menu.action(passivemode,"Block", {}, "", function()
		if players.exists(pid) then
			send_script_event(1920583171, pid, {pid, 1})
		end
	end)

	menu.action(passivemode,"Unblock", {}, "", function()
		if players.exists(pid) then
			send_script_event(1920583171, pid, {pid, 0})
		end
	end)

	Collectibles = menu.list(SE_Options, "Collectibles", {}, "", function(); end)

	menu.action(Collectibles, "Give RP", {}, "Gives them ~175k RP.", function()
        util.trigger_script_event(1 << pid, {697566862, pid, 5, 0, 1, 1, 1})
        for i = 0, 9 do
            util.trigger_script_event(1 << pid, {697566862, pid, 0, i, 1, 1, 1})
            util.trigger_script_event(1 << pid, {697566862, pid, 1, i, 1, 1, 1})
            util.trigger_script_event(1 << pid, {697566862, pid, 3, i, 1, 1, 1})
            util.trigger_script_event(1 << pid, {697566862, pid, 10, i, 1, 1, 1})
        end
        for i = 0, 1 do
            util.trigger_script_event(1 << pid, {697566862, pid, 2, i, 1, 1, 1})
            util.trigger_script_event(1 << pid, {697566862, pid, 6, i, 1, 1, 1})
        end
        for i = 0, 19 do
            util.trigger_script_event(1 << pid, {697566862, pid, 4, i, 1, 1, 1})
        end
        for i = 0, 99 do
            util.trigger_script_event(1 << pid, {697566862, pid, 9, i, 1, 1, 1})
            util.yield()
        end
    end)

	menu.action(SE_Options, "Force Casino CutScene", {}, "", function()
		if players.exists(pid) then
			send_script_event(392606458, pid, {0, pid})
		end
	end)

	menu.action(SE_Options, "Send To Perico", {}, "", function()
		if players.exists(pid) then
			send_script_event(-910497748, pid, {1, pid})
		end
	end)
	
	menu.click_slider(SE_Options,"Send To Perico V2", {"Party Time"}, "1 = Beach Party (Plane), 2 = Beach Party (Instant), 3 = Back Home (Airport), 4 = Back Home (Beach)", 1, 4, 1, 1, function(on_change)
		if on_change == 1 then
			send_script_event(-93722397, pid, {0, 0, 3, 1, pid})
		end
		if on_change == 2 then
			send_script_event(-93722397, pid, {0, 0, 4, 1, pid})
		end
		if on_change == 3 then
			send_script_event(-93722397, pid, {0, 0, 3, 0, pid})
		end
		if on_change == 4 then
			send_script_event(-93722397, pid, {0, 0, 4, 0, pid})
		end
	end)

	menu.action(SE_Options, "Send To Warehouse", {}, "", function()
		if players.exists(pid) then
			send_script_event(434937615, pid, {0, 1, math.random(1, 22), pid})
		end
	end)

	menu.action(SE_Options, "Force Freemode Mission", {}, "", function()
		if players.exists(pid) then
			send_script_event(243072129, pid, {263, 4294967295, pid})
		end
	end)

	entity = menu.list(parent, "Entity Crash", {}, "For Toxic Player and Possibilty Close Your Game...", function(); end)

	menu.action(entity,"Volatol Spam", {}, "spams volatols on target player, ", function()
		while not STREAMING.HAS_MODEL_LOADED(447548909) do
			STREAMING.REQUEST_MODEL(447548909)
			util.yield(10)
		end
		local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        local OldCoords = ENTITY.GET_ENTITY_COORDS(self_ped) 
		ENTITY.SET_ENTITY_COORDS_NO_OFFSET(self_ped, 24, 7643.5, 19, true, true, true)
		notification("Started lagging", colors.black)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
		spam_amount = 300
		while spam_amount >= 1 do
			entities.create_vehicle(447548909, PlayerPedCoords, 0)
			spam_amount = spam_amount - 1
			util.yield(10)
		end
		notification("Done", colors.green) 
	end)

	malicious = menu.list(parent, "Crash", {}, "", function(); end)

	menu.action(malicious, "Gentleman Crash", {}, "", function()
		menu.trigger_commands("smstext" .. PLAYER.GET_PLAYER_NAME(pid).. " " .. begcrash[math.random(1, #begcrash)])
		util.yield()
		menu.trigger_commands("smssend" .. PLAYER.GET_PLAYER_NAME(pid))
		util.yield(1500)
		if players.exists(pid) then
			send_script_event(879177392, pid, {1, math.random(2000000000, 2147483647), pid})	-- Script Teleport
			send_script_event(-904555865, pid, {0, math.random(2000000000, 2147483647), pid})
		end
		notification("Crash Complet!!!", colors.green)
	end)

	menu.action(malicious, "Sound Event Crash", {}, "", function()
		local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local time = util.current_time_millis() + 2000
        while time > util.current_time_millis() do
            local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
            for i = 1, 10 do
                AUDIO.PLAY_SOUND_FROM_COORD(-1, '5s', TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, 'MP_MISSION_COUNTDOWN_SOUNDSET', true, 1000, false)
            end
            util.yield()
        end	
		notification("Crash Complet!!!", colors.green)
    end)

    menu.toggle_loop(malicious, "Object Crash", {""}, "By 0xDEADBEEF and 𝓒𝓪𝓷𝓭𝔂", function()
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
		local object = entities.create_object(util.joaat("prop_paints_pallete01"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
        util.yield(300)
    end)

	menu.action(malicious, "Rope Crash", {}, "Crash Lobby", function()
		local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)

        TargetPlayerPos.x = TargetPlayerPos.x + 10

        local carc = CreateVehicle(2598821281, TargetPlayerPos, ENTITY.GET_ENTITY_HEADING(SelfPlayerPed), true)
        local carcPos = ENTITY.GET_ENTITY_COORDS(vehicle, true)
        local pedc = CreatePed(26, 2597531625, TargetPlayerPos, 0)
        local pedcPos = ENTITY.GET_ENTITY_COORDS(vehicle, true)

        local ropec = PHYSICS.ADD_ROPE(TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, 0, 0, 0, 1, 1, 0.00300000000000000000000000000000000000000000000001, 1, 1, true, true, true, 1.0, true, 0)
        PHYSICS.ATTACH_ENTITIES_TO_ROPE(ropec,carc,pedc,carcPos.x, carcPos.y, carcPos.z ,pedcPos.x, pedcPos.y, pedcPos.z,2, false, false, 0, 0, "Center","Center")
        util.yield(2500)
        local _ropec = memory.alloc_int()
		memory.write_int(_ropec, ropec)
		PHYSICS.DELETE_ROPE(_ropec)
        entities.delete_by_handle(carc)
        entities.delete_by_handle(pedc)
		notification("Crash Complet!!!", colors.green)
    end)

	menu.action(malicious, "Parachute Crash", {}, "Crash Lobby", function()
        local user = players.user()
        local user_ped = players.user_ped()
        local model = util.joaat("v_res_tt_fridge") 
            util.yield(100)
            ENTITY.SET_ENTITY_VISIBLE(user_ped, false)
            for i = 0, 110 do
                PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(user, model)
                PED.SET_PED_COMPONENT_VARIATION(user_ped, 5, i, 0, 0)
                util.yield(50)
                PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(user)
            end
            util.yield(250)
            ENTITY.SET_ENTITY_HEALTH(user_ped, 0) 
            local pos = players.get_position(user)
            NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(pos.x, pos.y, pos.z, 0, false, false, 0)
            ENTITY.SET_ENTITY_VISIBLE(user_ped, true)
			notification("Crash Complet!!!", colors.green)
    end)
end

---------------listener

players.on_join(GenerateFeatures)
for pid = 0,30 do 
	if players.exists(pid) then
		GenerateFeatures(pid)
	end
end

while true do
	if uncageMe then 
		uncage(players.user_ped())
	end
	util.yield(10)
end