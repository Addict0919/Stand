local function SpawnObjFromName()
    local status, inputString = input.get("Input A Object Name", "", 100, 0)    
    if status == eInputResponse.IR_SUCCESS then
        local iHash = gameplay.get_hash_key(inputString)

        if streaming.is_model_valid(iHash) then
            return object.create_world_object(iHash, player.get_player_coords(player.player_id()), true, false)
         else 
            func.notification("invalid model was input")
        end
    end
end

local function SpawnObj(val, pid)
    pid = pid or player.player_id()
    if val ~= nil then
        return object.create_object(gameplay.get_hash_key(objects[val+1]), player.get_player_coords(pid), true, false)
    end
end

local function SpawnWrld(val, pid)
    pid = pid or player.player_id()
    if val ~= nil then
        local wrld = object.create_world_object(gameplay.get_hash_key(worldObjects[val+1]), player.get_player_coords(pid), true, false)
        entity.freeze_entity(wrld, true)
		return wrld
    end
end

local function SpawnProp(val)
    if val ~= nil then
        local o = object.create_world_object(gameplay.get_hash_key(objects[val+1]), player.get_player_coords(player.player_id()), true, false)
		streaming.set_model_as_no_longer_needed(gameplay.get_hash_key(objects[val+1])) 
		return o
    end 
end

local function SpawnPed(val, health, pid)
    health = health or 500
    pid = pid or player.player_id()

    if val ~= nil then
        local hash = gameplay.get_hash_key(pedList[val+1])

        streaming.request_model(hash)
    
        while(not streaming.has_model_loaded(hash) and utils.time_ms() + 450 > utils.time_ms()) do
            system.wait(0)
        end

        if(streaming.has_model_loaded(hash)) then
            local p = ped.create_ped(26, hash, player.get_player_coords(pid), 0, true, false)
            ped.set_ped_health(p, tonumber(health))
			streaming.set_model_as_no_longer_needed(hash) 
			return p
        end
		return 0
    end
end

local function SpawnAnimal(val, health, pid)
    health = health or 100
    pid = pid or player.player_id()

    if val ~= nil then
        local hash = gameplay.get_hash_key(animalsPeds[val+1])

        streaming.request_model(hash)
    
        while(not streaming.has_model_loaded(hash) and utils.time_ms() + 450 > utils.time_ms()) do
            system.wait(0)
        end

        if(streaming.has_model_loaded(hash)) then
            local p = ped.create_ped(28, hash, player.get_player_coords(player.player_id()), 0, true, false)
            ped.set_ped_health(p, tonumber(health))
            streaming.set_model_as_no_longer_needed(hash) 
            return p
        end

    end
end

local function SpawnPedFromName()
    local input, i = input.get("Input A Ped Name", "", 100, 0)

    if input == 1 then
       return HANDLER_CONTINUE
   end
   if input == 2 then
       return HANDLER_POP
   end
 
    local hash = gameplay.get_hash_key(i)
 
    streaming.request_model(hash)
    while(not streaming.has_model_loaded(hash) and utils.time_ms() + 450 > utils.time_ms()) do
       system.wait(0)
    end
 
   return ped.create_ped(2, hash, player.get_player_coords(player.player_id()), 0, true, false)
end

local function getPedFromHash(hash)
    for i=1, #pedList do
        if hash == gameplay.get_hash_key(pedList[i]) then
            return pedList[i]
        end
    end
end

local function getObjectFromHash(hash)
    for i=1, #objects do
        if hash == gameplay.get_hash_key(objects[i]) then
            return objects[i]
        end
    end
end

local spawnerOpt = func.add_feature("Spawner", "parent", 0)
local editorOpt = func.add_feature("Editor", "parent", spawnerOpt.id)

local spawnedEditor ={objects = {}, worldObjects = {},
props = {}, peds = {}, animals = {}}

