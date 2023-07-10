util.keep_running()
--require("natives-1640181023")
--require("natives-1606100775")
--util.require_natives(1627063482)
util.require_natives("natives-1660775568-uno")
--util.require_natives("natives-1663599433-uno")
--util.require_natives(1660775568)
util.toast("Athego's Script erfolgreich geladen! DEV Version 1.87")




all_players = {}

local createPed = PED.CREATE_PED
local getEntityCoords = ENTITY.GET_ENTITY_COORDS
local getPlayerPed = PLAYER.GET_PLAYER_PED
local requestModel = STREAMING.REQUEST_MODEL
local hasModelLoaded = STREAMING.HAS_MODEL_LOADED
local noNeedModel = STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED
local setPedCombatAttr = PED.SET_PED_COMBAT_ATTRIBUTES
local giveWeaponToPed = WEAPON.GIVE_WEAPON_TO_PED

local function player_toggle_loop(root, pid, menu_name, command_names, help_text, callback)
    return menu.toggle_loop(root, menu_name, command_names, help_text, function()
        if not players.exists(pid) then util.stop_thread() end
        callback()
    end)
end

local spawned_objects = {}

local function get_transition_state(pid)
    return memory.read_int(memory.script_global(((0x2908D3 + 1) + (pid * 0x1C5)) + 230))
end

local function get_interior_player_is_in(pid)
    return memory.read_int(memory.script_global(((0x2908D3 + 1) + (pid * 0x1C5)) + 243)) 
end

local function is_player_in_interior(pid)
    return (memory.read_int(memory.script_global(0x2908D3 + 1 + (pid * 0x1C5) + 243)) ~= 0)
end

--local function get_entity_owner(addr)
  --  if util.is_session_started() and not util.is_session_transition_active() then
    --    local netObject = memory.read_long(addr + 0xD0)
      --  if netObject == 0 then
        --    return -1
        --end
        --local owner = memory.read_byte(netObject + 0x49)
        --return owner
    --end
    --return players.user()
--end

local function setBit(addr, bitIndex)
    memory.write_int(addr, memory.read_int(addr) | (1<<bitIndex))
end

local function clearBit(addr, bitIndex)
    memory.write_int(addr, memory.read_int(addr) & ~(1<<bitIndex))
end

local function BlockSyncs(pid, callback)
    for _, i in ipairs(players.list(false, true, true)) do
        if i ~= pid then
            local outSync = menu.ref_by_rel_path(menu.player_root(i), "Outgoing Syncs>Block")
            menu.trigger_command(outSync, "on")
        end
    end
    util.yield(10)
    callback()
    for _, i in ipairs(players.list(false, true, true)) do
        if i ~= pid then
            local outSync = menu.ref_by_rel_path(menu.player_root(i), "Outgoing Syncs>Block")
            menu.trigger_command(outSync, "off")
        end
    end
end

local function get_blip_coords(blipId)
    local blip = HUD.GET_FIRST_BLIP_INFO_ID(blipId)
    if blip ~= 0 then return HUD.GET_BLIP_COORDS(blip) end
    return v3(0, 0, 0)
end

local function request_model(hash, timeout)
    timeout = timeout or 3
    STREAMING.REQUEST_MODEL(hash)
    local end_time = os.time() + timeout
    repeat
        util.yield()
    until STREAMING.HAS_MODEL_LOADED(hash) or os.time() >= end_time
    return STREAMING.HAS_MODEL_LOADED(hash)
end

---------------------
---------------------
-- FakeMoneyDrop Start
---------------------
---------------------

function request_model(model)
    STREAMING.REQUEST_MODEL(model)

    while not STREAMING.HAS_MODEL_LOADED(model) do
        util.yield()
    end
end

function request_ptfx_asset(asset)
    STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)

    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
        util.yield()
    end
end

function get_pickups_in_range(pos, range)
    pos = pos or v3.new(0, 0, 0)
    range = range or 16000

    local all_pickups <const> = entities.get_all_pickups_as_pointers()
    local pickups = {}

    for i, pickup in pairs(all_pickups) do
        local pickup_pos <const> = entities.get_position(pickup)
        local is_pickup_in_range <const> = v3.distance(pos, pickup_pos) <= range

        if is_pickup_in_range then
            table.insert(pickups, pickup)
        end
    end
    return pickups
end

local fake_pickup_types <const> = {
    [0] = {
        "Money Bag",
        objects = {
            "p_poly_bag_01_s"
        }
    },
    [1] = {
        "Action Figures",
        objects = {
            "vw_prop_vw_colle_alien",
            "vw_prop_vw_colle_beast",
            "vw_prop_vw_colle_imporage",
            "vw_prop_vw_colle_pogo",
            "vw_prop_vw_colle_prbubble",
            "vw_prop_vw_colle_rsrcomm",
            "vw_prop_vw_colle_rsrgeneric",
            "vw_prop_vw_colle_sasquatch"
        }
    },
    [2] = {
        "Snack",
        objects = {
            "prop_choc_pq"
        }
    },
}

---------------------
---------------------
-- FakeMoneyDrop Ende
---------------------
---------------------

local All_business_properties = {
    -- Clubhouses
    "1334 Roy Lowenstein Blvd",
    "7 Del Perro Beach",
    "75 Elgin Avenue",
    "101 Route 68",
    "1 Paleto Blvd",
    "47 Algonquin Blvd",
    "137 Capital Blvd",
    "2214 Clinton Avenue",
    "1778 Hawick Avenue",
    "2111 East Joshua Road",
    "68 Paleto Blvd",
    "4 Goma Street",
    -- Facilities
    "Grand Senora Desert",
    "Route 68",
    "Sandy Shores",
    "Mount Gordo",
    "Paleto Bay",
    "Lago Zancudo",
    "Zancudo River",
    "Ron Alternates Wind Farm",
    "Land Act Reservoir",
    -- Arcades
    "Pixel Pete's - Paleto Bay",
    "Wonderama - Grapeseed",
    "Warehouse - Davis",
    "Eight-Bit - Vinewood",
    "Insert Coin - Rockford Hills",
    "Videogeddon - La Mesa",
}

local small_warehouses = {
    [1] = "Pacific Bait Storage", 
    [2] = "White Widow Garage", 
    [3] = "Celltowa Unit", 
    [4] = "Convenience Store Lockup", 
    [5] = "Foreclosed Garage", 
    [9] = "Pier 400 Utility Building", 
}

local medium_warehouses = {
    [7] = "Derriere Lingerie Backlot", 
    [10] = "GEE Warehouse", 
    [11] = "LS Marine Building 3", 
    [12] = "Railyard Warehouse", 
    [13] = "Fridgit Annexe",
    [14] = "Disused Factory Outlet", 
    [15] = "Discount Retail Unit", 
    [21] = "Old Power Station", 
}

local large_warehouses = {
    [6] = "Xero Gas Factory",  
    [8] = "Bilgeco Warehouse", 
    [16] = "Logistics Depot", 
    [17] = "Darnell Bros Warehouse", 
    [18] = "Wholesale Furniture", 
    [19] = "Cypress Warehouses", 
    [20] = "West Vinewood Backlot", 
    [22] = "Walker & Sons Warehouse"
}


local weapon_stuff = {
    {"Firework", "weapon_firework"}, 
    {"Up N Atomizer", "weapon_raypistol"},
    {"Unholy Hellbringer", "weapon_raycarbine"},
    {"Rail Gun", "weapon_railgun"},
    {"Red Laser", "vehicle_weapon_enemy_laser"},
    {"Green Laser", "vehicle_weapon_player_laser"},
    {"P-996 Lazer", "vehicle_weapon_player_lazer"},
    {"RPG", "weapon_rpg"},
    {"Homing Launcher", "weapon_hominglauncher"},
    {"EMP Launcher", "weapon_emplauncher"},
    {"Flare Gun", "weapon_flaregun"},
    {"Shotgun", "weapon_bullpupshotgun"},
    {"Stungun", "weapon_stungun"},
    {"Smoke Gun", "weapon_smokegrenade"},
}

local proofs = {
    bullet = {name="Bullets",on=false},
    fire = {name="Fire",on=false},
    explosion = {name="Explosions",on=false},
    collision = {name="Collision",on=false},
    melee = {name="Melee",on=false},
    steam = {name="Steam",on=false},
    drown = {name="Drowning",on=false},
}

local effect_stuff = {
    {"Normal Drugged", "DrugsDrivingIn"}, 
    {"Drugged Trevor", "DrugsTrevorClownsFight"},
    {"Drugged Michael", "DrugsMichaelAliensFight"},
    {"Chop", "ChopVision"},
    {"Black & White", "DeathFailOut"},
    {"Boosted Black & White", "HeistCelebPassBW"},
    {"Rampage", "Rampage"},
    {"Where Are My Glasses?", "MenuMGSelectionIn"},
    {"Acid", "DMT_flight_intro"},
}


local visual_stuff = {
    {"Better Illumination", "AmbientPush"},
    {"Oversaturated", "rply_saturation"},
    {"Boost Everything", "LostTimeFlash"},
    {"Foggy Night", "casino_main_floor_heist"},
    {"Better Night Time", "dlc_island_vault"},
    {"Normal Fog", "Forest"},
    {"Heavy Fog", "nervousRON_fog"},
    {"Firewatch", "MP_Arena_theme_evening"},
    {"Warm", "mp_bkr_int01_garage"},
    {"Deepfried", "MP_deathfail_night"},
    {"Stoned", "stoned"},
    {"Underwater", "underwater"},
}

local drugged_effects = {
    "DRUG_2_drive",
    "drug_drive_blend01",
    "drug_flying_base",
    "DRUG_gas_huffin",
    "drug_wobbly",
    "NG_filmic02",
    "PPFilter",
    "spectator5",
}

local unreleased_vehicles = {
    "Rhinehart",
    "Tenf",
    "Tenf2",
    "Sentinel4",
    "Weevil2",
}

local modded_vehicles = {
    "dune2",
    "tractor",
    "dilettante2",
    "asea2",
    "cutter",
    "mesa2",
    "jet",
    "skylift",
    "policeold1",
    "policeold2",
    "armytrailer2",
    "towtruck",
    "towtruck2",
    "cargoplane",
}

local modded_weapons = {
    "weapon_railgun",
    "weapon_stungun",
    "weapon_digiscanner",
}

local interiors = {
    {"Safe Space [AFK Room]", {x=-158.71494, y=-982.75885, z=149.13135}},
    {"Torture Room", {x=147.170, y=-2201.804, z=4.688}},
    {"Mining Tunnels", {x=-595.48505, y=2086.4502, z=131.38136}},
    {"Omegas Garage", {x=2330.2573, y=2572.3005, z=46.679367}},
    {"Server Farm", {x=2155.077, y=2920.9417, z=-81.075455}},
    {"Character Creation", {x=402.91586, y=-998.5701, z=-99.004074}},
    {"Life Invader Building", {x=-1082.8595, y=-254.774, z=37.763317}},
    {"Mission End Garage", {x=405.9228, y=-954.1149, z=-99.6627}},
    {"Destroyed Hospital", {x=304.03894, y=-590.3037, z=43.291893}},
    {"Stadium", {x=-256.92334, y=-2024.9717, z=30.145584}},
    {"Comedy Club", {x=-430.00974, y=261.3437, z=83.00648}},
    {"Bahama Mamas Nightclub", {x=-1394.8816, y=-599.7526, z=30.319544}},
    {"Janitors House", {x=-110.20285, y=-8.6156025, z=70.51957}},
    {"Therapists House", {x=-1913.8342, y=-574.5799, z=11.435149}},
    {"Martin Madrazos House", {x=1395.2512, y=1141.6833, z=114.63437}},
    {"Floyds Apartment", {x=-1156.5099, y=-1519.0894, z=10.632717}},
    {"Michaels House", {x=-813.8814, y=179.07889, z=72.15914}},
    {"Franklins House (Old)", {x=-14.239959, y=-1439.6913, z=31.101551}},
    {"Franklins House (New)", {x=7.3125067, y=537.3615, z=176.02803}},
    {"Trevors House", {x=1974.1617, y=3819.032, z=33.436287}},
    {"Lesters House", {x=1273.898, y=-1719.304, z=54.771}},
    {"Lesters Warehouse", {x=713.5684, y=-963.64795, z=30.39534}},
    {"Lesters Office", {x=707.2138, y=-965.5549, z=30.412853}},
    {"Meth Lab", {x=1391.773, y=3608.716, z=38.942}},
    {"Humane Labs", {x=3625.743, y=3743.653, z=28.69009}},
    {"Motel Room", {x=152.2605, y=-1004.471, z=-99.024}},
    {"Police Station", {x=443.4068, y=-983.256, z=30.689589}},
    {"Bank Vault", {x=263.39627, y=214.39891, z=101.68336}},
    {"Blaine County Bank", {x=-109.77874, y=6464.8945, z=31.626724}}, -- credit to fluidware for telling me about this one
    {"Tequi-La-La Bar", {x=-564.4645, y=275.5777, z=83.074585}},
    {"Scrapyard Body Shop", {x=485.46396, y=-1315.0614, z=29.2141}},
    {"The Lost MC Clubhouse", {x=980.8098, y=-101.96038, z=74.84504}},
    {"Vangelico Jewlery Store", {x=-629.9367, y=-236.41296, z=38.057056}},
    {"Airport Lounge", {x=-913.8656, y=-2527.106, z=36.331566}},
    {"Morgue", {x=240.94368, y=-1379.0645, z=33.74177}},
    {"Union Depository", {x=1.298771, y=-700.96967, z=16.131021}},
    {"Fort Zancudo Tower", {x=-2357.9187, y=3249.689, z=101.45073}},
    {"Agency Interior", {x=-1118.0181, y=-77.93254, z=-98.99977}},
    {"Avenger Interior", {x=518.6444, y=4750.4644, z=-69.3235}},
    {"Terrobyte Interior", {x=-1421.015, y=-3012.587, z=-80.000}},
    {"Bunker Interior", {x=899.5518,y=-3246.038, z=-98.04907}},
    {"IAA Office", {x=128.20, y=-617.39, z=206.04}},
    {"FIB Top Floor", {x=135.94359, y=-749.4102, z=258.152}},
    {"FIB Floor 47", {x=134.5835, y=-766.486, z=234.152}},
    {"FIB Floor 49", {x=134.635, y=-765.831, z=242.152}},
    {"Big Fat White Cock", {x=-31.007448, y=6317.047, z=40.04039}},
    {"Marijuana Shop", {x=-1170.3048, y=-1570.8246, z=4.663622}},
    {"Strip Club DJ Booth", {x=121.398254, y=-1281.0024, z=29.480522}},
}

