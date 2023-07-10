loadtimestart = util.current_time_millis()
util.keep_running()
util.require_natives(1651208000)

veh = 0

menu.divider(menu.my_root(), 'Fun menu' )

--------------directory--------------
	local funmenudir = filesystem.store_dir().."funmenu\\"
	local funmenulangdir = funmenudir.."lang\\"
	local settingdir = funmenudir.."funmenuconfig.ini"
	local speedmeterneedle = funmenudir.."Needledefault.dds"
	local speedmeterradiant = funmenudir.."Speedometerdefault.dds"
	local speedmeterrpmraddiant = funmenudir.."RPM.dds"
	local speedmeterneedlecherax = funmenudir.."Needlecherax.dds"
	local speedmeterradiantcherax = funmenudir.."Speedometercherax.dds"
	local speedmeterrrpmcherax = funmenudir.."RPMcherax.dds"

	local enlang = funmenulangdir.."Englishtrad.lua"
	local frlang = funmenulangdir.."Frenchtrad.lua"

	if not filesystem.exists(funmenudir) then
            filesystem.mkdir(funmenudir)
    end
	if not filesystem.exists(funmenulangdir) then
            filesystem.mkdir(funmenulangdir)
    end
	if not filesystem.exists(settingdir) then
                local open = io.open(settingdir, "w+")
                open:write("Unknown")
                open:close()
    end
--------------directory end--------------
xscreensize, yscreensize = directx.get_client_size()
function requestControlLoop(entity)
	local tick = 0
	while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick < 25 do
		util.yield()
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
		tick = tick + 1
	end
	if NETWORK.NETWORK_IS_SESSION_STARTED() then
		local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
		NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netId, true)
	end
end
function rotateentity(entity, rotation)
	while not ENTITY.GET_ENTITY_HEADING(veh) == rotation do
		requestControlLoop(entity)
		ENTITY.SET_ENTITY_HEADING(entity, rotation)
		util.yield(1000)
	end
end
function requestModels(...)
	local arg = {...}
	for _, model in ipairs(arg) do
		if not STREAMING.IS_MODEL_VALID(model) then
			error("tried to request an invalid model")
		end
		STREAMING.REQUEST_MODEL(model)
		while not STREAMING.HAS_MODEL_LOADED(model) do
			util.yield()
		end
	end
end
function requestweapon(...)
	local arg = {...}
	for _, model in ipairs(arg) do
		WEAPON.REQUEST_WEAPON_ASSET(model, 31, 26)
		while not WEAPON.HAS_WEAPON_ASSET_LOADED(model) do
			util.yield()
		end
	end
end
function attachweapon(spawnweapon)
	if (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == 416676503) or (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == 690389602) then
		ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x192A), 0.15, 0, 0.13, 270, 0, 0, false, true, false, false, 1, true)
	end
	if (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == -728555052) or (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == -1609580060) then
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_bat")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x60F2), 0.3, -0.18, -0.15, 0, 300, 0, false, true, false, false, 1, true)
		end
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_crowbar")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x192A), 0.2, 0, 0.13, 0, 270, 90, false, true, false, false, 1, true)
		end
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_battleaxe")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x60F2), 0.2, -0.18, -0.1, 0, 300, 0, false, true, false, false, 1, true)
		end
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_golfclub")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x60F2), 0.2, -0.18, -0.1, 0, 300, 0, false, true, false, false, 1, true)
		end
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_hatchet")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x60F2), 0.2, -0.18, -0.1, 0, 300, 0, false, true, false, false, 1, true)
		end
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_poolcue")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x60F2), -0.2, -0.18, 0.1, 0, 120, 0, false, true, false, false, 1, true)
		end
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_stone_hatchet")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x60F2), 0.2, -0.18, -0.1, 0, 300, 0, false, true, false, false, 1, true)
		end
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_knuckle")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x192A), 0.2, 0, 0.13, 0, 270, 90, false, true, false, false, 1, true)
		end
		if not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_bat"))  and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_crowbar")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_battleaxe"))and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_golfclub")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_hatchet")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_poolcue")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_stone_hatchet")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_knuckle")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x192A), 0, 0, 0.13, 0, 90, 270, false, true, false, false, 1, true)
		end
	end
	if (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == 1548507267) or (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == -37788308) or (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == 1595662460) then	
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_petrolcan")) or (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_hazardcan")) or (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_fertilizercan")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x60F2), 0, -0.18, -0, 0, 90, 0, false, true, false, false, 1, true)
		end
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_proxmine")) or (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_stickybomb")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x192A), 0.2, 0, 0.13, 0, 0, 270, false, true, false, false, 1, true)
		end
		if (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_fireextinguisher")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x192A), 0, -0.05, 0.13, 0, 270, 90, false, true, false, false, 1, true)
		end
		if not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_petrolcan")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_hazardcan")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_fertilizercan")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_proxmine")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_stickybomb")) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == util.joaat("weapon_fireextinguisher")) then
			ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x192A), 0.2, 0, 0.13, 0, 270, 270, false, true, false, false, 1, true)
		end
	end

	if not (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == 416676503) and not (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == 690389602) and not (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == -728555052) and not (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == -1609580060) and not (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == 1548507267) and not (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == -37788308) and not (WEAPON.GET_WEAPONTYPE_GROUP(HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())) == 1595662460) then
		ENTITY.ATTACH_ENTITY_TO_ENTITY(spawnweapon, plyped(), PED.GET_PED_BONE_INDEX(plyped(), 0x60F2), 0, -0.18, 0, 180, 220, 0, false, true, false, false, 1, true)
	end
end
function fixveh( vehicle )
	vel = ENTITY.GET_ENTITY_VELOCITY(vehicle)
	VEHICLE.SET_VEHICLE_FIXED(vehicle)
	VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, 1000)
	ENTITY.SET_ENTITY_VELOCITY(vehicle, vel.x, vel.y, vel.z)
end
function getveh( plid )
	vehonline = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(plid), true)
	return vehonline
end
function plyped()
	return PLAYER.PLAYER_PED_ID()
end
function disableocclusion(status)
	local peds = entities.get_all_peds_as_handles()
	for _, ped in ipairs(peds) do
		if ENTITY.DOES_ENTITY_EXIST(ped) then
			PED.SET_PED_AO_BLOB_RENDERING(ped, status)
		end
	end
end
function driveitgun ()
	local vehicules = entities.get_all_vehicles_as_handles()
	for _, vehicule in ipairs(vehicules) do
		if ENTITY.DOES_ENTITY_EXIST(vehicule) then
			if PAD.IS_CONTROL_PRESSED(1, 23) then
				if PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(PLAYER.PLAYER_ID(), vehicule) then
					PED.SET_PED_INTO_VEHICLE(plyped(), vehicule, -1)
				end
			end
		end
	end
end
function deletegun ()
	local peds = entities.get_all_peds_as_handles()
	local vehicules = entities.get_all_vehicles_as_handles()
	local objects = entities.get_all_objects_as_handles()
	for _, ped in ipairs(peds) do
		if ENTITY.DOES_ENTITY_EXIST(ped) then
			if PAD.IS_CONTROL_PRESSED(1, 178) then
				if PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(PLAYER.PLAYER_ID(), ped) then
					entities.delete_by_handle(ped)
				end
			end
		end
	end
	for _, vehicule in ipairs(vehicules) do
		if ENTITY.DOES_ENTITY_EXIST(vehicule) then
			if PAD.IS_CONTROL_PRESSED(1, 178) then
				if PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(PLAYER.PLAYER_ID(), vehicule) then
					entities.delete_by_handle(vehicule)
				end
			end
		end
	end
	for _, object in ipairs(objects) do
		if ENTITY.DOES_ENTITY_EXIST(object) then
			if PAD.IS_CONTROL_PRESSED(1, 178) then
				if PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(PLAYER.PLAYER_ID(), object) then
					entities.delete_by_handle(object)
				end
			end
		end
	end
end
function spawnplaneforattack(posforplane, playerplane, zspawnplus, headingspawn)
	planehash = util.joaat("Lazer")
	requestModels(planehash)
	spawnplanef = VEHICLE.CREATE_VEHICLE(planehash, posforplane.x, posforplane.y, posforplane.z+zspawnplus, headingspawn, true, false)
	VEHICLE.SET_VEHICLE_ENGINE_ON(spawnplanef, true, true, true)
	spawnpedforplane = PED.CREATE_RANDOM_PED(posplane.x, posplane.y, posplane.z)
	PED.SET_PED_INTO_VEHICLE(spawnpedforplane, spawnplanef, -1)
	TASK.TASK_PLANE_MISSION(spawnpedforplane, spawnplanef, 0, playerplane, posforplane.x, posforplane.y, posforplane.z, 6, 0, 0, 0, 30, 500)
	return spawnplanef
end
function delattackplane(model)
	local hash = util.joaat(model)
	local vehicles = entities.get_all_vehicles_as_handles()
	for _, vehicle in ipairs(vehicles) do
		if ENTITY.DOES_ENTITY_EXIST(vehicle) and ENTITY.GET_ENTITY_MODEL(vehicle) == hash then
			local ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)
			if not PED.IS_PED_A_PLAYER(ped) then
				requestControlLoop(vehicle)
				requestControlLoop(ped)
				entities.delete_by_handle(vehicle)
				entities.delete_by_handle(ped)
			end
		end
	end
end
function spawnpedattack(playerattack, modelpedattack, numberped, invincbleped, invisibleped, onplayer)
	numberloop = numberped
	if (modelpedattack == 0) or not STREAMING.IS_MODEL_VALID(util.joaat(modelpedattack)) then
		hashpedattack = util.joaat("ig_chrisformage")
	else
		hashpedattack = util.joaat(modelpedattack)
	end
	requestModels(hashpedattack)
	while not (numberloop == -1)do
		posformage = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerattack))
		if onplayer then
			spawnpedattacks = PED.CREATE_PED(0, hashpedattack, posformage.x, posformage.y, posformage.z, 0, true, false)
		else
			spawnpedattacks = PED.CREATE_PED(0, hashpedattack, posformage.x+math.random(-10, 10), posformage.y+math.random(-10, 10), posformage.z, 0, true, false)
		end
		if  invincbleped then
			ENTITY.SET_ENTITY_INVINCIBLE(spawnpedattacks, true)
		end
		if  invisibleped then
			ENTITY.SET_ENTITY_VISIBLE(spawnpedattacks, false, false)
		end
		PED.SET_PED_DEFAULT_COMPONENT_VARIATION(spawnpedattacks)
		WEAPON.GIVE_DELAYED_WEAPON_TO_PED(spawnpedattacks, util.joaat("WEAPON_PISTOL"), 9999, true)
		PED.SET_PED_AS_COP(spawnpedattacks, true)
		TASK.TASK_COMBAT_PED(spawnpedattacks, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerattack), 0, 16)
		numberloop = numberloop-1
		util.yield(100)
	end
end
function getmenuvalueplayer(playerid, path)
	return menu.get_value(menu.ref_by_path("Players>"..players.get_name_with_tags(playerid)..">"..path))
end
function getmenuvalue(path)
	return menu.get_value(menu.ref_by_path("Stand>Lua Scripts>"..SCRIPT_NAME..">"..path))
end

function readlangfile()					--credit for lang changing code goes to IceDoomfist hope he don't mind
	local open = io.open(settingdir)
	return open:read("*a"), open:close()
end
function writelangfile(Language)
	local open = io.open(settingdir, "w+")
	open:write(Language)
	open:close()
end
function loadlangfile(Dir, Lang)
	if filesystem.exists(Dir) then
		dofile(Dir)
	else
		util.toast(Lang.." language file doesn't exist.")
		util.toast("Fatal script error stopping script")
		util.stop_script()
	end
end
function warning(Command_ID, langwrite)
	menu.show_warning(Command_ID, CLICK_MENU, RESTART_MESS, function()
	writelangfile(langwrite)
	util.stop_script()
	end)
end

