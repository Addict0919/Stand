--help of Sir VSUS aka Mr. where are your fingers?
--#programming
--and Keramis Tutorial :)
-- tps inspired from acjocker

util.require_natives('1660137314')


root = menu.my_root()
maction = menu.action
local mid = players.user()
local notify = util.toast

alrboss = 'You are already the boss of a CEO/MC'
gotmcboss = 'You are now the boss of your MC'
gotceoboss = 'You are now the boss of your CEO'

maction(root, "                        INFORMATION!", {}, "",function()
notify('The Auto CEO/MC only works if you safe your profile at least once'..
' after you made the toggles or have autosafe activated in your profile ;)')
util.yield(2000)
notify('The Auto CEO/MC only works if you safe your profile at least once'..
' after you made the toggles or have autosafe activated in your profile ;)')end)

function get_vehicle_player_is_in(player)
	local targetPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player)
	if PED.IS_PED_IN_ANY_VEHICLE(targetPed, false) then
		return PED.GET_VEHICLE_PED_IS_IN(targetPed, false)
	end
	return 0
end

    function request_control(entity)
	if not NETWORK.NETWORK_IS_IN_SESSION() then
		return true
	end
	local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
	NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netId, true)
	return NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
end
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------
--AUTOORG--
------------------------------------------------------------------------------------------------------------------------------
local blipcoords = HUD.GET_BLIP_COORDS
local number
local orgas_value
local value
local randomorg = math.random(0,1)

menu.divider(root, 'Auto CEO/MC toggle')

local orgas_options = {
    [-1] = 'Random', 
    [0] = "CEO", 
    [1] = "MC"
}

menu.list_select(menu.my_root(), "Select Organisation", {"orgslider"}, "Select Organisation that gets auto started", orgas_options, -1, function(value) --help of Sir Vsus
    orgas_value = value
    if value == -1 then notify('Random set') 
    elseif value == 0 then notify('CEO set')
    elseif value == 1 then notify('MC set')
    end
end)

menu.toggle(root, "Auto start CEO/MC.", {"autoorga"},
"If this enabled, it will automatically start an Organization, also after game restart/reinjection", function(on)
    if orgas_value == -1 and on then notify('Random Organisation is set')
-----C  E  O---------------------------------------------------------------------------------------------------------------------------
    elseif orgas_value == 0 or randomorg == 0 and on and players.get_boss(mid) == mid == false 
    then notify('CEO autostart is activated') menu.trigger_commands('ceostart')  
        util.yield(2000) notify("Started, you are now your boss")
    elseif on and players.get_boss(mid) == mid == true 
    then util.yield(1000) notify("Not started, you are allready your CEO boss")
-----M  C------------------------------------------------------------------------------------------------------------------------------
    elseif orgas_value == 1 or randomorg == 1 and on and players.get_boss(mid) == mid == false 
    then notify('MC autostart is activated') menu.trigger_commands('mcstart')  
        util.yield(2000) notify("Started, you are now your boss")
    elseif on and players.get_boss(mid) == mid == true 
    then util.yield(1000) notify("Not started, you are allready your MC boss")
---------------------------------------------------------------------------------------------------------------------------------------
    elseif not on then notify("Auto Start deactivated")
    elseif on then notify("Auto Start activated")  
    end
end)

------------------------------------------------------------------------------------------------------------------------------
--MANUAL--
------------------------------------------------------------------------------------------------------------------------------

menu.divider(root, 'Manual CEO/MC')

maction(root, "Leave current CEO/MC", {"lceo"}, "Leaves your current CEO/MC", function()
    if players.get_boss(mid) == -1
    then notify("You are not in a CEO/MC")
    else
    menu.trigger_commands('ceokick'..players.get_name(mid))
    util.yield(1000)
    notify('You left the CEO/MC')
    end
end)
maction(root, "Join CEO", {"ceo"}, "Creates a CEO again", function()
    if mid == players.get_boss(mid) == true
    then notify(alrboss)
    else if mid == players.get_boss(mid) == false
        then menu.trigger_commands('ceostart') 
            util.yield(1000)
         if mid == players.get_boss(mid) == false
            then notify('Couldnt make you the CEO boss')
            end
        end
    end
end)