local values = {
    [0] = 0,
    [1] = 50,
    [2] = 88,
    [3] = 160,
    [4] = 208,
}

local interior_stuff = {0, 233985, 169473, 169729, 169985, 170241, 177665, 177409, 185089, 184833, 184577, 163585, 167425, 167169}

local int_min = -2147483647
local int_max = 2147483647

-- Einmalige Benutzer Tracking Start
async_http.init('pastebin.com', 'peqtbvYn', function() end)
async_http.dispatch()
-- Einmalige Benutzer Tracking Ende

-- entity-pool gathering handling
vehicle_uses = 0
ped_uses = 0
pickup_uses = 0
player_uses = 0
object_uses = 0
robustmode = false
reap = false
function mod_uses(type, incr)
    -- this func is a patch. every time the script loads, all the toggles load and set their state. in some cases this makes the _uses optimization negative and breaks things. this prevents that.
    if incr < 0 and is_loading then
        -- ignore if script is still loading
        return
    end
    if type == "vehicle" then
        if vehicle_uses <= 0 and incr < 0 then
            return
        end
        vehicle_uses = vehicle_uses + incr
    elseif type == "pickup" then
        if pickup_uses <= 0 and incr < 0 then
            return
        end
        pickup_uses = pickup_uses + incr
    elseif type == "ped" then
        if ped_uses <= 0 and incr < 0 then
            return
        end
        ped_uses = ped_uses + incr
    elseif type == "player" then
        if player_uses <= 0 and incr < 0 then
            return
        end
        player_uses = player_uses + incr
    elseif type == "object" then
        if object_uses <= 0 and incr < 0 then
            return
        end
        object_uses = object_uses + incr
    end
end

---------------------
---------------------
-- InfoOverlay Start
---------------------
---------------------

local replayInterface = memory.read_long(memory.rip(memory.scan("48 8D 0D ? ? ? ? 48 8B D7 E8 ? ? ? ? 48 8D 0D ? ? ? ? 8A D8 E8 ? ? ? ? 84 DB 75 13 48 8D 0D") + 3))
local pedInterface = memory.read_long(replayInterface + 0x0018)
local vehInterface = memory.read_long(replayInterface + 0x0010)
local objectInterface = memory.read_long(replayInterface + 0x0028)
local pickupInterface = memory.read_long(replayInterface + 0x0020)

---------------------
---------------------
-- InfoOverlay Ende
---------------------
---------------------
--Menü Divider
menu.divider(menu.my_root(), "Athego's Script [DEV] - 1.87")
local self <const> = menu.list(menu.my_root(), "Self", {}, "")
    menu.divider(self, "Athego's Script [DEV] - Self")
local customloadoutOpt <const> = menu.list(menu.my_root(), "Custom Loadout", {}, "") --Erstellt die Liste
	menu.divider(customloadoutOpt, "Athego's Script [DEV] - Custom Loadout") --Name der Liste
local vehicle <const> = menu.list(menu.my_root(), "Vehicle", {}, "")
    menu.divider(vehicle, "Athego's Script [DEV] - Vehicle")
local detections <const> = menu.list(menu.my_root(), "Modder Detections", {}, "")
    menu.divider(detections, "Athego's Script [DEV] - Detections")
local overlay <const> = menu.list(menu.my_root(), "Overlay", {}, "")
    menu.divider(overlay, "Athego's Script [DEV] - Overlay")

---------------------
---------------------
-- PLAYER FEATURES
---------------------
---------------------

