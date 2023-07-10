util.keep_running()
util.require_natives("natives-1663599433-uno")
util.require_natives("natives-1640181023")
util.require_natives("natives-1651208000")
util.require_natives("natives-1663599433")


function speed(toggle)
	VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 9999999, toggle) 
end

-- [ Main Loop ] --

function loop()
	if PAD.IS_CONTROL_PRESSED(2, 47) then -- Letter is pressed "G"
		speed(true)
	else
		speed(false)
	end
end

function main()
	util.notify_map("Menu Base Loaded!")
	while true do
		loop()
		util.yield()
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

menu.action(menu.my_root(),"Addict boost", {"Addictboosts"}, "Sets max speed of vehicle to 9999999 better for bikes",function()
	local vehicle = get_player_veh(pid,true)
	if vehicle then
		speed(toggle)
	end
end, nil, nil, COMMANDPERM_FRIENDLY)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
util.on_stop(function()
	util.toast("Later pussy (Yawn)")
end)