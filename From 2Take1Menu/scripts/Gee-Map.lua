if _GM_loading_started then
	menu.notify("Oh noes!\nGee-Map loading cancelled.\nAlready loaded.")
	menu.exit()
	return
elseif not menu.is_trusted_mode_enabled(1 << 1) then
	menu.notify("Oh noes!\nGee-Map loading cancelled.\nTrusted mode for globals required.")
	menu.exit()
	return 
elseif not menu.is_trusted_mode_enabled(1 << 2) then
	menu.notify("Oh noes!\nGee-Map loading cancelled.\nTrusted mode for natives required.\n(Chat box interference prevention)")
	menu.exit()
	return 
end
local check_this_table = {
{"\\GeeMap_v2", 0, ""},
{"\\GeeMap_v2\\lua_library", 5, "lua"},
{"\\GeeMap_v2\\images", 2,"png"},
{"\\GeeMap_v2\\images\\heading_marker", 22,"png"},
{"\\GeeMap_v2\\images\\heading_marker\\delphine_gif", 186,"png"},
{"\\GeeMap_v2\\images\\heading_marker\\zoo_bounce", 113,"png"},
{"\\GeeMap_v2\\images\\maps", 7, "png"},
{"\\GeeMap_v2\\images\\maps\\zoom", 0, ""},
{"\\GeeMap_v2\\images\\maps\\zoom\\3d", 12, "png"},
{"\\GeeMap_v2\\images\\maps\\zoom\\color", 12, "png"},
{"\\GeeMap_v2\\images\\maps\\zoom\\dark", 12, "png"},
{"\\GeeMap_v2\\images\\player_dots", 12, "png"},
{"\\GeeMap_v2\\images\\player_dots_w", 12, "png"},
{"\\GeeMap_v2\\images\\vehicles", 0 , ""},
{"\\GeeMap_v2\\images\\vehicles\\veh_no_rotate", 106, "png"},	
{"\\GeeMap_v2\\images\\vehicles\\veh_no_rotate\\generic", 19, "png"},
{"\\GeeMap_v2\\images\\vehicles\\veh_rotate", 39, "png"},
{"\\GeeMap_v2\\images\\vehicles\\veh_rotate\\generic", 4, "png"},
}
for i=1,#check_this_table do
	if not utils.dir_exists(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts"..check_this_table[i][1].."\\") then
		menu.notify("Oh noes!\nGee-Map loading cancelled.\nYou are missing the folder: "..check_this_table[i][1].."\nYou must copy the entire GeeMap_v2 folder into scripts.")
		menu.exit()
		return
	elseif check_this_table[i][2] > 0 then
		local files_table = utils.get_all_files_in_directory(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts"..check_this_table[i][1].."\\",check_this_table[i][3])
		if #files_table < check_this_table[i][2] then
			menu.notify("Oh noes!\nGee-Map loading cancelled.\nYou are missing files in the folder: "..check_this_table[i][1].."\nYou must copy the entire GeeMap_v2 folder into scripts.")
			menu.exit()
			return
		end
	end
end

check_this_table = {"Interior.lua","Vk List.lua","Oh No GTA Updated.lua","Funcs.lua","API List.lua"}
for i=1,#check_this_table do
	if not utils.file_exists(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts\\GeeMap_v2\\lua_library\\"..check_this_table[i]) then
		menu.notify("Oh noes!\nGee-Map loading cancelled.\nYou are missing "..check_this_table[i].."\nYou must re-install Gee-Map.")
		menu.exit()
		return
	end
end
local function check_require(_var,_text)
	if _var == nil then
		menu.notify("Oh noes!\nGee-Map loading cancelled.\n".._text.." is corrupted.\nYou must re-install Gee-Map.")
		menu.exit()
		return false
	end
	return true
end
_GM_loading_started=true
local _GM_ = {}
local API = require("GeeMap_v2/lua_library/API List")
if not check_require(API,"API List.lua") then return end
local funcs = require("GeeMap_v2/lua_library/Funcs")
if not check_require(funcs,"Funcs.lua") then return end
local intrr = require("GeeMap_v2/lua_library/Interior")
if not check_require(intrr,"Interior.lua") then return end
local vk = require("GeeMap_v2/lua_library/Vk List")
if not check_require(vk,"Vk List.lua") then return end
local glbls = require("GeeMap_v2/lua_library/Oh No GTA Updated")
if not check_require(glbls,"Oh No GTA Updated.lua") then return end

_GM_.ver_text = "Gee-Map 2.0"


_GM_.save_load = {}
_GM_.threads={}
_GM_.save_load.name={}
_GM_.save_load.feat={}
_GM_.main_parent = menu.add_feature("Gee-Map","parent",0)
_GM_.loaded=false
_GM_.ship = false
_GM_.ship_me = false
_GM_.cayo = false
_GM_.cayo_me = false
_GM_.cmpnd = false
_GM_.cayo_me_size = 1
_GM_.helo_rot = 0
_GM_.my_pos = v2(16000,16000)
_GM_.show_map,_GM_.show_map_center = 0, v2(232,1700)
_GM_.hotkey_bool = false
_GM_.pid_interior_true={}
_GM_.file_root = utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts\\GeeMap_v2\\images\\"
_GM_.team_rgb_list = {
[-1] = {255,255,255},-- table 1  == -1  -- white   gta reports org color as -1 when not in org/mc and momentarily when in org/mc
[0] = {247,159,123},-- table 2  ==  0  -- orange
[1] = {226,134,187},-- table 3  ==  1  -- pink
[2] = {239,238,151},-- table 4  ==  2  -- yellow
[3] = {113,169,175},-- table 5  ==  3  -- teal blue/green
[4] = {160,140,193},-- table 6  ==  4  -- purple
[5] = {141,206,167},-- table 7  ==  5  -- light green
[6] = {181,214,234},-- table 8  ==  6  -- light blue
[7] = {178,144,132},-- table 9  ==  7  -- brown
[8] = {0,  132,114},-- table 10 ==  8  -- dark green
[9] = {216,85,117},-- table 11 ==  9  -- hot pink
[10] = {255,255,255}-- table 12 == 10  -- I havent seen this as an org/mc color but without this slot here i will get an error
}

_GM_.sort_table={}
_GM_.sort_int=1
for i=1,32 do
	_GM_.sort_table[i]={}
	for ii=_GM_.sort_int,32 do
		_GM_.sort_table[i][#_GM_.sort_table[i]+1]=ii
	end
	for ii=1,(_GM_.sort_int-1) do
		_GM_.sort_table[i][#_GM_.sort_table[i]+1]=ii
	end
	_GM_.sort_int=_GM_.sort_int+1
end

_GM_.plyr_list = {}
for i=1, 32 do
	_GM_.plyr_list[i] = {PID = i, GOOD = false, POS = v2(0,0), ROT = 0, COLOR =-1, VEH = false, PNG = 0, F_ROT = 0, O_ROT = 0}
end
_GM_.plyr_me = {PID = i, GOOD = false, POS = v2(0,0), ROT = 0, COLOR =-1, VEH = false, PNG = 0, F_ROT = 0, O_ROT = 0}

function _GM_.add_to_cfg_list(_feat,_str)
	_GM_.save_load.name[#_GM_.save_load.name+1]=_str
	_GM_.save_load.feat[_str]=_feat
end

function _GM_.plyr_rgb(_pid)
	if funcs.is.valid_pid(_pid) then
		local colors = _GM_.team_rgb_list[glbls.team_rgb_int(_pid)]
		return colors[1],colors[2],colors[3]
	end
	return 255,255,255
end

function _GM_.get_script_text_size(_bool)
	if _bool and menu.get_feature_by_hierarchy_key("local.settings.menu_ui.fonts.script_1") ~= nil and menu.get_feature_by_hierarchy_key("local.settings.menu_ui.fonts.script_1").value ~= nil then
		if menu.get_feature_by_hierarchy_key("local.settings.menu_ui.fonts.script_1").value == 0 then
			return 0.575
		elseif menu.get_feature_by_hierarchy_key("local.settings.menu_ui.fonts.script_1").value == 1 then
			return 0.9
		end
	end
	return 1
end

function _GM_.SET_RES()
_GM_.RES_W = (graphics.get_screen_width()/3840)
_GM_.RES_H = (graphics.get_screen_height()/2160)
_GM_.RES = (_GM_.RES_W+_GM_.RES_H)*0.5
end
_GM_.SET_RES()

_GM_.head_mark_str = {
"None",
"Arrow 1",
"Arrow 2",
"Arrow 3",
"Arrow 4",
"Arrow 5",
"Arrow 6",
"Arrow 7",
"Eggplant peach",
"Tiny dick",
"Chode",
"Dick",
"Devil fork",
"Delphine",
"Delphine GIF",
"Zoo bounce",
"Khalifa bra",
"Khalifa tape",
"Lohan",
"Pepe",
"Just NO",
"Spawn",
"IDK1", -- need name
"IDK2" -- need name
}
	
function _GM_.load_main() 
	_GM_.map_png={}
	_GM_.map_png[1] = scriptdraw.register_sprite(_GM_.file_root.."\\maps\\color.png")
	API.sys.yld(0)
	_GM_.map_png[2] = scriptdraw.register_sprite(_GM_.file_root.."\\maps\\3d.png")
	API.sys.yld(0)
	_GM_.map_png[3] = scriptdraw.register_sprite(_GM_.file_root.."\\maps\\dark.png")
	API.sys.yld(0)
	_GM_.cayo_3d = scriptdraw.register_sprite(_GM_.file_root.."\\maps\\cayo_3d_2.png")
	API.sys.yld(0)
	_GM_.cmpnd_3d = scriptdraw.register_sprite(_GM_.file_root.."\\maps\\compound_3d.png")
	API.sys.yld(0)
	_GM_.cmpnd_dark = scriptdraw.register_sprite(_GM_.file_root.."\\maps\\compound_dark.png")
	API.sys.yld(0)
	_GM_.cayo_dark = scriptdraw.register_sprite(_GM_.file_root.."\\maps\\cayo_dark.png")
	API.sys.yld(0)
	_GM_.ussl_dark = scriptdraw.register_sprite(_GM_.file_root.."\\maps\\ussl_dark.png")
	API.sys.yld(0)

	
	_GM_.map_zoom_c={}
	_GM_.map_zoom_3d={}
	_GM_.map_zoom_dark={}
	for i=1,12 do
		_GM_.map_zoom_c[i]=scriptdraw.register_sprite(_GM_.file_root.."\\maps\\zoom\\color\\"..i..".png")
		_GM_.map_zoom_3d[i]=scriptdraw.register_sprite(_GM_.file_root.."\\maps\\zoom\\3d\\"..i..".png")
		_GM_.map_zoom_dark[i]=scriptdraw.register_sprite(_GM_.file_root.."\\maps\\zoom\\dark\\"..i..".png")
		funcs.doo.yield_if_modulus(i,5,0)
	end

	_GM_.plyr_png={}
	_GM_.plyr_png_w={}
	for i=1,12 do
		_GM_.plyr_png[i] = scriptdraw.register_sprite(_GM_.file_root.."\\player_dots\\"..i..".png")
		_GM_.plyr_png_w[i] = scriptdraw.register_sprite(_GM_.file_root.."\\player_dots_w\\"..i..".png")
		funcs.doo.yield_if_modulus(i,5,0)
	end
	_GM_.wp_blip = scriptdraw.register_sprite(_GM_.file_root.."\\waypoint.png")
	_GM_.semicircle = scriptdraw.register_sprite(_GM_.file_root.."\\semicircle.png")
	
	_GM_.z_point = {}
	for i=1,21 do
		_GM_.z_point[i] = scriptdraw.register_sprite(_GM_.file_root.."\\heading_marker\\"..i..".png")
		funcs.doo.yield_if_modulus(i,5,0)
	end
	_GM_.z_point_gif_delphine = {}
	for i=1,186 do
		_GM_.z_point_gif_delphine[i] = scriptdraw.register_sprite(_GM_.file_root.."\\heading_marker\\delphine_gif\\"..i..".png")
		funcs.doo.yield_if_modulus(i,5,0)
	end
	for i=0,186 do
		_GM_.z_point_gif_delphine[#_GM_.z_point_gif_delphine+1] = scriptdraw.register_sprite(_GM_.file_root.."\\heading_marker\\delphine_gif\\"..(186-i)..".png")
		funcs.doo.yield_if_modulus(i,5,0)
	end
	_GM_.z_point_gif_zoo = {}
	for i=1,113 do
		_GM_.z_point_gif_zoo[i] = scriptdraw.register_sprite(_GM_.file_root.."\\heading_marker\\zoo_bounce\\"..i..".png")
		funcs.doo.yield_if_modulus(i,5,0)
	end
	for i=0,113 do
		_GM_.z_point_gif_zoo[#_GM_.z_point_gif_zoo+1] = scriptdraw.register_sprite(_GM_.file_root.."\\heading_marker\\zoo_bounce\\"..(113-i)..".png")
		funcs.doo.yield_if_modulus(i,5,0)
	end
	_GM_.z_point_mark = scriptdraw.register_sprite(_GM_.file_root.."\\heading_marker\\marker.png")
	
	_GM_.veh_png_true={}
	_GM_.veh_png_int={}
	_GM_.veh_png_rot_true={}
	local veh_file_paths = {"\\vehicles\\veh_rotate","\\vehicles\\veh_rotate\\generic","\\vehicles\\veh_no_rotate","\\vehicles\\veh_no_rotate\\generic"}
	local sprite_files, _start,_end,hash_string,sprite = {}
	for p=1,4 do
		sprite_files = utils.get_all_files_in_directory(_GM_.file_root..veh_file_paths[p],"png")
		for i=1,#sprite_files do
			sprite = scriptdraw.register_sprite(_GM_.file_root..veh_file_paths[p].."\\"..sprite_files[i])
			if sprite ~= nil then
				_start,_end = string.find(sprite_files[i], "png")
				hash_string = string.sub(sprite_files[i],1,_end-4)
				if p == 1 then
					_GM_.veh_png_true[gameplay.get_hash_key(hash_string)] = true
					_GM_.veh_png_int[gameplay.get_hash_key(hash_string)] = sprite
					_GM_.veh_png_rot_true[gameplay.get_hash_key(hash_string)] = true
				elseif p == 2 then
					_GM_.veh_png_true[hash_string] = true
					_GM_.veh_png_int[hash_string] = sprite
					_GM_.veh_png_rot_true[hash_string] = true
				elseif p == 3 then
					_GM_.veh_png_true[gameplay.get_hash_key(hash_string)] = true
					_GM_.veh_png_int[gameplay.get_hash_key(hash_string)] = sprite
					_GM_.veh_png_rot_true[gameplay.get_hash_key(hash_string)] = false
				else
					_GM_.veh_png_true[hash_string] = true
					_GM_.veh_png_int[hash_string] = sprite
					_GM_.veh_png_rot_true[hash_string] = false
				end
			end
		end		
	end
	_GM_.loaded=true
end

function _GM_.do_auto_zoom(_bool)
	if _GM_.hotkey_bool then
		if _GM_.map2_zoom.on then
			if _bool then
				return (_GM_.map2_zoom.value == 0)
			end
			return true
		end
	elseif _GM_.map1_zoom.on then
		if _bool then
			return (_GM_.map1_zoom.value == 0)
		end
		return true
	end
	return false
end
	
function _GM_.show_map_center_do()
	local _pos = API.plyr.get_coords(API.plyr.my_id())
	-- if _GM_.ship_me then
		-- return 0,v2(_GM_.cayo_c_x.value,_GM_.cayo_c_y.value)
	-- else
	if _GM_.cmpnd then
		return 0,v2(5030.5,-5742)
	elseif _GM_.cayo_me then -- whole cayo
		--return 0,v2(_GM_.cayo_c_x.value,_GM_.cayo_c_y.value)
		return 0,v2(4763.5,-5153.5)
	elseif _GM_.pid_interior_true[API.plyr.my_id()] then
		if _GM_.do_auto_zoom(true) then
			_pos = _GM_.my_pos
		else
			return 0,v2(232,1700)
		end
	elseif not _GM_.do_auto_zoom(false) then
		return 0,v2(232,1700)
	end
	if funcs.is.xy_in_range(_pos,-3854,4318,-3988,7388)	then -- one of the zoomed maps
		if funcs.is.xy_in_range(_pos,-1660,2123,-3988,1050) then -- city area
			if funcs.is.xy_in_range(_pos,-1660,1367,-3040,120) then
				if _pos.y > -1460 then
					if _pos.x < -524.6 then
						return 10, v2(-903,-933)
					elseif _pos.x < 232 then
						return 6, v2(-146.333,-933)
					end
					return 7, v2(610.325,-933)
				elseif _pos.x < -524.6 then
					return 11, v2(-903,-1986.3)
				elseif _pos.x < 232 then
					return 8, v2(-146.333,-1986.3)
				end
				return 9, v2(610.325,-1986.3)
			end
			return 5, v2(232,-1460) -- whole city
		elseif funcs.is.xy_in_range(_pos,-1160,1623,1050,5700) then -- upper middle zoom
			return 12,v2(232,3280)
		elseif _pos.y > 1700 then
			if _pos.x < 232 then
				return 1, v2(-903,3280) --top left quadrant
			end
			return 2, v2(1367,3280) --top right quadrant
		elseif _pos.x < 232 then
			return 3, v2(-903,120) --bottom left quadrant
		end
		return 4, v2(1367,120) -- bottom right quadrant
	end
	return 0,v2(232,1700) -- whole map
end

function _GM_.set_map_pos_limit(map_int,center_pos)
	local x_min,x_max,y_min,y_max
	-- if _GM_.ship_me then
		-- x_min,x_max = center_pos.x - 400, center_pos.x + 400
		-- y_min,y_max = center_pos.y - 500, center_pos.y + 500
	-- else
	if _GM_.cmpnd then
		x_min,x_max = center_pos.x - 88, center_pos.x + 88
		y_min,y_max = center_pos.y - 79, center_pos.y + 79
	elseif _GM_.cayo_me then --4763.5,-5153.5
		x_min,x_max = center_pos.x - 1200, center_pos.x + 1200
		y_min,y_max = center_pos.y - 1200, center_pos.y + 1200
	elseif map_int > 0 then
		if map_int == 4 and _GM_.cayo then
			x_min,x_max = center_pos.x - 3405, center_pos.x + 3405+1100
			y_min,y_max = center_pos.y - 4700-1600, center_pos.y + 4700
		elseif map_int == 5 or map_int == 12 then
			x_min,x_max = center_pos.x - 2270, center_pos.x + 2270
			y_min,y_max = center_pos.y - 3160, center_pos.y + 3160
		elseif map_int > 5 then
			x_min,x_max = center_pos.x - 1135, center_pos.x + 1135
			y_min,y_max = center_pos.y - 1580, center_pos.y + 1580
		else
			x_min,x_max = center_pos.x - 3405, center_pos.x + 3405
			y_min,y_max = center_pos.y - 4700, center_pos.y + 4700
		end
	elseif _GM_.cayo then
		x_min,x_max = center_pos.x - 4540, center_pos.x + 4540+1100
		y_min,y_max = center_pos.y - 6320-1600 , center_pos.y + 6320
	else
		x_min,x_max = center_pos.x - 4540, center_pos.x + 4540
		y_min,y_max = center_pos.y - 6320, center_pos.y + 6320
	end
	return x_min,x_max,y_min,y_max
end

function _GM_.plyr_record(_I)
	local _pid = _GM_.plyr_list[_I].PID
	_GM_.plyr_list[_I].GOOD = true
	if API.plyr.is_in_veh(_pid) and (_GM_.veh_png_true[API.ent.get_model_hash(API.plyr.get_veh(_pid))] or _GM_.veh_png_true[funcs.get.veh_class_name(API.plyr.get_veh(_pid))]) then
		_GM_.plyr_list[_I].VEH = true
		if _GM_.veh_png_true[API.ent.get_model_hash(API.plyr.get_veh(_pid))] then
			_GM_.plyr_list[_I].PNG = _GM_.veh_png_int[API.ent.get_model_hash(API.plyr.get_veh(_pid))]
			if funcs.get.veh_model_name(API.plyr.get_veh(_pid)) == "Buzzard Attack Chopper" then
				_GM_.plyr_list[_I].ROT = funcs.get.sprite_rot(_GM_.helo_rot)
			elseif _GM_.veh_png_rot_true[API.ent.get_model_hash(API.plyr.get_veh(_pid))] then
				_GM_.plyr_list[_I].ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid))
			else
				_GM_.plyr_list[_I].ROT = 0
			end
		else
			_GM_.plyr_list[_I].PNG = _GM_.veh_png_int[funcs.get.veh_class_name(API.plyr.get_veh(_pid))]
			if funcs.get.veh_class_name(API.plyr.get_veh(_pid)) == "Helicopters" then
				_GM_.plyr_list[_I].ROT = funcs.get.sprite_rot(_GM_.helo_rot)
			elseif _GM_.veh_png_rot_true[funcs.get.veh_class_name(API.plyr.get_veh(_pid))] then
				_GM_.plyr_list[_I].ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid))
			else
				_GM_.plyr_list[_I].ROT = 0
			end
		end
		if funcs.get.veh_class_name(API.plyr.get_veh(_pid)) == "Planes" then
			_GM_.plyr_list[_I].F_ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid)+180)
			_GM_.plyr_list[_I].O_ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid))
		else
			_GM_.plyr_list[_I].F_ROT = math.pi
			_GM_.plyr_list[_I].O_ROT = 0
		end
	else
		_GM_.plyr_list[_I].VEH = false
		_GM_.plyr_list[_I].ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid))
	end
	_GM_.plyr_list[_I].POS = _GM_.sprt_pos_do(API.plyr.get_coords(_pid))
	_GM_.plyr_list[_I].COLOR = glbls.team_rgb_int(_pid)+2