function PlayerlistFeatures(pid)
    menu.divider(menu.player_root(pid), "Athego's Script [DEV]")
    local playerr = menu.list(menu.player_root(pid), "Athego's Script [DEV]", {}, "")

    ---------------------
	---------------------
	-- Anti-Modder
	---------------------
	---------------------

    local antimodder = menu.list(playerr, "Anti-Modder", {}, "")
    menu.divider(antimodder, "Athego's Script [DEV] - Anti-Modder")

    player_toggle_loop(antimodder, pid, "Entferne Godmode", {}, "Wird von den meisten Menüs gegblockt", function()
        util.trigger_script_event(1 << pid, {0xAD36AA57, pid, 0x96EDB12F, math.random(0, 0x270F)})
    end)

    player_toggle_loop(antimodder, pid, "Entferne Fahrzeug Godmode", {}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) and not PED.IS_PED_DEAD_OR_DYING(ped) then
            local veh = PED.GET_VEHICLE_PED_IS_IN(ped, false)
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(veh, true)
            ENTITY.SET_ENTITY_INVINCIBLE(veh, false)
            ENTITY.SET_ENTITY_PROOFS(veh, false, false, false, false, false, 0, 0, false)
        end
    end)

    ---------------------
	---------------------
	-- Anti-Modder/kill_godmode
	---------------------
	---------------------

    local kill_godmode = menu.list(antimodder, "Töte Godmode Spieler", {}, "")
    menu.divider(kill_godmode, "Athego's Script [DEV] - Töte Godmode Spieler")

    menu.action(kill_godmode, "Stun", {""}, "Funktioniert bei Menüs, die Proofs für den Godmode verwenden", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 99999, true, util.joaat("weapon_stungun"), players.user_ped(), false, true, 1.0)
    end)

    menu.slider_text(kill_godmode, "Zerdrücken", {}, "", {"Khanjali", "APC"}, function(index, veh)
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        local vehicle = util.joaat(veh)
        request_model(vehicle)

        pluto_switch veh do
            case "Khanjali":
            height = 2.8
            offset = 0
            break
            case "APC":
            height = 3.4
            offset = -1.5
            break
        end

        if TASK.IS_PED_STILL(ped) then
            distance = 0
        elseif not TASK.IS_PED_STILL(ped) then
            distance = 3
        end

        local vehicle1 = entities.create_vehicle(vehicle, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), offset, distance, height), ENTITY.GET_ENTITY_HEADING(ped))
        local vehicle2 = entities.create_vehicle(vehicle, pos, 0)
        local vehicle3 = entities.create_vehicle(vehicle, pos, 0)
        local vehicle4 = entities.create_vehicle(vehicle, pos, 0)
        local spawned_vehs = {vehicle4, vehicle3, vehicle2, vehicle1}
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(vehicle1, false)
        util.yield(5000)
        for i = 1, #spawned_vehs do
            entities.delete_by_handle(spawned_vehs[i])
        end
    end)

    player_toggle_loop(kill_godmode, pid, "Explodieren", {}, "Von den meisten Menüs blockiert", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        if not PED.IS_PED_DEAD_OR_DYING(ped) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) then
            util.trigger_script_event(1 << pid, {0xAD36AA57, pid, 0x96EDB12F, math.random(0, 0x270F)})
            FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), pos, 2, 50, true, false, 0.0)
        end
    end)

    ---------------------
	---------------------
	-- FRIENDLY
	---------------------
	---------------------

    local friendly <const> = menu.list(playerr, "Friendly", {}, "")
    menu.divider(friendly, "Athego's Script [DEV] - Friendly")

    menu.toggle_loop(friendly, "Unsichtbarer Vehicle Godmode", {}, "Wird von den meisten Menüs nicht als Vehicle Godmode erkannt.", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        ENTITY.SET_ENTITY_PROOFS(PED.GET_VEHICLE_PED_IS_IN(ped), true, true, true, true, true, false, false, true)
        end, function() 
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        ENTITY.SET_ENTITY_PROOFS(PED.GET_VEHICLE_PED_IS_IN(ped), false, false, false, false, false, false, false, false)
    end)

    menu.action(friendly, "Level ihn hoch", {}, "Gibt ihm ungefährt 175.000 RP. Gibt einem Level 1er circa 25 Level", function()
        util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x5, 0, 1, 1, 1})
        for i = 0, 9 do
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x0, i, 1, 1, 1})
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x1, i, 1, 1, 1})
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x3, i, 1, 1, 1})
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0xA, i, 1, 1, 1})
        end
        for i = 0, 1 do
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x2, i, 1, 1, 1})
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x6, i, 1, 1, 1})
        end
        for i = 0, 19 do
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x4, i, 1, 1, 1})
        end
        for i = 0, 99 do
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x9, i, 1, 1, 1})
            util.yield()
        end
    end)

    local halloween_loop = menu.list(friendly, "Halloween Sammel Loop", {}, "")
    local halloween_delay = 500
    menu.slider(halloween_loop, "Delay", {}, "", 0, 2500, 500, 10, function(amount)
        halloween_delay = amount
    end)
    player_toggle_loop(halloween_loop, pid, "Loop aktivieren", {}, "Wird ihm etwas Geld geben und andere Sachen", function()
        util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x8, -1, 1, 1, 1})
        util.yield(halloween_delay)
    end)

	---------------------
	---------------------
	-- TROLLING
	---------------------
	---------------------

    local trollingOpt <const> = menu.list(playerr, "Trolling", {}, "") --Erstellt die Liste
	menu.divider(trollingOpt, "Athego's Script [DEV] - Trolling") --Name der Liste

    local explo_player_list = menu.list(trollingOpt, "Explosions", {}, "")
    menu.divider(explo_player_list, "Athego's Script [DEV] - Explosions")

    menu.toggle_loop(explo_player_list, "Water Loop", {}, "", function()
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local coords = ENTITY.GET_ENTITY_COORDS(target_ped)
		FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], 13, 1.0, true, false, 0.0)
	end)

	menu.toggle_loop(explo_player_list, "Water Loop invisible", {}, "", function()
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local coords = ENTITY.GET_ENTITY_COORDS(target_ped)
		FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], 13, 1.0, true, true, 0.0)
	end)

    menu.toggle_loop(explo_player_list, "Random explosion loop", {"randomexplosions"}, "", function(on)
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local coords = ENTITY.GET_ENTITY_COORDS(target_ped)
        FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], math.random(0, 82), 1.0, true, false, 0.0)
    end)

    local freeze = menu.list(trollingOpt, "Spieler einfrieren", {}, "")
    menu.divider(freeze, "Athego's Script [DEV] - Spieler einfrieren")

    player_toggle_loop(freeze, pid, "Hard Freeze", {}, "", function()
        util.trigger_script_event(1 << pid, {0x4868BC31, pid, 0, 0, 0, 0, 0})
        util.yield(500)
    end)

    player_toggle_loop(freeze, pid, "Flackerndes einfrieren", {}, "", function()
        util.trigger_script_event(1 << pid, {0x7EFC3716, pid, 0, 1, 0, 0})
        util.yield(500)
    end)

    player_toggle_loop(trollingOpt, pid, "Sound Spam", {}, "", function()
        util.trigger_script_event(1 << pid, {0x4246AA25, pid, math.random(1, 0x6)})
        util.yield()
    end)

    menu.action(trollingOpt, "Apartment zustand erzwingen", {}, "Wird beim rejoinen aufgehoben. Spieler musst in einem Apartment sein", function(s)
        if players.is_in_interior(pid) then
            util.trigger_script_event(1 << pid, {0xB031BD16, pid, pid, pid, pid, math.random(int_min, int_max), pid})
        else
            util.toast("[Athego's Script] Spieler ist in keinem Apartment")
        end
    end)

    menu.action(trollingOpt, "Wer hat gefragt?", {}, "", function()
        local radar = util.joaat("prop_air_bigradar")
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        request_model(radar)

        local radar_dish = entities.create_object(radar, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 20, -3))
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(radar_dish)
        chat.send_message("Benutze NASA Sateliten um zu schauen wer gefragt hat", false, true, true)
        util.yield(10000)
        entities.delete_by_handle(radar_dish)
    end)

    menu.action(trollingOpt, "Töte Spieler in Gebäuden", {}, "Funktioniert nicht in Apartment's", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)

        for i, interior in ipairs(interior_stuff) do
            if get_interior_player_is_in(pid) == interior then
                util.toast("[Athego's Script] Spieler ist in keinem Gebäude")
            return end
            if get_interior_player_is_in(pid) ~= interior then
                util.trigger_script_event(1 << pid, {0xAD36AA57, pid, 0x96EDB12F, math.random(0, 0x270F)})
                MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 1000, true, util.joaat("weapon_stungun"), players.user_ped(), false, true, 1.0)
            end
        end
    end)

    ---------------------
	---------------------
	-- TROLLING/Cage
	---------------------
	---------------------

    local cage = menu.list(trollingOpt, "Käfige", {}, "")
    menu.divider(cage, "Athego's Script [DEV] - Käfige")

    menu.action(cage, "Elektrischer Käfig", {}, "", function(cl)
        local number_of_cages = 6
        local elec_box = util.joaat("prop_elecbox_12")
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        pos.z -= 0.5
        request_model(elec_box)
        local temp_v3 = v3.new(0, 0, 0)
        for i = 1, number_of_cages do
            local angle = (i / number_of_cages) * 360
            temp_v3.z = angle
            local obj_pos = temp_v3:toDir()
            obj_pos:mul(2.5)
            obj_pos:add(pos)
            for offs_z = 1, 5 do
                local electric_cage = entities.create_object(elec_box, obj_pos)
                spawned_objects[#spawned_objects + 1] = electric_cage
                ENTITY.SET_ENTITY_ROTATION(electric_cage, 90.0, 0.0, angle, 2, 0)
                obj_pos.z += 0.75
                ENTITY.FREEZE_ENTITY_POSITION(electric_cage, true)
            end
        end
    end)

    menu.action(cage, "Michael Jackson Käfig", {}, "", function(cl)
        local number_of_cages = 6
        local coffin_hash = util.joaat("prop_coffin_02b")
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        request_model(coffin_hash)
        local temp_v3 = v3.new(0, 0, 0)
        for i = 1, number_of_cages do
            local angle = (i / number_of_cages) * 360
            temp_v3.z = angle
            local obj_pos = temp_v3:toDir()
            obj_pos:mul(0.8)
            obj_pos:add(pos)
            obj_pos.z += 0.1
           local coffin = entities.create_object(coffin_hash, obj_pos)
           spawned_objects[#spawned_objects + 1] = coffin
           ENTITY.SET_ENTITY_ROTATION(coffin, 90.0, 0.0, angle,  2, 0)
           ENTITY.FREEZE_ENTITY_POSITION(coffin, true)
        end
    end)

    menu.action(cage, "Schiffcontainer", {}, "", function()
        local container_hash = util.joaat("prop_container_ld_pu")
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        request_model(container_hash)
        pos.z -= 1
        local container = entities.create_object(container_hash, pos, 0)
        spawned_objects[#spawned_objects + 1] = container
        ENTITY.FREEZE_ENTITY_POSITION(container, true)
    end)

    menu.action(cage, "Gas Käfig", {}, "", function()
        local gas_cage_hash = util.joaat("prop_gascage01")
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        request_model(gas_cage_hash)
        pos.z -= 1
        local gas_cage = entities.create_object(gas_cage_hash, pos, 0)
        pos.z += 1
        local gas_cage2 = entities.create_object(gas_cage_hash, pos, 0)
        spawned_objects[#spawned_objects + 1] = gas_cage
        spawned_objects[#spawned_objects + 1] = gas_cage2
        ENTITY.FREEZE_ENTITY_POSITION(gas_cage, true)
        ENTITY.FREEZE_ENTITY_POSITION(gas_cage2, true)
    end)


    menu.action(cage, "Lösche gespawnte Käfige", {"clearcages"}, "", function()
        local entitycount = 0
        for i, object in ipairs(spawned_objects) do
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, false, false)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(object)
            entities.delete_by_handle(object)
            spawned_objects[i] = nil
            entitycount += 1
        end
        util.toast("[Athego's Script] " .. entitycount .. " gespawnte Käfige wurden gelöscht!")
    end)

    ---------------------
	---------------------
	-- TROLLING/FakeMoneyDrop
	---------------------
	---------------------

    local fakemoneydrop = menu.list(trollingOpt, "Fake Money Drop", {}, "")
    menu.divider(fakemoneydrop, "Athego's Script [DEV] - Fake Money Drop")

    local fake_pickup = {
        loop = false,
        type = 0,
        delay = 100
    }

    local function spawn_fake_pickup()
        util.create_thread(function()
            local objects <const> = fake_pickup_types[fake_pickup.type].objects
            local pickup_hash <const> = util.joaat(objects[math.random(1, #objects)])
            local player_pos = players.get_position(pid)
            local pickup_pos = v3.new(player_pos.x, player_pos.y, player_pos.z + 2.25)
            local pickup_sound <const> = "Bus_Schedule_Pickup"
            local pickup_sound_ref <const> = "DLC_PRISON_BREAK_HEIST_SOUNDS"

            request_model(pickup_hash)

            local pickup <const> = entities.create_object(pickup_hash, pickup_pos)

            ENTITY.SET_ENTITY_COLLISION(pickup, false, true)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(
                pickup, 1, 0, 0, 0,
                true, false, true, true
            )

            repeat
                player_pos = players.get_position(pid)
                pickup_pos = ENTITY.GET_ENTITY_COORDS(pickup, false)
                local is_height_reached = pickup_pos.z <= player_pos.z + 1.25

                util.yield(10)
            until is_height_reached

            AUDIO.PLAY_SOUND_FROM_COORD(
                -1, pickup_sound,
                player_pos.x, player_pos.y, player_pos.z,
                pickup_sound_ref, true, 1, false
            )
            entities.delete_by_handle(pickup)

            util.stop_thread()
        end)
    end

    menu.action(fakemoneydrop, "Fake drop", {}, "", function()
        spawn_fake_pickup()
    end)

    menu.toggle(fakemoneydrop, "Fake drop Loop", {}, "", function(state)
        fake_pickup.loop = state

        while fake_pickup.loop and players.exists(pid) do
            spawn_fake_pickup()

            util.yield(fake_pickup.delay)
        end
    end)

    menu.list_select(fakemoneydrop, "Fake Objekt", {}, "", fake_pickup_types, 0, function(value)
        fake_pickup.type = value
    end)

    menu.slider(fakemoneydrop, "Drop verzögerung", {}, "", 50, 1000, 100, 50, function(value)
        fake_pickup.delay = value
    end)

    ---------------------
	---------------------
	-- TROLLING/GLITCH PLAYER
	---------------------
	---------------------

    local glitch_player_list = menu.list(trollingOpt, "Glitch Player", {}, "")
    menu.divider(glitch_player_list, "Athego's Script [DEV] - Glitch Player")

    local object_stuff = {
        names = {
            "Ferris Wheel",
            "UFO",
            "Cement Mixer",
            "Scaffolding",
            "Garage Door",
            "Big Bowling Ball",
            "Big Soccer Ball",
            "Big Orange Ball",
            "Stunt Ramp",

        },
        objects = {
            "prop_ld_ferris_wheel",
            "p_spinning_anus_s",
            "prop_staticmixer_01",
            "prop_towercrane_02a",
            "des_scaffolding_root",
            "prop_sm1_11_garaged",
            "stt_prop_stunt_bowling_ball",
            "stt_prop_stunt_soccer_ball",
            "prop_juicestand",
            "stt_prop_stunt_jump_l",
        }
    }

    local object_hash = util.joaat("prop_ld_ferris_wheel")
    menu.list_select(glitch_player_list, "Objekt [Glitch Player]", {}, "Wähle das Objekt welches genutzt werden soll.", object_stuff.names, 1, function(index)
        object_hash = util.joaat(object_stuff.objects[index])
    end)

    menu.slider(glitch_player_list, "Spawn Delay [Glitch Player]", {}, "", 0, 3000, 50, 10, function(amount)
        delay = amount
    end)

    local glitchPlayer = false
    local glitchPlayer_toggle
    glitchPlayer_toggle = menu.toggle(glitch_player_list, "Glitch Player", {}, "", function(toggled)
        glitchPlayer = toggled

        while glitchPlayer do
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
            if v3.distance(ENTITY.GET_ENTITY_COORDS(players.user_ped(), false), players.get_position(pid)) > 1000.0 
            and v3.distance(pos, players.get_cam_pos(players.user())) > 1000.0 then
                util.toast("[Athego's Script] Spieler ist außerhalb des Rendering bereiches!")
                menu.set_value(glitchPlayer_toggle, false);
            break end

            if not players.exists(pid) then 
                util.toast("[Athego's Script] Spieler existiert nicht!")
                menu.set_value(glitchPlayer_toggle, false);
            break end
            local glitch_hash = object_hash
            local poopy_butt = util.joaat("rallytruck")
            request_model(glitch_hash)
            request_model(poopy_butt)
            local stupid_object = entities.create_object(glitch_hash, pos)
            local glitch_vehicle = entities.create_vehicle(poopy_butt, pos, 0)
            ENTITY.SET_ENTITY_VISIBLE(stupid_object, false)
            ENTITY.SET_ENTITY_VISIBLE(glitch_vehicle, false)
            ENTITY.SET_ENTITY_INVINCIBLE(stupid_object, true)
            ENTITY.SET_ENTITY_COLLISION(stupid_object, true, true)
            ENTITY.APPLY_FORCE_TO_ENTITY(glitch_vehicle, 1, 0.0, 10, 10, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
            util.yield(delay)
            entities.delete_by_handle(stupid_object)
            entities.delete_by_handle(glitch_vehicle)
            util.yield(delay)   
        end
    end)

    local glitchVeh = false
    local glitchVehCmd
    glitchVehCmd = menu.toggle(glitch_player_list, "Glitch Vehicle", {}, "", function(toggle)
        glitchVeh = toggle
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        local player_veh = PED.GET_VEHICLE_PED_IS_USING(ped)
        local veh_model = players.get_vehicle_model(pid)
        local ped_hash = util.joaat("a_m_m_acult_01")
        local object_hash = util.joaat("prop_ld_ferris_wheel")
        request_model(ped_hash)
        request_model(object_hash)
        
        while glitchVeh do
            if v3.distance(ENTITY.GET_ENTITY_COORDS(players.user_ped(), false), players.get_position(pid)) > 1000.0 
            and v3.distance(pos, players.get_cam_pos(players.user())) > 1000.0 then
                util.toast("[Athego's Script] Spieler ist außerhalb des Rendering bereiches!")
                menu.set_value(glitchVehCmd, false);
            break end

            if not players.exists(pid) then 
                util.toast("[Athego's Script] Spieler existiert nicht!")
                menu.set_value(glitchVehCmd, false);
            break end

            if not PED.IS_PED_IN_VEHICLE(ped, player_veh, false) then 
                util.toast("[Athego's Script] Spieler ist in keinem Fahrzeug!")
                menu.set_value(glitchVehCmd, false);
            break end

            if not VEHICLE.ARE_ANY_VEHICLE_SEATS_FREE(player_veh) then
                util.toast("[Athego's Script] Kein freier Sitz mehr im Fahrzeug!")
                menu.set_value(glitchVehCmd, false);
            break end

            local seat_count = VEHICLE.GET_VEHICLE_MODEL_NUMBER_OF_SEATS(veh_model)
            local glitch_obj = entities.create_object(object_hash, pos)
            local glitched_ped = entities.create_ped(26, ped_hash, pos, 0)
            local things = {glitched_ped, glitch_obj}

            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(glitch_obj)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(glitched_ped)

            ENTITY.ATTACH_ENTITY_TO_ENTITY(glitch_obj, glitched_ped, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)

            for i, spawned_objects in ipairs(things) do
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(spawned_objects)
                ENTITY.SET_ENTITY_VISIBLE(spawned_objects, false)
                ENTITY.SET_ENTITY_INVINCIBLE(spawned_objects, true)
            end

            for i = 0, seat_count -1 do
                if VEHICLE.ARE_ANY_VEHICLE_SEATS_FREE(player_veh) then
                    local emptyseat = i
                    for l = 1, 25 do
                        PED.SET_PED_INTO_VEHICLE(glitched_ped, player_veh, emptyseat)
                        ENTITY.SET_ENTITY_COLLISION(glitch_obj, true, true)
                        util.yield()
                    end
                end
            end
            if not menu.get_value(glitchVehCmd) then
                entities.delete_by_handle(glitched_ped)
                entities.delete_by_handle(glitch_obj)
            end
            if glitched_ped ~= nil then -- added a 2nd stage here because it didnt want to delete sometimes, this solved that lol.
                entities.delete_by_handle(glitched_ped) 
            end
            if glitch_obj ~= nil then
                entities.delete_by_handle(glitch_obj)
            end
        end
    end)

    local glitchForcefield = false
    local glitchforcefield_toggle
    glitchforcefield_toggle = menu.toggle(glitch_player_list, "Glitched Forcefield", {}, "", function(toggled)
        glitchForcefield = toggled
        local glitch_hash = util.joaat("p_spinning_anus_s")
        request_model(glitch_hash)

        while glitchForcefield do
            if not players.exists(pid) then 
                util.toast("[Athego's Script] Spieler existiert nicht!")
                menu.set_value(glitchPlayer_toggle, false);
            break end

            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local playerpos = ENTITY.GET_ENTITY_COORDS(ped, false)
            
            if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
                util.toast("[Athego's Script] Spieler ist in einem Auto!")
                menu.set_value(glitchforcefield_toggle, false);
            break end
            
            local stupid_object = entities.create_object(glitch_hash, playerpos)
            ENTITY.SET_ENTITY_VISIBLE(stupid_object, false)
            ENTITY.SET_ENTITY_INVINCIBLE(stupid_object, true)
            ENTITY.SET_ENTITY_COLLISION(stupid_object, true, true)
            util.yield()
            entities.delete_by_handle(stupid_object)
            util.yield()    
        end
    end)

    ---------------------
	---------------------
	-- Trolling/Unendlicher Ladebildschirm
	---------------------
	---------------------

    local inf_loading = menu.list(trollingOpt, "Unendlicher Ladebildschirm", {}, "")
    menu.divider(inf_loading, "Athego's Script [DEV] - Unendlicher Ladebildschirm")

    menu.action(inf_loading, "MC Teleport Methode", {}, "", function()
        util.trigger_script_event(1 << pid, {0xDEE5ED91, pid, 0, 32, NETWORK.NETWORK_HASH_FROM_PLAYER_HANDLE(pid), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
    end)

    menu.action(inf_loading, "Apartment Methode", {}, "", function()
        util.trigger_script_event(1 << pid, {0x7EFC3716, pid, 0, 1, id})
    end)


    ---------------------
	---------------------
	-- Trolling/Blackscreen
	---------------------
	---------------------

    player_toggle_loop(trollingOpt, pid, "Schwarzbild", {}, "", function()
        util.trigger_script_event(1 << pid, {0xDEE5ED91, pid, math.random(1, 0x20), 0x20, NETWORK.NETWORK_HASH_FROM_PLAYER_HANDLE(pid), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        util.yield(1000)
    end)

    ---------------------
	---------------------
	-- Trolling/Blackscreen
	---------------------
	---------------------

    player_toggle_loop(trollingOpt, pid, "Taser Loop", {}, "", function()
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        for i = 1, 50 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 0, true, util.joaat("weapon_stungun"), players.user_ped(), false, true, 1.0)
        end
        util.yield(100)
    end)


    ---------------------
	---------------------
	-- Trolling/ab in Knast
	---------------------
	---------------------

    menu.action(trollingOpt, "Ab in Knast", {}, "", function()
        local my_pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local my_ped = PLAYER.GET_PLAYER_PED(players.user())
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(my_ped, 1628.5234, 2570.5613, 45.56485, true, false, false, false)
        menu.trigger_commands("givesh " .. players.get_name(pid))
        menu.trigger_commands("summon " .. players.get_name(pid))
        menu.trigger_commands("invisibility on")
        menu.trigger_commands("otr")
        util.yield(5000)
        menu.trigger_commands("invisibility off")
        menu.trigger_commands("otr")
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(my_ped, my_pos)
    end)

    ---------------------
	---------------------
	-- Teleport
	---------------------
	---------------------

    local tp_player = menu.list(playerr, "Spieler Teleportieren", {}, "")
    menu.divider(tp_player, "Athego's Script [DEV] - Spieler Teleportieren")
    local clubhouse = menu.list(tp_player, "Clubhäuser", {}, "")
    menu.divider(clubhouse, "Athego's Script [DEV] - Clubhäuser")
    local facility = menu.list(tp_player, "Apartments", {}, "")
    menu.divider(facility, "Athego's Script [DEV] - Apartments")
    local arcade = menu.list(tp_player, "Arkade", {}, "")
    menu.divider(arcade, "Athego's Script [DEV] - Arkade")
    local warehouse = menu.list(tp_player, "Lagerhaus", {}, "")
    menu.divider(warehouse, "Athego's Script [DEV] - Lagerhäuser")
    local cayoperico = menu.list(tp_player, "Cayo Perico", {}, "")
    menu.divider(cayoperico, "Athego's Script [DEV] - Cayo Perico")

    menu.action(tp_player, "Heist bestanden teleport", {}, "", function()
        util.trigger_script_event(1 << pid, {0xAD1762A7, players.user(), pid, -1, 1, 1, 0, 1, 0}) 
    end)

    for id, name in pairs(All_business_properties) do
        if id <= 12 then
            menu.action(clubhouse, name, {}, "", function()
                util.trigger_script_event(1 << pid, {0xDEE5ED91, pid, id, 0x20, NETWORK.NETWORK_HASH_FROM_PLAYER_HANDLE(pid), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, math.random(1, 10)})
            end)
        elseif id > 12 and id <= 21 then
            menu.action(facility, name, {}, "", function()
                util.trigger_script_event(1 << pid, {0xDEE5ED91, pid, id, 0x20, NETWORK.NETWORK_HASH_FROM_PLAYER_HANDLE(pid), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
            end)
        elseif id > 21 then
            menu.action(arcade, name, {}, "", function() 
                util.trigger_script_event(1 << pid, {0xDEE5ED91, pid, id, 0x20, NETWORK.NETWORK_HASH_FROM_PLAYER_HANDLE(pid), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1})
            end)
        end
    end

    local small = menu.list(warehouse, "Kleine Lagerhäuser", {}, "")
    menu.divider(small, "Athego's Script [DEV] - Kleine Lagerhäuser")
    local medium = menu.list(warehouse, "Mittlere Lagerhäuser", {}, "")
    menu.divider(medium, "Athego's Script [DEV] - Mittlere Lagerhäuser")
    local large = menu.list(warehouse, "Große Lagerhäuser", {}, "")
    menu.divider(large, "Athego's Script [DEV] - Große Lagerhäuser")

    for id, name in pairs(small_warehouses) do
        menu.action(small, name, {}, "", function()
            util.trigger_script_event(1 << pid, {0x7EFC3716, pid, 0, 1, id})
        end)
    end

    for id, name in pairs(medium_warehouses) do
        menu.action(medium, name, {}, "", function()
            util.trigger_script_event(1 << pid, {0x7EFC3716, pid, 0, 1, id})
        end)
    end

    for id, name in pairs(large_warehouses) do
        menu.action(large, name, {}, "", function()
            util.trigger_script_event(1 << pid, {0x7EFC3716, pid, 0, 1, id})
        end)
    end

    menu.action(cayoperico, "Cayo Perico", {}, "", function()
        util.trigger_script_event(1 << pid, {0x4868BC31, pid, 0, 0, 0x3, 1})
    end)

    menu.action(cayoperico, "Cayo Perico (Ohne Cutscene)", {}, "", function()
        util.trigger_script_event(1 << pid, {0x4868BC31, pid, 0, 0, 0x4, 1})
    end)

    menu.action(cayoperico, "Cayo Perico verlassen", {}, "Spieler muss auf Cayo Perico sein damit es Funktioniert", function()
        util.trigger_script_event(1 << pid, {0x4868BC31, pid, 0, 0, 0x3})
    end)

    menu.action(cayoperico, "Von Cayo Perico geschmissen", {}, "", function()
        util.trigger_script_event(1 << pid, {0x4868BC31, pid, 0, 0, 0x4, 0})
    end)

    ---------------------
	---------------------
	-- PLAYER REMOVALS
	---------------------
	---------------------

    local player_removals = menu.list(playerr, "Spieler entfernen", {}, "")
    menu.divider(player_removals, "Athego's Script [DEV] - Spieler entfernen")

    ---------------------
	---------------------
	-- PLAYER REMOVALS/KICKS
	---------------------
	---------------------

    local kicks = menu.list(player_removals, "Kicks", {}, "")
    menu.divider(kicks, "Athego's Script [DEV] - Kicks")

    menu.action(kicks, "Freemode Death", {"freemodedeath"}, "Schickt ihn in den Story Mode.", function()
        util.trigger_script_event(1 << pid, {111242367, pid, memory.script_global(2689235 + 1 + (pid * 453) + 318 + 7)})
    end)

    menu.action(kicks, "Network Bail", {"networkbail"}, "", function()
        util.trigger_script_event(1 << pid, {0x63D4BFB1, players.user(), memory.read_int(memory.script_global(0x1CE15F + 1 + (pid * 0x257) + 0x1FE))})
    end)

    menu.action(kicks, "Invalid Collectible", {"invalidcollectible"}, "", function()
        util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x4, -1, 1, 1, 1})
    end)

    if menu.get_edition() >= 2 then 
        menu.action(kicks, "Adaptive Kick", {"adaptivekick"}, "", function()
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x4, -1, 1, 1, 1})
            util.trigger_script_event(1 << pid, {0x6A16C7F, pid, memory.script_global(0x2908D3 + 1 + (pid * 0x1C5) + 0x13E + 0x7)})
            util.trigger_script_event(1 << pid, {0x63D4BFB1, players.user(), memory.read_int(memory.script_global(0x1CE15F + 1 + (pid * 0x257) + 0x1FE))})
            menu.trigger_commands("breakup" .. players.get_name(pid))
        end)
    else
        menu.action(kicks, "Adaptive Kick", {"adaptivekick"}, "", function()
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x4, -1, 1, 1, 1})
            util.trigger_script_event(1 << pid, {0x6A16C7F, pid, memory.script_global(0x2908D3 + 1 + (pid * 0x1C5) + 0x13E + 0x7)})
            util.trigger_script_event(1 << pid, {0x63D4BFB1, players.user(), memory.read_int(memory.script_global(0x1CE15F + 1 + (pid * 0x257) + 0x1FE))})
        end)
    end

    if menu.get_edition() >= 2 then 
        menu.action(kicks, "Block Join Kick", {"blast"}, "Fügt den Spieler zur Block Join list hinzu.", function()
            menu.trigger_commands("historyblock " .. players.get_name(pid))
            menu.trigger_commands("breakup" .. players.get_name(pid))
        end)
    end

    ---------------------
	---------------------
	-- PLAYER REMOVALS/CRASHES
	---------------------
	---------------------

    local crashes = menu.list(player_removals, "Crashes", {}, "")
    menu.divider(crashes, "Athego's Script [DEV] - Crashes")

    local nature = menu.list(crashes, "Perle der Natur", {}, "")
    menu.divider(nature, "Athego's Script [DEV] - Perle der Natur")

    menu.action(nature, "Perle der Natur v1", {""}, "", function()
        local user = players.user()
        local user_ped = players.user_ped()
        local pos = players.get_position(user)
        BlockSyncs(pid, function() -- blocking outgoing syncs to prevent the lobby from crashing :5head:
            util.yield(100)
            menu.trigger_commands("invisibility on")
            for i = 0, 110 do
                PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(user, 0xFBF7D21F)
                PED.SET_PED_COMPONENT_VARIATION(user_ped, 5, i, 0, 0)
                util.yield(50)
                PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(user)
            end
            util.yield(250)
            for i = 1, 5 do
                util.spoof_script("freemode", SYSTEM.WAIT) -- preventing wasted screen
            end
            ENTITY.SET_ENTITY_HEALTH(user_ped, 0) -- killing ped because it will still crash others until you die (clearing tasks doesnt seem to do much)
            NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(pos, 0, false, false, 0)
            PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(user)
            menu.trigger_commands("invisibility off")
        end)
    end)

    menu.action(nature, "Perle der Natur v2", {""}, "", function()
        local user = players.user()
        local user_ped = players.user_ped()
        local pos = players.get_position(user)
        BlockSyncs(pid, function() 
            util.yield(100)
            PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), 0xFBF7D21F)
            WEAPON.GIVE_DELAYED_WEAPON_TO_PED(user_ped, 0xFBAB5776, 100, false)
            TASK.TASK_PARACHUTE_TO_TARGET(user_ped, pos.x, pos.y, pos.z)
            util.yield()
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(user_ped)
            util.yield(250)
            WEAPON.GIVE_DELAYED_WEAPON_TO_PED(user_ped, 0xFBAB5776, 100, false)
            PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(user)
            util.yield(1000)
            for i = 1, 5 do
                util.spoof_script("freemode", SYSTEM.WAIT)
            end
            ENTITY.SET_ENTITY_HEALTH(user_ped, 0)
            NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(pos, 0, false, false, 0)
        end)
    end)

    menu.action(crashes, "Kinder Schutz Service", {""}, "", function()
        local mdl = util.joaat('a_c_poodle')
        BlockSyncs(pid, function()
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(100)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0) 
                local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                local obj
                repeat
                    obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                until obj ~= 0 or util.yield()
                ENTITY.DETACH_ENTITY(obj, true, true) 
                util.yield(1500)
                FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                entities.delete_by_handle(ped1)
                util.yield(1000)
            else
                util.toast("[Athego's Script] Fehler beim Laden des Models.")
            end
        end)
    end)

    menu.action(crashes, "Linus Crash Tipps", {}, "", function()
        local int_min = -2147483647
        local int_max = 2147483647
        for i = 1, 150 do
            util.trigger_script_event(1 << pid, {2765370640, pid, 3747643341, math.random(int_min, int_max), math.random(int_min, int_max), 
            math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
            math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        end
        util.yield()
        for i = 1, 15 do
            util.trigger_script_event(1 << pid, {1348481963, pid, math.random(int_min, int_max)})
        end
        menu.trigger_commands("givesh " .. players.get_name(pid))
        util.yield(100)
        util.trigger_script_event(1 << pid, {495813132, pid, 0, 0, -12988, -99097, 0})
        util.trigger_script_event(1 << pid, {495813132, pid, -4640169, 0, 0, 0, -36565476, -53105203})
        util.trigger_script_event(1 << pid, {495813132, pid,  0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
    end)

    local krossekrabbe = menu.list(crashes, "Das Krosse Krabbe Spezial", {}, "")
    menu.divider(krossekrabbe, "Athego's Script [DEV] - Das Krosse Krabbe Spezial")

    local peds = 5
    menu.slider(krossekrabbe, "Anzahl der Peds", {}, "", 1, 10, 5, 1, function(amount)
        peds = amount
    end)

    local crash_ents = {}
    local crash_toggle = false
    menu.toggle(krossekrabbe, "Mach das Lustige", {}, "", function(val)
        crash_toggle = val
        BlockSyncs(pid, function()
            if val then
                local number_of_peds = peds
                local ped_mdl = util.joaat("ig_siemonyetarian")
                local ply_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local ped_pos = players.get_position(pid)
                ped_pos.z += 3
                request_model(ped_mdl)
                for i = 1, number_of_peds do
                    local ped = entities.create_ped(26, ped_mdl, ped_pos, 0)
                    crash_ents[i] = ped
                    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                    TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
                    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
                    ENTITY.SET_ENTITY_VISIBLE(ped, false)
                end
                repeat
                    for k, ped in crash_ents do
                        TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                        TASK.TASK_START_SCENARIO_IN_PLACE(ped, "PROP_HUMAN_BBQ", 0, false)
                    end
                    for k, v in entities.get_all_objects_as_pointers() do
                        if entities.get_model_hash(v) == util.joaat("prop_fish_slice_01") then
                            entities.delete_by_pointer(v)
                        end
                    end
                    util.yield_once()
                    util.yield_once()
                until not (crash_toggle and players.exists(pid))
                crash_toggle = false
                for k, obj in crash_ents do
                    entities.delete_by_handle(obj)
                end
                crash_ents = {}
            else
                for k, obj in crash_ents do
                    entities.delete_by_handle(obj)
                end
                crash_ents = {}
            end
        end)
    end)

    menu.action(crashes, "Fragment Crash", {""}, "", function()
        BlockSyncs(pid, function()
            local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
            util.yield(1000)
            entities.delete_by_handle(object)
        end)
    end)

end

players.on_join(function(pid)

    PlayerlistFeatures(pid)

    if pid ~= players.user() then
        -- detections
        if players.get_name(pid) == "UndiscoveredPlayer" then 
            util.yield()
        end

        if detection_athego then
            if players.get_rockstar_id(pid) == 63631473 then
                util.toast("[Athego's Skript] " .. players.get_name(pid) .. "ist entweder der echte Athego oder er Spooft nur.")
                util.log("[Athego's Skript] " .. players.get_name(pid) .. "ist entweder der echte Athego oder er Spooft nur.")
            end
        end

        if detection_bslevel then
            if players.get_rp(pid) > util.get_rp_required_for_rank(2000) then
                util.toast("[Athego's Skript] " .. players.get_name(pid) .. "hat wahrscheinlich ein Gemoddetes Level!")
                util.log("[Athego's Skript] " .. players.get_name(pid) .. "hat wahrscheinlich ein Gemoddetes Level! -> " .. players.get_rp(pid) .. " > " .. util.get_rp_required_for_rank(2000))
            end
        end

        if detection_money then
            if players.get_money(pid) > 1000000000 then
                util.toast("[Athego's Skript] " .. players.get_name(pid) .. "hat wahrscheinlich Gemoddetes Geld!")
                util.log("[Athego's Skript] " .. players.get_name(pid) .. "hat wahrscheinlich Gemoddetes Geld! -> " .. players.get_money(pid) .. " > 1.000.000.000")
            end
        end

    end

end)

---------------------
---------------------
-- MENÜ Features
---------------------
---------------------

---------------------
---------------------
-- Spieler Overlay
---------------------
---------------------

local info_toggles = menu.list(overlay, 'Info Overlay Toggles', {}, '')
local info_pos = menu.list(overlay, 'Info Overlay Position', {}, '')

--memory paths
local replayInterface = memory.read_long(memory.rip(memory.scan("48 8D 0D ? ? ? ? 48 8B D7 E8 ? ? ? ? 48 8D 0D ? ? ? ? 8A D8 E8 ? ? ? ? 84 DB 75 13 48 8D 0D") + 3))
local pedInterface = memory.read_long(replayInterface + 0x0018)
local vehInterface = memory.read_long(replayInterface + 0x0010)
local objectInterface = memory.read_long(replayInterface + 0x0028)
local pickupInterface = memory.read_long(replayInterface + 0x0020)

--locals
local session_host_toggle = false
local session_script_host_toggle = false
local players_toggle = false
local time_toggle = false
local fps_toggle = false
local peds_toggle = false
local vehicles_toggle = false
local objects_toggle = false
local pickups_toggle = false
local white_colour = {r = 1.0, g = 1.0, b = 1.0, a = 1.0}


local info_colour = menu.list(overlay, 'Overlay Farbe', {}, '')

UI = {}

UI.new = function()
    -- PRIVATE VARIABLES
    local self = {}

    background_colour = {
        ["r"] = 0.1,
        ["g"] = 0.1,
        ["b"] = 0.1,
        ["a"] = 1
    }

    --gray colour for the header
    gray_colour = {
        ["r"] = 0.2,
        ["g"] = 0.2,
        ["b"] = 0.2,
        ["a"] = 1
    }

    -- text colour
    text_colour = {
        ["r"] = 1.0,
        ["g"] = 1.0,
        ["b"] = 1.0,
        ["a"] = 1.0
    }

    local highlight_colour = {r=1,g=0,b=0,a=1}
    menu.rainbow(
        menu.colour(info_colour, "Overlay Farbe", {"overlayfarbe"}, "", highlight_colour, true, function(val)
            highlight_colour = val
        end)
    )

    local plain_text_size = 0.5
    local subhead_text_size = 0.6

    local horizontal_temp_width = 0
    local horizontal_temp_height = 0

    local cursor_mode = false

    local temp_container = {}

    local temp_x, temp_y = 0,0

    local current_window = {}

    local windows = {}

    local tab_containers = {}

    local function get_aspect_ratio()
        local screen_x, screen_y = directx.get_client_size()

        return screen_x / screen_y
    end

    local function UI_update()
        cursor_pos = {x = PAD.GET_DISABLED_CONTROL_NORMAL(2, 239), y = PAD.GET_DISABLED_CONTROL_NORMAL(2, 240)}
        directx.draw_texture(cursor_texture, 0.004, 0.004, 0.5, 0, cursor_pos.x, cursor_pos.y, 0, text_colour)
        return cursor_mode
    end

    -- get an if an area is overlapping with the center of the screen
    local function get_overlap_with_rect(width, height, rect_x, rect_y, cursor_pos)
        if rect_x <= cursor_pos.x and rect_x + width >= cursor_pos.x then
            if rect_y <= cursor_pos.y and rect_y + height >= cursor_pos.y then
                return true
            end
        else
            return false
        end
    end

    local function draw_collapse_button(x_pos, y_pos, size, dir)
        size = size or 1
        local button_size = {x = 0.005 * dir, y = 0.005}
        local aspect_ratio = get_aspect_ratio()
        if aspect_ratio >= 1 then
            button_size.y = button_size.y * aspect_ratio
        else
            button_size.x = button_size.x * aspect_ratio
        end
        local half_size = {x = button_size.x * 0.5, y = button_size.y * 0.5}
        if cursor_mode then
            if get_overlap_with_rect(button_size.x + 0.01, button_size.y + 0.01,x_pos - button_size.x * 0.5 - 0.005, y_pos - button_size.y * 0.5 - 0.005, cursor_pos) then
                directx.draw_triangle(x_pos + half_size.x * size, y_pos, x_pos - half_size.x * size, y_pos  + half_size.y * size, x_pos - half_size.x * size, y_pos - half_size.y * size, highlight_colour)
                return PAD.IS_CONTROL_JUST_PRESSED(2, 18)
           end
        end
        directx.draw_triangle(x_pos + half_size.x * size, y_pos, x_pos - half_size.x * size, y_pos  + half_size.y * size, x_pos - half_size.x * size, y_pos - half_size.y * size, text_colour) 
    end

    local function draw_tabs(tab_count)
        local aspect_ratio = get_aspect_ratio()

        if not current_window.tabs_collapsed then
            local button_size = {x = 0.06, y = 0.015}
            if aspect_ratio >= 1 then
                button_size.y = button_size.y * aspect_ratio
            else
                button_size.x = button_size.x * aspect_ratio
            end
            local drawpos = {x = current_window.x - button_size.x - 0.005, y = current_window.y - 0.004}
            directx.draw_rect(drawpos.x, drawpos.y, button_size.x, current_window.height + 0.008, background_colour)
            directx.draw_rect(drawpos.x, drawpos.y, button_size.x, button_size.y - 0.002, gray_colour)
            if draw_collapse_button(drawpos.x + 0.0075, drawpos.y + button_size.y *0.5, 1.25, 1) then
                current_window.tabs_collapsed = true
            end
            directx.draw_text(drawpos.x + button_size.x * 0.5,current_window.y + button_size.y * 0.5 - 0.004, "tabs", ALIGN_CENTRE, 0.5, text_colour)
                for i = 1, tab_count, 1 do
                    local button_drawpos = {x = drawpos.x, y = drawpos.y + (i) * button_size.y}
                    if cursor_mode then
                        if get_overlap_with_rect( button_size.x, button_size.y, button_drawpos.x, button_drawpos.y, cursor_pos) then
                            directx.draw_rect(button_drawpos.x, button_drawpos.y, button_size.x, button_size.y, highlight_colour)
                            if PAD.IS_CONTROL_JUST_PRESSED(2, 18) then
                                current_window.current_tab = i
                            end
                        else
                            directx.draw_rect(button_drawpos.x, button_drawpos.y, button_size.x, button_size.y, gray_colour)
                        end 
                    else
                        directx.draw_rect(button_drawpos.x, button_drawpos.y, button_size.x, button_size.y, gray_colour)
                    end
                    directx.draw_texture(tabs[i].data.icon, button_size.x * 0.1, button_size.x * 0.1, -0.1, 0.5, button_drawpos.x, button_drawpos.y + button_size.y * 0.5, 0, text_colour)
                    directx.draw_text(button_drawpos.x + (button_size.x * 0.1) * 2, button_drawpos.y + button_size.y * 0.5, tabs[i].data.title, ALIGN_CENTRE_LEFT, 0.5, text_colour, false)
                end
            else
                local button_size = {x = 0.015, y = 0.015}
                if aspect_ratio >= 1 then
                    button_size.y = button_size.y * aspect_ratio
                else
                    button_size.x = button_size.x * aspect_ratio
                end
                local drawpos = {x = current_window.x - button_size.x - 0.005, y = current_window.y - 0.004}
                directx.draw_rect(drawpos.x, drawpos.y, button_size.x, current_window.height + 0.008, background_colour)
                directx.draw_rect(drawpos.x, drawpos.y, button_size.x, button_size.y - 0.002, gray_colour)
                if draw_collapse_button(drawpos.x + 0.0075, drawpos.y + button_size.y * 0.5, 1.25, -1) then
                    current_window.tabs_collapsed = false
                end
                    for i = 1, tab_count, 1 do
                        local button_drawpos = {x = drawpos.x, y = drawpos.y + (i) * button_size.y}
                        if cursor_mode then
                            if get_overlap_with_rect( button_size.x, button_size.y, button_drawpos.x, button_drawpos.y, cursor_pos) then
                                directx.draw_rect(button_drawpos.x, button_drawpos.y, button_size.x, button_size.y, highlight_colour)
                                if PAD.IS_CONTROL_JUST_PRESSED(2, 18) then
                                    current_window.current_tab = i
                                end
                            else
                                directx.draw_rect(button_drawpos.x, button_drawpos.y, button_size.x, button_size.y, gray_colour)
                            end 
                        else
                            directx.draw_rect(button_drawpos.x, button_drawpos.y, button_size.x, button_size.y, gray_colour)
                        end
                        directx.draw_texture(tabs[i].data.icon, button_size.x * 0.4, button_size.x * 0.4, -0.1, 0.5, button_drawpos.x, button_drawpos.y + button_size.y * 0.5, 0, text_colour)
                    end
        end


    end

    local function add_with_and_height(width, height, horizontal)
        if not horizontal then
            if width > current_window.width then
                current_window.width = width
            end
            current_window.height = current_window.height + height
        else
            horizontal_temp_width = horizontal_temp_width + width
            if height > horizontal_temp_height then
                horizontal_temp_height = height
            end
        end
    end

    local function draw_container(container)
        for index, data in pairs(container) do
            local type = next(data)
            type(data[type])
        end
    end

    local function draw_text(data)
        if not current_window.horizontal then
            directx.draw_text(temp_x, temp_y, data.text, ALIGN_TOP_LEFT, 0.5, data.colour or text_colour, false)
            temp_y = temp_y + data.height
        else
            directx.draw_text(temp_x, temp_y, data.text, ALIGN_TOP_LEFT, 0.5, data.colour or text_colour, false)
            temp_x = temp_x + data.width
        end
    end

    local function draw_label(data)
        if not current_window.horizontal then
            directx.draw_text(temp_x, temp_y, data.name, ALIGN_TOP_LEFT, 0.5, data.colour or text_colour, false)
            temp_x = temp_x + current_window.width
            directx.draw_text(
                temp_x,
                temp_y,
                data.value,
                ALIGN_TOP_RIGHT,
                0.5,
                data.highlight_colour or highlight_colour,
                false
            )
            temp_x = temp_x - current_window.width
            temp_y = temp_y + data.height
        else
            directx.draw_text(temp_x, temp_y, data.name, ALIGN_TOP_LEFT, 0.5, data.colour or text_colour, false)
            temp_x = temp_x + data.name_width
            directx.draw_text(
                temp_x,
                temp_y,
                data.value,
                ALIGN_TOP_LEFT,
                0.5,
                data.highlight_colour or highlight_colour,
                false
            )
            temp_x = temp_x + data.value_width
        end
    end

    local function draw_div(data)
        if not current_window.horizontal then
            temp_y = temp_y + 0.01
            directx.draw_line(
                temp_x,
                temp_y,
                temp_x + current_window.width,
                temp_y,
                data.highlight_colour or highlight_colour,
                data.highlight_colour or highlight_colour
            )
            temp_y = temp_y + 0.01
        else
            temp_x = temp_x + 0.005
            directx.draw_line(
                temp_x,
                temp_y,
                temp_x,
                temp_y + 0.02,
                data.highlight_colour or highlight_colour,
                data.highlight_colour or highlight_colour
            )
            temp_x = temp_x + 0.005
        end
    end

    local function enable_horizontal(data)
        current_window.horizontal = true
        draw_container(data)
    end

    local function disable_horizontal(data)
        current_window.horizontal = false
        temp_x = temp_x - data.width
        temp_y = temp_y + data.height
    end

    local function draw_subhead(data)
        if not current_window.horizontal then
            directx.draw_text(
                temp_x + current_window.width * 0.5,
                temp_y,
                data.text,
                ALIGN_TOP_CENTRE,
                0.55,
                data.colour or highlight_colour,
                false
            )
            local x, y = directx.get_text_size(data.text, 0.55)
            temp_y = temp_y + y + 0.003
        else
            directx.draw_text(
                temp_x,
                temp_y,
                data.text,
                ALIGN_TOP_LEFT,
                0.55,
                data.colour or highlight_colour,
                false
            )
            temp_x = temp_x + directx.get_text_size(data.text, 0.55)
        end
    end

    local function draw_button(data)
        directx.draw_rect(temp_x, temp_y, data.width, data.height - 0.005, data.colour or highlight_colour)
        directx.draw_text(temp_x - data.padding, temp_y, data.text, ALIGN_TOP_LEFT, 0.5, text_colour)
        if not current_window.horizontal then
            temp_y = temp_y + data.height
        else
            temp_x = temp_x + data.width + (data.padding * 3)
        end
    end

    local function draw_toggle(data)
        directx.draw_rect(temp_x, temp_y, data.button_size.x, data.button_size.y, gray_colour)
        if data.state then
            directx.draw_texture(checkmark_texture, 0.005, 0.005, 0, 0, temp_x, temp_y, 0, text_colour)
        end
        temp_x = temp_x + data.button_size.x
        directx.draw_text(temp_x, temp_y, data.text, ALIGN_TOP_LEFT, 0.5, data.colour)
        if not current_window.horizontal then
            temp_y = temp_y + data.button_size.y + data.padding
            temp_x = temp_x - data.button_size.x
        else
            temp_x = temp_x + data.width + data.padding
        end
    end

    -- SETTERS
    self.set_background_colour = function(r, g, b)
        background_colour = {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = 1}
    end
    self.set_highlight_colour = function(r, g, b)
        highlight_colour = {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = 1}
    end
    self.set_text_colour = function(r, g, b)
        text_colour = {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = 1}
    end
    -- OTHER METHODS

    --enable or disable the cursor
    self.toggle_cursor_mode = function(state)
        if state == nil then
            cursor_mode = not cursor_mode
        else
            cursor_mode = state
        end
        PAD._SET_CURSOR_LOCATION(0.5, 0.5)
        util.create_tick_handler(UI_update)
        if cursor_mode then
            menu.trigger_commands("disablelookud on")
            menu.trigger_commands("disablelooklr on")
            menu.trigger_commands("disableattack on")
            menu.trigger_commands("disableattack2 on")
        else
            menu.trigger_commands("disablelookud off")
            menu.trigger_commands("disablelooklr off")
            menu.trigger_commands("disableattack off")
            menu.trigger_commands("disableattack2 off")
        end
    end

    self.start_tab_container = function (title, x_pos, y_pos, tabs, id)
        local sizex, sizey = directx.get_text_size(title, 0.6)
        local hash = util.joaat(id)
        if tab_containers[hash] ~= nil then
            current_window = tab_containers[hash]
            current_window.open_containers = {}
            current_window.elements = {}
            current_window.active_container = {}
            current_window.horizontal = false
            current_window.height = sizey + 0.02
            temp_y = current_window.y
            temp_x = current_window.x

            

        else
            current_window ={
                x = x_pos,
                y = y_pos,
                width = sizex + 0.02,
                height = sizey + 0.02,
                largest_height = 0,
                title = title,
                horizontal = false,
                open_containers = {},
                elements = {},
                active_container = {},
                is_being_dragged = false,
                tabs_collapsed = false,
                id = hash,
                current_tab = 1
            }
            tab_containers[hash] = current_window
        end
        current_window.active_container = current_window.elements
        tabs[current_window.current_tab].content()

        self.finish_tab_container()
    end

    self.finish_tab_container = function ()
        --determine if we use calculated height or largest height
        if current_window.height < current_window.largest_height then
            current_window.height = current_window.largest_height
        else
            current_window.largest_height = current_window.height
        end
        --calculate width + tabs
        local tab_width = current_window.tabs_collapsed == true and 0.016 or 0.061
        -- draw border
        directx.draw_rect(
            temp_x - 0.005 - tab_width,
            temp_y - 0.005 - 0.03,
            current_window.width + tab_width + 0.01,
            current_window.height + 0.04,
            highlight_colour
        )
        --draw tabs
        draw_tabs(#tabs)
        -- draw background
        directx.draw_rect(
            temp_x - 0.004,
            temp_y - 0.004,
            current_window.width + 0.008,
            current_window.height + 0.008,
            background_colour
        )
        --draw title bar
        directx.draw_rect(temp_x - tab_width - 0.004, temp_y - 0.004 - 0.03, current_window.width + tab_width + 0.008, 0.03, gray_colour)

        directx.draw_text(
            temp_x + current_window.width  * 0.5,
            temp_y - 0.03,
            current_window.title,
            ALIGN_TOP_CENTRE,
            .6,
            text_colour,
            false
        )

        if cursor_mode then
            if get_overlap_with_rect(current_window.width + tab_width + 0.008, 0.03, temp_x - tab_width - 0.004, temp_y - 0.004 - 0.03, cursor_pos) then
                if PAD.IS_CONTROL_JUST_PRESSED(2, 18) then
                    current_window.is_being_dragged = true
                end
            end
            if PAD.IS_CONTROL_JUST_RELEASED(2, 18) then
                current_window.is_being_dragged = false
            end

            if current_window.is_being_dragged then
                current_window.x = cursor_pos.x - (current_window.width - tab_width) * 0.5
                current_window.y = cursor_pos.y + 0.004 + 0.015
            end
        end

        temp_y = temp_y + 0.03

        draw_container(current_window.elements)

        temp_container = {}
        current_window = {}
    end
    --start a new window
    self.begin = function(title, x_pos, y_pos, Id)
        local sizex, sizey = directx.get_text_size(title, 0.6)
        local hash = util.joaat(Id or title)
            if windows[hash] ~= nil then
                current_window = windows[hash]
                current_window.x = x_pos
                current_window.y = y_pos
                current_window.open_containers = {}
                current_window.elements = {}
                current_window.active_container = {}
                current_window.horizontal = false
                current_window.width = sizex + 0.02
                current_window.height = sizey + 0.02
                current_window.tabs = {}
                temp_y = current_window.y
                temp_x = current_window.x
            else
                current_window = {
                    x = x_pos,
                    y = y_pos,
                    width = sizex + 0.02,
                    height = sizey + 0.02,
                    title = title,
                    horizontal = false,
                    open_containers = {},
                    elements = {},
                    active_container = {},
                    is_being_dragged = false,
                    id = hash
                }
                windows[hash] = current_window
            end
        current_window.active_container = current_window.elements
    end

    --add a text element to the current window
    self.text = function(text, colour)
        text = tostring(text)
        local width, height = directx.get_text_size(text, plain_text_size)
        add_with_and_height(width, height, current_window.horizontal)
        current_window.active_container[#current_window.active_container + 1] = {
            [draw_text] = {text = text, width = width, height = height, colour = colour}
        }
    end

    --add a subhead to the current window
    self.subhead = function(text, colour)
        text = tostring(text)
        local width, height = directx.get_text_size(text, subhead_text_size)
        add_with_and_height(width, height, current_window.horizontal)
        current_window.active_container[#current_window.active_container + 1] = {
            [draw_subhead] = {text = text, width = width, height = height, colour = colour}
        }
    end

    --add a divider to the current window
    self.divider = function(colour)
        current_window.active_container[#current_window.active_container + 1] = {[draw_div] = {colour = colour}}
        add_with_and_height(0.01, 0.02, current_window.horizontal)
    end

    --add a label to the current window (usefull for displaying variables and there value)
    self.label = function(name, value, colour, label_highlight_colour)
        name = tostring(name)
        value = tostring(value)
        local name_x, name_y = directx.get_text_size(name, plain_text_size)
        local value_x = directx.get_text_size(value, plain_text_size)
        local total_x = value_x + name_x
        add_with_and_height(total_x, name_y, current_window.horizontal)
        current_window.active_container[#current_window.active_container + 1] = {
            [draw_label] = {
                name = name,
                value = value,
                name_width = name_x,
                value_width = value_x,
                height = name_y,
                colour = colour,
                highlight_colour = label_highlight_colour
            }
        }
    end

    --adds a button to the current window
    self.button = function(name, colour, button_highlight_colour)
        name = tostring(name)
        local name_width, name_height = directx.get_text_size(name, plain_text_size)
        local padding = 0.001
        name_width, name_height = name_width + padding, name_height + 0.005 + padding
        local clicked = false
        if cursor_mode then
            if
                get_overlap_with_rect(
                    name_width,
                    name_height - (padding * 4),
                    horizontal_temp_width + temp_x,
                    current_window.height + temp_y - name_height * 0.5 + padding * 2,
                    cursor_pos
                )
             then
                colour =
                    button_highlight_colour or
                    {
                        ["r"] = 0.5,
                        ["g"] = 0.0,
                        ["b"] = 0.5,
                        ["a"] = 1
                    }
                if PAD.IS_CONTROL_JUST_PRESSED(2, 18) then
                    clicked = true
                end
            end
        end
        current_window.active_container[#current_window.active_container + 1] = {
            [draw_button] = {
                text = name,
                width = name_width,
                height = name_height,
                colour = colour or highlight_colour,
                padding = padding
            }
        }
        add_with_and_height(name_width + (padding * 3), name_height, current_window.horizontal)
        return clicked
    end

    --adds a toggle to the current menu
    self.toggle = function(name, state, colour, optional_function)
        state = state or false
        colour = colour or text_colour
        name = tostring(name)
        local name_width, name_height = directx.get_text_size(name, plain_text_size)

        local button_size = {x = 0.010, y = 0.010}
        local aspect_ratio = get_aspect_ratio()
        if aspect_ratio >= 1 then
            button_size.y = button_size.y * aspect_ratio
        else
            button_size.x = button_size.x * aspect_ratio
        end

        local padding = 0.005

        if cursor_mode then
            if
                get_overlap_with_rect(
                    button_size.x,
                    button_size.y,
                    horizontal_temp_width + temp_x,
                    current_window.height + temp_y - button_size.y * 0.5,
                    cursor_pos
                )
             then
                if PAD.IS_CONTROL_JUST_PRESSED(2, 18) then
                    state = not state
                    if optional_function ~= nil then
                        optional_function(state)
                    end
                end
            end
        end
        current_window.active_container[#current_window.active_container + 1] = {
            [draw_toggle] = {
                text = name,
                width = name_width,
                height = name_height,
                colour = colour,
                button_size = button_size,
                padding = padding,
                state = state
            }
        }
        add_with_and_height(name_width + button_size.x + padding, button_size.y + padding, current_window.horizontal)
        return state
    end

    --start drawing elements in the horizontal direction
    self.start_horizontal = function()
        if horizontal_temp_width ~= 0 then
            error("new horizontal started without closing previous horizontal", 2)
        end
        current_window.open_containers[#current_window.open_containers + 1] = current_window.active_container
        temp_container = {[enable_horizontal] = {}}
        current_window.active_container = temp_container[enable_horizontal]
        current_window.horizontal = true
    end

    --return to drawing in the diagonal direction
    self.end_horizontal = function()
        current_window.active_container[#current_window.active_container + 1] = {
            [disable_horizontal] = {width = horizontal_temp_width, height = horizontal_temp_height}
        }
        current_window.horizontal = false
        add_with_and_height(horizontal_temp_width, horizontal_temp_height, current_window.horizontal)
        local parent = current_window.open_containers[#current_window.open_containers]
        parent[#parent + 1] = temp_container
        current_window.active_container = parent
        horizontal_temp_width, horizontal_temp_height = 0, 0
    end

    --finish and draw the window
    self.finish = function()
        directx.draw_rect(
            temp_x - 0.005,
            temp_y - 0.005,
            current_window.width + 0.01,
            current_window.height + 0.01,
            highlight_colour
        )
        directx.draw_rect(
            temp_x - 0.004,
            temp_y - 0.004,
            current_window.width + 0.008,
            current_window.height + 0.008,
            background_colour
        )
        directx.draw_rect(temp_x - 0.004, temp_y - 0.004, current_window.width + 0.008, 0.03, gray_colour)

        directx.draw_text(
            temp_x + current_window.width * 0.5,
            temp_y,
            current_window.title,
            ALIGN_TOP_CENTRE,
            .6,
            text_colour,
            false
        )

        if cursor_mode then
            if get_overlap_with_rect(current_window.width + 0.008, 0.03, temp_x, temp_y, cursor_pos) then
                if PAD.IS_CONTROL_JUST_PRESSED(2, 18) then
                    current_window.is_being_dragged = true
                end
            end
            if PAD.IS_CONTROL_JUST_RELEASED(2, 18) then
                current_window.is_being_dragged = false
            end

            if current_window.is_being_dragged then
                current_window.x = cursor_pos.x - current_window.width * 0.5
                current_window.y = cursor_pos.y - 0.03 * 0.5
            end
        end

        temp_y = temp_y + 0.03

        draw_container(current_window.elements)

        temp_container = {}
        current_window = {}
    end

    return self
end

myUI = UI.new()

local fps = 0
util.create_thread(function()
    while true do
        fps = math.ceil(1/SYSTEM.TIMESTEP())
        util.yield(500)
    end
end)

local regionDetect = {
    [0]  = {kick = false, lang = "English"},
    [1]  = {kick = false, lang = "Französisch"},
    [2]  = {kick = false, lang = "Deutsch"},
    [3]  = {kick = false, lang = "Italienisch"},
    [4]  = {kick = false, lang = "Spanisch"},
    [5]  = {kick = false, lang = "Brasilianisch"},
    [6]  = {kick = false, lang = "Polnisch"},
    [7]  = {kick = false, lang = "Russisch"},
    [8]  = {kick = false, lang = "Koreanisch"},
    [9]  = {kick = false, lang = "Chinesisch Traditionell"},
    [10] = {kick = false, lang = "Japanisch"},
    [11] = {kick = false, lang = "Mexikanisch"},
    [12] = {kick = false, lang = "Chinesisch Vereinfacht"},
}

---------------------
---------------------
-- Spieler Overlay Ende
---------------------
---------------------

--toggles
menu.toggle(info_toggles, "Session Host Toggle", {"SessionHostToggle"}, "", function(on)
    session_host_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Script Host Toggle", {"SessionScriptHostToggle"}, "", function(on)
    session_script_host_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Spieler Toggle", {"PlayersToggle"}, "", function(on)
    players_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Modder Toggle", {"ModdersToggle"}, "", function(on)
    modders_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Freunde Toggle", {"FriendsToggle"}, "", function(on)
    friends_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Unbekannte Toggle", {"StrangersToggle"}, "", function(on)
    stranger_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Zeit Toggle", {"TimeToggle"}, "", function(on)
    time_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "FPS Toggle", {"FPSToggle"}, "", function(on)
    fps_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Peds Toggle", {"PedsToggle"}, "", function(on)
    peds_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Vehicles Toggle", {"VehiclesToggle"}, "", function(on)
    vehicles_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Objects Toggle", {"ObjectsToggle"}, "", function(on)
    objects_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Pickups Toggle", {"PickupsToggle"}, "", function(on)
    pickups_toggle = on
    util.yield()
end)
menu.toggle(info_toggles, "Leerer Toggle", {"LeererToggle"}, "Ein leerer Toogle wo zb der Session Code platziert werden kann.", function(on)
    empty_toggle = on
    util.yield()
end)

-- default position
local x = 0.17 --posX
local y = 0.705 --posY

menu.slider(info_pos, "X Achse", {"xcoord"}, "Bewege die X Achse des Info Overlays.", -100, 100, 17, 1, function(datax) --after help text : 0 is min, 100 is max, 50 is default and 1 is step
    x=datax/100 -- put the value at 0.xx (ex : 50/100 = 0.5 default position)
end)
menu.slider(info_pos, "Y Achse", {"ycoord"}, "Bewege die Y Achse des Info Overlays", -100, 100, 70, 1, function(datay) --after help text : 0 is min, 100 is max, 50 is default and 1 is step
    y=datay/100 -- put the value at 0.xx (ex : 50/100 = 0.5 default position)
end)

menu.toggle(overlay, "Player Overlay", {"PlayerOverlay"}, "Ein Schönes Player Overlay",
    function(state)
        UItoggle = state
        while UItoggle do
            local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
            myUI.begin("      Spieler      ", 0.02, 0.02, "kpjbgkzjsdbg")
            local player_table = players.list()
            for i, pid in pairs(player_table) do
                myUI.label(players.get_name(pid),"")
            end
            myUI.finish()
            myUI.begin("Level", 0.118, 0.02, "kpj2bdg2kzjsdbg")
            local player_table = players.list()
            for i, pid in pairs(player_table) do
                myUI.label(players.get_rank(pid),"")
            end
            myUI.finish()
            myUI.begin("Modder", 0.169, 0.02, "kpj2bdgd2kzjsdbg")
            local player_table = players.list()
            for i, pid in pairs(player_table) do
                if players.is_marked_as_modder(pid) then
                    myUI.label("Modder","")
                else
                    myUI.label("No","")
                end
            end
            myUI.finish()
            myUI.begin("Attacker", 0.231, 0.02, "kpjbdg2kzjsdbg")
            local player_table = players.list()
            for i, pid in pairs(player_table) do
                if players.is_marked_as_attacker(pid) then
                    myUI.label("Attacker","")
                    else
                    myUI.label("No","")
                    end
            end
            myUI.finish()
            myUI.begin(" Sprache ", 0.299, 0.02, "kpjbdgkzjsdbg")
            local player_table = players.list()
            for i, pid in pairs(player_table) do
               myUI.label(regionDetect[players.get_language(pid)].lang,"")
            end
            myUI.finish()
            myUI.begin("Eingabe", 0.374, 0.02, "kpj2bdgd2hkzjsdbg")
            local player_table = players.list()
            for i, pid in pairs(player_table) do
            if players.is_using_controller(pid) then
				myUI.label("Controller","")
				else
                myUI.label("Tastatur","")
				end
            end
            myUI.finish()
            myUI.begin("         Boss        ", 0.435, 0.02, "kpfj3bdgd2hkzsdbg")
            local player_table = players.list()
            for i, pid in pairs(player_table) do
                if players.get_boss(pid) == -1 then
				myUI.label("N/A","")
				else
				myUI.label((players.get_name(players.get_boss(pid))),"")
				end
            end
            myUI.finish()
            myUI.begin("Fahrzeug", 0.535, 0.02, "kpfj2bdgd2hkzsdbg")
            local player_table = players.list()
            for i, pid in pairs(player_table) do
				playerinfo1 = players.get_vehicle_model(pid)
				if players.get_vehicle_model(pid) == 0 then
				myUI.label("N/A","")
				else
				myUI.label(util.get_label_text(VEHICLE.GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(players.get_vehicle_model(pid))),"")
				end
            end
            myUI.finish()

            --
            util.yield()
        end
    end)

---------------------
---------------------
-- Spieler Overlay Ende
---------------------
---------------------

---------------------
---------------------
-- InfoOverlay Start
---------------------
---------------------

menu.toggle(overlay, "Info Overlay", {"InfoOverlay"}, "Info Overlay in einer schönen Box", function(state)
    UItoggle2 = state
    while UItoggle2 do
        --start the gui
        myUI.begin("Info Overlay", x, y, "asdfghjkl")

        --count players in the session
        local playercount = 0
        for i, pid in pairs(players.list(true, true, true)) do
            playercount = playercount + 1
        end

        --count modders in the session
        local moddercount = 0
        for i, pid in pairs(players.list(true, true, true)) do
            if players.is_marked_as_modder(pid) then
                moddercount = moddercount + 1
            end
        end

        --count friends in the session
        local friendcount = 0
        for i, pid in pairs(players.list(false, true, false)) do
            friendcount = friendcount + 1
        end

        --count strangers in the session
        local strangercount = 0
        for i, pid in pairs(players.list(false, false, true)) do
            strangercount = strangercount + 1
        end

        --session host row
        if session_host_toggle then
            myUI.label("Host: ", players.get_name(players.get_host()), white_colour)
        end

        --script host row
        if session_script_host_toggle then
            myUI.label("Script Host: ", players.get_name(players.get_script_host()), white_colour)
        end

        --player count row
        if players_toggle then
            myUI.label("Spieler: ", playercount, white_colour)
        end

        --modder count row
        if modders_toggle then
            myUI.label("Modder: ", moddercount, white_colour)
        end

        --friend count row
        if friends_toggle then
            myUI.label("Freunde: ", friendcount, white_colour)
        end

        --stranger count row
        if stranger_toggle then
            myUI.label("Unbekannte: ", strangercount, white_colour)
        end

        --time row
        if time_toggle then
            myUI.label("Zeit: ", os.date("%X"), white_colour)
        end

        --fps overlay row
        if fps_toggle then
            myUI.label("FPS: ", fps, white_colour)
        end

        --ped pool count row
        if peds_toggle then
            myUI.label("Peds: ", memory.read_int(pedInterface + 0x0110).."/"..memory.read_int(pedInterface + 0x0108), white_colour)
        end

        --vehicle count row
        if vehicles_toggle then
            myUI.label("Vehicles: ", memory.read_int(vehInterface + 0x0190).."/"..memory.read_int(vehInterface + 0x0188), white_colour)
        end

        --oject count row
        if objects_toggle then
            myUI.label("Objects: ", memory.read_int(objectInterface + 0x0168).."/"..memory.read_int(objectInterface + 0x0160), white_colour)
        end

        --pickup count row
        if pickups_toggle then
            myUI.label("Pickups: ", memory.read_int(pickupInterface + 0x0110).."/"..memory.read_int(pickupInterface + 0x0108), white_colour)
        end

         --empty row
         if empty_toggle then
            myUI.label("", "", white_colour)
        end
        --finish/complete the gui
        myUI.finish()
        util.yield()
    end
end)

---------------------
---------------------
-- InfoOverlay Ende
---------------------
---------------------

---------------------
---------------------
-- Detections Start
---------------------
---------------------

menu.toggle_loop(detections, "Godmode", {}, "Erkennt ob jemand Godmode benutzt.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        for i, interior in ipairs(interior_stuff) do
            if (players.is_godmode(pid) or not ENTITY.GET_ENTITY_CAN_BE_DAMAGED(ped)) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior then
                util.draw_debug_text("[Athego's Script] " .. players.get_name(pid) .. " benutzt Godmode")
                util.toast("[Athego's Script] " .. players.get_name(pid) .. " benutzt Godmode")
                util.log("[Athego's Script] " .. players.get_name(pid) .. " benutzt Godmode")
                break
            end
        end
    end 
end)

menu.toggle_loop(detections, "Vehicle Godmode", {}, "Erkennt ob jemand ein Fahrzeug benutzt welches in Godmode ist.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
        local player_veh = PED.GET_VEHICLE_PED_IS_USING(ped)
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            for i, interior in ipairs(interior_stuff) do
                if not ENTITY.GET_ENTITY_CAN_BE_DAMAGED(player_veh) and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior then
                    util.draw_debug_text("[Athego's Script] " .. players.get_name(pid) .. " benutzt Vehicle Godmode")
                    util.toast("[Athego's Script] " .. players.get_name(pid) .. " benutzt Vehicle Godmode")
                    util.log("[Athego's Script] " .. players.get_name(pid) .. " benutzt Vehicle Godmode")
                    break
                end
            end
        end
    end 
end)

menu.toggle_loop(detections, "Nicht veröffentliches Fahrzeug", {}, "Erkennt ob jemand ein Fahrzeug benutzt welches noch nicht veröffentlicht wurde.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i, name in ipairs(unreleased_vehicles) do
            if modelHash == util.joaat(name) then
                util.toast("[Athego's Script] " .. players.get_name(pid) .. " fährt ein unveröffentliches Fahrzeug " .. "(" .. name .. ")")
                util.log("[Athego's Script] " .. players.get_name(pid) .. " fährt ein unveröffentliches Fahrzeug " .. "(" .. name .. ")")
            end
        end
    end
end)

menu.toggle_loop(detections, "Gemoddete Waffe", {}, "Erkennt ob jemand eine Waffe benutzt die man Online nicht haben kann.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        for i, hash in ipairs(modded_weapons) do
            local weapon_hash = util.joaat(hash)
            if WEAPON.HAS_PED_GOT_WEAPON(ped, weapon_hash, false) and (WEAPON.IS_PED_ARMED(ped, 7) or TASK.GET_IS_TASK_ACTIVE(ped, 8) or TASK.GET_IS_TASK_ACTIVE(ped, 9)) then
                util.toast("[Athego's Script] " .. players.get_name(pid) .. " benutzt eine Gemoddete Waffe " .. "(" .. hash .. ")")
                util.log("[Athego's Script] " .. players.get_name(pid) .. " benutzt eine Gemoddete Waffe " .. "(" .. hash .. ")")
                break
            end
        end
    end
end)

menu.toggle_loop(detections, "Gemoddetes Fahrzeug", {}, "Erkennt ob jemand ein Gemoddetes Fahrzeug benutzt", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local modelHash = players.get_vehicle_model(pid)
        for i , name in ipairs(modded_vehicles) do
            if modelHash == util.joaat(name) then
                util.toast("[Athego's Script] " .. players.get_name(pid) .. " fährt ein gemoddetes Fahrzeug " .. "(" .. name .. ")")
                util.log("[Athego's Script] " .. players.get_name(pid) .. " fährt ein gemoddetes Fahrzeug " .. "(" .. name .. ")")
                break
            end
        end
    end
end)

menu.toggle_loop(detections, "Noclip", {}, "Erkennt ob Spieler Noclip benutzten bzw Levitation", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local ped_ptr = entities.handle_to_pointer(ped)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)
        local oldpos = players.get_position(pid)
        util.yield()
        local currentpos = players.get_position(pid)
        local vel = ENTITY.GET_ENTITY_VELOCITY(ped)
        if not util.is_session_transition_active() and players.exists(pid)
        and get_interior_player_is_in(pid) == 0 and get_transition_state(pid) ~= 0
        and not PED.IS_PED_IN_ANY_VEHICLE(ped, false) -- too many false positives occured when players where driving. so fuck them. lol.
        and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and not PED.IS_PED_DEAD_OR_DYING(ped)
        and not PED.IS_PED_CLIMBING(ped) and not PED.IS_PED_VAULTING(ped) and not PED.IS_PED_USING_SCENARIO(ped)
        and not TASK.GET_IS_TASK_ACTIVE(ped, 160) and not TASK.GET_IS_TASK_ACTIVE(ped, 2)
        and v3.distance(ENTITY.GET_ENTITY_COORDS(players.user_ped(), false), players.get_position(pid)) <= 395.0 -- 400 was causing false positives
        and ENTITY.GET_ENTITY_HEIGHT_ABOVE_GROUND(ped) > 5.0 and not ENTITY.IS_ENTITY_IN_AIR(ped) and entities.player_info_get_game_state(ped_ptr) == 0
        and oldpos.x ~= currentpos.x and oldpos.y ~= currentpos.y and oldpos.z ~= currentpos.z 
        and vel.x == 0.0 and vel.y == 0.0 and vel.z == 0.0 then
            util.toast("[Athego's Script] " .. players.get_name(pid) .. " benutzt Noclip!")
            util.log("[Athego's Script] " .. players.get_name(pid) .. " benutzt Noclip!")
            break
        end
    end
end)

menu.toggle_loop(detections, "Super Drive", {}, "Erkennt ob jemand Super Drive benutzt.", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vehicle = PED.GET_VEHICLE_PED_IS_USING(ped)
        local veh_speed = (ENTITY.GET_ENTITY_SPEED(vehicle)* 2.236936)
        local class = VEHICLE.GET_VEHICLE_CLASS(vehicle)
        if class ~= 15 and class ~= 16 and veh_speed >= 180 and VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1) and players.get_vehicle_model(pid) ~= util.joaat("oppressor") then
            util.toast("[Athego's Script] " .. players.get_name(pid) .. " benutzt Super Drive")
            util.log("[Athego's Script] " .. players.get_name(pid) .. " benutzt Super Drive")
            break
        end
    end
end)

menu.toggle_loop(detections, "Zuschauen", {}, "Erkennt ob dir jemand zuguckt!", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        for i, interior in ipairs(interior_stuff) do
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            if not util.is_session_transition_active() and get_transition_state(pid) ~= 0 and get_interior_player_is_in(pid) == interior
            and not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and not PED.IS_PED_DEAD_OR_DYING(ped) then
                if v3.distance(ENTITY.GET_ENTITY_COORDS(players.user_ped(), false), players.get_cam_pos(pid)) < 15.0 and v3.distance(ENTITY.GET_ENTITY_COORDS(players.user_ped(), false), players.get_position(pid)) > 20.0 then
                    util.toast("[Athego's Script] " .. players.get_name(pid) .. " schaut dir zu!")
                    util.log("[Athego's Script] " .. players.get_name(pid) .. " schaut dir zu!")
                    break
                end
            end
        end
    end
end)

menu.toggle_loop(detections, "Teleport", {}, "Detects if the player has teleported", function()
    for _, pid in ipairs(players.list(false, true, true)) do
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        if not NETWORK.NETWORK_IS_PLAYER_FADING(pid) and ENTITY.IS_ENTITY_VISIBLE(ped) and not PED.IS_PED_DEAD_OR_DYING(ped) then
            local oldpos = players.get_position(pid)
            util.yield(1000)
            local currentpos = players.get_position(pid)
            if get_transition_state(pid) ~= 0 then
                for i, interior in ipairs(interior_stuff) do
                    if v3.distance(oldpos, currentpos) > 500 and oldpos.x ~= currentpos.x and oldpos.y ~= currentpos.y and oldpos.z ~= currentpos.z then
                        util.yield(500)
                        if get_interior_player_is_in(pid) == interior and PLAYER.IS_PLAYER_PLAYING(pid) and players.exists(pid) then
                            util.toast("[Athego's Script] " .. players.get_name(pid) .. " hat sich Teleportiert")
                            util.log("[Athego's Script] " .. players.get_name(pid) .. " hat sich Teleportiert")
                        end
                    end
                end
            end
        end
    end
end)

detection_bslevel = false
menu.toggle(detections, "Gemoddetes Level", {}, "Erkennt ob jemand ein Level hat welches man ohne Mod Menü wahrscheinlich nicht hat", function(on)
    detection_bslevel = on
end, false)

detection_money = false
menu.toggle(detections, "Gemoddetes Geld", {}, "Erkennt ob jemand zu viel Geld hat da er wahrscheinlich ein Modder ist oder war", function(on)
    detection_money = on
end, false)

detection_athego = true
menu.toggle(detections, "Athego", {}, "Erkennt mich", function(on)
    detection_athego = on
end, true)


---------------------
---------------------
-- SELF/UNLOCKS
---------------------
---------------------

local unlocks = menu.list(self, "Unlocks", {}, "")

menu.action(unlocks, "Unlock M16", {""}, "", function()
    memory.write_int(memory.script_global(262145 + 32775), 1)
end)

local collectibles = menu.list(unlocks, "Collectibles", {}, "")
menu.click_slider(collectibles, "Movie Props", {""}, "", 0, 9, 0, 1, function(i)
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x0, i, 1, 1, 1})
end)

menu.click_slider(collectibles, "Hidden Caches", {""}, "", 0, 9, 0, 1, function(i)
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x1, i, 1, 1, 1})
end)

menu.click_slider(collectibles, "Treasure Chests", {""}, "", 0, 1, 0, 1, function(i)
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x2, i, 1, 1, 1})
end)

menu.click_slider(collectibles, "Radio Antennas", {""}, "", 0, 9, 0, 1, function(i)
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x3, i, 1, 1, 1})
end)

menu.click_slider(collectibles, "Media USBs", {""}, "", 0, 19, 0, 1, function(i)
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x4, i, 1, 1, 1})
end)

menu.action(collectibles, "Shipwreck", {""}, "", function()
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x5, 0, 1, 1, 1})
end)

