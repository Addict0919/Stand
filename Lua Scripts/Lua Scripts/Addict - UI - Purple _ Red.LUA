util.keep_running()
util.require_natives("natives-1663599433")
-- Addict Script™ Copyright© 2023 
--[[ -- Coded By Candy
WE HAVE TAKEN OVER░ \☻/\☻/
░░░░░░░░░░░░░░░░░░░▌░ ▌
░░░░░░░░░░░░░░░░░░ / \░ / \
░░░░░░░░░░░░░░░░░███████ ]▄▄▄▄▄▄▄▄▄-----------●
░░░░░░░░░░░░▂▄▅█████████▅▄▃▂
░░░░░░░░░░░I███████████████████].
]]

-- Credits 🧐🔽🔽🔽
local Credits_To = {
    "Not_DerPaul",
}
-- Credits 🧐🔼🔼🔼
addict_is_running = true
local addict = menu
local addict_version = "1.2.4"
local input_timer = 0
-- Memory Functions

local orgScan = memory.scan

function myModule(name, pattern, callback)
    local address = orgScan(pattern)
    if address ~= NULL then
        util.log("Found " .. name)
        callback(address)
    else
        util.log("Failed to find " .. name)
        util.stop_script()
    end
end

function GetNetGamePlayer(player)
    return util.call_foreign_function(GetNetGamePlayer_addr, player)
end

function get_net_obj(entity)
    local pEntity = entities.handle_to_pointer(entity)
    return pEntity ~= NULL and memory.read_long(pEntity + 0x00D0) or NULL
end

function UnregisterNetworkObject(object, reason, force1, force2)
	local netObj = get_net_obj(object)
	if netObj == NULL then
		return false
	end
	local net_object_mgr = memory.read_long(CNetworkObjectMgr)
	if net_object_mgr == NULL then
		return false
	end
	util.call_foreign_function(UnregisterNetworkObject_addr, net_object_mgr, netObj, reason, force1, force2)
	return true
end

function getModelInfo(modelHash)
	return util.call_foreign_function(p_getModelInfo, modelHash, NULL)
end

function getVehicleModelHandlingData(modelInfo)
	return util.call_foreign_function(GetHandlingDataFromIndex, memory.read_uint(modelInfo + 0x4B8))
end

p_getModelInfo = 0
myModule("GVMI", "48 89 5C 24 ? 57 48 83 EC 20 8B 8A ? ? ? ? 48 8B DA", function (address)
	p_getModelInfo = memory.rip(address + 0x2A)
end)


GetHandlingDataFromIndex = 0
myModule("GHDFI", "40 53 48 83 EC 30 48 8D 54 24 ? 0F 29 74 24 ?", function (address)
	GetHandlingDataFromIndex = memory.rip(address + 0x37)
end)

myModule("GetNetGamePlayer", "48 83 EC ? 33 C0 38 05 ? ? ? ? 74 ? 83 F9", function (address)
    GetNetGamePlayer_addr = address
end)

myModule("CNetworkObjectMgr", "48 8B 0D ? ? ? ? 45 33 C0 E8 ? ? ? ? 33 FF 4C 8B F0", function (address)
    CNetworkObjectMgr = memory.rip(address + 3)
end)

myModule("ChangeNetObjOwner", "48 8B C4 48 89 58 08 48 89 68 10 48 89 70 18 48 89 78 20 41 54 41 56 41 57 48 81 EC ? ? ? ? 44 8A 62 4B", function (address)
    ChangeNetObjOwner_addr = address
end)

myModule("UnregisterNetworkObject", "48 89 70 ? 48 89 78 ? 41 54 41 56 41 57 48 83 ec ? 80 7a ? ? 45 8a f9", function (address)
	UnregisterNetworkObject_addr = address - 0xB
end)