if readlangfile() == "Unknown" then
	if menu.get_language() == "fr" then
		writelangfile("French - français")
	else
		writelangfile("English")
	end
end

if readlangfile() == "French - français" then
	loadlangfile(frlang, "French")
	actuallang = "French"
else
	loadlangfile(enlang, "English")
	actuallang = "English"
end

speedmeterradiantid = directx.create_texture(speedmeterradiant)
speedmetterneedleid = directx.create_texture(speedmeterneedle)
speedmeterrpmraddiantid = directx.create_texture(speedmeterrpmraddiant)
speedmeterradiantidcherax = directx.create_texture(speedmeterradiantcherax)
speedmetterneedleidcherax = directx.create_texture(speedmeterneedlecherax)
speedmeterrrpmidcherax = directx.create_texture(speedmeterrrpmcherax)


--------------self menu--------------
local selfmenu = menu.list(menu.my_root(), SELF_MENU, {}, "")
local selfdecalmenu = menu.list(selfmenu, "Decal", {}, "")

nofalldama = off
menu.toggle(selfmenu, NO_FALL_DAMAGE, {}, "", function(on)
    nofalldama = on
	while nofalldama do
		PLAYER._SET_PLAYER_FALL_DISTANCE(PLAYER.PLAYER_ID(), 10000)
		util.yield()
	end
	PLAYER._SET_PLAYER_FALL_DISTANCE(PLAYER.PLAYER_ID(), 10)
end, false)

nocritical = off
menu.toggle(selfmenu, NO_CRITICAL, {}, "", function(on)
    nocritical = on
	while nocritical do
		PED.SET_PED_SUFFERS_CRITICAL_HITS(PLAYER.PLAYER_PED_ID(), false)
		util.yield()
	end
	PED.SET_PED_SUFFERS_CRITICAL_HITS(PLAYER.PLAYER_PED_ID(), true)
end, false)

unlimair = off
menu.toggle(selfmenu, UNLIM_AIR, {}, "", function(on)
    unlimair = on
	while unlimair do 
		PED.SET_PED_DIES_IN_WATER(PLAYER.PLAYER_PED_ID(), false)
		PED.SET_PED_DIES_IN_SINKING_VEHICLE(PLAYER.PLAYER_PED_ID(), false)
		util.yield()
	end
	PED.SET_PED_DIES_IN_WATER(PLAYER.PLAYER_PED_ID(), true)
	PED.SET_PED_DIES_IN_SINKING_VEHICLE(PLAYER.PLAYER_PED_ID(), true)
end, false)

menu.action(selfdecalmenu, "clear all decal", {}, "Warning somme cannot be cleared", function()
	PED.CLEAR_PED_DAMAGE_DECAL_BY_ZONE(plyped(), 1--[[damagezone]], "all"--[[decalName]])
end)

damagedecal = 1
menu.slider(selfdecalmenu, "Damage zone", {""}, "0 = Torso, 1 = Head, 2 = Left arm, 3 = Right arm, 4 = Left leg, 5 = Right leg", 0, 5, 1, 1, function(s)
	damagedecal = s
end)

xposdecal = 0.5
menu.slider(selfdecalmenu, "X coord", {""}, "Horizon", 0, 100, 50, 1, function(s)
	sf = s/100
	xposdecal = sf
end)

yposdecal = 0.5
menu.slider(selfdecalmenu, "Y coord", {""}, "Vertical", 0, 100, 50, 1, function(s)
	sf = s/100
	yposdecal = sf
end)

headingdecal = 0
menu.slider(selfdecalmenu, "Rotation", {""}, "", 0, 359, 0, 1, function(s)
	headingdecal = s
end)

scaledecal = 1
menu.slider(selfdecalmenu, "Scale", {""}, "", 0, 300, 10, 1, function(s)
	sf = s/10
	scaledecal = sf
end)

variationdecal = 0
menu.slider(selfdecalmenu, "Variation", {""}, " scar: 13 variation, blushing: no limit ?, cs_flush_anger: 0 variation, cs_flush_anger_face: no limit ?, bruise: no limit ?, bruise_large: no limit ?, herpes: 0 variation, ArmorBullet: no limit ?, basic_dirt_cloth: no limit ?, basic_dirt_skin: no limit ?, cs_trev1_dirt: 13 variation", 0, 300, 0, 1, function(s)
	
	variationdecal = s
end)

decaltype = ""
menu.slider(selfdecalmenu, "Decal type", {""}, "1 = scar, 2 = blushing, 3 = cs_flush_anger, 4 = cs_flush_anger_face, 5 = bruise, 6 = bruise_large, 7 = herpes, 8 = ArmorBullet, 9 = basic_dirt_cloth, 10 = basic_dirt_skin, 11 = cs_trev1_dirt", 1, 11, 1, 1, function(s)
	if s == 1 then
		decaltype = "scar"
	end
	if s == 2 then
		decaltype = "blushing"
	end
	if s == 3 then
		decaltype = "cs_flush_anger"
	end
	if s == 4 then
		decaltype = "cs_flush_anger_face"
	end
	if s == 5 then
		decaltype = "bruise"
	end
	if s == 6 then
		decaltype = "bruise_large"
	end
	if s == 7 then
		decaltype = "herpes"
	end
	if s == 8 then
		decaltype = "ArmorBullet"
	end
	if s == 9 then
		decaltype = "basic_dirt_cloth"
	end
	if s == 10 then
		decaltype = "basic_dirt_skin"
	end
	if s == 11 then
		decaltype = "cs_trev1_dirt"
	end
end)

menu.action(selfdecalmenu, "add decal", {}, "", function()
	PED.APPLY_PED_DAMAGE_DECAL(plyped()--[[ped]], damagedecal--[[damagezone]], xposdecal--[[xOffset]], yposdecal--[[yOffset]], headingdecal--[[heading]], scaledecal--[[scale]], 1--[[alpha]], variationdecal--[[variation]], 0--[[fadeIn]], decaltype--[[decalName]])
end)

pednerf = off
menu.toggle(selfmenu, PED_NERF, {}, PED_NERF_DESC, function(on)
	pednerf = on
	while pednerf do
		PED.SET_AI_WEAPON_DAMAGE_MODIFIER(0)
		PED.SET_AI_MELEE_WEAPON_DAMAGE_MODIFIER(0)
		util.yield()
	end
		PED.SET_AI_WEAPON_DAMAGE_MODIFIER(1)
		PED.SET_AI_MELEE_WEAPON_DAMAGE_MODIFIER(1)
end)
specialability = menu.toggle_loop(selfmenu, INF_SPECIAL, {}, "", function()
	PLAYER.SPECIAL_ABILITY_FILL_METER(PLAYER.PLAYER_ID(), true)
end)


--------------self menu end--------------

--------------vehicle menu--------------

local vehmenu = menu.list(menu.my_root(), VEHICULE_MENU, {}, "")
local vehflymenu = menu.list(vehmenu, VEH_FLY_SUBMENU, {}, "")
local vehspeedmettermenu = menu.list(vehmenu, SPEED_METTER, {}, "")
local vehspeedmettersettingmenu = menu.list(vehspeedmettermenu, SPEED_METTER_SETTING, {}, "")
local vehspeedmettertexturemenu = menu.list(vehspeedmettermenu, SPEED_METTER_TEXTURE, {}, "")

vehflystop = off
menu.toggle(vehflymenu, VEH_FLY_STOP, {}, "", function(on)
    vehflystop = on
end)

menu.toggle_loop(vehmenu, VEH_FLY, {"vehfly"}, "", function(toggle)
if not (veh == 0) then
    rotation = CAM.GET_GAMEPLAY_CAM_ROT(2)
    ENTITY.SET_ENTITY_ROTATION(veh, rotation.x, rotation.y, rotation.z, 2, true)
	if not (PAD.IS_CONTROL_PRESSED(2, 34) or PAD.IS_CONTROL_PRESSED(2, 35) or PAD.IS_CONTROL_PRESSED(2, 21) or PAD.IS_CONTROL_PRESSED(2, 36) or PAD.IS_CONTROL_PRESSED(2, 32) or PAD.IS_CONTROL_PRESSED(2, 33)) and vehflystop then
		ENTITY.FREEZE_ENTITY_POSITION(veh, true)
	end

    if PAD.IS_CONTROL_PRESSED(2, 34) then   --left
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, -2, 0, 0, false, true, true, true)
		ENTITY.FREEZE_ENTITY_POSITION(veh, false)
    end

    if PAD.IS_CONTROL_PRESSED(2, 35) then   --right
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 2, 0, 0, false, true, true, true)
		ENTITY.FREEZE_ENTITY_POSITION(veh, false)
    end

    if PAD.IS_CONTROL_PRESSED(2, 21) then   --up
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 0, 0, 2, false, true, true, true)
		ENTITY.FREEZE_ENTITY_POSITION(veh, false)
    end

    if PAD.IS_CONTROL_PRESSED(2, 36) then   --down
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 0, 0, -2, false, true, true, true)
		ENTITY.FREEZE_ENTITY_POSITION(veh, false)
    end

    if PAD.IS_CONTROL_PRESSED(2, 32) then   --forward
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 0, 2, 0, false, true, true, true)
		ENTITY.FREEZE_ENTITY_POSITION(veh, false)
    end

    if PAD.IS_CONTROL_PRESSED(2, 33) then   --backward
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 0, -2, 0, false, true, true, true)
		ENTITY.FREEZE_ENTITY_POSITION(veh, false)
    end
	ENTITY.FREEZE_ENTITY_POSITION(veh, false)
end
end)

coordscreenspeedmetterx = 800
menu.slider(vehspeedmettersettingmenu, X_SPEED_METTER, {"xcoordspeedmetter"}, "", 0, xscreensize, 800, 1, function(s)
    coordscreenspeedmetterx = s
 end)

coordscreenspeedmettery = 800
menu.slider(vehspeedmettersettingmenu, Y_SPEED_METTER, {"ycoordspeedmetter"}, "", 0, yscreensize, 800, 1, function(s)
    coordscreenspeedmettery = s
 end)
alphaspeedmetter = 1
menu.slider(vehspeedmettersettingmenu, A_SPEED_METTER, {"alphaspeedometter"}, "", 1, 100, 100, 1, function(s)
	sf = s/100
    alphaspeedmetter = sf
 end)

sizespeedmetter = 0.05
menu.slider(vehspeedmettersettingmenu, S_SPEED_METTER, {"sizespeedometter"}, "", 1, 100, 5, 1, function(s)
	sf = s/100
    sizespeedmetter = sf
 end)

speedmettertexture = 0
menu.toggle(vehspeedmettertexturemenu, DEFAULT_SPEED_METTER_TEXTURE, {"speedmeterdefault"}, "", function()
	if (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..CHERAX_SPEED_METTER_TEXTURE) == 1) and (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..DEFAULT_SPEED_METTER_TEXTURE) == 1) then
		menu.trigger_commands("speedmetercherax off")
	end
	if (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..DEFAULT_SPEED_METTER_TEXTURE) == 1) then
		speedmettertexture = 0  
	end
	if (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..DEFAULT_SPEED_METTER_TEXTURE) == 0) and (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..CHERAX_SPEED_METTER_TEXTURE) == 0) then
		menu.trigger_commands("speedmeterdefault on")
	end
end, true)
menu.toggle(vehspeedmettertexturemenu, CHERAX_SPEED_METTER_TEXTURE, {"speedmetercherax"}, "", function()
	if (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..DEFAULT_SPEED_METTER_TEXTURE) == 1) and (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..CHERAX_SPEED_METTER_TEXTURE) == 1) then
		menu.trigger_commands("speedmeterdefault off")
	end
	if (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..CHERAX_SPEED_METTER_TEXTURE) == 1) then
		speedmettertexture = 1
	end
	if (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..DEFAULT_SPEED_METTER_TEXTURE) == 0) and (getmenuvalue(VEHICULE_MENU..">"..SPEED_METTER..">"..SPEED_METTER_TEXTURE..">"..CHERAX_SPEED_METTER_TEXTURE) == 0) then
		menu.trigger_commands("speedmetercherax on")
	end