end

function _GM_.me_record()
	local _pid = _GM_.plyr_me.PID
	_GM_.plyr_me.GOOD = true
	if API.plyr.is_in_veh(_pid) and (_GM_.veh_png_true[API.ent.get_model_hash(API.plyr.get_veh(_pid))] or _GM_.veh_png_true[funcs.get.veh_class_name(API.plyr.get_veh(_pid))]) then
		_GM_.plyr_me.VEH = true
		if _GM_.veh_png_true[API.ent.get_model_hash(API.plyr.get_veh(_pid))] then
			_GM_.plyr_me.PNG = _GM_.veh_png_int[API.ent.get_model_hash(API.plyr.get_veh(_pid))]
			if funcs.get.veh_model_name(API.plyr.get_veh(_pid)) == "Buzzard Attack Chopper" then
				_GM_.plyr_me.ROT = funcs.get.sprite_rot(_GM_.helo_rot)
			elseif _GM_.veh_png_rot_true[API.ent.get_model_hash(API.plyr.get_veh(_pid))] then
				_GM_.plyr_me.ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid))
			else
				_GM_.plyr_me.ROT = 0
			end
		else
			_GM_.plyr_me.PNG = _GM_.veh_png_int[funcs.get.veh_class_name(API.plyr.get_veh(_pid))]
			if funcs.get.veh_class_name(API.plyr.get_veh(_pid)) == "Helicopters" then
				_GM_.plyr_me.ROT = funcs.get.sprite_rot(_GM_.helo_rot)
			elseif _GM_.veh_png_rot_true[funcs.get.veh_class_name(API.plyr.get_veh(_pid))] then
				_GM_.plyr_me.ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid))
			else
				_GM_.plyr_me.ROT = 0
			end
		end
		if funcs.get.veh_class_name(API.plyr.get_veh(_pid)) == "Planes" then
			_GM_.plyr_me.F_ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid)+180)
			_GM_.plyr_me.O_ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid))
		else
			_GM_.plyr_me.F_ROT = math.pi
			_GM_.plyr_me.O_ROT = 0
		end
	else
		_GM_.plyr_me.VEH = false
		_GM_.plyr_me.ROT = funcs.get.sprite_rot(API.plyr.get_heading(_pid))
	end
	_GM_.plyr_me.POS = _GM_.sprt_pos_do(API.plyr.get_coords(_pid))
	_GM_.plyr_me.COLOR = glbls.team_rgb_int(_pid)+2