menu.click_slider(collectibles, "Buried Stash", {""}, "", 0, 1, 0, 1, function(i)
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x6, i, 1, 1, 1})
end)

menu.action(collectibles, "Halloween T-Shirt", {""}, "", function()
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x7, 1, 1, 1, 1})
end)

menu.click_slider(collectibles, "Jack O' Lanterns", {""}, "", 0, 9, 0, 1, function(i)
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x8, i, 1, 1, 1})
end)

menu.click_slider(collectibles, "Lamar Davis Organics Product", {""}, "", 0, 99, 0, 1, function(i)
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0x9, i, 1, 1, 1})
end)

menu.click_slider(collectibles, "Junk Energy Skydive", {""}, "", 0, 9, 0, 1, function(i)
    util.trigger_script_event(1 << players.user(), {0xB9BA4D30, 0, 0xA, i, 1, 1, 1})
end)

---------------------
---------------------
-- Anti Fahrzeuge
---------------------
---------------------

local antifahrzeuge <const> = menu.list(menu.my_root(), "Anti Fahrzeuge", {}, "")
menu.divider(antifahrzeuge, "Athego's Script [DEV] - Anti Fahrzeuge")

---------------------
---------------------
-- Anti Fahrzeug/Anti Opressor
---------------------
---------------------