end)

speedmetter = off
menu.toggle(vehspeedmettermenu, "Activate speedmetter", {}, "", function(on)
	speedmetter = on
	if speedmetter then
		alphaspeedmetterf = 0
	else
		alphaspeedmetterf = alphaspeedmetter
	end
	while speedmetter do
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
		if PED.IS_PED_IN_VEHICLE(plyped(), veh, true) then
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
		if not (alphaspeedmetterf == 0 ) and not PED.IS_PED_IN_VEHICLE(plyped(), veh, true)then
			alphaspeedmetterf = alphaspeedmetterf-0.01
			directx.draw_texture(radiantid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxfinal, coordscreenspeedmetteryfinal, 0, 1, 1, 1, alphaspeedmetterf)
			directx.draw_texture(needleid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxfinal, coordscreenspeedmetteryfinal, needlerot, 1, 1, 1, alphaspeedmetterf)
			directx.draw_texture(rpmradiantid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxrpmfinal, coordscreenspeedmetteryfinal, 0, 1, 1, 1, alphaspeedmetterf)
			directx.draw_texture(rpmneedleid, sizespeedmetter, 0.1, 0.5, 0.5, coordscreenspeedmetterxrpmfinal, coordscreenspeedmetteryfinal, needlerotrpm, 1, 1, 1, alphaspeedmetterf)
		end
		util.yield()
	end
	while not (alphaspeedmetterf < 0 ) and not speedmetter do
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
		util.yield()
	end
end)

menu.toggle_loop(vehmenu, AUTO_REPAIR, {}, "", function()
	if VEHICLE.GET_DOES_VEHICLE_HAVE_DAMAGE_DECALS(veh) or not VEHICLE.ARE_ALL_VEHICLE_WINDOWS_INTACT(veh) then
		fixveh(veh)
		util.yield(100)
	end
end)

hornboost = off
menu.toggle(vehmenu, HORN_BOOST, {}, "", function(on)
    hornboost = on
	while hornboost do
		if PAD.IS_CONTROL_PRESSED(86, 86) then
            pos = ENTITY.GET_ENTITY_SPEED(veh)
            hfclc = hornforce/100
            hornforcef = hfclc+1
			VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, pos*hornforcef)
		end
		util.yield()
	end
end)

hornforce = 1
menu.slider(vehmenu, HORN_BOOST_FORCE, {""}, "", 1, 9, 1, 1, function(s)
    hornforce = s
end)

menu.toggle_loop(vehmenu, SUPER_DRIVE, {""}, "", function()
	if PAD.IS_CONTROL_PRESSED(2, 32) then   --forward
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 0, 1, 0, false, true, true, true)
		ENTITY.FREEZE_ENTITY_POSITION(veh, false)
    end

    if PAD.IS_CONTROL_PRESSED(2, 33) then   --backward
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 0, -1, 0, false, true, true, true)
		ENTITY.FREEZE_ENTITY_POSITION(veh, false)
    end
end)

inviciblecarlight = off
menu.toggle(vehmenu, INVINC_CAR_LIGHT, {}, INVINC_CAR_LIGHT_DESC, function(on)
    inviciblecarlight = on
	while inviciblecarlight do
		VEHICLE.SET_VEHICLE_HAS_UNBREAKABLE_LIGHTS(veh, true)
		util.yield()
	end
	VEHICLE.SET_VEHICLE_HAS_UNBREAKABLE_LIGHTS(veh, false)
end)

nopop = off
menu.toggle(vehmenu, NO_CAR_POP, {}, "", function(on)
    nopop = on
	while nopop do
		AUDIO.ENABLE_VEHICLE_EXHAUST_POPS(veh, false)
		util.yield()
	end
	AUDIO.ENABLE_VEHICLE_EXHAUST_POPS(veh, true)
end)

menu.action(vehmenu, RAISE_ROOF, {}, "", function()
	VEHICLE.RAISE_CONVERTIBLE_ROOF(veh, true)
	util.yield(100)
	VEHICLE.RAISE_CONVERTIBLE_ROOF(veh, true)
end)

menu.action(vehmenu, LOWER_ROOF, {}, "", function()
	VEHICLE.LOWER_CONVERTIBLE_ROOF(veh, true)
end)


menu.toggle_loop(vehmenu, KEEP_ON, {}, KEEP_ON_DESC, function()
	if VEHICLE.IS_THIS_MODEL_A_HELI(ENTITY.GET_ENTITY_MODEL(veh)) or VEHICLE.IS_THIS_MODEL_A_PLANE(ENTITY.GET_ENTITY_MODEL(veh)) then
		VEHICLE.SET_HELI_BLADES_FULL_SPEED(veh)
	else
		VEHICLE.SET_VEHICLE_ENGINE_ON(veh, true, true, true)
	end
end)

menu.toggle_loop(vehmenu, NO_DEPTH_LIMIT, {}, NO_DEPTH_LIMIT_DESC, function()
	if ENTITY.GET_ENTITY_MODEL(veh) == util.joaat("submersible") or ENTITY.GET_ENTITY_MODEL(veh) == util.joaat("submersible2") or ENTITY.GET_ENTITY_MODEL(veh) == util.joaat("avisa") or ENTITY.GET_ENTITY_MODEL(veh) == util.joaat("kosatka") then
		VEHICLE.SET_SUBMARINE_CRUSH_DEPTHS(veh, false , 1000, 1000, 1000)
	end
end)

anchor = off
menu.toggle(vehmenu, ANCHOR_BOAT, {}, "", function(on)
    anchor = on
	while anchor do 
		VEHICLE.SET_BOAT_ANCHOR(veh, true)
		VEHICLE._SET_BOAT_FROZEN_WHEN_ANCHORED(veh, true)
		util.yield()
	end
	VEHICLE.SET_BOAT_ANCHOR(veh, false)
	VEHICLE._SET_BOAT_FROZEN_WHEN_ANCHORED(veh, false)
end)

menu.toggle_loop(vehmenu, ANCHOR_BOAT_LEAVE, {}, ANCHOR_BOAT_LEAVE_DESC, function(on)
	veh = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false)
	if veh == 0 then
		if VEHICLE.IS_THIS_MODEL_A_BOAT(ENTITY.GET_ENTITY_MODEL(vehlast)) then
			VEHICLE.SET_BOAT_ANCHOR(vehlast, true)
			VEHICLE._SET_BOAT_FROZEN_WHEN_ANCHORED(vehlast, true)
		end
	else
		if VEHICLE.IS_THIS_MODEL_A_BOAT(ENTITY.GET_ENTITY_MODEL(vehlast)) then
			VEHICLE.SET_BOAT_ANCHOR(veh, false)
			VEHICLE._SET_BOAT_FROZEN_WHEN_ANCHORED(veh, false)
		end
	end
		
end)

menu.slider(vehmenu, FORKLIFT_HEIGTH, {""}, FORKLIFT_HEIGTH_DESC, 0, 10, 0, 1, function(s)
	sf = s/10
	VEHICLE.SET_FORKLIFT_FORK_HEIGHT(veh, sf)
 end)

menu.action(vehmenu, EJECT_WINDSHIELD, {}, "", function()
	VEHICLE.POP_OUT_VEHICLE_WINDSCREEN(veh)
end)

invincpart = off
menu.toggle(vehmenu, UNBREAKABLE_PART, {}, "", function(on)
    invincpart = on
	while invincpart do
		VEHICLE.SET_VEHICLE_STRONG(veh, true)
		util.yield()
	end
	VEHICLE.SET_VEHICLE_STRONG(veh, false)
end)

menu.toggle(vehmenu, STICK_TO_GROUND, {}, "", function(on)
	sticktoground = on
	while sticktoground do
		if not VEHICLE.IS_VEHICLE_ON_ALL_WHEELS(veh) then
			VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(veh, 50)
			util.yield(100)
		end
		util.yield()
	end
end)

easyenter = off
menu.toggle(vehmenu, EASY_ENTER, {}, "", function(on)
	easyenter = on
	while easyenter do
		if not (PED.GET_VEHICLE_PED_IS_TRYING_TO_ENTER(plyped()) == 0) then
			requestControlLoop(PED.GET_VEHICLE_PED_IS_TRYING_TO_ENTER(plyped()))
			VEHICLE.BRING_VEHICLE_TO_HALT(PED.GET_VEHICLE_PED_IS_TRYING_TO_ENTER(plyped()), 0, 1)
		end
		util.yield()
	end
end)
menu.toggle_loop(vehmenu, DRIVE_ON_WALL, {}, "", function()
	ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, 0, 0, -0.2, false, true, true, true)
end)

--------------vehicle menu end--------------


--------------weapon menu--------------
local weapmenu = menu.list(menu.my_root(), WEAP_MENU, {}, "")

nospread = off
menu.toggle(weapmenu, NO_SPREAD, {}, "", function(on)
    nospread = on
end, false)

menu.slider(weapmenu, IMPACT_SCALE, {""}, "", 0, 2147483646, 1, 1, function(s)
	GRAPHICS.SET_PARTICLE_FX_BULLET_IMPACT_SCALE(s)
end)

menu.toggle_loop(weapmenu, SHOOT_PED, {""}, "", function()
	pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID())
	rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
	if PED.IS_PED_SHOOTING(PLAYER.PLAYER_PED_ID()) then 
		pedspawn = PED.CREATE_RANDOM_PED(pos.x, pos.y, pos.z)
		ENTITY.SET_ENTITY_ROTATION(pedspawn, rot.x, rot.y, rot.z, 1, false)
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(pedspawn, 1, 0, 1000, 0, false, true, true, true)
	end
end)

driveit = off
menu.toggle(weapmenu, DRIVE_IT, {}, DRIVE_IT_DESC, function(on)
	driveit = on
	while driveit do
		driveitgun()
		util.yield()
	end
end)

delgun = off
menu.toggle(weapmenu, DEL_GUN, {}, DEL_GUN_DESC, function(on)
	delgun = on
	while delgun do
		deletegun()
		util.yield()
	end
end)

invweap = off
menu.toggle(weapmenu, INV_WEAP, {}, "", function(on)
	invweap = on
	while invweap do
		curweap = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(plyped())
		ENTITY.SET_ENTITY_VISIBLE(curweap, false, false)
		util.yield()
	end
	curweap = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(plyped())
	ENTITY.SET_ENTITY_VISIBLE(curweap, true, false)
end)

weaponback = off
menu.toggle(weapmenu, WEAPON_ON_BACK, {}, "", function(on)
	weaponback = on
	if weaponback then
		spawnweapon = 0
	end
	curweap = HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())
	if not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == -1569615261) and weaponback then
		spawnweapon = WEAPON.CREATE_WEAPON_OBJECT(curweap, 1, pos.x, pos.y, pos.z, true, 1, 0)
		attachweapon(spawnweapon)
	end
	while weaponback do
		if (WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(plyped()) == 0) then
			if not (spawnweapon == 0) then
				ENTITY.SET_ENTITY_VISIBLE(spawnweapon, true, false)
			end
		else
			ENTITY.SET_ENTITY_VISIBLE(spawnweapon, false, false)
		end
		if not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == curweap) and not (HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped()) == -1569615261) then
			if not (spawnweapon == 0) then
				entities.delete_by_handle(spawnweapon)
			end
			curweap = HUD._HUD_WEAPON_WHEEL_GET_SELECTED_HASH(plyped())
			requestweapon(curweap)
			spawnweapon = WEAPON.CREATE_WEAPON_OBJECT(curweap, 1, pos.x, pos.y, pos.z, true, 1, 0)
			if (WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(plyped()) == 0) then
				ENTITY.SET_ENTITY_VISIBLE(spawnweapon, true, false)
			else
				ENTITY.SET_ENTITY_VISIBLE(spawnweapon, false, false)
			end
			attachweapon(spawnweapon)
		end
		util.yield()
	end
	entities.delete_by_handle(spawnweapon)
end)


--------------weapon menu end--------------

