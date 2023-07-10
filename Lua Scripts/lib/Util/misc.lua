---@diagnostic disable: undefined-global, lowercase-global

require("Util/utils")


army_model = function()

    request_stream_of_entity(0x72C0CAD2, 5)

    PLAYER.SET_PLAYER_MODEL(players.user(), 0x72C0CAD2)

    util.yield(1000)

    menu.trigger_commands("hair 1")
end

get_current_vehicle = function()
    log(players.get_vehicle_model(players.user()))
end

clear_area = function()
    
    local objects = entities.get_all_objects_as_handles()

	for i, v in pairs(objects) do
		ENTITY.SET_ENTITY_AS_MISSION_ENTITY(v, true, true)
		entities.delete_by_handle(v)
		util.yield()
	end

    local vehicles = entities.get_all_vehicles_as_handles()

	for i, v in pairs(vehicles) do
		ENTITY.SET_ENTITY_AS_MISSION_ENTITY(v, true, true)
		entities.delete_by_handle(v)
		util.yield()
	end

    local peds = entities.get_all_peds_as_handles()

	for i, v in pairs(peds) do
		if ped ~= PLAYER.PLAYER_PED_ID() then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(v, true, true)
            entities.delete_by_handle(v)
			util.yield()
		end
	end
end