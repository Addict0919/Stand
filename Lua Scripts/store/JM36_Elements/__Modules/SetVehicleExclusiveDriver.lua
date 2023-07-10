local Player = Info.Player
local SetNetworkIdCanMigrate = SetNetworkIdCanMigrate
local SetVehicleExclusiveDriver = SetVehicleExclusiveDriver
local _0x41062318F23ED854 = _0x41062318F23ED854

return function(HandleVehEnt, HandleVehNet, State)
	SetNetworkIdCanMigrate(HandleVehNet, not State)
	if State then
		SetVehicleExclusiveDriver(HandleVehEnt, Player.Ped, 1)
	else
		SetVehicleExclusiveDriver(HandleVehEnt, 0, 1)
	end
	_0x41062318F23ED854(HandleVehEnt, State)
end