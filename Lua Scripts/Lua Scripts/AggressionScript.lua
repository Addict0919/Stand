util.keep_running()
util.require_natives(1660775568)
--Made by Axhov#
--Demote Aero

wait = util.yield

function request_model(model)
	STREAMING.REQUEST_MODEL(model)
	while not STREAMING.HAS_MODEL_LOADED(model) do util.yield_once() end
end

if SCRIPT_MANUAL_START and not SCRIPT_SILENT_START then
	util.toast("Welcome to Aggression Script.. I love you.")
end

function request_model_load(hash)
    request_time = os.time()
    if not STREAMING.IS_MODEL_VALID(hash) then
        return
    end
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        if os.time() - request_time >= 10 then
            break
        end
        util.yield()
    end
end

function addBlipForEntity(entity, blipSprite, colour)
	local blip = HUD.ADD_BLIP_FOR_ENTITY(entity)
	HUD.SET_BLIP_SPRITE(blip, blipSprite)
	HUD.SET_BLIP_COLOUR(blip, colour)
	HUD.SHOW_HEIGHT_ON_BLIP(blip, false)
	HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(ENTITY.GET_ENTITY_HEADING(entity)))
	NETWORK.SET_NETWORK_ID_CAN_MIGRATE(entity, false)
	util.create_thread(function()
		while not ENTITY.IS_ENTITY_DEAD(entity) do
			local heading = ENTITY.GET_ENTITY_HEADING(entity)
			HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(heading))
		wait()
		end
			
		if ENTITY.IS_ENTITY_DEAD(entity) then
			util.remove_blip(blip)
		end
	end)
	return blip
end

function smolblip(entity, blipSprite, colour)
	local blip = HUD.ADD_BLIP_FOR_ENTITY(entity)
	HUD.SET_BLIP_SPRITE(blip, blipSprite)
	HUD.SET_BLIP_COLOUR(blip, colour)
	HUD.SHOW_HEIGHT_ON_BLIP(blip, false)
	HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(ENTITY.GET_ENTITY_HEADING(entity)))
	NETWORK.SET_NETWORK_ID_CAN_MIGRATE(entity, false)
	HUD.SET_BLIP_SCALE(blip, 0.5)
	util.create_thread(function()
		while not ENTITY.IS_ENTITY_DEAD(entity) do
			local heading = ENTITY.GET_ENTITY_HEADING(entity)
			HUD.SET_BLIP_ROTATION(blip, SYSTEM.CEIL(heading))
		wait()
		end
			
		if ENTITY.IS_ENTITY_DEAD(entity) then
			util.remove_blip(blip)
		end
	end)
	return blip
end

