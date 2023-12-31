util.require_natives(1651208000)

util.show_corner_help("~g~Loaded~s~ ‹ ~o~ " .. SCRIPT_FILENAME .. "\n~s~Let's Fight Fair!! ~p~:D")

function on_stp()
	util.show_corner_help("~r~Unloaded~s~ ‹ ~o~ " .. SCRIPT_FILENAME .. "\n~s~Thanks for using ~p~:)")
end

util.on_stop(on_stp)



VEHICLE_WHITELIST = {}

PLAYER_WHITELIST = {}

WEAPON_WHITELIST = {}



local veh = entities.get_user_vehicle_as_pointer()
local vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)


local function onStartup()
    Notify = false -- notifications globally
end

function send_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
end

onStartup()


----------------------------------------------------------------
--place object next to player plane to breake of wing
--[[This funtion was original created by KeramisScript, i adjusted it to my use. 
Credit goes to him.]]
----------------------------------------------------------------
function FastNet(entity, playerID)
    local netID = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
    if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) then
        for i = 1, 30 do
            if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) then
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity)
                util.yield(10)
            else
                goto continue
            end    
        end
    end
    ::continue::
    
    NETWORK.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(netID)
    util.yield(10)
    NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(netID)
    util.yield(10)
    NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netID, false)
    util.yield(10)
    NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(netID, playerID, true)
    util.yield(10)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(entity, true, false)
    util.yield(10)
    ENTITY._SET_ENTITY_CLEANUP_BY_ENGINE(entity, false)
    util.yield(10)
    if ENTITY.IS_ENTITY_AN_OBJECT(entity) then
        NETWORK.OBJ_TO_NET(entity)
    end
    util.yield(10)
   
    ENTITY.SET_ENTITY_VISIBLE(entity, false, 0)
    util.yield()
    ENTITY.SET_ENTITY_VISIBLE(entity, false, 0)
    util.yield()
    ENTITY.SET_ENTITY_VISIBLE(entity, false, 0)

end


local function side()
	local nu = math.random(1, 2)
	if nu == 1 then
		return 5
	else
		return -5
	end
end

function PlacePole(pid)
	local ped = PLAYER.GET_PLAYER_PED(pid)
    local forwardOffset = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, side(), 0, 0)
    local pheading = ENTITY.GET_ENTITY_HEADING(ped)
    local hash = util.joaat("prop_box_wood06a")
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do util.yield() end
    local a1 = OBJECT.CREATE_OBJECT(hash, forwardOffset.x, forwardOffset.y, forwardOffset.z - 1, true, true, true)
    ENTITY.SET_ENTITY_HEADING(a1, pheading + 90)
    ENTITY.FREEZE_ENTITY_POSITION(a1, true)
    FastNet(a1, pid)
    local b1 = OBJECT.CREATE_OBJECT(hash, forwardOffset.x, forwardOffset.y, forwardOffset.z + 1, true, true, true)
    ENTITY.SET_ENTITY_HEADING(b1, pheading + 90)
    ENTITY.FREEZE_ENTITY_POSITION(b1, true)
    FastNet(b1, pid)
    util.yield(500)
    entities.delete_by_handle(a1)
    entities.delete_by_handle(b1)
end


----------------------------------------------------------------
--Check if Player is on unwanted Vehicle
----------------------------------------------------------------
function isInRC(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash1 = util.joaat("rcbandito")
    local hash2 = util.joaat("minitank")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash1) or VEHICLE.IS_VEHICLE_MODEL(vehicle, hash2) then
        return true
    else
        return false
    end
end

function isInTank(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash1 = util.joaat("khanjali")
    local hash3 = util.joaat("rhino")
    local hash4 = util.joaat("apc")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash1) or VEHICLE.IS_VEHICLE_MODEL(vehicle, hash3) or VEHICLE.IS_VEHICLE_MODEL(vehicle, hash4) then
        return true
    else
        return false
    end
end

function isInHydra(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash1 = util.joaat("hydra")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash1) then
        return true
    else
        return false
    end
end

