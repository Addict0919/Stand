--[[ Localization of various used functions/natives & libs/modules ]]
local Menu = require'Menu_Vehicle'
local RequestEntityControl = require'RequestEntityControl'
local SetVehicleExclusiveDriver = require'SetVehicleExclusiveDriver'
local PressKeyFob = require'PressKeyFob'
local menu = menu
local menu_trigger_command = menu.trigger_commands
local string_format = string.format
local util_create_thread = util.create_thread
local memory_write_int = memory.write_int

local SetNetworkIdAlwaysExistsForPlayer = SetNetworkIdAlwaysExistsForPlayer
local DoesBlipExist = DoesBlipExist
local RemoveBlip = RemoveBlip
local SetEntityCleanupByEngine = SetEntityCleanupByEngine
local SetEntityAsNoLongerNeeded = SetEntityAsNoLongerNeeded
local NetworkGetNetworkIdFromEntity = NetworkGetNetworkIdFromEntity
local SetEntityAsMissionEntity = SetEntityAsMissionEntity
local GetBlipFromEntity = GetBlipFromEntity
local AddBlipForEntity = AddBlipForEntity
local SetBlipSprite = SetBlipSprite
local ShowHeadingIndicatorOnBlip = ShowHeadingIndicatorOnBlip
--local SetBlipShrink = SetBlipShrink
local SetBlipShrink = SetBlipAsMinimalOnEdge
local GetIsVehicleEngineRunning = GetIsVehicleEngineRunning
local SetVehicleEngineOn = SetVehicleEngineOn
local SetVehicleJetEngineOn = SetVehicleJetEngineOn
local SetHeliBladesFullSpeed = SetHeliBladesFullSpeed
local DoesEntityExist = DoesEntityExist
local GetPedInVehicleSeat = GetPedInVehicleSeat
local IsPedAPlayer = IsPedAPlayer
local SetVehicleDoorsLocked = SetVehicleDoorsLocked
local SetVehicleDoorsLockedForAllPlayers = SetVehicleDoorsLockedForAllPlayers
local SetVehicleIsConsideredByPlayer = SetVehicleIsConsideredByPlayer
local SetVehicleDoorsLockedForPlayer = SetVehicleDoorsLockedForPlayer