local antioppOpt <const> = menu.list(antifahrzeuge, "Anti Oppressor", {}, "") --Erstellt die Liste
menu.divider(antioppOpt, "Athego's Script [DEV] - Anti Oppressor") --Name der Liste

antioppressor = false
menu.toggle(antioppOpt, "Anti Oppressor", {""}, "Lässt keine Oppressor mehr in der Lobby zu und löscht diese.", function (on)
    antioppressor = on
    mod_uses("player", if on then 1 else -1)
end)

---------------------
---------------------
-- Anti Fahrzeug/Anti Jet
---------------------
---------------------

local antioppOpt <const> = menu.list(antifahrzeuge, "Anti Jet", {}, "") --Erstellt die Liste
menu.divider(antioppOpt, "Athego's Script [DEV] - Anti Jet") --Name der Liste

antijet = false
menu.toggle(antioppOpt, "Anti Jet", {""}, "Lässt keine Jet's mehr in der Lobby zu und löscht diese.", function (on)
    antijet = on
    mod_uses("player", if on then 1 else -1)
end)

---------------------
---------------------
-- Custom Loadout
---------------------
---------------------

local STOREDIR = filesystem.store_dir() --- not using this much, consider moving it to the 2 locations it's used in..
local LIBDIR = filesystem.scripts_dir() .. "lib\\"
local do_autoload = false
local attachments_table = {}
local weapons_table = {}
if filesystem.exists(LIBDIR .. "wpcmplabels.lua") and filesystem.exists(LIBDIR .. "Athego_weapons.lua") then
    attachments_table = require("lib.wpcmplabels")
    weapons_table = require("lib.Athego_weapons")