function isInLazer(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash = util.joaat("lazer")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

function isInB11(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash = util.joaat("strikeforce")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

function isInScramjet(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash = util.joaat("scramjet")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

function isOnMK2(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash = util.joaat("oppressor2")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

function isInAkula(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash = util.joaat("akula")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

function isInSavage(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash = util.joaat("savage")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

function isInHunter(playerID)
    playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash = util.joaat("hunter")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

function isinDeluxo(playerID)
	playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
	vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
	local hash = util.joaat("deluxo")
	if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

function isinToreador(playerID)
	playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
	vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
	local hash = util.joaat("toreador")
	if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

----------------------------------------------------------------
--Explode Vehicle
----------------------------------------------------------------

function exp_veh(playerID)
	local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID))
	local ped = PLAYER.GET_PLAYER_PED(playerID)
	
	FIRE.ADD_OWNED_EXPLOSION(ped, pos.x, pos.y, pos.z, 59, 10, false, true, 0)
		util.yield(25)
end

----------------------------------------------------------------
--Get vehicle control
----------------------------------------------------------------

-- Gets the players vehicle, attempts to request control. Returns 0 if unable to get control
function get_player_vehicle_in_control(pid, opts)
    local my_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()) -- Needed to turn off spectating while getting control
    local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

    -- Calculate how far away from target
    local pos1 = ENTITY.GET_ENTITY_COORDS(target_ped)
    local pos2 = ENTITY.GET_ENTITY_COORDS(my_ped)
    local dist = SYSTEM.VDIST2(pos1.x, pos1.y, 0, pos2.x, pos2.y, 0)

    local was_spectating = NETWORK.NETWORK_IS_IN_SPECTATOR_MODE() -- Needed to toggle it back on if currently spectating
    -- If they out of range (value may need tweaking), auto spectate.
    local vehicle = PED.GET_VEHICLE_PED_IS_IN(target_ped, true)
    if opts and opts.near_only and vehicle == 0 then
        return 0
    end
    if vehicle == 0 and target_ped ~= my_ped and dist > 340000 and not was_spectating then
        util.toast("Auto Spectate")
        show_busyspinner("Auto Spectate")
        NETWORK.NETWORK_SET_IN_SPECTATOR_MODE(true, target_ped)
        -- To prevent a hard 3s loop, we keep waiting upto 3s or until vehicle is acquired
        local loop = (opts and opts.loops ~= nil) and opts.loops or 30 -- 3000 / 100
        while vehicle == 0 and loop > 0 do
            util.yield(100)
            vehicle = PED.GET_VEHICLE_PED_IS_IN(target_ped, true)
            loop = loop - 1
        end
        HUD.BUSYSPINNER_OFF()
    end

    if vehicle > 0 then
        if NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vehicle) then
            return vehicle
        end
        -- Loop until we get control
        local netid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(vehicle)
        local has_control_ent = false
        local loops = 15
        NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netid, true)

        -- Attempts 15 times, with 8ms per attempt
        while not has_control_ent do
            has_control_ent = NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle)
            loops = loops - 1
            -- wait for control
            util.yield(15)
            if loops <= 0 then
                break
            end
        end
    end
    if not was_spectating then
        NETWORK.NETWORK_SET_IN_SPECTATOR_MODE(false, target_ped)
    end
    return vehicle
end
-- Helper functions
function control_vehicle(pid, callback, opts)
    local vehicle = get_player_vehicle_in_control(pid, opts)
    if vehicle > 0 then
        callback(vehicle)
    elseif opts == nil or opts.silent ~= true then
        util.toast("Player out of range")
    end
end



----------------------------------------------------------------
--Flip Vehicle
----------------------------------------------------------------
function flip(playerID)
	control_vehicle(playerID, function(veh)
		local rot = ENTITY.GET_ENTITY_ROTATION(veh)
		ENTITY.SET_ENTITY_ROTATION(veh, rot.x, 530, rot.z)
		util.yield(10000)
	end)
end

----------------------------------------------------------------
--EMP Vehicle
----------------------------------------------------------------

function emp_car(playerID)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID))

	FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 83, 10, 0, true, 0, true)
		util.yield(60000)
end

----------------------------------------------------------------
--Explode Player
----------------------------------------------------------------

function exp_ped(playerID)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID))
	FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 72, 350, 0, true, 0, false)
		util.yield(25000)
end

----------------------------------------------------------------
--Damage Player with Atomizer
----------------------------------------------------------------

function make_fly(playerID)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID))
	FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 70, 10, 0, true, 0, true)
		util.yield(25000)
end

----------------------------------------------------------------
--Firework Explo Player
----------------------------------------------------------------

function fire_exp_ped(playerID)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID))
	FIRE.ADD_EXPLOSION(pos.x, pos.y, pos.z, 38, 10, 0, false, 0, true)
		util.yield(10000)
end

----------------------------------------------------------------
--Damage Player with Stungun
----------------------------------------------------------------

function tase_pl(playerID)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID))
	local hash = util.joaat("weapon_stungun")
	WEAPON.REQUEST_WEAPON_ASSET(hash)
	MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+3, pos.x , pos.y, pos.z-2, 1, 0, hash, 0, false, true, 1000.0)
		util.yield(10000)
end

----------------------------------------------------------------
--Delete Heavy Weapons
----------------------------------------------------------------

function delete_hw(playerID)
	local ped = PLAYER.GET_PLAYER_PED(playerID)
	local rpg = util.joaat("weapon_rpg")
	local homing = util.joaat("weapon_hominglauncher")
	local ray = util.joaat("weapon_rayminigun")
	local minigun = util.joaat("weapon_minigun")
	local glauncher = util.joaat("weapon_grenadelauncher")
	
	WEAPON.REMOVE_WEAPON_FROM_PED(ped, rpg)
	WEAPON.REMOVE_WEAPON_FROM_PED(ped, homing)
	WEAPON.REMOVE_WEAPON_FROM_PED(ped, ray)
	WEAPON.REMOVE_WEAPON_FROM_PED(ped, minigun)
	WEAPON.REMOVE_WEAPON_FROM_PED(ped, glauncher)
end

----------------------------------------------------------------
--Delete Throwables
----------------------------------------------------------------

function delete_throw(playerID)
	local ped = PLAYER.GET_PLAYER_PED(playerID)
	local sticky = util.joaat("weapon_stickybomb")
	local grenade = util.joaat("weapon_grenade")
	local molo = util.joaat("weapon_molotov")
	local proxi = util.joaat("weapon_proxmine")

	WEAPON.REMOVE_WEAPON_FROM_PED(ped, sticky)
	WEAPON.REMOVE_WEAPON_FROM_PED(ped, grenade)
	WEAPON.REMOVE_WEAPON_FROM_PED(ped, molo)
	WEAPON.REMOVE_WEAPON_FROM_PED(ped, proxi)
end

----------------------------------------------------------------
--Drop Throw
----------------------------------------------------------------

