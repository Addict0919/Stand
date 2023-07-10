-- AliasSpawner
-- by Hexarobi
-- Thanks to acjoker for suggesting this as a separate script

local SCRIPT_VERSION = "0.1"
local AUTO_UPDATE_BRANCHES = {
    { "main", {}, "More stable, but updated less often.", "main", },
    { "dev", {}, "Cutting edge updates, but less stable.", "dev", },
}
local SELECTED_BRANCH_INDEX = 1
local selected_branch = AUTO_UPDATE_BRANCHES[SELECTED_BRANCH_INDEX][1]

local loading_menu = menu.divider(menu.my_root(), "Loading...")

---
--- Auto-Updater Lib Install
---

-- Auto Updater from https://github.com/hexarobi/stand-lua-auto-updater
local status, auto_updater = pcall(require, "auto-updater")
if not status then
    local auto_update_complete = nil util.toast("Installing auto-updater...", TOAST_ALL)
    async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/main/auto-updater.lua",
            function(result, headers, status_code)
                local function parse_auto_update_result(result, headers, status_code)
                    local error_prefix = "Error downloading auto-updater: "
                    if status_code ~= 200 then util.toast(error_prefix..status_code, TOAST_ALL) return false end
                    if not result or result == "" then util.toast(error_prefix.."Found empty file.", TOAST_ALL) return false end
                    filesystem.mkdir(filesystem.scripts_dir() .. "lib")
                    local file = io.open(filesystem.scripts_dir() .. "lib\\auto-updater.lua", "wb")
                    if file == nil then util.toast(error_prefix.."Could not open file for writing.", TOAST_ALL) return false end
                    file:write(result) file:close() util.toast("Successfully installed auto-updater lib", TOAST_ALL) return true
                end
                auto_update_complete = parse_auto_update_result(result, headers, status_code)
            end, function() util.toast("Error downloading auto-updater lib. Update failed to download.", TOAST_ALL) end)
    async_http.dispatch() local i = 1 while (auto_update_complete == nil and i < 40) do util.yield(250) i = i + 1 end
    if auto_update_complete == nil then error("Error downloading auto-updater lib. HTTP Request timeout") end
    auto_updater = require("auto-updater")
end
if auto_updater == true then error("Invalid auto-updater lib. Please delete your Stand/Lua Scripts/lib/auto-updater.lua and try again") end

---
--- Auto-Update
---

local auto_update_config = {
    source_url = "https://raw.githubusercontent.com/hexarobi/stand-lua-alias-spawner/main/AliasSpawner.lua",
    script_relpath = SCRIPT_RELPATH,
    switch_to_branch = selected_branch,
    verify_file_begins_with = "--",
}
auto_updater.run_auto_update(auto_update_config)

local config = {
    num_allowed_spawned_vehicles_per_player = 2,
}

---
--- Data
---

local VEHICLE_ALIASES = {
    moc = "trailerlarge",
    terrorbyte = "terbyte",
    ramp = "dune4",
    spacedocker = "dune2",
    wedge = "phantom2",
    phantomwedge = "phantom2",
    op = "oppressor",
    op2 = "oppressor2",
    br8 = "openwheel1",
    dr2 = "openwheel2",
    pr4 = "formula",
    r88 = "formula2",
    b11 = "strikeforce",
    weedvan = "youga4",
    airportbus = "airbus",
    prisonbus = "pbus",
    partybus = "pbus2",
    dominatorgtx = "dominator3",
    futogtx = "futo2",
    gokart = "veto",
    duneloader = "dloader",
    hellfire = "gauntlet4",
    luxordeluxe = "luxor2",
    swiftdeluxe = "swift2",
    antiaircraft = "trailersmall2",
    superdiamond = "superd",
    zz8 = "ruiner4",
    ingus = "ignus",
    iguns = "ignus",
    clownvan = "speedo2",
    blazeraqua = "blazer5",
    firetruck = "firetruk",
    utilitytruck = "utillitruck",
    utilitytruck2 = "utillitruck2",
    utilitytruck3 = "utillitruck3",
    jesterrr = "jester4",
    buffalostx = "buffalo4",
    vigerozx = "vigero2",
    stirlinggt = "feltzer3",
    ["10f"] = "tenf",
    ["10fwide"] = "tenf2",
    tank = "rhino",
    bodhi = "bodhi2",
    egt = "omnisegt",
    etr1 = "sheava",
    donk = "faction3",
    mallard = "stunt",
    ["811"] = "pfister811",
    sparrow = "seasparrow2",
    ultralight = "microlight",
    s80rr = "s80",
    re7b = "le7b",
    x80 = "prototipo",
}