else
    --util.toast("You didn't install the resources properly. Make sure weapons.lua and wpcmplabels.lua are in the lib directory")
    util.stop_script()
end

local save_loadout_list = menu.list(customloadoutOpt, "Loadout speichern", {}, "")
menu.divider(save_loadout_list, "Athego's Script [DEV] - Loadout speichern")

save_loadout = menu.action(save_loadout_list, "Loadout speichern", {}, "Speichert alle aktuell ausgerüsteten Waffen und Aufsätze um sie in Zukunft zu laden.",
	function()
		util.toast("[Athego's Script] Loadout wird gespeichert...")
        util.log("[Athego's Script] Loadout wird gespeichert...")
		local charS,charE = "   ","\n"
		local player = PLAYER.GET_PLAYER_PED(players.user())
		file = io.open(STOREDIR .. "Athego_Custom-Loadout.lua", "wb")
		file:write("return {" .. charE)
		for category, weapon in pairs(weapons_table) do
			for n, weapon_hash in pairs(weapon) do
				if WEAPON.HAS_PED_GOT_WEAPON(player, weapon_hash, false) then
					file:write(charS .. "[" .. weapon_hash .. "] = ")
					WEAPON.SET_CURRENT_PED_WEAPON(player, weapon_hash, true)
					util.yield(100)
					local num_attachments = 0
					for attachment_hash, attachment_name in pairs(attachments_table) do
						if (WEAPON.DOES_WEAPON_TAKE_WEAPON_COMPONENT(weapon_hash, attachment_hash)) then
							util.yield(10)
							if WEAPON.HAS_PED_GOT_WEAPON_COMPONENT(player, weapon_hash, attachment_hash) then
								num_attachments = num_attachments + 1
								if num_attachments == 1 then
									file:write("{")
								else
									file:write(",")
								end
								file:write(charE .. charS .. charS .. "[" .. num_attachments .. "] = " .. attachment_hash)
							end
						end
					end
					local cur_tint = WEAPON.GET_PED_WEAPON_TINT_INDEX(player, weapon_hash)
					if num_attachments > 0 then
						file:write("," .. charE .. charS .. charS .. "[\"tint\"] = " .. cur_tint)
						file:write(charE .. charS .. "}," .. charE)
					else
						file:write("{" .. charE .. charS .. charS .. "[\"tint\"] = " .. cur_tint)
						file:write(charE .. charS .. "}," .. charE)
					end
				end
			end
		end
		file:write("}")
		file:close()
		util.toast("[Athego's Script] Speichern erfolgreich!")
        util.log("[Athego's Script] Speichern erfolgreich!")
	end)

