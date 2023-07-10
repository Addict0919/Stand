require("natives-1614644776")
util.toast("Vehicle Chaos, coded by Lance, has been loaded. Enable under Lua scripts > vehicle chaos. Have fun ;)")

chaos = false
menu.toggle(menu.my_root(), "Enabled", {"chaos"}, "Enables the chaos...", function(on)
    if on then
        chaos = true
    else
        chaos = false
    end
end, false)

gravity = true
menu.toggle(menu.my_root(), "Gravity", {"chaosgravity"}, "Gravtity on/off", function(on)
    if on then
        gravity = true
    else
        gravity = false
    end
end, true)

speed = 100
menu.click_slider(menu.my_root(), "Vehicle speed", {"chaosspeed"}, "The speed to force the vehicles to. Higher = more chaos.", 30, 300, 100, 10, function(s)
  speed = s
end)

while true do
  if (chaos) then
    vehicles = util.get_all_vehicles()
    cur_players = players.list(true,true,true)
    for k,v in pairs(vehicles) do
        driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(v, -1)
        if(PED.GET_PED_TYPE(driver) > 4) then
          VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(v, false, true)
          VEHICLE.SET_VEHICLE_FORWARD_SPEED(v, speed)
          VEHICLE.SET_VEHICLE_GRAVITY(v, gravity)
        end
    end
  end
  util.yield()
end
