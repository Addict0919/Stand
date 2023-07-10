require("natives-1627063482")
menu.slider(menu.my_root(), "Change seat", {"switchseat"}, "DriverSeat = -1 Passenger = 0 Left Rear = 1 RightRear = 2", -1, 2, -1, 1, function(seatnumber)
	local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
	local vehicle = entities.get_user_vehicle_as_handle()
	PED.SET_PED_INTO_VEHICLE(ped, vehicle, seatnumber)
end)

while true do
	util.yield()
end
