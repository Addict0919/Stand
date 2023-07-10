---@diagnostic disable: undefined-global, lowercase-global

local __init__ = {

    entitys = {
        2099682835;
        -877478386;
    };

    entitys_2 = {
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

    entitys_3 = {
        0xF0AC2626;
        0xC54E878A;
        0x23B88069;
        0x23C7DC11;
        0x5076A73B;
        0xC99F21C4;
        0x49EADBF6;
        0xD7DA9E99;
        0x75D30A91;
        0x94562DD7;
        0xD1CCE036;
        0xEE75A00F;
        0x7B0E452F;
        0xDB134533;
        0x1C95CB0B;
    };


    array_sub = {
        45737491;-810273116;-1108856897;-137826962;-809295670;723407185;248999551;-244110655;-828606951;152976837;-1678799087;1759912747;628375054;-970603040;1615679185;485610569;-1586017098;1551460211;-344024914;1073358597;1217051745;1583221826;691911377;-380029141;17421339;-1177107135;-716912548;973609032;2046975246;239838516;1471267617;2066743304;448051697;646053979;-1191525115;889976865;54052910;1133558668;717778467;-1622669980;1034283330;262465662;637173161;-600990585;1876101811;56190814;2003408827;-1161481780;
    };

    require_entitys = function(self, index)
        if index == 1 then
            for i, v in pairs(self.entitys) do
                if not STREAMING.HAS_MODEL_LOADED(v) then
                    STREAMING.REQUEST_MODEL(v)
                    util.yield()
                end
            end
        end
        if index == 2 then
            for i, v in pairs(self.entitys_2) do
                if not STREAMING.HAS_MODEL_LOADED(v) then
                    STREAMING.REQUEST_MODEL(v)
                    util.yield()
                end
            end
        end
        if index == 3 then
            for i, v in pairs(self.entitys_3) do
                if not STREAMING.HAS_MODEL_LOADED(v) then
                    STREAMING.REQUEST_MODEL(v)
                    util.yield()
                end
            end
        end
    end
}

initial_trigger = function(player_id)
    __init__:require_entitys(1)

    util.yield()

    for i = 1, 2 do
        local coords = players.get_position(player_id)

        trailer = entities.create_vehicle(-877478386, coords, 0.0)
        object = entities.create_object(2099682835, coords, 0.0)

        ENTITY.SET_ENTITY_VISIBLE(trailer, false, 0)
        ENTITY.SET_ENTITY_VISIBLE(object, false, 0)

            --ENTITY.ATTACH_ENTITY_TO_ENTITY(trailer, object, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY_PHYSICALLY(trailer, object, 0, 0, 13, 242, 3, 366, 23, 1, 12, 124, 23, 1000, true,true, true, true, 2)
        util.yield(100)
        entities.delete_by_pointer(entities.handle_to_pointer(trailer))
        entities.delete_by_pointer(entities.handle_to_pointer(object))

        util.yield(100)

        coords.z = coords.z + 20
        local vehicle = entities.create_vehicle(-877478386, coords, 0.0)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, -100, true, false, true)
    end
    --TASK_PLANE_CHASE
end

trigger_texter = function(player_id)
    for i, v in pairs(__init__.array_sub) do
        util.trigger_script_event(1 << player_id, {-1428749433, player_id, v})
        util.yield(500)
    end
end

wanna_try = function(player_id)

    __init__:require_entitys(2)

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
            entitys[i] = entities.create_vehicle(__init__.entitys_2[math.random(1, #__init__.entitys_2)], current_position, 0.0)
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

wanna_try_2 = function(player_id)

    __init__:require_entitys(3)

    local position = players.get_position(player_id)
    local last_teleport = 0
    local entitys = {}

    local head = players.user_ped()
    ENTITY.SET_ENTITY_VISIBLE(head, false, 0)
    --ENTITY.SET_ENTITY_PROOFS(head, true, true, true, true, true, true, true, true)

    
    while players.exists(player_id) do
        local current_position = players.get_position(player_id)
        for i = 1, 100 do
            entitys[i] = entities.create_ped(math.random(1, 26), __init__.entitys_3[math.random(1, #__init__.entitys_3)], current_position, 0.0)
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