util.log("░█████╗░██████╗░██████╗░██╗░█████╗░████████╗  ░██████╗░█████╗░██████╗░██╗██████╗░████████╗")
util.log("██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝  ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝")
util.log("███████║██║░░██║██║░░██║██║██║░░╚═╝░░░██║░░░  ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░")
util.log("██╔══██║██║░░██║██║░░██║██║██║░░██╗░░░██║░░░  ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░")
util.log("██║░░██║██████╔╝██████╔╝██║╚█████╔╝░░░██║░░░  ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░")
util.log("╚═╝░░╚═╝╚═════╝░╚═════╝░╚═╝░╚════╝░░░░╚═╝░░░  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░")
util.log("▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒")
util.log("▒▒████▄▒▒▒▄▄▄▄▄▄▄▒▒▒▄████▒▒")
util.log("▒▒▒▒▒▀▀▒▄█████████▄▒▀▀▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒█████████████▒▒▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒██▀▀▀███▀▀▀██▒▒▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒██▒▒▒███▒▒▒██▒▒▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒█████▀▄▀█████▒▒▒▒▒▒▒")
util.log("▒▒▒▒▒▒▒▒▒▒███████▒▒▒▒▒▒▒▒▒▒")
util.log("▒▒▒▒▄▄▄██▒▒█▀█▀█▒▒██▄▄▄▒▒▒▒")
util.log("▒▒▒▒▀▀██▒▒▒▒▒▒▒▒▒▒▒██▀▀▒▒▒▒")
util.log("▒▒▒▒▒▒▀▀▒▒▒▒▒▒▒▒▒▒▒▀▀▒▒▒▒▒▒")
util.log("Welcome To Addict Script!™ v" .. addict_version .. "\n" .. "\n" .. "Check Github tab for updates...\n" .. "\n" .. "Enjoy Playing :)")
util.toast("Welcome To Addict Script!™ v" .. addict_version .. "\n" .. "\n" .. "Check Github tab for updates...\n" .. "\n" .. "Enjoy Playing :)")
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local translations = {}
setmetatable(translations, {
    __index = function (self, key)
        return key
    end
})

local festive_div = addict.divider(addict.my_root(), "Addict Script")
local loading_frames = {'!', '! !', '! ! !', '! ! ! !', ' ! ! ! ! ! ! ! ! !', '! ! ! !', '! ! !', '! !', '!'}
util.create_tick_handler(function()
    for _, frame in pairs(loading_frames) do
        addict.set_menu_name(festive_div, frame .. ' ' .. translations.Addict_Script .. ' ' .. frame)
        util.yield(100)
    end
end)

local aalib = require("aalib")
local PlaySound = aalib.play_sound
local SND_ASYNC<const> = 0x0001
local SND_FILENAME<const> = 0x00020000

resources_dir = filesystem.resources_dir() .. '\\Addictscript\\'
Addictscript_logo = directx.create_texture(resources_dir .. 'Addictscript_logo.png')

if not filesystem.is_dir(resources_dir) then
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
            directx.draw_texture(Addictscript_logo, 0.15, 0.10, 0.5, 0.7, 0.5, 0.5, 0, 1, 1, 1, logo_alpha)
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


function format_int(number) -- Credits to Bart Kiers from stackoverflow
  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
  int = int:reverse():gsub("(%d%d%d)", "%1,")
  return minus .. int:reverse():gsub("^,", "") .. fraction
end

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

store_dir = filesystem.store_dir() .. '\\Addict\\'
if not filesystem.is_dir(store_dir) then
    filesystem.mkdirs(store_dir)
end

local max_timer_time = 86400000
local all_timer_lists = {}
local parse_all_timer_files

