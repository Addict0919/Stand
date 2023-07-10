local Menu = require'Menu_World'
local RequestEntityControl = require'RequestEntityControl'
local menu = menu

local MemoryPointer

local util_yield = util.yield
local entities_pointer_to_handle = entities.pointer_to_handle
local function DeleteEntity_Passively(EntityPointer)
	pcall(function()
		local EntityHandle
		while true do
			EntityHandle = entities_pointer_to_handle(EntityPointer)
			if DoesEntityExist(EntityHandle) and NetworkRequestControlOfEntity(EntityHandle) then
				SetEntityAsMissionEntity(EntityHandle, true, true)
				SetEntityCleanupByEngine(EntityHandle, true)
				memory.write_int(MemoryPointer, EntityHandle)
				SetEntityAsNoLongerNeeded(MemoryPointer)
				return
			end
--			ReleaseScriptGuidFromEntity(EntityHandle)
			util_yield()
		end
	end)
end
--local entities_delete_by_pointer = entities.delete_by_pointer
local function DeleteEntity_Forcefully(EntityPointer)
	pcall(function()
		--entities_delete_by_pointer(EntityPointer)
		local EntityHandle
		while true do
			EntityHandle = entities_pointer_to_handle(EntityPointer)
			if DoesEntityExist(EntityHandle) and NetworkRequestControlOfEntity(EntityHandle) then
				SetEntityAsMissionEntity(EntityHandle, true, true)
				SetEntityCleanupByEngine(EntityHandle, true)
				memory.write_int(MemoryPointer, EntityHandle)
				DeleteEntity(MemoryPointer)
				return
			end
			ReleaseScriptGuidFromEntity(EntityHandle)
			util_yield()
		end
	end)
end

local MenuOptions = {[1]=0,[2]=0,[3]=0,[4]=0,[5]=0,[6]=0} Info.MenuOptionsCleanup = MenuOptions
return{
	init	=	function()
					MemoryPointer = memory.alloc()
					
					local MenuOptions = MenuOptions
					local menu_action = menu.action
					local util_create_thread = util.create_thread
					
					do
						--Add check for if player owned or is inside
						local entities_get_all_vehicles_as_pointers = entities.get_all_vehicles_as_pointers
						MenuOptions[1] = menu_action(Menu, "Vehicles Remove/Delete Passively", {}, "", function()
							local table = entities_get_all_vehicles_as_pointers()
							for i=1, #table do
								util_create_thread(DeleteEntity_Passively, table[i])
							end
						end)
						MenuOptions[2] = menu_action(Menu, "Vehicles Remove/Delete Forcefully", {}, "", function()
							local table = entities_get_all_vehicles_as_pointers()
							for i=1, #table do
								util_create_thread(DeleteEntity_Forcefully, table[i])
							end
						end)
					end
					
					do
						local entities_get_all_peds_as_pointers = entities.get_all_peds_as_pointers
						local entities_pointer_to_handle = entities_pointer_to_handle
						local IsPedAPlayer = IsPedAPlayer
						MenuOptions[3] = menu_action(Menu, "Peds Remove/Delete Passively", {}, "", function()
							local table = entities_get_all_peds_as_pointers()
							local PlayersPed = Info.Player.Ped
							local EntityPointer, EntityHandle
							for i=1, #table do
								EntityPointer = table[i]
								EntityHandle = entities_pointer_to_handle(EntityPointer)
								if not IsPedAPlayer(EntityHandle) then
									util_create_thread(DeleteEntity_Passively, EntityPointer)
								elseif EntityHandle ~= PlayersPed then
									ReleaseScriptGuidFromEntity(EntityHandle)
								end
							end
						end)
						MenuOptions[4] = menu_action(Menu, "Peds Remove/Delete Forcefully", {}, "", function()
							local table = entities_get_all_peds_as_pointers()
							local PlayersPed = Info.Player.Ped
							local EntityPointer, EntityHandle
							for i=1, #table do
								EntityPointer = table[i]
								EntityHandle = entities_pointer_to_handle(EntityPointer)
								if not IsPedAPlayer(EntityHandle) then
									util_create_thread(DeleteEntity_Forcefully, EntityPointer)
								elseif EntityHandle ~= PlayersPed then
									ReleaseScriptGuidFromEntity(EntityHandle)
								end
							end
						end)
					end
					
					do
						local entities_get_all_objects_as_pointers = entities.get_all_objects_as_pointers
						MenuOptions[5] = menu_action(Menu, "Objects Remove/Delete Passively", {}, "", function()
							local table = entities_get_all_objects_as_pointers()
							for i=1, #table do
								util_create_thread(DeleteEntity_Passively, table[i])
							end
						end)
						MenuOptions[6] = menu_action(Menu, "Objects Remove/Delete Forcefully", {}, "", function()
							local table = entities_get_all_objects_as_pointers()
							for i=1, #table do
								util_create_thread(DeleteEntity_Forcefully, table[i])
							end
						end)
					end
				end,
	stop	=	function()
					local MenuOptions = MenuOptions
					local menu_delete = menu.delete
					for i=1, 6 do
						menu_delete(MenuOptions[i])
					end
					
					memory.free(MemoryPointer)
				end,
}