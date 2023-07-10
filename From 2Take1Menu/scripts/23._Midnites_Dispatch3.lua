local x = {} --  feature table
local q = {} --  shortcut table
-- CodeNames
local Cops1 = {}
local Cops2 = {}
local Cops3 = {}
local Cops4 = {}
local CopCar1 = {}
local CopCar2 = {}
local CopBike = {}
local CopVan = {}
local NooseTeam1 = {}
local NooseTeam2 = {}
local NooseTeam3 = {}
local NooseTeam4 = {}
local NooseTeam5 = {}
local NooseTeam6 = {}
local NooseTeam7 = {}
local NooseCar = {}
local NooseCar2 = {}
local NooseSUV = {}
local NooseRiot = {}
local NooseRCV = {}
local NooseHelo = {}
local NooseHelo2 = {}
local Army1 = {}
local Army2 = {}
local Army3 = {}
local Army4 = {}
local Army5 = {}
local Army6 = {}
local Army7 = {}
local Air1 = {}
local Air2 = {}
local Air3 = {}
local Air4 = {}
local Air5 = {}
local Air6 = {}
local Air7 = {}
local ArmyHumvee = {}
local ArmyInsurgent = {}
local ArmyInsurgent2 = {}
local ArmyTransport = {}
local ArmyBarrage = {}
local ArmyAPC = {}
local ArmyTank = {}
local AirHunter = {}
local AirSavage = {}
local AirValkyrie = {}
local AirBuzzard = {}
local AirLazer = {}
local AirStrike = {}
local c = {
    id = player.player_id,
}


    -- Shortcuts
        q.set_mod = vehicle.set_vehicle_mod
        q.get_p_car = ped.get_vehicle_ped_is_using
        q.is_in_vehicle = player.is_player_in_any_vehicle
        q.eGod = entity.set_entity_god_mode
        q.eIsGod = entity.get_entity_god_mode
        q.pC = ped.create_ped
        q.vehT = vehicle.set_vehicle_mod_kit_type
        q.eS = entity.get_entity_speed
        q.pCoords = player.get_player_coords
        q.ms = utils.time_ms


--player
    x.Dispatchx = menu.add_player_feature("LS Law Enforcement Dispatch", "parent", 0).id
    x.Police = menu.add_player_feature("Police Dispatch", "parent", x.Dispatchx).id
    x.Noose = menu.add_player_feature("N.O.O.S.E TOC", "parent", x.Dispatchx).id
    x.Military = menu.add_player_feature("Fort Zancudo JOC", "parent", x.Dispatchx).id

    local function get_distance_between(entity_or_position_1, entity_or_position_2, is_looking_for_distance_between_coords)
            if is_looking_for_distance_between_coords then
                local distance_between = entity_or_position_1 - entity_or_position_2
                return math.abs(distance_between.x) + math.abs(distance_between.y)
            else
                local distance_between = entity.get_entity_coords(entity_or_position_1) - entity.get_entity_coords(entity_or_position_2)
                return math.abs(distance_between.x) + math.abs(distance_between.y)
            end
        end