local function player(pid)
    menu.divider(menu.player_root(pid), "Aggression Script")
    local ast = menu.list(menu.player_root(pid), "Aggression Script", {"asc"}, "eee")
	asatk = menu.list(ast, "Attackers", {"asatk"}, "Send attackers")
	asc = menu.list(ast, "Crush", {"asc"}, "")
	asr = menu.list(ast, "Ram", {"asr"}, "")
	asht = menu.list(asatk, "Hostile Traffic Options", {"asht"}, "Hostile Traffic options")
	ascm = menu.list(asatk, "Cop Mods", {"ascm"}, "Custom Police attackers, and modifications to apply to police spawned by the game.")
	asa = menu.list(asatk, "Marine Variants", {"asa"}, "we are the army. run run. we are the army. run run.")
	
	
	menu.action(asc, "Crush player", {"crush"}, "Like LanceScript's crush but with velocity. Might be buggy and miss if the target is moving or far away.", function(on_click)
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        coords = ENTITY.GET_ENTITY_COORDS(target_ped, false)
        coords.x = coords['x']
        coords.y = coords['y']
        coords.z = coords['z'] + 20.0
        request_model(1917016601)
        local truck = entities.create_vehicle(1917016601, coords, 0.0)
        local vel = ENTITY.GET_ENTITY_VELOCITY(vel)
        ENTITY.SET_ENTITY_VELOCITY(truck, vel['x'], vel['y'], -100.0)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED(truck, 3)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(truck, true)
		wait(2000)
		entities.delete_by_handle(truck)
    end)

	menu.action(asc, "Crush player (Faggio)", {"crush2"}, "Spawns a Faggio to crush them in case your target is standing next to a light pole or other situations where the truck would miss.", function(on_click)
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        coords = ENTITY.GET_ENTITY_COORDS(target_ped, false)
        coords.x = coords['x']
        coords.y = coords['y']
        coords.z = coords['z'] + 20.0
        request_model(util.joaat("faggio2"))
        local truck = entities.create_vehicle(util.joaat("faggio2"), coords, 0.0)
        local vel = ENTITY.GET_ENTITY_VELOCITY(vel)
        ENTITY.SET_ENTITY_VELOCITY(truck, vel['x'], vel['y'], -200.0)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED(truck, 3)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(truck, true)
		wait(2000)
		entities.delete_by_handle(truck)
    end)
	
	menu.action(asc, "Crush player (Clown)", {"crush3"}, "Show them they are a clown", function(on_click)
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        coords = ENTITY.GET_ENTITY_COORDS(target_ped, false)
        coords.x = coords['x']
        coords.y = coords['y']
        coords.z = coords['z'] + 20.0
        request_model(util.joaat("speedo2"))
        local truck = entities.create_vehicle(util.joaat("speedo2"), coords, 0.0)
        local vel = ENTITY.GET_ENTITY_VELOCITY(vel)
        ENTITY.SET_ENTITY_VELOCITY(truck, vel['x'], vel['y'], -200.0)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED(truck, 3)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(truck, true)
		wait(2000)
		entities.delete_by_handle(truck)
    end)

	menu.action(asc, "Crush player (Invisible)", {"crush4"}, "", function(on_click)
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        coords = ENTITY.GET_ENTITY_COORDS(target_ped, false)
        coords.x = coords['x']
        coords.y = coords['y']
        coords.z = coords['z'] + 20.0
        request_model(1917016601)
        local truck = entities.create_vehicle(1917016601, coords, 0.0)
        local vel = ENTITY.GET_ENTITY_VELOCITY(vel)
        ENTITY.SET_ENTITY_VELOCITY(truck, vel['x'], vel['y'], -200.0)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED(truck, 3)
		ENTITY.SET_ENTITY_VISIBLE(truck, false, 0)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(truck, true)
		wait(2000)
		entities.delete_by_handle(truck)
    end)

	menu.action(asc, "Crush player (Invisible Faggio)", {"crush5"}, ".", function(on_click)
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        coords = ENTITY.GET_ENTITY_COORDS(target_ped, false)
        coords.x = coords['x']
        coords.y = coords['y']
        coords.z = coords['z'] + 20.0
        request_model(util.joaat("faggio2"))
        local truck = entities.create_vehicle(util.joaat("faggio2"), coords, 0.0)
        local vel = ENTITY.GET_ENTITY_VELOCITY(vel)
        ENTITY.SET_ENTITY_VELOCITY(truck, vel['x'], vel['y'], -200.0)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED(truck, 3)
		ENTITY.SET_ENTITY_VISIBLE(truck, false, 0)
		VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(truck, true)
		wait(2000)
		entities.delete_by_handle(truck)
    end)
	
	menu.toggle_loop(asht, ('Hostile traffic'), {'hostiletraffic'}, 'All peds in vehicles near the player will maliciously run over or hit the player like a dumb low level. Ported from wiriscript.', function()
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		for k, vehicle in pairs(GET_NEARBY_VEHICLES(pid, 2050)) do	
			if not VEHICLE.IS_VEHICLE_SEAT_FREE(vehicle, -1) then
				local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)
				if not PED.IS_PED_A_PLAYER(driver) then
					REQUEST_CONTROL_LOOP(driver)
					PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
					PED.SET_PED_MAX_HEALTH(driver, 300)
					ENTITY.SET_ENTITY_HEALTH(driver, 300)
					VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 40)
					TASK.CLEAR_PED_TASKS_IMMEDIATELY(driver)
					VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
					PED.SET_PED_INTO_VEHICLE(driver, vehicle, -1)
					PED.SET_PED_COMBAT_ATTRIBUTES(driver, 46, true)
					TASK.TASK_COMBAT_PED(driver, player_ped, 0, 0)
					TASK.TASK_VEHICLE_MISSION_PED_TARGET(driver, vehicle, player_ped, 6, 100, 0, 0, 0, true)
					wait(10)
				end
			end
		end
	end)

	menu.toggle_loop(asht, ('Toxic traffic'), {'toxictraffic'}, 'Hostile traffic, but it speeds up the car, locks the door, makes the vehicles in range invulnerable, and makes the occupant invulnerable.', function()
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		for k, vehicle in pairs(GET_NEARBY_VEHICLES(pid, 2000)) do	
			if not VEHICLE.IS_VEHICLE_SEAT_FREE(vehicle, -1) then
				local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)
				if not PED.IS_PED_A_PLAYER(driver) then 
					REQUEST_CONTROL_LOOP(driver)
					PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
					PED.SET_PED_MAX_HEALTH(driver, 300)
					ENTITY.SET_ENTITY_INVINCIBLE(driver, true)
					ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
					VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
					VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle,-1, 3)
					TASK.CLEAR_PED_TASKS_IMMEDIATELY(driver)
					PED.SET_PED_INTO_VEHICLE(driver, vehicle, -1)
					PED.SET_PED_COMBAT_ATTRIBUTES(driver, 46, true)
					TASK.TASK_COMBAT_PED(driver, player_ped, 0, 0)
					TASK.TASK_VEHICLE_MISSION_PED_TARGET(driver, vehicle, player_ped, 6, 100, 0, 0, 0, true)
					wait(10)
				end
			end
		end
	end)

	menu.action(asht, ('Calm Down Traffic'), {'tcalm'}, 'does what it says. Wont work if the above options are on.', function()
	local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	for k, vehicle in pairs(GET_NEARBY_VEHICLES(pid, 2050)) do	
		if not VEHICLE.IS_VEHICLE_SEAT_FREE(vehicle, -1) then
			local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)
			if not PED.IS_PED_A_PLAYER(driver) then
					REQUEST_CONTROL_LOOP(driver)
					PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, false)
					TASK.CLEAR_PED_TASKS_IMMEDIATELY(driver)
					PED.SET_PED_COMBAT_ATTRIBUTES(driver, 46, false)
					PED.SET_PED_INTO_VEHICLE(driver, vehicle, -1)
				end
			end
		end
	end)
	
		menu.action(asht, "Send Annoying npc", {"sendmocc"}, "Sends an npc to ram them or run them over. Spawns on roads.", function(on_click)
		local retard = util.joaat("a_f_m_bevhills_01")
		local car1 = 499169875
		local car2 = -1651067813
		local car3 = -1137532101
		local car4 = 904750859
		local car5 = 1348744438
		local veh = random{499169875,  904750859,  -1137532101, -1651067813, 499169875}
		requestModels(car1, car2, car3, car4, car5, retard)
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local vehicle = entities.create_vehicle(veh, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
			return
		end

		local offset = getOffsetFromEntityGivenDistance(vehicle, 50.0)
		local outCoords = v3.new()
		local outHeading = memory.alloc()

		if PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(offset.x, offset.y, offset.z, outCoords, outHeading, 1, 3.0, 0) then
			ENTITY.SET_ENTITY_COORDS(vehicle, v3.getX(outCoords), v3.getY(outCoords), v3.getZ(outCoords))
			ENTITY.SET_ENTITY_HEADING(vehicle, memory.read_float(outHeading))
			VEHICLE.SET_VEHICLE_SIREN(vehicle, true)
			VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
			for seat = -1, -1 do
				local cop = entities.create_ped(5, retard, outCoords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
				PED.SET_PED_INTO_VEHICLE(cop, vehicle, seat)
				PED.SET_PED_RANDOM_COMPONENT_VARIATION(cop, 0)
				PED.SET_PED_NEVER_LEAVES_GROUP(cop, true)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vehicle, true)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle,-1, 3)
				TASK.TASK_COMBAT_PED(cop, targetPed, 0, 16)
				PED.SET_PED_KEEP_TASK(cop, true)
				PED.SET_PED_COMBAT_ATTRIBUTES(cop, 3, true)
				VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
				TASK.TASK_VEHICLE_MISSION_PED_TARGET(cop, vehicle, targetPed, 6, 100, 0, 0, 0, true)
			end
		end
		v3.free(outCoords)
		memory.free(outHeading)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedHash)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(car1)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(car2)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(car3)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(car4)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(car5)
	end)

function requestModels(...)
	local arg = {...}
	for _, model in ipairs(arg) do
		if not STREAMING.IS_MODEL_VALID(model) then
			util.toast(model)
			error("tried to request an invalid model")
		end
		STREAMING.REQUEST_MODEL(model)
		while not STREAMING.HAS_MODEL_LOADED(model) do
			wait()
		end
	end
