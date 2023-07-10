require("natives-1614644776")
target = players.user()
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function set_up_action_for(pid)
        menu.action(menu.player_root(pid), "Fill car with peds", {"fillcar"}, "Fills the player\'s car with nearby peds", function(on_click)
            target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            if PED.IS_PED_IN_ANY_VEHICLE(target_ped, true) then
                    veh = PED.GET_VEHICLE_PED_IS_IN(target_ped, false);
                    success = true
                    while VEHICLE.ARE_ANY_VEHICLE_SEATS_FREE(veh) do
						util.yield()
                        --  sometimes peds fail to get seated, so we will have something to break after 10 attempts if things go south
                        iteration = 0
                        if iteration >= 20 then
                            util.toast("Failed to fully fill vehicle after 20 attempts. Please try again.")
                            success = false
                            iteration = 0
                            break
                        end
                        iteration = iteration + 1
                        nearby_peds = util.get_all_peds()
                        for k,ped in pairs(nearby_peds) do
                            if PED.GET_VEHICLE_PED_IS_IN(ped, false) ~= veh and ENTITY.GET_ENTITY_HEALTH(ped) > 0 and not PED.IS_PED_FLEEING(ped) then
                                --dont touch player peds
                                if(PED.GET_PED_TYPE(ped) > 4) then
                                    veh = PED.GET_VEHICLE_PED_IS_IN(target_ped, false);
                                        iteration = iteration + 1
                                        for index = 0, VEHICLE.GET_VEHICLE_MODEL_NUMBER_OF_SEATS(ENTITY.GET_ENTITY_MODEL(veh)) do
                                            if VEHICLE.IS_VEHICLE_SEAT_FREE(veh, index) then
                                                -- i think requesting control and clearing task deglitches the peds
                                                -- this is specifically to counter weird A-posing
                                                -- EDIT: it doesnt. why the fuck do some peds a-pose??? maybe ill find out eventually. oh well.
                                                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
                                                TASK.CLEAR_PED_TASKS(ped)
                                                PED.SET_PED_INTO_VEHICLE(ped, veh, index);
                                                PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true);
                                                PED.SET_PED_FLEE_ATTRIBUTES(ped, 0, false);
                                                PED.SET_PED_COMBAT_ATTRIBUTES(ped, 17, true);
                                                PED.SET_PED_CAN_BE_DRAGGED_OUT(ped, false);
                                                PED.SET_PED_CAN_BE_KNOCKED_OFF_VEHICLE(ped, false);
                                            end
                                        end
                                    break
                                end
                            end
                        end
                    end
                    if success then
                        util.toast("Every available seat should now be full of peds. If it isn\'t, try spamming this or try again in a bit.")
                    end
            else
                util.toast("Player is not in a car :(")
            end
        end)
end

-- for first run only
local cur_players = players.list(true, true, true)
for k,pid in pairs(cur_players) do
    set_up_action_for(pid)
end

players.on_join(function(pid)
    set_up_action_for(pid)
end)

while true do
    util.yield()
end
