util.keep_running()
util.require_natives("natives-1663599433")


local objtab = {}
local vsh
local psh
local obj_shot
local function vshot(hash, camcoords, CV, rot)
    if not ENTITY.DOES_ENTITY_EXIST(vsh) then
        vsh = entities.create_vehicle(hash, camcoords, CV)
        ENTITY.SET_ENTITY_ROTATION(vsh, rot.x, rot.y, rot.z, 0, true)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vsh, 1000)
        VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vsh, true)
        VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vsh, true)
        table.insert(objtab, vsh)
    else
            local veh_sec = entities.create_vehicle(hash, camcoords, CV)
            ENTITY.SET_ENTITY_ROTATION(veh_sec, rot.x, rot.y, rot.z, 0, true)
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh_sec, 1000)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vsh, true)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vsh, true)
            table.insert(objtab, veh_sec)
    end
end

local function pshot(hash, camcoords, CV, rot)
    if not ENTITY.DOES_ENTITY_EXIST(psh) then
        psh = entities.create_ped(1, hash, camcoords, CV)
        ENTITY.SET_ENTITY_INVINCIBLE(psh, true)
        util.yield(30)
        ENTITY.SET_ENTITY_ROTATION(psh, rot.x, rot.y, rot.z, 0, true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(psh, 1, 0, 5000, 0, 0, true, true, true, true)
        table.insert(objtab, psh)
    else
        local sped = entities.create_ped(1, hash, camcoords, CV)
        ENTITY.SET_ENTITY_INVINCIBLE(sped, true)
        util.yield(30)
        ENTITY.SET_ENTITY_ROTATION(sped, rot.x, rot.y, rot.z, 0, true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(sped, 1, 0, 5000, 0, 0, true, true, true, true)
        table.insert(objtab, sped)
    end
end
local function oshot(hash, camcoords, rot)
    if not ENTITY.DOES_ENTITY_EXIST(obj_shot) then
        local objs = OBJECT.CREATE_OBJECT(hash, camcoords.x, camcoords.y, camcoords.z, true, true, true)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(objs, players.user_ped(), false)
        util.yield(20)
        ENTITY.SET_ENTITY_ROTATION(objs, rot.x, rot.y, rot.z, 0, true)
        
        ENTITY.APPLY_FORCE_TO_ENTITY(objs, 2, camcoords.x ,  15000, camcoords.z , 0, 0, 0, 0,  true, false, true, false, true)
        table.insert(objtab, objs)
        else
            local sobjs = OBJECT.CREATE_OBJECT(hash, camcoords.x, camcoords.y, camcoords.z, true, true, true)
            ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(sobjs, players.user_ped(), false)
            util.yield(20)
            ENTITY.SET_ENTITY_ROTATION(sobjs, rot.x, rot.y, rot.z, 0, true)
            ENTITY.APPLY_FORCE_TO_ENTITY(sobjs, 2, camcoords.x ,  15000, camcoords.z , 0, 0, 0, 0,  true, false, true, false, true)
            table.insert(objtab, sobjs)
    end

end

local function objshots(hash, obj, camcoords)
    local CV = CAM.GET_GAMEPLAY_CAM_RELATIVE_HEADING()
    local rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        vshot(hash, camcoords, CV, rot)
        
        for i, car in ipairs(objtab) do
            if obj.expl then
                if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(car) then
                    local expcoor = ENTITY.GET_ENTITY_COORDS(car)
                    FIRE.ADD_EXPLOSION(expcoor.x, expcoor.y, expcoor.z, 81, 5000, true, false, 0.0, false)
                    entities.delete_by_handle(car)
                end


            end
            if i >= 150 then
                for index, vehs in ipairs(objtab) do
                    entities.delete_by_handle(vehs)
                    objtab ={}
                end
            end
            local carc = ENTITY.GET_ENTITY_COORDS(car)
            local tar2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())
            local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, carc.x, carc.y, carc.z)
            if disbet > 15000 then
                entities.delete_by_handle(car)
            end
        end

    elseif STREAMING.IS_MODEL_A_PED(hash) then
       pshot(hash, camcoords, CV, rot)

    
        for i, psho in ipairs(objtab) do
        if obj.expl then
            if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(psho) then
                local expcoor = ENTITY.GET_ENTITY_COORDS(psho)
                FIRE.ADD_EXPLOSION(expcoor.x, expcoor.y, expcoor.z, 81, 5000, true, false, 0.0, false)
                entities.delete_by_handle(psho)
            end
                
                    local pedc = ENTITY.GET_ENTITY_COORDS(psh)
                    local tar2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())
                    local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, pedc.x, pedc.y, pedc.z)
                    if disbet > 15000 then
                        entities.delete_by_handle(psh)
                    end
        end
        if i >= 40 then
            for index, p_shot in ipairs(objtab) do
                entities.delete_by_handle(p_shot)
                objtab ={}
            end
        end
    end
    elseif STREAMING.IS_MODEL_VALID(hash) then
       oshot(hash, camcoords, rot)



       for i, objs in ipairs(objtab) do
       if obj.expl then
        if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(objs) then
            local expcoor = ENTITY.GET_ENTITY_COORDS(objs)
            FIRE.ADD_EXPLOSION(expcoor.x, expcoor.y, expcoor.z, 81, 5000, true, false, 0.0, false)
            entities.delete_by_handle(objs)
        end

                local objc = ENTITY.GET_ENTITY_COORDS(objs)
                local tar2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())
                local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, objc.x, objc.y, objc.z)

                if disbet > 15000 then
                    entities.delete_by_handle(objs)
                end
            end
            if i >= 40 then
                for index, p_shot in ipairs(objtab) do
                    entities.delete_by_handle(p_shot)
                    objtab ={}
                end
            end
        end
    end
   
