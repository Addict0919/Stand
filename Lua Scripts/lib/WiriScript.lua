-------------------------------------------------------------------WiriScript V2-------------------------------------------------------------------------------------------
--[[ Thanks to
		
		MrPainKiller for the name suggestion,
		Koda,
		ICYPhoenix,
		jayphen,
		Fwishky,
		Sainan

and all other developers who shared their work and nice people who helped me. All of you guys teached me things I used in this script <3.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
This is an open code for you to use and share. Feel free to add, modify or remove features as long as you don't try to sell this script. Please consider 
sharing your own versions with Stand's community.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
To have 'Detach Entities' installed would be a good idea. You don't want a monkey attached to a player forever. :D I didn't include detach options cuz
such a nice script exists. 
--]]
-------------------------------------------------------------------dev: nowiry------------------------------------------------------------------------------------------
require("natives-1614644776")
json = require("json")
script = {}

local audible = true
local shake, delay = 1, 300 --default shake camera and loop delay
local ped_weapon, ped_type = "weapon_pistol", "s_f_y_cop_01" --these are the default weapon and appearance for attackers
local scriptdir = filesystem.scripts_dir()
local owned = false
local cage_type = 1
local spoofname, spoofrid = true, true
local standlike

function game_notification(message)
	GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT("DIA_ZOMBIE1", 0)
	while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED("DIA_ZOMBIE1") do
		util.yield()
	end
	HUD.BEGIN_TEXT_COMMAND_THEFEED_POST("STRING")
	HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(message..".")

	local tittle = "WiriScript"
	local subtitle = "Notification"
	HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT("DIA_ZOMBIE1", "DIA_ZOMBIE1", true, 4, tittle, subtitle)

	HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)
end

function stand_notification(message)
	util.toast(tostring(message.."."), TOAST_ABOVE_MAP)
end

function shownotification(message)
	if not standlike then
		game_notification(message)
	else
		message = "[WiriScript] "..message
		stand_notification(message)
	end
end


local weapons = {						--here you can modify which weapons are available to choose
	{"Pistol", "weapon_pistol"}, --{'name shown in Stand', 'weapon ID'}
	{"Stun Gun", "weapon_stungun"},
	{"Up-n-Atomizer", "weapon_raypistol"},
	{"Special Carabine", "weapon_specialcarbine"},
	{"Pump Shotgun", "weapon_pumpshotgun"},
	{"Combat MG", "weapon_combatmg"},
	{"Heavy Sniper", "weapon_heavysniper"},
	{"Minigun", "weapon_minigun"},
	{"RPG", "weapon_rpg"}
}

local random_weapons = {
	"weapon_pistol",
	"weapon_specialcarbine", 
	"weapon_combatmg",
	"weapon_pumpshotgun",
	"weapon_assaultrifle", 
	"weapon_microsmg"
}

local melee_weapons = {
	{"Unarmed", "weapon_unarmed"}, --{'name shown in Stand', 'weapon ID'}
	{"Knife", "weapon_knife"},
	{"Machete", "weapon_machete"},
	{"Battle Axe", "weapon_battleaxe"},
	{"Wrench", "weapon_wrench"},
	{"Hammer", "weapon_hammer"},
	{"Baseball Bat", "weapon_bat"}
}

local peds = {									--here you can modify which peds are available to choose
	{"Prisoner", "s_m_y_prismuscl_01"}, --{'name shown in Stand', 'ped model ID'}
	{"Mime", "s_m_y_mime"},
	{"Astronaut", "s_m_m_movspace_01"},
	{"Black Ops Soldier", "s_m_y_blackops_01"},
	{"SWAT", "s_m_y_swat_01"},
	{"Ballas Ganster", "csb_ballasog"},
	{"Female Police Officer", "s_f_y_cop_01"},
	{"Male Police Officer", "s_m_y_cop_01"},
	{"Jesus", "u_m_m_jesus_01"},
	{"Zombie", "u_m_y_zombie_01"},
	{"Juggernaut", "u_m_y_juggernaut_01"},
	{"Clown", "s_m_y_clown_01"}
}

local random_peds = {				--add IDs here if you want
	"s_m_y_prismuscl_01",
	"s_m_y_mime",
	"s_m_m_movspace_01",
	"s_m_y_blackops_01",
	"s_m_y_swat_01",
	"csb_ballasog",
	"cs_movpremf_01",
	"a_f_m_prolhost_01",
	"g_m_y_ballasout_01",
	"g_m_y_lost_02",
	"g_m_y_ballaeast_01",
	"s_f_y_cop_01",
	"ig_claypain",
	"u_m_m_jesus_01",
	"u_m_y_rsranger_01",
	"u_m_y_imporage",
	"u_m_y_zombie_01",
	"u_m_y_juggernaut_01",
	"s_m_y_clown_01",
	"s_m_y_cop_01"
}

local gunner_weapon_list = {              --these are the buzzard's gunner weapons. You can include some (make sure gunners can use them from heli :O)
	{"Combat MG", "weapon_combatmg"},
	{"RPG", "weapon_rpg"}
}

function explode(pid, type, owned)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
	pos.z = pos.z-0.9
	
	if not owned then
		FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, type, 1000, audible, invisible, shake, false)
	else
		FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED(players.user()), pos.x, pos.y, pos.z, type, 1000, audible, invisible, shake, true)
	end
end

