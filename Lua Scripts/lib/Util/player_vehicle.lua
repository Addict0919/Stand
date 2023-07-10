---@diagnostic disable: undefined-global, lowercase-global

require("Util/utils")

apply_force_to_vehicle = function(pid, x, y, z)
    
    local vehicle = get_player_vehicle(pid, true)

    util.yield()

    if vehicle ~= 0 then
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, x, y, z, true, false, true)
    end
end

teleport_vehicle = function(pid, x, y, z)

    local vehicle = get_player_vehicle(pid, true)

    util.yield()

    if vehicle ~= 0 then
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(vehicle, x, y, z, 0, 0, 1)
    end
end

phone_explode_vehicle = function(pid)

    local vehicle = get_player_vehicle(pid, false)

    if vehicle ~= 0 then
        VEHICLE.ADD_VEHICLE_PHONE_EXPLOSIVE_DEVICE(vehicle)
        VEHICLE.DETONATE_VEHICLE_PHONE_EXPLOSIVE_DEVICE()
    end
end

kill_vehicle_engine = function(pid)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, -4000)
		VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, -4000)
		VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, -4000)
    end
end

set_vehicle_invincible_state = function(pid, state)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        ENTITY.SET_ENTITY_INVINCIBLE(vehicle, state)
    end
end

set_vehicle_invisibe_state = function(pid, state)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        ENTITY.SET_ENTITY_VISIBLE(vehicle, state, 0)
    end
end

repair_vehicle = function(pid)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        VEHICLE.SET_VEHICLE_FIXED(vehicle)
    end
end

upgrade_vehicle = function(pid)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, VEHICLE.GET_NUM_MOD_KITS(vehicle) - 1)
    end

end

set_vehicle_speed = function(pid, speed)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, speed)
    end
end

reduce_vehicle_grip = function(pid)

    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        VEHICLE.SET_VEHICLE_REDUCE_GRIP(vehicle, true)
        VEHICLE._SET_VEHICLE_REDUCE_TRACTION(vehicle, 1000)
    end
end

disable_gravity = function(pid, state)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        if state == 1 then
            VEHICLE.SET_VEHICLE_GRAVITY(vehicle, false)
        elseif state == 0 then
            VEHICLE.SET_VEHICLE_GRAVITY(vehicle, true)
        end
    end
end

remove_vehicle_windows = function(pid)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        for i = 1, 7 do
            VEHICLE.REMOVE_VEHICLE_WINDOW(vehicle, i)
        end
    end
end

roll_down_vehicle_windows = function(pid)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        VEHICLE.ROLL_DOWN_WINDOWS(vehicle)
    end
end

roll_up_vehicle_windows = function(pid)

    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        for i = 1, 7 do
            VEHICLE.ROLL_UP_WINDOW(vehicle, i)
        end
    end
end

smash_vehicle_windows = function(pid)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        for i = 1, 7 do
            VEHICLE.SMASH_VEHICLE_WINDOW(vehicle, i)
            util.yield()
        end
    end
end

fix_vehicle_windows = function(pid)
    
    local vehicle = get_player_vehicle(pid, true)

    if vehicle ~= 0 then
        for i = 1, 7 do
            VEHICLE.FIX_VEHICLE_WINDOW(vehicle, i)
            util.yield()
        end
    end
end

set_vehicle_door_open_state = function(pid, state)

    local vehicle = get_player_vehicle(pid, true)

    for i = 1, 7 do
        if state == true then
            VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, i, false, true)
        else
            VEHICLE.SET_VEHICLE_DOOR_SHUT(vehicle, i, false)
        end
    end
end

break_vehicle_doors = function(pid)

    local vehicle = get_player_vehicle(pid, true)

    for i = 1, 7 do
        VEHICLE.SET_VEHICLE_DOOR_BROKEN(vehicle, i, false)
    end
end

task_vehicle_temp_action = function(pid, action, time)

    local player_index = player_index(pid)
    local vehicle = get_player_vehicle(pid, false)

    if vehicle ~= 0 then
        TASK.TASK_VEHICLE_TEMP_ACTION(player_index, vehicle, action, time)
    end
end