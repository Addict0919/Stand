local Menu = require'Menu_Vehicle'
local menu = menu

local IsControlPressed, SetVehicleReduceGrip, IsControlReleased, SetControlNormal, DisableControlAction, EnableControlAction
	= IsControlPressed, SetVehicleReduceGrip, IsControlReleased, SetControlNormal, DisableControlAction, EnableControlAction
local config
local SimHandBrake = false
return{
	init	=	function()
					local toboolean = toboolean -- require'toboolean'
					config = configFileRead("DriftMode.ini")
					if config.Enabled == nil then
						config.Enabled = false
					end
					config.Enabled = toboolean(config.Enabled)
					if config.ImprovedDrifting == nil then
						config.ImprovedDrifting = true
					end
					config.ImprovedDrifting = toboolean(config.ImprovedDrifting)
					if config.ReplaceHandBrake == nil then
						config.ReplaceHandBrake = true
					end
					config.ReplaceHandBrake = toboolean(config.ReplaceHandBrake)
					if config.UseJaysControllerBind == nil then
						config.UseJaysControllerBind = false
					end
					config.UseJaysControllerBind = toboolean(config.UseJaysControllerBind)
					if config.UseCustomControlId == nil then
						config.UseCustomControlId = -1
					end
					config.UseCustomControlId = tonumber(config.UseCustomControlId)
					
					Menu = menu.list(Menu, "Drift Mode", {}, "Jay's Better Drifting")
					
					local menu_toggle = menu.toggle
					
					menu_toggle(Menu, "Enable Drift Mode", {}, "Enables or disables the drift mode", function(state)
						config.Enabled = state
					end, config.Enabled)
					
					menu_toggle(Menu, "Enhance Drift Mode", {}, "Improves the drift handling/traction mechanics", function(state)
						config.ImprovedDrifting = state
					end, config.ImprovedDrifting)
					
					menu_toggle(Menu, "Jay's Controller Bind", {}, "Use Jay's Controller Bind (Square on PS or X on Xbox)", function(state)
						config.UseJaysControllerBind = state
					end, config.UseJaysControllerBind)
					
					menu_toggle(Menu, "Replace Hand Brake", {}, "Bind drift mode to hand brake and disable hand brake", function(state)
						config.ReplaceHandBrake = state
					end, config.ReplaceHandBrake)
					
					menu.slider(Menu, "Use Custom Control Id", {}, "", -1, 360, config.UseCustomControlId, 1, function(state)
						config.UseCustomControlId = state
					end)
				end,
	loop	=	function(Info)
					local config = config
					if config.Enabled then
						local Vehicle = Info.Player.Vehicle
						if Vehicle.IsIn and Vehicle.IsOp then
							local ControlId
							if config.UseJaysControllerBind then
								ControlId = 99
								config.ReplaceHandBrake = false
							elseif config.ReplaceHandBrake then
								ControlId = 76
							else
								local config_UseCustomControlId = config.UseCustomControlId
								if config_UseCustomControlId ~= -1 then
									ControlId = config_UseCustomControlId
								else
									return
								end
							end
							
							if IsControlPressed(27,ControlId) then
								SetVehicleReduceGrip(Vehicle.Id, true)
								SimHandBrake = not SimHandBrake
								if config.ImprovedDrifting and SimHandBrake then
									if not config.ReplaceHandBrake then
										SetControlNormal(27, 76, 1.0)
									else
										--DisableControlAction(27, 76, false)
										EnableControlAction(27, 76, true)
									end
								end
							elseif IsControlReleased(27,ControlId) then
								SetVehicleReduceGrip(Vehicle.Id, false)
								SimHandBrake = false
							end
						end
					end
				end,
	stop	=	function()
					config = configFileWrite("DriftMode.ini", config) -- Writes settings to ini and sets config to nil
					menu.delete(Menu)
				end
}