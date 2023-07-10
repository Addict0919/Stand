
local funcs = {}
local API = require("GeeMap_v2/lua_library/API List")

funcs.ver_text = "Gee-Map 2.0"



funcs.is={}

function funcs.is.veh_valid(_veh)
	return (funcs.is.ent_valid(_veh) and API.ent.is_a_veh(_veh) and API.strm.is_valid(API.ent.get_model_hash(_veh)))
end

function funcs.is.a_num(_num)
    return (_num ~= nil and tonumber(_num) ~= nil)
end

function funcs.is.ent_valid(_ent)
	return (funcs.is.a_num(_ent) and API.ent.is_a_ent(_ent))
end

function funcs.is.xy_in_range(_pos,x_min,x_max,y_min,y_max)
	return (funcs.is.num_in_range(_pos.x,x_min,x_max) and funcs.is.num_in_range(_pos.y,y_min,y_max))
end

function funcs.is.num_in_range(_num,_min,_max)
	return (_num >= _min and _num <= _max)
end

function funcs.is.vk_down(_key_name)
	local vk_key = MenuKey()
	vk_key:push_str(_key_name)
    return vk_key:is_down_stepped()
end

function funcs.is.valid_pid(_pid)
	if funcs.is.a_num(_pid) and API.plyr.is_valid(_pid) then
		return true
	end
	return false
end



funcs.get={}

function funcs.get.front_of_pos(pos, heading, distance, _head, _z)
	--_head of 180 is in front, 0 is behind
    heading = API.mth.rad((heading - _head) * -1)
    pos.x = pos.x + (API.mth.sin(heading) * -distance)
    pos.y = pos.y + (API.mth.cos(heading) * -distance)
	pos.z = pos.z + _z
    return pos
end

function funcs.get.opp_bool(_bool)
	return (not _bool)
end

function funcs.get.veh_class_name(_veh)
	if funcs.is.veh_valid(_veh) then
		return (API.veh.get_class_name(_veh) or "")
	end
	return ""
end

function funcs.get.veh_model_name(_veh) --sometimes model name returns nil
	if funcs.is.veh_valid(_veh) then
		return (API.veh.get_model(_veh) or "")
	end
	return ""
end

function funcs.get.RGBATOINT(R, G, B, A) --thanks to proddy
	A = A or 255
	return ((R&0x0ff)<<0x00)|((G&0x0ff)<<0x08)|((B&0x0ff)<<0x10)|((A&0x0ff)<<0x18)
end

function funcs.get.plyr_name(_pid)
	if funcs.is.valid_pid(_pid) then
		return (API.plyr.get_name(_pid) or "Player")
	end
	return "Player"
end

function funcs.get.sprite_rot(_heading)
	return API.mth.rad(_heading)*-1
end



funcs.set={}

function funcs.set.feat_i_f(_feat,_min,_max,_mod,_val)
	_feat.min = _min
	_feat.max = _max
	_feat.mod = _mod
	_feat.value = _val
end



funcs.doo={}

function funcs.doo.yield_if_modulus(_val,_mod,_result)
	if _val % _mod == _result then
		API.sys.yld(0)
	end
end


return funcs