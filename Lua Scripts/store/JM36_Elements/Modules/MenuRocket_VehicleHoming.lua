local MenuList

local config

local memory = memory

local Accuracy, Realistic

local RocketNearCoordGuideToEntity = require'RocketNearCoordGuideToEntity'
local util_create_thread = util.create_thread
local memory_read_int = memory.read_int

local GetVehicleLockOnTarget, IsPedShooting
	= GetVehicleLockOnTarget, IsPedShooting

local Mem
return{
	init	=	function()
					Mem = memory.alloc()
					
					local Menu = require'Menu_Rocket'
					local menu = menu
					MenuList = menu.list(Menu, "Vehicle Homing Rocket Tuning", {}, "")
					local MenuList = MenuList
					
					do
						config = configFileRead("RocketGuidance_VehicleHoming.ini")
						local config = config
						Accuracy = tonumber(config.Accuracy or 1)
						if config.Realistic == nil then
							Realistic = true
						else
							Realistic = toboolean(config.Realistic)
						end
					end
					
					menu.slider(MenuList, "Guidance Accuracy Multiplier", {}, "Rocket Guidance Accuracy Multiplier For Vehicle Homing Rockets", 1, 10, Accuracy, 1, function(value, prev_value, click_type) 
						Accuracy = value
						config.Accuracy = value
					end)
					menu.toggle(MenuList, "Guidance Uses Realistic Physics", {}, "Rocket Guidance Uses Realistic Physics For Vehicle Homing Rockets", function(state)
						Realistic = state
						config.Realistic = state
					end, Realistic)
				end,
	stop	=	function()
					configFileWrite("RocketGuidance_VehicleHoming.ini", config)
					menu.delete(MenuList)
					memory.free(Mem)
				end,
	loop	=	function(Info)
					if Info.RocketGuidanceEnabled then
						local Player = Info.Player
						local Vehicle = Player.Vehicle
						if Vehicle.IsIn then
							local Player_Ped = Player.Ped
							if IsPedShooting(Player_Ped) and GetVehicleLockOnTarget(Vehicle.Id, Mem) then
								util_create_thread(RocketNearCoordGuideToEntity, GetEntityCoords(Player_Ped, false), 25.0, memory_read_int(Mem), Realistic, Accuracy)
							end
						end
					end
				end,
}