end

function _GM_.sprt_pos_do(sprite_pos)
	local size,x_val,y_val = _GM_.map1_size.value,_GM_.pos1_x.value,_GM_.pos1_y.value
	local center_pos,map_int = _GM_.show_map_center,_GM_.show_map
	local x_min,x_max,y_min,y_max = _GM_.set_map_pos_limit(map_int,center_pos)
	if _GM_.hotkey_bool then
		size,x_val,y_val = _GM_.map2_size.value,_GM_.pos2_x.value,_GM_.pos2_y.value
	end
	size = size*_GM_.cayo_me_size
	if sprite_pos.x > x_max then sprite_pos.x = x_max elseif sprite_pos.x < x_min then sprite_pos.x = x_min	end
	if sprite_pos.y > y_max then sprite_pos.y = y_max elseif sprite_pos.y < y_min then sprite_pos.y = y_min end
	local new_pos = sprite_pos - center_pos
	return _GM_.sprt_pos_calc(new_pos,size,x_val,y_val)
end

function _GM_.sprt_pos_calc(new_pos,size,x_val,y_val)
	local function v2_math(x_div,y_div,mult,m_fix_x,m_fix_y)
		return v2(
		new_pos.x/(10400*x_div*_GM_.RES_W)*mult*size*m_fix_x +x_val,
		new_pos.y/(5875*y_div*_GM_.RES_H)*mult*size*m_fix_y+y_val
		)
	end
	-- if _GM_.ship_me then
		-- return v2(new_pos.x/325*size+x_val,new_pos.y/195*size+y_val) 
	-- else
	if _GM_.cmpnd then
		return v2_math(0.022355769,0.02212766,1,_GM_.cp_cmpnd_math_x.value,_GM_.cp_cmpnd_math_y.value)
	elseif _GM_.cayo_me then
		return v2_math(0.166346154,0.166808511,1,_GM_.cp_math_x.value,_GM_.cp_math_y.value)		
	elseif _GM_.show_map > 0 then
		if _GM_.show_map == 5 or _GM_.show_map == 12 then
			return v2_math(0.58,0.579,1,_GM_.cntr_math_x.value,_GM_.cntr_math_y.value)		
		elseif _GM_.show_map > 5 then
			return v2_math(0.58,0.579,2,_GM_.othr_math_x.value,_GM_.othr_math_y.value)		
		end
		return v2_math(0.875,0.865,1,_GM_.qrtr_math_x.value,_GM_.qrtr_math_y.value)	
	end
	return v2_math(1,1,1,_GM_.full_math_x.value,_GM_.full_math_y.value)	
end

function _GM_.head_pos_do(_map_size)
	local my_pos = API.plyr.get_coords(API.plyr.my_id())
	local center_pos,map_int = _GM_.show_map_center,_GM_.show_map
	local x_val,y_val = _GM_.pos1_x.value,_GM_.pos1_y.value
	if _GM_.hotkey_bool then
		x_val,y_val = _GM_.pos2_x.value,_GM_.pos2_y.value
	end
	local x_min,x_max,y_min,y_max = _GM_.set_map_pos_limit(map_int,center_pos)
	local dist = 10
	local mult = 1.01
	if _GM_.cmpnd then dist=5 mult=1.005 end
	repeat
		dist = dist * mult
		my_pos = funcs.get.front_of_pos(my_pos, API.cam.get_rot().z, dist, 180, 0)
	until (my_pos.x > x_max or my_pos.x < x_min) or (my_pos.y > y_max or my_pos.y < y_min)
	if my_pos.x > x_max then my_pos.x = x_max elseif my_pos.x < x_min then my_pos.x = x_min	end
	if my_pos.y > y_max then my_pos.y = y_max elseif my_pos.y < y_min then my_pos.y = y_min end
	local new_pos = my_pos - center_pos
	return _GM_.sprt_pos_calc(new_pos,_map_size,x_val,y_val)
end