end

function Streament(hash) --Streaming Model
    STREAMING.REQUEST_MODEL(hash)
    while STREAMING.HAS_MODEL_LOADED(hash) ==false do
    util.yield()
    end
end

local next_preview
local image_preview
local function rotation_to_direction(rotation)
    local adjusted_rotation =
    {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }
    local direction =
    {
        x = -math.sin(adjusted_rotation.z) * math.abs(math.cos(adjusted_rotation.x)),
        y =  math.cos(adjusted_rotation.z) * math.abs(math.cos(adjusted_rotation.x)),
        z =  math.sin(adjusted_rotation.x)
    }
    return direction
end
local function get_offset_from_camera(distance)
    local cam_rot = CAM.GET_FINAL_RENDERED_CAM_ROT(0)
    local cam_pos = CAM.GET_FINAL_RENDERED_CAM_COORD()
    local direction = rotation_to_direction(cam_rot)
    local destination =
    {
        x = cam_pos.x + direction.x * distance,
        y = cam_pos.y + direction.y * distance,
        z = cam_pos.z + direction.z * distance
    }
    return destination
end

local function objams(obj_hash, obj, camcoords)
    local CV = CAM.GET_GAMEPLAY_CAM_RELATIVE_HEADING()
    if STREAMING.IS_MODEL_A_VEHICLE(obj_hash) then
        obj.prev = VEHICLE.CREATE_VEHICLE(obj_hash, camcoords.x, camcoords.y, camcoords.z, CV, true, true, false)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj.prev, players.user_ped(), false)
      elseif STREAMING.IS_MODEL_A_PED(obj_hash) then
        obj.prev = entities.create_ped(1, obj_hash, camcoords, CV)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj.prev, players.user_ped(), false)
      elseif STREAMING.IS_MODEL_VALID(obj_hash) then
        obj.prev = OBJECT.CREATE_OBJECT(obj_hash, camcoords.x, camcoords.y, camcoords.z, true, true, true)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj.prev, players.user_ped(), false)
    end
end

SEC = ENTITY.SET_ENTITY_COORDS
local set = {alert = false}
local obj_hash = 'prop_container_01a'

local obj = {expl = false}
OBJgun = menu.toggle_loop(menu.my_root(), "Money Gun", {"moneygun"}, "Real Money Gun!", function ()
local hash = util.joaat("prop_money_bag_01")
Streament(hash)
if PLAYER.IS_PLAYER_FREE_AIMING(players.user()) and not PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
local rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
local camcoords = get_offset_from_camera(10)
if not ENTITY.DOES_ENTITY_EXIST(obj.prev) then
    objams(hash, obj, camcoords)
else
    SEC(obj.prev, camcoords.x, camcoords.y, camcoords.z, false, true, true, false)
end
ENTITY.SET_ENTITY_ROTATION(obj.prev, rot.x, rot.y, rot.z, 1, true)

elseif ENTITY.DOES_ENTITY_EXIST(obj.prev) and not PLAYER.IS_PLAYER_FREE_AIMING(players.user()) then
entities.delete_by_handle(obj.prev)
end
if PED.IS_PED_SHOOTING(players.user_ped()) and not PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
local camcoords = get_offset_from_camera(15)
objshots(hash, obj, camcoords)
local cash = MISC.GET_HASH_KEY("prop_money_bag_01")
STREAMING.REQUEST_MODEL(cash)
if STREAMING.HAS_MODEL_LOADED(cash) == false then  
    STREAMING.REQUEST_MODEL(cash)
end
OBJECT.CREATE_AMBIENT_PICKUP(1704231442, camcoords.x, camcoords.y, camcoords.z, 0, 2000, cash, false, true)
entities.delete_by_handle(obj.prev)
util.yield(20)
end
end)


util.on_stop(function()
end)