end

	menu.action(asht, "Send Guadalupe", {"sendgua"}, "A nice Mexican grandmother who's had enough of your shit", function(on_click)
		local vehicleHash = util.joaat("seminole")
		local pedHash = 261428209
		requestModels(vehicleHash, pedHash)
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local vehicle = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
			return
		end

		local offset = getOffsetFromEntityGivenDistance(vehicle, 50.0)
		local outCoords = v3.new()
		local outHeading = memory.alloc()

		if PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(offset.x, offset.y, offset.z, outCoords, outHeading, 1, 3.0, 0) then
			ENTITY.SET_ENTITY_COORDS(vehicle, v3.getX(outCoords), v3.getY(outCoords), v3.getZ(outCoords))
			ENTITY.SET_ENTITY_HEADING(vehicle, memory.read_float(outHeading))
			VEHICLE.SET_VEHICLE_SIREN(vehicle, true)
			VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
			for seat = -1, -1 do
				local cop = entities.create_ped(2, pedHash, outCoords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
				PED.SET_PED_INTO_VEHICLE(cop, vehicle, seat)
				TASK.TASK_COMBAT_PED(cop, targetPed, 0, 16)
				PED.SET_PED_KEEP_TASK(cop, true)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vehicle, true)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle,-1, 3)
				PED.SET_PED_COMBAT_ATTRIBUTES(cop, 46, true)
				PED.SET_PED_COMBAT_ATTRIBUTES(cop, 3, false)
				PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(cop, true)
				VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
				ENTITY.SET_ENTITY_INVINCIBLE(cop, true)
				ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
				VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 0)
				PED.SET_PED_NEVER_LEAVES_GROUP(cop, true)
				TASK.TASK_VEHICLE_MISSION_PED_TARGET(cop, vehicle, targetPed, 6, 100, 0, 0, 0, true)
			end
		end
		v3.free(outCoords)
		memory.free(outHeading)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedHash)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicleHash)
	end)
	

	menu.action(asht, "Send Guadalupe Non God-Mode", {"sendgua2"}, "", function(on_click)
		local vehicleHash = util.joaat("seminole")
		local pedHash = 261428209
		requestModels(vehicleHash, pedHash)
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local vehicle = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
			return
		end

		local offset = getOffsetFromEntityGivenDistance(vehicle, 50.0)
		local outCoords = v3.new()
		local outHeading = memory.alloc()

		if PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(offset.x, offset.y, offset.z, outCoords, outHeading, 1, 3.0, 0) then
			ENTITY.SET_ENTITY_COORDS(vehicle, v3.getX(outCoords), v3.getY(outCoords), v3.getZ(outCoords))
			ENTITY.SET_ENTITY_HEADING(vehicle, memory.read_float(outHeading))
			VEHICLE.SET_VEHICLE_SIREN(vehicle, true)
			VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
			for seat = -1, -1 do
				local cop = entities.create_ped(2, pedHash, outCoords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
				PED.SET_PED_INTO_VEHICLE(cop, vehicle, seat)
				TASK.TASK_COMBAT_PED(cop, targetPed, 0, 16)
				PED.SET_PED_KEEP_TASK(cop, true)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vehicle, true)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle,-1, 3)
				PED.SET_PED_COMBAT_ATTRIBUTES(cop, 46, true)
				PED.SET_PED_COMBAT_ATTRIBUTES(cop, 3, false)
				PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(cop, true)
				VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
				VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 0)
				PED.SET_PED_NEVER_LEAVES_GROUP(cop, true)
				TASK.TASK_VEHICLE_MISSION_PED_TARGET(cop, vehicle, targetPed, 6, 100, 0, 0, 0, true)
			end
		end
		v3.free(outCoords)
		memory.free(outHeading)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedHash)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicleHash)
	end)
	
	menu.toggle_loop(ascm, "Cracked Cops", {"combat3"}, "Makes police spawned by the game super cracked, increasing their accuracy and combat ability, as well as making their vehicle faster. There is a 0.5 second delay added to this loop due to npcs straight up not shooting with slower/ no delays in the loop.", function(on)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		for _, ped in ipairs(GET_NEARBY_PEDS(pid, 250)) do
		local pt = PED.GET_PED_TYPE(ped)
			if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_HURT(ped) then
				if pt == 6 or pt == 27 then -- 6 is police, 27 is swat
					REQUEST_CONTROL_LOOP(ped)
					PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
					PED.SET_PED_COMBAT_ATTRIBUTES(ped, 2, true)
					PED.SET_PED_FLEE_ATTRIBUTES(ped, 512, false)
					PED.SET_PED_SUFFERS_CRITICAL_HITS(ped, false)
					WEAPON.GIVE_WEAPON_TO_PED(ped, 4208062921, 9999, false, true)
					WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x8B3C480B)
					WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x4DB62ABE)
					WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x5DD5DBD5)
					WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x9D65907A)
					WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x420FD713)
					WEAPON.SET_PED_DROPS_WEAPONS_WHEN_DEAD(ped, false)
					PED.SET_PED_SHOOT_RATE(ped, 10)
					ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
					WEAPON.SET_PED_INFINITE_AMMO_CLIP(ped, true)
					ENTITY.SET_ENTITY_HEALTH(ped, 150)
					PED.SET_PED_MAX_HEALTH(ped, 150)
					PED.SET_PED_CONFIG_FLAG(ped, 281, true)
					PED.SET_PED_CONFIG_FLAG(ped, 2, true)
					PED.SET_PED_CONFIG_FLAG(ped, 33, false)
					PED.SET_PED_COMBAT_ATTRIBUTES(ped, 5, true)
					PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
					PED.SET_PED_ARMOUR(ped, 100)
					if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
						local veh = PED.GET_VEHICLE_PED_IS_IN(ped, false)
						VEHICLE.MODIFY_VEHICLE_TOP_SPEED(veh, 80)
						VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(veh, true)
						VEHICLE.SET_VEHICLE_DOORS_LOCKED(veh,-1, 3)
						WEAPON.GIVE_WEAPON_TO_PED(ped, 584646201 , 9999, false, true)
						PED.SET_PED_FIRING_PATTERN(ped, -957453492)
					else
						WEAPON.GIVE_WEAPON_TO_PED(ped, 4208062921, 9999, false, true)
						WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x8B3C480B)
						WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x4DB62ABE)
						WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x5DD5DBD5)
						WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x9D65907A)
						WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(ped, 4208062921, 0x420FD713)
						PED.SET_PED_FIRING_PATTERN(ped, -957453492)
					end
					wait(100)
				end
			end
		end
	end)
	
	menu.toggle_loop(ascm, "Always Aggro Cops", {"copmagnet"}, "Player always aggros cops even after death. Works with other attackers as well.", function(on)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) -- gets the player 
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped) -- gets the players coords, defines it as "pos"
		for _, ped in ipairs(GET_NEARBY_PEDS(pid, 2500)) do -- executes everything under this line for all peds this many units from the player
		local pt = PED.GET_PED_TYPE(ped) -- gets the types of peds in this area
			if not PED.IS_PED_A_PLAYER(ped) then  -- if the ped is not a player, execute everything under this line
				if pt == 6 or pt == 27 then -- if the ped type is 6 or 27, execute everything under this line. 6 is police, 27 is swat
					REQUEST_CONTROL_LOOP(ped) -- requests control
					TASK.TASK_COMBAT_PED(ped, player_ped, 0, 0) --makes them fight the target
				end
			end
		wait(30)
		end
	end)

	menu.action(ascm, "Delete Attackers", {"atkyeet"}, "deletes attackers as well as any police or noose units near the player.", function(on_click)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid) 
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		for _, ped in ipairs(GET_NEARBY_PEDS(pid, 2500)) do
		local pt = PED.GET_PED_TYPE(ped)
			if not PED.IS_PED_A_PLAYER(ped) then  
				if pt == 6 or pt == 27 then -- 
					entities.delete_by_handle(ped)
				end
			end
		end
	end)

	menu.action(ascm, "FIB Ground Unit", {"fibgr"}, "", function(on_click)
		local pedHash = 1558115333 
		requestModels(pedHash)
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local offset = getOffsetFromEntityGivenDistance(targetPed, 40.0)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local outCoords = v3.new()
		local outHeading = memory.alloc()
		local pod = entities.create_ped(28, pedHash, pos, 30.0)

		if PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(offset.x, offset.y, offset.z, outCoords, outHeading, 1, 3.0, 0) then
			ENTITY.SET_ENTITY_COORDS(pod, v3.getX(outCoords), v3.getY(outCoords), v3.getZ(outCoords))
			ENTITY.SET_ENTITY_HEADING(pod, memory.read_float(outHeading))
		end
		WEAPON.GIVE_WEAPON_TO_PED(pod, 4208062921, 9999, false, true)
		WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(pod, 4208062921, 0x8B3C480B)
		WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(pod, 4208062921, 0x4DB62ABE)
		WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(pod, 4208062921, 0x5DD5DBD5)
		WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(pod, 4208062921, 0x9D65907A)
		WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(pod, 4208062921, 0x420FD713)
		PED.SET_PED_FIRING_PATTERN(pod, -957453492)
		PED.SET_PED_AS_COP(pod, true)
		smolblip(pod, 3, 0)
		PED.SET_PED_CONFIG_FLAG(pod, 281, true)
		PED.SET_PED_CONFIG_FLAG(pod, 2, true)
		PED.SET_PED_CONFIG_FLAG(pod, 33, false)
		PED.SET_PED_COMBAT_ATTRIBUTES(pod, 5, true)
		PED.SET_PED_COMBAT_ATTRIBUTES(pod, 46, true)
		PED.SET_PED_ACCURACY(pod, 100.0)
		PED.SET_PED_HEARING_RANGE(pod, 99999)
		PED.SET_PED_RANDOM_COMPONENT_VARIATION(pod, 0)
		PED.SET_PED_SUFFERS_CRITICAL_HITS(pod, false)
		PED.SET_PED_MAX_HEALTH(pod, 150)
		ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
		ENTITY.SET_ENTITY_HEALTH(pod, 150)
		PED.SET_PED_ARMOUR(pod, 100)
		PED.SET_PED_SHOOT_RATE(pod, 5)
		TASK.TASK_COMBAT_PED(pod, targetPed, 0, 16)
		if gutask then
			PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pod, true)
		end
		
		
	end)

		menu.toggle(ascm, "Ground Unit Always Attacks", {""}, "", function(on)
		gutask = on
	end)
	
	menu.action(ascm, "FIB Attack", {"fibatk"}, "can be hard to escape from no matter the car, as long as it cant fly", function(on_click)
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicleHash = util.joaat("krieger")
		local pedHash = 1558115333 
		requestModels(vehicleHash, pedHash)
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local vehicle = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
			return
		end

		local offset = getOffsetFromEntityGivenDistance(vehicle, 50.0)
		local outCoords = v3.new()
		local outHeading = memory.alloc()

		if PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(offset.x, offset.y, offset.z, outCoords, outHeading, 1, 3.0, 0) then
			ENTITY.SET_ENTITY_COORDS(vehicle, v3.getX(outCoords), v3.getY(outCoords), v3.getZ(outCoords))
			ENTITY.SET_ENTITY_HEADING(vehicle, memory.read_float(outHeading))
			VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
		end
        for i=-1, VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle) - 1 do
            local clown = entities.create_ped(2, pedHash, outCoords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            PED.SET_PED_INTO_VEHICLE(clown, vehicle, i)
            if i % 2 == 0 then
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 9999, false, true)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            else
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 9999, false, true)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
			PED.SET_PED_AS_COP(clown, true)
			addBlipForEntity(vehicle, 672, 40)
			PED.SET_PED_CONFIG_FLAG(clown, 281, true)
			PED.SET_PED_CONFIG_FLAG(clown, 2, true)
			PED.SET_PED_CONFIG_FLAG(clown, 33, false)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 5, true)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 46, true)
			PED.SET_PED_ACCURACY(clown, 100.0)
			PED.SET_PED_HEARING_RANGE(clown, 99999)
			PED.SET_PED_RANDOM_COMPONENT_VARIATION(clown, 0)
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 3)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "FIB")
			VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(vehicle, false)
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
			PED.SET_PED_MAX_HEALTH(clown, 150)
			ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
			ENTITY.SET_ENTITY_HEALTH(clown, 150)
			PED.SET_PED_ARMOUR(clown, 100)
			PED.SET_PED_SHOOT_RATE(clown, 5)
			VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
			VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0) --black
			VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, 0, 0, 0)
			VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, 3, 0, 0) --matte finish
			VEHICLE.SET_VEHICLE_MOD_COLOR_2(vehicle, 3, 0, 0)-- matte secondary
			VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 11) --street wheel type
			PED.SET_PED_SUFFERS_CRITICAL_HITS(clown, false)
			VEHICLE.SET_VEHICLE_MOD(vehicle, 0, 3) --spoiler
			VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 0)--wheel type?
			VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, 0, 0) --wheel color
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 4) --plate type, 4 is SA EXEMPT which law enforcement and government vehicles use
			if godmodeatk then
				ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			end
			if pcar then 
				PED.SET_PED_COMBAT_ATTRIBUTES(clown, 3, false)
			end
			if d then
				PED.SET_AI_WEAPON_DAMAGE_MODIFIER(clown, 3000000)
			end
            if i == -1 then
                TASK.TASK_VEHICLE_CHASE(clown, player_ped)
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 1000, false, true)
            else
                TASK.TASK_COMBAT_PED(clown, player_ped, 0, 16)
				WEAPON.GIVE_WEAPON_TO_PED(clown, 4208062921, 9999, false, true)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x8B3C480B)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x4DB62ABE)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x5DD5DBD5)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x9D65907A)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x420FD713)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
        end
    end)


	menu.action(ascm, "FIB Van", {"fibatk"}, "can be hard to escape from no matter the car, as long as it cant fly", function(on_click)
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicleHash = util.joaat("fbi2")
		local pedHash = 1558115333
		requestModels(vehicleHash, pedHash)
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local vehicle = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
			return
		end

		local offset = getOffsetFromEntityGivenDistance(vehicle, 50.0)
		local outCoords = v3.new()
		local outHeading = memory.alloc()

		if PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(offset.x, offset.y, offset.z, outCoords, outHeading, 1, 3.0, 0) then
			ENTITY.SET_ENTITY_COORDS(vehicle, v3.getX(outCoords), v3.getY(outCoords), v3.getZ(outCoords))
			ENTITY.SET_ENTITY_HEADING(vehicle, memory.read_float(outHeading))
			VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
		end
        for i=-1, VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle) - 1 do
            local clown = entities.create_ped(2, pedHash, outCoords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            PED.SET_PED_INTO_VEHICLE(clown, vehicle, i)
            if i % 2 == 0 then
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 9999, false, true)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            else
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 9999, false, true)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
			PED.SET_PED_AS_COP(clown, true)
			addBlipForEntity(vehicle, 812, 40)
			PED.SET_PED_CONFIG_FLAG(clown, 281, true)
			PED.SET_PED_CONFIG_FLAG(clown, 2, true)
			PED.SET_PED_CONFIG_FLAG(clown, 33, false)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 5, true)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 46, true)
			PED.SET_PED_ACCURACY(clown, 100.0)
			PED.SET_PED_HEARING_RANGE(clown, 99999)
			PED.SET_PED_RANDOM_COMPONENT_VARIATION(clown, 0)
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 3)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "FIB")
			VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(vehicle, false)
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
			PED.SET_PED_MAX_HEALTH(clown, 150)
			ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
			ENTITY.SET_ENTITY_HEALTH(clown, 150)
			PED.SET_PED_ARMOUR(clown, 100)
			PED.SET_PED_SHOOT_RATE(clown, 5)
			VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
			VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0) --black
			VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, 0, 0, 0)
			VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, 3, 0, 0) --matte finish
			VEHICLE.SET_VEHICLE_MOD_COLOR_2(vehicle, 3, 0, 0)-- matte secondary
			VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 11) --street wheel type
			PED.SET_PED_SUFFERS_CRITICAL_HITS(clown, false)
			VEHICLE.SET_VEHICLE_MOD(vehicle, 0, 3) --spoiler
			VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 0)--wheel type?
			VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, 0, 0) --wheel color
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 4) --plate type, 4 is SA EXEMPT which law enforcement and government vehicles use
			if godmodeatk then
				ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			end
			if pcar then 
				PED.SET_PED_COMBAT_ATTRIBUTES(clown, 3, false)
			end
			if d then
				PED.SET_AI_WEAPON_DAMAGE_MODIFIER(clown, 3000000)
			end
            if i == -1 then
                TASK.TASK_VEHICLE_CHASE(clown, player_ped)
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 1000, false, true)
            else
                WEAPON.GIVE_WEAPON_TO_PED(clown, 4208062921, 9999, false, true)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x8B3C480B)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x4DB62ABE)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x5DD5DBD5)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x9D65907A)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x420FD713)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
        end
    end)

	menu.action(ascm, "FIB Cruisier", {"fibc"}, "FIB c", function(on_click)
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicleHash = util.joaat("police4")
		local pedHash = 1558115333
		requestModels(vehicleHash, pedHash)
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local vehicle = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
			return
		end

		local offset = getOffsetFromEntityGivenDistance(vehicle, 50.0)
		local outCoords = v3.new()
		local outHeading = memory.alloc()

		if PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(offset.x, offset.y, offset.z, outCoords, outHeading, 1, 3.0, 0) then
			ENTITY.SET_ENTITY_COORDS(vehicle, v3.getX(outCoords), v3.getY(outCoords), v3.getZ(outCoords))
			ENTITY.SET_ENTITY_HEADING(vehicle, memory.read_float(outHeading))
			VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
		end
        for i=-1, VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle) - 1 do
            local clown = entities.create_ped(2, pedHash, outCoords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            PED.SET_PED_INTO_VEHICLE(clown, vehicle, i)
            if i % 2 == 0 then
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 9999, false, true)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            else
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 9999, false, true)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
			PED.SET_PED_AS_COP(clown, true)
			addBlipForEntity(vehicle, 812, 40)
			PED.SET_PED_CONFIG_FLAG(clown, 281, true)
			PED.SET_PED_CONFIG_FLAG(clown, 2, true)
			PED.SET_PED_CONFIG_FLAG(clown, 33, false)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 5, true)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 46, true)
			PED.SET_PED_ACCURACY(clown, 100.0)
			PED.SET_PED_HEARING_RANGE(clown, 99999)
			PED.SET_PED_RANDOM_COMPONENT_VARIATION(clown, 0)
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 3)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "FIB")
			VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(vehicle, false)
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
			PED.SET_PED_MAX_HEALTH(clown, 150)
			ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
			ENTITY.SET_ENTITY_HEALTH(clown, 150)
			PED.SET_PED_ARMOUR(clown, 100)
			PED.SET_PED_SHOOT_RATE(clown, 5)
			VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
			VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0) --black
			VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, 0, 0, 0)
			VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, 3, 0, 0) --matte finish
			VEHICLE.SET_VEHICLE_MOD_COLOR_2(vehicle, 3, 0, 0)-- matte secondary
			VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 11) --street wheel type
			PED.SET_PED_SUFFERS_CRITICAL_HITS(clown, false)
			VEHICLE.SET_VEHICLE_MOD(vehicle, 0, 3) --spoiler
			VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 0)--wheel type?
			VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, 0, 0) --wheel color
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 4) --plate type, 4 is SA EXEMPT which law enforcement and government vehicles use
			if godmodeatk then
				ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			end
			if pcar then 
				PED.SET_PED_COMBAT_ATTRIBUTES(clown, 3, false)
			end
			if d then
				PED.SET_AI_WEAPON_DAMAGE_MODIFIER(clown, 3000000)
			end
            if i == -1 then
                TASK.TASK_VEHICLE_CHASE(clown, player_ped)
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 1000, false, true)
            else
                TASK.TASK_COMBAT_PED(clown, player_ped, 0, 16)
				WEAPON.GIVE_WEAPON_TO_PED(clown, 4208062921, 9999, false, true)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x8B3C480B)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x4DB62ABE)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x5DD5DBD5)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x9D65907A)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x420FD713)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
        end
    end)
	
	menu.action(ascm, "FIB Heli", {"fibh"}, "", function(on_click)
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicleHash = util.joaat("swift")
		local pedHash = 1558115333
		requestModels(vehicleHash, pedHash)
		local coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
        local spawn_pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(player_ped, math.random(-30, 30),  math.random(-30, 30), 60)
        local vehicle = entities.create_vehicle(vehicleHash, spawn_pos, ENTITY.GET_ENTITY_HEADING(player_ped))
        for i=-1, VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle) - 1 do
            local clown = entities.create_ped(2, pedHash, spawn_pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            PED.SET_PED_INTO_VEHICLE(clown, vehicle, i)
            if i % 2 == 0 then
				WEAPON.GIVE_WEAPON_TO_PED(clown, 4208062921, 9999, false, true)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x8B3C480B)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x4DB62ABE)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x5DD5DBD5)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x9D65907A)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x420FD713)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            else
				WEAPON.GIVE_WEAPON_TO_PED(clown, 4208062921, 9999, false, true)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x8B3C480B)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x4DB62ABE)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x5DD5DBD5)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x9D65907A)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x420FD713)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
			PED.SET_PED_AS_COP(clown, true)
			VEHICLE.SET_HELI_BLADES_FULL_SPEED(vehicle)
			addBlipForEntity(vehicle, 422, 40)
			VEHICLE.SET_VEHICLE_MOD_KIT(van, 0)
			VEHICLE.SET_VEHICLE_LIVERY(van, 0)
			VEHICLE.SET_VEHICLE_MOD(van, 48, 0)
			PED.SET_PED_CONFIG_FLAG(clown, 281, true)
			PED.SET_PED_CONFIG_FLAG(clown, 2, true)
			PED.SET_PED_CONFIG_FLAG(clown, 33, false)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 5, true)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 46, true)
			PED.SET_PED_ACCURACY(clown, 100.0)
			PED.SET_PED_HEARING_RANGE(clown, 99999)
			PED.SET_PED_RANDOM_COMPONENT_VARIATION(clown, 0)
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 3)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "FIB")
			VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(vehicle, false)
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
			PED.SET_PED_MAX_HEALTH(clown, 150)
			ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
			ENTITY.SET_ENTITY_HEALTH(clown, 150)
			PED.SET_PED_ARMOUR(clown, 100)
			PED.SET_PED_SHOOT_RATE(clown, 5)
			VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
			VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0) --black
			VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, 0, 0, 0)
			VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, 3, 0, 0) --matte finish
			VEHICLE.SET_VEHICLE_MOD_COLOR_2(vehicle, 3, 0, 0)-- matte secondary
			VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 11) --street wheel type
			PED.SET_PED_SUFFERS_CRITICAL_HITS(clown, false)
			VEHICLE.SET_VEHICLE_MOD(vehicle, 0, 3) --spoiler
			VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 0)--wheel type?
			VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, 0, 0) --wheel color
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 4) --plate type, 4 is SA EXEMPT which law enforcement and government vehicles use
			if godmodeatk then
				ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			end
			if pcar then 
				PED.SET_PED_COMBAT_ATTRIBUTES(clown, 3, false)
			end
			if d then
				PED.SET_AI_WEAPON_DAMAGE_MODIFIER(clown, 3000000)
			end
            if i == -1 then
                TASK.TASK_VEHICLE_CHASE(clown, player_ped)
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 1000, false, true)
            else
                TASK.TASK_COMBAT_PED(clown, player_ped, 0, 16)
				WEAPON.GIVE_WEAPON_TO_PED(clown, 4208062921, 9999, false, true)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x8B3C480B)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x4DB62ABE)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x5DD5DBD5)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x9D65907A)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x420FD713)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
        end
    end)
	
	menu.action(ascm, "FIB RPG Heli", {"fibrh"}, "", function(on_click)
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicleHash = util.joaat("buzzard2")
		local pedHash = 1558115333
		requestModels(vehicleHash, pedHash)
		local coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
        local spawn_pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(player_ped, math.random(-30, 30),  math.random(-30, 30), 60)
        local vehicle = entities.create_vehicle(vehicleHash, spawn_pos, ENTITY.GET_ENTITY_HEADING(player_ped))
        for i=-1, VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle) - 1 do
            local clown = entities.create_ped(2, pedHash, spawn_pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            PED.SET_PED_INTO_VEHICLE(clown, vehicle, i)
            if i % 2 == 0 then
                WEAPON.GIVE_WEAPON_TO_PED(clown, -1312131151, 1000, false, true)
            else
                WEAPON.GIVE_WEAPON_TO_PED(clown, -1312131151, 1000, false, true)
            end
			PED.SET_PED_AS_COP(clown, true)
			VEHICLE.SET_HELI_BLADES_FULL_SPEED(vehicle)
			addBlipForEntity(vehicle, 422, 40)
			VEHICLE.SET_VEHICLE_MOD_KIT(van, 0)
			VEHICLE.SET_VEHICLE_LIVERY(van, 0)
			VEHICLE.SET_VEHICLE_MOD(van, 48, 0)
			PED.SET_PED_CONFIG_FLAG(clown, 281, true)
			PED.SET_PED_CONFIG_FLAG(clown, 2, true)
			PED.SET_PED_CONFIG_FLAG(clown, 33, false)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 5, true)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 46, true)
			PED.SET_PED_ACCURACY(clown, 100.0)
			PED.SET_PED_HEARING_RANGE(clown, 99999)
			PED.SET_PED_RANDOM_COMPONENT_VARIATION(clown, 0)
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 3)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "FIB")
			VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(vehicle, false)
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
			PED.SET_PED_MAX_HEALTH(clown, 150)
			ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
			ENTITY.SET_ENTITY_HEALTH(clown, 150)
			PED.SET_PED_ARMOUR(clown, 100)
			PED.SET_PED_SHOOT_RATE(clown, 5)
			VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
			VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0) --black
			VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, 0, 0, 0)
			VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, 3, 0, 0) --matte finish
			VEHICLE.SET_VEHICLE_MOD_COLOR_2(vehicle, 3, 0, 0)-- matte secondary
			VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 11) --street wheel type
			PED.SET_PED_SUFFERS_CRITICAL_HITS(clown, false)
			VEHICLE.SET_VEHICLE_MOD(vehicle, 0, 3) --spoiler
			VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 0)--wheel type?
			VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, 0, 0) --wheel color
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 4) --plate type, 4 is SA EXEMPT which law enforcement and government vehicles use
			if godmodeatk then
				ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			end
			if pcar then 
				PED.SET_PED_COMBAT_ATTRIBUTES(clown, 3, false)
			end
			if d then
				PED.SET_AI_WEAPON_DAMAGE_MODIFIER(clown, 3000000)
			end
            if i == -1 then
                TASK.TASK_VEHICLE_CHASE(clown, player_ped)
				WEAPON.GIVE_WEAPON_TO_PED(clown, -1312131151 , 1000, false, true)
            else
                TASK.TASK_COMBAT_PED(clown, player_ped, 0, 16)
				WEAPON.GIVE_WEAPON_TO_PED(clown, -1312131151, 1000, false, true)
            end
        end
    end)
	
	
	menu.action(ascm, "Send FIB APC", {"fibapc"}, "you heard me.", function(on_click)
		local vehicleHash = util.joaat("apc")
		local pedHash = 1558115333 
		requestModels(vehicleHash, pedHash)
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local vehicle = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
			return
		end

		local offset = getOffsetFromEntityGivenDistance(vehicle, 50.0)
		local outCoords = v3.new()
		local outHeading = memory.alloc()

		if PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(offset.x, offset.y, offset.z, outCoords, outHeading, 1, 3.0, 0) then
			ENTITY.SET_ENTITY_COORDS(vehicle, v3.getX(outCoords), v3.getY(outCoords), v3.getZ(outCoords))
			ENTITY.SET_ENTITY_HEADING(vehicle, memory.read_float(outHeading))
			VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
			for seat = -1, -1 do
				local cop = entities.create_ped(2, pedHash, outCoords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
				PED.SET_PED_INTO_VEHICLE(cop, vehicle, seat)
				PED.SET_PED_CONFIG_FLAG(clown, 281, true)
				PED.SET_PED_CONFIG_FLAG(clown, 2, true)
				PED.SET_PED_CONFIG_FLAG(clown, 33, false)
				TASK.TASK_COMBAT_PED(cop, targetPed, 0, 16)
				VEHICLE.SET_VEHICLE_COLOURS(vehicle, 0, 0)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vehicle, true)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle,-1, 3)
				PED.SET_PED_COMBAT_ATTRIBUTES(cop, 46, true)
				PED.SET_PED_COMBAT_ATTRIBUTES(cop, 5, true)
				PED.SET_PED_COMBAT_ATTRIBUTES(cop, 2, true)
				VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "FIB")
				VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
				PED.SET_PED_COMBAT_ATTRIBUTES(cop, 3, false)
				VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 3)
				PED.SET_PED_MAX_HEALTH(cop, 150)
				ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
				ENTITY.SET_ENTITY_HEALTH(cop, 150)
				PED.SET_PED_SHOOT_RATE(cop, 5)
				PED.SET_PED_SUFFERS_CRITICAL_HITS(cop, false)
				WEAPON.GIVE_WEAPON_TO_PED(cop, 584646201, 9999, false, true)
				PED.SET_PED_ACCURACY(cop, 100.0)
				PED.SET_PED_HEARING_RANGE(cop, 99999)
				PED.SET_PED_AS_COP(cop, true)
				addBlipForEntity(vehicle, 558, 59)
				VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0) --black
				VEHICLE.SET_VEHICLE_MOD(vehicle, 10, 0)
				VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, 0, 0, 0)
				VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, 3, 0, 0) --matte finish
				VEHICLE.SET_VEHICLE_MOD_COLOR_2(vehicle, 3, 0, 0)-- matte secondary
				VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 11) --street wheel type
				PED.SET_PED_SUFFERS_CRITICAL_HITS(clown, false)
				VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 0)--wheel type?
				VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, 0, 0) --wheel color
				VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 4) --plate type, 4 is SA EXEMPT which law enforcement and government vehicles use
				if ktask then
					PED.SET_PED_KEEP_TASK(clown, true)
				end
			end
			for seats = 0, 2 do
				local cops = entities.create_ped(2, pedHash, outCoords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
				PED.SET_PED_INTO_VEHICLE(cops, vehicle, seats)
				PED.SET_PED_CONFIG_FLAG(cops, 281, true)
				PED.SET_PED_CONFIG_FLAG(cops, 2, true)
				PED.SET_PED_CONFIG_FLAG(cops, 33, false)
				TASK.TASK_VEHICLE_CHASE(cops, targetPed)
				VEHICLE.SET_VEHICLE_COLOURS(vehicle, 0, 0)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vehicle, true)
				VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, -1, 3)
				PED.SET_PED_COMBAT_ATTRIBUTES(cops, 46, true)
				PED.SET_PED_COMBAT_ATTRIBUTES(cops, 5, true)
				PED.SET_PED_COMBAT_ATTRIBUTES(cops, 2, true)
				VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "FIB")
				VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
				PED.SET_PED_COMBAT_ATTRIBUTES(cops, 3, false)
				VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 3)
				PED.SET_PED_MAX_HEALTH(cops, 150)
				ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
				ENTITY.SET_ENTITY_HEALTH(cops, 150)
				PED.SET_PED_SHOOT_RATE(cops, 5)
				PED.SET_PED_SUFFERS_CRITICAL_HITS(cops, false)
				WEAPON.GIVE_WEAPON_TO_PED(cops, 584646201, 9999, false, true)
				PED.SET_PED_ACCURACY(cops, 100.0)
				PED.SET_PED_HEARING_RANGE(cops, 99999)
				PED.SET_PED_AS_COP(cops, true)
				addBlipForEntity(vehicle, 558, 59)
				VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0) --black
				VEHICLE.SET_VEHICLE_MOD(vehicle, 10, 0)
				VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, 0, 0, 0)
				VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, 3, 0, 0) --matte finish
				VEHICLE.SET_VEHICLE_MOD_COLOR_2(vehicle, 3, 0, 0)-- matte secondary
				VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 11) --street wheel type
				PED.SET_PED_SUFFERS_CRITICAL_HITS(cops, false)
				VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 0)--wheel type?
				VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, 0, 0) --wheel color
				VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 4)
				if ktask then
					PED.SET_PED_KEEP_TASK(cop, true)
				end
			end
		end
		v3.free(outCoords)
		memory.free(outHeading)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedHash)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicleHash)
	end)

	menu.action(ascm, "FIB Nightshark", {"fibatk"}, "for the bomb happy individuals", function(on_click)
        local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicleHash = util.joaat("nightshark")
		local pedHash = 1558115333
		requestModels(vehicleHash, pedHash)
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local vehicle = entities.create_vehicle(vehicleHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
			return
		end

		local offset = getOffsetFromEntityGivenDistance(vehicle, 50.0)
		local outCoords = v3.new()
		local outHeading = memory.alloc()

		if PATHFIND.GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(offset.x, offset.y, offset.z, outCoords, outHeading, 1, 3.0, 0) then
			ENTITY.SET_ENTITY_COORDS(vehicle, v3.getX(outCoords), v3.getY(outCoords), v3.getZ(outCoords))
			ENTITY.SET_ENTITY_HEADING(vehicle, memory.read_float(outHeading))
			VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, true)
		end
        for i=-1, VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle) - 1 do
            local clown = entities.create_ped(2, pedHash, outCoords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            PED.SET_PED_INTO_VEHICLE(clown, vehicle, i)
            if i % 2 == 0 then
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 9999, false, true)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            else
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 9999, false, true)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
			PED.SET_PED_AS_COP(clown, true)
			addBlipForEntity(vehicle, 724, 85)
			PED.SET_PED_CONFIG_FLAG(clown, 281, true)
			PED.SET_PED_CONFIG_FLAG(clown, 2, true)
			PED.SET_PED_CONFIG_FLAG(clown, 33, false)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 5, true)
            PED.SET_PED_COMBAT_ATTRIBUTES(clown, 46, true)
			PED.SET_PED_ACCURACY(clown, 100.0)
			PED.SET_PED_HEARING_RANGE(clown, 99999)
			PED.SET_PED_RANDOM_COMPONENT_VARIATION(clown, 0)
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 3)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "FIB")
			VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(vehicle, false)
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 50)
			PED.SET_PED_MAX_HEALTH(clown, 150)
			ENTITY.SET_ENTITY_PROOFS(ped, false, true, false, false, true, false, false, false)
			ENTITY.SET_ENTITY_HEALTH(clown, 150)
			PED.SET_PED_ARMOUR(clown, 100)
			PED.SET_PED_SHOOT_RATE(clown, 5)
			VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
			VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0) --black
			VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, 0, 0, 0)
			VEHICLE.SET_VEHICLE_MOD_COLOR_1(vehicle, 3, 0, 0) --matte finish
			VEHICLE.SET_VEHICLE_MOD_COLOR_2(vehicle, 3, 0, 0)-- matte secondary
			VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 11) --street wheel type
			PED.SET_PED_SUFFERS_CRITICAL_HITS(clown, false)
			VEHICLE.SET_VEHICLE_MOD(vehicle, 0, 3) --spoiler
			VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 0)--wheel type?
			VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, 0, 0) --wheel color
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, 4) --plate type, 4 is SA EXEMPT which law enforcement and government vehicles use
			if godmodeatk then
				ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			end
			if pcar then 
				PED.SET_PED_COMBAT_ATTRIBUTES(clown, 3, false)
			end
			if d then
				PED.SET_AI_WEAPON_DAMAGE_MODIFIER(clown, 3000000)
			end
            if i == -1 then
                TASK.TASK_VEHICLE_CHASE(clown, player_ped)
				WEAPON.GIVE_WEAPON_TO_PED(clown, 584646201 , 1000, false, true)
            else
                TASK.TASK_COMBAT_PED(clown, player_ped, 0, 16)
				WEAPON.GIVE_WEAPON_TO_PED(clown, 4208062921, 9999, false, true)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x8B3C480B)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x4DB62ABE)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x5DD5DBD5)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x9D65907A)
				WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(clown, 4208062921, 0x420FD713)
				PED.SET_PED_FIRING_PATTERN(clown, -957453492)
            end
        end
    end)

		menu.toggle(ascm, "Attacker does not exit vehicle", {"veh"}, "does what it says on the tin, only applies to vehicle attackers.", function(on)
		pcar = on
	end)

		menu.toggle(ascm, "Attacker Keeps Task", {""}, "does what it says on the tin, only applies to vehicle attackers.", function(on)
		ktask = on
	end)
	
	menu.action(ascm, "piss test", {"eeeee"}, "alan pls add details you piece of shit", function(on_click)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local van_hash = util.joaat("krieger")
		local coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
        local spawn_pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(player_ped, 0.0, 5, 0.0)
        local van = entities.create_vehicle(van_hash, spawn_pos, ENTITY.GET_ENTITY_HEADING(player_ped))
		ENTITY.SET_ENTITY_MAX_HEALTH(van, 60000)
		ENTITY.SET_ENTITY_HEALTH(van, 60000)
		VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(van, false)
end)