_GM_.map_feat = menu.add_feature("Show GTA map","toggle",_GM_.main_parent.id,function(f)
	if f.on then
		if not _GM_.loaded then
			_GM_.load_main()
		end
		if _GM_.hotkey_set_feat.value == 0 then
			menu.notify("GTA Map\nPress "..vk.list[_GM_.hotkey1_select.value+1].." to switch to hot-key profile.","Gee-Map 2.0",10)
		else
			menu.notify("GTA Map\nPress "..vk.list[_GM_.hotkey1_select.value+1].." and "..vk.list[_GM_.hotkey2_select.value+1].." to switch to hot-key profile.","Gee-Map 2.0",10)
		end
	end
	local player_size,name_size,r,g,b,pos,png,_pid,_type,_map_x,_map_y,_map_size,_map_alpha,_plyr_size,_plyr_alpha,_plyr_alpha_feat,_name_do,_name_size,zoom_size,blip_size_offset,_head_mark_s,_head_mark_a,_head_mark,_bool,show_map
	local delphine_i,zoo_i,cam_rot,head_pos,head_rot = 1,1,6969
	local wp_time,sort_time = API.util.t_ms(),API.util.t_ms()
	local wp_blink,sort_bool = true,true
	local int_msg = {}
	local int_ofst = 0
	local sort1,sort2 = 1,1
	local script_size = _GM_.get_script_text_size(f.on)
	local function _180_to_360(_val)
		if _val > 180 then
			return _val - 360
		elseif _val < -180 then
			return _val + 360
		end
		return _val
	end
	local function show_player(_list_I)
		_pid = _list_I.PID
		if _list_I.GOOD then
			r,g,b = _GM_.plyr_rgb(_pid)
			pos = _list_I.POS
			if _list_I.VEH then
				if API.plyr.is_friend(_pid) then
					API.SD.draw_sprt(_GM_.semicircle,pos,_map_size*.25*_plyr_size*blip_size_offset,_list_I.F_ROT,funcs.get.RGBATOINT(93,182,229,API.mth.flr(255*_plyr_alpha_feat)))
				end
				if glbls.is_pid_otr(_pid) then
					API.SD.draw_sprt(_GM_.semicircle,pos,_map_size*.25*_plyr_size*blip_size_offset,_list_I.O_ROT,funcs.get.RGBATOINT(114,204,114,API.mth.flr(255*_plyr_alpha_feat)))
				end
				API.SD.draw_sprt(_list_I.PNG,pos,_map_size*_plyr_size*blip_size_offset*1.69,_list_I.ROT,funcs.get.RGBATOINT(r,g,b,API.mth.flr(255*_plyr_alpha_feat)))
			else
				if API.plyr.is_friend(_pid) then
					API.SD.draw_sprt(_GM_.semicircle,pos,_map_size*.069*_plyr_size*2.69*blip_size_offset,3.125,funcs.get.RGBATOINT(93,182,229,API.mth.flr(255*_plyr_alpha_feat)))
				end
				if glbls.is_pid_otr(_pid) then
					API.SD.draw_sprt(_GM_.semicircle,pos,_map_size*.069*_plyr_size*2.69*blip_size_offset,0,funcs.get.RGBATOINT(114,204,114,API.mth.flr(255*_plyr_alpha_feat)))
				end
				API.SD.draw_sprt(png[_list_I.COLOR],pos,_map_size*.069*_plyr_size*2.69*blip_size_offset,_list_I.ROT,_plyr_alpha)
			end
			if _name_do then
				scriptdraw.draw_text(funcs.get.plyr_name(_pid), pos+v2(0.15*player_size*blip_size_offset,0.069*player_size*blip_size_offset), v2(player_size,player_size), name_size*1.5*blip_size_offset*script_size*_GM_.RES, funcs.get.RGBATOINT(r,g,b,API.mth.flr(255*_plyr_alpha_feat)),1 << 1, 0)
			end
		end
	end
	while f.on do
		show_map=false
		if _GM_.hotkey_bool then
			if _GM_.map2_alpha_feat.value > 0 then
				show_map=true
				_type,_map_x,_map_y,_map_size,_map_alpha = _GM_.type2_feat.value,_GM_.pos2_x.value,_GM_.pos2_y.value,_GM_.map2_size.value,funcs.get.RGBATOINT(255,255,255,API.mth.flr(255*_GM_.map2_alpha_feat.value))
				_plyr_size,_plyr_alpha,_plyr_alpha_feat = _GM_.plyr2_size.value,funcs.get.RGBATOINT(255,255,255,API.mth.flr(255*_GM_.plyr2_alpha_feat.value)),_GM_.plyr2_alpha_feat.value
				_name_do,_name_size,_head_mark,_head_mark_a,_head_mark_s = _GM_.plyr2_name.on,_GM_.plyr2_name_size.value,_GM_.z2.value,_GM_.head2_alpha_feat.value,_GM_.head2_size.value
			end
		elseif _GM_.map1_alpha_feat.value > 0 then
			show_map=true
			_type,_map_x,_map_y,_map_size,_map_alpha = _GM_.type1_feat.value,_GM_.pos1_x.value,_GM_.pos1_y.value,_GM_.map1_size.value,funcs.get.RGBATOINT(255,255,255,API.mth.flr(255*_GM_.map1_alpha_feat.value))
			_plyr_size,_plyr_alpha,_plyr_alpha_feat = _GM_.plyr1_size.value,funcs.get.RGBATOINT(255,255,255,API.mth.flr(255*_GM_.plyr1_alpha_feat.value)),_GM_.plyr1_alpha_feat.value
			_name_do,_name_size,_head_mark,_head_mark_a,_head_mark_s = _GM_.plyr1_name.on,_GM_.plyr1_name_size.value,_GM_.z1.value,_GM_.head1_alpha_feat.value,_GM_.head1_size.value
		end
		if show_map then
			_GM_.SET_RES()
			if _GM_.helo_rot >= 360 then
				_GM_.helo_rot = 0
			else
				_GM_.helo_rot = _GM_.helo_rot + 1.875
			end
			list = _GM_.plyr_list
			_map_size = _map_size*_GM_.cayo_me_size*_GM_.RES
			if _type == 2 then png = _GM_.plyr_png_w else png = _GM_.plyr_png end
			player_size = _map_size*.069*_plyr_size*2
			name_size = (_plyr_size+_map_size)/6*_name_size
			_GM_.show_map,_GM_.show_map_center = _GM_.show_map_center_do()
			blip_size_offset = 1
			-- if _GM_.ship_me then
				-- API.SD.draw_sprt(_GM_.ussl_dark,v2(_map_x,_map_y),_map_size*2,0,_map_alpha)
			-- else
			if _GM_.cmpnd then
				if _type == 2 then
					API.SD.draw_sprt(_GM_.cmpnd_dark,v2(_map_x,_map_y),_map_size*1.534,0,_map_alpha)
				else
					API.SD.draw_sprt(_GM_.cmpnd_3d,v2(_map_x,_map_y),_map_size*1.534,0,_map_alpha)
				end
			elseif _GM_.cayo_me then
				--API.SD.draw_sprt(_GM_.cayo_3d,v2(_map_x,_map_y),_map_size*_GM_.cayo_s.value,0,_map_alpha)
				if _type == 2 then
					API.SD.draw_sprt(_GM_.cayo_dark,v2(_map_x,_map_y),_map_size*0.9339,0,_map_alpha)
				else
					API.SD.draw_sprt(_GM_.cayo_3d,v2(_map_x,_map_y),_map_size*0.9339,0,_map_alpha)
				end
			elseif _GM_.show_map > 0 then
				if _GM_.show_map == 5 or _GM_.show_map == 12 then
					blip_size_offset = 1.25
					zoom_size = 1
				elseif _GM_.show_map > 5 then
					zoom_size = 2
					blip_size_offset = 1.5
				else
					zoom_size = 1
				end
				if _type == 0 then
					API.SD.draw_sprt(_GM_.map_zoom_c[_GM_.show_map],v2(_map_x, _map_y),_map_size*.69*zoom_size,0,_map_alpha)
				elseif _type == 1 then
					API.SD.draw_sprt(_GM_.map_zoom_3d[_GM_.show_map],v2(_map_x, _map_y),_map_size*.69*zoom_size,0,_map_alpha)
				else
					API.SD.draw_sprt(_GM_.map_zoom_dark[_GM_.show_map],v2(_map_x, _map_y),_map_size*.69*zoom_size,0,_map_alpha)
				end
				if _GM_.show_map == 4 then
					if _GM_.cayo then
						API.SD.draw_sprt(_GM_.cayo_3d,v2((_map_x+(.3732*_map_size*_GM_.cp_mini_math_x.value)),(_map_y+(-1.0396*_map_size*_GM_.cp_mini_math_y.value))),_map_size*.1799,0,_map_alpha)
					end
					-- if _GM_.ship then
						-- API.SD.draw_sprt(_GM_.ussl_dark,v2((_map_x+(_GM_.cayo1x.value*_map_size)),(_map_y+(_GM_.cayo1y.value*_map_size))),_map_size*_GM_.cayo_s.value,0,_map_alpha)
					-- end
				end
			else
				API.SD.draw_sprt(_GM_.map_png[_type+1],v2(_map_x, _map_y),_map_size*.4,0,_map_alpha)
				if _GM_.cayo then
					API.SD.draw_sprt(_GM_.cayo_3d,v2((_map_x+(0.4357*_map_size*_GM_.cp_mini_math_x.value)),(_map_y+(-1.1664*_map_size*_GM_.cp_mini_math_y.value))),_map_size*0.1534,0,_map_alpha)
				end
			end
			if _head_mark > 0 then
				if not funcs.is.num_in_range(API.cam.get_rot().z,cam_rot-.069,cam_rot+.069) or _bool ~= _GM_.hotkey_bool then -- prevents it from continously checking distance for sprite pos when not moving
					cam_rot = API.cam.get_rot().z
					head_pos = _GM_.head_pos_do(_map_size)
					_bool = _GM_.hotkey_bool
				end
				r,g,b = _GM_.plyr_rgb(API.plyr.my_id())
				if _head_mark == 14 then
					if delphine_i+.19 > 372.99 then delphine_i = 1 else delphine_i = delphine_i + .19 end
					API.SD.draw_sprt(_GM_.z_point_gif_delphine[API.mth.flr(delphine_i)],head_pos,_map_size*_head_mark_s,funcs.get.sprite_rot(API.cam.get_rot().z),funcs.get.RGBATOINT(255,255,255,API.mth.flr(255*_head_mark_a)))
					API.SD.draw_sprt(_GM_.z_point_mark,head_pos,_map_size*_head_mark_s,funcs.get.sprite_rot(API.cam.get_rot().z),funcs.get.RGBATOINT(r,g,b,API.mth.flr(255*_head_mark_a*.75)))
				elseif _head_mark == 15 then
					if zoo_i+.169 > 226.99 then zoo_i = 1 else zoo_i = zoo_i + .169 end
					API.SD.draw_sprt(_GM_.z_point_gif_zoo[API.mth.flr(zoo_i)],head_pos,_map_size*_head_mark_s,funcs.get.sprite_rot(API.cam.get_rot().z),funcs.get.RGBATOINT(255,255,255,API.mth.flr(255*_head_mark_a)))
					API.SD.draw_sprt(_GM_.z_point_mark,head_pos,_map_size*_head_mark_s,funcs.get.sprite_rot(API.cam.get_rot().z),funcs.get.RGBATOINT(r,g,b,API.mth.flr(255*_head_mark_a*.75)))
				elseif funcs.is.num_in_range(_head_mark,9,11) or funcs.is.num_in_range(_head_mark,1,7) then
					API.SD.draw_sprt(_GM_.z_point[_head_mark],head_pos,_map_size*_head_mark_s,funcs.get.sprite_rot(API.cam.get_rot().z),funcs.get.RGBATOINT(r,g,b,API.mth.flr(255*_head_mark_a)))
				else
					if _head_mark > 15 then _head_mark = _head_mark - 2 end
					API.SD.draw_sprt(_GM_.z_point[_head_mark],head_pos,_map_size*_head_mark_s,funcs.get.sprite_rot(API.cam.get_rot().z),funcs.get.RGBATOINT(255,255,255,API.mth.flr(255*_head_mark_a)))
					if _head_mark > 12 then
						API.SD.draw_sprt(_GM_.z_point_mark,head_pos,_map_size*_head_mark_s,funcs.get.sprite_rot(API.cam.get_rot().z),funcs.get.RGBATOINT(r,g,b,API.mth.flr(255*_head_mark_a*.75)))
					end
				end
			end
			for i=1,32 do
				show_player(list[_GM_.sort_table[sort1][i]])
			end
			show_player(_GM_.plyr_me)
			if wp_blink and ui.get_waypoint_coord().x < 16000 then
				if glbls.team_rgb_int(API.plyr.my_id()) > -1 and glbls.is_mission_active(API.plyr.my_id()) then
					r,g,b = _GM_.plyr_rgb(API.plyr.my_id())
				else
					r,g,b = 164, 76, 242
				end
				API.SD.draw_sprt(_GM_.wp_blip,_GM_.sprt_pos_do(ui.get_waypoint_coord()),_map_size*.69*_plyr_size*3.69,0,funcs.get.RGBATOINT(r,g,b,API.mth.flr(255*_plyr_alpha_feat)))
			end
			if wp_time < API.util.t_ms() then
				wp_blink = (not wp_blink)
				if wp_blink then wp_time = API.util.t_ms() + 1000 else wp_time = API.util.t_ms() + 250 end
			end
			if sort_time < API.util.t_ms() then
				sort1 = sort1 +1
				if sort1 > 32 then
					sort1=1
				end
				sort_time = API.util.t_ms()+250
			end
		end
		API.sys.yld(4)
	end
end)_GM_.add_to_cfg_list(_GM_.map_feat,"_GM_.map_feat")

