local RelationshipGroupToSet = "COP"
local WeaponLoadout =
{
	"weapon_petrolcan",
	"weapon_fireextinguisher",
	"weapon_flashlight",
	"weapon_nightstick",
	"weapon_stungun",
	"weapon_switchblade",
	"weapon_combatpistol",
	"weapon_carbinerifle",
	"weapon_sniperrifle",
	"weapon_pumpshotgun",
	"weapon_flaregun",
	"weapon_flare",
	"weapon_bzgas",
}
local WeaponLoadoutCount = #WeaponLoadout



local SetPedRelationshipGroupHash = SetPedRelationshipGroupHash
local SetPedAsCop = SetPedAsCop
local GiveWeaponToPed = GiveWeaponToPed
local function ModeCopEnable(Ped)
	SetPedRelationshipGroupHash(Ped, RelationshipGroupToSet)
	SetPedAsCop(Ped, true)
	for i=1, WeaponLoadoutCount do
		GiveWeaponToPed(Ped, WeaponLoadout[i], 9999, true, false)
	end
end
local GetPedRelationshipGroupDefaultHash = GetPedRelationshipGroupDefaultHash
local RelationshipGroupToRestore
local function ModeCopDisable(Ped, Restore, Default, Group)
	if Restore then
		if Default then
			SetPedRelationshipGroupHash(Ped, GetPedRelationshipGroupDefaultHash(Ped))
		else
			SetPedRelationshipGroupHash(Ped, Group or RelationshipGroupToRestore)
		end
	end
	SetPedAsCop(Ped, false) -- Does nothing, needs to respawn
end



local menu = menu
local menu_trigger_command = menu.trigger_command
local MenuCommandWanted--[[, MenuCommandWantedFake]]
local function Code3()
	menu_trigger_command(MenuCommandWanted, 2)
end
local function Code4()
	menu_trigger_command(MenuCommandWanted, 0)
	--menu_trigger_command(MenuCommandWantedFake, 1)
end
local GetPedRelationshipGroupHash = GetPedRelationshipGroupHash
local RemoveAllPedWeapons = RemoveAllPedWeapons
local menu_get_value = menu.get_value
local MenuCommandDefaults, MenuCommandOTR, MenuCommandWantedLock, MenuCommandAutoHeal
local function ModeCopEnableSelf(Ped)
	RelationshipGroupToRestore = GetPedRelationshipGroupHash(Ped)
	RemoveAllPedWeapons(Ped, true)
	ModeCopEnable(Ped)
	Code4()
	do
		local _MenuCommandOTR = menu_get_value(MenuCommandOTR)
		local _MenuCommandWantedLock = menu_get_value(MenuCommandWantedLock)
		--local _MenuCommandWantedFake = menu_get_value(MenuCommandWantedFake)
		local _MenuCommandAutoHeal = menu_get_value(MenuCommandAutoHeal)
		MenuCommandDefaults =
		{
			MenuCommandOTR = _MenuCommandOTR,
			MenuCommandWantedLock = _MenuCommandWantedLock,
			--MenuCommandWantedFake = _MenuCommandWantedFake,
			MenuCommandAutoHeal = _MenuCommandAutoHeal,
		}
		if _MenuCommandOTR ~= 1 then
			menu_trigger_command(MenuCommandOTR, "on") -- use "on" instead of 1 due to bug
		end
		if _MenuCommandWantedLock ~= 1 then
			menu_trigger_command(MenuCommandWantedLock, 1)
		end
		--if _MenuCommandWantedFake ~= 1 then
		--	menu_trigger_command(MenuCommandWantedFake, 1)
		--end
		if _MenuCommandAutoHeal ~= 0 then
			menu_trigger_command(MenuCommandAutoHeal, 0)
		end
	end
end
local function ModeCopDisableSelf(Ped)
	ModeCopDisable(Ped, true, false, RelationshipGroupToRestore)
	local MenuCommandDefaults = MenuCommandDefaults
	if MenuCommandDefaults.MenuCommandOTR ~= 1 then
		menu_trigger_command(MenuCommandOTR, 0)
	end
	if MenuCommandDefaults.MenuCommandWantedLock ~= 1 then
		menu_trigger_command(MenuCommandWantedLock, 0)
	end
	--if MenuCommandDefaults.MenuCommandWantedFake ~= 1 then
	--	menu_trigger_command(MenuCommandWantedFake, 0)
	--end
	if MenuCommandDefaults.MenuCommandAutoHeal ~= 0 then
		menu_trigger_command(MenuCommandAutoHeal, 1)
	end
end