function dropT(playerID)
	local ped = PLAYER.GET_PLAYER_PED(playerID)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID))
	local g = util.joaat("weapon_grenade")
	local s = util.joaat("weapon_stickybomb")
	local m = util.joaat("weapon_molotov")
	local p = util.joaat("weapon_proxmine")

	WEAPON.SET_PED_DROPS_INVENTORY_WEAPON(ped, g, pos.x, pos.y, pos.z, 1)
	WEAPON.SET_PED_DROPS_INVENTORY_WEAPON(ped, s, pos.x, pos.y, pos.z, 1)
	WEAPON.SET_PED_DROPS_INVENTORY_WEAPON(ped, m, pos.x, pos.y, pos.z, 1)
	WEAPON.SET_PED_DROPS_INVENTORY_WEAPON(ped, p, pos.x, pos.y, pos.z, 1)
end

----------------------------------------------------------------
--Drop Heavy
----------------------------------------------------------------

function dropH(playerID)
	local ped = PLAYER.GET_PLAYER_PED(playerID)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID))
	local rpg = util.joaat("weapon_rpg")
	local homing = util.joaat("weapon_hominglauncher")
	local ray = util.joaat("weapon_rayminigun")
	local minigun = util.joaat("weapon_minigun")
	local glauncher = util.joaat("weapon_grenadelauncher")

	WEAPON.SET_PED_DROPS_INVENTORY_WEAPON(ped, rpg, pos.x, pos.y, pos.z, 1)
	WEAPON.SET_PED_DROPS_INVENTORY_WEAPON(ped, homing, pos.x, pos.y, pos.z, 1)
	WEAPON.SET_PED_DROPS_INVENTORY_WEAPON(ped, ray, pos.x, pos.y, pos.z, 1)
	WEAPON.SET_PED_DROPS_INVENTORY_WEAPON(ped, minigun, pos.x, pos.y, pos.z, 1)
	WEAPON.SET_PED_DROPS_INVENTORY_WEAPON(ped, glauncher, pos.x, pos.y, pos.z, 1)
end

----------------------------------------------------------------
--Check for Player Weapon
----------------------------------------------------------------

function hasHWeapon(playerID)
	local List = {
		[util.joaat("weapon_rpg")] = true,
		[util.joaat("weapon_hominglauncher")] = true,
		[util.joaat("weapon_rayminigun")] = true,
		[util.joaat("weapon_minigun")] = true, 
		[util.joaat("weapon_grenadelauncher")] = true
		}
	local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
	if List[WEAPON.GET_SELECTED_PED_WEAPON(playerPed)] then
		return true
	else
		return false
	end
end

function hasTWeapon(playerID)
	local List = {
		[util.joaat("weapon_stickybomb")] = true,
		[util.joaat("weapon_grenade")] = true,
		[util.joaat("weapon_molotov")] = true,
		[util.joaat("weapon_proxmine")] = true
		}
	local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
	if List[WEAPON.GET_SELECTED_PED_WEAPON(playerPed)] then
		return true
	else
		return false
	end
end




----------------------------------------------------------------
--Player List Options
----------------------------------------------------------------


function playerActionsSetup(playerID)
	menu.divider(menu.player_root(playerID), "Fair Fight")
		
		local playerName = players.get_name(playerID)
		local p = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
		local tools = menu.list(menu.player_root(playerID), "Tools", {}, "These options work on legit, but may not work on other modders")
		menu.action(tools, "Godmode Check", {"godcheck"}, "", function()
			if players.is_godmode(playerID) and not players.is_in_interior(playerID) then
					util.toast(players.get_name(playerID) .. " is in godmode!")
			elseif (players.is_in_interior(playerID)) then
					util.toast(players.get_name(playerID) .. " is in an interior!")
			else
					util.toast(players.get_name(playerID) .. " is not in godmode!")
			end
		end)
		menu.toggle_loop(tools, "Remove player godmode", {"nogod"}, "Removes " .. playerName .. "'s godmode, if they're not on a good paid menu.", function ()
			if not players.is_in_interior(playerID) then
				util.trigger_script_event(1 << playerID, {801199324, playerID, 869796886})
			elseif players.is_in_interior(playerID) then
				util.toast("" .. playerName .. " is in an interior. Try again if he is outside again.")
				menu.commands("nogod" .. playerName)
			end
		end)
		--Block/unblock passive mode is from PhoenixScript so all credits for it, go to ICYPhoneix
		local pas = menu.list(tools, "Passive Mode")
		menu.action(pas, "Block Passive", {}, "", function()
			if players.exists(playerID) then
                send_script_event(1114091621, playerID, {playerID, 1})
                send_script_event(1859990871, playerID, {playerID, 1})
				util.yield()
				if Notify then 
					util.toast("Block Passive has been sent to " .. playerName)
				end
			else
					util.toast("Could not find " .. playerName)
			end
		end)
		menu.action(pas, "Unblock Passive", {}, "", function()
			if players.exists(playerID) then
                send_script_event(1114091621, playerID, {playerID, 0})
                send_script_event(2033772643, playerID, {playerID, 0})
				util.yield()
				if Notify then
					util.toast("Unblock Passive has been sent to " .. playerName)
				end
			else
					util.toast("Could not find " .. playerName)
			end
		end)

		local sub = menu.list(menu.player_root(playerID), "Exceptions")			
			menu.toggle(sub, "Blacklist from Player Options", {"plblacklist"}, "Blacklists " .. playerName .. " from all player related options.", function(on)
			if on then
				PLAYER_WHITELIST[playerID] = true
			else
				PLAYER_WHITELIST[playerID] = false
			end
			end)			
			menu.toggle(sub, "Blacklist from Weapon Options", {"wpblacklist"}, "Blacklists " .. playerName .. " from all weapon related options.", function(on)
			if on then
				WEAPON_WHITELIST[playerID] = true
			else
				WEAPON_WHITELIST[playerID] = false
			end
			end)
			menu.toggle(sub, "Blacklist from Vehicle Options", {"vhblacklist"}, "Blacklists " .. playerName .. " from all vehicle related options.", function(on)
			if on then
				VEHICLE_WHITELIST[playerID] = true
			else
				VEHICLE_WHITELIST[playerID] = false
			end
			end)
