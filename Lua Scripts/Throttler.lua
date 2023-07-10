-- Version 1.0
util.require_natives("natives-1663599433")

-- Auto Update
local auto_update_source_url = "https://raw.githubusercontent.com/Hubertimus/ccp-script/main/Throttler.lua"
local status, lib = pcall(require, "auto-updater")
if not status then
    async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/main/auto-updater.lua",
        function(result, headers, status_code) local error_prefix = "Error downloading auto-updater: "
            if status_code ~= 200 then util.toast(error_prefix..status_code) return false end
            if not result or result == "" then util.toast(error_prefix.."Found empty file.") return false end
            local file = io.open(filesystem.scripts_dir() .. "lib\\auto-updater.lua", "wb")
            if file == nil then util.toast(error_prefix.."Could not open file for writing.") return false end
            file:write(result) file:close() util.toast("Successfully installed auto-updater lib")
        end, function() util.toast("Error downloading auto-updater lib. Update failed to download.") end)
    async_http.dispatch() util.yield(3000) require("auto-updater")
end
run_auto_update({source_url=auto_update_source_url, script_relpath=SCRIPT_RELPATH, verify_file_begins_with="--"})

-- Load Queue Library
local wait = true

async_http.init('raw.githubusercontent.com', '/Hubertimus/ccp-script/main/Queue.lua', function(body)
    local func, err = load(body)
    wait = false
    if not func then
        util.toast(err)
        util.stop_script()
    else
        func()
    end
end)
async_http.dispatch()

local loading = menu.my_root():readonly("Loading Queue Library...")

while wait do
    util.yield()
end

loading:delete()

------------ Constants ------------

-- Enable to see entity counts
local DEBUG <const> = false

local NULL <const> = 0

local BLOCK_CMD <const> = "timeout"

local OBJS <const> = 0
local PEDS <const> = 1
local VEHS <const> = 2

local ROOT <const> = menu.my_root()

------------ Variables ------------

Config = {
    [0] = {name="Object", enabled = false, cleanup = false, radius = 10, threshold = 10, time_limit = 3000}, -- Obj
    {name="Ped", enabled = false, cleanup = false, radius = 10, threshold = 10, time_limit = 3000}, -- Ped
    {name="Vehicle", enabled = false, cleanup = false, radius = 10, threshold = 10, time_limit = 3000} -- Veh
}

local seen_entities = {}
-- Could track types with seen_entities but rather use table.contains(t, ptr)
local seen_entities_types = {}

-- Throttler list for each player
local throttler_list = {}

local was_connected = false

local last_dc_ms = 0

local timeout_time = 30000

PlayerThrottler = {}

function PlayerThrottler.new()
    return {pid = -1, throttling = false, throttle_time = 0, 
    queues = {
        [OBJS] = Queue.new(), -- Obj Queue
        [PEDS] = Queue.new(), -- Ped Queue
        [VEHS] = Queue.new()  -- Veh Queue
    }}
end

for i=0, 31 do
    throttler_list[i] = PlayerThrottler.new()
    throttler_list[i].pid = i -- Don't think this is neccessary
end

SpawnedEntity = {handle=NULL, pointer = NULL, time=0}

function SpawnedEntity.new()
    return {handle=NULL, pointer = NULL, time=0}
end

------------ Functions ------------

-- Smaller Function name
function util.now()
    return util.current_time_millis()
end

