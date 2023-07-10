---@diagnostic disable: undefined-global, lowercase-global

require("Util/utils")


---@region: cages
tube_cage_player = function(pid, hash)
    
    request_stream_of_entity(hash, 5)

    local coords = player_coords(pid)

    cage = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, coords.x, coords.y, coords.z, true, false, false)
    ENTITY.SET_ENTITY_ROTATION(cage, 0.0, 90.0, 0.0, 1, true)
end

special_cage_player = function(pid)

    request_stream_of_entity(779277682, 5)

    local coords = player_coords(pid)

    cage = OBJECT.CREATE_OBJECT_NO_OFFSET(779277682, coords.x, coords.y, coords.z, true, false, false)
	ENTITY.SET_ENTITY_ROTATION(cage, 0.0, -90.0, 0.0, 1, true)
	cage = OBJECT.CREATE_OBJECT_NO_OFFSET(779277682, coords.x, coords.y, coords.z, true, false, false)
	ENTITY.SET_ENTITY_ROTATION(cage, 0.0, 90.0, 0.0, 1, true)
end


---@region: sounds
ear_rape = function(pid, range)
    
    local coords = player_coords(pid)
    AUDIO.PLAY_SOUND_FROM_COORD(-1, "BED", coords.x, coords.z, coords.y, "WASTEDSOUNDS", true, range, false)
end

alarm = function(pid, range)

    local coords = player_coords(pid)
    AUDIO.PLAY_SOUND_FROM_COORD(-1, "Air_Defences_Activated", coords.x, coords.z, coords.y, "DLC_sum20_Business_Battle_AC_Sounds", true, range, false)
end


---@region: attackers 
lazer_attacker = function(pid, jets)

    local player_index = player_index(pid)
    local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(player_index, 1.0, 0.0, 500.0)

    request_stream_of_entity(-1281684762, 1)
    request_stream_of_entity(-163714847, 1)

    for i = 1, jets do
        coords.x = coords.x + i*2
        coords.y = coords.y + i*2

        local jet = entities.create_vehicle(-1281684762, coords, 90.0)
        local pilot = entities.create_ped(0, -163714847, coords, 30.0)

        PED.SET_PED_INTO_VEHICLE(pilot, jet, -1)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(jet, 100.0)
        VEHICLE.SET_VEHICLE_FORCE_AFTERBURNER(jet, true)
        TASK.TASK_COMBAT_PED(pilot, player_index, 0, 16)
    end
end

tank_attacker = function(pid, tanks)

    local player_index = player_index(pid)

    request_stream_of_entity(782665360, 1)
    request_stream_of_entity(-163714847, 1)

    for i = 1, tanks do
        local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(player_index, math.random(-20, 20), math.random(-20, 20), 10.0)

        local tank = entities.create_vehicle(782665360, coords, 90.0)
        local driver = entities.create_ped(0, -163714847, coords, 30.0)

        PED.SET_PED_INTO_VEHICLE(driver, tank, -1)
        VEHICLE.SET_VEHICLE_ENGINE_ON(tank,true ,true, false)
        TASK.TASK_VEHICLE_SHOOT_AT_PED(driver, player_index, 1)
        TASK.TASK_VEHICLE_CHASE(driver, player_index)
    end
end



---@region: lag area/pool fill
vehicle_spam = function(pid, hash, value, yield)
    
    request_stream_of_entity(hash, 5)

    local coords = player_coords(pid)

    for i = 1, value do
        entities.create_vehicle(hash, coords, 0.0)
        util.yield(yield)
    end
end

ped_spam = function(pid, type, hash, value, yield)
    
    request_stream_of_entity(hash, 5)

    local coords = player_coords(pid)

    for i = 1, value do
        entities.create_ped(type, hash, coords, 0.0)
        util.yield(yield)
    end
end


---@region: standard griefing
explosion = function(pid)

    local coords = player_coords(pid)

    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1000, true, false, 1, false)
end

fire = function(pid)

    local coords = player_coords(pid)

    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 3, 10, true, false, 1, false)
end

water = function(pid)

    local coords = player_coords(pid)

    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 13, 1, true, false, 1, false)
end

stomp_player = function(pid)

    request_stream_of_entity(-692292317, 5)

    local coords = player_coords(pid)
    coords.z = coords.z + 15

    stomp = entities.create_vehicle(-692292317, coords, 0.0)

    util.yield(2000)

    entities.delete_by_handle(stomp)
end

atomize = function(pid)

    local coords = player_coords(pid)

    WEAPON.GIVE_DELAYED_WEAPON_TO_PED(player_index(players.user()), -1355376991, 200, true)

    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(coords.x + math.random(-5, 5), coords.y + math.random(-5, 5), coords.z + math.random(3, 10), coords.x, coords.y, coords.z, 0, 100, util.joaat("weapon_raypistol"), player_index(players.user()), true, false, 1000)
end

emp = function(pid)

    local coords = player_coords(pid)

    WEAPON.GIVE_DELAYED_WEAPON_TO_PED(player_index(players.user()), 0xDB26713A, 200, true)

    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(coords.x + math.random(-5, 5), coords.y + math.random(-5, 5), coords.z + math.random(3, 10), coords.x, coords.y, coords.z, 0, 100, util.joaat("weapon_emplauncher"), player_index(players.user()), true, false, 1000)
end

car_jacker = function(pid)

    local vehicle = get_player_vehicle(pid, false)
    local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, -2.0, 0.0, 0.1)

    ENTITY.SET_ENTITY_VELOCITY(vehicle, 0, 0, 0)

    local ped = PED.CREATE_RANDOM_PED(coords.x, coords.y, coords.z)

    TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true)
    TASK.TASK_ENTER_VEHICLE(ped, vehicle, -1, -1, 1.0, 24)

    util.yield(20)
    VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)

    for _ = 1, 20 do
        TASK.TASK_VEHICLE_DRIVE_WANDER(ped, vehicle, 100.0, 2883621)
        util.yield(50)
    end
end

steal_vehicle = function(pid)
    
    local player_index = player_index(players.user())
    local vehicle = get_player_vehicle(pid, false)

    local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, -2.0, 0.0, 0.1)

    if vehicle ~= 0 then
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_index, coords.x, coords.y, coords.z, 0, 0, 1)
        ENTITY.SET_ENTITY_VELOCITY(vehicle, 0, 0, 0)
        TASK.TASK_ENTER_VEHICLE(player_index, vehicle, -1, -1, 1.0, 26)
    end
end

halloween_money = function(pid)
    util.trigger_script_event(1 << pid, {-1178972880, pid, 8, -1, 1, 1, 1})
end