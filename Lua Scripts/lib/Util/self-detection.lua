---@diagnostic disable: undefined-global, lowercase-global

require("Util/utils")

local cages = {
    1692612370,
    379820688,
    -779638860,
    3515328436,
    138278167,
    1533556199,
    2138176025,
    1337911167,
    86064437,
    779277682,
    -1004830663,
    3290136633,
    1688773919,
    -1234220885,
    3060746411,
    -930747176,
    3364220120,
    -1698655922,
    2596311374,
    -1992528326,
    2302438970,
    1603346205,
    -2007868701,
    2287098595,
    169991796,
    -1662909450,
    2632057846,
    894554243,
    1025978577,
    1326581024,
    -528704006,
    3766263290,
    237402445,
    -1235332710,
    3059634586,
    2081936690,
    -1170462683,
    3124504613,
    1322181531,
    993442923,
    1124049486,
    1125864094,
    -1585415771,
    2709551525,
    2063962179,
    1396140175,
    959275690,

}

---@region: self

godmode = function(state)

    local player_index = player_index(players.user())

    if state == true then
        ENTITY.SET_ENTITY_PROOFS(player_index, true, true, true, true, true, false, 1, false)
    else
        ENTITY.SET_ENTITY_PROOFS(player_index, false, false, false, false, false, false, 1, false)
    end
end

random_outfit = function()

    local player_index = player_index(players.user())

    PED.SET_PED_RANDOM_COMPONENT_VARIATION(player_index, 0)
    PED.SET_PED_RANDOM_PROPS(player_index)
end

---@region: detection

noclip_detection = function()

    for i = 1, 32 do
        if players.exists(i) and not i == players.user() and not players.is_in_interior(i) then
            
            local coords = player_coords(i)
            local player_index = player_index(i)

            local success, ground_z = util.get_ground_z(coords.x, coords.y, coords.z, 1500)

            if success and ground_z + 15 < coords.z
            and not PED.IS_PED_IN_ANY_HELI(player_index) and not PED.IS_PED_IN_ANY_PLANE(player_index)
            and not PED.IS_PED_RAGDOLL(player_index) and not ENTITY.IS_ENTITY_IN_WATER(player_index) and not ENTITY.IS_ENTITY_IN_AIR(player_index)
            and not TASK.GET_IS_TASK_ACTIVE(player_index, 16) and not TASK.GET_IS_TASK_ACTIVE(player_index, 17) and not TASK.GET_IS_TASK_ACTIVE(player_index, 18) 
            and not TASK.GET_IS_TASK_ACTIVE(player_index, 19) and not TASK.GET_IS_TASK_ACTIVE(player_index, 54) and not TASK.GET_IS_TASK_ACTIVE(player_index, 152) 
            and not TASK.GET_IS_TASK_ACTIVE(player_index, 162) and not TASK.GET_IS_TASK_ACTIVE(player_index, 176) and not TASK.GET_IS_TASK_ACTIVE(player_index, 177) 
            and not TASK.GET_IS_TASK_ACTIVE(player_index, 178) and not TASK.GET_IS_TASK_ACTIVE(player_index, 179) and not TASK.GET_IS_TASK_ACTIVE(player_index, 180) 
            and not TASK.GET_IS_TASK_ACTIVE(player_index, 335) and not TASK.GET_IS_TASK_ACTIVE(player_index, 422) and not TASK.GET_IS_TASK_ACTIVE(player_index, 423) then

                if PED.IS_PED_IN_ANY_VEHICLE(player_index) then
                    if ENTITY.GET_ENTITY_MODEL(get_player_vehicle(i, false)) == 1483171323 or 2069146067 or 884483972 then
                        goto replay
                    end
                end
                notify("Noclip Detected -->" .. PLAYER.GET_PLAYER_NAME(i), "Detection", "CHAR_BLOCKED", "~r~")
                log("Possible Noclip Detected from UID-->" .. i .. " Username-->" .. PLAYER.GET_PLAYER_NAME(i))
            end
        end
    end
    ::replay::
    util.yield()
end

cage_protection = function()

    local objects = entities.get_all_objects_as_handles()

    for _, object in pairs(objects) do

        local model = ENTITY.GET_ENTITY_MODEL(object)
        
        for _, cage in pairs(cages) do

            if model == cage then

                if not get_entity_owner(object) == players.user() then

                    notify("Blocked a Cage (Hash-->" .. cage .. " | ObjectID--> ".. object ..")" , "Protection", "CHAR_BLOCKED", "~r~")
                    log("Blocked a Cage (Hash-->" .. cage .. " | ObjectID--> ".. object ..")")

                    entities.delete_by_handle(v)

                end
            end
        end
    end
end
