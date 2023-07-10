local menu = menu
local Menu = menu.list(menu.my_root(), "Rocket Guidance", {}, "Rocket Related Options")
do
	local Enabled
	local config = configFileRead("RocketGuidance.ini")
	Enabled = toboolean(config.Enabled)
	local Info = Info
	Info.RocketGuidanceEnabled = Enabled
	menu.toggle(Menu, "Enable Rocket Guidance", {}, "Make rockets smarter\nIncrease rocket accuracy\nEnable missile aimbot", function(state)
		Info.RocketGuidanceEnabled = state
		config.Enabled = state
	end, Enabled)
	util.on_stop(function() configFileWrite("RocketGuidance.ini", config) end)
end
return Menu