end

players.on_join(playerActionsSetup)
players.dispatch_on_join()

----------------------------------------------------------------
--Header
----------------------------------------------------------------

menu.divider(menu.my_root(), " " .. SCRIPT_NAME .. " ")

----------------------------------------------------------------
--Player Opt List
----------------------------------------------------------------

local plist = menu.list(menu.my_root(), "Player Options")

----------------------------------------------------------------
--Player Options
----------------------------------------------------------------

		menu.divider(plist, "Player Options")
		local noarm = false
		menu.toggle(plist, "No armor", {}, "Will set the players armor to 0 if he has more then 20", function(he)
			if he then
				noarm = true
				if Notify then
					util.toast("Remove armor on")
				end
			else
				noarm = false
				if Notify then
					util.toast("Remove armor off")
				end
			end
		end, false)
		local nohelmet = false
		menu.toggle(plist, "No helmet", {}, "Removes the helmet from all players", function(he)
			if he then
				nohelmet = true
				if Notify then
					util.toast("Remove helmet on")
				end
			else
				nohelmet = false
				if Notify then
					util.toast("Remove helmet off")
				end
			end
		end, false)
		local ch = false
		menu.toggle(plist, "No cover heal", {}, "Toggles the healing ability in cover.", function(t)
			if t then
				ch = true
				if Notify then
					util.toast("No cover heal on")
				end
			else
				ch = false
				if Notify then
					util.toast("No cover heal off")
				end
			end
		end, false)
		local fall = false
		menu.toggle(plist, "No fall damage", {}, "Toggle fall damage for everyone in the lobby", function(s)
			if s then
				if Notify then
					util.toast("No fall damage on")
				end
				fall = true
				
			else
				if Notify then
					util.toast("No fall damage off")
				end
				fall = false
			end
		end)

----------------------------------------------------------------
--Weapons
----------------------------------------------------------------
		local weapons = menu.list(menu.my_root(), "Weapon Options")
		menu.divider(weapons, "Weapons")

		local nohw = false
		menu.toggle(weapons, "Heavy Weapons", {}, "RPG / Minigun / Homing Launcher / Widowmaker / Grenade Launcher\n\nDeletes the Weapons if no other Punishment is activ.", function(he)
			if he then
				nohw = true
				if Notify then
					util.toast("Heavy Weapons Enabled")
				end
			else
				nohw = false
				if Notify then
					util.toast("Heavy Weapons Disabled")
				end
			end
		end, false)
		local nothrow = false
		menu.toggle(weapons, "Throwables", {}, "Stickybomb / Granade / Proximity Mines / Molotov\n\nDeletes the Weapons if no other Punishment is activ.", function(he)
			if he then
				nothrow= true
				if Notify then
					util.toast("Throwables Enabled")
				end
			else
				nothrow= false
				if Notify then
					util.toast("Throwables Disabled")
				end
			end
		end, false)
		

----------------------------------------------------------------
--Weapon Punishments
----------------------------------------------------------------
		menu.divider(weapons, "Punishments")

		local annoying = menu.list(weapons, "Troll")
		menu.divider(annoying, "Troll")
		local disable = false
		menu.toggle(annoying, "Disable", {}, "Makes the users unable to use the active weapon group", function(er)
			if er then
				disable = true
				if Notify then
					util.toast("Disable toggled on")
				end
			else
				disable = false
				if Notify then
					util.toast("Disable toggled off")
				end
			end
		end, false)

		local Drop = false
		menu.toggle(annoying, "Drop", {}, "Drops the weapons on ground", function(o)
			if o then
				Drop = true
				if Notify then
					util.toast("Drop Enabled")
				end
			else 
				Drop = false
				if Notify then
					util.toast("Drop Disabled")
				end
			end
		end, false)
		
		local stun = false
		menu.toggle(annoying, "Stun", {}, "Stuns the Player (every 25sec)", function(he)
			if he then
				stun = true
				if Notify then
					util.toast("Stun Enabled")
				end
			else
				stun = false
				if Notify then
					util.toast("Stun Disabled")
				end
			end
		end, false)
		
		local fly = false
		menu.toggle(annoying, "Fly", {}, "Makes the Player fly up in the Air (every 25sec) Just like Atomizer", function(he)
			if he then
				fly = true
				if Notify then
					util.toast("Fly Enabled")
				end
			else
				fly = false
				if Notify then
					util.toast("Fly Disabled")
				end
			end
		end, false)

		local toxic = menu.list(weapons, "Toxic")
		menu.divider(toxic, "Toxic")

		local fireexplPed = false
		menu.toggle(toxic, "Firework", {"fireexplo"}, "Firework on the Player (every 25sec)", function(lol)
			if lol then
				fireexplPed = true
				if Notify then
					util.toast("Firework Enabled")
				end
			else
				fireexplPed = false
				if Notify then
					util.toast("Firework Disabled")
				end
			end
		end, false)

		local explodePed = false
		menu.toggle(toxic, "Explode", {"explo"}, "Explodes the Player (every 25sec)", function(lol)
			if lol then
				explodePed = true
				if Notify then
					util.toast("Explode Enabled")
				end
			else
				explodePed = false
				if Notify then
					util.toast("Explode Disabled")
				end
			end
		end, false)