_GM_.threads[#_GM_.threads+1]=menu.create_thread(function()
	local time = API.util.t_ms() + 669
	local int_time = API.util.t_ms() + 5000
	local self_blink = false
	local int_msg = ""
	local ship,cayo,temp_near=false,false,0
	local function near_ship_or_cayo(_pid)
		--Ship coords range (2992,3129),(-4832,-4504)
		-- if funcs.is.xy_in_range(API.plyr.get_coords(_pid),2700,3400,-5100,-4200) then -- about 300m distance from ship
			-- ship=true
			-- return 1
		-- else
		if funcs.is.xy_in_range(API.plyr.get_coords(_pid),3400,6200,-6500,-3600) then -- about 400m-600m distance from cayo
			cayo=true
			return 2
		end
		return 0
	end
	while _GM_loading_started do
		API.sys.yld(10)
		if _GM_.map_feat.on and _GM_.loaded then
			--_GM_.ship = ship
			_GM_.cayo = cayo
			ship,cayo=false,false
			if time < API.util.t_ms() then
				self_blink = funcs.get.opp_bool(self_blink)
				time = API.util.t_ms() + 669
			end	
			if int_time < API.util.t_ms() and not _GM_.pid_interior_true[API.plyr.my_id()] then
				_GM_.my_pos=API.plyr.get_coords(API.plyr.my_id())
				int_time = API.util.t_ms() + 5000
			end
			for i=1, 32 do
				if funcs.is.valid_pid(_GM_.plyr_list[i].PID) and _GM_.plyr_list[i].PID ~= API.plyr.my_id() then
					temp_near = near_ship_or_cayo(_GM_.plyr_list[i].PID)
					if _GM_.pid_interior_true[i] and temp_near == 0 then
						_GM_.plyr_list[i].GOOD = false
					else
						_GM_.plyr_record(i)
					end
				else
					_GM_.plyr_list[i].GOOD = false
				end
			end
			_GM_.plyr_me.PID = API.plyr.my_id()
			temp_near = near_ship_or_cayo(_GM_.plyr_me.PID)
			if _GM_.pid_interior_true[API.plyr.my_id()] and temp_near == 0 then
				_GM_.plyr_me.GOOD = false
			elseif self_blink then
				_GM_.me_record()
			else
				_GM_.plyr_me.GOOD = false
			end
			--_GM_.ship_me = (temp_near == 1)
			_GM_.cayo_me = (temp_near == 2)
			_GM_.cmpnd = funcs.is.xy_in_range(API.plyr.get_coords(API.plyr.my_id()),4952,5101.5,-5819,-5671)
			if _GM_.cayo_me and not _GM_.cmpnd then _GM_.cayo_me_size = 0.69 else _GM_.cayo_me_size =1 end
		end
	end
end,nil)

_GM_.threads[#_GM_.threads+1]=menu.create_thread(function()
	while _GM_loading_started do
		API.sys.yld(25)
		if _GM_.map_feat.on and _GM_.loaded and native.call(0xB118AF58B5F332A1):__tointeger()~=1 then--IsMultiplayerChatActive (hud)
			if _GM_.hotkey_set_feat.value == 0 then
				if funcs.is.vk_down(vk.list[_GM_.hotkey1_select.value+1]) then 
					_GM_.hotkey_bool = funcs.get.opp_bool(_GM_.hotkey_bool)
					API.sys.yld(100)
				end
			else
				if funcs.is.vk_down(vk.list[_GM_.hotkey1_select.value+1]) and funcs.is.vk_down(vk.list[_GM_.hotkey2_select.value+1]) then
					_GM_.hotkey_bool = funcs.get.opp_bool(_GM_.hotkey_bool)
					API.sys.yld(100)
				end
			end
		end
	end
end,nil)

_GM_.threads[#_GM_.threads+1]=menu.create_thread(function()
	while _GM_loading_started do
		API.sys.yld(0)
		if _GM_.map_feat.on and _GM_.loaded then
			for i=0,31 do
				_GM_.pid_interior_true[i]=(funcs.is.valid_pid(i) and intrr.is_pid_intrr(i))
				API.sys.yld(25)
			end
		end
	end	
end,nil)

_GM_.mouse_adjust=menu.add_feature("Adjust map with mouse","toggle",_GM_.main_parent.id, function(f)
	while f.on do
		API.sys.yld(0)
		if _GM_.hotkey_bool then
			if API.cntrl.is_just_pressed(0,15) then
				_GM_.map2_size.value = _GM_.map2_size.value + .25
			elseif API.cntrl.is_just_pressed(0,14) then
				_GM_.map2_size.value = _GM_.map2_size.value - .25
			end
			_GM_.pos2_y.value=_GM_.pos2_y.value + (API.cntrl.get_normal(0,12)*-1*.015)
			_GM_.pos2_x.value=_GM_.pos2_x.value + (API.cntrl.get_normal(0,13)*.015)
		else
			if API.cntrl.is_just_pressed(0,15) then
				_GM_.map1_size.value = _GM_.map1_size.value + .25
			elseif API.cntrl.is_just_pressed(0,14) then
				_GM_.map1_size.value = _GM_.map1_size.value - .25
			end
			_GM_.pos1_y.value=_GM_.pos1_y.value + (API.cntrl.get_normal(0,12)*-1*.015)
			_GM_.pos1_x.value=_GM_.pos1_x.value + (API.cntrl.get_normal(0,13)*.015)
		end
		if funcs.is.vk_down("RETURN") or funcs.is.vk_down("ESCAPE") then
			f.on=false
		end
	end
end)

---------------------------------------------------------------------------------------------------------------
_GM_.sttngs_prnt = menu.add_feature("Standard Profile","parent",_GM_.main_parent.id)

menu.add_feature("Apply default profile settings","action",_GM_.sttngs_prnt.id,function()
	_GM_.recc_sett_1()
end)

_GM_.z1 = menu.add_feature("Heading marker selection","action_value_str",_GM_.sttngs_prnt.id)
_GM_.z1.set_str_data(_GM_.z1,_GM_.head_mark_str)
_GM_.add_to_cfg_list(_GM_.z1,"_GM_.z1")

_GM_.head1_alpha_feat = menu.add_feature("Heading marker visibility","autoaction_value_f",_GM_.sttngs_prnt.id)
funcs.set.feat_i_f(_GM_.head1_alpha_feat,0,1,.05,1)
_GM_.add_to_cfg_list(_GM_.head1_alpha_feat,"_GM_.head1_alpha_feat")

