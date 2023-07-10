util.require_natives("1651208000")
util.keep_running()

---------------
--VARIABLES
---------------

local mlist = menu.list
local divider = menu.divider
local action = menu.action
local toggle = menu.toggle
local toggleloop = menu.toggle_loop
local mroot = menu.my_root
local proot = menu.player_root
local text = menu.text_input
local link = menu.hyperlink
local getvalue = menu.get_value
local refbypass = menu.ref_by_path
local agroup = "missfbi3ig_0"
local anim = "shit_loop_trev"
local mshit = util.joaat("prop_big_shit_02")
local agroup2 = "switch@trevor@jerking_off"
local anim2 = "trev_jerking_off_loop"
local cum = util.joaat("p_oil_slick_01")
local cage = util.joaat("prop_gold_cont_01")
local door = util.joaat("v_ilev_ph_cellgate")
local inmate = util.joaat("s_m_y_prisoner_01")
local exp = ("EXP_TAG_RCTANK_ROCKET")
local chop = util.joaat("a_c_chop")
local oldchop = util.joaat("a_c_chop_02")
local WhiteMonke = util.joaat("A_C_Rhesus")
local BlackMonke = util.joaat("A_C_Chimp")
local shark = util.joaat("a_c_sharktiger")
local shark2 = util.joaat("a_c_sharkhammer")
local whale = util.joaat("a_c_humpback")
local ufo = util.joaat("sum_prop_dufocore_01a")
local dufo = util.joaat("imp_prop_ship_01a")
local ramp = util.joaat("stt_prop_ramp_jump_l")
local wall = util.joaat("prop_tyre_wall_02")
local targets = entities.get_all_peds_as_pointers()
local alien = util.joaat("vw_prop_vw_colle_alien")
local beast = util.joaat("vw_prop_vw_colle_beast")
local impotent_rage = util.joaat("vw_prop_vw_colle_imporage")
local pogo = util.joaat("vw_prop_vw_colle_pogo")
local princess_robot = util.joaat("vw_prop_vw_colle_prbubble")
local space_ranger = util.joaat("vw_prop_vw_colle_rsrcomm")
local space_ranger_2 = util.joaat("vw_prop_vw_colle_rsrgeneric")
local bigfoot = util.joaat("vw_prop_vw_colle_sasquatch")
local pickup = util.joaat("pickup_portable_crate_unfixed_incar_with_passengers")
local healthpickup = util.joaat("PICKUP_HEALTH_STANDARD")
local health = util.joaat("prop_ld_health_pack")
local armorpickup = util.joaat("PICKUP_ARMOUR_STANDARD")
local armor = util.joaat("Prop_Armour_Pickup")
local parachutepickup = util.joaat("PICKUP_PARACHUTE")
local parachute = util.joaat("p_parachute_s_shop")
local vehiclepickup = util.joaat("PICKUP_VEHICLE_HEALTH_STANDARD")
local vehicledrop = util.joaat("Prop_MP_REPAIR")
local pqspickup = util.joaat("PICKUP_HEALTH_SNACK")
local pqs = util.joaat("PROP_CHOC_PQ")
local card = util.joaat("vw_prop_vw_lux_card_01a")
local num = {
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35"
}
local monkedude = util.joaat("u_m_y_pogo_01")
local nakeddude = util.joaat("a_m_m_acult_01")
local headless = util.joaat("ig_johnnyklebitz")
local clown = util.joaat("s_m_y_clown_01")
local juggernaut = util.joaat("u_m_y_juggernaut_01")
local zombie = util.joaat("u_m_y_zombie_01")
local stripper = util.joaat("csb_stripper_02")
local corpseless = util.joaat("mp_m_marston_01")
local mime = util.joaat("s_m_y_mime")
local jesus = util.joaat("u_m_m_jesus_01")
local microsmg = util.joaat("weapon_MicroSMG")
local shotgun = util.joaat("weapon_PumpShotgun")
local sniper = util.joaat("weapon_SniperRifle")
local machete = util.joaat("weapon_Machete")
local RPG = util.joaat("weapon_RPG")
local stungun = util.joaat("weapon_stungun_mp")
local pistol = util.joaat("weapon_Pistol")
local railgun = util.joaat("weapon_Railgun")
local minigun = util.joaat("weapon_Minigun")
local atomizer = util.joaat("weapon_raypistol")
local hellbringer = util.joaat("weapon_raycarbine")
local fireextinguisher = util.joaat("weapon_fireextinguisher")
local unarmed = util.joaat("weapon_unarmed")
local playersinvehicle = {}
local playersonfoot = {}
local floorbr = util.joaat("bkr_prop_biker_landing_zone_01")
local bigasscircle = util.joaat("ar_prop_ar_neon_gate4x_04a")
local c1
local c2
local c3
local c4
local c5
local c6
local c7
local c8
local c9
local c10
local c12
local c13
local c14
local c15
local c16
local c17
local c18
local c19
local wallbr = util.joaat("bkr_prop_biker_bblock_mdm3")
local expcar = util.joaat("Tezeract")
local heavy = util.joaat("weapon_heavysniper")
local molotov = util.joaat("weapon_molotov")
local copmodel = util.joaat("s_m_y_cop_01")

---------------
--MENU
---------------

local lists = mlist(mroot(), "Self", {}, "Self category")
local lactions = mlist(lists, "Actions", {}, "Actions category")
--local lplayers = mlist(mroot(), "Players", {}, "Players category")
local weapons = mlist(mroot(), "Weapons", {}, "Weapons category")
local lpidspawn = mlist(mroot(), "Spawn", {}, "Spawning category")
local saved = mlist(lpidspawn, "Saved", {}, "Saved models")
local world = mlist(mroot(), "World", {}, "World category")
local HUDlist = mlist(mroot(), "HUD", {}, "HUD category")
local online = mlist(mroot(), "Online", {}, "Online category")
local freemodelist = mlist(online, "FreeMode Activites", {}, "FreeMode Activites category")
local credits = mlist(mroot(), "Credits", {}, "Credits")

---------------
--PLAYERS LIST FUNCTION
---------------