load_loadout = menu.action(customloadoutOpt, "Loadout laden", {"loadloadout"}, "Equippt dein Loadout aus der letzten Speicherung",
	function()
		if filesystem.exists(STOREDIR .. "Athego_Custom-Loadout.lua") then
			util.toast("[Athego's Script] Loadout wird geladen...")
            util.log("[Athego's Script] Loadout wird geladen...")
			player = PLAYER.GET_PLAYER_PED(players.user())
			WEAPON.REMOVE_ALL_PED_WEAPONS(player, false)
			WEAPON._SET_CAN_PED_EQUIP_ALL_WEAPONS(player, true)
			local loadout_table = require("store\\" .. "Athego_Custom-Loadout")
			for w_hash, attach in pairs(loadout_table) do
				WEAPON.GIVE_WEAPON_TO_PED(player, w_hash, 10, false, true)
					for n, a_hash in pairs(attach) do
						if n ~= "tint" then
							WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(player, w_hash, a_hash)
							util.yield(10)
						end
					end
				WEAPON.SET_PED_WEAPON_TINT_INDEX(player, w_hash, attach["tint"])
			end
			regen_menu()
			util.toast("[Athego's Script] Loadout erfolgreich geladen!")
            util.log("[Athego's Script] Loadout erfolgreich geladen!")
		else
			util.toast("[Athego's Script] Du hast noch kein Loadout gespeichert.")
            util.log("[Athego's Script] Du hast noch kein Loadout gespeichert.")
		end
		package.loaded["store\\Athego_Custom-Loadout"] = nil --- load_loadout should always get the current state of loadout.lua, therefore always load it again or else the last required table would be taken, as it has already been loaded before..
	end
)

