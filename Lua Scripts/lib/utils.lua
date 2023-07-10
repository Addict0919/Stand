---@diagnostic disable: undefined-global, lowercase-global

---@region: utility functions

player_index = function(pid)

    local player_index = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    return player_index
end

player_coords = function(pid)

    local player_coords = ENTITY.GET_ENTITY_COORDS(player_index(pid), true)
    return player_coords
end

entity_coords = function(entity)

    local entity_coords = ENTITY.GET_ENTITY_COORDS(entity)
    return entity_coords
end

request_control_of_entity = function(entity, time)

    local unixtime = util.current_unix_time_seconds()
    local seconds = unixtime + time

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
    while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and unixtime < seconds do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
        util.yield()
    end
    if NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) then
        return entity
    else
        return 0
    end
end

request_stream_of_entity = function(entity, time)
    local unixtime = util.current_unix_time_seconds()
    local seconds = unixtime + time

    STREAMING.REQUEST_MODEL(entity)
    while not STREAMING.HAS_MODEL_LOADED(entity) and unixtime < seconds do
        STREAMING.REQUEST_MODEL(entity)
        util.yield()
    end
    if STREAMING.HAS_MODEL_LOADED(entity) then
        return entity
    else
        return 0
    end
end

request_stream_of_ptfx = function(ptfx, time)

    local unixtime = util.current_unix_time_seconds()
    local seconds = unixtime + time

    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(ptfx) and unixtime < seconds do
        STREAMING.REQUEST_NAMED_PTFX_ASSET(ptfx)
        util.yield()
    end
end

---@param pid integer
---@param with_access boolean
get_player_vehicle = function(pid, with_access)

    local player_index = player_index(pid)

    if PED.IS_PED_IN_ANY_VEHICLE(player_index, true) then
        local vehicle = PED.GET_VEHICLE_PED_IS_IN(player_index, false)

        if with_access then
            request_control_of_entity(vehicle, 5)
            return vehicle
        else
            return vehicle
        end
    end
end

get_entity_owner = function(entity)

    local entity_pointer = entities.handle_to_pointer(entity)

	local address = memory.read_long(entity_pointer + 0xD0)

	return (address ~= 0) and memory.read_byte(address + 0x49) or -1
end

log = function(message)
    return util.log("[AsunaHub] " .. message)
end

notify = function(message, sub_title, image, colour)
    GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(image, 0)
	
	while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(image) do
		util.yield()
	end

	util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
	
	local tittle = "AsunaHub"
	local subtitle = colour..sub_title
	
	HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(image, image, true, 4, tittle, subtitle)
	HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)
end