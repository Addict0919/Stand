-- GeeSkid v1.05

function _G_plyrs_online_do(parent)



	_G_TeleportsP = menu.add_player_feature("Teleports", "parent", parent.id)
	
	_G_GeeSkidPlyrPed = menu.add_player_feature("Player", "parent", parent.id)
		
		_G_SelfProtex_p = menu.add_player_feature("Aim protex", "parent", _G_GeeSkidPlyrPed.id)
		
		_G_Fake_Friends = menu.add_player_feature("Fake Friends", "parent", _G_GeeSkidPlyrPed.id)
		
		_G_p_weapon={}
		_G_p_weapon.main_prnt=menu.add_player_feature("Weapons/Ammo", "parent", _G_GeeSkidPlyrPed.id)
		
		_G_p_weapon.search_prnt=menu.add_player_feature("Search for weapon", "parent",_G_p_weapon.main_prnt.id)
		_G_p_weapon.search_feats={}
		_G_p_weapon.search=menu.add_player_feature("Search", "action",_G_p_weapon.search_prnt.id,function()
			local status,str = 1
			status,str = _GF_text_input_get("Type weapon name","",25,0)
			if status == 0 then 
				local _table={}
				for i=1,#_GT_all_weap_hash do
					if string.match(string.lower(weapon.get_weapon_name(_GT_all_weap_hash[i])), string.lower(str)) ~= nil then
						_table[#_table+1]= _GT_all_weap_hash[i]
					end
				end
				if #_table > 0 then 
					table.sort(_table, function(a, b) return weapon.get_weapon_name(a):lower() <  weapon.get_weapon_name(b):lower() end)
					for i=1,#_G_p_weapon.search_feats do
						if _G_p_weapon.search_feats[i] ~= nil then
							menu.delete_player_feature(_G_p_weapon.search_feats[i].id)
							_G_p_weapon.search_feats[i] = nil
							system.yield(0)
						end
					end
					for i=1,#_table do
						_G_p_weapon.search_feats[i]=menu.add_player_feature(weapon.get_weapon_name(_table[i]), "action_value_str", _G_p_weapon.search_prnt.id, function(f,pid)
							local given,removed,pre_removed=_G_p_weapon.func(_table[i],f.value,pid)
							if given then menu.notify("".. _GF_plyr_name(pid) .. "\n"..weapon.get_weapon_name(_table[i]).."/ammo given :)", _G_GeeVer, 4, 2)
							elseif removed then menu.notify("".. _GF_plyr_name(pid) .. "\n"..weapon.get_weapon_name(_table[i]).." removed :)", _G_GeeVer, 4, 2)
							elseif pre_removed then menu.notify("".. _GF_plyr_name(pid) .. "\nPlayer did not have "..weapon.get_weapon_name(_table[i]), _G_GeeVer, 4, 2)
							else menu.notify("".. _GF_plyr_name(pid) .. "\n"..weapon.get_weapon_name(_table[i]).." FAILED :(", _G_GeeVer, 4, 2)
							end
						end) _G_p_weapon.search_feats[i].set_str_data(_G_p_weapon.search_feats[i],{"Give","Remove"})
					end
				end
			end
		end)

		_G_p_weapon.GR_all=menu.add_player_feature("**All weapons**", "action_value_str",_G_p_weapon.main_prnt.id, function(f,pid)
			weapon.give_delayed_weapon_to_ped(player.get_player_ped(pid), -72657034, 100, true)
			local given,removed,pre_removed,failed=0,0,0,0
			for i=1,#_GT_all_weap_hash do
				local g,r,pr = _G_p_weapon.func(_GT_all_weap_hash[i],f.value,pid)
				if g then given = given+1 elseif r then removed = removed+1 elseif pr then pre_removed = pre_removed+1 else failed=failed+1 end
			end
			if f.value == 0 then
				if given > 0 then
					menu.notify("".. _GF_plyr_name(pid) .. "\n"..given.."/"..(given+failed).." weapons/ammo given :)", _G_GeeVer, 4, 2)
				else
					menu.notify("".. _GF_plyr_name(pid) .. "\nZero weapons given :(", _G_GeeVer, 4, 2)
				end
			elseif removed > 0 then
				menu.notify("".. _GF_plyr_name(pid) .. "\n"..removed.."/"..(removed+failed).." weapons removed :)", _G_GeeVer, 4, 2)
			elseif pre_removed > 0 then
				menu.notify("".. _GF_plyr_name(pid) .. "\nZero weapons because they didnt have any :)", _G_GeeVer, 4, 2)
			end
		end) _G_p_weapon.GR_all.set_str_data(_G_p_weapon.GR_all,{"Give","Remove"})
		_G_p_weapon.types={[0]="Pistols",[1]="Machine guns",[2]="Assault rifles",[3]="Snipers",[4]="Melee",[5]="Shotguns",[6]="Heavy weapons",[7]="Throwable/Other"}
		_G_p_weapon.prnts={}
		_G_p_weapon.temp={}
		_G_p_weapon.all={}
		_G_p_weapon.one={}
		function _G_p_weapon.func(_weap,_val,_pid)
			local given,removed,pre_removed=false,false,false
			if _val==0 then
				given = _GF_give_ped_weap(player.get_player_ped(_pid),_weap) --then
			elseif not weapon.has_ped_got_weapon(player.get_player_ped(_pid), _weap) then pre_removed = true
			else
				weapon.remove_weapon_from_ped(player.get_player_ped(_pid), _weap)
				system.yield(0)
				if not weapon.has_ped_got_weapon(player.get_player_ped(_pid), _weap) then removed = true end
			end
			return given,removed,pre_removed
		end
		for i=0,7 do
			_G_p_weapon.temp[i]={}
			_G_p_weapon.prnts[i]=menu.add_player_feature(_G_p_weapon.types[i], "parent", _G_p_weapon.main_prnt.id)
			for ii=1,#_GT_all_weap_hash do
				if weapon.get_weapon_weapon_wheel_slot(_GT_all_weap_hash[ii])==i and weapon.get_weapon_name(_GT_all_weap_hash[ii]) ~= "Unarmed" then
					_G_p_weapon.temp[i][#_G_p_weapon.temp[i]+1]=_GT_all_weap_hash[ii]
				end
			end
			table.sort(_G_p_weapon.temp[i], function(a, b) return weapon.get_weapon_name(a):lower() <  weapon.get_weapon_name(b):lower() end)
			
			
			_G_p_weapon.all[i]=menu.add_player_feature("**All ".._G_p_weapon.types[i].."**", "action_value_str", _G_p_weapon.prnts[i].id, function(f,pid)
				weapon.give_delayed_weapon_to_ped(player.get_player_ped(pid), -72657034, 100, true)
				local given,removed,pre_removed,g,r,pr=false,false,false,false,false,false
				for ii=1,#_G_p_weapon.temp[i] do
					local g,r,pr = _G_p_weapon.func(_G_p_weapon.temp[i][ii],f.value,pid)
					if g then given = true elseif r then removed = true elseif pr then pre_removed = true end
				end
				if given then menu.notify("".. _GF_plyr_name(pid) .. "\n".._G_p_weapon.types[i].."/ammo given :)", _G_GeeVer, 4, 2)
				elseif removed then menu.notify("".. _GF_plyr_name(pid) .. "\n".._G_p_weapon.types[i].." removed :)", _G_GeeVer, 4, 2)
				elseif pre_removed then menu.notify("".. _GF_plyr_name(pid) .. "\nPlayer did not have ".._G_p_weapon.types[i], _G_GeeVer, 4, 2)
				else menu.notify("".. _GF_plyr_name(pid) .. "\n".._G_p_weapon.types[i].." FAILED :(", _G_GeeVer, 4, 2)
				end
			end)_G_p_weapon.all[i].set_str_data(_G_p_weapon.all[i],{"Give","Remove"})
			if i== 7 then
				_G_p_weapon.para=menu.add_player_feature("Parachute", "action_value_str", _G_p_weapon.prnts[i].id, function(f,pid)
						weapon.give_delayed_weapon_to_ped(player.get_player_ped(pid), -72657034, 100, true)
						menu.notify("".. _GF_plyr_name(pid) .. "\nParachute given :)", _G_GeeVer, 4, 2)
				end) _G_p_weapon.para.set_str_data(_G_p_weapon.para,{"Give"})
			end
			_G_p_weapon.one[i]={}
			for ii=1,#_G_p_weapon.temp[i] do
				_G_p_weapon.one[i][ii]=menu.add_player_feature(weapon.get_weapon_name(_G_p_weapon.temp[i][ii]), "action_value_str", _G_p_weapon.prnts[i].id, function(f,pid)
					local given,removed,pre_removed=_G_p_weapon.func(_G_p_weapon.temp[i][ii],f.value,pid)
					if given then menu.notify("".. _GF_plyr_name(pid) .. "\n"..weapon.get_weapon_name(_G_p_weapon.temp[i][ii]).."/ammo given :)", _G_GeeVer, 4, 2)
					elseif removed then menu.notify("".. _GF_plyr_name(pid) .. "\n"..weapon.get_weapon_name(_G_p_weapon.temp[i][ii]).." removed :)", _G_GeeVer, 4, 2)
					elseif pre_removed then menu.notify("".. _GF_plyr_name(pid) .. "\nPlayer did not have "..weapon.get_weapon_name(_G_p_weapon.temp[i][ii]), _G_GeeVer, 4, 2)
					else menu.notify("".. _GF_plyr_name(pid) .. "\n"..weapon.get_weapon_name(_G_p_weapon.temp[i][ii]).." FAILED :(", _G_GeeVer, 4, 2)
					end
				end) _G_p_weapon.one[i][ii].set_str_data(_G_p_weapon.one[i][ii],{"Give","Remove"})
			end
		end
	
	_G_VehicleP = menu.add_player_feature("Vehicle", "parent", parent.id)
	
		_G_VehicleGrief_p = menu.add_player_feature("Vehicle Grief", "parent", _G_VehicleP.id)
	
		_G_VehicleModP = menu.add_player_feature("Vehicle Mods", "parent", _G_VehicleP.id)
		
	_G_VehicleSpawnP = menu.add_player_feature("Spawn Vehicle", "parent", parent.id)
		
		_G_spawn_veh_options=menu.add_player_feature("Options", "parent", _G_VehicleSpawnP.id)
		
		_G_spawn_veh_search_p=menu.add_player_feature("Search for Make/Model", "parent", _G_VehicleSpawnP.id)
	
	
	_G_VehGriefFeat_p=menu.add_player_feature("Vehicle grief", "value_str", _G_VehicleGrief_p.id, function(f,pid)
		while f.on do
			_GT_plyr_info.veh_grief_choice[pid+1][1] = true
			_GT_plyr_info.veh_grief_choice[pid+1][2] = f.value
			system.yield(1000)
		end
		_GT_plyr_info.veh_grief_choice[pid+1][1] = false
	end)_G_VehGriefFeat_p.set_str_data(_G_VehGriefFeat_p,{"Kick from veh","Destroy","Freeze","TP away","Fuck their veh"})
	
	menu.add_player_feature("Avenger", "toggle", _G_VehicleGrief_p.id, function(f,pid)
		local continue,success = false,false
		local name,model
		local chk_time,chk_amnt = utils.time_ms(),0
		while f.on do
			_GF_veh_grief_p_action(pid,gameplay.get_hash_key("avenger"),gameplay.get_hash_key("avenger2"),chk_time,chk_amnt,success,name,model,f.value)	
			_GF_yield_while_true(f.on,3000)
		end
	end)
	
	for i=1,#_GT_veh_grief_hash_list-2 do
		if i ~= 1 and i ~= 2 then
			menu.add_player_feature(_GT_veh_grief_hash_list[i][3], "toggle", _G_VehicleGrief_p.id,function(f,pid) 
				local continue,success = false,false
				local name,model
				local chk_time,chk_amnt = utils.time_ms(),0
				while f.on do
					_GF_veh_grief_p_action(pid,_GT_veh_grief_hash_list[i][1],_GT_veh_grief_hash_list[i][1],chk_time,chk_amnt,success,name,model,f.value)			
					_GF_yield_while_true(f.on,3000)
				end
			end)
		end
	end
	
	menu.add_player_feature("Ramp Buggy", "toggle", _G_VehicleGrief_p.id, function(f,pid)
		local continue,success = false,false
		local name,model
		local chk_time,chk_amnt = utils.time_ms(),0
		while f.on do
			_GF_veh_grief_p_action(pid,gameplay.get_hash_key("dune5"),gameplay.get_hash_key("dune4"),chk_time,chk_amnt,success,name,model,f.value)			
			_GF_yield_while_true(f.on,3000)
		end
	end)
		
	_GT_spawn_veh_search_p_feat = {}
	_GT_spawn_veh_search_p_temp = {}
	_G_spawn_veh_search_do_p=menu.add_player_feature("Search for Make/Model", "action_value_str", _G_spawn_veh_search_p.id, function(f)
		local status,str,veh = 1
		status,str = _GF_text_input_get("Vehicle Make/Model","",25,0)
		if status == 0 then
			_GT_spawn_veh_search_p_temp = {}
			_GT_spwn_veh.ovrly_srch_do(str,f.value,_GT_spawn_veh_search_p_temp)
			if #_GT_spawn_veh_search_p_temp > 0 then
				for i=1,#_GT_spawn_veh_search_p_feat do
					system.yield(0)
					if _GT_spawn_veh_search_p_feat[i] ~= nil then menu.delete_player_feature(_GT_spawn_veh_search_p_feat[i].id) end
				end
				_GT_spawn_veh_search_p_feat = {}
				for i=1,#_GT_spawn_veh_search_p_temp do
					if f.value == 0 then
						_GT_spawn_veh_search_p_feat[#_GT_spawn_veh_search_p_feat+1]=menu.add_player_feature(_GT_spawn_veh_search_p_temp[i][1], "action", _G_spawn_veh_search_p.id,function(f,pid)
							if _GF_is_pid_intrr(pid) then
								menu.notify("".. _GF_plyr_name(pid) .. "\nIn interior.", _G_GeeVer, 4, 2)
							else
								_GF_req_stream_hash(_GT_spawn_veh_search_p_temp[i][5])
								local veh = _GF_spawn_veh_at_pid_frnt(pid,_GT_spawn_veh_search_p_temp[i][5],true)
							end
						end)
					else
						_GT_spawn_veh_search_p_feat[#_GT_spawn_veh_search_p_feat+1]=menu.add_player_feature(_GT_spawn_veh_search_p_temp[i][3], "action", _G_spawn_veh_search_p.id,function(f,pid)
							if _GF_is_pid_intrr(pid) then
								menu.notify("".. _GF_plyr_name(pid) .. "\nIn interior.", _G_GeeVer, 4, 2)
							else
								_GF_req_stream_hash(_GT_spawn_veh_search_p_temp[i][5])
								local veh = _GF_spawn_veh_at_pid_frnt(pid,_GT_spawn_veh_search_p_temp[i][5],true)
							end
						end)
					end
				end
			end
		end
	end)_G_spawn_veh_search_do_p.set_str_data(_G_spawn_veh_search_do_p,{"Model", "Make","Make or Model"})

	_G_VehicleSpawnP_class=menu.add_player_feature("All vehicles by type", "parent", _G_VehicleSpawnP.id)
		
	_GT_spawn_veh_feature_p={}
	_GT_spawn_veh_feature_p.temp_list_sort={}
	_GT_spawn_veh_feature_p.feat_srch_table={}
	for i=1,#_GT_class_str_list do
		_GT_spawn_veh_feature_p.temp_list_sort[i]={}
		for ii=1,#_GT_all_veh_info do
			if _GT_all_veh_info[ii][6] == _GT_class_str_list[i] then
				_GT_spawn_veh_feature_p.temp_list_sort[i][#_GT_spawn_veh_feature_p.temp_list_sort[i]+1]=_GT_all_veh_info[ii]
			end
		end
		table.sort(_GT_spawn_veh_feature_p.temp_list_sort[i], function(a, b) return a[1]:lower() <  b[1]:lower() end)
	end
	for i=1,#_GT_class_str_list do
		_GT_spawn_veh_feature_p.feat_srch_table[#_GT_spawn_veh_feature_p.feat_srch_table+1] = menu.add_player_feature(_GT_class_str_list[i], "parent",_G_VehicleSpawnP_class.id)
		for ii=1,#_GT_spawn_veh_feature_p.temp_list_sort[i] do
			_GT_spawn_veh_feature_p.temp_list_name = ""
			if _GT_spawn_veh_feature_p.temp_list_sort[i][ii][2] == "" then
				_GT_spawn_veh_feature_p.temp_list_name = _GT_spawn_veh_feature_p.temp_list_sort[i][ii][1]
			else
				_GT_spawn_veh_feature_p.temp_list_name = _GT_spawn_veh_feature_p.temp_list_sort[i][ii][1].." - ".._GT_spawn_veh_feature_p.temp_list_sort[i][ii][2]
			end
			menu.add_player_feature(_GT_spawn_veh_feature_p.temp_list_name, "action", _GT_spawn_veh_feature_p.feat_srch_table[i].id,function(f,pid)
				if _GF_is_pid_intrr(pid) then
					menu.notify("".. _GF_plyr_name(pid) .. "\nIn interior.", _G_GeeVer, 4, 2)
				else
					_GF_req_stream_hash(_GT_spawn_veh_feature_p.temp_list_sort[i][ii][5])
					local veh = _GF_spawn_veh_at_pid_frnt(pid,_GT_spawn_veh_feature_p.temp_list_sort[i][ii][5],true)
				end
			end)
		end
	end

	_GT_spawn_veh_feature_p.quick ={}
	_GT_spawn_veh_feature_p.quick.prnt=menu.add_player_feature("Quick spawn list", "parent", _G_VehicleSpawnP.id)
	_GT_spawn_veh_feature_p.quick.feats={}
	for i=1, #_GT_spwn_veh.quick_spawn_list do
		for ii=1, #_GT_all_veh_info do
			if _GT_all_veh_info[ii][5] == gameplay.get_hash_key(_GT_spwn_veh.quick_spawn_list[i]) then
				_GT_spawn_veh_feature_p.quick.feats[i]=menu.add_player_feature(_GT_all_veh_info[ii][1], "action", _GT_spawn_veh_feature_p.quick.prnt.id,function(f,pid)
					if _GF_is_pid_intrr(pid) then
						menu.notify("".. _GF_plyr_name(pid) .. "\nIn interior.", _G_GeeVer, 4, 2)
					else
						_GF_req_stream_hash(_GT_all_veh_info[ii][5])
						local veh = _GF_spawn_veh_at_pid_frnt(pid,_GT_all_veh_info[ii][5],true)
					end
				end)
				break
			end
		end
	end

	_G_p_veh_tp_check=menu.add_player_feature(">> Force check for position/vehicle if needed", "toggle", parent.id, function(f,pid)
		local _pid = pid+1
		if f.on then
			_GT_plyr_info.tp_sett[_pid] = true
		else
			_GT_plyr_info.tp_sett[_pid] = false
		end
	end)
	
	-- menu.add_player_feature("Camera Manipulation", "toggle", parent.id, function(f,pid)
		-- while f.on do
			-- system.yield(0)
			-- if player.is_player_god(pid) then
				-- script.trigger_script_event(801199324, pid, {pid, 869796886, 0})
			-- end
		-- end
	-- end)
	
	_G_PlyrPed_shroud=menu.add_player_feature("Shroud player in smoke", "toggle", _G_GeeSkidPlyrPed.id, function(f,pid)
		_G_PlyrPed_fire.on=false
		_G_PlyrPed_water.on=false
		_G_PlyrPed_flare.on=false
		local time = utils.time_ms() + 1000
		local point1,point2,random_head
		while f.on do
			system.yield(0)
			if utils.time_ms() < time then
				point1=math.random(-1500,2000)*0.001 --elevation
				point2=math.random(1000,2000)*0.001 -- distance
				random_head = math.random(0,359) -- degrees
				_GF_fire_expl_ent_pid(pid, point1, random_head, point2,19, 25)
				point1=math.random(-250,750)*0.001 --elevation
				point2=math.random(1000,2000)*0.001 -- distance
				_GF_fire_expl_ent_pid(pid, point1, random_head, point2,79, 25)
			else
				_GF_delay_(200)
				time = utils.time_ms() + 1000
			end
		end
	end)

	_G_PlyrPed_flare=menu.add_player_feature("Bedazzle with flares (Blinding lag)", "toggle", _G_GeeSkidPlyrPed.id, function(f,pid)
		_G_PlyrPed_fire.on=false
		_G_PlyrPed_water.on=false
		_G_PlyrPed_shroud.on=false
		local time = utils.time_ms() + 1000
		local point1,point2,random_head
		while f.on do
			system.yield(0)
			if utils.time_ms() < time then
				point1=math.random(-500,1500)*0.001 --elevation
				point2=math.random(100,2000)*0.001 -- distance
				random_head = math.random(0,359) -- degrees
				_GF_fire_expl_ent_pid(pid, point1, random_head, point2,22, 25)
				point1=math.random(1300)*0.001 --elevation
				point2=math.random(2000,3000)*0.001 -- distance
				random_head = math.random(185,190) -- degrees
				_GF_fire_expl_ent_pid(pid, point1, random_head, point2,22, 25)
			else
				_GF_delay_(50)
				time = utils.time_ms() + 1000
			end
		end
	end)

	_G_PlyrPed_water=menu.add_player_feature("Spam with water", "toggle", _G_GeeSkidPlyrPed.id, function(f,pid)
		_G_PlyrPed_fire.on=false
		_G_PlyrPed_flare.on=false
		_G_PlyrPed_shroud.on=false
		local time = utils.time_ms() + 1000
		local point1,point2,random_head
		while f.on do
			system.yield(0)
			if utils.time_ms() < time then
				point1=math.random(-3000,-1000)*0.001 --elevation
				point2=math.random(500,1500)*0.001 -- distance
				random_head = math.random(0,359) -- degrees
				_GF_fire_expl_ent_pid(pid, point1, random_head, point2,13, 250)
			else
				_GF_delay_(50)
				time = utils.time_ms() + 1000
			end
		end
	end)

	_G_PlyrPed_fire=menu.add_player_feature("Circle of fire", "toggle", _G_GeeSkidPlyrPed.id, function(f,pid)
		_G_PlyrPed_water.on=false
		_G_PlyrPed_flare.on=false
		_G_PlyrPed_shroud.on=false
		local time = utils.time_ms() + 1000
		local point1,point2,random_head
		while f.on do
			system.yield(0)
			if utils.time_ms() < time then
				random_head = math.random(0,359) -- degrees
				_GF_fire_expl_ent_pid(pid, -1, random_head, -4,12, 25)
				point1=math.random(-500,1500)*0.001 --elevation
				point2 = math.random(4,5) --distance
				_GF_fire_expl_ent_pid(pid, point1, random_head, point2,3, 25)
			else
				_GF_delay_(200)
				time = utils.time_ms() + 1000
			end
		end
	end)

	_G_PlyrPed_wntd = menu.add_player_feature("Set wanted level", "value_i",_G_GeeSkidPlyrPed.id, function(f,pid)
		while f.on do
			system.yield(100)
			_GF_set_wnt_all_psngrs(pid,f.value)
		end
	end)_GF_set_feat_i_f(_G_PlyrPed_wntd,0,5,1,0)
	
	_G_p_mod_toggle=menu.add_player_feature("Modder flag toggle", "action_value_str", _G_GeeSkidPlyrPed.id, function(f,pid)
		if player.is_player_modder(pid,_GT_mod_info.int_str[f.value+1][1]) then
			player.unset_player_as_modder(pid,_GT_mod_info.int_str[f.value+1][1])
		elseif player.can_player_be_modder(pid) then
			player.set_player_as_modder(pid,_GT_mod_info.int_str[f.value+1][1])
		else
			menu.notify(_GF_plyr_name(pid) .. "\nCannot be marked as modder", _G_GeeVer, 4, 2)
		end
	end)_G_p_mod_toggle.set_str_data(_G_p_mod_toggle,_GT_mod_info.str)

	_G_p_mod_all_toggle=menu.add_player_feature("Modder flags - All", "action_value_str", _G_GeeSkidPlyrPed.id, function(f,pid)
		if f.value == 0 then
			if player.can_player_be_modder(pid) then
				for i=1,#_GT_mod_info.int_str do
					player.set_player_as_modder(pid,_GT_mod_info.int_str[i][1])
				end
			end
		else
			for i=1,#_GT_mod_info.int_str do
				player.unset_player_as_modder(pid,_GT_mod_info.int_str[i][1])
			end
		end
	end)_G_p_mod_all_toggle.set_str_data(_G_p_mod_all_toggle,{"Set","Un-set"})
	
	_G_p_drop_sparrows=menu.add_player_feature(">>Drop sparrows", "action_value_str", _G_GeeSkidPlyrPed.id, function(f,pid)
		if f.value == 0 then
			_GF_plyr_ped_start(pid,"sparrow",nil,nil,nil,nil)
		else
			_GF_plyr_ped_start(pid,"sparrows",nil,nil,nil,nil)
		end
	end)_G_p_drop_sparrows.set_str_data(_G_p_drop_sparrows,{"One", "Many"})

	_G_p_plyr_burn=menu.add_player_feature(">>Burn player", "action_value_str", _G_GeeSkidPlyrPed.id, function(f,pid)
		local _blame = 32
		local _blame_name
		if f.value == 0 then
			_blame = player.player_id()
			_blame_name = "By me :)"
		elseif f.value == 1 then
			_blame_name = "By anon :)"
		elseif f.value == 2 then
			_blame = pid
			_blame_name = "Aloha snackbar :)"
		end
		_GF_plyr_ped_start(pid,"explode",_blame,_blame_name,3,3)
	end)_G_p_plyr_burn.set_str_data(_G_p_plyr_burn,{"Blame me","Blame no-one","Blame them"})
	
	_G_p_plyr_xpld=menu.add_player_feature(">>Explode player", "action_value_str", _G_GeeSkidPlyrPed.id, function(f,pid)
		local _blame = 32
		local _blame_name
		if f.value == 0 then
			_blame = player.player_id()
			_blame_name = "By me :)"
		elseif f.value == 1 then
			_blame_name = "By anon :)"
		elseif f.value == 2 then
			_blame = pid
			_blame_name = "Aloha snackbar :)"
		end
		_GF_plyr_ped_start(pid,"burn",_blame,_blame_name,59,60)
	end)_G_p_plyr_xpld.set_str_data(_G_p_plyr_xpld,{"Blame me","Blame no-one","Blame them"})
		
	_G_p_plyr_fat_bitches=menu.add_player_feature("Spawn angry fat bitches", "action_value_str", _G_GeeSkidPlyrPed.id, function(f,pid) --thnks to midnight and kek
		if _GF_is_pid_intrr(pid) then
			menu.notify("".. _GF_plyr_name(pid) .. "\nIn interior.", _G_GeeVer, 4, 2)
		else
			local ped_model = gameplay.get_hash_key("a_f_m_fatcult_01")
			local weapon1 = gameplay.get_hash_key("weapon_machinepistol")
			local weapon2 = gameplay.get_hash_key("weapon_gusenberg")
			local veh_hash
			_GF_req_stream_hash(ped_model)
			if f.value == 0 or f.value == 1 then
				if f.value == 0 then
					veh_hash = gameplay.get_hash_key("bmx")
				else
					veh_hash = gameplay.get_hash_key("deathbike2")
				end
				_GF_req_stream_hash(veh_hash)
			end
			for i=1,3 do
				local bitch =_GF_spawn_angry_ped_at_pos(_GF_front_of_pos(_GF_plyr_pos_z_guess(pid), math.random(0,359), 7, 0, .5),ped_model,weapon1,weapon2,pid)
				if f.value == 0 or f.value == 1 then
					local bike = _GF_spawn_veh_at_pos(entity.get_entity_coords(bitch),veh_hash,true)
					_GF_weap_worst_simple(bike) --this removes the guns but leaves the blades. Peds suck with Deathbike guns, but will ram the shit outta someone with the blades
					ped.set_ped_into_vehicle(bitch, bike, -1)
					ai.task_vehicle_follow(bitch, bike, player.get_player_ped(pid), 150, 21759548, 50)
				else
					ai.task_go_to_entity_while_aiming_at_entity(bitch, player.get_player_ped(pid), player.get_player_ped(pid),  0.0, true, 0.0, 0.0, false, false, -957453492) -- for on foot. doesnt work perfectly
				end
				system.yield(25)
			end
		end
	end)_G_p_plyr_fat_bitches.set_str_data(_G_p_plyr_fat_bitches,{"On bicycle","On motorcycle","On foot"})
	
	_G_p_plyr_kick=menu.add_player_feature("Kick player", "action_value_str", _G_GeeSkidPlyrPed.id, function(f,pid)
		local me=player.player_id()
		if pid == me then
			menu.notify("Really? You want to kick yourself?", _G_GeeVer, 4, 2)
		elseif f.value == 0 then
			_GF_plyr_kick(pid)
		elseif f.value == 1 then
			_GF_kick_their_org(pid)
		else
			_GF_kick_their_veh(pid)
		end
	end)_G_p_plyr_kick.set_str_data(_G_p_plyr_kick,{"Just them", "Their org/mc","Everyone in their car"})
	
	_G_AimGriefExplode_p=menu.add_player_feature("Explode player","toggle",_G_SelfProtex_p.id, function(f,pid)
		local distance,head,pos
		while f.on do
			system.yield(0)
			if _GF_aim_at_me(pid) then
				distance,head,pos = _GF_plyr_moving_pos(pid)
				fire.add_explosion(_GF_front_of_pos(pos,head,distance,180,0.25), 2, true, false, 0, pid)
				fire.add_explosion(_GF_front_of_pos(pos,head,distance,180,0.25), 2, true, false, 0, pid)
			end
		end
	end)

	_G_AimGriefburn_p=menu.add_player_feature("Burn player","toggle",_G_SelfProtex_p.id, function(f,pid)
		local distance,head,pos
		while f.on do
			system.yield(0)
			if _GF_aim_at_me(pid) then
				distance,head,pos = _GF_plyr_moving_pos(pid)
				fire.add_explosion(_GF_front_of_pos(pos,head,distance,180,0.25), 3, true, false, 0, pid)
				fire.add_explosion(_GF_front_of_pos(pos,head,distance,180,0.25), 3, true, false, 0, pid)
				fire.start_entity_fire(player.get_player_ped(pid)) --not sure if this works on a player
			end
		end
	end)

	_G_AimGriefSparrow_p=menu.add_player_feature("Drop sparrow on player","toggle",_G_SelfProtex_p.id, function(f,pid)
		local distance,head,veh,pos
		while f.on do
			system.yield(0)
			if _GF_aim_at_me(pid) then
				_GF_req_stream_hash(1229411063)
				distance,head,pos = _GF_plyr_moving_pos(pid)
				veh = vehicle.create_vehicle(1229411063, _GF_front_of_pos(pos, head, distance, 180, 20), math.random(0,359), true, false)
				entity.set_entity_velocity(veh, v3(0,0,-150))
				system.yield(500)
			end
		end
	end)

	_G_AimGriefFatBitch_p=menu.add_player_feature("Spawn angry fat bitch on player","toggle",_G_SelfProtex_p.id, function(f,pid)
		local distance,head,bitch,pos
		while f.on do
			system.yield(0)
			if _GF_aim_at_me(pid) then
				_GF_req_stream_hash(gameplay.get_hash_key("a_f_m_fatcult_01"))
				distance,head,pos = _GF_plyr_moving_pos(pid)
				bitch =_GF_spawn_angry_ped_at_pos(_GF_front_of_pos(pos, math.random(0,359), 7, 0, .5),gameplay.get_hash_key("a_f_m_fatcult_01"),gameplay.get_hash_key("weapon_machinepistol"),gameplay.get_hash_key("weapon_gusenberg"),pid)
				system.yield(1000)
			end
		end
	end)
	
	_G_AimGriefWeap_p=menu.add_player_feature("Remove weapons","value_str",_G_SelfProtex_p.id, function(f,pid)
		while f.on do
			system.yield(0)
			if _GF_aim_at_me(pid) then
				if f.value == 0 then
					weapon.remove_weapon_from_ped(player.get_player_ped(pid), ped.get_current_ped_weapon(player.get_player_ped(pid)))
				else
					weapon.remove_all_ped_weapons(player.get_player_ped(pid))
				end
				system.yield(1000)
			end
		end
	end)_G_AimGriefWeap_p.set_str_data(_G_AimGriefWeap_p,{"Current weapon", "All weapons"})
	
	_G_AimGriefKick_p=menu.add_player_feature("Kick player","toggle",_G_SelfProtex_p.id, function(f,pid)
		while f.on do
			system.yield(0)
			if _GF_aim_at_me(pid) then
				_GF_plyr_kick(pid)	
			end
		end
	end)
	
	menu.add_player_feature("Add as fake friend","action",_G_Fake_Friends.id, function(f,pid)
		if pid == player.player_id() then
			menu.notify("You can't add yourself as a fake friend.",_G_GeeVer,4)
		else
			local directory,file_path,file,contents,_start,_end,_last,_ff_sett,_ff_name
			local found,num = false,0
			directory = utils.get_appdata_path("PopstarDevs", "").."\\2Take1Menu\\cfg\\"
			if not utils.dir_exists(directory) then
				utils.make_dir(directory)
			end
			file_path = "scid"
			if not utils.file_exists(directory..file_path..".cfg") then
				file = io.open(directory..file_path..".cfg", "a")
				file:write("[SCID]")
				file:close()
			end
			file = io.open(directory..file_path..".cfg", "r")
			for line in file:lines() do
				if line == nil then
					break
				else
					_start,_end = string.find(line, ":")
					if _start ~= nil and _end ~= nil then
						_ff_name = string.sub(line,1,_end-1)
						_last = _end+1
						_start,_end = string.find(line, ":",_last) 
						if _start ~= nil and _end ~= nil then
							if _GT_plyr_info.scid[pid+1] == _GF_hex_to_dec(string.sub(line,_last,_end-1)) then
								found = true
								break
							end
						end
					end
				end
				--system.yield(0)
			end
			io.close(file)
			if found then
				menu.notify("SCID already in fake friends as name: ".._ff_name,_G_GeeVer,4)
			else
				num = _GF_dec_to_hex(_GT_plyr_info.ff_jt[pid+1] + _GT_plyr_info.ff_stlk[pid+1] + _GT_plyr_info.ff_hide[pid+1] + _GT_plyr_info.ff_frnd[pid+1])
				file = io.open(directory..file_path..".cfg", "a")
				file:write("\n".._GF_plyr_name(pid)..":".._GF_dec_to_hex(_GT_plyr_info.scid[pid+1])..":"..num)
				file:close()
				menu.notify("SCID saved in fake friends",_G_GeeVer,4)
			end
		end
	end)
	
	menu.add_player_feature("Join timeout","toggle",_G_Fake_Friends.id, function(f,pid)
		if f.on then _GT_plyr_info.ff_jt[pid+1] = 4 else _GT_plyr_info.ff_jt[pid+1] = 0	end
	end)
	
	menu.add_player_feature("Stalk","toggle",_G_Fake_Friends.id, function(f,pid)
		if f.on then _GT_plyr_info.ff_stlk[pid+1] = 1 else _GT_plyr_info.ff_stlk[pid+1] = 0 end
	end)
	
	menu.add_player_feature("Hidden","toggle",_G_Fake_Friends.id, function(f,pid)
		if f.on then _GT_plyr_info.ff_hide[pid+1] = 8 else _GT_plyr_info.ff_hide[pid+1] = 0	end
	end)
	
	menu.add_player_feature("Friend list","toggle",_G_Fake_Friends.id, function(f,pid)
		if f.on then _GT_plyr_info.ff_frnd[pid+1] = 16 else	_GT_plyr_info.ff_frnd[pid+1] = 0 end
	end)

	-----------------------------------------------------------------------------------------GEE-SKID
	-----------------------------------------------------------------------------------------GeeSkidP
	---------------------------------------------------------------------------------------TeleportsP
	-------------------------------------------------------------------------------------------Online
	-------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------

	_G_p_veh_tp_self2=menu.add_player_feature("TP-Self into their vehicle","action_value_str",_G_TeleportsP.id,function(feat,pid)
		local pid_table = {}
		pid_table[1]=pid
		_GF_plyr_veh_tp_into(pid_table, feat.value,false)
	end) _G_p_veh_tp_self2.set_str_data(_G_p_veh_tp_self2,{"Free Seat", "Their Seat", "Hijack Driver"})

	_G_p_veh_tp_self_near=menu.add_player_feature("TP-Self/Vehicle to them","action_value_str",_G_TeleportsP.id,function(feat,pid)
		if feat.value==0 then -- on top
			_GF_tp_self_to_pid(pid, "on_top")
		elseif feat.value==1 then -- behind
			_GF_tp_self_to_pid(pid, "behind")
		else
			_GF_tp_self_to_pid(pid, "nearby")
		end
	end) _G_p_veh_tp_self_near.set_str_data(_G_p_veh_tp_self_near,{"On top", "Behind","Nearby"})

	_G_p_veh_tp_to_me=menu.add_player_feature("TP their vehicle to me", "action_value_str", _G_TeleportsP.id, function(feat,pid)
		if feat.value==0 then
			local loc = tostring("In front of me.")
			_G_p_veh_tp_do("my_pos_front",loc,"no_speed",0,pid)
		elseif feat.value==1 then
			local me=player.player_id()
			local loc = tostring("Near me.")
			_G_p_veh_tp_do(_GF_pos_nearby(player.get_player_coords(me),"single_50_dist",100,"water"),loc,"no_speed",0,pid)
		elseif feat.value==2 then
			local loc = tostring("50m above me.")
			_G_p_veh_tp_do("my_pos_front",loc,"no_speed",50,pid)
		elseif feat.value==3 then
			local loc = tostring("250m above me.")
			_G_p_veh_tp_do("my_pos_front",loc,"no_speed",250,pid)
		else	
			local loc = tostring("1000m above me.")
			_G_p_veh_tp_do("my_pos_front",loc,"no_speed",1000,pid)
		end
	end)_G_p_veh_tp_to_me.set_str_data(_G_p_veh_tp_to_me,{"In front of me", "Near me", "50m above me","250m above me", "1000m above me"})
		
	_G_p_veh_tp_into_air=menu.add_player_feature("TP above their poistion", "action_value_str", _G_TeleportsP.id, function(feat,pid)
		if feat.value == 0 then
			local loc = tostring("50m up.")
			_G_p_veh_tp_do(_GF_pos_nearby(player.get_player_coords(pid),"single_closest",10,"water","xy"),loc,"retain_speed",50,pid)
		elseif feat.value == 1 then
			local loc = tostring("250m up.")
			_G_p_veh_tp_do(_GF_pos_nearby(player.get_player_coords(pid),"single_closest",10,"water","xy"),loc,"retain_speed",250,pid)
		else
			local loc = tostring("1000m up.")
			_G_p_veh_tp_do(_GF_pos_nearby(player.get_player_coords(pid),"single_closest",10,"water","xy"),loc,"retain_speed",1000,pid)
			
		end
	end)_G_p_veh_tp_into_air.set_str_data(_G_p_veh_tp_into_air,{"50m up", "250m up", "1000m up"})


	
	_G_p_veh_tp_mean_out=menu.add_player_feature("TP high above", "action_value_str", _G_TeleportsP.id, function(feat,pid)
		if feat.value == 0 then
			local pos = math.random(1,#_GT_WP_TP_water)
			pos = _GT_WP_TP_water[pos]
			pos.z=2500
			local loc = tostring("Above the water.")
			_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
		elseif feat.value == 1 then
			local pos = v3(math.random(-750,750), math.random(-750,750), 2500)
			local loc = tostring("Above the city.")
			_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
		else
			local pos = v3(492, 5587, 2500)
			local loc = tostring("Above Mt. Chiliad.")
			_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
		end
	end)_G_p_veh_tp_mean_out.set_str_data(_G_p_veh_tp_mean_out,{"Above the water","Above the city","Above Mt. Chiliad"})
	
	_G_p_veh_tp_mean_in=menu.add_player_feature("TP to interior", "action_value_str", _G_TeleportsP.id, function(feat,pid)
		if feat.value == 0 then
			local pos = v3(math.random(-82, -67), math.random(-825, -812), math.random(312, 317))
			local loc = tostring("Maze bank glitch.")
			_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
		elseif feat.value == 1 then
			local pos = v3(math.random(129,142),math.random(-754,-743),math.random(259,261))
			local loc = tostring("FIB interior.")
			_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
		elseif feat.value == 2 then
			local pos = v3(math.random(-799, -757),math.random(318, 338),math.random(107, 127))
			local loc = tostring("Apartment glitch.")
			_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
		end
	end)_G_p_veh_tp_mean_in.set_str_data(_G_p_veh_tp_mean_in,{"Maze bank", "FIB interior","Apartment glitch"})
	
	_G_p_veh_tp_rand=menu.add_player_feature("TP to random location", "action_value_str", _G_TeleportsP.id, function(feat,pid)
		if feat.value == 0 then
			local pos = _GF_random_pos("land")
			local loc = tostring("Random land location.")
			_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
		elseif feat.value == 1 then
			local pos = _GF_random_pos("water")
			local loc = tostring("Random ocean location.")
			_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
		elseif feat.value == 2 then
			local pos = _GF_random_pos("anywhere")
			local loc = tostring("Random location.")
			_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
		end
	end)_G_p_veh_tp_rand.set_str_data(_G_p_veh_tp_rand,{"Land","Water","Anywhere"})
	
	_G_p_veh_tp_spcfc=menu.add_player_feature("TP to specific location", "action_value_str", _G_TeleportsP.id, function(feat,pid)
		local pos,loc
		if feat.value == 0 then
			pos = _GF_pos_nearby(v3(-1315,-3051,15),"single_random",5)
			loc = "LSIA."
		elseif feat.value == 1 then
			pos = _GF_pos_nearby(v3(1794.3,3262.3,43.7),"single_random",3)
			loc = "Sandy Shores Airfield."
		elseif feat.value == 2 then
			pos = _GF_pos_nearby(v3(2144.1,4809.3,42.4),"single_random",3)
			loc = "Mackenzie Airfield."
		elseif feat.value == 3 then
			_GF_sort_xy_pos(_GT_LSC_pos,player.get_player_coords(pid))
			pos = _GF_pos_nearby(_GT_LSC_pos[1],"single_random",3)
			loc = "Los Santos Custom."
		elseif feat.value == 4 then
			_GF_sort_xy_pos(_GT_ammu_pos,player.get_player_coords(pid))
			pos = _GF_pos_nearby(_GT_ammu_pos[1],"single_random",3)
			loc = "Ammunation."
		else
			pos = _GF_pos_nearby(v3(-1912.3,3042.7,34),"single_random",5)
			loc = "Fort Zancudo."
		end
		_G_p_veh_tp_do(pos,loc,"no_speed",0,pid)
	end)_G_p_veh_tp_spcfc.set_str_data(_G_p_veh_tp_spcfc,{"LSIA","Sandy Shores Airfield","Mackenzie Airfield","Los Santos Custom","Ammunation","Fort Zancudo"})
	
	menu.add_player_feature("TP forward", "action", _G_TeleportsP.id, function(f,pid)
		if not player.is_player_in_any_vehicle(pid) then
			menu.notify("".._GF_plyr_name(pid).."\nHas no vehicle.", _G_GeeVer, 4, 2)
		else
			local pos=player.get_player_coords(pid)
			local heading = player.get_player_heading(pid)
			local found, pos_forward = _GF_tp_forward(pos,heading)
			if found then
				if not _GF_ent_tp(_GT_plyr_info.veh[pid+1],pos_forward, 0 ,false) then
					menu.notify("".._GF_plyr_name(pid).."  -  ".._GF_model_name(_GT_plyr_info.veh[pid+1]).."\nFailed to get control of vehicle :(", _G_GeeVer, 4, 2)
				end
			else
				menu.notify("No saved TP location found :(", _G_GeeVer, 4, 2)
			end
		end
	end)
	
	menu.add_player_feature("TP to objective", "action", _G_TeleportsP.id, function(f,pid)
		_GF_tp_plyr_to_wp(pid,"objective")
	end)
	
	_G_p_veh_tp_to_wp=menu.add_player_feature("TP to waypoint v2", "action_value_str", _G_TeleportsP.id, function(f,pid)
		if f.value == 0 then
			_GF_tp_plyr_to_wp(pid,"anywhere")
		else
			_GF_tp_plyr_to_wp(pid,"no_water")
		end
	end)_G_p_veh_tp_to_wp.set_str_data(_G_p_veh_tp_to_wp,{"Anywhere", "Ignore water"})
	

	-----------------------------------------------------------------------------------------GEE-SKID
	-----------------------------------------------------------------------------------------GeeSkidP
	-----------------------------------------------------------------------------------------VehicleP
	-------------------------------------------------------------------------------------------Online
	-------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------

	_G_p_player_veh_zoom_stop2=menu.add_player_feature("Vehicle stop/zoom","value_str",_G_VehicleP.id,function(f,pid)
		local no_veh,name,veh=0, _GF_plyr_name(pid)
		while f.on do
			veh = _GT_plyr_info.veh[pid+1]
			system.yield(0)
			if _GF_valid_veh(veh) and _GF_ask_cntrl(veh) then
				if f.value == 0 then
					vehicle.set_vehicle_forward_speed(veh,0)
				elseif f.value == 1 then
					vehicle.set_vehicle_forward_speed(veh,100)
				end
			end
			if no_veh==0 and not _GF_valid_veh(veh) then
				menu.notify(""..name .. "" .. "" .. " - No vehicle.\nWaiting...", _G_GeeVer, 4, 2)
				no_veh=1
			end
		end
	end)
	_G_p_player_veh_zoom_stop2:set_str_data({
	"Stop",
	"Zoom Zoom"})
	
	_G_p_veh_float=menu.add_player_feature("Vehicle floats","value_str",_G_VehicleP.id,function(f, pid)
		while f.on do
			system.yield(0)
			if f.value == 0 then _GF_p_plyr_do("float",1000,25,pid,"no_hover")
			elseif f.value == 1 then _GF_p_plyr_do("float",1000,200,pid,"no_hover")
			end
		end
	end)
	_G_p_veh_float:set_str_data({
	"Slowly",
	"Rapture"})

	_G_p_veh_down=menu.add_player_feature("Vehicle in air comes down","value_str",_G_VehicleP.id,function(f, pid)
		while f.on do
			system.yield(0)
			if f.value == 0 then _GF_p_plyr_do("air_down",1000,-25,pid,"no_hover")
			elseif f.value == 1 then _GF_p_plyr_do("air_down",1000,-200,pid,"no_hover")
			end
		end
	end)			
	_G_p_veh_down:set_str_data({
	"Gently",
	"YEET"})
	
	_G_p_veh_up=menu.add_player_feature("Vehicle on ground goes up","value_str",_G_VehicleP.id,function(f, pid)
		while f.on do
			system.yield(0)
			if f.value == 0 then _GF_p_plyr_do("ground_up",1000,25,pid,"no_hover")
			elseif f.value == 1 then _GF_p_plyr_do("ground_up",1000,200,pid,"no_hover")
			end
		end
	end)			
	_G_p_veh_up:set_str_data({
	"Gently",
	"YEET"})
	
	_G_p_veh_grav=menu.add_player_feature("Vehicle gravity","value_str",_G_VehicleP.id,function(f, pid)
		while f.on do
			system.yield(0)
			if f.value == 0 then _GF_p_plyr_do("gravity",1000,true,pid,"no_hover")
			elseif f.value == 1 then _GF_p_plyr_do("gravity",1000,false,pid,"no_hover")
			end
		end
	end)			
	_G_p_veh_grav:set_str_data({
	"Give",
	"Remove"})

	
	_G_p_veh_god=menu.add_player_feature("Vehicle god","value_str",_G_VehicleP.id,function(f, pid)
		while f.on do
			system.yield(0)
			if f.value == 0 then _GF_p_plyr_do("god",1000,true,pid,"no_hover")
			elseif f.value == 1 then _GF_p_plyr_do("god",1000,false,pid,"no_hover")
			end
		end
	end)			
	_G_p_veh_god:set_str_data({
	"Give",
	"Remove"})
	
	_G_p_veh_health_tog=menu.add_player_feature("Vehicle Health","value_str",_G_VehicleP.id,function(f, pid)
		while f.on do
			system.yield(0)
			if f.value == 0 and _GF_p_plyr_do("damage",1000,nil,pid,"no_hover") then
				_GF_yield_while_true(f.on,5000)
			elseif f.value == 1 and _GF_p_plyr_do("destroy",1000,nil,pid,"no_hover") then
				_GF_yield_while_true(f.on,5000)
			end
		end
	end)			
	_G_p_veh_health_tog:set_str_data({
	"Damage",
	"Destroy"})
	
	_G_p_veh_auto_rpr=menu.add_player_feature("Auto-repair if less than %", "value_i", _G_VehicleP.id, function(f,pid)
		while f.on do
			_GF_yield_while_true(f.on,500)
			if _GF_plyr_in_seat(player.get_player_vehicle(pid),-1,pid) and _GF_get_veh_cmbnd_hlth_prcnt(player.get_player_vehicle(pid),true) < f.value then
				-- if _GF_request_ctrl(player.get_player_vehicle(pid),250) then 
					-- vehicle.set_vehicle_fixed(player.get_player_vehicle(pid))
				-- end
				_GF_rpr_request(player.get_player_vehicle(pid),250)
			end
		end
	end)_GF_set_feat_i_f(_G_p_veh_auto_rpr,50,100,5,75)
	
	_G_p_veh_health=menu.add_player_feature("Vehicle Health","action_value_str",_G_VehicleP.id,function(f, pid)
		if f.value == 0 then _GF_p_plyr_do("repair",2500,nil,pid)
		elseif f.value == 1 then _GF_p_plyr_do("damage",2500,nil,pid)
		elseif f.value == 2 then _GF_p_plyr_do("destroy",2500,nil,pid)
		end
	end)			
	_G_p_veh_health:set_str_data({
	"Repair",
	"Damage",
	"Destroy"})
	
	_G_p_veh_horn=menu.add_player_feature("Horn-boost","slider",_G_VehicleP.id,function(f,pid)
		while f.on do
			system.yield(25)
			if player.is_player_in_any_vehicle(pid) and not _GF_is_veh_alarm_on(player.get_player_vehicle(pid)) and _GF_is_veh_horn_on(player.get_player_vehicle(pid)) then
				if _GF_request_ctrl(player.get_player_vehicle(pid),333) then
					local speed = (entity.get_entity_speed(player.get_player_vehicle(pid)))
					speed = speed + (3+(40*f.value)-(0.02*speed))
					speed = speed * (1.01+f.value)
					vehicle.set_vehicle_forward_speed(player.get_player_vehicle(pid),speed)
					system.yield(333)
				end
			end
		end
	end)_GF_set_feat_i_f(_G_p_veh_horn,0,.1,.01,0)

	_G_p_veh_no_lock=menu.add_player_feature("Vehicle missile anti-lock","action_value_str",_G_VehicleP.id,function(f, pid)
		if f.value == 0 then _GF_p_plyr_do("anti_lock",2500,false,pid)
		elseif f.value == 1 then _GF_p_plyr_do("anti_lock",2500,true,pid)
		end
	end)
	_G_p_veh_no_lock:set_str_data({
	"Give",
	"Remove"})

	_G_p_veh_freeze=menu.add_player_feature("Freeze their vehicle","action_value_str",_G_VehicleP.id,function(f, pid)
		if f.value == 0 then _GF_p_plyr_do("freeze",2500,true,pid)
		elseif f.value == 1 then _GF_p_plyr_do("freeze",2500,false,pid)
		end
	end)
	_G_p_veh_freeze:set_str_data({
	"Freeze",
	"Un-Freeze"})
	
	_G_p_veh_upgrades_action2=menu.add_player_feature("Vehicle Upgrades","action_value_str",_G_VehicleModP.id,function(f,pid)
		if f.value == 0 then
			_GF_p_plyr_do("upgrades",2500,nil,pid)
		elseif f.value == 1 then
			_GF_p_plyr_do("upgrade_single",2500,"perf",pid)
		elseif f.value == 2 then
			_GF_p_plyr_do("upgrade_single",2500,"wheels",pid)
		elseif f.value == 3 then
			_GF_p_plyr_do("upgrade_single",2500,"f1",pid)
		elseif f.value == 4 then
			_GF_p_plyr_do("upgrade_single",2500,"headlights",pid)
		elseif f.value == 5 then
			_GF_p_plyr_do("upgrade_single",2500,"neons",pid)
		elseif f.value == 6 then
			_GF_p_plyr_do("upgrade_single",2500,"paint",pid)
		elseif f.value == 7 then
			_GF_p_plyr_do("upgrade_single",2500,"livery",pid)
		elseif f.value == 8 then
			_GF_p_plyr_do("upgrade_single",2500,"weapons",pid)
		end
	end)_G_p_veh_upgrades_action2:set_str_data({"Everything", "Performance mods","Wheels/Tires","Give F1 Wheels","Headlights","Neon lights","Paintjob","Livery","Weapons"})

	_G_p_plyr_veh_force2=menu.add_player_feature("Vehicle max speed/torque %","action_value_i",_G_VehicleModP.id,function(f,pid)
		_GF_p_plyr_do("speed_torque",2500,f.value/100,pid)
	end)_G_p_plyr_veh_force2.max,_G_p_plyr_veh_force2.min,_G_p_plyr_veh_force2.mod=700,0,5		
	_G_p_plyr_veh_force2.value=100
	
	_G_p_veh_accel_fuck=menu.add_player_feature("Vehicle acceleration is","action_value_str",_G_VehicleP.id,function(f,pid)
		if f.value == 0 then _GF_p_plyr_do("speed_torque",2500,-10,pid) else _GF_p_plyr_do("speed_torque",2500,100,pid)	end
	end)_G_p_veh_accel_fuck.set_str_data(_G_p_veh_accel_fuck,{"Fucked", "Normal"})
	
	-- _G_p_veh_rvrs_2=menu.add_player_feature("Vehicle controls inverted","action_value_str",_G_VehicleP.id,function(f,pid) -- only affect you driving a vehicle
		-- if player.is_player_in_any_vehicle(pid) and _GF_request_ctrl(player.get_player_vehicle(pid), 1000) then
			-- native.call(0x5B91B229243351A8,player.get_player_vehicle(pid),f.value)
		-- end
	-- end)_G_p_veh_rvrs_2.set_str_data(_G_p_veh_rvrs_2,{"False", "True"})
		
	menu.add_player_feature("Fuck vehicle", "action", _G_VehicleP.id, function(f,pid)
		_GF_p_plyr_do("fuck",2500,nil,pid)
	end)
				
	menu.add_player_feature("Remove helicopter rotors", "action", _G_VehicleP.id, function(f,pid)
		_GF_p_plyr_do("remove_rotor",2500,nil,pid)
	end)
	
	menu.add_player_feature("Remove vehicle weapons", "action", _G_VehicleP.id, function(f,pid)
		_GF_p_plyr_do("rmv_veh_weap",2500,nil,pid)
	end)
	
	menu.add_player_feature("Vehicle Kick", "action", _G_VehicleP.id, function(f,pid)
		_GF_plyr_veh_kick(pid, true)
	end)
	
	_G_p_veh_tire=menu.add_player_feature("Tire health", "action_value_str", _G_VehicleP.id, function(f,pid)
		if f.value == 0 then _GF_p_plyr_do("pop_tires",2500,nil,pid)
		else _GF_p_plyr_do("unpop_tires",2500,nil,pid)
		end
	end)_G_p_veh_tire.set_str_data(_G_p_veh_tire,{"Pop", "Repair"})

	menu.add_player_feature("Vehicle flip upside down", "action", _G_VehicleP.id, function(f,pid)
		_GF_p_plyr_do("flip_up",2500,nil,pid)
	end)
	
	_G_p_veh_visible=menu.add_player_feature("Vehicle visibility", "action_value_str", _G_VehicleP.id, function(f,pid)
		if f.value==0 then _GF_p_plyr_do("visible",2500,false,pid)
		else _GF_p_plyr_do("visible",2500,true,pid)
		end
	end)_G_p_veh_visible.set_str_data(_G_p_veh_visible,{"Invisible", "Visible"})
	
	_G_p_veh_weapons=menu.add_player_feature("Vehicle weapons", "action_value_str", _G_VehicleModP.id, function(f,pid)
		if f.value==0 then _GF_p_plyr_do("best_weap",2500,nil,pid)
		else _GF_p_plyr_do("worst_weap",2500,nil,pid)
		end
	end)_G_p_veh_weapons.set_str_data(_G_p_veh_weapons,{"Best", "Worst"})

	_G_p_veh_armor=menu.add_player_feature("Vehicle armor", "action_value_str", _G_VehicleModP.id, function(f,pid)
		if f.value==0 then _GF_p_plyr_do("best_armor",2500,nil,pid)
		else _GF_p_plyr_do("worst_armor",2500,nil,pid)
		end
	end)_G_p_veh_armor.set_str_data(_G_p_veh_armor,{"Best", "Worst"})
	
	_G_p_countermeasr=menu.add_player_feature("Countermeasures", "action_value_str", _G_VehicleModP.id, function(f,pid)
		if f.value == 0 then _GF_p_plyr_do("cntrmsrs",2500,f.value,pid)
		elseif f.value == 1 then _GF_p_plyr_do("cntrmsrs",2500,f.value,pid)
		elseif f.value == 2 then _GF_p_plyr_do("cntrmsrs",2500,f.value,pid)
		end 
	end)_G_p_countermeasr.set_str_data(_G_p_countermeasr,{"Chaff", "Flare", "None"})

	--mk2 mod6 Countermeasures
	--helo/planes mod1 Countermeasures
	--0 chaff Countermeasures
	--1 flare Countermeasures
	--2 none Countermeasures
	
	_G_p_air_bombs=menu.add_player_feature("Bombs", "action_value_str", _G_VehicleModP.id, function(f,pid)
		if f.value == 0 then _GF_p_plyr_do("bombs",2500,0,pid)
		elseif f.value == 1 then _GF_p_plyr_do("bombs",2500,3,pid)
		elseif f.value == 2 then _GF_p_plyr_do("bombs",2500,4,pid)
		end 
	end)_G_p_air_bombs.set_str_data(_G_p_air_bombs,{"Explosive", "Cluster", "None"})

	--helo/planes mod9 Bombs
	--0 explosive  ---------- Bombs
	--1 incendiary --doesnt work on some vehicles Bombs
	--2 gas --doesnt work on some vehicles Bombs
	--3 cluster  -------------Bombs
	--4 none  ---------------Bombs


	
end