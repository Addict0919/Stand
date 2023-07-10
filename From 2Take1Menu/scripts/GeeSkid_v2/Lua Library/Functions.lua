-- GeeSkid v1.05
local weap_info = require("GeeSkid_v2/Lua Library/Weapon Data")
local tp_pos = require("GeeSkid_v2/Lua Library/GTA v3 List")
local inputs = require("GeeSkid_v2/Lua Library/Inputs Data")
local veh_stuff = require("GeeSkid_v2/Lua Library/Vehicle Data")
local glbls = require("GeeSkid_v2/Lua Library/Oh No GTA Updated")
local ntv = require("GeeSkid_v2/Lua Library/Natives")
local intrr = require("GeeSkid_v2/Lua Library/Interior Data")
local API = require("GeeSkid_v2/Lua Library/API List")
local font_script_1 = menu.get_feature_by_hierarchy_key("local.settings.menu_ui.fonts.script_1")

local mth={}
mth.flr = math.floor
mth.ceil = math.ceil
mth.rad = math.rad
mth.sin = math.sin
mth.cos = math.cos
mth.rndm = math.random
mth.abs = math.abs
mth.pi = math.pi
mth.atan = math.atan
mth.acos = math.acos
mth.asin = math.asin
mth.fmod = math.fmod
mth.deg = math.deg

local headlight_color_prev = 0
local neon_light_color_prev = 4292796159

local funcs = {}
funcs.ver_text = "Gee-Skid v2.02"
funcs.get = {}
funcs.doo = {}
funcs.is = {}
funcs.sort = {}
funcs.ntwrk = {}
funcs.ME = {}

funcs.N_P_colors = {
["Red"] = 0x0040FF,
["Yellow"] = 0x42F5F5,
["Green"] = 0x42F551,
["Blue"] = 0xF5424B}
		
funcs.og_notif = menu.notify
function funcs.N_P(_print_notif,_text,_title,_time,_color)
	-- 1 to print, 2 to notify, 3 to both
	if _print_notif ~= 2 then
		print(_text)
	end
	if _print_notif ~= 1 then
		funcs.og_notif(tostring(_text),_title,_time,funcs.N_P_colors[_color])
	end
end



function funcs.get.hover_info()
	local _hover = {
		INTR = false,
		POS = v3(0,0,0),
		IN_AIR = false,
		IN_VEH = false,
		V_HASH = -1,
		V_ID = -1,
		V_PID = -1	
	}
	if intrr.is_pid_intrr(API.plyr.my_id()) then
		_hover.INTR=true
		_hover.POS=funcs.ME._crds()
	elseif funcs.ME._in_veh() then
		_hover.IN_VEH = trueFme_pid
		_hover.V_ID=funcs.ME._veh()
		_hover.V_HASH = API.ent.get.model_hash(_hover.V_ID)
		_hover.POS = API.ent.get.coords(_hover.V_ID)
		_hover.V_PID = funcs.get.a_pid_in_veh(_hover.V_ID)
		_hover.IN_AIR = API.ent.is.in_air(_hover.V_ID)
	else
		_hover.POS=funcs.ME._crds()
		_hover.IN_AIR = API.ent.is.in_air(funcs.ME._ped())
	end
	return _hover
end

function funcs.doo.hover_back(_hover)
	if _hover.INTR then
		API.ent.set.coords(funcs.ME._ped(),funcs.get.pos_nearby(_hover.POS,"single_closest",10,"water","xyz"))
	elseif not _hover.IN_VEH then
		if _hover.IN_AIR then
			API.ent.set.coords(funcs.ME._ped(),funcs.get.pos_nearby(_hover.POS,"single_closest",10,"water","xyz"))
		else
			API.ent.set.coords(funcs.ME._ped(), (_hover.POS + v3(0,0,1)))
		end
	else
		local time = API.util.t_ms()
		local back_in_veh,do_once,found=false,false,false
		if _hover.V_ID == API.plyr.pers_veh() and funcs.doo.tp_pers_veh("self_2_veh_drive") then --maybe i had my personal vehicle. gta remembers that
			back_in_veh = true
		elseif funcs.is.valid_pid(_hover.V_PID) then -- if there was another plyr in there i'll go to where they are now
			time = API.util.t_ms() + 1250
			while (API.util.t_ms() < time) and not back_in_veh do 
				funcs.doo.hover_above_pid(_hover.V_PID)
				funcs.doo.veh_tp_into_free_seat(API.plyr.get.veh(_hover.V_PID))
				system.yield(5)
				back_in_veh=funcs.ME._in_veh()
			end
		end
		local hopeful_veh=-1
		local hover_pos = _hover.POS + v3(0,0,50)
		if not back_in_veh then
			time = API.util.t_ms() + 1250
			local wait_time = API.util.t_ms() + 1000
			while (API.util.t_ms() < time) and not found do --gta will not consider it a valid veh if you're too far away
				system.yield(0)
				funcs.doo.hover_at_pos(hover_pos) -- so i go back to where it was last to hopefully find it
				if not do_once and (API.util.t_ms() > wait_time) then
					local all_veh=API.veh.get.all()
					funcs.sort.ent_pos_v3(all_veh,_hover.POS)
					for i=1,#all_veh do
						if API.ent.get.model_hash(all_veh[i]) == _hover.V_HASH then --normally this finds it. Not the best option but only personal vehicle has good success
							hopeful_veh=all_veh[i]
							found = true
							break
						end
					end
					do_once=true
				end
			end
		end
		if not back_in_veh and (funcs.is.veh(_hover.V_ID) or funcs.is.veh(hopeful_veh)) then --if i can find it or a vehicle with the same hash
			if funcs.is.veh(_hover.V_ID) then
				hover_pos = API.ent.get.coords(_hover.V_ID) + v3(0,0,50)
			else
				hover_pos = API.ent.get.coords(hopeful_veh) + v3(0,0,50)
			end
			time = API.util.t_ms() + 750
			while (API.util.t_ms() < time) and not back_in_veh do 
				funcs.doo.hover_at_pos(hover_pos) --i will go to where it is and try to get back in
				if not funcs.doo.veh_tp_into_free_seat(_hover.V_ID) then
					funcs.doo.veh_tp_into_free_seat(hopeful_veh)
				end
				system.yield(5)
				back_in_veh=funcs.ME._in_veh()
			end
		end
		system.yield(500)
		if not funcs.ME._in_veh() then
			if _hover.IN_AIR then
				API.ent.set.coords(funcs.ME._ped(), funcs.get.pos_nearby(_hover.POS,"single_closest",10,"water","xyz"))
			else
				API.ent.set.coords(funcs.ME._ped(), (_hover.POS + v3(0,0,1)))
			end
			system.yield(500)
			if not funcs.doo.veh_tp_into_free_seat(_hover.V_ID) then
				funcs.doo.veh_tp_into_free_seat(hopeful_veh) 
			end
		end
	end
end

function funcs.doo.hover_above_pid(_pid,_time)
	if _time then
		local time = API.util.t_ms() + _time
		while time > API.util.t_ms() and API.plyr.is.valid(_pid) do
			API.ent.set.coords(funcs.ME._ped(), API.plyr.get.coords(_pid)+v3(0,0,50)) 
			system.yield(0)
		end
	else
		API.ent.set.coords(funcs.ME._ped(), API.plyr.get.coords(_pid)+v3(0,0,50)) 
	end
end

function funcs.doo.hover_above_pid2(_pid,_time,in_veh,above_zero)
	local time = API.util.t_ms() + _time
	local pos =  API.plyr.get.coords(_pid)+v3(0,0,50)
	while time > API.util.t_ms() do
		if API.plyr.is.valid(_pid) then
			if (in_veh and API.plyr.is.in_veh(_pid)) or (above_zero and API.plyr.get.coords(_pid).z > 0) then
				return API.plyr.get.coords(_pid)+v3(0,0,50)
			end
			pos = API.plyr.get.coords(_pid)+v3(0,0,50)
		end
		API.ent.set.coords(funcs.ME._ped(),pos) 
		system.yield(0)
	end
	return pos
end

function funcs.doo.hover_at_pos(_pos,_time)
	if _time then
		local time = API.util.t_ms() + _time
		while time > API.util.t_ms() do
			API.ent.set.coords(funcs.ME._ped(), _pos) 
			system.yield(0)
		end
	else
		API.ent.set.coords(funcs.ME._ped(), _pos) 
	end
end

function funcs.is.not_not(_value,_not1,_not2,_not3)
	if _value ~= _not1 and _value ~= _not2 and _value ~= _not3 then
		return true
	end
	return false
end

function funcs.get.tp_aim_coords(_d)
	local z_ele = API.cam.get.rot().x/180*(_d*1.5)
	local dist = (_d*1.5) - mth.abs(z_ele)
	return funcs.get.front_of_pos(API.plyr.get.coords(API.plyr.my_id()), API.cam.get.rot().z, dist, 180, z_ele)
end

function funcs.get.SD_size(_bool)
	if _bool and font_script_1 ~= nil and font_script_1.value ~= nil then
		if font_script_1.value == 0 then
			return 0.575
		elseif font_script_1.value == 1 then
			return 0.9
		end
	end
	return 1
end

function funcs.get.sprt_rot_calc(_heading)
	return mth.rad(_heading)*-1
end

function funcs.get.closest_ped(_plyr,_npc,_dead,_pos,_dist_pos)
	local all_peds=API.Ped.get.all()
	local PED=nil
	funcs.sort.ent_pos_v3(all_peds,_pos)
	for i=1,#all_peds do
		if API.ent.is.dead(all_peds[i]) == _dead then
			if _plyr and _npc then
				PED = all_peds[i]
				break
			elseif _plyr and API.Ped.is.plyr(all_peds[i]) then
				PED = all_peds[i]
				break
			elseif _npc and not API.Ped.is.plyr(all_peds[i]) then
				PED = all_peds[i]
				break
			end
		end
	end
	if _dist_pos ~= nil then
		return PED,funcs.get.dist_pospos_v3(_dist_pos,API.ent.get.coords(PED))
	end
	return PED
end

function funcs.is.ped_in_seat(_ped,_veh,_seat)
	return (funcs.is.veh(_veh) and API.veh.get.ped_in_seat(_veh, _seat) == _ped)
end

function funcs.get.veh_ped_for_blame(_veh)
	for i = 1,funcs.get.veh_seats(_veh) do
		if API.ent.is.ped(API.veh.get.ped_in_seat(_veh, i-2)) then
			return API.veh.get.ped_in_seat(_veh, i-2)
		end
	end
	return funcs.get.non_plyr_ped()
end

function funcs.get.non_plyr_ped(_bool)
	_bool = _bool or false
	local all_peds=API.Ped.get.all()
	local non_plyr_ped,count = 100000,0
	if _bool then
		funcs.sort.ent_pos_v3(all_peds,API.plyr.get.coords(API.plyr.my_id()))
		for i=1,#all_peds do
			if not API.Ped.is.plyr(all_peds[i]) and not API.ent.is.dead(all_peds[i]) then
				non_plyr_ped = all_peds[i]
				break
			end
		end
	else
		repeat
			local PED = all_peds[mth.rndm(1,#all_peds)]
			if not API.Ped.is.plyr(PED) and not API.ent.is.dead(PED) then
				non_plyr_ped = PED
				count=100
			else
				count=count+1
			end
		until count == 100
	end
	return non_plyr_ped
end
---------------------Distance/Direction
---------------------------------------

function funcs.is.in_grid(_pos1,_pos2,_max)
	if mth.abs(_pos1.x - _pos2.x) > _max or mth.abs(_pos1.y - _pos2.y) > _max or mth.abs(_pos1.z - _pos2.z) > _max then
		return false
	end
	return true
end
	

function funcs.is.in_grid_xy(_pos1,_pos2,_max)
	if mth.abs(_pos1.x - _pos2.x) > _max or mth.abs(_pos1.y - _pos2.y) > _max then
		return false
	end
	return true
end

function funcs.get.flight_calc(_dir,_speed,_rot,_up,_down,_if_needed,_reverse)
	_reverse=_reverse or false
	_rot = _rot or 0
	local dir_rot = _dir
	dir_rot.z=dir_rot.z+_rot
	if dir_rot.z < -180 then
		dir_rot.z=(mth.abs(dir_rot.z)-360)*-1
	elseif dir_rot.z > 180 then
		dir_rot.z=mth.abs(dir_rot.z)-360
	end
	local veh_speed = v3(0,0,0)
	if _up then
		veh_speed.z = _speed
	elseif _down then
		veh_speed.z = _speed*-1
	elseif _if_needed then
		veh_speed.z = dir_rot.x/180*_speed*2.69
		if _reverse then
			veh_speed.z=veh_speed.z*-1
		end
	else
		veh_speed.z = 0
	end
	if dir_rot.z >= -90 and dir_rot.z <= 90 then --if north
		if dir_rot.z >= 0 then --northeast
			veh_speed.x = dir_rot.z/90*-1*_speed
			veh_speed.y = (1-(dir_rot.z/90))*_speed
		else --northwest
			veh_speed.x = dir_rot.z/90*-1*_speed
			veh_speed.y = (1-(dir_rot.z/90*-1))*_speed
		end
	else --if south
		if dir_rot.z >= 90 then --southeast
			veh_speed.x = (1+((dir_rot.z-90)/90*-1))*-1*_speed
			veh_speed.y = (dir_rot.z-90)/90*-1*_speed
		else--southwest
			veh_speed.x = (1+(dir_rot.z+90)/90)*_speed
			veh_speed.y = (dir_rot.z+90)/90*_speed
		end
	end
	return veh_speed
end

function funcs.get.vctr_to_pos(_target_pos,_ent)
	local ent_pos = API.ent.get.coords(_ent)
	local x = _target_pos.x - ent_pos.x
	local y = _target_pos.y - ent_pos.y
	local heading = mth.atan(x, y) * -180 / mth.pi    
	local z_dif = (ent_pos.z - _target_pos.z)*-1
	local pitch = mth.asin(z_dif/funcs.get.dist_pospos_v3(_target_pos,ent_pos))/(2*mth.pi)*360
	return v3(pitch,0,heading)
end

function funcs.is.vctr_point_to_pos(_1stpos,_2ndpos,_check_pos,_limit)
	local vector = funcs.get.vctr_to_pos3(_2ndpos,_1stpos)
	local vector_check = funcs.get.vctr_to_pos3(_check_pos,_1stpos)
	return funcs.is.v2_in_limit(v2(vector.x,vector.z),v2(vector_check.x,vector_check.z),_limit)
end


function funcs.is.pid_in_turret_seat(_pid) --native for this doesnt seem to work
	if API.plyr.is.in_veh(_pid) then
		if vehicle.is_vehicle_model(API.plyr.get.veh(_pid),API.get_hash_key("khanjali")) or vehicle.is_vehicle_model(API.plyr.get.veh(_pid),API.get_hash_key("rhino")) or vehicle.is_vehicle_model(API.plyr.get.veh(_pid),API.get_hash_key("minitank")) then
			return API.veh.get.ped_in_seat(API.plyr.get.veh(_pid), -1) == API.plyr.get.ped(_pid),-1
		elseif vehicle.is_vehicle_model(API.plyr.get.veh(_pid),API.get_hash_key("apc")) or vehicle.is_vehicle_model(API.plyr.get.veh(_pid),API.get_hash_key("chernobog")) then
			return API.veh.get.ped_in_seat(API.plyr.get.veh(_pid), 0) == API.plyr.get.ped(_pid),0
		end
	end
	return false,nil
end

function funcs.doo.wntd_all_psngrs(_pid,_val)
	if API.plyr.is.in_veh(_pid) then
		for i=1, funcs.get.veh_seats(API.plyr.get.veh(_pid)) do
			if API.Ped.is.plyr(API.veh.get.ped_in_seat(API.plyr.get.veh(_pid), i-2)) and
				API.plyr.get.wanted(API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(API.plyr.get.veh(_pid), i-2))) ~= _val then
				funcs.doo.wntd(API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(API.plyr.get.veh(_pid), i-2)),_val)	
			end
		end
	elseif API.plyr.get.wanted(_pid) ~= _val then
		funcs.doo.wntd(_pid,_val)	
	end
end

function funcs.doo.wntd(_pid,_val)
	if _val == 0 then
		glbls.remove_wanted(_pid)
	end
	ntv.set.wanted_lvl(_pid,_val)
end

function funcs.get.veh_cmbnd_health_prcnt(_veh,_crv)
	local engine,body = ntv.get.veh_engine_health(_veh,true)
	if engine <0 then
		return engine
	end
	body = ntv.get.veh_body_health(_veh,true)
	if _crv then
		if engine < 60 then
			engine = engine * (engine/60)
		end
		if body < 60 then
			body = body * (body/60)
		end
	end
	return (engine+body)/2
end

function funcs.is.same_orgmc(_pid1,_pid2)
	if glbls.team_rgb_int(_pid1)>-1 and glbls.team_rgb_int(_pid2)>-1 then
		if glbls.team_rgb_int(_pid1) == glbls.team_rgb_int(_pid2) then
			return true
		end
	end
	return false
end

function funcs.is.num_in_range(_num,_min,_max)
	return (_num >= _min and _num <= _max)
end

function funcs.is.num_in_limit(_num1,_num2,_limit)
	return (mth.abs(_num1-_num2) > _limit or mth.abs(_num1+_num2) > _limit)
end