maction(root, "Join MC", {"mc"}, "Creates a MC again", function()
    if mid == players.get_boss(mid) == true
    then notify(alrboss)
    else if mid == players.get_boss(mid) == false
        then menu.trigger_commands('mcstart')
            util.yield(1000)
         if mid == players.get_boss(mid) == false
            then notify('Couldnt make you the MC boss') 
            else if mid == players.get_boss(mid) == true
                then util.yield(1000) notify(gotmcboss)  
            end
        end
    end
 end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------
--OTHERS--
--------------------------------------------------------------------------------------------------------------------------------------------------
otherslist = menu.list(root, 'Others', {}, "")
------------------------------------------------------------------------------------------------------------------------
--AUTO TP--
------------------------------------------------------------------------------------------------------------------------
--[[local atp_state = false
    local BOm menu.toggle(otherslist, "Auto TP", {"autotp"}, 'Waypoint Objective and Vehicle Cargo ATM, will add list to select or remove custom blips', function(toggle)
        atp_state = toggle
        notify("Auto TP "..(toggle and "enabled" or "disabled"))
        if not toggle then return end

        local IsBlipValid = HUD.DOES_BLIP_EXIST

        while atp_state and IsBlipValid do

            local wp_blip = HUD.GET_FIRST_BLIP_INFO_ID(8) -- zu viele blips
            local y_obj_blip = HUD._GET_CLOSEST_BLIP_OF_TYPE(146)
            local aveh_blip = HUD.GET_NEXT_BLIP_INFO_ID(523)
            --find custom blips on https://docs.fivem.net/docs/game-references/blips/

            local aveh_coords = blipcoords(aveh_blip)

            if IsBlipValid(wp_blip) then
                 menu.trigger_commands("tpwp")
            elseif IsBlipValid(y_obj_blip) then
                menu.trigger_commands('tpob')
            elseif IsBlipValid(aveh_blip) then
                local distance = 6
                local is_in_area = ENTITY.IS_ENTITY_IN_AREA(players.user_ped(), 
                    aveh_coords.x - distance, aveh_coords.y - distance, aveh_coords.z - distance,
                    aveh_coords.x + distance, aveh_coords.y + distance, aveh_coords.z + distance,
                    false, false, 0
                )
                if not is_in_area then
                    PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), aveh_coords.x, aveh_coords.y, aveh_coords.z, false, false, false, false)
                end
            end
            util.yield(250)
        end
    end)]]

------------------------------------------------------------------------------------------------------------------------
--TP LIST--
------------------------------------------------------------------------------------------------------------------------
local tpplaces = 
{
    [0] = 'CEO Building',
    [1] = 'Agency',
    [2] = 'Nightclub',
    [3] = 'Clubhouse',
    [4] = 'Base',
    [5] = 'Bunker',
    [6] = 'Hangar',
    [7] = 'Casino',
    [8] = 'Yacht'
}