local memory = memory
local util_create_thread = util.create_thread
local RequestEntityModel = require'RequestEntityModel'
local GetPlayerPed = GetPlayerPed
local GetOffsetFromEntityInWorldCoords = GetOffsetFromEntityInWorldCoords
local entities_create_ped = entities.create_ped
local GetHashKey = GetHashKey
local CopHash = GetHashKey's_m_y_cop_01'
local SetEntityCleanupByEngine = SetEntityCleanupByEngine
local memory_write_int = memory.write_int
local SetEntityAsNoLongerNeeded = SetEntityAsNoLongerNeeded
local FreezeEntityPosition = FreezeEntityPosition
local AddOwnedExplosion = AddOwnedExplosion
local DeleteEntity = DeleteEntity
local MemoryPointer_GivePlayerWantedLevel
local function GivePlayerWantedLevel(PlayerId)
	util_create_thread(function()
		if RequestEntityModel(CopHash) then
			local PlayersPed = GetPlayerPed(Player)
			local CopCoords = GetOffsetFromEntityInWorldCoords(PlayersPed, 0.0, 0.0, 125.0)
			local CopPed = entities_create_ped(6, CopHash, CopCoords, 0.0)
			SetEntityCleanupByEngine(CopPed, true)
			memory_write_int(MemoryPointer_GivePlayerWantedLevel, CopPed)
			SetEntityAsNoLongerNeeded(MemoryPointer_GivePlayerWantedLevel)
			FreezeEntityPosition(CopPed, true)
			AddOwnedExplosion(PlayersPed, CopCoords.x, CopCoords.y, CopCoords.z, 0, 1.0, false, true, 0.0)
			memory_write_int(MemoryPointer_GivePlayerWantedLevel, CopPed)
			DeleteEntity(MemoryPointer_GivePlayerWantedLevel)
		end
	end)
end

local MenuOption
local Enabled, WasEnabled, LastPed, Loop_GivePlayerWantedLevel, Lock_PlayerWantedBlips
local WantedPlayers, WantedBlips = {}, {}
local util_remove_blip = util.remove_blip
local function WantedBlipsClear()
	for i=1, #WantedBlips do
		util_remove_blip(WantedBlips[i])
		WantedBlips[i] = nil
	end