----------------------------------------------------------------
--Vehicle Options List
----------------------------------------------------------------

local vlist = menu.list(menu.my_root(), "Vehicle Options")
	menu.divider(vlist, "Vehicle Options")

----------------------------------------------------------------
--Vehicles toggles
----------------------------------------------------------------

local vehlist = menu.list(vlist, "Vehicles")

		menu.divider(vehlist, "Vehicles")

		local spec = menu.list(vehlist, "Special Cars")
		
		menu.divider(spec, "Special Cars")

		local antiMK2 = false
		menu.toggle(spec, "Oppressor MK2", {"antimk2"}, "Enables/Disables the Anti MK2 feature.", function(on)
			if on then
				antiMK2 = true
				if Notify then
					util.toast("Oppressor MK2 On")
				end
			else
				antiMK2 = false
				if Notify then
					util.toast("Oppressor MK2 Off")
				end
			end
		end, false)
		
		local antiScramjet = false
		menu.toggle(spec, "Scramjet", {"antiscramjet"}, "Enables/Disables the Anti Scramjet feature.", function(on)
			if on then
				antiScramjet = true
				if Notify then
					util.toast("Scramjet On")
				end
			else
				antiScramjet = false
				if Notify then
					util.toast("Scramjet Off")
				end
			end
		end, false)

		local antiDeluxo = false
		menu.toggle(spec, "Deluxo", {"antideluxo"}, "Enables/Disables the Anti Deluxo feature.", function(on)
			if on then
				antiDeluxo = true
				if Notify then
					util.toast("Deluxo On")
				end
			else
				antiDeluxo = false
				if Notify then
					util.toast("Deluxo Off")
				end
			end
		end, false)

		local antiToreador = false
		menu.toggle(spec, "Toreador", {"antitoreador"}, "Enables/Disables the Anti Toreador feature.", function(on)
			if on then
				antiToreador = true
				if Notify then
					util.toast("Toreador On")
				end
			else
				antiToreador = false
				if Notify then
					util.toast("Toreador Off")
				end
			end
		end, false)

		local plane = menu.list(vehlist, "Planes")

		menu.divider(plane, "Planes")

		local antiLazer = false
		menu.toggle(plane, "P-996 Lazer", {"antilazer"}, "Enables/Disables the Anti Lazer feature.", function(on)
			if on then
				antiLazer = true
				if Notify then
					util.toast("P-996 Lazer On")
				end
			else
				antiLazer = false
				if Notify then
					util.toast("P-996 Lazer Off")
				end
			end
		end, false)

		local antiB11 = false
		menu.toggle(plane, "B11-Strikeforce", {"antib11"}, "Enables/Disables the Anti B11 feature.", function(on)
			if on then
				antiB11 = true
				if Notify then
					util.toast("B11-Strikeforce On")
				end
			else
				antiB11 = false
				if Notify then
					util.toast("B11-Strikeforce Off")
				end
			end
		end, false)

		local antiHydra = false
		menu.toggle(plane, "Hydra", {"antihydra"}, "Enables/Disables the Anti Hydra feature.", function(on)
			if on then
				antiHydra = true
				if Notify then
					util.toast("Hydra On")
				end
			else
				antiHydra = false
				if Notify then
					util.toast("Hydra Off")
				end
			end
		end, false)
		local heli = menu.list(vehlist, "Helicopters")

		menu.divider(heli, "Helicopters")

		local antiAkula = false
		menu.toggle(heli, "Akula", {"antiakula"}, "Enables/Disables the Anti Akula feature.", function(on)
			if on then
				antiAkula = true
				if Notify then
					util.toast("Akula On")
				end
			else
				antiAkula = false
				if Notify then
					util.toast("Akula Off")
				end
			end
		end, false)

		local antiHunter = false
		menu.toggle(heli, "Hunter", {"antihunter"}, "Enables/Disables the Anti Hunter feature.", function(on)
			if on then
				antiHunter = true
				if Notify then
					util.toast("Hunter On")
				end
			else
				antiHunter = false
				if Notify then
					util.toast("Hunter Off")
				end
			end
		end, false)

		local antiSavage = false
		menu.toggle(heli, "Savage", {"antisavage"}, "Enables/Disables the Anti Savage feature.", function(on)
			if on then
				antiSavage = true
				if Notify then
					util.toast("Savage On")
				end
			else
				antiSavage = false
				if Notify then
					util.toast("Savage Off")
				end
			end
		end, false)

		local grou = menu.list(vehlist, "Ground Vehicles")
	
		menu.divider(grou, "Ground Vehicles")

		local antiTank = false
		menu.toggle(grou, "Tanks", {"antitank"}, "Enables/Disables the Anti Tank feature. \n\nThe following vehicles are affected: \nkhanjali, minitank, rhino and apc", function(on)
			if on then
				antiTank = true
				if Notify then
					util.toast("Tank On")
				end
			else
				antiTank = false
				if Notify then
					util.toast("Tank Off")
				end
			end
		end, false)
		
		local antiRCbandito = false
		menu.toggle(grou, "RC Bandito", {"antircbandito"}, "Enables/Disables the Anti Bandito feature.", function(on)
			if on then
				antiRCbandito = true
				if Notify then
					util.toast("RC Bandito On")
				end
			else
				antiRCbandito = false
				if Notify then
					util.toast("RC Bandito Off")
				end
			end
		end, false)

		menu.divider(vehlist, " ")

		--Toggle all cars	

		local toggleAll = false
		menu.toggle(vehlist, "Toggle All", {}, "Toggle all Cars", function(on)
			if on then
				toggleAll = true
				antiLazer = true
				antiB11 = true
				antiTank = true
				antiMK2 = true
				antiAkula = true
				antiHunter = true
				antiSavage = true
				antiHydra = true
				antiRCbandito = true
				antiScramjet = true
				antiDeluxo = true
				antiToreador = true
				if Notify then
					util.toast("Toggle All On")
				end
			else
				toggleAll = false
				antiLazer = false
				antiB11 = false
				antiTank = false
				antiMK2 = false
				antiAkula = false
				antiHunter = false
				antiSavage = false
				antiHydra = false
				antiRCbandito = false
				antiScramjet = false
				antiDeluxo = false
				antiToreador = false
				if Notify then
					util.toast("Toggle All Off")
				end
			end
		end, false)