--------------audio menu--------------

local audiomenu = menu.list(menu.my_root(), AUDIO_MENU, {}, "")
local audioplanemenu = menu.list(audiomenu, PLANE_SUBMENU, {}, "")
local audioalarmmenu = menu.list(audiomenu, ALARM_SUBMENU, {}, "")
local audiopolicereportmenu = menu.list(audiomenu, POLICE_SUBMENU, {}, "")
local audioengine = menu.list(audiomenu, ENGINE_SUBMENU, {}, "")
local audioradio = menu.list(audiomenu, RADIO_SUBMENU, {}, "")

audiocop = off
menu.toggle(audiomenu, NO_DISTANT_COP_SIREN, {}, "", function(on)
    audiocop = on
	while audiocop do
		AUDIO.DISTANT_COP_CAR_SIRENS(false)
		util.yield()
	end
	AUDIO.DISTANT_COP_CAR_SIRENS(true)
end, false)

nosiren = off
menu.toggle(audiomenu, NO_SIREN, {}, "", function(on)
    nosiren = on
	while nosiren do 
		VEHICLE.SET_VEHICLE_HAS_MUTED_SIRENS(veh, true)
		util.yield()
	end
	VEHICLE.SET_VEHICLE_HAS_MUTED_SIRENS(veh, false)
end, false)

nostallsound = off
menu.toggle(audioplanemenu, NO_STALL_SOUND, {'nostallsound'}, "", function(on)
    nostallsound = on
	while nostallsound do
		AUDIO.ENABLE_STALL_WARNING_SOUNDS(veh, false)
		util.yield()
	end
	AUDIO.ENABLE_STALL_WARNING_SOUNDS(veh, true)
end, false)

menu.action(audioalarmmenu, STP_ALRAM, {'stopalarm'}, "", function()
    AUDIO.STOP_ALARM('AGENCY_HEIST_FIB_TOWER_ALARMS', true)
	AUDIO.STOP_ALARM('AGENCY_HEIST_FIB_TOWER_ALARMS_UPPER', true)
	AUDIO.STOP_ALARM('AGENCY_HEIST_FIB_TOWER_ALARMS_UPPER_B', true)
end)

tpalarm = off
menu.toggle(audioalarmmenu, TP_TO_ALARM, {'tpalarm'}, "", function(on)
    tpalarm = on
end, false)

menu.action(audioalarmmenu, "fib alarm", {'fib1'}, "", function()
	if tpalarm then
		ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), '99', '-743', '45')
	end
    AUDIO.START_ALARM('AGENCY_HEIST_FIB_TOWER_ALARMS', true)
end)

menu.action(audioalarmmenu, "fib alarm upper", {'fib2'}, "", function()
	if tpalarm then
		ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), '126', '-747', '262')
	end
    AUDIO.START_ALARM('AGENCY_HEIST_FIB_TOWER_ALARMS_UPPER', true)
end)

menu.action(audioalarmmenu, "fib alarm upper b", {'fib3'}, "", function()
	if tpalarm then
		ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.PLAYER_PED_ID(), '114', '-740', '258')
	end
    AUDIO.START_ALARM('AGENCY_HEIST_FIB_TOWER_ALARMS_UPPER_B', true)
end)

menu.action(audiopolicereportmenu, CANCEL_REPORT, {''}, "", function()
	AUDIO._CANCEL_CURRENT_POLICE_REPORT()
end)

menu.action(audiopolicereportmenu, "LAMAR_1_POLICE_LOST", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("LAMAR_1_POLICE_LOST", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_AH_3B_01", {'fib3'}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_AH_3B_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_AH_MUGGING_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_AH_MUGGING_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_AH_PREP_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_AH_PREP_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_AH_PREP_02", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_AH_PREP_02", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_ARMENIAN_1_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_ARMENIAN_1_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_ARMENIAN_1_02", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_ARMENIAN_1_02", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_ASS_BUS_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_ASS_BUS_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_ASS_MULTI_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_ASS_MULTI_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_BARRY_3A_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_BARRY_3A_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_BS_2A_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_BS_2A_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_BS_2B_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_BS_2B_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_BS_2B_02", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_BS_2B_02", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_BS_2B_03", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_BS_2B_03", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_BS_2B_04", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_BS_2B_04", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_BS_PREP_A_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_BS_PREP_A_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_BS_PREP_B_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_BS_PREP_B_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_CAR_STEAL_2_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_CAR_STEAL_2_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_CAR_STEAL_4_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_CAR_STEAL_4_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_DH_PREP_1_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_DH_PREP_1_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_FIB_1_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_FIB_1_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_FIN_C2_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_FIN_C2_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_Franklin_2_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_Franklin_2_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_FRANLIN_0_KIDNAP", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_FRANLIN_0_KIDNAP", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_GETAWAY_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_GETAWAY_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JOSH_3_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JOSH_3_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JOSH_4_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JOSH_4_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JSH_2A_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JSH_2A_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JSH_2A_02", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JSH_2A_02", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JSH_2A_03", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JSH_2A_03", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JSH_2A_04", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JSH_2A_04", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JSH_2A_05", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JSH_2A_05", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JSH_PREP_1A_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JSH_PREP_1A_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JSH_PREP_1B_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JSH_PREP_1B_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JSH_PREP_2A_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JSH_PREP_2A_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_JSH_PREP_2A_02", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_JSH_PREP_2A_02", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_LAMAR_1_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_LAMAR_1_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_MIC_AMANDA_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_MIC_AMANDA_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_NIGEL_1A_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_NIGEL_1A_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_NIGEL_1D_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_NIGEL_1D_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_PS_2A_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_PS_2A_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_PS_2A_02", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_PS_2A_02", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_PS_2A_03", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_PS_2A_03", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_SEC_TRUCK_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_SEC_TRUCK_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_SEC_TRUCK_02", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_SEC_TRUCK_02", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_SEC_TRUCK_02", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_SEC_TRUCK_02", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_SEC_TRUCK_03", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_SEC_TRUCK_03", 0.0)
end)


menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_SIMEON_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_SIMEON_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_Sol_3_01", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_Sol_3_01", 0.0)
end)

menu.action(audiopolicereportmenu, "SCRIPTED_SCANNER_REPORT_Sol_3_02", {''}, "", function()
	AUDIO.PLAY_POLICE_REPORT("SCRIPTED_SCANNER_REPORT_Sol_3_02", 0.0)
end)

vehaudiooverride = ""
menu.text_input(audioengine, OVRD_ENG_AUDIO, {"ovengaudio"}, OVRD_ENG_AUDIO_DESC, function(s)
	vehaudiooverride = s
	AUDIO._FORCE_VEHICLE_ENGINE_AUDIO(veh, s)
end)

lastveh = 0
menu.toggle_loop(audioengine, AUTO_OVRD_ENG_AUDIO, {}, AUTO_OVRD_ENG_AUDIO_DESC, function()
	if veh ~= lastveh then 
		lastveh = veh
		AUDIO._FORCE_VEHICLE_ENGINE_AUDIO(veh, vehaudiooverride)
	end
end)

onlymusic = off
menu.toggle(audioradio, ONLY_MUSIC, {}, "", function(on)
	onlymusic = on
	while onlymusic do 
		if not AUDIO.GET_PLAYER_RADIO_STATION_INDEX() == 255 then 
			AUDIO.SET_RADIO_STATION_MUSIC_ONLY(AUDIO.GET_PLAYER_RADIO_STATION_NAME(), true)
		end
		util.yield()
	end
	if not AUDIO.GET_PLAYER_RADIO_STATION_INDEX() == 255 then 
			AUDIO.SET_RADIO_STATION_MUSIC_ONLY(AUDIO.GET_PLAYER_RADIO_STATION_NAME(), false)
	end
end)
menu.action(audioradio, SKIP_FOWARD, {}, "", function()
	AUDIO.SET_RADIO_RETUNE_UP()
end)

menu.action(audioradio, SKIP_BACKWARD, {}, "", function()
	AUDIO.SET_RADIO_RETUNE_DOWN()
end)


--------------audio menu end--------------
--------------misc menu--------------

local miscmenu = menu.list(menu.my_root(), MISC_MENU, {"miscmenu"}, "")
local miscwindmenu = menu.list(miscmenu, WIND_SUBMENU, {"windmenu"}, "")
local miscrainmenu = menu.list(miscmenu, RAINSNOW_SUBMENU, {"rainsnowmenu"}, "")
local mischudmenu = menu.list(miscmenu, HUD_SUBMENU, {"hudmenu"}, "")
local hudminimapmenu = menu.list(miscmenu,MINIMAP_SUBMENU, {"minimapmenu"}, "")
local miscwatermenu = menu.list(miscmenu, WATER_SUBMENU, {"watermenu"}, "")
local miscphonemenu = menu.list(miscmenu, PHONE_SUBMENU, {"phonemenu"}, "")
local miscpostfxmenu = menu.list(miscmenu, "POSTFX", {"postfxmenu"}, "")
local misclightmenu = menu.list(miscmenu, LIGHT_MENU, {"lightmenu"}, "")
local hidehudmenu = menu.list(mischudmenu, HIDE_HUD_SUBMENU, {"hudhide"}, "")
local showhudmenu = menu.list(mischudmenu, SHOW_HUD_SUBMENU, {"hudshow"}, "")

forcejump = off
menu.toggle(miscmenu, FORCE_JUMP, {"jumpinterior"}, FORCE_JUMP_DESC, function(on)
	forcejump = on
	while forcejump do
		if PAD.IS_CONTROL_PRESSED(298, 298) then
			MISC._SET_FORCE_PLAYER_TO_JUMP(PLAYER.PLAYER_ID())
		end
		util.yield()
	end
end)

menu.action(miscmenu, SPAWN_RANDOM, {"spawnrandomped"}, "", function()
	pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID())
	PED.CREATE_RANDOM_PED(pos.x, pos.y, pos.z)
end)