function create_timer_entry(data)
    local data_copy = data
    local timer_name = data['timer_name']
    local timer_desc = data['timer_desc']
    local timer_commands = data['timer_commands']
    local timer_delay = data['timer_delay']
    local this_timer_path = store_dir .. '\\' .. timer_name .. '.lua'
    local fmt_name = timer_name:gsub(' ', '')
    if all_timer_lists[timer_name] == nil then
        local this_timer_root = addict.list(addict.my_root(), timer_name, {'Addict' .. fmt_name}, timer_desc)
        all_timer_lists[timer_name] = this_timer_root
        addict.toggle_loop(this_timer_root, "Run timer", {"runtimer" .. timer_name}, "", function(click_type)
            addict.trigger_commands(timer_commands)
            util.yield(timer_delay)
        end)

        addict.text_input(this_timer_root, "Description", {"Addictsetdesc" .. fmt_name}, "", function(on_input)
            timer_desc = on_input
            data_copy['timer_desc'] = on_input
            table.save(data_copy, this_timer_path)
            addict.set_help_text(this_timer_root, timer_desc)
        end, timer_desc)

        addict.text_input(this_timer_root, "Command(s)", {"Addictsetcommands" .. fmt_name}, "The commands for this timer. You can specify multiple by putting semicolons in between each.", function(on_input)
            timer_commands = on_input
            data_copy['timer_commands'] = on_input
            table.save(data_copy, this_timer_path)
        end, timer_commands)

        addict.slider(this_timer_root, "Timer delay (MS)", {fmt_name .. "delay"}, "The timer delay, in milliseconds. 1000 ms = 1 second.", 0, max_timer_time, 100, 1, function(s)
            timer_delay = s
            data_copy['timer_delay'] = s
            table.save(data_copy, this_timer_path)
        end)

        addict.action(this_timer_root, "Delete timer", {}, "Delete this timer\'s file.", function(click_type)
            ok, err = os.remove(this_timer_path)
            if not ok then
                util.toast("Timer could not be removed: " .. err)
            else
                all_timer_lists[timer_name] = nil
                util.toast("Timer removed.")
                addict.delete(this_timer_root)
                parse_all_timer_files()
            end
        end)
    end
end

function parse_all_timer_files()
    for i, path in ipairs(filesystem.list_files(store_dir)) do
        if string.match(path:gsub(store_dir, ''), '.lua') then
            local timer_data = table.load(path)
            create_timer_entry(timer_data)
        end
    end
end


util.create_thread(function()
    while true do
        parse_all_timer_files()
        util.yield()
    end
end
)

