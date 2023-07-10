require("natives-1614644776")
script = {}

GenerateFeatures = function(pid)
menu.action(menu.player_root(pid),"Ladder", {}, "",function(on_click)

    local playerped3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
	while not STREAMING.HAS_MODEL_LOADED(1888301071) and not STREAMING.HAS_MODEL_LOADED(-1951226014)do
		STREAMING.REQUEST_MODEL(1888301071)	
		STREAMING.REQUEST_MODEL(-1951226014)	
		util.yield()
	end
    local attach_object1132 = OBJECT.CREATE_OBJECT(1888301071, 1.55,3.35,0, true, true, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(attach_object1132, playerped3, 0, 1.55, 3.35, 0, 1.55, 3.35,0, false, true, true, false, 0, false)

    ENTITY.SET_ENTITY_VISIBLE(attach_object1132, false)

    attach_object1132 = OBJECT.CREATE_OBJECT(1888301071, 1.55,3.35,1.55, true, true, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(attach_object1132, playerped3, 0, 1.55,3.35,1.55, 1.55,3.35,1.55, false, true, true, false, 0, false)

	ENTITY.SET_ENTITY_VISIBLE(attach_object1132, false)

    attach_object1132 = OBJECT.CREATE_OBJECT(-1951226014, 0,0,- 2.00, true, true, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(attach_object1132, playerped3, 0, 0,0,- 2.00, 0,0,- 2.00, false, true, true, false, 0, false)

    ENTITY.SET_ENTITY_VISIBLE(attach_object1132, false)

    attach_object1132 = OBJECT.CREATE_OBJECT(1888301071, 1.55,3.35,0, true, true, false)

    local rot = ENTITY.GET_ENTITY_ROTATION(attach_object1132)
    rot.y = 180
    ENTITY.SET_ENTITY_ROTATION(attach_object1132, rot.x,rot.y,rot.z,1,true)

    ENTITY.ATTACH_ENTITY_TO_ENTITY(attach_object1132, playerped3, 0,1.55, 3.35,0, 1.55, 3.35,0, false, true, true, false, 0, false)

    
    ENTITY.SET_ENTITY_VISIBLE(attach_object1132, false)

    attach_object1132 = OBJECT.CREATE_OBJECT(1888301071, 0.45,3.35,0, true, true, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(attach_object1132, playerped3, 0, 0.45,3.35,0, 0.45,3.35,0, false, true, true, false, 0, false)

    ENTITY.SET_ENTITY_VISIBLE(attach_object1132, false)


    attach_object1132 = OBJECT.CREATE_OBJECT(1888301071, 0.80,3.35,0, true, true, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(attach_object1132, playerped3, 0, 0.80,3.35,0, 0.80,3.35,0, false, true, true, false, 0, false)

    ENTITY.SET_ENTITY_VISIBLE(attach_object1132, false)

    attach_object1132 = OBJECT.CREATE_OBJECT(1888301071, 0.80,3.35,- 2.00, true, true, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(attach_object1132, playerped3, 0, 0.80,3.35,- 2.00, 0.80,3.35,- 2.00, false, true, true, false, 0, false)
    
    ENTITY.SET_ENTITY_VISIBLE(attach_object1132, false)


    attach_object1132 = OBJECT.CREATE_OBJECT(1888301071, 1.30,3.95,0, true, true, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(attach_object1132, playerped3, 0, 1.30,3.95,0, 1.30,3.95,0, false, true, true, false, 0, false)

    ENTITY.SET_ENTITY_VISIBLE(attach_object1132, false)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(1888301071)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(-1951226014)
end)

end

for pid = 0,30 do -- This is where the features are being applied 
	if players.exists(pid) then -- we do a check to see if they are valid then if they are then we go through our GenerateFeatures function to create the features for every valid player
		GenerateFeatures(pid)
	end
end

players.on_join(GenerateFeatures) -- refer to docs but this is creating features for every new player that joins the lobby 
	
while true do
	util.yield()
end