local objectFeat = func.add_feature("Objects", "action_value_str", editorOpt.id, function(feat)
	spawnedEditor.objects[#spawnedEditor.objects+1] = SpawnObj(feat.value)
end)
objectFeat:set_str_data(objects)

objectFeat.hl_func = function(feat, data)
	while feat.is_highlighted and stuff.menuToggle  do
        local featData = {
            {"Hash:", gameplay.get_hash_key(objects[feat.value+1])}, 
            {"Hash (Hex):", string.format("%x", gameplay.get_hash_key(objects[feat.value+1]) * 255)}
        }
        func.draw_side_window(
            tostring(objects[feat.value+1]),
						featData,
						v2((stuff.menuData.x + stuff.menuData.width + stuff.menuData.side_window.offset.x)*2-1, (stuff.menuData.y + stuff.menuData.side_window.offset.y)*-2+1),
						0x96000000,
						stuff.menuData.side_window.width, stuff.menuData.side_window.spacing, stuff.menuData.side_window.padding,
						0xDCFFFFFF,
						v2()
					)
		system.wait(0)
	end
end
--
--objectFeat.hl_func = function(feat, data)
--	if feat.is_highlighted then
--        local ob = SpawnObj(feat.value)
--        entity.set_entity_alpha(ob, 60, false)
--	end
--end


local worldObjectsFeat = func.add_feature("World Objects", "action_value_str", editorOpt.id, function(feat)
	spawnedEditor.objects[#spawnedEditor.objects+1] = SpawnWrld(feat.value)
end)

worldObjectsFeat:set_str_data(worldObjects)

worldObjectsFeat.hl_func = function(feat, data)
	while feat.is_highlighted and stuff.menuToggle do
        local featData = {
            {"Hash:", gameplay.get_hash_key(worldObjects[feat.value+1])}, 
            {"Hash (Hex):", string.format("%x", gameplay.get_hash_key(worldObjects[feat.value+1]) * 255)}
        }
        func.draw_side_window(
            tostring(worldObjects[feat.value+1]),
						featData,
						v2((stuff.menuData.x + stuff.menuData.width + stuff.menuData.side_window.offset.x)*2-1, (stuff.menuData.y + stuff.menuData.side_window.offset.y)*-2+1),
						0x96000000,
						stuff.menuData.side_window.width, stuff.menuData.side_window.spacing, stuff.menuData.side_window.padding,
						0xDCFFFFFF,
						v2()
					)
		system.wait(0)
	end
end

local filteredObjs = {}
func.add_feature("Filter Objects", "action", editorOpt.id, function(feat)
    local status, msg = input.get("Filter objects", "", 100, 0)    
    if status == eInputResponse.IR_SUCCESS then
        msg = msg:lower()
        for i=1, #objects do
            if string.find(objects[i], msg) then
                if i % 100 == 0 then
                    system.yield(0)
                end
                filteredObjs[#filteredObjs+1] = objects[i]
            end            
        end
    end
end)

local filteredFeat = func.add_feature("Filtered Objects", "parent", editorOpt.id)

local filteredFeats = {}
local function createFiltered()
    for i=1, #filteredObjs do
        local obj = filteredObjs[i]
        if not filteredFeats[obj] then
            filteredFeats[obj] = func.add_feature(filteredObjs[i], "action", filteredFeat.id, function()
                spawnedEditor.objects[#spawnedEditor.objects+1] = object.create_object(gameplay.get_hash_key(filteredObjs[stuff.scroll]), player.get_player_coords(player.player_id()), true, false)
            end)
        end
    end
end

func.add_feature("Spawn Objects By Name", "action", editorOpt.id, function(feat)
    spawnedEditor.objects[#spawnedEditor.objects+1] = SpawnObjFromName()
end)

func.add_feature("Props", "action_value_str", editorOpt.id, function(feat)
	spawnedEditor.objects[#spawnedEditor.objects+1] = SpawnProp(feat.value)
end):set_str_data(props)


func.add_feature("Spawn Ped By Name", "action", editorOpt.id, function(feat)
	spawnedEditor.peds[#spawnedEditor.peds+1] = SpawnPedFromName()
end)

func.add_feature("Peds", "action_value_str", editorOpt.id, function(feat)
	spawnedEditor.peds[#spawnedEditor.peds+1] = SpawnPed(feat.value)
end):set_str_data(pedList)

func.add_feature("Animals", "action_value_str", editorOpt.id, function(feat)
	spawnedEditor.peds[#spawnedEditor.peds+1] = SpawnAnimal(feat.value)
end):set_str_data(animalsPeds)

local spawnedEnts = func.add_feature("Spawned Entities", "parent", spawnerOpt.id)
local spawnedObjs = func.add_feature("Spawned Objects", "parent", spawnedEnts.id)
local spawnedPeds = func.add_feature("Spawned Peds", "parent", spawnedEnts.id)

local spawnedObjFeats = {}
local spawnedPedFeats = {}

local function deleteCallback(feat, data)
    entity.delete_entity(data)
    func.delete_feature(feat.parent)
end

local function freezeEntCallback(f, data)
    entity.freeze_entity(data, f.on)
end

local function outfitCallback(feat, data)
    ped.set_ped_component_variation(data, 11, math.random(0, 34), 0, 0) -- tops
    ped.set_ped_component_variation(data, 4, math.random(0, 34), 0, 0) -- legs
end

local function teleportToMeCallback(feat, data)
    local entCoords = player.get_player_coords(player.player_id())
    entity.set_entity_coords_no_offset(data, entCoords)
end

local function teleportToEntityCallback(feat, data)
    local entCoords = entity.get_entity_coords(data)
    entity.set_entity_coords_no_offset(player.get_player_ped(player.player_id()), entCoords)
end

local function moveXCallback(f, data)
    local entCoords = entity.get_entity_coords(data)
    entity.set_entity_coords_no_offset(data, v3(entCoords.x + f.value, entCoords.y, entCoords.z))
end

local function moveYCallback(f, data)
    local entCoords = entity.get_entity_coords(data)
    entity.set_entity_coords_no_offset(data, v3(entCoords.x, entCoords.y + f.value, entCoords.z))
end

local function PitchCallback(f, data)
    entity.set_entity_rotation(data, v3(f.value, entity.get_entity_rotation(data).y, entity.get_entity_rotation(data).z))
    return entity.get_entity_rotation(data)
end

local function YawCallback(f, data)
    entity.set_entity_rotation(data, v3(entity.get_entity_rotation(data).x, entity.get_entity_rotation(data).y, f.value))
    return entity.get_entity_rotation(data)
end

local function RollCallback(f, data)
    entity.set_entity_rotation(data, v3(entity.get_entity_rotation(data).x, f.value, entity.get_entity_rotation(data).z))
    return entity.get_entity_rotation(data)
end

local function moveZCallback(f, data)
    local entCoords = entity.get_entity_coords(data)
    entity.set_entity_coords_no_offset(data, v3(entCoords.x, entCoords.y, entCoords.z + f.value))
end

local function getPos(data)
    return entity.get_entity_coords(data)
end

local function getRot(data)
    return entity.get_entity_rotation(data)
end

local function createObjectOptions()
    for i=1, #spawnedEditor.objects do
        local obj = spawnedEditor.objects[i]
        if obj ~= nil then
            if not spawnedObjFeats[obj] then
                spawnedObjFeats[obj] = func.add_feature(tostring(getObjectFromHash(entity.get_entity_model_hash(obj))), "parent", spawnedObjs.id)
                          
                func.add_feature("Teleport to me", "action", spawnedObjFeats[obj].id, teleportToMeCallback).data = obj
                func.add_feature("Teleport to entity", "action", spawnedObjFeats[obj].id, teleportToEntityCallback).data = obj
               
                local sSens = func.add_feature("Scroll Sensitivity", "autoaction_value_f", spawnedObjFeats[obj].id, moveXCallback)
                sSens.data = obj
                sSens.mod = 0.5
                sSens.min = 0.0
                sSens.max = 1.0
                sSens.value = 0.1
               
                local pAlpha = func.add_feature("Move x", "autoaction_value_f", spawnedObjFeats[obj].id, moveXCallback)
                pAlpha.data = obj
                pAlpha.mod = sSens.value
                pAlpha.min = -214748364.0
                pAlpha.max = 214748364.0
                pAlpha.value = getPos(obj).x

                local entY = func.add_feature("Move y", "autoaction_value_f", spawnedObjFeats[obj].id, moveYCallback)
                entY.data = obj
                entY.mod = sSens.value
                entY.min = -214748364.0
                entY.max = 214748364.0
                entY.value = getPos(obj).y
                
                local moveZ = func.add_feature("Move z", "autoaction_value_f", spawnedObjFeats[obj].id, moveZCallback)
                moveZ.data = obj
                moveZ.mod = sSens.value
                moveZ.min = -214748364.0
                moveZ.max = 214748364.0
                moveZ.value = getPos(obj).z

                local pitch = func.add_feature("Pitch", "autoaction_value_f", spawnedObjFeats[obj].id, PitchCallback)
                pitch.data = obj
                pitch.mod = sSens.value
                pitch.min = -214748364.0
                pitch.max = 214748364.0
                pitch.value = getRot(obj).x
                
                local yaw = func.add_feature("Yaw", "autoaction_value_f", spawnedObjFeats[obj].id, YawCallback)
                yaw.data = obj
                yaw.mod = sSens.value
                yaw.min = -214748364.0
                yaw.max = 214748364.0
                yaw.value = getRot(obj).y
                
                local entZ = func.add_feature("Roll", "autoaction_value_f", spawnedObjFeats[obj].id, RollCallback)
                entZ.data = obj
                entZ.mod = sSens.value
                entZ.min = -214748364.0
                entZ.max = 214748364.0
                entZ.value = getRot(obj).z

                func.add_feature("Freeze", "toggle", spawnedObjFeats[obj].id, freezeEntCallback).data = obj
                func.add_feature("Delete", "action", spawnedObjFeats[obj].id, deleteCallback).data = obj
            end
        end 
    end
end

local function createPedOptions()
    for i=1, #spawnedEditor.peds do
        local ped = spawnedEditor.peds[i]
        if ped ~= nil then
            if not spawnedPedFeats[ped] then
                spawnedPedFeats[ped] = func.add_feature(tostring(getPedFromHash(entity.get_entity_model_hash(ped))), "parent", spawnedPeds.id)

                func.add_feature("Teleport to me", "action", spawnedPedFeats[ped].id, teleportToMeCallback).data = ped
                func.add_feature("Teleport to entity", "action", spawnedPedFeats[ped].id, teleportToEntityCallback).data = ped

                local pAlpha = func.add_feature("Move x", "autoaction_value_f", spawnedPedFeats[ped].id, moveXCallback)
                pAlpha.data = ped
                pAlpha.mod = 1.0
                pAlpha.min = -214748364.0
                pAlpha.max = 214748364.0
                pAlpha.value = getPos(ped).x      
                
                local entY = func.add_feature("Move y", "autoaction_value_f", spawnedPedFeats[ped].id, moveYCallback)
                entY.data = ped
                entY.mod = 0.5
                entY.min = -214748364.0
                entY.max = 214748364.0
                entY.value = getPos(ped).y
                
                local entZ = func.add_feature("Move z", "autoaction_value_f", spawnedPedFeats[ped].id, moveZCallback)
                entZ.data = ped
                entZ.mod = 1.0
                entZ.min = -214748364.0
                entZ.max = 214748364.0
                entZ.value = getPos(ped).z
                
                func.add_feature("Apply random outfit", "action", spawnedPedFeats[ped].id, outfitCallback).data = ped
                func.add_feature("Freeze", "toggle", spawnedPedFeats[ped].id, freezeEntCallback).data = ped
                func.add_feature("Delete", "action", spawnedPedFeats[ped].id, deleteCallback).data = ped
            end
        end 
    end
end

stuff.threads[#stuff.threads + 1] = menu.create_thread(function()
    while true do
        createObjectOptions()
        createPedOptions()
        createFiltered()
        coroutine.yield(600)
    end
end)