----------------------------------------------------------------
--Vechile Punishments
----------------------------------------------------------------

	menu.divider(vlist, "Punishments")

		local annoy = menu.list(vlist, "Troll")
		menu.divider(annoy, "Troll")


		local Vtoxic = menu.list(vlist, "Toxic")
		menu.divider(Vtoxic, "Toxic")

		local burst = false
		local s = menu.list(annoy, "Tires")
		local wheel = "All"
			menu.toggle(s, "Toggle", {}, "Burstes and repairs the tires in a loop.", function(l)
				if l then
					burst = true
					if Notify then
						util.toast("Tires burst on")
					end
				else
					burst = false
					if Notify then
						util.toast("Tires burst off")
					end
				end
			end, false)
			local delay = 20
			menu.slider(s, "Delay", {"sdelay"}, "Set the loop delay (time is in sec)", 5, 150, delay, 5, function(value)
				delay = value
			end)
			local options = {{"All", {}, ""}, {"Front", {}, ""}, {"Back", {}, ""}, {"Left", {}, ""}, {"Right", {}, ""}, {"Random", {}, "Only one random tire gets targeted"}}
			menu.list_select(s, "Which", {}, "", options, 1, function (selected)
    			wheel = options[selected][1]
			end)

		local loseParts
		menu.toggle(Vtoxic, "Lose Parts", {}, "Breaks a random door and repairs it over and over again.\n\nFor planes, it breaks a wing off.", function(lol)
			if lol then
				loseParts = true
				if Notify then
					util.toast("Lose parts on")
				end
			else
				loseParts = false
				if Notify then
					util.toast("Lose parts off")
				end
			end
		end, false)


		local Kick
		menu.toggle(Vtoxic, "Lobby Kick", {}, "Kicks the Player from the Lobby", function(lol)
			if lol then
				Kick = true
				if Notify then
					util.toast("Lobby Kick On")
				end
				util.log("Lobby Kick On")
			else
				Kick = false
				if Notify then
					util.toast("Lobby Kick Off")
				end
				util.log("Lobby Kick Off")
			end
		end, false)
		local Explode = false
	exploID = menu.toggle(Vtoxic, "Explode", {}, "Explodes the Vehicle", function(lol)
			if lol then
				Explode = true
				if Notify then
					util.toast("Vehicle Explode On")
				end
			else
				Explode = false
				if Notify then
					util.toast("Vehicle Explode Off")
				end
			end
		end, false)
		local Delete = false
		menu.toggle(annoy, "Delete", {}, "Erase the Vehicle", function(lol)
			if lol then
				Delete = true
				if Notify then
					util.toast("Vehicle Delete On")
				end
			else
				Delete = false
				if Notify then
					util.toast("Vehicle Delete Off")
				end
			end
		end, false)
		local Engine = false
		menu.toggle(annoy, "Destroy Engine", {}, "Destroys the Engine from the Vehicle", function(lol)
			if lol then
				Engine = true
				if Notify then
					util.toast("Kill Engine On")
				end
			else
				Engine = false
				if Notify then
					util.toast("Kill Engine Off")
				end
			end
		end, false)
		local EMP = false
		menu.toggle(annoy, "EMP", {}, "EMP shock the Vehicle (every 60sec)", function(m)
			if m then
				EMP = true
				if Notify then
					util.toast("Vehicle EMP On")
				end
			else
				EMP = false
				if Notify then
					util.toast("Vehicle EMP Off")
				end
			end
		end, false)
		local Flip = false
		menu.toggle(annoy, "Flip", {}, "Flip the Vehicle upside down (every 15sec)", function(s)
			if s then 
				Flip = true
				if Notify then
					util.toast("Vehicle Flip On")
				end
			else
				Flip = false
				if Notify then
					util.toast("Vehicle Flip Off")
				end
			end
		end, false)
		local sling = false
		menu.toggle(Vtoxic, "Slingshot", {}, "Boost the vehicle up and forward", function(toggle)
			if toggle then
				sling = true
				if Notify then
					util.toast("Vehicle Slingshot On")
				end
			else
				sling = false
				if Notify then
					util.toast("Vehicle Slingshot Off")
				end
			end
		end, fasle)

----------------------------------------------------------------
--Settings
----------------------------------------------------------------
menu.divider(menu.my_root(), "Info / Settings")

local set = menu.list(menu.my_root(), "Settings")
menu.divider(set, "Settings")

menu.toggle(set, "Toggle Notifications", {}, "Toggle Notifications like 'Tanks On' or 'Player in Vehicle'.\n\nBy default notifications are turned OFF", function(on)
    if on then
        Notify = true
    else
        Notify = false
    end
end)