cages = {}
function cage_player(pos, type)
	pos.z = pos.z - 0.9
	local object = {}
	local object_name ={
		"prop_gold_cont_01b",
		"prop_rub_cage01a"
	}
	local hash = util.joaat(object_name[type])
	STREAMING.REQUEST_MODEL(hash)
	while not STREAMING.HAS_MODEL_LOADED(hash) do
		util.yield()
	end
	object[1] = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, true) --why do you think I spawned the same object twice? lol --just one of these objects is useless
	if type == 2 then
		pos.z = pos.z + 2.2
	end
	object[2] = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, true)
	for k, v in pairs(object) do
		if v == 0 then --if 'CREATE_OBJECT' fails to create one of the objects
			shownotification("~r~Something went wrong creating cage")
			return
		end
		cages[#cages+1] = v
		ENTITY.FREEZE_ENTITY_POSITION(v, true)
	end
	local rot  = ENTITY.GET_ENTITY_ROTATION(object[2])
	if type == 1 then
		rot.z = 180
	end
	if type == 2 then
		rot.x = -180
		rot.z = 90
	end
	ENTITY.SET_ENTITY_ROTATION(object[2], rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
end

attackers = {}
function spawn_attacker(pid, ped_type, ped_weapon, godmode, stationary)
	local player_ped = PLAYER.GET_PLAYER_PED(pid)
	
	local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
	pos.z = pos.z - 0.9
	pos.x  = pos.x + math.random(-3, 3)
	pos.y = pos.y + math.random(-3, 3)

	local ped_hash = util.joaat(ped_type)
	local weapon_hash = util.joaat(ped_weapon)
	STREAMING.REQUEST_MODEL(ped_hash)
	while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
		util.yield()
	end
	local ped = util.create_ped(0, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
	attackers[#attackers + 1] = ped

	WEAPON.GIVE_WEAPON_TO_PED(ped, weapon_hash, 9999, true, true)
	ENTITY.SET_ENTITY_INVINCIBLE(ped, godmode)
	PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
	TASK.TASK_COMBAT_PED(ped, player_ped, 0, 16)
	if stationary then
		PED.SET_PED_COMBAT_MOVEMENT(ped, 0)
	end
	PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, 1)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
end 

function shoot_owned_bullet(pid, weaponID, damage)
	local user = PLAYER.GET_PLAYER_PED(players.user())
	local player_ped = PLAYER.GET_PLAYER_PED(pid)
	local player_pos = ENTITY.GET_ENTITY_COORDS(player_ped)
	local spawn_pos = CAM.GET_GAMEPLAY_CAM_COORD()
	local weapon_hash = util.joaat(weaponID)
	if pid ~= players.user() then --the bullets can't hit the user's ped, that's why it's not available for own use
		MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(spawn_pos.x, spawn_pos.y, spawn_pos.z, player_pos.x , player_pos.y, player_pos.z, damage, 0, weapon_hash, user, true, false, 1000)
	else
		shownotification("~r~Not available for own use")
	end
end

buzzard_entities = {}
function spawn_buzzard(pid, gunner_weapon, collision)
	local player_ped =  PLAYER.GET_PLAYER_PED(pid)
	local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
	pos.x = pos.x + math.random(-20, 20)
	pos.y = pos.y + math.random(-20, 20)
	pos.z = pos.z + math.random(20, 40)

	PED.SET_PED_RELATIONSHIP_GROUP_HASH(player_ped, util.joaat("PLAYER"))

	local heli_hash = util.joaat("buzzard2")
	local ped_hash = util.joaat("s_m_y_blackops_01")
	STREAMING.REQUEST_MODEL(ped_hash)
	STREAMING.REQUEST_MODEL(heli_hash)
	while not STREAMING.HAS_MODEL_LOADED(ped_hash) or not STREAMING.HAS_MODEL_LOADED(heli_hash) do
		util.yield()
	end
	local heli = util.create_vehicle(heli_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
	buzzard_entities[#buzzard_entities + 1] = heli
	
	if not collision then
		VEHICLE._DISABLE_VEHICLE_WORLD_COLLISION(heli)
	end
	
	ENTITY.SET_ENTITY_INVINCIBLE(heli, buzzard_godmode)
	ENTITY.SET_ENTITY_VISIBLE(heli, buzzard_visible, 0)	
	VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, true)
	VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli)
		
	local pilot = util.create_ped(5, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
	buzzard_entities[#buzzard_entities + 1] = pilot
	
	PED.SET_PED_RELATIONSHIP_GROUP_HASH(pilot, util.joaat("ARMY"))
	ENTITY.SET_ENTITY_VISIBLE(pilot, buzzard_visible, 0)
	PED.SET_PED_INTO_VEHICLE(pilot, heli, -1)
	PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilot, true)

	PED.SET_PED_MAX_HEALTH(pilot, 500)
	ENTITY.SET_ENTITY_HEALTH(pilot, 500)
	ENTITY.SET_ENTITY_INVINCIBLE(pilot, buzzard_godmode)

	local gunner = {}
	for i  = 1, 2 do
		gunner[i] = util.create_ped(29, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		buzzard_entities[#buzzard_entities + 1] = gunner[i]
		PED.SET_PED_INTO_VEHICLE(gunner[i], heli, i)
		WEAPON.GIVE_WEAPON_TO_PED(gunner[i], util.joaat(gunner_weapon) , 9999, false, true)
		PED.SET_PED_COMBAT_ATTRIBUTES(gunner[i], 20 --[[ they can shoot from vehicle ]], true)
		PED.SET_PED_MAX_HEALTH(gunner[i], 500)
		ENTITY.SET_ENTITY_HEALTH(gunner[i], 500)
		ENTITY.SET_ENTITY_INVINCIBLE(gunner[i], buzzard_godmode)
		ENTITY.SET_ENTITY_VISIBLE(gunner[i], buzzard_visible, 0)
		PED.SET_PED_SHOOT_RATE(gunner[i], 1000)
		PED.SET_PED_RELATIONSHIP_GROUP_HASH(gunner[i], util.joaat("ARMY"))
		TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(gunner[i], 1000, 0)
	end
	
	util.create_thread(function()
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("ARMY"), util.joaat("PLAYER"))
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("PLAYER"), util.joaat("ARMY"))
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(0, util.joaat("ARMY"), util.joaat("ARMY"))
	end)

	shownotification("Buzzard sent to "..PLAYER.GET_PLAYER_NAME(pid))
	return pilot, heli
end	

function request_control_ent(entity)
	if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) then
		local tick = 0
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
		while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick <= 10 do
			NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
			tick = tick + 1
			util.yield()
		end
	end
	return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity)
end

function get_nearby_entities(pid, radius, peds, vehicles)
	local entities = {}
	local player_ped = PLAYER.GET_PLAYER_PED(pid)
	local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
	local player_veh = PED.GET_VEHICLE_PED_IS_IN(player_ped, false)
	
	if vehicles then
		for key, value in pairs(util.get_all_vehicles()) do
			local veh_pos = ENTITY.GET_ENTITY_COORDS(value)
			if value ~= player_veh then
				if MISC.GET_DISTANCE_BETWEEN_COORDS(pos.x, pos.y, pos.z, veh_pos.x, veh_pos.y, veh_pos.z, true) <= radius then
					entities[#entities + 1] = value
				end
			end
		end
	end
	if peds then
		for key, value in pairs(util.get_all_peds()) do
			if value ~= player_ped then
				local ped_pos = ENTITY.GET_ENTITY_COORDS(value)
				if MISC.GET_DISTANCE_BETWEEN_COORDS(pos.x, pos.y, pos.z, ped_pos.x, ped_pos.y, ped_pos.z, true) <= radius and not PED.IS_PED_A_PLAYER(value) then 
					entities[#entities + 1] = value
				end
			end
		end
	end
	for key, value in pairs(entities) do
		local entity_pos = ENTITY.GET_ENTITY_COORDS(value)
		if MISC.GET_DISTANCE_BETWEEN_COORDS(pos.x, pos.y, pos.z, entity_pos.x, entity_pos.y, entity_pos.z, true) >= radius then
			entities[key] = nil
		end
	end
	return entities
end

function delete_all_entities(list, name)
	local tick = 0
	local deleted = 0
	if #list == 0 then
		shownotification("~r~No spawned "..name.." found")
		return
	end
	for key, value in pairs(list) do
		while ENTITY.DOES_ENTITY_EXIST(value) and tick <= 1000 do
			request_control_ent(value)
			util.delete_entity(value)
			tick = tick + 1
			util.yield()
		end
		tick = 0
		if not ENTITY.DOES_ENTITY_EXIST(value) then
			deleted = deleted + 1
			list[key] = nil
		end
	end
	if deleted ~= 0 then
		shownotification("~r~"..deleted.." ~s~entities were succesfully deleted")
	end
	if #list ~= 0 then
		shownotification("~r~"..(#list-deleted).." ~s~entities couldn't be deleted")
	end
end

local function get_rid(pid)
	handle_ptr = memory.alloc(4 * 13)
   	NETWORK.NETWORK_HANDLE_FROM_PLAYER(pid, handle_ptr, 13)
  	local rid = NETWORK.NETWORK_MEMBER_ID_FROM_GAMER_HANDLE(handle_ptr)
  	memory.free(handle_ptr)
  	return rid
end

settings = menu.list(menu.my_root(), "Settings", {}, "")

menu.divider(settings, "Settings")

local display = true
menu.toggle(settings, "Display Health Info When Modding Health", {}, "", function(on)
	display = on
end, true)

menu.toggle(settings, "Use Stand's notifications", {}, "Allows you to return to Stand's notification appearance", function(on)
	standlike = on
end)

-------------------------------------------------save name stuff*-------------------------------------------------------------------------------

local namedata = {}
nameloaddata = (scriptdir.."\\savednames.data")

function namesload()
	if not filesystem.exists(nameloaddata) then return end
	local savednames = menu.list(menu.my_root(), "Saved Names", {}, "")

	local function add_name_to_savednames(name)
		menu.action(savednames, name, {}, "Click to paste name in Online/Spoofing/Name Spoofing/Spoofed Name. You might use Stand\'s 'Get Spoofed RID From Spoofed Name' option before RID spoofing.", function() 
			menu.trigger_commands("spoofedname "..name)
			shownotification("Spoofed name: ~r~"..name.."~s~")
		end)
	end
	
	menu.divider(savednames,"Saved Names")
    for line in io.lines(nameloaddata) do namedata[#namedata + 1] = line end
    for i = 1, #namedata do
    	add_name_to_savednames(namedata[i])
	end
	shownotification("Saved names loaded: ~r~"..#namedata.."~s~")
end
namesload()

-----------------------------------------------------------spoofing profile stuff--------------------------------------------------------------------

local profiles = menu.list(menu.my_root(), "Spoofing Profiles", {}, "")
local usingprofile = false

menu.action(profiles, "Disable Current Spoofing Profile", {}, "", function()
	if usingprofile then 
		menu.trigger_commands("spoofname off")
		menu.trigger_commands("spoofrid off")
		shownotification("Spoofing profile disabled. You will need to change session for others to see the change")
		usingprofile = false
	else
		shownotification("~r~You are not using any spoofing profile")
	end
end)
	
menu.divider(profiles, "Spoofing Profiles")


local profiles_list = {}
profiles_load_data = (scriptdir.."\\WiriScript\\Profiles.data")

function add_profile_to_list(array)
	local name = array.name
	local rid = array.rid
	
	profile_actions = menu.list(profiles, name, {}, "")
	menu.divider(profile_actions, name)
	
	menu.action(profile_actions, "Enable Spoofing Profile", {}, "", function()
		
		usingprofile = true 
		
		if spoofname then
			menu.trigger_commands("spoofedname "..name)
			menu.trigger_commands("spoofname on")
		end
		if spoofrid then
			menu.trigger_commands("spoofedrid "..rid)
			menu.trigger_commands("spoofrid hard")
		end
		shownotification("Profile applied: ~r~"..name.."~s~. You will need to change session for others to see the change")
	end)
	
	menu.divider(profile_actions, "Spoof Options")
	menu.toggle(profile_actions, "Name", {}, "", function(on)
		spoofname = on
	end, true)
	menu.toggle(profile_actions, "SCID", {}, "", function(on)
		spoofrid = on
	end, true)
end

function profilesload()
	if not filesystem.exists(profiles_load_data) then return end
	for line in io.lines(profiles_load_data) do profiles_list[#profiles_list + 1] = json.decode(line) end
	for i = 1, #profiles_list do
		add_profile_to_list(profiles_list[i])
	end
	shownotification("Spoofing profiles loaded: ~r~"..#profiles_list.."~s~")
end
profilesload()

-------------------------------------------------------------------------------------------------------------------------------------
GenerateFeatures = function(pid)
	menu.divider(menu.player_root(pid),"WiriScript")		
	
---------------------------------------------------create spoofing profile-----------------------------------------------------------------------

	menu.action(menu.player_root(pid), "Create Spoofing Profile", {}, "", function()
		local player_name = PLAYER.GET_PLAYER_NAME(pid)
		local player_rid = get_rid(pid)
		local i = #profiles_list + 1
		if not filesystem.exists(profiles_load_data) or #profiles_list == 0 or profiles_list[1] == "" then
			profiles_list[i] = {name = player_name, rid = player_rid}
			profiles_data = io.open(profiles_load_data, "w")
			profiles_data:write(json.encode(profiles_list[i]).."\n")
			profiles_data:close()
			add_profile_to_list(profiles_list[i])
			shownotification("Spoofing profile created: ~r~"..profiles_list[i].name.."~s~")
		else
			for k, v in pairs(profiles_list) do 
				if profiles_list[k].name == player_name or profiles_list[k].rid == player_rid then 
					shownotification("~r~The spoofing profile already exists")
					return
				end
			end
			profiles_list[i] = {name = player_name, rid = player_rid}
			profiles_data = io.open(profiles_load_data, "a")
			profiles_data:write(json.encode(profiles_list[i]).."\n")
			profiles_data:close()
			add_profile_to_list(profiles_list[i])
			shownotification("Spoofing profile created: ~r~"..profiles_list[i].name.."~s~")
		end
	end)

--------------------------------------------explosion and loop stuff----------------------------------------------------------------------------
	
	trolling_list = menu.list(menu.player_root(pid), "Trolling & Griefing", {}, "")

	explo_settings = menu.list(trolling_list, "Explosion Settings", {}, "")

	menu.divider(explo_settings, "Explosion Settings")

	menu.slider(explo_settings, "Explosion Type", {"explotype"}, "",0,72,0,1, function(value)
		type = value
	end)
	menu.toggle(explo_settings, "Invisible", {}, "", function(on)
		invisible = on
	end, false)
	menu. toggle(explo_settings, "Audible", {}, "", function(on)
		audible = on
	end, true)
	menu.slider(explo_settings, "Camera Shake", {"shake"}, "",0,100,1,1, function(value)
		shake = value
	end)
	menu.toggle(explo_settings, "Owned Explosions", {}, "", function(on)
		owned = on
	end)

	menu.action(trolling_list, "Explode", {}, "", function()
		explode(pid, type, owned)
	end)
		
	menu.toggle(trolling_list, "Explosion Loop", {},"", function(on)
		explosion_loop = on
		while explosion_loop do
			explode(pid, type, owned)
			util.yield(delay)
		end
	end, false)

	menu.slider(trolling_list, "Loop Delay", {"delay"}, "Allows you to change how fast the loops are.",50,1000,300,10, function(value)
		delay = value
	end)

	menu.toggle(trolling_list, "Water Hydrant Loop", {},"", function(on)
		hydrant_loop = on
		while hydrant_loop do
			explode(pid, 13, false)
			util.yield(delay)
		end
	end, false)

	menu.action(trolling_list, "Kill as Orbital Cannon", {}, "", function()
		menu.trigger_commands("becomeorbitalcannon on") 
		util.yield(200)
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
		FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED(players.user()), pos.x, pos.y, pos.z, 59, 999999.99, true, false, 8)
		util.yield(1000)
		menu.trigger_commands("becomeorbitalcannon off")
	end)

	menu.toggle(trolling_list, "Flame Loop", {},"", function(on)
		fire_loop = on
		while fire_loop do
			explode(pid, 12, false)
			util.yield(delay)
		end
	end, false)

-------------------------------------------------shake cam-----------------------------------------------------------------------

	menu.toggle(trolling_list, "Shake Camera", {}, "", function(on)
		shakecam = on
		while shakecam do
			local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
			FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED(players.user()), pos.x, pos.y, pos.z, 0, 0, false, true, 80)
			util.yield(200)
		end
	end)

-------------------------------------------attacker and clone options-----------------------------------------------------------------------------

	local attacker_options = menu.list(trolling_list, "Attacker/Clone Settings", {}, "")

	menu.divider(attacker_options, "Attacker/Clone Settings")

	local ped_weapon_list = menu.list(attacker_options, "Weapon", {}, "Allows you to change the attacker/clone weapon. Default: Pistol.")	
	menu.divider(ped_weapon_list, "Attacker/Clone Weapon List")										
	local ped_melee_list = menu.list(ped_weapon_list, "Melee", {}, "")

	for i = 1, #weapons do 								--creates the attacker weapon list
		menu.action(ped_weapon_list, weapons[i][1], {}, "", function()
			ped_weapon = weapons[i][2]
			shownotification("Attacker weapon: "..weapons[i][1])
		end)
	end

	for i = 1, #melee_weapons do  --creates the attacker melee weapon list
		menu.action(ped_melee_list, melee_weapons[i][1], {}, "", function()
			ped_weapon = melee_weapons[i][2]
			shownotification("Attacker weapon: "..melee_weapons[i][1])
		end)
	end

	local ped_list = menu.list(attacker_options, "Attacker Appearance", {}, "Allows to change the attacker appearance. Default: Female Cop.")

	menu.divider(ped_list, "Attacker Appearance List")

	for i = 1, #peds do					--creates the attacker appearance list
		menu.action(ped_list, peds[i][1], {}, "", function()
			ped_type = peds[i][2]
			shownotification("Attacker appearance: "..peds[i][1])
		end)
	end

	menu.toggle(attacker_options, "Invincible", {}, "Makes attacker/clone invincible when enabled.", function(on_godmode)
		godmode = on_godmode
	end, false)

	menu.toggle(attacker_options, "Stationary", {}, "Use it to make the attacker stationary.", function(on)
		stationary = on
	end, false)

	menu.action(trolling_list, "Spawn Attacker", {}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		spawn_attacker(pid, ped_type, ped_weapon, godmode, stationary)
		shownotification("Attacker sent to "..PLAYER.GET_PLAYER_NAME(pid))
	end)

	menu.action(trolling_list, "Spawn Random Attacker", {}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		spawn_attacker(pid, random_peds[math.random(#random_peds)], ped_weapon, godmode, stationary)
		shownotification("Attacker sent to "..PLAYER.GET_PLAYER_NAME(pid))
	end)

	menu.action(trolling_list, "Clone Player as Enemy", {}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
		
		pos.x  = pos.x + math.random(-3, 3)
		pos.y = pos.y + math.random(-3, 3)
		pos.z = pos.z-0.9

		local weapon_hash = util.joaat(ped_weapon)
		clone = PED.CLONE_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), 1, 1, 1)
		attackers[#attackers + 1] = clone

		WEAPON.GIVE_WEAPON_TO_PED(clone, weapon_hash, 9999, true, true)
		ENTITY.SET_ENTITY_COORDS(clone, pos.x, pos.y, pos.z)
		ENTITY.SET_ENTITY_INVINCIBLE(clone, godmode)
		PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(clone, true)
		TASK.TASK_COMBAT_PED(clone, PLAYER.GET_PLAYER_PED(pid), 0, 16)
		PED.SET_PED_COMBAT_ATTRIBUTES(clone, 46, 1)
		if stationary then
			PED.SET_PED_COMBAT_MOVEMENT(clone, 0)
		end
		shownotification("Enemy clone sent to "..PLAYER.GET_PLAYER_NAME(pid))
	end)
	
	menu.action(attacker_options, "Delete All", {}, "Tries to delete all attackers and clones you\'ve spawned.", function()
		delete_all_entities(attackers, "attackers")
	end)

------------------------------------------cage options------------------------------------------------------------------------------
	
	local cage_options = menu.list(trolling_list, "Cage", {}, "")
	
	menu.divider(cage_options, "Cage")

	menu.action(cage_options, "Simple", {"cage"}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped) 
		if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
			menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
			util.yield(300)
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				shownotification("~r~Failed to kick player out of the vehicle")
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
				return
			end
			menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
			pos =  ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid)) --if not it could place the cage at the wrong position
		end
		cage_player(pos, cage_type)
	end)

------------------------------------------------------------------------------------------------------------------------------------------------
	
	menu.toggle(cage_options, "Atomatic", {"autocage"}, "Trap them in a cage. If they get out... Do it again. No, I\'ll do it for you actually.", function(on)
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local a = ENTITY.GET_ENTITY_COORDS(player_ped) --first position
		cage_loop = on
		if cage_loop then
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
				util.yield(300)
				if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
					shownotification("~r~Failed to kick player out of the vehicle")
					menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
					return
				end
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
				a =  ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
			end
			cage_player(a, cage_type)
		end
		while cage_loop do
			local b = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid)) --current position
			local ba = {x = b.x - a.x, y = b.y - a.y, z = b.z - a.z} 
			if math.sqrt(ba.x * ba.x + ba.y * ba.y + ba.z * ba.z) >= 4 then --now I know there's a native to find distance between coords but I like this >_<
				a = b
				if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
					goto continue
				end
				cage_player(a, cage_type)
				shownotification(PLAYER.GET_PLAYER_NAME(pid).." was out of the cage. Doing it again")
				::continue::
			end
			util.yield(1000)
		end
	end, false)

-------------------------------------------------------------------------------------------------------------------------------------------------

	menu.action(cage_options, "Fence", {}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		local object_hash = util.joaat("prop_fnclink_03e")
		pos.z = pos.z-0.9
		STREAMING.REQUEST_MODEL(object_hash)
		while not STREAMING.HAS_MODEL_LOADED(object_hash) do
			util.yield()
		end
		local object = {}
		object[1] = OBJECT.CREATE_OBJECT(object_hash, pos.x-1.5, pos.y+1.5, pos.z, true, true, true) 																			
		object[2] = OBJECT.CREATE_OBJECT(object_hash, pos.x-1.5, pos.y-1.5, pos.z, true, true, true)
		
		object[3] = OBJECT.CREATE_OBJECT(object_hash, pos.x+1.5, pos.y+1.5, pos.z, true, true, true) 	
		local rot_3  = ENTITY.GET_ENTITY_ROTATION(object[3])
		rot_3.z = -90
		ENTITY.SET_ENTITY_ROTATION(object[3], rot_3.x, rot_3.y, rot_3.z, 1, true)
		
		object[4] = OBJECT.CREATE_OBJECT(object_hash, pos.x-1.5, pos.y+1.5, pos.z, true, true, true) 	
		local rot_4  = ENTITY.GET_ENTITY_ROTATION(object[4])
		rot_4.z = -90
		ENTITY.SET_ENTITY_ROTATION(object[4], rot_4.x, rot_4.y, rot_4.z, 1, true)
		
		for key, value in pairs(object) do
			ENTITY.FREEZE_ENTITY_POSITION(value, true)
			if value == 0 then 
				shownotification("~r~Something went wrong creating cage")
			end
			cages[#cages + 1] = value
		end
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(object_hash)
	end)

---------------------------------------------------------------------------------------------------------------------------------------------------

	menu.action(cage_options, "Stunt Tube", {}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(pid))
		STREAMING.REQUEST_MODEL(2081936690)

		while not STREAMING.HAS_MODEL_LOADED(2081936690) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(2081936690, pos.x, pos.y, pos.z, true, true, false)
		cages[#cages + 1] = cage_object

		local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		rot.y = 90
		ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(cage_object)
	end)

-------------------------------------------------------------------------------------------------------------------------------------------------

	menu.divider(cage_options, "Settings")

	local cage_type_list = menu.list(cage_options, "Simple/Automatic Version", {}, "Allows you to change cage type for Simple and Automatic options.")
	menu.divider(cage_type_list, "Cage Type")

	for i = 1,2 do
		menu.action(cage_type_list, "Trolly V"..i, {}, "", function()
			cage_type = i
			shownotification("Cage type: Trolly V"..i)
		end)
	end

	menu.action(cage_options, "Delete All", {}, "Tries to deletes all traps you\'ve spawned.", function()
		delete_all_entities(cages, "traps")
	end)

------------------------------------------------guitar------------------------------------------------------------------------

	menu.action(trolling_list, "Attach Guitar", {}, "Attaches a guitar to their ped causing crazy things if they\'re in a vehicle and looks nice.", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		pos.z = pos.z - 0.9
		local object_hash = util.joaat("prop_acc_guitar_01_d1")
		STREAMING.REQUEST_MODEL(object_hash)
		while not STREAMING.HAS_MODEL_LOADED(object_hash) do
			util.yield()
		end
		local object = OBJECT.CREATE_OBJECT(object_hash, pos.x, pos.y, pos.z, true, true, true)
		if object == 0 then 
			shownotification("~r~Failure creating the entity")
		end
		ENTITY.ATTACH_ENTITY_TO_ENTITY(object, PLAYER.GET_PLAYER_PED(pid), PED.GET_PED_BONE_INDEX(PLAYER.GET_PLAYER_PED(pid), 0x5c01), 0.5, -0.2, 0.1, 0, 70, 0, false, true, true --[[Collision - This causes glitch when in vehicle]], false, 0, true)
		--ENTITY.SET_ENTITY_VISIBLE(object, false, 0) --turns guitar invisible
		util.yield(3000)
		if player_ped ~= ENTITY.GET_ENTITY_ATTACHED_TO(object) then
			shownotification("~r~The entity is not attached. ~s~Meaby "..PLAYER.GET_PLAYER_NAME(pid).." has attactment protections")
			return
		end
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(object_hash)
	end)

----------------------------------------------------rape--------------------------------------------------------------------

	local rape_options = menu.list(trolling_list, "Rape")
	menu.divider(rape_options, "Rape")

	menu.action(rape_options, "Monkey", {}, "Other players may not see the animation.", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		local ped_hash = util.joaat("a_c_chimp")
		STREAMING.REQUEST_MODEL(ped_hash)
		STREAMING.REQUEST_ANIM_DICT("rcmpaparazzo_2")
		util.yield(50)
		while not STREAMING.HAS_MODEL_LOADED(ped_hash) or not STREAMING.HAS_ANIM_DICT_LOADED("rcmpaparazzo_2") do
			util.yield()
		end
		local ped = util.create_ped(1, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
		TASK.TASK_PLAY_ANIM(ped, "rcmpaparazzo_2", "shag_loop_a", 8, 8, -1, 1, 0, 0, 0, 0)
		ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, player_ped, PED.GET_PED_BONE_INDEX(ped, 0x0), 0, -0.3, 0.2, 0, 0, 0, false, true, false, false, 0, true)
		ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
		ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(ped, false, false) --for ped not to be beaten with a melee weapon (because ped ditaches from player)
		util.yield(3000)
		if player_ped ~= ENTITY.GET_ENTITY_ATTACHED_TO(ped) then
			shownotification("~r~The entity is not attached. ~s~Meaby "..PLAYER.GET_PLAYER_NAME(pid).." has attactment protections")
			return
		end
		while player_ped == ENTITY.GET_ENTITY_ATTACHED_TO(ped) do
			if not ENTITY.IS_ENTITY_PLAYING_ANIM(ped, "rcmpaparazzo_2", "shag_loop_a",3) then
				TASK.TASK_PLAY_ANIM(ped, "rcmpaparazzo_2", "shag_loop_a", 8, 8, -1, 1, 0, 0, 0, 0)
			end
			util.yield()
		end
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
	end)

	menu.toggle(rape_options, "By Me", {}, "", function(on)
		rape = on
		if pid ~= players.user() then
			if rape then
				local player_ped = PLAYER.GET_PLAYER_PED(pid)
				local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
				STREAMING.REQUEST_ANIM_DICT("rcmpaparazzo_2")
				while not STREAMING.HAS_ANIM_DICT_LOADED("rcmpaparazzo_2") do
					util.yield()
				end
				local user_ped = PLAYER.GET_PLAYER_PED(players.user())
				TASK.TASK_PLAY_ANIM(user_ped, "rcmpaparazzo_2", "shag_loop_a", 8, -8, -1, 1, 0, false, false, false)
				local netID = NETWORK.PED_TO_NET(PLAYER.GET_PLAYER_PED(players.user()))
				NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(netID, true)
				ENTITY.ATTACH_ENTITY_TO_ENTITY(user_ped, player_ped, PED.GET_PED_BONE_INDEX(ped, 0x0), 0, -0.3, 0, 0, 0, 0, false, true, true, false, 0, true)
				menu.trigger_commands("nocollision on")
			end
			while rape do 
				util.yield()
			end
			TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.GET_PLAYER_PED(players.user()))
			ENTITY.DETACH_ENTITY(PLAYER.GET_PLAYER_PED(players.user()), true, false)
			menu.trigger_commands("nocollision off")
		end
	end, false)

---------------------------------------------------enemy buzzard---------------------------------------------------------------------

	local buzzard_options = menu.list(trolling_list, "Enemy Buzzard", {}, "")

	menu.divider(buzzard_options, "Enemy Buzzard")

	buzzard_visible = true
	local gunner_weapon = "weapon_combatmg"
	
	menu.action(buzzard_options, "Spawn Buzzard", {}, "", function()
		local pilot, heli = spawn_buzzard(pid, gunner_weapon, collision)

		while ENTITY.GET_ENTITY_HEALTH(pilot) > 0 do
			local player_ped = PLAYER.GET_PLAYER_PED(pid)
			local a = ENTITY.GET_ENTITY_COORDS(player_ped)
			local b = ENTITY.GET_ENTITY_COORDS(heli)
			if MISC.GET_DISTANCE_BETWEEN_COORDS(a.x, a.y, a.z, b.x, b.y, b.z, true) > 90 then
				TASK.TASK_HELI_CHASE(pilot, player_ped, 0, 0, 50)
			else
				TASK.TASK_HELI_MISSION(pilot, heli, 0, player_ped, a.x, a.y, a.z, 23, 30, -1, -1, 10, 10, 5, 0)
			end
			util.yield()
		end
	end)

	menu.divider(buzzard_options, "Settings")

	menu.toggle(buzzard_options, "Invincible", {}, "", function(on)
		buzzard_godmode = on
	end, false)
	
	local menu_gunner_weapon_list = menu.list(buzzard_options, "Gunners Weapon")
	menu.divider(menu_gunner_weapon_list, "Gunner Weapon List")

	for i = 1, #gunner_weapon_list do
		menu.action(menu_gunner_weapon_list, gunner_weapon_list[i][1], {}, "", function()
			gunner_weapon = gunner_weapon_list[i][2]
			shownotification("Now gunners will shoot with "..gunner_weapon_list[i][1].."s")
		end)
	end

	menu.toggle(buzzard_options, "Visible", {}, "You shouldn\'t be that toxic to turn this off.", function(on)
		buzzard_visible = on
	end, true)

	menu.toggle(buzzard_options, "Collision", {}, "When it\'s turned off disables world collision for Buzzard. Playes can still destroy the vehicle.", function(on)
		collision = on
	end, false)

	menu.action(buzzard_options, "Delete All", {}, "Tries to delete all Buzzards you\'ve spawned.", function()
		delete_all_entities(buzzard_entities, "buzzards")
	end)

-----------------------------------------------damage----------------------------------------------------------------------------

	local damage = menu.list(trolling_list, "Damage", {}, "Choose the weapon and shoot \'em no matter where you are.")
	
	menu.toggle(damage, "Spectate", {}, "If player is not visible or far enough, you\'ll need to spectate before using Demage. This is just Stand\'s option duplicated.", function(on)
		spectate = on
		if spectate then
			menu.trigger_commands("spectate "..PLAYER.GET_PLAYER_NAME(pid).." on")
		else
			menu.trigger_commands("spectate "..PLAYER.GET_PLAYER_NAME(pid).." off")
		end
	end)

	menu.divider(damage, "Damage")
	
	local damage_value = 200 --default damage
	menu.action(damage, "Heavy Sniper", {}, "", function() 
		shoot_owned_bullet(pid, "weapon_heavysniper", damage_value)
	end)

	menu.action(damage, "Shotgun", {}, "", function()
		shoot_owned_bullet(pid, "weapon_pumpshotgun", damage_value)
	end)

	menu.slider(damage, "Damage Amount", {"damagevalue"}, "The bullet demages player with the given value. ", 10, 1000, 200, 50, function(value)
		damage_value = value
	end)

	menu.toggle(damage, "Tase", {}, "", function(on)
		tase = on
		while tase do
			shoot_owned_bullet(pid, "weapon_stungun", 1)
			util.yield(500)
		end
	end, false)

--------------------------------------------------enemy minitank------------------------------------------------------------------
	
	spawned_minitank = {}
	local minitank_options = menu.list(trolling_list, "Enemy RC Tank")
	menu.divider(minitank_options, "Enemy RC Tank")
	local minitank_godmode = false
	menu.action(minitank_options, "Spawn RC Tank", {}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		local coords_ptr = memory.alloc()
		local nodeId = memory.alloc()
		local coords

		local minitank_hash = util.joaat("minitank")
		local ped_hash = util.joaat("s_m_y_blackops_01")
		STREAMING.REQUEST_MODEL(minitank_hash)
		STREAMING.REQUEST_MODEL(ped_hash)
		while not STREAMING.HAS_MODEL_LOADED(minitank_hash) or not STREAMING.HAS_MODEL_LOADED(ped_hash) do
			util.yield()
		end
		
		if not PATHFIND.GET_RANDOM_VEHICLE_NODE(pos.x, pos.y, pos.z, 100, 0, 0, 0, coords_ptr, nodeId) then
			pos.x = pos.x + math.random(-20,20)
			pos.y = pos.y + math.random(-20,20)
			PATHFIND.GET_CLOSEST_VEHICLE_NODE(pos.x, pos.y, pos.z, coords_ptr, 1, 100, 2.5)
			coords = memory.read_vector3(coords_ptr)
		end
		coords = memory.read_vector3(coords_ptr)
		memory.free(coords_ptr)
		memory.free(nodeId)

		local minitank = util.create_vehicle(minitank_hash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		spawned_minitank[#spawned_minitank + 1] = minitank

		if minitank_godmode then
			ENTITY.SET_ENTITY_INVINCIBLE(minitank, minitank_godmode)
		end
		VEHICLE.SET_VEHICLE_MOD_KIT(minitank, 0)
		for i = 0, 50 do
			VEHICLE.SET_VEHICLE_MOD(minitank, i, VEHICLE.GET_NUM_VEHICLE_MODS(minitank, i) - 1, false)
		end
		VEHICLE.SET_VEHICLE_ENGINE_ON(minitank, true, true, true)

		local driver = util.create_ped(5, ped_hash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		spawned_minitank[#spawned_minitank + 1] = driver
		PED.SET_PED_COMBAT_ATTRIBUTES(driver, 1, true)
		PED.SET_PED_INTO_VEHICLE(driver, minitank, -1)
		
		TASK.TASK_VEHICLE_MISSION_PED_TARGET(driver, minitank, player_ped, 6, 100, 0, 1, 0, true)
		TASK.TASK_COMBAT_PED(driver, player_ped, 0, 0)
		shownotification("RC Tank sent to "..PLAYER.GET_PLAYER_NAME(pid))

		util.create_thread(function()
			while ENTITY.GET_ENTITY_HEALTH(minitank) > 0 do
				local a = ENTITY.GET_ENTITY_COORDS(minitank)
				HUD.SET_NEW_WAYPOINT(a.x, a.y)
				AUDIO.STOP_CURRENT_PLAYING_SPEECH(driver)
				if PLAYER.IS_PLAYER_DEAD(pid) then
					while PLAYER.IS_PLAYER_DEAD(pid) do
						util.yield()
					end
					local player_ped = PLAYER.GET_PLAYER_PED(pid)
					TASK.TASK_VEHICLE_MISSION_PED_TARGET(driver, minitank, player_ped, 6, 100, 0, 2, 0, true)
					TASK.TASK_COMBAT_PED(driver, player_ped, 0, 0)
				end
				util.yield()
			end
		end)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
		HUD.SET_WAYPOINT_OFF()
	end)

	menu.divider(minitank_options, "Settings")

	menu.toggle(minitank_options, "Invincible", {}, "", function(on)
		minitank_godmode = on
	end, false)

	menu.action(minitank_options, "Delete All", {}, "Tries to delete all minitanks you\'ve spawned.", function()
		delete_all_entities(spawned_minitank, "minitanks")
	end)

-----------------------------------------------trolly bandito--------------------------------------------------------------------
	
	bandito_entities = {}
	local bandito_options = menu.list(trolling_list, "Trolly Bandito")
	menu.divider(bandito_options, "Trolly Bandito")
	menu.action(bandito_options, "Spawn Bandito", {}, "You may hit this option twice the very first time you use it after game startup", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		local coords_ptr = memory.alloc()
		local nodeId = memory.alloc()
		local coords

		local bandito_hash = util.joaat("rcbandito")
		local ped_hash = util.joaat("s_m_y_blackops_01")
		STREAMING.REQUEST_MODEL(bandito_hash)
		STREAMING.REQUEST_MODEL(ped_hash)
		while not STREAMING.HAS_MODEL_LOADED(bandito_hash) and not STREAMING.HAS_MODEL_LOADED(ped_hash) do
			util.yield()
		end

		if not PATHFIND.GET_RANDOM_VEHICLE_NODE(pos.x, pos.y, pos.z, 100, 0, 0, 0, coords_ptr, nodeId) then
			pos.x = pos.x + math.random(-20,20)
			pos.y = pos.y + math.random(-20,20)
			PATHFIND.GET_CLOSEST_VEHICLE_NODE(pos.x, pos.y, pos.z, coords_ptr, 1, 100, 2.5)
			coords = memory.read_vector3(coords_ptr)
		else
			coords = memory.read_vector3(coords_ptr)
		end
		memory.free(coords_ptr)
		memory.free(nodeId)
		
		local bandito = util.create_vehicle(bandito_hash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		bandito_entities[#bandito_entities+1] = bandito
		
		VEHICLE.SET_VEHICLE_MOD_KIT(bandito, 0)
		for i = 0, 50 do
			VEHICLE.SET_VEHICLE_MOD(bandito, i, VEHICLE.GET_NUM_VEHICLE_MODS(bandito, i) - 1, false)
		end
		VEHICLE.SET_VEHICLE_ENGINE_ON(bandito, true, true, true)

		local driver = util.create_ped(5, ped_hash, coords, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		bandito_entities[#bandito_entities+1] = driver
		PED.SET_PED_COMBAT_ATTRIBUTES(driver, 1, true)
		PED.SET_PED_INTO_VEHICLE(driver, bandito, -1)
		TASK.TASK_VEHICLE_MISSION_PED_TARGET(driver, bandito, player_ped, 6, 70, 0, 0, 0, true)
		PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)

		if bandito_godmode then
			ENTITY.SET_ENTITY_INVINCIBLE(bandito, bandito_godmode)
		end

		if explode_bandito then
			shownotification("Explosive Bandito sent to "..PLAYER.GET_PLAYER_NAME(pid))
		else
			shownotification("Bandito sent to "..PLAYER.GET_PLAYER_NAME(pid))
		end
		
		util.create_thread(function()
			while ENTITY.GET_ENTITY_HEALTH(bandito) > 0 do
				local a = ENTITY.GET_ENTITY_COORDS(player_ped)
				local b = ENTITY.GET_ENTITY_COORDS(bandito)
				HUD.SET_NEW_WAYPOINT(b.x, b.y)
				if explode_bandito then
					if MISC.GET_DISTANCE_BETWEEN_COORDS(a.x, a.y, a.z, b.x, b.y, b.z, false) < 3 then
						FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED(players.user()), b.x, b.y, b.z, 2, 999999.99, true, false, 1)
						if not bandito_godmode then
							VEHICLE.SET_VEHICLE_ENGINE_HEALTH(bandito, -4000)
							ENTITY.SET_ENTITY_HEALTH(driver, 0)
						end
					end
				end
				util.yield()
			end
		end)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
		HUD.SET_WAYPOINT_OFF()
	end)

	menu.divider(bandito_options, "Settings")

	menu.toggle(bandito_options, "Explode When Nearby", {}, "Bandito will explode and kill the player as you when it\'s close enough.", function(on)
		explode_bandito = on
	end, false)

	menu.toggle(bandito_options, "Invincible", {}, "", function(on)
		bandito_godmode = on
	end, false)

	menu.action(bandito_options, "Delete All", {}, "Tries to delete all banditos you\'ve spawned.", function()
		delete_all_entities(bandito_entities, "Bandito")
	end)

-----------------------------------------------------hostile peds--------------------------------------------------------------------

	menu.action(trolling_list, "Hostile Peds", {}, "All on foot peds will combat player.", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped)
		local peds = get_nearby_entities(pid, 80, true, false)
		for k, v in pairs(peds) do
			if not PED.IS_PED_IN_ANY_VEHICLE(v, false) then
				request_control_ent(v)
				TASK.CLEAR_PED_TASKS_IMMEDIATELY(v)
				PED.SET_PED_COMBAT_ATTRIBUTES(v, 46, true)
				PED.SET_PED_MAX_HEALTH(v, 300)
				ENTITY.SET_ENTITY_HEALTH(v, 300)
				WEAPON.GIVE_WEAPON_TO_PED(v, util.joaat(random_weapons[math.random(1, #random_weapons)]), 9999, false, true)
				TASK.TASK_COMBAT_PED(v, player_ped, 0, 0)
				WEAPON.SET_PED_DROPS_WEAPONS_WHEN_DEAD(v, false)
			end
		end
	end)

--------------------------------------------------hostile traffic-----------------------------------------------------------------

	menu.action(trolling_list, "Hostile Traffic", {}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED(pid)
		local pos  = ENTITY.GET_ENTITY_COORDS(player_ped)
		local vehicles = {}

		for k, entity in pairs(get_nearby_entities(pid,130, false, true)) do
			if ENTITY.IS_ENTITY_A_VEHICLE(entity) and not VEHICLE.IS_VEHICLE_SEAT_FREE(entity, -1) then
				vehicles[#vehicles+1] = entity
			end
		end

		for k, vehicle in pairs(vehicles) do
			local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)
			if PED.IS_PED_A_PLAYER(dirver) then
				vehicles[k] = nil
			else
				request_control_ent(driver)
				PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
				PED.SET_PED_MAX_HEALTH(driver, 300)
				ENTITY.SET_ENTITY_HEALTH(driver, 300)
				TASK.CLEAR_PED_TASKS_IMMEDIATELY(driver)
				PED.SET_PED_INTO_VEHICLE(driver, vehicle, -1)
				PED.SET_PED_COMBAT_ATTRIBUTES(driver, 46, true)
				TASK.TASK_COMBAT_PED(driver, player_ped, 0, 0)
				TASK.TASK_VEHICLE_MISSION_PED_TARGET(driver, vehicle, player_ped, 6, 100, 0, 0, 0, true)
			end
			vehicles[k] = nil
		end
	end)
end
-------------------------------------------------------------------------------------------------------------------------------------

local rank = players.get_rank(players.user())
	
if rank < 20 then
	defaulthealth = 238
end
if rank >= 20 and rank < 40 then
	defaulthealth = 256
end
if rank >= 40 and rank < 60 then
	defaulthealth = 274
end
if rank >= 60 and rank < 80 then
	defaulthealth  = 292
end
if rank >= 80 and rank < 100 then
	defaulthealth = 310
end
if rank > 100 then
	defaulthealth = 328
end

local modhealth  = false
local modded_health = defaulthealth

--display health stuff

local screen_w, screen_h = directx.get_client_size() --from BoperSkript
function _x(yes)
	return yes / screen_w
end
function _y(yes)
	return yes / screen_h
end

-------------------------------------------------health options-----------------------------------------------------------------------

local self_options = menu.list(menu.my_root(), "Self", {}, "")

menu.toggle(self_options, "Mod Health", {"modhealth"}, "Changes your ped\'s max health. Some menus will tag you as modder. It returns to defaulf max health when it\'s disabled.", function(on)
	modhealth  = on
	if modhealth then
		local player_ped = PLAYER.GET_PLAYER_PED(players.user())
		PED.SET_PED_MAX_HEALTH(player_ped,  modded_health)
		ENTITY.SET_ENTITY_HEALTH(player_ped, modded_health)
		if PED.GET_PED_MAX_HEALTH(player_ped) == modded_health then
			shownotification("Mod Health is ~r~on~s~")
		else 
			shownotification("~r~Something went wrong")
			return
		end
	else
		local player_ped = PLAYER.GET_PLAYER_PED(players.user())
		PED.SET_PED_MAX_HEALTH(player_ped, defaulthealth)
		menu.trigger_commands("maxhealth "..defaulthealth) -- just if you want the slider to go to defaulf value when mod health is off
		if ENTITY.GET_ENTITY_HEALTH(player_ped) > defaulthealth then 
			ENTITY.SET_ENTITY_HEALTH(player_ped, defaulthealth)
		end
		if PED.GET_PED_MAX_HEALTH(player_ped) == defaulthealth then
			shownotification("Mod Health is ~r~off~s~. Default max health: "..defaulthealth)
		else 
			shownotification("~r~Something went wrong")
			return
		end
	end
	while modhealth do
		local player_ped = PLAYER.GET_PLAYER_PED(players.user())
		if PED.GET_PED_MAX_HEALTH(player_ped) ~= modded_health  then
			PED.SET_PED_MAX_HEALTH(player_ped, modded_health)
			ENTITY.SET_ENTITY_HEALTH(player_ped, modded_health)	
		end
								--thanks to boper skript
		if display then
			local logo = directx.create_texture(scriptdir.."\\WiriScript\\logo.png")
			local text = "WiriScript | Player Health: "..ENTITY.GET_ENTITY_HEALTH(player_ped).."/"..PED.GET_PED_MAX_HEALTH(player_ped)
			local wmtxt_x, wmtxt_y = directx.get_text_size(text, 0.75)
			local wmposx,wmposy = _x(80),_y(25) + wmtxt_y*0.4 --change the text position here
		
			local aspect_ratio = GRAPHICS._GET_ASPECT_RATIO()
			directx.draw_texture_client(
				logo,	 			-- id
				0,					-- index
				-9999,				-- level
				0,					-- time
				0.015,				-- sizeX
				0.015,				-- sizeY
				0.0,				-- centerX
				0.5,				-- centerY
				wmposx-wmposx*0.6,	-- posX
				wmposy+wmposy*0.35,	-- posY
				0,					-- rotation
				aspect_ratio,		-- screenHeightScaleFactor
				{					-- colour
					["r"] = 1.0,
					["g"] = 1.0,
					["b"] = 1.0,
					["a"] = 1.0
				}
			)
			directx.draw_text_client(wmposx, wmposy, text, ALIGN_TOP_LEFT, 0.7,  {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}, true)
			directx.draw_rect(wmposx-wmposx*0.6, wmposy - wmtxt_y*0.3, wmtxt_x+wmtxt_x*0.13, wmtxt_y + wmtxt_y*0.5, {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 0.2})
		end
		util.yield()
	end
end, false)

menu.slider(self_options, "Modded Health", {"maxhealth"}, "Health will be modded with the given value.", 100,9000,defaulthealth,50, function(value)
	modded_health = value
end)

menu.action(self_options, "Max Armour", {}, "", function()
	local player_ped = PLAYER.GET_PLAYER_PED(players.user())
	PED.SET_PED_ARMOUR(player_ped, 100)
end)

menu.action(self_options, "Max Health", {}, "", function()
	local player_ped = PLAYER.GET_PLAYER_PED(players.user())
	ENTITY.SET_ENTITY_HEALTH(player_ped, PED.GET_PED_MAX_HEALTH(player_ped))
end)

menu.toggle(self_options, "Refill Health When in Cover", {}, "", function(on)
	refillincover = on
	while refillincover do
		local player_ped = PLAYER.GET_PLAYER_PED(players.user())
		if PED.IS_PED_IN_COVER(player_ped) then
			PLAYER._SET_PLAYER_HEALTH_RECHARGE_LIMIT(players.user(), 1)
			PLAYER.SET_PLAYER_HEALTH_RECHARGE_MULTIPLIER(players.user(), 15)
		else
			PLAYER._SET_PLAYER_HEALTH_RECHARGE_LIMIT(players.user(),0.5)
			PLAYER.SET_PLAYER_HEALTH_RECHARGE_MULTIPLIER(players.user(), 1)
		end
		util.yield()
	end
	if not refillincover then
		PLAYER._SET_PLAYER_HEALTH_RECHARGE_LIMIT(players.user(), 0.5)
		PLAYER.SET_PLAYER_HEALTH_RECHARGE_MULTIPLIER(players.user(), 1)
	end
end)

--------------------------------------------forcefield-------------------------------------------------------------------------------------

menu.toggle(self_options, "Forcefield", {"forcefield"}, "Push nearby entities away.", function(on)
	forcefield = on
	
	util.create_thread(function()
		if forcefield then
			shownotification("Forcefield is ~r~on~s~")
		end
		while forcefield do
			local a = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(players.user()))
			local entities = get_nearby_entities(players.user(), 10, true, true)
		
			for key, value in pairs(entities) do
				local b = ENTITY.GET_ENTITY_COORDS(value)
				local ab = {x = b.x-a.x, y = b.y-a.y, z = b.z-a.z}
				local mag = math.sqrt(ab.x^2, ab.y^2, ab.z^2)
				local force = {x = ab.x/mag, y = ab.y/mag, z = ab.z/mag}

				if request_control_ent(value) then
					ENTITY.APPLY_FORCE_TO_ENTITY(value, 1, force.x, force.y, force.z, 0, 0, 0.5, 0, false, false, true)
				end

				if ENTITY.IS_ENTITY_A_PED(value) then
					PED.SET_PED_TO_RAGDOLL(value, 1000, 1000, 0, 0, 0, 0)
				end
			end
			util.yield()
		end
		shownotification("Forcefield is ~r~off~s~")
	end)
end, false)

-----------------------------------------------force-------------------------------------------------------------------------------------

menu.toggle(self_options, "Force", {"force"}, "Use force in nearby vehicles. Controls: [NUM 9] & [NUM 6].", function(on)
	force = on

	util.create_thread(function()
		if force then
			shownotification("Force is ~r~on~s~. Use [NUM 9] & [NUM 6] to become a jedi")
		end
		while force do
			local entities = get_nearby_entities(players.user(), 30, false, true)
			if PAD.IS_CONTROL_PRESSED(0, 118) then
				for k, v in pairs(entities) do
					if request_control_ent(v) then 
						ENTITY.APPLY_FORCE_TO_ENTITY(v, 1, 0, 0, 0.5, 0, 0, 0, 0, false, false, true)
					end
				end
			end
			if PAD.IS_CONTROL_PRESSED(0, 109) then
				for k, v in pairs(entities) do
					if request_control_ent(v) then 
						ENTITY.APPLY_FORCE_TO_ENTITY(v, 1, 0, 0, -70, 0, 0, 0, 0, false, false, true)
					end
				end
			end
			util.yield()
		end
		shownotification("Jedi mode is ~r~off~s~")
	end)
end)

------------------------------------------------------------------------------------------------------------------------

for pid = 0,30 do 
	if players.exists(pid) then
		GenerateFeatures(pid)
	end
end

players.on_join(GenerateFeatures)

while true do
	util.yield()
end