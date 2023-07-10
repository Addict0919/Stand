require("natives-1614644776")
util.toast("Lance\'s Anti-PVP Tryhard Script has been loaded, enjoy :)")
util.toast("Config options by clicking on this script in the Lua scripts menu")

-- if notify is on, players will see these messages when certain events trigger
-- this notify triggers when someone is blown up for using explosive or fire weapons, by default
wep_notice = "Please do not use explosive or fire weapons near other players."

-- and this one is triggered for using prohibited vehicles
veh_notice = "Please do not use vehicles with weapons near other players."

-- blacklisted damage types
-- these are set to blacklist weapons that deal explosive, gas, and fire damage
-- find values here - https://docs.fivem.net/natives/?_0x3BE0BB12D25FB305
damage_type_blacklist = {5, 6, 13}

-- blacklisted weapon hashes
-- players will be punished for having this weapons equipped, regardless of its damage type
weapon_hash_blacklist = {-1168940174, 883325847, 1198256469,-1238556825,1119849093}

-- whitelisted weapon hashes
-- players will not be punished for having this weapons equipped, regardless of its damage type
weapon_hash_whitelist = {2138347493}

-- players will not be punished for being in these vehicles, regardless of whether gta thinks it has a weapon or not
-- this is necessary because the game thinks that, for example, mavericks have weapons
-- i guess the camera is a "weapon"?
-- by default the only "weaponized" vehicle allowed here is a firetruck. because if you cant counter that, you fucking suck lmao
vehicle_hash_whitelist = {-1660661558,744705981,1949211328,1938952078}

-- players will be punished for being in these vehicles, regardless of whether gta thinks it has a weapon or not
-- useful if you really hate a certain vehicle. maybe you really want to stop people using armored kuruma.
vehicle_hash_blacklist = {}

-- uses code from https://stackoverflow.com/questions/33510736/check-if-array-contains-specific-value
-- to check if the table has a value. because lua is pretty fucking stupid
-- necessary for blacklists
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

    
-- lastchat is necessary to prevent chat spam. we init it to placeholder. this will technically break if someone sets their name to placeholder before the script starts running.
lastchat = "placeholder"
-- chat spoof helper func
function do_chat_as(name, reason)
    if name ~= lastchat then
        lastchat = name
        menu.trigger_commands("chatas" .. name .. " on")
        chat.send_message(reason, false, true, true)
        menu.trigger_commands("chatas" .. name .. " off")
    end
end

-- baseline is the text that shows up in every LAPTS announcement
-- init_announcement is what shows up when its run for the first time
-- this is to save character space. newly connected players that instantly get spoofed dont need to see that the chat is spoofed. thats redundant. its obvious
baseline = 'LAPTS is protecting this session! Performing some hostile actions near others may cause you to be auto-killed.'
init_announcement = '[SPOOFED CHAT] ' .. baseline
-- get a random player to spoof as for the announcement that isnt us ;)
function random_ply_announce(announcement)
    local plys = players.list(false, false, true)
    len = 0
    for k,v in pairs(plys) do
        len = len + 1
    end
    name = PLAYER.GET_PLAYER_NAME(plys[math.random(len)])
    do_chat_as(name, announcement)
end

-- also run this whenever someone joins, if the script user wants it
notify_joining_players = false
players.on_join(function(id)
    if notify_joining_players then
        name = PLAYER.GET_PLAYER_NAME(id)
        -- here we just do some string concatenation to welcome them with baseline, so to not show [SPOOFED CHAT]
        new_announce = 'Welcome ' .. name .. '! ' .. baseline
        do_chat_as(name, new_announce)
    end
end)

use_weapon_blacklist = true
menu.toggle(menu.my_root(), "Enforce weapons", {"enforcewep"}, "Enforces weapons players have equipped.", function(on)
    if on then
        use_weapon_blacklist = true
    else
        use_weapon_blacklist = false
    end
end, true)

enforce_vehicles = true
menu.toggle(menu.my_root(), "Enforce vehicles", {"enforcev"}, "Enforces vehicles players are in.", function(on)
    if on then
        enforce_vehicles = true
    else
        enforce_vehicles = false
    end
end, true)

notify = false
menu.toggle(menu.my_root(), "Notify for every kill", {"notifyall"}, "[NOT RECOMMENDED] Notifies the user and others in chat why they were killed", function(on)
    if on then
        notify = true
    else
        notify = false
    end
end, false)

menu.toggle(menu.my_root(), "Notify joining players", {"notifyjoining"}, "Notifies every user who joins about the protections so they know what\'s going on", function(on)
    if on then
        notify_joining_players = true
    else
        notify_joining_players = false
    end
end, false)

