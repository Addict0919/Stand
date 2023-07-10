-- Made by d6b

local synctimer = {}
local settings = {
    auto = {
        cleanup = false,
        interval = 10000,
        highlimit = 24,
        modellimit = 48,
        totallimit = 128,
        timeout = 30000,
    },
    bigvehicle = {
        cleanup = false,
        limit = 5,
        radius = 250,
        timeout = 15000,
    },
    vehicle = {
        cleanup = false,
        interval = 5000,
        limit = 10,
        radius = 25,
        timeout = 15000,
    },
    object = {
        cleanup = false,
        interval = 5000,
        limit = 10,
        radius = 25,
        timeout = 15000,
    },
    ped = {
        cleanup = false,
        interval = 2000,
        limit = 10,
        radius = 25,
        timeout = 15000,
    },
}
local whitelist = {
    auto = {
        logged = {},
    },
    bigvehicle = {
        logged = {},
        owner = {},
    },
    vehicle = {
        timer = {},
        owner = {},
    },
    object = {
        timer = {},
        owner = {},
    },
    ped = {
        timer = {},
        owner = {},
    },
}
local bigvehiclenames = {"titan", "bombushka", "volatol", "alkonost", "kosatka", "avenger", "avenger2", "jet", "cargoplane", "blimp", "blimp2", "blimp3", "bus", "pbus", "nimbus", "airbus", "rentalbus", "tourbus", "tug", "tr", "tr2", "tr3", "tr4", "freight", "freightcar", "freightcar2", "freightcont1", "freighttrailer", "freightcont2", "freightgrain"}
local bigvehicle = {}

for i, Model in ipairs(bigvehiclenames) do
    bigvehicle[util.joaat(Model)] = Model
end

local allvehicles
local allpeds
local allpeds2
local allobjects
local allpickups
local allentities
util.create_thread(function()
    while true do
        allentities = {}
        allpeds2 = {}
        allvehicles = entities.get_all_vehicles_as_pointers()
        allpeds = entities.get_all_peds_as_pointers()
        allobjects = entities.get_all_objects_as_pointers()
        allpickups = entities.get_all_pickups_as_pointers()
        for i, Pointer in allvehicles do
            allentities[Pointer] = true
        end
        for i, Pointer in allpeds do
            allentities[Pointer] = true
            allpeds2[Pointer] = true
        end
        for i, Pointer in allpickups do
            allentities[Pointer] = true
        end
        for i, Pointer in allobjects do
            allentities[Pointer] = true
        end
        util.yield()
    end
end, nil)

local function does_entity_from_pointer_exist(addr)
    return allentities[addr] or false
end
local function is_pointer_a_player(addr)
    return allpeds2[addr] and entities.get_player_info(addr) ~= 0
end
local function table_entry_counts(tbl)
    local counts = {}
    for k, v in pairs(tbl) do
        local entry = tbl[k]
        counts[entry] = (counts[entry] or 0) + 1
    end
    return counts
end
local function get_highest_count(tbl)
    local counts = table_entry_counts(tbl)
    local count = 0
    local value = -1
    for k, v in pairs(counts) do
        if v > count then
            count = v
            value = k
        end
    end
    return value, count
