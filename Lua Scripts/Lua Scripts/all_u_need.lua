local Vehicle_Sync_List = {
    0xE5A2D6C6,
    0x82CAC433
}



local Bubatz_Sync_List = {
    2633113103,
	3471458123,
	630371791,
	3602674979,
	3852654278
}




function World_Object_Crash(pid)
    if pid ~= players.user() and players.exists(pid) then

        for i = 1, 11 do
			while not STREAMING.HAS_MODEL_LOADED(Object_Crash_model_list[i]) do
				STREAMING.REQUEST_MODEL(Object_Crash_model_list[i])
				util.yield()
			end
		end

		Create = {}
		menu.trigger_commands("anticrashcamera on")

		notification("Sending Objects", "~b~")
		for i = 1, 11 do
			local PlayerPed = PLAYER.GET_PLAYER_PED(pid)
			local GetPlayerCoords = ENTITY.GET_ENTITY_COORDS(PlayerPed, true)
			local Coord = GetPlayerCoords
			Coord.x = Coord.x + math.random(-1, 1)
			Coord.y = Coord.y + math.random(-1, 1)
			Coord.z = Coord.z + math.random(-1, 1)

			Create[i] = entities.create_object(Object_Crash_model_list[i], Coord)
		end

		util.yield(5000)

		notification("Deleteting Objects", "~b~")

		
		for g = 1, 80 do
			for i = 1, 11 do
				entities.delete_by_handle(Create[i])
			end
		end
	end   
	notification("Done", "~u~")

    util.yield(500)
    notification("re-cleaning to make sure anything is removed", "~b~")

    menu.trigger_commands("woosh")
    util.yield(1000)

    notification("Donex2", "~b~")
	menu.trigger_commands("anticrashcamera off")
end