menu.list_action(otherslist, 'Custom TP locations', {}, "Shows you a bunch of TP's", tpplaces, function(tps)

    
    ------------------------------------------------------------------------------------------------------------------------
     --CEO BUILDING--
     ------------------------------------------------------------------------------------------------------------------------
    if tps == 0  then 
        local ceocoords = HUD.GET_BLIP_INFO_ID_COORD(HUD.GET_NEXT_BLIP_INFO_ID(475))
        if ceocoords.x == 0 and ceocoords.y == 0 and ceocoords.z == 0 
        then 
            notify('CEO Building not found')
        else
            PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), ceocoords.x, ceocoords.y, ceocoords.z, false, false, false, false)
        end
     ------------------------------------------------------------------------------------------------------------------------
     --AGENCY--
     ------------------------------------------------------------------------------------------------------------------------
    elseif tps == 1  then 
        local getagcoords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(826))
        if getagcoords.x == 0 and getagcoords.y == 0 and getagcoords.z == 0 
        then
            notify ('Agency not found') 
        else
            PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), getagcoords.x, getagcoords.y, getagcoords.z, false, false, false, false)
        end
     ------------------------------------------------------------------------------------------------------------------------
     --NIGHTCLUB--
     ------------------------------------------------------------------------------------------------------------------------
        elseif tps == 2  then 
        local getnccoords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(614))
        if getnccoords.x == 0 and getnccoords.y == 0 and getnccoords.z == 0 
        then
            notify ('Nightclub not found') 
        else
            PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), getnccoords.x, getnccoords.y, getnccoords.z, false, false, false, false)
        end
     ------------------------------------------------------------------------------------------------------------------------
     --CLUBHOUSE--
     ------------------------------------------------------------------------------------------------------------------------
    elseif tps == 3  then  
        local getchcoords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(492))
        if getchcoords.x == 0 and getchcoords.y == 0 and getchcoords.z == 0 
        then 
            notify ('Clubhouse not found') 
        else
            PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), getchcoords.x, getchcoords.y, getchcoords.z, false, false, false, false)
        end
     ------------------------------------------------------------------------------------------------------------------------
     --BASE--
     ------------------------------------------------------------------------------------------------------------------------
    elseif tps == 4  then 
        local getbacoords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(590))
        if getbacoords.x == 0 and getbacoords.y == 0 and getbacoords.z == 0 
        then
            notify ('Base not found') 
        else
            PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), getbacoords.x, getbacoords.y, getbacoords.z, false, false, false, false)
        end
     ------------------------------------------------------------------------------------------------------------------------
     --BUNKER--
     ------------------------------------------------------------------------------------------------------------------------
    elseif tps == 5  then  
        local getbucoords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(557))
        if getbucoords.x == 0 and getbucoords.y == 0 and getbucoords.z == 0 
        then
            notify ('Bunker not found') 
        else
            PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), getbucoords.x, getbucoords.y, getbucoords.z, false, false, false, false)
        end
     ------------------------------------------------------------------------------------------------------------------------
     --HANGAR--
     ------------------------------------------------------------------------------------------------------------------------
    elseif tps == 6  then  
        local gethangcoords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(569))
        if gethangcoords.x == 0 and gethangcoords.y == 0 and gethangcoords.z == 0 
        then
            notify ('Hangar not found') 
        else
            PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), gethangcoords.x, gethangcoords.y, gethangcoords.z, false, false, false, false)
        end
     ------------------------------------------------------------------------------------------------------------------------
     --CASINO--
     ------------------------------------------------------------------------------------------------------------------------
    elseif tps == 7 then
        local getcascoords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(679))
        if getcascoords.x == 0 and getcascoords.y == 0 and getcascoords.z == 0 
        then
            notify ('Casino not found') 
        else
            PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), getcascoords.x -2.5 , getcascoords.y +2 , getcascoords.z, false, false, false, false)
        end
     ------------------------------------------------------------------------------------------------------------------------
     --YACHT--
     ------------------------------------------------------------------------------------------------------------------------ 
    elseif tps == 8 then
        local getyachcoords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(455))
        if getyachcoords.x == 0 and getyachcoords.y == 0 and getyachcoords.z == 0 
        then
            notify ('Yacht not found') 
        else
            PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), getyachcoords.x - 0.1176, getyachcoords.y - 2.1187 , getyachcoords.z - 0 , false, false, false, false)
        end  
        end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
maction(otherslist, 'TP to PC', {}, 'Teleport to  Business-PC', function ()
    local pccords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(521))
    if pccords.x == 0 and pccords.y == 0 and pccords.z == 0 
    then
    notify ("No PC found") 
    else
        ENTITY.SET_ENTITY_COORDS(players.user_ped(), pccords.x, pccords.y, pccords.z, false, false, false, false)  
    end
end)

maction(otherslist, 'TP to Maze Bank top', {}, 'Teleports you to the top of the maze bank', function ()
    local distance = 7
    local is_in_area = ENTITY.IS_ENTITY_IN_AREA(players.user_ped(),
        -75 - distance, -819 - distance, 325.3 - distance,
        -75 + distance, -819 + distance, 325.3 + distance,
    false, true, 0)
    if is_in_area 
    then 
        notify('You are already at the top of Maze Bank')
    else
    PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), -75, -819, 325.3, false, false, false, false)
    end
end)

maction(otherslist, 'TP to Vehicle Cargo', {}, '', function()
    local vehcoords = blipcoords(HUD.GET_NEXT_BLIP_INFO_ID(523))
    if vehcoords.x == 0 and vehcoords.y == 0 and vehcoords.z == 0 
    then
        notify ('No Vehicle Cargo Found') 
    else
    ENTITY.SET_ENTITY_COORDS(players.user_ped(), vehcoords.x, vehcoords.y, vehcoords.z, false, false, false, false)
    end
end)