end
local players_list = players.list
local GetPlayerWantedLevel = GetPlayerWantedLevel
local GetEntityPlayerIsFreeAimingAt = GetEntityPlayerIsFreeAimingAt
local MemoryPointer_GetEntityPlayerIsFreeAimingAt
local memory_read_int = memory.read_int
local entities_get_all_peds_as_pointers = entities.get_all_peds_as_pointers
local entities_pointer_to_handle = entities.pointer_to_handle
local GetPedType = GetPedType
local GetBlipFromEntity = GetBlipFromEntity
local AddBlipForEntity = AddBlipForEntity
local SetBlipAsFriendly = SetBlipAsFriendly
local SetBlipScale = SetBlipScale
local SetBlipShrink = SetBlipAsMinimalOnEdge
local IsPedAPlayer = IsPedAPlayer
local ReleaseScriptGuidFromEntity = ReleaseScriptGuidFromEntity
local NetworkGetPlayerIndexFromPed = NetworkGetPlayerIndexFromPed
local GetEntityCoords = GetEntityCoords
local AddBlipForRadius = AddBlipForRadius
local SetBlipColour = SetBlipColour
local SetBlipAlpha = SetBlipAlpha
local SetBlipPriority = SetBlipPriority
return{
	init	=	function()
					local memory_alloc = memory.alloc
					MemoryPointer_GivePlayerWantedLevel = memory_alloc()
					MemoryPointer_GetEntityPlayerIsFreeAimingAt = memory_alloc()
					
					RelationshipGroupToSet = GetHashKey(RelationshipGroupToSet)
					for i=1, WeaponLoadoutCount do
						WeaponLoadout[i] = GetHashKey(WeaponLoadout[i])
					end
					
					local menu_ref_by_path = menu.ref_by_path
					MenuCommandOTR = menu_ref_by_path("Online>Off The Radar")
					MenuCommandWanted = menu_ref_by_path("Self>Set Wanted Level")
					MenuCommandWantedLock = menu_ref_by_path("Self>Lock Wanted Level")
					--MenuCommandWantedFake = menu_ref_by_path("Self>Fake Wanted Level")
					MenuCommandAutoHeal = menu_ref_by_path("Self>Auto Heal")
					
					MenuOption = menu.list(menu.my_root(), "Become a cop", {}, "Self explanitory")
					
					local Info = Info
					local menu_toggle = menu.toggle
					menu_toggle(MenuOption, "Enabled", {"beacop"}, "Sets your ped as a cop.", function(on)
						Enabled = on
						LastPed = Info.Player.Ped
						if Enabled then
							WasEnabled = true
							ModeCopEnableSelf(LastPed)
							return
						end
						ModeCopDisableSelf(LastPed)
					end)
					
					local menu_action = menu.action
					local menu_trigger_command = menu_trigger_command
					menu_action(MenuOption, "Code 4", {}, "", Code4)
					menu_action(MenuOption, "Code 2", {}, "", function()
						menu_trigger_command(MenuCommandWanted, 1)
					end)
					menu_action(MenuOption, "Code 3", {}, "", Code3)
					local MenuCommandFixVehicle = menu_ref_by_path("Vehicle>Fix Vehicle")
					menu_action(MenuOption, "Recover", {}, "", function()
						menu_trigger_command(MenuCommandAutoHeal, "on")
						menu_trigger_command(MenuCommandAutoHeal, "off")
						menu_trigger_command(MenuCommandFixVehicle)
					end)
					
					if DebugMode then
						menu_toggle(MenuOption, "Loop GivePlayerWantedLevel", {}, "", function(on)
							Loop_GivePlayerWantedLevel = on
						end)
						menu_toggle(MenuOption, "WantedBlips Always On Target", {}, "", function(on)
							Lock_PlayerWantedBlips = on
						end)
					end
				end,
	stop	=	function()
					local memory_free = memory.free
					memory_free(MemoryPointer_GetEntityPlayerIsFreeAimingAt)
					memory_free(MemoryPointer_GivePlayerWantedLevel)
					
					menu.delete(MenuOption)
					
					if WasEnabled then
						ModeCopDisableSelf(Info.Player.Ped)
						Code4()
						WantedBlipsClear()
					end
				end,
	loop	=	function(Info)
					if WasEnabled then
						WantedBlipsClear()
						local Player = Info.Player
						local Ped = Player.Ped
						if Enabled then
							if Ped ~= LastPed then
								LastPed = Ped
								ModeCopEnable(LastPed)
							end
							do
								local PedVeh = Player.Vehicle.Id
								local Players = players_list(false, true, true)
								for i=1, #Players do
									local Player = Players[i]
									local PlayerIsWanted = GetPlayerWantedLevel(Player) ~= 0
									if Loop_GivePlayerWantedLevel or not PlayerIsWanted then
--										if GetEntityPlayerIsFreeAimingAt(Player, MemoryPointer_GetEntityPlayerIsFreeAimingAt) then
--											local EntityAimedAt = memory_read_int(MemoryPointer_GetEntityPlayerIsFreeAimingAt)
--											if EntityAimedAt == Ped or (PedVeh ~= 0 and EntityAimedAt == PedVeh) then
										if IsPlayerFreeAimingAtEntity(Player, Ped) or IsPlayerFreeAimingAtEntity(Player, PedVeh) then
												PlayerIsWanted = true
												GivePlayerWantedLevel(Player)
--											end
										end
									end
									WantedPlayers[Player] = PlayerIsWanted
								end
							end
							do
								local WantedBlipsNum = 0
								local Peds = entities_get_all_peds_as_pointers()
								for i=1, #Peds do
									local _Ped = entities_pointer_to_handle(Peds[i])
									if _Ped ~= Ped then
										local PedType = GetPedType(_Ped)
										if PedType == 6 or PedType == 27 or PedType == 29 then -- 6 cop, 27 swat, 29 army
											local Blip = GetBlipFromEntity(_Ped)
											if Blip == 0 then
												Blip = AddBlipForEntity(_Ped)
												SetBlipAsFriendly(Blip, true)
												SetBlipScale(Blip, 0.75)
												SetBlipShrink(Blip, true)
											end
										end
										local IsPedAPlayer = IsPedAPlayer(_Ped)
										if not IsPedAPlayer then
											ReleaseScriptGuidFromEntity(_Ped)
										else
											local _Player = NetworkGetPlayerIndexFromPed(_Ped)
											if WantedPlayers[_Player] then
												--local _PedCoords = GetEntityCoords(_Ped, true)
												--local _PedCoords = GetPlayerWantedCentrePosition(_Player)
												local _PedCoords
												if not Lock_PlayerWantedBlips then
													_PedCoords = GetPlayerWantedCentrePosition(_Player)
												else
													_PedCoords = GetEntityCoords(_Ped, true)
												end
												--local Blip = AddBlipForRadius(_PedCoords.x, _PedCoords.y, _PedCoords.z, 25.0)
												local Blip = AddBlipForRadius(_PedCoords.x, _PedCoords.y, _PedCoords.z, 50.0)
												SetBlipColour(Blip, 5)
												--SetBlipAlpha(Blip, 64)
												SetBlipAlpha(Blip, 128)
												SetBlipPriority(Blip, 0)
												WantedBlipsNum = WantedBlipsNum + 1
												WantedBlips[WantedBlipsNum] = Blip
											end
										end
									end
								end
							end
							return
						end
						WasEnabled = false
					end
				end,
}