end

players.on_join(player)
players.dispatch_on_join()

function getOffsetFromEntityGivenDistance(entity, distance)
	local pos = ENTITY.GET_ENTITY_COORDS(entity, 0)
	local theta = (math.random() + math.random(0, 1)) * math.pi --returns a random angle between 0 and 2pi (exclusive)
	local coords = vect.new(
		pos.x + distance * math.cos(theta),
		pos.y + distance * math.sin(theta),
		pos.z
	)
	return coords
end

cur_names = {}

function GET_NEARBY_ENTITIES(pid, radius) --returns nearby peds and vehicles given player Id
	local peds = GET_NEARBY_PEDS(pid, radius)
	local vehicles = GET_NEARBY_VEHICLES(pid, radius)
	local entities = peds
	for i = 1, #vehicles do table.insert(entities, vehicles[i]) end
	return entities
end

function GET_NEARBY_VEHICLES(pid, radius) --returns a list of nearby vehicles given player Id
	local vehicles = {}
	local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	local pos = ENTITY.GET_ENTITY_COORDS(p)
	local v = PED.GET_VEHICLE_PED_IS_IN(p, false)
	for k, vehicle in pairs(entities.get_all_vehicles_as_handles()) do 
		local veh_pos = ENTITY.GET_ENTITY_COORDS(vehicle)
		if vehicle ~= v and vect.dist(pos, veh_pos) <= radius then table.insert(vehicles, vehicle) end
	end
	return vehicles