local constants = {

    VEHICLE_MAX_OPTIONS = {
        WHEEL_TYPES = 13,
        WINDOW_TINTS = 6,
    },

    VEHICLE_CLASSES = {
        COMPACTS = 0,
        SEDANS = 1,
        SUVS = 2,
        COUPES = 3,
        MUSCLE = 4,
        SPORTSCLASSICS = 5,
        SPORTS = 6,
        SUPER = 7,
        MOTORCYCLES = 8,
        OFFROAD = 9,
        INDUSTRIAL = 10,
        UTILITY = 11,
        VANS = 12,
        CYCLES = 13,
        BOATS = 14,
        HELICOPTERS = 15,
        PLANES = 16,
        SERVICE = 17,
        EMERGENCY = 18,
        MILITARY = 19,
        COMMERCIAL = 20,
        TRAINS = 21,
    },

    VEHICLE_WHEEL_TYPES = {
        STOCK = -1,
        SPORT = 0,
        MUSCLE = 1,
        LOWRIDER = 2,
        SUV = 3,
        OFFROAD = 4,
        TUNER = 5,
        BIKE = 6,
        HIGHEND = 7,
        BENNY = 8,
        BENNY2 = 9,
        F1 = 10,
        STREET = 11,
    },

    VEHICLE_PAINT_TYPES = {
        NORMAL = 0,
        METALLIC = 1,
        PEARL = 2,
        MATTE = 3,
        METAL = 4,
        CHROME = 5,
    },

    VEHICLE_MOD_TYPES = {
        MOD_SPOILER = 0,
        MOD_FRONTBUMPER = 1,
        MOD_REARBUMPER = 2,
        MOD_SIDESKIRT = 3,
        MOD_EXHAUST = 4,
        MOD_CHASSIS = 5, --Or roll cage
        MOD_GRILLE = 6,
        MOD_HOOD = 7,
        MOD_FENDER = 8,
        MOD_RIGHTFENDER = 9,
        MOD_ROOF = 10,
        MOD_ENGINE = 11,
        MOD_BRAKES = 12,
        MOD_TRANSMISSION = 13,
        MOD_HORNS = 14,
        MOD_SUSPENSION = 15,
        MOD_ARMOR = 16,
        MOD_UNK17 = 17,
        MOD_TURBO = 18,
        MOD_UNK19 = 19,
        MOD_TIRESMOKE = 20,
        MOD_UNK21 = 21,
        MOD_XENONLIGHTS = 22,
        MOD_FRONTWHEELS = 23,
        MOD_BACKWHEELS = 24, --Bikes only

        -- Benny's
        MOD_PLATEHOLDER = 25,
        MOD_VANITY_PLATES  = 26,
        MOD_TRIM = 27,
        MOD_ORNAMENTS = 28,
        MOD_DASHBOARD = 29,
        MOD_DIAL = 30,
        MOD_DOOR_SPEAKER = 31,
        MOD_SEATS = 32,
        MOD_STEERINGWHEEL = 33,
        MOD_SHIFTER_LEAVERS = 34,
        MOD_PLAQUES = 35,
        MOD_SPEAKERS = 36,
        MOD_TRUNK = 37,
        MOD_HYDRULICS = 38,
        MOD_ENGINE_BLOCK = 39,
        MOD_AIR_FILTER = 40,
        MOD_STRUTS = 41,
        MOD_ARCH_COVER = 42,
        MOD_AERIALS = 43,
        MOD_TRIM = 44,
        MOD_TANK = 45,
        MOD_WINDOWS = 46,
        MOD_UNK47 = 47,
        MOD_LIVERY = 48
    },

    VEHICLE_PLATE_TYPES = {
        MODERN = 0,
        BLACK = 1,
        BLUE = 2,
        CLASSIC = 3,
        EXEMPT = 4,
        YANKTON = 5
    },

    VEHICLE_HEADLIGHT_COLORS = {
        STOCK = -1,
        WHITE = 0,
        BLUE = 1,
        LIGHTBLUE = 2,
        GREEN = 3,
        LIME = 4,
        YELLOW = 5,
        GOLD = 6,
        ORANGE = 7,
        RED = 8,
        PINK = 9,
        HOTPINK = 10,
        PURPLE = 11,
        BLACK = 12
    }

}


