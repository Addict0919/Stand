util.require_natives(1651208000)
uncageMe = true
deleteMissionEnts = false
notification = true
notificationMission = true
waitDelay = 0

function dist(pos1, pos2)
	return math.sqrt((pos1.x - pos2.x)*(pos1.x - pos2.x)+(pos1.y - pos2.y)*(pos1.y - pos2.y)+(pos1.z - pos2.z)*(pos1.z - pos2.z))
end

function deleteNearby(units)
	local allObjs = {}
	for key, value in pairs(entities.get_all_objects_as_handles()) do
		allObjs[#allObjs+1] = value
	end
	for key, value in pairs(entities.get_all_vehicles_as_handles()) do
		allObjs[#allObjs+1] = value
	end
	for key, value in pairs(entities.get_all_peds_as_handles()) do
		allObjs[#allObjs+1] = value
	end
	for key, value in pairs(entities.get_all_pickups_as_handles()) do
		allObjs[#allObjs+1] = value
	end
	
	for key, value in pairs(allObjs) do
		if value ~= PLAYER.PLAYER_PED_ID()
		and value ~= entities.get_user_vehicle_as_handle() 
		and value ~= WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(PLAYER.PLAYER_PED_ID(), 0) 
		and ENTITY.GET_ENTITY_ATTACHED_TO(value) != WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(PLAYER.PLAYER_PED_ID(), 0) then
			if dist(ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID()),ENTITY.GET_ENTITY_COORDS(value)) < units then
				ENTITY.SET_ENTITY_COORDS(value,0,0,0,true,false,false,true)
				entities.delete_by_handle(value)
			end
		end
	end
end

function uncage()
	entity = players.user_ped()
	unarmed = not WEAPON.IS_PED_ARMED(ped, -1)
	weapon = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(entity, 0)
	objects = entities.get_all_objects_as_handles()
	for key, value in pairs(objects) do
		if ENTITY.GET_ENTITY_POPULATION_TYPE(value) == 7
		and (unarmed or (value != weapon and ENTITY.GET_ENTITY_ATTACHED_TO(value) != weapon))
		and ((dist(ENTITY.GET_ENTITY_COORDS(entity), ENTITY.GET_ENTITY_COORDS(value)) < 0.5) or (ENTITY.IS_ENTITY_TOUCHING_ENTITY(entity,value))
		and not ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(value,entity)) then
			if deleteMissionEnts or not ENTITY.IS_ENTITY_A_MISSION_ENTITY(entity) then
				if notification then util.toast("Deleting cage(s) with model " .. ENTITY.GET_ENTITY_MODEL(value)) end
				for key2, value2 in pairs(objects) do
					if (ENTITY.GET_ENTITY_MODEL(value2) == ENTITY.GET_ENTITY_MODEL(value)) then 
						entities.delete_by_handle(value2) 
					end
				end
			elseif notificationMission then util.toast("Uncage Me: You might be in a cage! Turn on mission entities deletion to delete this cage. If you do not wish to see this any more, you can turn it off in Uncage Me notification settings")
			end
		end
	end
end

notifications = menu.list(menu.my_root(), "Notifications", {"uncagemenotifications"}, "Notification settings for this script")

menu.toggle(notifications, "Cage deleted", {"cagenotifs"}, "Show notification when a cage is removed", function(toggle)
	notification = toggle
end, true)

menu.toggle(notifications, "Suspected mission entity cage", {"cagemissionnotifs"}, "Show notification when suspected to be in a mission entity cage", function(toggle)
	notificationMission = toggle
end, true)

menu.divider(menu.my_root(), "Automatic Options")

menu.toggle(menu.my_root(), "Delete mission entities?", {"uncagemissionents"}, "Allows cage checks to delete mission entities", function(toggle)
	deleteMissionEnts = toggle
	if toggle then 
		util.toast("UncageMe: Warning, this script can now delete mission entities. Leave this option off unless necessary")
	end
end)

menu.toggle(menu.my_root(), "Automatic uncage", {"autouncage"}, "Automatically deletes cages you are in", function(toggle)
	uncageMe = toggle
	if toggle then 
		util.toast("UncageMe: Automatic removal of cages enabled!")
	end
end, true)

menu.slider(menu.my_root(), "Automatic uncage delay", {"uncagedelay"}, "Delay between each check for cages. Lower values will delete cages more frequently, but will increase lag caused by this script", 0, 100, 10, 1, function(value)
	waitDelay = value
end)

menu.divider(menu.my_root(), "Manual Options")

menu.action(menu.my_root(), "Manual uncage", {"manualuncage"}, "Manually deletes cages you are in", function()
	uncage()
end)

menu.action(menu.my_root(), "Delete all nearby objects (Small range)", {"deletenearbysmall"}, "Just in case uncage doesn't work", function()
	deleteNearby(10)
end)

menu.action(menu.my_root(), "Delete all nearby objects (Large range)", {"deletenearbylarge"}, "Just in case uncage doesn't work", function()
	deleteNearby(50)
end)

util.toast("\"Uncage Me\" script by Gpax971 has been loaded. Be warned that this script can interfere with missions, so turn it off if you are worried")

while true do
	if uncageMe then 
		uncage(players.user_ped())
	end
	util.yield(waitDelay)
end