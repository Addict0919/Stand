require("natives-1614644776")
script = {}
removes = {}
removeFreq = 2000

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

function getAllObjects()
	local out = {}
		for key, value in pairs(util.get_all_objects()) do
			out[#out+1] = value
		end
		for key, value in pairs(util.get_all_vehicles()) do
			out[#out+1] = value
		end
		for key, value in pairs(util.get_all_peds()) do
			out[#out+1] = value
		end
		for key, value in pairs(util.get_all_pickups()) do
			out[#out+1] = value
		end
	return out
	
end

function removeObjectsFromPlayer(pid)
	ped = PLAYER.GET_PLAYER_PED(pid)
	if ped then
		for key, value in pairs(getAllObjects()) do
			if ped == ENTITY.GET_ENTITY_ATTACHED_TO(value) then
				if WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped,false) ~= value then
				RequestControlOfEnt(value)
				hash = ENTITY.GET_ENTITY_MODEL(value)
				ENTITY.DETACH_ENTITY(value, true,false)
				ENTITY.SET_ENTITY_COORDS(value,0,0,0,true,false,false,true)
				util.delete_entity(value)
				util.toast("Deleting object "..hash.." from "..PLAYER.GET_PLAYER_NAME(pid))
				end
			end
		end
	end
end

menu.toggle(menu.my_root(),"Remove objects from self (loop)", {"removeselfloop"}, "",function(toggle)
	removes[players.user()] = toggle
end)

menu.action(menu.my_root(),"Remove objects from self", {"removeplayerloop"}, "",function()
	removeObjectsFromPlayer(PLAYER.PLAYER_ID())
end)

menu.click_slider(menu.my_root(),"Loop Delay", {"removeloopdelay"}, "", 100, 5000, 2000, 100, function(value)
	util.toast("Now removing objects every " .. (value / 1000) .. " seconds")
	removeFreq = value
end)

GenerateFeatures = function(pid)
	menu.toggle(menu.player_root(pid),"Remove objects from player (loop)", {"removeplayerloop"}, "",function(toggle)
		removes[pid] = toggle
	end)
	
	menu.action(menu.player_root(pid),"Remove objects from player", {"removeplayerloop"}, "",function()
		removeObjectsFromPlayer(pid)
	end)
end

for pid = 0,30 do 
	table.insert(removes, false)
	if players.exists(pid) then
		GenerateFeatures(pid)
	end
end

players.on_join(function(pid)
	GenerateFeatures(pid)
	removes[pid]=false
end)

while true do
	for pid = 0, 30 do
		if players.exists(pid) then
			if removes[pid] then
				removeObjectsFromPlayer(pid)
				util.yield()
			end
		end
	end
	util.yield(removeFreq)
end