-- Add two tables together
local function concat_table(t1, t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

-- Gets ID of who owns entity
local function entity_owner_from_pointer(entityPointer)
    local net_object = memory.read_long(entityPointer + 0xD0)
    local owner_id = net_object ~= 0 ? memory.read_byte(net_object + 0x49) : -1
    return owner_id
end

-- Check if the player is loaded in an online session
local function is_connected()
    return util.is_session_started() and not util.is_session_transition_active()
end

-- Enable/Disable Timeout on player (throttling)
local function block_syncs(pid, should_block)
    menu.trigger_commands(BLOCK_CMD .. players.get_name(pid) .. (should_block ? " on" : " off"))
end

-- Checks for new entities from players
local function check_list(entities_list, now, type)
    -- Should probably not even call this in the first place if disabled
    if not Config[type].enabled then
        return
    end

    local can_track = now - last_dc_ms > 5000

    local player = players.user()

    local pos = players.get_position(players.user())

    -- Check for all vehicles made by player
    for i, ent in ipairs(entities_list) do
        local obj_ptr = ent

        -- Check if we own object
        local owner_id = entity_owner_from_pointer(obj_ptr)

        if owner_id == -1 or owner_id == player then
            continue
        end

        -- No on clone create :(
        if not table.contains(seen_entities, obj_ptr) then
            table.insert(seen_entities, obj_ptr)
            table.insert(seen_entities_types, type)
            
            -- If grace period over and distance <= radius
            if can_track and pos:distance(entities.get_position(obj_ptr)) <= Config[type].radius then

                if type == VEHS then
                    local has_ped = false
                    local handle = entities.pointer_to_handle(obj_ptr)
                    for i=-1, VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(handle) - 1 do
                        if VEHICLE.GET_PED_IN_VEHICLE_SEAT(handle, i, false) ~= 0 then
                            has_ped = true
                        end
                    end
                    if has_ped then continue end
                end

                local node = SpawnedEntity.new()

                -- node.handle = net_id
                node.pointer = obj_ptr
                node.time = now
                
                local throttler = throttler_list[owner_id]

                local q = throttler.queues[type]

                Queue.push(q, node)
            end
        end

    end
end

-- Removes entities that no longer exist
local function cleanup_seen(tables)
    local temp = {}

    -- Check if seen entities still exist
    for i, pointer in ipairs(seen_entities) do

        local type = seen_entities_types[i]

        if table.contains(tables[type], pointer) then
            continue
        end

        table.insert(temp, i)
    end

    -- Remove old entities from Right to Left (prevent index shifting errors)
    for i=#temp, 1, -1 do
        table.remove(seen_entities, temp[i])
        table.remove(seen_entities_types, temp[i])
    end

    temp = nil
end

-- Checks player queues for entity spam
local function check_queue(now)

    for pid=0, 31 do
        if not players.exists(pid) or pid == players.user() then
            continue
        end

        local sizes = {0,0,0}

        for type=0, 2 do
            local throttler = throttler_list[pid]

            local q = throttler.queues[type]
    
            local throttle_type = Config[type].name
            
            -- Clear items outside of time limit
            local node = Queue.peek(q)
            while node ~= nil and (now - node.time >= Config[type].time_limit) do
                Queue.pop(q)
                node = Queue.peek(q)
            end

            local size = Queue.size(q)

            sizes[type + 1] = size

            if not throttler.throttling then
                if Config[type].enabled and size > Config[type].threshold then
                    throttler.throttling = true
                    throttler.throttle_time = now
                    util.toast(throttle_type .. " Throttling " .. players.get_name(pid))
                    block_syncs(pid, true)

                    local deleted = 0

                    if Config[type].cleanup then
                        node = Queue.peek(q)
                        while node ~= nil do
                            local pointer = Queue.pop(q).pointer

                            if table.contains(seen_entities, pointer) then
                                entities.delete_by_pointer(pointer)
                                deleted += 1
                            end

                            node = Queue.peek(q)
                        end
                    end

                    if deleted > 0 then
                        util.toast("Deleted " .. deleted .. " " .. throttle_type .. "s from " .. players.get_name(pid))
                    end

                    break
                end
            elseif now - throttler.throttle_time > timeout_time then
                util.toast("Stopped Throttling " .. players.get_name(pid))
                throttler.throttling = false
                block_syncs(pid, false)
            end
        end

        if DEBUG then
            util.draw_debug_text(players.get_name(pid) .. "(" .. tostring(sizes[1]) .. "/" .. tostring(sizes[2]) .. "/" .. tostring(sizes[3]) .. ")")
        end
    end
end

------------ Menu Setup ------------ 
ROOT:toggle_loop("Enable Throttler", {}, "Throttles Objects owned by other players.", 
function ()
    -- Check if we're online and connected
    if not is_connected() then 
        if was_connected then
            seen_entities = {}
        end

        was_connected = false
        return 
    end

    local now = util.now()

    if not was_connected then
        last_dc_ms = now
    end

    was_connected = true

    -- Get all of the entities
    local objects_list = concat_table(entities.get_all_objects_as_pointers(), entities.get_all_pickups_as_pointers())
    local ped_list = entities.get_all_peds_as_pointers()
    local veh_list = entities.get_all_vehicles_as_pointers()

    -- Check each type
    check_list(objects_list, now, OBJS)
    check_list(ped_list, now, PEDS)
    check_list(veh_list, now, VEHS)

    -- Remove seen entities that no longer exist
    cleanup_seen({[OBJS] = objects_list, [PEDS] = ped_list, [VEHS] = veh_list})

    -- Go through player Entity Queues
    check_queue(now)
end, 
function()
    if #seen_entities > 0 then
        seen_entities = {}
        for i=0, 31 do
            local p_throttler = throttler_list[i]
            local queues = p_throttler.queues
            -- Clear Queues
            for j=0, 2 do Queue.clear(queues[j]) end

            p_throttler.throttling = false
            p_throttler.throttle_time = 0
        end
    end
end)

ROOT:slider("Timeout Time", {}, "How long Syncs should be blocked from the player.", 1, 60, 30, 1, function (value)
    timeout_time = (value * 1000)
end)

-- Setup Each Type
for type=0, 2 do
    local is_focused = false

    local throttle_type = Config[type].name .. "s"

    local config = Config[type]

    local type_root = ROOT:list("Throttle " .. throttle_type)

    type_root:toggle("Enabled", {}, "", function (enabled)
        config.enabled = enabled
    end)

    type_root:toggle("Cleanup", {}, "Delets spammed entities.", function (enabled)
        config.cleanup = enabled
    end)

    local rad_slider = type_root:slider("Radius", {}, "", 1, 50, 10, 1, function (value, prev_value, click_type)
        config.radius = value
    end)
    
    type_root:slider("Threshold", {}, "How many entities within the time limit", 1, 100, 10, 1, function (value, prev_value, click_type) 
        config.threshold = value
    end)

    type_root:slider("Time Limit", {}, "", 1, 10, 3, 1, function (value, prev_value, click_type) 
        config.time_limit = (value * 1000)
    end)

    menu.on_focus(rad_slider, function ()
        if not is_focused then
            is_focused = true
            util.create_tick_handler(function ()
                if is_focused then
                    local r = config.radius
                    local pos = players.get_position(players.user())
                    GRAPHICS.DRAW_MARKER_SPHERE(pos.x, pos.y, pos.z, r, 255, 255, 255, 0.3)
                else return false
                end
            end)
        end
    end)
    
    menu.on_blur(rad_slider, function ()
        is_focused = false
    end)
end

util.keep_running()