function funcs.is.v3_in_limit(_v3_1,_v3_2,_limit)
	return (funcs.is.num_in_limit(_v3_1.x,_v3_2.x,_limit) or funcs.is.num_in_limit(_v3_1.y,_v3_2.y,_limit) or funcs.is.num_in_limit(_v3_1.z,_v3_2.z,_limit))
end

function funcs.is.v2_in_limit(_v2_1,_v2_2,_limit)
	return (funcs.is.num_in_limit(_v2_1.x,_v2_2.x,_limit) or funcs.is.num_in_limit(_v2_1.y,_v2_2.y,_limit))
end

function funcs.is.v2_in_range(_pos,x_min,x_max,y_min,y_max)
	if funcs.is.num_in_range(_pos.x,x_min,x_max) and funcs.is.num_in_range(_pos.y,y_min,y_max) then
		return true
	end
	return false
end

function funcs.is.v3_in_range(_pos,x_min,x_max,y_min,y_max,z_min,z_max)
	if funcs.is.num_in_range(_pos.x,x_min,x_max) and funcs.is.num_in_range(_pos.y,y_min,y_max) and funcs.is.num_in_range(_pos.z,z_min,z_max) then
		return true
	end
	return false
end

function funcs.get.v3_total_compare(_rot1,_rot2)
	local function rot_compare_single(_1,_2)
		if (_1>=0 and _2>=0) or (_1<0 and _2<0) then
			return mth.abs(_2-_1)
		end
		return mth.abs(mth.abs(_2-_1)-100)
	end
	return (rot_compare_single(_rot1.x,_rot2.x)+rot_compare_single(_rot1.y,_rot2.y)+rot_compare_single(_rot1.z,_rot2.z))
end

function funcs.get.vctr_to_pos_z(_target_pos,_ent)
	local ent_pos = API.ent.get.coords(_ent)
	local x = _target_pos.x - ent_pos.x
	local y = _target_pos.y - ent_pos.y
	local heading = mth.atan(x, y) * -180 / mth.pi    
	return v3(0,0,heading)
end

function funcs.get.vctr_to_pos_z2(_target,_start)
	return (mth.atan((_target.x - _start.x), (_target.y - _start.y)) * -180 / mth.pi)
end

function funcs.get.vctr_to_pos_z3(_target,_start)
	--return mth.acos((_start.x * _target.x) +(_start.y * _target.y))
	return mth.asin(_start.x*_target.y-_start.y*_target.x,_start.x*_target.x+_start.y*_target.y)
end

function funcs.get.vctr_to_pos2(_target_pos,_ent)
	return v3(mth.asin(((API.ent.get.coords(_ent).z - _target_pos.z)*-1)/mth.abs(_target_pos:magnitude(API.ent.get.coords(_ent))))/(2*mth.pi)*360,0,mth.atan(_target_pos.x - API.ent.get.coords(_ent).x, _target_pos.y - API.ent.get.coords(_ent).y) * -180 / mth.pi)
end

function funcs.get.vctr_to_pos3(_target_pos,_start_pos,_return_dist)
	local x = _target_pos.x - _start_pos.x
	local y = _target_pos.y - _start_pos.y
	local heading = mth.atan(x, y) * -180 / mth.pi    
	local z_dif = (_start_pos.z - _target_pos.z)*-1
	local dist = funcs.get.dist_pospos_v3(_target_pos,_start_pos)
	local pitch = mth.asin(z_dif/dist)/(2*mth.pi)*360
	if _return_dist then
		return v3(pitch,0,heading),dist
	end
	return v3(pitch,0,heading)
end
	
function funcs.get.normalize_v3(_target_pos,_start_pos)
	local dir = _target_pos - _start_pos
    local length = math.sqrt(dir.x^2 + dir.y^2 + dir.z^2)
    dir.x = dir.x / length
    dir.y = dir.y / length
    dir.z = dir.z / length
	return dir
end

function funcs.get.normalize_v2(_target_pos,_start_pos)
	local dir = _target_pos - _start_pos
    local length = math.sqrt(dir.x^2 + dir.y^2)
    dir.x = dir.x / length
    dir.y = dir.y / length
	return dir
end

function funcs.get.ray_ent_ignore(_ign_ent)
	if _ign_ent == nil then 
		if API.plyr.is.in_veh(API.plyr.my_id()) then
			return API.plyr.get.veh(API.plyr.my_id())
		end
		return API.plyr.get.ped(API.plyr.my_id())
	end
	return _ign_ent
end

function funcs.get.basic_veh_dimensions(_bool,_veh,_default,_div)
	_div = _div or 2
	if _bool and funcs.is.veh(_veh) then
		local _min,_max = API.ent.get.dimensions(_veh)
		if _min ~= nil and _max ~= nil then
			return (_max.y+mth.abs(_min.y))/_div
		end
	end
	return _default
end

function funcs.get.my_cam_ray_pos(_extra)
	_extra = _extra  or 0.5
	return funcs.get.front_of_dir(API.cam.get.pos(),API.cam.get.rot(),_extra + funcs.get.dist_pospos_v3(funcs.ME._crds(),API.cam.get.pos()))
end

function funcs.get.ray_pos(_pos,_rot,_dist)
	_dist = _dist or 2000
	local new_pos = _pos or API.cam.get.pos_final()
	local me_pos = new_pos
	local rot = _rot or API.cam.get.rot_final()
	rot:transformRotToDir()
	rot=rot	* _dist
	new_pos = new_pos + rot
	return me_pos,new_pos
end

function funcs.get.shortened_dist(_pos1,_pos2,_short)
	local rot = funcs.get.vctr_to_pos3(_pos2,_pos1)
	local dist = funcs.get.dist_pospos_v3(_pos1,_pos2)-_short
	local old_pos,new_pos = funcs.get.ray_pos(_pos1,rot,dist)
	return new_pos,dist
end
	
--#### bool hit, v3 hitPos, v3 hitSurf, Hash hitMat, Entity hitEnt    raycast(v3 start, v3 end, int intersect, Entity ignore)	
function funcs.get.ray_vctr_all(_ign_ent,_only_ent,_pos,_rot,_short,_plus_v3)
	_only_ent = _only_ent or false
	_plus_v3 = _plus_v3 or v3(0,0,0)
	local target,dist = -1 
	local my_pos,pos = funcs.get.ray_pos(_pos,_rot)
	local hit, ray_pos,ray_surf,ray_mat,ray_ent = worldprobe.raycast(my_pos,pos,target,funcs.get.ray_ent_ignore(_ign_ent))
	if funcs.is.ent(ray_ent) and API.ent.get.coords(ray_ent) == v3(0,0,0) then ray_ent = nil end
	if _only_ent then
		return ray_ent
	elseif _short and hit then
		ray_pos,dist = funcs.get.shortened_dist(my_pos,ray_pos,_short)
		return hit, ray_pos+_plus_v3, dist
	end
	if hit then
		ray_pos=ray_pos+_plus_v3
	end
	return hit, ray_pos, ray_ent, my_pos
end

function funcs.get.ray_vctr_or_max(_max,_ign_ent,_pos,_rot)
	_only_ent = _only_ent or false
	local target = -1 
	local my_pos,pos = funcs.get.ray_pos(_pos,_rot)
	local hit, ray_pos,ray_surf,ray_mat,ray_ent = worldprobe.raycast(my_pos,pos,target,funcs.get.ray_ent_ignore(_ign_ent))
	if hit then
		local dist = funcs.get.dist_pospos_v3((_pos or API.cam.get.pos()),ray_pos)-0.5
		return funcs.get.front_of_dir(_pos,_rot,dist)
	end
	return funcs.get.front_of_dir(_pos,_rot,_max)
end

function funcs.get.front_of_pos(pos, heading, distance, _head, _z)
	--_head of 180 is in front, 0 is behind
    heading = mth.rad((heading - _head) * -1)
    pos.x = pos.x + (mth.sin(heading) * -distance)
    pos.y = pos.y + (mth.cos(heading) * -distance)
	pos.z = pos.z + _z
    return pos
end

function funcs.get.front_of_dir(_pos,_rot,_dist)
	_pos = _pos or API.cam.get.pos()
	_rot = _rot or API.cam.get.rot()
	local new_pos = _pos
	local new_rot = _rot
	new_rot:transformRotToDir()
	new_rot=new_rot	* _dist
	new_pos = new_pos + new_rot
	return new_pos
end

function funcs.get.pos_offst_pid(_pid, _dist, _dir, _z)
	local _head = nil
	if _dir == "front" then _head = 180 end
	if _dir == "behind" then _head = 0 end
	if _head == nil then _head = mth.rndm(0,360) end
	_z = _z or 0
	local pos = funcs.get.pid_pos_z_guess(_pid)
    local heading = mth.rad((API.plyr.get.heading(_pid) - _head) * -1)
    pos.x = pos.x + (mth.sin(heading) * -_dist)
    pos.y = pos.y + (mth.cos(heading) * -_dist)
	pos.z = pos.z + _z
    return pos
end

function funcs.get.dist_me_ent_3d(_ent)
    -- local me_pos=API.plyr.get.coords(API.plyr.my_id())
    -- local ent=API.ent.get.coords(_ent)
    -- local distance=me_pos:magnitude(ent)
    return mth.abs(API.plyr.get.coords(API.plyr.my_id()):magnitude(API.ent.get.coords(_ent)))
end

function funcs.get.dist_pospos_v3(_pos1,_pos2)
    --local distance=_pos1:magnitude(_pos2)
    return mth.abs(_pos1:magnitude(_pos2))
end

function funcs.get.dist_entent_v3(_ent1,_ent2)
    return mth.abs(API.ent.get.coords(_ent1):magnitude(API.ent.get.coords(_ent2)))
end

function funcs.get.dist_entent_v2(_ent1,_ent2)
	local pos1 = API.ent.get.coords(_ent1)
	local pos2 = API.ent.get.coords(_ent2)
    return mth.abs(v2(pos1.x,pos1.y):magnitude(v2(pos2.x,pos2.y)))
end

function funcs.get.dist_pospos_v2(pos1, pos2)
	-- local pos1v2 = v2(pos1.x,pos1.y)
	-- local pos2v2 = v2(pos2.x,pos2.y)
    -- local distance=pos1v2:magnitude(pos2v2)
    return mth.abs(v2(pos1.x,pos1.y):magnitude(v2(pos2.x,pos2.y)))
end

function funcs.get.pid_pos_z_guess(_pid)
	local plyr_pos = API.plyr.get.coords(_pid)
	if funcs.get.dist_pospos_v3(API.plyr.get.coords(API.plyr.my_id()),plyr_pos) > 250 and plyr_pos.z < 0 then
		plyr_pos.z = funcs.get.pos_nearby(plyr_pos,"single_closest",10,"water","xy").z+1
	end
	return plyr_pos
end	
	
function funcs.get.dist_me_pid_3d(pid)
    -- local me_pos=API.plyr.get.coords(API.plyr.my_id())
    -- local pid_pos=API.plyr.get.coords(pid)
    -- local distance=me_pos:magnitude(pid_pos)
    return mth.abs(API.plyr.get.coords(API.plyr.my_id()):magnitude(API.plyr.get.coords(pid)))
end

function funcs.get.dist_me_pid_2d(pid)
    return mth.abs(v2(API.plyr.get.coords(API.plyr.my_id()).x,API.plyr.get.coords(API.plyr.my_id()).y):magnitude(v2(API.plyr.get.coords(pid).x,API.plyr.get.coords(pid).y)))
end

function funcs.get.dist_me_ent_2d(_ent)
    return mth.abs(v2(API.plyr.get.coords(API.plyr.my_id()).x,API.plyr.get.coords(API.plyr.my_id()).y):magnitude(v2(API.ent.get.coords(_ent).x,API.ent.get.coords(_ent).y)))
end

function funcs.sort.pos_v2(_table,_pos)
	table.sort(_table, function(a, b) return funcs.get.dist_pospos_v2(a,_pos) < funcs.get.dist_pospos_v2(b,_pos) end)
end

function funcs.sort.pos_v3(_table,_pos)
	table.sort(_table, function(a, b) return funcs.get.dist_pospos_v3(a,_pos) < funcs.get.dist_pospos_v3(b,_pos) end)
end


function funcs.get.dist_to_str(_dist,_type)
	local meters = _dist
	local feet = meters * 3.28084
	local yards = meters * 1.09361
	local mile,miles = false, false
	local feet_miles=""
	if _type == "m" then
		return tostring(funcs.get._1_dec(meters)).." m"
	elseif _type == "km" then
		return tostring(funcs.get._2_dec(meters/1000)).." Km"
	elseif _type == "yard" then
		return tostring(funcs.get._1_dec(yards)).." Yards"
	elseif _type == "field" then
		return tostring(funcs.get._2_dec(yards/100)).." Fields"
	elseif _type == "asiandick" then
		return tostring(mth.flr(feet*2.4)).." Asian dicks"
	elseif _type == "bbc" then
		return tostring(mth.flr(feet*1.2)).." BBCs"
	end
	-- meters = mth.flr(meters)
	-- feet = mth.flr(feet)
	if _type == "ft" then
		return tostring(funcs.get._1_dec(feet)).." ft."
	elseif _type == "mile" then
		return tostring(funcs.get._2_dec(feet/5280)).." Miles"
	end
	if meters > 1000 then
		meters = tostring(funcs.get._2_dec(meters/1000).." KMs")
	else
		meters = tostring(funcs.get._1_dec(meters).." Meters")
	end
	if feet >= 660 and feet < 990 then
		feet_miles = "1/8"
		mile = true
	elseif feet >= 990 and feet < 1650 then
		feet_miles = "1/4"
		mile = true
	elseif feet >= 1650 and feet < 2310 then
		feet_miles = "3/8"
		mile = true
	elseif feet >= 2310 and feet < 2970 then
		feet_miles = "Half"
		mile = true
	elseif feet >= 2970 and feet < 3630 then
		feet_miles = "5/8"
		mile = true
	elseif feet >= 3630 and feet < 4290 then
		feet_miles = "3/4"
		mile = true
	elseif feet >= 4290 and feet < 4950 then
		feet_miles = "7/8"
		mile = true
	elseif feet >= 4950 then
		feet_miles=tostring(funcs.get._2_dec(feet/5280))
		miles = true
	end
	if mile then
		feet_miles=feet_miles.." Mile"
	elseif miles then
		feet_miles=feet_miles.." Miles"
	end
	local dist = ""
	if feet >=660 then
		dist=dist..meters.." or "..feet_miles.." ("..feet.." ft.)"
	else
		dist=dist..meters.." or ("..feet.." ft.)"
	end
	return dist
end

function funcs.sort.pid_pos_v3(_table,_pos,_direction)
	if _direction == "ascending" then
		table.sort(_table, function(a, b) return funcs.get.dist_pospos_v3(API.plyr.get.coords(a),_pos) < funcs.get.dist_pospos_v3(API.plyr.get.coords(b),_pos) end)
	elseif _direction == "descending" then
		table.sort(_table, function(a, b) return funcs.get.dist_pospos_v3(API.plyr.get.coords(a),_pos) > funcs.get.dist_pospos_v3(API.plyr.get.coords(b),_pos) end)
	end
end

function funcs.sort.ent_pos_v3(_table,_pos)
	table.sort(_table, function(a, b) return funcs.get.dist_pospos_v3(API.ent.get.coords(a),_pos) < funcs.get.dist_pospos_v3(API.ent.get.coords(b),_pos) end)
end

function funcs.get.rand_paint_shade(_type)
	local r,g,b
	if _type == "Dark" then
		r,g,b = funcs.get.rgb_rand(0,25)
	else
		r,g,b = funcs.get.rgb_rand(100,150)
	end
	return (r * 65536 +   g  * 256 +  b)
end

function funcs.get.rgb_rand(_min,_max)
	local rand = mth.rndm(1,6)
	local r,g,b
	if rand == 1 then
		r = mth.flr(255 * (mth.rndm(_min,_max)*.01))
		g = mth.flr((255 - r) * (mth.rndm(_min,_max)*.01))
		b = mth.flr((255 - g) * (mth.rndm(_min,_max)*.01))
	elseif rand == 2 then
		b = mth.flr(255 * (mth.rndm(_min,_max)*.01))
		r = mth.flr((255 - b) * (mth.rndm(_min,_max)*.01))
		g = mth.flr((255 - r) * (mth.rndm(_min,_max)*.01))
	elseif rand == 3 then
		g = mth.flr(255 * (mth.rndm(_min,_max)*.01))
		b = mth.flr((255 - g) * (mth.rndm(_min,_max)*.01))
		r = mth.flr((255 - b) * (mth.rndm(_min,_max)*.01))
	elseif rand == 4 then
		g = mth.flr(255 * (mth.rndm(_min,_max)*.01))
		r = mth.flr((255 - g) * (mth.rndm(_min,_max)*.01))
		b = mth.flr((255 - r) * (mth.rndm(_min,_max)*.01))
	elseif rand == 5 then
		b = mth.flr(255 * (mth.rndm(_min,_max)*.01))
		g = mth.flr((255 - b) * (mth.rndm(_min,_max)*.01))
		r = mth.flr((255 - g) * (mth.rndm(_min,_max)*.01))
	elseif rand == 6 then
		r = mth.flr(255 * (mth.rndm(_min,_max)*.01))
		b = mth.flr((255 - r) * (mth.rndm(_min,_max)*.01))
		g = mth.flr((255 - b) * (mth.rndm(_min,_max)*.01))
	end
	return r,g,b
end