function Bubatz_Sync_Crash(pid)
    if pid ~= players.user() and players.exists(pid) then
		notification("Sending Sync", "~b~")
        for Load = 1, 5 do
            while not STREAMING.HAS_MODEL_LOADED(Bubatz_Sync_List[Load]) do
                STREAMING.REQUEST_MODEL(Bubatz_Sync_List[Load])
                util.yield()
            end

            local random_num_0_4 = math.random(0, 4)
            local Create_Vehicle_1 = {}
            local Create_Vehicle_2 = {}
            local Create_Vehicle_3 = {}
            local Create_Vehicle_4 = {}
            local Create_Vehicle_5 = {}
            local Create_Vehicle_6 = {}
            local Create_Vehicle_7 = {}
            local Create_Vehicle_8 = {}
            local random_num_5_10 = math.random(5, 10)

            for i = 1, random_num_5_10 do
                local Player_Ped = PLAYER.GET_PLAYER_PED(pid)
                local Get_Player_Coords = ENTITY.GET_ENTITY_COORDS(Player_Ped, true)
                local RenderCam = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                local Coords = Get_Player_Coords
                Coords.x = Coords.x
                Coords.y = Coords.y
                Coords.z = Coords.z

                Create_Vehicle_1[i] = entities.create_vehicle(2633113103, Coords, RenderCam)
                ENTITY.SET_ENTITY_INVINCIBLE(Create_Vehicle_1[i], true)
                ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_1[i], false, 0)

                Create_Vehicle_2[i] = entities.create_vehicle(2633113103, Coords, RenderCam)
                ENTITY.SET_ENTITY_INVINCIBLE(Create_Vehicle_2[i], true)
                if random_num_0_4 ~= 0 then
                    if random_num_0_4 == 1 then
                        ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_2[i], true, 0)
                    else
                        ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_2[i], false, 0)
                    end
                end

                Create_Vehicle_3[i] = entities.create_vehicle(3471458123, Coords, RenderCam)
                ENTITY.SET_ENTITY_INVINCIBLE(Create_Vehicle_3[i], true)
                ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_3[i], false, 0)

                Create_Vehicle_4[i] = entities.create_vehicle(3471458123, Coords, RenderCam)
                ENTITY.SET_ENTITY_INVINCIBLE(Create_Vehicle_4[i], true)
                if random_num_0_4 ~= 0 then
                    if random_num_0_4 == 2 then
                        ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_4[i], true, 0)
                    else
                        ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_4[i], false, 0)
                    end
                end

                Create_Vehicle_6[i] = entities.create_vehicle(630371791, Coords, RenderCam)
                ENTITY.SET_ENTITY_INVINCIBLE(Create_Vehicle_6[i], true)
                ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_6[i], false, 0)

                Create_Vehicle_7[i] = entities.create_vehicle(630371791, Coords, RenderCam)
                ENTITY.SET_ENTITY_INVINCIBLE(Create_Vehicle_6[i], true)
                if random_num_0_4 ~= 0 then
                    if random_num_0_4 == 3 then
                        ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_7[i], true, 0)
                    else
                        ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_7[i], false, 0)
                    end
                end

                Create_Vehicle_8[i] = entities.create_vehicle(3602674979, Coords, RenderCam)
                ENTITY.SET_ENTITY_INVINCIBLE(Create_Vehicle_8[i], true)
                ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_8[i], false, 0)

                if random_num_0_4 ~= 0 then
                    if random_num_0_4 == 3 then
                        ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_8[i], true, 0)
                    else
                        ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_8[i], false, 0)
                    end
                end

                Create_Vehicle_5[i] = entities.create_vehicle(3852654278, Coords, RenderCam)
                ENTITY.SET_ENTITY_INVINCIBLE(Create_Vehicle_5[i], true)
                if random_num_0_4 ~= 0 then
                    ENTITY.SET_ENTITY_VISIBLE(Create_Vehicle_5[i], false, 0)
                end

                ENTITY.ATTACH_ENTITY_TO_ENTITY(Create_Vehicle_8[i], Create_Vehicle_5[i], 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(Create_Vehicle_7[i], Create_Vehicle_5[i], 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(Create_Vehicle_6[i], Create_Vehicle_5[i], 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(Create_Vehicle_3[i], Create_Vehicle_5[i], 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(Create_Vehicle_4[i], Create_Vehicle_5[i], 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(Create_Vehicle_1[i], Create_Vehicle_5[i], 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(Create_Vehicle_2[i], Create_Vehicle_5[i], 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(Create_Vehicle_5[i], Player_Ped, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)

                util.yield(10)
            end

            util.yield(2000)

            for i = 1, random_num_5_10 do
                util.toast("Deleting Stack"..random_num_5_10)
                util.log("Deleting Stack"..random_num_5_10)
                entities.delete_by_handle(Create_Vehicle_1[i])
                entities.delete_by_handle(Create_Vehicle_2[i])
                entities.delete_by_handle(Create_Vehicle_3[i])
                entities.delete_by_handle(Create_Vehicle_4[i])
                entities.delete_by_handle(Create_Vehicle_5[i])
                entities.delete_by_handle(Create_Vehicle_6[i])
                entities.delete_by_handle(Create_Vehicle_7[i])
                entities.delete_by_handle(Create_Vehicle_8[i])
                util.yield()
            end
        end
    end
	notification("Done", "~u~")
end




menu.action(vehiclesynccrashes,"Vehicle Sync", {"vehsync"}, "Crash the player with an vehicle",function()
        Vehicle_Sync_Crash(pid)
    end)




menu.action(vehiclesynccrashes,"Bubatz Sync", {"vehsync2"}, "Crash the player with an vehicle spam",function()
        Bubatz_Sync_Crash(pid)
    end)



menu.action(vehiclesynccrashes,"Veh AIO Crash", {"vehsync3"}, "All vehicle sync crashes in one", function()
        if pid ~= players.user() then      
            menu.trigger_commands("vehsync " .. PLAYER.GET_PLAYER_NAME(pid))
            menu.trigger_commands("vehsync2 " .. PLAYER.GET_PLAYER_NAME(pid))
        end
    end)