---
--- Dependencies
---

util.ensure_package_is_installed('lua/natives-1663599433')
util.require_natives(1663599433)
local status_natives, natives = pcall(require, "natives-1663599433")
if not status_natives then error("Could not natives lib. Make sure it is selected under Stand > Lua Scripts > Repository > natives-1663599433") end

---
--- Utils
---

local function help_message(pid, message)
    if pid ~= nil and message ~= nil then
        if (type(message) == "table") then
            for _, message_part in pairs(message) do
                chat.send_targeted_message(pid, pid, message_part, false)
            end
        else
            chat.send_targeted_message(pid, pid, message, false)
        end
    end
end

local function load_hash(hash)
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        util.yield()
    end
end

local players_spawned_vehicles = {}

local function get_player_spawned_vehicles(pid)
    for _, player_spawned_vehicles in pairs(players_spawned_vehicles) do
        if player_spawned_vehicles.pid == pid then
            return player_spawned_vehicles
        end
    end
    local new_player_spawned_vehicles = {pid=pid, vehicles={}}
    table.insert(players_spawned_vehicles, new_player_spawned_vehicles)
    return new_player_spawned_vehicles
end

local function despawn_for_player(pid)
    local player_spawned_vehicles = get_player_spawned_vehicles(pid)
    if #player_spawned_vehicles.vehicles >= config.num_allowed_spawned_vehicles_per_player then
        entities.delete_by_handle(player_spawned_vehicles.vehicles[1].handle)
        table.remove(player_spawned_vehicles.vehicles, 1)
    end
end

local function spawn_for_player(pid, vehicle)
    local player_spawned_vehicles = get_player_spawned_vehicles(pid)
    table.insert(player_spawned_vehicles.vehicles, {handle=vehicle})
end

local function spawn_vehicle_for_player(pid, vehicle_model)
    local hash = util.joaat(vehicle_model)
    if STREAMING.IS_MODEL_VALID(hash) and STREAMING.IS_MODEL_A_VEHICLE(hash) then
        despawn_for_player(pid)
        load_hash(hash)
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(target_ped, 0.0, 4.0, 0.5)
        local heading = ENTITY.GET_ENTITY_HEADING(target_ped)
        local vehicle = entities.create_vehicle(hash, pos, heading)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        spawn_for_player(pid, vehicle)
        return vehicle
    end
end

local function vehicle_set_mod_max_value(vehicle, vehicle_mod)
    local max = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, vehicle_mod) - 1
    VEHICLE.SET_VEHICLE_MOD(vehicle, vehicle_mod, max)
end

local function set_vehicle_mod_random_value(vehicle, vehicle_mod)
    local max = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, vehicle_mod) - 1
    VEHICLE.SET_VEHICLE_MOD(vehicle, vehicle_mod, math.random(-1, max))
end

local function max_mods(vehicle)
    VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
    VEHICLE.SET_VEHICLE_WINDOW_TINT(vehicle, math.random(-1, constants.VEHICLE_MAX_OPTIONS.WINDOW_TINTS))
    for mod_name, mod_number in pairs(constants.VEHICLE_MOD_TYPES) do
        vehicle_set_mod_max_value(vehicle, mod_number)
    end
    for x = 17, 22 do
        VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, x, true)
    end
    VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, false)
end

---
--- Commands
---

local function shuffle_mods(vehicle)
    VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
    VEHICLE.SET_VEHICLE_WINDOW_TINT(vehicle, math.random(-1, constants.VEHICLE_MAX_OPTIONS.WINDOW_TINTS))
    for mod_name, mod_number in pairs(constants.VEHICLE_MOD_TYPES) do
        -- Don't shuffle performance mods, wheels, or livery
        if not (mod_number == constants.VEHICLE_MOD_TYPES.MOD_ARMOR
                or mod_number == constants.VEHICLE_MOD_TYPES.MOD_TRANSMISSION
                or mod_number == constants.VEHICLE_MOD_TYPES.MOD_ENGINE
                or mod_number == constants.VEHICLE_MOD_TYPES.MOD_BRAKES
                or mod_number == constants.VEHICLE_MOD_TYPES.MOD_FRONTWHEELS
                or mod_number == constants.VEHICLE_MOD_TYPES.MOD_BACKWHEELS
                or mod_number == constants.VEHICLE_MOD_TYPES.MOD_LIVERY
        ) then
            set_vehicle_mod_random_value(vehicle, mod_number)
        end
    end
    for x = 17, 22 do
        VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, x, math.random() > 0.5)
    end
    VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, math.random(-1, 12))