maction(otherslist, 'TP to CEO/MC Boss', {}, '', function()
   if players.user() == players.get_boss(players.user())
   or players.get_boss(players.user()) == -1
   then 
        notify('TP useless')
   else
    menu.trigger_commands("tp"..players.get_name(players.get_boss(players.user())))
   end
end)


menu.toggle_loop(otherslist, 'Enable Jumping in Interiors', {}, 'lets you jump in interiors', function() --#programming laught at me on this one  feelsokman
        if PAD.IS_CONTROL_PRESSED(298, 298) then
			MISC._SET_FORCE_PLAYER_TO_JUMP(mid)
        end
end)

menu.slider(otherslist, "Custom Vehicle Speed", {'vehspeed'}, "Custom Vehicle speed in Kmh", 0, 1000, 100, 5, function(speed)
    local realspeed = speed/3.6
    local vehicle = get_vehicle_player_is_in(pid)
    if ENTITY.DOES_ENTITY_EXIST(vehicle) and request_control(vehicle, realspeed) 
    then
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, realspeed)
        ENTITY.SET_ENTITY_MAX_SPEED(vehicle, realspeed)
    end
end)

sessionlist = menu.list(otherslist, 'Session Options', {'slist'})

local stps =
{
    [0] = 'Teleport to me',
    [1] = 'Teleport to Maze Bank'
}

menu.list_action(sessionlist, "Session Teleports", {'tpall'},  "Teleports all payers to...", stps, function(stploca)
        for _, i in pairs (players.list(false, true, true)) do
            local player = players.exists(i)
            local tp
                if stploca == 0 then
                    tp = menu.ref_by_rel_path(menu.player_root(i), "Teleport>Teleport To Me")
                elseif stploca == 1 then 
                    HUD.SET_NEW_WAYPOINT(-75.26842, -817.816, 326.1754)
                    util.yield(100)
                    tp = menu.ref_by_rel_path(menu.player_root(i), "Teleport>Teleport To Waypoint")
                if player then
                    menu.trigger_command(tp)
                  end
              end
          end
     end)


--------------------------------------------------------------------------------------------------------------------------------------------------
--PLAYERS--
--------------------------------------------------------------------------------------------------------------------------------------------------

players.on_join(function(pid)
    proot = menu.player_root(pid)
    menu.divider(proot, 'YoureNameHere')
    

    local colors =
    {
        [0] = 'Orange',
        [1] = 'Pink',
        [2] = 'Yellow',
        [3] = 'Cyan',
        [4] = 'Purple',
        [5] = 'Light Green',
        [6] = 'Blueish White',
        [7] = 'Brown',
        [8] = 'Dark Green',
        [9] = 'Red',
        [10] = 'Blue',
        [11] = 'Green',
        [12] = 'Faint Orange',
        [13] = 'Bold Cyan',
        [14] = 'Grey',
        }

maction(proot, "CEO/MC Boss", {"orgboss"}, "Will show you the Name and the Boss of this Player", function()
    local namePID = players.get_name(pid)
if namePID == -1 == true then notify(namePID..' has no Boss')
end
if players.get_name(players.get_boss(pid)) == namePID then notify(namePID..' is the Boss of his organisation')
elseif players.get_boss(pid) > -1 then notify(namePID..'s Boss is: '..players.get_name(players.get_boss(pid)))
end
end)

maction(proot, "CEO/MC Color", {"orgcolor"}, "", function()
    local colornum = players.get_org_colour(pid)
    local colorname = colors[colornum] or "None"

notify(colorname)

end)

    menu.slider(menu.player_root(pid), "Vehicle Speed", {'vehspeed'}, "",0, 1000, 100, 5,function(speed)
        local realspeed = speed/3.6
        local vehicle = get_vehicle_player_is_in(pid)
        if ENTITY.DOES_ENTITY_EXIST(vehicle) and request_control(vehicle, realspeed) then
            VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, realspeed)
            ENTITY.SET_ENTITY_MAX_SPEED(vehicle, realspeed)
        end
    end)

end)

players.dispatch_on_join()

util.keep_running()