end

function GET_NEARBY_PEDS(pid, radius) --returns a list of nearby peds given player Id
	local peds = {}
	local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	local pos = ENTITY.GET_ENTITY_COORDS(p)
	for k, ped in pairs(entities.get_all_peds_as_handles()) do
		if ped ~= p then
			local ped_pos = ENTITY.GET_ENTITY_COORDS(ped)
			if vect.dist(pos, ped_pos) <= radius then table.insert(peds, ped) end
		end
	end
	return peds
end

function random(t) --returns a random value from table
	local list = {}
	for k, value in pairs(t) do table.insert(list, value) end
	return list[math.random(1, #list)]
end

function table.find(t, value)
	for k, v in pairs(t) do
		if v == value then
			return true
		end
	end
	return false
end

if loaded_config then
	for s, table in pairs(loaded_config) do
		for k, v in pairs(table) do
			if config[s] and config[s][k] ~= nil then
				config[s][k] = v
			end
		end
	end
end


vect = {
	['new'] = function(x, y, z)
		return {['x'] = x, ['y'] = y, ['z'] = z}
	end,
	['subtract'] = function(a, b)
		return vect.new(a.x-b.x, a.y-b.y, a.z-b.z)
	end,
	['add'] = function(a, b)
		return vect.new(a.x+b.x, a.y+b.y, a.z+b.z)
	end,
	['mag'] = function(a)
		return math.sqrt(a.x^2 + a.y^2 + a.z^2)
	end,
	['norm'] = function(a)
		local mag = vect.mag(a)
		return vect.div(a, mag)
	end,
	['mult'] = function(a, b)
		return vect.new(a.x*b, a.y*b, a.z*b)
	end, 
	['div'] = function(a, b)
		return vect.new(a.x/b, a.y/b, a.z/b)
	end, 
	['dist'] = function(a, b) --returns the distance between two vectors
		return vect.mag(vect.subtract(a, b) )
	end
}

function REQUEST_CONTROL_LOOP(entity)
	local tick = 0
	while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick < 25 do
		wait()
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
		tick = tick + 1
	end
	if NETWORK.NETWORK_IS_SESSION_STARTED() then
		local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
		NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netId, true)
	end
end