end

local function shuffle_livery(vehicle, pid, livery_number)
    local max_livery_number = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, constants.VEHICLE_MOD_TYPES.MOD_LIVERY) - 1
    if livery_number == nil then
        livery_number = math.random(-1, max_livery_number)
    end
    VEHICLE.SET_VEHICLE_MOD(vehicle, constants.VEHICLE_MOD_TYPES.MOD_LIVERY, tonumber(livery_number))
    help_message(pid, "Set vehicle livery to "..livery_number)
end

local function shuffle_horn(vehicle, pid, horn_number)
    local max_horn_number = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, constants.VEHICLE_MOD_TYPES.MOD_HORNS) - 1
    if horn_number == nil then
        horn_number = math.random(-1, max_horn_number)
    end
    VEHICLE.SET_VEHICLE_MOD(vehicle, constants.VEHICLE_MOD_TYPES.MOD_HORNS, tonumber(horn_number))
    help_message(pid, "Set vehicle horn to "..horn_number.." (of "..max_horn_number..")")
end

local function shuffle_wheels(vehicle, pid, commands)
    local wheel_type
    local wheel_kind
    if commands and commands[2] == "ghost" then
        commands[2] = "benny"
        commands[3] = "106"
        VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vehicle, 0, 111)
    end
    if commands and commands[2] then
        wheel_type = constants.VEHICLE_WHEEL_TYPES[commands[2]:upper()]
        if not wheel_type then
            help_message(pid, "Unknown wheel type")
            return false
        end
    else
        wheel_type = math.random(-1, constants.VEHICLE_MAX_OPTIONS.WHEEL_TYPES)
    end
    local max_wheel_kinds = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, constants.VEHICLE_MOD_TYPES.MOD_FRONTWHEELS) - 1
    if commands and commands[3] then
        wheel_kind = commands[3]
    else
        wheel_kind = math.random(-1, max_wheel_kinds)
    end
    local name = wheel_type
    for wheel_type_name, wheel_type_number in pairs(constants.VEHICLE_WHEEL_TYPES) do
        if wheel_type_number == tonumber(wheel_type) then
            name = wheel_type_name
        end
    end
    VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, wheel_type)
    VEHICLE.SET_VEHICLE_MOD(vehicle, constants.VEHICLE_MOD_TYPES.MOD_FRONTWHEELS, wheel_kind)
    VEHICLE.SET_VEHICLE_MOD(vehicle, constants.VEHICLE_MOD_TYPES.MOD_BACKWHEELS, wheel_kind)
    help_message(pid, "Set wheels to "..name.." type "..wheel_kind.." (of "..max_wheel_kinds..")")
    --set_vehicle_mod_random_value(vehicle, constants.VEHICLE_MOD_TYPES.MOD_FRONTWHEELS)
    --set_vehicle_mod_random_value(vehicle, constants.VEHICLE_MOD_TYPES.MOD_BACKWHEELS)
end

local colors = {
    black = {0, 0, 0},
    blue = {0, 0, 255},
    silver = {192, 192, 192},
    gray = {128, 128, 128},
    green = {0, 128, 0},
    purple = {128, 0, 128},
    red = {255, 0, 0},
    white = {255, 255, 255},
    orange = {156, 63, 30},
    yellow = {255, 255, 0},
    lime = {0, 255, 0},
    maroon = {128, 0, 0},
    olive = {128, 128, 0},
    aqua = {0, 255, 255},
    cyan = {0, 255, 255},
    teal = {0, 128, 128},
    navy = {0, 0, 128},
    magenta = {255, 0, 255},
    fuchsia = {255, 0, 255},
    skyblue = {135,206,235},
    hotpink = {255,20,147},
    lightpink = {255,182,193},
    pink = {255,192,203},
    wheat = {245,222,179},
    brown = {139,69,19},
    tan = {210,180,140},
    indigo = {75,0,130},
    royalblue = {65,105,225},
}

local function get_random_color()
    local keyset = {}
    local num_colors = 0
    for k in pairs(colors) do
        if (type(colors[k]) == "table") then
            num_colors = num_colors + 1
            table.insert(keyset, k)
        end
    end
    local rand = math.random(1, num_colors)
    return colors[keyset[rand]]
end