_GM_.head1_size = menu.add_feature("Heading marker size","autoaction_value_f",_GM_.sttngs_prnt.id)
funcs.set.feat_i_f(_GM_.head1_size,.25,2,.05,1)
_GM_.add_to_cfg_list(_GM_.head1_size,"_GM_.head1_size")

_GM_.pos1_x = menu.add_feature("Map X pos","action_value_f",_GM_.sttngs_prnt.id)
funcs.set.feat_i_f(_GM_.pos1_x,-1,1,.01,-.89)
_GM_.add_to_cfg_list(_GM_.pos1_x,"_GM_.pos1_x")

_GM_.pos1_y = menu.add_feature("Map Y pos","action_value_f",_GM_.sttngs_prnt.id)
funcs.set.feat_i_f(_GM_.pos1_y,-1,1,.01,.15)
_GM_.add_to_cfg_list(_GM_.pos1_y,"_GM_.pos1_y")

_GM_.type1_feat=menu.add_feature("Map type", "action_value_str", _GM_.sttngs_prnt.id, function()
end)_GM_.type1_feat.set_str_data(_GM_.type1_feat,{"Color","3d", "Dark"})
_GM_.add_to_cfg_list(_GM_.type1_feat,"_GM_.type1_feat")

_GM_.map1_size = menu.add_feature("Map size","action_value_f",_GM_.sttngs_prnt.id)
funcs.set.feat_i_f(_GM_.map1_size,.1,3,.01,.26)
_GM_.add_to_cfg_list(_GM_.map1_size,"_GM_.map1_size")

_GM_.map1_alpha_feat = menu.add_feature("Map Visibility","autoaction_value_f",_GM_.sttngs_prnt.id)
funcs.set.feat_i_f(_GM_.map1_alpha_feat,0,1,.05,.5)
_GM_.add_to_cfg_list(_GM_.map1_alpha_feat,"_GM_.map1_alpha_feat")

_GM_.map1_zoom = menu.add_feature("Auto-zoom","value_str",_GM_.sttngs_prnt.id)
_GM_.map1_zoom:set_str_data({"Always","Not in interior"})
_GM_.add_to_cfg_list(_GM_.map1_zoom,"_GM_.map1_zoom")

_GM_.plyr1_size = menu.add_feature("Player blip size","action_value_f",_GM_.sttngs_prnt.id)
funcs.set.feat_i_f(_GM_.plyr1_size,.1,3,.1,1.5)
_GM_.add_to_cfg_list(_GM_.plyr1_size,"_GM_.plyr1_size")

_GM_.plyr1_alpha_feat = menu.add_feature("Player blip Visibility","autoaction_value_f",_GM_.sttngs_prnt.id)
funcs.set.feat_i_f(_GM_.plyr1_alpha_feat,0,1,.05,1)
_GM_.add_to_cfg_list(_GM_.plyr1_alpha_feat,"_GM_.plyr1_alpha_feat")

_GM_.plyr1_name = menu.add_feature("Show player name","toggle",_GM_.sttngs_prnt.id)
_GM_.add_to_cfg_list(_GM_.plyr1_name,"_GM_.plyr1_name")

_GM_.plyr1_name_size = menu.add_feature("Player name size","autoaction_value_f",_GM_.sttngs_prnt.id)
funcs.set.feat_i_f(_GM_.plyr1_name_size,.1,3,.1,.8)
_GM_.add_to_cfg_list(_GM_.plyr1_name_size,"_GM_.plyr1_name_size")

function _GM_.recc_sett_1()
	_GM_.pos1_x.value = -0.89
	_GM_.pos1_y.value = 0.15
	_GM_.type1_feat.value = 0
	_GM_.map1_size.value = 0.26
	_GM_.map1_alpha_feat.value = 0.5
	_GM_.map1_zoom.on=true
	_GM_.plyr1_size.value = 1.5
	_GM_.plyr1_alpha_feat.value = 1.00
	_GM_.plyr1_name.on=false
	_GM_.plyr1_name_size.value = 0.8
	_GM_.z1.value=14
	_GM_.head1_alpha_feat.value=.5
	_GM_.head1_size.value=1

end
_GM_.recc_sett_1()
---------------------------------------------------------------------------------------------------------------------------
_GM_.sttngs_prnt2 = menu.add_feature("Hotkey Profile","parent",_GM_.main_parent.id,function()
	_GM_.hotkey2_select.hidden=_GM_.hotkey_set_feat.value==0
end)

menu.add_feature("Apply default profile settings","action",_GM_.sttngs_prnt2.id,function()
	_GM_.recc_sett_2()
end)

_GM_.hotkey1_select=menu.add_feature("Key #1 to switch","autoaction_value_str",_GM_.sttngs_prnt2.id)
_GM_.hotkey1_select:set_str_data(vk.list)
_GM_.add_to_cfg_list(_GM_.hotkey1_select,"_GM_.hotkey1_select")

_GM_.hotkey2_select=menu.add_feature("Key #2 to switch","autoaction_value_str",_GM_.sttngs_prnt2.id)
_GM_.hotkey2_select:set_str_data(vk.list)
_GM_.add_to_cfg_list(_GM_.hotkey2_select,"_GM_.hotkey2_select")

_GM_.hotkey_set_feat=menu.add_feature("Number of keys:","autoaction_value_str",_GM_.sttngs_prnt2.id,function(f)
	_GM_.hotkey2_select.hidden=_GM_.hotkey_set_feat.value==0
end)_GM_.hotkey_set_feat:set_str_data({"One", "Two"})
_GM_.add_to_cfg_list(_GM_.hotkey_set_feat,"_GM_.hotkey_set_feat")

_GM_.z2 = menu.add_feature("Heading marker","action_value_str",_GM_.sttngs_prnt2.id)
_GM_.z2.set_str_data(_GM_.z2,_GM_.head_mark_str)
_GM_.add_to_cfg_list(_GM_.z2,"_GM_.z2")

_GM_.head2_alpha_feat = menu.add_feature("Heading marker visibility","autoaction_value_f",_GM_.sttngs_prnt2.id)
funcs.set.feat_i_f(_GM_.head2_alpha_feat,0,1,.05,1)
_GM_.add_to_cfg_list(_GM_.head2_alpha_feat,"_GM_.head2_alpha_feat")

_GM_.head2_size = menu.add_feature("Heading marker size","autoaction_value_f",_GM_.sttngs_prnt2.id)
funcs.set.feat_i_f(_GM_.head2_size,.25,2,.05,1)
_GM_.add_to_cfg_list(_GM_.head2_size,"_GM_.head2_size")

_GM_.pos2_x = menu.add_feature("X Position","action_value_f",_GM_.sttngs_prnt2.id)
funcs.set.feat_i_f(_GM_.pos2_x,-1,1,.01,-.09)
_GM_.add_to_cfg_list(_GM_.pos2_x,"_GM_.pos2_x")

_GM_.pos2_y = menu.add_feature("Y Position","action_value_f",_GM_.sttngs_prnt2.id)
funcs.set.feat_i_f(_GM_.pos2_y,-1,1,.01,-.07)
_GM_.add_to_cfg_list(_GM_.pos2_y,"_GM_.pos2_y")

_GM_.type2_feat=menu.add_feature("Map type", "action_value_str", _GM_.sttngs_prnt2.id, function()
end)_GM_.type2_feat.set_str_data(_GM_.type2_feat,{"Color","3d", "Dark"})
_GM_.add_to_cfg_list(_GM_.type2_feat,"_GM_.type2_feat")

_GM_.map2_size = menu.add_feature("Map Size","action_value_f",_GM_.sttngs_prnt2.id)
funcs.set.feat_i_f(_GM_.map2_size,.1,3,.01,.69)
_GM_.add_to_cfg_list(_GM_.map2_size,"_GM_.map2_size")

_GM_.map2_alpha_feat = menu.add_feature("Map Visibility","autoaction_value_f",_GM_.sttngs_prnt2.id)
funcs.set.feat_i_f(_GM_.map2_alpha_feat,0,1,.05,.69)
_GM_.add_to_cfg_list(_GM_.map2_alpha_feat,"_GM_.map2_alpha_feat")

_GM_.map2_zoom = menu.add_feature("Auto-zoom","value_str",_GM_.sttngs_prnt2.id)
_GM_.map2_zoom:set_str_data({"Always","Not in interior"})
_GM_.add_to_cfg_list(_GM_.map2_zoom,"_GM_.map2_zoom")

_GM_.plyr2_size = menu.add_feature("Player blip size","action_value_f",_GM_.sttngs_prnt2.id)
funcs.set.feat_i_f(_GM_.plyr2_size,.1,3,.1,.8)
_GM_.add_to_cfg_list(_GM_.plyr2_size,"_GM_.plyr2_size")

_GM_.plyr2_alpha_feat = menu.add_feature("Player blip Visibility","autoaction_value_f",_GM_.sttngs_prnt2.id)
funcs.set.feat_i_f(_GM_.plyr2_alpha_feat,0,1,.05,1)
_GM_.add_to_cfg_list(_GM_.plyr2_alpha_feat,"_GM_.plyr2_alpha_feat")

_GM_.plyr2_name = menu.add_feature("Show player name","toggle",_GM_.sttngs_prnt2.id)
_GM_.add_to_cfg_list(_GM_.plyr2_name,"_GM_.plyr2_name")

_GM_.plyr2_name_size = menu.add_feature("Player name size","autoaction_value_f",_GM_.sttngs_prnt2.id)
funcs.set.feat_i_f(_GM_.plyr2_name_size,.1,3,.05,1.5)
_GM_.add_to_cfg_list(_GM_.plyr2_name_size,"_GM_.plyr2_name_size")

