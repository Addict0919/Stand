---@diagnostic disable: undefined-global, lowercase-global

require("Util/utils")

apply_force_to_ped_vehicle = function(vehicle, x, y, z)
    
    request_control_of_entity(vehicle, 1)

    util.yield()

    if vehicle ~= 0 then
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, x, y, z, true, false, true)
    end
end

phone_explode_ped_vehicle = function(vehicle)

    request_control_of_entity(vehicle, 1)

    if vehicle ~= 0 then
        VEHICLE.ADD_VEHICLE_PHONE_EXPLOSIVE_DEVICE(vehicle)
        VEHICLE.DETONATE_VEHICLE_PHONE_EXPLOSIVE_DEVICE()
    end
end

kill_ped_vehicle_engine = function(vehicle)
    
    request_control_of_entity(vehicle, 1)

    if vehicle ~= 0 then
        VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, -4000)
		VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, -4000)
		VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, -4000)
    end
end

repair_vehicle = function(vehicle)
    
    request_control_of_entity(vehicle, 1)

    if vehicle ~= 0 then
        VEHICLE.SET_VEHICLE_FIXED(vehicle)
    end
end

upgrade_vehicle = function(vehicle)
    
    request_control_of_entity(vehicle, 1)

    if vehicle ~= 0 then
        VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, VEHICLE.GET_NUM_MOD_KITS(vehicle) - 1)
    end

end

disable_gravity = function(vehicle, state)
    
    request_control_of_entity(vehicle, 1)

    if vehicle ~= 0 then
        if state == 1 then
            VEHICLE.SET_VEHICLE_GRAVITY(vehicle, false)
        elseif state == 0 then
            VEHICLE.SET_VEHICLE_GRAVITY(vehicle, true)
        end
    end
end