auto_load = menu.toggle(customloadoutOpt, "Auto-Load", {}, "Lädt deine Waffen bei jedem Sitzungswechsel neu.", function(on)
	do_autoload = on
end)

from_scratch = menu.action(customloadoutOpt, "Fang von Vorne an", {}, "Löscht jede Waffe damit du dein Loadout so einrichten kannst wie du magst.",
        function()
            WEAPON.REMOVE_ALL_PED_WEAPONS(PLAYER.GET_PLAYER_PED(players.user()), false)
            regen_menu()
            util.toast("Deine Waffen wurde gelöscht!")
        end)

menu.divider(customloadoutOpt, "Waffen bearbeiten")

function regen_menu()
    attachments = {}
    weapon_deletes = {}
    tints = {}
    for category, weapon in pairs(weapons_table) do
        category = string.gsub(category, "_", " ")
        for weapon_name, weapon_hash in pairs(weapon) do
            weapon_name = string.gsub(weapon_name, "_", " ")
            menu.delete(weapons[weapon_name])
            if WEAPON.HAS_PED_GOT_WEAPON(PLAYER.GET_PLAYER_PED(players.user()), weapon_hash, false) == true then
                generate_for_new_weapon(category, weapon_name, weapon_hash)
            else
                weapons[weapon_name] = menu.action(categories[category], weapon_name .. "(Nicht ausgerüstet)", {}, "Ausrüsten " .. weapon_name,
                        function()
                            menu.delete(weapons[weapon_name])
                            equip_weapon(category, weapon_name, weapon_hash)
                        end
                )
            end
            WEAPON.ADD_AMMO_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), weapon_hash, 10) --- if a special ammo type has been equipped.. it should get some ammo
        end
    end
end

function equip_comp(category, weapon_name, weapon_hash, attachment_hash)
    WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), weapon_hash, attachment_hash)
    generate_attachments(category, weapon_name, weapon_hash)
end

function equip_weapon(category, weapon_name, weapon_hash)
    WEAPON.GIVE_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), weapon_hash, 10, false, true)
    util.yield(10)
    weapon_deletes[weapon_name] = nil
    generate_for_new_weapon(category, weapon_name, weapon_hash)
end

function generate_for_new_weapon(category, weapon_name, weapon_hash)
    weapons[weapon_name] = menu.list(categories[category], weapon_name, {}, "Aufsätze bearbeiten für " .. weapon_name,
            function()
                WEAPON.SET_CURRENT_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()), weapon_hash, true)
                generate_attachments(category, weapon_name, weapon_hash)
            end
    )
end

function generate_attachments(category, weapon_name, weapon_hash)
    player = PLAYER.GET_PLAYER_PED(players.user())
    if weapon_deletes[weapon_name] == nil then
        weapon_deletes[weapon_name] = menu.action(weapons[weapon_name], "Lösche " .. weapon_name, {}, "",
                function()
                    WEAPON.REMOVE_WEAPON_FROM_PED(player, weapon_hash)
                    menu.delete(weapons[weapon_name])
                    util.toast(weapon_name .. " wurde gelöscht")
                    weapons[weapon_name] = menu.action(categories[category], weapon_name .. "(Nicht ausgerüstet)", {}, "Ausrüsten " .. weapon_name,
                            function()
                                for a_key, a_action in pairs(attachments) do
                                    if string.find(a_key, weapon_hash) ~= nil then
                                        attachments[a_key] = nil
                                    end
                                end
                                menu.delete(weapons[weapon_name])
                                equip_weapon(category, weapon_name, weapon_hash)
                                weapon_deletes[weapon_name] = nil
                            end
                    )
                end
        )

        local tint_count = WEAPON.GET_WEAPON_TINT_COUNT(weapon_hash)
        local cur_tint = WEAPON.GET_PED_WEAPON_TINT_INDEX(player, weapon_hash)
        tints[weapon_hash] = menu.slider(weapons[weapon_name], "Lackierung", {}, "Wähl die Lackierung für " .. weapon_name, 0, tint_count - 1, cur_tint, 1,
                function(change)
                    WEAPON.SET_PED_WEAPON_TINT_INDEX(player, weapon_hash, change)
                end
        )

        menu.divider(weapons[weapon_name], "Aufsätze")
    end

    for attachment_hash, attachment_name in pairs(attachments_table) do
        if (WEAPON.DOES_WEAPON_TAKE_WEAPON_COMPONENT(weapon_hash, attachment_hash)) then
            if (attachments[weapon_hash .. " " .. attachment_hash] ~= nil) then menu.delete(attachments[weapon_hash .. " " .. attachment_hash]) end
            attachments[weapon_hash .. " " .. attachment_hash] = menu.action(weapons[weapon_name], attachment_name, {}, "Equip " .. attachment_name .. " on your " .. weapon_name,
                    function()
                        equip_comp(category, weapon_name, weapon_hash, attachment_hash)
                        util.yield(1)
                        if string.find(attachment_name, "Rounds") ~= nil and WEAPON.HAS_PED_GOT_WEAPON_COMPONENT(player, weapon_hash, attachment_hash) then
                            --- if the type of rounds is changed, the player needs some bullets of the new type to be able to use them
                            WEAPON.ADD_AMMO_TO_PED(player, weapon_hash, 10)
                            util.toast("Habe " .. weapon_name .. " neue Munition gegeben wegen neuer Munitions-Art.")
                        end
                    end
            )
        end
    end
end

categories = {}
weapons = {}
attachments = {}
weapon_deletes = {}
tints = {}
for category, weapon in pairs(weapons_table) do
    category = string.gsub(category, "_", " ")
    categories[category] = menu.list(customloadoutOpt, category, {}, "Bearbeite Waffen der " .. category .. " Kategorie.")
    for weapon_name, weapon_hash in pairs(weapon) do
        weapon_name = string.gsub(weapon_name, "_", " ")
        if WEAPON.HAS_PED_GOT_WEAPON(PLAYER.GET_PLAYER_PED(players.user()), weapon_hash, false) == true then
            generate_for_new_weapon(category, weapon_name, weapon_hash)
        else
            weapons[weapon_name] = menu.action(categories[category], weapon_name .. "(Nicht ausgerüstet)", {}, "Ausrüsten " .. weapon_name,
                    function()
                        menu.delete(weapons[weapon_name])
                        equip_weapon(category, weapon_name, weapon_hash)
                    end
            )
        end
    end
end

players_thread = util.create_thread(function (thr)
    while true do
        if player_uses > 0 then
            if show_updates then
                util.toast("Player pool is being updated")
            end
            all_players = players.list(false, true, true)
            for k,pid in pairs(all_players) do
                if antioppressor then
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, true)
                    if vehicle ~= 0 then
                      local hash = util.joaat("oppressor")
                      local hash2 = util.joaat("oppressor2")
                      if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) or VEHICLE.IS_VEHICLE_MODEL(vehicle, hash2) then
                        entities.delete(vehicle)
                        util.toast("[Athego's Script]\nOppressor-Nutzer gefunden: " .. PLAYER.GET_PLAYER_NAME(pid) .. "\nLösche sein Oppressor")
                        util.log("[Athego's Script]Oppressor-Nutzer gefunden: " .. PLAYER.GET_PLAYER_NAME(pid) .. "Lösche sein Oppressor")
                      end
                    end
                end
                if antijet then
                    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                    local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, true)
                    if vehicle ~= 0 then
                      local hash = util.joaat("hydra")
                      local hash2 = util.joaat("lazer")
                      if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) or VEHICLE.IS_VEHICLE_MODEL(vehicle, hash2) then
                        entities.delete(vehicle)
                        util.toast("[Athego's Script]\nJet-Nutzer gefunden: " .. PLAYER.GET_PLAYER_NAME(pid) .. "\nLösche den Jet")
                        util.log("[Athego's Script] Jet-Nutzer gefunden: " .. PLAYER.GET_PLAYER_NAME(pid) .. "Lösche den Jet")
                      end
                    end
                end
            end
        end
        util.yield()
    end
end)

while true do
    if NETWORK.NETWORK_IS_IN_SESSION() == false then
        while NETWORK.NETWORK_IS_IN_SESSION() == false or util.is_session_transition_active() do
            util.yield(1000)
        end
        util.yield(10000) --- wait until even the clownish animation on spawn is definitely finished..
        if do_autoload then
            menu.trigger_commands("loadloadout")
            util.toast("[Athego's Script] Autoload des Loadout's")
        else
            regen_menu()
        end
    end
    util.yield()
end