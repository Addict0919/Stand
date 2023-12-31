-- GeeSkid v1.05
_GT_gta_map = {}
_GT_gta_map.loaded=false
_GT_gta_map.ship = false
_GT_gta_map.ship_me = false
_GT_gta_map.cayo = false
_GT_gta_map.cayo_me = false
_GT_gta_map.cmpnd = false
_GT_gta_map.cayo_me_size = 1
_GT_gta_map.helo_rot = 0
_GT_gta_map.my_pos = v2(16000,16000)
_GT_gta_map.show_map,_GT_gta_map.show_map_center = 0, v2(232,1700)
_GT_gta_map.hotkey_bool = false

_GT_gta_map.file_root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")

_GT_gta_map.head_mark_str = {
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
	
function _GT_gta_map.load_main() 
	_GT_gta_map.map_png={}
	_GT_gta_map.map_png[1] = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\color.png")
	system.yield(5)
	_GT_gta_map.map_png[2] = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\3d.png")
	system.yield(5)
	_GT_gta_map.map_png[3] = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\dark.png")
	system.yield(5)
	_GT_gta_map.cayo_3d = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\cayo_3d_2.png")
	system.yield(5)
	_GT_gta_map.cmpnd_3d = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\compound_3d.png")
	system.yield(5)
	_GT_gta_map.cmpnd_dark = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\compound_dark.png")
	system.yield(5)
	_GT_gta_map.cayo_dark = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\cayo_dark.png")
	system.yield(5)
	_GT_gta_map.ussl_dark = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\ussl_dark.png")
	system.yield(5)

	
	_GT_gta_map.map_zoom_c={}
	_GT_gta_map.map_zoom_3d={}
	_GT_gta_map.map_zoom_dark={}
	for i=1,12 do
		system.yield(0)
		_GT_gta_map.map_zoom_c[i]=scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\zoom\\color\\"..i..".png")
		system.yield(0)
		_GT_gta_map.map_zoom_3d[i]=scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\zoom\\3d\\"..i..".png")
		system.yield(0)
		_GT_gta_map.map_zoom_dark[i]=scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\zoom\\dark\\"..i..".png")
	end

	_GT_gta_map.plyr_png={}
	_GT_gta_map.plyr_png_w={}
	for i=1,12 do
		system.yield(0)
		_GT_gta_map.plyr_png[i] = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\player_dots\\"..i..".png")
		system.yield(0)
		_GT_gta_map.plyr_png_w[i] = scriptdraw.register_sprite(_GT_gta_map.file_root.."\\scripts\\GeeSkid\\gta_map\\player_dots_w\\"..i..".png")
	end
	system.yield(0)
	_GT_gta_map.wp_blip = scriptdraw.register_sprite(_GT_veh_esp_table.file_root.."\\scripts\\GeeSkid\\radar_blips\\waypoint.png")
	system.yield(0)
	_GT_gta_map.semicircle = scriptdraw.register_sprite(_GT_veh_esp_table.file_root.."\\scripts\\GeeSkid\\radar_blips\\semicircle.png")
	system.yield(0)
	
	_GT_gta_map.z_point = {}
	for i=1,21 do
		_GT_gta_map.z_point[i] = scriptdraw.register_sprite(_GT_veh_esp_table.file_root.."\\scripts\\GeeSkid\\gta_map\\heading_marker\\"..i..".png")
		system.yield(0)
	end
	_GT_gta_map.z_point_gif_delphine = {}
	for i=1,186 do
		_GT_gta_map.z_point_gif_delphine[i] = scriptdraw.register_sprite(_GT_veh_esp_table.file_root.."\\scripts\\GeeSkid\\gta_map\\heading_marker\\delphine_gif\\"..i..".png")
		system.yield(0)
	end
	for i=0,186 do
		_GT_gta_map.z_point_gif_delphine[#_GT_gta_map.z_point_gif_delphine+1] = scriptdraw.register_sprite(_GT_veh_esp_table.file_root.."\\scripts\\GeeSkid\\gta_map\\heading_marker\\delphine_gif\\"..(186-i)..".png")
		system.yield(0)
	end
	_GT_gta_map.z_point_gif_zoo = {}
	for i=1,113 do
		_GT_gta_map.z_point_gif_zoo[i] = scriptdraw.register_sprite(_GT_veh_esp_table.file_root.."\\scripts\\GeeSkid\\gta_map\\heading_marker\\zoo_bounce\\"..i..".png")
		system.yield(0)
	end
	for i=0,113 do
		_GT_gta_map.z_point_gif_zoo[#_GT_gta_map.z_point_gif_zoo+1] = scriptdraw.register_sprite(_GT_veh_esp_table.file_root.."\\scripts\\GeeSkid\\gta_map\\heading_marker\\zoo_bounce\\"..(113-i)..".png")
		system.yield(0)
	end
	_GT_gta_map.z_point_mark = scriptdraw.register_sprite(_GT_veh_esp_table.file_root.."\\scripts\\GeeSkid\\gta_map\\heading_marker\\marker.png")
	
	_GT_gta_map.plyr_list = {}
	for i=1, 33 do
		_GT_gta_map.plyr_list[i] = {i-1, false, v2(0,0),0, 1,false,0,"",0,0}
	end
	_GT_gta_map.loaded=true
end

function _GT_gta_map.do_auto_zoom(_bool)
	if _GT_gta_map.hotkey_bool then
		if _GT_gta_map.map2_zoom.on then
			if _bool then
				return (_GT_gta_map.map2_zoom.value == 0)
			end
			return true
		end
	elseif _GT_gta_map.map1_zoom.on then
		if _bool then
			return (_GT_gta_map.map1_zoom.value == 0)
		end
		return true
	end
	return false
end
	
function _GT_gta_map.show_map_center_do()
	local _pos = player.get_player_coords(player.player_id())
	-- if _GT_gta_map.ship_me then
		-- return 0,v2(_GT_gta_map.cayo_c_x.value,_GT_gta_map.cayo_c_y.value)
	-- else
	if _GT_gta_map.cmpnd then
		return 0,v2(5030.5,-5742)
	elseif _GT_gta_map.cayo_me then -- whole cayo
		--return 0,v2(_GT_gta_map.cayo_c_x.value,_GT_gta_map.cayo_c_y.value)
		return 0,v2(4763.5,-5153.5)
	elseif _GT_plyr_info.interior[player.player_id()+1] == true then
		if _GT_gta_map.do_auto_zoom(true) then
			_pos = _GT_gta_map.my_pos
		else
			return 0,v2(232,1700)
		end
	elseif not _GT_gta_map.do_auto_zoom(false) then
		return 0,v2(232,1700)
	end
	if _GF_pos_xy_in_range(_pos,-3854,4318,-3988,7388)	then -- one of the zoomed maps
		if _GF_pos_xy_in_range(_pos,-1660,2123,-3988,1050) then -- city area
			if _GF_pos_xy_in_range(_pos,-1660,1367,-3040,120) then
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
		elseif _GF_pos_xy_in_range(_pos,-1160,1623,1050,5700) then -- upper middle zoom
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

function _GF_set_map_pos_limit(map_int,center_pos)
	local x_min,x_max,y_min,y_max
	-- if _GT_gta_map.ship_me then
		-- x_min,x_max = center_pos.x - 400, center_pos.x + 400
		-- y_min,y_max = center_pos.y - 500, center_pos.y + 500
	-- else
	if _GT_gta_map.cmpnd then
		x_min,x_max = center_pos.x - 88, center_pos.x + 88
		y_min,y_max = center_pos.y - 79, center_pos.y + 79
	elseif _GT_gta_map.cayo_me then --4763.5,-5153.5
		x_min,x_max = center_pos.x - 1200, center_pos.x + 1200
		y_min,y_max = center_pos.y - 1200, center_pos.y + 1200
	elseif map_int > 0 then
		if map_int == 4 and _GT_gta_map.cayo then
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
	elseif _GT_gta_map.cayo then
		x_min,x_max = center_pos.x - 4540, center_pos.x + 4540+1100
		y_min,y_max = center_pos.y - 6320-1600 , center_pos.y + 6320
	else
		x_min,x_max = center_pos.x - 4540, center_pos.x + 4540
		y_min,y_max = center_pos.y - 6320, center_pos.y + 6320
	end
	return x_min,x_max,y_min,y_max
end

function _GT_gta_map.plyr_record(_I,_hotkey)
	local _pid = _GT_gta_map.plyr_list[_I][1]
	_GT_gta_map.plyr_list[_I][2] = true
	if player.is_player_in_any_vehicle(_pid) and (_GT_veh_esp_table.png_true[entity.get_entity_model_hash(player.get_player_vehicle(_pid))] or _GT_veh_esp_table.png_true[_GF_class_name(player.get_player_vehicle(_pid))]) then
		_GT_gta_map.plyr_list[_I][6] = true
		if _GT_veh_esp_table.png_true[entity.get_entity_model_hash(player.get_player_vehicle(_pid))] then
			_GT_gta_map.plyr_list[_I][7] = _GT_veh_esp_table.png_int[entity.get_entity_model_hash(player.get_player_vehicle(_pid))]
			if _GF_model_name(player.get_player_vehicle(_pid)) == "Buzzard Attack Chopper" then
				_GT_gta_map.plyr_list[_I][4] = _GT_gta_map.sprt_rot_calc(_GT_gta_map.helo_rot)
			elseif _GT_veh_esp_table.png_rot_true[entity.get_entity_model_hash(player.get_player_vehicle(_pid))] then
				_GT_gta_map.plyr_list[_I][4] = _GT_gta_map.sprt_rot_calc(player.get_player_heading(_pid))
			else
				_GT_gta_map.plyr_list[_I][4] = 0
			end
		else
			_GT_gta_map.plyr_list[_I][7] = _GT_veh_esp_table.png_int[_GF_class_name(player.get_player_vehicle(_pid))]
			if _GF_class_name(player.get_player_vehicle(_pid)) == "Helicopters" then
				_GT_gta_map.plyr_list[_I][4] = _GT_gta_map.sprt_rot_calc(_GT_gta_map.helo_rot)
			elseif _GT_veh_esp_table.png_rot_true[_GF_class_name(player.get_player_vehicle(_pid))] then
				_GT_gta_map.plyr_list[_I][4] = _GT_gta_map.sprt_rot_calc(player.get_player_heading(_pid))
			else
				_GT_gta_map.plyr_list[_I][4] = 0
			end
		end
		if _GF_class_name(player.get_player_vehicle(_pid)) == "Planes" then
			_GT_gta_map.plyr_list[_I][9] = _GT_gta_map.sprt_rot_calc(player.get_player_heading(_pid)+180)
			_GT_gta_map.plyr_list[_I][10] = _GT_gta_map.sprt_rot_calc(player.get_player_heading(_pid))
		else
			_GT_gta_map.plyr_list[_I][9] = math.pi
			_GT_gta_map.plyr_list[_I][10] = 0
		end
	else
		_GT_gta_map.plyr_list[_I][6] = false
		_GT_gta_map.plyr_list[_I][4] = _GT_gta_map.sprt_rot_calc(player.get_player_heading(_pid))
	end
	_GT_gta_map.plyr_list[_I][3] = _GT_gta_map.sprt_pos_do(player.get_player_coords(_pid))
	_GT_gta_map.plyr_list[_I][5] = _GF_org_color_int(_pid)+2
end

function _GT_gta_map.sprt_rot_calc(_heading)
	-- if _heading < 0 then
		-- return (360-(360-(_heading*-1))+1)/360*6.25
	-- end
	-- return (360-_heading+1)/360*6.25
	return math.rad(_heading)*-1
end

function _GT_gta_map.sprt_pos_do(sprite_pos)
	local size,x_val,y_val = _GT_gta_map.map1_size.value,_GT_gta_map.pos1_x.value,_GT_gta_map.pos1_y.value
	local center_pos,map_int = _GT_gta_map.show_map_center,_GT_gta_map.show_map
	local x_min,x_max,y_min,y_max = _GF_set_map_pos_limit(map_int,center_pos)
	if _GT_gta_map.hotkey_bool then
		size,x_val,y_val = _GT_gta_map.map2_size.value,_GT_gta_map.pos2_x.value,_GT_gta_map.pos2_y.value
	end
	size = size*_GT_gta_map.cayo_me_size
	if sprite_pos.x > x_max then sprite_pos.x = x_max elseif sprite_pos.x < x_min then sprite_pos.x = x_min	end
	if sprite_pos.y > y_max then sprite_pos.y = y_max elseif sprite_pos.y < y_min then sprite_pos.y = y_min end
	local new_pos = sprite_pos - center_pos
	return _GT_gta_map.sprt_pos_calc(new_pos,size,x_val,y_val)
end

function _GT_gta_map.sprt_pos_calc(new_pos,size,x_val,y_val)
	local function v2_math(x_div,y_div,mult,m_fix_x,m_fix_y)
		return v2(new_pos.x/(10400*x_div)*mult*size*m_fix_x+x_val,new_pos.y/(5875*y_div)*mult*size*m_fix_y+y_val)
	end
	-- if _GT_gta_map.ship_me then
		-- return v2(new_pos.x/325*size+x_val,new_pos.y/195*size+y_val) 
	-- else
	if _GT_gta_map.cmpnd then
		return v2_math(0.022355769,0.02212766,1,_GT_gta_map.cp_cmpnd_math_x.value,_GT_gta_map.cp_cmpnd_math_y.value)
	elseif _GT_gta_map.cayo_me then
		return v2_math(0.166346154,0.166808511,1,_GT_gta_map.cp_math_x.value,_GT_gta_map.cp_math_y.value)		
	elseif _GT_gta_map.show_map > 0 then
		if _GT_gta_map.show_map == 5 or _GT_gta_map.show_map == 12 then
			return v2_math(0.58,0.579,1,_GT_gta_map.cntr_math_x.value,_GT_gta_map.cntr_math_y.value)		
		elseif _GT_gta_map.show_map > 5 then
			return v2_math(0.58,0.579,2,_GT_gta_map.othr_math_x.value,_GT_gta_map.othr_math_y.value)		
		end
		return v2_math(0.875,0.865,1,_GT_gta_map.qrtr_math_x.value,_GT_gta_map.qrtr_math_y.value)	
	end
	return v2_math(1,1,1,_GT_gta_map.full_math_x.value,_GT_gta_map.full_math_y.value)	
end

function _GT_gta_map.head_pos_do(_map_size)
	local my_pos = player.get_player_coords(player.player_id())
	local center_pos,map_int = _GT_gta_map.show_map_center,_GT_gta_map.show_map
	local x_val,y_val = _GT_gta_map.pos1_x.value,_GT_gta_map.pos1_y.value
	if _GT_gta_map.hotkey_bool then
		x_val,y_val = _GT_gta_map.pos2_x.value,_GT_gta_map.pos2_y.value
	end
	local x_min,x_max,y_min,y_max = _GF_set_map_pos_limit(map_int,center_pos)
	local dist = 10
	local mult = 1.01
	if _GT_gta_map.cmpnd then dist=5 mult=1.005 end
	repeat
		dist = dist * mult
		my_pos = _GF_front_of_pos(my_pos, cam.get_gameplay_cam_rot().z, dist, 180, 0)
	until (my_pos.x > x_max or my_pos.x < x_min) or (my_pos.y > y_max or my_pos.y < y_min)
	if my_pos.x > x_max then my_pos.x = x_max elseif my_pos.x < x_min then my_pos.x = x_min	end
	if my_pos.y > y_max then my_pos.y = y_max elseif my_pos.y < y_min then my_pos.y = y_min end
	local new_pos = my_pos - center_pos
	return _GT_gta_map.sprt_pos_calc(new_pos,_map_size,x_val,y_val)
end

function _GT_gta_map.get_screen_ratio()
	local screen_x,screen_y = graphics.get_screen_width(),graphics.get_screen_height()
	local screen_table = {screen_x,screen_y}
	table.sort(screen_table, function(a, b) return (a)>(b) end)
	local max_i = screen_table[1]
	screen_table={}
	for i=1, max_i do
		if (math.floor(screen_x/i) - (screen_x/i) == 0) and (math.floor(screen_y/i) - (screen_y/i) == 0) then
			screen_table[#screen_table+1]=i-1
		end
	end
	for i=1, #screen_table do
		print(screen_table[i])
	end
end

function _G_utils_do()


_GT_RADAR = {}
_GT_RADAR.directory = utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts\\GeeSkid\\radar\\"
_GT_RADAR.circle1 = scriptdraw.register_sprite(_GT_RADAR.directory.."radar_circle1.png")
_GT_RADAR.circle2 = scriptdraw.register_sprite(_GT_RADAR.directory.."radar_circle2.png")
_GT_RADAR.dead_x = scriptdraw.register_sprite(_GT_RADAR.directory.."dead_x.png")
_GT_RADAR.ring1 = scriptdraw.register_sprite(_GT_RADAR.directory.."ring_white1.png")
_GT_RADAR.ring2 = scriptdraw.register_sprite(_GT_RADAR.directory.."ring_white2.png")
_GT_RADAR.ring3 = scriptdraw.register_sprite(_GT_RADAR.directory.."ring_white3.png")
_GT_RADAR.ring4 = scriptdraw.register_sprite(_GT_RADAR.directory.."ring_white4.png")
_GT_RADAR.arrow3 = scriptdraw.register_sprite(_GT_RADAR.directory.."radar_arrow3.png")
_GT_RADAR.waypoint = scriptdraw.register_sprite(_GT_RADAR.directory.."waypoint.png")
_GT_RADAR.boom = scriptdraw.register_sprite(_GT_RADAR.directory.."boom.png")
_GT_RADAR.ents = {}
_GT_RADAR.ped_colors = {}
_GT_RADAR.wp_true = false
_GT_RADAR.wp_pos = v2(10000,10000)
_GT_RADAR.wp_dist = 10000

function _GT_RADAR.ents_default(i)
	_GT_RADAR.ents[i]={PLYR = false,PID=-1,PED=false,DIST = 10000,FRND=false,COLR=0,DEAD = false,D_TIME=utils.time_ms(),SHOOT=utils.time_ms(),ALPHA=255}
end

function _GT_RADAR.pos(_pos,_dist)
	_pos = _GF_front_of_pos(player.get_player_coords(player.player_id()),_GF_vector_to_pos_head2(_pos,player.get_player_coords(player.player_id()))+cam.get_gameplay_cam_rot().z*-1,_dist, 0, 0)
	_pos.x = (player.get_player_coords(player.player_id()).x-_pos.x)/_GT_RADAR.range.value
	_pos.y = (player.get_player_coords(player.player_id()).y-_pos.y)/_GT_RADAR.range.value
	return v2((_GT_RADAR.x.value+(_pos.x*_GT_RADAR.r_size.value*0.124*_GT_RADAR.xT.value)),(_GT_RADAR.y.value+(_pos.y*_GT_RADAR.r_size.value*0.22*_GT_RADAR.yT.value)))
end

-- function _GT_RADAR.my_cam_pos(_pos)
	-- _pos = _GF_front_of_pos(_pos, _GF_vector_to_pos_head2(player.get_player_coords(player.player_id()),_pos)+cam.get_gameplay_cam_rot().z*-1,
	-- math.abs(v2(cam.get_gameplay_cam_pos().x,cam.get_gameplay_cam_pos().y):magnitude(v2(player.get_player_coords(player.player_id()).x,player.get_player_coords(player.player_id()).y))), 0, 0)
	-- _pos.x = (cam.get_gameplay_cam_pos().x-_pos.x)/_GT_RADAR.range.value
	-- _pos.y = (cam.get_gameplay_cam_pos().y-_pos.y)/_GT_RADAR.range.value
	-- return v2((_GT_RADAR.x.value+(_pos.x*_GT_RADAR.r_size.value*0.124*_GT_RADAR.xT.value)),(_GT_RADAR.y.value+(_pos.y*_GT_RADAR.r_size.value*0.22*_GT_RADAR.yT.value)))
-- end

function _GT_RADAR.head(PID)
	return _GT_gta_map.sprt_rot_calc(player.get_player_heading(PID)+cam.get_gameplay_cam_rot().z*-1)
end

function _GT_RADAR.head2(_PED)
	return _GT_gta_map.sprt_rot_calc(entity.get_entity_heading(_PED)+cam.get_gameplay_cam_rot().z*-1)
end

function _GT_RADAR.dead_chk(_PED)
	if _GT_RADAR.ents[_PED+1].DEAD then	
		return (_GT_RADAR.ents[_PED+1].D_TIME > utils.time_ms())
	end
	return true
end

_GT_RADAR.feat=menu.add_feature("Show radar", "toggle", _G_2T1_radar.id, function(f)
	local flip_time,flip,r,g,b,rings,ring_size,ring_f,ring_color,all_peds,_PED,_PID = utils.time_ms()+669,true
	local grey,white,rdr_plyr_name_size = _GF_RGBAToInt(100,100,100,255),_GF_RGBAToInt(255,255,255,255)
	local function show_self(_bool)
		if _GT_RADAR.self.on and flip == _bool then
			r,g,b = _G_plyrs_overlay_main.plyr_rgb(player.player_id()+1)
			if ped.is_ped_shooting(player.get_player_ped(player.player_id())) then
				scriptdraw.draw_sprite(_GT_RADAR.boom,v2(_GT_RADAR.x.value,_GT_RADAR.y.value),_GT_RADAR.r_size.value*_GT_RADAR.p_size.value*.1*.25,_GT_RADAR.head(player.player_id()),_GF_RGBAToInt(255,255,255,_GT_RADAR.s_a.value))
			end
			scriptdraw.draw_sprite(_GT_RADAR.arrow3,v2(_GT_RADAR.x.value,_GT_RADAR.y.value),_GT_RADAR.r_size.value*_GT_RADAR.p_size.value*0.1,_GT_RADAR.head(player.player_id()),_GF_RGBAToInt(r,g,b,_GT_RADAR.s_a.value))
			--scriptdraw.draw_sprite(_GT_RADAR.arrow3,_GT_RADAR.my_cam_pos(cam.get_gameplay_cam_pos()),_GT_RADAR.r_size.value*_GT_RADAR.p_size.value*0.1,_GT_RADAR.head(player.player_id()),_GF_RGBAToInt(r,g,b,_GT_RADAR.s_a.value))
		end
	end
	local function show_wp(_bool)
		if _GT_RADAR.wp_true and flip == _bool then
			if _GF_mission_active(player.player_id()) and _GT_plyr_info.color[player.player_id()+1] > -1 then
			r,g,b = _G_plyrs_overlay_main.plyr_rgb(player.player_id()+1) else r,g,b = 164, 76, 242 end
			scriptdraw.draw_sprite(_GT_RADAR.waypoint,_GT_RADAR.pos(_GT_RADAR.wp_pos,_GT_RADAR.wp_dist),_GT_RADAR.r_size.value*_GT_RADAR.wp_size.value*1.5,0,_GF_RGBAToInt(r,g,b,_GT_RADAR.wp_a.value))
		end
	end
	local function get_ring()
		if ring_size >= 0.75 then
			return _GT_RADAR.ring1
		elseif ring_size >= 0.5 then
			return _GT_RADAR.ring2
		elseif ring_size >= 0.25 then
			return _GT_RADAR.ring3
		end
		return _GT_RADAR.ring4
	end
	while f.on do
		_GT_RADAR.info.on=f.on
		system.yield(5)
		rdr_plyr_name_size = _GT_RADAR.r_size.value*_GT_RADAR.p_size.value*_GT_RADAR.name_s.value
		if utils.time_ms() > flip_time then
			flip = _GF_opp_bool(flip)
			flip_time = utils.time_ms()+669
		end
		scriptdraw.draw_sprite(_GT_RADAR.circle1,v2(_GT_RADAR.x.value,_GT_RADAR.y.value),_GT_RADAR.r_size.value*.25,0,_GF_RGBAToInt(_GT_RADAR.r.value,_GT_RADAR.g.value,_GT_RADAR.b.value,_GT_RADAR.a.value))
		if _GT_RADAR.rings_show.on then
			rings = math.floor(_GT_RADAR.range.value/_GT_RADAR.rings_rng.value)
			if rings > 0 then
				ring_size = _GT_RADAR.rings_rng.value/_GT_RADAR.range.value
				ring_f = ring_size
				if _GT_RADAR.rings_opp_color.on then
					ring_color = _GF_RGBAToInt((255-_GT_RADAR.r.value),(255-_GT_RADAR.g.value),(255-_GT_RADAR.b.value),_GT_RADAR.r_a.value)
				else
					ring_color = _GF_RGBAToInt(_GT_RADAR.r_r.value,_GT_RADAR.r_g.value,_GT_RADAR.r_b.value,_GT_RADAR.r_a.value)
				end
				for i=1,rings do
					scriptdraw.draw_sprite(get_ring(),v2(_GT_RADAR.x.value,_GT_RADAR.y.value),_GT_RADAR.r_size.value*.25*ring_size,0,ring_color)
					ring_size=ring_size+ring_f
				end
			end
		end
		show_self(true)
		show_wp(true)
		all_peds = ped.get_all_peds()
		for i=1,#all_peds do
			_PED = all_peds[i]
			if _GT_RADAR.ents[_PED+1] ~= nil and _GF_is_ent(_PED) then
				if ped.is_ped_shooting(_PED) then
					_GT_RADAR.ents[_PED+1].SHOOT = utils.time_ms() + 100
				end
				if _GT_RADAR.ents[_PED+1].DEAD then
					if _GT_RADAR.dead_chk(_PED) then
						scriptdraw.draw_sprite(_GT_RADAR.dead_x,_GT_RADAR.pos(entity.get_entity_coords(_PED),_GT_RADAR.ents[_PED+1].DIST),_GT_RADAR.r_size.value*.15*_GT_RADAR.p_size.value*.1,0,grey)
					end
				elseif _GT_RADAR.ents[_PED+1].PLYR and player.is_player_valid(_GT_RADAR.ents[_PED+1].PID) then
					_PID = _GT_RADAR.ents[_PED+1].PID
					_POS = _GT_RADAR.pos(player.get_player_coords(_PID),_GT_RADAR.ents[_PED+1].DIST)
					if _GT_RADAR.ents[_PED+1].SHOOT  > utils.time_ms() then
						scriptdraw.draw_sprite(_GT_RADAR.boom,_POS,_GT_RADAR.r_size.value*_GT_RADAR.p_size.value*.1*.25,_GT_RADAR.head(_PID),_GF_RGBAToInt(255,255,255,_GT_RADAR.ents[_PED+1].ALPHA))
					end
					scriptdraw.draw_sprite(_GT_RADAR.arrow3,_POS,_GT_RADAR.r_size.value*_GT_RADAR.p_size.value*.1,_GT_RADAR.head(_PID),_GT_RADAR.ents[_PED+1].COLR)
					if _GT_RADAR.name.on then
						if _GT_RADAR.name_j.value == 1 then
							scriptdraw.draw_text(_GF_plyr_name(_PID),_POS+v2(rdr_plyr_name_size*0.01+_GT_RADAR.name_x.value,rdr_plyr_name_size*0.007+_GT_RADAR.name_y.value),_POS,rdr_plyr_name_size,_GT_RADAR.ents[_PED+1].COLR,(1<<1)+(1<<4),nil)
						else
							scriptdraw.draw_text(_GF_plyr_name(_PID),_POS+v2(rdr_plyr_name_size*0.01+_GT_RADAR.name_x.value,rdr_plyr_name_size*0.007+_GT_RADAR.name_y.value),_POS,rdr_plyr_name_size,_GT_RADAR.ents[_PED+1].COLR,(1<<1),nil)
						end
					end
				elseif _GT_RADAR.ents[_PED+1].PED then
					_POS = _GT_RADAR.pos(entity.get_entity_coords(_PED),_GT_RADAR.ents[_PED+1].DIST)
					if _GT_RADAR.ents[_PED+1].SHOOT > utils.time_ms() then
						scriptdraw.draw_sprite(_GT_RADAR.boom,_POS,_GT_RADAR.r_size.value*_GT_RADAR.p_size.value*.1*.25,_GT_RADAR.head2(_PED),_GF_RGBAToInt(255,255,255,_GT_RADAR.ents[_PED+1].ALPHA))
					end
					scriptdraw.draw_sprite(_GT_RADAR.arrow3,_POS,_GT_RADAR.r_size.value*_GT_RADAR.p_size.value*.1,_GT_RADAR.head2(_PED),_GT_RADAR.ents[_PED+1].COLR)
				end
			end
		end
		show_self(false)
		show_wp(false)
	end
end)

_GT_RADAR.info=menu.add_feature("Show radar HIDDEN", "toggle", _G_2T1_radar.id, function(f)
	local good,_dist,r,g,b,all_peds,_PED,PID,ped_type
	local cops = {
	[gameplay.get_hash_key("COP")] = true,
	[gameplay.get_hash_key("SECURITY_GUARD")] = true,
	[gameplay.get_hash_key("PRIVATE_SECURITY")] = true,
	[gameplay.get_hash_key("ARMY")] = true}
	local others ={
	[gameplay.get_hash_key("HATES_PLAYER")] = true,
	[gameplay.get_hash_key("SPECIAL")] = true,
	[gameplay.get_hash_key("MISSION2")] = true,
	[gameplay.get_hash_key("MISSION3")] = true,
	[gameplay.get_hash_key("MISSION4")] = true,
	[gameplay.get_hash_key("MISSION5")] = true,
	[gameplay.get_hash_key("MISSION6")] = true,
	[gameplay.get_hash_key("MISSION7")] = true,
	[gameplay.get_hash_key("MISSION8")] = true,
	[gameplay.get_hash_key("AGGRESSIVE_INVESTIGATE")] = true,
	[gameplay.get_hash_key("GANG_1")] = true,
	[gameplay.get_hash_key("GANG_2")] = true,
	[gameplay.get_hash_key("GANG_9")] = true,
	[gameplay.get_hash_key("GANG_10")] = true,
	[gameplay.get_hash_key("AMBIENT_GANG_LOST")] = true,
	[gameplay.get_hash_key("AMBIENT_GANG_MEXICAN")] = true,
	[gameplay.get_hash_key("AMBIENT_GANG_FAMILY")] = true,
	[gameplay.get_hash_key("AMBIENT_GANG_BALLAS")] = true,
	[gameplay.get_hash_key("AMBIENT_GANG_MARABUNTE")] = true,
	[gameplay.get_hash_key("AMBIENT_GANG_CULT")] = true,
	[gameplay.get_hash_key("AMBIENT_GANG_SALVA")] = true,
	[gameplay.get_hash_key("AMBIENT_GANG_WEICHENG")] = true,
	[gameplay.get_hash_key("AMBIENT_GANG_HILLBILLY")] = true}
	local animals ={
	[gameplay.get_hash_key("HEN")] = true,
	[gameplay.get_hash_key("WILD_ANIMAL")] = true,
	[gameplay.get_hash_key("SHARK")] = true,
	[gameplay.get_hash_key("COUGAR")] = true,
	[gameplay.get_hash_key("CAT")] = true,
	[gameplay.get_hash_key("GUARD_DOG")] = true}
	local animals_hash ={
	[gameplay.get_hash_key("A_C_Westy")] = true, -- Hash: -138462701
	[gameplay.get_hash_key("A_C_TigerShark")] = true, -- Hash: 113504370
	[gameplay.get_hash_key("A_C_Shepherd")] = true, -- Hash: 1126154828
	[gameplay.get_hash_key("A_C_Rottweiler")] = true, -- Hash: -1788665315
	[gameplay.get_hash_key("A_C_Rat")] = true, -- Hash: -1011537562
	[gameplay.get_hash_key("A_C_Rhesus")] = true, -- Hash: -1026527405
	[gameplay.get_hash_key("A_C_Retriever")] = true, -- Hash: 882848737
	[gameplay.get_hash_key("A_C_Rabbit")] = true, -- Hash: -541762431
	[gameplay.get_hash_key("A_C_Pug")] = true, -- Hash: 1832265812
	[gameplay.get_hash_key("A_C_Poodle")] = true, -- Hash: 1125994524
	[gameplay.get_hash_key("A_C_Pigeon")] = true, -- Hash: 111281960
	[gameplay.get_hash_key("A_C_Pig")] = true, -- Hash: -1323586730
	[gameplay.get_hash_key("A_C_OrleansCutscene")] = true, -- Hash: -1389097126
	[gameplay.get_hash_key("A_C_Orleans")] = true, -- Hash: 1641334641
	[gameplay.get_hash_key("A_C_MountainLion")] = true, -- Hash: 307287994
	[gameplay.get_hash_key("A_C_KillerWhale")] = true, -- Hash: -1920284487
	[gameplay.get_hash_key("A_C_Husky")] = true, -- Hash: 1318032802
	[gameplay.get_hash_key("A_C_Humpback")] = true, -- Hash: 1193010354
	[gameplay.get_hash_key("A_C_Hen")] = true, -- Hash: 1794449327
	[gameplay.get_hash_key("A_C_HammerShark")] = true, -- Hash: 1015224100
	[gameplay.get_hash_key("A_C_Fish")] = true, -- Hash: 802685111
	[gameplay.get_hash_key("A_C_Dolphin")] = true, -- Hash: -1950698411
	[gameplay.get_hash_key("A_C_Deer")] = true, -- Hash: -664053099
	[gameplay.get_hash_key("A_C_Crow")] = true, -- Hash: 402729631
	[gameplay.get_hash_key("A_C_Coyote")] = true, -- Hash: 1682622302
	[gameplay.get_hash_key("A_C_Cow")] = true, -- Hash: -50684386
	[gameplay.get_hash_key("A_C_Cormorant")] = true, -- Hash: 1457690978
	[gameplay.get_hash_key("A_C_Chop")] = true, -- Hash: 351016938
	[gameplay.get_hash_key("A_C_Chimp")] = true, -- Hash: -1469565163
	[gameplay.get_hash_key("A_C_ChickenHawk")] = true, -- Hash: -1430839454
	[gameplay.get_hash_key("A_C_Cat")] = true, -- Hash: 1462895032
	[gameplay.get_hash_key("A_C_Boar")] = true, -- Hash: -832573324
	}

	local function get_type(_hash)
		if _GT_RADAR.csa_show.on and cops[_hash] then return 1
		elseif _GT_RADAR.mssn_show.on and (others[_hash] or _GF_mean_ped(_PED) or _GF_ped_attack_me(_PED)) then return 2
		elseif _GT_RADAR.anml_show.on and (animals[_hash] or animals_hash[entity.get_entity_model_hash(_PED)]) then return 3
		elseif _GT_RADAR.nice_show.on and _GF_nice_ped(_PED) then return 4
		end
		return 0
	end
	local function player_check()
		if player.is_player_valid(PID) and PID ~= player.player_id() then
			if _GT_plyr_info.interior[player.player_id()+1] or (not _GT_plyr_info.interior[PID+1]) then
				return _GF_in_grid_xy(player.get_player_coords(player.player_id()),player.get_player_coords(PID),_GT_RADAR.range.value)
			end
		end
		return false
	end
	local ped_alpha = {}
	while f.on do
		system.yield(25)
		_GT_RADAR.ped_colors[1]=_GF_RGBAToInt(_GT_RADAR.csa_r.value,_GT_RADAR.csa_g.value,_GT_RADAR.csa_b.value,_GT_RADAR.csa_a.value)
		_GT_RADAR.ped_colors[2]=_GF_RGBAToInt(_GT_RADAR.mssn_r.value,_GT_RADAR.mssn_g.value,_GT_RADAR.mssn_b.value,_GT_RADAR.mssn_a.value)
		_GT_RADAR.ped_colors[3]=_GF_RGBAToInt(_GT_RADAR.anml_r.value,_GT_RADAR.anml_g.value,_GT_RADAR.anml_b.value,_GT_RADAR.anml_a.value)
		_GT_RADAR.ped_colors[4]=_GF_RGBAToInt(_GT_RADAR.nice_r.value,_GT_RADAR.nice_g.value,_GT_RADAR.nice_b.value,_GT_RADAR.nice_a.value)
		ped_alpha[1]=_GT_RADAR.csa_a.value
		ped_alpha[2]=_GT_RADAR.mssn_a.value
		ped_alpha[3]=_GT_RADAR.anml_a.value
		ped_alpha[4]=_GT_RADAR.nice_a.value
		good = false
		if _GF_in_grid_xy(player.get_player_coords(player.player_id()),ui.get_waypoint_coord(),_GT_RADAR.range.value) then
			_dist = math.abs(v2(ui.get_waypoint_coord().x,ui.get_waypoint_coord().y):magnitude(v2(player.get_player_coords(player.player_id()).x,player.get_player_coords(player.player_id()).y)))
			if _dist <= _GT_RADAR.range.value then
				_GT_RADAR.wp_dist = _dist
				_GT_RADAR.wp_pos = ui.get_waypoint_coord()
				_GT_RADAR.wp_true = true
				good = true
			end
		end
		if not good then
			_GT_RADAR.wp_true = false
			_GT_RADAR.wp_dist = 10000
			_GT_RADAR.wp_pos = v2(10000,10000)
		end
		all_peds = ped.get_all_peds()
		for i=1,#all_peds do
			_PED = all_peds[i]
			good = false
			if _GF_is_ent(_PED) then
				if _GT_RADAR.ents[_PED+1] == nil then
					_GT_RADAR.ents_default(_PED+1)
				end
				if ped.is_ped_a_player(_PED) then
					PID = player.get_player_from_ped(_PED)
					good = player_check()
					if good then
						_dist = _GF_dist_me_pid_xy(PID)
						--_dist = math.abs(v2(cam.get_gameplay_cam_pos().x,cam.get_gameplay_cam_pos().y):magnitude(v2(player.get_player_coords(PID).x,player.get_player_coords(PID).y)))
						good = (_dist <= _GT_RADAR.range.value)
						if good then
							_GT_RADAR.ents[_PED+1].DIST = _dist
							_GT_RADAR.ents[_PED+1].FRND = player.is_player_friend(PID)
							r,g,b = _G_plyrs_overlay_main.plyr_rgb(PID+1)
							if _GT_RADAR.ents[_PED+1].FRND then
								_GT_RADAR.ents[_PED+1].COLR = _GF_RGBAToInt(r,g,b,_GT_RADAR.f_a.value)
								_GT_RADAR.ents[_PED+1].ALPHA = _GT_RADAR.f_a.value
							else
								_GT_RADAR.ents[_PED+1].COLR = _GF_RGBAToInt(r,g,b,_GT_RADAR.o_a.value)
								_GT_RADAR.ents[_PED+1].ALPHA = _GT_RADAR.o_a.value
							end
							_GT_RADAR.ents[_PED+1].PED = false
							_GT_RADAR.ents[_PED+1].PID = PID
							_GT_RADAR.ents[_PED+1].PLYR = true
							_GT_RADAR.ents[_PED+1].DEAD = entity.is_entity_dead(_PED)
							_GT_RADAR.ents[_PED+1].D_TIME = utils.time_ms()+10000
							if ped.is_ped_shooting(_PED) then
								_GT_RADAR.ents[_PED+1].SHOOT =	utils.time_ms()+100
							end
						end
					end
				else
					ped_type = get_type(ped.get_ped_relationship_group_hash(_PED),_PED) 
					if ped_type > 0 and _GF_in_grid_xy(player.get_player_coords(player.player_id()),entity.get_entity_coords(_PED),_GT_RADAR.range.value) then
						if _GT_RADAR.dead_chk(_PED) then
							_dist = _GF_dist_me_ent_xy(_PED)
							--_dist = math.abs(v2(cam.get_gameplay_cam_pos().x,cam.get_gameplay_cam_pos().y):magnitude(v2(entity.get_entity_coords(_PED).x,entity.get_entity_coords(_PED).y)))
							good = (_dist <= _GT_RADAR.range.value)
							if good then
								_GT_RADAR.ents[_PED+1].DIST = _dist
								_GT_RADAR.ents[_PED+1].FRND = false
								_GT_RADAR.ents[_PED+1].COLR = _GT_RADAR.ped_colors[ped_type]
								_GT_RADAR.ents[_PED+1].PID = -1
								_GT_RADAR.ents[_PED+1].PLYR = false
								_GT_RADAR.ents[_PED+1].PED = true
								if not _GT_RADAR.ents[_PED+1].DEAD then
									_GT_RADAR.ents[_PED+1].D_TIME = utils.time_ms()+10000
								end
								_GT_RADAR.ents[_PED+1].DEAD = entity.is_entity_dead(_PED)
								if ped.is_ped_shooting(_PED) then
									_GT_RADAR.ents[_PED+1].SHOOT =	utils.time_ms()+100
								end
								_GT_RADAR.ents[_PED+1].ALPHA = ped_alpha[ped_type]
							end
						else
							good = true
						end
					end
				end
			end
			if not good then
				_GT_RADAR.ents_default(_PED+1)
			end
		end
		f.on=_GT_RADAR.feat.on
	end
end)_GT_RADAR.info.hidden=true



_GT_RADAR.rdr_optns=menu.add_feature("Radar options", "parent", _G_2T1_radar.id)

_GT_RADAR.range = menu.add_feature("Range", "action_value_f",_GT_RADAR.rdr_optns.id)
_GF_set_feat_i_f(_GT_RADAR.range,25,500,5,100)

_GT_RADAR.r_size = menu.add_feature("Radar size", "action_value_f",_GT_RADAR.rdr_optns.id)
_GF_set_feat_i_f(_GT_RADAR.r_size,0.05,2,0.01,1)

_GT_RADAR.x = menu.add_feature("X Pos", "action_value_f",_GT_RADAR.rdr_optns.id)
_GF_set_feat_i_f(_GT_RADAR.x,-1,1,0.01,0.44)
_GT_RADAR.y = menu.add_feature("Y Pos", "action_value_f",_GT_RADAR.rdr_optns.id)
_GF_set_feat_i_f(_GT_RADAR.y,-1,1,0.01,0.39)

_GT_RADAR.rings_prnt = menu.add_feature("Range rings", "parent",_GT_RADAR.rdr_optns.id,function(f)
	_GT_RADAR.r_r.hidden=_GT_RADAR.rings_opp_color.on
	_GT_RADAR.r_g.hidden=_GT_RADAR.rings_opp_color.on
	_GT_RADAR.r_b.hidden=_GT_RADAR.rings_opp_color.on
end)

_GT_RADAR.rings_show = menu.add_feature("Show rings", "toggle",_GT_RADAR.rings_prnt.id)
_GT_RADAR.rings_show.on=true
_GT_RADAR.rings_rng = menu.add_feature("Ring interval (meters)", "action_value_i",_GT_RADAR.rings_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.rings_rng,5,250,5,25)

_GT_RADAR.rings_opp_color = menu.add_feature("Inverse color", "toggle",_GT_RADAR.rings_prnt.id,function(f)
	_GT_RADAR.r_r.hidden=f.on
	_GT_RADAR.r_g.hidden=f.on
	_GT_RADAR.r_b.hidden=f.on
end)

_GT_RADAR.r_r = menu.add_feature("Red", "action_value_i",_GT_RADAR.rings_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.r_r,0,255,1,180)
_GT_RADAR.r_g = menu.add_feature("Green", "action_value_i",_GT_RADAR.rings_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.r_g,0,255,1,255)
_GT_RADAR.r_b = menu.add_feature("Blue", "action_value_i",_GT_RADAR.rings_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.r_b,0,255,1,180)
_GT_RADAR.r_a = menu.add_feature("Alpha", "action_value_i",_GT_RADAR.rings_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.r_a,0,255,1,100)
_GT_RADAR.rings_opp_color.on=true

_GT_RADAR.rdr_clr_prnt=menu.add_feature("Radar Color", "parent", _GT_RADAR.rdr_optns.id)

_GT_RADAR.r = menu.add_feature("Red", "action_value_i",_GT_RADAR.rdr_clr_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.r,0,255,1,0)
_GT_RADAR.g = menu.add_feature("Green", "action_value_i",_GT_RADAR.rdr_clr_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.g,0,255,1,0)
_GT_RADAR.b = menu.add_feature("Blue", "action_value_i",_GT_RADAR.rdr_clr_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.b,0,255,1,0)
_GT_RADAR.a = menu.add_feature("Alpha", "action_value_i",_GT_RADAR.rdr_clr_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.a,0,255,1,100)

_GT_RADAR.ped_optns=menu.add_feature("Ped options", "parent", _G_2T1_radar.id)

_GT_RADAR.p_size = menu.add_feature("Size", "action_value_f",_GT_RADAR.ped_optns.id)
_GF_set_feat_i_f(_GT_RADAR.p_size,0.05,2,0.01,1)

_GT_RADAR.plyr_optns=menu.add_feature("Player options", "parent", _GT_RADAR.ped_optns.id)

_GT_RADAR.plyr_name_optns=menu.add_feature("Player name", "parent", _GT_RADAR.plyr_optns.id)
_GT_RADAR.name = menu.add_feature("Show name", "toggle",_GT_RADAR.plyr_name_optns.id)
_GT_RADAR.name.on=true
_GT_RADAR.name_s = menu.add_feature("Name Size", "action_value_f",_GT_RADAR.plyr_name_optns.id)
_GF_set_feat_i_f(_GT_RADAR.name_s,0,2,0.01,1)
_GT_RADAR.name_j = menu.add_feature("Justification", "action_value_str",_GT_RADAR.plyr_name_optns.id)
_GT_RADAR.name_j.set_str_data(_GT_RADAR.name_j,{"Left","Right"})
_GT_RADAR.name_x = menu.add_feature("Name X Pos offset", "action_value_f",_GT_RADAR.plyr_name_optns.id)
_GF_set_feat_i_f(_GT_RADAR.name_x,-1,1,0.001,0)
_GT_RADAR.name_y = menu.add_feature("Name Y Pos offset", "action_value_f",_GT_RADAR.plyr_name_optns.id)
_GF_set_feat_i_f(_GT_RADAR.name_y,-1,1,0.001,0)

_GT_RADAR.self = menu.add_feature("Show self", "toggle",_GT_RADAR.plyr_optns.id)
_GT_RADAR.self.on=true

_GT_RADAR.s_a = menu.add_feature("Self alpha", "action_value_i",_GT_RADAR.plyr_optns.id)
_GF_set_feat_i_f(_GT_RADAR.s_a,0,255,1,255)
_GT_RADAR.f_a = menu.add_feature("Friend alpha", "action_value_i",_GT_RADAR.plyr_optns.id)
_GF_set_feat_i_f(_GT_RADAR.f_a,0,255,1,255)
_GT_RADAR.o_a = menu.add_feature("Other player alpha", "action_value_i",_GT_RADAR.plyr_optns.id)
_GF_set_feat_i_f(_GT_RADAR.o_a,0,255,1,255)

_GT_RADAR.csa_prnt=menu.add_feature("Cops/Security/Army", "parent", _GT_RADAR.ped_optns.id)
_GT_RADAR.csa_show=menu.add_feature("Show peds", "toggle", _GT_RADAR.csa_prnt.id)
_GT_RADAR.csa_show.on=true
_GT_RADAR.csa_r = menu.add_feature("Red", "action_value_i",_GT_RADAR.csa_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.csa_r,0,255,1,0)
_GT_RADAR.csa_g = menu.add_feature("Green", "action_value_i",_GT_RADAR.csa_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.csa_g,0,255,1,0)
_GT_RADAR.csa_b = menu.add_feature("Blue", "action_value_i",_GT_RADAR.csa_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.csa_b,0,255,1,200)
_GT_RADAR.csa_a = menu.add_feature("Alpha", "action_value_i",_GT_RADAR.csa_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.csa_a,0,255,1,255)

_GT_RADAR.mssn_prnt=menu.add_feature("Mission/Other", "parent", _GT_RADAR.ped_optns.id)
_GT_RADAR.mssn_show=menu.add_feature("Show peds", "toggle", _GT_RADAR.mssn_prnt.id)
_GT_RADAR.mssn_show.on=true
_GT_RADAR.mssn_r = menu.add_feature("Red", "action_value_i",_GT_RADAR.mssn_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.mssn_r,0,255,1,225)
_GT_RADAR.mssn_g = menu.add_feature("Green", "action_value_i",_GT_RADAR.mssn_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.mssn_g,0,255,1,69)
_GT_RADAR.mssn_b = menu.add_feature("Blue", "action_value_i",_GT_RADAR.mssn_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.mssn_b,0,255,1,69)
_GT_RADAR.mssn_a = menu.add_feature("Alpha", "action_value_i",_GT_RADAR.mssn_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.mssn_a,0,255,1,255)

_GT_RADAR.anml_prnt=menu.add_feature("Animals", "parent", _GT_RADAR.ped_optns.id)
_GT_RADAR.anml_show=menu.add_feature("Show peds", "toggle", _GT_RADAR.anml_prnt.id)
_GT_RADAR.anml_show.on=true
_GT_RADAR.anml_r = menu.add_feature("Red", "action_value_i",_GT_RADAR.anml_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.anml_r,0,255,1,150)
_GT_RADAR.anml_g = menu.add_feature("Green", "action_value_i",_GT_RADAR.anml_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.anml_g,0,255,1,190)
_GT_RADAR.anml_b = menu.add_feature("Blue", "action_value_i",_GT_RADAR.anml_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.anml_b,0,255,1,0)
_GT_RADAR.anml_a = menu.add_feature("Alpha", "action_value_i",_GT_RADAR.anml_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.anml_a,0,255,1,255)

_GT_RADAR.nice_prnt=menu.add_feature("Friendly NPCs", "parent", _GT_RADAR.ped_optns.id)
_GT_RADAR.nice_show=menu.add_feature("Show peds", "toggle", _GT_RADAR.nice_prnt.id)
_GT_RADAR.nice_show.on=true
_GT_RADAR.nice_r = menu.add_feature("Red", "action_value_i",_GT_RADAR.nice_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.nice_r,0,255,1,93)
_GT_RADAR.nice_g = menu.add_feature("Green", "action_value_i",_GT_RADAR.nice_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.nice_g,0,255,1,182)
_GT_RADAR.nice_b = menu.add_feature("Blue", "action_value_i",_GT_RADAR.nice_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.nice_b,0,255,1,229)
_GT_RADAR.nice_a = menu.add_feature("Alpha", "action_value_i",_GT_RADAR.nice_prnt.id)
_GF_set_feat_i_f(_GT_RADAR.nice_a,0,255,1,255)

_GT_RADAR.monitor_prnt=menu.add_feature("Monitor adjustments", "parent", _GT_RADAR.ped_optns.id)
_GT_RADAR.xT = menu.add_feature("X Offset", "action_value_f",_GT_RADAR.monitor_prnt.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)_GF_set_feat_i_f(_GT_RADAR.xT,0,3,0.001,1)
_GT_RADAR.yT = menu.add_feature("Y Offset", "action_value_f",_GT_RADAR.monitor_prnt.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)_GF_set_feat_i_f(_GT_RADAR.yT,0,3,0.001,1)
_GT_RADAR.math_mod = menu.add_feature("Adjustment sensitivity","autoaction_value_str",_GT_RADAR.monitor_prnt.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GT_RADAR.xT.mod=_table[f.value+1]
	_GT_RADAR.yT.mod=_table[f.value+1]
	menu.notify("Offset mod changed to ".._table[f.value+1],_G_GeeVer,3)
end)_GT_RADAR.math_mod.set_str_data(_GT_RADAR.math_mod,{"0.0001","0.001","0.01","0.1"})

_GT_RADAR.wp_optns=menu.add_feature("Waypoint options", "parent", _G_2T1_radar.id)

_GT_RADAR.wp_size = menu.add_feature("Size", "action_value_f",_GT_RADAR.wp_optns.id)
_GF_set_feat_i_f(_GT_RADAR.wp_size,0.05,2,0.01,1)

_GT_RADAR.wp_a = menu.add_feature("Alpha", "action_value_i",_GT_RADAR.wp_optns.id)
_GF_set_feat_i_f(_GT_RADAR.wp_a,0,255,1,255)

_GT_clear_stuff={}
_GT_clear_stuff.ped_count=0
_GT_clear_stuff.obj_count=0
_GT_clear_stuff.veh_count=0
_GT_clear_stuff.feat=menu.add_feature("Clear area","action",_G_ClearArea.id,function(f)
	if not _GT_clear_stuff.peds.on and not _GT_clear_stuff.obj.on and not _GT_clear_stuff.veh.on then
		menu.notify("No option selected",_G_GeeVer,4,2)
	else
		local range,peds,objs,vehs = _GT_clear_stuff.range_feat.value
		peds = _GT_clear_stuff.peds.on
		objs = _GT_clear_stuff.obj.on
		vehs = _GT_clear_stuff.veh.on
		_GT_clear_stuff.ped_count=0
		_GT_clear_stuff.obj_count=0
		_GT_clear_stuff.veh_count=0
		_GT_clear_stuff.peds_do.on = _GT_clear_stuff.peds.on	
		_GT_clear_stuff.obj_do.on = _GT_clear_stuff.obj.on
		_GT_clear_stuff.veh_do.on = _GT_clear_stuff.veh.on
		_GT_clear_stuff.debug_pos=player.get_player_coords(player.player_id())
		_GT_clear_stuff.debug_time= utils.time_ms()+2000
		_GT_clear_stuff.debug_div=2
		_GT_clear_stuff.show_debug_feat.on=true
		while _GT_clear_stuff.peds_do.on or _GT_clear_stuff.obj_do.on or _GT_clear_stuff.veh_do.on do
			system.yield(0)
		end
		local msg=""
		if peds then
			msg=msg.._GT_clear_stuff.ped_count.." Peds"
		end
		if objs then
			if peds then
				msg=msg.." and "
			end
			msg=msg.._GT_clear_stuff.obj_count.." Objects"
		end
		if vehs then
			if peds or objs then
				msg=msg.." and "
			end
			msg=msg.._GT_clear_stuff.veh_count.." Vehicles"
		end
		msg=msg.." within "..range.." meters cleared."
		menu.notify(msg,_G_GeeVer,4,2)
	end
end)

_GT_clear_stuff.rng=0
_GT_clear_stuff.range_feat=menu.add_feature("Range","autoaction_value_i",_G_ClearArea.id,function(f)
	if f.value ~= _GT_clear_stuff.rng then
		_GT_clear_stuff.rng=f.value
		_GT_clear_stuff.debug_pos=player.get_player_coords(player.player_id())
		_GT_clear_stuff.debug_time= utils.time_ms()+1000
		_GT_clear_stuff.debug_div=1
		_GT_clear_stuff.show_debug_feat.on=true
	end
end)_GF_set_feat_i_f(_GT_clear_stuff.range_feat,10,500,10,100)

_GT_clear_stuff.debug_time= utils.time_ms()
_GT_clear_stuff.debug_pos=player.get_player_coords(player.player_id())
_GT_clear_stuff.debug_div=1
_GT_clear_stuff.show_debug_feat=menu.add_feature("Show debug HIDDEN","toggle",_G_ClearArea.id,function(f)
	if f.on then
		while _GT_clear_stuff.debug_time > utils.time_ms() do
			system.yield(5)
			graphics.draw_marker(28, _GT_clear_stuff.debug_pos, v3(0, 90, 0), v3(0, 90, 0), v3(_GT_clear_stuff.rng, _GT_clear_stuff.rng, _GT_clear_stuff.rng), 255, 0, 0, math.floor((_GT_clear_stuff.debug_time-utils.time_ms()) /1000/_GT_clear_stuff.debug_div*100), false, false, 2, false, nil, "MarkerTypeDebugSphere", false)
		end
	end
	f.on=false
end)_GT_clear_stuff.show_debug_feat.hidden=true

_GT_clear_stuff.peds_do=menu.add_feature("Peds HIDDEN","toggle",_G_ClearArea.id,function(f)
	if f.on then
		local my_pos=player.get_player_coords(player.player_id())
		local all_peds=ped.get_all_peds()
		local _table = {}
		for i=1,#all_peds do
			if _GF_in_grid(my_pos,entity.get_entity_coords(all_peds[i]),_GT_clear_stuff.range_feat.value) and not ped.is_ped_a_player(all_peds[i]) then
				_G_threads_history[#_G_threads_history+1]=menu.create_thread(function()
					local ent = all_peds[i]
					_table[ent]=true
					if _GF_remove_ent(ent,2000) then
						_GT_clear_stuff.ped_count=_GT_clear_stuff.ped_count+1
					end
					_table[ent]=false
				end,nil)
			end
		end
		::check::
		system.yield(0)
		for _, ENT in pairs(_table) do
			if ENT then
				goto check
			end
		end
		f.on=false
	end
end)_GT_clear_stuff.peds_do.hidden=true

_GT_clear_stuff.obj_do=menu.add_feature("Objects HIDDEN","toggle",_G_ClearArea.id,function(f)
	if f.on then
		local my_pos=player.get_player_coords(player.player_id())
		local all_obj=object.get_all_objects()
		local _table = {}
		for i=1,#all_obj do
			if _GF_in_grid(my_pos,entity.get_entity_coords(all_obj[i]),_GT_clear_stuff.range_feat.value) then
				_G_threads_history[#_G_threads_history+1]=menu.create_thread(function()
					local ent = all_obj[i]
					_table[ent]=true
					if _GF_remove_ent(ent,2000) then
						_GT_clear_stuff.obj_count=_GT_clear_stuff.obj_count+1
					end
					_table[ent]=false
				end,nil)
			end
		end
		::check::
		system.yield(0)
		for _, ENT in pairs(_table) do
			if ENT then
				goto check
			end
		end
		f.on=false
	end
end)_GT_clear_stuff.obj_do.hidden=true

_GT_clear_stuff.veh_do=menu.add_feature("Vehicles HIDDEN","toggle",_G_ClearArea.id,function(f)
	if f.on then
		local my_pos=player.get_player_coords(player.player_id())
		local all_veh=vehicle.get_all_vehicles()
		local _table = {}
		local function should_do_it(_veh)
			if not _GF_in_grid(my_pos,entity.get_entity_coords(_veh),_GT_clear_stuff.range_feat.value) then
				return false
			end
			if decorator.decor_get_int(_veh, "Player_Vehicle") == _GT_plyr_info.net_hash[player.player_id()+1] or _GF_me_in_that_veh(_veh) or _GT_plyr_info.veh[player.player_id()+1] == _veh then
				return false
			end
			if _GT_clear_stuff.prsnl.on then
				if decorator.decor_get_int(_veh, "Player_Vehicle") > 0 then
					return false
				end
			end
			if _GT_clear_stuff.prvs.on then
				if vehicle.get_vehicle_has_been_owned_by_player(_veh) then
					return false
				end
			end				
			for i=1,32 do
				if _GT_clear_stuff.frnds.on and _GT_plyr_info.is_frnd[i] then
					if _GT_plyr_info.veh[i] == _veh or decorator.decor_get_int(_veh, "Player_Vehicle") == _GT_plyr_info.net_hash[i] then
						return false
					end
				end
				if _GT_clear_stuff.orgmc.on and _GT_plyr_info.color[player.player_id()+1] > -1 then
					if _GT_plyr_info.color[player.player_id()+1] == _GT_plyr_info.color[i] then
						return false
					end
				end
			end
			return true
		end
		for i=1,#all_veh do
			if should_do_it(all_veh[i]) then
				_G_threads_history[#_G_threads_history+1]=menu.create_thread(function()
					local ent = all_veh[i]
					_table[ent]=true
					if _GF_remove_ent(ent,2000) then
						_GT_clear_stuff.veh_count=_GT_clear_stuff.veh_count+1
					end
					_table[ent]=false
				end,nil)
			end
		end
		::check::
		system.yield(0)
		for _, ENT in pairs(_table) do
			if ENT then
				goto check
			end
		end
		f.on=false
	end
end)_GT_clear_stuff.veh_do.hidden=true

_GT_clear_stuff.peds=menu.add_feature("Peds","toggle",_G_ClearArea.id)
_GT_clear_stuff.peds.on=true
_GT_clear_stuff.obj=menu.add_feature("Objects","toggle",_G_ClearArea.id)
_GT_clear_stuff.obj.on=true
_GT_clear_stuff.veh=menu.add_feature("Vehicles","toggle",_G_ClearArea.id)
_GT_clear_stuff.veh.on=true
_GT_clear_stuff.prsnl=menu.add_feature("Exclude personal vehicles","toggle",_G_ClearArea.id)
_GT_clear_stuff.prvs=menu.add_feature("Exclude previously used vehicles","toggle",_G_ClearArea.id)
_GT_clear_stuff.frnds=menu.add_feature("Exclude friends","toggle",_G_ClearArea.id)
_GT_clear_stuff.orgmc=menu.add_feature("Exclude my org/mc","toggle",_G_ClearArea.id)




-------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------Show player aiming at me
	-------------------------------------------------------------------------------------------------
	_GT_aim_protex_main = {}
	_GT_aim_protex_main.AimAtMe = {}
	function _GT_aim_protex_main.AimDefault(i)
		_GT_aim_protex_main.AimAtMe[i] = {false,"",0,""}
	end
	for i=1,32 do
		 _GT_aim_protex_main.AimDefault(i)
	end
	
	_GT_aim_protex_main.weap_tables = {
	_GT_weap_hash_str.melee,
	_GT_weap_hash_str.handgun,
	_GT_weap_hash_str.submachine,
	_GT_weap_hash_str.shotgun,
	_GT_weap_hash_str.assault,
	_GT_weap_hash_str.machinegun,
	_GT_weap_hash_str.sniper,
	_GT_weap_hash_str.heavy,
	_GT_weap_hash_str.throwable,
	_GT_weap_hash_str.misc
	}
	
	_GT_aim_protex_main.weap_table_all={}
	
	_GT_aim_protex_main.weap_str = {}
	function _GT_aim_protex_main.record_weap_hash_str()
		for t=1,#_GT_aim_protex_main.weap_tables do
			local wep_table=_GT_aim_protex_main.weap_tables[t]
			for w=1,#wep_table do
				_GT_aim_protex_main.weap_table_all[#_GT_aim_protex_main.weap_table_all+1]=wep_table[w]
			end
		end
		for t=1,#_GT_aim_protex_main.weap_table_all do
			_GT_aim_protex_main.weap_str[_GT_aim_protex_main.weap_table_all[t][1]]=_GT_aim_protex_main.weap_table_all[t][2]
		end
	end
	_GT_aim_protex_main.record_weap_hash_str()

	_GT_aim_protex_main.veh_table = {}
	for i=1,#_GT_veh_weap_hash do
		if _GT_aim_protex_main.veh_table[gameplay.get_hash_key(_GT_veh_weap_hash[i][2])]==nil then
			_GT_aim_protex_main.veh_table[gameplay.get_hash_key(_GT_veh_weap_hash[i][2])]=_GT_veh_weap_hash[i][5]
		end
	end

	function _GT_aim_protex_main.get_weap_name(pid)
		local weap = _GT_aim_protex_main.weap_str[ped.get_current_ped_weapon(player.get_player_ped(pid))]
		if weap == nil then
			return "Weapon"
		end
		return weap
	end
	
	function _GT_aim_protex_main.get_veh_weap_name(pid)
		local weap = _GT_aim_protex_main.veh_table[_GF_cur_veh_weap(player.get_player_ped(pid))]
		if weap == nil then
			weap = _GT_veh_mg_hash[_GF_cur_veh_weap(player.get_player_ped(pid))]
			if weap == nil then
				return "Vehicle Weapon"
			end
		end
		return weap
	end
		
	_GT_aim_protex_main._G_aim_notif=menu.add_feature("Show name of player aiming at me", "toggle", _G_AimProtex.id, function(feat)
		_GF_plyr_aim_overlay_hide(false)
		local y_val, y_offset,text
		local r,g,b,s,f,x
		local text = ""
		local function should_default(i)
			if i-1 == player.player_id() or not _GF_valid_pid(i-1) then
				return true
			elseif _GT_aim_protex_main.AimAtMe[i][1] and _GT_aim_protex_main.AimAtMe[i][3] < utils.time_ms() then
				return true
			end
			return false
		end
		while feat.on do
			system.yield(5)
			for i=1,32 do
				if should_default(i) then
					_GT_aim_protex_main.AimDefault(i)
				elseif _GF_me_in_veh() and player.is_player_in_any_vehicle(i-1) and _GF_veh_locked_onto(player.get_player_vehicle(i-1))==_GT_ME._ped() then
					_GT_aim_protex_main.AimAtMe[i] = {true,_GT_aim_protex_main.get_veh_weap_name(i-1),utils.time_ms() + (_GT_aim_protex_main._G_plyr_time.value*1000),_GF_plyr_name(i-1)}
				elseif _GF_aim_at_me(i-1) then
					_GT_aim_protex_main.AimAtMe[i] = {true,_GT_aim_protex_main.get_weap_name(i-1),utils.time_ms() + (_GT_aim_protex_main._G_plyr_time.value*1000),_GF_plyr_name(i-1)}
				end
			end
			_GT_aim_protex_main.show_overlay(_GT_aim_protex_main.AimAtMe)
		end
		_GF_plyr_aim_overlay_hide(true)
	end)_GT_aim_protex_main._G_aim_notif.on=true
	
	function _GT_aim_protex_main.show_overlay(_table)
		local y_val,y_offset = _GT_aim_protex_main._G_plyr_aim_y.value,_GT_aim_protex_main._G_plyr_aim_spc.value
		local r,g,b = _GT_aim_protex_main._G_plyr_aim_cr.value,_GT_aim_protex_main._G_plyr_aim_cg.value,_GT_aim_protex_main._G_plyr_aim_cb.value
		local s,f,x = _GT_aim_protex_main._G_plyr_aim_s.value/300,_GT_aim_protex_main._G_plyr_aim_f.value,_GT_aim_protex_main._G_plyr_aim_x.value/300
		local alpha,a = _GT_aim_protex_main._G_plyr_aim_a.value
		for i=1,#_table do
			if _table[i][1] and _table[i][3] > utils.time_ms() then
				a = (_table[i][3]-utils.time_ms()) /1000/(_GT_aim_protex_main._G_plyr_time.value+1)
				if a > .5 then a = _GT_aim_protex_main._G_plyr_aim_a.value else a = math.floor(a*1.5*alpha) end
				_GF_overlay(_table[i][4].." - ".._table[i][2],r,g,b,a,s,f,x,y_val/300)
				y_val = y_val + y_offset
			end
		end
	end
	
	_GT_aim_protex_main._G_aim_notif_test = menu.add_feature("Player aim overlay test?", "action", _G_AimProtex.id, function()
		_GT_aim_protex_main._G_aim_notif_test.hidden=true
		local _table = {}
		for i=1, 3 do
			_table[i] = {true,_GT_aim_protex_main.weap_str[_GT_all_weap_hash[math.random(1,#_GT_all_weap_hash)]],utils.time_ms() + (_GT_aim_protex_main._G_plyr_time.value*1000),"Player "..math.random(1,9)}
		end
		local time = utils.time_ms() + (_GT_aim_protex_main._G_plyr_time.value*1000)
		while time > utils.time_ms() do
			system.yield(5)
			_GT_aim_protex_main.show_overlay(_table)
		end
		if _GT_aim_protex_main._G_aim_notif.on then
			_GT_aim_protex_main._G_aim_notif_test.hidden=false
		end
	end)

	function _GF_aim_at_me(_pid)
		if _GF_valid_pid(_pid) then
			if player.get_entity_player_is_aiming_at(_pid) == player.get_player_ped(player.player_id()) then
				return true
			end
		end
		return false
	end

	_GT_aim_protex_main._G_plyr_time = menu.add_feature("Time on screen", "autoaction_value_f", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_time.max,_GT_aim_protex_main._G_plyr_time.min,_GT_aim_protex_main._G_plyr_time.mod=5,1,.5
	_GT_aim_protex_main._G_plyr_time.value=2.5
	
	_GT_aim_protex_main._G_plyr_aim_x = menu.add_feature("X Pos", "autoaction_value_i", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_aim_x.max,_GT_aim_protex_main._G_plyr_aim_x.min,_GT_aim_protex_main._G_plyr_aim_x.mod=300,0,1

	_GT_aim_protex_main._G_plyr_aim_y = menu.add_feature("Y Pos", "autoaction_value_i", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_aim_y.max,_GT_aim_protex_main._G_plyr_aim_y.min,_GT_aim_protex_main._G_plyr_aim_y.mod=300,0,1

	_GT_aim_protex_main._G_plyr_aim_spc = menu.add_feature("Spacing", "autoaction_value_i", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_aim_spc.max,_GT_aim_protex_main._G_plyr_aim_spc.min,_GT_aim_protex_main._G_plyr_aim_spc.mod=69,1,1

	_GT_aim_protex_main._G_plyr_aim_s = menu.add_feature("Scale", "autoaction_value_i", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_aim_s.max,_GT_aim_protex_main._G_plyr_aim_s.min,_GT_aim_protex_main._G_plyr_aim_s.mod=300,75,1

	_GT_aim_protex_main._G_plyr_aim_f = menu.add_feature("Font", "autoaction_value_i", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_aim_f.max,_GT_aim_protex_main._G_plyr_aim_f.min,_GT_aim_protex_main._G_plyr_aim_f.mod=9,0,1

	_GT_aim_protex_main._G_plyr_aim_cr = menu.add_feature("Red", "autoaction_value_i", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_aim_cr.max,_GT_aim_protex_main._G_plyr_aim_cr.min,_GT_aim_protex_main._G_plyr_aim_cr.mod=255,0,15

	_GT_aim_protex_main._G_plyr_aim_cg = menu.add_feature("Green", "autoaction_value_i", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_aim_cg.max,_GT_aim_protex_main._G_plyr_aim_cg.min,_GT_aim_protex_main._G_plyr_aim_cg.mod=255,0,15

	_GT_aim_protex_main._G_plyr_aim_cb = menu.add_feature("Blue", "autoaction_value_i", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_aim_cb.max,_GT_aim_protex_main._G_plyr_aim_cb.min,_GT_aim_protex_main._G_plyr_aim_cb.mod=255,0,15

	_GT_aim_protex_main._G_plyr_aim_a = menu.add_feature("Alpha", "autoaction_value_i", _G_AimProtex.id, function()
	end) _GT_aim_protex_main._G_plyr_aim_a.max,_GT_aim_protex_main._G_plyr_aim_a.min,_GT_aim_protex_main._G_plyr_aim_a.mod=255,30,15

	function _GF_plyr_aim_overlay_hide(_bool)
	_GT_aim_protex_main._G_plyr_aim_spc.hidden=_bool
	_GT_aim_protex_main._G_aim_notif_test.hidden=_bool
	_GT_aim_protex_main._G_plyr_aim_x.hidden=_bool
	_GT_aim_protex_main._G_plyr_aim_y.hidden=_bool
	_GT_aim_protex_main._G_plyr_aim_s.hidden=_bool
	_GT_aim_protex_main._G_plyr_aim_f.hidden=_bool
	_GT_aim_protex_main._G_plyr_aim_cr.hidden=_bool
	_GT_aim_protex_main._G_plyr_aim_cg.hidden=_bool
	_GT_aim_protex_main._G_plyr_aim_cb.hidden=_bool
	_GT_aim_protex_main._G_plyr_aim_a.hidden=_bool
	end
	_GF_plyr_aim_overlay_hide(true)

	function _GF_plyr_aim_overlay_recc()
	_GT_aim_protex_main._G_plyr_aim_spc.value=18
	_GT_aim_protex_main._G_plyr_aim_x.value=229
	_GT_aim_protex_main._G_plyr_aim_y.value=23
	_GT_aim_protex_main._G_plyr_aim_s.value=277
	_GT_aim_protex_main._G_plyr_aim_f.value=9
	_GT_aim_protex_main._G_plyr_aim_cr.value=255
	_GT_aim_protex_main._G_plyr_aim_cg.value=0
	_GT_aim_protex_main._G_plyr_aim_cb.value=0
	_GT_aim_protex_main._G_plyr_aim_a.value=255
	end
	_GF_plyr_aim_overlay_recc()
	
	
	
	
	
-------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------Show player list
-------------------------------------------------------------------------------------------------
_G_plyrs_overlay_main = {}
_G_plyrs_overlay_main.sort_parent = menu.add_feature("Sort list", "parent", _G_Player_Overlay.id)
_G_plyrs_overlay_main.show_info_parent = menu.add_feature("Select info", "parent", _G_Player_Overlay.id)
_G_plyrs_overlay_main.display_parent = menu.add_feature("Display options", "parent", _G_Player_Overlay.id)
_G_plyrs_overlay_main.sort_parent_left = menu.add_feature("Order of info on left", "parent", _G_plyrs_overlay_main.sort_parent.id)
_G_plyrs_overlay_main.sort_parent_right = menu.add_feature("Order of info on right", "parent", _G_plyrs_overlay_main.sort_parent.id)
_G_plyrs_overlay_main.text_dots = "..."
_G_plyrs_overlay_main.popo_rb=false
_G_plyrs_overlay_main.sort_bool=false

_G_plyrs_overlay_main.alpha_str = {"Fade"}
for i=1,42 do
	_G_plyrs_overlay_main.alpha_str[#_G_plyrs_overlay_main.alpha_str+1]=(50+((i-1)*5))
end

_G_plyrs_overlay_main.dist_table = {}
_G_plyrs_overlay_main.plyr_list_dist_feat=menu.add_feature("Show player dist HIDDEN", "toggle", _G_Player_Overlay.id, function(f)
	local my_pos = player.get_player_coords(player.player_id())
	local time = utils.time_ms()
	local check = false
	while f.on do
		system.yield(50)
		if time < utils.time_ms() and not _GF_in_grid(player.get_player_coords(player.player_id()),my_pos,2) then
			my_pos = player.get_player_coords(player.player_id())
			time = utils.time_ms()+500
			check = true
		end
		for i=1,32 do
			if _GF_valid_pid(i-1) then
				if _G_plyrs_overlay_main.dist_table[i] == nil or _G_plyrs_overlay_main.dist_table[i][1] == 10000 then
					_G_plyrs_overlay_main.dist_table[i]={_GF_dist_me_pid(i-1),player.get_player_coords(i-1),i-1}
				elseif i-1 == player.player_id() then
					_G_plyrs_overlay_main.dist_table[i]={0,player.get_player_coords(i-1),i-1}
				elseif check or not _GF_in_grid(player.get_player_coords(i-1),_G_plyrs_overlay_main.dist_table[i][2],2) then
					_G_plyrs_overlay_main.dist_table[i]={_GF_dist_me_pid(i-1),player.get_player_coords(i-1),i-1}
					system.yield(3)
				end
				system.yield(3)
			else
				_G_plyrs_overlay_main.dist_table[i]={10000,v3(0,0,0),i-1}
				system.yield(3)
			end
		end
		check = false
	end
end)
_G_plyrs_overlay_main.plyr_list_dist_feat.hidden=true
_G_plyrs_overlay_main.plyr_list_dist_feat.on=true

_G_plyrs_overlay_main.plyr_info_table = {}
function _G_plyrs_overlay_main.table_default(i)
	_G_plyrs_overlay_main.plyr_info_table[i] = {
	false, 	--do it
	0,		-- PID
	"",		-- name
	0,		--distance
	0,		-- kd
	0,		-- money
	0,		-- rank
	0,		-- time in session
	0,		-- host priority
	-1,		-- color
	false,	-- same color
	false,	-- 12 friend
	false,	-- 13 interior
	false,	-- 14 invisible
	}
end

_G_plyrs_overlay_main.blink = {
false, -- otr
false, -- dead
false, -- mod spec
false, -- invis
}

_G_plyrs_overlay_main.team_rgb = {
{255,255,255},-- table 1  == -1  -- white   gta reports org color as -1 when not in org/mc and momentarily when in org/mc
{247,159,123},-- table 2  ==  0  -- orange
{226,134,187},-- table 3  ==  1  -- pink
{239,238,151},-- table 4  ==  2  -- yellow
{113,169,175},-- table 5  ==  3  -- teal blue/green
{160,140,193},-- table 6  ==  4  -- purple
{141,206,167},-- table 7  ==  5  -- light green
{181,214,234},-- table 8  ==  6  -- light blue
{178,144,132},-- table 9  ==  7  -- brown
{0,  132,114},-- table 10 ==  8  -- dark green
{216,85,117},-- table 11 ==  9  -- hot pink
{255,255,255}-- table 12 == 10  -- I havent seen this as an org/mc color but without this slot here i will get an error
}

function _G_plyrs_overlay_main.plyr_rgb(_pidT,_val)
	if _GF_is_a_num(_pidT) and _pidT > 0 then
		if _val == "r" then
			return _G_plyrs_overlay_main.team_rgb[_GT_plyr_info.color[_pidT]+2][1]
		elseif _val == "g" then
			return _G_plyrs_overlay_main.team_rgb[_GT_plyr_info.color[_pidT]+2][2]
		elseif _val == "b" then
			return _G_plyrs_overlay_main.team_rgb[_GT_plyr_info.color[_pidT]+2][3]
		end
		return _G_plyrs_overlay_main.team_rgb[_GT_plyr_info.color[_pidT]+2][1],_G_plyrs_overlay_main.team_rgb[_GT_plyr_info.color[_pidT]+2][2],_G_plyrs_overlay_main.team_rgb[_GT_plyr_info.color[_pidT]+2][3]
	end
	if _val ~= nil then
		return 255
	end
	return 255,255,255
end

function _GF_police_colors(_r,_g,_b,_wntd)
	if _wntd and _G_plyrs_overlay_main.plyr_sort_wanted.on and _G_plyrs_overlay_main.plyr_sort_wanted.value ~= 0 then
		if _G_plyrs_overlay_main.popo_rb == true then
			return	235,36,39
		elseif _G_plyrs_overlay_main.popo_rb == false then
			return 38,136,234
		end
	end
	return _r,_g,_b
end

function _G_plyrs_overlay_main.plyr_info_do(pidT,_pid,dead,frnd,_int,_wntd,_otr)
	local _table = _G_plyrs_overlay_main.plyr_sort_left.list
	local plyr_info = ""
	local host = player.is_player_host(_pid)
	local s_host = (script.get_host_of_this_script()==_pid)
	local its_me = (_pid == player.player_id())
	--local count,brckt1,brckt2 = 1
	if _GT_plyr_info.typing[pidT]==true then
		plyr_info=plyr_info.._G_plyrs_overlay_main.text_dots
	end
	-- local function brckt(_val)
		-- if _GF_is_even_num(_val) then
			-- return " {","}"
		-- end
		-- return " [","]"
	-- end
		-- just here for testing
		 --plyr_info=plyr_info.."   {{"..tostring(interior.get_interior_from_entity(player.get_player_ped(_pid))).."}}   "
		-- plyr_info=plyr_info.."   {{"..tostring(ui.get_blip_from_entity(player.get_player_ped(_pid))).."}}   "
	for i=1,9 do
		--brckt1,brckt2 = brckt(count)
		if _table[i] == 1 and _GT_plyr_info.pause[pidT]==true then
			plyr_info=plyr_info.." [".."Pause".."]"
			--count = count + 1
		elseif _table[i] == 2 and _GF_mission_active(_pid) then
			plyr_info=plyr_info.." [".."On Mission".."]"
			--count = count + 1
		elseif _table[i] == 3 and _int then
			plyr_info=plyr_info.." [".._GT_plyr_info.interior_str[pidT].."]"
			--count = count + 1
		elseif _table[i] == 4 and _wntd and _G_plyrs_overlay_main.plyr_sort_wanted.on and _G_plyrs_overlay_main.plyr_sort_wanted.value ~= 1 then
			plyr_info=plyr_info.." ["..player.get_player_wanted_level(_pid).." STAR".."]"
			--count = count + 1
		elseif _table[i] == 5 then
			if _GT_plyr_info.loading[pidT] then 
				plyr_info=plyr_info.." [".."LOADING".."]"
				--count = count + 1
			elseif dead or player.get_player_max_health(_pid) == 0.0 then
				if player.get_player_max_health(_pid) == 0.0 then
					plyr_info=plyr_info.." [".."UN-DEAD".."]"
				else
					plyr_info=plyr_info.." [".."DEAD".."]"
					--count = count + 1
				end
			end
		elseif _table[i] == 6 then
			if host or s_host or frnd or its_me then
				plyr_info=plyr_info.." [".." "
				if host then plyr_info=plyr_info.."H" end
				if s_host then plyr_info=plyr_info.."S" end
				if frnd then plyr_info=plyr_info.."F" end
				if its_me then plyr_info=plyr_info.."Y" end
				plyr_info=plyr_info.." ".."]"
				--count = count + 1
			end
		elseif _table[i] == 7 and _otr and not _GT_plyr_info.loading[pidT] then
			plyr_info=plyr_info.." [".."OTR ".._GF_time_M_S_str(_GT_plyr_info.otr_time[pidT]).."]"
			--count = count + 1
		elseif _table[i] == 8 and _G_plyrs_overlay_main.plyr_sort_tis.on then
			plyr_info=plyr_info.." [".._GF_time_M_S_str(_GT_plyr_info.join_time[pidT]).."]"
			--count = count + 1
		elseif _table[i] == 9 and _G_plyrs_overlay_main.plyr_sort_rank.on then
			plyr_info=plyr_info.." [".._GT_plyr_info.rank[pidT].."]"
			--count = count + 1
		end


	end
	return plyr_info
end
----------------------------------------------------------------------------------------------sort left
_G_plyrs_overlay_main.plyr_sort_left = {}
_G_plyrs_overlay_main.plyr_sort_left.list = {1,2,3,4,5,6,7,8,9}
_G_plyrs_overlay_main.plyr_sort_left.str = {
"Pause",			--1
"On Mission",		--2
"Interior",			--3
"Wanted",			--4
"Loading/Dead",		--5
"Host/Friend",		--6
"Off the radar",	--7
"Time in session",	--8
"Rank"}				--9

function _G_plyrs_overlay_main.plyr_sort_left_do(_feat,_bool)
	local msg,_value = ""
	local _val_table = {}
	local _feat_table = {}
	for i=1,9 do
		if _G_plyrs_overlay_main.plyr_sort_left[i].name == _feat.name then
			_value = _feat.value
			_feat_table[i]=true
			break
		end
	end
	for i=1,9 do
		_val_table[i] = _G_plyrs_overlay_main.plyr_sort_left[i].value
	end
	for feat=1,9 do
		if not _feat_table[feat] then
			for i=1,9 do
				if not _feat_table[i] then
					if _G_plyrs_overlay_main.plyr_sort_left[i].value == _value then
						for ii=0,8 do
							if not _GF_table_has(_val_table,ii) then
								_G_plyrs_overlay_main.plyr_sort_left[i].value = ii
								_val_table[#_val_table+1] = ii
								_feat_table[i]=true
								break
							end
						end
					end
				end
			end
		end
	end
	for i=1,9 do		
		_G_plyrs_overlay_main.plyr_sort_left.list[i] = _G_plyrs_overlay_main.plyr_sort_left[i].value+1
		msg = msg..i.." - ".._G_plyrs_overlay_main.plyr_sort_left.str[_G_plyrs_overlay_main.plyr_sort_left[i].value+1].."\n"
	end
	if _bool then
		menu.notify("Player info overlay left sorted to:\n"..msg,_G_GeeVer,5)
	end
end

for i=1,9 do 
	_G_plyrs_overlay_main.plyr_sort_left[i]=menu.add_feature("Left info slot #"..i, "action_value_str", _G_plyrs_overlay_main.sort_parent_left.id,function(f)
		_G_plyrs_overlay_main.plyr_sort_left_do(_G_plyrs_overlay_main.plyr_sort_left[i],true)
	end)
	_G_plyrs_overlay_main.plyr_sort_left[i]:set_str_data(_G_plyrs_overlay_main.plyr_sort_left.str)
	_G_plyrs_overlay_main.plyr_sort_left[i].value = i-1
end

_G_plyrs_overlay_main.plyr_sort_left.default_feat=menu.add_feature("Left info slots default", "action", _G_plyrs_overlay_main.sort_parent_left.id,function(f)
	_G_plyrs_overlay_main.plyr_sort_left.list = {1,2,3,4,5,6,7,8,9}
	local msg = ""
	for i=1,9 do
		_G_plyrs_overlay_main.plyr_sort_left[i].value = i-1
		msg = msg..i.." - ".._G_plyrs_overlay_main.plyr_sort_left.str[_G_plyrs_overlay_main.plyr_sort_left[i].value+1].."\n"
	end
	menu.notify("Player info overlay left sorted to:\n"..msg,_G_GeeVer,5)
end)
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------sort right
_G_plyrs_overlay_main.plyr_sort_right = {}
_G_plyrs_overlay_main.plyr_sort_right.list = {1,2,3,4,5}
_G_plyrs_overlay_main.plyr_sort_right.str = {
"Name",
"Money",
"KD",
"Vehicle",
"Speed"
}

function _G_plyrs_overlay_main.plyr_sort_right_do(_feat,_bool)
	local msg,_value = ""
	local _val_table = {}
	local _feat_table = {}
	for i=1,5 do
		if _G_plyrs_overlay_main.plyr_sort_right[i].name == _feat.name then
			_value = _feat.value
			_feat_table[i]=true
			break
		end
	end
	for i=1,5 do
		_val_table[i] = _G_plyrs_overlay_main.plyr_sort_right[i].value
	end
	for feat=1,5 do
		if not _feat_table[feat] then
			for i=1,5 do
				if not _feat_table[i] then
					if _G_plyrs_overlay_main.plyr_sort_right[i].value == _value then
						for ii=0,4 do
							if not _GF_table_has(_val_table,ii) then
								_G_plyrs_overlay_main.plyr_sort_right[i].value = ii
								_val_table[#_val_table+1] = ii
								_feat_table[i]=true
								break
							end
						end
					end
				end
			end
		end
	end
	for i=1,5 do		
		_G_plyrs_overlay_main.plyr_sort_right.list[i] = _G_plyrs_overlay_main.plyr_sort_right[i].value+1
		msg = msg..i.." - ".._G_plyrs_overlay_main.plyr_sort_right.str[_G_plyrs_overlay_main.plyr_sort_right[i].value+1].."\n"
	end
	if _bool then
		menu.notify("Player info overlay right sorted to:\n"..msg,_G_GeeVer,5)
	end
end

for i=1,5 do 
	_G_plyrs_overlay_main.plyr_sort_right[i]=menu.add_feature("Right info slot #"..i, "action_value_str", _G_plyrs_overlay_main.sort_parent_right.id,function(f)
		_G_plyrs_overlay_main.plyr_sort_right_do(_G_plyrs_overlay_main.plyr_sort_right[i],true)
	end)
	_G_plyrs_overlay_main.plyr_sort_right[i]:set_str_data(_G_plyrs_overlay_main.plyr_sort_right.str)
	_G_plyrs_overlay_main.plyr_sort_right[i].value = i-1
end

_G_plyrs_overlay_main.plyr_sort_right.default_feat=menu.add_feature("Right info slots default", "action", _G_plyrs_overlay_main.sort_parent_right.id,function(f)
	_G_plyrs_overlay_main.plyr_sort_right.list = {1,2,3,4,5}
	local msg = ""
	for i=1,5 do
		_G_plyrs_overlay_main.plyr_sort_right[i].value = i-1
		msg = msg..i.." - ".._G_plyrs_overlay_main.plyr_sort_right.str[_G_plyrs_overlay_main.plyr_sort_right[i].value+1].."\n"
	end
	menu.notify("Player info overlay right sorted to:\n"..msg,_G_GeeVer,5)
end)
----------------------------------------------------------------------------------------------
function _G_plyrs_overlay_main.rgb_do(mod_spec,frnd,dead,otr,r,g,b,popo,_wntd,_invis)
	local _r,_g,_b = r,g,b
	if _invis and _G_plyrs_overlay_main.blink[4] then
		_r,_g,_b = 255,192,203
	elseif mod_spec and _G_plyrs_overlay_main.blink[3] then
		_r,_g,_b =  255,0,0
	elseif frnd and not dead and not otr then
		_r,_g,_b =  255,255,0
	elseif dead and _G_plyrs_overlay_main.blink[2] then
		_r,_g,_b =  0,0,0
	elseif otr and _G_plyrs_overlay_main.blink[1] then
		_r,_g,_b =  0,255,0
	end
	if popo then _r,_g,_b = _GF_police_colors(_r,_g,_b,_wntd) end
	return _r,_g,_b
end

function _G_plyrs_overlay_main.god_mod_do(_pid,_int,_invis)
	local god_mod_text=""
	local gm_table = {}
	if not _int and _GT_plyr_info.plyr_god[_pid+1] then
		gm_table[#gm_table+1]="G"
	end
	if not _int and (_GT_plyr_info.in_veh[_pid+1] and _GT_plyr_info.veh_god[_pid+1]) then
		gm_table[#gm_table+1]="VG"
	end
	if _GT_plyr_info.modder[_pid+1] then
		gm_table[#gm_table+1]="M"
	end
	if not _int and _invis then
		gm_table[#gm_table+1]="IV"
	end
	if #gm_table > 0 then
		god_mod_text=god_mod_text.."["
		for i=1,#gm_table do
			god_mod_text=god_mod_text..gm_table[i]
			if gm_table[i+1] == "IV" then
				god_mod_text=god_mod_text.." "
			end
		end
		god_mod_text=god_mod_text.."]"
	end
	
	-- local plyr_g = _GT_plyr_info.plyr_god[_pid+1]
	-- local veh_g = (_GT_plyr_info.in_veh[_pid+1] and _GT_plyr_info.veh_god[_pid+1])
	-- local plyr_m = _GT_plyr_info.modder[_pid+1]
	-- if not _int and (plyr_g or veh_g) then
		-- god_mod_text=god_mod_text.."["
		-- if plyr_m then god_mod_text=god_mod_text.."M" end
		-- if plyr_g then god_mod_text=god_mod_text.."G" end
		-- if veh_g then god_mod_text=god_mod_text.."V" end
		-- god_mod_text=god_mod_text.."]"
	-- elseif plyr_m then god_mod_text=god_mod_text.."[M]"
	-- end
	return god_mod_text
end

function _G_plyrs_overlay_main.name_do(_pid,pidT,dead) 
	local name,mod_spec ="",false
	local count,brckt1,brckt2 = 1
	local r,g,b = _G_plyrs_overlay_main.plyr_rgb(pidT)
	local _table = _G_plyrs_overlay_main.plyr_sort_right.list
	-- local function brckt(_val)
		-- if _GF_is_even_num(_val) then
			-- return " {","}"
		-- end
		-- return " [","]"
	-- end
	for i=1,5 do
		--brckt1,brckt2 = brckt(count)
		if _table[i] == 1 then name=name.." ".._GT_plyr_info.name[pidT] count = count + 1 end
		if _table[i] == 2 and _G_plyrs_overlay_main.plyr_sort_money.on then name=name.." [".._GF_plyr_money_str(_pid).."]" count = count + 1 end
		if _table[i] == 3 and _G_plyrs_overlay_main.plyr_sort_kd.on then name=name.." [".."KD ".._GT_plyr_info.kd[pidT].."]" count = count + 1 end
		if _table[i] == 4 and _GT_plyr_info.in_veh[pidT] and _G_plyrs_overlay_main.plyr_sort_veh.on then name=name.." [".._GF_model_name(_GT_plyr_info.veh[pidT]).."]" count = count + 1 end
		if _table[i] == 5 then
			if (_G_plyrs_overlay_main.plyr_sort_speed_veh.on and _GT_plyr_info.in_veh[pidT]) or (_G_plyrs_overlay_main.plyr_sort_speed_ped.on and not _GT_plyr_info.in_veh[pidT]) then 
				if _G_plyrs_overlay_main.plyr_sort_speed_type.value == 0 and _GT_plyr_info.plyr_speed_pos_mph[pidT] > _G_plyrs_overlay_main.plyr_sort_speed_above.value then 
					if _GT_plyr_info.plyr_speed_pos_mph[pidT] < 5 then
						name=name.." [".._GF_1_decimal(_GT_plyr_info.plyr_speed_pos_mph[pidT]).." MPH".."]"
					else
						name=name.." ["..math.floor(_GT_plyr_info.plyr_speed_pos_mph[pidT]).." MPH".."]"
					end
					count = count + 1
				elseif _G_plyrs_overlay_main.plyr_sort_speed_type.value == 1 and _GT_plyr_info.plyr_speed_pos_kph[pidT] > _G_plyrs_overlay_main.plyr_sort_speed_above.value then
					if _GT_plyr_info.plyr_speed_pos_kph[pidT] < 5 then
						name=name.." [".._GF_1_decimal(_GT_plyr_info.plyr_speed_pos_kph[pidT]).." KPH".."]"
					else
						name=name.." ["..math.floor(_GT_plyr_info.plyr_speed_pos_kph[pidT]).." KPH".."]"
					end
					count = count + 1
				end
			end
		end
	end
	if player.is_player_spectating(_pid) then
		-- local spctee =  network.get_player_player_is_spectating(_pid)
		-- if spctee ~= nil and _GT_plyr_info.name[spctee+1] ~= nil then
		
		local spctee = network.get_entity_player_is_spectating(_pid)
		if _GF_is_ent(spctee) and entity.is_entity_a_ped(spctee) and ped.is_ped_a_player(spctee) then
			spctee = player.get_player_from_ped(spctee)
			if not _GT_plyr_info.interior[pidT] and not dead then mod_spec = true name=name.." - MODDED SPECTATE: "
			else name=name.." - Specating: " end
			name=name.._GT_plyr_info.name[spctee+1]
		end
	end
	if _GT_plyr_info.typing[pidT]==true then name=name.._G_plyrs_overlay_main.text_dots end
	return name,r,g,b,mod_spec
end



_G_plyrs_overlay_main.plyr_list_feat=menu.add_feature("Show player list", "toggle", _G_Player_Overlay.id, function(f)
	while not _G_GS_has_loaded do
		system.yield(500)
	end
	_G_plyrs_overlay_main.plyr_sort_left_do(_G_plyrs_overlay_main.plyr_sort_left[1],false)
	_GF_nearby_plyr_overlay_hide(_GF_opp_bool(f.on))
	_G_plyrs_overlay_main.plyr_list_record_feat.on=f.on
	_G_plyrs_overlay_main.popo_rb_feat.on=f.on
	_G_plyrs_overlay_main.blink_do.on=f.on
	local max_count,count,y_val, y_offset,x_pos,y_once,y_off_once,more_players_once,dist_offset,god_offset
	local r,g,b,plyr_info_offset,plyr_info,_dead,_otr,_frnd,mod_spec,god_mod_text,name,_pid,_pidT,_int,_table
	local alpha_switch,alpha_calc,alpha_fade,alpha,alpha_speed,_invis = true,100,100,255
	while f.on do
		system.yield(5)
		if _G_plyrs_overlay_main.plyr_sort_int_alpha.value == 0 then
			
			if alpha_switch then 
				alpha_calc = alpha_calc *(1.001+(_G_plyrs_overlay_main.plyr_sort_int_alpha_speed.value/1000))
				if alpha_calc >= 220 then alpha_switch = false end
			else
				alpha_calc = alpha_calc *(.999-(_G_plyrs_overlay_main.plyr_sort_int_alpha_speed.value/1000))
				if alpha_calc <= 150 then alpha_switch = true end
			end
			alpha_fade=math.floor(alpha_calc)
		else
			alpha_fade = _G_plyrs_overlay_main.alpha_str[_G_plyrs_overlay_main.plyr_sort_int_alpha.value+1]
		end
		_table = {}
		for i=1,32 do
			if _G_plyrs_overlay_main.plyr_info_table[i] ~= nil and _G_plyrs_overlay_main.plyr_info_table[i][1] and player.is_player_valid(_G_plyrs_overlay_main.plyr_info_table[i][2]) and player.get_player_name(_G_plyrs_overlay_main.plyr_info_table[i][2]) == _G_plyrs_overlay_main.plyr_info_table[i][3] then
				_table[#_table+1] = _G_plyrs_overlay_main.plyr_info_table[i]
			end
		end
		if #_table < 1 then
			system.yield(250)
		else
			max_count = _G_plyrs_overlay_main.plyr_sort_max.value
			count = 0
			y_once,y_off_once,more_players_once=false,false,false
			y_val = _G_plyrs_overlay_main.plyr_sort_y.value
			y_offset = _G_plyrs_overlay_main.plyr_sort_space_ver.value
			for i=1,#_table do
				if count < max_count then
					x_pos = _G_plyrs_overlay_main.plyr_sort_x.value
					if _G_plyrs_overlay_main.plyr_sort_column_space.on then
						if (_G_plyrs_overlay_main.plyr_sort_column_type.value == 0 and i > _GF_round_num(max_count/2)) or (_G_plyrs_overlay_main.plyr_sort_column_type.value == 1 and i > _GF_round_num(#_table/2)) then
							x_pos=x_pos+_G_plyrs_overlay_main.plyr_sort_column_space.value
							if not y_once then
								y_val = _G_plyrs_overlay_main.plyr_sort_y.value
								y_once=true
							end
						end
					end
					if i > 1 then
						if y_once and not y_off_once then y_off_once=true else y_val = y_val + y_offset	end
					end
					dist_offset = x_pos-(_G_plyrs_overlay_main.plyr_sort_space_hor.value/4*3)
					plyr_info_offset = dist_offset-.5
					--god_offset = x_pos-((x_pos-dist_offset)*(_G_plyrs_overlay_main.plyr_sort_space_hor.value/25))
					god_offset = x_pos-(_G_plyrs_overlay_main.plyr_sort_space_hor.value/4.69)
					
					_pid,_pidT = _table[i][2],_table[i][2]+1
					_otr = (_GT_plyr_info.otr_time[_pidT] ~= -1)
					_dead = _GT_plyr_info.dead[_pidT]
					_frnd = _table[i][12]
					_int = _GT_plyr_info.interior[_pidT]
					_wntd = (player.get_player_wanted_level(_pid) > 0)
					_invis = _GT_plyr_info.invisible[_pidT]
					if _int then alpha = alpha_fade else alpha = 255 end

					-- on mission,loading,time in session, off the radar etc --
					plyr_info = _G_plyrs_overlay_main.plyr_info_do(_pidT,_pid,_dead,_frnd,_int,_wntd,_otr)
					r,g,b = _G_plyrs_overlay_main.rgb_do(false,_frnd,_dead,_otr,255,255,255,true,_wntd,_invis)
					_GF_overlay_right(plyr_info,r,g,b,alpha,_G_plyrs_overlay_main.plyr_sort_scale.value/300,_G_plyrs_overlay_main.plyr_sort_font.value,plyr_info_offset/300,y_val/300,(plyr_info_offset-20)/300)
					
					-- distance --
					_GF_overlay_left(math.floor(_G_plyrs_overlay_main.dist_table[_pid+1][1]),r,g,b,alpha,_G_plyrs_overlay_main.plyr_sort_scale.value/300,_G_plyrs_overlay_main.plyr_sort_font.value,dist_offset/300,y_val/300)
					
					-- god or mod --
					god_mod_text = _G_plyrs_overlay_main.god_mod_do(_pid,_int,_invis)
					if god_mod_text ~= "" then
						r,g,b = _G_plyrs_overlay_main.rgb_do(false,false,_dead,false,255,0,0,false,false,_invis)
						_GF_overlay(god_mod_text,r,g,b,alpha,_G_plyrs_overlay_main.plyr_sort_scale.value/300,_G_plyrs_overlay_main.plyr_sort_font.value,god_offset/300,y_val/300,(god_offset-20)/300)
					end
					
					-- name,vehicle,kd,money,etc
					name,r,g,b,mod_spec = _G_plyrs_overlay_main.name_do(_pid,_pidT,_dead)
					r,g,b = _G_plyrs_overlay_main.rgb_do(mod_spec,false,_dead,false,r,g,b,false,false,false)
					_GF_overlay_left(name,r,g,b,alpha,_G_plyrs_overlay_main.plyr_sort_scale.value/300,_G_plyrs_overlay_main.plyr_sort_font.value,x_pos/300,y_val/300)
					count=count+1
				elseif count == max_count and count < #_table and not more_players_once then
					y_val = y_val + y_offset
					more_players = tostring(#_table-count)
					if #_table-count > 1 then more_players=more_players.." players hidden"	else more_players=more_players.." player hidden" end
					_GF_overlay_left(more_players,255,255,255,150,_G_plyrs_overlay_main.plyr_sort_scale.value/300,_G_plyrs_overlay_main.plyr_sort_font.value,x_pos/300,y_val/300)
					more_players_once=true
				end
			end
		end
	end
	_GF_nearby_plyr_overlay_hide(_GF_opp_bool(f.on))
	_G_plyrs_overlay_main.plyr_list_record_feat.on=f.on
	_G_plyrs_overlay_main.popo_rb_feat.on=f.on
	_G_plyrs_overlay_main.blink_do.on=f.on
end)

_G_plyrs_overlay_main.plyr_list_record_feat=menu.add_feature("Show player list HIDDEN", "toggle", _G_Player_Overlay.id, function(f)
	local top_table,other_table,end_table
	local function color_check(mine,theirs)
		if mine > -1 and theirs > -1 and mine == theirs then
			return true
		end
		return false
	end
	local function sort_for_top(_table,_val)
		top_table,other_table,bottom_table,end_table = {},{},{},{}
		for i=1,32 do
			if _G_plyrs_overlay_main.plyr_sort_interior.on and _table[i][13] then
				bottom_table[#bottom_table+1]=_table[i]
			elseif _val == 0 then
				if _table[i][12] then
					top_table[#top_table+1]=_table[i]
				else
					other_table[#other_table+1]=_table[i]
				end
			else
				if _table[i][11] then
					top_table[#top_table+1]=_table[i]
				else
					other_table[#other_table+1]=_table[i]
				end
			end
		end
		if #top_table > 0 then
			if #top_table > 1 then
				_G_plyrs_overlay_main.sort_do(top_table,_G_plyrs_overlay_main.plyr_sort_by_val.value)
			end
			for i=1,#top_table do
				end_table[#end_table+1]=top_table[i]
			end
		end
		if #other_table > 0 then
			if #other_table > 1 then
				_G_plyrs_overlay_main.sort_do(other_table,_G_plyrs_overlay_main.plyr_sort_by_val.value)
			end
			for i=1,#other_table do
				end_table[#end_table+1]=other_table[i]
			end
		end
		if #bottom_table > 0 then
			if #bottom_table > 1 then
				_G_plyrs_overlay_main.sort_do(bottom_table,_G_plyrs_overlay_main.plyr_sort_by_val.value)
			end
			for i=1,#bottom_table do
				end_table[#end_table+1]=bottom_table[i]
			end
		end
		return end_table
	end
	local function sort_for_bottom(_table)
		other_table,bottom_table,end_table = {},{},{}
		for i=1,32 do
			if _table[i][13] then
				bottom_table[#bottom_table+1]=_table[i]
			else
				other_table[#other_table+1]=_table[i]
			end
		end
		if #other_table > 0 then
			if #other_table > 1 then
				_G_plyrs_overlay_main.sort_do(other_table,_G_plyrs_overlay_main.plyr_sort_by_val.value)
			end
			for i=1,#other_table do
				end_table[#end_table+1]=other_table[i]
			end
		end
		if #bottom_table > 0 then
			if #bottom_table > 1 then
				_G_plyrs_overlay_main.sort_do(bottom_table,_G_plyrs_overlay_main.plyr_sort_by_val.value)
			end
			for i=1,#bottom_table do
				end_table[#end_table+1]=bottom_table[i]
			end
		end
		return end_table
	end
    while f.on do
		_G_plyrs_overlay_main.sort_bool=false
		for i=1,32 do
			if _GF_valid_pid(i-1) and (_G_plyrs_overlay_main.plyr_sort_self.on or i-1 ~= player.player_id()) then
				_G_plyrs_overlay_main.plyr_info_table[i] = {
					true, 											-- 1  do it
					i-1,											-- 2  PID
					_GT_plyr_info.name[i],							-- 3  name
					_G_plyrs_overlay_main.dist_table[i][1],			-- 4  distance
					_GT_plyr_info.kd[i],							-- 5  kd
					_GT_plyr_info.money[i],							-- 6  money
					_GT_plyr_info.rank[i],							-- 7  rank
					utils.time()-_GT_plyr_info.join_time[i],		-- 8  time in session
					player.get_player_host_priority(i-1),			-- 9  host priority
					_GT_plyr_info.color[i],							-- 10 color
					color_check(_GT_plyr_info.color[player.player_id()+1],_GT_plyr_info.color[i]),	-- 11 same org/mc
					player.is_player_friend(i-1),					-- 12 friend
					_GT_plyr_info.interior[i],						-- 13 interior
				}
			else
				_G_plyrs_overlay_main.table_default(i)
			end
		end
		if _G_plyrs_overlay_main.plyr_sort_top.on then
			_G_plyrs_overlay_main.plyr_info_table = sort_for_top(_G_plyrs_overlay_main.plyr_info_table,_G_plyrs_overlay_main.plyr_sort_top.value)
		elseif _G_plyrs_overlay_main.plyr_sort_interior.on then
			_G_plyrs_overlay_main.plyr_info_table = sort_for_bottom(_G_plyrs_overlay_main.plyr_info_table)
		else
			_G_plyrs_overlay_main.sort_do(_G_plyrs_overlay_main.plyr_info_table,_G_plyrs_overlay_main.plyr_sort_by_val.value)
		end
		_GF_yield_while_true(f.on and (_G_plyrs_overlay_main.sort_bool==false),250)
	end
end)
_G_plyrs_overlay_main.plyr_list_record_feat.hidden=true

function _G_plyrs_overlay_main.sort_do(_table,_val)
	if _val == 1 then -- alphabetical
		if  _G_plyrs_overlay_main.plyr_sort_asc_desc.value == 0 then table.sort(_table, function(a, b) return a[3]:lower() < b[3]:lower() end)  -- thank you mr kek
		else table.sort(_table, function(a, b) return a[3]:lower() > b[3]:lower() end)  -- thank you mr kek
		end
	elseif _val == 2 then -- distance
		if  _G_plyrs_overlay_main.plyr_sort_asc_desc.value == 0 then table.sort(_table, function(a, b) return a[4] < b[4] end)
		else table.sort(_table, function(a, b) return a[4] > b[4] end)
		end
	else -- other
		if _G_plyrs_overlay_main.plyr_sort_asc_desc.value == 0 then
			table.sort(_table, function(a, b) 
				if a[_val+2] == b[_val+2] then return a[4] < b[4]
				else return a[_val+2] < b[_val+2]
				end
			end)
		else 
			table.sort(_table, function(a, b) 
				if a[_val+2] == b[_val+2] then return a[4] > b[4]
				else return a[_val+2] > b[_val+2]
				end
			end)
		end
	end
end
		
_G_plyrs_overlay_main.blink_do=menu.add_feature("hidden - makes blinks, blink, and dots, dot", "toggle", _G_Player_Overlay.id, function(f)
	while f.on do
		system.yield(50)
		_G_plyrs_overlay_main.text_dots="..."
		for i=1,10 do
			if i < 5 then
				_G_plyrs_overlay_main.blink[i]=true
				_GF_yield_while_true(f.on,100)
				_G_plyrs_overlay_main.text_dots=_G_plyrs_overlay_main.text_dots.."."
				_G_plyrs_overlay_main.blink[i]=false
				_GF_yield_while_true(f.on,100)
				_G_plyrs_overlay_main.text_dots=_G_plyrs_overlay_main.text_dots.."."
			else
				_G_plyrs_overlay_main.text_dots=_G_plyrs_overlay_main.text_dots.."."
				_GF_yield_while_true(f.on,25)
			end
		end		
	end
end)
_G_plyrs_overlay_main.blink_do.hidden=true

_G_plyrs_overlay_main.popo_rb_feat=menu.add_feature("hidden - makes police colrs flash", "toggle", _G_Player_Overlay.id, function(f)
	while f.on do
		for i=1,4 do
			_G_plyrs_overlay_main.popo_rb=true
			_GF_yield_while_true(f.on,125)
			_G_plyrs_overlay_main.popo_rb=false
			_GF_yield_while_true(f.on,225)
		end
		_G_plyrs_overlay_main.popo_rb=nil
		_GF_yield_while_true(f.on,1000)
	end
end)
_G_plyrs_overlay_main.popo_rb_feat.hidden=true

_G_plyrs_overlay_main.plyr_sort_by_val=menu.add_feature("Player list sort by:", "autoaction_value_str", _G_plyrs_overlay_main.sort_parent.id,function()
	_G_plyrs_overlay_main.sort_bool=true
end)
_G_plyrs_overlay_main.plyr_sort_by_val.set_str_data(_G_plyrs_overlay_main.plyr_sort_by_val,{"PID","Alphabetically","Distance","K/D Ratio","Money","Rank","Time in session","Host Priority"})

_G_plyrs_overlay_main.plyr_sort_asc_desc=menu.add_feature("Player list sort type:", "autoaction_value_str", _G_plyrs_overlay_main.sort_parent.id,function()
	_G_plyrs_overlay_main.sort_bool=true
end)
_G_plyrs_overlay_main.plyr_sort_asc_desc.set_str_data(_G_plyrs_overlay_main.plyr_sort_asc_desc,{"Ascending", "Descending"})

_G_plyrs_overlay_main.plyr_sort_top = menu.add_feature("Always top of the list:", "value_str", _G_plyrs_overlay_main.sort_parent.id)
_G_plyrs_overlay_main.plyr_sort_top:set_str_data({"Friends","Org/MC"})

_G_plyrs_overlay_main.plyr_sort_interior = menu.add_feature("Interior always at bottom of list", "toggle", _G_plyrs_overlay_main.sort_parent.id)

_G_plyrs_overlay_main.plyr_sort_self = menu.add_feature("Include self on list", "toggle", _G_plyrs_overlay_main.sort_parent.id)

_G_plyrs_overlay_main.plyr_sort_money = menu.add_feature("Show money", "toggle", _G_plyrs_overlay_main.show_info_parent.id)

_G_plyrs_overlay_main.plyr_sort_rank = menu.add_feature("Show rank", "toggle", _G_plyrs_overlay_main.show_info_parent.id)

_G_plyrs_overlay_main.plyr_sort_kd = menu.add_feature("Show K/D", "toggle", _G_plyrs_overlay_main.show_info_parent.id)

_G_plyrs_overlay_main.plyr_sort_veh = menu.add_feature("Show vehicle", "toggle", _G_plyrs_overlay_main.show_info_parent.id)

_G_plyrs_overlay_main.plyr_sort_speed_veh = menu.add_feature("Show speed in a vehicle", "toggle", _G_plyrs_overlay_main.show_info_parent.id)

_G_plyrs_overlay_main.plyr_sort_speed_ped = menu.add_feature("Show speed on foot", "toggle", _G_plyrs_overlay_main.show_info_parent.id)

_G_plyrs_overlay_main.plyr_sort_speed_type = menu.add_feature("Show speed using:", "autoaction_value_str", _G_plyrs_overlay_main.show_info_parent.id)
_G_plyrs_overlay_main.plyr_sort_speed_type.set_str_data(_G_plyrs_overlay_main.plyr_sort_speed_type,{"MPH","KPH"})

_G_plyrs_overlay_main.plyr_sort_speed_above = menu.add_feature("Only show speed above", "action_value_i", _G_plyrs_overlay_main.show_info_parent.id)
_G_plyrs_overlay_main.plyr_sort_speed_above.max,_G_plyrs_overlay_main.plyr_sort_speed_above.min,_G_plyrs_overlay_main.plyr_sort_speed_above.mod=200,0,5

_G_plyrs_overlay_main.plyr_sort_wanted = menu.add_feature("Show wanted level", "value_str", _G_plyrs_overlay_main.show_info_parent.id)
_G_plyrs_overlay_main.plyr_sort_wanted.set_str_data(_G_plyrs_overlay_main.plyr_sort_wanted,{"Show stars","Blink red/blue","Show both"})

_G_plyrs_overlay_main.plyr_sort_tis = menu.add_feature("Show time in session", "toggle", _G_plyrs_overlay_main.show_info_parent.id)

_G_plyrs_overlay_main.plyr_sort_column_space = menu.add_feature("Display two columns: Spacing", "value_i", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_column_space.max,_G_plyrs_overlay_main.plyr_sort_column_space.min,_G_plyrs_overlay_main.plyr_sort_column_space.mod=250,25,5

_G_plyrs_overlay_main.plyr_sort_column_type = menu.add_feature("Display two columns: Type", "autoaction_value_str", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_column_type.set_str_data(_G_plyrs_overlay_main.plyr_sort_column_type,{"If needed","Always 50/50"})

_G_plyrs_overlay_main.plyr_sort_int_alpha = menu.add_feature("Interior player alpha", "autoaction_value_str", _G_plyrs_overlay_main.display_parent.id,function(f)
	if f.value == 0 then
		_G_plyrs_overlay_main.plyr_sort_int_alpha_speed.hidden=false
	else
		_G_plyrs_overlay_main.plyr_sort_int_alpha_speed.hidden=true
	end
end)
_G_plyrs_overlay_main.plyr_sort_int_alpha.set_str_data(_G_plyrs_overlay_main.plyr_sort_int_alpha,_G_plyrs_overlay_main.alpha_str)

_G_plyrs_overlay_main.plyr_sort_int_alpha_speed = menu.add_feature("Alpha fade speed", "action_value_i", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_int_alpha_speed.max,_G_plyrs_overlay_main.plyr_sort_int_alpha_speed.min,_G_plyrs_overlay_main.plyr_sort_int_alpha_speed.mod=10,1,1
_G_plyrs_overlay_main.plyr_sort_int_alpha_speed.value=5

_G_plyrs_overlay_main.plyr_sort_max = menu.add_feature("Max Players", "autoaction_value_i", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_max.max,_G_plyrs_overlay_main.plyr_sort_max.min,_G_plyrs_overlay_main.plyr_sort_max.mod=32,1,1

_G_plyrs_overlay_main.plyr_sort_x = menu.add_feature("X Pos", "autoaction_value_i", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_x.max,_G_plyrs_overlay_main.plyr_sort_x.min,_G_plyrs_overlay_main.plyr_sort_x.mod=300,0,1

_G_plyrs_overlay_main.plyr_sort_y = menu.add_feature("Y Pos", "autoaction_value_i", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_y.max,_G_plyrs_overlay_main.plyr_sort_y.min,_G_plyrs_overlay_main.plyr_sort_y.mod=300,0,1

_G_plyrs_overlay_main.plyr_sort_space_hor = menu.add_feature("Horizontal Spacing", "autoaction_value_i", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_space_hor.max,_G_plyrs_overlay_main.plyr_sort_space_hor.min,_G_plyrs_overlay_main.plyr_sort_space_hor.mod=25,1,1

_G_plyrs_overlay_main.plyr_sort_space_ver = menu.add_feature("Vertical Spacing", "autoaction_value_i", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_space_ver.max,_G_plyrs_overlay_main.plyr_sort_space_ver.min,_G_plyrs_overlay_main.plyr_sort_space_ver.mod=25,1,1

_G_plyrs_overlay_main.plyr_sort_scale = menu.add_feature("Scale", "autoaction_value_i", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_scale.max,_G_plyrs_overlay_main.plyr_sort_scale.min,_G_plyrs_overlay_main.plyr_sort_scale.mod=300,75,1

_G_plyrs_overlay_main.plyr_sort_font = menu.add_feature("Font", "autoaction_value_i", _G_plyrs_overlay_main.display_parent.id)
_G_plyrs_overlay_main.plyr_sort_font.max,_G_plyrs_overlay_main.plyr_sort_font.min,_G_plyrs_overlay_main.plyr_sort_font.mod=9,0,1

function _GF_nearby_plyr_overlay_hide(_bool)
_G_plyrs_overlay_main.sort_parent.hidden=_bool
_G_plyrs_overlay_main.display_parent.hidden=_bool
_G_plyrs_overlay_main.show_info_parent.hidden=_bool
end
_GF_nearby_plyr_overlay_hide(true)

function _GF_plyr_nearby_overlay_recc()
_G_plyrs_overlay_main.plyr_sort_by_val.value=2
_G_plyrs_overlay_main.plyr_sort_self.on=true
_G_plyrs_overlay_main.plyr_sort_money.on=true
_G_plyrs_overlay_main.plyr_sort_rank.on=true
_G_plyrs_overlay_main.plyr_sort_kd.on=true
_G_plyrs_overlay_main.plyr_sort_veh.on=true
_G_plyrs_overlay_main.plyr_sort_max.value=32
_G_plyrs_overlay_main.plyr_sort_space_hor.value=10
_G_plyrs_overlay_main.plyr_sort_space_ver.value=5
_G_plyrs_overlay_main.plyr_sort_x.value=91
_G_plyrs_overlay_main.plyr_sort_y.value=3
_G_plyrs_overlay_main.plyr_sort_scale.value=75
_G_plyrs_overlay_main.plyr_sort_font.value=4
_G_plyrs_overlay_main.plyr_sort_column_space.on=true
_G_plyrs_overlay_main.plyr_sort_column_space.value=100
_G_plyrs_overlay_main.plyr_sort_column_type.value=1
_G_plyrs_overlay_main.plyr_sort_wanted.on=true
_G_plyrs_overlay_main.plyr_sort_wanted.value=2
_G_plyrs_overlay_main.plyr_sort_tis.on=true
_G_plyrs_overlay_main.plyr_sort_speed_type.value=0
_G_plyrs_overlay_main.plyr_sort_speed_above.value=0
_G_plyrs_overlay_main.plyr_sort_speed_veh.on=true
_G_plyrs_overlay_main.plyr_sort_speed_ped.on=true
_G_plyrs_overlay_main.plyr_sort_interior.on=true
_G_plyrs_overlay_main.plyr_list_feat.on=true
end
_GF_plyr_nearby_overlay_recc()

_G_ldrbrd = {}
_G_ldrbrd.ped_veh_id={-1,-1}
_G_ldrbrd.plyr_dead={}
_G_ldrbrd.plyr_score={}
_G_ldrbrd.plyr_name={}
_G_ldrbrd.feat_name_str={}
_G_ldrbrd.last_killer=-1
_G_ldrbrd.last_death=-1

function _G_ldrbrd.default_all_tables()
	for i=1,32 do
		_G_ldrbrd.plyr_score[i]={}
		for pid=1,32 do
			_G_ldrbrd.plyr_score[i][pid]={0,0,""}
		end
		_G_ldrbrd.ped_veh_id[i]={-1,-1}
		_G_ldrbrd.plyr_dead[i]=false
		_G_ldrbrd.plyr_name[i]=""
		if player.is_player_valid(i-1) then
			_G_ldrbrd.feat_name_str[i]=_GF_plyr_name(i-1)
		else
			_G_ldrbrd.feat_name_str[i]=""
		end
	end
end
_G_ldrbrd.default_all_tables()

function _G_ldrbrd.sort(score_table)
	if _G_ldrbrd.sort_drctn.value == 0 and _G_ldrbrd.sort_by.value ~= 4 then
		if _G_ldrbrd.sort_by.value == 0 then
			table.sort(score_table, function(a, b) return a[3]:lower() < b[3]:lower()  end) 
		elseif _G_ldrbrd.sort_by.value == 1 then
			table.sort(score_table, function(a, b) 
			if a[1] == b[1] then
				return a[3]:lower() < b[3]:lower()
			end
			return a[1] < b[1] end)
		elseif _G_ldrbrd.sort_by.value == 2 then
			table.sort(score_table, function(a, b) 
			if a[2] == b[2] then
				return a[3]:lower() < b[3]:lower()
			end
			return a[2] < b[2] end)
		else
			table.sort(score_table, function(a, b) return a[7] < b[7]  end)
		end
	elseif _G_ldrbrd.sort_drctn.value == 1 then
		if _G_ldrbrd.sort_by.value == 0 then
			table.sort(score_table, function(a, b) return a[3]:lower() > b[3]:lower()  end) 
		elseif _G_ldrbrd.sort_by.value == 1 then
			table.sort(score_table, function(a, b)
			if a[1] == b[1] then
				return a[3]:lower() > b[3]:lower()
			end
			return a[1] > b[1]  end)
		elseif _G_ldrbrd.sort_by.value == 2 then
			table.sort(score_table, function(a, b)
			if a[2] == b[2] then
				return a[3]:lower() > b[3]:lower()
			end
			return a[2] > b[2]  end)
		elseif _G_ldrbrd.sort_by.value == 3 then
			table.sort(score_table, function(a, b) return a[7] > b[7]  end)
		else
			table.sort(score_table, function(a, b) return a[8] > b[8]  end)
		end
	end
end

_G_ldrbrd.record_ped_veh_id = menu.add_feature("HIDDEN record plyr ped veh id death", "toggle", _G_Leaderboard.id, function(f)
	local function record_death(_pidT,_ped_id)
		if player.player_count() > 0 then -- suicide in SP returns nil i guess
			local murderer = _GF_what_ent_killed_ped(_ped_id)
			for i=1,32 do
				if _G_ldrbrd.ped_veh_id[i][1] == murderer or _G_ldrbrd.ped_veh_id[i][2] == murderer then
					_G_ldrbrd.plyr_score[_pidT][i][2]=_G_ldrbrd.plyr_score[_pidT][i][2]+1
					_G_ldrbrd.plyr_score[i][_pidT][1]=_G_ldrbrd.plyr_score[i][_pidT][1]+1
					_G_ldrbrd.last_killer=i
					_G_ldrbrd.last_death=_pidT
					return true
				end
			end
		end
		return false
	end
	local plyr_leave = event.add_event_listener("player_leave", function(listener)
		if listener.player == player.player_id() then
			_G_ldrbrd.default_all_tables()
		end
	end)
	while f.on do
		for i=1,32 do
			if _GF_valid_pid(i-1) then
				_G_ldrbrd.ped_veh_id[i][1]=player.get_player_ped(i-1)
				_G_ldrbrd.plyr_name[i]=_GF_plyr_name(i-1)
				_G_ldrbrd.feat_name_str[i]=_GF_plyr_name(i-1)
				for pid=1,32 do
					_G_ldrbrd.plyr_score[pid][i][3]=_GF_plyr_name(i-1)
				end
				if player.is_player_in_any_vehicle(i-1) then
					_G_ldrbrd.ped_veh_id[i][2]=player.get_player_vehicle(i-1)
				else
					_G_ldrbrd.ped_veh_id[i][2]=-1
				end
			else
				if _G_ldrbrd.last_killer == i then
					_G_ldrbrd.last_killer=-1
				end
				if _G_ldrbrd.last_death == i then
					_G_ldrbrd.last_death=-1
				end
				_G_ldrbrd.ped_veh_id[i]={-1,-1}
				_G_ldrbrd.plyr_dead[i]=false
				_G_ldrbrd.plyr_name[i]=""
				_G_ldrbrd.feat_name_str[i]=""
				for pid=1,32 do
					_G_ldrbrd.plyr_score[i][pid]={0,0,""}
					_G_ldrbrd.plyr_score[pid][i]={0,0,""}
				end
			end
		end
		_G_ldrbrd.feat.set_str_data(_G_ldrbrd.feat,_G_ldrbrd.feat_name_str)
		for i=1,32 do
			if _GF_valid_pid(i-1) then
				if _GF_is_dead(player.get_player_ped(i-1)) then
					if _G_ldrbrd.plyr_dead[i] == false then
						if record_death(i,player.get_player_ped(i-1)) then
							_G_ldrbrd.plyr_dead[i]=true
						end
					end
				elseif player.is_player_playing(i-1) then
					_G_ldrbrd.plyr_dead[i] = false
				end
			end
		end
		system.yield(250)
	end
end)
_G_ldrbrd.record_ped_veh_id.on=true
_G_ldrbrd.record_ped_veh_id.hidden=true

_G_ldrbrd.feat = menu.add_feature("Show Leaderboard","value_str",_G_Leaderboard.id, function(f)
	local score_table,_table,count,name,v2_pos,text_pos
	local r,g,b,size,back_a,text_a,pid,my_r,my_g,my_b
	local f_value=f.value
	local y_val,y_ofst = 0.013,0
	local x_pos,y_pos = 0.5,0.5
	local function show_last()
		if not _G_ldrbrd.show_last.on then 
			return false
		elseif _G_ldrbrd.show_last.value == 0 and not _GF_valid_pid(_G_ldrbrd.last_killer-1) then
			return false
		elseif _G_ldrbrd.show_last.value == 1 and not _GF_valid_pid(_G_ldrbrd.last_death-1) then
			return false
		else
			local I_name
			if _G_ldrbrd.show_last.value == 0 then I_name=_GF_plyr_name(_G_ldrbrd.last_killer-1) else I_name=_GF_plyr_name(_G_ldrbrd.last_death-1) end
			for i=1,32 do
				if _G_ldrbrd.feat_name_str[i] == I_name then
					name = I_name
					my_r,my_g,my_b = _G_plyrs_overlay_main.plyr_rgb(i,nil)
					_table=_G_ldrbrd.plyr_score[i]
					f.value=i-1
					return true
				end
			end
		end
		return false
	end
	local function retrieve_info()
		_table = {}
		if not show_last() then
			for i=1,32 do
				if _G_ldrbrd.plyr_name[i] == _G_ldrbrd.feat_name_str[f.value+1] then
					name = _GF_plyr_name(i-1)
					my_r,my_g,my_b = _G_plyrs_overlay_main.plyr_rgb(i,nil)
					_table=_G_ldrbrd.plyr_score[i]
					break
				end
			end
		end
		count = 1
		score_table={}
		for i=1,32 do
			if (_table[i][1] ~= nil and _table[i][1] > 0) or (_table[i][2] ~= nil and _table[i][2] > 0)  then
				if _table[i][3] == name then
					name=name.." - ".._table[i][1].." Suicide"
				else
					count=count+1
					score_table[#score_table+1]={
					_table[i][1],
					_table[i][2],
					_table[i][3],
					_G_plyrs_overlay_main.plyr_rgb(i,"r"),
					_G_plyrs_overlay_main.plyr_rgb(i,"g"),
					_G_plyrs_overlay_main.plyr_rgb(i,"b"),
					_G_plyrs_overlay_main.dist_table[i][1],
					i-1}
				end
			end
		end
	end
	local function check_plyr_name()
		local down=false
		if f_value~=f.value then
			if f.value==f_value-1 or f_value-1==-1 then
				down=true
			end
		end
		repeat
			if _G_ldrbrd.feat_name_str[f.value+1] == "" then
				if down then
					if f.value == 0 then
						f.value=31
					else
						f.value=f.value-1
					end
				else
					if f.value == 31 then
						f.value=0
					else
						f.value=f.value+1
					end
				end
			end
		until _G_ldrbrd.feat_name_str[f.value+1] ~= ""
		f_value=f.value
	end
	while not _G_GS_has_loaded do
		system.yield(50)
	end
	local script_size = _GF_script_draw_size(f.on)
	while f.on do
		system.yield(5)
		check_plyr_name()
		retrieve_info()
		_G_ldrbrd.sort(score_table)
		x_pos = _G_ldrbrd.x.value
		y_pos = _G_ldrbrd.y.value
		back_a = _G_ldrbrd.back_a.value
		text_a = _G_ldrbrd.text_a.value
		size = _G_ldrbrd.size.value
		y_val = 0.04*size
		v2_pos = v2(x_pos,y_pos-y_val*count*.5)
		scriptdraw.draw_rect(v2_pos,v2(0.169*size,0.040*size*count),_GF_RGBAToInt(0,0,0,back_a))
		scriptdraw.draw_rect(v2(x_pos,y_pos-(y_val*.5)),v2(0.169*size,0.040*size),_GF_RGBAToInt(0,0,0,back_a))
		text_pos = v2(v2_pos.x*(2/3),(y_pos-(y_val*.5))*2)
		scriptdraw.draw_text(name,text_pos,text_pos,size*1.069*script_size,_GF_RGBAToInt(my_r,my_g,my_b,text_a),((1<<0)+(1<<1)+(1<<2)),nil)
		for i = 1,#score_table do
			text_pos=text_pos-v2(0,y_val*2)
			r,g,b = score_table[i][4],score_table[i][5],score_table[i][6]
			scriptdraw.draw_text(score_table[i][1],text_pos-v2(size*0.0725,0),text_pos,size*1.069*script_size,_GF_RGBAToInt(my_r,my_g,my_b,text_a),((1<<0)+(1<<1)+(1<<2)),nil)
			scriptdraw.draw_text("-",text_pos-v2(size*0.06,0),text_pos,size*1.069*script_size,_GF_RGBAToInt(255,255,255,text_a),((1<<0)+(1<<1)+(1<<2)),nil)
			scriptdraw.draw_text(score_table[i][2],text_pos-v2(size*0.0475,0)	,text_pos,size*1.069*script_size,_GF_RGBAToInt(r,g,b,text_a),((1<<0)+(1<<1)+(1<<2)),nil)
			scriptdraw.draw_text(score_table[i][3],v2(x_pos,text_pos.y)-v2(size*0.0325,0),v2(x_pos,text_pos.y),size*1.069*script_size,_GF_RGBAToInt(r,g,b,text_a),((1<<1)+(1<<2)),nil)
		end
	end
end)_G_ldrbrd.feat.set_str_data(_G_ldrbrd.feat,_G_ldrbrd.feat_name_str)

_G_ldrbrd.show_last = menu.add_feature("Always show last player who:","value_str",_G_Leaderboard.id)
_G_ldrbrd.show_last:set_str_data({"Killed","Was killed"})

_G_ldrbrd.sort_by = menu.add_feature("Sort scores","action_value_str",_G_Leaderboard.id)
_G_ldrbrd.sort_by:set_str_data({"Name","Kills","Deaths","Distance","PID"})

_G_ldrbrd.sort_drctn = menu.add_feature("Sort type","action_value_str",_G_Leaderboard.id)
_G_ldrbrd.sort_drctn:set_str_data({"Ascending","Descending"})

_G_ldrbrd.size = menu.add_feature("Size","action_value_f",_G_Leaderboard.id)
_G_ldrbrd.size.min = .1
_G_ldrbrd.size.max = 3
_G_ldrbrd.size.mod = 0.01
_G_ldrbrd.size.value = 1

_G_ldrbrd.x = menu.add_feature("X Pos","action_value_f",_G_Leaderboard.id)
_G_ldrbrd.x.min = -1
_G_ldrbrd.x.max = 1
_G_ldrbrd.x.mod = 0.01
_G_ldrbrd.x.value = 0.89

_G_ldrbrd.y = menu.add_feature("Y Pos","action_value_f",_G_Leaderboard.id)
_G_ldrbrd.y.min = -1
_G_ldrbrd.y.max = 1
_G_ldrbrd.y.mod = 0.01
_G_ldrbrd.y.value = 0.44

_G_ldrbrd.back_a = menu.add_feature("Background alpha","action_value_i",_G_Leaderboard.id)
_G_ldrbrd.back_a.min = 1
_G_ldrbrd.back_a.max = 255
_G_ldrbrd.back_a.mod = 1
_G_ldrbrd.back_a.value = 100

_G_ldrbrd.text_a = menu.add_feature("Text alpha","action_value_i",_G_Leaderboard.id)
_G_ldrbrd.text_a.min = 1
_G_ldrbrd.text_a.max = 255
_G_ldrbrd.text_a.mod = 1
_G_ldrbrd.text_a.value = 255

function _G_ldrbrd.get_highest(_1_or_2,_text)
	local temp,score,name_k,name_d=0,{},{},{}
	for i=1,32 do
		for pid=1,32 do
			if _G_ldrbrd.plyr_score[i][pid][_1_or_2] > temp and _G_ldrbrd.plyr_name[i] ~= "" and _G_ldrbrd.plyr_name[pid] ~= "" then
				temp=_G_ldrbrd.plyr_score[i][pid][_1_or_2]
			end
		end
	end
	for i=1,32 do
		for pid=1,32 do
			if _G_ldrbrd.plyr_score[i][pid][_1_or_2] >= temp and _G_ldrbrd.plyr_name[i] ~= "" and _G_ldrbrd.plyr_name[pid] ~= "" then
				score[#score+1]={_G_ldrbrd.plyr_score[i][pid][1],_G_ldrbrd.plyr_score[i][pid][2],_G_ldrbrd.plyr_name[i],_G_ldrbrd.plyr_name[pid]}
			end
		end
	end
	if temp>0 then
		local msg =""
		for i=1,#score do
			if score[i][3] == score[i][4] then
				msg=msg..score[i][3].." "..score[i][1].." suicide(s)\n"
			else
				msg=msg..score[i][3].." "..score[i][1].." - "..score[i][2].." "..score[i][4].."\n"
			end
		end
		menu.notify(msg,_G_GeeVer,5)
	else
		menu.notify("No recorded ".._text,_G_GeeVer,5)
	end
end

_G_ldrbrd.highest_kill = menu.add_feature("Who has the most kills?","action",_G_Leaderboard.id,function()
	_G_ldrbrd.get_highest(1,"kills")
end)

_G_ldrbrd.highest_death = menu.add_feature("Who has the most deaths?","action",_G_Leaderboard.id,function()
	_G_ldrbrd.get_highest(2,"deaths")
end)

------------------------------------------------------------------------------------------------------------------------------------
_G_LOS_={}
_G_LOS_._table={}

function _G_LOS_.default(i)
	_G_LOS_._table[i]={false,"",0,0,0,0,""}
end
for i=1,32 do
	_G_LOS_.default(i)
end

function _G_LOS_.sort(_table)
	if _G_LOS_.sort_drctn.value == 0 then
		if _G_LOS_.sort_by.value == 0 then
			table.sort(_table, function(a, b) return a[6] < b[6]  end) 
		else
			table.sort(_table, function(a, b) return a[2]:lower() < b[2]:lower()  end) 
		end
	else
		if _G_LOS_.sort_by.value == 0 then
			table.sort(_table, function(a, b) return a[6] > b[6]  end) 
		else
			table.sort(_table, function(a, b) return a[2]:lower() > b[2]:lower()  end) 
		end
	end
end

function _G_LOS_.get_dist(_dist)
	if _G_LOS_.dist_type.value == 0 then
		return _GF_ent_dist_str(_dist,"m")
	end
	return _GF_ent_dist_str(_dist,"ft")
end
	
function _G_LOS_.show_it(_table,script_size)
	local x_pos,y_pos,size = _G_LOS_.x.value,_G_LOS_.y.value,_G_LOS_.size.value
	local back_a = _GF_RGBAToInt(0,0,0,_G_LOS_.back_a.value)
	local y_val = 0.04*size
	local v2_pos = v2(x_pos,y_pos-y_val*(#_table+1)*.5)
	scriptdraw.draw_rect(v2_pos,v2(0.24*size,0.040*size*(#_table+1)),back_a)
	scriptdraw.draw_rect(v2(x_pos,y_pos-(y_val*.5)),v2(0.24*size,0.040*size),back_a)
	local text_pos = v2(v2_pos.x*(2/3),(y_pos-(y_val*.5))*2)
	local my_r,my_g,my_b = _G_plyrs_overlay_main.plyr_rgb(player.player_id()+1,nil)
	scriptdraw.draw_text(_GF_plyr_name(player.player_id()),text_pos,text_pos,size*1.069*script_size,_GF_RGBAToInt(my_r,my_g,my_b,_G_LOS_.text_a.value),((1<<0)+(1<<1)+(1<<2)),nil)
	for i = 1,#_table do
		text_pos=text_pos-v2(0,y_val*2)
		local text_rgba = _GF_RGBAToInt(_table[i][3],_table[i][4],_table[i][5],_G_LOS_.text_a.value)
		scriptdraw.draw_text(_G_LOS_.get_dist(_table[i][6]) ,text_pos-v2(size*0.08,0),text_pos,size*1.069*script_size,_GF_RGBAToInt(255,255,255,_G_LOS_.text_a.value),((1<<0)+(1<<1)+(1<<2)),nil)
		scriptdraw.draw_text(_table[i][2].." - ".._table[i][7],v2(x_pos,text_pos.y)-v2(size*0.0425,0),v2(x_pos,text_pos.y),size*1.069*script_size,text_rgba,((1<<1)+(1<<2)),nil)
	end
end

_G_LOS_.record = menu.add_feature("HIDDEN record LOS players", "toggle", _G_LOS_parent.id, function(f)
	while f.on do
		for i=1,32 do
			if _GF_valid_pid(i-1) and i-1 ~= player.player_id() then
				if native.call(0x0267D00AF114F17A,player.get_player_ped(i-1),player.get_player_ped(player.player_id())):__tointeger(true) == 1 then --HasEntityClearLosToEntityInFront
					_G_LOS_._table[i]={
					true,
					_GF_plyr_name(i-1),
					_G_plyrs_overlay_main.plyr_rgb(i,"r"),
					_G_plyrs_overlay_main.plyr_rgb(i,"g"),
					_G_plyrs_overlay_main.plyr_rgb(i,"b"),
					_G_plyrs_overlay_main.dist_table[i][1],
					_GT_aim_protex_main.get_weap_name(i-1)
					}
				else
					_G_LOS_.default(i)
				end
				system.yield(25)
			end
		end
		f.on=_G_LOS_.feat.on
		system.yield(25)
	end
end)_G_LOS_.record.hidden=true

_G_LOS_.feat = menu.add_feature("Show list","toggle",_G_LOS_parent.id, function(f)
	local _table
	local script_size = _GF_script_draw_size(f.on)
	while f.on do
		system.yield(5)
		_G_LOS_.record.on=f.on
		_table={} 
		for i=1, 32 do
			if _G_LOS_._table[i][1] then
				_table[#_table+1]=_G_LOS_._table[i]
			end
		end
		_G_LOS_.sort(_table)
		_G_LOS_.show_it(_table,script_size)
	end
end)

_G_LOS_.test = menu.add_feature("Display test","action",_G_LOS_parent.id, function(f)
	local _table,time={},utils.time_ms()+10000
	for i=1,9 do
		_table[i]={
		true,
		"Player "..i,
		math.random(50,255),
		math.random(50,255),
		math.random(50,255),
		math.random(50,5000)*.1,
		_GT_aim_protex_main.weap_table_all[math.random(1,#_GT_aim_protex_main.weap_table_all)][2]
		}
	end
	while time > utils.time_ms() do
		system.yield(5)
		f.name="Display test ".._GF_1_decimal((time-utils.time_ms())/1000)
		_G_LOS_.sort(_table)
		_G_LOS_.show_it(_table)
	end
	f.name="Display test"
end)


_G_LOS_.sort_by = menu.add_feature("Sort players","action_value_str",_G_LOS_parent.id)
_G_LOS_.sort_by:set_str_data({"Distance","Name"})

_G_LOS_.sort_drctn = menu.add_feature("Sort type","action_value_str",_G_LOS_parent.id)
_G_LOS_.sort_drctn:set_str_data({"Ascending","Descending"})

_G_LOS_.dist_type = menu.add_feature("Distance type","action_value_str",_G_LOS_parent.id)
_G_LOS_.dist_type:set_str_data({"Meters","Feet"})

_G_LOS_.size = menu.add_feature("Size","action_value_f",_G_LOS_parent.id)
_G_LOS_.size.min = .1
_G_LOS_.size.max = 3
_G_LOS_.size.mod = 0.01
_G_LOS_.size.value = 1

_G_LOS_.x = menu.add_feature("X Pos","action_value_f",_G_LOS_parent.id)
_G_LOS_.x.min = -1
_G_LOS_.x.max = 1
_G_LOS_.x.mod = 0.01
_G_LOS_.x.value = 0.69

_G_LOS_.y = menu.add_feature("Y Pos","action_value_f",_G_LOS_parent.id)
_G_LOS_.y.min = -1
_G_LOS_.y.max = 1
_G_LOS_.y.mod = 0.01
_G_LOS_.y.value = 0.44

_G_LOS_.back_a = menu.add_feature("Background alpha","action_value_i",_G_LOS_parent.id)
_G_LOS_.back_a.min = 1
_G_LOS_.back_a.max = 255
_G_LOS_.back_a.mod = 1
_G_LOS_.back_a.value = 100

_G_LOS_.text_a = menu.add_feature("Text alpha","action_value_i",_G_LOS_parent.id)
_G_LOS_.text_a.min = 1
_G_LOS_.text_a.max = 255
_G_LOS_.text_a.mod = 1
_G_LOS_.text_a.value = 255





_GT_gta_map.map_feat = menu.add_feature("Show GTA map","toggle",_G_GTA_map_parent.id,function(f)
	_GF_yield_while_true(not _G_GS_has_loaded,1000)
	if not _GT_gta_map.loaded then
		system.yield(50)
		_GT_gta_map.load_main()
	end
	_GT_gta_map.plyr_info_feat.on=true
	_GT_gta_map.hotkey_feat.on=true
	if f.on then
		_GF_feat_keys_notify("GTA Map\nPress ",_GT_gta_map.hotkey_set_feat,_GT_gta_map.hotkey1_select,_GT_gta_map.hotkey2_select,_GT_gta_map.hotkey3_select," to switch to hot-key profile.")
	end
	local player_size,name_size,r,g,b,pos,png,_pid,_type,_map_x,_map_y,_map_size,_map_alpha,_plyr_size,_plyr_alpha,_plyr_alpha_feat,_name_do,_name_size,zoom_size,blip_size_offset,_head_mark_s,_head_mark_a,_head_mark,_bool,show_map
	local delphine_i,zoo_i,cam_rot,head_pos,head_rot = 1,1,6969
	local wp_time = utils.time_ms()
	local wp_blink = true
	local int_msg = {}
	local int_ofst = 0
	local function _180_to_360(_val)
		if _val > 180 then
			return _val - 360
		elseif _val < -180 then
			return _val + 360
		end
		return _val
	end
	local script_size = _GF_script_draw_size(f.on)
	while f.on do
		-- int_msg = {}
		-- int_ofst = 0
		show_map=false
		if _GT_gta_map.hotkey_bool then
			if _GT_gta_map.map2_alpha_feat.value > 0 then
				show_map=true
				_type,_map_x,_map_y,_map_size,_map_alpha = _GT_gta_map.type2_feat.value,_GT_gta_map.pos2_x.value,_GT_gta_map.pos2_y.value,_GT_gta_map.map2_size.value,_GF_RGBAToInt(255,255,255,math.floor(255*_GT_gta_map.map2_alpha_feat.value))
				_plyr_size,_plyr_alpha,_plyr_alpha_feat = _GT_gta_map.plyr2_size.value,_GF_RGBAToInt(255,255,255,math.floor(255*_GT_gta_map.plyr2_alpha_feat.value)),_GT_gta_map.plyr2_alpha_feat.value
				_name_do,_name_size,_head_mark,_head_mark_a,_head_mark_s = _GT_gta_map.plyr2_name.on,_GT_gta_map.plyr2_name_size.value,_GT_gta_map.z2.value,_GT_gta_map.head2_alpha_feat.value,_GT_gta_map.head2_size.value
			end
		elseif _GT_gta_map.map1_alpha_feat.value > 0 then
			show_map=true
			_type,_map_x,_map_y,_map_size,_map_alpha = _GT_gta_map.type1_feat.value,_GT_gta_map.pos1_x.value,_GT_gta_map.pos1_y.value,_GT_gta_map.map1_size.value,_GF_RGBAToInt(255,255,255,math.floor(255*_GT_gta_map.map1_alpha_feat.value))
			_plyr_size,_plyr_alpha,_plyr_alpha_feat = _GT_gta_map.plyr1_size.value,_GF_RGBAToInt(255,255,255,math.floor(255*_GT_gta_map.plyr1_alpha_feat.value)),_GT_gta_map.plyr1_alpha_feat.value
			_name_do,_name_size,_head_mark,_head_mark_a,_head_mark_s = _GT_gta_map.plyr1_name.on,_GT_gta_map.plyr1_name_size.value,_GT_gta_map.z1.value,_GT_gta_map.head1_alpha_feat.value,_GT_gta_map.head1_size.value
		end
		if show_map then
			if _GT_gta_map.helo_rot >= 360 then
				_GT_gta_map.helo_rot = 0
			else
				_GT_gta_map.helo_rot = _GT_gta_map.helo_rot + 1.875
			end
			list = _GT_gta_map.plyr_list
			_map_size = _map_size*_GT_gta_map.cayo_me_size
			if _type == 2 then png = _GT_gta_map.plyr_png_w else png = _GT_gta_map.plyr_png end
			player_size = _map_size*.069*_plyr_size*2
			name_size = (_plyr_size+_map_size)/6*_name_size
			_GT_gta_map.show_map,_GT_gta_map.show_map_center = _GT_gta_map.show_map_center_do()
			blip_size_offset = 1
			-- if _GT_gta_map.ship_me then
				-- scriptdraw.draw_sprite(_GT_gta_map.ussl_dark,v2(_map_x,_map_y),_map_size*2,0,_map_alpha)
			-- else
			if _GT_gta_map.cmpnd then
				if _type == 2 then
					scriptdraw.draw_sprite(_GT_gta_map.cmpnd_dark,v2(_map_x,_map_y),_map_size*1.534,0,_map_alpha)
				else
					scriptdraw.draw_sprite(_GT_gta_map.cmpnd_3d,v2(_map_x,_map_y),_map_size*1.534,0,_map_alpha)
				end
			elseif _GT_gta_map.cayo_me then
				--scriptdraw.draw_sprite(_GT_gta_map.cayo_3d,v2(_map_x,_map_y),_map_size*_GT_gta_map.cayo_s.value,0,_map_alpha)
				if _type == 2 then
					scriptdraw.draw_sprite(_GT_gta_map.cayo_dark,v2(_map_x,_map_y),_map_size*0.9339,0,_map_alpha)
				else
					scriptdraw.draw_sprite(_GT_gta_map.cayo_3d,v2(_map_x,_map_y),_map_size*0.9339,0,_map_alpha)
				end
			elseif _GT_gta_map.show_map > 0 then
				if _GT_gta_map.show_map == 5 or _GT_gta_map.show_map == 12 then
					blip_size_offset = 1.25
					zoom_size = 1
				elseif _GT_gta_map.show_map > 5 then
					zoom_size = 2
					blip_size_offset = 1.5
				else
					zoom_size = 1
				end
				if _type == 0 then
					scriptdraw.draw_sprite(_GT_gta_map.map_zoom_c[_GT_gta_map.show_map],v2(_map_x, _map_y),_map_size*.69*zoom_size,0,_map_alpha)
				elseif _type == 1 then
					scriptdraw.draw_sprite(_GT_gta_map.map_zoom_3d[_GT_gta_map.show_map],v2(_map_x, _map_y),_map_size*.69*zoom_size,0,_map_alpha)
				else
					scriptdraw.draw_sprite(_GT_gta_map.map_zoom_dark[_GT_gta_map.show_map],v2(_map_x, _map_y),_map_size*.69*zoom_size,0,_map_alpha)
				end
				if _GT_gta_map.show_map == 4 then
					if _GT_gta_map.cayo then
						scriptdraw.draw_sprite(_GT_gta_map.cayo_3d,v2((_map_x+(.3732*_map_size*_GT_gta_map.cp_mini_math_x.value)),(_map_y+(-1.0396*_map_size*_GT_gta_map.cp_mini_math_y.value))),_map_size*.1799,0,_map_alpha)
					end
					-- if _GT_gta_map.ship then
						-- scriptdraw.draw_sprite(_GT_gta_map.ussl_dark,v2((_map_x+(_GT_gta_map.cayo1x.value*_map_size)),(_map_y+(_GT_gta_map.cayo1y.value*_map_size))),_map_size*_GT_gta_map.cayo_s.value,0,_map_alpha)
					-- end
				end
			else
				scriptdraw.draw_sprite(_GT_gta_map.map_png[_type+1],v2(_map_x, _map_y),_map_size*.4,0,_map_alpha)
				if _GT_gta_map.cayo then

					scriptdraw.draw_sprite(_GT_gta_map.cayo_3d,v2((_map_x+(0.4357*_map_size*_GT_gta_map.cp_mini_math_x.value)),(_map_y+(-1.1664*_map_size*_GT_gta_map.cp_mini_math_y.value))),_map_size*0.1534,0,_map_alpha)
				end
			end
			if _head_mark > 0 then
				if not _GF_num_in_range(cam.get_gameplay_cam_rot().z,cam_rot-.069,cam_rot+.069) or _bool ~= _GT_gta_map.hotkey_bool then -- prevents it from continously checking distance for sprite pos when not moving
					cam_rot = cam.get_gameplay_cam_rot().z
					head_pos = _GT_gta_map.head_pos_do(_map_size)
					_bool = _GT_gta_map.hotkey_bool
				end
				r,g,b = _G_plyrs_overlay_main.plyr_rgb(player.player_id()+1)
				if _head_mark == 14 then
					if delphine_i+.19 > 372.99 then delphine_i = 1 else delphine_i = delphine_i + .19 end
					scriptdraw.draw_sprite(_GT_gta_map.z_point_gif_delphine[math.floor(delphine_i)],head_pos,_map_size*_head_mark_s,_GT_gta_map.sprt_rot_calc(cam.get_gameplay_cam_rot().z),_GF_RGBAToInt(255,255,255,math.floor(255*_head_mark_a)))
					scriptdraw.draw_sprite(_GT_gta_map.z_point_mark,head_pos,_map_size*_head_mark_s,_GT_gta_map.sprt_rot_calc(cam.get_gameplay_cam_rot().z),_GF_RGBAToInt(r,g,b,math.floor(255*_head_mark_a*.75)))
				elseif _head_mark == 15 then
					if zoo_i+.169 > 226.99 then zoo_i = 1 else zoo_i = zoo_i + .169 end
					scriptdraw.draw_sprite(_GT_gta_map.z_point_gif_zoo[math.floor(zoo_i)],head_pos,_map_size*_head_mark_s,_GT_gta_map.sprt_rot_calc(cam.get_gameplay_cam_rot().z),_GF_RGBAToInt(255,255,255,math.floor(255*_head_mark_a)))
					scriptdraw.draw_sprite(_GT_gta_map.z_point_mark,head_pos,_map_size*_head_mark_s,_GT_gta_map.sprt_rot_calc(cam.get_gameplay_cam_rot().z),_GF_RGBAToInt(r,g,b,math.floor(255*_head_mark_a*.75)))
				elseif _GF_num_in_range(_head_mark,9,11) or _GF_num_in_range(_head_mark,1,7) then
					scriptdraw.draw_sprite(_GT_gta_map.z_point[_head_mark],head_pos,_map_size*_head_mark_s,_GT_gta_map.sprt_rot_calc(cam.get_gameplay_cam_rot().z),_GF_RGBAToInt(r,g,b,math.floor(255*_head_mark_a)))
				else
					if _head_mark > 15 then _head_mark = _head_mark - 2 end
					scriptdraw.draw_sprite(_GT_gta_map.z_point[_head_mark],head_pos,_map_size*_head_mark_s,_GT_gta_map.sprt_rot_calc(cam.get_gameplay_cam_rot().z),_GF_RGBAToInt(255,255,255,math.floor(255*_head_mark_a)))
					if _head_mark > 12 then
						scriptdraw.draw_sprite(_GT_gta_map.z_point_mark,head_pos,_map_size*_head_mark_s,_GT_gta_map.sprt_rot_calc(cam.get_gameplay_cam_rot().z),_GF_RGBAToInt(r,g,b,math.floor(255*_head_mark_a*.75)))
					end
				end
			end
			for i=1,33 do
				_pid = list[i][1]
				if list[i][2] == true then
					-- if _GT_plyr_info.interior[i] == true then
						-- --int_msg[#int_msg+1]=list[i][8]
					-- else
						-- color = _GF_org_color_int(_pid)+2
						-- r,g,b = _G_plyrs_overlay_main.team_rgb[color][1],_G_plyrs_overlay_main.team_rgb[color][2],_G_plyrs_overlay_main.team_rgb[color][3]
						r,g,b = _G_plyrs_overlay_main.plyr_rgb(_pid+1)
						pos = list[i][3]
						
						if list[i][6] == true then
							if player.is_player_friend(_pid) then
								scriptdraw.draw_sprite(_GT_gta_map.semicircle,pos,_map_size*.25*_plyr_size*blip_size_offset,list[i][9],_GF_RGBAToInt(93,182,229,math.floor(255*_plyr_alpha_feat)))
							end
							if _GT_plyr_info.otr[_pid+1] == true then
								scriptdraw.draw_sprite(_GT_gta_map.semicircle,pos,_map_size*.25*_plyr_size*blip_size_offset,list[i][10],_GF_RGBAToInt(114,204,114,math.floor(255*_plyr_alpha_feat)))
							end
							scriptdraw.draw_sprite(list[i][7],pos,_map_size*_plyr_size*blip_size_offset*1.69,list[i][4],_GF_RGBAToInt(r,g,b,math.floor(255*_plyr_alpha_feat)))
						else
							if player.is_player_friend(_pid) then
								scriptdraw.draw_sprite(_GT_gta_map.semicircle,pos,_map_size*.069*_plyr_size*2.69*blip_size_offset,3.125,_GF_RGBAToInt(93,182,229,math.floor(255*_plyr_alpha_feat)))
							end
							if _GT_plyr_info.otr[_pid+1] == true then
								scriptdraw.draw_sprite(_GT_gta_map.semicircle,pos,_map_size*.069*_plyr_size*2.69*blip_size_offset,0,_GF_RGBAToInt(114,204,114,math.floor(255*_plyr_alpha_feat)))
							end
							scriptdraw.draw_sprite(png[list[i][5]],pos,_map_size*.069*_plyr_size*2.69*blip_size_offset,list[i][4],_plyr_alpha)
						end
						if _name_do then
							scriptdraw.draw_text(_GF_plyr_name(_pid), pos+v2(0.15*player_size*blip_size_offset,0.069*player_size*blip_size_offset), v2(player_size,player_size), name_size*1.5*blip_size_offset*script_size, _GF_RGBAToInt(r,g,b,math.floor(255*_plyr_alpha_feat)),1 << 1, 0)
						end
					--end
				end
			end
			-- for i=1,#int_msg do
				-- scriptdraw.draw_rect(v2(_map_x+(int_name_size*_int_name_x), _map_y-((int_ofst+_int_name_y)*int_name_size)), v2(_map_size*.069*_int_name_size*2,_map_size*.069*_int_name_size*2), _GF_RGBAToInt(0,0,0,255))
				-- scriptdraw.draw_text(int_msg[i],v2(_map_x+(int_name_size*_int_name_x), _map_y-((int_ofst+_int_name_y)*int_name_size)), v2(_map_size*.069*_int_name_size*2,_map_size*.069*_int_name_size*2),(_plyr_size+_map_size)/6*_int_name_size , _GF_RGBAToInt(255,255,255,255),3, 0)
				-- int_ofst = int_ofst - .01
			-- end
			if wp_blink and ui.get_waypoint_coord().x < 16000 then
				if _GT_plyr_info.color[player.player_id()+1] > -1 and _GF_mission_active(player.player_id()) then
					r,g,b = _G_plyrs_overlay_main.team_rgb[_GT_plyr_info.color[player.player_id()+1]+2][1],_G_plyrs_overlay_main.team_rgb[_GT_plyr_info.color[player.player_id()+1]+2][2],_G_plyrs_overlay_main.team_rgb[_GT_plyr_info.color[player.player_id()+1]+2][3]
				else
					r,g,b = 164, 76, 242
				end
				scriptdraw.draw_sprite(_GT_gta_map.wp_blip,_GT_gta_map.sprt_pos_do(ui.get_waypoint_coord()),_map_size*.69*_plyr_size*3.69,0,_GF_RGBAToInt(r,g,b,math.floor(255*_plyr_alpha_feat)))
			end
			
			if wp_time < utils.time_ms() then
				wp_blink = _GF_opp_bool(wp_blink)
				if wp_blink then wp_time = utils.time_ms() + 1000 else wp_time = utils.time_ms() + 250 end
			end
		end
		system.yield(4)
	end
	_GT_gta_map.plyr_info_feat.on=false
	_GT_gta_map.hotkey_feat.on=false
end)

_GT_gta_map.plyr_info_feat=menu.add_feature("Player info hidden","toggle",_G_GTA_map_parent.id,function(f)
	local time = utils.time_ms() + 669
	local int_time = utils.time_ms() + 5000
	local self_blink = false
	local int_msg = ""
	local ship,cayo,temp_near=false,false,0
	local function near_ship_or_cayo(_pid)
		--Ship coords range (2992,3129),(-4832,-4504)
		-- if _GF_pos_xy_in_range(player.get_player_coords(_pid),2700,3400,-5100,-4200) then -- about 300m distance from ship
			-- ship=true
			-- return 1
		-- else
		if _GF_pos_xy_in_range(player.get_player_coords(_pid),3400,6200,-6500,-3600) then -- about 400m-600m distance from cayo
			cayo=true
			return 2
		end
		return 0
	end
	while f.on do
		system.yield(10)
		--_GT_gta_map.ship = ship
		_GT_gta_map.cayo = cayo
		ship,cayo=false,false
		if time < utils.time_ms() then
			self_blink = _GF_opp_bool(self_blink)
			time = utils.time_ms() + 669
		end	
		if int_time < utils.time_ms() and _GT_plyr_info.interior[player.player_id()+1] == false then
			_GT_gta_map.my_pos=player.get_player_coords(player.player_id())
			int_time = utils.time_ms() + 5000
		end
		for i=1, 32 do
			if _GF_valid_pid(_GT_gta_map.plyr_list[i][1]) and _GT_gta_map.plyr_list[i][1] ~= player.player_id() then
				temp_near = near_ship_or_cayo(_GT_gta_map.plyr_list[i][1])
				if _GT_plyr_info.interior[i] and temp_near == 0 then
					_GT_gta_map.plyr_list[i][2] = false
					--_GT_gta_map.plyr_list[i][8] = _GF_plyr_name(i-1).." - ".._GF_intrr_str(i-1)..", "
				else
					_GT_gta_map.plyr_record(i,_GT_gta_map.hotkey_bool)
				end
			else
				_GT_gta_map.plyr_list[i][2] = false
			end
		end
		if _GF_valid_pid(player.player_id()) then	--ensures that your blip is always shown last so you can be seen
			_GT_gta_map.plyr_list[33][1] = player.player_id()
			temp_near = near_ship_or_cayo(_GT_gta_map.plyr_list[33][1])
			if _GT_plyr_info.interior[player.player_id()+1] and temp_near == 0 then
				_GT_gta_map.plyr_list[33][2] = false
				--_GT_gta_map.plyr_list[33][8] = _GF_plyr_name(player.player_id()).." - ".._GF_intrr_str(player.player_id())..", "
			elseif self_blink then
				_GT_gta_map.plyr_record(33,_GT_gta_map.hotkey_bool)
			else
				_GT_gta_map.plyr_list[33][2] = false
			end
			--_GT_gta_map.ship_me = (temp_near == 1)
			_GT_gta_map.cayo_me = (temp_near == 2)
			_GT_gta_map.cmpnd = _GF_pos_xy_in_range(player.get_player_coords(player.player_id()),4952,5101.5,-5819,-5671)
			if _GT_gta_map.cayo_me and not _GT_gta_map.cmpnd then _GT_gta_map.cayo_me_size = 0.69 else _GT_gta_map.cayo_me_size =1 end
		else
			_GT_gta_map.plyr_list[33][2] = false
		end
	end
end)
_GT_gta_map.plyr_info_feat.hidden=true

_GT_gta_map.hotkey_feat=menu.add_feature("Hotkey do hidden","toggle",_G_GTA_map_parent.id,function(f)
	while f.on do
		system.yield(25)
		if _GF_feature_keys_down(_GT_gta_map.hotkey_set_feat,_GT_gta_map.hotkey1_select,_GT_gta_map.hotkey2_select,_GT_gta_map.hotkey3_select) then
			_GT_gta_map.hotkey_bool = _GF_opp_bool(_GT_gta_map.hotkey_bool)
			system.yield(125)
		end
	end
end)
_GT_gta_map.hotkey_feat.hidden=true

_GT_gta_map.mouse_adjust=menu.add_feature("Adjust map with mouse","toggle",_G_GTA_map_parent.id, function(f)
	while f.on do
		system.yield(0)
		if _GT_gta_map.hotkey_bool then
			if controls.is_control_just_pressed(0,15) then
				_GT_gta_map.map2_size.value = _GT_gta_map.map2_size.value + .25
			elseif controls.is_control_just_pressed(0,14) then
				_GT_gta_map.map2_size.value = _GT_gta_map.map2_size.value - .25
			end
			_GT_gta_map.pos2_y.value=_GT_gta_map.pos2_y.value + (controls.get_control_normal(0,12)*-1*.015)
			_GT_gta_map.pos2_x.value=_GT_gta_map.pos2_x.value + (controls.get_control_normal(0,13)*.015)
		else
			if controls.is_control_just_pressed(0,15) then
				_GT_gta_map.map1_size.value = _GT_gta_map.map1_size.value + .25
			elseif controls.is_control_just_pressed(0,14) then
				_GT_gta_map.map1_size.value = _GT_gta_map.map1_size.value - .25
			end
			_GT_gta_map.pos1_y.value=_GT_gta_map.pos1_y.value + (controls.get_control_normal(0,12)*-1*.015)
			_GT_gta_map.pos1_x.value=_GT_gta_map.pos1_x.value + (controls.get_control_normal(0,13)*.015)
		end
		if _GF_vk_key_down("RETURN") or _GF_vk_key_down("ESCAPE") then
			f.on=false
		end
	end
end)

---------------------------------------------------------------------------------------------------------------
_GT_gta_map.sttngs_prnt = menu.add_feature("Standard Profile","parent",_G_GTA_map_parent.id)

menu.add_feature("Apply default profile settings","action",_GT_gta_map.sttngs_prnt.id,function()
	_GT_gta_map.recc_sett_1()
end)
-- _GT_gta_map.cayo_c_x = menu.add_feature("TEMP Ship CENTER X offset","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f) --4763.5
	-- menu.notify(f.value,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo_c_x.min = 2700
-- _GT_gta_map.cayo_c_x.max = 3400
-- _GT_gta_map.cayo_c_x.mod = .5
-- _GT_gta_map.cayo_c_x.value = 3058

-- _GT_gta_map.cayo_c_y = menu.add_feature("TEMP Ship CENTER Y offset","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f) -- -5153.5
	-- menu.notify(f.value,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo_c_y.min = -5100
-- _GT_gta_map.cayo_c_y.max = -4200
-- _GT_gta_map.cayo_c_y.mod = .5
-- _GT_gta_map.cayo_c_y.value = -4673
			
-- _GT_gta_map.cayo_math_x = menu.add_feature("TEMP Ship MATH X offset","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f) --1730
	-- menu.notify(f.value,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo_math_x.min = 10
-- _GT_gta_map.cayo_math_x.max = 10000
-- _GT_gta_map.cayo_math_x.mod = .5
-- _GT_gta_map.cayo_math_x.value = 325

-- _GT_gta_map.cayo_math_y = menu.add_feature("TEMP Ship MATH Y offset","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f) -- 980
	-- menu.notify(f.value,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo_math_y.min = 10
-- _GT_gta_map.cayo_math_y.max = 10000
-- _GT_gta_map.cayo_math_y.mod = .5
-- _GT_gta_map.cayo_math_y.value = 195

-- _GT_gta_map.cayo1x = menu.add_feature("TEMP Cayo X offset","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f) --0.4399
	-- menu.notify(f.value,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo1x.min = 0.05
-- _GT_gta_map.cayo1x.max = 0.68
-- _GT_gta_map.cayo1x.mod = 0.0001
-- _GT_gta_map.cayo1x.value = 0.22

-- _GT_gta_map.cayo1x_mod = menu.add_feature("TEMP Cayo X offset MOD","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f)
	-- local mod =1
	-- for i=1,f.value do
		-- mod=mod*.1
	-- end
	-- _GT_gta_map.cayo1x.mod=mod
	-- menu.notify(mod,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo1x_mod.min = 1
-- _GT_gta_map.cayo1x_mod.max = 4
-- _GT_gta_map.cayo1x_mod.mod = 1

-- _GT_gta_map.cayo1y = menu.add_feature("TEMP Cayo y offset","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f)-- -1.1699
	-- menu.notify(f.value,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo1y.min = -3
-- _GT_gta_map.cayo1y.max = -0.1
-- _GT_gta_map.cayo1y.mod = 0.0001
-- _GT_gta_map.cayo1y.value = -0.9

-- _GT_gta_map.cayo1x_mod = menu.add_feature("TEMP Cayo Y offset MOD","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f)
	-- local mod =1
	-- for i=1,f.value do
		-- mod=mod*.1
	-- end
	-- _GT_gta_map.cayo1y.mod=mod
	-- menu.notify(mod,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo1x_mod.min = 1
-- _GT_gta_map.cayo1x_mod.max = 4
-- _GT_gta_map.cayo1x_mod.mod = 1

-- _GT_gta_map.cayo_s = menu.add_feature("TEMP Ship size offset","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f) --0.9339
	-- menu.notify(f.value,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo_s.min = 0.01
-- _GT_gta_map.cayo_s.max = 4
-- _GT_gta_map.cayo_s.mod = 0.1
-- _GT_gta_map.cayo_s.value = 0.15

-- _GT_gta_map.cayo_s_mod = menu.add_feature("TEMP Cayo size offset MOD","action_value_f",_GT_gta_map.sttngs_prnt.id,function(f)
	-- local mod =1
	-- for i=1,f.value do
		-- mod=mod*.1
	-- end
	-- _GT_gta_map.cayo_s.mod=mod
	-- menu.notify(mod,_G_GeeVer,10)
-- end)
-- _GT_gta_map.cayo_s_mod.min = 1
-- _GT_gta_map.cayo_s_mod.max = 4
-- _GT_gta_map.cayo_s_mod.mod = 1

_GT_gta_map.z1 = menu.add_feature("Heading marker selection","action_value_str",_GT_gta_map.sttngs_prnt.id)
_GT_gta_map.z1.set_str_data(_GT_gta_map.z1,_GT_gta_map.head_mark_str)

_GT_gta_map.head1_alpha_feat = menu.add_feature("Heading marker visibility","autoaction_value_f",_GT_gta_map.sttngs_prnt.id)
_GF_set_feat_i_f(_GT_gta_map.head1_alpha_feat,0,1,.05,1)

_GT_gta_map.head1_size = menu.add_feature("Heading marker size","autoaction_value_f",_GT_gta_map.sttngs_prnt.id)
_GF_set_feat_i_f(_GT_gta_map.head1_size,.25,2,.05,1)

_GT_gta_map.pos1_x = menu.add_feature("Map X pos","action_value_f",_GT_gta_map.sttngs_prnt.id)
_GF_set_feat_i_f(_GT_gta_map.pos1_x,-1,1,.01,-.89)

_GT_gta_map.pos1_y = menu.add_feature("Map Y pos","action_value_f",_GT_gta_map.sttngs_prnt.id)
_GF_set_feat_i_f(_GT_gta_map.pos1_y,-1,1,.01,.15)

_GT_gta_map.type1_feat=menu.add_feature("Map type", "action_value_str", _GT_gta_map.sttngs_prnt.id, function()
end)_GT_gta_map.type1_feat.set_str_data(_GT_gta_map.type1_feat,{"Color","3d", "Dark"})

_GT_gta_map.map1_size = menu.add_feature("Map size","action_value_f",_GT_gta_map.sttngs_prnt.id)
_GF_set_feat_i_f(_GT_gta_map.map1_size,.1,3,.01,.26)

_GT_gta_map.map1_alpha_feat = menu.add_feature("Map Visibility","autoaction_value_f",_GT_gta_map.sttngs_prnt.id)
_GF_set_feat_i_f(_GT_gta_map.map1_alpha_feat,0,1,.05,.5)

_GT_gta_map.map1_zoom = menu.add_feature("Auto-zoom","value_str",_GT_gta_map.sttngs_prnt.id)
_GT_gta_map.map1_zoom:set_str_data({"Always","Not in interior"})

_GT_gta_map.plyr1_size = menu.add_feature("Player blip size","action_value_f",_GT_gta_map.sttngs_prnt.id)
_GF_set_feat_i_f(_GT_gta_map.plyr1_size,.1,3,.1,1.5)

_GT_gta_map.plyr1_alpha_feat = menu.add_feature("Player blip Visibility","autoaction_value_f",_GT_gta_map.sttngs_prnt.id)
_GF_set_feat_i_f(_GT_gta_map.plyr1_alpha_feat,0,1,.05,1)

_GT_gta_map.plyr1_name = menu.add_feature("Show player name","toggle",_GT_gta_map.sttngs_prnt.id)

_GT_gta_map.plyr1_name_size = menu.add_feature("Player name size","autoaction_value_f",_GT_gta_map.sttngs_prnt.id)
_GF_set_feat_i_f(_GT_gta_map.plyr1_name_size,.1,3,.1,.8)

function _GT_gta_map.recc_sett_1()
	_GT_gta_map.pos1_x.value = -0.89
	_GT_gta_map.pos1_y.value = 0.15
	_GT_gta_map.type1_feat.value = 0
	_GT_gta_map.map1_size.value = 0.26
	_GT_gta_map.map1_alpha_feat.value = 0.5
	_GT_gta_map.map1_zoom.on=true
	_GT_gta_map.plyr1_size.value = 1.5
	_GT_gta_map.plyr1_alpha_feat.value = 1.00
	_GT_gta_map.plyr1_name.on=false
	_GT_gta_map.plyr1_name_size.value = 0.8
	_GT_gta_map.z1.value=14
	_GT_gta_map.head1_alpha_feat.value=.5
	_GT_gta_map.head1_size.value=1

end
_GT_gta_map.recc_sett_1()
---------------------------------------------------------------------------------------------------------------------------
_GT_gta_map.sttngs_prnt2 = menu.add_feature("Hotkey Profile","parent",_G_GTA_map_parent.id,function()
	_GT_gta_map.hotkey_set_feat.name="Map switch key(s): ".._GT_keys_vk_name[_GT_gta_map.hotkey1_select.value+1]
end)

menu.add_feature("Apply default profile settings","action",_GT_gta_map.sttngs_prnt2.id,function()
	_GT_gta_map.recc_sett_2()
	_GT_gta_map.hotkey_set_feat.name="Map switch key(s): ".._GT_keys_vk_name[_GT_gta_map.hotkey1_select.value+1]
end)

_GT_gta_map.hotkey1_select=menu.add_feature("Key1 for gta map2","autoaction_value_str",_GT_gta_map.sttngs_prnt2.id,function(f)
end)_GT_gta_map.hotkey1_select.set_str_data(_GT_gta_map.hotkey1_select,_GT_keys_vk_name)
_GT_gta_map.hotkey1_select.hidden=true


_GT_gta_map.hotkey2_select=menu.add_feature("Key2 for gta map2","autoaction_value_str",_GT_gta_map.sttngs_prnt2.id,function(f)
end)_GT_gta_map.hotkey2_select.set_str_data(_GT_gta_map.hotkey2_select,_GT_keys_vk_name)
_GT_gta_map.hotkey2_select.hidden=true


_GT_gta_map.hotkey3_select=menu.add_feature("Key3 for gta map2","autoaction_value_str",_GT_gta_map.sttngs_prnt2.id,function(f)
end)_GT_gta_map.hotkey3_select.set_str_data(_GT_gta_map.hotkey3_select,_GT_keys_vk_name)
_GT_gta_map.hotkey3_select.hidden=true


_GT_gta_map.hotkey_set_feat=menu.add_feature("Set key(s) map switch","action_value_str",_GT_gta_map.sttngs_prnt2.id,function(f)
	if _GF_set_keybinds(f.value+1,"GTA Map",_GT_gta_map.hotkey1_select,_GT_gta_map.hotkey2_select,_GT_gta_map.hotkey3_select) then
		if f.value == 0 then
			f.name="Set key(s) map switch: ".._GT_keys_vk_name[_GT_gta_map.hotkey1_select.value+1]
		elseif f.value == 1 then
			f.name="Set key(s) map switch: ".._GT_keys_vk_name[_GT_gta_map.hotkey1_select.value+1].." ".._GT_keys_vk_name[_GT_gta_map.hotkey2_select.value+1]
		else
			f.name="Set key(s) map switch: ".._GT_keys_vk_name[_GT_gta_map.hotkey1_select.value+1].." ".._GT_keys_vk_name[_GT_gta_map.hotkey2_select.value+1].." ".._GT_keys_vk_name[_GT_gta_map.hotkey3_select.value+1]
		end
	end
end)_GT_gta_map.hotkey_set_feat.set_str_data(_GT_gta_map.hotkey_set_feat,{"One", "Two","Three"})
_GT_gta_map.hotkey_set_feat.value=0

_GT_gta_map.z2 = menu.add_feature("Heading marker","action_value_str",_GT_gta_map.sttngs_prnt2.id)
_GT_gta_map.z2.set_str_data(_GT_gta_map.z2,_GT_gta_map.head_mark_str)

_GT_gta_map.head2_alpha_feat = menu.add_feature("Heading marker visibility","autoaction_value_f",_GT_gta_map.sttngs_prnt2.id)
_GF_set_feat_i_f(_GT_gta_map.head2_alpha_feat,0,1,.05,1)

_GT_gta_map.head2_size = menu.add_feature("Heading marker size","autoaction_value_f",_GT_gta_map.sttngs_prnt2.id)
_GF_set_feat_i_f(_GT_gta_map.head2_size,.25,2,.05,1)

_GT_gta_map.pos2_x = menu.add_feature("X Position","action_value_f",_GT_gta_map.sttngs_prnt2.id)
_GF_set_feat_i_f(_GT_gta_map.pos2_x,-1,1,.01,-.09)

_GT_gta_map.pos2_y = menu.add_feature("Y Position","action_value_f",_GT_gta_map.sttngs_prnt2.id)
_GF_set_feat_i_f(_GT_gta_map.pos2_y,-1,1,.01,-.07)

_GT_gta_map.type2_feat=menu.add_feature("Map type", "action_value_str", _GT_gta_map.sttngs_prnt2.id, function()
end)_GT_gta_map.type2_feat.set_str_data(_GT_gta_map.type2_feat,{"Color","3d", "Dark"})

_GT_gta_map.map2_size = menu.add_feature("Map Size","action_value_f",_GT_gta_map.sttngs_prnt2.id)
_GF_set_feat_i_f(_GT_gta_map.map2_size,.1,3,.01,.69)

_GT_gta_map.map2_alpha_feat = menu.add_feature("Map Visibility","autoaction_value_f",_GT_gta_map.sttngs_prnt2.id)
_GF_set_feat_i_f(_GT_gta_map.map2_alpha_feat,0,1,.05,.69)

_GT_gta_map.map2_zoom = menu.add_feature("Auto-zoom","value_str",_GT_gta_map.sttngs_prnt2.id)
_GT_gta_map.map2_zoom:set_str_data({"Always","Not in interior"})

_GT_gta_map.plyr2_size = menu.add_feature("Player blip size","action_value_f",_GT_gta_map.sttngs_prnt2.id)
_GF_set_feat_i_f(_GT_gta_map.plyr2_size,.1,3,.1,.8)

_GT_gta_map.plyr2_alpha_feat = menu.add_feature("Player blip Visibility","autoaction_value_f",_GT_gta_map.sttngs_prnt2.id)
_GF_set_feat_i_f(_GT_gta_map.plyr2_alpha_feat,0,1,.05,1)

_GT_gta_map.plyr2_name = menu.add_feature("Show player name","toggle",_GT_gta_map.sttngs_prnt2.id)

_GT_gta_map.plyr2_name_size = menu.add_feature("Player name size","autoaction_value_f",_GT_gta_map.sttngs_prnt2.id)
_GF_set_feat_i_f(_GT_gta_map.plyr2_name_size,.1,3,.05,1.5)

function _GT_gta_map.recc_sett_2()
	_GT_gta_map.plyr2_alpha_feat.value = 1.00
	_GT_gta_map.plyr2_size.value = .8
	_GT_gta_map.map2_alpha_feat.value = 0.69
	_GT_gta_map.map2_zoom.on=true
	_GT_gta_map.map2_size.value = .69
	_GT_gta_map.pos2_y.value = -.07
	_GT_gta_map.pos2_x.value = -.09
	_GT_gta_map.hotkey_set_feat.value=0
	_GT_gta_map.hotkey3_select.value=8
	_GT_gta_map.hotkey2_select.value=8
	_GT_gta_map.hotkey1_select.value=8		
	_GT_gta_map.plyr2_name.on=true
	_GT_gta_map.plyr2_name_size.value = 1.5
	_GT_gta_map.z2.value=14
	_GT_gta_map.head2_alpha_feat.value=.69
	_GT_gta_map.head2_size.value=1
end
_GT_gta_map.recc_sett_2()


---------------------------------------------------------------------------------------------------------------
_GT_gta_map.fuckup_parent=menu.add_feature("Monitor/ratio adjustments","parent",_G_GTA_map_parent.id,function(f)
	local screen_x,screen_y = graphics.get_screen_width(),graphics.get_screen_height()
	local screen_table = {screen_x,screen_y}
	table.sort(screen_table, function(a, b) return (a)>(b) end)
	local div=1
	for i=1, screen_table[1] do
		if (math.floor(screen_x/i) - (screen_x/i) == 0) and (math.floor(screen_y/i) - (screen_y/i) == 0) then
		    div=i
		end
	end
	menu.notify("Screen resolution "..screen_x.."/"..screen_y.."\nRatio "..math.floor(screen_x/div)..":"..math.floor(screen_y/div).."\nAdjustments should only be required for ratios other than 16:9 OR possibly multi-monitor setups. Common adjustment is 1.5-2.0 for ALL maps X and Y.",_G_GeeVer,10)
end)

_GT_gta_map.fuckup_cayo=menu.add_feature("Cayo Perico mini-map","parent",_GT_gta_map.fuckup_parent.id,function(f)
	menu.notify("This will adjust the location of the small Cayo Perico map in relation to the other map when you are not on Cayo Perico.",_G_GeeVer,7)
end)

_GT_gta_map.cp_mini_math_x = menu.add_feature("X offset","action_value_f",_GT_gta_map.fuckup_cayo.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)_GF_set_feat_i_f(_GT_gta_map.cp_mini_math_x,0.1,5,0.001,1)

_GT_gta_map.cp_mini_math_y = menu.add_feature("Y offset","action_value_f",_GT_gta_map.fuckup_cayo.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)_GF_set_feat_i_f(_GT_gta_map.cp_mini_math_y,0.1,5,0.001,1)

_GT_gta_map.cp_mini_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GT_gta_map.fuckup_cayo.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GT_gta_map.cp_mini_math_x.mod=_table[f.value+1]
	_GT_gta_map.cp_mini_math_y.mod=_table[f.value+1]
	menu.notify("offset mod changed to ".._table[f.value+1],_G_GeeVer,3)
end)_GT_gta_map.cp_mini_mod.set_str_data(_GT_gta_map.cp_mini_mod,{"0.0001","0.001","0.01","0.1"})

_GT_gta_map.fuckup_plyr_veh=menu.add_feature("Player/Vehicle blips","parent",_GT_gta_map.fuckup_parent.id,function(f)
	menu.notify("This will adjust the location of the players on the map, not the map itself",_G_GeeVer,4)
end)

_GT_gta_map.full_math_x = menu.add_feature("Mark current map","action",_GT_gta_map.fuckup_plyr_veh.id,function(f)
	_GT_gta_map.fuckup_full.name="Full map"
	_GT_gta_map.fuckup_qrtr.name="Quarter maps"
	_GT_gta_map.fuckup_cntr.name="Center zoom maps"
	_GT_gta_map.fuckup_othr.name="Other zoom maps"
	_GT_gta_map.fuckup_cp.name="Cayo Perico map"
	_GT_gta_map.fuckup_cp_cmpnd.name="Cayo Perico Compound"
	if _GT_gta_map.cmpnd then
		_GT_gta_map.fuckup_cp_cmpnd.name="*Cayo Perico Compound*"
	elseif _GT_gta_map.cayo_me then
		_GT_gta_map.fuckup_cp.name="*Cayo Perico map*"
	elseif _GT_gta_map.show_map > 0 then
		if _GT_gta_map.show_map == 5 or _GT_gta_map.show_map == 12 then
			_GT_gta_map.fuckup_cntr.name="*Center zoom maps*"
		elseif _GT_gta_map.show_map > 5 then
			_GT_gta_map.fuckup_othr.name="*Other zoom maps*"		
		else
			_GT_gta_map.fuckup_qrtr.name="*Quarter maps*"
		end
	else
		_GT_gta_map.fuckup_full.name="*Full map*"
	end
end)
---------------------------------------------------------------------------------------------------------------
_GT_gta_map.fuckup_all=menu.add_feature("Set for ALL maps","parent",_GT_gta_map.fuckup_plyr_veh.id)

_GT_gta_map.all_math_x = menu.add_feature("X offset (Press to apply)","action_value_f",_GT_gta_map.fuckup_all.id,function(f)
	_GT_gta_map.full_math_x.value=f.value
	_GT_gta_map.qrtr_math_x.value=f.value
	_GT_gta_map.cntr_math_x.value=f.value
	_GT_gta_map.othr_math_x.value=f.value
	_GT_gta_map.cp_math_x.value=f.value
	_GT_gta_map.cp_cmpnd_math_x.value=f.value
	menu.notify("All maps x offset changed to "..f.value,_G_GeeVer,3)
end)_GF_set_feat_i_f(_GT_gta_map.all_math_x,0.1,5,0.001,1)

_GT_gta_map.all_math_y = menu.add_feature("Y offset (Press to apply)","action_value_f",_GT_gta_map.fuckup_all.id,function(f)
	_GT_gta_map.full_math_y.value=f.value
	_GT_gta_map.qrtr_math_y.value=f.value
	_GT_gta_map.cntr_math_y.value=f.value
	_GT_gta_map.othr_math_y.value=f.value
	_GT_gta_map.cp_math_y.value=f.value
	_GT_gta_map.cp_cmpnd_math_y.value=f.value
	menu.notify("All maps y offset changed to "..f.value,_G_GeeVer,3)
end)_GF_set_feat_i_f(_GT_gta_map.all_math_y,0.1,5,0.001,1)

_GT_gta_map.all_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GT_gta_map.fuckup_all.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GT_gta_map.all_math_x.mod=_table[f.value+1]
	_GT_gta_map.all_math_y.mod=_table[f.value+1]
	_GT_gta_map.full_math_x.mod=_table[f.value+1]
	_GT_gta_map.full_math_y.mod=_table[f.value+1]
	_GT_gta_map.qrtr_math_x.mod=_table[f.value+1]
	_GT_gta_map.qrtr_math_y.mod=_table[f.value+1]
	_GT_gta_map.cntr_math_x.mod=_table[f.value+1]
	_GT_gta_map.cntr_math_y.mod=_table[f.value+1]
	_GT_gta_map.othr_math_x.mod=_table[f.value+1]
	_GT_gta_map.othr_math_y.mod=_table[f.value+1]
	_GT_gta_map.cp_math_x.mod=_table[f.value+1]
	_GT_gta_map.cp_math_y.mod=_table[f.value+1]
	_GT_gta_map.cp_cmpnd_math_x.mod=_table[f.value+1]
	_GT_gta_map.cp_cmpnd_math_y.mod=_table[f.value+1]
	menu.notify("All maps offset mod changed to ".._table[f.value+1],_G_GeeVer,3)
end)
_GT_gta_map.all_math_mod.set_str_data(_GT_gta_map.all_math_mod,{"0.0001","0.001","0.01","0.1"})
---------------------------------------------------------------------------------------------------------------
_GT_gta_map.fuckup_full=menu.add_feature("Full map","parent",_GT_gta_map.fuckup_plyr_veh.id)
_GT_gta_map.full_math_x = menu.add_feature("X offset","action_value_f",_GT_gta_map.fuckup_full.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.full_math_x,0.1,5,0.001,1)

_GT_gta_map.full_math_y = menu.add_feature("Y offset","action_value_f",_GT_gta_map.fuckup_full.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.full_math_y,0.1,5,0.001,1)

_GT_gta_map.full_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GT_gta_map.fuckup_full.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GT_gta_map.full_math_x.mod=_table[f.value+1]
	_GT_gta_map.full_math_y.mod=_table[f.value+1]
	menu.notify(_GT_gta_map.fuckup_full.name.." offset mod changed to ".._table[f.value+1],_G_GeeVer,3)
end)
_GT_gta_map.full_math_mod.set_str_data(_GT_gta_map.full_math_mod,{"0.0001","0.001","0.01","0.1"})
---------------------------------------------------------------------------------------------------------------
_GT_gta_map.fuckup_qrtr=menu.add_feature("Quarter maps","parent",_GT_gta_map.fuckup_plyr_veh.id)
_GT_gta_map.qrtr_math_x = menu.add_feature("X offset","action_value_f",_GT_gta_map.fuckup_qrtr.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.qrtr_math_x,0.1,5,0.001,1)

_GT_gta_map.qrtr_math_y = menu.add_feature("Y offset","action_value_f",_GT_gta_map.fuckup_qrtr.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.qrtr_math_y,0.1,5,0.001,1)

_GT_gta_map.qrtr_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GT_gta_map.fuckup_qrtr.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GT_gta_map.qrtr_math_x.mod=_table[f.value+1]
	_GT_gta_map.qrtr_math_y.mod=_table[f.value+1]
	menu.notify(_GT_gta_map.fuckup_qrtr.name.." offset mod changed to ".._table[f.value+1],_G_GeeVer,3)
end)
_GT_gta_map.qrtr_math_mod.set_str_data(_GT_gta_map.qrtr_math_mod,{"0.0001","0.001","0.01","0.1"})
---------------------------------------------------------------------------------------------------------------
_GT_gta_map.fuckup_cntr=menu.add_feature("Center zoom maps","parent",_GT_gta_map.fuckup_plyr_veh.id)
_GT_gta_map.cntr_math_x = menu.add_feature("X offset","action_value_f",_GT_gta_map.fuckup_cntr.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.cntr_math_x,0.1,5,0.001,1)

_GT_gta_map.cntr_math_y = menu.add_feature("Y offset","action_value_f",_GT_gta_map.fuckup_cntr.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.cntr_math_y,0.1,5,0.001,1)

_GT_gta_map.cntr_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GT_gta_map.fuckup_cntr.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GT_gta_map.cntr_math_x.mod=_table[f.value+1]
	_GT_gta_map.cntr_math_y.mod=_table[f.value+1]
	menu.notify(_GT_gta_map.fuckup_cntr.name.." offset mod changed to ".._table[f.value+1],_G_GeeVer,3)
end)
_GT_gta_map.cntr_math_mod.set_str_data(_GT_gta_map.cntr_math_mod,{"0.0001","0.001","0.01","0.1"})
---------------------------------------------------------------------------------------------------------------
_GT_gta_map.fuckup_othr=menu.add_feature("Other zoom maps","parent",_GT_gta_map.fuckup_plyr_veh.id)
_GT_gta_map.othr_math_x = menu.add_feature("X offset","action_value_f",_GT_gta_map.fuckup_othr.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.othr_math_x,0.1,5,0.001,1)

_GT_gta_map.othr_math_y = menu.add_feature("Y offset","action_value_f",_GT_gta_map.fuckup_othr.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.othr_math_y,0.1,5,0.001,1)

_GT_gta_map.othr_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GT_gta_map.fuckup_othr.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GT_gta_map.othr_math_x.mod=_table[f.value+1]
	_GT_gta_map.othr_math_y.mod=_table[f.value+1]
	menu.notify(_GT_gta_map.fuckup_othr.name.." offset mod changed to ".._table[f.value+1],_G_GeeVer,3)
end)
_GT_gta_map.othr_math_mod.set_str_data(_GT_gta_map.othr_math_mod,{"0.0001","0.001","0.01","0.1"})
---------------------------------------------------------------------------------------------------------------
_GT_gta_map.fuckup_cp=menu.add_feature("Cayo Perico map","parent",_GT_gta_map.fuckup_plyr_veh.id)
_GT_gta_map.cp_math_x = menu.add_feature("X offset","action_value_f",_GT_gta_map.fuckup_cp.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.cp_math_x,0.1,5,0.001,1)

_GT_gta_map.cp_math_y = menu.add_feature("Y offset","action_value_f",_GT_gta_map.fuckup_cp.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.cp_math_y,0.1,5,0.001,1)

_GT_gta_map.cp_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GT_gta_map.fuckup_cp.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GT_gta_map.cp_math_x.mod=_table[f.value+1]
	_GT_gta_map.cp_math_y.mod=_table[f.value+1]
	menu.notify(_GT_gta_map.fuckup_cp.name.." offset mod changed to ".._table[f.value+1],_G_GeeVer,3)
end)
_GT_gta_map.cp_math_mod.set_str_data(_GT_gta_map.cp_math_mod,{"0.0001","0.001","0.01","0.1"})
---------------------------------------------------------------------------------------------------------------
_GT_gta_map.fuckup_cp_cmpnd=menu.add_feature("Cayo Perico Compound","parent",_GT_gta_map.fuckup_plyr_veh.id)
_GT_gta_map.cp_cmpnd_math_x = menu.add_feature("X offset","action_value_f",_GT_gta_map.fuckup_cp_cmpnd.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.cp_cmpnd_math_x,0.1,5,0.001,1)

_GT_gta_map.cp_cmpnd_math_y = menu.add_feature("Y offset","action_value_f",_GT_gta_map.fuckup_cp_cmpnd.id,function(f)
	menu.notify(f.value,_G_GeeVer,3)
end)
_GF_set_feat_i_f(_GT_gta_map.cp_cmpnd_math_y,0.1,5,0.001,1)

_GT_gta_map.cp_cmpnd_math_mod = menu.add_feature("Adjustment sensitivity","action_value_str",_GT_gta_map.fuckup_cp_cmpnd.id,function(f)
	local _table = {0.0001,0.001,0.01,0.1}
	_GT_gta_map.cp_cmpnd_math_x.mod=_table[f.value+1]
	_GT_gta_map.cp_cmpnd_math_y.mod=_table[f.value+1]
	menu.notify(_GT_gta_map.fuckup_cp_cmpnd.name.." offset mod changed to ".._table[f.value+1],_G_GeeVer,3)
end)
_GT_gta_map.cp_cmpnd_math_mod.set_str_data(_GT_gta_map.cp_cmpnd_math_mod,{"0.0001","0.001","0.01","0.1"})

_GT_gta_map.map_feat.on=true

-- print("GTA Map loaded            - "..(utils.time_ms()-_G_load_time_temp).."ms - Line: "..debug.getinfo(1).currentline)
-- _G_load_time_temp = utils.time_ms()


_GT_remote_ped = {}

_GT_remote_ped.directory=utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts\\GeeSkid\\remote_ped\\"
function _GT_remote_ped.info_write(_file,_text)
	local file = io.open(_GT_remote_ped.directory.._file..".txt", "w")
	file:write(_text)
	file:close()
end

function _GT_remote_ped.info_get(_file)
	local file = io.open(_GT_remote_ped.directory.._file..".txt", "r")
	local text = nil
	for line in file:lines() do
		if line ~= nil then
			text = tonumber(line)
			break
		end
	end
	file:close()
	return text
end

function _GT_remote_ped.info_check(_file,_default)
	if not utils.dir_exists(_GT_remote_ped.directory) then
		utils.make_dir(_GT_remote_ped.directory)
	end
	if not utils.file_exists(_GT_remote_ped.directory.._file..".txt") then
		_GT_remote_ped.info_write(_file,_default)
	end
	local text = _GT_remote_ped.info_get(_file)
	if text == nil then
		_GT_remote_ped.info_write(_file,_default)
	end
end



_GT_remote_ped.info_check("PED_MODEL_HASH",gameplay.get_hash_key("a_f_m_fatcult_01"))
_GT_remote_ped.ped_hash = _GT_remote_ped.info_get("PED_MODEL_HASH")
if not streaming.is_model_a_ped(_GT_remote_ped.ped_hash) then
	_GT_remote_ped.ped_hash=gameplay.get_hash_key("a_f_m_fatcult_01")
end
_GT_remote_ped.info_check("PED_WEAPON_HASH",gameplay.get_hash_key("weapon_gusenberg"))
_GT_remote_ped.weap_hash = _GT_remote_ped.info_get("PED_WEAPON_HASH")
if not _GF_table_has(_GT_all_weap_hash,_GT_remote_ped.weap_hash) then
	_GT_remote_ped.weap_hash=gameplay.get_hash_key("weapon_gusenberg")
end

_GT_remote_ped.prnt=menu.add_feature("Remote ped","parent",_G_Utilities.id)
_GT_remote_ped.feat=menu.add_feature("Remote ped","toggle",_GT_remote_ped.prnt.id,function(f)
	local all_peds,ped_speed,move,aim_or_shoot,shoot,hit,ray_pos,aim_pos,dir,my_pos,ray_start,_bool,screen_pos,plyr_pid,plyr_name,good_ped,good_pid
	local this_ped,pos,time=nil
	local function get_input()
		dir = 0
		if _GF_key_active(32,1) or _GF_key_active(33,1) or _GF_key_active(34,1) or _GF_key_active(35,1) then
			ped_speed = 1.0
			move = 0
		else
			ped_speed = 0.0
			move = 1
		end
		if move == 0 then
			if _GF_key_active(209,1) then
				ped_speed = 2.0
			end
			if _GF_key_active(32,1) then -- W
				if (not _GF_key_active(34,1) and not _GF_key_active(35,1)) or (_GF_key_active(34,1) and _GF_key_active(35,1)) then
					dir=0
				elseif _GF_key_active(34,1) then -- A 
					dir=45
				elseif _GF_key_active(35,1) then -- D
					dir=-45
				end
			elseif _GF_key_active(33,1) then-- S
				if (not _GF_key_active(34,1) and not _GF_key_active(35,1)) or (_GF_key_active(34,1) and _GF_key_active(35,1)) then
					dir=-180
				elseif _GF_key_active(34,1) then -- A 
					dir=135
				elseif _GF_key_active(35,1) then -- D
					dir=-135
				end
			elseif _GF_key_active(34,1) then -- A 
				dir=90
			elseif _GF_key_active(35,1) then -- D
				dir=-90
			end
		end
		aim_or_shoot = (_GF_key_active(25,1.0) or _GF_key_active(24,1.0))
		shoot = _GF_bool_to_01(_GF_key_active(24,1.0))
	end
	local function do_each_frame()
		_GF_set_cam_on_ped(this_ped)
		_GF_set_cam_focus_pos(entity.get_entity_coords(this_ped))
		entity.set_entity_coords_no_offset(_GT_ME._ped(),v3(entity.get_entity_coords(this_ped).x,entity.get_entity_coords(this_ped).y,-50))--entity.get_entity_coords(this_ped)+v3(0,0,-50))
		good_ped=(_GF_is_ent(this_ped) and not entity.is_entity_dead(this_ped))
		good_pid=(_GF_valid_pid(plyr_pid) and _GF_plyr_name(plyr_pid) == plyr_name)
		--native.call(0x1279E861A329E73F,entity.get_entity_coords(this_ped).x,entity.get_entity_coords(this_ped).y) --LockMinimapPosition
	end
	local function remove_ped()
		_G_threads_history[#_G_threads_history+1]=menu.create_thread(function()
			local PED = this_ped
			_GF_remove_ent(PED,1000)
		end,nil)
	end
	local function make_ped()
		_GF_req_stream_hash(_GT_remote_ped.ped_hash)
		this_ped=ped.create_ped(6, _GT_remote_ped.ped_hash,_GF_pos_nearby(player.get_player_coords(plyr_pid),"single_closest",50,"no_water","xyz"), math.random(0,359), true, false)
		_GF_ped_ragdoll(this_ped,false,50)
		_GF_set_ped_health(this_ped,2500,50)
	end
	while f.on do
		plyr_pid=_GT_remote_ped.pid
		plyr_name=_GT_remote_ped.name
		if _GF_valid_pid(plyr_pid) and _GF_plyr_name(plyr_pid) == plyr_name then
			make_ped()
			if _GF_is_ent(this_ped) then
				my_pos = _GT_ME._crds()
				good_ped=(_GF_is_ent(this_ped) and not entity.is_entity_dead(this_ped))
				good_pid=(_GF_valid_pid(plyr_pid) and _GF_plyr_name(plyr_pid) == plyr_name)
				while f.on and good_ped and good_pid do
					get_input()
					pos = _GF_front_of_dir(entity.get_entity_coords(this_ped),cam.get_gameplay_cam_rot()+v3(0,0,dir),2.5)
					if controls.is_control_just_pressed(0, 22) then
						_GF_set_ped_jump(this_ped,1,0)
						time = utils.time_ms()+500
						while time > utils.time_ms() and f.on and good_ped and good_pid do
							system.yield(0)
							do_each_frame()
						end
						while f.on and good_ped and good_pid and entity.is_entity_in_air(this_ped) do
							system.yield(0)
							do_each_frame()
						end
					elseif aim_or_shoot then
						if not weapon.has_ped_got_weapon(this_ped,_GT_remote_ped.weap_hash) then
							_GF_give_ped_weap(this_ped,_GT_remote_ped.weap_hash)
						end
						ray_start = _GF_front_of_dir(cam.get_gameplay_cam_pos(),cam.get_gameplay_cam_rot(),_GF_dist_xy_pospos(entity.get_entity_coords(this_ped),cam.get_gameplay_cam_pos()))
						hit, ray_pos = _GF_raycast_vector(nil,false,ray_start,nil)
						if hit then
							aim_pos = ray_pos
						else
							aim_pos = _GF_front_of_dir(ray_start,cam.get_gameplay_cam_rot(),1000)
						end
						_bool,screen_pos = graphics.project_3d_coord(aim_pos)
						if _bool then
							screen_pos = v2(((screen_pos.x/graphics.get_screen_width()/0.5)-1),((screen_pos.y/graphics.get_screen_height()/0.5)-1)*-1)
							scriptdraw.draw_sprite(_GT_remote_ped.reticle.sprt[_GT_remote_ped.reticle.slct.value],screen_pos,1*_GT_remote_ped.reticle.mrkr_s.value,0, _GF_RGBAToInt(_GT_remote_ped.reticle.mrkr_r.value,_GT_remote_ped.reticle.mrkr_g.value,_GT_remote_ped.reticle.mrkr_b.value,_GT_remote_ped.reticle.mrkr_a.value))
						end
						_GF_set_ped_cur_weap(this_ped,_GT_remote_ped.weap_hash)
						_GF_ped_ammo_refill_instantly(this_ped)
						_GF_ped_mag_infinite(this_ped)
						native.call(0x11315AB3385B8AC0,this_ped,pos.x,pos.y,pos.z,aim_pos.x,aim_pos.y,aim_pos.z,ped_speed,shoot,2.0,0.5,move,0,0,gameplay.get_hash_key("FIRING_PATTERN_FULL_AUTO"))
					elseif ped_speed > 0 then
						native.call(0xD76B57B44F1E6F8B,this_ped,pos.x,pos.y,pos.z,ped_speed,1,0.0,0.5)--TaskGoStraightToCoord
					else
						native.call(0xE73A266DB0CA9042,this_ped,0)--TaskPause
					end
					if entity.get_entity_model_hash(this_ped) ~= _GT_remote_ped.ped_hash then
						remove_ped()
						make_ped()
					end
					system.yield(0)
					do_each_frame()
				end
				remove_ped()
				good_pid=(_GF_valid_pid(plyr_pid) and _GF_plyr_name(plyr_pid) == plyr_name)
				if not good_pid or not f.on then
					_GF_reset_cam_focus_pos()
					--native.call(0x3E93E06DB8EF1F30) --UnlockMinimapPosition
					system.yield(0)
					entity.set_entity_coords_no_offset(_GT_ME._ped(),my_pos)
					system.yield(0)
					f.on=false
				end
			end
		end
		system.yield(100)
	end
	remove_ped()
	_GF_reset_cam_focus_pos()
end)

_GT_remote_ped.plyr_list={}
_GT_remote_ped.pid=nil
_GT_remote_ped.name=nil
_G_threads_history[#_G_threads_history+1]=menu.create_thread(function()
	local do_it,_table = true
	while do_it do
		system.yield(1000)
		_table={}
		for i=0,31 do
			if _GF_valid_pid(i) then
				_table[#_table+1]={PID = i,NAME = _GF_plyr_name(i)}
			end
		end
		_GT_remote_ped.plyr_list={}
		for i=1,#_table do
			_GT_remote_ped.plyr_list[i]=_table[i].NAME
		end
		_GT_remote_ped.select_player:set_str_data(_GT_remote_ped.plyr_list)
		_GT_remote_ped.pid=_table[_GT_remote_ped.select_player.value+1].PID
		_GT_remote_ped.name=_table[_GT_remote_ped.select_player.value+1].NAME
	end
end,nil)
_GT_remote_ped.select_player=menu.add_feature("Near player:", "action_value_str", _GT_remote_ped.prnt.id)
_GT_remote_ped.select_player:set_str_data(_GT_remote_ped.plyr_list)

_GT_remote_ped.weapons = {}
_GT_remote_ped.weapons.main_prnt=menu.add_feature("Select Weapon", "parent", _GT_remote_ped.prnt.id)
_GT_remote_ped.weapons.srch_prnt=menu.add_feature("** Search **", "parent",_GT_remote_ped.weapons.main_prnt.id)
_GT_remote_ped.weapons.srch_list={}

_GT_remote_ped.search=menu.add_feature("Current weapon : "..weapon.get_weapon_name(_GT_remote_ped.weap_hash), "action",_GT_remote_ped.weapons.srch_prnt.id,function(f)
	local status,str = 1
	status,str = _GF_text_input_get("Type weapon name","",25,0)
	if status == 0 then 
		for i=1,#_GT_remote_ped.weapons.srch_list do
			_GT_remote_ped.weapons.srch_list[i].hidden=string.match(string.lower(_GT_remote_ped.weapons.srch_list[i].name), string.lower(str)) == nil
		end
	end
end)

for i=1,#_GT_all_weap_hash do
	_GT_remote_ped.weapons.srch_list[i]=menu.add_feature(weapon.get_weapon_name(_GT_all_weap_hash[i]), "action",_GT_remote_ped.weapons.srch_prnt.id,function(f)
		_GT_remote_ped.weap_hash= _GT_all_weap_hash[i]
		_GT_remote_ped.search.name="Current weapon : "..weapon.get_weapon_name(_GT_remote_ped.weap_hash)
		_GT_remote_ped.info_check("PED_WEAPON_HASH",_GT_remote_ped.weap_hash)
		_GT_remote_ped.info_write("PED_WEAPON_HASH",_GT_remote_ped.weap_hash)
	end)
	_GT_remote_ped.weapons.srch_list[i].hidden=true
end
		
		_GT_remote_ped.weapons.types={[0]="Pistols",[1]="Machine guns",[2]="Assault rifles",[3]="Snipers",[4]="Melee",[5]="Shotguns",[6]="Heavy weapons",[7]="Throwable/Other"}
		_GT_remote_ped.weapons.prnts={}
		_GT_remote_ped.weapons.temp={}
		_GT_remote_ped.weapons.one={}
		for i=0,7 do
			_GT_remote_ped.weapons.temp[i]={}
			_GT_remote_ped.weapons.prnts[i]=menu.add_feature(_GT_remote_ped.weapons.types[i], "parent", _GT_remote_ped.weapons.main_prnt.id)
			for ii=1,#_GT_all_weap_hash do
				if weapon.get_weapon_weapon_wheel_slot(_GT_all_weap_hash[ii])==i and weapon.get_weapon_name(_GT_all_weap_hash[ii]) ~= "Unarmed" then
					_GT_remote_ped.weapons.temp[i][#_GT_remote_ped.weapons.temp[i]+1]=_GT_all_weap_hash[ii]
				end
			end
			table.sort(_GT_remote_ped.weapons.temp[i], function(a, b) return weapon.get_weapon_name(a):lower() <  weapon.get_weapon_name(b):lower() end)
			_GT_remote_ped.weapons.one[i]={}
			for ii=1,#_GT_remote_ped.weapons.temp[i] do
				if _GT_remote_ped.weapons.temp[i][ii] == gameplay.get_hash_key("weapon_stinger") then
					_GT_remote_ped.weapons.one[i][ii]=menu.add_feature("RPG Stinger", "action", _GT_remote_ped.weapons.prnts[i].id, function(f,pid)
						_GT_remote_ped.weap_hash= _GT_remote_ped.weapons.temp[i][ii]
						_GT_remote_ped.search.name="Current weapon : RPG Stinger"
						_GT_remote_ped.info_check("PED_WEAPON_HASH",_GT_remote_ped.weap_hash)
						_GT_remote_ped.info_write("PED_WEAPON_HASH",_GT_remote_ped.weap_hash)
						for iii=0,7 do
							for iiii=1,#_GT_remote_ped.weapons.one[iii] do
								if _GT_remote_ped.weapons.temp[iii][iiii] ~= _GT_remote_ped.weap_hash then
									if  _GT_remote_ped.weapons.temp[iii][iiii] == gameplay.get_hash_key("weapon_stinger") then
										_GT_remote_ped.weapons.one[iii][iiii].name="RPG Stinger"
									else
										_GT_remote_ped.weapons.one[iii][iiii].name=weapon.get_weapon_name(_GT_remote_ped.weapons.temp[iii][iiii])
									end
								else
									if  _GT_remote_ped.weapons.temp[iii][iiii] == gameplay.get_hash_key("weapon_stinger") then
										_GT_remote_ped.weapons.one[iii][iiii].name="** RPG Stinger **"
									else
										_GT_remote_ped.weapons.one[iii][iiii].name="** "..weapon.get_weapon_name(_GT_remote_ped.weapons.temp[iii][iiii]).." **"
									end
								end
							end
						end
					end)
				else
				
					_GT_remote_ped.weapons.one[i][ii]=menu.add_feature(weapon.get_weapon_name(_GT_remote_ped.weapons.temp[i][ii]), "action", _GT_remote_ped.weapons.prnts[i].id, function(f,pid)
						_GT_remote_ped.weap_hash= _GT_remote_ped.weapons.temp[i][ii]
						_GT_remote_ped.search.name="Current weapon : "..weapon.get_weapon_name(_GT_remote_ped.weap_hash)
						_GT_remote_ped.info_check("PED_WEAPON_HASH",_GT_remote_ped.weap_hash)
						_GT_remote_ped.info_write("PED_WEAPON_HASH",_GT_remote_ped.weap_hash)
						for iii=0,7 do
							for iiii=1,#_GT_remote_ped.weapons.one[iii] do
								if _GT_remote_ped.weapons.temp[iii][iiii] ~= _GT_remote_ped.weap_hash then
									if  _GT_remote_ped.weapons.temp[iii][iiii] == gameplay.get_hash_key("weapon_stinger") then
										_GT_remote_ped.weapons.one[iii][iiii].name="RPG Stinger"
									else
										_GT_remote_ped.weapons.one[iii][iiii].name=weapon.get_weapon_name(_GT_remote_ped.weapons.temp[iii][iiii])
									end
								else
									if  _GT_remote_ped.weapons.temp[iii][iiii] == gameplay.get_hash_key("weapon_stinger") then
										_GT_remote_ped.weapons.one[iii][iiii].name="** RPG Stinger **"
									else
										_GT_remote_ped.weapons.one[iii][iiii].name="** "..weapon.get_weapon_name(_GT_remote_ped.weapons.temp[iii][iiii]).." **"
									end
								end
							end
						end
					end)
				end
			end
		end

		
				
_GT_remote_ped.hash_is_name={}
for i=1,#_GT_ped_models.peds do
	_GT_remote_ped.hash_is_name[gameplay.get_hash_key(_GT_ped_models.peds[i][1])]=_GT_ped_models.peds[i][2]
end
_GT_remote_ped.ped_name=_GT_remote_ped.hash_is_name[_GT_remote_ped.ped_hash]
_GT_remote_ped.feat.name="Remote ped (".._GT_remote_ped.ped_name..")"

_GT_remote_ped.ped_prnt=menu.add_feature("Select Ped", "parent", _GT_remote_ped.prnt.id)
_GT_remote_ped.ped_srch_prnt=menu.add_feature("** Search **", "parent", _GT_remote_ped.ped_prnt.id)
menu.add_feature("Search for ped", "action", _GT_remote_ped.ped_srch_prnt.id,function()
	local status,str,veh = 1
	status,str = _GF_text_input_get("Type part of the ped name","",25,0)
	if status == 0 then
		for i=1,#_GT_remote_ped.ped_srch_feats do
			_GT_remote_ped.ped_srch_feats[i].hidden=(string.match(string.lower(_GT_remote_ped.ped_srch_feats[i].name), string.lower(str)) == nil)
		end
	end
end)

_GT_remote_ped.ped_srch_feats={}
for i=1,#_GT_ped_models.peds do
	_GT_remote_ped.ped_srch_feats[i]=menu.add_feature(_GT_ped_models.peds[i][2], "action", _GT_remote_ped.ped_srch_prnt.id,function()
		_GT_remote_ped.ped_hash=gameplay.get_hash_key(_GT_ped_models.peds[i][1])
		_GT_remote_ped.ped_name=_GT_remote_ped.hash_is_name[_GT_remote_ped.ped_hash]
		_GT_remote_ped.feat.name="Remote ped (".._GT_remote_ped.ped_name..")"
		_GT_remote_ped.info_check("PED_MODEL_HASH",_GT_remote_ped.ped_hash)
		_GT_remote_ped.info_write("PED_MODEL_HASH",_GT_remote_ped.ped_hash)
		menu.notify("Ped selected: ".._GT_remote_ped.ped_name,_G_GeeVer,4)
	end)
	_GT_remote_ped.ped_srch_feats[i].hidden=true
end
	
_GT_remote_ped.ped_prnts={}
for i=1,#_GT_ped_models.types do
	_GT_remote_ped.ped_prnts[i]=menu.add_feature(_GT_ped_models.types[i][2], "parent", _GT_remote_ped.ped_prnt.id)
	for ii=1,#_GT_ped_models.peds do
		if string.match(string.sub(_GT_ped_models.peds[ii][1],1,string.len(_GT_ped_models.types[i][1])),_GT_ped_models.types[i][1]) then
			menu.add_feature(_GT_ped_models.peds[ii][2], "action", _GT_remote_ped.ped_prnts[i].id,function()
				_GT_remote_ped.ped_hash=gameplay.get_hash_key(_GT_ped_models.peds[ii][1])
				_GT_remote_ped.ped_name=_GT_remote_ped.hash_is_name[_GT_remote_ped.ped_hash]
				_GT_remote_ped.feat.name="Remote ped (".._GT_remote_ped.ped_name..")"
				_GT_remote_ped.info_check("PED_MODEL_HASH",_GT_remote_ped.ped_hash)
				_GT_remote_ped.info_write("PED_MODEL_HASH",_GT_remote_ped.ped_hash)
				menu.notify("Ped selected: ".._GT_remote_ped.ped_name,_G_GeeVer,4)
			end)
		end
	end
end

_GT_remote_ped.reticle={}
_GT_remote_ped.reticle.directory = utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\scripts\\GeeSkid\\reticle\\"
_GT_remote_ped.reticle.files = utils.get_all_files_in_directory(_GT_remote_ped.reticle.directory,"png")
_GT_remote_ped.reticle.sprt={}
for i=1,#_GT_remote_ped.reticle.files do
	_GT_remote_ped.reticle.sprt[i] = scriptdraw.register_sprite(_GT_remote_ped.reticle.directory..i..".png")
end
_GT_remote_ped.reticle.prnt=menu.add_feature("Reticle Options","parent",_GT_remote_ped.prnt.id,function()
	_GT_remote_ped.reticle.start_test_display()
end)

	function _GT_remote_ped.reticle.start_test_display()
		if _G_GS_has_loaded then 
			_GT_remote_ped.reticle.test_display=true
			_GT_remote_ped.reticle.test_display_feat.on=true
		end
	end
	
	_GT_remote_ped.reticle.test_display=false
	_GT_remote_ped.reticle.test_display_feat=menu.add_feature("Remote ped icon HIDDEN", "toggle",_GT_remote_ped.reticle.prnt.id,function(f)
		local time = utils.time_ms() + 3000
		while time > utils.time_ms() do
			if _GT_remote_ped.reticle.test_display then
				_GT_remote_ped.reticle.test_display=false
				time = utils.time_ms() + 3000
			end
			scriptdraw.draw_sprite(_GT_remote_ped.reticle.sprt[_GT_remote_ped.reticle.slct.value],v2(0,0),1*_GT_remote_ped.reticle.mrkr_s.value,0, _GF_RGBAToInt(_GT_remote_ped.reticle.mrkr_r.value,_GT_remote_ped.reticle.mrkr_g.value,_GT_remote_ped.reticle.mrkr_b.value,math.floor((time-utils.time_ms())/3000*_GT_remote_ped.reticle.mrkr_a.value)))
			system.yield(5)
		end
		f.on=false
	end)
	_GT_remote_ped.reticle.test_display_feat.hidden=true
	
	_GT_remote_ped.reticle.slct = menu.add_feature("Select icon", "autoaction_value_i", _GT_remote_ped.reticle.prnt.id, function(f)
		_GT_remote_ped.reticle.start_test_display()
	end)_GF_set_feat_i_f(_GT_remote_ped.reticle.slct,1,#_GT_remote_ped.reticle.files,1,1)
	_GT_remote_ped.reticle.slct.value=46

	_GT_remote_ped.reticle.mrkr_s = menu.add_feature("Icon size", "autoaction_value_f",_GT_remote_ped.reticle.prnt.id,function()
		_GT_remote_ped.reticle.start_test_display()
	end)_GF_set_feat_i_f(_GT_remote_ped.reticle.mrkr_s,0,3,0.01,1)

	_GT_remote_ped.reticle.mrkr_r = menu.add_feature("Red", "autoaction_value_i",_GT_remote_ped.reticle.prnt.id,function()
		_GT_remote_ped.reticle.start_test_display()
	end)_GF_set_feat_i_f(_GT_remote_ped.reticle.mrkr_r,0,255,1,255)
	_GT_remote_ped.reticle.mrkr_g = menu.add_feature("Green", "autoaction_value_i",_GT_remote_ped.reticle.prnt.id,function()
		_GT_remote_ped.reticle.start_test_display()
	end)_GF_set_feat_i_f(_GT_remote_ped.reticle.mrkr_g,0,255,1,0)
	_GT_remote_ped.reticle.mrkr_b = menu.add_feature("Blue", "autoaction_value_i",_GT_remote_ped.reticle.prnt.id,function()
		_GT_remote_ped.reticle.start_test_display()
	end)_GF_set_feat_i_f(_GT_remote_ped.reticle.mrkr_b,0,255,1,0)
	_GT_remote_ped.reticle.mrkr_a = menu.add_feature("Alpha", "autoaction_value_i",_GT_remote_ped.reticle.prnt.id,function()
		_GT_remote_ped.reticle.start_test_display()
	end)_GF_set_feat_i_f(_GT_remote_ped.reticle.mrkr_a,0,255,1,255)
		
		
menu.add_feature("Set waypoint at this location","toggle", _G_Utilities.id, function(f)
	local me=player.player_id()
	local my_pos = player.get_player_coords(me)
	while f.on do
		if (ui.get_waypoint_coord().x ~= my_pos.x) and (ui.get_waypoint_coord().y ~= my_pos.y) then
			ui.set_new_waypoint(v2(my_pos.x,my_pos.y))
			system.yield(1000)
		end
		system.yield(1000)
	end
end)

_G_rand_wp_set=menu.add_feature("Set random waypoint","action_value_str", _G_Utilities.id, function(f)
	local pos
	if f.value == 0 then
		pos = _GF_random_pos("land")
	elseif f.value == 1 then
		pos = _GF_random_pos("water")
	else
		pos = _GF_random_pos("anywhere")
	end
	ui.set_new_waypoint(v2(pos.x,pos.y))
end)_G_rand_wp_set.set_str_data(_G_rand_wp_set,{"Land","Water","Anywhere"})

event.add_event_listener("exit", function(f)
	if native.call(0xA7A932170592B50E,_GT_AimBot.kosatka_cam):__tointeger()~=1 then --DoesCamExist
		native.call(0x026FB97D0A425F84,_GT_AimBot.kosatka_cam,0) -- SetCamActive
	end
	native.call(0x8E5FB15663F79120,1)-- DestroyAllCams
	native.call(0x07E5B515DB0636FC, 0, 0, 0, 0, 0) --RenderScriptCams
	_GF_reset_cam_focus_pos()
	_GF_reset_mini_map_pos()
	_GT_plate_anim.reset_plate()
	for i=1,#_GT_spwn_veh.history do
		if _GF_is_ent(_GT_spwn_veh.history[i]) then
			for ii=1,_GF_veh_seats(_GT_spwn_veh.history[i]) do
				if _GF_is_ent(vehicle.get_ped_in_vehicle_seat(_GT_spwn_veh.history[i],ii-2)) then
					ped.clear_ped_tasks_immediately(vehicle.get_ped_in_vehicle_seat(_GT_spwn_veh.history[i], ii-2))
				end
			end
			for ii=1,10000 do
				if _GF_ask_cntrl(_GT_spwn_veh.history[i]) then
					break
				end
			end
			entity.set_entity_as_no_longer_needed(_GT_spwn_veh.history[i])
			entity.delete_entity(_GT_spwn_veh.history[i])
		end
	end
	for i=1,#_G_threads_history do
		if _G_threads_history[i] then
			menu.delete_thread(_G_threads_history[i])
		end
	end
	hook.remove_script_event_hook(_GT_plyr_info.typing_hook)
	--hook.remove_net_event_hook(_GT_aim_protex_main.net_hook)
	local _table,count={},0
	for i=1,#_GT_my_veh_hist do
		if not _table[_GT_my_veh_hist[i]] then
			count=count+1
			_table[_GT_my_veh_hist[i]]=true
		end
	end
	menu.notify(count.." vehicles used since Gee-Skid was loaded",_G_GeeVer,10,2)
	for i=1,#_GT_plyr_info.otr_blip do
		if _GT_plyr_info.otr_blip[i] ~= v3(0,0,0) then -- remove any green otr blips 
			ui.remove_blip(_GT_plyr_info.otr_blip[i])
		end	
	end		
	for i=1,#_GT_plyr_info.undead_blip do
		if _GT_plyr_info.undead_blip[i] ~= v3(0,0,0) then -- remove any undead blips 
			ui.remove_blip(_GT_plyr_info.undead_blip[i])
		end	
	end	
    menu.notify("Into the ether :(",_G_GeeVer,10,2)
	local time = _GF_2_decimals((utils.time_ms()-_G_load_time)/1000)
	if time > 60 then
		print("--- Gee-Skid unloaded - ".._GF_2_decimals(time/60).." minutes run time ---")
	else
		print("--- Gee-Skid unloaded - "..time.." seconds run time ---")
	end
end)

end

