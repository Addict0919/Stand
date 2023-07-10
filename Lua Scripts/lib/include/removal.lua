---@diagnostic disable: undefined-global, lowercase-global

local __init__ = {

    list = {
        [1] = {
            734217681;
            -884690486;
            1341619767;
            -2122757008;
            165154707;
            1692272545;
            447548909;
            -1006919392;
            -1671539132;
            -1845487887;
            2025593404;
            -1050465301;
            -1649536104;
            444583674;
            1353720154;
        };

        [2] = {
            -255678177;
        };

        [3] = {
            1545995274;
        };

        [4] = {
            -442313018;
        };
    };

    require_entitys = function(self, list_index)
        for index, value in pairs(self.list[list_index]) do
            if not STREAMING.HAS_MODEL_LOADED(value) then
                STREAMING.REQUEST_MODEL(value)
                util.yield()
            end
        end
    end
}




plane_attack = function(player_id)
    
    __init__:require_entitys(1)

    local position = players.get_position(player_id)
    local last_teleport = 0
    local entitys = {}

    local head = entities.create_vehicle(734217681, position, 0.0)
    ENTITY.SET_ENTITY_VISIBLE(head, false, 0)
    ENTITY.SET_ENTITY_PROOFS(head, true, true, true, true, true, true, true, true)

    
    while players.exists(player_id) do
        if head == 0 then
            return print("head got nulled")
        end
        local current_position = players.get_position(player_id)
        for i = 1, 50 do
            entitys[i] = entities.create_vehicle(__init__.list[1][math.random(1, #__init__.list[1])], current_position, 0.0)
            ENTITY.ATTACH_ENTITY_TO_ENTITY_PHYSICALLY(entitys[i], head, 0, 0, 13, 242, 3, 366, 23, 1, 12, 124, 23, 1000, true,true, true, true, 2)
            util.yield()
        end

        if util.current_unix_time_seconds() - last_teleport > 1 then
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(head, position.x + math.random(20, 150), position.y + math.random(20, 150), position.z + math.random(20, 150), true, false, false)
            util.yield(200)
            last_teleport = util.current_unix_time_seconds()
        else
            local new_position = players.get_position(player_id)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(head, new_position.x, new_position.y, new_position.z, true, false, false)
            util.yield()
        end

        util.yield(150)

        for i, v in pairs(entitys) do
            entities.delete_by_handle(v)
            util.yield()
        end
        util.yield()
    end
end

combat_task = function(player_id)

    __init__:require_entitys(3)

    local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
    local position = players.get_position(player_id)

    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), position.x, position.y, position.z + 250, false, false, false)

    util.yield(100)

    local handler = entities.create_ped(26, 1545995274, position, 0)

    WEAPON.GIVE_WEAPON_TO_PED(handler, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
    TASK.TASK_COMBAT_PED(handler, player, 0, 16)
    PED.SET_PED_COMBAT_ABILITY(handler, 3)

    util.yield(5000)

    entities.delete_by_handle(handler)

end

vehicle_task = function(player_id)

    local position = players.get_position(player_id)

    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), position.x, position.y, position.z + 20, false, false, false)

    util.yield(100)
    
    local vehicles = entities.get_all_vehicles_as_handles()

    for i, v in pairs(vehicles) do
        TASK.TASK_VEHICLE_TEMP_ACTION(players.user_ped(), v, math.random(15, 18), 100)
        util.yield()
    end
end

towtruck_area = function(player_id)
    
    __init__:require_entitys(4)

    local position = players.get_position(player_id)
    ENTITY.SET_ENTITY_COORDS(players.user_ped(), position.x, position.y, position.z, 1, 0, 0, 0)

    util.yield(100)

    local vehicles = entities.get_all_vehicles_as_handles()

    local handler = entities.create_vehicle(-442313018, position, 0.0)
    ENTITY.SET_ENTITY_VISIBLE(handler, false, 0)

    for i, v in pairs(vehicles) do
        ENTITY.SET_ENTITY_VISIBLE(v, false, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(v, handler, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
    end

    util.yield(1000)

    entities.delete_by_handle(handler)

    for i, v in pairs(vehicles) do
        entities.delete_by_handle(v)
    end
end

vehicle_draw_data = function(player_id)

    __init__:require_entitys(2)

    local position = players.get_position(player_id)
    local handler = entities.create_vehicle(-255678177, position, 0.0)

    VEHICLE.SET_VEHICLE_MOD(handler, 34, 3, false)

    util.yield(1000)

    entities.delete_by_handle(handler)
end

fragment_child = function(player_id)

    local position = players.get_position(player_id)
    local handler = entities.create_object(310817095, position)

    OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(handler, 1, false)

    util.yield(1000)

    entities.delete_by_handle(handler)
end

head_blend_data = function()
    for i = 1, 100 do
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 0, 17, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 1, 55, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 2, 40, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 3, 44, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 4, 31, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 5, 0, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 6, 24, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 7, 110, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 8, 55, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 9, 9, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 10, 45, math.random(0, 50), 0)
        PED.SET_PED_COMPONENT_VARIATION(players.user_ped(), 11, 69, math.random(0, 50), 0)
        PED._SET_PED_FACE_FEATURE(players.user_ped(), 1, math.random(-1000, 1000))
        PED._SET_PED_FACE_FEATURE(players.user_ped(), 2, math.random(-1000, 1000))
        PED._SET_PED_FACE_FEATURE(players.user_ped(), 3, math.random(-1000, 1000))
        PED._SET_PED_FACE_FEATURE(players.user_ped(), 4, math.random(-1000, 1000))
        PED.SET_PED_HEAD_BLEND_DATA(players.user_ped(), math.random(-1000, 1000), math.random(-1000, 1000), math.random(-1000, 1000), math.random(-1000, 1000), math.random(-1000, 1000), math.random(-1000, 1000), math.random(-1000, 1000), math.random(-1000, 1000), math.random(-1000, 1000))
        util.yield()
    end
end

rope_spam = function()
    local coords = players.get_position(players.user_ped())
    local rot = {
        x = 1,
        y = 1,
        z = 1
    }

    for i = 1, 2000 do
        print("weh")
        PHYSICS.ADD_ROPE(coords.x, coords.y , coords.z + 3, rot.x, rot.y, rot.z ,1 ,1 ,1 ,1 ,1 ,true ,true ,true ,1.0 ,true, 0)
        PHYSICS.ADD_ROPE(coords.x, coords.y , coords.z + 3, rot.x, rot.y, rot.z ,1 ,1 ,1 ,1 ,1 ,true ,true ,true ,1.0 ,true, 0)
        PHYSICS.ADD_ROPE(coords.x, coords.y , coords.z + 3, rot.x, rot.y, rot.z ,1 ,1 ,1 ,1 ,1 ,true ,true ,true ,1.0 ,true, 0)
        PHYSICS.ADD_ROPE(coords.x, coords.y , coords.z + 3, rot.x, rot.y, rot.z ,1 ,1 ,1 ,1 ,1 ,true ,true ,true ,1.0 ,true, 0)
        PHYSICS.ADD_ROPE(coords.x, coords.y , coords.z + 3, rot.x, rot.y, rot.z ,1 ,1 ,1 ,1 ,1 ,true ,true ,true ,1.0 ,true, 0)
        util.yield()
    end
end