kek = menu.action(set, "More comming...", {}, "", function()
	util.toast("might not take as long as this one (not a promise)")
	util.toast("Nothing will happen. Wait for next update.")
	util.yield(150)
	menu.delete(kek)
	menu.action(set, "More comming...", {}, "", function()end)
end)


local contactlist = menu.list(menu.my_root(), "Credits")
		menu.hyperlink(contactlist, "Me (Creator of FairFight)", "https://discordapp.com/users/412239651185623040", "Hey thanks for using Fair Fight. You can call me Mr.Wall or Wall for short.\nI am the creator of this script. Even though I don't have much Lua experience, I try to make the most of it.\n\nIf you find a bug or have any suggestions for improvement. Feel free to write me a message on Discord.")
		menu.hyperlink(contactlist, "scriptcat", "https://github.com/Keramis/", "Scriptcat is the original creater of the Godmode Check and Remove Godmode Function.\nAll Credit goes to him.")
		menu.hyperlink(contactlist, "ICYPhoniex", "https://discord.gg/WQE28U7sds", "ICYPhoneix is the original creater of the block/unblock passive mode function.\nAll Credit goes to him.")



----------------------------------------------------------------
--Loop Handles Start
----------------------------------------------------------------
local lastReaction = util.current_time_millis()
local delay = 1500
while true do
	for a = 0,31 do
		if players.exists(a) then
			local isLocalPlayer = a == PLAYER.PLAYER_ID()
			local p = PLAYER.GET_PLAYER_PED(a)

----------------------------------------------------------------
--Handle Player Options
----------------------------------------------------------------
			
			if noarm and not PLAYER_WHITELIST[a] and not isLocalPlayer then
				d = PED.GET_PED_ARMOUR(p)
				if d > 20 then
					if Notify then
						util.toast("Armor equipped by: "..PLAYER.GET_PLAYER_NAME(a).."\nRemoved it..")
					end
					PED.SET_PED_ARMOUR(p, 0)
				end
			end
			
			if nohelmet and not PLAYER_WHITELIST[a] and not isLocalPlayer then
				d = PED.IS_PED_WEARING_HELMET(p)
				if d then
					if Notify then
						util.toast("Helmet equipped by a player...\n" .. PLAYER.GET_PLAYER_NAME(a) .. "\nRemoved it...")
					end
					PED.REMOVE_PED_HELMET(p, true)
				end
			end

			if ch and not PLAYER_WHITELIST[a] and not isLocalPlayer then
				if PED.IS_PED_IN_COVER(p) then
					PLAYER._SET_PLAYER_HEALTH_RECHARGE_LIMIT(a, 0.01)
					PLAYER.SET_PLAYER_HEALTH_RECHARGE_MULTIPLIER(a, 1.0)
				else
					PLAYER._SET_PLAYER_HEALTH_RECHARGE_LIMIT(a, 0.5)
					PLAYER.SET_PLAYER_HEALTH_RECHARGE_MULTIPLIER(a, 1.0)
				end
			end
			--reset recharge to default
			if not ch then
				PLAYER._SET_PLAYER_HEALTH_RECHARGE_LIMIT(a, 0.5)
				PLAYER.SET_PLAYER_HEALTH_RECHARGE_MULTIPLIER(a, 1.0)
			end
			if fall then
				while PED.IS_PED_FALLING(p) do
					ENTITY.SET_ENTITY_HEALTH(p, PED.GET_PED_MAX_HEALTH(p))
					PED.CLEAR_PED_BLOOD_DAMAGE(p)
					util.yield()
				end
			end

			if hasHWeapon(a) and nohw and not WEAPON_WHITELIST[a] and not isLocalPlayer then
				if fly then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nMaking them fly...")
							util.yield(1500)
					end
					make_fly(a)
				elseif disable then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\ndisabling ..")
					end
					WEAPON.SET_CURRENT_PED_WEAPON(p, 0xA2719263, true) --hash is for fist
				elseif stun then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nStuning them...")
							util.yield(1500)
					end
					tase_pl(a)
				elseif explodePed then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nExploding them...")
							util.yield(1500)
					end
					if not PLAYER.IS_PLAYER_DEAD(a) then
						exp_ped(a)
					end
				elseif fireexplPed then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nFiring Fireworks at them...")
							util.yield(1500)
					end
					if not PLAYER.IS_PLAYER_DEAD(a) then
						fire_exp_ped(a)
					end
				elseif Drop then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nDropping them on Ground...")
							util.yield(1500)
					end
						dropH(a)
				else
					if Notify then
						util.toast("Use of heavy weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nRemove them...")
							util.yield(1500)
					end
					delete_hw(a)
				end
			end
			
			if hasTWeapon(a) and nothrow and not WEAPON_WHITELIST[a] and not isLocalPlayer then
				if fly then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nMaking them fly...")
							util.yield(1500)
					end
					make_fly(a)
				elseif disable then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\ndisabling ...")
					end
					WEAPON.SET_CURRENT_PED_WEAPON(p, 0xA2719263, true) --hash is for fist
				elseif Drop then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nDropping them on Ground...")
							util.yield(1500)
					end
					dropT(a)
				elseif stun then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nStuning them...")
							util.yield(1500)
					end
					tase_pl(a)

				elseif explodePed then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nExploding them...")
							util.yield(1500)
					end
					if not PLAYER.IS_PLAYER_DEAD(a) then
						exp_ped(a)
					end

				elseif fireexplPed then
					if Notify then
						util.toast("Use of unfair weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nFiring Fireworks at them...")
							util.yield(1500)
					end
					if not PLAYER.IS_PLAYER_DEAD(a) then
						fire_exp_ped(a)
					end

				else
					if Notify then
						util.toast("Use of heavy weapons by: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nRemove them...")
							util.yield(1500)
					end
					delete_throw(a)
				end
			end
	