local function shuffle_paint(vehicle)
    -- Dont apply custom paint to emergency vehicles
    if VEHICLE.GET_VEHICLE_CLASS(vehicle) == constants.VEHICLE_CLASSES.EMERGENCY then
        return
    end
    local main_color = get_random_color()
    if main_color[1] then
        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, main_color[1], main_color[2], main_color[3])
        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, main_color[1], main_color[2], main_color[3])
    end
end

local function vehicle_mods_set_max_performance(vehicle)
    vehicle_set_mod_max_value(vehicle, constants.VEHICLE_MOD_TYPES.MOD_ENGINE)
    vehicle_set_mod_max_value(vehicle, constants.VEHICLE_MOD_TYPES.MOD_TRANSMISSION)
    vehicle_set_mod_max_value(vehicle, constants.VEHICLE_MOD_TYPES.MOD_BRAKES)
    vehicle_set_mod_max_value(vehicle, constants.VEHICLE_MOD_TYPES.MOD_ARMOR)
    VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, constants.VEHICLE_MOD_TYPES.MOD_TURBO, true)
end

local function show_busyspinner(text)
    HUD.BEGIN_TEXT_COMMAND_BUSYSPINNER_ON("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text)
    HUD.END_TEXT_COMMAND_BUSYSPINNER_ON(2)
end

-- From Jackz Vehicle Options script
-- Gets the player's vehicle, attempts to request control. Returns 0 if unable to get control
local function get_player_vehicle_in_control(pid, opts)
    local my_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()) -- Needed to turn off spectating while getting control
    local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

    -- Calculate how far away from target
    local pos1 = ENTITY.GET_ENTITY_COORDS(target_ped)
    local pos2 = ENTITY.GET_ENTITY_COORDS(my_ped)
    local dist = SYSTEM.VDIST2(pos1.x, pos1.y, 0, pos2.x, pos2.y, 0)

    local was_spectating = NETWORK.NETWORK_IS_IN_SPECTATOR_MODE() -- Needed to toggle it back on if currently spectating
    -- If they out of range (value may need tweaking), auto spectate.
    local vehicle = PED.GET_VEHICLE_PED_IS_IN(target_ped, true)
    if opts and opts.near_only and vehicle == 0 then
        return 0
    end
    if vehicle == 0 and target_ped ~= my_ped and dist > 340000 and not was_spectating then
        if not config.auto_spectate_far_away_players then
            help_message(pid, "Sorry, you are too far away right now, please try again later")
            return
        end
        util.toast("Player is too far, auto-spectating for upto 3s.")
        show_busyspinner("Player is too far, auto-spectating for upto 3s.")
        NETWORK.NETWORK_SET_IN_SPECTATOR_MODE(true, target_ped)
        -- To prevent a hard 3s loop, we keep waiting upto 3s or until vehicle is acquired
        local loop = (opts and opts.loops ~= nil) and opts.loops or 30 -- 3000 / 100
        while vehicle == 0 and loop > 0 do
            util.yield(100)
            vehicle = PED.GET_VEHICLE_PED_IS_IN(target_ped, true)
            loop = loop - 1
        end
        HUD.BUSYSPINNER_OFF()
    end

    if vehicle > 0 then
        if NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vehicle) then
            return vehicle
        end
        -- Loop until we get control
        local netid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(vehicle)
        local has_control_ent = false
        local loops = 15
        NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netid, true)

        -- Attempts 15 times, with 8ms per attempt
        while not has_control_ent do
            has_control_ent = NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle)
            loops = loops - 1
            -- wait for control
            util.yield(15)
            if loops <= 0 then
                break
            end
        end
    end
    if not was_spectating then
        NETWORK.NETWORK_SET_IN_SPECTATOR_MODE(false, target_ped)
    end
    return vehicle
end

---
--- Main Menu
---

local menus = {}

menus.vehicle_aliases = menu.list(menu.my_root(), "Vehicle Aliases", {}, "A list of vehicle name aliases used for spawning")

for alias, vehicle in pairs(VEHICLE_ALIASES) do
    menu.action(menus.vehicle_aliases, alias, {alias}, "Spawn "..vehicle, function(click_type, pid)
        local vehicle = spawn_vehicle_for_player(pid, vehicle)
        if vehicle then
            max_mods(vehicle)
            shuffle_wheels(vehicle)
            shuffle_paint(vehicle)
            shuffle_livery(vehicle)
        end
    end, nil, nil, COMMANDPERM_SPAWN)
end

util.create_tick_handler(function()
    return true
end)