local function player_toggle_loop(root, pid, addict_name, command_names, help_text, callback)
    return addict.toggle_loop(root, addict_name, command_names, help_text, function()
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


function draw_texture(a1, a2, a3, a4, a5, a6, a7, a8, a9)
	local texture = "vacca+hi"
	if not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(texture) then
		GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(texture, false)
	else
		GRAPHICS.DRAW_SPRITE(texture,"vehicle_generic_carbon_spec",a1,a2,a3,a4,a5,a6,a7,a8,a9)
	end
end

function draw_texture2(a1, a2, a3, a4, a5, a6, a7, a8, a9)
	local texture = "timerbars"
	if not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(texture) then
		GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(texture, false)
	else
		GRAPHICS.DRAW_SPRITE(texture,"lhs_bg",a1,a2,a3,a4,a5,a6,a7,a8,a9)
	end
end

function draw_rect(a1, a2, a3, a4, a5, a6, a7, a8)
	GRAPHICS.DRAW_RECT(a1, a2, a3, a4, a5, a6, a7, a8, false)
end

function draw_text(txt, font, x, y, scaleX, scaleY, r, g, b, a, center)
	HUD.SET_TEXT_CENTRE(center)
	HUD.SET_TEXT_COLOUR(r, g, b, a)
	HUD.SET_TEXT_FONT(font)
	HUD.SET_TEXT_SCALE(scaleX, scaleY)
	HUD.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("STRING")
	HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(txt)
	HUD.END_TEXT_COMMAND_DISPLAY_TEXT(x, y, 0)
end

function key_pressed(key, key)
    return PAD.IS_CONTROL_PRESSED(key, key)
end

function handle_inputs()
	select_pressed = false
	if (util.current_unix_time_seconds() - input_timer) > 150 then
		if key_pressed(109, 109) then -- Plus Key (-)
			if submenu == 0 then
				move(1)
			else
				back()
			end
			input_timer = util.current_unix_time_seconds()
		end
		if key_pressed(96, 96) then -- Back - Num 0
			--if submenu > 0 then
				--back()
			--end
			input_timer = util.current_unix_time_seconds()
		end
		if key_pressed(101, 101) then -- Enter - Num 5
			select_pressed = true
			input_timer = util.current_unix_time_seconds()
		end
		if key_pressed(104, 104) then -- Up - Num 8
			if current_option > 1 then
				current_option = current_option - 1
			else
				current_option = option_count
			end
			input_timer = util.current_unix_time_seconds()
		end
		if key_pressed(98, 98) then -- Down - Num 2
			if current_option < option_count then
				current_option = current_option + 1
			else
				current_option = 1
			end
			input_timer = util.current_unix_time_seconds()
		end
	end
	option_count = 0
end

function base_ui()
	draw_rect(0.825000, 0.517500, 0.225000, 0.765000, 76, 0, 25, 203)
	draw_texture(0.758001, 0.841500, 0.091000, 0.117000, 180, 76, 0, 255, 75)
	draw_texture(0.758001, 0.841500, 0.091000, 0.116000, 270, 76, 0, 255, 75)
	draw_texture(0.834001, 0.841500, 0.063000, 0.117000, 180, 76, 0, 255, 75)
	draw_texture(0.833999, 0.841500, 0.060000, 0.116000, 270, 76, 0, 255, 75)
	draw_texture(0.899999, 0.843493, 0.074000, 0.113000, 180, 76, 0, 255, 75)
	draw_texture(0.902000, 0.834499, 0.071000, 0.113000, 270, 76, 0, 255, 75)
	draw_texture(0.753002, 0.728501, 0.081000, 0.111000, 270, 76, 0, 255, 45)
	draw_texture(0.753001, 0.728494, 0.081000, 0.109000, 180, 76, 0, 255, 45)
	draw_texture(0.894999, 0.729499, 0.085000, 0.114000, 180, 76, 0, 255, 45)
	draw_texture(0.895000, 0.728500, 0.085000, 0.115000, 90, 76, 0, 255, 45)
    draw_texture(0.825000, 0.528497, 0.085000, 0.697000, 180, 76, 0, 255, 145)
	draw_texture(0.753001, 0.624500, 0.081000, 0.097000, 180, 76, 0, 255, 35)
	draw_texture(0.753001, 0.625495, 0.082000, 0.097000, 270, 76, 0, 255, 35)
	draw_texture(0.894999, 0.624495, 0.085000, 0.095000, 180, 76, 0, 255, 35)
	draw_texture(0.894999, 0.625495, 0.085000, 0.094000, 270, 76, 0, 255, 35)
	draw_texture(0.755001, 0.528497, 0.085000, 0.098000, 180, 76, 0, 255, 25)
	draw_texture(0.755001, 0.527497, 0.085000, 0.098000, 270, 76, 0, 255, 25)
	draw_texture(0.894999, 0.528497, 0.085000, 0.097000, 180, 76, 0, 255, 25)
	draw_texture(0.894999, 0.528497, 0.085000, 0.097000, 270, 76, 0, 255, 25)
	draw_texture(0.755001, 0.432498, 0.085000, 0.092000, 180, 76, 0, 255, 15)
	draw_texture(0.755001, 0.432498, 0.084000, 0.091000, 270, 76, 0, 255, 15)
	draw_texture(0.894999, 0.432498, 0.085000, 0.093000, 180, 76, 0, 255, 10)
	draw_texture(0.894999, 0.432498, 0.085000, 0.094000, 270, 76, 0, 255, 10)
	draw_texture(0.894998, 0.333501, 0.086000, 0.097000, 180, 76, 0, 255, 5)
	draw_texture(0.894999, 0.337499, 0.085000, 0.096000, 270, 76, 0, 255, 5)
	draw_texture2(0.825000, 0.511497, 0.225000, 0.788993, 90, 138, 138, 138, 86)
	draw_rect(0.825000, 0.517500, 0.211000, 0.733999, 20, 20, 20, 242)
	draw_rect(0.825000, 0.862499, 0.210000, 0.001000, 76, 0, 255, 255)
	draw_rect(0.825000, 0.273500, 0.210000, 0.001000, 76, 0, 255, 255)
	draw_rect(0.823000, 0.209500, 0.129000, 0.045000, 76, 0, 255, 19)
	draw_text("Addict Script", 4, 0.781000, 0.182500, 0.105000, 0.789000, 255, 0, 0, 255, false)
	draw_text("v0.1", 4, 0.729802, 0.861492, 0.085000, 0.371999, 255, 255, 255, 255, false)
end

function disable_actions()
	PAD.DISABLE_CONTROL_ACTION(2, 0, true)
	PAD.DISABLE_CONTROL_ACTION(2, 19, true)
	PAD.DISABLE_CONTROL_ACTION(2, 20, true)
	PAD.DISABLE_CONTROL_ACTION(2, 27, true)
	PAD.DISABLE_CONTROL_ACTION(2, 74, true)
	PAD.DISABLE_CONTROL_ACTION(2, 80, true)
	PAD.DISABLE_CONTROL_ACTION(2, 85, true)
	PAD.DISABLE_CONTROL_ACTION(2, 140, true)
	PAD.DISABLE_CONTROL_ACTION(2, 141, true)
	PAD.DISABLE_CONTROL_ACTION(2, 142, true)
	PAD.DISABLE_CONTROL_ACTION(2, 337, true)
end

function title(txt)
	draw_text(txt, 4, 0.800000, 0.239500, 0.083000, 0.311000, 255, 255, 255, 255, false)
end


function toSub(txt, menu)
	if button(txt.." >") then
		move(menu)
	end
end

function toggle(txt, b00l)
	button(txt)
	if b00l then
		if (current_option <= 16 and option_count <= 16) then
			draw_rect(0.896999, (option_count * 0.035 + 0.273499), 0.049000, 0.025000, 29, 29, 29, 255)
			draw_text("~italic~On", 7, 0.878000, (option_count * 0.035 + 0.261499), 0.085000, 0.361999, 45, 255, 126, 166, false)
			draw_rect(0.909000, (option_count * 0.035 + 0.273500), 0.022000, 0.020000, 60, 60, 60, 255)
		elseif (option_count > (current_option - 16) and option_count <= current_option) then
			draw_rect(0.896999, ((option_count - (current_option - 16)) * 0.035 + 0.273499), 0.049000, 0.025000, 29, 29, 29, 255)
			draw_text("~italic~On", 7, 0.878000, ((option_count - (current_option - 16)) * 0.035 + 0.261499), 0.085000, 0.361999, 45, 255, 126, 166, false)
			draw_rect(0.909000, ((option_count - (current_option - 16)) * 0.035 + 0.273500), 0.022000, 0.020000, 60, 60, 60, 255)
		end
	else
		if (current_option <= 16 and option_count <= 16) then
			draw_rect(0.896999, (option_count * 0.035 + 0.273499), 0.049000, 0.025000, 29, 29, 29, 255)
			draw_text("~italic~Off", 7, 0.897999, (option_count * 0.035 + 0.261499), 0.085000, 0.369999, 107, 107, 107, 87, false)
			draw_rect(0.885000, (option_count * 0.035 + 0.273500), 0.022000, 0.020000, 60, 60, 60, 255)
		elseif (option_count > (current_option - 16) and option_count <= current_option) then
			draw_rect(0.896999, ((option_count - (current_option - 16)) * 0.035 + 0.273499), 0.049000, 0.025000, 29, 29, 29, 255)
			draw_text("~italic~Off", 7, 0.897999, ((option_count - (current_option - 16)) * 0.035 + 0.261499), 0.085000, 0.369999, 107, 107, 107, 87, false)
			draw_rect(0.885000, ((option_count - (current_option - 16)) * 0.035 + 0.273500), 0.022000, 0.020000, 60, 60, 60, 255)
		end
	end
	if current_option == option_count then
		if select_pressed then
			return true
		end
	end
	return false
end

function button(txt)
	option_count = option_count + 1
	if current_option == option_count then
		if (current_option <= 16 and option_count <= 16) then
			draw_rect(0.825000, ((option_count * 0.035) + 0.273501), 0.193000, 0.037000, 45, 126, 255, 19)
			draw_rect(0.726002, ((option_count * 0.035) + 0.262500), 0.001000, 0.025000, 255, 255, 255, 255)
			draw_rect(0.734001, ((option_count * 0.035) + 0.250500), 0.016000, 0.002000, 255, 255, 255, 255)
			draw_rect(0.914999, ((option_count * 0.035) + 0.294499), 0.015000, 0.002000, 255, 255, 255, 255)
			draw_rect(0.922999, ((option_count * 0.035) + 0.281499), 0.001000, 0.028000, 255, 255, 255, 255)
			draw_text(txt, 6, 0.751000, (option_count * 0.035 + 0.252500), 0.085000, 0.555000, 45, 255, 126, 255, false)
		elseif (option_count > (current_option - 16) and option_count <= current_option) then
			draw_rect(0.825000, (((option_count - (current_option - 16)) * 0.035) + 0.273501), 0.193000, 0.037000, 45, 126, 255, 19)
			draw_rect(0.726002, (((option_count - (current_option - 16)) * 0.035) + 0.262500), 0.001000, 0.025000, 255, 255, 255, 255)
			draw_rect(0.734001, (((option_count - (current_option - 16)) * 0.035) + 0.250500), 0.016000, 0.002000, 255, 255, 255, 255)
			draw_rect(0.914999, (((option_count - (current_option - 16)) * 0.035) + 0.294499), 0.015000, 0.002000, 255, 255, 255, 255)
			draw_rect(0.922999, (((option_count - (current_option - 16)) * 0.035) + 0.281499), 0.001000, 0.028000, 255, 255, 255, 255)
			draw_text(txt, 6, 0.751000, ((option_count - (current_option - 16)) * 0.035 + 0.252500), 0.085000, 0.555000, 45, 255, 126, 255, false)
		end
		if select_pressed then
			return true
		end
	else
		if (current_option <= 16 and option_count <= 16) then
			draw_text(txt, 6, 0.751000, (option_count * 0.035 + 0.252500), 0.085000, 0.555000, 255, 255, 255, 255, false)
		elseif (option_count > (current_option - 16) and option_count <= current_option) then
			draw_text(txt, 6, 0.751000, ((option_count - (current_option - 16)) * 0.035 + 0.252500), 0.085000, 0.555000, 255, 255, 255, 255, false)
		end
	end
	return false
end

local testbool = false

function ui()
	if submenu == 1 then
		title("Main Menu")
		toSub("Self", 2)
		toSub("Player List", 3)
		toSub("Weapon", 4)
		toSub("Vehicle", 5)
		toSub("World", 6)
		toSub("Misc", 7)
		toSub("Teleport", 8)
		toSub("Recovery", 9)
		toSub("Settings", 10)
	end

if submenu == 2 then
title("Self")
	if toggle("Godmode", testbool) then
	testbool = not testbool
	end
end

if submenu == 4 then
	title("Weapon")
	if toggle("Give All Weapons", testbool) then
	testbool = not testbool
	end
end
	
if submenu == 5 then
title("Vehicle")
	if toggle("Godmode", testbool) then
	testbool = not testbool
	end
end

if submenu == 6 then
title("World")
	if toggle("Clear Area", testbool) then
	testbool = not testbool
	end
end

if submenu == 7 then
title("Misc")
	if toggle("Jumpy Cars", testbool) then
	testbool = not testbool
	end
end

if submenu == 8 then
title("Teleport")
	if toggle("Maze Bank", testbool) then
	testbool = not testbool
	end
end

if submenu == 9 then
	title("Recovery")
	if toggle("$500k + $750k Loop", testbool) then
	testbool = not testbool
	end
end

if submenu == 10 then
	title("Settings")
	if button("Save Settings") then
		util.log("Settings Saved")
	elseif button("Unload") then
			is_running = false
			util.log("Unloaded Base!")
			end
		end


sub = 1000
if submenu == 3 then
title("Player List")
for i = 0, 32 do
local ped = PLAYER.GET_PLAYER_PED(i)
	if ENTITY.DOES_ENTITY_EXIST(ped) then
		sub = sub + i
		toSub(NETWORK.NETWORK_PLAYER_GET_NAME(i), sub)
		end
	end
end

if submenu == sub then
	if button("Player Info") then
		util.log("Test")
		end
	end
end

function toggle_options() 
	if testbool then
		util.log("test toggle")
	end
end

base_ui_on = false
addict.toggle(addict.my_root(), "UI Menu", {""}, "", function(on)
    if on then
        base_ui_on = true
    else
        base_ui_on = false
    end
end, false)

while addict_is_running do
	if base_ui_on then
        handle_inputs()
        disable_actions()
        base_ui()
        ui()
        toggle_options()
    end
	util.yield()
end