local Menu = require'Menu_Vehicle'
local RequestEntityControl = require'RequestEntityControl'
local NetworkRequestControlOfEntity = NetworkRequestControlOfEntity
local SetVehicleParachuteTextureVariation = SetVehicleParachuteTextureVariatiion--Stand typo
--local IsVehicleParachuteActive = _0x3DE51E9C80B116CF--Stand unnamed

local outPosition, outHeading, PtrMem
local HashCargobob = GetHashKey'cargobob2'
local CargobobAttachedVehicle = 0
local MenuButton, Cargobob
return{
	init	=	function()
					outPosition, outHeading, PtrMem = memory.alloc(), memory.alloc(), memory.alloc()
					
					local RequestEntityModel = require'RequestEntityModel'
					local Player = Info.Player
					MenuButton = menu.action(Menu, "Create Magnetized Cargobob", {}, "", function()
						local Coords = Player.Coords
						if GetClosestVehicleNodeWithHeading(Coords.x, Coords.y, Coords.z, outPosition, outHeading, 1 or 0 or 8 or 12, 3.0, 0) then
							if RequestEntityModel(HashCargobob) then
								Cargobob = entities.create_vehicle(HashCargobob, memory.read_vector3(outPosition), memory.read_float(outHeading))
								SetVehicleStrong(Cargobob, true)
								SetVehicleExplodesOnHighExplosionDamage(Cargobob, false)
								SetVehicleOnGroundProperly(Cargobob, 0.0)
								--_0x279D50DE5652D935(Cargobob, true)--no longer works
								SetVehicleGeneratesEngineShockingEvents(Cargobob, true)
								CreatePickUpRopeForCargobob(Cargobob, 1)
--								if not DoesCargobobHavePickUpRope(Cargobob) then
--									memory.write_int(PtrMem, Cargobob)
--									DeleteEntity(PtrMem)
--									print'RAGE failed to perform a simple task, try again later elsewhere.'
--									return
--								end
								SetCargobobPickupMagnetActive(Cargobob, true)
								--SetCargobobPickupMagnetPullRopeLength(Cargobob, 0.0) -- Not As Advertised
								--SetPickupRopeLengthForCargobob(Cargobob, 100.0, 100.0, true) -- Glitchy And Shrinks After Some Time
								--SetCargobobPickupMagnetEffectRadius(Cargobob, 12.5)
								--SetCargobobPickupMagnetEffectRadius(Cargobob, 6.25)
								SetCargobobPickupMagnetEffectRadius(Cargobob, 3.125)
								--SetCargobobPickupMagnetPullStrength(Cargobob, 25.0) -- Probably Remove Because Too Much Suction
								--SetCargobobPickupMagnetStrength(Cargobob, 250.0) -- Too Much Suction
								SetCargobobPickupRopeDampingMultiplier(Cargobob, 1000000.0) -- Try To Prevent Collisions
								SetEntityCleanupByEngine(Cargobob, true)
								memory.write_int(PtrMem, Cargobob)
								SetEntityAsNoLongerNeeded(PtrMem)
								SetNewWaypoint(Coords.x, Coords.y)
							end
						end
					end)
				end,
	loop	=	function(Info)
					local Vehicle = Info.Player.Vehicle
					if Vehicle.Id == Cargobob and Vehicle.IsIn and Vehicle.IsOp then
						local VehicleAttachedToCargobob = GetVehicleAttachedToCargobob(Cargobob)
						if VehicleAttachedToCargobob ~= CargobobAttachedVehicle then
							--[[if VehicleAttachedToCargobob == 0 then
								--print'gHookRelease'
								util.create_thread(function()
									local CargobobAttachedVehicle = CargobobAttachedVehicle
									if RequestEntityControl(CargobobAttachedVehicle) then
										--print'PreChute'
										SetVehicleParachuteModel(CargobobAttachedVehicle,230075693)
										SetVehicleParachuteTextureVariation(CargobobAttachedVehicle, 6)
										--print(GetVehicleCanActivateParachute(CargobobAttachedVehicle), GetVehicleHasParachute(CargobobAttachedVehicle), IsVehicleParachuteActive(CargobobAttachedVehicle))
										SetVehicleParachuteActive(CargobobAttachedVehicle, true)
										--print'PostChute'
										while DoesEntityExist(CargobobAttachedVehicle) and IsEntityInAir(CargobobAttachedVehicle) and GetVehicleAttachedToCargobob(Cargobob) ~= CargobobAttachedVehicle do
											util.yield()
										end
										if RequestEntityControl(CargobobAttachedVehicle) then
											SetVehicleParachuteActive(CargobobAttachedVehicle, false)
										end
									end
								end)
							end]]
							CargobobAttachedVehicle = VehicleAttachedToCargobob
						end
						if VehicleAttachedToCargobob ~= 0 then
							NetworkRequestControlOfEntity(VehicleAttachedToCargobob)
							--StabiliseEntityAttachedToHeli(Cargobob, VehicleAttachedToCargobob, p2 --[[ number ]])
						end
					end
				end,
	stop	=	function()
					local memory_free = memory.free
					memory_free(outPosition) memory_free(outHeading) memory_free(PtrMem)
					outPosition, outHeading, PtrMem = nil, nil, nil
					menu.delete(MenuButton)
				end,
}