function _GM_.recc_sett_2()
	_GM_.plyr2_alpha_feat.value = 1.00
	_GM_.plyr2_size.value = .8
	_GM_.map2_alpha_feat.value = 0.69
	_GM_.map2_zoom.on=true
	_GM_.map2_size.value = .69
	_GM_.pos2_y.value = -.07
	_GM_.pos2_x.value = -.09
	_GM_.hotkey2_select.value=8
	_GM_.hotkey1_select.value=8		
	_GM_.hotkey_set_feat.value=0
	_GM_.plyr2_name.on=true
	_GM_.plyr2_name_size.value = 1.5
	_GM_.z2.value=14
	_GM_.head2_alpha_feat.value=.69
	_GM_.head2_size.value=1
end
_GM_.recc_sett_2()


---------------------------------------------------------------------------------------------------------------
_GM_.fuckup_parent=menu.add_feature("Monitor/ratio adjustments","parent",_GM_.main_parent.id,function(f)
	local screen_x,screen_y = API.gfx.get_width(),API.gfx.get_height()
	local screen_table = {screen_x,screen_y}
	table.sort(screen_table, function(a, b) return (a)>(b) end)
	local div=1
	for i=1, screen_table[1] do
		if (API.mth.flr(screen_x/i) - (screen_x/i) == 0) and (API.mth.flr(screen_y/i) - (screen_y/i) == 0) then
		    div=i
		end
	end
	menu.notify("Screen resolution "..screen_x.."/"..screen_y.."\nRatio "..API.mth.flr(screen_x/div)..":"..API.mth.flr(screen_y/div).."\nAdjustments should only be required for ratios other than 16:9 OR possibly multi-monitor setups. Common adjustment is 1.5-2.0 for ALL maps X and Y.",_GM_.ver_text,10)
end)

_GM_.fuckup_cayo=menu.add_feature("Cayo Perico mini-map","parent",_GM_.fuckup_parent.id,function(f)
	menu.notify("This will adjust the location of the small Cayo Perico map in relation to the other map when you are not on Cayo Perico.",_GM_.ver_text,7)
end)

_GM_.cp_mini_math_x = menu.add_feature("X offset","action_value_f",_GM_.fuckup_cayo.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.cp_mini_math_x,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.cp_mini_math_x,"_GM_.cp_mini_math_x")

_GM_.cp_mini_math_y = menu.add_feature("Y offset","action_value_f",_GM_.fuckup_cayo.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.cp_mini_math_y,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.cp_mini_math_y,"_GM_.cp_mini_math_y")

_GM_.cp_mini_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GM_.fuckup_cayo.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GM_.cp_mini_math_x.mod=_table[f.value+1]
	_GM_.cp_mini_math_y.mod=_table[f.value+1]
	menu.notify("offset mod changed to ".._table[f.value+1],_GM_.ver_text,3)
end)_GM_.cp_mini_mod.set_str_data(_GM_.cp_mini_mod,{"0.0001","0.001","0.01","0.1"})
_GM_.add_to_cfg_list(_GM_.cp_mini_mod,"_GM_.cp_mini_mod")

_GM_.fuckup_plyr_veh=menu.add_feature("Player/Vehicle blips","parent",_GM_.fuckup_parent.id,function(f)
	menu.notify("This will adjust the location of the players on the map, not the map itself",_GM_.ver_text,4)
end)

_GM_.full_math_x = menu.add_feature("Mark current map","action",_GM_.fuckup_plyr_veh.id,function(f)
	_GM_.fuckup_full.name="Full map"
	_GM_.fuckup_qrtr.name="Quarter maps"
	_GM_.fuckup_cntr.name="Center zoom maps"
	_GM_.fuckup_othr.name="Other zoom maps"
	_GM_.fuckup_cp.name="Cayo Perico map"
	_GM_.fuckup_cp_cmpnd.name="Cayo Perico Compound"
	if _GM_.cmpnd then
		_GM_.fuckup_cp_cmpnd.name="*Cayo Perico Compound*"
	elseif _GM_.cayo_me then
		_GM_.fuckup_cp.name="*Cayo Perico map*"
	elseif _GM_.show_map > 0 then
		if _GM_.show_map == 5 or _GM_.show_map == 12 then
			_GM_.fuckup_cntr.name="*Center zoom maps*"
		elseif _GM_.show_map > 5 then
			_GM_.fuckup_othr.name="*Other zoom maps*"		
		else
			_GM_.fuckup_qrtr.name="*Quarter maps*"
		end
	else
		_GM_.fuckup_full.name="*Full map*"
	end
end)
---------------------------------------------------------------------------------------------------------------
_GM_.fuckup_all=menu.add_feature("Set for ALL maps","parent",_GM_.fuckup_plyr_veh.id)

_GM_.all_math_x = menu.add_feature("X offset (Press to apply)","action_value_f",_GM_.fuckup_all.id,function(f)
	_GM_.full_math_x.value=f.value
	_GM_.qrtr_math_x.value=f.value
	_GM_.cntr_math_x.value=f.value
	_GM_.othr_math_x.value=f.value
	_GM_.cp_math_x.value=f.value
	_GM_.cp_cmpnd_math_x.value=f.value
	menu.notify("All maps x offset changed to "..f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.all_math_x,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.all_math_x,"_GM_.all_math_x")

_GM_.all_math_y = menu.add_feature("Y offset (Press to apply)","action_value_f",_GM_.fuckup_all.id,function(f)
	_GM_.full_math_y.value=f.value
	_GM_.qrtr_math_y.value=f.value
	_GM_.cntr_math_y.value=f.value
	_GM_.othr_math_y.value=f.value
	_GM_.cp_math_y.value=f.value
	_GM_.cp_cmpnd_math_y.value=f.value
	menu.notify("All maps y offset changed to "..f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.all_math_y,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.all_math_y,"_GM_.all_math_y")

_GM_.all_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GM_.fuckup_all.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GM_.all_math_x.mod=_table[f.value+1]
	_GM_.all_math_y.mod=_table[f.value+1]
	_GM_.full_math_x.mod=_table[f.value+1]
	_GM_.full_math_y.mod=_table[f.value+1]
	_GM_.qrtr_math_x.mod=_table[f.value+1]
	_GM_.qrtr_math_y.mod=_table[f.value+1]
	_GM_.cntr_math_x.mod=_table[f.value+1]
	_GM_.cntr_math_y.mod=_table[f.value+1]
	_GM_.othr_math_x.mod=_table[f.value+1]
	_GM_.othr_math_y.mod=_table[f.value+1]
	_GM_.cp_math_x.mod=_table[f.value+1]
	_GM_.cp_math_y.mod=_table[f.value+1]
	_GM_.cp_cmpnd_math_x.mod=_table[f.value+1]
	_GM_.cp_cmpnd_math_y.mod=_table[f.value+1]
	menu.notify("All maps offset mod changed to ".._table[f.value+1],_GM_.ver_text,3)
end)_GM_.all_math_mod.set_str_data(_GM_.all_math_mod,{"0.0001","0.001","0.01","0.1"})
_GM_.add_to_cfg_list(_GM_.all_math_mod,"_GM_.all_math_mod")

---------------------------------------------------------------------------------------------------------------
_GM_.fuckup_full=menu.add_feature("Full map","parent",_GM_.fuckup_plyr_veh.id)

_GM_.full_math_x = menu.add_feature("X offset","action_value_f",_GM_.fuckup_full.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.full_math_x,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.full_math_x,"_GM_.full_math_x")


_GM_.full_math_y = menu.add_feature("Y offset","action_value_f",_GM_.fuckup_full.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.full_math_y,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.full_math_y,"_GM_.full_math_y")

_GM_.full_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GM_.fuckup_full.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GM_.full_math_x.mod=_table[f.value+1]
	_GM_.full_math_y.mod=_table[f.value+1]
	menu.notify(_GM_.fuckup_full.name.." offset mod changed to ".._table[f.value+1],_GM_.ver_text,3)
end)_GM_.full_math_mod.set_str_data(_GM_.full_math_mod,{"0.0001","0.001","0.01","0.1"})
_GM_.add_to_cfg_list(_GM_.full_math_mod,"_GM_.full_math_mod")

---------------------------------------------------------------------------------------------------------------
_GM_.fuckup_qrtr=menu.add_feature("Quarter maps","parent",_GM_.fuckup_plyr_veh.id)

_GM_.qrtr_math_x = menu.add_feature("X offset","action_value_f",_GM_.fuckup_qrtr.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.qrtr_math_x,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.qrtr_math_x,"_GM_.qrtr_math_x")

_GM_.qrtr_math_y = menu.add_feature("Y offset","action_value_f",_GM_.fuckup_qrtr.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.qrtr_math_y,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.qrtr_math_y,"_GM_.qrtr_math_y")

_GM_.qrtr_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GM_.fuckup_qrtr.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GM_.qrtr_math_x.mod=_table[f.value+1]
	_GM_.qrtr_math_y.mod=_table[f.value+1]
	menu.notify(_GM_.fuckup_qrtr.name.." offset mod changed to ".._table[f.value+1],_GM_.ver_text,3)
end)_GM_.qrtr_math_mod.set_str_data(_GM_.qrtr_math_mod,{"0.0001","0.001","0.01","0.1"})
_GM_.add_to_cfg_list(_GM_.qrtr_math_mod,"_GM_.qrtr_math_mod")

---------------------------------------------------------------------------------------------------------------
_GM_.fuckup_cntr=menu.add_feature("Center zoom maps","parent",_GM_.fuckup_plyr_veh.id)

_GM_.cntr_math_x = menu.add_feature("X offset","action_value_f",_GM_.fuckup_cntr.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.cntr_math_x,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.cntr_math_x,"_GM_.cntr_math_x")

_GM_.cntr_math_y = menu.add_feature("Y offset","action_value_f",_GM_.fuckup_cntr.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.cntr_math_y,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.cntr_math_y,"_GM_.cntr_math_y")