----------------------------------------------------------------
--Handle Vehicle Actions
----------------------------------------------------------------

			if not VEHICLE_WHITELIST[a] and not isLocalPlayer then
				if antiToreador and isinToreador(a) or antiLazer and isInLazer(a) or antiB11 and isInB11(a) or antiMK2 and isOnMK2(a) or antiTank and isInTank(a) or antiAkula and isInAkula(a) or antiHunter and isInHunter(a) or antiSavage and isInSavage(a) or antiHydra and isInHydra(a) or antiScramjet and isInScramjet(a) or antiRCbandito and isInRC(a) or antiTank and isInRC(a) or antiDeluxo and isinDeluxo(a) and (lastReaction + delay <= util.current_time_millis()) then
					if Kick then
						menu.trigger_commands("kick" .. PLAYER.GET_PLAYER_NAME(a))
						if Notify then
							util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nKicking him from the Lobby...")
						end
					elseif burst then
						control_vehicle(a, function(veh)
							if not VEHICLE.GET_VEHICLE_TYRES_CAN_BURST(vehicle) then
								VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, true)
							else 
								goto f
							end
							::f::
							if wheel == "Front" then
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 0, true, 1000.0)
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 1, true, 1000.0)
								goto c
							elseif wheel == "Back" then
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 4, true, 1000.0)
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 5, true, 1000.0)
								goto c
							elseif wheel == "Left" then
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 4, true, 1000.0)
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 0, true, 1000.0)
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 2, true, 1000.0) --6 wheel trailer mid left tire
								goto c
							elseif wheel == "Right" then
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 5, true, 1000.0)
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 1, true, 1000.0)
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 3, true, 1000.0) --6 wheel trailer mid right tire
								goto c
							elseif wheel == "Random" then
								VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, math.random(0,7), true, 1000.0)
								goto c
							else
								for wheelId = 0, 7 do
									VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, wheelId, true, 1000.0)
								end
							end
							::c::
							util.yield(delay)
							VEHICLE.SET_VEHICLE_FIXED(vehicle)
							util.yield(delay * 10)
						end)
					elseif loseParts then
						if VEHICLE.IS_THIS_MODEL_A_PLANE(ENTITY.GET_ENTITY_MODEL(vehicle)) then
							if VEHICLE.GET_VEHICLE_BODY_HEALTH(vehicle) >= 500 and ENTITY.IS_ENTITY_IN_AIR(vehicle) and ENTITY.GET_ENTITY_SPEED(vehicle) >= 65 then
								PlacePole(a)
								if Notify then
									util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nDetaching a wing...")
								end
							else
								if Notify then
									util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nWait for him to take off for maximum effect...")
									util.yield(700)
								end
							end
						else
							if not isOnMK2(a) then
								control_vehicle(a, function(veh)
									VEHICLE.SET_VEHICLE_DOOR_BROKEN(vehicle, math.random(0, 5), false)
										util.yield(600)
										VEHICLE.SET_VEHICLE_FIXED(vehicle)
								end)
								if Notify then
									util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nDetaching his parts...")
								end
							else
								util.toast("I did nothing, because " .. PLAYER.GET_PLAYER_NAME(a) .. " is on a MK2.\nThey don't have any doors to remove. Activate some other punishment.")
								util.yield(2500)
							end
						end
					elseif Explode then
						if not PLAYER.IS_PLAYER_DEAD(a) then
							exp_veh(a)
							if Notify then
							util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nExploding his Car...")
							end
						end
					elseif Delete then
						if Notify then
							util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nErasing his Car...")
						end
						control_vehicle(a, function(veh)
							entities.delete_by_handle(veh)
						end)
					elseif Engine then
						if Notify then
							util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nKilling his Engine...")
								util.yield(1600)
						end
						control_vehicle(a, function(veh)
							VEHICLE.SET_VEHICLE_ENGINE_HEALTH(veh, -4000)
							if isInRC(a) then
								VEHICLE.SET_VEHICLE_TIMED_EXPLOSION(veh, a, true)
							end
						end)
					elseif EMP then
						if Notify then
							util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nEMP shocking the Vehicle...")
								util.yield(1600)
						end
							emp_car(a)
					elseif Flip then
						if Notify then
							util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nFliped the Vehicle...")
								util.yield(1500)
						end
							flip(a)
					elseif sling then
						if Notify then
							util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nMaking the Vehicle be a plane...")
								util.yield(1500)
						end
						control_vehicle(a, function(veh)
							VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, 250)
							local po = ENTITY.GET_ENTITY_VELOCITY(veh)
							ENTITY.SET_ENTITY_VELOCITY(veh, po.x, po.y, po.z + 80)
							util.yield(30000)
						end)
					else
						if Notify then
							util.toast("Found Pr0: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nYeeting him out of his Vehicle...")
								util.yield(1500)
						end
						menu.trigger_commands("freeze" .. PLAYER.GET_PLAYER_NAME(a))
							util.yield(100)
							menu.trigger_commands("freeze" .. PLAYER.GET_PLAYER_NAME(a))
					lastReaction = util.current_time_millis()
				end
			end

----------------------------------------------------------------
--Loop Handles Stop
----------------------------------------------------------------

		end
	end
end
		util.yield()
end


--This script was created by Heykeyo#2109