menu.action(menu.my_root(), "Announce LAPTS", {"announcelapts"}, "Announces the existence of LAPTS to all players, spoofing a random player name", function(on_click)
    random_ply_announce(init_announcement)
end)

radius = 100
menu.click_slider(menu.my_root(), "Protection radius", {"protradius"}, "The radius players should be protected in. Players not within radius of each other won't be blown up.", 100, 3000, 100, 100, function(s)
  radius = s
end)

menu.action(menu.my_root(), "Get vehicle model", {"getvmodel"}, "Toasts the current vehicle model so you can easily blacklist/whitelist it", function(on_click)
	veh = util.get_vehicle()
	if veh then
		util.toast("The current vehicle model is " .. ENTITY.GET_ENTITY_MODEL(veh))
	end
end)

menu.action(menu.my_root(), "Get weapon hash", {"getwhash"}, "Toasts the current weapon hash so you can easily blacklist/whitelist it", function(on_click)
	ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
	util.toast("The current weapon hash is " .. WEAPON.GET_SELECTED_PED_WEAPON(ped))
end)

function name_to_id(name)
    cur_players = players.list(true, true, true)
    for k, v in pairs(cur_players) do
        curname = PLAYER.GET_PLAYER_NAME(v)
        if curname == name then
            return v
        end
    end
    util.toast("Player " .. name .. " was not found, sorry.")
    return false
end


-- detects if a player is within radius range of another player
-- we are unfortunately going to need to loop through players again because natives dont let us directly do this afaik
-- lots of debate and decision was had on other natives such as get_closest_ped or nearby_peds but it seems they all need us to loop through shit.
-- so may as well do this directly
function is_player_near_players(ped, radius)
    local cur_players = players.list(true, true, true)
    for k,v in pairs(cur_players) do
        ped2 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
        if ped ~= ped2 then
            coords1 = ENTITY.GET_ENTITY_COORDS(ped)
            coords2 = ENTITY.GET_ENTITY_COORDS(ped2)
            dist = math.abs(MISC.GET_DISTANCE_BETWEEN_COORDS(coords1['x'], coords1['y'], coords1['z'], coords2['x'], coords2['y'], coords2['z'], true));
            -- 0.0 is returned if some coords couldnt be found or some shit, so lets just get hacky and ignore it when it happens
            if dist < radius and dist ~= 0.0 then
                return true
            end
        end
    end
    -- if we reached here, we didnt return for any part of the loop, so the player is not within radius of anyone
    return false
end

-- loop to check vehicles and destroy them if needed
function enforce_vehicles(ped, v)
    name = PLAYER.GET_PLAYER_NAME(v)
    v = PED.GET_VEHICLE_PED_IS_IN(ped, false)
    if v ~= 0 then
        class = VEHICLE.GET_VEHICLE_CLASS(v)
        model = ENTITY.GET_ENTITY_MODEL(v)
        if VEHICLE.DOES_VEHICLE_HAVE_WEAPONS(v) or has_value(vehicle_hash_blacklist, model) and ENTITY.GET_ENTITY_HEALTH(v) > 0 and not has_value(vehicle_hash_whitelist, model) then
            VEHICLE.BRING_VEHICLE_TO_HALT(v, 0.0, 1000.0, true)
            menu.trigger_commands("explode".. name)
            do_chat_as(name, veh_notice)
        end
    end
end

-- same logic but for weapons and we are destroying the player and his mom's throat instead
function enforce_weapons(ped, index)
    wep = WEAPON.GET_SELECTED_PED_WEAPON(ped)
    dtype = WEAPON.GET_WEAPON_DAMAGE_TYPE(wep)
    if dtype ~= 0  and ENTITY.GET_ENTITY_HEALTH(ped) > 0 then
        if has_value(damage_type_blacklist, dtype) or has_value(weapon_hash_blacklist, wep) and not has_value(weapon_hash_whitelist, wep) then
            name = PLAYER.GET_PLAYER_NAME(index)
            menu.trigger_commands("explode".. name)
            if notify then
                do_chat_as(name, wep_notice)
            end
        end
    end
end

-- main loop
while true do
    local cur_players = players.list(true, true, true)
    for k,v in pairs(cur_players) do
      local cur_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(v)
      if is_player_near_players(cur_ped, radius) then
        dist = ENTITY.GET_NEAREST_PLAYER_TO_ENTITY(cur_ped)
        if use_weapon_blacklist then
          enforce_weapons(cur_ped, v)
        end
        if enforce_vehicles then
          enforce_vehicles(cur_ped, v)
        end
    end
    end
    -- our yield. could MAYBE set this to have some delay if we wanted. but then script would be less accurate cause checks would run slower.
  util.yield()
end