_GM_.cntr_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GM_.fuckup_cntr.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GM_.cntr_math_x.mod=_table[f.value+1]
	_GM_.cntr_math_y.mod=_table[f.value+1]
	menu.notify(_GM_.fuckup_cntr.name.." offset mod changed to ".._table[f.value+1],_GM_.ver_text,3)
end)_GM_.cntr_math_mod.set_str_data(_GM_.cntr_math_mod,{"0.0001","0.001","0.01","0.1"})
_GM_.add_to_cfg_list(_GM_.cntr_math_mod,"_GM_.cntr_math_mod")

---------------------------------------------------------------------------------------------------------------
_GM_.fuckup_othr=menu.add_feature("Other zoom maps","parent",_GM_.fuckup_plyr_veh.id)

_GM_.othr_math_x = menu.add_feature("X offset","action_value_f",_GM_.fuckup_othr.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.othr_math_x,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.othr_math_x,"_GM_.othr_math_x")

_GM_.othr_math_y = menu.add_feature("Y offset","action_value_f",_GM_.fuckup_othr.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.othr_math_y,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.othr_math_y,"_GM_.othr_math_y")

_GM_.othr_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GM_.fuckup_othr.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GM_.othr_math_x.mod=_table[f.value+1]
	_GM_.othr_math_y.mod=_table[f.value+1]
	menu.notify(_GM_.fuckup_othr.name.." offset mod changed to ".._table[f.value+1],_GM_.ver_text,3)
end)_GM_.othr_math_mod.set_str_data(_GM_.othr_math_mod,{"0.0001","0.001","0.01","0.1"})
_GM_.add_to_cfg_list(_GM_.othr_math_mod,"_GM_.othr_math_mod")

---------------------------------------------------------------------------------------------------------------
_GM_.fuckup_cp=menu.add_feature("Cayo Perico map","parent",_GM_.fuckup_plyr_veh.id)

_GM_.cp_math_x = menu.add_feature("X offset","action_value_f",_GM_.fuckup_cp.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.cp_math_x,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.cp_math_x,"_GM_.cp_math_x")

_GM_.cp_math_y = menu.add_feature("Y offset","action_value_f",_GM_.fuckup_cp.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.cp_math_y,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.cp_math_y,"_GM_.cp_math_y")

_GM_.cp_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GM_.fuckup_cp.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GM_.cp_math_x.mod=_table[f.value+1]
	_GM_.cp_math_y.mod=_table[f.value+1]
	menu.notify(_GM_.fuckup_cp.name.." offset mod changed to ".._table[f.value+1],_GM_.ver_text,3)
end)_GM_.cp_math_mod.set_str_data(_GM_.cp_math_mod,{"0.0001","0.001","0.01","0.1"})
_GM_.add_to_cfg_list(_GM_.cp_math_mod,"_GM_.cp_math_mod")

_GM_.fuckup_cp_cmpnd=menu.add_feature("Cayo Perico Compound","parent",_GM_.fuckup_plyr_veh.id)

_GM_.cp_cmpnd_math_x = menu.add_feature("X offset","action_value_f",_GM_.fuckup_cp_cmpnd.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.cp_cmpnd_math_x,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.cp_cmpnd_math_x,"_GM_.cp_cmpnd_math_x")

_GM_.cp_cmpnd_math_y = menu.add_feature("Y offset","action_value_f",_GM_.fuckup_cp_cmpnd.id,function(f)
	menu.notify(f.value,_GM_.ver_text,3)
end)funcs.set.feat_i_f(_GM_.cp_cmpnd_math_y,0.1,5,0.001,1)
_GM_.add_to_cfg_list(_GM_.cp_cmpnd_math_y,"_GM_.cp_cmpnd_math_y")

_GM_.cp_cmpnd_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GM_.fuckup_cp_cmpnd.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GM_.cp_cmpnd_math_x.mod=_table[f.value+1]
	_GM_.cp_cmpnd_math_y.mod=_table[f.value+1]
	menu.notify(_GM_.fuckup_cp_cmpnd.name.." offset mod changed to ".._table[f.value+1],_GM_.ver_text,3)
end)_GM_.cp_cmpnd_math_mod.set_str_data(_GM_.cp_cmpnd_math_mod,{"0.0001","0.001","0.01","0.1"})
_GM_.add_to_cfg_list(_GM_.cp_cmpnd_math_mod,"_GM_.cp_cmpnd_math_mod")

_GM_.map_feat.on=true

_GM_.save_load.type_bool={}
_GM_.save_load.type_bool[1]=true 	-- toggle

_GM_.save_load.type_val = {}
_GM_.save_load.type_val[518]=true	--action_slider
_GM_.save_load.type_val[522]=true	--action_value_i
_GM_.save_load.type_val[546]=true	--action_value_str
_GM_.save_load.type_val[642]=true	--action_value_f
_GM_.save_load.type_val[1030]=true	--autoaction_slider
_GM_.save_load.type_val[1034]=true	--autoaction_value_i
_GM_.save_load.type_val[1058]=true	--autoaction_value_str
_GM_.save_load.type_val[1154]=true	--autoaction_value_f

_GM_.save_load.type_both = {}
_GM_.save_load.type_both[7]=true	--slider 	toggle
_GM_.save_load.type_both[11]=true 	--value_i 	toggle
_GM_.save_load.type_both[35]=true 	--value_str toggle
_GM_.save_load.type_both[131]=true	--value_f 	toggle


function _GM_.save_load.get_feat_bool(_feat)
    return tostring(_feat.on)
end

function _GM_.save_load.should_count(_feat,_state)
	if _GM_.save_load.feat[_feat] ~= nil then
		if (tostring(_state)=="true" or tostring(_state)=="false") then
			return true
		elseif _GM_.save_load.feat[_feat].value ~= nil then
			return true
		end
    end
	return false
end


function _GM_.save_load.load_sett(_feat,_state)
	if _GM_.save_load.feat[_feat] == nil then
		menu.notify("Invalid entry in config file:\n"..tostring(_feat).." = "..tostring(_state).."\nError will be fixed after save.", _GM_.ver_text, 10, 2)
	elseif tostring(_state)=="true" then
        _GM_.save_load.feat[_feat].on=true
	elseif tostring(_state)=="false" then
        _GM_.save_load.feat[_feat].on=false
    elseif _GM_.save_load.feat[_feat].value == nil then
		menu.notify("Invalid entry in config file:\n"..tostring(_feat).." = "..tostring(_state).."\nError will be fixed after save.", _GM_.ver_text, 10, 2)
	else
		_GM_.save_load.feat[_feat].value=tonumber(_state)
    end
end

_GM_.save_load.save_it=menu.add_feature("Save Settings", "action", _GM_.main_parent.id, function()
	local save_file_text=""
	local file=io.open(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\cfg\\GeeMap_v2_Settings.cfg","w")
	local _type,_bool,_name
	table.sort(_GM_.save_load.name, function(a, b) return a:lower() <  b:lower() end)
	for i=1,#_GM_.save_load.name do
		if _GM_.save_load.feat[_GM_.save_load.name[i]] == nil or _GM_.save_load.feat[_GM_.save_load.name[i]].type == nil then
			menu.notify("Invalid entry in save table:\n"..tostring(_GM_.save_load.name[i]).."\nContact dev.", _GM_.ver_text, 10, 2)
		else
			_type = _GM_.save_load.feat[_GM_.save_load.name[i]].type
			_bool = _GM_.save_load.get_feat_bool(_GM_.save_load.feat[_GM_.save_load.name[i]])
			_name = _GM_.save_load.name[i]
			_value = _GM_.save_load.feat[_name].value
			if _GM_.save_load.type_both[_type] then
				if save_file_text~="" then save_file_text=save_file_text.."\n" end
				save_file_text=save_file_text.._name.."=".._bool.."\n".._name.."=".._value
			elseif _GM_.save_load.type_val[_type] then
				if save_file_text~="" then save_file_text=save_file_text.."\n" end
				save_file_text=save_file_text.._name.."=".._value
			elseif _GM_.save_load.type_bool[_type] then
				if save_file_text~="" then save_file_text=save_file_text.."\n" end
				save_file_text=save_file_text.._name.."=".._bool
			else
				menu.notify("Invalid entry in save table\n".."type: "..tostring(_type).." bool: "..tostring(_bool).." name: "..tostring(_name).." value: "..tostring(_value).."", _GM_.ver_text, 10, 2)
			end
		end
		funcs.doo.yield_if_modulus(i,50,0)
	end
	file:write(save_file_text)
	file:close()
	menu.notify("Settings saved to GeeMap_v2_Settings.cfg",_GM_.ver_text,4,6)
end)

_GM_.save_load.load_it=menu.add_feature("Load Settings", "action", _GM_.main_parent.id, function()
	local temp,load_count = nil,0
	if utils.file_exists(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\cfg\\GeeMap_v2_Settings.cfg") then
		local file=io.open(utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\cfg\\GeeMap_v2_Settings.cfg","r")
		for i in file:lines() do
			local fields = {}
			i:gsub(string.format("([^%s]+)", "="), function(c) fields[#fields+1] = c end)
			_GM_.save_load.load_sett(fields[1],fields[2])
			if _GM_.save_load.should_count(fields[1],fields[2]) then
				if temp ~= fields[1] then
					temp = fields[1]
					load_count=load_count+1
				end
			end
			if load_count % 50 == 0 then
				API.sys.yld(0)
			end
		end
		file:close()
		menu.notify(load_count.."/"..#_GM_.save_load.name.." Settings loaded",_GM_.ver_text,4,6)
	else
		menu.notify("Default settings loaded.",_GM_.ver_text,4,6)
	end
end)
_GM_.save_load.load_it.on=true

event.add_event_listener("exit", function(f)
	for i=1,#_GM_.threads do
		if _GM_.threads[i] then
			menu.delete_thread(_GM_.threads[i])
		end
	end
end)