function funcs.doo.veh_flip(_veh,_type,_time)
	if funcs.is.veh(_veh) then
		local flip_y=0
		local flip=false
		if _type == "if_needed" then
			if funcs.is.my_veh_upside_down(_veh) then
				flip=true
			end
		elseif _type == "flip_right" then
			flip=true
		elseif _type == "flip_wrong" then
			flip=true
			flip_y=180
		end
		if flip then
			if funcs.ntwrk.ask_long(_veh,_time) then
				local rot = API.cam.get.rot()
				local speed = API.ent.get.velocity(_veh)
				local _veh_rot=API.ent.get.rotation(_veh)
				_veh_rot.z=rot.z
				API.ent.set.rotation(_veh,v3(0,flip_y,_veh_rot.z))
				if _type == "if_needed" or _type == "flip_right" then
					API.veh.set.on_ground(_veh)
					system.yield(20)
				end
				API.ent.set.velocity(_veh,speed)
				return true
			end
		end
	end
end

function funcs.is.my_veh_upside_down(_my_veh)
	if funcs.is.veh(_my_veh) then
		if API.ent.is.upside_down(_my_veh) then
			local class = API.veh.get.class(_my_veh)
			if (class == 16) or (class == 15) or funcs.is.this_veh(_my_veh,"oppressor2") or funcs.is.this_veh(_my_veh,"oppressor") then 
				if not API.ent.is.in_air(_my_veh) then -- wont flip planes/helos mk1 884483972 or mk2 884483972 if in the air
					return true
				end
			else
				return true
			end
		end
	end
end
	
function funcs.doo.pid_veh_kick(_pid, _bool)
	_bool = _bool or false
	if not API.plyr.is.in_veh(_pid) then
		if _bool then
			funcs.N_P(2,funcs.get.pid_name(_pid).." - Not in a vehicle.",funcs.ver_text,4,"Yellow")
		end
	else
		local time = API.util.t_ms() + 1000
		local model_name = funcs.get.veh_model_name(API.plyr.get.veh(_pid))
		while API.plyr.is.in_veh(_pid) and API.util.t_ms() < time do
			API.Ped.clear_tasks(API.plyr.get.ped(_pid))
			system.yield(200)
		end
		if API.plyr.is.in_veh(_pid) then
			glbls.kick_from_veh(_pid)
		end
		time = API.util.t_ms() + 2000
		while API.plyr.is.in_veh(_pid) and API.util.t_ms() < time do
			system.yield(0)
		end
		if not API.plyr.is.in_veh(_pid) then
			if _bool then
				funcs.N_P(2,funcs.get.pid_name(_pid).." - "..model_name.."\nKicked from vehicle :)",funcs.ver_text,4,"Green")
			end
			return true
		else
			funcs.N_P(2,funcs.get.pid_name(_pid).." - "..model_name.."\nFailed to kick :(",funcs.ver_text,4,"Red")
		end
	end
	return false
end


function funcs.is.should_drop(_type,_pid)
	if not API.plyr.is.valid(_pid) or funcs.is.dead(API.plyr.get.ped(_pid)) then
		return false
	elseif _type == "health" then
		return (API.plyr.get.max_health(_pid) > 0 and API.plyr.get.health(_pid) > 0 and API.plyr.get.max_health(_pid) ~= API.plyr.get.health(_pid))
	elseif _type == "armor" then
		return (API.plyr.get.health(_pid) > 0 and API.plyr.get.armor(_pid) < 50)
	end
	return false
end

function funcs.doo.make_drop(_type,_coords)
	if _type == "armor" then
		funcs.doo.req_model(API.get_hash_key("prop_armour_pickup"))
		return ntv.doo.amb_pickup(API.get_hash_key("PICKUP_ARMOUR_STANDARD"),_coords, 0, 1,API.get_hash_key("prop_armour_pickup"), false, true)
	elseif _type == "health" then
		funcs.doo.req_model(API.get_hash_key("prop_ld_health_pack"))
		return ntv.doo.amb_pickup(API.get_hash_key("PICKUP_HEALTH_STANDARD"),_coords, 0, 1,API.get_hash_key("prop_ld_health_pack"), false, true)
	end
end
		
function funcs.doo.pid_veh_kick2(_veh, _pid)
	local seat = -2
	for i=1, funcs.get.veh_seats(_veh) do
		if API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, i-2)) and API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(_veh, i-2)) == _pid then
			seat = i-2
			break
		end
	end
	if seat > -2 then
		local time = API.util.t_ms() + 1000
		while API.plyr.is.in_veh(_pid) and API.util.t_ms() < time do
			API.Ped.clear_tasks(API.plyr.get.ped(_pid))
			system.yield(200)
		end
		if API.plyr.is.in_veh(_pid) then
			glbls.kick_from_veh(_pid)
		end
		time = API.util.t_ms() + 2000
		while API.plyr.is.in_veh(_pid) and API.util.t_ms() < time do
			system.yield(0)
		end
		if not API.plyr.is.in_veh(_pid) then
			return true
		end
	end
	return false
end

function funcs.doo.kick_all_from_veh(_veh,_excl_frnd)
	_excl_frnd = _excl_frnd or false
	local function frnd_kick(_ped)
		if _excl_frnd and API.Ped.is.plyr(_ped) then
			return (not API.plyr.is.friend(API.plyr.get.plyr_from_ped(_ped)))
		end
		return true
	end
	local function should_kick(_ped)
		return (funcs.is.ent(_ped) and API.plyr.get.ped(API.plyr.my_id()) ~= _ped and frnd_kick(_ped))
	end
	local function empty_veh(_veh)
		for i = 1,funcs.get.veh_seats(_veh) do
			if should_kick(API.veh.get.ped_in_seat(_veh, i-2)) then
				return false
			end
		end
		return true
	end
	for i = 1,funcs.get.veh_seats(_veh) do
		if should_kick(API.veh.get.ped_in_seat(_veh, i-2)) then
			API.Ped.clear_tasks(API.veh.get.ped_in_seat(_veh, i-2))
		end
	end
	funcs.doo.yield_while_true((funcs.is.ent(_veh) and not empty_veh(_veh)),1000)
	if not funcs.is.ent(_veh) then
		return false
	elseif empty_veh(_veh) then
		return true
	end
	for i = 1,funcs.get.veh_seats(_veh) do
		if should_kick(API.veh.get.ped_in_seat(_veh, i-2)) then
			if API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, i-2)) then
				glbls.kick_from_veh(API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(_veh, i-2)))
			end
			API.Ped.clear_tasks(API.veh.get.ped_in_seat(_veh, i-2))
		end
	end
	funcs.doo.yield_while_true((funcs.is.ent(_veh) and not empty_veh(_veh)),2000)
	return (funcs.is.ent(_veh) and empty_veh(_veh))
end	

-----------------------plyr/ent fire explodes
function funcs.doo.expl_ent_pid(_ent_pid, _point1, _head, _point2, _type, _delay)
	if not funcs.is.ent_or_pid(_ent_pid) then
		funcs.N_P(2,"Invalid entity/pid for fire/explosion",funcs.ver_text,4,"Red")
	else
		local pos,heading,_blame = v3(0,0,0),180,-1
		if funcs.is.ent(_ent_pid) then
			if funcs.is.good_ped(_ent_pid,true,nil,nil) then -- if player
				heading = API.plyr.get.heading(API.plyr.get.plyr_from_ped(_ent_pid))
				pos=funcs.get.front_of_pos(API.plyr.get.coords(API.plyr.get.plyr_from_ped(_ent_pid)),heading, _point2, _head, _point1)

				_blame=_ent_pid
			else
				heading = API.ent.get.heading(_ent_pid)
				pos=funcs.get.front_of_pos(API.ent.get.coords(_ent_pid),heading, _point2, _head, _point1)
				if funcs.is.good_ped(_ent_pid,nil,nil,nil) then  --if ped
					_blame=_ent_pid
				else -- if vehicle or other
					_blame=100000
				end
			end
		else
			heading = API.plyr.get.heading(_ent_pid)
			pos=funcs.get.front_of_pos(API.plyr.get.coords(_ent_pid),heading, _point2, _head, _point1)
			_blame = API.plyr.get.ped(_ent_pid)
		end
		fire.add_explosion(pos, _type, true, false, 0, _blame)
		funcs.doo.delay(_delay)
	end
end

-------------------------------Overlays
---------------------------------------
function funcs.doo.overlay(_text,_tr,_tg,_tb,_ta,_ts,_tf,_tx,_ty)
	ui.set_text_color(_tr,_tg,_tb,_ta)				
	ui.set_text_scale(_ts)
	ui.set_text_font(_tf)
	ui.set_text_outline(true)
	ui.set_text_centre(true)
	ui.draw_text("".._text.."",v2((_tx),(_ty)))
end

function funcs.doo.overlay_left_no_outline(_text,_tr,_tg,_tb,_ta,_ts,_tf,_tx,_ty)
	ui.set_text_color(_tr,_tg,_tb,_ta)				
	ui.set_text_scale(_ts)
	ui.set_text_font(_tf)
	ui.draw_text("".._text.."",v2((_tx),(_ty)))
end

function funcs.doo.overlay_left(_text,_tr,_tg,_tb,_ta,_ts,_tf,_tx,_ty)
	ui.set_text_color(_tr,_tg,_tb,_ta)				
	ui.set_text_scale(_ts)
	ui.set_text_font(_tf)
	ui.set_text_outline(true)
	ui.draw_text("".._text.."",v2((_tx),(_ty)))
end

function funcs.doo.overlay_right(_text,_tr,_tg,_tb,_ta,_ts,_tf,_tx,_ty,_wrap)
	ui.set_text_color(_tr,_tg,_tb,_ta)				
	ui.set_text_scale(_ts)
	ui.set_text_font(_tf)
	ui.set_text_outline(true)
	ui.set_text_wrap(_wrap/2,_tx)
	ui.set_text_right_justify(true)
	ui.draw_text("".._text.."",v2((_tx),(_ty)))
end





function funcs.is.char_check(_char)
	if _char == "~" then --only virtual key i've found with this problem so this works
		return "\\~"
	end
	return _char
end


	


--------------------------------MEEEEEE
---------------------------------------

function funcs.ME._id()
	return API.plyr.my_id()
end

function funcs.ME._net_hash()
	return network.network_hash_from_player(API.plyr.my_id())
end	

function funcs.ME._ped()
	return API.plyr.get.ped(API.plyr.my_id())
end

function funcs.ME._veh()
	return API.plyr.get.veh(API.plyr.my_id())
end

function funcs.ME._crds()
	return API.plyr.get.coords(API.plyr.my_id())
end

function funcs.ME._head()
	return API.plyr.get.heading(API.plyr.my_id())
end

function funcs.ME._weap()
	return API.Ped.get.weapon(API.plyr.get.ped(API.plyr.my_id()))
end

function funcs.ME._veh_crds()
	return API.ent.get.coords(API.plyr.get.veh(API.plyr.my_id()))
end

function funcs.ME._veh_or_me_crds()
	if funcs.ME._in_veh() then
		return API.ent.get.coords(API.plyr.get.veh(API.plyr.my_id()))
	end
	return API.plyr.get.coords(API.plyr.my_id())
end

function funcs.ME._veh_or_me_rot()
	if funcs.ME._in_veh() then
		return API.ent.get.rotation(API.plyr.get.veh(API.plyr.my_id()))
	end
	return API.ent.get.rotation(funcs.ME._ped())
end

function funcs.ME._aim()
	return (API.plyr.is.aim(API.plyr.my_id()) or funcs.is.key_active(25,1) or API.cntrl.is.disabled_pressed(0,25)) --aiming the homing missile isnt "freeaiming"
end

function funcs.ME._aircrft_shoot()
	if funcs.ME._in_veh() and (API.strm.is.valid_helo(API.ent.get.model_hash(funcs.ME._veh())) or API.strm.is.valid_plane(API.ent.get.model_hash(funcs.ME._veh()))) then
		return (funcs.is.key_active(114,1.0) or funcs.is.key_active(331,1.0) or funcs.is.key_active(330,1.0))
	end
	return false
end

function funcs.ME._shoot()
	return API.Ped.is.shooting(API.plyr.get.ped(API.plyr.my_id()))
end

function funcs.ME._in_seat(_veh,_seat)
	return (funcs.is.veh(_veh) and API.veh.get.ped_in_seat(_veh, _seat) == API.plyr.get.ped(API.plyr.my_id()))
end

function funcs.ME._driving(_veh)
	return  (funcs.is.veh(_veh) and API.veh.get.ped_in_seat(_veh, -1) == API.plyr.get.ped(API.plyr.my_id()))
end

function funcs.ME._in_veh()
    return (API.plyr.is.in_veh(API.plyr.my_id()) and funcs.is.veh(API.plyr.get.veh(API.plyr.my_id())))
end

function funcs.ME._in_that_veh(_veh)
	return (API.plyr.is.in_veh(API.plyr.my_id()) and API.plyr.get.veh(API.plyr.my_id()) == _veh) 
end

--------------------------------Utility
---------------------------------------

function funcs.get.total_velocity(_ent)
	local vel = API.ent.get.velocity(_ent)
	return (mth.abs(vel.x)+mth.abs(vel.y)+mth.abs(vel.z))
end

function funcs.is.even_num(_val)
	if ((_val*.5) - mth.flr(_val*.5)) == 0 then
		return true
	end
	return false
end

function funcs.doo.feat_keys_name(_text,_feat,_select,_key1,_key2,_key3)
	if _select.value == 0 then
		_feat.name=_text..inputs.vk_list[_key1.value+1]
	elseif _select.value == 1 then
		_feat.name=_text..inputs.vk_list[_key1.value+1].." "..inputs.vk_list[_key2.value+1]
	else
		_feat.name=_text..inputs.vk_list[_key1.value+1].." "..inputs.vk_list[_key2.value+1].." "..inputs.vk_list[_key3.value+1]
	end
end

function funcs.doo.feat_keys_notify(_text1,_select,_key1,_key2,_key3,_text2)
	local text = _text1
	if _select.value == 0 then
		text=text..inputs.vk_list[_key1.value+1]
	elseif _select.value == 1 then
		text=text..inputs.vk_list[_key1.value+1].." and "..inputs.vk_list[_key2.value+1]
	else
		text=text..inputs.vk_list[_key1.value+1].." and "..inputs.vk_list[_key2.value+1].." and "..inputs.vk_list[_key3.value+1]
	end
	if _text2 ~= nil then
		text=text.._text2
	end
	funcs.N_P(2,text,funcs.ver_text,4,"Blue")
end

function funcs.is._01_to_bool(_val,_rvrs)
	if _val == 0 then
		if _rvrs == true then
			return true else return false
		end
	elseif _rvrs == true then
		return false else return true
	end
end

function funcs.is.bool_to_01(_bool,_rvrs)
	if _bool then
		if _rvrs == true then
			return 0 else return 1
		end
	elseif _rvrs == true then
		return 1 else return 0
	end
end
	
--------------------------------Keys
------------------------------------
function funcs.is.GW_mouse_right(_bool)
	if _bool then
		if funcs.is.key_active(25,0) then --prevents you from using wrong commands when using geewatch
			return true
		end
		return false
	end
	return true
end


function funcs.is.key_active(_num,_active)
	local _pressed=0.0
	if _active == 1 then
		_pressed=1.0
	end
	if API.cntrl.get.normal(0,_num)==_pressed then
		return true
	end
	return false
end

funcs.menu_key = MenuKey

