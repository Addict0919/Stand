local function SpawnObjFromName()
    local status, inputString = input.get("Input A Object Name", "", 100, 0)    
    if status == eInputResponse.IR_SUCCESS then
        local iHash = gameplay.get_hash_key(inputString)

        if streaming.is_model_valid(iHash) then
            object.create_world_object(iHash, player.get_player_coords(player.player_id()), true, false)
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
        local wrld = object.create_world_object(gameplay.get_hash_key(objects[val+1]), player.get_player_coords(pid), true, false)
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
        end

        streaming.set_model_as_no_longer_needed(hash) 
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
 
    ped.create_ped(2, hash, player.get_player_coords(player.player_id()), 0, true, false)
end

local spawnOpt = func.add_feature("Editor", "parent", 0)

local spawnedEditor ={objects = {}, worldObjects = {},
props = {}, peds = {}, animals = {}}

local objectFeat = func.add_feature("Objects", "action_value_str", spawnOpt.id, function(feat)
	spawnedEditor.objects[#spawnedEditor.objects+1] = SpawnObj(feat.value)
end)

--
--objectFeat.hl_func = function(feat, data)
--	if feat.is_highlighted then
--        local ob = SpawnObj(feat.value)
--        entity.set_entity_alpha(ob, 60, false)
--	end
--end

objectFeat:set_str_data(objects)

func.add_feature("World Objects", "action_value_str", spawnOpt.id, function(feat)
	SpawnWrld(feat.value)
end):set_str_data(worldObjects)

func.add_feature("Props", "action_value_str", spawnOpt.id, function(feat)
	SpawnProp(feat.value)
end):set_str_data(props)

func.add_feature("Spawn Objects By Name", "action", spawnOpt.id, function(feat)
	SpawnObjFromName()
end)

func.add_feature("Spawn Ped By Name", "action", spawnOpt.id, function(feat)
	SpawnPedFromName()
end)

func.add_feature("Peds", "action_value_str", spawnOpt.id, function(feat)
	SpawnPed(feat.value)
end):set_str_data(pedList)

func.add_feature("Animals", "action_value_str", spawnOpt.id, function(feat)
	SpawnAnimal(feat.value)
end):set_str_data(animalsPeds)




--local spawnedEnts = func.add_feature("Spawned Entities", "parent", spawnOpt.id)
--local spawnedObjs = func.add_feature("Spawned Objects", "parent", spawnedEnts.id)
--local spawnedPeds = func.add_feature("Spawned Peds", "parent", spawnedEnts.id)

--local spawnedObjFeats = {}
--local function createObjectOptions()
--    for i=1, #spawnedEditor.objects do
--        local obj = spawnedEditor.objects[i]
--        if obj ~= nil then
--            if not spawnedObjFeats[obj] then
--                spawnedObjFeats[obj] = func.add_feature(tostring(gameplay.get_hash_key(obj)), "action", spawnedObjs.id)
--            end
--        end 
--    end
--end

--local spawnedPedFeats = {}
--local function createPedOptions()
--    for i=1, #spawnedEditor.peds do
--        local ped = spawnedEditor.peds[i]
--        if ped ~= nil then
--            if not spawnedPedFeats[ped] then
--                spawnedPedFeats[ped] = func.add_feature(tostring(gameplay.get_hash_key(ped)), "action", spawnedPeds.id)
--            end
--        end 
--    end
--end


--menu.create_thread(function ()
--    while true do
--        createObjectOptions()
--        createPedOptions()
--        coroutine.yield(600)
--    end
--end)