--[[ Script ]]
local config, PtrMem
local PersonalVehicleIsPlane, PersonalVehicleIsHeli, PersonalVehicleIsOther = false, false, false
local PersonalVehicleNumSeats = 0
local PersonalVehicle, _PersonalVehicle, PersonalVehicleBlip = 0, 0, 0
return {
	init	=	function()
					local toboolean = toboolean -- require'toboolean'
					config = configFileRead("MenuPersonalVehicle.ini")
					if config.DoorLockForSelf == nil then
						config.DoorLockForSelf = true
					end
					config.DoorLockForSelf = toboolean(config.DoorLockForSelf)
					if config.DoorLockHard == nil then
						config.DoorLockHard = false
					end
					config.DoorLockHard = toboolean(config.DoorLockHard)
					if config.VehicleBlipEnable == nil then
						config.VehicleBlipEnable = true
					end
					config.VehicleBlipEnable = toboolean(config.VehicleBlipEnable)
					if config.VehicleExclusiveDriver == nil then
						config.VehicleExclusiveDriver = false
					end
					config.VehicleExclusiveDriver = toboolean(config.VehicleExclusiveDriver)
					
					PtrMem = memory.alloc()
					
					local Info = Info
					local menu_list = menu.list
					
					Menu = menu_list(Menu, "Personal Vehicle", {"vehj pv"}, "Personal Vehicle")
					
					--AddTextEntry('_BlipPV', 'Personal Vehicle | ~a~')
					
					local menu_action = menu.action
					
					menu_action(Menu, "Press KeyFob", {}, "", function()
						PressKeyFob(PersonalVehicle)
					end)
					
					menu_action(Menu, "Set Vehicle", {}, "Sets your current vehicle as your personal vehicle. If you already have a personal vehicle set then this will override your selection.", function()
						local Player = Info.Player
						local Vehicle = Player.Vehicle
						local __PersonalVehicle = Vehicle.Id
						if __PersonalVehicle ~= 0 and RequestEntityControl(__PersonalVehicle) then
							
							if PersonalVehicle ~= 0 then
								util_create_thread(function()
									local PersonalVehicle, _PersonalVehicle, PersonalVehicleBlip = PersonalVehicle, _PersonalVehicle, PersonalVehicleBlip
									if RequestEntityControl(PersonalVehicle) then
										if config.VehicleExclusiveDriver then
											SetVehicleExclusiveDriver(PersonalVehicle, _PersonalVehicle, false)
										else
											SetNetworkIdAlwaysExistsForPlayer(_PersonalVehicle, Player.Id, false)
										end
										if config.VehicleBlipEnable and DoesBlipExist(PersonalVehicleBlip) then
											memory_write_int(PtrMem, PersonalVehicleBlip)
											RemoveBlip(PtrMem)
										end
										SetEntityCleanupByEngine(PersonalVehicle, true)
										memory_write_int(PtrMem, PersonalVehicle)
										SetEntityAsNoLongerNeeded(PtrMem)
									end
								end)
							end
							
							PersonalVehicle = __PersonalVehicle
							_PersonalVehicle = NetworkGetNetworkIdFromEntity(PersonalVehicle)
							SetNetworkIdAlwaysExistsForPlayer(_PersonalVehicle, Player.Id, true)
							
							SetEntityCleanupByEngine(PersonalVehicle, false)
							SetEntityAsMissionEntity(PersonalVehicle, true, true)
							--SetVehicleExtendedRemovalRange(PersonalVehicle, 32767)--fails to function as expected, appears to make vehicles despawn sooner
							
							local Type = Vehicle.Type
							PersonalVehicleIsPlane, PersonalVehicleIsHeli = Type.Plane, Type.Heli
							PersonalVehicleIsOther = PersonalVehicleIsPlane == PersonalVehicleIsHeli
							PersonalVehicleNumSeats = GetVehicleModelNumberOfSeats(Vehicle.Model)
							
							if config.VehicleExclusiveDriver then
								SetVehicleExclusiveDriver(PersonalVehicle, _PersonalVehicle, true)
							end
							if config.VehicleBlipEnable then
								if GetBlipFromEntity(PersonalVehicle) == 0 then
									PersonalVehicleBlip = AddBlipForEntity(PersonalVehicle)
									SetBlipSprite(PersonalVehicleBlip, 794)--Deferring plane/heli sprites, preferring anchored car sprite always.
									ShowHeadingIndicatorOnBlip(PersonalVehicleBlip, true)
									SetBlipShrink(PersonalVehicleBlip, true)
									
									--[[
									BeginTextCommandSetBlipName'_BlipPV'
									AddTextComponentSubstringPlayerName(Vehicle.Name)
									EndTextCommandSetBlipName(PersonalVehicleBlip)
									]]
								else
									PersonalVehicleBlip = 0
								end
							end
							PressKeyFob(PersonalVehicle, true)
						end
					end)
					
					menu_action(Menu, "Toggle Engine", {}, "Toggles the engine on or off, even when you're not inside of the vehicle. This does not work if someone else is currently using your vehicle.", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							local EngineRunning = not GetIsVehicleEngineRunning(PersonalVehicle)
							SetVehicleEngineOn(PersonalVehicle, EngineRunning, true, not EngineRunning)
							if not PersonalVehicleIsOther then
								if PersonalVehicleIsPlane then
									SetVehicleJetEngineOn(PersonalVehicle, EngineRunning)
								elseif PersonalVehicleIsHeli and EngineRunning then
									SetHeliBladesFullSpeed(PersonalVehicle)
								end
							end
						end
					end)
					
					--[[
					menu_action(Menu, "Toggle Lights", {}, "This will enable or disable your vehicle headlights, the engine of your vehicle needs to be running for this to work.", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							
						end
					end)
					]]
					
					local GetPlayerName = GetPlayerName
					local NetworkGetPlayerIndexFromPed = NetworkGetPlayerIndexFromPed
					local ClearPedTasksImmediately = ClearPedTasksImmediately
					menu_action(Menu, "Kick Passengers", {}, "This will remove all passengers from your personal vehicle.", function()
						local PersonalVehicle = PersonalVehicle
						local Player_Ped = Info.Player.Ped
						if DoesEntityExist(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							for i=-1, PersonalVehicleNumSeats-2 do
								local Ped = GetPedInVehicleSeat(PersonalVehicle, i)
								if Ped ~= 0 and Ped ~= Player_Ped then
									if IsPedAPlayer(Ped) then
										menu_trigger_command(string_format('vehkick%s', GetPlayerName(NetworkGetPlayerIndexFromPed(Ped))))
									else
										util_create_thread(function()
											local Ped = Ped
											if RequestEntityControl(Ped) then
												ClearPedTasksImmediately(Ped)
											end
										end)
									end
								end
							end
						end
					end)
					
					menu_action(Menu, "Lock Doors", {}, "This will lock all your vehicle doors for all players. Anyone already inside will always be able to leave the vehicle, even if the doors are locked.", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							SetVehicleDoorsLocked(PersonalVehicle, 4)
							SetVehicleDoorsLockedForAllPlayers(PersonalVehicle, true)
							if config.DoorLockHard then
								SetVehicleIsConsideredByPlayer(PersonalVehicle, false)
							end
							if not config.DoorLockForSelf then
								SetVehicleDoorsLockedForPlayer(PersonalVehicle, Info.Player.Id, false)
							end
						end
					end)
					
					menu_action(Menu, "Unlock Doors", {}, "This will unlock all your vehicle doors for all players.", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							SetVehicleDoorsLocked(PersonalVehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(PersonalVehicle, false)
							if config.DoorLockHard then
								SetVehicleIsConsideredByPlayer(PersonalVehicle, true)
							end
						end
					end)
					
					local os_time, util_yield = os.time, util.yield
					--local SoundVehicleHornThisFrame = SoundVehicleHornThisFrame
					local SoundVehicleHornThisFrame = SetHornPermanentlyOn
					menu_action(Menu, "Sound Horn", {}, "Sounds the horn of the vehicle.", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							util_create_thread(function()
								local PersonalVehicle, TimeOut = PersonalVehicle, os_time()+1
								while os_time() < TimeOut and RequestEntityControl(PersonalVehicle) do
									SoundVehicleHornThisFrame(PersonalVehicle)
									util_yield()
								end
							end)
						end
					end)
					
					local SetVehicleAlarm = SetVehicleAlarm
					local IsVehicleAlarmActivated = IsVehicleAlarmActivated
					local StartVehicleAlarm = StartVehicleAlarm
					menu_action(Menu, "Toggle Alarm", {}, "Toggles the vehicle alarm sound on or off. This does not set an alarm. It only toggles the current sounding status of the alarm.", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							SetVehicleAlarm(PersonalVehicle, not IsVehicleAlarmActivated(PersonalVehicle))
							StartVehicleAlarm(PersonalVehicle)
						end
					end)
					
					menu_action(Menu, "Disable Vehicle", {}, "Makes the semi-vehicle inoperable and traps players inside (including yourself)", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							SetVehicleDoorsLockedForAllPlayers(PersonalVehicle, true)
							SetVehicleDoorsLocked(PersonalVehicle, 4)
							SetVehicleIsConsideredByPlayer(PersonalVehicle, false)
							SetVehicleEngineOn(PersonalVehicle, false, true, true)
							SetVehicleUndriveable(PersonalVehicle, true)
							SetVehicleAlarm(PersonalVehicle, true)
							StartVehicleAlarm(PersonalVehicle)
						end
					end)
					
					menu_action(Menu, "Bait / Booby Trap", {}, "Self Explanitory", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							SetVehicleExclusiveDriver(PersonalVehicle, _PersonalVehicle, false)
							SetVehicleDoorsLocked(PersonalVehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(PersonalVehicle, false)
							SetVehicleIsConsideredByPlayer(PersonalVehicle, true)
							SetVehicleEngineOn(PersonalVehicle, true, true, false)
							SetVehicleAlarm(PersonalVehicle, true)
							util_create_thread(function()
								local PersonalVehicle, PersonalVehicleNumSeats, Player_Ped = PersonalVehicle, PersonalVehicleNumSeats-2, Info.Player.Ped
								while DoesEntityExist(PersonalVehicle) and not IsEntityDead(PersonalVehicle) do
									for i=-1, PersonalVehicleNumSeats do
										local Ped = GetPedInVehicleSeat(PersonalVehicle, i)
										if Ped ~= 0 and Ped ~= Player_Ped then
											if RequestEntityControl(PersonalVehicle) then
												if not GetEntityCanBeDamaged(PersonalVehicle) then
													SetEntityInvincible(PersonalVehicle, false)
												end
												NetworkExplodeVehicle(PersonalVehicle, true, false, false)
												--return
											end
											break
										end
									end
									util_yield()
								end
							end)
						end
					end)
					
					menu_action(Menu, "Bait / Booby Trap 2", {}, "Self Explanitory (Including Self)", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							SetVehicleExclusiveDriver(PersonalVehicle, _PersonalVehicle, false)
							SetVehicleDoorsLocked(PersonalVehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(PersonalVehicle, false)
							SetVehicleIsConsideredByPlayer(PersonalVehicle, true)
							SetVehicleEngineOn(PersonalVehicle, true, true, false)
							SetVehicleAlarm(PersonalVehicle, true)
							util_create_thread(function()
								local PersonalVehicle, PersonalVehicleNumSeats = PersonalVehicle, PersonalVehicleNumSeats-2
								while DoesEntityExist(PersonalVehicle) and not IsEntityDead(PersonalVehicle) do
									for i=-1, PersonalVehicleNumSeats do
										local Ped = GetPedInVehicleSeat(PersonalVehicle, i)
										if Ped ~= 0 then
											if RequestEntityControl(PersonalVehicle) then
												if not GetEntityCanBeDamaged(PersonalVehicle) then
													SetEntityInvincible(PersonalVehicle, false)
												end
												NetworkExplodeVehicle(PersonalVehicle, true, false, false)
												--return
											end
											break
										end
									end
									util_yield()
								end
							end)
						end
					end)
					
					menu_action(Menu, "Self Destruct", {}, "Self Explanitory", function()
						local PersonalVehicle = PersonalVehicle
						if RequestEntityControl(PersonalVehicle) then
							PressKeyFob(PersonalVehicle)
							if not GetEntityCanBeDamaged(PersonalVehicle) then
								SetEntityInvincible(PersonalVehicle, false)
							end
							NetworkExplodeVehicle(PersonalVehicle, true, false, false)
						end
					end)
					
					do
						local Menu = menu_list(Menu, "Settings", {}, "Settings")
						
						local menu_toggle = menu.toggle
						
						menu_toggle(Menu, "Add Blip", {}, "Enables or disables the blip that gets added when you mark a vehicle as your personal vehicle.", function(state)
							config.VehicleBlipEnable = state
							local PersonalVehicle = PersonalVehicle
							if RequestEntityControl(PersonalVehicle) then
								PressKeyFob(PersonalVehicle)
								if state then
									if GetBlipFromEntity(PersonalVehicle) == 0 then
										PersonalVehicleBlip = AddBlipForEntity(PersonalVehicle)
										SetBlipSprite(PersonalVehicleBlip, 794)
										ShowHeadingIndicatorOnBlip(PersonalVehicleBlip, true)
										SetBlipShrink(PersonalVehicleBlip, true)
									end
								elseif DoesBlipExist(PersonalVehicleBlip) then
									memory_write_int(PtrMem, PersonalVehicleBlip)
									RemoveBlip(PtrMem)
								end
							end
						end, config.VehicleBlipEnable)
						
						menu_toggle(Menu, "Exclusive Driver", {}, "If enabled, then you will be the only one that can enter the drivers seat. Other players will not be able to drive the car. They can still be passengers.", function(state)
							config.VehicleExclusiveDriver = state
							local PersonalVehicle = PersonalVehicle
							if RequestEntityControl(PersonalVehicle) then
								PressKeyFob(PersonalVehicle)
								SetVehicleExclusiveDriver(PersonalVehicle, _PersonalVehicle, state)
							end
						end, config.VehicleExclusiveDriver)
						
						menu_toggle(Menu, "Auto Mode", {}, "Hide yourself", function(state)
							local _state
							if state then
								_state = 'on' SetEntityInvincible(PersonalVehicle, true)
							else
								_state = 'off'
							end
							menu_trigger_command(string_format('otr %s', _state))
							menu_trigger_command(string_format('invisibility %s', _state))
						end, false)
					end
				end,
	stop	=	function()
					config = configFileWrite("MenuPersonalVehicle.ini", config) -- Writes settings to ini and sets config to nil
					memory.free(PtrMem)
					menu.delete(Menu)
				end,
	loop	=	function(Info)
					local PersonalVehicle = PersonalVehicle
					if PersonalVehicle ~= 0 and DoesEntityExist(PersonalVehicle) then
						if config.VehicleExclusiveDriver or GetPedInVehicleSeat(PersonalVehicle, -1) == 0 then
							NetworkRequestControlOfEntity(PersonalVehicle) -- NetworkRequestControlOfEntity instead of RequestEntityControl for loop
						end
					end
				end,
}