end
local function get_entity_owner(addr)
    if type(addr) == "table" then
        local owners = {}
        for k, v in pairs(addr) do
            owners[#owners + 1] = get_entity_owner(v)
        end
        return get_highest_count(owners)
    else
        if util.is_session_started() and not util.is_session_transition_active() then
            local NetObj = memory.read_long(addr + 0xD0)
            if NetObj and NetObj ~= 0 then
                return memory.read_byte(NetObj + 0x49)
            end
            return -1
        end
        return players.user()
    end
end
local function merge_table(noduplicates, ...)
    local tbl = {...}
    local out = (noduplicates and {} or tbl[1])
    for i = 1, #tbl do
        for n = 1, #tbl[i] do
            out[#out + 1] = tbl[i][n]
        end
    end
    return out
end
local function notification(body, ...)
    util.toast(body, ...)
    util.log(body)
end
local function delete(addr)
    return (not is_pointer_a_player(addr)) and entities.delete_by_pointer(addr)
end
local function is_high_priority_entity(addr)
    local NetObj = memory.read_long(addr + 0xD0)
    return ((NetObj and NetObj ~= 0) and (memory.read_ubyte(NetObj + 0x4E) ~= 0))
end

for i = 0, 31 do
    whitelist.auto[i] = {}
    whitelist.auto[i].owner = {}
    whitelist.auto[i].timer = {}
    whitelist.auto[i].current = {}
    whitelist.auto[i].models = {}
    whitelist.auto[i].highpriority = {
        total = 0,
    }
    synctimer[i] = 0
    util.create_thread(function()
        local pid = i
        while true do
            if players.exists(pid) then
                if pid ~= players.user() and synctimer[pid] > util.current_time_millis() then
                    local Sync = menu.ref_by_rel_path(menu.player_root(pid), "Incoming Syncs>Block")
                    menu.trigger_command(Sync, "on")
                    while synctimer[pid] > util.current_time_millis() and players.exists(pid) do
                        util.yield()
                    end
                    util.toast(players.get_name(pid).." is no longer in timeout", TOAST_ALL)
                    menu.trigger_command(Sync, "off")
                end
            end
            util.yield()
        end
    end, nil)
end

local autothrottler = menu.list(menu.my_root(), "Auto Throttler", {}, "")

menu.toggle_loop(autothrottler, "Enable", {}, "", function()
    for Pointer, i in pairs(allentities) do
        local owner = get_entity_owner(Pointer)
        if not whitelist.auto.logged[Pointer] then
            whitelist.auto.logged[Pointer] = true
            if owner ~= -1 and players.exists(owner) and owner ~= players.user() then
                whitelist.auto[owner].owner[#whitelist.auto[owner].owner+1] = Pointer
                whitelist.auto[owner].current[#whitelist.auto[owner].current+1] = Pointer
                whitelist.auto[owner].timer[Pointer] = util.current_time_millis()
                local model = entities.get_model_hash(Pointer)
                whitelist.auto[owner].models[model] = (whitelist.auto[owner].models[model] or 0) + 1
                if is_high_priority_entity(Pointer) then
                    whitelist.auto[owner].highpriority[Pointer] = true
                    whitelist.auto[owner].highpriority.total = (whitelist.auto[owner].highpriority.total or 0) + 1
                end
                if synctimer[owner] > util.current_time_millis() then
                    delete(Pointer)
                end
            end
        end
    end
    for i = 0, 31 do
        if players.exists(i) then
            local existing = {}
            local existing2 = {}
            for n, Pointer in ipairs(whitelist.auto[i].current) do
                if does_entity_from_pointer_exist(Pointer) and whitelist.auto[i].timer[Pointer] + settings.auto.interval > util.current_time_millis() then
                    existing[#existing+1] = Pointer
                else
                    local model = entities.get_model_hash(Pointer)
                    whitelist.auto[i].models[model] = (whitelist.auto[i].models[model] or 1) - 1
                    if whitelist.auto[i].highpriority[Pointer] then
                        whitelist.auto[i].highpriority[Pointer] = nil
                        whitelist.auto[i].highpriority.total = whitelist.auto[i].highpriority.total - 1
                    end
                    whitelist.auto[i].current[n] = nil
                    whitelist.auto[i].timer[Pointer] = nil
                end
            end
            for n, Pointer in ipairs(whitelist.auto[i].owner) do
                if does_entity_from_pointer_exist(Pointer) then
                    existing2[#existing2+1] = Pointer
                else
                    whitelist.auto[i].owner[n] = nil
                end
            end
            whitelist.auto[i].current = existing
            whitelist.auto[i].owner = existing2
            if #whitelist.auto[i].current > settings.auto.totallimit then
                notification("[T] Throttling entities from "..tostring(players.get_name(i)), TOAST_ALL)
                if util.current_time_millis() + settings.auto.timeout > synctimer[i] then
                    synctimer[i] = util.current_time_millis() + settings.auto.timeout
                end
                if settings.auto.cleanup then
                    for n, Pointer in ipairs(whitelist.auto[i].owner) do
                        if does_entity_from_pointer_exist(Pointer) then
                            whitelist.auto[i].timer[Pointer] = util.current_time_millis()
                            delete(Pointer)
                        end
                    end
                end
            end
            for Model, Num in pairs(whitelist.auto[i].models) do
                if Num > settings.auto.modellimit then
                    notification("[M] Throttling entities from "..tostring(players.get_name(i)), TOAST_ALL)
                    if util.current_time_millis() + settings.auto.timeout > synctimer[i] then
                        synctimer[i] = util.current_time_millis() + settings.auto.timeout
                    end
                    if settings.auto.cleanup then
                        for Pointer, n in pairs(allentities) do
                            if does_entity_from_pointer_exist(Pointer) and entities.get_model_hash(Pointer) == Model then
                                delete(Pointer)
                            end
                        end
                    end
                end
            end
            if whitelist.auto[i].highpriority.total > settings.auto.highlimit then
                notification("[H] Throttling entities from "..tostring(players.get_name(i)), TOAST_ALL)
                if util.current_time_millis() + settings.auto.timeout > synctimer[i] then
                    synctimer[i] = util.current_time_millis() + settings.auto.timeout
                end
                if settings.auto.cleanup then
                    for n, Pointer in ipairs(whitelist.auto[i].owner) do
                        if does_entity_from_pointer_exist(Pointer) then
                            whitelist.auto[i].timer[Pointer] = util.current_time_millis()
                            delete(Pointer)
                        end
                    end
                end
            end
        end
    end
end, function()
    whitelist.auto = {}
    whitelist.auto.logged = {}
    for i = 0, 31 do
        whitelist.auto[i] = {}
        whitelist.auto[i].owner = {}
        whitelist.auto[i].current = {}
        whitelist.auto[i].timer = {}
        whitelist.auto[i].models = {}
        whitelist.auto[i].highpriority = {
            total = 0,
        }
    end
end)
menu.toggle(autothrottler, "Cleanup", {}, "When the throttler is triggered, automatically remove all corresponding entities around you.", function(toggle)
    settings.auto.cleanup = toggle
end)
menu.slider(autothrottler, "Interval (Seconds)", {}, "Specify (in seconds) how long the entity sync should last to be considered spam.", 0, 60, settings.auto.interval/1000, 1, function(value)
    settings.auto.interval = value*1000
end)
menu.slider(autothrottler, "Timeout (Seconds)", {}, "Specify (in seconds) how long the affected players incoming syncs will be blocked.", 0, 60, settings.auto.timeout/1000, 1, function(value)
    settings.auto.timeout = value*1000
end)
menu.slider(autothrottler, "Total Limit", {}, "Specify a limit in the total amount of entities that should be synced by any given player.", 0, 512, settings.auto.totallimit, 1, function(value)
    settings.auto.totallimit = value
end)
menu.slider(autothrottler, "High Limit", {}, 'Specify a limit in the amount of high priority (mission) entities that should be synced by any given player.', 0, 64, settings.auto.highlimit, 1, function(value)
    settings.auto.highlimit = value
end)
menu.slider(autothrottler, "Model Limit", {}, "Specify a limit in the amount of entities with identical models that should be synced by any given player.", 0, 128, settings.auto.modellimit, 1, function(value)
    settings.auto.modellimit = value
end)

local bigthrottler = menu.list(menu.my_root(), "Big Vehicles Throttler", {}, "")

menu.toggle_loop(bigthrottler, "Enable", {}, "", function()
    local Pointers = {}
    local pos = players.get_position(players.user())
    for i, Pointer in ipairs(allvehicles) do
        if whitelist.bigvehicle.logged[Pointer] == nil and (v3.distance(entities.get_position(Pointer), pos) < settings.bigvehicle.radius) then
            if bigvehicle[entities.get_model_hash(Pointer)] and whitelist.bigvehicle.owner[Pointer] ~= -1 then--and whitelist.bigvehicle.owner[Pointer] ~= players.user() then
                whitelist.bigvehicle.owner[Pointer] = get_entity_owner(Pointer)
                whitelist.bigvehicle.logged[Pointer] = true
            else
                whitelist.bigvehicle.logged[Pointer] = false
            end
        end
        if whitelist.bigvehicle.logged[Pointer] then
            Pointers[#Pointers+1] = Pointer
        end
    end
    if #Pointers > settings.bigvehicle.limit then
        local owners = {}
        for i, Pointer in ipairs(Pointers) do
            owners[#owners + 1] = whitelist.bigvehicle.owner[Pointer]
        end
        local owner = get_highest_count(owners)
        if players.exists(owner) then
            notification("Throttling big vehicles from "..tostring(players.get_name(owner)), TOAST_ALL)
            if util.current_time_millis() + settings.bigvehicle.timeout > synctimer[owner] then
                synctimer[owner] = util.current_time_millis() + settings.bigvehicle.timeout
            end
        elseif settings.bigvehicle.cleanup then
            notification("Throttling big vehicles", TOAST_ALL)
        end
        if settings.bigvehicle.cleanup then
            if players.exists(owner) then
                for i, Pointer in ipairs(Pointers) do
                    if get_entity_owner(Pointer) == owner then
                        if does_entity_from_pointer_exist(Pointer) then
                            delete(Pointer)
                        end
                    end
                end
            else
                for i, Pointer in ipairs(Pointers) do
                    if does_entity_from_pointer_exist(Pointer) then
                        delete(Pointer)
                    end
                end
            end
        end
    end
end, function()
    whitelist.bigvehicle.timer = {}
    whitelist.bigvehicle.owner = {}
end)
menu.toggle(bigthrottler, "Cleanup", {}, "When the throttler is triggered, automatically remove all corresponding entities around you.", function(toggle)
    settings.bigvehicle.cleanup = toggle
end)
menu.slider(bigthrottler, "Timeout (Seconds)", {}, "Specify (in seconds) how long the affected players incoming syncs should be blocked.", 0, 60, settings.bigvehicle.timeout/1000, 1, function(value)
    settings.bigvehicle.timeout = value*1000
end)
menu.slider(bigthrottler, "Limit", {}, "Specify a limit in the amount of the entities that should be synced in radius by any given player.", 0, 100, settings.bigvehicle.limit, 1, function(value)
    settings.bigvehicle.limit = value
end)
menu.slider(bigthrottler, "Radius", {}, "Specify a distance around you where entities will be considered.", 0, 1000, settings.bigvehicle.radius, 5, function(value)
    settings.bigvehicle.radius = value
end)

local vehiclethrottler = menu.list(menu.my_root(), "Vehicle Throttler", {}, "")

menu.toggle_loop(vehiclethrottler, "Enable", {}, "", function()
    local Pointers = {}
    local pos = players.get_position(players.user())
    for i, Pointer in ipairs(allvehicles) do
        if not whitelist.vehicle.timer[Pointer] and (v3.distance(entities.get_position(Pointer), pos) < settings.vehicle.radius) then
            whitelist.vehicle.owner[Pointer] = get_entity_owner(Pointer)
            if whitelist.vehicle.owner[Pointer] ~= -1 and whitelist.vehicle.owner[Pointer] ~= players.user() then
                whitelist.vehicle.timer[Pointer] = util.current_time_millis()
            else
                whitelist.vehicle.timer[Pointer] = 0
            end
        end
        if whitelist.vehicle.timer[Pointer] and (whitelist.vehicle.timer[Pointer] + settings.vehicle.interval > util.current_time_millis()) then
            Pointers[#Pointers+1] = Pointer
        end
    end
    if #Pointers > settings.vehicle.limit then
        local owners = {}
        for i, Pointer in ipairs(Pointers) do
            owners[#owners + 1] = whitelist.vehicle.owner[Pointer]
        end
        local owner = get_highest_count(owners)
        if players.exists(owner) then
            notification("Throttling vehicles from "..tostring(players.get_name(owner)), TOAST_ALL)
            if util.current_time_millis() + settings.vehicle.timeout > synctimer[owner] then
                synctimer[owner] = util.current_time_millis() + settings.vehicle.timeout
            end
        elseif settings.vehicle.cleanup then
            notification("Throttling vehicles", TOAST_ALL)
        end
        if settings.vehicle.cleanup then
            if players.exists(owner) then
                Pointers = entities.get_all_vehicles_as_pointers()
                for i, Pointer in ipairs(Pointers) do
                    if get_entity_owner(Pointer) == owner then
                        if does_entity_from_pointer_exist(Pointer) then
                            whitelist.vehicle.timer[Pointer] = util.current_time_millis()
                            delete(Pointer)
                        end
                    end
                end
            else
                for i, Pointer in ipairs(Pointers) do
                    if does_entity_from_pointer_exist(Pointer) then
                        whitelist.vehicle.timer[Pointer] = util.current_time_millis()
                        delete(Pointer)
                    end
                end
            end
        end
    end
end, function()
    whitelist.vehicle.timer = {}
    whitelist.vehicle.owner = {}
end)
menu.toggle(vehiclethrottler, "Cleanup", {}, "When the throttler is triggered, automatically remove all corresponding entities around you.", function(toggle)
    settings.vehicle.cleanup = toggle
end)
menu.slider(vehiclethrottler, "Interval (Seconds)", {}, "Specify (in seconds) how long the entity sync should last to be considered spam.", 0, 60, settings.vehicle.interval/1000, 1, function(value)
    settings.vehicle.interval = value*1000
end)
menu.slider(vehiclethrottler, "Timeout (Seconds)", {}, "Specify (in seconds) how long the affected players incoming syncs should be blocked.", 0, 60, settings.vehicle.timeout/1000, 1, function(value)
    settings.vehicle.timeout = value*1000
end)
menu.slider(vehiclethrottler, "Limit", {}, "Specify a limit in the amount of the entities that should be synced in radius by any given player.", 0, 100, settings.vehicle.limit, 1, function(value)
    settings.vehicle.limit = value
end)
menu.slider(vehiclethrottler, "Radius", {}, "Specify a distance around you where entities will be considered.", 0, 1000, settings.vehicle.radius, 5, function(value)
    settings.vehicle.radius = value
end)

local objectthrottler = menu.list(menu.my_root(), "Object Throttler", {}, "")

menu.toggle_loop(objectthrottler, "Enable", {}, "", function()
    local og = merge_table(false, allobjects, allpickups)
    local Pointers = {}
    local pos = players.get_position(players.user())
    for i, Pointer in ipairs(og) do
        if not whitelist.object.timer[Pointer] and (v3.distance(entities.get_position(Pointer), pos) < settings.object.radius) then
            whitelist.object.owner[Pointer] = get_entity_owner(Pointer)
            if whitelist.object.owner[Pointer] ~= -1 and whitelist.object.owner[Pointer] ~= players.user() then
                whitelist.object.timer[Pointer] = util.current_time_millis()
            else
                whitelist.object.timer[Pointer] = 0
            end
        end
        if whitelist.object.timer[Pointer] and (whitelist.object.timer[Pointer] + settings.object.interval > util.current_time_millis()) then
            Pointers[#Pointers+1] = Pointer
        end
    end
    if #Pointers > settings.object.limit then
        local owners = {}
        for i, Pointer in ipairs(Pointers) do
            owners[#owners + 1] = whitelist.object.owner[Pointer]
        end
        local owner = get_highest_count(owners)
        if players.exists(owner) then
            notification("Throttling objects from "..tostring(players.get_name(owner)), TOAST_ALL)
            if util.current_time_millis() + settings.object.timeout > synctimer[owner] then
                synctimer[owner] = util.current_time_millis() + settings.object.timeout
            end
        elseif settings.object.cleanup then
            notification("Throttling objects", TOAST_ALL)
        end
        if settings.object.cleanup then
            if players.exists(owner) then
                Pointers = entities.get_all_objects_as_pointers()
                for i, Pointer in ipairs(Pointers) do
                    if get_entity_owner(Pointer) == owner then
                        if does_entity_from_pointer_exist(Pointer) then
                            whitelist.object.timer[Pointer] = util.current_time_millis()
                            delete(Pointer)
                        end
                    end
                end
            else
                for i, Pointer in ipairs(Pointers) do
                    if does_entity_from_pointer_exist(Pointer) then
                        whitelist.object.timer[Pointer] = util.current_time_millis()
                        delete(Pointer)
                    end
                end
            end
        end
    end
end, function()
    whitelist.object.timer = {}
    whitelist.object.owner = {}
end)
menu.toggle(objectthrottler, "Cleanup", {}, "When the throttler is triggered, automatically remove all corresponding entities around you.", function(toggle)
    settings.object.cleanup = toggle
end)
menu.slider(objectthrottler, "Interval (Seconds)", {}, "Specify (in seconds) how long the entity sync should last to be considered spam.", 0, 60, settings.object.interval/1000, 1, function(value)
    settings.object.interval = value*1000
end)
menu.slider(objectthrottler, "Timeout (Seconds)", {}, "Specify (in seconds) how long the affected players incoming syncs will be blocked.", 0, 60, settings.object.timeout/1000, 1, function(value)
    settings.object.timeout = value*1000
end)
menu.slider(objectthrottler, "Limit", {}, "Specify a limit in the amount of the entities that should be synced in radius by any given player.", 0, 100, settings.object.limit, 1, function(value)
    settings.object.limit = value
end)
menu.slider(objectthrottler, "Radius", {}, "Specify a distance around you where the entities will be scanned.", 0, 1000, settings.object.radius, 5, function(value)
    settings.object.radius = value
end)

local pedthrottler = menu.list(menu.my_root(), "Ped Throttler", {}, "")

menu.toggle_loop(pedthrottler, "Enable", {}, "", function()
    local Pointers = {}
    local pos = players.get_position(players.user())
    for i, Pointer in ipairs(allpeds) do
        if not whitelist.ped.timer[Pointer] and (v3.distance(entities.get_position(Pointer), pos) < settings.ped.radius) then
            whitelist.ped.owner[Pointer] = get_entity_owner(Pointer)
            if whitelist.ped.owner[Pointer] ~= -1 and entities.get_player_info(Pointer) == 0 and whitelist.ped.owner[Pointer] ~= players.user() then
                whitelist.ped.timer[Pointer] = util.current_time_millis()
            else
                whitelist.ped.timer[Pointer] = 0
            end
        end
        if whitelist.ped.timer[Pointer] and (whitelist.ped.timer[Pointer] + settings.ped.interval > util.current_time_millis()) then
            Pointers[#Pointers+1] = Pointer
        end
    end
    if #Pointers > settings.ped.limit then
        local owners = {}
        for i, Pointer in ipairs(Pointers) do
            owners[#owners + 1] = whitelist.ped.owner[Pointer]
        end
        local owner = get_highest_count(owners)
        if players.exists(owner) then
            notification("Throttling peds from "..tostring(players.get_name(owner)), TOAST_ALL)
            if util.current_time_millis() + settings.ped.timeout > synctimer[owner] then
                synctimer[owner] = util.current_time_millis() + settings.ped.timeout
            end
        elseif settings.ped.cleanup then
            notification("Throttling peds", TOAST_ALL)
        end
        if settings.ped.cleanup then
            if players.exists(owner) then
                Pointers = entities.get_all_peds_as_pointers()
                for i, Pointer in ipairs(Pointers) do
                    if (entities.get_player_info(Pointer) == 0) and get_entity_owner(Pointer) == owner then
                        if does_entity_from_pointer_exist(Pointer) then
                            whitelist.ped.timer[Pointer] = util.current_time_millis()
                            delete(Pointer)
                        end
                    end
                end
            else
                for i, Pointer in ipairs(Pointers) do
                    if does_entity_from_pointer_exist(Pointer) then
                        whitelist.ped.timer[Pointer] = util.current_time_millis()
                        delete(Pointer)
                    end
                end
            end
        end
    end
end, function()
    whitelist.ped.timer = {}
    whitelist.ped.owner = {}
end)
menu.toggle(pedthrottler, "Cleanup", {}, "When the throttler is triggered, automatically remove all corresponding entities around you.", function(toggle)
    settings.ped.cleanup = toggle
end)
menu.slider(pedthrottler, "Interval (Seconds)", {}, "Specify (in seconds) how long the entity sync should last to be considered spam.", 0, 60, settings.ped.interval/1000, 1, function(value)
    settings.ped.interval = value*1000
end)
menu.slider(pedthrottler, "Timeout (Seconds)", {}, "Specify (in seconds) how long the affected players incoming syncs will be blocked.", 0, 60, settings.ped.timeout/1000, 1, function(value)
    settings.ped.timeout = value*1000
end)
menu.slider(pedthrottler, "Limit", {}, "Specify a limit in the amount of the entities that should be synced in radius by any given player.", 0, 100, settings.ped.limit, 1, function(value)
    settings.ped.limit = value
end)
menu.slider(pedthrottler, "Radius", {}, "Specify a distance around you where the entities will be considered.", 0, 1000, settings.ped.radius, 5, function(value)
    settings.ped.radius = value
end)

util.keep_running()