local function playerslist(pid)
    util.yield(150)
    divider(proot(pid), "CxScript") --divider

    ---------------
    --PLAYERS LISTS
    ---------------

    local troll = mlist(proot(pid), "Trolling", {}, "Trolling & Griefing category")
    local attackers = mlist(troll, "Attackers", {}, "Attackers category")
    local attackersweapons = mlist(attackers, "Weapons", {}, "Attackers' weapons category")
    local attackerslist = mlist(attackers, "Attackers list", {}, "Attackers list")
    local damagelist = mlist(troll, "Damage", {}, "Damage category")
    local friendly = mlist(proot(pid), "Friendly", {}, "Friendly category")
    local drops = mlist(friendly, "Drops", {}, "Drops category")
    local aflist = mlist(drops, "Action Figures", {}, "Action figures category")
    local explosions = mlist(troll, "Explosions", {}, "Explosions category")
    local cages = mlist(troll, "Cages", {}, "Cages category")
    local player_vehicle = mlist(troll, "Vehicles", {}, "Vehicles category")
    local spawner = mlist(proot(pid), "Spawn", {}, "Spawning category")
    local psaved = mlist(spawner, "Saved", {}, "Saved models")
    local shortcutslist = mlist(proot(pid), "Shortcuts", {}, "Shortcuts list")
    local hacks = mlist(proot(pid), "Hack", {}, "Hacking category")
    local miscplayer = mlist(proot(pid), "Misc", {}, "Misc category")

    ---------------
    --EXPLOSIONS OPTIONS
    ---------------

    action(explosions, "Anonymous explosion", {}, "Explode the player anonymously", function() --anon exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
    end)

    action(explosions, "Owned explosion", {}, "Explode the player", function() --owned exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, c.z, exp, 100.0, true, false, 1.0)
    end)

    toggleloop(explosions, "Loop anonymous explosion", {}, "", function() --loop anon exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
    end)

    toggleloop(explosions, "Loop owned explosion", {}, "", function() --loop owned exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, c.z, exp, 100.0, true, false, 1.0)
    end)

    action(explosions, "Fake explosion", {}, "Explosion dealing no damage", function() --fake exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 0.0, true, false, 1.0, false)
    end)

    action(explosions, "Alien explosion", {"ufo"}, "Simulate an alien invasion", function() --that option is rlly cool ngl
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(ufo)
        while not STREAMING.HAS_MODEL_LOADED(ufo) do
            STREAMING.REQUEST_MODEL(ufo)
            util.yield()
        end
        menu.trigger_commands("freeze".. players.get_name(pid).. " on")
        c.z = c.z + 10
        local spawnedufo = entities.create_object(ufo, c) --creates ufo
        util.yield(2000)
        c = ENTITY.GET_ENTITY_COORDS(p)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 3.0, false)
        util.yield(1000)
        entities.delete_by_handle(spawnedufo)
        menu.trigger_commands("freeze".. players.get_name(pid).. " off")
    end)

    action(explosions, "Anonymous godmode explosion", {}, "Automatically bypasses player's godmode and explode the player (only works on bad menus)", function() --anonym godmode exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        menu.trigger_commands("confuse".. players.get_name(pid).. " on")
        util.yield(10)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(10)
        menu.trigger_commands("confuse".. players.get_name(pid).. " off")
    end)

    action(explosions, "Owned godmode explosion", {}, "Automatically bypasses player's godmode and explode the player (only works on bad menus)", function() --owned godmode exp
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        menu.trigger_commands("confuse".. players.get_name(pid).. " on")
        util.yield(10)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(10)
        menu.trigger_commands("confuse".. players.get_name(pid).. " off")
    end)

    --[[action(explosions, "Anonymous Nuke", {}, "Nuke the player", function() --anonym nuke
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, 0, 0, 0)
        local defx = 0
        local defy = 0
        local defz = 0
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defz = defz + 2
        c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defz = defz + 2
        c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defz = defz + 2
        c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defz = defz + 2
        c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defz = defz + 2
        c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
        util.yield(50)
        defx = defx + 2
        defy = defy + 2
        c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, defx, defy, defz)
        FIRE.ADD_EXPLOSION(c.x, c.y, c.z, exp, 100.0, true, false, 1.0, false)
    end)]]

    ---------------
    --CAGE OPTIONS
    ---------------

    local cage1 = {}
    local cage2 = {}
    local door1 = {}
    local door2 = {}
    local door3 = {}
    local door4 = {}
    local sinmate = {}

    action(cages, "Cage", {}, "Cage the player", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(cage)
        while not STREAMING.HAS_MODEL_LOADED(cage) do
            STREAMING.REQUEST_MODEL(cage)
            util.yield()
        end
        if not STREAMING.HAS_MODEL_LOADED(cage) then
            util.toast("Model couldn't be load")
        end
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(p)
        if PED.IS_PED_IN_ANY_VEHICLE(p) then return end
        cage1 [#cage1 + 1] = entities.create_object(cage, c) --spawns the cage
        ENTITY.FREEZE_ENTITY_POSITION(cage1[#cage1], true)
    end)

    action(cages, "Invisible Cage", {}, "Cage the player in an invisible cage", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(cage)
        while not STREAMING.HAS_MODEL_LOADED(cage) do
            STREAMING.REQUEST_MODEL(cage)
            util.yield()
        end
        if not STREAMING.HAS_MODEL_LOADED(cage) then
            util.toast("Model couldn't be load")
        end
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(p)
        if PED.IS_PED_IN_ANY_VEHICLE(p) then return end
        cage2 [#cage2 + 1] = entities.create_object(cage, c) --spawns the cage
        ENTITY.SET_ENTITY_VISIBLE(cage2[#cage2], false, 0)
        ENTITY.FREEZE_ENTITY_POSITION(cage2[#cage2], true)
    end)

    action(cages, "Prison", {}, "Trap the player in a prison cell with another inmate", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        c.y = c.y + 0.5
        c.x = c.x + 0.5
        STREAMING.REQUEST_MODEL(door)
        while not STREAMING.HAS_MODEL_LOADED(door) do
            STREAMING.REQUEST_MODEL(door)
            util.yield()
        end
        if not STREAMING.HAS_MODEL_LOADED(door) then
            util.toast("Model couldn't be load")
        end
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(p)
        if PED.IS_PED_IN_ANY_VEHICLE(p) then return end

        door1 [#door1 + 1] = entities.create_object(door, c) --door 1
        ENTITY.FREEZE_ENTITY_POSITION(door1[#door1], true)

        c = ENTITY.GET_ENTITY_COORDS(p)
        c.y = c.y - 0.8
        c.x = c.x + 0.5
        door2 [#door2 + 1] = entities.create_object(door, c) --door 2
        ENTITY.FREEZE_ENTITY_POSITION(door2[#door2], true)

        c = ENTITY.GET_ENTITY_COORDS(p)
        c.x = c.x + 0.5
        c.y = c.y + 0.5
        door3 [#door3 + 1] = entities.create_object(door, c) --door 3
        ENTITY.SET_ENTITY_ROTATION(door3[#door3], 0.0, 0.0, 90.0, 1, true)
        ENTITY.FREEZE_ENTITY_POSITION(door3[#door3], true)

        c = ENTITY.GET_ENTITY_COORDS(p)
        c.y = c.y + 0.5
        c.x = c.x - 0.8
        door4 [#door4 + 1] = entities.create_object(door, c) --door 4
        ENTITY.SET_ENTITY_ROTATION(door4[#door4], 0.0, 0.0, 90.0, 1, true)
        ENTITY.FREEZE_ENTITY_POSITION(door4[#door4], true)

        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(inmate)
        while not STREAMING.HAS_MODEL_LOADED(inmate) do
            STREAMING.REQUEST_MODEL(inmate)
            util.yield()
        end
        if not STREAMING.HAS_MODEL_LOADED(inmate) then
            util.toast("Failed to load the model")
        end
        util.yield(100)
        sinmate [#sinmate + 1] = entities.create_ped(26, inmate, c, 0) --spawns an inmate in cage
    end)

    action(cages, "Clear cage", {}, "Clear all the cages", function()
        for i = 1, #cage1 do
            entities.delete_by_handle(cage1[i])
            cage1[i] = nil
        end

        for i = 1, #cage2 do
            entities.delete_by_handle(cage2[i])
            cage2[i] = nil
        end
    end)

    action(cages, "Clear prison", {}, "Clear all the prison cells", function()
        for i = 1, #door1 do
            entities.delete_by_handle(door1[i]) --delete door 1
            door1[i] = nil
        end

        for i = 1, #door2 do
            entities.delete_by_handle(door2[i]) --delete door 2
            door2[i] = nil
        end

        for i = 1, #door3 do
            entities.delete_by_handle(door3[i]) --delete door 3
            door3[i] = nil
        end

        for i = 1, #door4 do
            entities.delete_by_handle(door4[i]) --delete door 4
            door4[i] = nil
        end

        for i = 1, #sinmate do
            entities.delete_by_handle(sinmate[i]) --delete inmate
            sinmate[i] = nil
        end
    end)

    ---------------
    --VEHICLE PLAYERS
    ---------------

    function RequestControl(entity)
        local tick = 0
        while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick < 100000 do
            util.yield()
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
            tick = tick + 1
        end
    end

    action(player_vehicle, "Ramp", {}, "Spawn a ramp in front of the player's car", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, 0, 10, -1)
        local rot = ENTITY.GET_ENTITY_ROTATION(p, 5)
        rot.x = 0
        rot.y = 0
        rot.z = rot.z + 90
        if PED.IS_PED_IN_ANY_VEHICLE(p, true) then
            STREAMING.REQUEST_MODEL(ramp)
            while not STREAMING.HAS_MODEL_LOADED(ramp) do
                STREAMING.REQUEST_MODEL(ramp)
                util.yield()
            end
            local spawnedramp = entities.create_object(ramp, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedramp, rot.x, rot.y, rot.z, 1, true)
            util.yield(5000)
            entities.delete_by_handle(spawnedramp)
            if not STREAMING.HAS_MODEL_LOADED(ramp) then
                util.toast("Couldn't load the model")
            end
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    action(player_vehicle, "Wall", {}, "Spawn a wall in front of the player's car", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(p, 0, 5, -1)
        local rot = ENTITY.GET_ENTITY_ROTATION(p, 5)
        rot.x = 0
        rot.y = 0
        rot.z = rot.z + 180
        if PED.IS_PED_IN_ANY_VEHICLE(p, true) then
            STREAMING.REQUEST_MODEL(wall)
            while not STREAMING.HAS_MODEL_LOADED(wall) do
                STREAMING.REQUEST_MODEL(wall)
                util.yield()
            end
            local spawnedwall = entities.create_object(wall, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, rot.x, rot.y, rot.z, 1, true)
            util.yield(5000)
            entities.delete_by_handle(spawnedwall)
            if not STREAMING.HAS_MODEL_LOADED(wall) then
                util.toast("Couldn't load the model")
            end
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    action(player_vehicle, "Teleport under the map", {}, "Teleport them in the void", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local veh = PED.GET_VEHICLE_PED_IS_IN(p, false)
        c.z = c.z - 100
        if PED.IS_PED_IN_ANY_VEHICLE(p, false) then
            local success, floorcoords
            repeat
                success, floorcoords = util.get_ground_z(c.x, c.y)
                util.yield()
            until success
            RequestControl(veh)
            floorcoords = floorcoords - 50
            ENTITY.SET_ENTITY_COORDS(veh, c.x, c.y, floorcoords, false, false, false, false) --tp undermap
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    action(player_vehicle, "Teleport very high up", {}, "Teleport them very high up", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local veh = PED.GET_VEHICLE_PED_IS_IN(p, false)
        c.z = c.z + 1500
        if PED.IS_PED_IN_ANY_VEHICLE(p, false) then
            RequestControl(veh)
            ENTITY.SET_ENTITY_COORDS(veh, c.x, c.y, c.z, false, false, false, false) --tp very high up
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    action(player_vehicle, "Teleport in the ocean", {}, "Teleport them in the ocean", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local veh = PED.GET_VEHICLE_PED_IS_IN(p, false)
        if PED.IS_PED_IN_ANY_VEHICLE(p, false) then
            RequestControl(veh)
            ENTITY.SET_ENTITY_COORDS(veh, -2247.1692, -1903.4473, 3, false, false, false, false) --tp in ocean
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    action(player_vehicle, "Teleport in the prison", {}, "Teleport them in the prison", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local veh = PED.GET_VEHICLE_PED_IS_IN(p, false)
        if PED.IS_PED_IN_ANY_VEHICLE(p, false) then
            RequestControl(veh)
            ENTITY.SET_ENTITY_COORDS(veh, 1652.5746, 2569.7756, 45.564854, false, false, false, false) --tp in prison
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    action(player_vehicle, "Teleport to the backrooms", {}, "Teleport them in the backrooms", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local defx = c.x
        local defy = c.y 
        local defz = c.z
        local veh = PED.GET_VEHICLE_PED_IS_IN(p, true)
        if PED.IS_PED_IN_ANY_VEHICLE(p, false) then
            STREAMING.REQUEST_MODEL(floorbr)
            while not STREAMING.HAS_MODEL_LOADED(floorbr) do
                STREAMING.REQUEST_MODEL(floorbr)
                util.yield()
            end
            STREAMING.REQUEST_MODEL(wallbr)
            while not STREAMING.HAS_MODEL_LOADED(wallbr) do
                STREAMING.REQUEST_MODEL(wallbr)
                util.yield()
            end
            RequestControl(veh)
            local success, floorcoords
            repeat
                success, floorcoords = util.get_ground_z(c.x, c.y)
                util.yield()
            until success
            c.z = floorcoords - 100
            ENTITY.SET_ENTITY_COORDS(veh, c.x, c.y, c.z, false, false, false, false)

            local c = ENTITY.GET_ENTITY_COORDS(p)
            local defz = c.z
            c.z = defz - 2
            local spawnedfloorbr = entities.create_object(floorbr, c)
            c.z = c.z + 10
            local spawnedroofbr = entities.create_object(floorbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedroofbr, 180.0, 0.0, 0.0, 1, true)

            defz = c.z - 5
            c.x = c.x + 4
            c.z = defz
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = c.x - 8
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y - 8
            c.x = defx + 10.5
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y - 14.5
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y - 7.2
            c.x = defx + 3.5
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = defy + 6.5
            c.x = defx + 11
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = defx - 12
            c.y = defy + 4
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = defy - 7
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y - 10
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y - 7
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = defy - 10
            c.x = defx - 19
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = defx - 3
            c.y = defy + 6.5
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = defx + 25
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = c.x + 7
            c.y = defy
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = defy - 14.5
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y - 7
            c.x = c.x - 7
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y - 7
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y - 7
            c.x = c.x - 7.5
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = c.x - 6.5
            c.y = c.y - 6.5
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = c.x - 7.5
            c.y = c.y - 7
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = c.x - 14
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = c.x - 6.5
            c.y = c.y + 7
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = c.x - 7.5
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.x = c.x - 6.5
            c.y = c.y + 7
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y + 14
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y + 14
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y + 14
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 0.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            c.y = c.y - 3.1
            c.x = c.x + 5
            local spawnedwall = entities.create_object(wallbr, c)
            ENTITY.SET_ENTITY_ROTATION(spawnedwall, 90.0, 90.0, 0.0, 1, true)
            OBJECT._SET_OBJECT_TEXTURE_VARIATION(spawnedwall, 7)

            util.yield(500)
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(p)
            util.yield(500)
            entities.delete_by_handle(veh)
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    toggleloop(player_vehicle, "Disable vehicles", {}, "Better than already existing stand's disable vehicles (cant be fixed with an appartment invite)", function(toggle)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local veh = PED.GET_VEHICLE_PED_IS_IN(p, false)
        if (PED.IS_PED_IN_ANY_VEHICLE(p)) then
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(p)
        else
            local veh2 = PED.GET_VEHICLE_PED_IS_TRYING_TO_ENTER(p)
            entities.delete_by_handle(veh2)
        end
    end)

    action(player_vehicle, "UnGodMode Vehicle", {}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local veh = PED.GET_VEHICLE_PED_IS_IN(p)
        if PED.IS_PED_IN_ANY_VEHICLE(p) then
            RequestControl(veh)
            ENTITY.SET_ENTITY_INVINCIBLE(veh, false)
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    toggleloop(player_vehicle, "UnGodMode Vehicle Loop", {}, "", function(toggle)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local veh = PED.GET_VEHICLE_PED_IS_IN(p)
        if PED.IS_PED_IN_ANY_VEHICLE(p) then
            RequestControl(veh)
            ENTITY.SET_ENTITY_INVINCIBLE(veh, false)
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    ---------------
    --DAMAGE
    ---------------

    action(damagelist, "Snipe", {"snipe"}, "", function()
        local cam = CAM.GET_GAMEPLAY_CAM_COORD()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p, false)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(cam.x, cam.y, cam.z, c.x, c.y, c.z, 1000, 1, heavy, players.user_ped(), true, false, 2500.0) --snipe
    end)

    action(damagelist, "Atomize", {"atomize"}, "", function()
        local cam = CAM.GET_GAMEPLAY_CAM_COORD()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p, false)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(cam.x, cam.y, cam.z, c.x, c.y, c.z, 1000, 1, atomizer, players.user_ped(), true, false, 2500.0) --atomize
    end)

    action(damagelist, "Launch", {"launch"}, "", function()
        local cam = CAM.GET_GAMEPLAY_CAM_COORD()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p, false)
        local posx = c.x
        local posy = c.y
        local posz = c.z
        util.yield(10)
        for i = 1, 100 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(posx, posy, posz, c.x, c.y, c.z, 1000, 1, atomizer, players.user_ped(), true, false, 2500.0) --launch
        end
        menu.trigger_commands("freeze" ..players.get_name(pid).. " on")
        util.yield(50)
        menu.trigger_commands("freeze" ..players.get_name(pid).. " off")
    end)

    action(damagelist, "Burn", {}, "Spawn fire at them", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p, false)
        local posx = c.x
        local posy = c.y
        local posz = c.z + 1
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(posx, posy, posz, c.x, c.y, c.z, 1000, 1, molotov, players.user_ped(), true, false, 2500.0) --burn
    end)

    ---------------
    --ATTACKERS
    ---------------

    local isImmortal = false
    local weapon0 = false
    local weapon1 = false
    local weapon2 = false
    local weapon3 = false
    local weapon4 = false
    local weapon5 = false
    local weapon6 = false
    local weapon7 = false
    local weapon8 = false
    local weapon9 = false
    local weapon10 = false
    local weapon11 = false

    toggle(attackers, "Immortal", {}, "Make the attackers immortal", function(toggle)
        isImmortal = toggle
    end)

    action(attackersweapons, "Unarmed", {}, "", function()
        weapon0 = true
        weapon1 = false
        weapon2 = false
        weapon3 = false
        weapon4 = false
        weapon5 = false
        weapon6 = false
        weapon7 = false
        weapon8 = false
        weapon9 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "Machete", {}, "", function()
        weapon1 = true
        weapon0 = false
        weapon2 = false
        weapon3 = false
        weapon4 = false
        weapon5 = false
        weapon6 = false
        weapon7 = false
        weapon8 = false
        weapon9 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "Pistol", {}, "", function()
        weapon2 = true
        weapon0 = false
        weapon1 = false
        weapon3 = false
        weapon4 = false
        weapon5 = false
        weapon6 = false
        weapon7 = false
        weapon8 = false
        weapon9 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "Stun Gun", {}, "", function()
        weapon3 = true
        weapon0 = false
        weapon1 = false
        weapon2 = false
        weapon4 = false
        weapon5 = false
        weapon6 = false
        weapon7 = false
        weapon8 = false
        weapon9 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "Atomizer", {}, "", function()
        weapon4 = true
        weapon0 = false
        weapon1 = false
        weapon2 = false
        weapon3 = false
        weapon5 = false
        weapon6 = false
        weapon7 = false
        weapon8 = false
        weapon9 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "ShotGun", {}, "", function()
        weapon5 = true
        weapon0 = false
        weapon1 = false
        weapon2 = false
        weapon3 = false
        weapon4 = false
        weapon6 = false
        weapon7 = false
        weapon8 = false
        weapon9 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "Sniper Rifle", {}, "", function()
        weapon6 = true
        weapon0 = false
        weapon1 = false
        weapon2 = false
        weapon3 = false
        weapon4 = false
        weapon5 = false
        weapon7 = false
        weapon8 = false
        weapon9 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "Micro SMG", {}, "", function()
        weapon7 = true
        weapon0 = false
        weapon1 = false
        weapon2 = false
        weapon3 = false
        weapon4 = false
        weapon5 = false
        weapon6 = false
        weapon8 = false
        weapon9 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "Minigun", {}, "", function()
        weapon8 = true
        weapon0 = false
        weapon1 = false
        weapon2 = false
        weapon3 = false
        weapon4 = false
        weapon5 = false
        weapon6 = false
        weapon7 = false
        weapon9 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "RPG", {}, "", function()
        weapon9 = true
        weapon0 = false
        weapon1 = false
        weapon2 = false
        weapon3 = false
        weapon4 = false
        weapon5 = false
        weapon6 = false
        weapon7 = false
        weapon8 = false
        weapon10 = false
        weapon11 = false
    end)

    action(attackersweapons, "HellBringer", {}, "", function()
        weapon10 = true
        weapon0 = false
        weapon1 = false
        weapon2 = false
        weapon3 = false
        weapon4 = false
        weapon5 = false
        weapon6 = false
        weapon7 = false
        weapon8 = false
        weapon9 = false
        weapon11 = false
    end)

    action(attackersweapons, "RailGun", {}, "", function()
        weapon11 = true
        weapon0 = false
        weapon1 = false
        weapon2 = false
        weapon3 = false
        weapon4 = false
        weapon5 = false
        weapon6 = false
        weapon7 = false
        weapon8 = false
        weapon9 = false
        weapon10 = false
    end)

    local function GiveWeapon(attacker)
        if (weapon0 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(unarmed, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, unarmed, 1, false, true)
        elseif (weapon1 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(machete, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, machete, 1, false, true)
        elseif (weapon2 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(pistol, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, pistol, 1, false, true)
        elseif (weapon3 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(stungun, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, stungun, 1, false, true)
        elseif (weapon4 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(atomizer, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, atomizer, 1, false, true)
        elseif (weapon5 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(shotgun, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, shotgun, 1, false, true)
        elseif (weapon6 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(sniper, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, sniper, 1, false, true)
        elseif (weapon7 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(microsmg, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, microsmg, 1, false, true)
        elseif (weapon8 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(minigun, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, minigun, 1, false, true)
        elseif (weapon9 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(RPG, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, RPG, 1, false, true)
        elseif (weapon10 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(hellbringer, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, hellbringer, 1, false, true)
        elseif (weapon11 == true) then
            WEAPON.REQUEST_WEAPON_ASSET(railgun, 31, 0)
            WEAPON.GIVE_WEAPON_TO_PED(attacker, railgun, 1, false, true)
        end
    end --to anyone looking at my script rn, I apologize for this mess BUT if it works it works ;)

    local function setAttribute(attacker)
        PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 38, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 5, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 0, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 12, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 22, true)
        PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 54, true)
        PED.SET_PED_COMBAT_RANGE(attacker, 4)
        PED.SET_PED_COMBAT_ABILITY(attacker, 3)
    end

    local tclone = {}
    local tchop = {}
    local tpogo = {}
    local tnaked = {}
    local theadless = {}
    local tcorpseless = {}
    local tclown = {}
    local tmime = {}
    local tjuggernaut = {}
    local tzombie = {}
    local tjesus = {}
    local tstripper = {}

    action(attackerslist, "Clone", {}, "Spawns a clone of the player", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        aclone = entities.create_ped(26, ENTITY.GET_ENTITY_MODEL(p), c, 0) --spawn clone
        PED.CLONE_PED_TO_TARGET(p, aclone)
        GiveWeapon(aclone)
        setAttribute(aclone)
        TASK.TASK_COMBAT_PED(aclone, p, 0, 16)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(aclone, false)
        end
    end)

    action(attackerslist, "Chop", {}, "Spawns chop", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(chop)
        while not STREAMING.HAS_MODEL_LOADED(chop) do
            STREAMING.REQUEST_MODEL(chop)
            util.yield()
        end
        local achop = entities.create_ped(26, chop, c, 0) --spawn chop
        TASK.TASK_COMBAT_PED(achop , p, 0, 16)
        setAttribute(achop)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(achop , false)
        end
        if not STREAMING.HAS_MODEL_LOADED(chop) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Pogo", {}, "Spawns Pogo", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(monkedude)
        while not STREAMING.HAS_MODEL_LOADED(monkedude) do
            STREAMING.REQUEST_MODEL(monkedude)
            util.yield()
        end
        local apogo = entities.create_ped(26, monkedude, c, 0) --spawn pogo
        TASK.TASK_COMBAT_PED(apogo, p, 0, 16)
        GiveWeapon(apogo)
        setAttribute(apogo)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(apogo, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(monkedude) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Naked Guy", {}, "WE CAN SEE HIS PP LMFAOOOAOFAOFOAFOAOOOOO", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(nakeddude)
        while not STREAMING.HAS_MODEL_LOADED(nakeddude) do
            STREAMING.REQUEST_MODEL(nakeddude)
            util.yield()
        end
        local anaked = entities.create_ped(26, nakeddude, c, 0) --spawn weird ass mf
        TASK.TASK_COMBAT_PED(anaked, p, 0, 16)
        PED.SET_PED_DEFAULT_COMPONENT_VARIATION(anaked)
        GiveWeapon(anaked)
        setAttribute(anaked)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(anaked, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(nakeddude) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Headless", {}, "Spawns headless guy", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(headless)
        while not STREAMING.HAS_MODEL_LOADED(headless) do
            STREAMING.REQUEST_MODEL(headless)
            util.yield()
        end
        local aheadless = entities.create_ped(26, headless, c, 0) --spawn headless
        TASK.TASK_COMBAT_PED(aheadless, p, 0, 16)
        PED.SET_PED_DEFAULT_COMPONENT_VARIATION(aheadless)
        GiveWeapon(aheadless)
        setAttribute(aheadless)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(aheadless, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(headless) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Corpse less", {}, "Spawns corpse less guy", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(corpseless)
        while not STREAMING.HAS_MODEL_LOADED(corpseless) do
            STREAMING.REQUEST_MODEL(corpseless)
            util.yield()
        end
        local acorpseless = entities.create_ped(26, corpseless, c, 0) --spawn corpse less
        TASK.TASK_COMBAT_PED(acorpseless, p, 0, 16)
        PED.SET_PED_DEFAULT_COMPONENT_VARIATION(acorpseless)
        GiveWeapon(acorpseless)
        setAttribute(acorpseless)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(acorpseless, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(corpseless) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Clown", {}, "Spawns a clown", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(clown)
        while not STREAMING.HAS_MODEL_LOADED(clown) do
            STREAMING.REQUEST_MODEL(clown)
            util.yield()
        end
        local aclown = entities.create_ped(26, clown, c, 0) --spawn clown
        TASK.TASK_COMBAT_PED(aclown, p, 0, 16)
        GiveWeapon(aclown)
        setAttribute(aclown)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(aclown, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(clown) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Mime", {}, "Spawns a mime", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(mime)
        while not STREAMING.HAS_MODEL_LOADED(mime) do
            STREAMING.REQUEST_MODEL(mime)
            util.yield()
        end
        local amime = entities.create_ped(26, mime, c, 0) --spawn mime
        TASK.TASK_COMBAT_PED(amime, p, 0, 16)
        GiveWeapon(amime)
        setAttribute(amime)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(amime, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(mime) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Juggernaut", {}, "Spawns a juggernaut", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(juggernaut)
        while not STREAMING.HAS_MODEL_LOADED(juggernaut) do
            STREAMING.REQUEST_MODEL(juggernaut)
            util.yield()
        end
        local ajuggernaut = entities.create_ped(26, juggernaut, c, 0) --spawn juggernaut
        TASK.TASK_COMBAT_PED(ajuggernaut, p, 0, 16)
        GiveWeapon(ajuggernaut)
        setAttribute(ajuggernaut)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(ajuggernaut, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(juggernaut) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Zombie", {}, "Spawns a zombie", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(zombie)
        while not STREAMING.HAS_MODEL_LOADED(zombie) do
            STREAMING.REQUEST_MODEL(zombie)
            util.yield()
        end
        local azombie = entities.create_ped(26, zombie, c, 0) --spawn zombie
        TASK.TASK_COMBAT_PED(azombie, p, 0, 16)
        GiveWeapon(azombie)
        setAttribute(azombie)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(azombie, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(zombie) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Jesus", {}, "Spawns jesus", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(jesus)
        while not STREAMING.HAS_MODEL_LOADED(jesus) do
            STREAMING.REQUEST_MODEL(jesus)
            util.yield()
        end
        local ajesus = entities.create_ped(26, jesus, c, 0) --spawn jesus
        TASK.TASK_COMBAT_PED(ajesus, p, 0, 16)
        GiveWeapon(ajesus)
        setAttribute(ajesus)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(ajesus, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(jesus) then
            util.toast("Couldn't load the model")
        end
    end)

    action(attackerslist, "Stripper", {}, "Spawns a stripper", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(stripper)
        while not STREAMING.HAS_MODEL_LOADED(stripper) do
            STREAMING.REQUEST_MODEL(stripper)
            util.yield()
        end
        local astripper = entities.create_ped(26, stripper, c, 0) --spawn stripper
        TASK.TASK_COMBAT_PED(astripper, p, 0, 16)
        GiveWeapon(astripper)
        setAttribute(astripper)
        if (isImmortal == true) then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(astripper, false)
        end
        if not STREAMING.HAS_MODEL_LOADED(stripper) then
            util.toast("Couldn't load the model")
        end
    end)

    ---------------
    --UNCATEGORIZED
    ---------------

    divider(troll, "Other") --divider

    action(troll, "Make them wanted" , {}, "Give them a wanted level (usually 4 stars but it can go up to 5 stars)", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local defz = c.z
        STREAMING.REQUEST_MODEL(copmodel)
        while not STREAMING.HAS_MODEL_LOADED(copmodel) do
            STREAMING.REQUEST_MODEL(copmodel)
            util.yield()
        end
        local success, floorcoords
        repeat
            success, floorcoords = util.get_ground_z(c.x, c.y)
            util.yield()
        until success
        c.z = floorcoords - 50
        local spawnedfloorwanted = entities.create_object(floorbr, c)
        floorcoords = floorcoords - 45
        c.z = floorcoords
        for i = 1, 100 do
            local spawnedcop1 = entities.create_ped(26, copmodel, c, 0)
            local spawnedcop2 = entities.create_ped(26, copmodel, c, 0)
            util.yield(500)
            FIRE.ADD_OWNED_EXPLOSION(p, c.x, c.y, c.z, exp, 100.0, false, false, 0.0)
            util.yield(100)
            entities.delete_by_handle(spawnedcop1)
            entities.delete_by_handle(spawnedcop2)
        end
        entities.delete_by_handle(spawnedfloorwanted)
    end)

    ---------------
    --FRIENDLY
    ---------------

    --ooga booga code

    local actionf1 = false
    local actionf2 = false
    local actionf3 = false
    local actionf4 = true
    local actionf5 = false
    local actionf6 = false
    local actionf7 = false
    local actionf8 = false

    action(aflist, "Alien", {"afalien"}, "", function()
        actionf1 = true
        actionf2 = false
        actionf3 = false
        actionf4 = false
        actionf5 = false
        actionf6 = false
        actionf7 = false
        actionf8 = false
    end)

    action(aflist, "Beast", {"afbeast"}, "", function()
        actionf1 = false
        actionf2 = true
        actionf3 = false
        actionf4 = false
        actionf5 = false
        actionf6 = false
        actionf7 = false
        actionf8 = false
    end)

    action(aflist, "Impotent rage", {"afimpotrage"}, "", function()
        actionf1 = false
        actionf2 = false
        actionf3 = true
        actionf4 = false
        actionf5 = false
        actionf6 = false
        actionf7 = false
        actionf8 = false
    end)

    action(aflist, "Pogo", {"afpogo"}, "", function()
        actionf1 = false
        actionf2 = false
        actionf3 = false
        actionf4 = true
        actionf5 = false
        actionf6 = false
        actionf7 = false
        actionf8 = false
    end)

    action(aflist, "Princess Robot", {"afprincessrobot"}, "", function()
        actionf1 = false
        actionf2 = false
        actionf3 = false
        actionf4 = false
        actionf5 = true
        actionf6 = false
        actionf7 = false
        actionf8 = false
    end)

    action(aflist, "Space Ranger", {"afspaceranger"}, "", function()
        actionf1 = false
        actionf2 = false
        actionf3 = false
        actionf4 = false
        actionf5 = false
        actionf6 = true
        actionf7 = false
        actionf8 = false
    end)

    action(aflist, "Space Ranger 2", {"afspaceranger2"}, "", function()
        actionf1 = false
        actionf2 = false
        actionf3 = false
        actionf4 = false
        actionf5 = false
        actionf6 = false
        actionf7 = true
        actionf8 = false
    end)

    action(aflist, "Bigfoot", {"afbigfoot"}, "", function()
        actionf1 = false
        actionf2 = false
        actionf3 = false
        actionf4 = false
        actionf5 = false
        actionf6 = false
        actionf7 = false
        actionf8 = true
    end)

    toggleloop(drops, "Drop RP", {"droprp"}, "Same as the already existing Stand's drop rp option but you can choose the action figures", function(toggle)
        if (actionf1 == true) then
            local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(p)
            STREAMING.REQUEST_MODEL(alien)
            while not STREAMING.HAS_MODEL_LOADED(alien) do 
                STREAMING.REQUEST_MODEL(alien)
                util.yield()
            end
            OBJECT.CREATE_AMBIENT_PICKUP(pickup, pos.x, pos.y, pos.z, 0, false, alien, true, false) --spawn figure
        elseif (actionf2 == true) then
            local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(p)
            STREAMING.REQUEST_MODEL(beast)
            while not STREAMING.HAS_MODEL_LOADED(beast) do 
                STREAMING.REQUEST_MODEL(beast)
                util.yield()
            end
            OBJECT.CREATE_AMBIENT_PICKUP(pickup, pos.x, pos.y, pos.z, 0, false, beast, true, false) --spawn figure
        elseif (actionf3 == true) then
            local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(p)
            STREAMING.REQUEST_MODEL(impotent_rage)
            while not STREAMING.HAS_MODEL_LOADED(impotent_rage) do 
                STREAMING.REQUEST_MODEL(impotent_rage)
                util.yield()
            end
            OBJECT.CREATE_AMBIENT_PICKUP(pickup, pos.x, pos.y, pos.z, 0, false, impotent_rage, true, false) --spawn figure
        elseif (actionf4 == true) then
            local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(p)
            STREAMING.REQUEST_MODEL(pogo)
            while not STREAMING.HAS_MODEL_LOADED(pogo) do 
                STREAMING.REQUEST_MODEL(pogo)
                util.yield()
            end
            OBJECT.CREATE_AMBIENT_PICKUP(pickup, pos.x, pos.y, pos.z, 0, false, pogo, true, false) --spawn figure
        elseif (actionf5 == true) then
            local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(p)
            STREAMING.REQUEST_MODEL(princess_robot)
            while not STREAMING.HAS_MODEL_LOADED(princess_robot) do 
                STREAMING.REQUEST_MODEL(princess_robot)
                util.yield()
            end
            OBJECT.CREATE_AMBIENT_PICKUP(pickup, pos.x, pos.y, pos.z, 0, false, princess_robot, true, false) --spawn figure
        elseif (actionf6 == true) then
            local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(p)
            STREAMING.REQUEST_MODEL(space_ranger)
            while not STREAMING.HAS_MODEL_LOADED(space_ranger) do 
                STREAMING.REQUEST_MODEL(space_ranger)
                util.yield()
            end
            OBJECT.CREATE_AMBIENT_PICKUP(pickup, pos.x, pos.y, pos.z, 0, false, space_ranger, true, false) --spawn figure
        elseif (actionf7 == true) then
            local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(p)
            STREAMING.REQUEST_MODEL(space_ranger_2)
            while not STREAMING.HAS_MODEL_LOADED(space_ranger_2) do 
                STREAMING.REQUEST_MODEL(space_ranger_2)
                util.yield()
            end
            OBJECT.CREATE_AMBIENT_PICKUP(pickup, pos.x, pos.y, pos.z, 0, false, space_ranger_2, true, false) --spawn figure
        elseif (actionf8 == true) then 
            local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(p)
            STREAMING.REQUEST_MODEL(bigfoot)
            while not STREAMING.HAS_MODEL_LOADED(bigfoot) do 
                STREAMING.REQUEST_MODEL(bigfoot)
                util.yield()
            end
            OBJECT.CREATE_AMBIENT_PICKUP(pickup, pos.x, pos.y, pos.z, 0, false, bigfoot, true, false) --spawn figure
        else
            util.toast("Select an action figure to spawn")
            menu.trigger_commands("droprp" ..players.get_name(pid).. " off") --holy fuck this shit was aids to do
        end
    end)

    toggleloop(drops, "Drop Casino Chips", {"dropchips"}, "I have been testing it for 3 weeks (june 25th 2022 rn), seems safe so far but still keep in mind it could be detected", function(toggle)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(card)
        while not STREAMING.HAS_MODEL_LOADED(card) do
            STREAMING.REQUEST_MODEL(card)
            util.yield()
        end
        OBJECT.CREATE_AMBIENT_PICKUP(pickup, pos.x, pos.y, pos.z, 0, false, card, true, false) --spawn casino chips
        if not STREAMING.HAS_MODEL_LOADED(card) then
            util.toast("Couldn't load the model")
        end
    end)

    toggleloop(drops, "Drop Health", {"drophealth"}, "", function(toggle)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(health)
        while not STREAMING.HAS_MODEL_LOADED(health) do
            STREAMING.REQUEST_MODEL(health)
            util.yield()
        end
        OBJECT.CREATE_AMBIENT_PICKUP(healthpickup, pos.x, pos.y, pos.z, 0, false, health, true, false) --spawn health
        if not STREAMING.HAS_MODEL_LOADED(health) then
            util.toast("Couldn't load the model")
        end
    end)

    toggleloop(drops, "Drop Vehicle Health", {"dropvehhealth"}, "", function(toggle)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(vehicledrop)
        while not STREAMING.HAS_MODEL_LOADED(vehicledrop) do
            STREAMING.REQUEST_MODEL(vehicledrop)
            util.yield()
        end
        OBJECT.CREATE_AMBIENT_PICKUP(vehiclepickup, pos.x, pos.y, pos.z, 0, false, vehicledrop, true, false) --spawn veh health
        if not STREAMING.HAS_MODEL_LOADED(vehicledrop) then
            util.toast("Couldn't load the model")
        end
    end)

    toggleloop(drops, "Drop Snacks", {"dropsnacks"}, "", function(toggle)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(pqs)
        while not STREAMING.HAS_MODEL_LOADED(pqs) do
            STREAMING.REQUEST_MODEL(pqs)
            util.yield()
        end
        OBJECT.CREATE_AMBIENT_PICKUP(pqspickup, pos.x, pos.y, pos.z, 0, false, pqs, true, false) --spawn snacks
        if not STREAMING.HAS_MODEL_LOADED(pqs) then
            util.toast("Couldn't load the model")
        end
    end)

    toggleloop(drops, "Drop Armor", {"droparmor"}, "", function(toggle)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(armor)
        while not STREAMING.HAS_MODEL_LOADED(armor) do
            STREAMING.REQUEST_MODEL(armor)
            util.yield()
        end
        OBJECT.CREATE_AMBIENT_PICKUP(armorpickup, pos.x, pos.y, pos.z, 0, false, armor, true, false) --spawn armor
        if not STREAMING.HAS_MODEL_LOADED(armor) then
            util.toast("Couldn't load the model")
        end
    end)

    toggleloop(drops, "Drop Parachute", {"dropparachute"}, "", function(toggle)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(parachute)
        while not STREAMING.HAS_MODEL_LOADED(parachute) do
            STREAMING.REQUEST_MODEL(parachute)
            util.yield()
        end
        OBJECT.CREATE_AMBIENT_PICKUP(parachutepickup, pos.x, pos.y, pos.z, 0, false, parachute, true, false) --spawn parachute
        if not STREAMING.HAS_MODEL_LOADED(parachute) then
            util.toast("Couldn't load the model")
        end
    end)

    action(friendly, "Win Criminal Damage", {}, "Make them win criminal damage everytime", function()
        local fcartable = {}

        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local defz = c.z
        STREAMING.REQUEST_MODEL(expcar)
        while not STREAMING.HAS_MODEL_LOADED(expcar) do
            STREAMING.REQUEST_MODEL(expcar)
            util.yield()
        end
        STREAMING.REQUEST_MODEL(floorbr)
        while not STREAMING.HAS_MODEL_LOADED(floorbr) do
            STREAMING.REQUEST_MODEL(floorbr)
            util.yield()
        end
        local success, floorcoords
        repeat
            success, floorcoords = util.get_ground_z(c.x, c.y)
            util.yield()
        until success
        floorcoords = floorcoords - 100
        c.z = floorcoords
        local floorrigp = entities.create_object(floorbr, c) --spawn floor
        c.z = defz
        c.z = c.z - 95 
        for i = 1, 22 do
            fcartable[#fcartable + 1] = entities.create_vehicle(expcar, c, 0) --spawn cars
        end
        util.yield(1000)
        FIRE.ADD_OWNED_EXPLOSION(p, c.x, c.y, floorcoords, exp, 100.0, true, false, 1.0) --explode cars
        util.yield(500)
        entities.delete_by_handle(floorrigp)
        util.yield(1000)
        
        for i = 1, #fcartable do
            entities.delete_by_handle(fcartable[i]) --delete cars
            fcartable[i] = nil
        end
    end)

    toggleloop(friendly, "Win Checkpoints", {}, "Make them win checkpoints event everytime", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        if PED.IS_PED_IN_ANY_VEHICLE(p) then
            local veh = PED.GET_VEHICLE_PED_IS_IN(p, true)
            RequestControl(veh) --get control of veh
            local dblip = HUD.GET_NEXT_BLIP_INFO_ID(431)
            local cdblip = HUD.GET_BLIP_COORDS(dblip)
            ENTITY.SET_ENTITY_COORDS(veh, cdblip.x, cdblip.y, cdblip.z, false, false, false, false)
            util.yield(1500)
        else
            util.toast(players.get_name(pid).. " has to be in a vehicle")
        end
    end)

    action(friendly, "GodMode vehicle", {}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        if PED.IS_PED_IN_ANY_VEHICLE(p) then
            local veh = PED.GET_VEHICLE_PED_IS_IN(p, true)
            RequestControl(veh)
            ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
        else
            util.toast(players.get_name(pid).. " is not in a vehicle")
        end
    end)

    ---------------
    --SPAWNER PLAYERS
    ---------------

    --goofy ahh code

    local pclpid = {}
    local pbmonke = {}
    local pwmonke = {}
    local pschop = {}
    local psoldchop = {}
    local psshark = {}
    local psshark2 = {}
    local pswhale = {}
    local pinputm = {}

    local pinput_model

    text(spawner, "Input String", {"loadstringpid"}, "Set a ped's string, for exemple 'a_c_chop' for chop", function(input)
        pinput_model = util.joaat(input)
    end, "")
    
    action(spawner, "Spawn String", {}, "", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        STREAMING.REQUEST_MODEL(pinput_model)
        while not STREAMING.HAS_MODEL_LOADED(pinput_model) do
            STREAMING.REQUEST_MODEL(pinput_model)
            util.yield()
        end
        pinputm [#pinputm + 1] = entities.create_ped(26, pinput_model, c, 0) --spawn string
        if not STREAMING.HAS_MODEL_LOADED(pinput_model) then
            util.toast("Couldn't load the model")
        end
    end)

    action(spawner, "Clear Peds", {}, "", function()
        for i = 1, #pclpid do
            entities.delete_by_handle(pclpid[i]) --delete clone
            pclpid[i] = nil
        end

        for i = 1, #pbmonke do
            entities.delete_by_handle(pbmonke[i]) --delete black monkey
            pbmonke[i] = nil
        end

        for i = 1, #pwmonke do
            entities.delete_by_handle(pwmonke[i]) --delete white monkey
            pwmonke[i] = nil
        end

        for i = 1, #pschop do
            entities.delete_by_handle(pschop[i]) --delete chop
            pschop[i] = nil
        end

        for i = 1, #psoldchop do
            entities.delete_by_handle(psoldchop[i]) --delete shark
            psoldchop[i] = nil
        end

        for i = 1, #psshark do
            entities.delete_by_handle(psshark[i]) --delete shark
            psshark[i] = nil
        end

        for i = 1, #psshark2 do
            entities.delete_by_handle(psshark2[i]) --delete shark
            psshark2[i] = nil
        end

        for i = 1, #pswhale do
            entities.delete_by_handle(pswhale[i]) --delete shark
            pswhale[i] = nil
        end

        for i = 1, #pinputm do
            entities.delete_by_handle(pinputm[i]) --delete input model
            pinputm[i] = nil
        end
    end)

    action(psaved, "Clone", {}, "Spawns a clone of the player", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(p)
        local pclone = entities.create_ped(26, ENTITY.GET_ENTITY_MODEL(p), c, 0) --spawns clone
        pclpid [#pclpid + 1] = pclone 
        PED.CLONE_PED_TO_TARGET(p, pclone)
    end)

    action(psaved, "Black monkey", {}, "Spawns a black monkey", function()
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        STREAMING.REQUEST_MODEL(BlackMonke)
        while not STREAMING.HAS_MODEL_LOADED(BlackMonke) do
            STREAMING.REQUEST_MODEL(BlackMonke)
            util.yield(10)
        end
        pbmonke [#pbmonke + 1] = entities.create_ped(26, BlackMonke, c, 0) --spawns black monkey
        if not STREAMING.HAS_MODEL_LOADED(BlackMonke) then
            util.toast("Couldn't load the model")
        end
    end)

    action(psaved, "White monkey", {}, "Spawns a white monkey", function()
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        STREAMING.REQUEST_MODEL(WhiteMonke)
        while not STREAMING.HAS_MODEL_LOADED(WhiteMonke) do
            STREAMING.REQUEST_MODEL(WhiteMonke)
            util.yield(10)
        end
        pwmonke [#pwmonke + 1] = entities.create_ped(26, WhiteMonke, c, 0) --spawns white monkey
        if not STREAMING.HAS_MODEL_LOADED(WhiteMonke) then
            util.toast("Couldn't load the model")
        end
    end)

    action(psaved, "Chop", {}, "Spawns chop", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user_ped())
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        STREAMING.REQUEST_MODEL(chop)
        while not STREAMING.HAS_MODEL_LOADED(chop) do
            STREAMING.REQUEST_MODEL(chop)
            util.yield(10)
        end
        pschop [#pschop + 1] = entities.create_ped(26, chop, c, 0) --spawns chop
        if not STREAMING.HAS_MODEL_LOADED(chop) then
            util.toast("Couldn't load the model")
        end
    end)

    action(psaved, "Old Chop", {}, "Spawns chop but older", function()
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        STREAMING.REQUEST_MODEL(oldchop)
        while not STREAMING.HAS_MODEL_LOADED(oldchop) do
            STREAMING.REQUEST_MODEL(oldchop)
            util.yield(10)
        end
        psoldchop [#psoldchop + 1] = entities.create_ped(26, oldchop, c, 0) --spawns chop
        if not STREAMING.HAS_MODEL_LOADED(oldchop) then
            util.toast("Couldn't load the model")
        end
    end)

    action(psaved, "Shark", {}, "Spawns a shark", function()
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        STREAMING.REQUEST_MODEL(shark)
        while not STREAMING.HAS_MODEL_LOADED(shark) do
            STREAMING.REQUEST_MODEL(shark)
            util.yield(10)
        end
        psshark [#psshark + 1] = entities.create_ped(26, shark, c, 0) --spawns a shark
        if not STREAMING.HAS_MODEL_LOADED(shark) then
            util.toast("Couldn't load the model")
        end
    end)

    action(psaved, "Shark 2", {}, "Spawns a shark but not the same", function()
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        STREAMING.REQUEST_MODEL(shark2)
        while not STREAMING.HAS_MODEL_LOADED(shark2) do
            STREAMING.REQUEST_MODEL(shark2)
            util.yield(10)
        end
        psshark2 [#psshark2 + 1] = entities.create_ped(26, shark2, c, 0) --spawns a shark2
        if not STREAMING.HAS_MODEL_LOADED(shark2) then
            util.toast("Couldn't load the model")
        end
    end)

    action(psaved, "Whale", {}, "Spawns a whale", function()
        local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        STREAMING.REQUEST_MODEL(whale)
        while not STREAMING.HAS_MODEL_LOADED(whale) do
            STREAMING.REQUEST_MODEL(whale)
            util.yield(10)
        end
        pswhale [#pswhale + 1] = entities.create_ped(26, whale, c, 0) --spawns a whale
        if not STREAMING.HAS_MODEL_LOADED(whale) then
            util.toast("Couldn't load the model")
        end
    end)

    ---------------
    --SHORTCUTS
    ---------------

    --truth or dare?

    action(shortcutslist, "Kick", {}, "Kick the player", function()
        menu.trigger_commands("kick".. players.get_name(pid))
    end)

    action(shortcutslist, "Crash", {}, "Crash the player", function()
        menu.trigger_commands("crash".. players.get_name(pid))
    end)

    action(shortcutslist, "Teleport", {}, "Teleport to the player", function()
        menu.trigger_commands("tp".. players.get_name(pid))
    end)

    action(shortcutslist, "Teleport in vehicle", {}, "Teleport to the player", function()
        menu.trigger_commands("tpveh".. players.get_name(pid))
    end)


    action(shortcutslist, "Summon", {}, "Teleport the player", function()
        menu.trigger_commands("summon".. players.get_name(pid))
    end)

    action(shortcutslist, "Kick from vehicle", {}, "Kick the player from their vehicle", function()
        menu.trigger_commands("vehkick".. players.get_name(pid))
    end)

    action(shortcutslist, "Disarm", {}, "Disarm the player", function()
        menu.trigger_commands("disarm".. players.get_name(pid) .."on")
        util.yield(10)
        menu.trigger_commands("disarm".. players.get_name(pid) .."off")
    end)

    toggle(shortcutslist, "Freeze", {}, "Freeze the player", function(toggle)
        menu.trigger_commands("freeze".. players.get_name(pid), toggle)
    end)

    toggle(shortcutslist, "Force camera forward", {}, "Force camera forward", function(toggle)
        menu.trigger_commands("confuse".. players.get_name(pid), toggle)
    end)

    action(shortcutslist, "Force into freemode mission", {}, "Force the player into a freemode mission", function()
        menu.trigger_commands("mission".. players.get_name(pid))
    end)

    toggle(shortcutslist, "Spectate", {}, "Spectate the player", function(toggle)
        menu.trigger_commands("spectate".. players.get_name(pid), toggle)
    end)

    ---------------
    --HACK PLAYERS
    ---------------

    action(hacks, "Get account informations", {}, "Get the player's account informations, format: email:password", function()
        util.toast("What the fuck did you expect mf")
    end)

    action(hacks, "DDoS", {}, "DDoS the player by sending packets to their router", function()
        util.toast("Successfully sent a DDoS attack to " ..players.get_name(pid))
        local percent = 0
        while percent <= 100 do
            util.yield(100)
            util.toast(percent.. "% done")
            percent = percent + 1
        end
        util.yield(3000)
        util.toast("Just kidding you fucking idiot")
    end)

    link(hacks, "Dox", "https://bit.ly/3Q1MN7X", "Generate a doxbin link with every informations found about the player") --rickroll

    link(hacks, "Leak IP", "https://bit.ly/3xjpQpt", "Leaks their IP in the chat") --saul

    ---------------
    --MISC
    ---------------

    toggleloop(miscplayer, "ESP", {}, "Draw a line towards them", function(toggle)
        local c = ENTITY.GET_ENTITY_COORDS(players.user_ped()) --get local player's pos
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local j = ENTITY.GET_ENTITY_COORDS(p) --get player's pos
        GRAPHICS.DRAW_LINE(c.x, c.y, c.z, j.x, j.y, j.z, 255, 255, 255, 255) --draw esp
    end)
end

---------------
--SELF
---------------

action(lists, "Be a cop", {}, "Become a cop", function()
    local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user_ped())
    PED.SET_PED_AS_COP(p, true)
    menu.trigger_commands("smycop01") --model cop
    menu.trigger_commands("police3") --spawn cop car
end)

toggle(lists, "Become a good citizen", {}, "No more weapons or car jacking ;)", function(toggle)
    PED.SET_ENABLE_HANDCUFFS(players.user_ped(), toggle) --handcuff on / off
end)

---------------
--ACTIONS
---------------

action(lactions, "Take a shit", {}, "Makes you take a shit", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z - 1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(players.user_ped())
    TASK.TASK_PLAY_ANIM(players.user_ped(), agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true) --play anim
    util.yield(1000)
    local shit = entities.create_object(mshit, c) --spawn shit
    util.yield(60000)
    entities.delete_by_handle(shit) --delete shit
end)

action(lactions, "Jerk Off", {}, "Do I really need to explain this ?", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z - 1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup2) do
        STREAMING.REQUEST_ANIM_DICT(agroup2)
        util.yield()
    end
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(players.user_ped())
    TASK.TASK_PLAY_ANIM(players.user_ped(), agroup2, anim2, 8.0, 8.0, 5000, 1, 0, true, true, true) --play anim
    util.yield(4500)
    local cum = entities.create_object(cum, c) --spawn cum
    util.yield(60000)
    entities.delete_by_handle(cum) --delete cum
end)

---------------
--WEAPONS
---------------

toggle(weapons, "Friendly fire", {}, "Turn on friendly fire", function(toggle)
    PED.SET_CAN_ATTACK_FRIENDLY(players.user_ped(), toggle, false) --friendly fire on / off
end)

---------------
--PLAYERS
---------------

--[[
action(lplayers, "", {}, "", function()

end) ]]

---------------
--SPAWN
---------------

--maybe should've made a function huh

local clpid = {}
local bmonke = {}
local wmonke = {}
local schop = {}
local soldchop = {}
local sshark = {}
local sshark2 = {}
local swhale = {}
local inputm = {}

local input_model

text(lpidspawn, "Input String", {"loadstring"}, "Set a ped's string, for exemple 'a_c_chop' for chop", function(input)
    input_model = util.joaat(input)
end, "")

action(lpidspawn, "Spawn String", {}, "", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    STREAMING.REQUEST_MODEL(input_model)
    while not STREAMING.HAS_MODEL_LOADED(input_model) do
        STREAMING.REQUEST_MODEL(input_model)
        util.yield()
    end
    inputm [#inputm + 1] = entities.create_ped(26, input_model, c, 0)
    if not STREAMING.HAS_MODEL_LOADED(input_model) then
        util.toast("Couldn't load the model")
    end
end)

action(lpidspawn, "Clear Peds", {}, "", function()
    for i = 1, #clpid do
        entities.delete_by_handle(clpid[i]) --delete clone
        clpid[i] = nil
    end

    for i = 1, #bmonke do
        entities.delete_by_handle(bmonke[i]) --delete black monkey
        bmonke[i] = nil
    end

    for i = 1, #wmonke do
        entities.delete_by_handle(wmonke[i]) --delete white monkey
        wmonke[i] = nil
    end

    for i = 1, #schop do
        entities.delete_by_handle(schop[i]) --delete chop
        schop[i] = nil
    end

    for i = 1, #soldchop do
        entities.delete_by_handle(soldchop[i]) --delete shark
        soldchop[i] = nil
    end

    for i = 1, #sshark do
        entities.delete_by_handle(sshark[i]) --delete shark
        sshark[i] = nil
    end

    for i = 1, #sshark2 do
        entities.delete_by_handle(sshark2[i]) --delete shark
        sshark2[i] = nil
    end

    for i = 1, #swhale do
        entities.delete_by_handle(swhale[i]) --delete shark
        swhale[i] = nil
    end

    for i = 1, #inputm do
        entities.delete_by_handle(inputm[i]) --delete input model
        inputm[i] = nil
    end
end)

action(saved, "Clone", {}, "Spawns a clone of you", function()
    clpid [#clpid + 1] = PED.CLONE_PED(players.user_ped(), true, true, true) --spawns clone
end)

action(saved, "Black monkey", {}, "Spawns a black monkey", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    STREAMING.REQUEST_MODEL(BlackMonke)
    while not STREAMING.HAS_MODEL_LOADED(BlackMonke) do
        STREAMING.REQUEST_MODEL(BlackMonke)
        util.yield(10)
    end
    bmonke [#bmonke + 1] = entities.create_ped(26, BlackMonke, c, 0) --spawns black monkey
    if not STREAMING.HAS_MODEL_LOADED(BlackMonke) then
        util.toast("Couldn't load the model")
    end
end)

action(saved, "White monkey", {}, "Spawns a white monkey", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    STREAMING.REQUEST_MODEL(WhiteMonke)
    while not STREAMING.HAS_MODEL_LOADED(WhiteMonke) do
        STREAMING.REQUEST_MODEL(WhiteMonke)
        util.yield(10)
    end
    wmonke [#wmonke + 1] = entities.create_ped(26, WhiteMonke, c, 0) --spawns white monkey
    if not STREAMING.HAS_MODEL_LOADED(WhiteMonke) then
        util.toast("Couldn't load the model")
    end
end)

action(saved, "Chop", {}, "Spawns chop as a pet", function()
    local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user_ped())
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    STREAMING.REQUEST_MODEL(chop)
    while not STREAMING.HAS_MODEL_LOADED(chop) do
        STREAMING.REQUEST_MODEL(chop)
        util.yield(10)
    end
    local spawnedchop = entities.create_ped(26, chop, c, 0)
    schop [#schop + 1] = spawnedchop --spawns chop
    PED.SET_PED_AS_GROUP_MEMBER(spawnedchop, PED.GET_PED_GROUP_INDEX(PLAYER.PLAYER_PED_ID()))  --makes chop follow you 
    PED.SET_PED_NEVER_LEAVES_GROUP(spawnedchop, true)
    PED.SET_PED_CONFIG_FLAG(spawnedchop, 24, true)
    local chopblip = HUD.ADD_BLIP_FOR_ENTITY(spawnedchop)
    HUD.SET_BLIP_SPRITE(chopblip, 273)
    PED.SET_PED_AS_GROUP_MEMBER(schop, PED.GET_PED_GROUP_INDEX(PLAYER.PLAYER_PED_ID()))
    PED.SET_PED_NEVER_LEAVES_GROUP(schop, true)
    if not STREAMING.HAS_MODEL_LOADED(chop) then
        util.toast("Couldn't load the model")
    end
end)

action(saved, "Old Chop", {}, "Spawns chop as a pet but older", function()
    local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user_ped())
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    STREAMING.REQUEST_MODEL(oldchop)
    while not STREAMING.HAS_MODEL_LOADED(oldchop) do
        STREAMING.REQUEST_MODEL(oldchop)
        util.yield(10)
    end
    local spawnedoldchop = entities.create_ped(26, oldchop, c, 0)
    soldchop [#soldchop + 1] = spawnedoldchop --spawns chop
    PED.SET_PED_AS_GROUP_MEMBER(spawnedoldchop, PED.GET_PED_GROUP_INDEX(PLAYER.PLAYER_PED_ID()))  --makes chop follow you
    PED.SET_PED_NEVER_LEAVES_GROUP(spawnedoldchop, true)
    PED.SET_PED_CONFIG_FLAG(spawnedoldchop, 24, true)
    local oldchopblip = HUD.ADD_BLIP_FOR_ENTITY(spawnedoldchop)
    HUD.SET_BLIP_SPRITE(oldchopblip, 273)
    if not STREAMING.HAS_MODEL_LOADED(oldchop) then
        util.toast("Couldn't load the model")
    end
end)

action(saved, "Shark", {}, "Spawns a shark", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    STREAMING.REQUEST_MODEL(shark)
    while not STREAMING.HAS_MODEL_LOADED(shark) do
        STREAMING.REQUEST_MODEL(shark)
        util.yield(10)
    end
    sshark [#sshark + 1] = entities.create_ped(26, shark, c, 0) --spawns a shark
    if not STREAMING.HAS_MODEL_LOADED(shark) then
        util.toast("Couldn't load the model")
    end
end)

action(saved, "Shark 2", {}, "Spawns a shark but not the same", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    STREAMING.REQUEST_MODEL(shark2)
    while not STREAMING.HAS_MODEL_LOADED(shark2) do
        STREAMING.REQUEST_MODEL(shark2)
        util.yield(10)
    end
    sshark2 [#sshark2 + 1] = entities.create_ped(26, shark2, c, 0) --spawns a shark2
    if not STREAMING.HAS_MODEL_LOADED(shark2) then
        util.toast("Couldn't load the model")
    end
end)

action(saved, "Whale", {}, "Spawns a whale", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    STREAMING.REQUEST_MODEL(whale)
    while not STREAMING.HAS_MODEL_LOADED(whale) do
        STREAMING.REQUEST_MODEL(whale)
        util.yield(10)
    end
    swhale [#swhale + 1] = entities.create_ped(26, whale, c, 0) --spawns a whale
    if not STREAMING.HAS_MODEL_LOADED(whale) then
        util.toast("Couldn't load the model")
    end
end)

---------------
--WORLD
---------------

--help me

toggleloop(world, "Alien invasion", {}, "", function(toggle)
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    local r = num[math.random(#num)]
    c.x = math.random(0.0,1.0) >= 0.5 and c.x + r + 5 or c.x - r - 5 --set x coords
    c.y = math.random(0.0,1.0) >= 0.5 and c.y + r + 5 or c.y - r - 5 --set y coords
    c.z = c.z + r + 8 --set z coords
    STREAMING.REQUEST_MODEL(ufo)
    while not STREAMING.HAS_MODEL_LOADED(ufo) do
        STREAMING.REQUEST_MODEL(ufo)
        util.yield()
    end
    util.yield(2500)
    local spawnedufo = entities.create_object(ufo, c) --spawn ufo
    util.yield(500)
    local ufoc = ENTITY.GET_ENTITY_COORDS(spawnedufo) --get ufo pos
    local success, floorcoords
    repeat
        success, floorcoords = util.get_ground_z(ufoc.x, ufoc.y) --get floor pos
        util.yield()
    until success
    FIRE.ADD_EXPLOSION(ufoc.x, ufoc.y, floorcoords, exp, 100.0, true, false, 1.0, false) --explode at floor
    util.yield(1500)
    entities.delete_by_handle(spawnedufo) --delete ufo

    if not STREAMING.HAS_MODEL_LOADED(ufo) then
        util.toast("Couldn't load the model")
    end
end)

toggle(world, "Riot Mode", {}, "", function(toggle)
    MISC.SET_RIOT_MODE_ENABLED(toggle)
end)

action(world, "Spawn a ball", {}, "Spawns a ball at maze bank (no idea why that would be useful but there you have it)", function()
    STREAMING.REQUEST_MODEL(bigasscircle)
    while not STREAMING.HAS_MODEL_LOADED(bigasscircle) do
        STREAMING.REQUEST_MODEL(bigasscircle)
        util.yield()
    end
    c1 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751)) --why tables when ctrl + c, ctrl + v
    c2 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c3 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c4 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c5 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c6 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c7 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c8 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c9 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c10 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c11 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c12 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c13 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c14 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c15 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c16 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c17 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c18 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    c19 = entities.create_object(bigasscircle, v3(-75.14637, -818.67236, 326.1751))
    ENTITY.FREEZE_ENTITY_POSITION(c1, true)
    ENTITY.FREEZE_ENTITY_POSITION(c2, true)
    ENTITY.FREEZE_ENTITY_POSITION(c3, true)
    ENTITY.FREEZE_ENTITY_POSITION(c4, true)
    ENTITY.FREEZE_ENTITY_POSITION(c5, true)
    ENTITY.FREEZE_ENTITY_POSITION(c6, true)
    ENTITY.FREEZE_ENTITY_POSITION(c7, true)
    ENTITY.FREEZE_ENTITY_POSITION(c8, true)
    ENTITY.FREEZE_ENTITY_POSITION(c9, true)
    ENTITY.FREEZE_ENTITY_POSITION(c10, true)
    ENTITY.FREEZE_ENTITY_POSITION(c11, true)
    ENTITY.FREEZE_ENTITY_POSITION(c12, true)
    ENTITY.FREEZE_ENTITY_POSITION(c13, true)
    ENTITY.FREEZE_ENTITY_POSITION(c14, true)
    ENTITY.FREEZE_ENTITY_POSITION(c15, true)
    ENTITY.FREEZE_ENTITY_POSITION(c16, true)
    ENTITY.FREEZE_ENTITY_POSITION(c17, true)
    ENTITY.FREEZE_ENTITY_POSITION(c18, true)
    ENTITY.FREEZE_ENTITY_POSITION(c19, true)
    ENTITY.SET_ENTITY_ROTATION(c2, 0.0, 0.0, 10.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c3, 0.0, 0.0, 20.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c4, 0.0, 0.0, 30.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c5, 0.0, 0.0, 40.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c6, 0.0, 0.0, 50.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c7, 0.0, 0.0, 60.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c8, 0.0, 0.0, 70.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c9, 0.0, 0.0, 80.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c10, 0.0, 0.0, 90.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c11, 0.0, 0.0, 100.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c12, 0.0, 0.0, 110.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c13, 0.0, 0.0, 120.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c14, 0.0, 0.0, 130.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c15, 0.0, 0.0, 140.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c16, 0.0, 0.0, 150.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c18, 0.0, 0.0, 160.0, 1, true)
    ENTITY.SET_ENTITY_ROTATION(c19, 0.0, 0.0, 170.0, 1, true)
    ENTITY.SET_ENTITY_COORDS(players.user_ped(), -75.14637, -818.67236, 326.1751)
end)

action(world, "Delete ball", {}, "still dont know", function()
    entities.delete_by_handle(c1)
    entities.delete_by_handle(c2)
    entities.delete_by_handle(c3)
    entities.delete_by_handle(c4)
    entities.delete_by_handle(c5)
    entities.delete_by_handle(c6)
    entities.delete_by_handle(c7)
    entities.delete_by_handle(c8)
    entities.delete_by_handle(c9)
    entities.delete_by_handle(c10)
    entities.delete_by_handle(c11)
    entities.delete_by_handle(c12)
    entities.delete_by_handle(c13)
    entities.delete_by_handle(c14)
    entities.delete_by_handle(c15)
    entities.delete_by_handle(c16)
    entities.delete_by_handle(c17)
    entities.delete_by_handle(c18)
    entities.delete_by_handle(c19)
end)

---------------
--HUD
---------------

toggleloop(HUDlist, "Show Axis", {}, "", function(toggle)
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    GRAPHICS.DRAW_LINE(c.x, c.y, c.z, c.x + 2, c.y, c.z, 255, 0, 0, 255) --x
    GRAPHICS.DRAW_LINE(c.x, c.y, c.z, c.x, c.y + 2, c.z, 0, 255, 0, 255) --y
    GRAPHICS.DRAW_LINE(c.x, c.y, c.z, c.x, c.y, c.z + 2, 0, 0, 255, 255) --z
end)

toggle(HUDlist, "Disable Chat", {}, "", function(toggle)
    local isChatActive = toggle
    if (isChatActive == true) then
        HUD._MULTIPLAYER_CHAT_SET_DISABLED(true) --chat off
    else
        HUD._MULTIPLAYER_CHAT_SET_DISABLED(false) --chat on
    end
end)

toggleloop(HUDlist, "Permanant crosshair", {}, "", function(toggle)
    directx.draw_text(0.4977, 0.495, ".", ALIGN_CENTRE, 0.834, {r= 100.0, g = 100.0, b = 100.0, a = 1.0}, false)
    --CAM._ENABLE_CROSSHAIR_THIS_FRAME()
end)

---------------
--FREEMODE
---------------

action(freemodelist, "Win Criminal Damage", {}, "Win criminal damage everytime", function()
    local cartable = {}

    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    local defz = c.z 
    STREAMING.REQUEST_MODEL(expcar)
    while not STREAMING.HAS_MODEL_LOADED(expcar) do
        STREAMING.REQUEST_MODEL(expcar)
        util.yield()
    end
    STREAMING.REQUEST_MODEL(floorbr)
    while not STREAMING.HAS_MODEL_LOADED(floorbr) do
        STREAMING.REQUEST_MODEL(floorbr)
        util.yield()
    end
    local success, floorcoords
    repeat
        success, floorcoords = util.get_ground_z(c.x, c.y)
        util.yield()
    until success
    floorcoords = floorcoords - 100
    c.z = floorcoords
    local floorrig = entities.create_object(floorbr, c) --spawn floor
    c.z = defz
    c.z = c.z - 95
    for i = 1, 22 do
        cartable[#cartable + 1] = entities.create_vehicle(expcar, c, 0) --spawn cars
    end
    util.yield(1000)
    FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), c.x, c.y, floorcoords, exp, 100.0, false, false, 0.0) --explode cars
    util.yield(500)
    entities.delete_by_handle(floorrig)
    util.yield(1000)

    for i = 1, #cartable do
        entities.delete_by_handle(cartable[i]) --delete cars
        cartable[i] = nil
    end
end)

toggleloop(freemodelist, "Win Checkpoints", {}, "Win Checkpoints everytime", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    local dblip = HUD.GET_NEXT_BLIP_INFO_ID(431)
    local cdblip = HUD.GET_BLIP_COORDS(dblip)
    ENTITY.SET_ENTITY_COORDS(players.user_ped(), cdblip.x, cdblip.y, cdblip.z, false, false, false, false)
    util.yield(1500)
end)

---------------
--ONLINE
---------------

local togglestate = false

toggle(online, "Smooth fall", {}, "", function(toggle)
    local graceRef = refbypass("Self>Gracefulness")
    local valueragdoll = getvalue(graceRef)
    togglestate = toggle
    while(togglestate) do
        while(PED.IS_PED_FALLING(players.user_ped())) do
            local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
            local floorcoords, success
            repeat
                success, floorcoords = util.get_ground_z(c.x, c.y)
                util.yield()
            until success
            if(c.z >= floorcoords + 5) then
                if not (c.z >= floorcoords + 7) then
                    if(valueragdoll) then --baguette
                        TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
                    else
                        menu.trigger_commands("grace on")
                    end
                end
            end
            util.yield()
        end
        util.yield()
    end
end)

---------------
--CREDITS
---------------

divider(credits, "Created by")

action(credits, "Cxbr#3750", {}, "", function()
    return
end)

divider(credits, "Helped by")

action(credits, "Goddess Sainan#0001", {}, "", function()
    return
end)
action(credits, "Maddy#6666", {}, "", function()
    return
end)
action(credits, "Nowiry#2663", {}, "", function()
    return
end)
action(credits, "Sapphire#6031", {}, "", function()
    return 
end)
action(credits, "aaronlink127#0127", {}, "", function()
    return
end)
action(credits, "well in that case#0082", {}, "", function()
    return
end)
action(credits, "jerry123#4508", {}, "", function()
    return
end)
action(credits, "JayMontana36#9565", {}, "", function()
    return
end)
action(credits, "scriptcat#6566", {}, "", function()
    return
end)
action(credits, "Ren#5219", {}, "", function()
    return
end)

divider(credits, "Testers")

action(credits, "Axorcia", {}, "", function()
    return
end)
action(credits, "XDMelone333#3535", {}, "", function()
    return
end)
action(credits, "XDBinhoXD#6255", {}, "", function()
    return
end)
action(credits, "Nightx#9858", {}, "", function()
    return
end)
action(credits, "NourElDin#7865", {}, "", function()
    return
end)
action(credits, "Stark_Mark_0-0#6973", {}, "", function()
    return
end)
action(credits, "JackJack#1857", {}, "", function()
    return
end)

---------------
--LOAD ON JOIN
---------------

--only nice code in the whole ass script

players.on_join(playerslist)
players.dispatch_on_join()