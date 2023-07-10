require('natives-1663599433-uno')
util.keep_running()

local _top_divider = menu.divider(menu.my_root(), 'Ped Cash')
local _fixed_amount_dropped = menu.slider(menu.my_root(), 'Fixed Amount', {'pcfixed'}, 'Fixed amount of cash dropped by peds', 1, 2000, 2000, 1, function(val, prev, click) end)
local _minimum_random_dropped = menu.slider(menu.my_root(), 'Minimum Random', {'pcrmin'}, 'Minimum random amount of cash dropped by peds', 1, 1998, 500, 1, function(val, prev, click) end)
local _maximum_random_dropped = menu.slider(menu.my_root(), 'Maximum Random', {'pcrmax'}, 'Maximum random amount of cash dropped by peds', 1, 2000, 2000, 1, function(val, prev, click) end)
local _toggle_randomization = menu.toggle(menu.my_root(), 'Enable Randomization', {'pcrand'}, 'Enable randomization of the amount of cash dropped by peds', function(val, prev, click) end, true)
local _toggle_ped_drops = menu.toggle(menu.my_root(), 'Enable Ped Drops', {'pcdrop'}, 'Enable the modifcation of ped cash dropped', function(val, prev, click) end, true)

PED.SET_AMBIENT_PEDS_DROP_MONEY(true)

while (SCRIPT_CAN_CONTINUE) do
	menu.set_max_value(_minimum_random_dropped, menu.get_value(_maximum_random_dropped) >= 1998 ? 1998 : menu.get_value(_maximum_random_dropped) - 1)
	menu.set_min_value(_maximum_random_dropped, menu.get_value(_minimum_random_dropped) + 1)
	
	if menu.get_value(_toggle_ped_drops) then
		local _peds = entities.get_all_peds_as_handles()
		
		if _peds then
			for _index, _ped in pairs(_peds) do
				if _ped and not PED.IS_PED_A_PLAYER(_ped) then
					if menu.get_value(_toggle_randomization) then
						PED.SET_PED_MONEY(_ped, MISC.GET_RANDOM_INT_IN_RANGE(menu.get_value(_minimum_random_dropped), menu.get_value(_maximum_random_dropped)))
					else
						PED.SET_PED_MONEY(_ped, menu.get_value(_fixed_amount_dropped))
					end
				end
			end
		end
	end
	
	util.yield()
end