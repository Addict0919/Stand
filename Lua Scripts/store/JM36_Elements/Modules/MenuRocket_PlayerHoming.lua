local RocketObjectHashes = require'HashesRockets_Array'()

local WeaponHashes
do
	local GetHashKey = GetHashKey
	WeaponHashes =
	{
		[GetHashKey("weapon_hominglauncher")] = true,
		[GetHashKey("weapon_rpg")] = true,
		[GetHashKey("weapon_firework")] = true,
	}
end

local MenuList

local config

local Accuracy, Realistic

local RocketNearCoordGuideToEntity = require'RocketNearCoordGuideToEntity'
local util_create_thread, util_yield
do
	local util = util
	util_create_thread = util.create_thread
	util_yield = util.yield
end

return{
	init	=	function()
					local Menu = require'Menu_Rocket'
					local menu = menu
					MenuList = menu.list(Menu, "Player Rocket Tuning", {}, "")
					local MenuList = MenuList
					
					do
						config = configFileRead("RocketGuidance_Player.ini")
						local config = config
						Accuracy = tonumber(config.Accuracy or 2)
						if config.Realistic == nil then
							Realistic = true
						else
							Realistic = toboolean(config.Realistic)
						end
					end
					
					menu.slider(MenuList, "Guidance Accuracy Multiplier", {}, "Rocket Guidance Accuracy Multiplier For Player Rockets", 1, 10, Accuracy, 1, function(value, prev_value, click_type) 
						Accuracy = value
						config.Accuracy = value
					end)
					menu.toggle(MenuList, "Guidance Uses Realistic Physics", {}, "Rocket Guidance Uses Realistic Physics For Player Rockets", function(state)
						Realistic = state
						config.Realistic = state
					end, Realistic)
				end,
	stop	=	function()
					configFileWrite("RocketGuidance_Player.ini", config)
					menu.delete(MenuList)
				end,
	loop	=	function(Info)
					if Info.RocketGuidanceEnabled then
						local Player = Info.Player
						local Vehicle = Player.Vehicle
						if not Vehicle.IsIn then
							local Player_Ped = Player.Ped
							if WeaponHashes[GetSelectedPedWeapon(Player_Ped)] then
								--HideHudComponentThisFrame(14)
								
								local TargetTable = Info.Target
								local Target = TargetTable.CollisionA and TargetTable.EntityHitA or TargetTable.CollisionB and TargetTable.EntityHitB
								
								local Player_Id = Player.Id
								--SetPlayerHomingRocketDisabled(Player_Id, true)
								
								if IsPlayerFreeAiming(Player_Id) then
									if Target and Target ~= 0 then
										local CamRot = GetFinalRenderedCamRot(2)
										local Coords = GetEntityCoords(Target, true)
										DrawMarker(3,Coords.x,Coords.y,Coords.z,0.0,0.0,0.0,CamRot.x,CamRot.y,0.0,5.0,5.0,5.0,255,255,0,255,false,true,0,false,"helicopterhud","hud_dest",false)
									end
								end
								if IsPedShooting(Player_Ped) then
									util_create_thread(function()
										local PlayerCoords = GetEntityCoords(Player_Ped, false)
										local Rocket = 0
										for i=1, 3 do
											Rocket = GetClosestObjectOfType(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 1.5, RocketObjectHashes[i], false)
											if Rocket ~= 0 then break end
										end
										
										while DoesEntityExist(Rocket) and (not Target or Target == 0) do
											Target = TargetTable.CollisionA and TargetTable.EntityHitA or TargetTable.CollisionB and TargetTable.EntityHitB
											
											if not Target or Target == 0 then
												util_yield()
											end
										end
										
										if DoesEntityExist(Rocket) and (Target and Target ~= 0) then
											RocketNearCoordGuideToEntity(GetEntityCoords(Rocket, false), 1.5, Target, UseRealisticPhysics, GuidanceAccuracy)
										end
									end)
								end
							end
						end
					end
				end,
}