-- Credit to Proddy for this function
funcs.keys = {}
function funcs.get.vk_fancy(...)
    local args = {...}
    assert(#args > 0, "must give at least one key")
    local ID = table.concat(args, "|")
    if not funcs.keys[ID] then
        local key = funcs.menu_key()
        for i=1,#args do
           key:push_vk(args[i])
        end
		
		--menu.notify("New key made! "..ID)
		
        funcs.keys[ID] = key
    end

    return funcs.keys[ID]
end


function funcs.is.vk_key_down(_key_name)
    return funcs.get.vk_fancy(utils.str_to_vk(_key_name)):is_down()
end

function funcs.is.vk_key_down_with_delay(_key_name)
	if funcs.is.vk_key_down(_key_name) then
		while funcs.is.vk_key_down(_key_name) do
			system.yield(0)
		end
		return true
	end
	return false
end

function funcs.is.vk_key_down_any(_delay)
	_delay=_delay or false
	for i=1,#inputs.vk_list do
		if _delay and funcs.is.vk_key_down_with_delay(inputs.vk_list[i]) then
			return true
		elseif funcs.is.vk_key_down(inputs.vk_list[i]) then
			return true
		end
	end
	return false
end




function funcs.doo.check_create_dir(_path)
	if not utils.dir_exists(_path) then
		utils.make_dir(_path)
	end
end

function funcs.doo.check_create_file(_path,_text)
	if not utils.file_exists(_path) then
		local file = io.open(_path, "w")
		file:write(_text)
		file:close()
	end
end

function funcs.doo.yield_ms(_num) --just makes lag :(
	local time = API.util.t_ms() + _num
	repeat
	until API.util.t_ms() >= time
end

-------------------------------Maths
------------------------------------

function funcs.get.pid_vel_pos(_pid,_mult)
	if funcs.is.valid_pid(_pid) then
		if API.plyr.is.in_veh(_pid) then
			return API.ent.get.coords(API.plyr.get.veh(_pid))+(API.ent.get.velocity(API.plyr.get.veh(_pid))*_mult)
		end
		return API.ent.get.coords(API.plyr.get.ped(_pid))+(API.ent.get.velocity(API.plyr.get.ped(_pid))*_mult)
	end
end

--tonumber(string.format("%.0f",value))

function funcs.get.random_int(_tbl)
	return _tbl[mth.rnd(1,#_tbl)]
end

function funcs.get.screen_pos_3d(_pos)
	local bool,screen_pos = graphics.project_3d_coord(_pos)
	return ((bool and funcs.get.screen_pos_math(screen_pos)) or nil)
end

function funcs.get.screen_pos_math(_v2)
	return v2(((_v2.x/API.gfx.get_w()/0.5)-1),((_v2.y/API.gfx.get_h()/0.5)-1)*-1)
end

function funcs.get.round(_num,_dec) --found online
	local mult = 10^(_dec or 0)
	return mth.flr(_num * mult + 0.5)/mult
end


function funcs.get.rgb_to_int(R, G, B, A) -- proddy
	A = A or 255
	return ((R&0x0ff)<<0x00)|((G&0x0ff)<<0x08)|((B&0x0ff)<<0x10)|((A&0x0ff)<<0x18)
end

function funcs.get.rgba_from_int(int)
	return ((int >> 16) & 0xff),((int >>  8) & 0xff),(int & 0xff),((int >> 24) & 0xff)
end

function funcs.get.Uint32(val)-- proddy
    return val & 0xfffffffff
end

--0 to 4,294,967,295 uint32
--2,147,483,648 to 2,147,483,647 int32

function funcs.get.Int32(x)-- proddy
    return x > 2147483647 and (x - 0xFFFFFFFF - 1) or x
end

function funcs.get.integer(_num) -- found online before i knew about math.tointeger
	local first, second = tostring(_num):find('%.')
	if first then
		return tonumber(tostring(_num):sub(1, first-1))
	end
	return second
end

function funcs.get.opp_180(_val)
	if _val + 180 > 180 then 
		return _val + 180 - 360
	end
	return _val + 180
end

function funcs.get.opp_rot(_rot)
	return v3(funcs.get.opp_180(_rot.x),funcs.get.opp_180(_rot.y),funcs.get.opp_180(_rot.z))
end

function funcs.get.dec_to_hex(num)
	return string.format("%x", num)
end

function funcs.get.hex_to_dec(num)
	--tonumber("0x53D9F1")
	--tonumber("53D9F1", 16)
	return tonumber(num,16)
end

function funcs.get.plyr_moving_pos(_pid)
	if API.plyr.is.in_veh(_pid) then
		return (API.ent.get.speed(API.plyr.get.veh(_pid))+2)/4, API.ent.get.heading(API.plyr.get.veh(_pid)), API.ent.get.coords(API.plyr.get.veh(_pid))
	else
		return API.ent.get.speed(API.plyr.get.ped(_pid))/4, API.plyr.get.heading(_pid),API.plyr.get.coords(_pid)
	end
end


function funcs.get._5_dec(_value)
	return mth.flr(_value) + mth.flr((_value - mth.flr(_value)) * 100000) * .00001
end

function funcs.get._4_dec(_value)
	return mth.flr(_value) + mth.flr((_value - mth.flr(_value)) * 10000) * .0001
end

function funcs.get._3_dec(_value)
	return mth.flr(_value) + mth.flr((_value - mth.flr(_value)) * 1000) * .001
end

function funcs.get._2_dec(_value)
	return mth.flr(_value) + mth.flr((_value - mth.flr(_value)) * 100) * .01
end

function funcs.get._1_dec(_value)
	return mth.flr(_value) + mth.flr((_value - mth.flr(_value)) * 10) * .1
end

function funcs.get.add_commas(number)--found on a website somewhere
  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
  int = int:reverse():gsub("(%d%d%d)", "%1,")
  return minus .. int:reverse():gsub("^,", "") .. fraction
end

function funcs.get.round_num(_value) -- i made this purely because it was annoying when the otr time counter would skip a second every so often due to mth.flr
	local round=0
	if funcs.is.num(_value) then
		local _value_floor = mth.flr(_value)
		local _value_decimal = _value - _value_floor
		if _value_decimal >= .5 then
			round = _value_floor+1
		else
			round = _value_floor
		end
	end
	return round
end

---------------------------------Names
--------------------------------------
function funcs.get.veh_model_name(_veh) --sometimes model name returns nil
	local model_name=""
	if funcs.is.veh(_veh) then
		model_name = API.veh.get.model(_veh)
		if model_name == nil then
			model_name=""
		end
	end
	return model_name
end

function funcs.get.veh_class_name(_veh)
	local class_name=""
	if funcs.is.veh(_veh) then
		class_name = API.veh.get.class_name(_veh)
		if class_name == nil then
			class_name=""
		end
	end
	return class_name
end

function funcs.get.veh_brand_name(_veh)
	local brand_name=""
	if funcs.is.veh(_veh) then
		brand_name = API.veh.get.brand(_veh)
		if brand_name == nil then
			brand_name=""
		end
	end
	return brand_name
end

function funcs.get.veh_ped_name_in_seat(_veh,_seat)
	local name = "Name"
	if funcs.is.veh(_veh) then
		if not funcs.is.any_plyr_in_veh(_veh) and not funcs.is.any_ped_in_veh(_veh) then
			name = "Empty vehicle"
		elseif _seat == "driver" then
			name = funcs.get.pid_name(API.veh.get.ped_in_seat(_veh, -1))
			if name == "Entity" then name = "Empty seat" end
		elseif _seat == "first_plyr" then
			if funcs.is.any_plyr_in_veh(_veh) then
				for i=1,funcs.get.veh_seats(_veh) do
					name = funcs.get.pid_name(API.veh.get.ped_in_seat(_veh, i-2))
					if name ~= "Entity" and name ~= "Ped" then break end
				end
			else
				name = "Ped"
			end
		elseif _seat == "first" then
			for i=0,funcs.get.veh_seats(_veh) do
				name = funcs.get.pid_name(API.veh.get.ped_in_seat(_veh, i-1))
				if name ~= "Entity" then break end
			end
		end
	end	
	return name
end

function funcs.get.pid_name(_pid_ped) --once or twice a player left between the time i recorded their name and used their name
	local name="Ped"
	if funcs.is.valid_pid(_pid_ped) or funcs.is.good_ped(_pid_ped,nil,nil,nil) then
		if funcs.is.good_ped(_pid_ped,true,nil,nil) then
			name = API.plyr.get.name(API.plyr.get.plyr_from_ped(_pid_ped))
			if name == nil then	name="Player" end
		elseif funcs.is.valid_pid(_pid_ped) then
			name = API.plyr.get.name(_pid_ped)
			if name == nil then	name="Player" end
		end
	else
		name = "Entity"
	end
	return name
end

function funcs.doo.ent_god_tog(_ent,_time,_bool)
	if funcs.ntwrk.ask_long(_ent,_time) then
		if _bool ~= nil then
			API.ent.set.god(_ent, _bool)
		else
			API.ent.set.god(_ent, funcs.get.opp_bool(API.ent.get.god(_ent)))
		end
		return true
	end
	return false
end


function funcs.get.opp_bool(_bool)
	if _bool then 
		return false
	end
	return true
end

function funcs.doo.yield_while_true(_bool,_val)
	local time = API.util.t_ms() + _val
	while _bool and time > API.util.t_ms() do
		system.yield(0)
	end
end



function funcs.doo.wipe_tbl(tbl)
	for k, v in pairs(tbl) do
		if type(v) == "table" then
			funcs.doo.wipe_tbl(v)
		end
		tbl[k]=nil
	end
end

function funcs.is.good_veh_file_name(_text)
	if string.find(_text,"%.%.") then
		funcs.N_P(2,_text.." skipped because the filename is invalid.\nCan't have .. in the name.",funcs.ver_text,9,"Yellow")
		return false
	end
	return true
end

function funcs.get.text_no_ext(_text)
	return string.sub(_text,1,string.len(_text)-4)
end
-----------------------Validity checks
--------------------------------------

function funcs.is.str(_str)
	return (_str ~= nil and type(_str) == "string")
end

function funcs.is.num(_num)
    return (_num ~= nil and tonumber(_num) ~= nil)
end

function funcs.is.ent(_ent)
	return (funcs.is.num(_ent) and API.ent.is.ent(_ent))
end

function funcs.is.ped(_ped)
	return (funcs.is.ent(_ped) and API.ent.is.ped(_ped))
end

function funcs.is.veh(_veh)
	return (funcs.is.ent(_veh) and API.ent.is.veh(_veh))
end

function funcs.is.helo(_veh)
	return (funcs.is.veh(_veh) and API.strm.is.valid_helo(API.ent.get.model_hash(_veh)))
end

function funcs.is.plane(_veh)
	return (funcs.is.veh(_veh) and API.strm.is.valid_plane(API.ent.get.model_hash(_veh)))
end

function funcs.is.obj(_obj)
	return (funcs.is.ent(_obj) and API.ent.is.obj(_obj))
end

function funcs.is.dead(_ent_pid)
	if funcs.is.ent(_ent_pid) and API.ent.is.dead(_ent_pid) then
		return true
	elseif funcs.is.valid_pid(_ent_pid) and funcs.is.ent(API.plyr.get.ped(_ent_pid)) and API.ent.is.dead(API.plyr.get.ped(_ent_pid)) then
		return true
	end
	return false
end

function funcs.is.ent_or_pid(_ent_pid)
	if funcs.is.ent(_ent_pid) or funcs.is.valid_pid(_ent_pid) then
		return true
	end
	return false
end

function funcs.is.valid_pid(_pid)
	return (funcs.is.num(_pid) and API.plyr.is.valid(_pid))
end




function funcs.get.all_plys_but_me(...)--straight from keks. Couldnt figure this shit out on my own at the time
	local dont_ignore_me <const> = ...
	local pid, me = -1
	if not dont_ignore_me then
		me = API.plyr.my_id()
	end
	return function()
		if pid < 31 then
			local is_valid
			repeat
				pid = pid + 1
				is_valid = API.plyr.is.valid(pid) and (dont_ignore_me or me ~= pid)
			until pid == 31 or is_valid
			if is_valid then
				return pid
			end
		end
	end
end


function funcs.is.table_has(_table, _element,_index)
	if funcs.is.num(_index) then
		for i=1,#_table do
			if _table[i][_index] == _element then
				return true
			end
		end	
	else
		for i=1,#_table do
			if _table[i] == _element then
				return true
			end
		end	
	end
	return false
end


function funcs.doo.delay(_delay)
	local time = API.util.t_ms() + _delay
	while API.util.t_ms() < time do
		system.yield(0)
	end
end

function funcs.ntwrk.ask_have(_ent)
	if funcs.is.ent(_ent) and network.has_control_of_entity(_ent) then
		return true
	end
	return false
end

function funcs.ntwrk.ask_quick(_ent)
	if funcs.is.ent(_ent) then
		if network.has_control_of_entity(_ent) then
			return true
		else
			network.request_control_of_entity(_ent)
		end
	end
	return false
end

function funcs.ntwrk.ask_long(_ent, time)
    if funcs.is.ent(_ent) then
        if not funcs.ntwrk.ask_have(_ent) then
            funcs.ntwrk.ask_quick(_ent)
            local _time = API.util.t_ms() + (time or 250)
            while funcs.is.ent(_ent) and not funcs.ntwrk.ask_have(_ent) and _time > API.util.t_ms() do
                system.yield(0)
                funcs.ntwrk.ask_quick(_ent)
            end
        end
        return funcs.ntwrk.ask_have(_ent)
    end
	return false
end

function funcs.doo.remove_ent(_ent,_time)
	if funcs.ntwrk.ask_long(_ent,_time) then
		API.ent.set.coords(_ent, funcs.get.random_pos("water")+v3(0,0,-2000))
		API.ent.set.no_need(_ent)
		API.ent.delete(_ent)
		return true
	end
	return false
end
-------------------------Peds
-----------------------------



function funcs.doo.req_anim(_anim)
    while not API.strm.is.anim_loaded(_anim) do
      API.strm.req_anim(_anim)
      system.yield(10)
    end
end

function funcs.is.good_ped(_ped,_plyr,_dead,_veh)
	if funcs.is.ent(_ped) and API.ent.is.ped(_ped) then
		if _plyr ~= nil and API.Ped.is.plyr(_ped) ~= _plyr then
			return false
		elseif _dead ~= nil and API.ent.is.dead(_ped) ~= _dead then
			return false
		elseif _veh ~= nil and API.Ped.is.in_veh(_ped) ~= _veh then
			return false
		end
		return true
	end
	return false
end

function funcs.get.all_peds_in_veh(_veh,_plyr,_dead)
	local ped_table = {}
	if funcs.is.veh(_veh) then
		for i=0, funcs.get.veh_seats(_veh) do
			if funcs.is.good_ped(API.veh.get.ped_in_seat(_veh, i-1),_plyr,_dead,nil) then
				ped_table[#ped_table+1]=API.veh.get.ped_in_seat(_veh, i-1)
			end
		end
	end
	return ped_table
end

function funcs.doo.give_ped_weap(_ped,_weap)
	if funcs.is.ent(_ped) and API.ent.is.ped(_ped) then
		--if not API.wpn.ped_has(_ped, _weap) then
			API.wpn.ped_give(_ped, _weap, 100, true)
		--end
		system.yield(0)
		--weap_info.do_upgr[_weap](_ped)
		funcs.doo.weap_upgr(_ped,_weap)
		system.yield(0)
		--ntv.doo.ped_refill_ammo_now(_ped)
		funcs.doo.give_ped_ammo(_ped,_weap)
		return true
	end
	return false
end

function funcs.doo.give_ped_weap2(_ped,_weap)
	if funcs.is.ped(_ped) then
		if funcs.doo.give_ped_ammo(_ped,_weap) then --somehow this gives a weapon
			system.yield(5)
			if funcs.is.ped(_ped) then
				if weap_info.do_upgr[_weap](_ped) then
					system.yield(5)
					if funcs.is.ped(_ped) then
						return funcs.doo.give_ped_ammo(_ped,_weap)
					end
				end
				return true
			end
		end
	end
	return false
end
	
function funcs.doo.weap_upgr(__ped,__weap)
	local flshlght = weap_info.hand.comp.flshlght[__weap]
	local scope = weap_info.hand.comp.scope[__weap]
	local grip = weap_info.hand.comp.grip[__weap]
	local explsv = weap_info.hand.comp.ammo.explsv[__weap]
	local fire = weap_info.hand.comp.ammo.fire[__weap]
	local armr = weap_info.hand.comp.ammo.armr[__weap]
	local fmj = weap_info.hand.comp.ammo.fmj[__weap]
	local hllw = weap_info.hand.comp.ammo.hllw[__weap]
	local mag = weap_info.hand.comp.mag[__weap]
	local spprsr = weap_info.hand.comp.spprsr[__weap]
	local brake = weap_info.hand.comp.brake[__weap]
	local tint = weapon.get_weapon_tint_count(__weap)
	local c_table = {}

	if flshlght then c_table[#c_table+1]=flshlght end
	if scope then c_table[#c_table+1]=scope end
	if grip then c_table[#c_table+1]=grip end
	
	if explsv then c_table[#c_table+1]=explsv
	elseif fire then c_table[#c_table+1]=fire
	elseif armr then c_table[#c_table+1]=armr
	elseif fmj then	c_table[#c_table+1]=fmj
	elseif hllw then c_table[#c_table+1]=hllw
	elseif mag then c_table[#c_table+1]=mag
	end
	
	if spprsr then c_table[#c_table+1]=spprsr
	elseif brake then c_table[#c_table+1]=brake
	end
	
	if #c_table == 0 and (not tint or tint == 0) then
		return false
	end
	for i=1,#c_table do
		weapon.give_weapon_component_to_ped(__ped,__weap, c_table[i])
	end
	if tint and tint > 0 then
		weapon.set_ped_weapon_tint_index(__ped, __weap, mth.rndm(1, tint))
	end
	return true
end

function funcs.doo.give_ped_ammo(_ped,_weapon_hash)
	local found, ammo = API.wpn.get_max_ammo(_ped,_weapon_hash)
	for i=1,5 do
		if found then
			break
		else
			system.yield(0)
			found, ammo = API.wpn.get_max_ammo(_ped,_weapon_hash)
		end
	end
	if found then
		API.wpn.ped_set_ammo(_ped, _weapon_hash,ammo)
	end
	return found
end

function funcs.doo.ped_combat_attrib(_ped,_hate,_time,_res)
	_res = _res or false
	_hate = _hate or false
	_time = _time or 50
	if funcs.ntwrk.ask_long(_ped,_time) then -- not sure if control is needed for all of this but it also verifies that theyre real
		if _res and API.ent.is.dead(_ped) then
			local ped_veh,ped_seat=nil,nil
			if API.Ped.is.in_veh(_ped) then
				ped_veh = API.Ped.get.veh(_ped)
				ped_seat = funcs.get.what_seat_ped_in(ped_veh,_ped)
			end
			API.Ped.resurrect(_ped)
			system.yield(0)
			API.Ped.clear_tasks(_ped)
			system.yield(0)
			funcs.doo.set_ped_health(_ped,200,25)
			ntv.doo.ped_revive(_ped) 
			if funcs.is.veh(ped_veh) and ped_seat > -2 then
				API.Ped.set.into_veh(_ped,ped_veh,ped_seat)
				ai.task_vehicle_drive_wander(_ped, ped_veh, 50, 786956)
			else
				ai.task_wander_standard(_ped,10,true)
			end
			system.yield(25)
		end
		funcs.ntwrk.ask_quick(_ped)
		API.Ped.set.combat_range(_ped, 2) 					-- far range
		API.Ped.set.combat_ability(_ped, 2) 				-- attack
		API.Ped.set.combat_attributes(_ped, 1, true) 		-- can use vehicles
		API.Ped.set.combat_attributes(_ped, 2, true) 		-- can do drivebys 
		API.Ped.set.combat_attributes(_ped, 3, true) 		-- can leave vehicle
		API.Ped.set.combat_attributes(_ped, 5, true) 		-- can fight unarmed
		API.Ped.set.combat_attributes(_ped, 46, true)		-- can fight  melee against firing weapon
		API.Ped.set.combat_attributes(_ped, 63, false) 		-- run from tough ped
		API.Ped.set.combat_attributes(_ped, 292, false) 	-- freeze movement
		API.Ped.set.combat_attributes(_ped, 1424, true) 	-- can use weapon
		if _hate then
			funcs.ntwrk.ask_quick(_ped)
			if API.Ped.get.rel_group_hash(_ped) ~= API.get_hash_key("HATES_PLAYER") then
				API.Ped.remove_from_group(_ped)
				system.yield(0)
				API.Ped.set.rel_group_hash(_ped, API.get_hash_key("HATES_PLAYER"))
				API.Ped.set.never_leaves_group(_ped, true)
			end
			API.Ped.set.can_attack_friendly(_ped,true,false)
			API.Ped.set.combat_attributes(_ped, 52, true) 	-- ignore traffic
			API.Ped.set.combat_movement(_ped, 3)	 		-- offensive
			API.Ped.set.config_flag(_ped, 187, 0) 			-- is hurt
			API.Ped.set.config_flag(_ped, 188, 1) 			-- disable hurt
			API.Ped.set.config_flag(_ped, 128, 1) 			-- can be agitated
			API.Ped.set.config_flag(_ped, 183, 1) 			-- agitated
			API.Ped.set.config_flag(_ped, 229, 1) 			-- disable vehicle panic
			API.Ped.set.config_flag(_ped, 430, 1) 			-- ignore being on fire
		end
		system.yield(0)
		return true
	end
	return false
end
	
	-- local coverOptions = {
-- --         canUseCover = 0,
-- --         canUseVehicles = 1,
-- --         canDoDrivebys = 2,
-- --         canLeaveVehicle = 3,
-- --         canFightArmedPedsWhenNotArmed = 5,
-- --         canTauntInVehicle = 20,
-- --         alwaysFight = 46,
-- --         ignoreTrafficWhenDriving = 52,
-- --         fleesFromInvincibleOpponents = 63,
-- --         freezeMovement = 292,  
-- --         playerCanUseFiringWeapons = 1424  
-- --     }

function funcs.doo.ped_ragdoll(_ped,_bool,_time)
	if funcs.ntwrk.ask_long(_ped,_time) then-- not sure if control is needed but it also verifies that theyre real
		API.Ped.set.can_ragdoll(_ped, _bool)
		if _bool == false then
			for bf = 1, 26 do
				API.Ped.set.ragdoll_flags(_ped, bf)
				system.yield(0)
			end
		end
		return true
	end
	return false
end

function funcs.doo.set_ped_health(_ped,_num,_time)
	if funcs.is.ped(_ped) and API.Ped.get.health(_ped) ~= _num and funcs.ntwrk.ask_long(_ped,_time) then-- not sure if control is needed
		if _num <=200 then
			API.Ped.set.max_health(_ped, 200)
		else
			API.Ped.set.max_health(_ped, _num)
		end
		API.Ped.set.health(_ped, _num)
	end
end

function funcs.doo.ped_force(aim, time,_direction,_force)
	local time = API.util.t_ms()+1000
	local speed = funcs.get.total_velocity(aim)
	while time > API.util.t_ms() and funcs.is.ent(aim) do
		if funcs.ntwrk.ask_quick(aim) then
			API.Ped.set.ragdoll(aim,1000,1000,0)
			if _direction == "up" then
				API.ent.force(aim, 1,mth.rndm(-2,2), mth.rndm(-2,2), _force, 0, 0, 0,   false, true)
			elseif _direction == "forward" then
				local force = funcs.get.flight_calc(API.ent.get.rotation(aim),_force,0,false,false,true)
				API.ent.force(aim, 1,force.x,force.y,force.z, 0, 0, 0,   false, true)
			end
		end
		system.yield(0)
		if funcs.is.ent(aim) and funcs.get.total_velocity(aim) > (speed*2) then
			time = API.util.t_ms()
		end
	end
end

function funcs.doo.rope_ents(_ent1,_ent2,_speed,_wind,_minimum,_delete)
		API.rope.load()
		if type(_ent2) == "userdata" then
			local pos2=_ent2
			funcs.doo.req_model(-1707997257)
			_ent2 = object.create_object(-1707997257,pos2, true,false)
			API.ent.freeze(_ent2,true)
			API.ent.set.visible(_ent2,false)
			funcs.doo.id_migrate(_ent2,0)
		end					
		local dist = funcs.get.dist_entent_v3(_ent1,_ent2)
		local _min = 2 or _minimum
		local rope = API.rope.add(
		API.ent.get.coords(_ent1), 			-- pos
		v3(), 	-- Rot
		dist, 	-- Max length
		1, 		-- Rope type
		dist, 	-- Init length
		_min, 		-- Min length
		_speed, -- Change rate
		false, 	-- Onlyppu
		false, 	-- Collision
		false, 	-- Lock from front
		0.0, 	-- Physics multiplier 1.0 default
		false 	-- Breakable
		)
		API.rope.attach_ents(
		rope, 	-- Rope id 
		_ent1,	-- Entity 1
		_ent2, 	-- Entity 2
		API.ent.get.coords(_ent1), 		-- Entity pos 1
		API.ent.get.coords(_ent2), 		-- Entity pos 2
		dist, 	-- Length
		0, 		-- a7
		0, 		-- a8
		"Center", -- Entity bone name 1
		"Center"  -- Entity bone name 2
		)
		if _wind then
			API.rope.start_wind(rope)
			system.yield(3000)
		end
		if _delete then
			API.rope.delete(rope)
		end
		--API.rope.unload()
end


function funcs.doo.remove_dead_ped_from_seat(_veh,_seat)
	if  funcs.is.veh(_veh) and funcs.is.ent(API.veh.get.ped_in_seat(_veh, _seat)) and API.ent.is.dead(API.veh.get.ped_in_seat(_veh, _seat)) then
		API.Ped.clear_tasks(API.veh.get.ped_in_seat(_veh, _seat))
		local time = API.util.t_ms() + 500
		while funcs.is.ent(API.veh.get.ped_in_seat(_veh, _seat)) and time > API.util.t_ms() do
			system.yield(0)
		end
		if funcs.is.ent(API.veh.get.ped_in_seat(_veh, _seat)) and not API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, _seat)) then
			time = API.util.t_ms() + 500
			while time > API.util.t_ms() and funcs.is.ent(API.veh.get.ped_in_seat(_veh, _seat)) do
				system.yield(0)
				if funcs.ntwrk.ask_quick(API.veh.get.ped_in_seat(_veh, _seat)) then
					API.ent.set.no_need(API.veh.get.ped_in_seat(_veh, _seat))
					API.ent.delete(API.veh.get.ped_in_seat(_veh, _seat))
					time = API.util.t_ms()
					system.yield(100)
				end
			end
		end
		if funcs.is.seat_empty(_veh, _seat) then
			return true
		end
	end
	return false
end

-------------------------Vehicle Status
---------------------------------------

function funcs.is.this_veh(_veh,_string)
	return (funcs.is.veh(_veh) and API.get_hash_key(_string) == API.ent.get.model_hash(_veh))
end

function funcs.is.plyr_driving(veh)
	return (funcs.is.veh(veh) and API.Ped.is.plyr(API.veh.get.ped_in_seat(veh, -1)))
end

function funcs.get.a_pid_in_veh(veh)
	for s = 1, funcs.get.veh_seats(veh) do
		if not funcs.ME._in_seat(veh,s-2) then
			for i = 0, 31 do
				if funcs.is.this_pid_in_seat(veh,s-2,i) then
					return i
				end
			end
		end
	end
	return -1
end

function funcs.get.v3_to_text(_v3)
	return ("v3("..funcs.get._3_dec(_v3.x)..","..funcs.get._3_dec(_v3.y)..","..funcs.get._3_dec(_v3.z)..")")
end

function funcs.get.v3_to_text2(_v3)
	return ("v3("..tostring(_v3.x)..","..tostring(_v3.y)..","..tostring(_v3.z)..")")
end
	
function funcs.get.veh_seats(_veh)
	return ((funcs.is.veh(_veh) and veh_stuff.info[API.ent.get.model_hash(_veh)].SEATS) or 0)
end

function funcs.is.this_pid_in_seat(_veh,_seat,_pid)
	if funcs.is.veh(_veh) and funcs.is.valid_pid(_pid) then
		if API.veh.get.ped_in_seat(_veh, _seat) == API.plyr.get.ped(_pid) then
			return true
		end
	end
	return false
end

function funcs.get.any_pid_in_seat(_veh,_seat)
	if funcs.is.veh(_veh) and API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, _seat)) then
		return API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(_veh, _seat))
	end
	return -1
end

function funcs.get.what_seat_plyr_in(_veh,_pid)
	for i = 1,funcs.get.veh_seats(_veh) do
		if funcs.is.ent(API.veh.get.ped_in_seat(_veh, i-2)) and API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, i-2)) and API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(_veh, i-2)) == _pid then
			return (i-2)
		end
	end
	return -2
end

function funcs.get.what_seat_ped_in(_veh,_ped)
	for i = 1,funcs.get.veh_seats(_veh) do
		if API.veh.get.ped_in_seat(_veh, i-2) == _ped then
			return i-2
		end
	end
	return -2
end

function funcs.get.first_free_seat(_veh,_incl_npc)
	_incl_npc=_incl_npc or false
	-- local seat=-2
	-- local dead_fail=false
	-- local success=false
	for i = 1,funcs.get.veh_seats(_veh) do
		if funcs.is.seat_empty(_veh, i-2) then
			return i-2, false
		elseif API.ent.is.dead(API.veh.get.ped_in_seat(_veh,  i-2)) then
			if funcs.doo.remove_dead_ped_from_seat(_veh,i-2) then
				return i-2, false
			else
				return -2, true
			end
		elseif _incl_npc and not API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, i-2)) then
			return i-2, false
		end
	end
	return -2, false
end

function funcs.is.any_plyr_in_veh(_veh)
	for i = 1,funcs.get.veh_seats(_veh) do
		if API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, i-2)) then
			return true
		end
	end
	return false
end

function funcs.is.any_ped_in_veh(_veh)
	for i = 1,funcs.get.veh_seats(_veh) do
		if funcs.is.ent(API.veh.get.ped_in_seat(_veh, i-2)) then
			return true
		end
	end
	return false
end

function funcs.is.seat_empty(_veh,_seat)
	return (funcs.is.veh(_veh) and not API.ent.is.ped(API.veh.get.ped_in_seat(_veh, _seat)))
end

function funcs.is.friend_in_seat(_veh,_seat)
	return (funcs.is.veh(_veh) and API.ent.is.ped(API.veh.get.ped_in_seat(_veh, _seat)) and API.plyr.is.friend(API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(_veh, _seat))))
end

function funcs.is.veh_empty(_veh)
	if funcs.is.veh(_veh) then
		for i = 1,funcs.get.veh_seats(_veh) do
			if not funcs.is.seat_empty(_veh,i-2) then
				return false
			end
		end
	end
	return true
end

function funcs.get.num_empty_seats(_veh)
	local seat=0
	if funcs.is.veh(_veh) then
		for i = 1,funcs.get.veh_seats(_veh) do
			if funcs.is.seat_empty(_veh,i-2) then
				seat=seat+1
			end
		end
	end
	return seat
end


	
---------------------------------Spawns
---------------------------------------

function funcs.doo.req_model(_hash)
	if not API.strm.is.model_loaded(_hash) then
		API.strm.req_model(_hash)
		while (not API.strm.is.model_loaded(_hash)) do
			system.yield(10)
		end
	end
end

function funcs.get.veh_1st_free_seat(_veh)
	if funcs.is.veh(_veh) then
		for i = 1,funcs.get.veh_seats(_veh) do
			if ntv.is.veh_seat_free(_veh,i-2) then
				return (i-2)
			end
			
			-- if not API.ent.is.ped(API.veh.get.ped_in_seat(_veh, i-2)) then
				-- return (i-2)
			-- end
		end
	end
	return nil
end

function funcs.doo.id_migrate(_ent,_bool)
	if funcs.is.ent(_ent) then
		local id
		if API.ent.is.ped(_ent) then
			id = ntv.get.ped_id(_ent)
		elseif API.ent.is.veh(_ent) then
			id = ntv.get.veh_id(_ent)
		elseif API.ent.is.obj(_ent) then
			id = ntv.get.obj_id(_ent)
		end
		if funcs.is.num(id) and ntv.is.id_exists(id) then
			ntv.set.id_can_migrate(id,_bool)
			ntv.set.id_always_exist(id,funcs.ME._id(),1)
		end
	end
end
 
 
function funcs.get.spawn_points(_pos,_max)
	_max = _max or 10
	local points={}
	local spawn_dist=20
	local found,spawn_point=false
	repeat
		found, spawn_point = gameplay.find_spawn_point_in_direction(
		_pos,
		v3(mth.rndm(-1000,1000)/1000,mth.rndm(-1000,1000)/1000,mth.rndm(1000,1000)/1000),
		spawn_dist
		)
		if found then
			points[#points+1]=spawn_point
		end
		spawn_dist=spawn_dist*1.1
	until #points>=_max
	return funcs.get.randomized_table(points)
end

function funcs.get.randomized_table(_tbl)
	local rand
	local t = {}
	local t_true={}
	repeat
		rand = mth.rndm(1,#_tbl)
		if not t_true[rand] then
			t[#t+1]=_tbl[rand]
			t_true[rand]=true
		end
	until #t == #_tbl
	return t
end


-------------------------Vehicle Repair
---------------------------------------
function funcs.doo.veh_repair_all(aim,_time,_pid,_bool,_plate_t,_plate_i) --i had to do this in chunks because its a lot of stuff and repair is glitchy in gta and control doesnt always last 
	_bool = _bool or false
	local _1_fire,_2_basic,_3_extra,_4_rot,repaired=false,false,false,false,false
	local time = API.util.t_ms() + _time
	local  _name, _model = "Name", "Vehicle"
	if funcs.is.veh(aim) then
		local speed = API.ent.get.velocity(aim)
		_name = funcs.get.veh_ped_name_in_seat(aim,"first_plyr")
		_model = funcs.get.veh_model_name(aim)
		while funcs.is.veh(aim) and API.util.t_ms() < time and not repaired do
			system.yield(0)
			if _pid ~= nil then
				funcs.doo.hover_above_pid(_pid)
			end
			if not _1_fire and funcs.ntwrk.ask_quick(aim) then
				funcs.doo.ent_repair_fire(aim)
				_1_fire=true
			end
			if _1_fire and not _2_basic and funcs.ntwrk.ask_quick(aim) then
				funcs.doo.veh_repair_basic(aim)
				_2_basic=true
			end
			if _2_basic and not _3_extra and funcs.ntwrk.ask_quick(aim) then
				funcs.doo.veh_repair_extra(aim,_plate_t,_plate_i)
				_3_extra=true
			end
			if _3_extra and not _4_rot and funcs.ntwrk.ask_quick(aim) then
				funcs.doo.veh_repair_rot(aim)
				system.yield(50) --without this the velocity is less likely to apply
				_4_rot=true
			end
			if _4_rot and not repaired and funcs.ntwrk.ask_quick(aim) then
				API.ent.set.velocity(aim,speed)
				repaired=true
			end
		end
	end
	if repaired then
		if _bool then
			funcs.N_P(2,_name .. " - " .. _model .. " \nRepaired.",funcs.ver_text,4,"Green")
		end
		return true
	else
		funcs.N_P(2,_name .. " - " .. _model .. " \nFailed to repair.",funcs.ver_text,4,"Red")
		return false
	end
end

function funcs.doo.veh_repair_most(_veh,time,_plate_t,_plate_i)
	if funcs.ntwrk.ask_long(_veh,time) then
		funcs.doo.ent_repair_fire(_veh)
		funcs.doo.veh_repair_basic(_veh)
		funcs.doo.veh_repair_extra(_veh,_plate_t,_plate_i)
		return true
	end
	return false
end

function funcs.doo.ent_repair_fire(aim)
	if API.ent.is.on_fire(aim) then
		fire.stop_entity_fire(aim)
	end
end

function funcs.doo.veh_repair_basic(aim)
	if API.strm.is.valid_helo(API.ent.get.model_hash(aim)) then -- just in case i fucked that helo lol
		if not API.veh.is.extra_on(aim, 1) then
			API.veh.set.extra(aim, 1, false)
		end
		if not API.veh.is.extra_on(aim, 2) then
			API.veh.set.extra(aim, 2, false)
		end
		if not API.veh.is.extra_on(aim, 7) then
			API.veh.set.extra(aim, 7, false)
		end
	end
	funcs.doo.veh_tire_pop_guts(aim,false)
	API.veh.set.undriveable(aim, false)
	API.veh.set.fixed(aim)
	API.veh.set.deform_fixed(aim)
	API.veh.set.engine_health(aim, 1000)
	ntv.set.veh_considered(aim,1)
	ntv.set.veh_dirt_level(aim,0.0)
end

function funcs.doo.veh_repair_extra(aim,_plate_t,_plate_i)
	API.ent.set.gravity(aim, true)
	API.ent.set.collision(aim, true,false)
	API.veh.set.engine_on(aim, true, true, false)
	API.veh.set.deform_fixed(aim)
	API.veh.set.bulletproof(aim,true)
	API.veh.set.doors_locked(aim, 1)
	API.veh.set.doors_locked_all(aim, false)
	if _plate_i then
		API.veh.set.plate_index(aim, _plate_i)
	end
	if _plate_t then
		API.veh.set.plate_text(aim,_plate_t)
	end
end

function funcs.doo.veh_repair_rot(aim)
	if API.veh.get.class(aim) ~= 15 and API.veh.get.class(aim) ~= 16 then
		if not API.veh.is.on_all_wheels(aim) then
			API.ent.set.rotation(aim,v3(0,0,API.ent.get.heading(aim)))
		end
		if not API.ent.is.in_air(aim) then
			API.veh.set.on_ground(aim)
		end
	elseif not API.ent.is.in_air(aim) then
		API.ent.set.rotation(aim,v3(0,0,API.ent.get.heading(aim)))
		API.veh.set.on_ground(aim)
	end
end


-----------------Vehicle Damage/Destroy
---------------------------------------
function funcs.doo.veh_damage(_veh, _time,_notif)
	_notif = _notif or false
	local _name = _name or funcs.get.veh_ped_name_in_seat(_veh,"first_plyr")
	local _model = _model or funcs.get.veh_model_name(_veh)
	local complete=false
	local time = API.util.t_ms() + _time
	while API.util.t_ms() < time and funcs.is.veh(_veh) and not complete do
		if funcs.ntwrk.ask_quick(_veh) then
			funcs.doo.veh_damage_guts(_veh)
			complete=true
		end
		system.yield(0)
	end
	if complete then
		if _notif then
			funcs.N_P(2,_name .. " - " .. _model .. " \nDamaged.",funcs.ver_text,4,"Green")
		end
		return true
	else
		funcs.N_P(2,_name .. " - " .. _model .. " \nFailed to damage.",funcs.ver_text,4,"Red")
	end
end

function funcs.doo.veh_damage_guts(_veh)
	API.ent.set.god(_veh, false)
	funcs.doo.veh_tire_pop_guts(_veh,true)
	ntv.set.veh_invncbl_wndws(_veh,0)
	ntv.doo.brk_veh_wndws(_veh)
	API.veh.set.engine_on(_veh, false, true, true)
	API.veh.set.engine_health(_veh, 1)
	ntv.set.veh_body_health(_veh,0)
	API.veh.set.plate_index(_veh, 1)
	API.veh.set.plate_text(_veh,"G-Damage")
end

function funcs.doo.veh_destroy(_veh, time, _name, _model, _pid)
	_pid = _pid or funcs.get.non_plyr_ped()
	_name = _name or funcs.get.veh_ped_name_in_seat(_veh,"first_plyr")
	_model = _model or funcs.get.veh_model_name(_veh)
	if time > 0 then
		if funcs.ntwrk.ask_long(_veh,time) then
			funcs.doo.veh_destroy_guts(_veh, _pid)
			funcs.N_P(2,_name .. " - " .. _model .. " \nDestroyed.",funcs.ver_text,4,"Green")
			return true
		else
			funcs.doo.veh_destroy_guts(_veh, _pid)
			funcs.doo.veh_destroy_guts(_veh, _pid)
			funcs.N_P(2,_name .. " - " .. _model .. " \nFailed to request control.\nTrying to destroy...",funcs.ver_text,4,"Blue")
		end
	else
		funcs.doo.veh_destroy_guts(_veh, _pid)
		funcs.N_P(2,_name .. " - " .. _model .. " \nDestroyed.",funcs.ver_text,4,"Green")
	end
end

function funcs.doo.veh_destroy_guts(_veh, _pid)
	API.ent.set.god(_veh, false)
	ntv.set.veh_considered(_veh,0)
	API.veh.set.engine_on(_veh, false, false, true)
	API.veh.set.engine_health(_veh, -4000)
	ntv.set.veh_body_health(_veh,0)
	API.veh.set.doors_locked(_veh, 4)
	API.veh.set.doors_locked_all(_veh, true)
	API.veh.set.plate_index(_veh, 1)
	API.veh.set.plate_text(_veh,"G-Dstroy")
	funcs.doo.veh_tire_pop(_veh, 50, nil, nil,false) --request control again just to ensure godmode is removed
	API.ent.set.god(_veh, false)
	API.veh.set.undriveable(_veh, true)
	API.ent.set.no_need(_veh)
	fire.add_explosion(API.ent.get.coords(_veh), 40, true, false, 0, _pid)
	--fire.add_explosion(pos, 59, true, false, 0, _pid) -- orbital
	--fire.add_explosion(pos, 60, true, false, 0, _pid) -- bomb standard wide
end
--------------------------Vehicle Tires
---------------------------------------
function funcs.doo.veh_tire_pop(_veh, time, _name, _model, _bool)
	_name = _name or tostring("Vehicle")
	_model = _model or tostring(" ")
	_bool = _bool or false
	if funcs.ntwrk.ask_long(_veh,time) then
		funcs.doo.veh_tire_pop_guts(_veh,true)
		if _bool then
			funcs.N_P(2,_name .. " - " .. _model .. " \nTires popped :)",funcs.ver_text,4,"Green")
		end
	end
end

function funcs.doo.veh_tire_pop_guts(_veh,_bool)
--todo add vehicle specific tire pops
-- '0 = wheel_lf / bike, plane or jet front  
-- '1 = wheel_rf  
-- '2 = wheel_lm / in 6 wheels trailer, plane or jet is first one on left  
-- '3 = wheel_rm / in 6 wheels trailer, plane or jet is first one on right  
-- '4 = wheel_lr / bike rear / in 6 wheels trailer, plane or jet is last one on left  
-- '5 = wheel_rr / in 6 wheels trailer, plane or jet is last one on right  
-- '45 = 6 wheels trailer mid wheel left  --shit dont work
-- '47 = 6 wheels trailer mid wheel right  --shit dont work 

	_bool = _bool or false
	API.veh.set.tires_can_burst(_veh,_bool)
	for i = 0, 9 do
		if _bool then
			if ntv.get.veh_tire_health(_veh,i) ~= 0.0 then
				API.veh.set.tire_burst(_veh, i, true, 1000.0)
				ntv.set.veh_tire_health(_veh,i,0.0) -- will affect vehicles that wouldnt pop normally such as menacer or hunter
			end
		elseif ntv.get.veh_tire_health(_veh,i) ~= 1000.0 then
			API.veh.set.tire_fixed(_veh, i)
			ntv.set.veh_tire_health(_veh,i,1000.0)
		end
	end
end

-------------------------Vehicle Fucked
---------------------------------------

function funcs.doo.veh_fuck(_veh, _time,_bool,_hover,_pid)
	if not funcs.is.veh(_veh) then
		funcs.N_P(2,funcs.get.veh_ped_name_in_seat(_veh,"first_plyr").. " \nVehicle fuck had whiskey-dick :(",funcs.ver_text,4,"Red")
	else
		_bool = _bool or false
		_hover = _hover or false
		local fucked = false
		local time = API.util.t_ms() + _time
		while API.util.t_ms() < time and funcs.is.veh(_veh) and not fucked do
			if _hover then
				funcs.doo.hover_above_pid(_pid)
			end
			if funcs.ntwrk.ask_quick(_veh) then
				funcs.doo.veh_fuck_guts(_veh)
				fucked=true
			end
			system.yield(0)
		end
		if fucked then
			if _bool then
				funcs.N_P(2,funcs.get.veh_ped_name_in_seat(_veh,"first_plyr") .. " - " .. funcs.get.veh_model_name(_veh) .. " \nVehicle fucked :)",funcs.ver_text,4,"Green")
			end
			return true
		else
			funcs.N_P(2,funcs.get.veh_ped_name_in_seat(_veh,"first_plyr") .. " - " .. funcs.get.veh_model_name(_veh) .. " \nVehicle fuck had whiskey-dick :(",funcs.ver_text,4,"Red")
		end
	end
	return false
end

function funcs.doo.veh_fuck_guts(_veh)
	API.ent.set.god(_veh, false)
	if API.strm.is.valid_helo(API.ent.get.model_hash(_veh)) then -- fuck helos
		API.veh.set.extra(_veh, 1, 0)
		API.veh.set.extra(_veh, 2, 0)
		API.veh.set.extra(_veh, 7, 0)
	end
	API.veh.set.undriveable(_veh, true) -- fuck their vehicle in general
	API.veh.set.doors_locked(_veh, 4) -- fuck their doorlocks
	API.veh.set.engine_on(_veh,false,true,true) -- fuck there engine. only makes a difference in certain vehicles/situations
	API.veh.set.engine_health(_veh, -4000) -- yeah fuck their engine
	if API.ent.is.in_air(_veh) then
		API.veh.set.out_of_control(_veh, false, true) -- they are fucked if they crash and kicked out
		API.ent.set.rotation(_veh,v3(270,API.ent.get.rotation(_veh).y,API.ent.get.rotation(_veh).z))
		API.ent.set.velocity(_veh,v3(0,0,-200)) -- i hope they crash
		API.ent.force(_veh, 1, mth.rndm(100,125), mth.rndm(100,125), -200, 0, 0, 0, false, true) -- i really hope they crash
	else
		API.veh.set.out_of_control(_veh, false, true)
		API.ent.set.rotation(_veh,v3(API.ent.get.rotation(_veh).x,API.ent.get.rotation(_veh).y,mth.rndm(1,360)))
		API.veh.set.forward_speed(_veh,150)
		API.ent.force(_veh, 1, mth.rndm(50,75), mth.rndm(50,75), -50, 0, 0, 0, false, true)
	end
end

--------------------------Vehicle Speed thanks to keks
---------------------------------------
function funcs.doo.veh_speed(_veh, _time, _name, _model, _bool, _val)
	_name = _name or tostring("Vehicle")
	_model = _model or tostring(" ")
	_bool = _bool or false
	local success=false
	local velocity=false
	local max_speed = 45000
	if _val < 1 then
		max_speed=_val*125
	end
	local time = API.util.t_ms() + _time
	if funcs.is.veh(_veh) then
		local speed = API.ent.get.velocity(_veh)
		while API.util.t_ms() < time and funcs.is.veh(_veh) and not velocity do
			system.yield(0)
			if not network.has_control_of_entity(_veh) then
				network.request_control_of_entity(_veh)
			else
				if not success then
					API.ent.set.max_speed(_veh, max_speed)
					API.veh.set.top_speed(_veh, (_val - 1) * 100)
					success=true
				end
				if success and not velocity then
					API.ent.set.velocity(_veh,speed)
					velocity=true
				end
			end
		end
	end
	if velocity then
		if _bool then
			if _val == -10 then
				funcs.N_P(2,_name .. " - " .. _model .. " \nVehicle changed to reverse :)",funcs.ver_text,4,"Green")
			else
				funcs.N_P(2,_name .. " - " .. _model .. " \nSpeed/torque changed :)",funcs.ver_text,4,"Green")
			end
		end
		return true
	elseif _val == -10 then
		funcs.N_P(2,_name .. " - " .. _model .. "\nFAILED to reverse speed :(",funcs.ver_text,4,"Red")
	else
		funcs.N_P(2,_name .. " - " .. _model .. "\nFAILED to change speed/torque :(",funcs.ver_text,4,"Red")
	end
end

function funcs.doo.veh_freeze(_veh, _time, _name, _model, _freeze, _bool)
	_name = _name or tostring("Vehicle")
	_model = _model or tostring(" ")
	_bool = _bool or false
	local success=false
	local str = "un-freeze"
	local max_speed = 45000
	if _freeze then
		max_speed = 0
		str = "freeze"
	end
	local time = API.util.t_ms() + _time
	if funcs.is.veh(_veh) then
		while API.util.t_ms() < time and funcs.is.veh(_veh) and not success do
			system.yield(0)
			if not network.has_control_of_entity(_veh) then
				network.request_control_of_entity(_veh)
			else
				API.ent.set.max_speed(_veh, max_speed)
				success=true
			end
		end
	end
	if success then
		if _bool then
			funcs.N_P(2,_name .. " - " .. _model .. "\nVehicle "..str.." successful :)",funcs.ver_text,4,"Green")
		end
		return true
	else
		funcs.N_P(2,_name .. " - " .. _model .. "\nFailed to "..str.." :(",funcs.ver_text,4,"Red")
	end
end

--------------------------Vehicle upgrades thanks to keks
---------------------------------------

function funcs.doo.veh_upgr_basic(_veh)
	local toggle_vehicle_mods = {unk1 = 17,unk2 = 19, unk3 = 21,turbo = 18, tire_smoke = 20, xenon_lights = 22}
	for i = 0, 65 do
		if API.veh.get.num_mods(_veh, i) > 0 and not (i == 48) and not (i == 23) and not (i == 24) and not (i == 62) then
			API.veh.set.mod(_veh, i, mth.rndm(0, API.veh.get.num_mods(_veh, i) - 1))
		end
	end
	funcs.doo.veh_armor_best(_veh)
	for _, mod in pairs(toggle_vehicle_mods) do
		API.veh.set.tog_mod(_veh, mod, true)
	end
	if not API.strm.is.valid_helo(API.ent.get.model_hash(_veh)) then -- Prevent removal of helo rotors
		for i = 1, 9 do
			if API.veh.is.extra(_veh, i) then
				API.veh.set.extra(_veh, i, mth.rndm(0, 1) == 1)
			end
		end
	end
end

function funcs.doo.veh_upgr_perf(_veh)
	local performance_mods = {engine = 11,brakes = 12,transmission = 13,suspension = 15,armor = 16}
	for _, mod in pairs(performance_mods) do
		API.veh.set.mod(_veh, mod, API.veh.get.num_mods(_veh, mod) - 1)
	end
	API.veh.set.tog_mod(_veh, 18, true)--turbo
end

function funcs.doo.veh_upgr_wheels(_veh,_f1)	
	local class,wheel = API.veh.get.class(_veh)
	if class == 8 then
		if mth.rndm(1,7) == 1 then
			API.veh.set.wheel_type(_veh, 6) -- chrome
		else
			API.veh.set.wheel_type(_veh, -1)
		end
	elseif _f1=="f1" then
		API.veh.set.wheel_type(_veh, 10)
	else
		API.veh.set.wheel_type(_veh, mth.rndm(0, 12))
	end
	wheel = mth.rndm(0, API.veh.get.num_mods(_veh, 23) - 1)
	API.veh.set.wheel_color_custom(_veh, mth.rndm(10^8, 10^10))
	API.veh.set.tire_smoke_color(_veh, mth.rndm(0, 255), mth.rndm(0, 255), mth.rndm(0, 255))
	if API.veh.get.num_mods(_veh, 23) > 0 then
		API.veh.set.mod(_veh, 23, wheel,true)
	end
	if API.veh.get.num_mods(_veh, 24) > 0 then
		API.veh.set.mod(_veh, 24, wheel,true)
	end
	if class ~= 8 and API.veh.get.num_mods(_veh, 62) > 0 then
		API.veh.set.mod(_veh, 62, mth.rndm(0, API.veh.get.num_mods(_veh, 62) - 1),true)
		--set_vehicle_mod(Vehicle vehicle, 62, int modIndex, bool customTires)
	end
	funcs.doo.veh_tire_pop_guts(_veh,false)
end

function funcs.doo.veh_upgr_lights(_veh,_color)
	_color = _color or "random"
	API.veh.set.fullbeam(_veh, true)
	API.veh.set.tog_mod(_veh, 22, true) -- xenon enabled. Not sure if needed but i think so
	if _color == "random" then
		local good_color,headlight_color=false
		repeat
			headlight_color = mth.rndm(0,12)
			if headlight_color ~= headlight_color_prev then
				headlight_color_prev=headlight_color
				good_color=true
			end
		until good_color
	else
		headlight_color_prev=_color
	end
	API.veh.set.headlight_color(_veh,headlight_color_prev)
end

function funcs.doo.veh_upgr_neons(_veh,_neon)
	_neon = _neon or "random"
	for i=0,5 do
		API.veh.set.neon_on(_veh, i-1, true)
	end
	if _neon == "random" then
		local good_neon_color=false
		local neon_light_color,neon_color_rand
		repeat
			neon_color_rand = mth.rndm(1,13)
			neon_light_color =	veh_stuff.neon_ints[neon_color_rand]
			if neon_light_color ~= neon_light_color_prev then
				neon_light_color_prev=neon_light_color
				good_color=true
			end
		until good_color
	else
		neon_light_color_prev = _neon
	end
	API.veh.set.neon_color(_veh, neon_light_color_prev)
end

function funcs.doo.veh_upgr_paint(_veh,_paint)
	local color,color2,rand
	_paint = _paint or "random"
	if _paint == "random" then
		rand=mth.rndm(1,#veh_stuff.paint_ints+5)
		if rand > #veh_stuff.paint_ints then
			color = mth.rndm(10^8, 10^10)
		else
			color = veh_stuff.paint_ints[rand]
		end
		API.veh.set.primary_color_custom(_veh, color)
		rand=mth.rndm(1,#veh_stuff.paint_ints+5)
		if rand > #veh_stuff.paint_ints then
			color = mth.rndm(10^8, 10^10)
		else
			color = veh_stuff.paint_ints[rand]
		end
		API.veh.set.secondary_color_custom(_veh, color)
		API.veh.set.pearl_color_custom(_veh, mth.rndm(0, mth.rndm(10^8, 10^10)))
		rand=mth.rndm(1,#veh_stuff.paint_ints+5)
		if rand > #veh_stuff.paint_ints then
			color = mth.rndm(10^8, 10^10)
		else
			color = veh_stuff.paint_ints[rand]
		end
		rand=mth.rndm(1,#veh_stuff.paint_ints+5)
		if rand > #veh_stuff.paint_ints then
			color2 = mth.rndm(10^8, 10^10)
		else
			color2 = veh_stuff.paint_ints[rand]
		end
		API.veh.set.extra_colors(_veh, color, color2)
	elseif _paint == "random_solid" then
		rand=mth.rndm(1,#veh_stuff.paint_ints+5)
		if rand > #veh_stuff.paint_ints then
			color = mth.rndm(10^8, 10^10)
		else
			color = veh_stuff.paint_ints[rand]
		end
		API.veh.set.primary_color_custom(_veh, color)
		API.veh.set.secondary_color_custom(_veh, color)
		API.veh.set.pearl_color_custom(_veh, color)
		API.veh.set.extra_colors(_veh, color, color)
	else
		color = _paint
		API.veh.set.primary_color_custom(_veh, color)
		API.veh.set.secondary_color_custom(_veh, color)
		API.veh.set.pearl_color_custom(_veh, color)
		API.veh.set.extra_colors(_veh, color, color)
	end
		
	--API.veh.set.pearl_color_custom(_veh, mth.rndm(0, mth.rndm(10^8, 10^10)))
end

function funcs.doo.veh_upgr_livery(_veh)
	if API.veh.get.num_mods(_veh, 48) > 0 then
		API.veh.set.mod(_veh, 48, mth.rndm(1, API.veh.get.num_mods(_veh, 48) - 1))
	end
end

function funcs.doo.veh_upgr_bombs(_veh)
	if veh_stuff.has_bombs[API.ent.get.model_hash(_veh)] then --cluster
		API.veh.set.mod(_veh, 9, 3)
	end
end

function funcs.doo.veh_upgr_cntrmsrs(_veh)
	if veh_stuff.has_cntrmsrs[API.ent.get.model_hash(_veh)] then -- chaff
		if funcs.is.this_veh(_veh,"oppressor2") then
			API.veh.set.mod(_veh, 6, 0)
		else
			API.veh.set.mod(_veh, 1, 0)
		end
	end
end

function funcs.doo.veh_weap_best(_veh)
	if funcs.is.veh(_veh) then
		if funcs.is.this_veh(_veh,"speedo4") or funcs.is.this_veh(_veh,"apc") then
			API.veh.set.mod(_veh, 10, 2)
		else
			if API.veh.get.num_mods(_veh, 10) == 1 then
				API.veh.set.mod(_veh, 10, 0)
			else
				API.veh.set.mod(_veh, 10, 1)
			end
		end
		if funcs.is.this_veh(_veh,"khanjali") then
			API.veh.set.mod(_veh, 5, API.veh.get.num_mods(_veh, 5) - 1)
		end
		API.veh.set.mod(_veh, 45, API.veh.get.num_mods(_veh, 45) - 1)
		if funcs.is.this_veh(_veh,"tampa3") then
			API.veh.set.mod(_veh, 1, API.veh.get.num_mods(_veh, 1) - 1)
			API.veh.set.mod(_veh, 2, API.veh.get.num_mods(_veh, 2) - 1)
		end
		API.veh.set.mod(_veh, 9, API.veh.get.num_mods(_veh, 9) - 1)
	end
end

function funcs.doo.veh_weap_worst(_veh)
	if funcs.is.veh(_veh) then
		if API.veh.get.num_mods(_veh, 10) == 1 then
			API.veh.set.mod(_veh, 10, 1)
		elseif API.veh.get.num_mods(_veh, 10) == 2 then
			API.veh.set.mod(_veh, 10, 2)
		else
			API.veh.set.mod(_veh, 10, 0)
		end
		if funcs.is.this_veh(_veh,"khanjali") then
			API.veh.set.mod(_veh, 5, -1)
		end
		API.veh.set.mod(_veh, 45, -1)
		if funcs.is.this_veh(_veh,"tampa3") then
			API.veh.set.mod(_veh, 1, -1)
			API.veh.set.mod(_veh, 2, -1)
			
		end
		API.veh.set.mod(_veh, 9, -1)
	end
end

--mk1 10,0 homing--mk1 10,1 machine guns
--mk2 10,0 Explosive mg--mk2 10,1 homing--mk2 10,2 machine guns
--avenger 10,0 front--avenger 10,1 all--avenger 10,2 none
--deluxo 10,0 all weap--deluxo 10,1 no weap
--tampa 10,0 double gun on top--tampa 10,1 fixed gun--tampa 1, -1 removes missile--tampa 2, -1 removes mortar
--sparrow 10,0 machine guns--sparrow 10,1 homing--sparrow 10,2 no weap
--only machine gun vehicles 45,-1 no weap
--vehicles with mines 9,-1 removes mine
--khanjali 5, -1 removes grenades
--tampa 1, -1 removes missile--tampa 2, -1 removes mortar

function funcs.doo.veh_armor_best(_veh)
	if funcs.is.veh(_veh) then
		API.veh.set.mod(_veh, 16, API.veh.get.num_mods(_veh, 16) - 1)
		if not funcs.is.this_veh(_veh,"rhino") and not funcs.is.this_veh(_veh,"khanjali") then 
			API.veh.set.mod(_veh, 5, API.veh.get.num_mods(_veh, 5) - 1)
		end
		if funcs.is.this_veh(_veh,"tampa3") then
			API.veh.set.mod(_veh, 7, API.veh.get.num_mods(_veh, 7) - 1)
		end
	end
end

function funcs.doo.veh_armor_worst(_veh)
	if funcs.is.veh(_veh) then
		API.veh.set.mod(_veh, 16, -1)
		if not funcs.is.this_veh(_veh,"rhino") and not  funcs.is.this_veh(_veh,"khanjali") then
			API.veh.set.mod(_veh, 5, -1)
		end
		if funcs.is.this_veh(_veh,"tampa3") then
			API.veh.set.mod(_veh, 7,  -1)
		end
	end
end
--tampa 5, -1 removes plating
--tampa 7, -1 removes hood plate




function funcs.doo.veh_tp_into_hijack(_veh,_bool)
	_bool = _bool or true
	if funcs.is.veh(_veh) then
		local time = API.util.t_ms() + 500
		if _bool and funcs.is.ent(API.veh.get.ped_in_seat(_veh, -1)) and API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, -1)) and API.veh.get.ped_in_seat(_veh, -1) ~= funcs.ME._ped() then
			time = API.util.t_ms() + 1500
			glbls.kick_from_veh(API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(_veh, -1)))
		end
		while funcs.is.ent(API.veh.get.ped_in_seat(_veh, -1)) and API.veh.get.ped_in_seat(_veh, -1) ~= funcs.ME._ped() and API.util.t_ms() < time do
			API.Ped.clear_tasks(API.veh.get.ped_in_seat(_veh, -1))
			system.yield(0)
		end
		if not funcs.is.ent(API.veh.get.ped_in_seat(_veh, -1)) then
			time = API.util.t_ms() + 100
			while time > API.util.t_ms() and API.veh.get.ped_in_seat(_veh, -1) ~= funcs.ME._ped() do
				API.Ped.set.into_veh(funcs.ME._ped(),_veh,-1)	
				system.yield(10)
			end
		end
		return API.veh.get.ped_in_seat(_veh, -1) == funcs.ME._ped()
	end
	return false
end

function funcs.doo.veh_tp_into_that_seat(_veh,_seat)
	local function should_kick_out()
		return (funcs.is.veh(_veh) and funcs.is.ent(API.veh.get.ped_in_seat(_veh, _seat)) and API.veh.get.ped_in_seat(_veh, _seat) ~= funcs.ME._ped())
	end
	local time = API.util.t_ms() + 1000
	if should_kick_out() and API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, _seat)) then
		time = time + 1000
		glbls.kick_from_veh(API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(_veh, _seat)))
		system.yield(500)
	end
	if should_kick_out() then	
		API.Ped.clear_tasks(API.veh.get.ped_in_seat(_veh, _seat))
	end
	while should_kick_out() and API.util.t_ms() < time do
		system.yield(0)
	end
	if funcs.is.veh(_veh) and not funcs.is.ent(API.veh.get.ped_in_seat(_veh, _seat)) then
		time = API.util.t_ms() + 100
		while funcs.is.veh(_veh) and API.veh.get.ped_in_seat(_veh, _seat) ~= funcs.ME._ped() and time > API.util.t_ms() do
			API.Ped.set.into_veh(funcs.ME._ped(),_veh,_seat)	
			system.yield(10)
		end
	end
	return (funcs.is.veh(_veh) and API.veh.get.ped_in_seat(_veh, _seat) == funcs.ME._ped())
end

function funcs.doo.veh_tp_into_free_seat(_veh)
	if funcs.is.veh(_veh) then
		for i = 1,funcs.get.veh_seats(_veh) do
			if not API.ent.is.ped(API.veh.get.ped_in_seat(_veh, i-2)) then
				local time = API.util.t_ms() + 100
				while time > API.util.t_ms() and API.veh.get.ped_in_seat(_veh, i-2) ~= funcs.ME._ped() do
					API.Ped.set.into_veh(funcs.ME._ped(),_veh,i-2)	
					system.yield(10)
				end
				if API.veh.get.ped_in_seat(_veh, i-2) == funcs.ME._ped() then
					break
				end
			elseif funcs.doo.remove_dead_ped_from_seat(_veh,i-2) then
				local time = API.util.t_ms() + 100
				while time > API.util.t_ms() and API.veh.get.ped_in_seat(_veh, i-2) ~= funcs.ME._ped() do
					API.Ped.set.into_veh(funcs.ME._ped(),_veh,i-2)	
					system.yield(10)
				end
				if API.veh.get.ped_in_seat(_veh, i-2) == funcs.ME._ped() then
					break
				end
			end
		end
		system.yield(100)
		if funcs.ME._in_that_veh(_veh) then
			return true
		end
	end
	return false
end

function funcs.doo.veh_tp_in_or_out(_action,_speed,_key,_delay)
	if funcs.is.vk_key_down(_key) and funcs.is.key_active(114,0) then ---no right click to prevent geewatch board intererence
		local long_enough=false
		local time = API.util.t_ms() + _delay
		while funcs.is.vk_key_down(_key) and funcs.is.key_active(114,0) and not long_enough do
			system.yield(0)
			if time < API.util.t_ms() then
				long_enough=true
			end
		end
		if long_enough then
			if not funcs.ME._in_veh() then
				local all_veh=API.veh.get.all()
				funcs.sort.ent_pos_v3(all_veh,API.plyr.get.coords(API.plyr.my_id()))
				if _action == 0 then
					funcs.doo.veh_tp_into_free_seat(all_veh[1])
				elseif _action == 1 then
					funcs.doo.veh_tp_into_hijack(all_veh[1],true)
				elseif _action == 2 then
					if not funcs.doo.veh_tp_into_free_seat(all_veh[1]) then
						funcs.doo.veh_tp_into_hijack(all_veh[1],true)
					end
				end
			else
				local me=API.plyr.my_id()
				local speed=API.ent.get.velocity(API.plyr.get.veh(me))
				local heading = API.plyr.get.heading(me)
				local height = 0.69 -- nice
				if API.veh.get.class(API.plyr.get.veh(me)) == 15 then
					height = -0.45
				end
				if funcs.ME._in_seat(API.plyr.get.veh(me),-1) or funcs.ME._in_seat(API.plyr.get.veh(me),1) or funcs.ME._in_seat(API.plyr.get.veh(me),3) then
					heading = heading - 90
				else
					heading = heading + 90
				end
				API.ent.set.coords(API.plyr.get.ped(me), funcs.get.front_of_pos(API.ent.get.coords(API.plyr.get.veh(me)),heading,1.35,1,height)) -- TPs you beside the vehicle
				system.yield(50)
				if _speed == 1 then
					API.ent.set.velocity(API.plyr.get.ped(me), speed*0.69) --nice    50% doesnt seem like 50%
				elseif _speed == 2 then
					API.ent.set.velocity(API.plyr.get.ped(me), speed)
				end
			end
			funcs.is.vk_key_down_with_delay(_key)
		end
	end
end

function funcs.get.closest_vehs(_pos)
	_pos = _pos or API.plyr.get.coords(API.plyr.my_id())
	local all_veh=API.veh.get.all()
	funcs.sort.ent_pos_v3(all_veh,_pos)
	return all_veh
end

function funcs.get.closest_veh_seat(_pos,_dist,_type)
	local vehs = funcs.get.closest_vehs(_pos)
	for i=1,#vehs do
		if funcs.get.dist_pospos_v3(_pos,API.ent.get.coords(vehs[i])) > _dist then
			break
		else
			if _type == "free" then
				for ii = 1,funcs.get.veh_seats(vehs[i]) do
					if ntv.is.veh_seat_free(vehs[i], ii-2) then
						return vehs[i],ii-2,1
					end
				end
			else
				if ntv.is.veh_seat_free(vehs[i],-1) then
					return vehs[i],-1,1
				end
				return vehs[i],-1,8
			end
		end
	end
	return nil,nil
end

function funcs.get.pid_veh_intrr_check(_table,_pid,_name,_my_pos,_plyr_pos)
	local intrr_count,no_veh = 0,0
	local continue = true
	if intrr.is_pid_intrr(_pid) then
		continue = false
		if #_table==1 then
			funcs.N_P(2,_name.."\nIn interior.",funcs.ver_text,4,"Yellow")
		end
		intrr_count=intrr_count+1
	elseif funcs.get.dist_pospos_v3(_my_pos,_plyr_pos) < 250 and not API.plyr.is.in_veh(_pid) then
		continue = false
		if #_table==1 then
			funcs.N_P(2,_name.."\nNot in a vehicle.",funcs.ver_text,4,"Yellow")
		end
		no_veh=no_veh+1
	elseif _plyr_pos.z < -75 then
		continue = false
		if #_table==1 then
			funcs.N_P(2,_name.."\nProbably in interior.",funcs.ver_text,4,"Blue")
		end
		intrr_count=intrr_count+1
	end
	return intrr_count,no_veh,continue
end

function funcs.get.rand_pid_table()
	local rand_pid
	local pid_table = {}
	repeat
		rand_pid = mth.rndm(0,31)
		if not funcs.is.table_has(pid_table,rand_pid) then
			pid_table[#pid_table+1]=rand_pid
		end
	until #pid_table == 32
	return pid_table
end

function funcs.doo.tp_forward(_pos,_heading)
	local dist = 20.69
	local pos_front = funcs.get.front_of_pos(_pos, _heading, dist, 180, 0)
	local new_pos_front =funcs.get.pos_nearby(pos_front,"single_closest",100,"water")
	local found = false
	if funcs.get.dist_pospos_v2(pos_front,new_pos_front) < dist*.69 then
		found=true
	else
		for i=1,7 do
			dist = dist*1.469
			pos_front = funcs.get.front_of_pos(_pos, _heading, dist, 180, 0)
			new_pos_front =funcs.get.pos_nearby(pos_front,"single_closest",100,"water")
			if funcs.get.dist_pospos_v2(pos_front,new_pos_front) < dist*.69 then --nice
				found=true
				break
			end
		end
	end
	return found, new_pos_front
end



------------------Pre-Plotted waypoints
---------------------------------------

-- function funcs.get.WP_coords2(_where)
	-- local waypoint = nil
	-- if ui.get_waypoint_coord().x < 16000 then
		-- local wp = v2(ui.get_waypoint_coord().x,ui.get_waypoint_coord().y)
		-- local wp_table = {}
		-- local dist=250
		-- repeat
			-- if _where == "anywhere" then
				-- for i=1,#tp_pos.water do
					-- if funcs.is.num_in_range(tp_pos.water[i].y,wp.y-dist,wp.y+dist) and funcs.is.num_in_range(tp_pos.water[i].x,wp.x-dist,wp.x+dist) then
						-- wp_table[#wp_table+1]=tp_pos.water[i]
					-- end
				-- end
			-- end
			-- if funcs.is.v2_in_range(funcs.ME._crds(),1700,15000,-15000,-3600) then --if im in the cayo area 
				-- for i=1,#tp_pos.cayo do
					-- if funcs.is.num_in_range(tp_pos.cayo[i].y,wp.y-dist,wp.y+dist) and funcs.is.num_in_range(tp_pos.cayo[i].x,wp.x-dist,wp.x+dist) then
						-- wp_table[#wp_table+1]=tp_pos.cayo[i]
					-- end
				-- end
			-- end
			-- for i=1,#tp_pos.ne do
				-- if funcs.is.num_in_range(tp_pos.ne[i].y,wp.y-dist,wp.y+dist) and funcs.is.num_in_range(tp_pos.ne[i].x,wp.x-dist,wp.x+dist) then
					-- wp_table[#wp_table+1]=tp_pos.ne[i]
				-- end
			-- end	
			-- for i=1,#tp_pos.nw do
				-- if funcs.is.num_in_range(tp_pos.nw[i].y,wp.y-dist,wp.y+dist) and funcs.is.num_in_range(tp_pos.nw[i].x,wp.x-dist,wp.x+dist) then
					-- wp_table[#wp_table+1]=tp_pos.nw[i]
				-- end
			-- end		
			-- for i=1,#tp_pos.se do
				-- if funcs.is.num_in_range(tp_pos.se[i].y,wp.y-dist,wp.y+dist) and funcs.is.num_in_range(tp_pos.se[i].x,wp.x-dist,wp.x+dist) then
					-- wp_table[#wp_table+1]=tp_pos.se[i]
				-- end
			-- end
			-- for i=1,#tp_pos.sw do
				-- if funcs.is.num_in_range(tp_pos.sw[i].y,wp.y-dist,wp.y+dist) and funcs.is.num_in_range(tp_pos.sw[i].x,wp.x-dist,wp.x+dist) then
					-- wp_table[#wp_table+1]=tp_pos.sw[i]
				-- end
			-- end
			-- if #wp_table == 0 then
				-- dist=dist*1.5
			-- end
		-- until #wp_table > 5
		-- funcs.sort.pos_v2(wp_table,wp)
		-- waypoint = wp_table[1]
	-- end
	-- return waypoint
-- end


function funcs.get.pos_100_v2(_pos)

	return v2(funcs.get.round(_pos.x,-2),funcs.get.round(_pos.y,-2))
end



-- function funcs.get.ground_pos(_pos)
	-- funcs.doo.req_model(API.get_hash_key("a_f_m_fatcult_01"))
	-- local temp=API.Ped.create(6, API.get_hash_key("a_f_m_fatcult_01"),v3(_pos.x,_pos.y,850), 0, false, false)
	-- funcs.doo.id_migrate(temp,0)
	-- API.ent.freeze(temp,true)
	-- API.ent.set.collision(temp,false,false)
	-- system.yield(1000)
	-- local height = ntv.get.ent_height(temp)
	-- menu.notify(height)
	-- local z = ((height <= 850 and 851-height) or 1)
	-- funcs.doo.remove_ent(temp,250)
	-- return v3(_pos.x,_pos.y,z)
-- end

function funcs.get.WP_coords2(_where)
	local waypoint = nil
	if ui.get_waypoint_coord().x < 16000 then
		local wp = funcs.get.pos_100_v2(ui.get_waypoint_coord())
		local t1 = {}
		local t2 = {}
		local t3 = {}
		if funcs.is.v2_in_range(funcs.ME._crds(),1700,15000,-15000,-3600) then --if im in the cayo area 
			for k,v in pairs(tp_pos.cayo_land) do
				if k.x == wp.x and k.y == wp.y then
					t1=v
					break
				end
			end
		end
		if _where == "anywhere" then
			for k,v in pairs(tp_pos.land_water) do
				if k.x == wp.x and k.y == wp.y then
					t2=v
					break
				end
			end
		else
			for k,v in pairs(tp_pos.main_land) do
				if k.x == wp.x and k.y == wp.y then
					t2=v
					break
				end
			end
		end
		for k,v in pairs(t1) do
			t3[#t3+1]=v
		end
		for k,v in pairs(t2) do
			t3[#t3+1]=v
		end
		if #t3 > 0 then
			funcs.sort.pos_v2(t3,ui.get_waypoint_coord())
			waypoint = t3[1]
		else
			waypoint = v3(ui.get_waypoint_coord().x,ui.get_waypoint_coord().y,1)
		end
	end
	return waypoint
end

function funcs.get.pos_nearby(_pos,_type,_max,_water,_xyz)
	local me=API.plyr.my_id()
	local my_pos = API.plyr.get.coords(me)
	_max = _max or 31
	_water = _water or "no_water"
	_xyz = _xyz or "xy"
	local table_sort_type = funcs.sort.pos_v2
	if _xyz == "xyz" then
		table_sort_type = funcs.sort.pos_v3
	end
	local pos_table = {}
	local dist=25
	repeat
		if _water == "water" then
			for i=1,#tp_pos.water do
				if funcs.is.num_in_range(tp_pos.water[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.water[i].x,_pos.x-dist,_pos.x+dist) then
					pos_table[#pos_table+1]=tp_pos.water[i]
				end
			end
		end
		if funcs.is.v2_in_range(my_pos,1700,15000,-15000,-3600) then --if im in the cayo area 
			for i=1,#tp_pos.cayo do
				if funcs.is.num_in_range(tp_pos.cayo[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.cayo[i].x,_pos.x-dist,_pos.x+dist) then
					pos_table[#pos_table+1]=tp_pos.cayo[i]
				end
			end
		end
		for i=1,#tp_pos.ne do
			if funcs.is.num_in_range(tp_pos.ne[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.ne[i].x,_pos.x-dist,_pos.x+dist) then
				pos_table[#pos_table+1]=tp_pos.ne[i]
			end
		end	
		for i=1,#tp_pos.nw do
			if funcs.is.num_in_range(tp_pos.nw[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.nw[i].x,_pos.x-dist,_pos.x+dist) then
				pos_table[#pos_table+1]=tp_pos.nw[i]
			end
		end		
		for i=1,#tp_pos.se do
			if funcs.is.num_in_range(tp_pos.se[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.se[i].x,_pos.x-dist,_pos.x+dist) then
				pos_table[#pos_table+1]=tp_pos.se[i]
			end
		end
		for i=1,#tp_pos.sw do
			if funcs.is.num_in_range(tp_pos.sw[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.sw[i].x,_pos.x-dist,_pos.x+dist) then
				pos_table[#pos_table+1]=tp_pos.sw[i]
			end
		end
		dist=dist*1.5
	until #pos_table >= _max
	table_sort_type(pos_table,_pos)
	if _type == "single_random" then
		return pos_table[mth.rndm(1,_max)]
	elseif _type == "single_closest" then
		return pos_table[1]
	elseif _type == "single_50_dist" then
		for i=1,#pos_table do
			if funcs.get.dist_pospos_v2(pos_table[i],_pos) > 45 then
				return pos_table[i]
			end
		end
	end
end

function funcs.doo.build_tp_list()
	local Y = 6500
	local t={}
	repeat
		for X=-2750,2750,250 do
			t[#t+1]=v2(X,Y)
		end
		Y=Y-250
	until Y <= -3000
	return t
end

function funcs.get.node_nearby(_pos,_type,_max,_table)
	local pos_table = {}
	local temp_table={}
	local temp_true = {}
	local dist=100
	local function total(_v3)
		return (_v3.x+_v3.y+_v3.z)
	end
	repeat
		for i=1,#tp_pos.nodes do
			if not temp_true[total(tp_pos.nodes[i])] then
				if tp_pos.nodes[i].y > _pos.y-dist and tp_pos.nodes[i].y < _pos.y + dist then
					if tp_pos.nodes[i].x > _pos.x-dist and tp_pos.nodes[i].x < _pos.x + dist then
						temp_true[total(tp_pos.nodes[i])]=true
						pos_table[#pos_table+1]=tp_pos.nodes[i]
					end
				end
			end
		end
		dist=dist*1.5
	until #pos_table >= _max
	-- repeat
		-- if _pos.y >= 0 then
			-- if _pos.x >= 0 then
				-- for i=1,#tp_pos.nodes_ne do
					-- if not temp_true[total(tp_pos.nodes_ne[i])] then
						-- if funcs.is.num_in_range(tp_pos.nodes_ne[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.nodes_ne[i].x,_pos.x-dist,_pos.x+dist) then
							-- temp_true[total(tp_pos.nodes_ne[i])]=true
							-- pos_table[#pos_table+1]=tp_pos.nodes_ne[i]
						-- end
					-- end
				-- end	
			-- else
				-- for i=1,#tp_pos.nodes_nw do
					-- if not temp_true[total(tp_pos.nodes_nw[i])] then
						-- if funcs.is.num_in_range(tp_pos.nodes_nw[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.nodes_nw[i].x,_pos.x-dist,_pos.x+dist) then
							-- temp_true[total(tp_pos.nodes_nw[i])]=true
							-- pos_table[#pos_table+1]=tp_pos.nodes_nw[i]
						-- end
					-- end
				-- end	
			-- end	
		-- else
			-- if _pos.x >= 0 then
				-- for i=1,#tp_pos.nodes_se do
					-- if not temp_true[total(tp_pos.nodes_se[i])] then
						-- if funcs.is.num_in_range(tp_pos.nodes_se[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.nodes_se[i].x,_pos.x-dist,_pos.x+dist) then
							-- temp_true[total(tp_pos.nodes_se[i])]=true
							-- pos_table[#pos_table+1]=tp_pos.nodes_se[i]
						-- end
					-- end
				-- end
			-- else
				-- for i=1,#tp_pos.nodes_sw do
					-- if not temp_true[total(tp_pos.nodes_sw[i])] then
						-- if funcs.is.num_in_range(tp_pos.nodes_sw[i].y,_pos.y-dist,_pos.y+dist) and funcs.is.num_in_range(tp_pos.nodes_sw[i].x,_pos.x-dist,_pos.x+dist) then
							-- temp_true[total(tp_pos.nodes_sw[i])]=true
							-- pos_table[#pos_table+1]=tp_pos.nodes_sw[i]
						-- end
					-- end
				-- end
			-- end
		-- end
		-- dist=dist*1.5
	-- until #pos_table >= 50
	if _type == "single_random" then
		return pos_table[mth.rndm(1,#pos_table)]
	end
	funcs.sort.pos_v2(pos_table,_pos)
	if _table then
		return  pos_table
	elseif _type == "single_closest" then
		return pos_table[1]
	elseif _type == "single_50_dist" then
		for i=1,#pos_table do
			if funcs.get.dist_pospos_v2(pos_table[i],_pos) > 45 then
				return pos_table[i]
			end
		end
	end
	return pos_table[#pos_table]
end

function funcs.get.random_pos(_type,_table,_max)
	local tbl={}
	_max = _max or 31
	if _table then
		for i=1, _max do
			if _type == "water" or _type == "anywhere" then
				tbl[#tbl+1]=tp_pos.water[mth.rndm(1,#tp_pos.water)]
			end
			if _type == "land" or _type == "anywhere" then
				tbl[#tbl+1]=tp_pos.ne[mth.rndm(1,#tp_pos.ne)]
				tbl[#tbl+1]=tp_pos.nw[mth.rndm(1,#tp_pos.nw)]
				tbl[#tbl+1]=tp_pos.se[mth.rndm(1,#tp_pos.se)]
				tbl[#tbl+1]=tp_pos.sw[mth.rndm(1,#tp_pos.sw)]
			end
		end
		return tbl
	end
	local rand = 5
	if _type == "land" then
		rand=mth.rndm(1,4)
	elseif _type == "anywhere" then
		rand=mth.rndm(1,5)
	end
	if rand == 1 then
		rand = tp_pos.ne[mth.rndm(1,#tp_pos.ne)]
	elseif rand == 2 then
		rand = tp_pos.nw[mth.rndm(1,#tp_pos.nw)]
	elseif rand == 3 then
		rand = tp_pos.se[mth.rndm(1,#tp_pos.se)]
	elseif rand == 4 then
		rand = tp_pos.sw[mth.rndm(1,#tp_pos.sw)]
	else
		rand = tp_pos.water[mth.rndm(1,#tp_pos.water)]
	end
	return rand
end

-------------------------Basic teleport
---------------------------------------
function funcs.doo.tp_ent(_ent,_pos, _z ,_bool)
	_z = _z or 0
	_pos.z=_pos.z+_z
	_bool = _bool or false
	if funcs.ntwrk.ask_long(_ent,1500) then
		local speed = v3(0,0,0)
		if _bool then
			speed = API.ent.get.velocity(_ent)
		end
		API.ent.set.coords(_ent,_pos)
		system.yield(20)
		funcs.ntwrk.ask_long(_ent,100)
		API.ent.set.velocity(_ent,speed)
		return true
	end
	return false
end

function funcs.get.spawn_front_dist(_pid,_veh)
	local front = 3.5
	if API.plyr.is.in_veh(_pid) then
		local _min,_max = API.ent.get.dimensions(API.plyr.get.veh(_pid))
		if _min ~= nil and _max ~= nil then
			front = front + (_max.y+mth.abs(_min.y))/2
		else
			front = front + 2
		end
	end
	if funcs.is.veh(_veh) then
		local _min,_max = API.ent.get.dimensions(_veh)
		if _min ~= nil and _max ~= nil then
			front = front + (_max.y+mth.abs(_min.y))/2
		else
			front = front + 2
		end
	end
	return front
end

function funcs.doo.tp_veh_to_me(_veh)
	if funcs.ntwrk.ask_long(_veh,1500) then
		local front = funcs.get.spawn_front_dist(API.plyr.my_id(),_veh)
		API.ent.set.coords(_veh,funcs.get.front_of_pos(API.plyr.get.coords(API.plyr.my_id()), API.plyr.get.heading(API.plyr.my_id()), front, 180, 1))
		API.ent.set.heading(_veh, API.plyr.get.heading(API.plyr.my_id()))
		API.veh.set.on_ground(_veh)
		API.ent.set.coords(_veh,funcs.get.front_of_pos(API.plyr.get.coords(API.plyr.my_id()), API.plyr.get.heading(API.plyr.my_id()), front, 180, 1))
		system.yield(100)
		if funcs.get.dist_me_ent_3d(_veh) < 25 then
			return true
		end
	end
end

function funcs.doo.tp_plyr_veh(_pid,_pos, _z,_loc,_speed,_veh_notif)
	_z = _z or 0
	_veh_notif = _veh_notif or false
	_pos.z = _pos.z+_z
	_loc = _loc or "Location."
	_speed = _speed or false
	local speed = v3(0,0,0)
	if API.plyr.is.in_veh(_pid) then
		if funcs.ntwrk.ask_long(API.plyr.get.veh(_pid),2500) then
			if _speed then
				speed = API.ent.get.velocity(API.plyr.get.veh(_pid))
			end
			API.ent.set.coords(API.plyr.get.veh(_pid),_pos)
			API.ent.set.velocity(API.plyr.get.veh(_pid),speed)
			funcs.N_P(2,funcs.get.pid_name(_pid) .. " - " .. funcs.get.veh_model_name(API.plyr.get.veh(_pid)) .. "\nTeleported - " .. _loc,funcs.ver_text,4,"Green")
			return true
		else
			funcs.N_P(2,funcs.get.pid_name(_pid) .. " - " .. funcs.get.veh_model_name(API.plyr.get.veh(_pid)) .. "\nFAILED to teleport - " .. _loc,funcs.ver_text,4,"Red")
		end
	elseif _veh_notif then
		funcs.N_P(2,funcs.get.pid_name(_pid) .. " - Not in a vehicle.",funcs.ver_text,4,"Yellow")
	end
end


----------------------Personal/Last Veh
---------------------------------------
function funcs.doo.tp_pers_veh(_action)
	local veh = API.plyr.pers_veh()
	local mee = API.plyr.get.ped(API.plyr.my_id())
	local my_veh = API.Ped.get.veh(mee)
	local function kick_driver(_veh)
		if funcs.is.ent(API.veh.get.ped_in_seat(_veh, -1)) then
			if API.Ped.is.plyr(API.veh.get.ped_in_seat(_veh, -1)) then
				glbls.kick_from_veh(API.plyr.get.plyr_from_ped(API.veh.get.ped_in_seat(_veh, -1)))
			end
			API.Ped.clear_tasks(API.veh.get.ped_in_seat(_veh, -1))
		end
		local time = API.util.t_ms() + 250
		while funcs.is.ent(API.veh.get.ped_in_seat(_veh, -1)) and API.util.t_ms() < time do
			system.yield(0)
		end
	end
	if veh ~= 0 and veh ~= my_veh and funcs.is.veh(veh) then
		funcs.doo.veh_flip(veh,"flip_right",250)
		if _action == "self_2_veh" then
			local pos = API.ent.get.coords(veh)
			pos.z = pos.z + 3
			API.ent.set.coords(mee, pos)
		elseif _action == "self_2_veh_drive" then
			kick_driver(veh)
			if not funcs.doo.veh_tp_into_free_seat(veh) then
				if not funcs.doo.veh_tp_into_hijack(veh) then
					funcs.N_P(2,"No free seat. Failed to hijack. :(",funcs.ver_text,4,"Red")
				else
					return true
				end
			else
				return true
			end
		elseif _action == "veh_2_me" then
			kick_driver(veh)
			if not funcs.doo.tp_veh_to_me(veh) then
				funcs.N_P(2,"Could not teleport vehicle :(",funcs.ver_text,4,"Red")
			end
		elseif _action == "veh_2_me_drive" then
			kick_driver(veh)
			if funcs.doo.tp_veh_to_me(veh) then
				if not funcs.doo.veh_tp_into_free_seat(veh) then
					if not funcs.doo.veh_tp_into_hijack(veh) then
						funcs.N_P(2,"No free seat. Failed to hijack. :(",funcs.ver_text,4,"Red")
					end
				end
			else
				funcs.N_P(2,"Could not teleport vehicle :(",funcs.ver_text,4,"Red")
			end
		end
	elseif veh == my_veh and funcs.ME._in_veh() then
		funcs.N_P(2,"You're already in your personal vehicle...",funcs.ver_text,4,"Blue")
	else
		funcs.N_P(2,"No personal vehicle found...",funcs.ver_text,4,"Blue")
	end
end


return funcs