-- Spawn a Police Patrol
    x.Cop_car = menu.add_player_feature("Spawn Police Patrol", "toggle", x.Police, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 50
            pos.y = pos.y + 0
            pos.z = pos.z - 0
            system.wait(10)
        local model = gameplay.get_hash_key("s_f_y_cop_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
		 local i = #Cops1 + 1
            Cops1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops1 >= 8 then
                    end
                    q.eGod(Cops1[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x71FA16EA

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #CopCar1 + 1
                    CopCar1[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(CopCar1[y], false)
					vehicle.set_vehicle_mod_kit_type(CopCar1[y], 0)
                    vehicle.get_vehicle_mod(CopCar1[y], 41)
			  vehicle.get_vehicle_mod(CopCar1[y], 18)
                    vehicle.set_vehicle_mod(CopCar1[y], 41, 3, true)
		 	  vehicle.set_vehicle_mod(CopCar1[y], 18, 3, true)
                    ped.set_ped_combat_attributes(Cops1[i], 46, true)
                    weapon.give_delayed_weapon_to_ped(Cops1[i], 0x22D8FE39, 1, 1)
		    weapon.give_delayed_weapon_to_ped(Cops1[i], 0x83BF0278, 1, 1)
		    weapon.give_weapon_component_to_ped(Cops1[i], 0x83BF0278, 0x7BC4CDDC)
		    weapon.give_weapon_component_to_ped(Cops1[i], 0x83BF0278, 0xC164F53)
	            weapon.give_weapon_component_to_ped(Cops1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(Cops1[i], 1, true)
		    ped.set_ped_combat_attributes(Cops1[i], 0, false)
                    ped.set_ped_combat_attributes(Cops1[i], 3, true)
                    ped.set_ped_combat_attributes(Cops1[i], 2, true)
		    ped.set_ped_combat_attributes(Cops1[i], 46, true)
                    ped.set_ped_combat_attributes(Cops1[i], 4, false)
                    ped.set_ped_combat_range(Cops1[i], 2)
                    ped.set_ped_combat_ability(Cops1[i], 2)
                    ped.set_ped_combat_movement(Cops1[i], 3)
                    ped.set_ped_into_vehicle(Cops1[i], CopCar1[y], -1)
                    ped.set_ped_max_health(Cops1[i], 328.0)
                    ped.set_ped_health(Cops1[i], 328.0)
                    ped.set_ped_config_flag(Cops1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops1[i], true)
                    for ii = 1, 26 do
                    end

                     local i = #Cops1 + 1
            Cops1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops1 >= 8 then
                    end
                    q.eGod(Cops1[i], false)
					if entity.is_entity_dead(Cops1[i]) then return HANDLER_CONTINUE end
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Cops1[i], 46, true)
                    weapon.give_delayed_weapon_to_ped(Cops1[i], 0x1D073A89, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops1[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(Cops1[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(Cops1[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Cops1[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(Cops1[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(Cops1[i], 0xDBBD7280, 0xB5E2575B)					
                    ped.set_ped_combat_attributes(Cops1[i], 1, true)
		    ped.set_ped_combat_attributes(Cops1[i], 0, false)
		    ped.set_ped_combat_attributes(Cops1[i], 46, true)
                    ped.set_ped_combat_attributes(Cops1[i], 3, true)
                    ped.set_ped_combat_attributes(Cops1[i], 2, true)
                    ped.set_ped_combat_attributes(Cops1[i], 4, false)
                    ped.set_ped_combat_range(Cops1[i], 2)
                    ped.set_ped_combat_movement(Cops1[i], 3)
                    ped.set_ped_combat_ability(Cops1[i], 2)
                    ped.set_ped_max_health(Cops1[i], 328.0)
                    ped.set_ped_health(Cops1[i], 328.0)
                    ped.set_ped_config_flag(Cops1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops1[i], CopCar1[y], 0)

		    local i = #Cops1 + 1
            Cops1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops1 >= 8 then
                    end
                    q.eGod(Cops1[i], false)
					if entity.is_entity_dead(Cops1[i]) then return HANDLER_CONTINUE end
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Cops1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Cops1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Cops1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Cops1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops1[i], 0x83BF0278, 0xA0D89C42)					
                   ped.set_ped_combat_attributes(Cops1[i], 1, true)
		    ped.set_ped_combat_attributes(Cops1[i], 0, false)
		    ped.set_ped_combat_attributes(Cops1[i], 46, true)
                    ped.set_ped_combat_attributes(Cops1[i], 3, true)
                    ped.set_ped_combat_attributes(Cops1[i], 2, true)
                    ped.set_ped_combat_attributes(Cops1[i], 4, false)
                    ped.set_ped_combat_range(Cops1[i], 2)
                    ped.set_ped_combat_movement(Cops1[i], 3)
                    ped.set_ped_combat_ability(Cops1[i], 2)
                    ped.set_ped_max_health(Cops1[i], 328.0)
                    ped.set_ped_health(Cops1[i], 328.0)
                    ped.set_ped_config_flag(Cops1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops1[i], CopCar1[y], 1)

		local i = #Cops1 + 1
            Cops1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops1 >= 8 then
                    end
                    q.eGod(Cops1[i], false)
					if entity.is_entity_dead(Cops1[i]) then return HANDLER_CONTINUE end
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Cops1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Cops1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Cops1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Cops1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops1[i], 0x83BF0278, 0xA0D89C42)					
                     ped.set_ped_combat_attributes(Cops1[i], 1, true)
		    ped.set_ped_combat_attributes(Cops1[i], 0, false)
                    ped.set_ped_combat_attributes(Cops1[i], 3, true)
		    ped.set_ped_combat_attributes(Cops1[i], 46, true)
                    ped.set_ped_combat_attributes(Cops1[i], 2, true)
                    ped.set_ped_combat_attributes(Cops1[i], 4, false)
                    ped.set_ped_combat_range(Cops1[i], 2)
                    ped.set_ped_combat_movement(Cops1[i], 3)
                    ped.set_ped_combat_ability(Cops1[i], 2)
                    ped.set_ped_max_health(Cops1[i], 328.0)
                    ped.set_ped_health(Cops1[i], 328.0)
                    ped.set_ped_config_flag(Cops1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops1[i], true)
                    for ii = 1, 26 do 
                    end
                    ped.set_ped_into_vehicle(Cops1[i], CopCar1[y], 2)
                        while x.on do
                        ai.task_combat_ped(Cops1[i], pedp, 0, 16)
                        system.wait(5)
						if entity.is_entity_dead(Cops1[i]) then return HANDLER_CONTINUE end
                            system.wait(25)
                            for i = 1, #Cops1 do
                                system.wait(25)
                        if get_distance_between(pedp, Cops1[i]) > 250 then
                            network.request_control_of_entity(Cops1[i])
                         entity.set_entity_as_no_longer_needed(Cops1[i])
                         network.request_control_of_entity(CopCar1[y])
                        entity.set_entity_as_no_longer_needed(CopCar1[y])
                    end
                end
                end
                    while x.off do return HANDLER_POP
                    end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Cops1 do
                    ped.get_all_peds(Cops1[i])
        system.wait(25)
        network.request_control_of_entity(Cops1[i])
                entity.set_entity_coords_no_offset(Cops1[i], pos)
                entity.set_entity_as_no_longer_needed(Cops1[i])
                entity.delete_entity(Cops1[i])
                    end
                    for y = 1, #CopCar1 do
                    vehicle.get_all_vehicles(CopCar1[y])
        system.wait(25)
        network.request_control_of_entity(CopCar1[y])
                entity.set_entity_coords_no_offset(CopCar1[y], pos)
                entity.set_entity_as_no_longer_needed(CopCar1[y])
                entity.delete_entity(CopCar1[y])
                end
            end)
			
-- Spawn a Police Highway Patrol
    x.Cop_car = menu.add_player_feature("Spawn Police Highway Patrol", "toggle", x.Police, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x +65
            pos.y = pos.y + 0
            pos.z = pos.z - 0
            system.wait(10)
        local model = gameplay.get_hash_key("s_m_y_cop_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Cops2 + 1
            Cops2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops2 >= 8 then
                    end
                    q.eGod(Cops2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x71FA16EA

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #CopCar2 + 1
                    CopCar2[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(CopCar2[y], false)
					vehicle.set_vehicle_mod_kit_type(CopCar2[y], 0)
                    vehicle.get_vehicle_mod(CopCar2[y], 40)
                    vehicle.set_vehicle_mod(CopCar2[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Cops2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops2[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops2[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops2[i], 1, true)
		    ped.set_ped_combat_attributes(Cops2[i], 0, false)
		    ped.set_ped_combat_attributes(Cops2[i], 46, true)
                    ped.set_ped_combat_attributes(Cops2[i], 3, true)
                    ped.set_ped_combat_attributes(Cops2[i], 2, true)
                    ped.set_ped_combat_attributes(Cops2[i], 4, false)
                    ped.set_ped_combat_range(Cops2[i], 2)
                    ped.set_ped_combat_movement(Cops2[i], 3)
                    ped.set_ped_combat_ability(Cops2[i], 2)
                    ped.set_ped_max_health(Cops2[i], 328.0)
                    ped.set_ped_health(Cops2[i], 328.0)
                    ped.set_ped_config_flag(Cops2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops2[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Cops2[i], ii)
                    end
                    ped.set_ped_into_vehicle(Cops2[i], CopCar2[y], -1)
					if entity.is_entity_dead(Cops2[i]) then return HANDLER_CONTINUE end

                     local i = #Cops2 + 1
            Cops2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops2 >= 8 then
                    end
                    q.eGod(Cops2[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                    ped.set_ped_combat_attributes(Cops2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops2[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops2[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops2[i], 1, true)
		    ped.set_ped_combat_attributes(Cops2[i], 0, false)
                    ped.set_ped_combat_attributes(Cops2[i], 3, true)
		    ped.set_ped_combat_attributes(Cops2[i], 46, true)
                    ped.set_ped_combat_attributes(Cops2[i], 2, true)
                    ped.set_ped_combat_attributes(Cops2[i], 4, false)
                    ped.set_ped_combat_range(Cops2[i], 2)
                    ped.set_ped_combat_movement(Cops2[i], 3)
                    ped.set_ped_combat_ability(Cops2[i], 2)
                    ped.set_ped_max_health(Cops2[i], 328.0)
                    ped.set_ped_health(Cops2[i], 328.0)
                    ped.set_ped_config_flag(Cops2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops2[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Cops2[i], ii)
                    end
                    ped.set_ped_into_vehicle(Cops2[i], CopCar2[y], 0)

		local i = #Cops2 + 1
            Cops2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops2 >= 8 then
                    end
                    q.eGod(Cops2[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                    ped.set_ped_combat_attributes(Cops2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops2[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops2[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops2[i], 1, true)
		    ped.set_ped_combat_attributes(Cops2[i], 0, false)
                    ped.set_ped_combat_attributes(Cops2[i], 3, true)
		    ped.set_ped_combat_attributes(Cops2[i], 46, true)
                    ped.set_ped_combat_attributes(Cops2[i], 2, true)
                    ped.set_ped_combat_attributes(Cops2[i], 4, false)
                    ped.set_ped_combat_range(Cops2[i], 2)
                    ped.set_ped_combat_movement(Cops2[i], 3)
                    ped.set_ped_combat_ability(Cops2[i], 2)
                    ped.set_ped_max_health(Cops2[i], 328.0)
                    ped.set_ped_health(Cops2[i], 328.0)
                    ped.set_ped_config_flag(Cops2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops2[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Cops2[i], ii)
                    end
                    ped.set_ped_into_vehicle(Cops2[i], CopCar2[y], 1)

		local i = #Cops2 + 1
            Cops2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops2 >= 8 then
                    end
                    q.eGod(Cops2[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                    ped.set_ped_combat_attributes(Cops2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops2[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops2[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops2[i], 1, true)
		    ped.set_ped_combat_attributes(Cops2[i], 0, false)
		    ped.set_ped_combat_attributes(Cops2[i], 46, true)
                    ped.set_ped_combat_attributes(Cops2[i], 3, true)
                    ped.set_ped_combat_attributes(Cops2[i], 2, true)
                    ped.set_ped_combat_attributes(Cops2[i], 4, false)
                    ped.set_ped_combat_range(Cops2[i], 2)
                    ped.set_ped_combat_movement(Cops2[i], 3)
                    ped.set_ped_combat_ability(Cops2[i], 2)
                    ped.set_ped_max_health(Cops2[i], 328.0)
                    ped.set_ped_health(Cops2[i], 328.0)
                    ped.set_ped_config_flag(Cops2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops2[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Cops2[i], ii)
                    end
                    ped.set_ped_into_vehicle(Cops2[i], CopCar2[y], 2)

                        while x.on do
                        ai.task_combat_ped(Cops2[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Cops2[i]) then return HANDLER_CONTINUE end
                            system.wait(25)
                            for i = 1, #Cops2 do
                                system.wait(25)
                        if get_distance_between(pedp, Cops2[i]) > 250 then
                            network.request_control_of_entity(Cops2[i])
                         entity.set_entity_as_no_longer_needed(Cops2[i])
                         network.request_control_of_entity(CopCar2[y])
                        entity.set_entity_as_no_longer_needed(CopCar2[y])
                    end
                end
                end
                    while x.off do return HANDLER_POP
                    end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Cops2 do
                    ped.get_all_peds(Cops2[i])
        system.wait(25)
        network.request_control_of_entity(Cops2[i])
                entity.set_entity_coords_no_offset(Cops2[i], pos)
                entity.set_entity_as_no_longer_needed(Cops2[i])
                entity.delete_entity(Cops2[i])
                    end
                    for y = 1, #CopCar2 do
                    vehicle.get_all_vehicles(CopCar2[y])
        system.wait(25)
        network.request_control_of_entity(CopCar2[y])
                entity.set_entity_coords_no_offset(CopCar2[y], pos)
                entity.set_entity_as_no_longer_needed(CopCar2[y])
                entity.delete_entity(CopCar2[y])
                end
            end)


-- Spawn a Spawn Highway Patrol Bike
    x.Cop_car = menu.add_player_feature("Spawn REINFORCEMENTS", "toggle", x.Police, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 5
            pos.y = pos.y + 50
           pos.z = pos.z + 5
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_cop_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                     local vehhash = 0x9DC66994
                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(100)
                    end

                    local y = #CopBike + 1
                    CopBike[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(CopBike[y], false)
					vehicle.set_vehicle_mod_kit_type(CopBike[y], 0)
                    vehicle.get_vehicle_mod(CopBike[y], 40)
                    vehicle.set_vehicle_mod(CopBike[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
			  ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], -1)
                    if entity.is_entity_dead(Cops3[i]) then return HANDLER_CONTINUE end

			local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 0)

		local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 1)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 2)


local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 3)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 4)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 5)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 6)
				ai.task_combat_ped(Cops3[i], pedp, 0, 16)
				system.wait(150)



       local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 5
            pos.y = pos.y + 58
            pos.z = pos.z + 5
local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                     local vehhash = 0x9DC66994
                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #CopBike + 1
                    CopBike[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(CopBike[y], false)
					vehicle.set_vehicle_mod_kit_type(CopBike[y], 0)
                    vehicle.get_vehicle_mod(CopBike[y], 40)
                    vehicle.set_vehicle_mod(CopBike[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
			  ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], -1)


				local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 0)

		local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 1)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 2)


		local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 3)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 4)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 5)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 6)
				ai.task_combat_ped(Cops3[i], pedp, 0, 16)
				system.wait(150)



local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 5
            pos.y = pos.y + 66
            pos.z = pos.z + 5
			local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                     local vehhash = 0x9DC66994
                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #CopBike + 1
                    CopBike[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(CopBike[y], false)
					vehicle.set_vehicle_mod_kit_type(CopBike[y], 0)
                    vehicle.get_vehicle_mod(CopBike[y], 40)
                    vehicle.set_vehicle_mod(CopBike[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
			  ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], -1)


local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 0)

		local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 1)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 2)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 3)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 4)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 5)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 6)

				ai.task_combat_ped(Cops3[i], pedp, 0, 16)
				system.wait(150)



local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 5
            pos.y = pos.y + 72
            pos.z = pos.z + 5
				local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                     local vehhash = 0x9DC66994
                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #CopBike + 1
                    CopBike[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(CopBike[y], false)
					vehicle.set_vehicle_mod_kit_type(CopBike[y], 0)
                    vehicle.get_vehicle_mod(CopBike[y], 40)
                    vehicle.set_vehicle_mod(CopBike[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
			  ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], -1)


local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 0)

		local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 1)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 2)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 3)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 4)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 5)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 6)

				ai.task_combat_ped(Cops3[i], pedp, 0, 16)
				system.wait(150)



local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 66
            pos.y = pos.y + 0
            pos.z = pos.z + 5
				local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                     local vehhash = 0x9DC66994
                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #CopBike + 1
                    CopBike[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(CopBike[y], false)
					vehicle.set_vehicle_mod_kit_type(CopBike[y], 0)
                    vehicle.get_vehicle_mod(CopBike[y], 40)
                    vehicle.set_vehicle_mod(CopBike[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
			  ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], -1)


local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 0)

		local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 1)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 2)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 3)

		local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 4)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 5)

local i = #Cops3 + 1
            Cops3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops3 >= 8 then
                    end
                    q.eGod(Cops3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops3[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops3[i], 1, true)
		    ped.set_ped_combat_attributes(Cops3[i], 0, false)
		    ped.set_ped_combat_attributes(Cops3[i], 46, true)
                    ped.set_ped_combat_attributes(Cops3[i], 3, true)
                    ped.set_ped_combat_attributes(Cops3[i], 2, true)
                    ped.set_ped_combat_attributes(Cops3[i], 4, false)
                    ped.set_ped_combat_range(Cops3[i], 2)
                    ped.set_ped_combat_movement(Cops3[i], 3)
                    ped.set_ped_combat_ability(Cops3[i], 2)
					ped.set_ped_max_health(Cops3[i], 328.0)
                    ped.set_ped_health(Cops3[i], 328.0)
                    ped.set_ped_config_flag(Cops3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops3[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops3[i], CopBike[y], 6)


				ai.task_combat_ped(Cops3[i], pedp, 0, 16)
				system.wait(150)


                    while x.on do
                        ai.task_combat_ped(Cops3[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Cops3[i]) then return HANDLER_CONTINUE end
                            system.wait(25)
                            for i = 1, #Cops3 do
                                system.wait(25)
                        if get_distance_between(pedp, Cops3[i]) > 200 then
                            network.request_control_of_entity(Cops3[i])
                         entity.set_entity_as_no_longer_needed(Cops3[i])
                         network.request_control_of_entity(CopBike[y])
                        entity.set_entity_as_no_longer_needed(CopBike[y])
                    end
                end
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Cops3 do
                    ped.get_all_peds(Cops3[i])
        system.wait(25)
        network.request_control_of_entity(Cops3[i])
                entity.set_entity_coords_no_offset(Cops3[i], pos)
                entity.set_entity_as_no_longer_needed(Cops3[i])
                entity.delete_entity(Cops3[i])
                    end
                    for y = 1, #CopBike do
                    vehicle.get_all_vehicles(CopBike[y])
        system.wait(25)
        network.request_control_of_entity(CopBike[y])
                entity.set_entity_coords_no_offset(CopBike[y], pos)
                entity.set_entity_as_no_longer_needed(CopBike[y])
                entity.delete_entity(CopBike[y])
                end
            end)

-- Spawn a Police Van
    x.Cop_car = menu.add_player_feature("Spawn Police Tactical Team", "toggle", x.Police, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 80
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_f_y_cop_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Cops4 + 1
            Cops4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops4 >= 8 then
                    end
                    q.eGod(Cops4[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x9DC66994

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #CopVan + 1
                    CopVan[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(CopVan[y], false)
					vehicle.set_vehicle_mod_kit_type(CopVan[y], 0)
                    vehicle.get_vehicle_mod(CopVan[y], 40)
                    vehicle.set_vehicle_mod(CopVan[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Cops4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops4[i], 1, true)
		    ped.set_ped_combat_attributes(Cops4[i], 0, false)
		    ped.set_ped_combat_attributes(Cops4[i], 46, true)
                    ped.set_ped_combat_attributes(Cops4[i], 3, true)
                    ped.set_ped_combat_attributes(Cops4[i], 2, true)
                    ped.set_ped_combat_attributes(Cops4[i], 4, false)
                    ped.set_ped_combat_range(Cops4[i], 2)
                    ped.set_ped_combat_movement(Cops4[i], 3)
                    ped.set_ped_combat_ability(Cops4[i], 2)
					ped.set_ped_max_health(Cops4[i], 328.0)
                    ped.set_ped_health(Cops4[i], 328.0)
                    ped.set_ped_config_flag(Cops4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops4[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops4[i], CopVan[y], -1)


            local i = #Cops4 + 1
            Cops4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops4 >= 8 then
                    end
                    q.eGod(Cops4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops4[i], 1, true)
		    ped.set_ped_combat_attributes(Cops4[i], 0, false)
		    ped.set_ped_combat_attributes(Cops4[i], 46, true)
                    ped.set_ped_combat_attributes(Cops4[i], 3, true)
                    ped.set_ped_combat_attributes(Cops4[i], 2, true)
                    ped.set_ped_combat_attributes(Cops4[i], 4, false)
                    ped.set_ped_combat_range(Cops4[i], 2)
                    ped.set_ped_combat_movement(Cops4[i], 3)
                    ped.set_ped_combat_ability(Cops4[i], 2)
					ped.set_ped_max_health(Cops4[i], 328.0)
                    ped.set_ped_health(Cops4[i], 328.0)
                    ped.set_ped_config_flag(Cops4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops4[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops4[i], CopVan[y], 0)

                     local i = #Cops4 + 1
            Cops4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops4 >= 8 then
                    end
                    q.eGod(Cops4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops4[i], 1, true)
		    ped.set_ped_combat_attributes(Cops4[i], 0, false)
		    ped.set_ped_combat_attributes(Cops4[i], 46, true)
                    ped.set_ped_combat_attributes(Cops4[i], 3, true)
                    ped.set_ped_combat_attributes(Cops4[i], 2, true)
                    ped.set_ped_combat_attributes(Cops4[i], 4, false)
                    ped.set_ped_combat_range(Cops4[i], 2)
                    ped.set_ped_combat_movement(Cops4[i], 3)
                    ped.set_ped_combat_ability(Cops4[i], 2)
					ped.set_ped_max_health(Cops4[i], 328.0)
                    ped.set_ped_health(Cops4[i], 328.0)
                    ped.set_ped_config_flag(Cops4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops4[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops4[i], CopVan[y], 1)


                     local i = #Cops4 + 1
            Cops4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops4 >= 8 then
                    end
                    q.eGod(Cops4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(Cops4[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(Cops4[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Cops4[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(Cops4[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(Cops4[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(Cops4[i], 1, true)
		    ped.set_ped_combat_attributes(Cops4[i], 0, false)
		    ped.set_ped_combat_attributes(Cops4[i], 46, true)
                    ped.set_ped_combat_attributes(Cops4[i], 3, true)
                    ped.set_ped_combat_attributes(Cops4[i], 2, true)
                    ped.set_ped_combat_attributes(Cops4[i], 4, false)
                    ped.set_ped_combat_range(Cops4[i], 2)
                    ped.set_ped_combat_movement(Cops4[i], 3)
                    ped.set_ped_combat_ability(Cops4[i], 2)
					ped.set_ped_max_health(Cops4[i], 328.0)
                    ped.set_ped_health(Cops4[i], 328.0)
                    ped.set_ped_config_flag(Cops4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops4[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops4[i], CopVan[y], 2)

local i = #Cops4 + 1
            Cops4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops4 >= 8 then
                    end
                    q.eGod(Cops4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops4[i], 1, true)
		    ped.set_ped_combat_attributes(Cops4[i], 0, false)
		    ped.set_ped_combat_attributes(Cops4[i], 46, true)
                    ped.set_ped_combat_attributes(Cops4[i], 3, true)
                    ped.set_ped_combat_attributes(Cops4[i], 2, true)
                    ped.set_ped_combat_attributes(Cops4[i], 4, false)
                    ped.set_ped_combat_range(Cops4[i], 2)
                    ped.set_ped_combat_movement(Cops4[i], 3)
                    ped.set_ped_combat_ability(Cops4[i], 2)
					ped.set_ped_max_health(Cops4[i], 328.0)
                    ped.set_ped_health(Cops4[i], 328.0)
                    ped.set_ped_config_flag(Cops4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops4[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops4[i], CopVan[y], 3)

local i = #Cops4 + 1
            Cops4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops4 >= 8 then
                    end
                    q.eGod(Cops4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops4[i], 1, true)
		    ped.set_ped_combat_attributes(Cops4[i], 0, false)
		    ped.set_ped_combat_attributes(Cops4[i], 46, true)
                    ped.set_ped_combat_attributes(Cops4[i], 3, true)
                    ped.set_ped_combat_attributes(Cops4[i], 2, true)
                    ped.set_ped_combat_attributes(Cops4[i], 4, false)
                    ped.set_ped_combat_range(Cops4[i], 2)
                    ped.set_ped_combat_movement(Cops4[i], 3)
                    ped.set_ped_combat_ability(Cops4[i], 2)
					ped.set_ped_max_health(Cops4[i], 328.0)
                    ped.set_ped_health(Cops4[i], 328.0)
                    ped.set_ped_config_flag(Cops4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops4[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops4[i], CopVan[y], 4)

local i = #Cops4 + 1
            Cops4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops4 >= 8 then
                    end
                    q.eGod(Cops4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops4[i], 1, true)
		    ped.set_ped_combat_attributes(Cops4[i], 0, false)
		    ped.set_ped_combat_attributes(Cops4[i], 46, true)
                    ped.set_ped_combat_attributes(Cops4[i], 3, true)
                    ped.set_ped_combat_attributes(Cops4[i], 2, true)
                    ped.set_ped_combat_attributes(Cops4[i], 4, false)
                    ped.set_ped_combat_range(Cops4[i], 2)
                    ped.set_ped_combat_movement(Cops4[i], 3)
                    ped.set_ped_combat_ability(Cops4[i], 2)
					ped.set_ped_max_health(Cops4[i], 328.0)
                    ped.set_ped_health(Cops4[i], 328.0)
                    ped.set_ped_config_flag(Cops4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops4[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops4[i], CopVan[y], 5)

local i = #Cops4 + 1
            Cops4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Cops4 >= 8 then
                    end
                    q.eGod(Cops4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Cops4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(Cops4[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(Cops4[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Cops4[i], 1, true)
		    ped.set_ped_combat_attributes(Cops4[i], 0, false)
		    ped.set_ped_combat_attributes(Cops4[i], 46, true)
                    ped.set_ped_combat_attributes(Cops4[i], 3, true)
                    ped.set_ped_combat_attributes(Cops4[i], 2, true)
                    ped.set_ped_combat_attributes(Cops4[i], 4, false)
                    ped.set_ped_combat_range(Cops4[i], 2)
                    ped.set_ped_combat_movement(Cops4[i], 3)
                    ped.set_ped_combat_ability(Cops4[i], 2)
					ped.set_ped_max_health(Cops4[i], 328.0)
                    ped.set_ped_health(Cops4[i], 328.0)
                    ped.set_ped_config_flag(Cops4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Cops4[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Cops4[i], CopVan[y], 6)











                   while x.on do
                        ai.task_combat_ped(Cops4[i], pedp, 0, 16)
                        system.wait(25)
			if entity.is_entity_dead(Cops4[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Cops4 do
                                system.wait(25)
                                ai.task_combat_ped(Cops4[i], pedp, 0, 16)
                        if get_distance_between(pedp, Cops4[i]) > 200 then
                            network.request_control_of_entity(Cops4[i])
                         entity.set_entity_as_no_longer_needed(Cops4[i])
                         network.request_control_of_entity(CopVan[y])
                        entity.set_entity_as_no_longer_needed(CopVan[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Cops4 do
                    ped.get_all_peds(Cops4[i])
        system.wait(25)
        network.request_control_of_entity(Cops4[i])
                entity.set_entity_coords_no_offset(Cops4[i], pos)
                entity.set_entity_as_no_longer_needed(Cops4[i])
                entity.delete_entity(Cops4[i])
                    end
                    for y = 1, #CopVan do
                    vehicle.get_all_vehicles(CopVan[y])
        system.wait(25)
        network.request_control_of_entity(CopVan[y])
                entity.set_entity_coords_no_offset(CopVan[y], pos)
                entity.set_entity_as_no_longer_needed(CopVan[y])
                entity.delete_entity(CopVan[y])
                end
            end)
			

-- Spawn a Noose Gang Taskforce
    x.Noose_Team = menu.add_player_feature("Spawn Noose REINFORCEMENTS", "toggle", x.Noose, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 50
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("mp_m_fibsec_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                     local vehhash = 0x9DC66994
                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(100)
                    end

                    local y = #NooseCar + 1
                    NooseCar[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseCar[y], false)
					vehicle.set_vehicle_mod_kit_type(NooseCar[y], 0)
                    vehicle.get_vehicle_mod(NooseCar[y], 40)
                    vehicle.set_vehicle_mod(NooseCar[y], 40, 3, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], -1)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end


            local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                   ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 0)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

                     local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 1)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end


                     local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                   ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 2)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end



			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 3)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                   ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 4)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 5)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
				ai.task_combat_ped(NooseTeam1[i], pedp, 0, 16)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 6)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end


		local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 54
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("mp_m_fibsec_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                     local vehhash = 0x9DC66994
                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(100)
                    end

                    local y = #NooseCar + 1
                    NooseCar[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseCar[y], false)
					vehicle.set_vehicle_mod_kit_type(NooseCar[y], 0)
                    vehicle.get_vehicle_mod(NooseCar[y], 40)
                    vehicle.set_vehicle_mod(NooseCar[y], 40, 3, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], -1)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end


            local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                   ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 0)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

                     local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 1)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end


                     local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                   ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 2)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end



			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 3)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                   ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 4)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 5)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
				ai.task_combat_ped(NooseTeam1[i], pedp, 0, 16)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 6)




local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 58
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("mp_m_fibsec_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                     local vehhash = 0x9DC66994
                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(100)
                    end

                    local y = #NooseCar + 1
                    NooseCar[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseCar[y], false)
					vehicle.set_vehicle_mod_kit_type(NooseCar[y], 0)
                    vehicle.get_vehicle_mod(NooseCar[y], 40)
                    vehicle.set_vehicle_mod(NooseCar[y], 40, 3, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], -1)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end


            local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                   ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 0)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

                     local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 1)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end


                     local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                   ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 2)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end



			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 3)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                   ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 4)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 5)
				if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end

			local i = #NooseTeam1 + 1
            NooseTeam1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam1 >= 8 then
                    end
                    q.eGod(NooseTeam1[i], false)
				ai.task_combat_ped(NooseTeam1[i], pedp, 0, 16)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam1[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam1[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam1[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam1[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam1[i], 2)
                    ped.set_ped_combat_ability(NooseTeam1[i], 2)
                    ped.set_ped_combat_movement(NooseTeam1[i], 3)
					ped.set_ped_max_health(NooseTeam1[i], 328.0)
                    ped.set_ped_health(NooseTeam1[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam1[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam1[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam1[i], NooseCar[y], 6)


                   while x.on do
                        ai.task_combat_ped(NooseTeam1[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(NooseTeam1[i]) then return HANDLER_CONTINUE end
                            for i = 1, #NooseTeam1 do
                                system.wait(25)
                                ai.task_combat_ped(NooseTeam1[i], pedp, 0, 16)
                        if get_distance_between(pedp, NooseTeam1[i]) > 1000 then
                            network.request_control_of_entity(NooseTeam1[i])
                         entity.set_entity_as_no_longer_needed(NooseTeam1[i])
                         network.request_control_of_entity(NooseCar[y])
                        entity.set_entity_as_no_longer_needed(NooseCar[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #NooseTeam1 do
                    ped.get_all_peds(NooseTeam1[i])
        system.wait(25)
        network.request_control_of_entity(NooseTeam1[i])
                entity.set_entity_coords_no_offset(NooseTeam1[i], pos)
                entity.set_entity_as_no_longer_needed(NooseTeam1[i])
                entity.delete_entity(NooseTeam1[i])
                    end
                    for y = 1, #NooseCar do
                    vehicle.get_all_vehicles(NooseCar[y])
        system.wait(25)
        network.request_control_of_entity(NooseCar[y])
                entity.set_entity_coords_no_offset(NooseCar[y], pos)
                entity.set_entity_as_no_longer_needed(NooseCar[y])
                entity.delete_entity(NooseCar[y])
                end
            end)


-- Spawn a Noose Sting Team
    x.Noose_Team = menu.add_player_feature("Spawn Noose Sting Team", "toggle", x.Noose, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 60
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_swat_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam6 + 1
            NooseTeam6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam6 >= 8 then
                    end
                    q.eGod(NooseTeam6[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x9DC66994

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #NooseCar2 + 1
                    NooseCar2[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseCar2[y], false)
					vehicle.set_vehicle_mod_kit_type(NooseCar2[y], 0)
                    vehicle.get_vehicle_mod(NooseCar2[y], 40)
                    vehicle.set_vehicle_mod(NooseCar2[y], 40, 3, true)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xA0D89C42)					
                    ped.set_ped_combat_attributes(NooseTeam6[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam6[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam6[i], 2)
                    ped.set_ped_combat_ability(NooseTeam6[i], 2)
                    ped.set_ped_combat_movement(NooseTeam6[i], 3)
					ped.set_ped_max_health(NooseTeam6[i], 328.0)
                    ped.set_ped_health(NooseTeam6[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam6[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam6[i], true)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam6[i], NooseCar2[y], -1)


            local i = #NooseTeam6 + 1
            NooseTeam6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam6 >= 8 then
                    end
                    q.eGod(NooseTeam6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam6[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam6[i], 1)
                    ped.set_ped_combat_ability(NooseTeam6[i], 2)
                    ped.set_ped_combat_movement(NooseTeam6[i], 2)
					ped.set_ped_max_health(NooseTeam6[i], 328.0)
                    ped.set_ped_health(NooseTeam6[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam6[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam6[i], NooseCar2[y], 0)

                     local i = #NooseTeam6 + 1
            NooseTeam6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam6 >= 8 then
                    end
                    q.eGod(NooseTeam6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam6[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam6[i], 1)
                    ped.set_ped_combat_ability(NooseTeam6[i], 2)
                    ped.set_ped_combat_movement(NooseTeam6[i], 2)
					ped.set_ped_max_health(NooseTeam6[i], 328.0)
                    ped.set_ped_health(NooseTeam6[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam6[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam6[i], NooseCar2[y], 1)


                     local i = #NooseTeam6 + 1
            NooseTeam6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam6 >= 8 then
                    end
                    q.eGod(NooseTeam6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam6[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam6[i], 1)
                    ped.set_ped_combat_ability(NooseTeam6[i], 2)
                    ped.set_ped_combat_movement(NooseTeam6[i], 2)
					ped.set_ped_max_health(NooseTeam6[i], 328.0)
                    ped.set_ped_health(NooseTeam6[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam6[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam6[i], NooseCar2[y], 2)

local i = #NooseTeam6 + 1
            NooseTeam6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam6 >= 8 then
                    end
                    q.eGod(NooseTeam6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam6[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam6[i], 1)
                    ped.set_ped_combat_ability(NooseTeam6[i], 2)
                    ped.set_ped_combat_movement(NooseTeam6[i], 2)
					ped.set_ped_max_health(NooseTeam6[i], 328.0)
                    ped.set_ped_health(NooseTeam6[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam6[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam6[i], NooseCar2[y], 3)

local i = #NooseTeam6 + 1
            NooseTeam6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam6 >= 8 then
                    end
                    q.eGod(NooseTeam6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam6[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam6[i], 1)
                    ped.set_ped_combat_ability(NooseTeam6[i], 2)
                    ped.set_ped_combat_movement(NooseTeam6[i], 2)
					ped.set_ped_max_health(NooseTeam6[i], 328.0)
                    ped.set_ped_health(NooseTeam6[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam6[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam6[i], NooseCar2[y], 4)

local i = #NooseTeam6 + 1
            NooseTeam6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam6 >= 8 then
                    end
                    q.eGod(NooseTeam6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam6[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam6[i], 1)
                    ped.set_ped_combat_ability(NooseTeam6[i], 2)
                    ped.set_ped_combat_movement(NooseTeam6[i], 2)
					ped.set_ped_max_health(NooseTeam6[i], 328.0)
                    ped.set_ped_health(NooseTeam6[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam6[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam6[i], NooseCar2[y], 5)

local i = #NooseTeam6 + 1
            NooseTeam6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam6 >= 8 then
                    end
                    q.eGod(NooseTeam6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam6[i], 0x83BF0278, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0x91109691)
		   			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam6[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam6[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam6[i], 1)
                    ped.set_ped_combat_ability(NooseTeam6[i], 2)
                    ped.set_ped_combat_movement(NooseTeam6[i], 2)
					ped.set_ped_max_health(NooseTeam6[i], 328.0)
                    ped.set_ped_health(NooseTeam6[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam6[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam6[i], NooseCar2[y], 6)

                   while x.on do
                        ai.task_combat_ped(NooseTeam6[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(NooseTeam6[i]) then return HANDLER_CONTINUE end
                            for i = 1, #NooseTeam6 do
                                system.wait(25)
                                ai.task_combat_ped(NooseTeam6[i], pedp, 0, 16)
                        if get_distance_between(pedp, NooseTeam6[i]) > 200 then
                            network.request_control_of_entity(NooseTeam6[i])
                         entity.set_entity_as_no_longer_needed(NooseTeam6[i])
                         network.request_control_of_entity(NooseCar2[y])
                        entity.set_entity_as_no_longer_needed(NooseCar2[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #NooseTeam6 do
                    ped.get_all_peds(NooseTeam6[i])
        system.wait(25)
        network.request_control_of_entity(NooseTeam6[i])
                entity.set_entity_coords_no_offset(NooseTeam6[i], pos)
                entity.set_entity_as_no_longer_needed(NooseTeam6[i])
                entity.delete_entity(NooseTeam6[i])
                    end
                    for y = 1, #NooseCar2 do
                    vehicle.get_all_vehicles(NooseCar2[y])
        system.wait(25)
        network.request_control_of_entity(NooseCar2[y])
                entity.set_entity_coords_no_offset(NooseCar2[y], pos)
                entity.set_entity_as_no_longer_needed(NooseCar2[y])
                entity.delete_entity(NooseCar2[y])
                end
            end)
			

-- Spawn a Noose Rapid Assault Team
    x.Noose_Team = menu.add_player_feature("Spawn Noose Entry Team", "toggle", x.Noose, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 60
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_swat_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam2 + 1
            NooseTeam2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam2 >= 8 then
                    end
                    q.eGod(NooseTeam2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x9DC66994

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #NooseSUV + 1
                    NooseSUV[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseSUV[y], false)
					vehicle.set_vehicle_mod_kit_type(NooseSUV[y], 0)
                    vehicle.get_vehicle_mod(NooseSUV[y], 40)
                    vehicle.set_vehicle_mod(NooseSUV[y], 40, 3, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xA0D89C42)						
                    ped.set_ped_combat_attributes(NooseTeam2[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam2[i], 2)
                    ped.set_ped_combat_ability(NooseTeam2[i], 2)
                    ped.set_ped_combat_movement(NooseTeam2[i], 2)
					ped.set_ped_max_health(NooseTeam2[i], 328.0)
                    ped.set_ped_health(NooseTeam2[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam2[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam2[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam2[i], NooseSUV[y], -1)


            local i = #NooseTeam2 + 1
            NooseTeam2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam2 >= 8 then
                    end
                    q.eGod(NooseTeam2[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam2[i], 2)
                    ped.set_ped_combat_ability(NooseTeam2[i], 2)
                    ped.set_ped_combat_movement(NooseTeam2[i], 2)
					ped.set_ped_max_health(NooseTeam2[i], 328.0)
                    ped.set_ped_health(NooseTeam2[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam2[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam2[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam2[i], NooseSUV[y], 0)


local i = #NooseTeam2 + 1
            NooseTeam2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam2 >= 8 then
                    end
                    q.eGod(NooseTeam2[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam2[i], 2)
                    ped.set_ped_combat_ability(NooseTeam2[i], 2)
                    ped.set_ped_combat_movement(NooseTeam2[i], 2)
					ped.set_ped_max_health(NooseTeam2[i], 328.0)
                    ped.set_ped_health(NooseTeam2[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam2[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam2[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam2[i], NooseSUV[y], 1)

local i = #NooseTeam2 + 1
            NooseTeam2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam2 >= 8 then
                    end
                    q.eGod(NooseTeam2[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam2[i], 2)
                    ped.set_ped_combat_ability(NooseTeam2[i], 2)
                    ped.set_ped_combat_movement(NooseTeam2[i], 2)
					ped.set_ped_max_health(NooseTeam2[i], 328.0)
                    ped.set_ped_health(NooseTeam2[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam2[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam2[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam2[i], NooseSUV[y], 2)



                     local i = #NooseTeam2 + 1
            NooseTeam2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam2 >= 8 then
                    end
                    q.eGod(NooseTeam2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xA0D89C42)	
                    ped.set_ped_combat_attributes(NooseTeam2[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam2[i], 2)
                    ped.set_ped_combat_ability(NooseTeam2[i], 2)
                    ped.set_ped_combat_movement(NooseTeam2[i], 2)
					ped.set_ped_max_health(NooseTeam2[i], 328.0)
                    ped.set_ped_health(NooseTeam2[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam2[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam2[i], NooseSUV[y], 3)

                     local i = #NooseTeam2 + 1
            NooseTeam2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam2 >= 8 then
                    end
                    q.eGod(NooseTeam2[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam2[i], 2)
                    ped.set_ped_combat_ability(NooseTeam2[i], 2)
                    ped.set_ped_combat_movement(NooseTeam2[i], 2)
					ped.set_ped_max_health(NooseTeam2[i], 328.0)
                    ped.set_ped_health(NooseTeam2[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam2[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam2[i], NooseSUV[y], 4)


                     local i = #NooseTeam2 + 1
            NooseTeam2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam2 >= 8 then
                    end
                    q.eGod(NooseTeam2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam2[i], 2)
                    ped.set_ped_combat_ability(NooseTeam2[i], 2)
                    ped.set_ped_combat_movement(NooseTeam2[i], 2)
					ped.set_ped_max_health(NooseTeam2[i], 328.0)
                    ped.set_ped_health(NooseTeam2[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam2[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam2[i], NooseSUV[y], 5)


                     local i = #NooseTeam2 + 1
            NooseTeam2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam2 >= 8 then
                    end
                    q.eGod(NooseTeam2[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xC164F53)
	            			weapon.give_weapon_component_to_ped(NooseTeam2[i], 0x83BF0278, 0xA0D89C42)	
                    ped.set_ped_combat_attributes(NooseTeam2[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam2[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam2[i], 2)
                    ped.set_ped_combat_ability(NooseTeam2[i], 2)
                    ped.set_ped_combat_movement(NooseTeam2[i], 2)
					ped.set_ped_max_health(NooseTeam2[i], 328.0)
                    ped.set_ped_health(NooseTeam2[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam2[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam2[i], NooseSUV[y], 6)
                   while x.on do
                        ai.task_combat_ped(NooseTeam2[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(NooseTeam2[i]) then return HANDLER_CONTINUE end
                            for i = 1, #NooseTeam2 do
                                system.wait(25)
                                ai.task_combat_ped(NooseTeam2[i], pedp, 0, 16)
                        if get_distance_between(pedp, NooseTeam2[i]) > 200 then
                            network.request_control_of_entity(NooseTeam2[i])
                         entity.set_entity_as_no_longer_needed(NooseTeam2[i])
                         network.request_control_of_entity(NooseSUV[y])
                        entity.set_entity_as_no_longer_needed(NooseSUV[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #NooseTeam2 do
                    ped.get_all_peds(NooseTeam2[i])
        system.wait(25)
        network.request_control_of_entity(NooseTeam2[i])
                entity.set_entity_coords_no_offset(NooseTeam2[i], pos)
                entity.set_entity_as_no_longer_needed(NooseTeam2[i])
                entity.delete_entity(NooseTeam2[i])
                    end
                    for y = 1, #NooseSUV do
                    vehicle.get_all_vehicles(NooseSUV[y])
        system.wait(25)
        network.request_control_of_entity(NooseSUV[y])
                entity.set_entity_coords_no_offset(NooseSUV[y], pos)
                entity.set_entity_as_no_longer_needed(NooseSUV[y])
                entity.delete_entity(NooseSUV[y])
                end
            end)

-- Spawn a Noose Riot Control Team
    x.Noose_Team = menu.add_player_feature("Spawn Noose Riot Control Team", "toggle", x.Noose, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 70
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_swat_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam5 + 1
            NooseTeam5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam5 >= 8 then
                    end
                    q.eGod(NooseTeam5[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x9DC66994

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #NooseRCV + 1
                    NooseRCV[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseRCV[y], false)
					vehicle.set_vehicle_mod_kit_type(NooseRCV[y], 0)
                    vehicle.get_vehicle_mod(NooseRCV[y], 10)
                    vehicle.set_vehicle_mod(NooseRCV[y], 10, 0, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 46, true)
			    	weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x83BF0278, 1, 1)
                    	weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x22D8FE39, 1, 1)
			    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0x7BC4CDDC)
		   	    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xC164F53)
	               	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam5[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam5[i], 1)
                    ped.set_ped_combat_ability(NooseTeam5[i], 2)
                    ped.set_ped_combat_movement(NooseTeam5[i], 2)
					ped.set_ped_max_health(NooseTeam5[i], 328.0)
                    ped.set_ped_health(NooseTeam5[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam5[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam5[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam5[i], NooseRCV[y], -1)


            local i = #NooseTeam5 + 1
            NooseTeam5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam5 >= 8 then
                    end
                    q.eGod(NooseTeam5[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam5[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam5[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam5[i], 1)
                    ped.set_ped_combat_ability(NooseTeam5[i], 2)
                    ped.set_ped_combat_movement(NooseTeam5[i], 2)
					ped.set_ped_max_health(NooseTeam5[i], 328.0)
                    ped.set_ped_health(NooseTeam5[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam5[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam5[i], false)
                    for ii = 1, 26 do
                    end							
                    ped.set_ped_into_vehicle(NooseTeam5[i], NooseRCV[y], 0)

                     local i = #NooseTeam5 + 1
            NooseTeam5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam5 >= 8 then
                    end
                    q.eGod(NooseTeam5[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam5[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x22D8FE39, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam5[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam5[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam5[i], 1)
                    ped.set_ped_combat_ability(NooseTeam5[i], 2)
                    ped.set_ped_combat_movement(NooseTeam5[i], 2)
					ped.set_ped_max_health(NooseTeam5[i], 328.0)
                    ped.set_ped_health(NooseTeam5[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam5[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam5[i], false)
                    for ii = 1, 26 do
                    end								
                    ped.set_ped_into_vehicle(NooseTeam5[i], NooseRCV[y], 1)


                     local i = #NooseTeam5 + 1
            NooseTeam5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam5 >= 8 then
                    end
                    q.eGod(NooseTeam5[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam5[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x83BF0278, 1, 1)
                    	weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x22D8FE39, 1, 1)
			    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0x7BC4CDDC)
		   	    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xC164F53)
	               	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam5[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam5[i], 1)
                    ped.set_ped_combat_ability(NooseTeam5[i], 2)
                    ped.set_ped_combat_movement(NooseTeam5[i], 2)
					ped.set_ped_max_health(NooseTeam5[i], 328.0)
                    ped.set_ped_health(NooseTeam5[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam5[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam5[i], false)
                    for ii = 1, 26 do
                    end								
                    ped.set_ped_into_vehicle(NooseTeam5[i], NooseRCV[y], 2)

                     local i = #NooseTeam5 + 1
            NooseTeam5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam5 >= 8 then
                    end
                    q.eGod(NooseTeam5[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam5[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x83BF0278, 1, 1)
                    	weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x22D8FE39, 1, 1)
			    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0x7BC4CDDC)
		   	    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xC164F53)
	               	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam5[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam5[i], 1)
                    ped.set_ped_combat_ability(NooseTeam5[i], 2)
                    ped.set_ped_combat_movement(NooseTeam5[i], 2)
					ped.set_ped_max_health(NooseTeam5[i], 328.0)
                    ped.set_ped_health(NooseTeam5[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam5[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam5[i], false)
                    for ii = 1, 26 do
                    end								
                    ped.set_ped_into_vehicle(NooseTeam5[i], NooseRCV[y], 3)


                     local i = #NooseTeam5 + 1
            NooseTeam5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam5 >= 8 then
                    end
                    q.eGod(NooseTeam5[i], false)
                    streaming.set_model_as_no_longer_needed(model)

					
                    ped.set_ped_combat_attributes(NooseTeam5[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x83BF0278, 1, 1)
                    	weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x22D8FE39, 1, 1)
			    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0x7BC4CDDC)
		   	    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xC164F53)
	               	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam5[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam5[i], 1)
                    ped.set_ped_combat_ability(NooseTeam5[i], 2)
                    ped.set_ped_combat_movement(NooseTeam5[i], 2)
					ped.set_ped_max_health(NooseTeam5[i], 328.0)
                    ped.set_ped_health(NooseTeam5[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam5[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam5[i], false)
                    for ii = 1, 26 do
                    end								
                    ped.set_ped_into_vehicle(NooseTeam5[i], NooseRCV[y], 4)

				local i = #NooseTeam5 + 1
            NooseTeam5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam5 >= 8 then
                    end
                    q.eGod(NooseTeam5[i], false)
                    streaming.set_model_as_no_longer_needed(model)

					
                    ped.set_ped_combat_attributes(NooseTeam5[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x83BF0278, 1, 1)
                    	weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x22D8FE39, 1, 1)
			    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0x7BC4CDDC)
		   	    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xC164F53)
	               	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam5[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam5[i], 1)
                    ped.set_ped_combat_ability(NooseTeam5[i], 2)
                    ped.set_ped_combat_movement(NooseTeam5[i], 2)
					ped.set_ped_max_health(NooseTeam5[i], 328.0)
                    ped.set_ped_health(NooseTeam5[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam5[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam5[i], false)
                    for ii = 1, 26 do
                    end								
                    ped.set_ped_into_vehicle(NooseTeam5[i], NooseRCV[y], 5)

local i = #NooseTeam5 + 1
            NooseTeam5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam5 >= 8 then
                    end
                    q.eGod(NooseTeam5[i], false)
                    streaming.set_model_as_no_longer_needed(model)

					
                    ped.set_ped_combat_attributes(NooseTeam5[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x83BF0278, 1, 1)
                    	weapon.give_delayed_weapon_to_ped(NooseTeam5[i], 0x22D8FE39, 1, 1)
			    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0x7BC4CDDC)
		   	    	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xC164F53)
	               	weapon.give_weapon_component_to_ped(NooseTeam5[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam5[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam5[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam5[i], 1)
                    ped.set_ped_combat_ability(NooseTeam5[i], 2)
                    ped.set_ped_combat_movement(NooseTeam5[i], 2)
					ped.set_ped_max_health(NooseTeam5[i], 328.0)
                    ped.set_ped_health(NooseTeam5[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam5[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam5[i], false)
                    for ii = 1, 26 do
                    end								
                    ped.set_ped_into_vehicle(NooseTeam5[i], NooseRCV[y], 6)


                   while x.on do
                        ai.task_combat_ped(NooseTeam5[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(NooseTeam5[i]) then return HANDLER_CONTINUE end
                            system.wait(25)
                            for i = 1, #NooseTeam5 do
                                system.wait(25)
                                ai.task_combat_ped(NooseTeam5[i], pedp, 0, 16)
                        if get_distance_between(pedp, NooseTeam5[i]) > 200 then
                            network.request_control_of_entity(NooseTeam5[i])
                         entity.set_entity_as_no_longer_needed(NooseTeam5[i])
                         network.request_control_of_entity(NooseRCV[y])
                        entity.set_entity_as_no_longer_needed(NooseRCV[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #NooseTeam5 do
                    ped.get_all_peds(NooseTeam5[i])
        system.wait(25)
        network.request_control_of_entity(NooseTeam5[i])
                entity.set_entity_coords_no_offset(NooseTeam5[i], pos)
                entity.set_entity_as_no_longer_needed(NooseTeam5[i])
                entity.delete_entity(NooseTeam5[i])
                    end
                    for y = 1, #NooseRCV do
                    vehicle.get_all_vehicles(NooseRCV[y])
        system.wait(25)
        network.request_control_of_entity(NooseRCV[y])
                entity.set_entity_coords_no_offset(NooseRCV[y], pos)
                entity.set_entity_as_no_longer_needed(NooseRCV[y])
                entity.delete_entity(NooseRCV[y])
                end
            end)
			

-- Spawn a Noose Assault Team
    x.Noose_Team = menu.add_player_feature("Spawn Noose Assault Team", "toggle", x.Noose, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 70
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_swat_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam3 + 1
            NooseTeam3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam3 >= 8 then
                    end
                    q.eGod(NooseTeam3[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x9DC66994

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #NooseRiot + 1
                    NooseRiot[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseRiot[y], false)
					vehicle.set_vehicle_mod_kit_type(NooseRiot[y], 0)
                    vehicle.get_vehicle_mod(NooseRiot[y], 40)
                    vehicle.set_vehicle_mod(NooseRiot[y], 40, 3, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFDBC8A50, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x65EA7EBB)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x5ED6C128)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x255D5D57)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x8B3C480B)	
                    ped.set_ped_combat_attributes(NooseTeam3[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam3[i], 2)
                    ped.set_ped_combat_ability(NooseTeam3[i], 2)
                    ped.set_ped_combat_movement(NooseTeam3[i], 1)
					ped.set_ped_max_health(NooseTeam3[i], 328.0)
                    ped.set_ped_health(NooseTeam3[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam3[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam3[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam3[i], NooseRiot[y], -1)


            local i = #NooseTeam3 + 1
            NooseTeam3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam3 >= 8 then
                    end
                    q.eGod(NooseTeam3[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFDBC8A50, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x65EA7EBB)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x5ED6C128)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x255D5D57)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam3[i], 2)
                    ped.set_ped_combat_ability(NooseTeam3[i], 2)
                    ped.set_ped_combat_movement(NooseTeam3[i], 1)
					ped.set_ped_max_health(NooseTeam3[i], 328.0)
                    ped.set_ped_health(NooseTeam3[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam3[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam3[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam3[i], NooseRiot[y], 0)

                     local i = #NooseTeam3 + 1
            NooseTeam3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam3 >= 8 then
                    end
                    q.eGod(NooseTeam3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFDBC8A50, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x65EA7EBB)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x5ED6C128)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x255D5D57)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam3[i], 2)
                    ped.set_ped_combat_ability(NooseTeam3[i], 2)
                    ped.set_ped_combat_movement(NooseTeam3[i], 1)
					ped.set_ped_max_health(NooseTeam3[i], 328.0)
                    ped.set_ped_health(NooseTeam3[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam3[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam3[i], false)
                    for ii = 1, 26 do
                    end					
                    ped.set_ped_into_vehicle(NooseTeam3[i], NooseRiot[y], 1)


                     local i = #NooseTeam3 + 1
            NooseTeam3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam3 >= 8 then
                    end
                    q.eGod(NooseTeam3[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFDBC8A50, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x65EA7EBB)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x5ED6C128)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x255D5D57)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam3[i], 2)
                    ped.set_ped_combat_ability(NooseTeam3[i], 2)
                    ped.set_ped_combat_movement(NooseTeam3[i], 1)
					ped.set_ped_max_health(NooseTeam3[i], 328.0)
                    ped.set_ped_health(NooseTeam3[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam3[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam3[i], false)
                    for ii = 1, 26 do
                    end					
                    ped.set_ped_into_vehicle(NooseTeam3[i], NooseRiot[y], 2)

                     local i = #NooseTeam3 + 1
            NooseTeam3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam3 >= 8 then
                    end
                    q.eGod(NooseTeam3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFDBC8A50, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0x555AF99A, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x555AF99A, 0x4E65B425)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x555AF99A, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x555AF99A, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x555AF99A, 0x5F7DCE4D)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam3[i], 2)
                    ped.set_ped_combat_ability(NooseTeam3[i], 2)
                    ped.set_ped_combat_movement(NooseTeam3[i], 1)
					ped.set_ped_max_health(NooseTeam3[i], 328.0)
                    ped.set_ped_health(NooseTeam3[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam3[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam3[i], false)
                    for ii = 1, 26 do
                    end					
                    ped.set_ped_into_vehicle(NooseTeam3[i], NooseRiot[y], 3)


                     local i = #NooseTeam3 + 1
            NooseTeam3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam3 >= 8 then
                    end
                    q.eGod(NooseTeam3[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFDBC8A50, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0x555AF99A, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x555AF99A, 0x4E65B425)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x555AF99A, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x555AF99A, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x555AF99A, 0x5F7DCE4D)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam3[i], 2)
                    ped.set_ped_combat_ability(NooseTeam3[i], 2)
                    ped.set_ped_combat_movement(NooseTeam3[i], 1)
					ped.set_ped_max_health(NooseTeam3[i], 328.0)
                    ped.set_ped_health(NooseTeam3[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam3[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam3[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam3[i], NooseRiot[y], 4)

                     local i = #NooseTeam3 + 1
            NooseTeam3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam3 >= 8 then
                    end
                    q.eGod(NooseTeam3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFDBC8A50, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0x78A97CD0, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0xB5A715F)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0x9FDB5652)	
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0xC867A07B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0xA564D78B)	
                    ped.set_ped_combat_attributes(NooseTeam3[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam3[i], 2)
                    ped.set_ped_combat_ability(NooseTeam3[i], 2)
                    ped.set_ped_combat_movement(NooseTeam3[i], 1)
					ped.set_ped_max_health(NooseTeam3[i], 328.0)
                    ped.set_ped_health(NooseTeam3[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam3[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam3[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam3[i], NooseRiot[y], 5)


                     local i = #NooseTeam3 + 1
            NooseTeam3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam3 >= 8 then
                    end
                    q.eGod(NooseTeam3[i], false)
                    streaming.set_model_as_no_longer_needed(model)
					

                    ped.set_ped_combat_attributes(NooseTeam3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xFDBC8A50, 1, 1)
					weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam3[i], 0x78A97CD0, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0xB5A715F)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0x7BC4CDDC)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0x9FDB5652)	
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0xC867A07B)
					weapon.give_weapon_component_to_ped(NooseTeam3[i], 0x78A97CD0, 0xA564D78B)	
                    ped.set_ped_combat_attributes(NooseTeam3[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam3[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam3[i], 2)
                    ped.set_ped_combat_ability(NooseTeam3[i], 2)
                    ped.set_ped_combat_movement(NooseTeam3[i], 1)
					ped.set_ped_max_health(NooseTeam3[i], 328.0)
                    ped.set_ped_health(NooseTeam3[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam3[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam3[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam3[i], NooseRiot[y], 6)
                   while x.on do
                        ai.task_combat_ped(NooseTeam3[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(NooseTeam3[i]) then return HANDLER_CONTINUE end
                            system.wait(25)
                            for i = 1, #NooseTeam3 do
                                system.wait(25)
                                ai.task_combat_ped(NooseTeam3[i], pedp, 0, 16)
                        if get_distance_between(pedp, NooseTeam3[i]) > 200 then
                            network.request_control_of_entity(NooseTeam3[i])
                         entity.set_entity_as_no_longer_needed(NooseTeam3[i])
                         network.request_control_of_entity(NooseRiot[y])
                        entity.set_entity_as_no_longer_needed(NooseRiot[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #NooseTeam3 do
                    ped.get_all_peds(NooseTeam3[i])
        system.wait(25)
        network.request_control_of_entity(NooseTeam3[i])
                entity.set_entity_coords_no_offset(NooseTeam3[i], pos)
                entity.set_entity_as_no_longer_needed(NooseTeam3[i])
                entity.delete_entity(NooseTeam3[i])
                    end
                    for y = 1, #NooseRiot do
                    vehicle.get_all_vehicles(NooseRiot[y])
        system.wait(25)
        network.request_control_of_entity(NooseRiot[y])
                entity.set_entity_coords_no_offset(NooseRiot[y], pos)
                entity.set_entity_as_no_longer_needed(NooseRiot[y])
                entity.delete_entity(NooseRiot[y])
                end
            end)


      -- Spawn a Noose Buzzard
    x.Noose_Team = menu.add_player_feature("Spawn Noose Buzzard", "toggle", x.Noose, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 310
            pos.y = pos.y + 0
            pos.z = pos.z + 110
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_swat_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam7 + 1
            NooseTeam7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam7 >= 8 then
                    end
                    q.eGod(NooseTeam7[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x2C75F0DD

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #NooseHelo2 + 1
                    NooseHelo2[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseHelo2[y], false)
					vehicle.set_vehicle_mod_kit_type(NooseHelo2[y], 0)
                    vehicle.get_vehicle_mod(NooseHelo2[y], 40)
                    vehicle.set_vehicle_mod(NooseHelo2[y], 40, 3, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0x22D8FE39, 1, 1)					
					ped.set_ped_prop_index(NooseTeam7[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 3, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam7[i], 2)
                    ped.set_ped_combat_ability(NooseTeam7[i], 2)
                    ped.set_ped_combat_movement(NooseTeam7[i], 3)
					ped.set_ped_max_health(NooseTeam7[i], 328.0)
                    ped.set_ped_health(NooseTeam7[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam7[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam7[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(NooseTeam7[i], ii)
                    end
                    ped.set_ped_into_vehicle(NooseTeam7[i], NooseHelo2[y], -1)


			local i = #NooseTeam7 + 1
            NooseTeam7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam7 >= 8 then
                    end
                    q.eGod(NooseTeam7[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0x22D8FE39, 1, 1)	
					ped.set_ped_prop_index(NooseTeam7[i], 0, 0, 0, 0)					
                    ped.set_ped_combat_attributes(NooseTeam7[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 3, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam7[i], 2)
                    ped.set_ped_combat_ability(NooseTeam7[i], 2)
                    ped.set_ped_combat_movement(NooseTeam7[i], 3)
					ped.set_ped_max_health(NooseTeam7[i], 328.0)
                    ped.set_ped_health(NooseTeam7[i], 328.0)
					ped.set_ped_can_ragdoll(NooseTeam7[i], false)
                    ped.set_ped_into_vehicle(NooseTeam7[i], NooseHelo2[y], 0)



            local i = #NooseTeam7 + 1
            NooseTeam7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam7 >= 8 then
                    end
                    q.eGod(NooseTeam7[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0x1B06D571, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0xB5E2575B)	
					ped.set_ped_prop_index(NooseTeam7[i], 0, 0, 0, 0)					
                    ped.set_ped_combat_attributes(NooseTeam7[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 3, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam7[i], 2)
                    ped.set_ped_combat_ability(NooseTeam7[i], 2)
                    ped.set_ped_combat_movement(NooseTeam7[i], 3)
					ped.set_ped_max_health(NooseTeam7[i], 328.0)
                    ped.set_ped_health(NooseTeam7[i], 328.0)
					ped.set_ped_can_ragdoll(NooseTeam7[i], false)
                    ped.set_ped_into_vehicle(NooseTeam7[i], NooseHelo2[y], 1)


                     local i = #NooseTeam7 + 1
            NooseTeam7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam7 >= 8 then
                    end
                    q.eGod(NooseTeam7[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0x1B06D571, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0xB5E2575B)
					ped.set_ped_prop_index(NooseTeam7[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 3, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam7[i], 2)
                    ped.set_ped_combat_ability(NooseTeam7[i], 2)
                    ped.set_ped_combat_movement(NooseTeam7[i], 3)
					ped.set_ped_max_health(NooseTeam7[i], 328.0)
                    ped.set_ped_health(NooseTeam7[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam7[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam7[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam7[i], NooseHelo2[y], 2)



local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 340
            pos.y = pos.y + 0
            pos.z = pos.z + 100
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_swat_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam7 + 1
            NooseTeam7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam7 >= 8 then
                    end
                    q.eGod(NooseTeam7[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x2C75F0DD

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #NooseHelo2 + 1
                    NooseHelo2[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseHelo2[y], false)
					vehicle.set_vehicle_mod_kit_type(NooseHelo2[y], 0)
                    vehicle.get_vehicle_mod(NooseHelo2[y], 40)
                    vehicle.set_vehicle_mod(NooseHelo2[y], 40, 3, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0x22D8FE39, 1, 1)					
					ped.set_ped_prop_index(NooseTeam7[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 3, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 2, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam7[i], 2)
                    ped.set_ped_combat_ability(NooseTeam7[i], 2)
                    ped.set_ped_combat_movement(NooseTeam7[i], 3)
					ped.set_ped_max_health(NooseTeam7[i], 328.0)
                    ped.set_ped_health(NooseTeam7[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam7[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam7[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(NooseTeam7[i], ii)
                    end
                    ped.set_ped_into_vehicle(NooseTeam7[i], NooseHelo2[y], -1)


			local i = #NooseTeam7 + 1
            NooseTeam7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam7 >= 8 then
                    end
                    q.eGod(NooseTeam7[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0x22D8FE39, 1, 1)	
					ped.set_ped_prop_index(NooseTeam7[i], 0, 0, 0, 0)					
                    ped.set_ped_combat_attributes(NooseTeam7[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 3, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam7[i], 2)
                    ped.set_ped_combat_ability(NooseTeam7[i], 2)
                    ped.set_ped_combat_movement(NooseTeam7[i], 3)
					ped.set_ped_max_health(NooseTeam7[i], 328.0)
                    ped.set_ped_health(NooseTeam7[i], 328.0)
					ped.set_ped_can_ragdoll(NooseTeam7[i], false)
                    ped.set_ped_into_vehicle(NooseTeam7[i], NooseHelo2[y], 0)



            local i = #NooseTeam7 + 1
            NooseTeam7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam7 >= 8 then
                    end
                    q.eGod(NooseTeam7[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0x1B06D571, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0xB5E2575B)	
					ped.set_ped_prop_index(NooseTeam7[i], 0, 0, 0, 0)					
                    ped.set_ped_combat_attributes(NooseTeam7[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 3, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam7[i], 2)
                    ped.set_ped_combat_ability(NooseTeam7[i], 2)
                    ped.set_ped_combat_movement(NooseTeam7[i], 3)
					ped.set_ped_max_health(NooseTeam7[i], 328.0)
                    ped.set_ped_health(NooseTeam7[i], 328.0)
					ped.set_ped_can_ragdoll(NooseTeam7[i], false)
                    ped.set_ped_into_vehicle(NooseTeam7[i], NooseHelo2[y], 1)


                     local i = #NooseTeam7 + 1
            NooseTeam7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam7 >= 8 then
                    end
                    q.eGod(NooseTeam7[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0x1B06D571, 1, 1)
                    weapon.give_delayed_weapon_to_ped(NooseTeam7[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0x420FD713)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0xEC9068CC)
					weapon.give_weapon_component_to_ped(NooseTeam7[i], 0xDBBD7280, 0xB5E2575B)
					ped.set_ped_prop_index(NooseTeam7[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 3, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam7[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam7[i], 2)
                    ped.set_ped_combat_ability(NooseTeam7[i], 2)
                    ped.set_ped_combat_movement(NooseTeam7[i], 3)
					ped.set_ped_max_health(NooseTeam7[i], 328.0)
                    ped.set_ped_health(NooseTeam7[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam7[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam7[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(NooseTeam7[i], NooseHelo2[y], 2)


                   while x.on do
                        ai.task_combat_ped(NooseTeam7[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(NooseTeam7[i]) then return HANDLER_CONTINUE end
                            for i = 1, #NooseTeam7 do
                                system.wait(25)
                                ai.task_combat_ped(NooseTeam7[i], pedp, 0, 16)
                        if get_distance_between(pedp, NooseTeam7[i]) > 4000 then
                            network.request_control_of_entity(NooseTeam7[i])
                         entity.set_entity_as_no_longer_needed(NooseTeam7[i])
                         network.request_control_of_entity(NooseHelo2[y])
                        entity.set_entity_as_no_longer_needed(NooseHelo2[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #NooseTeam7 do
                    ped.get_all_peds(NooseTeam7[i])
        system.wait(25)
        network.request_control_of_entity(NooseTeam7[i])
                entity.set_entity_coords_no_offset(NooseTeam7[i], pos)
                entity.set_entity_as_no_longer_needed(NooseTeam7[i])
                entity.delete_entity(NooseTeam7[i])
                    end
                    for y = 1, #NooseHelo2 do
                    vehicle.get_all_vehicles(NooseHelo2[y])
        system.wait(25)
        network.request_control_of_entity(NooseHelo2[y])
                entity.set_entity_coords_no_offset(NooseHelo2[y], pos)
                entity.set_entity_as_no_longer_needed(NooseHelo2[y])
                entity.delete_entity(NooseHelo2[y])
                end
            end)


-- Spawn a Noose Annihilator
    x.Noose_Team = menu.add_player_feature("Spawn Noose Annihilator", "toggle", x.Noose, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 310
            pos.y = pos.y + 0
            pos.z = pos.z + 100
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_swat_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #NooseTeam4 + 1
            NooseTeam4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam4 >= 8 then
                    end
                    q.eGod(NooseTeam4[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x5BFA5C4B

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #NooseHelo + 1
                    NooseHelo[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseHelo[y], false)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam4[i], 0x22D8FE39, 1, 1)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam4[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 52, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam4[i], 2)
                    ped.set_ped_combat_ability(NooseTeam4[i], 2)
                    ped.set_ped_combat_movement(NooseTeam4[i], 1)
					ped.set_ped_max_health(NooseTeam4[i], 328.0)
                    ped.set_ped_health(NooseTeam4[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam4[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam4[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam4[i], NooseHelo[y], -1)


            local i = #NooseTeam4 + 1
            NooseTeam4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam4 >= 8 then
                    end
                    q.eGod(NooseTeam4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam4[i], 0x22D8FE39, 1, 1)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam4[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam4[i], 2)
                    ped.set_ped_combat_ability(NooseTeam4[i], 2)
                    ped.set_ped_combat_movement(NooseTeam4[i], 1)
					ped.set_ped_max_health(NooseTeam4[i], 328.0)
                    ped.set_ped_health(NooseTeam4[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam4[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam4[i], false)
                    for ii = 1, 26 do
                    end									
                    ped.set_ped_into_vehicle(NooseTeam4[i], NooseHelo[y], 0)

                     local i = #NooseTeam4 + 1
            NooseTeam4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam4 >= 8 then
                    end
                    q.eGod(NooseTeam4[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam4[i], 0x22D8FE39, 1, 1)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam4[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam4[i], 2)
                    ped.set_ped_combat_ability(NooseTeam4[i], 2)
                    ped.set_ped_combat_movement(NooseTeam4[i], 1)
					ped.set_ped_max_health(NooseTeam4[i], 328.0)
                    ped.set_ped_health(NooseTeam4[i], 328.0)
					ped.set_ped_can_ragdoll(NooseTeam4[i], false)					
                    ped.set_ped_into_vehicle(NooseTeam4[i], NooseHelo[y], 1)

                     local i = #NooseTeam4 + 1
            NooseTeam4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam4 >= 8 then
                    end
                    q.eGod(NooseTeam4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam4[i], 0x22D8FE39, 1, 1)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam4[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam4[i], 2)
                    ped.set_ped_combat_ability(NooseTeam4[i], 2)
                    ped.set_ped_combat_movement(NooseTeam4[i], 1)
					ped.set_ped_max_health(NooseTeam4[i], 328.0)
                    ped.set_ped_health(NooseTeam4[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam4[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam4[i], false)
                    for ii = 1, 26 do
                    end									
                    ped.set_ped_into_vehicle(NooseTeam4[i], NooseHelo[y], 2)
				system.wait(10)
			 ai.task_combat_ped(NooseTeam4[i], pedp, 0, 16)
				system.wait(10)




local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 350
            pos.y = pos.y + 0
            pos.z = pos.z + 110

local i = #NooseTeam4 + 1
            NooseTeam4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam4 >= 8 then
                    end
                    q.eGod(NooseTeam4[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x5BFA5C4B

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #NooseHelo + 1
                    NooseHelo[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(NooseHelo[y], false)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam4[i], 0x22D8FE39, 1, 1)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam4[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 52, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam4[i], 2)
                    ped.set_ped_combat_ability(NooseTeam4[i], 2)
                    ped.set_ped_combat_movement(NooseTeam4[i], 1)
					ped.set_ped_max_health(NooseTeam4[i], 328.0)
                    ped.set_ped_health(NooseTeam4[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam4[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam4[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(NooseTeam4[i], NooseHelo[y], -1)


            local i = #NooseTeam4 + 1
            NooseTeam4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam4 >= 8 then
                    end
                    q.eGod(NooseTeam4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(NooseTeam4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam4[i], 0x22D8FE39, 1, 1)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam4[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam4[i], 2)
                    ped.set_ped_combat_ability(NooseTeam4[i], 2)
                    ped.set_ped_combat_movement(NooseTeam4[i], 1)
					ped.set_ped_max_health(NooseTeam4[i], 328.0)
                    ped.set_ped_health(NooseTeam4[i], 328.0)
                    ped.set_ped_config_flag(NooseTeam4[i], 187, 0)
                    ped.set_ped_can_ragdoll(NooseTeam4[i], false)
                    for ii = 1, 26 do
                    end									
                    ped.set_ped_into_vehicle(NooseTeam4[i], NooseHelo[y], 0)

                     local i = #NooseTeam4 + 1
            NooseTeam4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam4 >= 8 then
                    end
                    q.eGod(NooseTeam4[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam4[i], 0x22D8FE39, 1, 1)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam4[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam4[i], 2)
                    ped.set_ped_combat_ability(NooseTeam4[i], 2)
                    ped.set_ped_combat_movement(NooseTeam4[i], 1)
					ped.set_ped_max_health(NooseTeam4[i], 328.0)
                    ped.set_ped_health(NooseTeam4[i], 328.0)
					ped.set_ped_can_ragdoll(NooseTeam4[i], false)					
                    ped.set_ped_into_vehicle(NooseTeam4[i], NooseHelo[y], 1)

	


local i = #NooseTeam4 + 1
            NooseTeam4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #NooseTeam4 >= 8 then
                    end
                    q.eGod(NooseTeam4[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(NooseTeam4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(NooseTeam4[i], 0x22D8FE39, 1, 1)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 1, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 3, true)
                    ped.set_ped_prop_index(NooseTeam4[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 2, true)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 52, false)
                    ped.set_ped_combat_attributes(NooseTeam4[i], 4, true)
                    ped.set_ped_combat_range(NooseTeam4[i], 2)
                    ped.set_ped_combat_ability(NooseTeam4[i], 2)
                    ped.set_ped_combat_movement(NooseTeam4[i], 1)
					ped.set_ped_max_health(NooseTeam4[i], 328.0)
                    ped.set_ped_health(NooseTeam4[i], 328.0)
					ped.set_ped_can_ragdoll(NooseTeam4[i], false)					
                    ped.set_ped_into_vehicle(NooseTeam4[i], NooseHelo[y], 2)


                   while x.on do
                        ai.task_combat_ped(NooseTeam4[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(NooseTeam4[i]) then return HANDLER_CONTINUE end
                            for i = 1, #NooseTeam4 do
                                system.wait(25)
                                ai.task_combat_ped(NooseTeam4[i], pedp, 0, 16)
                        if get_distance_between(pedp, NooseTeam4[i]) > 4000 then
                            network.request_control_of_entity(NooseTeam4[i])
                         entity.set_entity_as_no_longer_needed(NooseTeam4[i])
                         network.request_control_of_entity(NooseHelo[y])
                        entity.set_entity_as_no_longer_needed(NooseHelo[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #NooseTeam4 do
                    ped.get_all_peds(NooseTeam4[i])
        system.wait(25)
        network.request_control_of_entity(NooseTeam4[i])
                entity.set_entity_coords_no_offset(NooseTeam4[i], pos)
                entity.set_entity_as_no_longer_needed(NooseTeam4[i])
                entity.delete_entity(NooseTeam4[i])
                    end
                    for y = 1, #NooseHelo do
                    vehicle.get_all_vehicles(NooseHelo[y])
        system.wait(25)
        network.request_control_of_entity(NooseHelo[y])
                entity.set_entity_coords_no_offset(NooseHelo[y], pos)
                entity.set_entity_as_no_longer_needed(NooseHelo[y])
                entity.delete_entity(NooseHelo[y])
                end
            end)


-- Spawn a Marine Squaddie
    x.Military_Unit = menu.add_player_feature("Spawn Marine Squaddie", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 50
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Army1 + 1
            Army1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army1 >= 8 then
                    end
                    q.eGod(Army1[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x9114EADA

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #ArmyHumvee + 1
                    ArmyHumvee[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(ArmyHumvee[y], false)
					vehicle.set_vehicle_mod_kit_type(ArmyHumvee[y], 0)
                    vehicle.get_vehicle_mod(ArmyHumvee[y], 40)
                    vehicle.set_vehicle_mod(ArmyHumvee[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Army1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army1[i], 1, true)
                    ped.set_ped_combat_attributes(Army1[i], 3, true)
                    ped.set_ped_combat_attributes(Army1[i], 2, false)
                    ped.set_ped_combat_attributes(Army1[i], 52, false)
                    ped.set_ped_combat_attributes(Army1[i], 4, true)
                    ped.set_ped_combat_range(Army1[i], 2)
                    ped.set_ped_combat_ability(Army1[i], 2)
                    ped.set_ped_combat_movement(Army1[i], 2)
					ped.set_ped_max_health(Army1[i], 328.0)
                    ped.set_ped_health(Army1[i], 328.0)
                    ped.set_ped_config_flag(Army1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army1[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army1[i], ArmyHumvee[y], -1)


            local i = #Army1 + 1
            Army1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army1 >= 8 then
                    end
                    q.eGod(Army1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army1[i], 1, true)
                    ped.set_ped_combat_attributes(Army1[i], 3, true)
                    ped.set_ped_combat_attributes(Army1[i], 2, false)
                    ped.set_ped_combat_attributes(Army1[i], 52, false)
                    ped.set_ped_combat_attributes(Army1[i], 4, true)
                    ped.set_ped_combat_range(Army1[i], 2)
                    ped.set_ped_combat_ability(Army1[i], 2)
                    ped.set_ped_combat_movement(Army1[i], 2)
					ped.set_ped_max_health(Army1[i], 328.0)
                    ped.set_ped_health(Army1[i], 328.0)
                    ped.set_ped_config_flag(Army1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army1[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army1[i], ArmyHumvee[y], 0)

                     local i = #Army1 + 1
            Army1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army1 >= 8 then
                    end
                    q.eGod(Army1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army1[i], 1, true)
                    ped.set_ped_combat_attributes(Army1[i], 3, true)
                    ped.set_ped_combat_attributes(Army1[i], 2, false)
                    ped.set_ped_combat_attributes(Army1[i], 52, false)
                    ped.set_ped_combat_attributes(Army1[i], 4, true)
                    ped.set_ped_combat_range(Army1[i], 2)
                    ped.set_ped_combat_ability(Army1[i], 2)
                    ped.set_ped_combat_movement(Army1[i], 2)
					ped.set_ped_max_health(Army1[i], 328.0)
                    ped.set_ped_health(Army1[i], 328.0)
                    ped.set_ped_config_flag(Army1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army1[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army1[i], ArmyHumvee[y], 1)


                     local i = #Army1 + 1
            Army1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army1 >= 8 then
                    end
                    q.eGod(Army1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army1[i], 1, true)
                    ped.set_ped_combat_attributes(Army1[i], 3, true)
                    ped.set_ped_combat_attributes(Army1[i], 2, false)
                    ped.set_ped_combat_attributes(Army1[i], 52, false)
                    ped.set_ped_combat_attributes(Army1[i], 4, true)
                    ped.set_ped_combat_range(Army1[i], 2)
                    ped.set_ped_combat_ability(Army1[i], 2)
                    ped.set_ped_combat_movement(Army1[i], 2)
					ped.set_ped_max_health(Army1[i], 328.0)
                    ped.set_ped_health(Army1[i], 328.0)
                    ped.set_ped_config_flag(Army1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army1[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army1[i], ArmyHumvee[y], 2)

local i = #Army1 + 1
            Army1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army1 >= 8 then
                    end
                    q.eGod(Army1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army1[i], 1, true)
                    ped.set_ped_combat_attributes(Army1[i], 3, true)
                    ped.set_ped_combat_attributes(Army1[i], 2, false)
                    ped.set_ped_combat_attributes(Army1[i], 52, false)
                    ped.set_ped_combat_attributes(Army1[i], 4, true)
                    ped.set_ped_combat_range(Army1[i], 2)
                    ped.set_ped_combat_ability(Army1[i], 2)
                    ped.set_ped_combat_movement(Army1[i], 2)
					ped.set_ped_max_health(Army1[i], 328.0)
                    ped.set_ped_health(Army1[i], 328.0)
                    ped.set_ped_config_flag(Army1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army1[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army1[i], ArmyHumvee[y], 3)
local i = #Army1 + 1
            Army1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army1 >= 8 then
                    end
                    q.eGod(Army1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army1[i], 1, true)
                    ped.set_ped_combat_attributes(Army1[i], 3, true)
                    ped.set_ped_combat_attributes(Army1[i], 2, false)
                    ped.set_ped_combat_attributes(Army1[i], 52, false)
                    ped.set_ped_combat_attributes(Army1[i], 4, true)
                    ped.set_ped_combat_range(Army1[i], 2)
                    ped.set_ped_combat_ability(Army1[i], 2)
                    ped.set_ped_combat_movement(Army1[i], 2)
					ped.set_ped_max_health(Army1[i], 328.0)
                    ped.set_ped_health(Army1[i], 328.0)
                    ped.set_ped_config_flag(Army1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army1[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army1[i], ArmyHumvee[y], 4)

local i = #Army1 + 1
            Army1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army1 >= 8 then
                    end
                    q.eGod(Army1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army1[i], 1, true)
                    ped.set_ped_combat_attributes(Army1[i], 3, true)
                    ped.set_ped_combat_attributes(Army1[i], 2, false)
                    ped.set_ped_combat_attributes(Army1[i], 52, false)
                    ped.set_ped_combat_attributes(Army1[i], 4, true)
                    ped.set_ped_combat_range(Army1[i], 2)
                    ped.set_ped_combat_ability(Army1[i], 2)
                    ped.set_ped_combat_movement(Army1[i], 2)
					ped.set_ped_max_health(Army1[i], 328.0)
                    ped.set_ped_health(Army1[i], 328.0)
                    ped.set_ped_config_flag(Army1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army1[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army1[i], ArmyHumvee[y], 5)

local i = #Army1 + 1
            Army1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army1 >= 8 then
                    end
                    q.eGod(Army1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army1[i], 1, true)
                    ped.set_ped_combat_attributes(Army1[i], 3, true)
                    ped.set_ped_combat_attributes(Army1[i], 2, false)
                    ped.set_ped_combat_attributes(Army1[i], 52, false)
                    ped.set_ped_combat_attributes(Army1[i], 4, true)
                    ped.set_ped_combat_range(Army1[i], 2)
                    ped.set_ped_combat_ability(Army1[i], 2)
                    ped.set_ped_combat_movement(Army1[i], 2)
					ped.set_ped_max_health(Army1[i], 328.0)
                    ped.set_ped_health(Army1[i], 328.0)
                    ped.set_ped_config_flag(Army1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army1[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army1[i], ArmyHumvee[y], 6)

local i = #Army1 + 1
            Army1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army1 >= 8 then
                    end
                    q.eGod(Army1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army1[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army1[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army1[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army1[i], 1, true)
                    ped.set_ped_combat_attributes(Army1[i], 3, false)
                    ped.set_ped_combat_attributes(Army1[i], 2, false)
                    ped.set_ped_combat_attributes(Army1[i], 52, false)
                    ped.set_ped_combat_attributes(Army1[i], 4, true)
                    ped.set_ped_combat_range(Army1[i], 2)
                    ped.set_ped_combat_ability(Army1[i], 2)
                    ped.set_ped_combat_movement(Army1[i], 2)
					ped.set_ped_max_health(Army1[i], 328.0)
                    ped.set_ped_health(Army1[i], 328.0)
                    ped.set_ped_config_flag(Army1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army1[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army1[i], ArmyHumvee[y], 7)

                   while x.on do
                        ai.task_combat_ped(Army1[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Army1[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Army1 do
                                system.wait(25)
                                ai.task_combat_ped(Army1[i], pedp, 0, 16)
                        if get_distance_between(pedp, Army1[i]) > 200 then
                            network.request_control_of_entity(Army1[i])
                         entity.set_entity_as_no_longer_needed(Army1[i])
                         network.request_control_of_entity(ArmyHumvee[y])
                        entity.set_entity_as_no_longer_needed(ArmyHumvee[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Army1 do
                    ped.get_all_peds(Army1[i])
        system.wait(25)
        network.request_control_of_entity(Army1[i])
                entity.set_entity_coords_no_offset(Army1[i], pos)
                entity.set_entity_as_no_longer_needed(Army1[i])
                entity.delete_entity(Army1[i])
                    end
                    for y = 1, #ArmyHumvee do
                    vehicle.get_all_vehicles(ArmyHumvee[y])
        system.wait(25)
        network.request_control_of_entity(ArmyHumvee[y])
                entity.set_entity_coords_no_offset(ArmyHumvee[y], pos)
                entity.set_entity_as_no_longer_needed(ArmyHumvee[y])
                entity.delete_entity(ArmyHumvee[y])
                end
            end)
			
			
-- Spawn a Marine Insurgent
    x.Military_Unit = menu.add_player_feature("Spawn Marine Insurgent", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 60
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Army6 + 1
            Army6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army6 >= 8 then
                    end
                    q.eGod(Army6[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x9114EADA

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #ArmyInsurgent + 1
                    ArmyInsurgent[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(ArmyInsurgent[y], false)
					vehicle.set_vehicle_mod_kit_type(ArmyInsurgent[y], 0)
                    vehicle.get_vehicle_mod(ArmyInsurgent[y], 40)
                    vehicle.set_vehicle_mod(ArmyInsurgent[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Army6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army6[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army6[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army6[i], 1, true)
                    ped.set_ped_combat_attributes(Army6[i], 3, true)
                    ped.set_ped_combat_attributes(Army6[i], 2, false)
                    ped.set_ped_combat_attributes(Army6[i], 52, false)
                    ped.set_ped_combat_attributes(Army6[i], 4, true)
                    ped.set_ped_combat_range(Army6[i], 2)
                    ped.set_ped_combat_ability(Army6[i], 2)
                    ped.set_ped_combat_movement(Army6[i], 1)
					ped.set_ped_max_health(Army6[i], 328.0)
                    ped.set_ped_health(Army6[i], 328.0)
                    ped.set_ped_config_flag(Army6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army6[i], ArmyInsurgent[y], -1)


            local i = #Army6 + 1
            Army6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army6 >= 8 then
                    end
                    q.eGod(Army6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army6[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army6[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army6[i], 1, true)
                    ped.set_ped_combat_attributes(Army6[i], 3, true)
                    ped.set_ped_combat_attributes(Army6[i], 2, false)
                    ped.set_ped_combat_attributes(Army6[i], 52, false)
                    ped.set_ped_combat_attributes(Army6[i], 4, true)
                    ped.set_ped_combat_range(Army6[i], 2)
                    ped.set_ped_combat_ability(Army6[i], 2)
                    ped.set_ped_combat_movement(Army6[i], 1)
					ped.set_ped_max_health(Army6[i], 328.0)
                    ped.set_ped_health(Army6[i], 328.0)
                    ped.set_ped_config_flag(Army6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army6[i], ArmyInsurgent[y], 0)

                     local i = #Army6 + 1
            Army6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army6 >= 8 then
                    end
                    q.eGod(Army6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army6[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army6[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army6[i], 1, true)
                    ped.set_ped_combat_attributes(Army6[i], 3, true)
                    ped.set_ped_combat_attributes(Army6[i], 2, true)
                    ped.set_ped_combat_attributes(Army6[i], 52, false)
                    ped.set_ped_combat_attributes(Army6[i], 4, true)
                    ped.set_ped_combat_range(Army6[i], 2)
                    ped.set_ped_combat_ability(Army6[i], 2)
                    ped.set_ped_combat_movement(Army6[i], 1)
					ped.set_ped_max_health(Army6[i], 328.0)
                    ped.set_ped_health(Army6[i], 328.0)
                    ped.set_ped_config_flag(Army6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army6[i], ArmyInsurgent[y], 1)


                     local i = #Army6 + 1
            Army6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army6 >= 8 then
                    end
                    q.eGod(Army6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army6[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army6[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army6[i], 1, true)
                    ped.set_ped_combat_attributes(Army6[i], 3, true)
                    ped.set_ped_combat_attributes(Army6[i], 2, true)
                    ped.set_ped_combat_attributes(Army6[i], 52, false)
                    ped.set_ped_combat_attributes(Army6[i], 4, true)
                    ped.set_ped_combat_range(Army6[i], 2)
                    ped.set_ped_combat_ability(Army6[i], 2)
                    ped.set_ped_combat_movement(Army6[i], 1)
					ped.set_ped_max_health(Army6[i], 328.0)
                    ped.set_ped_health(Army6[i], 328.0)
                    ped.set_ped_config_flag(Army6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army6[i], ArmyInsurgent[y], 2)


                     local i = #Army6 + 1
            Army6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army6 >= 8 then
                    end
                    q.eGod(Army6[i], false)
                    streaming.set_model_as_no_longer_needed(model)
					

                    ped.set_ped_combat_attributes(Army6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army6[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army6[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army6[i], 1, true)
                    ped.set_ped_combat_attributes(Army6[i], 3, true)
                    ped.set_ped_combat_attributes(Army6[i], 2, true)
                    ped.set_ped_combat_attributes(Army6[i], 52, false)
                    ped.set_ped_combat_attributes(Army6[i], 4, true)
                    ped.set_ped_combat_range(Army6[i], 2)
                    ped.set_ped_combat_ability(Army6[i], 2)
                    ped.set_ped_combat_movement(Army6[i], 1)
					ped.set_ped_max_health(Army6[i], 328.0)
                    ped.set_ped_health(Army6[i], 328.0)
                    ped.set_ped_config_flag(Army6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army6[i], ArmyInsurgent[y], 3)


                     local i = #Army6 + 1
            Army6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army6 >= 8 then
                    end
                    q.eGod(Army6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army6[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army6[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army6[i], 1, true)
                    ped.set_ped_combat_attributes(Army6[i], 3, true)
                    ped.set_ped_combat_attributes(Army6[i], 2, true)
                    ped.set_ped_combat_attributes(Army6[i], 52, false)
                    ped.set_ped_combat_attributes(Army6[i], 4, true)
                    ped.set_ped_combat_range(Army6[i], 2)
                    ped.set_ped_combat_ability(Army6[i], 2)
                    ped.set_ped_combat_movement(Army6[i], 1)
					ped.set_ped_max_health(Army6[i], 328.0)
                    ped.set_ped_health(Army6[i], 328.0)
                    ped.set_ped_config_flag(Army6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army6[i], ArmyInsurgent[y], 4)

local i = #Army6 + 1
            Army6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army6 >= 8 then
                    end
                    q.eGod(Army6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army6[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army6[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army6[i], 1, true)
                    ped.set_ped_combat_attributes(Army6[i], 3, true)
                    ped.set_ped_combat_attributes(Army6[i], 2, true)
                    ped.set_ped_combat_attributes(Army6[i], 52, false)
                    ped.set_ped_combat_attributes(Army6[i], 4, true)
                    ped.set_ped_combat_range(Army6[i], 2)
                    ped.set_ped_combat_ability(Army6[i], 2)
                    ped.set_ped_combat_movement(Army6[i], 1)
					ped.set_ped_max_health(Army6[i], 328.0)
                    ped.set_ped_health(Army6[i], 328.0)
                    ped.set_ped_config_flag(Army6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army6[i], ArmyInsurgent[y], 5)

local i = #Army6 + 1
            Army6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army6 >= 8 then
                    end
                    q.eGod(Army6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army6[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army6[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army6[i], 1, true)
                    ped.set_ped_combat_attributes(Army6[i], 3, true)
                    ped.set_ped_combat_attributes(Army6[i], 2, true)
                    ped.set_ped_combat_attributes(Army6[i], 52, false)
                    ped.set_ped_combat_attributes(Army6[i], 4, true)
                    ped.set_ped_combat_range(Army6[i], 2)
                    ped.set_ped_combat_ability(Army6[i], 2)
                    ped.set_ped_combat_movement(Army6[i], 1)
					ped.set_ped_max_health(Army6[i], 328.0)
                    ped.set_ped_health(Army6[i], 328.0)
                    ped.set_ped_config_flag(Army6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army6[i], ArmyInsurgent[y], 6)

local i = #Army6 + 1
            Army6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army6 >= 8 then
                    end
                    q.eGod(Army6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army6[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army6[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army6[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army6[i], 1, true)
                    ped.set_ped_combat_attributes(Army6[i], 3, false)
                    ped.set_ped_combat_attributes(Army6[i], 2, true)
                    ped.set_ped_combat_attributes(Army6[i], 52, false)
                    ped.set_ped_combat_attributes(Army6[i], 4, true)
                    ped.set_ped_combat_range(Army6[i], 2)
                    ped.set_ped_combat_ability(Army6[i], 2)
                    ped.set_ped_combat_movement(Army6[i], 1)
					ped.set_ped_max_health(Army6[i], 328.0)
                    ped.set_ped_health(Army6[i], 328.0)
                    ped.set_ped_config_flag(Army6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army6[i], ArmyInsurgent[y], 7)

                   while x.on do
                        ai.task_combat_ped(Army6[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Army6[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Army6 do
                                system.wait(25)
                                ai.task_combat_ped(Army6[i], pedp, 0, 16)
                        if get_distance_between(pedp, Army6[i]) > 200 then
                            network.request_control_of_entity(Army6[i])
                         entity.set_entity_as_no_longer_needed(Army6[i])
                         network.request_control_of_entity(ArmyInsurgent[y])
                        entity.set_entity_as_no_longer_needed(ArmyInsurgent[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Army6 do
                    ped.get_all_peds(Army6[i])
        system.wait(25)
        network.request_control_of_entity(Army6[i])
                entity.set_entity_coords_no_offset(Army6[i], pos)
                entity.set_entity_as_no_longer_needed(Army6[i])
                entity.delete_entity(Army6[i])
                    end
                    for y = 1, #ArmyInsurgent do
                    vehicle.get_all_vehicles(ArmyInsurgent[y])
        system.wait(25)
        network.request_control_of_entity(ArmyInsurgent[y])
                entity.set_entity_coords_no_offset(ArmyInsurgent[y], pos)
                entity.set_entity_as_no_longer_needed(ArmyInsurgent[y])
                entity.delete_entity(ArmyInsurgent[y])
                end
            end)


-- Spawn a Marine Barracks
    x.Military_Unit = menu.add_player_feature("Spawn Marine Barracks", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 70
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x2592B5CF

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #ArmyTransport + 1
                    ArmyTransport[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(ArmyTransport[y], false)
					vehicle.set_vehicle_mod_kit_type(ArmyTransport[y], 0)
                    vehicle.get_vehicle_mod(ArmyTransport[y], 40)
                    vehicle.set_vehicle_mod(ArmyTransport[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, false)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end		
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], -1)


            local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, false)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end					
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], 0)

                     local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, true)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], 1)


                     local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, true)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], 2)

                     local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, true)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end					
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], 3)


                     local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, true)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], 4)

                     local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, true)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], 5)


                     local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)
					

                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army2[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army2[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, true)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], 6)

		local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, true)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], 7)

		local i = #Army2 + 1
            Army2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army2 >= 10 then
                    end
                    q.eGod(Army2[i], false)
                    streaming.set_model_as_no_longer_needed(model)
                    ped.set_ped_combat_attributes(Army2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army2[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army2[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army2[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army2[i], 1, true)
                    ped.set_ped_combat_attributes(Army2[i], 3, true)
                    ped.set_ped_prop_index(Army2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Army2[i], 2, true)
                    ped.set_ped_combat_attributes(Army2[i], 52, false)
                    ped.set_ped_combat_attributes(Army2[i], 4, true)
                    ped.set_ped_combat_range(Army2[i], 2)
                    ped.set_ped_combat_ability(Army2[i], 2)
                    ped.set_ped_combat_movement(Army2[i], 1)
					ped.set_ped_max_health(Army2[i], 328.0)
                    ped.set_ped_health(Army2[i], 328.0)
                    ped.set_ped_config_flag(Army2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army2[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(Army2[i], ArmyTransport[y], 8)


                   while x.on do
                        ai.task_combat_ped(Army2[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Army2[i]) then return HANDLER_CONTINUE end
                            system.wait(25)
                            for i = 1, #Army2 do
                                system.wait(25)
                                ai.task_combat_ped(Army2[i], pedp, 0, 16)
                        if get_distance_between(pedp, Army2[i]) > 200 then
                            network.request_control_of_entity(Army2[i])
                         entity.set_entity_as_no_longer_needed(Army2[i])
                         network.request_control_of_entity(ArmyTransport[y])
                        entity.set_entity_as_no_longer_needed(ArmyTransport[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Army2 do
                    ped.get_all_peds(Army2[i])
        system.wait(25)
        network.request_control_of_entity(Army2[i])
                entity.set_entity_coords_no_offset(Army2[i], pos)
                entity.set_entity_as_no_longer_needed(Army2[i])
                entity.delete_entity(Army2[i])
                    end
                    for y = 1, #ArmyTransport do
                    vehicle.get_all_vehicles(ArmyTransport[y])
        system.wait(25)
        network.request_control_of_entity(ArmyTransport[y])
                entity.set_entity_coords_no_offset(ArmyTransport[y], pos)
                entity.set_entity_as_no_longer_needed(ArmyTransport[y])
                entity.delete_entity(ArmyTransport[y])
                end
            end)


-- Spawn a Marine Barrage
    x.Military_Unit = menu.add_player_feature("Spawn JUGGERNAUT", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 80
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("mp_m_fibsec_01")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Army3 + 1
            Army3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army3 >= 8 then
                    end
                    q.eGod(Army3[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0xF92AEC4D

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #ArmyBarrage + 1
                    ArmyBarrage[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(ArmyBarrage[y], false)
					vehicle.set_vehicle_mod_kit_type(ArmyBarrage[y], 0)
                    vehicle.get_vehicle_mod(ArmyBarrage[y], 0)
                    vehicle.set_vehicle_mod(ArmyBarrage[y], 0, 0, false)
					vehicle.set_vehicle_mod(ArmyBarrage[y], 0, 1, false)
                    ped.set_ped_combat_attributes(Army3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army3[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army3[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xA0D89C42)
		        ped.set_ped_combat_attributes(Army3[i], 0, false)
                    ped.set_ped_combat_attributes(Army3[i], 1, true)
                    ped.set_ped_combat_attributes(Army3[i], 3, true)
                    ped.set_ped_combat_attributes(Army3[i], 2, true)
                    ped.set_ped_combat_attributes(Army3[i], 52, false)
                    ped.set_ped_combat_attributes(Army3[i], 4, true)
                    ped.set_ped_combat_range(Army3[i], 2)
                    ped.set_ped_combat_ability(Army3[i], 2)
                    ped.set_ped_combat_movement(Army3[i], 3)
					ped.set_ped_max_health(Army3[i], 928.0)
                    ped.set_ped_health(Army3[i], 328.0)
                    ped.set_ped_config_flag(Army3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army3[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army3[i], ArmyBarrage[y], -1)


            local i = #Army3 + 1
            Army3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army3 >= 8 then
                    end
                    q.eGod(Army3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army3[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army3[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army3[i], 1, true)
                    ped.set_ped_combat_attributes(Army3[i], 3, true)
                    ped.set_ped_combat_attributes(Army3[i], 2, false)
                    ped.set_ped_combat_attributes(Army3[i], 52, false)
                    ped.set_ped_combat_attributes(Army3[i], 4, true)
                    ped.set_ped_combat_range(Army3[i], 2)
                    ped.set_ped_combat_ability(Army3[i], 2)
                   ped.set_ped_combat_movement(Army3[i], 3)
					ped.set_ped_max_health(Army3[i], 928.0)
                    ped.set_ped_health(Army3[i], 328.0)
                    ped.set_ped_config_flag(Army3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army3[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army3[i], ArmyBarrage[y], 0)

                     local i = #Army3 + 1
            Army3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army3 >= 8 then
                    end
                    q.eGod(Army3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army3[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army3[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army3[i], 1, true)
                    ped.set_ped_combat_attributes(Army3[i], 3, true)
                    ped.set_ped_combat_attributes(Army3[i], 2, true)
                    ped.set_ped_combat_attributes(Army3[i], 52, false)
                    ped.set_ped_combat_attributes(Army3[i], 4, true)
                    ped.set_ped_combat_range(Army3[i], 2)
                    ped.set_ped_combat_ability(Army3[i], 2)
                   ped.set_ped_combat_movement(Army3[i], 3)
					ped.set_ped_max_health(Army3[i], 928.0)
                    ped.set_ped_health(Army3[i], 328.0)
                    ped.set_ped_config_flag(Army3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army3[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army3[i], ArmyBarrage[y], 1)

			local i = #Army3 + 1
            Army3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army3 >= 8 then
                    end
                    q.eGod(Army3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army3[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army3[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army3[i], 1, true)
                    ped.set_ped_combat_attributes(Army3[i], 3, true)
                    ped.set_ped_combat_attributes(Army3[i], 2, true)
                    ped.set_ped_combat_attributes(Army3[i], 52, false)
                    ped.set_ped_combat_attributes(Army3[i], 4, true)
                    ped.set_ped_combat_range(Army3[i], 2)
                    ped.set_ped_combat_ability(Army3[i], 2)
                   ped.set_ped_combat_movement(Army3[i], 3)
					ped.set_ped_max_health(Army3[i], 928.0)
                    ped.set_ped_health(Army3[i], 328.0)
                    ped.set_ped_config_flag(Army3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army3[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army3[i], ArmyBarrage[y], 2)

			local i = #Army3 + 1
            Army3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army3 >= 8 then
                    end
                    q.eGod(Army3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army3[i], 0x83BF0278, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army3[i], 0x22D8FE39, 1, 1)
					weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x7BC4CDDC)
		   			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xC164F53)
			  		weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0x91109691)
	            			weapon.give_weapon_component_to_ped(Army3[i], 0x83BF0278, 0xA0D89C42)
                    ped.set_ped_combat_attributes(Army3[i], 1, true)
                    ped.set_ped_combat_attributes(Army3[i], 3, false)
		           ped.set_ped_combat_attributes(Army3[i], 2, true)
                    ped.set_ped_combat_attributes(Army3[i], 52, false)
                    ped.set_ped_combat_attributes(Army3[i], 4, true)
                    ped.set_ped_combat_range(Army3[i], 2)
                    ped.set_ped_combat_ability(Army3[i], 2)
                   ped.set_ped_combat_movement(Army3[i], 3)
					ped.set_ped_max_health(Army3[i], 928.0)
                    ped.set_ped_health(Army3[i], 328.0)
                    ped.set_ped_config_flag(Army3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army3[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army3[i], ArmyBarrage[y], 3)

                  while x.on do
                        ai.task_combat_ped(Army3[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Army3[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Army3 do
                                system.wait(25)
                                ai.task_combat_ped(Army3[i], pedp, 0, 16)
                        if get_distance_between(pedp, Army3[i]) > 200 then
                            network.request_control_of_entity(Army3[i])
                         entity.set_entity_as_no_longer_needed(Army3[i])
                         network.request_control_of_entity(ArmyBarrage[y])
                        entity.set_entity_as_no_longer_needed(ArmyBarrage[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Army3 do
                    ped.get_all_peds(Army3[i])
        system.wait(25)
        network.request_control_of_entity(Army3[i])
                entity.set_entity_coords_no_offset(Army3[i], pos)
                entity.set_entity_as_no_longer_needed(Army3[i])
                entity.delete_entity(Army3[i])
                    end
                    for y = 1, #ArmyBarrage do
                    vehicle.get_all_vehicles(ArmyBarrage[y])
        system.wait(25)
        network.request_control_of_entity(ArmyBarrage[y])
                entity.set_entity_coords_no_offset(ArmyBarrage[y], pos)
                entity.set_entity_as_no_longer_needed(ArmyBarrage[y])
                entity.delete_entity(ArmyBarrage[y])
                end
            end)
			

-- Spawn a Marine Insurgent Insurgent Pick-Up
    x.Military_Unit = menu.add_player_feature("Spawn Marine Insurgent Pick-Up", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 55
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Army7 + 1
            Army7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army7 >= 8 then
                    end
                    q.eGod(Army7[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x9114EADA

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #ArmyInsurgent2 + 1
                    ArmyInsurgent2[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(ArmyInsurgent2[y], false)
                    ped.set_ped_combat_attributes(Army7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army7[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army7[i], 1, true)
                    ped.set_ped_combat_attributes(Army7[i], 3, true)
                    ped.set_ped_combat_attributes(Army7[i], 2, false)
                    ped.set_ped_combat_attributes(Army7[i], 52, false)
                    ped.set_ped_combat_attributes(Army7[i], 4, true)
                    ped.set_ped_combat_range(Army7[i], 2)
                    ped.set_ped_combat_ability(Army7[i], 2)
                    ped.set_ped_combat_movement(Army7[i], 1)
					ped.set_ped_max_health(Army7[i], 328.0)
                    ped.set_ped_health(Army7[i], 328.0)
                    ped.set_ped_config_flag(Army7[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army7[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army7[i], ArmyInsurgent2[y], -1)


            local i = #Army7 + 1
            Army7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army7 >= 8 then
                    end
                    q.eGod(Army7[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army7[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army7[i], 1, true)
                    ped.set_ped_combat_attributes(Army7[i], 3, true)
                    ped.set_ped_combat_attributes(Army7[i], 2, false)
                    ped.set_ped_combat_attributes(Army7[i], 52, false)
                    ped.set_ped_combat_attributes(Army7[i], 4, true)
                    ped.set_ped_combat_range(Army7[i], 2)
                    ped.set_ped_combat_ability(Army7[i], 2)
                    ped.set_ped_combat_movement(Army7[i], 1)
					ped.set_ped_max_health(Army7[i], 328.0)
                    ped.set_ped_health(Army7[i], 328.0)
                    ped.set_ped_config_flag(Army7[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army7[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army7[i], ArmyInsurgent2[y], 0)

                     local i = #Army7 + 1
            Army7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army7 >= 8 then
                    end
                    q.eGod(Army7[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army7[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army7[i], 1, true)
                    ped.set_ped_combat_attributes(Army7[i], 3, true)
                    ped.set_ped_combat_attributes(Army7[i], 2, false)
                    ped.set_ped_combat_attributes(Army7[i], 52, false)
                    ped.set_ped_combat_attributes(Army7[i], 4, true)
                    ped.set_ped_combat_range(Army7[i], 2)
                    ped.set_ped_combat_ability(Army7[i], 2)
                    ped.set_ped_combat_movement(Army7[i], 1)
					ped.set_ped_max_health(Army7[i], 328.0)
                    ped.set_ped_health(Army7[i], 328.0)
                    ped.set_ped_config_flag(Army7[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army7[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army7[i], ArmyInsurgent2[y], 1)


                     local i = #Army7 + 1
            Army7[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army7 >= 8 then
                    end
                    q.eGod(Army7[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army7[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army7[i], 1, true)
                    ped.set_ped_combat_attributes(Army7[i], 3, true)
                    ped.set_ped_combat_attributes(Army7[i], 2, false)
                    ped.set_ped_combat_attributes(Army7[i], 52, false)
                    ped.set_ped_combat_attributes(Army7[i], 4, true)
                    ped.set_ped_combat_range(Army7[i], 2)
                    ped.set_ped_combat_ability(Army7[i], 2)
                    ped.set_ped_combat_movement(Army7[i], 1)
					ped.set_ped_max_health(Army7[i], 328.0)
                    ped.set_ped_health(Army7[i], 328.0)
                    ped.set_ped_config_flag(Army7[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army7[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army7[i], ArmyInsurgent2[y], 2)


                    ped.set_ped_combat_attributes(Army7[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army7[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army7[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army7[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army7[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army7[i], 1, true)
                    ped.set_ped_combat_attributes(Army7[i], 3, false)
                    ped.set_ped_combat_attributes(Army7[i], 2, true)
                    ped.set_ped_combat_attributes(Army7[i], 52, false)
                    ped.set_ped_combat_attributes(Army7[i], 4, true)
                    ped.set_ped_combat_range(Army7[i], 2)
                    ped.set_ped_combat_ability(Army7[i], 2)
                    ped.set_ped_combat_movement(Army7[i], 1)
					ped.set_ped_max_health(Army7[i], 328.0)
                    ped.set_ped_health(Army7[i], 328.0)
                    ped.set_ped_config_flag(Army7[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army7[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army7[i], ArmyInsurgent2[y], 7)
                   while x.on do
                        ai.task_combat_ped(Army7[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Army7[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Army7 do
                                system.wait(25)
                                ai.task_combat_ped(Army7[i], pedp, 0, 16)
                        if get_distance_between(pedp, Army7[i]) > 200 then
                            network.request_control_of_entity(Army7[i])
                         entity.set_entity_as_no_longer_needed(Army7[i])
                         network.request_control_of_entity(ArmyInsurgent2[y])
                        entity.set_entity_as_no_longer_needed(ArmyInsurgent2[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Army7 do
                    ped.get_all_peds(Army7[i])
        system.wait(25)
        network.request_control_of_entity(Army7[i])
                entity.set_entity_coords_no_offset(Army7[i], pos)
                entity.set_entity_as_no_longer_needed(Army7[i])
                entity.delete_entity(Army7[i])
                    end
                    for y = 1, #ArmyInsurgent2 do
                    vehicle.get_all_vehicles(ArmyInsurgent2[y])
        system.wait(25)
        network.request_control_of_entity(ArmyInsurgent2[y])
                entity.set_entity_coords_no_offset(ArmyInsurgent2[y], pos)
                entity.set_entity_as_no_longer_needed(ArmyInsurgent2[y])
                entity.delete_entity(ArmyInsurgent2[y])
                end
            end)


-- Spawn a Marine APC
    x.Military_Unit = menu.add_player_feature("Spawn Marine APC", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 66
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Army4 + 1
            Army4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army4 >= 8 then
                    end
                    q.eGod(Army4[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x2189D250

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #ArmyAPC + 1
                    ArmyAPC[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(ArmyAPC[y], false)
					vehicle.set_vehicle_mod_kit_type(ArmyAPC[y], 0)
                    vehicle.get_vehicle_mod(ArmyAPC[y], 40)
                    vehicle.set_vehicle_mod(ArmyAPC[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Army4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army4[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army4[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army4[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army4[i], 1, true)
                    ped.set_ped_combat_attributes(Army4[i], 3, false)
                    ped.set_ped_combat_attributes(Army4[i], 2, false)
                    ped.set_ped_combat_attributes(Army4[i], 52, false)
                    ped.set_ped_combat_attributes(Army4[i], 4, true)
                    ped.set_ped_combat_range(Army4[i], 2)
                    ped.set_ped_combat_ability(Army4[i], 2)
                    ped.set_ped_combat_movement(Army4[i], 2)
					ped.set_ped_max_health(Army4[i], 328.0)
                    ped.set_ped_health(Army4[i], 328.0)
                    ped.set_ped_config_flag(Army4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army4[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army4[i], ArmyAPC[y], -1)


            local i = #Army4 + 1
            Army4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army4 >= 8 then
                    end
                    q.eGod(Army4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army4[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army4[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army4[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army4[i], 1, true)
                    ped.set_ped_combat_attributes(Army4[i], 3, false)
                    ped.set_ped_combat_attributes(Army4[i], 2, true)
                    ped.set_ped_combat_attributes(Army4[i], 52, false)
                    ped.set_ped_combat_attributes(Army4[i], 4, true)
                    ped.set_ped_combat_range(Army4[i], 2)
                    ped.set_ped_combat_ability(Army4[i], 2)
                    ped.set_ped_combat_movement(Army4[i], 2)
					ped.set_ped_max_health(Army4[i], 328.0)
                    ped.set_ped_health(Army4[i], 328.0)
                    ped.set_ped_config_flag(Army4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army4[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army4[i], ArmyAPC[y], 0)

                     local i = #Army4 + 1
            Army4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army4 >= 8 then
                    end
                    q.eGod(Army4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army4[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army4[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army4[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army4[i], 1, true)
                    ped.set_ped_combat_attributes(Army4[i], 3, false)
                    ped.set_ped_combat_attributes(Army4[i], 2, true)
                    ped.set_ped_combat_attributes(Army4[i], 52, false)
                    ped.set_ped_combat_attributes(Army4[i], 4, true)
                    ped.set_ped_combat_range(Army4[i], 2)
                    ped.set_ped_combat_ability(Army4[i], 2)
                    ped.set_ped_combat_movement(Army4[i], 2)
					ped.set_ped_max_health(Army4[i], 328.0)
                    ped.set_ped_health(Army4[i], 328.0)
                    ped.set_ped_config_flag(Army4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army4[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army4[i], ArmyAPC[y], 1)


                     local i = #Army4 + 1
            Army4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army4 >= 8 then
                    end
                    q.eGod(Army4[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Army4[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army4[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army4[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army4[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army4[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army4[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army4[i], 1, true)
                    ped.set_ped_combat_attributes(Army4[i], 3, false)
                    ped.set_ped_combat_attributes(Army4[i], 2, true)
                    ped.set_ped_combat_attributes(Army4[i], 52, false)
                    ped.set_ped_combat_attributes(Army4[i], 4, true)
                    ped.set_ped_combat_range(Army4[i], 2)
                    ped.set_ped_combat_ability(Army4[i], 2)
                    ped.set_ped_combat_movement(Army4[i], 2)
					ped.set_ped_max_health(Army4[i], 328.0)
                    ped.set_ped_health(Army4[i], 328.0)
                    ped.set_ped_config_flag(Army4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army4[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army4[i], ArmyAPC[y], 2)
                   while x.on do
                        ai.task_combat_ped(Army4[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Army4[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Army4 do
                                system.wait(25)
                                ai.task_combat_ped(Army4[i], pedp, 0, 16)
                        if get_distance_between(pedp, Army4[i]) > 200 then
                            network.request_control_of_entity(Army4[i])
                         entity.set_entity_as_no_longer_needed(Army4[i])
                         network.request_control_of_entity(ArmyAPC[y])
                        entity.set_entity_as_no_longer_needed(ArmyAPC[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Army4 do
                    ped.get_all_peds(Army4[i])
        system.wait(25)
        network.request_control_of_entity(Army4[i])
                entity.set_entity_coords_no_offset(Army4[i], pos)
                entity.set_entity_as_no_longer_needed(Army4[i])
                entity.delete_entity(Army4[i])
                    end
                    for y = 1, #ArmyAPC do
                    vehicle.get_all_vehicles(ArmyAPC[y])
        system.wait(25)
        network.request_control_of_entity(ArmyAPC[y])
                entity.set_entity_coords_no_offset(ArmyAPC[y], pos)
                entity.set_entity_as_no_longer_needed(ArmyAPC[y])
                entity.delete_entity(ArmyAPC[y])
                end
            end)
			

-- Spawn a Marine Rhino Tank
    x.Military_Unit = menu.add_player_feature("Spawn Marine Rhino", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 40
            pos.y = pos.y + 0
           pos.z = pos.z + 4
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Army5 + 1
            Army5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Army5 >= 8 then
                    end
                    q.eGod(Army5[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x2EA68690

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #ArmyTank + 1
                    ArmyTank[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(ArmyTank[y], false)
                    ped.set_ped_combat_attributes(Army5[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Army5[i], 0x93E220BD, 1, 1)
					weapon.give_delayed_weapon_to_ped(Army5[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Army5[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Army5[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Army5[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Army5[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Army5[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Army5[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Army5[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Army5[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Army5[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Army5[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Army5[i], 1, true)
                    ped.set_ped_combat_attributes(Army5[i], 3, false)
                    ped.set_ped_combat_attributes(Army5[i], 2, true)
                    ped.set_ped_combat_attributes(Army5[i], 52, false)
                    ped.set_ped_combat_attributes(Army5[i], 4, true)
                    ped.set_ped_combat_range(Army5[i], 2)
                    ped.set_ped_combat_ability(Army5[i], 2)
                    ped.set_ped_combat_movement(Army5[i], 1)
					ped.set_ped_max_health(Army5[i], 328.0)
                    ped.set_ped_health(Army5[i], 328.0)
                    ped.set_ped_config_flag(Army5[i], 187, 0)
                    ped.set_ped_can_ragdoll(Army5[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Army5[i], ArmyTank[y], -1)
                   while x.on do
                        ai.task_combat_ped(Army5[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Army5[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Army5 do
                                system.wait(25)
                                ai.task_combat_ped(Army5[i], pedp, 0, 16)
                        if get_distance_between(pedp, Army5[i]) > 200 then
                            network.request_control_of_entity(Army5[i])
                         entity.set_entity_as_no_longer_needed(Army5[i])
                         network.request_control_of_entity(ArmyTank[y])
                        entity.set_entity_as_no_longer_needed(ArmyTank[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Army5 do
                    ped.get_all_peds(Army5[i])
        system.wait(25)
        network.request_control_of_entity(Army5[i])
                entity.set_entity_coords_no_offset(Army5[i], pos)
                entity.set_entity_as_no_longer_needed(Army5[i])
                entity.delete_entity(Army5[i])
                    end
                    for y = 1, #ArmyTank do
                    vehicle.get_all_vehicles(ArmyTank[y])
        system.wait(25)
        network.request_control_of_entity(ArmyTank[y])
                entity.set_entity_coords_no_offset(ArmyTank[y], pos)
                entity.set_entity_as_no_longer_needed(ArmyTank[y])
                entity.delete_entity(ArmyTank[y])
                end
            end)
			
			
-- Spawn a USAF Buzzard
    x.Military_Unit = menu.add_player_feature("Spawn USAF Buzzard", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 200
            pos.y = pos.y + 0
            pos.z = pos.z + 120
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Air3 + 1
            Air3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air3 >= 8 then
                    end
                    q.eGod(Air3[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x2F03547B

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #AirBuzzard + 1
                    AirBuzzard[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(AirBuzzard[y], false)
                    ped.set_ped_combat_attributes(Air3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air3[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Air3[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air3[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air3[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Air3[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air3[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Air3[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Air3[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Air3[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Air3[i], 1, true)
                    ped.set_ped_combat_attributes(Air3[i], 3, true)
                    ped.set_ped_prop_index(Air3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Air3[i], 2, true)
                    ped.set_ped_combat_attributes(Air3[i], 52, true)
                    ped.set_ped_combat_attributes(Air3[i], 4, true)
                    ped.set_ped_combat_range(Air3[i], 2)
                    ped.set_ped_combat_ability(Air3[i], 2)
                    ped.set_ped_combat_movement(Air3[i], 1)
					ped.set_ped_max_health(Air3[i], 328.0)
                    ped.set_ped_health(Air3[i], 328.0)
                    ped.set_ped_config_flag(Air3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air3[i], false)
                    for ii = 1, 26 do
                    end				
                    ped.set_ped_into_vehicle(Air3[i], AirBuzzard[y], -1)


            local i = #Air3 + 1
            Air3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air3 >= 8 then
                    end
                    q.eGod(Air3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Air3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air3[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(Air3[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air3[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0xC66B6542)	
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0x2E7957A)
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(Air3[i], 1, true)
                    ped.set_ped_combat_attributes(Air3[i], 3, true)
                    ped.set_ped_prop_index(Air3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Air3[i], 2, true)
                    ped.set_ped_combat_attributes(Air3[i], 52, false)
                    ped.set_ped_combat_attributes(Air3[i], 4, true)
                    ped.set_ped_combat_range(Air3[i], 2)
                    ped.set_ped_combat_ability(Air3[i], 2)
                    ped.set_ped_combat_movement(Air3[i], 1)
					ped.set_ped_max_health(Air3[i], 328.0)
                    ped.set_ped_health(Air3[i], 328.0)
                    ped.set_ped_config_flag(Air3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air3[i], false)
                    for ii = 1, 26 do
                    end									
                    ped.set_ped_into_vehicle(Air3[i], AirBuzzard[y], 1)


                     local i = #Air3 + 1
            Air3[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air3 >= 8 then
                    end
                    q.eGod(Air3[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Air3[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air3[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air3[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(Air3[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air3[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air3[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0xC66B6542)	
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0x2E7957A)
					weapon.give_weapon_component_to_ped(Air3[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(Air3[i], 1, true)
                    ped.set_ped_combat_attributes(Air3[i], 3, true)
                    ped.set_ped_prop_index(Air3[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Air3[i], 2, true)
                    ped.set_ped_combat_attributes(Air3[i], 52, false)
                    ped.set_ped_combat_attributes(Air3[i], 4, true)
                    ped.set_ped_combat_range(Air3[i], 2)
                    ped.set_ped_combat_ability(Air3[i], 2)
                    ped.set_ped_combat_movement(Air3[i], 1)
					ped.set_ped_max_health(Air3[i], 328.0)
                    ped.set_ped_health(Air3[i], 328.0)
                    ped.set_ped_config_flag(Air3[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air3[i], false)
                    for ii = 1, 26 do
                    end									
                    ped.set_ped_into_vehicle(Air3[i], AirBuzzard[y], 2)
                   while x.on do
                        ai.task_combat_ped(Air3[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Air3[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Air3 do
                                system.wait(25)
                                ai.task_combat_ped(Air3[i], pedp, 0, 16)
                        if get_distance_between(pedp, Air3[i]) > 4000 then
                            network.request_control_of_entity(Air3[i])
                         entity.set_entity_as_no_longer_needed(Air3[i])
                         network.request_control_of_entity(AirBuzzard[y])
                        entity.set_entity_as_no_longer_needed(AirBuzzard[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Air3 do
                    ped.get_all_peds(Air3[i])
        system.wait(25)
        network.request_control_of_entity(Air3[i])
                entity.set_entity_coords_no_offset(Air3[i], pos)
                entity.set_entity_as_no_longer_needed(Air3[i])
                entity.delete_entity(Air3[i])
                    end
                    for y = 1, #AirBuzzard do
                    vehicle.get_all_vehicles(AirBuzzard[y])
        system.wait(25)
        network.request_control_of_entity(AirBuzzard[y])
                entity.set_entity_coords_no_offset(AirBuzzard[y], pos)
                entity.set_entity_as_no_longer_needed(AirBuzzard[y])
                entity.delete_entity(AirBuzzard[y])
                end
            end)
			

     -- Spawn a USAF Savage
    x.Military_Unit = menu.add_player_feature("Spawn USAF Savage", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 400
            pos.y = pos.y + 0
            pos.z = pos.z + 150
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Air6 + 1
            Air6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air6 >= 8 then
                    end
                    q.eGod(Air6[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0xFB133A17

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #AirSavage + 1
                    AirSavage[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(AirSavage[y], false)
                    ped.set_ped_combat_attributes(Air6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air6[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air6[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Air6[i], 1, true)
                    ped.set_ped_combat_attributes(Air6[i], 3, false)
                    ped.set_ped_combat_attributes(Air6[i], 2, true)
                    ped.set_ped_combat_attributes(Air6[i], 52, true)
                    ped.set_ped_combat_attributes(Air6[i], 4, true)
					ped.set_ped_combat_attributes(Air6[i], 5, true)
                    ped.set_ped_combat_range(Air6[i], 2)
                    ped.set_ped_combat_ability(Air6[i], 2)
                    ped.set_ped_combat_movement(Air6[i], 1)
					ped.set_ped_max_health(Air6[i], 328.0)
                    ped.set_ped_health(Air6[i], 328.0)
                    ped.set_ped_config_flag(Air6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Air6[i], AirSavage[y], -1)


            local i = #Air6 + 1
            Air6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air6 >= 8 then
                    end
                    q.eGod(Air6[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Air6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air6[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air6[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Air6[i], 0xFAD1F1C9, 0x8B3C480B)
                    ped.set_ped_combat_attributes(Air6[i], 1, true)
                    ped.set_ped_combat_attributes(Air6[i], 3, false)
                    ped.set_ped_combat_attributes(Air6[i], 2, true)
                    ped.set_ped_combat_attributes(Air6[i], 52, true)
                    ped.set_ped_combat_attributes(Air6[i], 4, true)
                    ped.set_ped_combat_range(Air6[i], 2)
                    ped.set_ped_combat_ability(Air6[i], 2)
                    ped.set_ped_combat_movement(Air6[i], 1)
					ped.set_ped_max_health(Air6[i], 328.0)
                    ped.set_ped_health(Air6[i], 328.0)
                    ped.set_ped_config_flag(Air6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Air6[i], AirSavage[y], 0)


                     local i = #Air6 + 1
            Air6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air6 >= 8 then
                    end
                    q.eGod(Air6[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Air6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air6[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air6[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0xC66B6542)	
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0x2E7957A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(Air6[i], 1, true)
                    ped.set_ped_combat_attributes(Air6[i], 3, false)
                    ped.set_ped_combat_attributes(Air6[i], 2, true)
                    ped.set_ped_combat_attributes(Air6[i], 52, true)
                    ped.set_ped_combat_attributes(Air6[i], 4, true)
                    ped.set_ped_combat_range(Air6[i], 2)
                    ped.set_ped_combat_ability(Air6[i], 2)
                    ped.set_ped_combat_movement(Air6[i], 1)
					ped.set_ped_max_health(Air6[i], 328.0)
                    ped.set_ped_health(Air6[i], 328.0)
                    ped.set_ped_config_flag(Air6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Air6[i], AirSavage[y], 1)


                     local i = #Air6 + 1
            Air6[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air6 >= 8 then
                    end
                    q.eGod(Air6[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Air6[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air6[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air6[i], 0xDBBD7280, 1, 1)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air6[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0x57EF1CC8)
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0xC66B6542)	
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0x2E7957A)
					weapon.give_weapon_component_to_ped(Air6[i], 0xDBBD7280, 0xB5E2575B)
                    ped.set_ped_combat_attributes(Air6[i], 1, true)
                    ped.set_ped_combat_attributes(Air6[i], 3, false)
                    ped.set_ped_combat_attributes(Air6[i], 2, true)
                    ped.set_ped_combat_attributes(Air6[i], 52, true)
                    ped.set_ped_combat_attributes(Air6[i], 4, true)
                    ped.set_ped_combat_range(Air6[i], 2)
                    ped.set_ped_combat_ability(Air6[i], 2)
                    ped.set_ped_combat_movement(Air6[i], 1)
					ped.set_ped_max_health(Air6[i], 328.0)
                    ped.set_ped_health(Air6[i], 328.0)
                    ped.set_ped_config_flag(Air6[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air6[i], false)
                    for ii = 1, 26 do
                    end
                    ped.set_ped_into_vehicle(Air6[i], AirSavage[y], 2)
                   while x.on do
                        ai.task_combat_ped(Air6[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Air6[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Air6 do
                                system.wait(25)
                                ai.task_combat_ped(Air6[i], pedp, 0, 16)
                        if get_distance_between(pedp, Air6[i]) > 4000 then
                            network.request_control_of_entity(Air6[i])
                         entity.set_entity_as_no_longer_needed(Air6[i])
                         network.request_control_of_entity(AirSavage[y])
                        entity.set_entity_as_no_longer_needed(AirSavage[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Air6 do
                    ped.get_all_peds(Air6[i])
        system.wait(25)
        network.request_control_of_entity(Air6[i])
                entity.set_entity_coords_no_offset(Air6[i], pos)
                entity.set_entity_as_no_longer_needed(Air6[i])
                entity.delete_entity(Air6[i])
                    end
                    for y = 1, #AirSavage do
                    vehicle.get_all_vehicles(AirSavage[y])
        system.wait(25)
        network.request_control_of_entity(AirSavage[y])
                entity.set_entity_coords_no_offset(AirSavage[y], pos)
                entity.set_entity_as_no_longer_needed(AirSavage[y])
                entity.delete_entity(AirSavage[y])
                end
            end)


     -- Spawn a USAF Valkyrie
    x.Noose_Team = menu.add_player_feature("Spawn USAF Valkyrie", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 400
            pos.y = pos.y + 0
            pos.z = pos.z + 150
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Air2 + 1
            Air2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air2 >= 8 then
                    end
                    q.eGod(Air2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x5BFA5C4B

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #AirValkyrie + 1
                    AirValkyrie[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(AirValkyrie[y], false)
					vehicle.set_vehicle_mod_kit_type(AirValkyrie[y], 0)
                    vehicle.get_vehicle_mod(AirValkyrie[y], 40)
                    vehicle.set_vehicle_mod(AirValkyrie[y], 40, 3, true)
                    ped.set_ped_combat_attributes(Air2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air2[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air2[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Air2[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air2[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air2[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x8B3C480B)					
					ped.set_ped_prop_index(Air2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Air2[i], 1, true)
                    ped.set_ped_combat_attributes(Air2[i], 3, false)
                    ped.set_ped_combat_attributes(Air2[i], 2, false)
                    ped.set_ped_combat_attributes(Air2[i], 52, false)
                    ped.set_ped_combat_attributes(Air2[i], 4, true)
                    ped.set_ped_combat_range(Air2[i], 2)
                    ped.set_ped_combat_ability(Air2[i], 2)
                    ped.set_ped_combat_movement(Air2[i], 1)
					ped.set_ped_max_health(Air2[i], 328.0)
                    ped.set_ped_health(Air2[i], 328.0)
                    ped.set_ped_config_flag(Air2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air2[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Air2[i], ii)
                    end
                    ped.set_ped_into_vehicle(Air2[i], AirValkyrie[y], -1)


            local i = #Air2 + 1
            Air2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air2 >= 8 then
                    end
                    q.eGod(Air2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Air2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air2[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air2[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Air2[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air2[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air2[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x8B3C480B)					
					ped.set_ped_prop_index(Air2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Air2[i], 1, true)
                    ped.set_ped_combat_attributes(Air2[i], 3, false)
                    ped.set_ped_combat_attributes(Air2[i], 2, true)
                    ped.set_ped_combat_attributes(Air2[i], 52, false)
                    ped.set_ped_combat_attributes(Air2[i], 4, true)
                    ped.set_ped_combat_range(Air2[i], 2)
                    ped.set_ped_combat_ability(Air2[i], 2)
                    ped.set_ped_combat_movement(Air2[i], 1)
					ped.set_ped_max_health(Air2[i], 328.0)
                    ped.set_ped_health(Air2[i], 328.0)
                    ped.set_ped_config_flag(Air2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air2[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Air2[i], ii)
                    end
                    ped.set_ped_into_vehicle(Air2[i], AirValkyrie[y], 1)


            local i = #Air2 + 1
            Air2[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air2 >= 8 then
                    end
                    q.eGod(Air2[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    ped.set_ped_combat_attributes(Air2[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air2[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air2[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Air2[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air2[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air2[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Air2[i], 0xFAD1F1C9, 0x8B3C480B)
					ped.set_ped_prop_index(Air2[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Air2[i], 1, true)
                    ped.set_ped_combat_attributes(Air2[i], 3, false)
                    ped.set_ped_combat_attributes(Air2[i], 2, true)
                    ped.set_ped_combat_attributes(Air2[i], 52, false)
                    ped.set_ped_combat_attributes(Air2[i], 4, true)
                    ped.set_ped_combat_range(Air2[i], 2)
                    ped.set_ped_combat_ability(Air2[i], 2)
                    ped.set_ped_combat_movement(Air2[i], 1)
					ped.set_ped_max_health(Air2[i], 328.0)
                    ped.set_ped_health(Air2[i], 328.0)
                    ped.set_ped_config_flag(Air2[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air2[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Air2[i], ii)
                    end
                    ped.set_ped_into_vehicle(Air2[i], AirValkyrie[y], 2)
                   while x.on do
                        ai.task_combat_ped(Air2[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Air2[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Air2 do
                                system.wait(25)
                                ai.task_combat_ped(Air2[i], pedp, 0, 16)
                        if get_distance_between(pedp, Air2[i]) > 4000 then
                            network.request_control_of_entity(Air2[i])
                         entity.set_entity_as_no_longer_needed(Air2[i])
                         network.request_control_of_entity(AirValkyrie[y])
                        entity.set_entity_as_no_longer_needed(AirValkyrie[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Air2 do
                    ped.get_all_peds(Air2[i])
        system.wait(25)
        network.request_control_of_entity(Air2[i])
                entity.set_entity_coords_no_offset(Air2[i], pos)
                entity.set_entity_as_no_longer_needed(Air2[i])
                entity.delete_entity(Air2[i])
                    end
                    for y = 1, #AirValkyrie do
                    vehicle.get_all_vehicles(AirValkyrie[y])
        system.wait(25)
        network.request_control_of_entity(AirValkyrie[y])
                entity.set_entity_coords_no_offset(AirValkyrie[y], pos)
                entity.set_entity_as_no_longer_needed(AirValkyrie[y])
                entity.delete_entity(AirValkyrie[y])
                end
            end)


     -- Spawn a USAF Hunter
    x.Military_Unit = menu.add_player_feature("Spawn USAF Hunter", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 400
            pos.y = pos.y + 0
            pos.z = pos.z + 150
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Air1 + 1
            Air1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air1 >= 8 then
                    end
                    q.eGod(Air1[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0xFD707EDE

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #AirHunter + 1
                    AirHunter[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(AirHunter[y], false)
					vehicle.set_vehicle_mod_kit_type(AirHunter[y], 0)
                    vehicle.get_vehicle_mod(AirHunter[y], 10)
                    vehicle.set_vehicle_mod(AirHunter[y], 10, 0, false)
                    ped.set_ped_combat_attributes(Air1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air1[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air1[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Air1[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air1[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air1[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x8B3C480B)					
					ped.set_ped_prop_index(Air1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Air1[i], 1, true)
                    ped.set_ped_combat_attributes(Air1[i], 3, false)
                    ped.set_ped_combat_attributes(Air1[i], 2, false)
                    ped.set_ped_combat_attributes(Air1[i], 52, false)
                    ped.set_ped_combat_attributes(Air1[i], 4, true)
                    ped.set_ped_combat_range(Air1[i], 2)
                    ped.set_ped_combat_ability(Air1[i], 2)
                    ped.set_ped_combat_movement(Air1[i], 1)
					ped.set_ped_max_health(Air1[i], 328.0)
                    ped.set_ped_health(Air1[i], 328.0)
                    ped.set_ped_config_flag(Air1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air1[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Air1[i], ii)
                    end
                    ped.set_ped_into_vehicle(Air1[i], AirHunter[y], -1)


            local i = #Air1 + 1
            Air1[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air1 >= 8 then
                    end
                    q.eGod(Air1[i], false)
                    streaming.set_model_as_no_longer_needed(model)


                    ped.set_ped_combat_attributes(Air1[i], 46, true)
					weapon.give_delayed_weapon_to_ped(Air1[i], 0xBFE256D4, 1, 1)
                    weapon.give_delayed_weapon_to_ped(Air1[i], 0xFAD1F1C9, 1, 1)
					weapon.give_weapon_component_to_ped(Air1[i], 0xBFE256D4, 0x4F37DF2A)
					weapon.give_weapon_component_to_ped(Air1[i], 0xBFE256D4, 0x43FD595B)
					weapon.give_weapon_component_to_ped(Air1[i], 0xBFE256D4, 0x21E34793)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x44032F11)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x9D65907A)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x7BC4CDDC)	
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0xC66B6542)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x4DB62ABE)
					weapon.give_weapon_component_to_ped(Air1[i], 0xFAD1F1C9, 0x8B3C480B)
					ped.set_ped_prop_index(Air1[i], 0, 0, 0, 0)
                    ped.set_ped_combat_attributes(Air1[i], 1, true)
                    ped.set_ped_combat_attributes(Air1[i], 3, false)
                    ped.set_ped_combat_attributes(Air1[i], 2, true)
                    ped.set_ped_combat_attributes(Air1[i], 52, false)
                    ped.set_ped_combat_attributes(Air1[i], 4, true)
                    ped.set_ped_combat_range(Air1[i], 2)
                    ped.set_ped_combat_ability(Air1[i], 2)
                    ped.set_ped_combat_movement(Air1[i], 1)
					ped.set_ped_max_health(Air1[i], 328.0)
                    ped.set_ped_health(Air1[i], 328.0)
                    ped.set_ped_config_flag(Air1[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air1[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Air1[i], ii)
                    end
                    ped.set_ped_into_vehicle(Air1[i], AirHunter[y], 0)
                   while x.on do
                        ai.task_combat_ped(Air1[i], pedp, 0, 16)
                        system.wait(25)
						if entity.is_entity_dead(Air1[i]) then return HANDLER_CONTINUE end
                            for i = 1, #Air1 do
                                system.wait(25)
                                ai.task_combat_ped(Air1[i], pedp, 0, 16)
                        if get_distance_between(pedp, Air1[i]) > 4000 then
                            network.request_control_of_entity(Air1[i])
                         entity.set_entity_as_no_longer_needed(Air1[i])
                         network.request_control_of_entity(AirHunter[y])
                        entity.set_entity_as_no_longer_needed(AirHunter[y])
                    end
                end
                end
                while x.off do return HANDLER_POP
                end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Air1 do
                    ped.get_all_peds(Air1[i])
        system.wait(25)
        network.request_control_of_entity(Air1[i])
                entity.set_entity_coords_no_offset(Air1[i], pos)
                entity.set_entity_as_no_longer_needed(Air1[i])
                entity.delete_entity(Air1[i])
                    end
                    for y = 1, #AirHunter do
                    vehicle.get_all_vehicles(AirHunter[y])
        system.wait(25)
        network.request_control_of_entity(AirHunter[y])
                entity.set_entity_coords_no_offset(AirHunter[y], pos)
                entity.set_entity_as_no_longer_needed(AirHunter[y])
                entity.delete_entity(AirHunter[y])
                end
            end)


-- Spawn a USAF Lazer
    x.Military_Unit = menu.add_player_feature("Spawn USAF P-996 Lazer", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 600
            pos.y = pos.y + 0
            pos.z = pos.z + 300
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Air4 + 1
            Air4[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air4 >= 8 then
                    end
                    q.eGod(Air4[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0xB39B0AE6

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #AirLazer + 1
                    AirLazer[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(AirLazer[y], false)
                    vehicle.set_vehicle_mod_kit_type(AirLazer[y], 0)
                    vehicle.get_vehicle_mod(AirLazer[y], 10)
                    vehicle.set_vehicle_mod(AirLazer[y], 10, 0, false)
                    ped.set_ped_combat_attributes(Air4[i], 46, true)
                    weapon.give_delayed_weapon_to_ped(Air4[i], 0x5EF9FEC4, 1, 1)
                    ped.set_ped_combat_attributes(Air4[i], 1, true)
                    ped.set_ped_combat_attributes(Air4[i], 3, false)
                    ped.set_ped_combat_attributes(Air4[i], 2, true)
                    ped.set_ped_combat_attributes(Air4[i], 52, true)
                    ped.set_ped_combat_attributes(Air4[i], 4, true)
					ped.set_ped_combat_attributes(Air4[i], 5, true)
                    vehicle.control_landing_gear(AirLazer[y], 3)
                    vehicle.get_landing_gear_state(AirLazer[y])
                    ped.set_ped_combat_range(Air4[i], 2)
                    ped.set_ped_combat_ability(Air4[i], 2)
                    ped.set_ped_combat_movement(Air4[i], 1)
					ped.set_ped_max_health(Air4[i], 328.0)
                    ped.set_ped_health(Air4[i], 328.0)
                    ped.set_ped_config_flag(Air4[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air4[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Air4[i], ii)
                    end							
                    ped.set_ped_into_vehicle(Air4[i], AirLazer[y], -1)
                    while x.on do
                        ai.task_combat_ped(Air4[i], pedp, 0, 16)
                        system.wait(25)
                            if entity.is_entity_dead(Air4[i])  then return HANDLER_CONTINUE end
                            system.wait(25)
                            for i = 1, #Air4 do
                                system.wait(25)
                                ai.task_combat_ped(Air4[i], pedp, 0, 16)
                        if get_distance_between(pedp, Air4[i]) > 8000 then
                            network.request_control_of_entity(Air4[i])
                         entity.set_entity_as_no_longer_needed(Air4[i])
                         network.request_control_of_entity(AirLazer[y])
                        entity.set_entity_as_no_longer_needed(AirLazer[y])
                    end
                end
                end
while x.off do return HANDLER_POP
end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Air4 do
        ped.get_all_peds(Air4[i])
        system.wait(25)
        network.request_control_of_entity(Air4[i])
                entity.set_entity_coords_no_offset(Air4[i], pos)
                entity.set_entity_as_no_longer_needed(Air4[i])
                entity.delete_entity(Air4[i])
                    end
                    for y = 1, #AirLazer do
                    vehicle.get_all_vehicles(AirLazer[y])
        system.wait(25)
        network.request_control_of_entity(AirLazer[y])
                entity.set_entity_coords_no_offset(AirLazer[y], pos)
                entity.set_entity_as_no_longer_needed(AirLazer[y])
                entity.delete_entity(AirLazer[y])
                end
            end)


-- Spawn a USAF Strikeforce
    x.Military_Unit = menu.add_player_feature("Spawn USAF B-11 Strikeforce", "toggle", x.Military, function(x, pid)
        local pos = v3()
        local pedp = player.get_player_ped(pid)
            pos = player.get_player_coords(pid)
            pos.x = pos.x + 600
            pos.y = pos.y + 0
            pos.z = pos.z + 300
            system.wait(100)
        local model = gameplay.get_hash_key("s_m_y_marine_03")
                    streaming.request_model(model)

                    while (not streaming.has_model_loaded(model)) do
                        system.wait(10)
                    end
        local i = #Air5 + 1
            Air5[i] = ped.create_ped(6, model, pos, pos.z, true, false)
                    if #Air5 >= 8 then
                    end
                    q.eGod(Air5[i], false)
                    streaming.set_model_as_no_longer_needed(model)

                    local vehhash = 0x64DE07A1

                    streaming.request_model(vehhash)
                    while (not streaming.has_model_loaded(vehhash)) do
                        system.wait(10)
                    end

                    local y = #AirStrike + 1
                    AirStrike[y] = vehicle.create_vehicle(vehhash, pos, pos.z, true, false)
                    entity.set_entity_god_mode(AirStrike[y], false)
                    vehicle.set_vehicle_mod_kit_type(AirStrike[y], 0)
                    vehicle.get_vehicle_mod(AirStrike[y], 10)
                    vehicle.set_vehicle_mod(AirStrike[y], 10, 0, false)
                    ped.set_ped_combat_attributes(Air5[i], 46, true)
                    weapon.give_delayed_weapon_to_ped(Air5[i], 0x5EF9FEC4, 1, 1)
                    ped.set_ped_combat_attributes(Air5[i], 1, true)
                    ped.set_ped_combat_attributes(Air5[i], 3, false)
                    ped.set_ped_combat_attributes(Air5[i], 2, true)
                    ped.set_ped_combat_attributes(Air5[i], 52, true)
                    ped.set_ped_combat_attributes(Air5[i], 4, true)
					ped.set_ped_combat_attributes(Air5[i], 5, true)
                    vehicle.control_landing_gear(AirStrike[y], 3)
                    vehicle.get_landing_gear_state(AirStrike[y])
                    ped.set_ped_combat_range(Air5[i], 2)
                    ped.set_ped_combat_ability(Air5[i], 2)
                    ped.set_ped_combat_movement(Air5[i], 1)
					ped.set_ped_max_health(Air5[i], 328.0)
                    ped.set_ped_health(Air5[i], 328.0)
                    ped.set_ped_config_flag(Air5[i], 187, 0)
                    ped.set_ped_can_ragdoll(Air5[i], false)
                    for ii = 1, 26 do
                        ped.set_ped_ragdoll_blocking_flags(Air5[i], ii)
                    end							
                    ped.set_ped_into_vehicle(Air5[i], AirStrike[y], -1)
                    while x.on do
                        ai.task_combat_ped(Air5[i], pedp, 0, 16)
                        system.wait(25)
                            if entity.is_entity_dead(Air5[i])  then return HANDLER_CONTINUE end
                            system.wait(25)
                            for i = 1, #Air5 do
                                system.wait(25)
                                ai.task_combat_ped(Air5[i], pedp, 0, 16)
                        if get_distance_between(pedp, Air5[i]) > 8000 then
                            network.request_control_of_entity(Air5[i])
                         entity.set_entity_as_no_longer_needed(Air5[i])
                         network.request_control_of_entity(AirStrike[y])
                        entity.set_entity_as_no_longer_needed(AirStrike[y])
                    end
                end
                end
while x.off do return HANDLER_POP
end
local pos = v3()
    pos.x = -5784.258301
    pos.y = -8289.385742
    pos.z = -136.411270
                    for i = 1, #Air5 do
        ped.get_all_peds(Air5[i])
        system.wait(25)
        network.request_control_of_entity(Air5[i])
                entity.set_entity_coords_no_offset(Air5[i], pos)
                entity.set_entity_as_no_longer_needed(Air5[i])
                entity.delete_entity(Air5[i])
                    end
                    for y = 1, #AirStrike do
                    vehicle.get_all_vehicles(AirStrike[y])
        system.wait(25)
        network.request_control_of_entity(AirStrike[y])
                entity.set_entity_coords_no_offset(AirStrike[y], pos)
                entity.set_entity_as_no_longer_needed(AirStrike[y])
                entity.delete_entity(AirStrike[y])
                end
            end)