menu.toggle_loop(hidehudmenu, "WANTED_STARS", {"wantedstar"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(1)
end)

menu.toggle_loop(hidehudmenu, "WEAPON_ICON", {"hideweaponicon"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(2)
end)

menu.toggle_loop(hidehudmenu, "CASH", {"hidecash"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(3)
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(4)
end)

menu.toggle_loop(hidehudmenu, "VEHICLE_NAME", {"hidevehname"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(6)
end)

menu.toggle_loop(hidehudmenu, "AREA_NAME", {"hideareaname"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(7)
end)

menu.toggle_loop(hidehudmenu, "STREET_NAME", {"hidestreetname"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(9)
end)

menu.toggle_loop(hidehudmenu, "RETICLE", {"hidereticle"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(14)
end)

menu.toggle_loop(hidehudmenu, "RADIO_STATIONS", {"hideradio"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(16)
end)

menu.toggle_loop(hidehudmenu, "WEAPON_WHEEL", {"hideweaponwheel"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(19)
end)

menu.toggle_loop(hidehudmenu, "WEAPON_WHEEL_STATS", {"hideweaponstat"}, "", function()
	HUD.HIDE_HUD_COMPONENT_THIS_FRAME(20)
end)

menu.toggle_loop(showhudmenu, "WEAPON_ICON", {"showweaponicon"}, "", function()
	HUD.SHOW_HUD_COMPONENT_THIS_FRAME(2)
	util.yield()
end)

menu.toggle_loop(showhudmenu, "CASH", {"showcash"}, "", function()
	HUD.SHOW_HUD_COMPONENT_THIS_FRAME(3)
	HUD.SHOW_HUD_COMPONENT_THIS_FRAME(4)
	util.yield()
end)

menu.toggle_loop(showhudmenu, "VEHICLE_NAME", {"showvehiclename"}, "", function()
	HUD.SHOW_HUD_COMPONENT_THIS_FRAME(6)
	util.yield()
end)

menu.toggle_loop(showhudmenu, "AREA_NAME", {"showareaname"}, "", function()
	HUD.SHOW_HUD_COMPONENT_THIS_FRAME(7)
	util.yield()
end)

menu.toggle_loop(showhudmenu, "STREET_NAME", {"showstreetname"}, "", function()
	HUD.SHOW_HUD_COMPONENT_THIS_FRAME(9)
	util.yield()
end)

menu.toggle_loop(showhudmenu, "RETICLE", {"showreticle"}, "", function()
	HUD.SHOW_HUD_COMPONENT_THIS_FRAME(14)
end)

mapzoom = 1
menu.slider(hudminimapmenu, MINIMAP_ZOOM, {"minimapzoom"}, "", 0, 100, 0, 1, function(s)
    HUD.SET_RADAR_ZOOM_PRECISE(s)
end)

mapangle = 0
menu.slider(hudminimapmenu, MINIMAP_ANGLE, {"minimapanglme"}, "", 0, 360, 0, 1, function(s)
    mapangle = s
end)

mapanglet = off
menu.toggle(hudminimapmenu, MINIMAP_ANGLE_LOCK, {"lockminimapangle"}, "", function(on)
	mapanglet = on
	while mapanglet do
		HUD.LOCK_MINIMAP_ANGLE(mapangle)
		util.yield()
	end
	HUD.UNLOCK_MINIMAP_ANGLE()
end)


menu.toggle(hudminimapmenu, SONAR_ON_MINIMAP, {"sonaronmap"}, "", function(on)
	HUD._SET_MINIMAP_SONAR_ENABLED(on)
end)

 centermap = off
menu.toggle(hudminimapmenu, CENTER_MAP, {"centermap"}, "", function(on)
	centermap = on
	while centermap do 
		HUD.DONT_TILT_MINIMAP_THIS_FRAME()
		util.yield()
	end
end)

menu.slider(miscwindmenu, WIND_SPEED, {"windspeed"}, WIND_SPEED_DESC, -1, 12, -1, 1, function(s)
	MISC.SET_WIND_SPEED(s)
end)

menu.slider(miscwindmenu, WIND_DIRECTION, {"winddir"}, WIND_DIRECTION_DESC, -1, 360, -1, 1, function(s)
	MISC.SET_WIND_DIRECTION(s)
end)

menu.action(miscrainmenu, FORCE_FLASH, {"forcelightningflash"}, "", function()
	MISC.FORCE_LIGHTNING_FLASH()
end)

menu.slider(miscrainmenu, RAIN_LEVEL, {"rainlevel"}, RAIN_LEVEL_DESC, -1, 10, -1, 1, function(s)
	sf = s/10
	MISC._SET_RAIN_LEVEL(sf)
end)

menu.slider(miscrainmenu, SNOW_LEVEL, {"snowlevel"}, SNOW_LEVEL_DESC, -1, 10, -1, 1, function(s)
	sf = s/10
	MISC._SET_SNOW_LEVEL(sf)
end)

menu.slider(miscwatermenu, WATER_TYPE, {"watertype"}, "", 0, 1, 0, 1, function(s)
	STREAMING._LOAD_GLOBAL_WATER_TYPE(s)
end)

pht = 0
menu.slider(miscphonemenu, PHONE_TYPE, {"phonetype"}, PHONE_TYPE_DESC, 0, 6, 0, 1, function(s)
	pht = s
end)

menu.toggle_loop(miscphonemenu, OVRD_PHONE_TYPE, {"overridephonetype"}, "", function()
if PAD.IS_CONTROL_JUST_PRESSED(1, 27) then
	util.yield(100)
		MOBILE.CREATE_MOBILE_PHONE(pht)	
end
	
end)

 phs = 5
menu.slider(miscphonemenu, PHONE_SCALE, {"phonescale"}, "", 0, 100, 5, 1, function(s)
	phs = s
end)

menu.toggle_loop(miscphonemenu, OVRD_PHONE_SCALE, {"overridephonescale"}, "", function()
	phsf = phs*100
	MOBILE.SET_MOBILE_PHONE_SCALE(phsf)
end)

creditgta = off
menu.toggle(miscmenu, CREDIT_GTA, {"gtacredit"}, "", function(on)
	creditgta = on
	MISC.SET_CREDITS_ACTIVE(on)
end)

menu.toggle_loop(miscmenu, GET_HOST, {"alwayshost"}, "", function()
	if not (players.get_host() == PLAYER.PLAYER_ID()) and not util.is_session_transition_active() then
		if not (PLAYER.GET_PLAYER_NAME(players.get_host()) == "**Invalid**") then
			menu.trigger_commands("kick"..PLAYER.GET_PLAYER_NAME(players.get_host()))
			util.yield(200)
		end
	end
end)

menu.toggle(miscpostfxmenu, "ArenaEMP", {"postfxArenaEMP"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("ArenaEMP", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("ArenaEMP")
		GRAPHICS.ANIMPOSTFX_PLAY("ArenaEMPOut")
    end
end)

menu.toggle(miscpostfxmenu, "ArenaWheelPurple", {"postfxArenaWheelPurple"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("ArenaWheelPurple", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("ArenaWheelPurple")
    end
end)

menu.action(miscpostfxmenu, "BeastIntroScene", {"postfxBeastIntroScene"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("BeastIntroScene", 0, true)
end)

menu.toggle(miscpostfxmenu, "BeastLaunch", {"postfxBeastLaunch"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("BeastLaunch", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("BeastLaunch")
    end
end)

menu.action(miscpostfxmenu, "BeastTransition", {"postfxBeastTransition"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("BeastTransition", 0, true)
end)

menu.toggle(miscpostfxmenu, "BikerFormation", {"postfxBikerFormation"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("BikerFormation", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("BikerFormation")
		GRAPHICS.ANIMPOSTFX_PLAY("BikerFormationOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "BulletTime", {"postfxBulletTime"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("BulletTime", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("BulletTime")
		GRAPHICS.ANIMPOSTFX_PLAY("BulletTimeOut", 0, true)
    end
end)

menu.action(miscpostfxmenu, "CamPushInFranklin", {"postfxCamPushInFranklin"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("CamPushInFranklin", 0, true)
end)

menu.action(miscpostfxmenu, "CamPushInMichael", {"postfxCamPushInMichael"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("CamPushInMichael", 0, true)
end)

menu.action(miscpostfxmenu, "CamPushInNeutral", {"postfxCamPushInNeutral"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("CamPushInNeutral", 0, true)
end)

menu.action(miscpostfxmenu, "CamPushInTrevor", {"postfxCamPushInTrevor"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("CamPushInTrevor", 0, true)
end)

menu.action(miscpostfxmenu, "CarDamageHit", {"postfxCarDamageHit"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("CarDamageHit", 0, true)
end)

menu.action(miscpostfxmenu, "CarPitstopHealth", {"postfxCarPitstopHealth"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("CarPitstopHealth", 0, true)
end)

menu.toggle(miscpostfxmenu, "ChopVision", {"postfxChopVision"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("ChopVision", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("ChopVision")
    end
end)

menu.toggle(miscpostfxmenu, "CrossLine", {"postfxCrossLine"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("CrossLine", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("CrossLine")
		GRAPHICS.ANIMPOSTFX_PLAY("CrossLineOut", 0, true)
    end
end)

menu.action(miscpostfxmenu, "DanceIntensity01", {"postfxDanceIntensity01"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("DanceIntensity01", 0, true)
end)

menu.action(miscpostfxmenu, "DanceIntensity02", {"postfxDanceIntensity02"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("DanceIntensity02", 0, true)
end)

menu.action(miscpostfxmenu, "DanceIntensity03", {"postfxDanceIntensity03"}, "", function()
        GRAPHICS.ANIMPOSTFX_PLAY("DanceIntensity03", 0, true)
end)

menu.toggle(miscpostfxmenu, "DeadlineNeon", {"postfxDeadlineNeon"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("DeadlineNeon", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("DeadlineNeon")
    end
end)
	
menu.toggle(miscpostfxmenu, "DeathFailMPDark", {"postfxDeathFailMPDark"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("DeathFailMPDark", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("DeathFailMPDark")
    end
end)

menu.toggle(miscpostfxmenu, "DeathFailMPIn", {"postfxDeathFailMPIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("DeathFailMPIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("DeathFailMPIn")
    end
end)

menu.toggle(miscpostfxmenu, "DeathFailNeutralIn", {"postfxDeathFailNeutralIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("DeathFailNeutralIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("DeathFailNeutralIn")
    end
end)

menu.toggle(miscpostfxmenu, "DeathFailOut", {"postfxDeathFailOut"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("DeathFailOut", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("DeathFailOut")
    end
end)

menu.action(miscpostfxmenu, "DefaultBlinkOutro", {"postfxDefaultBlinkOutro"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("DefaultBlinkOutro", 0, true)
end)

menu.toggle(miscpostfxmenu, "DMT_flight", {"postfxDMT_flight"}, "", function(on)
	if on then
		GRAPHICS.ANIMPOSTFX_PLAY("DMT_flight_intro", 0, true)
		util.yield(3000)
		GRAPHICS.ANIMPOSTFX_STOP("DMT_flightintro")
        GRAPHICS.ANIMPOSTFX_PLAY("DMT_flight", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("DMT_flight")
		GRAPHICS.ANIMPOSTFX_STOP("DMT_flight_intro")
    end
end)

menu.toggle(miscpostfxmenu, "Dont_tazeme_bro", {"postfxDont_tazeme_bro"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("Dont_tazeme_bro", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("Dont_tazeme_bro")
    end
end)

menu.toggle(miscpostfxmenu, "DrugsDrivingOut", {"postfxDrugsDrivingOut"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("DrugsDrivingOut", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("DrugsDrivingOut")
    end
end)

menu.action(miscpostfxmenu, "ExplosionJosh3", {"postfxExplosionJosh3"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("ExplosionJosh3", 0, true)
end)

menu.toggle(miscpostfxmenu, "FocusIn", {"postfxFocusIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("FocusIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("FocusIn")
		GRAPHICS.ANIMPOSTFX_PLAY("FocusOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "Heist4CameraFlash", {"postfxHeist4CameraFlash"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("Heist4CameraFlash", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("Heist4CameraFlash")
    end
end)

menu.toggle(miscpostfxmenu, "Heist4CameraFlash2", {"postfxHeist4CameraFlash2"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("Heist4CameraFlash2", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("Heist4CameraFlash2")
    end
end)

menu.toggle(miscpostfxmenu, "HeistCelebEnd", {"postfxHeistCelebEnd"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("HeistCelebEnd", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("HeistCelebEnd")
    end
end)

menu.toggle(miscpostfxmenu, "HeistCelebFail", {"postfxHeistCelebFail"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("HeistCelebFail", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("HeistCelebFail")
    end
end)

menu.toggle(miscpostfxmenu, "HeistCelebFailBW", {"postfxHeistCelebFailBW"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("HeistCelebFailBW", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("HeistCelebFailBW")
    end
end)
	
menu.toggle(miscpostfxmenu, "HeistCelebPass", {"postfxHeistCelebPass"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("HeistCelebPass", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("HeistCelebPass")
    end
end)

menu.toggle(miscpostfxmenu, "HeistCelebPassBW", {"postfxHeistCelebPassBW"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("HeistCelebPassBW", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("HeistCelebPassBW")
    end
end)

menu.action(miscpostfxmenu, "HeistLocate", {"postfxHeistLocate"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("HeistLocate", 0, true)
end)

menu.action(miscpostfxmenu, "HeistTripSkipFade", {"postfxHeistTripSkipFade"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("HeistTripSkipFade", 0, true)
end)

menu.toggle(miscpostfxmenu, "InchOrange", {"postfxInchOrange"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("InchOrange", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("InchOrange")
		GRAPHICS.ANIMPOSTFX_PLAY("InchOrangeOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "InchPickup", {"postfxInchPickup"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("InchPickup", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("InchPickup")
		GRAPHICS.ANIMPOSTFX_PLAY("InchPickupOut", 0, true)
    end
end)
	
menu.toggle(miscpostfxmenu, "InchPurple", {"postfxInchPurple"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("InchPurple", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("InchPurple")
		GRAPHICS.ANIMPOSTFX_PLAY("InchPurpleOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "LostTimeDay", {"postfxLostTimeDay"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("LostTimeDay", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("LostTimeDay")
    end
end)

menu.toggle(miscpostfxmenu, "LostTimeNight", {"postfxLostTimeNight"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("LostTimeNight", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("LostTimeNight")
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGFranklinIn", {"postfxMenuMGFranklinIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGFranklinIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGFranklinIn")
		GRAPHICS.ANIMPOSTFX_PLAY("MenuMGFranklinOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGHeistIn", {"postfxMenuMGHeistIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGHeistIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGHeistIn")
		GRAPHICS.ANIMPOSTFX_PLAY("MenuMGHeistOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGHeistIntro", {"postfxMenuMGHeistIntro"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGHeistIntro", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGHeistIntro")
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGHeistTint", {"postfxMenuMGHeistTint"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGHeistTint", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGHeistTint")
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGIn", {"postfxMenuMGIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGIn")
    end
end)


menu.toggle(miscpostfxmenu, "MenuMGIslandHeistIn", {"postfxMenuMGIslandHeistIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGIslandHeistIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGIslandHeistIn")
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGMichaelIn", {"postfxMenuMGMichaelIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGMichaelIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGMichaelIn")
		GRAPHICS.ANIMPOSTFX_PLAY("MenuMGMichaelOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGRemixIn", {"postfxMenuMGRemixIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGRemixIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGRemixIn")
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGSelectionIn", {"postfxMenuMGSelectionIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGSelectionIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGSelectionIn")
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGSelectionTint", {"postfxMenuMGSelectionTint"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGSelectionTint", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGSelectionTint")
    end
end)


menu.toggle(miscpostfxmenu, "MenuMGTournamentIn", {"postfxMenuMGTournamentIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGTournamentIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGTournamentIn")
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGTournamentTint", {"postfxMenuMGTournamentTint"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGTournamentTint", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGTournamentTint")
    end
end)

menu.toggle(miscpostfxmenu, "MenuMGTrevorIn", {"postfxMenuMGTrevorIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuMGTrevorIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuMGTrevorIn")
		GRAPHICS.ANIMPOSTFX_PLAY("MenuMGTrevorOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "MenuSurvivalAlienIn", {"postfxMenuSurvivalAlienIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MenuSurvivalAlienIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MenuSurvivalAlienIn")
    end
end)

menu.action(miscpostfxmenu, "MinigameEndFranklin", {"postfxMinigameEndFranklin"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MinigameEndFranklin", 0, true)
end)


menu.action(miscpostfxmenu, "MinigameEndMichael", {"postfxMinigameEndMichael"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MinigameEndMichael", 0, true)
end)

menu.action(miscpostfxmenu, "MinigameEndNeutral", {"postfxMinigameEndNeutral"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MinigameEndNeutral", 0, true)
end)

menu.action(miscpostfxmenu, "MinigameEndTrevor", {"postfxMinigameEndTrevor"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MinigameEndTrevor", 0, true)
end)

menu.toggle(miscpostfxmenu, "MinigameTransitionIn", {"postfxMinigameTransitionIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MinigameTransitionIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MinigameTransitionIn")
		GRAPHICS.ANIMPOSTFX_PLAY("MinigameTransitionOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "MP_Bull_tost", {"postfxMP_Bull_tost"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MP_Bull_tost", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MP_Bull_tost")
    end
end)


menu.toggle(miscpostfxmenu, "MP_Celeb_Lose", {"postfxMP_Celeb_Lose"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MP_Celeb_Lose", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MP_Celeb_Lose")
		GRAPHICS.ANIMPOSTFX_PLAY("MP_Celeb_Lose_Out", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "MP_Celeb_Preload", {"postfxMP_Celeb_Preload"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MP_Celeb_Preload", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MP_Celeb_Preload")
		GRAPHICS.ANIMPOSTFX_PLAY("MP_Celeb_Preload_Fade", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "MP_Celeb_Win", {"postfxMP_Celeb_Win"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MP_Celeb_Win", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MP_Celeb_Win")
		GRAPHICS.ANIMPOSTFX_PLAY("MP_Celeb_Win_Out", 0, true)
    end
end)


menu.action(miscpostfxmenu, "MP_corona_switch", {"postfxMP_corona_switch"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MP_corona_switch", 0, true)
end)

menu.action(miscpostfxmenu, "MP_corona_switch_supermod", {"postfxMP_corona_switch_supermod"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MP_corona_switch_supermod", 0, true)
end)

menu.action(miscpostfxmenu, "MP_intro_logo", {"postfxMP_intro_logo"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MP_intro_logo", 0, true)
end)


menu.toggle(miscpostfxmenu, "MP_job_load", {"postfxMP_job_load"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MP_job_load", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MP_job_load")
    end
end)

menu.toggle(miscpostfxmenu, "MP_OrbitalCannon", {"postfxMP_OrbitalCannon"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MP_OrbitalCannon", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MP_OrbitalCannon")
    end
end)

menu.toggle(miscpostfxmenu, "MP_race_crash", {"postfxMP_race_crash"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("MP_race_crash", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("MP_race_crash")
    end
end)


menu.action(miscpostfxmenu, "MP_SmugglerCheckpoint", {"postfxMP_SmugglerCheckpoint"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MP_SmugglerCheckpoint", 0, true)
end)

menu.action(miscpostfxmenu, "MP_TransformRaceFlash", {"postfxMP_TransformRaceFlash"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MP_TransformRaceFlash", 0, true)
end)

menu.toggle(miscpostfxmenu, "MP_WarpCheckpoint", {"postfxMP_WarpCheckpoint"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("MP_WarpCheckpoint", 0, true)
end)


menu.toggle(miscpostfxmenu, "pennedIn", {"postfxpennedIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("pennedIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("pennedIn")
		GRAPHICS.ANIMPOSTFX_PLAY("PennedInOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "PeyoteEndIn", {"postfxPeyoteEndIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("PeyoteEndIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("PeyoteEndIn")
		GRAPHICS.ANIMPOSTFX_PLAY("PeyoteEndOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "PeyoteIn", {"postfxPeyoteIns"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("PeyoteIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("PeyoteIn")
		GRAPHICS.ANIMPOSTFX_PLAY("PeyoteOut", 0, true)
    end
end)


menu.action(miscpostfxmenu, "PokerCamTransition", {"postfxPokerCamTransition"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("PokerCamTransition", 0, true)
end)

menu.toggle(miscpostfxmenu, "PPFilter", {"postfxPPFilter"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("PPFilter", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("PPFilter")
		GRAPHICS.ANIMPOSTFX_PLAY("PPFilterOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "PPGreen", {"postfxPPGreen"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("PPGreen", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("PPGreen")
		GRAPHICS.ANIMPOSTFX_PLAY("PPGreenOut", 0, true)
    end
end)


menu.toggle(miscpostfxmenu, "PPOrange", {"postfxPPOrange"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("PPOrange", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("PPOrange")
		GRAPHICS.ANIMPOSTFX_PLAY("PPOrangeOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "PPPink", {"postfxPPPink"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("PPPink", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("PPPink")
		GRAPHICS.ANIMPOSTFX_PLAY("PPPinkOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "PPPurple", {"postfxPPPurple"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("PPPurple", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("PPPurple")
		GRAPHICS.ANIMPOSTFX_PLAY("PPPurpleOut", 0, true)
    end
end)


menu.toggle(miscpostfxmenu, "RaceTurbo", {"postfxRaceTurbo"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("RaceTurbo", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("RaceTurbo")
    end
end)

menu.toggle(miscpostfxmenu, "Rampage", {"postfxRampage"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("Rampage", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("Rampage")
		GRAPHICS.ANIMPOSTFX_PLAY("RampageOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "REDMIST", {"postfxREDMIST"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("REDMIST", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("REDMIST")
		GRAPHICS.ANIMPOSTFX_PLAY("REDMISTOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "RemixDrone", {"postfxRemixDrone"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("RemixDrone", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("RemixDrone")
    end
end)

menu.toggle(miscpostfxmenu, "SniperOverlay", {"postfxSniperOverlay"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SniperOverlay", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SniperOverlay")
    end
end)

menu.action(miscpostfxmenu, "SuccessFranklin", {"postfxSuccessFranklin"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SuccessFranklin", 0, true)
end)

menu.action(miscpostfxmenu, "SuccessMichael", {"postfxSuccessMichael"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SuccessMichael", 0, true)
end)

menu.action(miscpostfxmenu, "SuccessNeutral", {"postfxSuccessNeutral"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SuccessNeutral", 0, true)
end)

menu.action(miscpostfxmenu, "SuccessTrevor", {"postfxSuccessTrevor"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SuccessTrevor", 0, true)
end)

menu.toggle(miscpostfxmenu, "SurvivalAlien", {"postfxSurvivalAlien"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SurvivalAlien", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SurvivalAlien")
    end
end)

menu.toggle(miscpostfxmenu, "SwitchHUDFranklinIn", {"postfxSwitchHUDFranklinIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchHUDFranklinIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SwitchHUDFranklinIn")
		GRAPHICS.ANIMPOSTFX_PLAY("SwitchHUDFranklinOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "SwitchHUDIn", {"postfxSwitchHUDIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchHUDIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SwitchHUDIn")
		GRAPHICS.ANIMPOSTFX_PLAY("SwitchHUDOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "SwitchHUDMichaelIn", {"postfxSwitchHUDMichaelIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchHUDMichaelIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SwitchHUDMichaelIn")
		GRAPHICS.ANIMPOSTFX_PLAY("SwitchHUDMichaelOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "SwitchHUDTrevorIn", {"postfxSwitchHUDTrevorIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchHUDTrevorIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SwitchHUDTrevorIn")
		GRAPHICS.ANIMPOSTFX_PLAY("SwitchHUDTrevorOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "SwitchOpenFranklin", {"postfxSwitchOpenFranklin"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchOpenFranklin", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SwitchOpenFranklin")
    end
end)

menu.toggle(miscpostfxmenu, "SwitchOpenMichaelIn", {"postfxSwitchOpenMichaelIn"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchOpenMichaelIn", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SwitchOpenMichaelIn")
    end
end)

menu.toggle(miscpostfxmenu, "SwitchOpenMichaelMid", {"postfxSwitchOpenMichaelMid"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchOpenMichaelMid", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SwitchOpenMichaelMid")
    end
end)

menu.toggle(miscpostfxmenu, "SwitchOpenNeutralFIB5", {"postfxSwitchOpenNeutralFIB5"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchOpenNeutralFIB5", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SwitchOpenNeutralFIB5")
    end
end)

menu.toggle(miscpostfxmenu, "SwitchOpenNeutralOutHeist", {"postfxSwitchOpenNeutralOutHeist"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchOpenNeutralOutHeist", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("SwitchOpenNeutralOutHeist")
    end
end)

menu.action(miscpostfxmenu, "SwitchSceneFranklin", {"postfxSwitchSceneFranklin"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchSceneFranklin", 0, true)
end)

menu.action(miscpostfxmenu, "SwitchSceneMichael", {"postfxSwitchSceneMichael"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchSceneMichael", 0, true)
end)

menu.action(miscpostfxmenu, "SwitchSceneNetural", {"postfxSwitchSceneNetural"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchSceneNetural", 0, true)
end)

menu.action(miscpostfxmenu, "SwitchSceneTrevor", {"postfxSwitchSceneTrevor"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchSceneTrevor", 0, true)
end)

menu.action(miscpostfxmenu, "SwitchShortFranklinIn", {"postfxSwitchShortFranklinIn"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchShortFranklinIn", 0, true)
end)

menu.action(miscpostfxmenu, "SwitchShortFranklinMid", {"postfxSwitchShortFranklinMid"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchShortFranklinMid", 0, true)
end)

menu.action(miscpostfxmenu, "SwitchShortMichaelIn", {"postfxSwitchShortMichaelIn"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchShortMichaelIn", 0, true)
end)

menu.action(miscpostfxmenu, "SwitchShortMichaelMid", {"postfxSwitchShortMichaelMid"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchShortMichaelMid", 0, true)
end)
menu.action(miscpostfxmenu, "SwitchShortNeutralIn", {"postfxSwitchShortNeutralIn"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchShortNeutralIn", 0, true)
end)

menu.action(miscpostfxmenu, "SwitchShortTrevorIn", {"postfxSwitchShortTrevorIn"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchShortTrevorIn", 0, true)
end)

menu.action(miscpostfxmenu, "SwitchShortTrevorMid", {"postfxSwitchShortTrevorMid"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("SwitchShortTrevorMid", 0, true)
end)

menu.toggle(miscpostfxmenu, "TinyRacerGreen", {"postfxTinyRacerGreen"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("TinyRacerGreen", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("TinyRacerGreen")
		GRAPHICS.ANIMPOSTFX_PLAY("TinyRacerGreenOut", 0, true)
    end
end)

menu.toggle(miscpostfxmenu, "TinyRacerIntroCam", {"postfxTinyRacerIntroCam"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("TinyRacerIntroCam", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("TinyRacerIntroCam")
    end
end)

menu.toggle(miscpostfxmenu, "TinyRacerPink", {"postfxTinyRacerPink"}, "", function(on)
	if on then
        GRAPHICS.ANIMPOSTFX_PLAY("TinyRacerPink", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("TinyRacerPink")
		GRAPHICS.ANIMPOSTFX_PLAY("TinyRacerPinkOut", 0, true)
    end
end)

menu.action(miscpostfxmenu, "WeaponUpgrade", {"postfxWeaponUpgrade"}, "", function(on)
        GRAPHICS.ANIMPOSTFX_PLAY("WeaponUpgrade", 0, true)
end)

rlight = 255
menu.slider(misclightmenu, "R", {"lightred"}, "", 0, 255, 255, 1, function(s)
	rlight = s 
end)

glight = 255
menu.slider(misclightmenu, "G", {"lightgreen"}, "", 0, 255, 255, 1, function(s)
	glight = s
end)

blight = 255
menu.slider(misclightmenu, "B", {"lightblue"}, "", 0, 255, 255, 1, function(s)
	blight = s
end)

Radiuslight = 1
menu.slider(misclightmenu, LIGHT_RADIUS, {"lightradius"}, "", 0, 9000, 1, 1, function(s)
	Radiuslight = s
end)

intenslight = 1
menu.slider(misclightmenu, LIGHT_INTENS, {"lightintensity"}, "", 0, 1000, 1, 1, function(s)
	intenslight = s
end)

menu.toggle_loop(misclightmenu, LIGHT_ON, {"lighton"}, "", function()
	GRAPHICS.DRAW_LIGHT_WITH_RANGE(pos.x, pos.y, pos.z, rlight, glight, blight, Radiuslight, intenslight)
end)

menu.toggle(miscmenu, SKY_IS_THE_LIMIT, {"noboundary"}, "", function(on)
	skyisthelimit = on
	while skyisthelimit do
		PLAYER.EXTEND_WORLD_BOUNDARY_FOR_PLAYER(pos.x, pos.y, pos.z)
		util.yield()
	end
	PLAYER.RESET_WORLD_BOUNDARY_FOR_PLAYER()
end)

menu.toggle(miscmenu, NO_PLAYER_PED_OCCLUSION, {"noocclusion"}, "", function(on)
	nopedocclusion = on
	while nopedocclusion do
		disableocclusion(false)
		util.yield()
	end
	disableocclusion(true)
end)

menu.toggle(miscmenu, DISABLE_STORE, {}, "", function(on)
	nostore = on
	while nostore do
		NETWORK.SET_STORE_ENABLED(false)
		util.yield()
	end
	NETWORK.SET_STORE_ENABLED(true)
end, true)


--------------misc menu end--------------

--------------settings menu--------------
local settingmenu = menu.list(menu.my_root(), SETTING_MENU, {}, "")
local langmenu = menu.list(settingmenu, LANG_MENU..actuallang, {}, "")

chooselang_fr = menu.action(langmenu, "French - Francais", {}, "", function()
	warning(chooselang_fr, "French - français")
end)
chooselang_en = menu.action(langmenu, "English", {}, "", function()
	warning(chooselang_en, "English")
end)


--------------settings menu end--------------
hasbeenexecuted = false
controlveh = off
vehcontrol = 0
distancehalt = 0 
timehalt = 1
--------------online player menu--------------
generate_features = function(pid)
	menu.divider(menu.player_root(pid),'Fun menu')
	if (pid == 0) then
		pedmodelattack0 = 0
	end
	if (pid == 1) then
		pedmodelattack1 = 0
	end
	if (pid == 2) then
		pedmodelattack2 = 0
	end
	if (pid == 3) then
		pedmodelattack3 = 0
	end
	if (pid == 4) then
		pedmodelattack4 = 0
	end
	if (pid == 5) then
		pedmodelattack5 = 0
	end
	if (pid == 6) then
		pedmodelattack6 = 0
	end
	if (pid == 7) then
		pedmodelattack7 = 0
	end
	if (pid == 8) then
		pedmodelattack8 = 0
	end
	if (pid == 9) then
		pedmodelattack9 = 0
	end
	if (pid == 10) then
		pedmodelattack10 = 0
	end
	if (pid == 11) then
		pedmodelattack11 = 0
	end
	if (pid == 12) then
		pedmodelattack12 = 0
	end
	if (pid == 13) then
		pedmodelattack13 = 0
	end
	if (pid == 14) then
		pedmodelattack14 = 0
	end
	if (pid == 15) then
		pedmodelattack15 = 0
	end
	if (pid == 16) then
		pedmodelattack16 = 0
	end
	if (pid == 17) then
		pedmodelattack17 = 0
	end
	if (pid == 18) then
		pedmodelattack18 = 0
	end
	if (pid == 19) then
		pedmodelattack19 = 0
	end
	if (pid == 20) then
		pedmodelattack20 = 0
	end
	if (pid == 21) then
		pedmodelattack21 = 0
	end
	if (pid == 22) then
		pedmodelattack22 = 0
	end
	if (pid == 23) then
		pedmodelattack23 = 0
	end
	if (pid == 24) then
		pedmodelattack24 = 0
	end
	if (pid == 25) then
		pedmodelattack25 = 0
	end
	if (pid == 26) then
		pedmodelattack26 = 0
	end
	if (pid == 27) then
		pedmodelattack27 = 0
	end
	if (pid == 28) then
		pedmodelattack28 = 0
	end
	if (pid == 29) then
		pedmodelattack29 = 0
	end
	if (pid == 30) then
		pedmodelattack30 = 0
	end
	if (pid == 31) then
		pedmodelattack31 = 0
	end
	if (pid == 32) then
		pedmodelattack32 = 0
	end
	-------------------------------------vehicle menu--------------------------------------------
	local vehonlinemenu = menu.list(menu.player_root(pid), VEH_ONLINE_MENU, {}, "")
	local lunchvehmenu = menu.list(vehonlinemenu, VEH_LUNCH_MENU, {}, "")
	local haltvehmenu = menu.list(vehonlinemenu, HALT_VEH_SUBMENU, {}, "")

	menu.action(lunchvehmenu, LUNCH_UP, {}, "", function()
		requestControlLoop(getveh(pid))
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(getveh(pid), 1, 0, 0, 100000, false, true, true, true)
	end)
	menu.action(lunchvehmenu, LUNCH_DOWN, {}, "", function()
		requestControlLoop(getveh(pid))
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(getveh(pid), 1, 0, 0, -100000, false, true, true, true)
	end)
	menu.action(lunchvehmenu, LUNCH_RIGHT, {}, "", function()
		requestControlLoop(getveh(pid))
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(getveh(pid), 1, 100000, 0, 0, false, true, true, true)
	end)
	menu.action(lunchvehmenu, LUNCH_LEFT, {}, "", function()
		requestControlLoop(getveh(pid))
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(getveh(pid), 1, -100000, 0, 0, false, true, true, true)
	end)
	menu.action(lunchvehmenu, LUNCH_FOWARD, {}, "", function()
		requestControlLoop(getveh(pid))
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(getveh(pid), 1, 0, 100000, 0, false, true, true, true)
	end)
	menu.action(lunchvehmenu, LUNCH_BACKWARD, {}, "", function()
		requestControlLoop(getveh(pid))
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(getveh(pid), 1, 0, -100000, 0, false, true, true, true)
	end)

	menu.action(vehonlinemenu, EXPL_PLY_VEH, {}, "", function()
		requestControlLoop(getveh(pid))
		NETWORK.NETWORK_EXPLODE_VEHICLE(getveh(pid), true, true, false)
	end)

	menu.action(vehonlinemenu, ROT_180, {}, "", function()
		tick = 0
		head = ENTITY.GET_ENTITY_HEADING(getveh(pid))
		pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		headc = head+180
		if headc>360 then 
			headf = headc-360
		else
			headf = headc
		end
		while (tick < 25)do
			requestControlLoop(getveh(pid))
			head = ENTITY.GET_ENTITY_HEADING(getveh(pid))
			requestControlLoop(getveh(pid))
			ENTITY.SET_ENTITY_HEADING(getveh(pid), headf)
			tick = tick +1
			util.yield(10)
		end
	end)
	menu.action(vehonlinemenu, TRP_OCEAN, {}, "", function()
		requestControlLoop(getveh(pid))
		ENTITY.SET_ENTITY_COORDS_NO_OFFSET(getveh(pid), '-7000', '-743', '45')
	end)

	menu.action(haltvehmenu, HALT_VEH, {}, "", function()
		requestControlLoop(getveh(pid))
		VEHICLE.BRING_VEHICLE_TO_HALT(getveh(pid), getmenuvalueplayer(pid, VEH_ONLINE_MENU..">"..HALT_VEH_SUBMENU..">"..HALT_DISTANCE_VEH), getmenuvalueplayer(pid, VEH_ONLINE_MENU..">"..HALT_VEH_SUBMENU..">"..HALT_TIME_VEH))
	end)
	
	menu.slider(haltvehmenu, HALT_DISTANCE_VEH, {"haltdist"}, HALT_DISTANCE_VEH_DESC, 0, 2147483646, 0, 1, function(s)
		
	end)

	menu.slider(haltvehmenu, HALT_TIME_VEH, {"halttime"}, HALT_TIME_VEH_DESC, 1, 2147483646, 1, 1, function(s)
		
	end)
	menu.action(vehonlinemenu, FIX_VEH_ONLINE, {}, "", function()
		requestControlLoop(getveh(pid))
		fixveh(getveh(pid))
	end)

	menu.toggle(vehonlinemenu, NO_LOCK_ON, {""}, "", function(on)
		while (menu.get_value(menu.ref_by_path("Players>"..players.get_name_with_tags(pid)..">"..VEH_ONLINE_MENU..">"..NO_LOCK_ON)) == 1) do
			util.yield(10000)
			VEHICLE._SET_VEHICLE_CAN_BE_LOCKED_ON(getveh(pid), false)
			requestControlLoop(getveh(pid))
			util.yield()
		end
		requestControlLoop(getveh(pid))
		VEHICLE._SET_VEHICLE_CAN_BE_LOCKED_ON(getveh(pid), true)
	end)
	menu.action(vehonlinemenu, CHILD_LOCK, {}, "", function()
		VEHICLE.SET_VEHICLE_DOORS_LOCKED(getveh(pid), 4)
	end)
	menu.toggle(vehonlinemenu, CONTROL_OTHER, {"controlvehply"}, "", function(on)
		controlveh = on
		if controlveh then
			menu.trigger_commands("spectate"..PLAYER.GET_PLAYER_NAME(pid).." on")
			util.yield(2500)
		end
		if pid == PLAYER.PLAYER_ID() then
			util.toast("you can already drive your car with out this option")
			menu.trigger_commands("controlvehply"..PLAYER.GET_PLAYER_NAME(pid).." off")
			controlveh = off
		end
		if controlveh and PED.IS_PED_IN_ANY_VEHICLE(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), false) then
			oldcoord = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID())
			menu.trigger_commands("copyvehicle"..PLAYER.GET_PLAYER_NAME(pid))
			util.yield(100)
			vehcontrol = veh
			menu.trigger_commands("invisibility on")
			menu.trigger_commands("vehinvisibility on")
			menu.trigger_commands("vehiclenocollision on")
			poscontrol = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), false)
			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(vehcontrol, poscontrol.x, poscontrol.y, poscontrol.z, true, false, false)
			poscontrol = ENTITY.GET_ENTITY_ROTATION(getveh(pid), 0)
			ENTITY.SET_ENTITY_ROTATION(vehcontrol, poscontrol.x, poscontrol.y, poscontrol.z, 0, false)
			requestControlLoop(getveh(pid))
			ENTITY.ATTACH_ENTITY_TO_ENTITY(getveh(pid), vehcontrol, 0, 0, 0, 0, 0, 0, 0, false, false, false, false, 0, true)
			menu.trigger_commands("vehiclenocollision off")
			util.yield(500)
			ENTITY.SET_ENTITY_VISIBLE(getveh(pid), true, false)
			menu.trigger_commands("spectate"..PLAYER.GET_PLAYER_NAME(pid).." off")
			hasbeenexecuted = true
		end
		if controlveh and not PED.IS_PED_IN_ANY_VEHICLE(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), false) then
			util.toast("not in a vehicle")
			menu.trigger_commands("controlvehply"..PLAYER.GET_PLAYER_NAME(pid).." off")
		end
		while controlveh do
			requestControlLoop(getveh(pid))
			ENTITY.SET_ENTITY_VISIBLE(getveh(pid), true, true)
			util.yield()
		end
		if hasbeenexecuted then
			menu.trigger_commands("invisibility off")
			menu.trigger_commands("vehinvisibility off")
			entities.delete_by_handle(vehcontrol)
			util.yield(500)
			ENTITY.SET_ENTITY_VISIBLE(getveh(pid), true, false)
			ENTITY.SET_ENTITY_COLLISION(getveh(pid), true, true)
			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(plyped(), oldcoord.x, oldcoord.y, oldcoord.z, true, false, false)
			util.toast("has finished")
			hasbeenexecuted = false
		end
		menu.trigger_commands("spectate"..PLAYER.GET_PLAYER_NAME(pid).." off")
	end)
	-------------------------------------Vehicle menu end--------------------------------------------
	-------------------------------------Trolling menu--------------------------------------------
	local trollonlinemenu = menu.list(menu.player_root(pid), TROLL_MENU, {}, "")
	local pedattackmenu = menu.list(trollonlinemenu, PED_ATTACK_MENU, {}, "")
	local settingpedattackmenu = menu.list(pedattackmenu, SETTING_PED_ATTACK_MENU, {}, "")

	menu.toggle(settingpedattackmenu, INVIC_PED_ATTACKER, {""}, "", function()
		
	end)
	menu.toggle(settingpedattackmenu, INV_PED_ATTACKER, {""}, "", function()
		
	end)
	menu.toggle(settingpedattackmenu, SPAWN_ON_PLAYER, {""}, SPAWN_ON_PLAYER_DESC, function()
		
	end)
	menu.text_input(pedattackmenu, PED_ATTACK_MODEL, {"attackmodel"}, "", function(s)
		if (pid == 0) then
			pedmodelattack0 = s
		end
		if (pid == 1) then
			pedmodelattack1 = s
		end
		if (pid == 2) then
			pedmodelattack2 = s
		end
		if (pid == 3) then
			pedmodelattack3 = s
		end
		if (pid == 4) then
			pedmodelattack4 = s
		end
		if (pid == 5) then
			pedmodelattack5 = s
		end
		if (pid == 6) then
			pedmodelattack6 = s
		end
		if (pid == 7) then
			pedmodelattack7 = s
		end
		if (pid == 8) then
			pedmodelattack8 = s
		end
		if (pid == 9) then
			pedmodelattack9 = s
		end
		if (pid == 10) then
			pedmodelattack10 = s
		end
		if (pid == 11) then
			pedmodelattack11 = s
		end
		if (pid == 12) then
			pedmodelattack12 = s
		end
		if (pid == 13) then
			pedmodelattack13 = s
		end
		if (pid == 14) then
			pedmodelattack14 = s
		end
		if (pid == 15) then
			pedmodelattack15 = s
		end
		if (pid == 16) then
			pedmodelattack16 = s
		end
		if (pid == 17) then
			pedmodelattack17 = s
		end
		if (pid == 18) then
			pedmodelattack18 = s
		end
		if (pid == 19) then
			pedmodelattack19 = s
		end
		if (pid == 20) then
			pedmodelattack20 = s
		end
		if (pid == 21) then
			pedmodelattack21 = s
		end
		if (pid == 22) then
			pedmodelattack22 = s
		end
		if (pid == 23) then
			pedmodelattack23 = s
		end
		if (pid == 24) then
			pedmodelattack24 = s
		end
		if (pid == 25) then
			pedmodelattack25 = s
		end
		if (pid == 26) then
			pedmodelattack26 = s
		end
		if (pid == 27) then
			pedmodelattack27 = s
		end
		if (pid == 28) then
			pedmodelattack28 = s
		end
		if (pid == 29) then
			pedmodelattack29 = s
		end
		if (pid == 30) then
			pedmodelattack30 = s
		end
		if (pid == 31) then
			pedmodelattack31 = s
		end
		if (pid == 32) then
			pedmodelattack32 = s
		end
	end)
	
	menu.slider(pedattackmenu, NUMBER_PED_ATTACK, {""}, "", 0, 20, 1, 1, function()
	
	end)
	menu.action(pedattackmenu, SPAWN_ATTACKER, {}, "", function()
		if (pid == 0) then
			pedmodelforattack = pedmodelattack0
		end
		if (pid == 1) then
			pedmodelforattack = pedmodelattack1
		end
		if (pid == 2) then
			pedmodelforattack = pedmodelattack2
		end
		if (pid == 3) then
			pedmodelforattack = pedmodelattack3
		end
		if (pid == 4) then
			pedmodelforattack = pedmodelattack4
		end
		if (pid == 5) then
			pedmodelforattack = pedmodelattack5
		end
		if (pid == 6) then
			pedmodelforattack = pedmodelattack6
		end
		if (pid == 7) then
			pedmodelforattack = pedmodelattack7
		end
		if (pid == 8) then
			pedmodelforattack = pedmodelattack8
		end
		if (pid == 9) then
			pedmodelforattack = pedmodelattack9
		end
		if (pid == 10) then
			pedmodelforattack = pedmodelattack10
		end
		if (pid == 11) then
			pedmodelforattack = pedmodelattack11
		end
		if (pid == 12) then
			pedmodelforattack = pedmodelattack12
		end
		if (pid == 13) then
			pedmodelforattack = pedmodelattack13
		end
		if (pid == 14) then
			pedmodelforattack = pedmodelattack14
		end
		if (pid == 15) then
			pedmodelforattack = pedmodelattack15
		end
		if (pid == 16) then
			pedmodelforattack = pedmodelattack16
		end
		if (pid == 17) then
			pedmodelforattack = pedmodelattack17
		end
		if (pid == 18) then
			pedmodelforattack = pedmodelattack18
		end
		if (pid == 19) then
			pedmodelforattack = pedmodelattack19
		end
		if (pid == 20) then
			pedmodelforattack = pedmodelattack20
		end
		if (pid == 21) then
			pedmodelforattack = pedmodelattack21
		end
		if (pid == 22) then
			pedmodelforattack = pedmodelattack22
		end
		if (pid == 23) then
			pedmodelforattack = pedmodelattack23
		end
		if (pid == 24) then
			pedmodelforattack = pedmodelattack24
		end
		if (pid == 25) then
			pedmodelforattack = pedmodelattack25
		end
		if (pid == 26) then
			pedmodelforattack = pedmodelattack26
		end
		if (pid == 27) then
			pedmodelforattack = pedmodelattack27
		end
		if (pid == 28) then
			pedmodelforattack = pedmodelattack28
		end
		if (pid == 29) then
			pedmodelforattack = pedmodelattack29
		end
		if (pid == 30) then
			pedmodelforattack = pedmodelattack30
		end
		if (pid == 31) then
			pedmodelforattack = pedmodelattack31
		end
		if (pid == 32) then
			pedmodelforattack = pedmodelattack32
		end
		if (getmenuvalueplayer(pid, TROLL_MENU..">"..PED_ATTACK_MENU..">"..SETTING_PED_ATTACK_MENU..">"..SPAWN_ON_PLAYER) == 0) then
			doesspawnonplayer = false
		else
			doesspawnonplayer = true
		end
		if (getmenuvalueplayer(pid, TROLL_MENU..">"..PED_ATTACK_MENU..">"..SETTING_PED_ATTACK_MENU..">"..INVIC_PED_ATTACKER) == 0) then
			isinvicible = false
		else
			isinvicible = true
		end
		if (getmenuvalueplayer(pid, TROLL_MENU..">"..PED_ATTACK_MENU..">"..SETTING_PED_ATTACK_MENU..">"..INV_PED_ATTACKER) == 0) then
			isinvisible = false
		else
			isinvisible = true
		end
		whatmodel = getmenuvalueplayer(pid, TROLL_MENU..">"..PED_ATTACK_MENU..">"..PED_ATTACK_MODEL)
		numbertospawn = getmenuvalueplayer(pid, TROLL_MENU..">"..PED_ATTACK_MENU..">"..NUMBER_PED_ATTACK)
		spawnpedattack(pid, pedmodelforattack, numbertospawn, isinvicible, isinvisible, doesspawnonplayer)
	end)

	menu.toggle(trollonlinemenu, PLANE_ATTACK, {"planeattack"}, "", function(on)
	posplane = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		if (getmenuvalueplayer(pid, TROLL_MENU..">"..PLANE_ATTACK) == 1) then
			planespawnz = 100
			headplane = 0
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
			spawnplaneforattack(posplane, PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), planespawnz, headplane)
			planespawnz = planespawnz+10
			headplane = headplane+36
		end
		while (getmenuvalueplayer(pid, TROLL_MENU..">"..PLANE_ATTACK) == 1) do
		
			util.yield()
		end
		if (getmenuvalueplayer(pid, "Spectate>Ninja Method") == 0) then
			menu.trigger_commands("spectate"..PLAYER.GET_PLAYER_NAME(pid).." on")
		end
		util.yield(1000)
		delattackplane("Lazer")
		if (getmenuvalueplayer(pid, "Spectate>Ninja Method") == 1) then
			menu.trigger_commands("spectate"..PLAYER.GET_PLAYER_NAME(pid).." off")
		end
	end)

	-------------------------------------Trolling menu end--------------------------------------------

	menu.toggle(menu.player_root(pid), GHOST_PLAYER, {}, "", function(toggle)
		 NETWORK._SET_RELATIONSHIP_TO_PLAYER(pid, toggle)
		 
	end)
	menu.action(menu.player_root(pid), COPY_INFO, {}, "", function()
		util.copy_to_clipboard("Name : "..players.get_name(pid).." RID : "..players.get_rockstar_id(pid))
	end)
end

for _, pId in ipairs(players.list()) do
	generate_features(pId)
end
players.on_join(generate_features)

loadingtimeend = util.current_time_millis()
util.show_corner_help(WELCOM_MESS.. loadingtimeend-loadtimestart ..WELCOM_MESS_2)
--------------online player menu end--------------

while true do
	pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID())
	vehlast = entities.get_user_vehicle_as_handle()
	veh = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()), false)
	if not NETWORK.NETWORK_IS_SESSION_STARTED() then 
		menu.set_visible(specialability, true)
	end
	if NETWORK.NETWORK_IS_SESSION_STARTED()  then 
		menu.set_visible(specialability, false)
	end
	
	util.yield()
end