local __luapack_arg__ = arg
package.preload["src.lib.player"] = function(...)
	local Player = {}
	function Player.getWantedLevel(pid)
	    return PLAYER.GET_PLAYER_WANTED_LEVEL(pid)
	end
	function Player.makeWanted(pid, forceLevel)
	    pid = pid or Player.getUserPlayer()
	    local level = forceLevel or (math.tointeger(UND_settings.makeWantedLevel) - 2)
	    if level == -1 then
	        level = Utils.rand(0, 5)
	    end
	    players.set_wanted_level(pid, level)
	end	function Player.placeBounty(pid)
	    pid = pid or Player.getUserPlayer()
	    local pName = Player.getPlayerName(pid, true)
	    local amount = math.tointeger(UND_settings.bountyAmount) - 1
	    if amount == 0 then
	        amount = Utils.rand(1, 10000)
	    else
	        amount = amount * 1000
	    end
	    menu.trigger_commands("bounty" .. pName .. " " .. amount)
	end
	function Player.isPlayerNeverWanted(pid)
	    local menuRef = menu.ref_by_command_name("bail" .. Player.getPlayerName(pid))
	    return players.exists(pid) and menuRef:isValid() and menuRef.value
	end
	function Player.getPlayerName(pid, lowercase, addTags)
	    pid = pid or Player.getUserPlayer()
	    local name
	    if addTags then
	        name = players.get_name_with_tags(pid)
	    else
	        name = players.get_name(pid)
	    end
	    if lowercase then
	        return name:lower()
	    end
	    return name
	end	function Player.isUserAiming()
	    if (UND_aimModeActiveAsAimButton and UND_aimModeActive) or util.is_key_down(0x02) or PAD.IS_CONTROL_PRESSED(25, 25) then
	        return true
	    end
	    return false
	end
	function Player.getPlayerPed(pid)
	    if not pid then
	        return players.user_ped()
	    end
	    return PLAYER.GET_PLAYER_PED(pid)
	end	function Player.getUserPlayer()
	    return players.user()
	end
	function Player.getPlayerPosition(pid)
	    pid = pid or Player.getUserPlayer()
	    return players.get_position(pid)
	end
	function Player.getPlayerRank(pid)
	    pid = pid or Player.getUserPlayer()
	    return players.get_rank(pid)
	end
	function Player.getInterior(pid)
	    pid = pid or Player.getUserPlayer()
	    local pos = Player.getPlayerPosition(pid)
	    local interior = INTERIOR.GET_INTERIOR_FROM_COLLISION(pos.x, pos.y, pos.z)
	    if interior > 0 then
	        for name, val in CONSTANTS.GAME.INTERIOR_IDS do
	            if val == interior then
	                local hasNumber = string.find(name, "%d")
	                if hasNumber then
	                    return name:gsub('%d', '')
	                end
	                return name
	            end
	        end
	    end	    local function checkCoordsFor(name)
	        if name == "kosatka" and checkCoordsFor("kosatkaMissile") then
	            return "kosatkaMissile"
	        end
	        local coords = CONSTANTS.GAME.INTERIOR_COORDS[name]
	        if pos.x >= coords[1] and pos.x <= coords[2] and pos.y >= coords[3] and pos.y <= coords[4] then
	            if not coords[5] or (pos.z >= coords[5] and pos.z <= coords[6]) then
	                local hasNumber = string.find(name, "%d")
	                if hasNumber then
	                    return name:gsub('%d', '')
	                end
	                return name
	            end
	        end
	    end
	    for name in CONSTANTS.GAME.INTERIOR_COORDS do
	        local interiorName = checkCoordsFor(name)
	        if interiorName then
	            return interiorName
	        end
	    end
	    if players.is_in_interior(pid) then
	        return "interior"
	    end
	    return nil
	end
	function Player.isLoading(pid)
	    if not util.is_session_started() then
	        return false
	    end
	    local pPos = Player.getPlayerPosition(pid)
	    if pPos.x == 0 and pPos.y == 0 and pPos.z == 0 then
	        return true
	    end
	    if ENTITY.GET_ENTITY_SPEED(Player.getPlayerPed(pid)) < 1 then
	        if Player.getPlayerRank(pid) == 0 then
	            return true
	        end
	        if Player.getMoney(pid) == 0 and Player.getKD(pid) == 0 then
	            return true
	        end
	    end
	    if NETWORK.IS_PLAYER_IN_CUTSCENE(pid) then
	        return true
	    end
	    return false
	end
	function Player.isModder(pid)
	    pid = pid or Player.getUserPlayer()
	    return players.is_marked_as_modder(pid)
	end
	function Player.isModderOrAdmin(pid)
	    pid = pid or Player.getUserPlayer()
	    return players.is_marked_as_modder_or_admin(pid)
	end
	function Player.isAdmin(pid)
	    pid = pid or Player.getUserPlayer()
	    return players.is_marked_as_admin(pid)
	end
	function Player.isFriend(player)
	    for _, pid in players.list(false, true, false) do
	        if player == pid then
	            return true
	        end
	    end
	    return false
	end
	function Player.isDead(pid)
	    pid = pid or Player.getUserPlayer()
	    return PLAYER.IS_PLAYER_DEAD(pid)
	end
	function Player.isOTR(pid)
	    pid = pid or Player.getUserPlayer()
	    return players.is_otr(pid)
	end	function Player.getMoney(pid, shorten)
	    pid = pid or Player.getUserPlayer()
	    local money = players.get_money(pid)
	    if not shorten then
	        return money
	    end
	    local length = string.len(tostring(money))
	    if length < 4 then
	        return money
	    elseif length < 7 then
	        return string.format("%.2fK", money / 1000)
	    elseif length < 10 then
	        return string.format("%.2fM", money / 1000000)
	    end
	    return string.format("%.2fB", money / 1000000000)
	end
	local r, g, b, a = memory.alloc(1), memory.alloc(1), memory.alloc(1), memory.alloc(1)
	function Player.getOrgColor(pid)
	    pid = pid or Player.getUserPlayer()
	    local orgColorIdx = players.get_org_colour(pid)
	    if orgColorIdx == -1 then
	        return -1
	    end
	    HUD.GET_HUD_COLOUR(orgColorIdx + 192, r, g, b, a)
	    local color = {
	        r = memory.read_ubyte(r) / 255,
	        g = memory.read_ubyte(g) / 255,
	        b = memory.read_ubyte(b) / 255,
	        a = 1
	    }
	    return color
	end
	function Player.getLanguage(pid)
	    pid = pid or Player.getUserPlayer()
	    return CONSTANTS.GAME.LANGUAGES[players.get_language(pid)]
	end
	function Player.getKD(pid)
	    pid = pid or Player.getUserPlayer()
	    return math.floor(players.get_kd(pid) * 100) / 100
	end	function Player.disarm(player)
	    menu.trigger_commands("disarm" .. Player.getPlayerName(player, true))
	end	function Player.kick(player)
	    local pName = Player.getPlayerName(player)
	    menu.trigger_commands("breakup" .. pName:lower())
	end	function Player.crash(player)
	    menu.trigger_commands("crash" .. Player.getPlayerName(player, true))
	end	function Player.heal(player)
	    for i = 1, 3 do
	        players.give_pickup_reward(player, "REWARD_HEALTH")
	        players.give_pickup_reward(player, "REWARD_ARMOUR")
	        util.yield()
	    end
	end
	function Player.freeze(player, enabled)
	    local value = "off"
	    if enabled then
	        value = "on"
	    end
	    menu.trigger_commands("freeze" .. Player.getPlayerName(player, true) .. " " .. value)
	end	function Player.isSpectated(player)
	    local playerName = Player.getPlayerName(player, false, true)
	    local ninjaRef = menu.ref_by_path("Players>" .. playerName .. ">Spectate>Ninja Method")
	    local legitRef = menu.ref_by_path("Players>" .. playerName .. ">Spectate>Legit Method")
	    return menu.get_value(ninjaRef) or menu.get_value(legitRef)
	end
	function Player.tempSpectate(player, stopCondition)
	    if v3.distance(Player.getPlayerPosition(player), Player.getPlayerPosition()) < 200 or Player.isSpectated(player) then
	        return
	    end
	    util.create_thread(function()
	        menu.trigger_commands("spectate" .. Player.getPlayerName(player, true) .. " on")
	        local maxTime = Utils.getTime(1500)
	        if not stopCondition then
	            util.yield(500)
	        end
	        while stopCondition and not stopCondition(player) do
	            if Utils.getTime() > maxTime then
	                break
	            end
	            util.yield()
	        end
	        menu.trigger_commands("spectate" .. Player.getPlayerName(player, true) .. " off")
	        util.stop_thread()
	    end)
	end
	return Player
end
package.loaded["src.lib.player"] = nil
package.preload["src.lib.menus.online.aimInfo"] = function(...)
	local enabled = true
	local xValue, yValue, scaleValue, yMultiplier = 85, 20, 100, 2
	local displayTime = 2
	local color = CONSTANTS.SCRIPT.COLORS.LIST.modder
	local aimingPlayers = {}
	local function renderAimInfo()
	    if #aimingPlayers == 0 then
	        return
	    end
	    for idx, player in aimingPlayers do
	        directx.draw_text(xValue, yValue + idx * yMultiplier * 0.02, player.text, 5, scaleValue, color, true)
	    end
	end
	local function showExamples()
	    for i = 1, 3 do
	        aimingPlayers[#aimingPlayers + 1] = {
	            pid = 123,
	            text = UND_translations.player.player .. i .. " - " .. UND_translations.general.weapon .. i
	        }
	        local showTime = Utils.getTime(displayTime * 1000)
	        util.create_thread(function()
	            while Utils.getTime() <= showTime do
	                util.yield(1000)
	            end
	            table.remove(aimingPlayers, 1)
	            util.stop_thread()
	        end)
	    end
	end
	local function runAimWatcher()
	    if not enabled then
	        return
	    end
	    local myPed = Player.getPlayerPed()
	    for _, pid in players.list(false) do
	        if not PLAYER.IS_PLAYER_FREE_AIMING(pid) and not PLAYER.IS_PLAYER_TARGETTING_ANYTHING(pid) then
	            goto continue
	        end
	        local isAiming = PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(pid, myPed) or PLAYER.IS_PLAYER_TARGETTING_ENTITY(pid, myPed)
	        if isAiming then
	            for _, player in aimingPlayers do
	                if player.pid == pid then
	                    goto continue
	                end
	            end
	            local textToShow = Player.getPlayerName(pid)
	            local weaponName = Ped.getWeapon(Player.getPlayerPed(pid))
	            if not weaponName then
	                weaponName = UND_translations.general.unknownWeapon
	            end
	            textToShow = textToShow .. " - " .. weaponName
	            aimingPlayers[#aimingPlayers + 1] = {
	                pid = pid,
	                text = textToShow
	            }
	            local showTime = Utils.getTime(displayTime * 1000)
	            util.create_thread(function()
	                while Utils.getTime() <= showTime do
	                    util.yield(1000)
	                end
	                table.remove(aimingPlayers, 1)
	                util.stop_thread()
	            end)
	        end
	        ::continue::
	    end
	    util.yield(700)
	end	local function setupAimInfoMenu(sessionMenu)
	    local aimInfoMenu = menu.list(sessionMenu, UND_translations.online.aimInfo, {}, UND_translations.online.aimInfoD)
	    local enabledToggle = menu.toggle(aimInfoMenu, UND_translations.online.showAimInfo, {Utils.getCommandName("playeraim")}, "", function(on)
	        enabled = on
	    end, enabled)
	    enabled = menu.get_value(enabledToggle)
	    local positionSubmenu = menu.list(aimInfoMenu, UND_translations.general.position, {}, UND_translations.general.positionD)
	    local xSlider = menu.slider(positionSubmenu, UND_translations.general.hPos, {Utils.getCommandName("playeraimhpos")}, "", 0, 100, xValue, 1, function(val)
	        xValue = val / 100
	        showExamples()
	    end)
	    xValue = menu.get_value(xSlider) / 100
	    local ySlider = menu.slider(positionSubmenu, UND_translations.general.vPos, {Utils.getCommandName("playeraimvpos")}, "", 0, 100, yValue, 1, function(val)
	        yValue = val / 100
	        showExamples()
	    end)
	    yValue = menu.get_value(ySlider) / 100
	    local scaleSlider = menu.slider(positionSubmenu, UND_translations.general.scale, {Utils.getCommandName("playeraimscale")}, "", 1, 200, scaleValue, 1, function(val)
	        scaleValue = val / 100
	        showExamples()
	    end)
	    scaleValue = menu.get_value(scaleSlider) / 100
	    local spaceYSlider = menu.slider(positionSubmenu, UND_translations.general.vSpace, {Utils.getCommandName("playeraimvspace")}, "", 1, 30, yMultiplier, 1, function(val)
	        yMultiplier = val
	        showExamples()
	    end)
	    yMultiplier = menu.get_value(spaceYSlider)
	    menu.colour(aimInfoMenu, UND_translations.general.color, {Utils.getCommandName("playeraimcolor")}, "", color, true, function(c)
	        color = c
	    end)
	    local displayTimeSlider = menu.slider(aimInfoMenu, UND_translations.online.displayTime, {Utils.getCommandName("playeraimtime")}, UND_translations.online.displayTimeD, 1,
	        5, displayTime, 1, function(val)
	            displayTime = val
	        end)
	    displayTime = menu.get_value(displayTimeSlider)
	    menu.action(aimInfoMenu, UND_translations.online.aimInfoExample, {}, UND_translations.online.aimInfoExampleD, showExamples)
	    util.create_tick_handler(runAimWatcher)
	    util.create_tick_handler(renderAimInfo)
	end
	return setupAimInfoMenu
end
package.loaded["src.lib.menus.online.aimInfo"] = nil
package.preload["src.lib.menus.online.playerKicker.forceHost"] = function(...)
	local inProgress = false
	local function forceHost()
	    if not util.is_session_started() then
	        Utils.showToast(UND_translations.general.onlyOnline)
	        return
	    end
	    if inProgress then
	        Utils.showToast(UND_translations.general.inProgress)
	        return
	    end
	    local myPid = Player.getUserPlayer()
	    local curPos = players.get_host_queue_position(myPid)
	    if curPos == 0 then
	        Utils.showToast(UND_translations.online.forceHostFailHost)
	        return
	    end
	    local friendsHostQueue = players.get_host_queue(false, true, false)
	    if #friendsHostQueue > 0 then
	        for _, pid in friendsHostQueue do
	            if players.get_host_queue_position(pid) < curPos then
	                Utils.showToast(UND_translations.online.forceHostFailFriend)
	                return
	            end
	        end
	    end
	    inProgress = true
	    local hostQueue = players.get_host_queue(false, false, true)
	    for idx, pid in hostQueue do
	        if idx <= curPos then
	            Player.kick(pid)
	            util.yield(100)
	        end
	    end
	    util.create_tick_handler(function()
	        if players.get_host_queue_position(myPid) == 0 then
	            inProgress = false
	            Utils.showToast(UND_translations.online.forceHostSuccess)
	            return false
	        end
	        util.yield(500)
	    end)
	end	local function setupForceHostMenu(kickerMenu)
	    menu.divider(kickerMenu, UND_translations.online.forceHost .. " ")
	    local curPostRef = menu.readonly(kickerMenu, UND_translations.online.currentHostQueuePos, players.get_host_queue_position(Player.getUserPlayer()))
	    menu.on_tick_in_viewport(curPostRef, function()
	        menu.set_value(curPostRef, players.get_host_queue_position(Player.getUserPlayer()))
	        util.yield(1000)
	    end)
	    menu.action(kickerMenu, UND_translations.online.forceHost, {Utils.getCommandName("forcehost")}, UND_translations.online.forceHostD, forceHost)
	end
	return setupForceHostMenu
end
package.loaded["src.lib.menus.online.playerKicker.forceHost"] = nil
package.preload["src.lib.menus.online.playerKicker"] = function(...)
	local setupForceHostMenu = require "src.lib.menus.online.playerKicker.forceHost"
	local auto, modder, modderAdmin, admin, kickLevel, kickKD, kickMoney = false, false, false, false, false, false, false
	local levelAbove, kdAbove, moneyAbove = 5000, 5, 100
	local toggledLanguages = {}	local function kickPlayers(autoKick)
	    if not util.is_session_started() then
	        if not autoKick then
	            Utils.showToast(UND_translations.general.onlyOnline)
	        end
	        return
	    end
	    for _, pid in players.list(false, false) do
	        if not Player.isLoading(pid) and
	            ((modder and Player.isModder(pid)) or (modderAdmin and Player.isModderOrAdmin(pid)) or (admin and Player.isAdmin(pid)) or
	                (kickLevel and Player.getPlayerRank(pid) > levelAbove) or (kickKD and Player.getKD(pid) > kdAbove) or (kickMoney and Player.getMoney(pid) > moneyAbove * 1000000) or
	                toggledLanguages[Player.getLanguage(pid)]) then
	            Player.kick(pid, true)
	            util.yield(100)
	        end
	    end
	end
	local function playerWatcher()
	    if not auto then
	        return
	    end
	    kickPlayers(true)
	    util.yield(5000)
	end	local function setupPlayerKickerMenu(sessionMenu)
	    local kickerMenu = menu.list(sessionMenu, UND_translations.online.playerKicker, {}, UND_translations.online.playerKickerD)
	    menu.action(kickerMenu, UND_translations.general.kick, {Utils.getCommandName("playerkickerkick")}, "", function()
	        kickPlayers(false)
	    end)
	    local autoToggle = menu.toggle(kickerMenu, UND_translations.online.autoKick, {Utils.getCommandName("playerkickerauto")}, "", function(on)
	        auto = on
	    end, auto)
	    auto = menu.get_value(autoToggle)
	    menu.divider(kickerMenu, UND_translations.online.kickFactors)
	    local langsList = menu.list(kickerMenu, UND_translations.online.languages, {Utils.getCommandName("playerkickerlangs")}, UND_translations.online.languagesD)
	    for _, langName in CONSTANTS.GAME.LANGUAGES do
	        toggledLanguages[langName] = false
	        local langToggle = menu.toggle(langsList, langName, {Utils.getCommandName("playerkickerlang" .. langName:lower())}, "", function(on)
	            toggledLanguages[langName] = on
	        end)
	        toggledLanguages[langName] = menu.get_value(langToggle)
	    end
	    local modderToggle = menu.toggle(kickerMenu, UND_translations.general.modder, {Utils.getCommandName("playerkickermodder")}, "", function(on)
	        modder = on
	    end)
	    modder = menu.get_value(modderToggle)
	    local modderAdminToggle = menu.toggle(kickerMenu, UND_translations.general.modderAdmin, {Utils.getCommandName("playerkickermodderadmin")}, "", function(on)
	        modderAdmin = on
	    end)
	    modderAdmin = menu.get_value(modderAdminToggle)
	    local adminToggle = menu.toggle(kickerMenu, UND_translations.general.admin, {Utils.getCommandName("playerkickeradmin")}, "", function(on)
	        admin = on
	    end)
	    admin = menu.get_value(adminToggle)
	    local levelSlider = menu.slider(kickerMenu, UND_translations.online.kickLevelAbove, {Utils.getCommandName("playerkickerlevelabove")}, "", 50, 7950, levelAbove, 50,
	        function(val)
	            levelAbove = val
	        end)
	    levelAbove = menu.get_value(levelSlider)
	    local levelToggle = menu.toggle(kickerMenu, UND_translations.online.kickLevel, {Utils.getCommandName("playerkickerlevel")}, "", function(on)
	        kickLevel = on
	    end)
	    kickLevel = menu.get_value(levelToggle)
	    local kdSlider = menu.slider(kickerMenu, UND_translations.online.kickKDAbove, {Utils.getCommandName("playerkickerkdabove")}, "", 1, 15, kdAbove, 1, function(val)
	        kdAbove = val
	    end)
	    kdAbove = menu.get_value(kdSlider)
	    local kdToggle = menu.toggle(kickerMenu, UND_translations.online.kickKD, {Utils.getCommandName("playerkickerkd")}, "", function(on)
	        kickKD = on
	    end)
	    kickKD = menu.get_value(kdToggle)
	    local moneySlider = menu.slider(kickerMenu, UND_translations.online.kickMoneyAbove, {Utils.getCommandName("playerkickermoneyabove")}, "", 5, 200, moneyAbove, 5,
	        function(val)
	            moneyAbove = val
	        end)
	    moneyAbove = menu.get_value(moneySlider)
	    local moneyToggle = menu.toggle(kickerMenu, UND_translations.online.kickMoney, {Utils.getCommandName("playerkickermoney")}, "", function(on)
	        kickMoney = on
	    end)
	    kickMoney = menu.get_value(moneyToggle)
	    setupForceHostMenu(kickerMenu)
	    util.create_tick_handler(playerWatcher)
	end
	return setupPlayerKickerMenu
end
package.loaded["src.lib.menus.online.playerKicker"] = nil
package.preload["src.lib.menus.online"] = function(...)
	local setupPlayersListMenu = require "src.lib.menus.online.playersList"
	local setupESPMenu = require "src.lib.menus.online.esp"
	local setupAimInfoMenu = require "src.lib.menus.online.aimInfo"
	local setupKillersListMenu = require "src.lib.menus.online.killersList"
	local setupPlayerKickerMenu = require "src.lib.menus.online.playerKicker"
	local setupAllPlayersMenu = require "src.lib.menus.online.allPlayers"
	local function setupSessionMenu()
	    local sessionMenu = menu.list(menu.my_root(), UND_translations.online.name, {}, "")
	    menu.divider(sessionMenu, UND_translations.player.players)
	    setupAllPlayersMenu(sessionMenu)
	    menu.toggle_loop(sessionMenu, UND_translations.online.forceVisible, {Utils.getCommandName("forcevisible")}, UND_translations.online.forceVisibleD, function()
	        for _, pid in players.list(false) do
	            local ped = Player.getPlayerPed(pid)
	            if not ENTITY.IS_ENTITY_VISIBLE(ped) then
	                ENTITY.SET_ENTITY_VISIBLE(ped, true)
	            end
	        end
	    end)
	    menu.divider(sessionMenu, UND_translations.general.others)
	    setupPlayersListMenu(sessionMenu)
	    setupPlayerKickerMenu(sessionMenu)
	    setupAimInfoMenu(sessionMenu)
	    setupKillersListMenu(sessionMenu)
	    setupESPMenu(sessionMenu)
	    menu.action_slider(sessionMenu, UND_translations.online.rChat, {Utils.getCommandName("rchat")}, "", {UND_translations.online.rVerified, "Rockstar"}, function(idx)
	        local icon = "¦"
	        if idx == 2 then
	            icon = "∑"
	        end
	        chat.ensure_open_with_empty_draft(false)
	        chat.add_to_draft(icon .. " ")
	    end)
	end
	return setupSessionMenu
end
package.loaded["src.lib.menus.online"] = nil
package.preload["src.lib.ped"] = function(...)
	local Ped = {}
	local invRef = menu.ref_by_path("Self>Appearance>Invisibility")	function Ped.kickFromVehicle(ped)
	    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
	    TASK.TASK_LEAVE_ANY_VEHICLE(ped, 0, 16)
	end	function Ped.ragdoll(ped)
	    local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	    FIRE.ADD_EXPLOSION(pedCoords.x, pedCoords.y, pedCoords.z - 1, 70, 0.1, false, true, 0.0, true)
	end	function Ped.burn(ped)
	    FIRE.START_ENTITY_FIRE(ped)
	    local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	    FIRE.ADD_EXPLOSION(pedCoords.x, pedCoords.y, pedCoords.z - 1, 12, 3.0, true, true, 1.0, false)
	    util.yield(5000)
	    FIRE.STOP_ENTITY_FIRE(ped)
	end	function Ped.explode(ped, random, ownedAs)
	    local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	    local expType = 1
	    if random then
	        expType = Utils.rand(0, 84)
	    end
	    if UND_settings.explodeType == UND_translations.general.owned then
	        FIRE.ADD_OWNED_EXPLOSION(ownedAs or Player.getPlayerPed(), pedCoords.x, pedCoords.y, pedCoords.z, expType, 100, true, false, 0.0)
	    else
	        FIRE.ADD_EXPLOSION(pedCoords.x, pedCoords.y, pedCoords.z, expType, 100, true, false, 0.0, false)
	    end
	end
	function Ped.clone(ped)
	    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped)
	    local newPed = PED.CLONE_PED(ped, true, false, true)
	    if UND_settings.clonedPedTask == UND_translations.general.walk then
	        TASK.TASK_WANDER_STANDARD(newPed, 10.0, 10)
	    elseif UND_settings.clonedPedTask == UND_translations.general.attack then
	        TASK.TASK_COMBAT_PED(newPed, ped, 0, 16)
	    elseif UND_settings.clonedPedTask == UND_translations.general.flee then
	        TASK.TASK_REACT_AND_FLEE_PED(newPed, ped)
	    end
	    return newPed
	end
	function Ped.getHealth(ped)
	    local hp = ENTITY.GET_ENTITY_HEALTH(ped)
	    local maxHp = PED.GET_PED_MAX_HEALTH(ped)
	    local armor = PED.GET_PED_ARMOUR(ped)
	    local total = hp
	    if maxHp == 0 then
	        total = 0
	    elseif armor > 0 then
	        total = math.floor((total + armor) / (maxHp + 50) * 100)
	    else
	        total = math.floor(total / maxHp * 100)
	    end
	    return {
	        health = hp,
	        armor = armor,
	        maxHealth = maxHp,
	        total = total .. "%"
	    }
	end	function Ped.disarm(ped)
	    WEAPON.REMOVE_ALL_PED_WEAPONS(ped, false)
	end
	function Ped.freeze(ped, enabled)
	    ENTITY.FREEZE_ENTITY_POSITION(ped, enabled)
	end	function Ped.revive(ped)
	    local newPed = Ped.clone(ped)
	    Utils.deleteEntity(ped)
	    ENTITY.SET_ENTITY_HEALTH(newPed, 100)
	    TASK.TASK_WANDER_STANDARD(newPed, 10.0, 10)
	end
	function Ped.toggleGod(ped, enabled)
	    ENTITY.SET_ENTITY_INVINCIBLE(ped, enabled)
	end
	function Ped.shoot(ped, forceAnonymous)
	    util.create_thread(function()
	        local curInvValue = invRef.value
	        local weaponHash = Utils.requestWeaponAsset("WEAPON_HEAVYSNIPER")
	        local killerPed
	        if forceAnonymous or UND_settings.shootType ~= UND_translations.general.owned then
	            if PED.IS_PED_A_PLAYER(ped) then
	                local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	                killerPed = entities.create_ped(0, ENTITY.GET_ENTITY_MODEL(ped), pedCoords, 0)	                ENTITY.SET_ENTITY_VISIBLE(killerPed, false)
	                util.yield(150)
	            else
	                killerPed = 0
	            end
	        else
	            killerPed = Player.getPlayerPed()
	            if curInvValue > 0 then
	                invRef.value = 0
	                util.yield(350)
	            end
	        end
	        for i = 1, 8 do
	            local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pedCoords.x, pedCoords.y, pedCoords.z + 1, pedCoords.x, pedCoords.y, pedCoords.z, 1000, false, weaponHash, killerPed, true,
	                false, 1000)
	            util.yield()
	        end
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(weaponHash)
	        if UND_settings.shootType ~= UND_translations.general.owned then
	            Utils.deleteEntity(killerPed)
	        end
	        invRef.value = curInvValue
	        util.stop_thread()
	    end)
	end
	function Ped.getClosestPedToCoords(coords)
	    local maxDistance = 3
	    local closestPed
	    local myPed = Player.getPlayerPed()
	    for _, ped in entities.get_all_peds_as_handles() do
	        if ped ~= myPed and not PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
	            local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	            local distance = v3.distance(coords, pedCoords)
	            if distance < maxDistance then
	                maxDistance = distance
	                closestPed = ped
	            end
	        end
	    end
	    return closestPed
	end	function Ped.toggleInvisible(ped)
	    local isVisible = ENTITY.IS_ENTITY_VISIBLE(ped)
	    ENTITY.SET_ENTITY_VISIBLE(ped, not isVisible, 0)
	end	function Ped.atomize(ped)
	    local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	    local weaponHash = Utils.requestWeaponAsset("WEAPON_RAYPISTOL")
	    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pedCoords.x, pedCoords.y, pedCoords.z + 1, pedCoords.x, pedCoords.y, pedCoords.z, 1000, false, weaponHash, 0, true, false, 1000)
	    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(weaponHash)
	end	function Ped.fireworks(ped)
	    local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	    local weaponHash = Utils.requestWeaponAsset("WEAPON_FIREWORK")
	    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pedCoords.x, pedCoords.y, pedCoords.z + 3, pedCoords.x + Utils.rand(-5, 5), pedCoords.y + Utils.rand(-5, 5), pedCoords.z + 10, 0, false,
	        weaponHash, 0, true, false, 1000)
	    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(weaponHash)
	end	function Ped.airstrike(ped)
	    local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	    local weaponHash = Utils.requestWeaponAsset("VEHICLE_WEAPON_PLANE_ROCKET")
	    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pedCoords.x + Utils.rand(-5, 5), pedCoords.y + Utils.rand(-5, 5), pedCoords.z + 50, pedCoords.x, pedCoords.y, pedCoords.z, 0, false,
	        weaponHash, 0, true, false, 2000)
	    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(weaponHash)
	end	function Ped.waterJet(ped)
	    local coords = ENTITY.GET_ENTITY_COORDS(ped)
	    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z - 2.0, 13, 1, true, false, 0, false)
	end	function Ped.flameJet(ped)
	    local coords = ENTITY.GET_ENTITY_COORDS(ped)
	    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z - 2.0, 12, 1, true, false, 0, false)
	end
	function Ped.getVehicle(ped)
	    return PED.IS_PED_SITTING_IN_ANY_VEHICLE(ped) and PED.GET_VEHICLE_PED_IS_IN(ped, false)
	end
	local weapons = util.get_weapons()
	local weaponHash = memory.alloc_int()
	function Ped.getWeapon(ped)
	    WEAPON.GET_CURRENT_PED_WEAPON(ped, weaponHash, true)
	    local readWeaponHash = memory.read_int(weaponHash)
	    local weaponName
	    for _, wep in weapons do
	        if wep.hash == readWeaponHash then
	            weaponName = util.get_label_text(wep.label_key)
	            break
	        end
	    end
	    return weaponName
	end	function Ped.cage(ped, type, cageObjects, invisible)
	    cageObjects = cageObjects or {}
	    local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped)
	    if type == UND_translations.general.small then
	        local objHash = util.joaat("prop_gold_cont_01")
	        util.request_model(objHash)
	        local obj = entities.create_object(objHash, pedCoords)
	        ENTITY.SET_ENTITY_VISIBLE(obj, not invisible)
	        ENTITY.FREEZE_ENTITY_POSITION(obj, true)
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(objHash)
	        cageObjects[#cageObjects + 1] = obj
	        return
	    end
	    if type == UND_translations.general.fence then
	        local objHash = util.joaat("prop_fnclink_03e")
	        util.request_model(objHash)
	        pedCoords.z = pedCoords.z - 1.0
	        local object = {}
	        object[1] = entities.create_object(objHash, v3.new(pedCoords.x - 1.5, pedCoords.y + 1.5, pedCoords.z))
	        object[2] = entities.create_object(objHash, v3.new(pedCoords.x - 1.5, pedCoords.y - 1.5, pedCoords.z))
	        object[3] = entities.create_object(objHash, v3.new(pedCoords.x + 1.5, pedCoords.y + 1.5, pedCoords.z))
	        local rot_3 = ENTITY.GET_ENTITY_ROTATION(object[3], 2)
	        rot_3.z = -90.0
	        ENTITY.SET_ENTITY_ROTATION(object[3], rot_3.x, rot_3.y, rot_3.z, 1, true)
	        object[4] = entities.create_object(objHash, v3.new(pedCoords.x - 1.5, pedCoords.y + 1.5, pedCoords.z))
	        local rot_4 = ENTITY.GET_ENTITY_ROTATION(object[4], 2)
	        rot_4.z = -90.0
	        ENTITY.SET_ENTITY_ROTATION(object[4], rot_4.x, rot_4.y, rot_4.z, 1, true)
	        for i = 1, 4 do
	            ENTITY.FREEZE_ENTITY_POSITION(object[i], true)
	            ENTITY.SET_ENTITY_VISIBLE(object[i], not invisible)
	            cageObjects[#cageObjects + 1] = object[i]
	        end
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(objHash)
	        return
	    end
	    if type == UND_translations.general.hell then
	        local objHash = util.joaat("hei_prop_station_gate")
	        util.request_model(objHash)
	        pedCoords.z = pedCoords.z - 1.0
	        local object = {}
	        object[1] = entities.create_object(objHash, v3.new(pedCoords.x + 2.75, pedCoords.y + 2.75, pedCoords.z))
	        object[2] = entities.create_object(objHash, v3.new(pedCoords.x + 2.75, pedCoords.y + 2.75, pedCoords.z + 2))
	        object[3] = entities.create_object(objHash, v3.new(pedCoords.x + 2.75, pedCoords.y - 2.75, pedCoords.z))
	        object[4] = entities.create_object(objHash, v3.new(pedCoords.x + 2.75, pedCoords.y - 2.75, pedCoords.z + 2))
	        object[5] = entities.create_object(objHash, v3.new(pedCoords.x + 2.75, pedCoords.y - 2.75, pedCoords.z))
	        object[6] = entities.create_object(objHash, v3.new(pedCoords.x + 2.75, pedCoords.y - 2.75, pedCoords.z + 2))
	        local rot5 = ENTITY.GET_ENTITY_ROTATION(object[5], 2)
	        rot5.z = -90.0
	        ENTITY.SET_ENTITY_ROTATION(object[5], rot5.x, rot5.y, rot5.z, 2, true)
	        ENTITY.SET_ENTITY_ROTATION(object[6], rot5.x, rot5.y, rot5.z, 2, true)
	        object[7] = entities.create_object(objHash, v3.new(pedCoords.x - 2.75, pedCoords.y - 2.75, pedCoords.z))
	        object[8] = entities.create_object(objHash, v3.new(pedCoords.x - 2.75, pedCoords.y - 2.75, pedCoords.z + 2))
	        local rot7 = ENTITY.GET_ENTITY_ROTATION(object[7], 2)
	        rot7.z = -90.0
	        ENTITY.SET_ENTITY_ROTATION(object[7], rot7.x, rot7.y, rot7.z, 2, true)
	        ENTITY.SET_ENTITY_ROTATION(object[8], rot7.x, rot7.y, rot7.z, 2, true)
	        object[9] = entities.create_object(objHash, v3.new(pedCoords.x, pedCoords.y + 2.75, pedCoords.z + 5))
	        local rot9 = ENTITY.GET_ENTITY_ROTATION(object[9], 2)
	        rot9.x = 90
	        rot9.y = 90
	        ENTITY.SET_ENTITY_ROTATION(object[9], rot9.x, rot9.y, rot9.z, 2, true)
	        object[10] = entities.create_object(objHash, v3.new(pedCoords.x, pedCoords.y + 2.75, pedCoords.z + 5))
	        local rot10 = ENTITY.GET_ENTITY_ROTATION(object[9], 2)
	        rot10.x = -90
	        rot10.y = -90
	        ENTITY.SET_ENTITY_ROTATION(object[10], rot10.x, rot10.y, rot10.z, 2, true)
	        object[11] = entities.create_object(objHash, v3.new(pedCoords.x, pedCoords.y + 2.75, pedCoords.z))
	        ENTITY.SET_ENTITY_ROTATION(object[11], rot9.x, rot9.y, rot9.z, 2, true)
	        object[12] = entities.create_object(objHash, v3.new(pedCoords.x, pedCoords.y + 2.75, pedCoords.z))
	        ENTITY.SET_ENTITY_ROTATION(object[12], rot10.x, rot10.y, rot10.z, 2, true)
	        for i = 1, 12 do
	            ENTITY.FREEZE_ENTITY_POSITION(object[i], true)
	            ENTITY.SET_ENTITY_VISIBLE(object[i], not invisible)
	            cageObjects[#cageObjects + 1] = object[i]
	        end
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(objHash)
	        return
	    end
	    if type == UND_translations.general.animal then
	        local objHash = -759902142
	        util.request_model(objHash)
	        pedCoords.z = pedCoords.z - 1.0
	        local object = {}
	        object[1] = entities.create_object(objHash, v3.new(pedCoords.x - 1.5, pedCoords.y + 1.5, pedCoords.z))
	        object[2] = entities.create_object(objHash, v3.new(pedCoords.x - 4.3, pedCoords.y + 1.5, pedCoords.z))
	        object[3] = entities.create_object(objHash, v3.new(pedCoords.x - 1.5, pedCoords.y - 4.3, pedCoords.z))
	        object[4] = entities.create_object(objHash, v3.new(pedCoords.x - 4.3, pedCoords.y - 4.3, pedCoords.z))
	        object[5] = entities.create_object(objHash, v3.new(pedCoords.x + 1.4, pedCoords.y + 1.5, pedCoords.z))
	        object[6] = entities.create_object(objHash, v3.new(pedCoords.x + 1.4, pedCoords.y - 1.4, pedCoords.z))
	        local rot_5 = ENTITY.GET_ENTITY_ROTATION(object[5], 2)
	        rot_5.z = -90.0
	        ENTITY.SET_ENTITY_ROTATION(object[5], rot_5.x, rot_5.y, rot_5.z, 1, true)
	        ENTITY.SET_ENTITY_ROTATION(object[6], rot_5.x, rot_5.y, rot_5.z, 1, true)
	        object[7] = entities.create_object(objHash, v3.new(pedCoords.x - 4.2, pedCoords.y + 1.5, pedCoords.z))
	        object[8] = entities.create_object(objHash, v3.new(pedCoords.x - 4.2, pedCoords.y - 1.4, pedCoords.z))
	        local rot_7 = ENTITY.GET_ENTITY_ROTATION(object[7], 2)
	        rot_7.z = -90.0
	        ENTITY.SET_ENTITY_ROTATION(object[7], rot_7.x, rot_7.y, rot_7.z, 1, true)
	        ENTITY.SET_ENTITY_ROTATION(object[8], rot_7.x, rot_7.y, rot_7.z, 1, true)
	        for i = 1, 8 do
	            ENTITY.FREEZE_ENTITY_POSITION(object[i], true)
	            ENTITY.SET_ENTITY_VISIBLE(object[i], not invisible)
	            cageObjects[#cageObjects + 1] = object[i]
	        end
	        local animalHash = util.joaat("A_C_Panther")
	        util.request_model(animalHash)
	        for i = 1, 4 do
	            local animal = entities.create_ped(0, animalHash, pedCoords, 0)
	            cageObjects[#cageObjects + 1] = animal
	            ENTITY.SET_ENTITY_INVINCIBLE(animal, true)
	            TASK.TASK_COMBAT_PED(animal, ped, 0, 16)
	        end
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(objHash)
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(animalHash)
	        return
	    end
	    if type == UND_translations.general.electric then
	        local objHash = util.joaat("prop_elecbox_12")
	        util.request_model(objHash)
	        pedCoords.z = pedCoords.z - 1.0
	        local tempV3 = v3.new(0, 0, 0)
	        for i = 1, 6 do
	            local angle = i / 6 * 360
	            tempV3.z = angle
	            local objPos = tempV3:toDir()
	            objPos:mul(2.5)
	            objPos:add(pedCoords)
	            for j = 1, 5 do
	                local cageObj = entities.create_object(objHash, objPos)
	                ENTITY.SET_ENTITY_ROTATION(cageObj, 90.0, 0.0, angle, 2, 0)
	                objPos.z = objPos.z + 0.75
	                ENTITY.FREEZE_ENTITY_POSITION(cageObj, true)
	                ENTITY.SET_ENTITY_VISIBLE(cageObj, not invisible)
	                cageObjects[#cageObjects + 1] = cageObj
	            end
	        end
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(objHash)
	        return
	    end
	end
	return Ped
end
package.loaded["src.lib.ped"] = nil
package.preload["src.lib.menus.player.malicious"] = function(...)
	local function setupPlayerMaliciousMenu(maliciousSubmenu, pid)
	    menu.action(maliciousSubmenu, UND_translations.general.shoot, {Utils.getCommandName("shoot")}, "", function()
	        if Player.isDead(pid) then
	            return
	        end
	        Player.tempSpectate(pid, Player.isDead)
	        Ped.shoot(Player.getPlayerPed(pid))
	        util.yield(800)
	        if Player.isDead(pid) then
	            Utils.showToast(UND_translations.general.killed)
	        else
	            Utils.showToast(UND_translations.general.cannotKill)
	        end
	    end)
	    local killPassiveRel = menu.action(maliciousSubmenu, UND_translations.player.killPassive, {Utils.getCommandName("killpassive")}, "", function()
	        if Player.isDead(pid) then
	            return
	        end
	        Player.tempSpectate(pid, Player.isDead)
	        Player.freeze(pid, true)
	        util.yield()
	        Ped.shoot(Player.getPlayerPed(pid), true)
	        util.yield(800)
	        Player.freeze(pid, false)
	        util.yield(500)
	        if Player.isDead(pid) then
	            Utils.showToast(UND_translations.general.killed)
	        else
	            Utils.showToast(UND_translations.general.cannotKill)
	        end
	    end)
	    menu.action(maliciousSubmenu, UND_translations.player.killInterior, {Utils.getCommandName("killinterior")}, "", function()
	        if Player.isDead(pid) then
	            return
	        end
	        if not players.is_in_interior(pid) then
	            Utils.showToast(Player.getPlayerName(pid) .. " " .. UND_translations.player.notInInterior)
	            return
	        end
	        local ped = Player.getPlayerPed(pid)
	        local weaponHash = Utils.requestWeaponAsset("weapon_stungun")
	        for i = 1, 10 do
	            local pedCoords = ENTITY.GET_ENTITY_COORDS(ped)
	            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pedCoords.x, pedCoords.y, pedCoords.z + 1, pedCoords.x, pedCoords.y, pedCoords.z, 1000, false, weaponHash,
	                Player.getPlayerPed(), false, true, 1000)
	            util.yield()
	        end
	        util.yield(1000)
	        if not Player.isDead(pid) then
	            menu.trigger_command(killPassiveRel)
	        else
	            Utils.showToast(UND_translations.general.killed)
	        end
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(weaponHash)
	    end)
	    menu.toggle_loop(maliciousSubmenu, UND_translations.player.flameJet, {Utils.getCommandName("flamejet")}, "", function()
	        Ped.flameJet(Player.getPlayerPed(pid))
	        util.yield(25)
	    end)
	    menu.toggle_loop(maliciousSubmenu, UND_translations.general.explode, {Utils.getCommandName("explode")}, "", function()
	        Ped.explode(Player.getPlayerPed(pid))
	        util.yield(10)
	    end)
	    menu.toggle_loop(maliciousSubmenu, UND_translations.general.randomExplosion, {Utils.getCommandName("randomexplosion")}, "", function()
	        Ped.explode(Player.getPlayerPed(pid), true)
	        util.yield(100)
	    end)
	    menu.toggle_loop(maliciousSubmenu, UND_translations.general.atomize, {Utils.getCommandName("atomize")}, "", function()
	        Ped.atomize(Player.getPlayerPed(pid))
	        util.yield(100)
	    end)
	    menu.toggle_loop(maliciousSubmenu, UND_translations.general.ram, {Utils.getCommandName("ram")}, "", function()
	        if not Player.isDead(pid) then
	            Entity.ram(Player.getPlayerPed(pid))
	        end
	        util.yield(300)
	    end)
	    menu.action(maliciousSubmenu, UND_translations.player.dumpAll, {Utils.getCommandName("dumpall")}, UND_translations.player.dumpAllD, function()
	        for _, vehicle in entities.get_all_vehicles_as_handles() do
	            local vehData = Vehicle.getTargetVehicleData(vehicle)
	            if vehData.player == -1 then
	                local coords = Player.getPlayerPosition(pid)
	                ENTITY.SET_ENTITY_COORDS(vehicle, coords.x, coords.y, coords.z, 0, 0, 0, 0)
	            end
	        end
	        for _, ped in entities.get_all_peds_as_handles() do
	            if not PED.IS_PED_A_PLAYER(ped) then
	                local coords = Player.getPlayerPosition(pid)
	                ENTITY.SET_ENTITY_COORDS(ped, coords.x, coords.y, coords.z, 0, 0, 0, 0)
	            end
	        end
	        for _, obj in entities.get_all_objects_as_handles() do
	            local coords = Player.getPlayerPosition(pid)
	            ENTITY.SET_ENTITY_COORDS(obj, coords.x, coords.y, coords.z, 0, 0, 0, 0)
	        end
	    end)
	    menu.action(maliciousSubmenu, UND_translations.player.carCrash, {Utils.getCommandName("carcrash")}, UND_translations.player.carCrashD, function()
	        local pCoords = Player.getPlayerPosition(pid)
	        local trafficLights = {}
	        util.request_model(-655644382)
	        for i = 1, 20 do
	            local object = entities.create_object(-655644382, v3.new(pCoords.x + Utils.rand(-5, 5), pCoords.y + Utils.rand(-5, 5), pCoords.z + Utils.rand(-1, 0)))
	            ENTITY.SET_ENTITY_ROTATION(object, 0, 0, Utils.rand(0, 360), 1, true)
	            trafficLights[#trafficLights + 1] = object
	        end
	        local stopLights = false
	        util.create_tick_handler(function()
	            if stopLights then
	                return false
	            end
	            ENTITY.SET_ENTITY_TRAFFICLIGHT_OVERRIDE(trafficLights[Utils.rand(1, #trafficLights)], Utils.rand(0, 3))
	        end)
	        util.request_model(3253274834)
	        local vehicles = {}
	        local crashVehicle = entities.create_vehicle(3253274834, pCoords, 0)
	        vehicles[#vehicles + 1] = crashVehicle
	        VEHICLE.SET_VEHICLE_MOD_KIT(crashVehicle, 0)
	        Vehicle.setVehiclePlate(crashVehicle, "ICRASHU")
	        VEHICLE.SET_VEHICLE_MOD(crashVehicle, 34, 3)
	        for i = 1, 10 do
	            vehicles[#vehicles + 1] = Vehicle.clone(crashVehicle)
	        end
	        util.yield(3000)
	        for i = 1, #vehicles do
	            Utils.deleteEntity(vehicles[i])
	        end
	        util.yield(5000)
	        stopLights = true
	        util.yield(500)
	        for i = 1, #trafficLights do
	            Utils.deleteEntity(trafficLights[i])
	        end
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(3253274834)
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(-655644382)
	    end)
	end
	return setupPlayerMaliciousMenu
end
package.loaded["src.lib.menus.player.malicious"] = nil
package.preload["src.lib.menus.self"] = function(...)
	local function setupSelfMenu()
	    local selfMenu = menu.list(menu.my_root(), UND_translations.self.name, {}, "")
	    if UND_privateMode then
	        local setupPrivateMenu = require(("lib.undefined.menus.self.private"))
	        setupPrivateMenu(selfMenu)
	    end
	    menu.action(selfMenu, UND_translations.self.randomOutfit, {Utils.getCommandName("randomoutfit")}, UND_translations.self.randomOutfitD, function()
	        local randPlayer = Utils.getRandomPlayer()
	        if randPlayer ~= -1 then
	            menu.trigger_commands("copyoutfit" .. Player.getPlayerName(randPlayer, true))
	        end
	    end)
	    local instaRespToggle = menu.toggle_loop(selfMenu, UND_translations.self.instantRespawn, {Utils.getCommandName("instantrespawn")}, "", function()
	        UND_instantRespawnEnabled = true
	        local gwobaw = memory.script_global(2672505 + 1685 + 756)
	        if Player.isDead(Player.getUserPlayer()) then
	            menu.trigger_commands("refillhealth")
	            menu.trigger_commands("refillarmour")
	            memory.write_int(gwobaw, memory.read_int(gwobaw) | 1 << 1)
	            util.yield()
	            TASK.CLEAR_PED_TASKS_IMMEDIATELY(Player.getPlayerPed())
	        end
	        util.yield(300)
	    end, function()
	        UND_instantRespawnEnabled = false
	    end)
	    menu.toggle_loop(selfMenu, UND_translations.self.noBounty, {Utils.getCommandName("avoidbounties")}, UND_translations.self.noBountyD, function()
	        if not util.is_session_started() then
	            return
	        end
	        if players.get_bounty(Player.getUserPlayer()) then
	            menu.trigger_commands("removebounty")
	        end
	        util.yield(2000)
	    end)
	    if UND_privateMode then
	        menu.set_value(instaRespToggle, true)
	    end
	end
	return setupSelfMenu
end
package.loaded["src.lib.menus.self"] = nil
package.preload["src.lib.menus.aim.ped"] = function(...)
	local _Raycast = CONSTANTS.RAYCAST
	local function delete()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPlayers)
	        return
	    end
	    Utils.deleteEntity(aimResult.entity)
	end
	local function burn()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if aimResult then
	        Ped.burn(aimResult.entity)
	    end
	end
	local function ram()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if aimResult then
	        Entity.ram(aimResult.entity)
	    end
	end
	local function ragdoll()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if aimResult then
	        Ped.ragdoll(aimResult.entity)
	    end
	end
	local function explode()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if aimResult then
	        Ped.explode(aimResult.entity)
	    end
	end
	local function randomExplode()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if aimResult then
	        Ped.explode(aimResult.entity, true)
	    end
	end
	local function waterJet()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if aimResult then
	        Ped.waterJet(aimResult.entity)
	    end
	end
	local function flameJet()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if aimResult then
	        Ped.flameJet(aimResult.entity)
	    end
	end
	local function clone()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if aimResult then
	        Ped.clone(aimResult.entity)
	    end
	end	local function freeze(enabled)
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if aimResult then
	        if aimResult.player then
	            Player.freeze(aimResult.player, enabled)
	        else
	            Ped.freeze(aimResult.entity, enabled)
	        end
	    end
	end
	local function cage()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    end
	    Ped.cage(aimResult.entity, UND_settings.cageType)
	end
	local function airstrike()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    end
	    Ped.airstrike(aimResult.entity)
	end
	local function heal()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif aimResult.player then
	        Player.heal(aimResult.player)
	        return
	    elseif not ENTITY.IS_ENTITY_DEAD(aimResult.entity) then
	        Utils.showToast(UND_translations.aim.reviveOnlyDead)
	        return
	    end
	    Ped.revive(aimResult.entity)
	end
	local function disarm()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    end
	    if aimResult.player then
	        Player.disarm(aimResult.player)
	    else
	        Ped.disarm(aimResult.entity)
	    end
	end
	local function makeWanted()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif not aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPlayers)
	        return
	    end
	    Player.makeWanted(aimResult.player)
	end
	local function placeBounty()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif not aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPlayers)
	        return
	    end
	    Player.placeBounty(aimResult.player)
	end
	local function shoot()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    end
	    Ped.shoot(aimResult.entity)
	end
	local function atomize()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    end
	    Ped.atomize(aimResult.entity)
	end
	local function firework()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    end
	    Ped.fireworks(aimResult.entity)
	end
	local function kick()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif not aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPlayers)
	        return
	    end
	    Player.kick(aimResult.player)
	end
	local function toggleInvisible()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPeds)
	        return
	    end
	    Ped.toggleInvisible(aimResult.entity)
	end
	local function openStand()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif not aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPlayers)
	        return
	    end
	    menu.trigger_commands("p" .. Player.getPlayerName(aimResult.player, true))
	end
	local function crash()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif not aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPlayers)
	        return
	    end
	    Player.crash(aimResult.player)
	end
	local function copyOutfit()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif not aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPlayers)
	        return
	    end
	    menu.trigger_commands("copyoutfit" .. Player.getPlayerName(aimResult.player, true))
	end	local function toggleGod(enabled)
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif aimResult.player then
	        local val = "off"
	        if not enabled then
	            val = "on"
	        end
	        menu.trigger_commands("confuse" .. Player.getPlayerName(aimResult.player, true) .. " " .. val)
	    else
	        Ped.toggleGod(aimResult.entity, enabled)
	    end
	end
	local function tpToPed()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    end
	    local entityToTeleport = Vehicle.getPlayerOrVehicleEntity()
	    if not entityToTeleport then
	        return
	    end
	    local coords = Utils.rotateToEntity(aimResult.entity)
	    ENTITY.SET_ENTITY_COORDS(entityToTeleport, coords.x, coords.y, coords.z, false, false, false, false)
	end
	local function tpToMe()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    elseif aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPeds)
	        return
	    end
	    local coords = Player.getPlayerPosition()
	    ENTITY.SET_ENTITY_COORDS(aimResult.entity, coords.x, coords.y, coords.z, false, false, false, false)
	end
	local function toggleMark()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    end
	    local idx = Utils.getTableIdx(UND_markedTargets, aimResult.entity)
	    if idx then
	        table.remove(UND_markedTargets, idx)
	    else
	        table.insert(UND_markedTargets, aimResult.entity)
	    end
	end
	local function selectVehicle()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.peds)
	    if not aimResult then
	        return
	    end
	    util.yield()
	    local vehicle = Ped.getVehicle(aimResult.entity)
	    if not vehicle then
	        Utils.showToast(UND_translations.aim.noVehicle)
	        return
	    end
	    local player = Network.getPlayerFromPed(aimResult.entity)
	    if player == -1 then
	        player = nil
	    end
	    UND_aimLockEndTime = Utils.getTime(UND_aimLockTime * 1000)
	    UND_aimLockEntity = {
	        entity = vehicle,
	        vehicle = vehicle,
	        isVehicle = true,
	        player = player
	    }
	end	local function setupPedAimActions(aimPedsSubmenu)
	    menu.action(aimPedsSubmenu, UND_translations.general.delete, {}, "", delete)
	    menu.action(aimPedsSubmenu, UND_translations.general.burn, {}, "", burn)
	    menu.action(aimPedsSubmenu, UND_translations.general.ram, {}, "", ram)
	    menu.action(aimPedsSubmenu, UND_translations.general.ragdoll, {}, "", ragdoll)
	    menu.action(aimPedsSubmenu, UND_translations.general.explode, {}, "", explode)
	    menu.action(aimPedsSubmenu, UND_translations.general.randomExplosion, {}, "", randomExplode)
	    menu.action(aimPedsSubmenu, UND_translations.general.airstrike, {}, "", airstrike)
	    menu.action(aimPedsSubmenu, UND_translations.player.waterJet, {}, "", waterJet)
	    menu.action(aimPedsSubmenu, UND_translations.player.flameJet, {}, "", flameJet)
	    menu.action(aimPedsSubmenu, UND_translations.general.clone, {}, "", clone)
	    menu.action(aimPedsSubmenu, UND_translations.general.cage, {}, "", cage)
	    menu.action(aimPedsSubmenu, UND_translations.aim.disarm, {}, "", disarm)
	    menu.action(aimPedsSubmenu, UND_translations.general.freeze, {}, "", function()
	        freeze(true)
	    end)
	    menu.action(aimPedsSubmenu, UND_translations.general.unfreeze, {}, "", function()
	        freeze(false)
	    end)
	    menu.action(aimPedsSubmenu, UND_translations.general.kick, {}, "", kick)
	    menu.action(aimPedsSubmenu, UND_translations.general.openInStand, {}, "", openStand)
	    menu.action(aimPedsSubmenu, UND_translations.aim.heal, {}, UND_translations.aim.healD, heal)
	    menu.action(aimPedsSubmenu, UND_translations.general.tpToMe, {}, "", tpToMe)
	    menu.action(aimPedsSubmenu, UND_translations.general.tpToIt, {}, "", tpToPed)
	    menu.action(aimPedsSubmenu, UND_translations.general.shoot, {}, "", shoot)
	    menu.action(aimPedsSubmenu, UND_translations.general.crash, {}, "", crash)
	    menu.action(aimPedsSubmenu, UND_translations.general.setGod, {}, UND_translations.general.setGodD, function()
	        toggleGod(true)
	    end)
	    menu.action(aimPedsSubmenu, UND_translations.general.removeGod, {}, UND_translations.general.removeGodD, function()
	        toggleGod(false)
	    end)
	    menu.action(aimPedsSubmenu, UND_translations.general.toggleInv, {}, "", toggleInvisible)
	    menu.action(aimPedsSubmenu, UND_translations.general.toggleMark, {}, UND_translations.general.toggleMarkD, toggleMark)
	    menu.action(aimPedsSubmenu, UND_translations.general.atomize, {}, "", atomize)
	    menu.action(aimPedsSubmenu, UND_translations.general.fireworks, {}, "", firework)
	    menu.action(aimPedsSubmenu, UND_translations.general.copyOutfit, {}, "", copyOutfit)
	    menu.action(aimPedsSubmenu, UND_translations.player.makeWanted, {}, "", makeWanted)
	    menu.action(aimPedsSubmenu, UND_translations.player.placeBounty, {}, "", placeBounty)
	    menu.action(aimPedsSubmenu, UND_translations.aim.selectVehicle, {}, UND_translations.aim.selectVehicleD, selectVehicle)
	end
	return setupPedAimActions
end
package.loaded["src.lib.menus.aim.ped"] = nil
package.preload["src.lib.menus.aim.object"] = function(...)
	local _Raycast = CONSTANTS.RAYCAST
	local function delete()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.objects)
	    if not aimResult then
	        return
	    end
	    Utils.deleteEntity(aimResult.entity)
	end
	local function clone()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.objects)
	    if not aimResult then
	        return
	    end
	    local entity = aimResult.entity
	    local hash = ENTITY.GET_ENTITY_MODEL(entity)
	    local coords = aimResult.coords
	    local rotation = ENTITY.GET_ENTITY_ROTATION(entity, 2)
	    local rot = rotation:toDir()
	    v3.mul(rot, -Utils.getDimensions(entity).x)
	    v3.add(coords, rot)
	    local clonedObject = entities.create_object(hash, coords)
	    ENTITY.SET_ENTITY_ROTATION(clonedObject, rotation.x, rotation.y, rotation.z, 2, true)
	    if UND_privateMode then
	        Utils.logToFile(hash)
	    end
	end
	local function rotate()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.objects)
	    if not aimResult then
	        return
	    end
	    local currentRotation = ENTITY.GET_ENTITY_ROTATION(aimResult.entity, 2)
	    ENTITY.SET_ENTITY_ROTATION(aimResult.entity, currentRotation.x, currentRotation.y, currentRotation.z + 40, 2, true)
	end
	local movedObject = 0
	local function move()
	    if UND_currentlyMovedObject == 2 then
	        return
	    end
	    if movedObject > 0 then
	        local aimResult = Raycast.getPlayerAimData()
	        if not aimResult then
	            return
	        end
	        local coords = aimResult.coords
	        ENTITY.SET_ENTITY_COORDS(movedObject, coords.x, coords.y, coords.z, false, false, false)
	        movedObject = 0
	        util.yield()
	        UND_currentlyMovedObject = 0
	        return
	    end
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.objects)
	    if not aimResult then
	        return
	    end
	    movedObject = aimResult.entity
	    UND_currentlyMovedObject = 1
	    util.create_tick_handler(function()
	        if movedObject == 0 then
	            return false
	        end
	        directx.draw_text(0.5, 0.8, UND_translations.aim.moveTo, 5, 0.6, {
	            r = 1,
	            g = 1,
	            b = 1,
	            a = 1
	        }, false)
	    end)
	end
	local function freeze()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.objects)
	    if not aimResult then
	        return
	    end
	    ENTITY.FREEZE_ENTITY_POSITION(aimResult.entity, true)
	end
	local function unfreeze()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.objects)
	    if not aimResult then
	        return
	    end
	    ENTITY.FREEZE_ENTITY_POSITION(aimResult.entity, false)
	end
	local function toggleInvisible()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.objects)
	    if not aimResult then
	        return
	    end
	    local isVisible = ENTITY.IS_ENTITY_VISIBLE(aimResult.entity)
	    ENTITY.SET_ENTITY_VISIBLE(aimResult.entity, not isVisible, 0)
	end	local function setupObjectAimActions(aimObjectsSubmenu)
	    menu.action(aimObjectsSubmenu, UND_translations.general.delete, {}, "", delete)
	    menu.action(aimObjectsSubmenu, UND_translations.general.clone, {}, "", clone)
	    menu.action(aimObjectsSubmenu, UND_translations.general.rotate, {}, "", rotate)
	    menu.action(aimObjectsSubmenu, UND_translations.aim.move, {}, UND_translations.aim.moveObjD, move)
	    menu.action(aimObjectsSubmenu, UND_translations.general.freeze, {}, "", freeze)
	    menu.action(aimObjectsSubmenu, UND_translations.general.unfreeze, {}, "", unfreeze)
	    menu.action(aimObjectsSubmenu, UND_translations.general.toggleInv, {}, "", toggleInvisible)
	end
	return setupObjectAimActions
end
package.loaded["src.lib.menus.aim.object"] = nil
package.preload["src.lib.menus.online.killersList"] = function(...)
	local killers = {}
	local countsPerKiller = {}
	local killListRef
	local clearOnPayback = false
	local enabled = true
	local isDead = false	local function removeKiller(pid)
	    if countsPerKiller[pid] then
	        menu.set_visible(killers[pid], false)
	        local pName = Player.getPlayerName(pid)
	        menu.set_menu_name(killers[pid], pName .. " - 1")
	        countsPerKiller[pid] = nil
	    end
	end
	local function killerWatcher()
	    if not enabled or not util.is_session_started() then
	        return
	    end
	    if Player.isDead() then
	        local killer = PED.GET_PED_SOURCE_OF_DEATH(Player.getPlayerPed())
	        if ENTITY.IS_ENTITY_A_VEHICLE(killer) then
	            local vehData = Vehicle.getTargetVehicleData(killer)
	            if vehData.player == -1 then
	                return
	            end
	            killer = vehData.driver
	        elseif not PED.IS_PED_A_PLAYER(killer) then
	            return
	        end
	        local pid = Network.getPlayerFromPed(killer)
	        if Player.getUserPlayer() == pid or pid == -1 then
	            return
	        end
	        local pName = Player.getPlayerName(pid)
	        if not isDead then
	            isDead = true
	            countsPerKiller[pid] = (countsPerKiller[pid] or 0) + 1
	            if countsPerKiller[pid] == 1 then
	                menu.set_visible(killers[pid], true)
	            else
	                menu.set_menu_name(killers[pid], pName .. " - " .. countsPerKiller[pid])
	            end
	        end
	    else
	        isDead = false
	    end
	    if not UND_instantRespawnEnabled then
	        util.yield(2000)
	    end
	end	local function payback(idx)
	    if Utils.isTableEmpty(countsPerKiller) then
	        Utils.showToast(UND_translations.general.noPlayer)
	        return
	    end
	    for pid in countsPerKiller do
	        if idx == 1 then
	            Ped.explode(Player.getPlayerPed(pid))
	        elseif idx == 2 then
	            Player.makeWanted(pid)
	        elseif idx == 3 then
	            Player.placeBounty(pid)
	        elseif idx == 4 then
	            Player.kick(pid)
	        elseif idx == 5 then
	            Player.crash(pid)
	        end
	        util.yield(100)
	    end
	    if clearOnPayback then
	        util.yield(1000)
	        for pid in countsPerKiller do
	            if (idx > 1 or Player.isDead(pid)) then
	                removeKiller(pid)
	            end
	        end
	    end
	end	local function setupKillersList(sessionMenu)
	    local killListMenu = menu.list(sessionMenu, UND_translations.online.killersList, {}, UND_translations.online.killersListD)
	    local enabledToggle = menu.toggle(killListMenu, UND_translations.general.enabled, {Utils.getCommandName("killerslist")}, "", function(on)
	        enabled = on
	    end, enabled)
	    enabled = menu.get_value(enabledToggle)
	    killListRef = menu.list(killListMenu, UND_translations.online.killers, {Utils.getCommandName("killers")}, "")
	    local paybackActions = {UND_translations.general.explode, UND_translations.player.makeWanted, UND_translations.player.placeBounty,
	                                   UND_translations.general.kick, UND_translations.general.crash}
	    local clearOnPaybackToggle = menu.toggle(killListMenu, UND_translations.online.clearAfterPayback, {Utils.getCommandName("clearafterpayback")}, "", function(on)
	        clearOnPayback = on
	    end, clearOnPayback)
	    clearOnPayback = menu.get_value(clearOnPaybackToggle)
	    menu.action_slider(killListMenu, UND_translations.online.payback, {Utils.getCommandName("killerspayback")}, UND_translations.online.paybackD, paybackActions, payback)
	    menu.action(killListMenu, UND_translations.general.clearList, {Utils.getCommandName("clearkillers")}, "", function()
	        for pid in killers do
	            removeKiller(pid)
	        end
	    end)	    local function createKillerEntry(pid)
	        local pName = Player.getPlayerName(pid)
	        killers[pid] = menu.action(killListRef, pName .. " - 1", {}, "", function()
	            menu.trigger_commands("p" .. pName:lower())
	        end)
	        menu.set_visible(killers[pid], false)
	    end
	    for _, pid in players.list(false) do
	        createKillerEntry(pid)
	    end
	    players.on_join(function(pid)
	        if killers[pid] then
	            menu.delete(killers[pid])
	        end
	        createKillerEntry(pid)
	    end)
	    players.on_leave(function(pid)
	        removeKiller(pid)
	    end)
	    util.create_tick_handler(killerWatcher)
	end
	return setupKillersList
end
package.loaded["src.lib.menus.online.killersList"] = nil
package.preload["src.lib.translations"] = function(...)
	local arg = __luapack_arg__
	local engTranslations = {
	    main = {
	        checkUpdates = "Check for updates",
	        noUpdates = "No updates found.",
	        update = "Update script",
	        updateSuccess = "Succesfully updated!",
	        updateInProgress = "Update is already in progress, please wait and don't stop the script!",
	        updating = "Updating...",
	        updatingToast = "Updating, be patient...",
	        updated = "Updated.",
	        updateDownloadFail = "Failed to download update. If this happens again, please update the script manually by downloading it from Gitlab.",
	        updateFileFail = "Update canceled. Failed to write to file. If this happens again, please update the script manually by downloading it from Gitlab.",
	        goToGitlab = "Go to script's GitLab page",
	        goToGitlabD = "Open the script's page.",
	        features = "Features",
	        settingsD = "Global settings for various options in the script.",
	        hideTextOnMenu = "Hide text on active menu",
	        hideTextOnMenuD = "This will stop showing any rendered text (except for player aim information) while you are in game pause menu, interaction menu or phone call menu (eg. after calling Lester).",
	        checkChangelog = "Check changelog"
	    },
	    general = {
	        tpToMe = "TP to me",
	        noAccess = "Could not get access to the entity.",
	        noExist = "Entity no longer exists.",
	        general = "General",
	        movement = "Movement",
	        onlyOnline = "This only works online.",
	        onlyPlayers = "This only works on players.",
	        onlyPeds = "This only works on peds.",
	        noPlayer = "No player found.",
	        cantUseOnSelf = "You cannot use this on yourself.",
	        weapon = "Weapon",
	        unknownWeapon = "Unknown Weapon",
	        position = "Position",
	        positionD = "Adjust text position and scale.",
	        hPos = "Horizontal position",
	        vPos = "Vertical position",
	        vertical = "Vertical",
	        horizontal = "Horizontal",
	        scale = "Scale",
	        vSpace = "Vertical spacing",
	        hSpace = "Horizontal spacing",
	        color = "Color",
	        colors = "Colors",
	        sortBy = "Sort by",
	        reverseSort = "Reverse sort order",
	        killed = "Killed!",
	        cannotKill = "Could not kill player.",
	        ragdoll = "Ragdoll",
	        explode = "Explode",
	        ownedExplode = "Owned explode",
	        cages = "Cages",
	        visible = "Visible",
	        invisible = "Invisible",
	        small = "Small",
	        fence = "Fence",
	        hell = "Hell",
	        removeCages = "Remove cages",
	        others = "Others",
	        delete = "Delete",
	        clone = "Clone",
	        burn = "Burn",
	        health = "Health",
	        godMode = "God-mode",
	        rotate = "Rotate",
	        flip = "Flip",
	        up = "up",
	        down = "down",
	        forward = "forward",
	        backward = "backward",
	        freeze = "Freeze",
	        unfreeze = "Unfreeze",
	        tpToIt = "TP to it",
	        cage = "Cage",
	        kick = "Kick",
	        openInStand = "Open in Stand",
	        shoot = "Shoot",
	        crash = "Crash",
	        setGod = "Set God",
	        setGodD = "This doesn't work on players.",
	        removeGod = "Remove God",
	        removeGodD = "This will also work on some modders with crappy menus.",
	        bulletType = "Bullet type",
	        delay = "Delay",
	        settings = "Settings",
	        toggleInv = "Tgl. invisible",
	        toggleMark = "Tgl. mark",
	        toggleMarkD = "Mark a few entities and then trigger the mark actions of your choice on all of them.",
	        atomize = "Atomize",
	        fireworks = "Fireworks",
	        clearList = "Clear list",
	        randomExplosion = "Random explosion",
	        copyOutfit = "Copy outfit",
	        units = "Units",
	        imperial = "Imperial",
	        metric = "Metric",
	        kmh = "km/h",
	        mph = "mph",
	        enabled = "Enabled",
	        range = "Range",
	        animal = "Animal",
	        includePeds = "Include peds",
	        includePedVehs = "Include ped vehicles",
	        includeMyVeh = "Include my vehicle",
	        includeMyPed = "Include my ped",
	        includePlayerPeds = "Include player peds",
	        includePlayerVehs = "Include player vehicles",
	        inProgress = "In progress, please wait.",
	        random = "random",
	        launchType = "Launch type",
	        lPadding = "Left padding",
	        rPadding = "Right padding",
	        blurStrength = "Blur strength",
	        electric = "Electric",
	        modder = "Modder",
	        modderAdmin = "Modder or Admin",
	        admin = "Admin",
	        attack = "Attack",
	        walk = "Walk",
	        stay = "Stay",
	        flee = "Flee",
	        airstrike = "Airstrike",
	        shootType = "Shoot type",
	        explodeType = "Explode type",
	        anonymous = "Anonymous",
	        owned = "Owned",
	        enableOnAimOnly = "Enable on aim only",
	        ram = "Ram",
	        ramVehicle = "Ram vehicle",
	        expBullets = "Explosive bullets",
	        expBulletsType = "Explosive bullets type",
	        npcHijack = "NPC hijack",
	        npcHijackPed = "NPC hijack ped",
	        giveCollectibles = "Give collectibles",
	        collectiblesType = "Collectibles type",
	        emptyFrom = "Empty from",
	        emptyFromD = "Select who is kicked from vehicle when using Empty vehicle action.",
	        all = "All",
	        driver = "Driver",
	        passengers = "Passengers"
	    },
	    vehicle = {
	        name = "Vehicle",
	        showVehModelName = "Show model name",
	        showVehModelNameD = "When enabled, you will see vehicle model name which can be used for spawning it. Otherwise, you will see in-game name of the vehicle.",
	        notInVehicle = "You are not in a vehicle.",
	        playerNotInVehicle = "is not in a vehicle.",
	        noAccess = "Could not get access to the vehicle.",
	        noNearby = "No vehicles found nearby. Spawning a car.",
	        driveNearest = "Drive nearest NPC vehicle",
	        driveNearestD = "Teleports you to the nearest vehicle and automatically starts engine to drive.",
	        randomUpgrades = "Random upgrades",
	        randomUpgradesD = "Get random ugprades for your vehicle.",
	        clean = "Clean",
	        cleanD = "Clean your vehicle from dirt",
	        speedUpVal = "Speed up value",
	        speedUpValD = "Value to be used for Speed up.",
	        speedUp = "Speed up",
	        speedUpD = "Speed up your vehicle forward by value selected above. Use a hotkey with Hold option to use it.",
	        stop = "Stop",
	        stopD = "Instantly stop your vehicle.",
	        plate = "License plate",
	        customPlate = "Custom license plate text",
	        customPlateD = "License plate will be changed to this text when the below option is toggled.",
	        enablePlate = "Enable custom license plate",
	        enablePlateD = "Your license plate will be changed to the text you input above on every vehicle you are in.",
	        empty = "Empty",
	        emptyD = "Empty the vehicle from all occupants.",
	        lockDoors = "Lock doors",
	        killEngine = "Kill engine",
	        damage = "Damage",
	        repair = "Repair",
	        EMP = "EMP",
	        engineOff = "Engine off",
	        bump = "Bump",
	        spin = "Spin",
	        slick = "Slick",
	        slickD = "Make the vehicle lose grip for a moment.",
	        launch = "Launch",
	        tpHigh = "TP high in sky",
	        sink = "Sink in ocean",
	        doorsLocked = "Doors locked",
	        doorsOpen = "Doors open",
	        noFreeSeats = "No free seats in player's vehicle. Use the drive function instead if you want to hijack this vehicle.",
	        drive = "Drive",
	        enter = "Enter",
	        enterD = "Enter the aimed vehicle as passenger or driver if empty.",
	        upgrade = "Upgrade",
	        upgradeD = "Apply random upgrades to the vehicle.",
	        launchUp = "Launch up",
	        launchDown = "Force down",
	        launchForward = "Launch forward",
	        launchBack = "Launch back",
	        vFlip = "V. Flip",
	        hFlip = "H. Flip",
	        randomForce = "Random force",
	        randomForceD = "Launch the vehicle in random direction.",
	        randomShutdowns = "Random engine shutdowns",
	        keepEngineOff = "Keep engine off",
	        randomUpgradesSettingsD = "Customize what can be upgraded via random upgrades.",
	        performance = "Performance",
	        bodyParts = "Body parts",
	        paint = "Paint color",
	        livery = "Livery",
	        lights = "Lights color",
	        tyreSmoke = "Tyre smoke color",
	        windowTint = "Windows tint",
	        horn = "Horn",
	        plateType = "Plate type",
	        wheels = "Wheels",
	        neons = "Neons",
	        weaponRoof = "Roof / Weapons",
	        grilleCounter = "Grille / Countermeasures",
	        maxPerformance = "Always max performance",
	        damageSettings = "Damage settings",
	        damageSettingsD = "Toggle which things are broken when using Damage vehicle action.",
	        windows = "Break windows",
	        doors = "Break doors",
	        tyres = "Pop tyres",
	        smokeEngine = "Smoke engine",
	        flyVehicle = "Fly vehicle",
	        flyVehicleD = "Also works when you are a passenger in player's car, but laggy.",
	        flySpeed = "Fly speed",
	        popOnce = "Pop tyres once",
	        popOnceD = "Tyres won't be popped all over again if they are already damaged.",
	        hornBoost = "Horn boost",
	        hornJump = "Horn jump",
	        hornBoostSpeed = "Horn boost speed",
	        hornJumpForce = "Horn jump force",
	        spawnRandom = "Spawn random vehicle",
	        hornExplosions = "Horn explosions",
	        autoUpgrade = "Auto-apply random upgrades",
	        autoUpgradeD = "Automatically apply random upgrades when you enter a vehicle as driver",
	        glitch = "Glitch"
	    },
	    teleport = {
	        name = "Teleport",
	        tpToWp = "Teleport to waypoint/objective",
	        tpToWpD = "Teleports you to the waypoint or mission objective.",
	        tpFwdDist = "Teleport forward distance",
	        tpFwdForceGround = "Teleport forward force ground",
	        tpFwdForceGroundD = "When enabled, you should be teleported to the ground position. Useful when you often teleport below the map or inside an interior.",
	        keepSpeed = "Keep speed",
	        keepSpeedD = "Keeps your speed after teleporting instead of being stopped.",
	        tpFwd = "Teleport forward",
	        tpToRandomPlayer = "Teleport to random player",
	        tpInVehicle = "Teleport in vehicle if driver"
	    },
	    world = {
	        name = "World",
	        clearAreaSettings = "Clear area settings",
	        vehicles = "Vehicles",
	        vehiclesD = "Clear all vehicles excluding players and yours.",
	        peds = "Peds",
	        pedsD = "Clear all peds excluding players.",
	        objects = "Objects",
	        objectsD = "Clear all objects.",
	        clearArea = "Clear area",
	        clearAreaD = "Clear nearby area from all entities chosen by you.",
	        noSelection = "You did not select any entities to clear.",
	        clearAreaLoop = "Clear area loop",
	        manipulateArea = "Manipulate area",
	        manipulateAreaD = "Run selected actions in a loop on peds/vehicles within the chosen range.",
	        manipulateAreaSettings = "Manipulate area settings",
	        manipulateAreaActions = "Manipulate area actions",
	        dropCasino = "Drop Casino figures",
	        dropCards = "Drop playing cards",
	        giveAmmo = "Give ammo"
	    },
	    online = {
	        name = "Online",
	        sorting = {
	            Distance = "Distance",
	            Rank = "Rank",
	            Money = "Money",
	            KD = "KD",
	            Name = "Name",
	            ["Host position"] = "Host position",
	            Language = "Language"
	        },
	        aimInfo = "Player aim info",
	        aimInfoD = "Settings for player aim information to show who is aiming at you and what weapon they are using. Doesn't work for vehicle weapons.",
	        showAimInfo = "Show player aim info",
	        displayTime = "Display time",
	        displayTimeD = "Time for which aim info will be shown.",
	        aimInfoExample = "Display example",
	        aimInfoExampleD = "Show example of the aim information.",
	        playerList = "Players list",
	        enablePlayerList = "Enable online list",
	        showYourself = "Show yourself",
	        showTags = "Show tags",
	        showDistance = "Show distance",
	        showRank = "Show rank",
	        showKD = "Show KD",
	        showWanted = "Show wanted level",
	        showMoney = "Show money",
	        showVehicle = "Show vehicle name",
	        showLanguage = "Show language",
	        maxPlayers = "Max players",
	        hideInterior = "Hide players in interior",
	        interiorLast = "Interior players at the end",
	        colNum = "Columns number",
	        mainColor = "Main color",
	        interiorColor = "Interior player color",
	        deadColor = "Dead player color",
	        modderColor = "Modder player color",
	        OTRcolor = "OTR player color",
	        showOrgColors = "Show organization colors",
	        killersList = "Killers list",
	        killersListD = "List of players who killed you and options for payback.",
	        killers = "Killers",
	        showSpeed = "Show vehicle speed",
	        speedAbove = "Show vehicle speed above",
	        showInterior = "Show interior name",
	        clearAfterPayback = "Clear list after payback",
	        payback = "Payback",
	        paybackD = "Do selected action on all players who killed you.",
	        rChat = "Rockstar chat",
	        rVerified = "Rockstar verified",
	        esp = "ESP",
	        maxDist = "Maximum distance",
	        showWeapon = "Show weapon",
	        inVehicle = "In vehicle",
	        showInMyVehicle = "Show players in my vehicle",
	        showInMyVehicleD = "Show ESP for players in your vehicle when you are driver.",
	        showHealth = "Show health",
	        showArmor = "Show armor",
	        showOnlyNearby = "Show only nearby players",
	        nearbyMaxDist = "Nearby players max distance",
	        showBounty = "Show bounty",
	        forceHost = "Force session host",
	        forceHostD = "Kick players which are next in the host queue to become the session host. The position in queue shown above means that the same number of players will be kicked. If anyone in the queue is your friend, the action will not happen and no one will be kicked.",
	        forceHostSuccess = "Success, you are now the session host.",
	        forceHostFailFriend = "Failed, one of the players in the queue is your friend. Forcing session host is impossible until your friend re-joins the session with a higher host queue index.",
	        forceHostFailHost = "You are session host already.",
	        currentHostQueuePos = "Current position in queue: ",
	        bgOptions = "Background options",
	        forceVisible = "Force visible players",
	        forceVisibleD = "It will make all player peds visible, even when they are in loading state or when modder uses invisibility. Local only.",
	        allPlayers = "All players",
	        randomBlameKills = "Random blame kills",
	        playerKicker = "Player kicker",
	        playerKickerD = "Kick players based on selected factors or force become session host.",
	        autoKick = "Auto-kick",
	        kickFactors = "Kick factors",
	        languages = "Languages",
	        languagesD = "Players with selected languages will be kicked.",
	        adminColor = "Admin color",
	        modderAdminColor = "Modder or Admin color",
	        selfColor = "My player color",
	        godColor = "God player color",
	        friendColor = "Friend color",
	        attackerColor = "Attacker color",
	        hostColor = "Host color",
	        sHostColor = "Script host color",
	        kickLevel = "Kick level",
	        kickLevelAbove = "Kick level above",
	        kickKD = "Kick KD",
	        kickKDAbove = "Kick KD above",
	        kickMoney = "Kick money",
	        kickMoneyAbove = "Kick money above X millions"
	    },
	    self = {
	        name = "Self",
	        randomOutfit = "Get random player outfit",
	        randomOutfitD = "Copy the outfit from random player in the lobby.",
	        instantRespawn = "Instant respawn on death",
	        noBounty = "Avoid bounties",
	        noBountyD = "Constantly remove any bounties placed on you."
	    },
	    aim = {
	        name = "Aim actions",
	        nameD = "Actions which can be triggered when aiming on entities. Set a hotkey for every action you want, then simply aim on entity and use the hotkey to trigger the action. Note: aiming with equipped weapon gives higher range.",
	        peds = "Peds",
	        objects = "Objects",
	        teleport = "Aim teleport",
	        teleportD = "Teleport to the location you are aiming at.",
	        reviveOnlyDead = "Ped is alive. You can only revive dead peds.",
	        disarm = "Disarm",
	        heal = "Heal",
	        healD = "Heal and give armor to the aimed player or revive a dead ped.",
	        moveTo = "Move to...",
	        move = "Move",
	        moveObjD = "Aim on an object you want to move and press the hotkey. Then aim on the position you want to put the object on and press the hotkey again. The object will be lost if you get too far away from the original.",
	        moveVehD = "Aim on a vehicle you want to move and press the hotkey. Then aim on the position you want to put the vehicle on and press the hotkey again.",
	        aimBeam = "Aim beam",
	        useBeam = "Use beam",
	        useBeamD = "Shoot the selected type of bullet to where your camera is pointed at. Use a hotkey with Hold option to use it.",
	        noAssignedHotkeysPeds = "No assigned hotkeys for ped aim actions",
	        noAssignedHotkeysVehs = "No assigned hotkeys for vehicle aim actions",
	        ped = "Ped",
	        aimLock = "Aim lock",
	        aimLockLastTarget = "Aim lock last target",
	        aimLockLastTargetD = "When enabled, your last aimed vehicle or ped will be interactive for the set amount of time. The interaction is possible when you stop aiming. It's useful when the target is moving quickly or is far, so that you don't have to aim at him all the time. Aiming at a different vehicle/ped with active aim lock will switch the aim lock target.",
	        lockTime = "Lock time",
	        lockTimeD = "0 will lock the aim on last target until it's lost by the game or deleted. You can also use the action below to remove lock from the target.",
	        removeAimLock = "Remove aim lock",
	        removeAimLockD = "Remove aim lock",
	        hotkeysPos = "Hotkeys/name position",
	        hotkeysColor = "Hotkeys/name color",
	        showHotkeys = "Show hotkeys",
	        lineColor = "Line color",
	        hgColor = "Highlight color",
	        showLine = "Show line to target",
	        hgTarget = "Highlight target",
	        showBeacon = "Show AR beacon for aim teleport",
	        markSettings = "Mark settings",
	        markColor = "Mark color",
	        markedActionPed = "Marked peds action",
	        markedActionVeh = "Marked vehicles action",
	        triggerMarkAction = "Trigger action",
	        keepMark = "Keep marked targets after action",
	        unmarkAll = "Unmark all",
	        markActions = {
	            shoot = "Shoot",
	            explode = "Explode",
	            damage = "Damage",
	            emp = "EMP",
	            atomize = "Atomize",
	            fireworks = "Fireworks",
	            burn = "Burn",
	            randForce = "Random force"
	        },
	        showName = "Show name",
	        showNameD = "Show vehicle name and player name (if applicable) on aimed entity.",
	        noDriver = "No driver in vehicle.",
	        noVehicle = "Ped is not in a vehicle.",
	        selectDriver = "Select driver",
	        selectDriverD = "Move aim lock to the vehicle's driver if you want to run aim actions on the driver instead.",
	        selectVehicle = "Select vehicle",
	        selectVehicleD = "Move aim lock to the ped's vehicle if you want to run aim actions on the vehicle instead.",
	        selectCurrentVehicle = "Select current vehicle",
	        selectCurrentVehicleD = "Move aim lock to currently driven vehicle.",
	        enableAimActions = "Enable aim actions",
	        enableAimActionsD = "You can set a hotkey for this toggle and enable \"Hold\" mode on it. Then you will be able to use aim actions only while holding the configured key, which can help you avoid calling some actions by mistake when you use keys also used by the game. You can also remove aim lock from the target by pressing the configured key while not aiming.",
	        enableAimHotkey = "Enable aim hotkey",
	        enableAimHotkeyD = "When enabled, you can use use the hotkey assigned to \"Enable aim actions\" for all aim-related features instead of aiming. Enabling this without using a hotkey on the above toggle is not recommended because it will constantly run all the aiming functions."
	    },
	    player = {
	        players = "Players",
	        player = "Player",
	        playersD = "Shortcut to online players section.",
	        follow = "Follow",
	        followD = "Constantly teleport to the player.",
	        friendly = "Friendly",
	        trolling = "Trolling",
	        malicious = "Malicious",
	        fixLoading = "Fix loading screen",
	        fixLoadingD = "Try to fix player's infinite loading screen by giving him script host and teleporting to nearest apartment.",
	        carCrash = "Car crash",
	        carCrashD = "This will also crash players near the target!",
	        killPassive = "Kill passive player",
	        killInterior = "Kill player in interior",
	        killInteriorD = "It doesn't work in all places.",
	        notInInterior = "is not in interior.",
	        dumpAll = "Dump all into player",
	        dumpAllD = "Teleport all entities into player's location.",
	        sounds = "Sounds",
	        soundsD = "Lower down your volume if you are near the player!",
	        earsRaper = "Ears Raper",
	        yacht = "Yacht Horn",
	        airAct = "Air defenses activated",
	        airDeact = "Air defenses deactivate",
	        hackFailed = "Hack failed",
	        hackSuccess = "Hack success",
	        powerDown = "Power down",
	        beeping = "Beeping",
	        buzz = "Door buzz",
	        flameJet = "Flame jet",
	        waterJet = "Water jet",
	        hydrantFlood = "Hydrant flood",
	        changeNPCCLones = "Change NPC to clones",
	        kickFromEveryVehicle = "Kick from every vehicle",
	        deleteVehicleLoop = "Delete vehicle loop",
	        makeWanted = "Make wanted",
	        makeWantedLevel = "Make wanted level",
	        placeBounty = "Place bounty",
	        bountyAmount = "Bounty amount",
	        bountyLoop = "Place bounty loop",
	        bountyLoopD = "Automatically place bounty on the player every time he dies.",
	        cageType = "Cage type",
	        clonedPedTask = "Cloned ped task",
	        makeWantedLoop = "Make wanted loop",
	        ceoMoney = "CEO money",
	        dropPQ = "Drop P's & Q's",
	        otr = "Off the radar",
	        neverWanted = "Never wanted",
	        giveAllWeapons = "Give all weapons"
	    },
	    interior = {
	        interior = "Interior",
	        barber = "Barber",
	        lsCarMeet = "LS Car Meet",
	        benny = "Benny's",
	        kosatkaMissile = "Kosataka Guided Missile",
	        kosatka = "Kosatka",
	        pentGarage = "Penthouse Garage",
	        musicLocker = "Music Locker",
	        casino = "Casino",
	        casinoGarage = "Casino Garage",
	        eclipseTowers = "Eclipse Towers",
	        autoShop = "Auto Shop",
	        arena = "Arena",
	        subMission = "Submarine Mission",
	        facility = "Facility",
	        avenger = "Avenger",
	        beeker = "Beeker's",
	        penthouse = "Penthouse",
	        cayoPerico = "Cayo Perico",
	        ussLex = "USS Lexington",
	        arcade = "Arcade",
	        docForgery = "Document Forgery",
	        mcClub = "MC Clubhouse",
	        counterfeitCash = "Counterfeit Cash",
	        vehWarehouse = "Vehicle Warehouse",
	        ammuNation = "Ammu-Nation",
	        methLab = "Meth Lab",
	        cocaineLockup = "Cocaine Lockup",
	        weedFarm = "Weed Farm",
	        moc = "MOC",
	        tenCarGarage = "10-Car Garage",
	        fiftyCarGarage = "50-Car Garage",
	        bunker = "Bunker",
	        fib = "FIB Building",
	        agency = "Agency",
	        agencyGarage = "Agency Garage",
	        lsc = "LSC",
	        mazeTower = "Maze Tower",
	        hangar = "Hangar",
	        nightclub = "Nightclub",
	        nightclubBasement = "Nightclub Basement",
	        mazeBuilding = "Maze Building",
	        terrorbyte = "Terrorbyte",
	        lombank = "Lombank Building",
	        arcadius = "Arcadius Building",
	        loading = "Loading",
	        apart = "Apartment",
	        delPerro = "Del Perro",
	        fourWay = "4 Integrity Way",
	        yacht = "Yacht",
	        clothes = "Clothes Shop",
	        tattoo = "Tattoo",
	        strip = "Strip Club",
	        twoCarGarage = "2-Car Garage",
	        sixCarGarage = "6-Car Garage",
	        alta = "3 Alta St",
	        tinsel = "Tinsel Towers",
	        richards = "Richards Majestic",
	        weazel = "Weazel Plaza",
	        masks = "Masks Shop"
	    }
	}
	local zhTranslations = {
	    main = {
	        checkUpdates = "检查更新",
	        noUpdates = "没有找到任何更新.",
	        update = "更新脚本",
	        updateSuccess = "成功更新!",
	        updateInProgress = "更新已经在进行中, 请等待, 不要停止脚本!",
	        updating = "更新中...",
	        updatingToast = "更新中, 耐心点...",
	        updated = "更新.",
	        updateDownloadFail = "无法下载更新. 如果这种情况再次发生, 请通过从Gitlab下载来手动更新脚本.",
	        updateFileFail = "更新已取消. 无法写入文件. 如果这种情况再次发生, 请通过从Gitlab下载来手动更新脚本.",
	        goToGitlab = "前往脚本的GitLab页面",
	        goToGitlabD = "打开脚本页面.",
	        features = "功能",
	        settingsD = "脚本中各种选项的全局设置.",
	        hideTextOnMenu = "隐藏活动菜单上的文本",
	        hideTextOnMenuD = "当你在游戏暂停菜单、互动菜单或电话菜单中时(例如,在呼叫莱斯特之后),这将停止显示任何渲染文本(除了玩家目标信息).",
	        checkChangelog = "查看更新日志"
	    },
	    general = {
	        tpToMe = "传送到我",
	        noAccess = "无法访问实体.",
	        noExist = "实体不再存在.",
	        general = "常规",
	        movement = "移动",
	        onlyOnline = "只在线上有效.",
	        onlyPlayers = "只对玩家有效.",
	        onlyPeds = "只对NPC有效.",
	        noPlayer = "找不到玩家.",
	        cantUseOnSelf = "你不能对你自己使用.",
	        weapon = "武器",
	        unknownWeapon = "未知武器",
	        position = "位置",
	        positionD = "调整文本位置和比例.",
	        hPos = "水平位置",
	        vPos = "垂直位置",
	        vertical = "垂直",
	        horizontal = "水平",
	        scale = "比例",
	        vSpace = "垂直间隔",
	        hSpace = "水平间隔",
	        color = "颜色",
	        colors = "外观颜色",
	        sortBy = "排序方式",
	        reverseSort = "反向排序顺序",
	        killed = "杀死!",
	        cannotKill = "无法杀死玩家.",
	        ragdoll = "摔倒",
	        explode = "爆炸",
	        cages = "笼子",
	        visible = "可见",
	        invisible = "不可见",
	        small = "小",
	        fence = "栅栏",
	        hell = "地狱笼子",
	        removeCages = "移除笼子",
	        others = "其他",
	        delete = "删除",
	        clone = "克隆",
	        burn = "燃烧",
	        health = "载具耐久",
	        godMode = "无敌",
	        rotate = "旋转",
	        flip = "翻转",
	        up = "向上",
	        down = "向下",
	        forward = "向前",
	        backward = "向后",
	        freeze = "冻结",
	        unfreeze = "解冻",
	        tpToIt = "传送到TA",
	        cage = "笼子",
	        kick = "踢出",
	        openInStand = "在Stand中打开",
	        shoot = "射击",
	        crash = "崩溃",
	        setGod = "给予无敌",
	        setGodD = "对玩家无效.",
	        removeGod = "移除无敌",
	        removeGodD = "对一些菜单垃圾的作弊者也有效.",
	        bulletType = "子弹类型",
	        delay = "射击频率",
	        settings = "设置",
	        toggleInv = "隐形的爆炸",
	        toggleMark = "标记",
	        toggleMarkD = "标记一些实体,然后在所有实体上触发您选择的标记操作.",
	        atomize = "循环原子能枪",
	        fireworks = "循环发射烟花",
	        clearList = "清理列表",
	        randomExplosion = "爆炸组合",
	        copyOutfit = "复制服装",
	        units = "单位",
	        imperial = "英制",
	        metric = "公制",
	        kmh = "公里/小时",
	        mph = "英里/小时",
	        enabled = "启用",
	        range = "范围",
	        animal = "动物",
	        includePeds = "包括NPC",
	        includePedVehs = "包括NPC的载具",
	        includeMyVeh = "包括我的载具",
	        includeMyPed = "包括我",
	        includePlayerPeds = "包括玩家",
	        includePlayerVehs = "包括玩家载具",
	        inProgress = "正在进行中,请稍候.",
	        random = "随机",
	        launchType = "发射方向",
	        lPadding = "左填充",
	        rPadding = "右填充",
	        blurStrength = "模糊强度",
	        electric = "电动",
	        modder = "作弊者",
	        modderAdmin = "作弊者或者管理员",
	        admin = "管理员",
	        attack = "攻击",
	        walk = "步行",
	        stay = "逗留",
	        flee = "消失",
	        airstrike = "空袭",
	        shootType = "射击类型",
	        explodeType = "爆炸类型",
	        anonymous = "匿名",
	        owned = "实名",
	        enableOnAimOnly = "仅在瞄准上启用",
	        ram = "运行内存 ",
	        ramVehicle = "载具内存",
	        expBullets = "爆炸子弹",
	        expBulletsType = "爆炸子弹类型",
	        npcHijack = "NPC 抢劫",
	        npcHijackPed = "NPC抢劫事件",
	        giveCollectibles = "赠送收藏品",
	        collectiblesType = "收藏品类型",
	        emptyFrom = "指定某人踢出",
	        emptyFromD = "当使用清空载具时，选择谁被踢出载具。",
	        all = "所有人",
	        driver = "司机",
	        passengers = "乘客"
	    },
	    vehicle = {
	        name = "载具",
	        showVehModelName = "显示载具型号名称",
	        showVehModelNameD = "启用后，您看到的是可用于生成的载具的车型名称。否则，你看到的是游戏中的载具名称。",
	        notInVehicle = "你不在载具内.",
	        playerNotInVehicle = "不在载具内.",
	        noAccess = "无法接近载具.",
	        noNearby = "附近没有发现载具. 请生成一辆载具.",
	        driveNearest = "驾驶最近的NPC的载具",
	        driveNearestD = "传送你到最近的载具, 并自动启动引擎.",
	        randomUpgrades = "随机升级",
	        randomUpgradesD = "为您的载具获取随机的升级.",
	        clean = "清洁载具",
	        cleanD = "清除载具上的灰尘",
	        speedUpVal = "加速度",
	        speedUpValD = "用于加速的值.",
	        speedUp = "加速",
	        speedUpD = "按照上面选择的值加速载具前进. 使用带有保持选项的快捷键来使用它.",
	        stop = "停止",
	        stopD = "立即停车.",
	        plate = "车牌",
	        customPlate = "自定义车牌文本",
	        customPlateD = "当下面的选项被启用时, 车牌将被更改为该文本.",
	        enablePlate = "启用自定义车牌",
	        enablePlateD = "在您乘坐的每辆车上, 您的车牌将被更改为您在上面输入的文本.",
	        empty = "清空载具",
	        emptyD = "清空载具上的所有乘客.",
	        lockDoors = "锁门",
	        killEngine = "关闭引擎",
	        damage = "损坏",
	        repair = "修理",
	        EMP = "电磁脉冲",
	        engineOff = "关闭发动机",
	        bump = "颠簸",
	        spin = "旋转",
	        slick = "打滑",
	        slickD = "让载具失去一会儿抓地力.",
	        launch = "发射",
	        tpHigh = "传送到高空",
	        sink = "沉入大海",
	        doorsLocked = "锁上车门",
	        doorsOpen = "解锁车门",
	        noFreeSeats = "玩家的车上没有空座位。如果你想劫持这辆车，请使用驾驶功能。",
	        drive = "驾驶",
	        enter = "乘坐",
	        enterD = "如果为空载具, 则作为司机进入.",
	        upgrade = "升级",
	        upgradeD = "对载具进行随机升级.",
	        launchUp = "向上发射",
	        launchDown = "向下发射",
	        launchForward = "向前发射",
	        launchBack = "向后发射",
	        vFlip = "垂直翻转",
	        hFlip = "水平翻转",
	        randomForce = "随机方向发射",
	        randomForceD = "向任意方向发射车辆.",
	        randomShutdowns = "随机时间使发动机关闭",
	        keepEngineOff = "保持发动机关闭",
	        randomUpgradesSettingsD = "定制可以通过随机升级来升级的内容.",
	        performance = "性能",
	        bodyParts = "车身零件",
	        paint = "车漆颜色",
	        livery = "车身装饰",
	        lights = "亮色",
	        tyreSmoke = "烧胎烟雾",
	        windowTint = "车窗颜色",
	        horn = "喇叭",
	        plateType = "防御",
	        wheels = "车轮",
	        neons = "霓虹灯",
	        weaponRoof = "车顶 / 武器",
	        grilleCounter = "中网 / 反制措施",
	        maxPerformance = "始终保持最佳性能",
	        damageSettings = "损坏类型设置",
	        damageSettingsD = "使用损坏功能时选择哪些东西被损坏.",
	        windows = "车窗",
	        doors = "车门",
	        tyres = "轮胎",
	        smokeEngine = "发动机冒烟",
	        flyVehicle = "载具飞行",
	        flyVehicleD = "当你坐在玩家的车里时同样有效,但是有点慢.",
	        flySpeed = "飞行速度",
	        popOnce = "爆胎一次",
	        popOnceD = "如果轮胎已经损坏,就不会再弹出来.",
	        hornBoost = "喇叭加速",
	        hornJump = "喇叭跳跃",
	        hornBoostSpeed = "喇叭加速速度",
	        hornJumpForce = "喇叭跳跃高度",
	        spawnRandom = "随机生成载具",
	        hornExplosions = "喇叭爆炸",
	        autoUpgrade = "自动应用随机升级",
	        autoUpgradeD = "当你以驾驶员身份进入载具时，自动应用随机升级",
	        glitch = "Glitch"
	    },
	    teleport = {
	        name = "传送",
	        tpToWp = "传送到标记点/任务点",
	        tpToWpD = "传送你的标记点或任务目标.",
	        tpFwdDist = "向前传送距离",
	        tpFwdForceGround = "向前传送到地面",
	        tpFwdForceGroundD = "启用时, 你应该被传送到地面位置. 当你经常在地图下或室内传送时很有用.",
	        keepSpeed = "保持速度",
	        keepSpeedD = "传送后保持速度, 而不是被停止.",
	        tpFwd = "向前传送",
	        tpToRandomPlayer = "传送到随机玩家",
	        tpInVehicle = "传送到载具并驾驶"
	    },
	    world = {
	        name = "世界",
	        clearAreaSettings = "清除区域设置",
	        vehicles = "载具",
	        vehiclesD = "清除所有载具, 不包括玩家和你的载具.",
	        peds = "Ped",
	        pedsD = "清除所有ped, 不包括玩家.",
	        objects = "物体",
	        objectsD = "清除所有物体.",
	        clearArea = "开始清除",
	        clearAreaD = "从您选择的所有实体中清除附近区域.",
	        noSelection = "您没有选择任何要清除的实体.",
	        clearAreaLoop = "循环清理",
	        manipulateArea = "操纵区域",
	        manipulateAreaD = "在所选范围内的 ped/载具 上循环运行所选操作.",
	        manipulateAreaSettings = "操纵区域设置",
	        manipulateAreaActions = "控制区域操作",
	        dropCasino = "移除赌场收入",
	        dropCards = "扔掉扑克牌",
	        giveAmmo = "弹药全满"
	    },
	    online = {
	        name = "在线",
	        sorting = {
	            Distance = "距离",
	            Rank = "等级",
	            Money = "存款",
	            KD = "KD",
	            Name = "名字",
	            ["Host position"] = "主机序列位置",
	            Language = "语言"
	        },
	        aimInfo = "玩家瞄准信息",
	        aimInfoD = "玩家瞄准信息的设置, 显示谁在瞄准你, 他们用的是什么武器. 对车载武器无效.",
	        showAimInfo = "显示玩家瞄准信息",
	        displayTime = "显示时间",
	        displayTimeD = "将显示目标信息的时间.",
	        aimInfoExample = "显示示例",
	        aimInfoExampleD = "显示瞄准信息的示例.",
	        playerList = "玩家列表",
	        enablePlayerList = "启用在线列表",
	        showYourself = "显示自己",
	        showTags = "显示Stand标签",
	        showDistance = "显示距离",
	        showRank = "显示等级",
	        showKD = "显示KD",
	        showWanted = "显示通缉等级",
	        showMoney = "显示存款",
	        showVehicle = "显示载具名称",
	        showLanguage = "显示使用的语言",
	        maxPlayers = "最大玩家数",
	        hideInterior = "隐藏室内玩家",
	        interiorLast = "室内玩家显示在最后",
	        colNum = "列数",
	        mainColor = "主色调",
	        interiorColor = "室内玩家颜色",
	        deadColor = "死亡玩家颜色",
	        modderColor = "作弊者颜色",
	        OTRcolor = "正在加入战局的玩家颜色",
	        showOrgColors = "显示组织颜色",
	        killersList = "凶手名单",
	        killersListD = "杀死你的玩家名单和报复选项.",
	        killers = "凶手",
	        showSpeed = "显示车速",
	        speedAbove = "在上方显示车速",
	        showInterior = "显示内部名称",
	        clearAfterPayback = "报复后清除列表",
	        payback = "报复",
	        paybackD = "对杀死你的所有玩家进行指定的操作.",
	        rChat = "R星式聊天",
	        rVerified = "R星认证已通过",
	        esp = "透视",
	        maxDist = "最大距离",
	        showWeapon = "显示武器",
	        inVehicle = "在载具中",
	        showInMyVehicle = "显示在我载具中的玩家",
	        showInMyVehicleD = "当你是司机时,为你载具上其他玩家显示透视信息.",
	        showHealth = "显示生命值",
	        showArmor = "显示护甲",
	        showOnlyNearby = "仅显示附近的玩家",
	        nearbyMaxDist = "显示附近玩家最大距离",
	        showBounty = "显示赏金",
	        forceHost = "强制战局主机",
	        forceHostD = "将主机队列中下一个玩家踢出成为战局主机.上面显示的队列中的位置意味着相同数量的玩家将被踢出。如果队列中有谁是你的朋友,操作就不会执行,也不会有人被踢。",
	        forceHostSuccess = "成功,您现在是战局主机.",
	        forceHostFailFriend = "失败,队列中的一个玩家是你的好友.除非您的好友使用更高的主机令牌重新加入会话,否则强制战局主机是不可能的.",
	        forceHostFailHost = "您已经是战局主机.",
	        currentHostQueuePos = "主机队列中的当前位置:",
	        bgOptions = "背景选项",
	        forceVisible = "强制可见玩家",
	        forceVisibleD = "它将使所有玩家可见，即使他们在加载状态或使用菜单中的隐形. 仅限本地可见",
	        allPlayers = "所有玩家",
	        randomBlameKills = "随机栽赃",
	        playerKicker = "踢出玩家",
	        playerKickerD = "基于选定的原因踢出玩家或强制成为会议主持人。",
	        autoKick = "自动踢出",
	        kickFactors = "踢出原因",
	        languages = "语言",
	        languagesD = "使用已选择语言的玩家将被踢出游戏.",
	        adminColor = "管理员颜色",
	        modderAdminColor = "作弊者或管理员颜色",
	        selfColor = "自我颜色",
	        godColor = "无敌玩家颜色",
	        friendColor = "好友颜色",
	        attackerColor = "攻击者颜色",
	        hostColor = "主机颜色",
	        sHostColor = "脚本主机颜色",
	        kickLevel = "踢出 等级",
	        kickLevelAbove = "踢出等级N以上的玩家",
	        kickKD = "踢出 KD",
	        kickKDAbove = "踢出 KD N以上的玩家",
	        kickMoney = "踢出 存款",
	        kickMoneyAbove = "踢出N存款以上的玩家"
	    },
	    self = {
	        name = "自我",
	        randomOutfit = "获得随机玩家的服装",
	        randomOutfitD = "从大厅的随机一名玩家那里复制服装.",
	        instantRespawn = "死亡瞬间复活",
	        noBounty = "清除悬赏",
	        noBountyD = "自动清除你身上的悬赏。"
	    },
	    aim = {
	        name = "瞄准",
	        nameD = "瞄准实体时可以触发的操作. 为你想要的每个操作设置一个快捷键, 然后只需瞄准实体并使用快捷键来触发操作. 注意: 用自己装备的武器瞄准会有更远的射程.",
	        peds = "Ped",
	        objects = "物体",
	        teleport = "瞄准传送",
	        teleportD = "传送到你要瞄准的地方.",
	        reviveOnlyDead = "NPC还活着. 你只能复活死去的NPC.",
	        disarm = "解除武装",
	        heal = "治愈",
	        healD = "治疗并给目标玩家护甲, 或者复活一个死去的NPC.",
	        moveTo = "移动到...",
	        move = "移动",
	        moveObjD = "瞄准一个你想移动的物体并按下快捷键. 然后瞄准您想要放置对象的位置, 并再次按下快捷键. 如果你离原物体太远, 物体就会丢失.",
	        moveVehD = "瞄准一个你想移动的载具并按下快捷键. 然后瞄准您想要放置载具的位置, 并再次按下快捷键.",
	        aimBeam = "自动射击",
	        useBeam = "启用",
	        useBeamD = "将所选类型的子弹射向你所看的地方. 使用带有保持选项的快捷键来使用它.",
	        noAssignedHotkeysPeds = "没有为 ped 瞄准操作分配快捷键",
	        noAssignedHotkeysVehs = "没有为载具瞄准操作分配快捷键",
	        ped = "Ped",
	        aimLock = "瞄准锁定",
	        aimLockLastTarget = "瞄准锁定最后一个目标",
	        aimLockLastTargetD = "启用时, 您最后瞄准的载具或ped将在设定的时间内保持互动. 当你停止瞄准时, 互动仍可以发生. 在目标移动很快或者很远的时候很有用, 这样你就不用一直瞄准TA了. 瞄准不同的载具/ped将切换瞄准锁定目标.",
	        lockTime = "锁定时间",
	        lockTimeD = "设置为0将锁定最后一个目标直到它被游戏丢失或删除. 您也可以使用下面的操作来解除对目标的锁定.",
	        removeAimLock = "移除瞄准锁定",
	        removeAimLockD = "移除瞄准锁定",
	        hotkeysPos = "快捷键/名称位置",
	        hotkeysColor = "快捷键/名称颜色",
	        showHotkeys = "显示快捷键",
	        lineColor = "目标线颜色",
	        hgColor = "突出显示颜色",
	        showLine = "显示目标线",
	        hgTarget = "突出显示目标",
	        showBeacon = "显示目标传送的AR信标",
	        markSettings = "标记设置",
	        markColor = "标记颜色",
	        markedActionPed = "标记的Ped操作",
	        markedActionVeh = "标记的载具操作",
	        triggerMarkAction = "触发标记操作",
	        keepMark = "触发操作后保留目标的标记",
	        unmarkAll = "取消所有的标记目标",
	        markActions = {
	            shoot = "射击",
	            explode = "爆炸",
	            damage = "损坏",
	            emp = "电磁脉冲",
	            atomize = "循环原子能枪",
	            fireworks = "循环发射烟花",
	            burn = "燃烧",
	            randForce = "随机方向发射"
	        },
	        showName = "显示名称",
	        showNameD = "在目标实体上显示载具名称和玩家姓名(如果适用).",
	        noDriver = "载具内没有司机。",
	        noVehicle = "Ped不在载具中。",
	        selectDriver = "选择驾驶员",
	        selectDriverD = "如果您想对驾驶员执行目标锁定操作，请将目标锁定移动到驾驶员。",
	        selectVehicle = "选择载具",
	        selectVehicleD = "如果您想在车辆上运行目标锁定操作，请将目标锁定移动到ped的载具上。",
	        selectCurrentVehicle = "选择当前载具",
	        selectCurrentVehicleD = "将目标锁定移动到当前驾驶的载具。",
	        enableAimActions = "启用瞄准操作操作",
	        enableAimActionsD = "您可以为此切换设置热键，并在其上启用“锁定”模式。然后，您将只能在按住配置的键时使用瞄准操作，这可以帮助您避免在使用游戏也使用的键时错误地调用一些动作。您也可以通过在不瞄准时按下配置的键来解除目标的瞄准锁定。",
	        enableAimHotkey = "启用瞄准操作快捷键",
	        enableAimHotkeyD = "启用时，您可以使用分配给“启用瞄准操作”的快捷键来使用所有瞄准相关功能，而不是目标。不建议在不使用快捷键的情况下启用此选项，因为它会持续运行所有瞄准功能。"
	    },
	    player = {
	        players = "玩家列表",
	        player = "玩家",
	        playersD = "访问Stand的玩家列表.",
	        follow = "跟随",
	        followD = "不断传送到玩家.",
	        friendly = "友好",
	        trolling = "恶搞",
	        malicious = "恶意",
	        fixLoading = "解除无限加载屏幕",
	        fixLoadingD = "尝试通过给玩家一个脚本主机并传送到最近的公寓来修复玩家的无限加载屏幕.",
	        carCrash = "载具崩溃",
	        carCrashD = "这也会让目标附近的玩家崩溃!",
	        killPassive = "杀死被动玩家",
	        killInterior = "杀死室内玩家",
	        killInteriorD = "它不是在所有地方都有效.",
	        notInInterior = "不在室内.",
	        dumpAll = "全部传送到玩家",
	        dumpAllD = "将所有实体传送到玩家的位置.",
	        sounds = "声音",
	        soundsD = "如果您靠近玩家，请降低音量!",
	        earsRaper = "强奸TA的耳朵",
	        yacht = "游艇喇叭",
	        airAct = "防空系统启动",
	        airDeact = "防空系统关闭",
	        hackFailed = "黑入失败",
	        hackSuccess = "黑入成功",
	        powerDown = "断电",
	        beeping = "哔哔声",
	        buzz = "门嗡嗡声",
	        flameJet = "喷火",
	        waterJet = "喷水",
	        hydrantFlood = "消防栓大喷水",
	        changeNPCCLones = "把NPC变成TA的克隆人",
	        kickFromEveryVehicle = "循环踢出载具",
	        deleteVehicleLoop = "循环删除载具",
	        makeWanted = "成为通缉犯",
	        makeWantedLevel = "拥有通缉等级",
	        placeBounty = "给予悬赏",
	        bountyAmount = "赏金数额",
	        bountyLoop = "循环给予悬赏",
	        bountyLoopD = "玩家每次死亡时自动获得悬赏",
	        cageType = "笼子类型",
	        clonedPedTask = "克隆任务ped",
	        makeWantedLoop = "循环给予通缉",
	        ceoMoney = "CEO 工资",
	        dropPQ = "放下P & Q",
	        otr = "从雷达上消失",
	        neverWanted = "从不通缉",
	        giveAllWeapons = "基于所有武器"
	    },
	    interior = {
	        interior = "内部",
	        barber = "理发店",
	        lsCarMeet = "车友会",
	        benny = "本尼汽车原创工坊",
	        kosatkaMissile = "虎鲸导弹",
	        kosatka = "虎鲸",
	        pentGarage = "空中别墅车库",
	        musicLocker = "音乐柜",
	        casino = "名钻赌场",
	        casinoGarage = "名钻赌场车库",
	        eclipseTowers = "日蚀公寓",
	        autoShop = "自动售货店",
	        arena = "竞技场",
	        subMission = "潜艇任务",
	        facility = "设施",
	        avenger = "复仇者",
	        beeker = "比克车库",
	        penthouse = "空中别墅",
	        cayoPerico = "佩里科岛",
	        ussLex = "航空母舰",
	        arcade = "游戏厅",
	        docForgery = "伪造文件",
	        mcClub = "摩托帮会所",
	        counterfeitCash = "假钞",
	        vehWarehouse = "载具仓库",
	        ammuNation = "武装国度",
	        methLab = "冰毒",
	        cocaineLockup = "可卡因",
	        weedFarm = "大麻",
	        moc = "机动作战中心",
	        tenCarGarage = "10车位车库",
	        fiftyCarGarage = "50车位车库",
	        bunker = "地堡",
	        fib = "FIB大楼",
	        agency = "办公室",
	        agencyGarage = "办公室车库",
	        lsc = "载具追踪器",
	        mazeTower = "花园银行大楼",
	        hangar = "机库",
	        nightclub = "夜总会",
	        nightclubBasement = "夜总会地下室",
	        mazeBuilding = "迷宫",
	        terrorbyte = "贝飞特 恐霸",
	        lombank = "隆班克大厦",
	        arcadius = "阿卡迪乌斯商务中心",
	        loading = "加载中",
	        apart = "公寓",
	        delPerro = "佩罗高地",
	        fourWay = "真诚大道4号公寓",
	        yacht = "游艇",
	        clothes = "服装店",
	        tattoo = "纹身店",
	        strip = "脱衣舞俱乐部",
	        twoCarGarage = "2车位车库",
	        sixCarGarage = "6车位车库",
	        alta = "阿尔塔街3号",
	        tinsel = "金箔塔",
	        richards = "理查兹·马杰斯",
	        weazel = "威泽尔广场",
	        masks = "面具店"
	    }
	}
	local ptTranslations = {
	    main = {
	        checkUpdates = "Verifique se há atualizações",
	        noUpdates = "Nenhuma atualização encontrada.",
	        update = "Atualizar script",
	        updateSuccess = "Atualizado com sucesso!",
	        updateInProgress = "A atualização já está em andamento, aguarde e não interrompa o script!",
	        updating = "Atualizando...",
	        updatingToast = "Atualizando, paciência...",
	        updated = "Atualizado.",
	        updateDownloadFail = "Falha ao baixar a atualização. Se isso acontecer novamente, atualize o script manualmente baixando-o do Gitlab.",
	        updateFileFail = "Atualização cancelada. Falha ao gravar no arquivo. Se isso acontecer novamente, atualize o script manualmente baixando-o do Gitlab.",
	        goToGitlab = "Vá para a página GitLab do script",
	        goToGitlabD = "Abra a página do script.",
	        features = "Funções",
	        settingsD = "Configurações globais para várias opções no script.",
	        hideTextOnMenu = "Ocultar texto quando menu ativo",
	        hideTextOnMenuD = "Isso interromperá a exibição de qualquer texto renderizado (exceto para informações de objetivo do jogador) enquanto você estiver no menu de pausa do jogo, no menu de interação ou no menu de chamada telefônica (por exemplo, após ligar para Lester).",
	        checkChangelog = "Verifique o changelog"
	    },
	    general = {
	        tpToMe = "TP para mim",
	        noAccess = "Não foi possível obter acesso à entidade.",
	        noExist = "A entidade não existe mais.",
	        general = "General",
	        movement = "Movimento",
	        onlyOnline = "Isso só funciona no online.",
	        onlyPlayers = "Isso só funciona em jogadores.",
	        onlyPeds = "Isso só funciona em peds.",
	        noPlayer = "Nenhum jogador encontrado.",
	        cantUseOnSelf = "Você não pode usar isso em si mesmo.",
	        weapon = "Arma",
	        unknownWeapon = "Arma desconhecida",
	        position = "Posição",
	        positionD = "Ajuste a posição e a escala do texto.",
	        hPos = "Posição horizontal",
	        vPos = "Posição vertical",
	        vertical = "Vertical",
	        horizontal = "Horizontal",
	        scale = "Escala",
	        vSpace = "Espaçamento vertical",
	        hSpace = "Espaçamento horizontal",
	        color = "Cor",
	        colors = "Cores",
	        sortBy = "Ordenar por",
	        reverseSort = "ordem de classificação inversa",
	        killed = "Morto!",
	        cannotKill = "Não foi possível matar o jogador.",
	        ragdoll = "Ragdoll",
	        explode = "Explodir",
	        cages = "Jaulas",
	        visible = "Visível",
	        invisible = "Invisível",
	        small = "Pequena",
	        fence = "Cerca",
	        hell = "Inferno",
	        removeCages = "Remover Jaulas",
	        others = "Outros",
	        delete = "Excluir",
	        clone = "Clone",
	        burn = "Queimar",
	        health = "Vida",
	        godMode = "God-mode",
	        rotate = "Girar",
	        flip = "Virar",
	        up = "cima",
	        down = "baixo",
	        forward = "frente",
	        backward = "trás",
	        freeze = "Congelar",
	        unfreeze = "Descongelar",
	        tpToIt = "TP para",
	        cage = "Jaula",
	        kick = "Expulsar",
	        openInStand = "Abrir no Stand",
	        shoot = "Atirar",
	        crash = "Crash",
	        setGod = "Por God",
	        setGodD = "Isso não funciona em jogadores.",
	        removeGod = "Remover God",
	        removeGodD = "Isso também funcionará em alguns modders com menus ruins.",
	        bulletType = "Tipo de bala",
	        delay = "Atraso",
	        settings = "Configurações",
	        toggleInv = "Tgl. invisível",
	        toggleMark = "Tgl. marca",
	        toggleMarkD = "Marque algumas entidades e acione as ações de marcação de sua escolha em todas elas.",
	        atomize = "atomizar",
	        fireworks = "Fogos de artifício",
	        clearList = "Limpar lista",
	        randomExplosion = "Explosão aleatória",
	        copyOutfit = "copiar roupa",
	        units = "Unidades",
	        imperial = "Imperial",
	        metric = "Métrica",
	        kmh = "km/h",
	        mph = "mph",
	        enabled = "Habilitado",
	        range = "Alcance",
	        animal = "Animal",
	        includePeds = "Incluir peds",
	        includePedVehs = "Incluir veículos para pedestres",
	        includeMyVeh = "Incluir meu veículo",
	        includeMyPed = "Incluir meu ped",
	        includePlayerPeds = "Incluir peds de jogador",
	        includePlayerVehs = "Incluir veículos de jogadores",
	        inProgress = "Em andamento, aguarde.",
	        random = "aleatório",
	        launchType = "Tipo de lançamento",
	        lPadding = "Preenchimento esquerdo",
	        rPadding = "Preenchimento direito",
	        blurStrength = "Intensidade do desfoque",
	        electric = "Elétrico",
	        modder = "Modder",
	        modderAdmin = "Modder ou Admin",
	        admin = "Admin",
	        attack = "Atacar",
	        walk = "Andar",
	        stay = "Ficar",
	        flee = "Fugir",
	        airstrike = "Ataque aéreo",
	        shootType = "Tipo de disparo",
	        explodeType = "Tipo de explosão",
	        anonymous = "Anônimo",
	        owned = "Possuído",
	        enableOnAimOnly = "Enable on aim only",
	        ram = "Ram",
	        ramVehicle = "Ram vehicle",
	        expBullets = "Explosive bullets",
	        expBulletsType = "Explosive bullets type",
	        npcHijack = "NPC hijack",
	        npcHijackPed = "NPC hijack ped",
	        giveCollectibles = "Give collectibles",
	        collectiblesType = "Collectibles type",
	        emptyFrom = "Empty from",
	        emptyFromD = "Select who is kicked from vehicle when using Empty vehicle action.",
	        all = "All",
	        driver = "Driver",
	        passengers = "Passengers"
	    },
	    vehicle = {
	        name = "Veículo",
	        showVehModelName = "Mostrar nome do modelo do veículo",
	        showVehModelNameD = "Quando ativado, você verá o nome do modelo do veículo que pode ser usado para spawna-lo. Caso contrário, você verá o nome do veículo no jogo.",
	        notInVehicle = "Você não está em um veículo.",
	        playerNotInVehicle = "não está em um veículo.",
	        noAccess = "Não foi possível acessar o veículo.",
	        noNearby = "Nenhum veículo encontrado nas proximidades. Spawnando um carro.",
	        driveNearest = "Dirija o veículo NPC mais próximo",
	        driveNearestD = "Teletransporta você para o veículo mais próximo e liga automaticamente o motor para dirigir.",
	        randomUpgrades = "Melhorias aleatórias",
	        randomUpgradesD = "Obtenha melhorias aleatórias para o seu veículo.",
	        clean = "Limpar",
	        cleanD = "Limpe seu veículo da sujeira",
	        speedUpVal = "Valor de aceleração",
	        speedUpValD = "Valor a ser usado para acelerar.",
	        speedUp = "Acelerar",
	        speedUpD = "Acelere seu veículo para frente pelo valor selecionado acima. Use uma tecla de atalho com a opção Hold para usá-la.",
	        stop = "Pare",
	        stopD = "Pare instantaneamente o seu veículo.",
	        plate = "Placa de licença",
	        customPlate = "Texto da placa de licença personalizado",
	        customPlateD = "A placa de licença será alterada para este texto quando a opção abaixo for ativada.",
	        enablePlate = "Ativar placa de licença personalizada",
	        enablePlateD = "Sua placa será alterada para o texto inserido acima em todos os veículos em que você estiver.",
	        empty = "Esvaziar",
	        emptyD = "Esvazie o veículo de todos os ocupantes.",
	        lockDoors = "Trancar portas",
	        killEngine = "Destruir motor",
	        damage = "Dano",
	        repair = "Reparar",
	        EMP = "EMP",
	        engineOff = "Motor desligado",
	        bump = "Colisão",
	        spin = "Rodar",
	        slick = "Liso",
	        slickD = "Faça o veículo perder a aderência por um momento.",
	        launch = "Lançar",
	        tpHigh = "TP alto no céu",
	        sink = "Afundar no oceano",
	        doorsLocked = "Portas trancadas",
	        doorsOpen = "Portas abertas",
	        noFreeSeats = "Sem assentos livres no veículo do jogador. Use a função de dirigir se quiser sequestrar este veículo.",
	        drive = "Dirigir",
	        enter = "Entrar",
	        enterD = "Entre no veículo mirado como passageiro ou motorista se estiver vazio.",
	        upgrade = "Melhoria",
	        upgradeD = "Aplique melhorias aleatórias ao veículo.",
	        launchUp = "Lançar",
	        launchDown = "Forçar para baixo",
	        launchForward = "Lançar para a frente",
	        launchBack = "Lançar de volta",
	        vFlip = "V. Inverter",
	        hFlip = "H. Inverter",
	        randomForce = "força aleatória",
	        randomForceD = "Lance o veículo em uma direção aleatória.",
	        randomShutdowns = "Desligamentos aleatórios do motor",
	        keepEngineOff = "Mantenha o motor desligado",
	        randomUpgradesSettingsD = "Personalize o que pode ser atualizado por meio de atualizações aleatórias.",
	        performance = "Desempenho",
	        bodyParts = "Carroceria",
	        paint = "Cor da tinta",
	        livery = "Estampa",
	        lights = "Cor das luzes",
	        tyreSmoke = "Cor da fumaça do pneu",
	        windowTint = "Cor das janelas",
	        horn = "Buzina",
	        plateType = "Tipo de placa",
	        wheels = "Rodas",
	        neons = "Neons",
	        weaponRoof = "Telhado / Armas",
	        grilleCounter = "Grade / Contramedidas",
	        maxPerformance = "Sempre desempenho máximo",
	        damageSettings = "Configurações de dano",
	        damageSettingsD = "Alternar quais itens estão quebrados ao usar a ação Danificar veículo.",
	        windows = "Quebrar janelas",
	        doors = "Quebrar portas",
	        tyres = "Estourar pneus",
	        smokeEngine = "Fumaça do motor",
	        flyVehicle = "Voar veículo",
	        flyVehicleD = "Também funciona quando você é um passageiro no carro do jogador, mas lento.",
	        flySpeed = "Velocidade de voo",
	        popOnce = "Estoure os pneus uma vez",
	        popOnceD = "Os pneus não serão estourados novamente se já estiverem danificados.",
	        hornBoost = "Boost de buzina",
	        hornJump = "Boost de salto",
	        hornBoostSpeed = "Velocidade de boost de buzina",
	        hornJumpForce = "Força de boost de buzina",
	        spawnRandom = "Spawnar veículo aleatório",
	        hornExplosions = "Explosões de buzina",
	        autoUpgrade = "Aplicar melhorias aleatórias automaticamente",
	        autoUpgradeD = "Aplicar melhorias automaticamente quando entrar em um veículo como motorista",
	        glitch = "Glitch"
	    },
	    teleport = {
	        name = "Teletransporte",
	        tpToWp = "TP to marcação/objetivo",
	        tpToWpD = "Teletransporta você para a marcação ou objetivo da missão.",
	        tpFwdDist = "Distância de teletransporte para a frente",
	        tpFwdForceGround = "Teletransportar força de avanço terrestre",
	        tpFwdForceGroundD = "Quando ativado, você deve ser teletransportado para a posição no solo. Útil quando você costuma se teletransportar abaixo do mapa ou dentro de um interior.",
	        keepSpeed = "Manter a velocidade",
	        keepSpeedD = "Mantém sua velocidade após o teletransporte em vez de ser parado.",
	        tpFwd = "Teleporte para frente",
	        tpToRandomPlayer = "Teleporte para um jogador aleatório",
	        tpInVehicle = "Teleporte no veículo se for motorista"
	    },
	    world = {
	        name = "Mundo",
	        clearAreaSettings = "Limpar configurações de área",
	        vehicles = "Veículos",
	        vehiclesD = "Limpe todos os veículos, exceto os jogadores e o seu.",
	        peds = "Peds",
	        pedsD = "Limpe todos os peds, exceto os jogadores.",
	        objects = "Objetos",
	        objectsD = "Limpe todos os objetos.",
	        clearArea = "'Limpar área'",
	        clearAreaD = "Limpe a área próxima de todas as entidades escolhidas por você.",
	        noSelection = "Você não selecionou nenhuma entidade para limpar.",
	        clearAreaLoop = "Loop de área limpa",
	        manipulateArea = "Manipular área",
	        manipulateAreaD = "Execute as ações selecionadas em um loop em pedestres/veículos dentro do intervalo escolhido.",
	        manipulateAreaSettings = "Manipular configurações de área",
	        manipulateAreaActions = "Manipular ações de área",
	        dropCasino = "Dropar figuras do Casino",
	        dropCards = "Dropar cartas",
	        giveAmmo = "Dar munição"
	    },
	    online = {
	        name = "Online",
	        stopSpec = "Stop spectating",
	        stopSpecD = "Stop spectating any player.",
	        sorting = {
	            Distance = "Distância",
	            Rank = "Nível",
	            Money = "Dinheiro",
	            KD = "KD",
	            Name = "Nome",
	            ["Host position"] = "posição de host",
	            Language = "Linguagem"
	        },
	        aimInfo = "Informações de mira do jogador",
	        aimInfoD = "Configurações para informações de mira do jogador para mostrar quem está mirando em você e qual arma ele está usando. Não funciona para armas de veículos.",
	        showAimInfo = "Mostrar informações de mira do jogador",
	        displayTime = "Tempo de exibição",
	        displayTimeD = "Duração em que as informações de mira serão exibidas.",
	        aimInfoExample = "Exemplo de exibição",
	        aimInfoExampleD = "Mostrar exemplo das informações de objetivo.",
	        playerList = "Lista de jogadores",
	        enablePlayerList = "Habilitar lista online",
	        showYourself = "Mostrar você mesmo",
	        showTags = "Mostrar tags",
	        showDistance = "Mostrar distância",
	        showRank = "Mostrar nível",
	        showKD = "Mostrar KD",
	        showWanted = "Mostrar nível de procurado",
	        showMoney = "Mostrar dinheiro",
	        showVehicle = "Mostrar nome do veículo",
	        showLanguage = "Mostrar idioma",
	        maxPlayers = "máximo de jogadores",
	        hideInterior = "Ocultar jogadores em um interior",
	        interiorLast = "Jogadores em um interior no final",
	        colNum = "Número de colunas",
	        mainColor = "Cor Principal",
	        interiorColor = "Cor do jogador em um interior",
	        deadColor = "Cor do jogador morto",
	        modderColor = "Cor do modder",
	        OTRcolor = "Cor do jogador fora do radar",
	        showOrgColors = "Mostrar cores da organização",
	        killersList = "Lista de quem matou você",
	        killersListD = "Lista de jogadores que mataram você e opções de vingança.",
	        killers = "Assassinos",
	        showSpeed = "Mostrar velocidade do veículo",
	        speedAbove = "Mostrar velocidade do veículo acima de",
	        showInterior = "Mostrar nome do interior",
	        clearAfterPayback = "Limpar lista após a vingança",
	        payback = "Vingança",
	        paybackD = "Faça uma ação selecionada em todos os jogadores que o mataram.",
	        rChat = "Bate-papo Rockstar",
	        rVerified = "Rockstar verificado",
	        esp = "ESP",
	        maxDist = "Distância máxima",
	        showWeapon = "Mostrar arma",
	        inVehicle = "No veículo",
	        showInMyVehicle = "Mostrar jogadores no meu veículo",
	        showInMyVehicleD = "Mostre ESP para jogadores em seu veículo quando você estiver dirigindo.",
	        showHealth = "Mostrar vida",
	        showArmor = "Mostrar armadura",
	        showOnlyNearby = "Mostrar apenas jogadores próximos",
	        nearbyMaxDist = "Distância máxima dos jogadores próximos",
	        showBounty = "Mostrar recompensa",
	        forceHost = "Forçar host da sessão ",
	        forceHostD = "Expulse os jogadores que são os próximos na fila de host para se tornarem o host da sessão. A posição na fila mostrada acima significa que o mesmo número de jogadores será kickado. Se alguém na fila for seu amigo, a ação não acontecerá e ninguém será kickado.",
	        forceHostSuccess = "Sucesso, agora você é o host da sessão.",
	        forceHostFailFriend = "Falha, um dos jogadores na fila é seu amigo. Forçar o host da sessão é impossível até que seu amigo entre novamente na sessão com um índice de fila de host mais alto.",
	        forceHostFailHost = "Você já é o host da sessão.",
	        currentHostQueuePos = "Posição atual na fila: ",
	        bgOptions = "Opções de plano de fundo",
	        forceVisible = "Forçar jogadores visíveis",
	        forceVisibleD = "Isso tornará todos os peds do jogador visíveis, mesmo quando estiverem em estado de carregamento ou quando o modder usar a invisibilidade. Somente localmente.",
	        allPlayers = "Todos os jogadores",
	        randomBlameKills = "Culpar jogador aleatório por morto",
	        playerKicker = "Expulsar Jogadores",
	        playerKickerD = "Expulsar jogadores com base em fatores selecionados ou forçar a se tornar o host da sessão.",
	        autoKick = "Expulsar automaticamente",
	        kickFactors = "Fatores para expulsar",
	        languages = "línguas",
	        languagesD = "Jogadores com idiomas selecionados serão expulsos.",
	        adminColor = "Cor do admin ",
	        modderAdminColor = "Cor do admin ou mooder",
	        selfColor = "A minha cor",
	        godColor = "Cor do jogador com godmode",
	        friendColor = "Cor do amigo",
	        attackerColor = "Cor do atacante",
	        hostColor = "Cor do host",
	        sHostColor = "Cor do scripthost",
	        kickLevel = "Expulsar nível",
	        kickLevelAbove = "Expulsar quando nível acima de",
	        kickKD = "Expulsar KD",
	        kickKDAbove = "Expulsar quando KD acima de",
	        kickMoney = "Expulsar dinheiro",
	        kickMoneyAbove = "Expulsar quando acima X milhões"
	    },
	    self = {
	        name = "Você",
	        randomOutfit = "Obter roupa de jogador aleatório",
	        randomOutfitD = "Copie a roupa de um jogador aleatório no lobby.",
	        instantRespawn = "Renascimento instantâneo após a morte",
	        noBounty = "Evite recompensas",
	        noBountyD = "Remova constantemente quaisquer recompensas colocadas em você."
	    },
	    aim = {
	        name = "Ações de mira",
	        nameD = "Ações que podem ser acionadas ao mirar em entidades. Defina uma tecla de atalho para cada ação desejada e, em seguida, simplesmente aponte para a entidade e use a tecla de atalho para acionar a ação. Nota: mirar com a arma equipada dá maior alcance.",
	        peds = "Peds",
	        objects = "Objetos",
	        teleport = "Teletransporte de mira",
	        teleportD = "Teleporte para o local que você está mirando.",
	        reviveOnlyDead = "Ped está vivo. Você só pode reviver peds mortos. mirando.",
	        disarm = "Desarmar",
	        heal = "Curar",
	        healD = "Cure e dê armadura ao jogador alvo ou reviva um ped morto.",
	        moveTo = "Mover para...",
	        move = "Mover",
	        moveObjD = "Aponte para um objeto que deseja mover e pressione a tecla de atalho. Em seguida, aponte para a posição em que deseja colocar o objeto e pressione a tecla de atalho novamente. O objeto será perdido se você se afastar muito do original.",
	        moveVehD = "Mire em um veículo que você deseja mover e pressione a tecla de atalho. Em seguida, mire na posição em que deseja colocar o veículo e pressione a tecla de atalho novamente.",
	        aimBeam = "Feixe de mira",
	        useBeam = "Usar feixe",
	        useBeamD = "Atire no tipo de bala selecionado para onde sua câmera está apontada. Use uma tecla de atalho com a opção Hold para usá-la.",
	        noAssignedHotkeysPeds = "Nenhuma tecla de atalho atribuída para ações de mira ped",
	        noAssignedHotkeysVehs = "Nenhuma tecla de atalho atribuída para ações de mira do veículo",
	        ped = "Ped",
	        aimLock = "Travar mira",
	        aimLockLastTarget = "Travar mira no último alvo",
	        aimLockLastTargetD = "Quando ativado, seu último veículo ou pedestre apontado será interativo pelo período de tempo definido. A interação é possível quando você para de mirar. É útil quando o alvo se move rapidamente ou está longe, para que você não precise mirar nele o tempo todo. Mirar em um veículo/pedal diferente com trava de mira ativa mudará o alvo de trava de mira.",
	        lockTime = "tempo de travamento",
	        lockTimeD = "0 irá travar a mira no último alvo até que seja perdido pelo jogo ou deletado. Você também pode usar a ação abaixo para remover o bloqueio do alvo.",
	        removeAimLock = "Remover trava de mira",
	        removeAimLockD = "Remover trava de mira",
	        hotkeysPos = "Teclas de atalho/posição do nome",
	        hotkeysColor = "Teclas de atalho/cor do nome",
	        showHotkeys = "Mostrar teclas de atalho",
	        lineColor = "Cor da linha",
	        hgColor = "Cor de destaque",
	        showLine = "Mostrar linha para alvo",
	        hgTarget = "Alvo de destaque",
	        showBeacon = "Mostrar farol AR para teletransporte de mira",
	        markSettings = "Marcar configurações",
	        markColor = "cor da marca",
	        markedActionPed = "Ação de peds marcados",
	        markedActionVeh = "Ação de veículos marcados",
	        triggerMarkAction = "Ação de gatilho",
	        keepMark = "Mantenha os alvos marcados após a ação",
	        unmarkAll = "Desmarcar tudo",
	        markActions = {
	            shoot = "Disparar",
	            explode = "Explodir",
	            damage = "Dano",
	            emp = "EMP",
	            atomize = "Atomizar",
	            fireworks = "Fogos de artifício",
	            burn = "Queimar",
	            randForce = "Força aleatória"
	        },
	        showName = "Mostrar nome",
	        showNameD = "Mostre o nome do veículo e o nome do jogador (se aplicável) na entidade mirada.",
	        noDriver = "Nenhum motorista no veículo.",
	        noVehicle = "Ped não está em um veículo.",
	        selectDriver = "Selecione o motorista",
	        selectDriverD = "Mova a trava de mira para o motorista do veículo se quiser executar ações de mira no motorista.",
	        selectVehicle = "Selecione o veículo",
	        selectVehicleD = "Mova a trava de mira para o veículo do pedestre se quiser executar ações de mira no veículo.",
	        selectCurrentVehicle = "Selecione o veículo atual",
	        selectCurrentVehicleD = "Mova a trava de mira para o veículo atualmente dirigido.",
	        enableAimActions = "Ativar ações de mira",
	        enableAimActionsD = "Você pode definir uma tecla de atalho para isso e habilitar o modo \"Hold\" nela. Assim você poderá usar ações de mira apenas enquanto segura a tecla configurada, o que pode te ajudar a evitar chamar algumas ações por engano ao usar teclas também usadas pelo jogo. Você também pode remover a trava de mira do alvo pressionando a tecla configurada enquanto não estiver mirando.",
	        enableAimHotkey = "Ativar tecla de atalho de mira",
	        enableAimHotkeyD = "Quando ativado, você pode usar a tecla de atalho atribuída a \"Ativar ações de mira\" para todos os recursos relacionados à mira em vez de mirar. Ativar isso sem usar uma tecla de atalho na alternância acima não é recomendado porque executará constantemente todas as funções de mira."
	    },
	    player = {
	        players = "Jogadores",
	        player = "Jogador",
	        playersD = "Atalho para a seção de jogadores online.",
	        follow = "Seguir",
	        followD = "Constantemente se teletransporta para o jogador.",
	        friendly = "Amigáveis",
	        trolling = "Troll",
	        malicious = "Malicioso",
	        fixLoading = "Corrigir tela de carregamento",
	        fixLoadingD = "Tente consertar a tela de carregamento infinita do jogador, dando a ele um host de script e se teletransportando para o apartamento mais próximo.",
	        carCrash = "Acidente de carro",
	        carCrashD = "Isso também irá travar os jogadores perto do alvo!",
	        killPassive = "Matar jogador passivo",
	        killInterior = "Matar jogador em um interior",
	        killInteriorD = "Não funciona em todos os lugares.",
	        notInInterior = "não está em um interior.",
	        dumpAll = "Despejar tudo no player",
	        dumpAllD = "Teleporte todas as entidades para a localização do jogador.",
	        sounds = "Sons",
	        soundsD = "Abaixe o volume se estiver perto do player!",
	        earsRaper = "arrebenta orelhas",
	        yacht = "Buzina de iate",
	        airAct = "Defesas aéreas ativadas",
	        airDeact = "Defesas aéreas desativadas",
	        hackFailed = "Hack falhou",
	        hackSuccess = "Hack com successo",
	        powerDown = "Desligar",
	        beeping = "Beep",
	        buzz = "campainha de porta",
	        flameJet = "Jato de chama",
	        waterJet = "Jato de água",
	        hydrantFlood = "inundação hidrante",
	        changeNPCCLones = "Alterar NPC para clones",
	        kickFromEveryVehicle = "Kick de cada veículo",
	        deleteVehicleLoop = "Excluir loop do veículo",
	        makeWanted = "Tornar procurado",
	        makeWantedLevel = "Nível de procurado",
	        placeBounty = "Colocar recompensa",
	        bountyAmount = "Valor da recompensa",
	        bountyLoop = "Colocar loop de recompensa",
	        bountyLoopD = "Coloque recompensa automaticamente no jogador toda vez que ele morrer.",
	        cageType = "Tipo de jaula",
	        clonedPedTask = "Tarefa ped clonada",
	        makeWantedLoop = "Fazer loop de procurado",
	        ceoMoney = "dinheiro do CEO ",
	        dropPQ = "Dropar lanches",
	        otr = "Fora do radar ",
	        neverWanted = "Nunca procurado",
	        giveAllWeapons = "Dar todas as armas"
	    },
	    interior = {
	        interior = "Interior",
	        barber = "Barbeiro",
	        lsCarMeet = "Evento de carros LS",
	        benny = "Benny's",
	        kosatkaMissile = "Kosataka míssil teleguiado",
	        kosatka = "Kosatka",
	        pentGarage = "Garagem da Penthouse",
	        musicLocker = "Music Locker",
	        casino = "Casino",
	        casinoGarage = "Garagem do Casino ",
	        eclipseTowers = "Eclipse Towers",
	        autoShop = "Oficina de tuning",
	        arena = "Arena",
	        subMission = "Missão do Submarino",
	        facility = "Instalação",
	        avenger = "Avenger",
	        beeker = "Beeker's",
	        penthouse = "Penthouse",
	        cayoPerico = "Cayo Perico",
	        ussLex = "USS Lexington",
	        arcade = "Fliperama",
	        docForgery = "Falsificação de documento",
	        mcClub = "Motoclube",
	        counterfeitCash = "Dinheiro falso",
	        vehWarehouse = "Depósito de Veículos",
	        ammuNation = "Ammu-Nation",
	        methLab = "laboratório de metanfetamina",
	        cocaineLockup = "Detenção de cocaína",
	        weedFarm = "Fazenda de weed",
	        moc = "MOC",
	        tenCarGarage = "10-Carros Garagem",
	        fiftyCarGarage = "50-Carros Garagem",
	        bunker = "Bunker",
	        fib = "Prédio FIB",
	        agency = "Agência",
	        agencyGarage = "Garagem da Agência",
	        lsc = "LSC",
	        mazeTower = "Maze Tower",
	        hangar = "Hangar",
	        nightclub = "Boate",
	        nightclubBasement = "Porão Boate",
	        mazeBuilding = "Maze Prédio",
	        terrorbyte = "Terrorbyte",
	        lombank = "Lombank Prédio",
	        arcadius = "Arcadius Prédio",
	        loading = "Carregando",
	        apart = "Apartamento",
	        delPerro = "Del Perro",
	        fourWay = "4 Integrity Way",
	        yacht = "Iate",
	        clothes = "Loja de roupas",
	        tattoo = "Tatuagens",
	        strip = "clube de striptease",
	        twoCarGarage = "2-Carros Garagem",
	        sixCarGarage = "6-Carros Garagem",
	        alta = "3 Alta St",
	        tinsel = "Tinsel Towers",
	        richards = "Richards Majestic",
	        weazel = "Weazel Plaza",
	        masks = "Loja de máscaras"
	    }
	}	local languages = {"en", "zh", "pt"}
	local translations = {
	    en = engTranslations,
	    zh = zhTranslations,
	    pt = ptTranslations
	}
	function merge(t1, t2)
	    for k, v in pairs(t2) do
	        if (type(v) == "table") and (type(t1[k] or false) == "table") then
	            merge(t1[k], t2[k])
	        else
	            t1[k] = v
	        end
	    end
	    return t1
	end
	if table.contains(languages, lang.get_current()) then
	    return merge(translations.en, translations[lang.get_current()])
	else
	    return translations.en
	end
end
package.loaded["src.lib.translations"] = nil
package.preload["src.lib.menus.online.esp"] = function(...)
	local enabled, enableOnAim = false, false
	local xValue, yValue, scaleValue = 0, 0, 50
	local color = CONSTANTS.SCRIPT.COLORS.ESP
	local maxDistance = 400
	local showDistance, showWanted, showRank, showLanguage, showName, showTags, showHealth, showArmor, showKD, showMoney, showWeapon, showInMyVehicle, showVehicle, showSpeed,
	    hideInterior, showBounty = true, false, false, false, true, true, false, false, false, false, true, true, true, false, false, false	local function getName(pid, inVehicle)
	    local value = ""
	    if showName or inVehicle then
	        value = Player.getPlayerName(pid)
	    end
	    local tags = ""
	    if showTags then
	        tags = players.get_tags_string(pid)
	    end
	    if (showTags or inVehicle) and tags:len() > 0 then
	        value = value .. " [" .. tags .. "]"
	    end
	    local preName = ""
	    if not inVehicle then
	        if showWanted then
	            local wanted = Player.getWantedLevel(pid)
	            if wanted > 0 then
	                preName = wanted .. "* "
	            end
	        end
	        if showRank then
	            preName = preName .. "(" .. Player.getPlayerRank(pid) .. ") "
	        end
	    end
	    if showLanguage then
	        preName = preName .. "[" .. Player.getLanguage(pid) .. "] "
	    end
	    return preName .. value
	end
	local gameX, gameY = memory.alloc(1), memory.alloc(1)
	local function renderESP()
	    if not enabled or UND_gameMenuOpen or not util.is_session_started() then
	        return
	    end
	    if enableOnAim and not Player.isUserAiming() then
	        return
	    end
	    local myPed = Player.getPlayerPed()
	    local myPos = Player.getPlayerPosition()
	    for _, pid in players.list(false) do
	        local ped = Player.getPlayerPed(pid)
	        if Player.isDead(pid) or not ENTITY.IS_ENTITY_ON_SCREEN(ped) or
	            (hideInterior and Player.getInterior(pid) and not table.contains({"cayoPerico", "ussLex"}, Player.getInterior(pid))) then
	            goto continue
	        end
	        local pPos = Player.getPlayerPosition(pid)
	        local dist = v3.distance(myPos, pPos)
	        if dist > maxDistance then
	            goto continue
	        end
	        local vehicle = Ped.getVehicle(ped)
	        local isMyVehicle = false
	        if vehicle then
	            local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1)
	            if driver ~= ped and driver ~= myPed and PED.IS_PED_A_PLAYER(driver) then
	                goto continue
	            elseif driver == myPed then
	                if not showInMyVehicle then
	                    goto continue
	                end
	                isMyVehicle = true
	            end
	        end
	        local posToUse = pPos
	        if vehicle and not isMyVehicle then
	            posToUse = ENTITY.GET_ENTITY_COORDS(vehicle)
	        end
	        GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(posToUse.x, posToUse.y, posToUse.z + 1, gameX, gameY)
	        local screenX, screenY = memory.read_float(gameX), memory.read_float(gameY)
	        local valuesToDisplay = {}
	        local playersInVehicle = ""
	        if vehicle and not isMyVehicle then
	            local maxPassengers = VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle)
	            for i = 0, maxPassengers do
	                if not VEHICLE.IS_VEHICLE_SEAT_FREE(vehicle, i, false) then
	                    local ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, i)
	                    if PED.IS_PED_A_PLAYER(ped) then
	                        playersInVehicle = playersInVehicle .. getName(Network.getPlayerFromPed(ped), true) .. ", "
	                    end
	                end
	            end
	        end
	        if showDistance then
	            valuesToDisplay[#valuesToDisplay + 1] = math.floor(dist)
	        end
	        local nameLine = getName(pid)
	        if nameLine:len() > 0 then
	            valuesToDisplay[#valuesToDisplay + 1] = nameLine
	        end
	        if playersInVehicle:len() > 0 then
	            valuesToDisplay[#valuesToDisplay + 1] = UND_translations.online.inVehicle .. ": " .. playersInVehicle:gsub(", $", "")
	        end
	        if showHealth or showArmor then
	            local hpData = Ped.getHealth(ped)
	            local textLine = ""
	            if showHealth then
	                textLine = "H: " .. hpData.health .. "/" .. hpData.maxHealth .. " "
	            end
	            if showArmor then
	                textLine = textLine .. "A: " .. hpData.armor .. "/50"
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
	        if showBounty and players.get_bounty(pid) then
	            valuesToDisplay[#valuesToDisplay + 1] = "$$" .. players.get_bounty(pid)
	        end
	        if showMoney or showKD then
	            local textLine = ""
	            if showKD then
	                textLine = "KD" .. Player.getKD(pid) .. " "
	            end
	            if showMoney then
	                textLine = textLine .. "$" .. Player.getMoney(pid, true)
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
	        if showWeapon then
	            local weapon = Ped.getWeapon(ped)
	            if weapon then
	                valuesToDisplay[#valuesToDisplay + 1] = weapon
	            end
	        end
	        if (showVehicle or showSpeed) and vehicle then
	            local textLine = ""
	            if showVehicle then
	                textLine = Vehicle.getName(players.get_vehicle_model(pid)) .. " "
	            end
	            if showSpeed and Utils.getSpeed(vehicle, true) > 1 then
	                textLine = textLine .. Utils.getSpeed(vehicle)
	            end
	            valuesToDisplay[#valuesToDisplay + 1] = textLine
	        end
	        local text = table.concat(valuesToDisplay, "\n")
	        directx.draw_text(screenX + xValue, screenY + yValue, text, 5, scaleValue, color)
	        ::continue::
	    end
	end	local function setupESPMenu(sessionMenu)
	    if UND_privateMode then
	        showSpeed = true
	        showWanted = true
	        showRank = true
	        showLanguage = true
	        showHealth = true
	        hideInterior = true
	        showBounty = true
	        enabled = true
	    end
	    local espMenu = menu.list(sessionMenu, UND_translations.online.esp, {}, "")
	    local enabledToggle = menu.toggle(espMenu, UND_translations.general.enabled, {Utils.getCommandName("espenable")}, "", function(on)
	        enabled = on
	    end, enabled)
	    enabled = menu.get_value(enabledToggle)
	    local enableOnAimToggle = menu.toggle(espMenu, UND_translations.general.enableOnAimOnly, {Utils.getCommandName("esponaim")}, "", function(on)
	        enableOnAim = on
	    end, enableOnAim)
	    enableOnAim = menu.get_value(enableOnAimToggle)
	    local hideInteriorToggle = menu.toggle(espMenu, UND_translations.online.hideInterior, {Utils.getCommandName("esphideinterior")}, "", function(on)
	        hideInterior = on
	    end, hideInterior)
	    hideInterior = menu.get_value(hideInteriorToggle)
	    local positionSubmenu = menu.list(espMenu, UND_translations.general.position, {}, UND_translations.general.positionD)
	    local xSlider = menu.slider(positionSubmenu, UND_translations.general.hPos, {Utils.getCommandName("esphpos")}, "", -10, 10, xValue, 1, function(val)
	        xValue = val / 100
	    end)
	    xValue = menu.get_value(xSlider) / 100
	    local ySlider = menu.slider(positionSubmenu, UND_translations.general.vPos, {Utils.getCommandName("espvpos")}, "", -10, 10, yValue, 1, function(val)
	        yValue = val / 100
	    end)
	    yValue = menu.get_value(ySlider) / 100
	    local scaleSlider = menu.slider(positionSubmenu, UND_translations.general.scale, {Utils.getCommandName("espscale")}, "", 1, 200, scaleValue, 1, function(val)
	        scaleValue = val / 100
	    end)
	    scaleValue = menu.get_value(scaleSlider) / 100
	    menu.colour(espMenu, UND_translations.general.color, {Utils.getCommandName("espcolor")}, "", color, true, function(c)
	        color = c
	    end)
	    local maxDistSlider = menu.slider(espMenu, UND_translations.online.maxDist, {Utils.getCommandName("espmaxdist")}, "", 5, 10000, maxDistance, 5, function(val)
	        maxDistance = val
	    end)
	    maxDistance = menu.get_value(maxDistSlider)
	    local distToggle = menu.toggle(espMenu, UND_translations.online.showDistance, {Utils.getCommandName("espdistance")}, "", function(on)
	        showDistance = on
	    end, showDistance)
	    showDistance = menu.get_value(distToggle)
	    local wantedToggle = menu.toggle(espMenu, UND_translations.online.showWanted, {Utils.getCommandName("espwanted")}, "", function(on)
	        showWanted = on
	    end, showWanted)
	    showWanted = menu.get_value(wantedToggle)
	    local rankToggle = menu.toggle(espMenu, UND_translations.online.showRank, {Utils.getCommandName("esprank")}, "", function(on)
	        showRank = on
	    end, showRank)
	    showRank = menu.get_value(rankToggle)
	    local langToggle = menu.toggle(espMenu, UND_translations.online.showLanguage, {Utils.getCommandName("esplang")}, "", function(on)
	        showLanguage = on
	    end, showLanguage)
	    showLanguage = menu.get_value(langToggle)
	    local nameToggle = menu.toggle(espMenu, UND_translations.aim.showName, {Utils.getCommandName("espname")}, "", function(on)
	        showName = on
	    end, showName)
	    showName = menu.get_value(nameToggle)
	    local tagsToggle = menu.toggle(espMenu, UND_translations.online.showTags, {Utils.getCommandName("esptags")}, "", function(on)
	        showTags = on
	    end, showTags)
	    showTags = menu.get_value(tagsToggle)
	    local hpToggle = menu.toggle(espMenu, UND_translations.online.showHealth, {Utils.getCommandName("esphealth")}, "", function(on)
	        showHealth = on
	    end, showHealth)
	    showHealth = menu.get_value(hpToggle)
	    local armorToggle = menu.toggle(espMenu, UND_translations.online.showArmor, {Utils.getCommandName("esparmor")}, "", function(on)
	        showArmor = on
	    end, showArmor)
	    showArmor = menu.get_value(armorToggle)
	    local kdToggle = menu.toggle(espMenu, UND_translations.online.showKD, {Utils.getCommandName("espkd")}, "", function(on)
	        showKD = on
	    end, showKD)
	    showKD = menu.get_value(kdToggle)
	    local bountyToggle = menu.toggle(espMenu, UND_translations.online.showBounty, {Utils.getCommandName("espbounty")}, "", function(on)
	        showBounty = on
	    end, showBounty)
	    showBounty = menu.get_value(bountyToggle)
	    local moneyToggle = menu.toggle(espMenu, UND_translations.online.showMoney, {Utils.getCommandName("espmoney")}, "", function(on)
	        showMoney = on
	    end, showMoney)
	    showMoney = menu.get_value(moneyToggle)
	    local weaponToggle = menu.toggle(espMenu, UND_translations.online.showWeapon, {Utils.getCommandName("espweapon")}, "", function(on)
	        showWeapon = on
	    end, showWeapon)
	    showWeapon = menu.get_value(weaponToggle)
	    local myVehicleToggle = menu.toggle(espMenu, UND_translations.online.showInMyVehicle, {Utils.getCommandName("espinmyvehicle")}, UND_translations.online.showInMyVehicleD,
	        function(on)
	            showInMyVehicle = on
	        end, showInMyVehicle)
	    showInMyVehicle = menu.get_value(myVehicleToggle)
	    local vehicleToggle = menu.toggle(espMenu, UND_translations.online.showVehicle, {Utils.getCommandName("espvehicle")}, "", function(on)
	        showVehicle = on
	    end, showVehicle)
	    showVehicle = menu.get_value(vehicleToggle)
	    local speedToggle = menu.toggle(espMenu, UND_translations.online.showSpeed, {Utils.getCommandName("espspeed")}, "", function(on)
	        showSpeed = on
	    end, showSpeed)
	    showSpeed = menu.get_value(speedToggle)
	    util.create_tick_handler(renderESP)
	end
	return setupESPMenu
end
package.loaded["src.lib.menus.online.esp"] = nil
package.preload["src.lib.menus.aim.vehicle"] = function(...)
	local _Raycast = CONSTANTS.RAYCAST
	local function drive()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    Vehicle.drive(aimResult.vehicle)
	end
	local function enter()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    Vehicle.enter(aimResult.vehicle)
	end
	local function damage()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.damage(aimResult.vehicle)
	    end
	end
	local function explode()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.explode(aimResult.vehicle)
	    end
	end
	local function randomExplode()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.explode(aimResult.vehicle, true)
	    end
	end
	local function airstrike()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.airstrike(aimResult.vehicle)
	    end
	end
	local function glitch()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.glitch(aimResult.vehicle)
	    end
	end
	local function burn()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.burn(aimResult.vehicle)
	    end
	end
	local function killEngine()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.killEngine(aimResult.vehicle)
	    end
	end
	local function delete()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Utils.deleteEntity(aimResult.vehicle)
	    end
	end
	local function clone()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.clone(aimResult.vehicle)
	    end
	end
	local function repair()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.repairVehicle(aimResult.vehicle)
	    end
	end	local function setGod(enabled)
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.toggleVehicleGodMode(aimResult.vehicle, enabled)
	    end
	end
	local function turnOffEngine()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.turnOffEngine(aimResult.entity)
	    end
	end
	local function randomUpgrade()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.randomUpgradeForVehicle(aimResult.vehicle)
	    end
	end
	local function stop()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.stop(aimResult.vehicle)
	    end
	end
	local function spin()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.spin(aimResult.entity)
	    end
	end
	local function launch(direction)
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.launch(aimResult.entity, direction)
	    end
	end
	local function empty()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.empty(aimResult.vehicle)
	    end
	end	local function flip(horizontal)
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.flip(aimResult.vehicle, horizontal)
	    end
	end
	local function emp()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.emp(aimResult.vehicle)
	    end
	end
	local function slick()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.slick(aimResult.vehicle)
	    end
	end
	local function bump()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.bump(aimResult.vehicle)
	    end
	end
	local function randomLaunch()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.randomLaunch(aimResult.vehicle)
	    end
	end
	local function toggleInvisible()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Vehicle.toggleInvisible(aimResult.vehicle)
	    end
	end
	local function openStand()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    elseif not aimResult.player then
	        Utils.showToast(UND_translations.general.onlyPlayers)
	        return
	    end
	    menu.trigger_commands("p" .. Player.getPlayerName(aimResult.player, true))
	end
	local movedVehicle = 0
	local function move()
	    if UND_currentlyMovedObject == 1 then
	        return
	    end
	    if movedVehicle > 0 then
	        local aimResult = Raycast.getPlayerAimData()
	        if not aimResult then
	            return
	        elseif not Network.requestControl(movedVehicle) then
	            movedVehicle = 0
	            return
	        end
	        local coords = aimResult.coords
	        ENTITY.SET_ENTITY_COORDS(movedVehicle, coords.x, coords.y, coords.z, false, false, false)
	        movedVehicle = 0
	        util.yield()
	        UND_currentlyMovedObject = 0
	        return
	    end
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    movedVehicle = aimResult.entity
	    UND_currentlyMovedObject = 2
	    util.create_tick_handler(function()
	        if movedVehicle == 0 then
	            return false
	        end
	        directx.draw_text(0.5, 0.8, UND_translations.aim.moveTo, 5, 0.6, {
	            r = 1,
	            g = 1,
	            b = 1,
	            a = 1
	        }, false)
	    end)
	end
	local function tpToMe()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    Vehicle.tpToPlayer(aimResult.entity)
	end
	local function tpToVehicle()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    Vehicle.tpToVehicle(aimResult.entity)
	end
	local function freeze()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    Vehicle.freeze(aimResult.vehicle, true)
	end
	local function rotate()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    Vehicle.rotate(aimResult.vehicle)
	end
	local function unfreeze()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    Vehicle.freeze(aimResult.vehicle, false)
	end
	local function atomize()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    Vehicle.atomize(aimResult.entity)
	end
	local function firework()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    Vehicle.fireworks(aimResult.entity)
	end
	local function ram()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if aimResult then
	        Entity.ram(aimResult.entity)
	    end
	end
	local function toggleMark()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    local idx = Utils.getTableIdx(UND_markedTargets, aimResult.entity)
	    if idx then
	        table.remove(UND_markedTargets, idx)
	    else
	        table.insert(UND_markedTargets, aimResult.entity)
	    end
	end
	local function selectDriver()
	    local aimResult = Raycast.getPlayerAimData(_Raycast.TraceFlag.vehicles)
	    if not aimResult then
	        return
	    end
	    local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(aimResult.entity, -1)
	    if driver == 0 then
	        Utils.showToast(UND_translations.aim.noDriver)
	        return
	    end
	    local player = Network.getPlayerFromPed(driver)
	    if player == -1 then
	        player = nil
	    end
	    UND_aimLockEndTime = Utils.getTime(UND_aimLockTime * 1000)
	    UND_aimLockEntity = {
	        entity = driver,
	        isPed = true,
	        player = player
	    }
	end	local function setupVehicleAimActions(aimVehicleSubmenu)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.drive, {}, "", drive)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.enter, {}, UND_translations.vehicle.enterD, enter)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.damage, {}, "", damage)
	    menu.action(aimVehicleSubmenu, UND_translations.general.explode, {}, "", explode)
	    menu.action(aimVehicleSubmenu, UND_translations.general.randomExplosion, {}, "", randomExplode)
	    menu.action(aimVehicleSubmenu, UND_translations.general.airstrike, {}, "", airstrike)
	    menu.action(aimVehicleSubmenu, UND_translations.general.burn, {}, "", burn)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.killEngine, {}, "", killEngine)
	    menu.action(aimVehicleSubmenu, UND_translations.general.delete, {}, "", delete)
	    menu.action(aimVehicleSubmenu, UND_translations.general.clone, {}, "", clone)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.repair, {}, "", repair)
	    menu.action(aimVehicleSubmenu, UND_translations.general.setGod, {}, "", function()
	        setGod(true)
	    end)
	    menu.action(aimVehicleSubmenu, UND_translations.general.removeGod, {}, "", function()
	        setGod(false)
	    end)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.engineOff, {}, "", turnOffEngine)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.upgrade, {}, UND_translations.vehicle.upgradeD, randomUpgrade)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.stop, {}, "", stop)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.spin, {}, "", spin)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.launchUp, {}, "", function()
	        launch("up")
	    end)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.launchDown, {}, "", function()
	        launch("down")
	    end)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.launchForward, {}, "", function()
	        launch("forward")
	    end)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.launchBack, {}, "", function()
	        launch("back")
	    end)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.empty, {}, UND_translations.vehicle.emptyD, empty)
	    menu.action(aimVehicleSubmenu, UND_translations.general.openInStand, {}, "", openStand)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.vFlip, {}, "", function()
	        flip(false)
	    end)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.hFlip, {}, "", function()
	        flip(true)
	    end)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.EMP, {}, "", emp)
	    menu.action(aimVehicleSubmenu, UND_translations.aim.move, {}, UND_translations.aim.moveVehD, move)
	    menu.action(aimVehicleSubmenu, UND_translations.general.tpToMe, {}, "", tpToMe)
	    menu.action(aimVehicleSubmenu, UND_translations.general.tpToIt, {}, "", tpToVehicle)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.slick, {}, UND_translations.vehicle.slickD, slick)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.bump, {}, "", bump)
	    menu.action(aimVehicleSubmenu, UND_translations.general.ram, {}, "", ram)
	    menu.action(aimVehicleSubmenu, UND_translations.general.freeze, {}, "", freeze)
	    menu.action(aimVehicleSubmenu, UND_translations.general.unfreeze, {}, "", unfreeze)
	    menu.action(aimVehicleSubmenu, UND_translations.general.rotate, {}, "", rotate)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.randomForce, {}, UND_translations.vehicle.randomForceD, randomLaunch)
	    menu.action(aimVehicleSubmenu, UND_translations.vehicle.glitch, {}, "", glitch)
	    menu.action(aimVehicleSubmenu, UND_translations.general.toggleInv, {}, "", toggleInvisible)
	    menu.action(aimVehicleSubmenu, UND_translations.general.toggleMark, {}, UND_translations.general.toggleMarkD, toggleMark)
	    menu.action(aimVehicleSubmenu, UND_translations.general.atomize, {}, "", atomize)
	    menu.action(aimVehicleSubmenu, UND_translations.general.fireworks, {}, "", firework)
	    menu.action(aimVehicleSubmenu, UND_translations.aim.selectDriver, {}, UND_translations.aim.selectDriverD, selectDriver)
	end
	return setupVehicleAimActions
end
package.loaded["src.lib.menus.aim.vehicle"] = nil
package.preload["src.lib.menus.world.clearArea"] = function(...)
	local clearRange = 100
	local includeMyVehicle, includePlayerVehs = false, false
	local vehiclesEnabled, pedsEnabled, objectsEnabled = true, true, true
	local function clearArea()
	    if not vehiclesEnabled and not pedsEnabled and not objectsEnabled then
	        Utils.showToast(UND_translations.world.noSelection)
	    end
	    local pos = Player.getPlayerPosition()
	    if pedsEnabled then
	        for _, ped in entities.get_all_peds_as_handles() do
	            if v3.distance(pos, ENTITY.GET_ENTITY_COORDS(ped)) <= clearRange then
	                Utils.deleteEntity(ped)
	            end
	        end
	    end
	    if vehiclesEnabled then
	        local currentVehicle = Ped.getVehicle(Player.getPlayerPed())
	        for _, vehicle in entities.get_all_vehicles_as_handles() do
	            if (includeMyVehicle or currentVehicle ~= vehicle) and v3.distance(pos, ENTITY.GET_ENTITY_COORDS(vehicle)) <= clearRange then
	                local vehData = Vehicle.getTargetVehicleData(vehicle)
	                if includePlayerVehs or vehData.player == -1 or (vehicle == currentVehicle and includeMyVehicle) then
	                    Utils.deleteEntity(vehicle)
	                end
	            end
	        end
	    end
	    if objectsEnabled then
	        for _, object in entities.get_all_objects_as_handles() do
	            if v3.distance(pos, ENTITY.GET_ENTITY_COORDS(object)) <= clearRange then
	                Utils.deleteEntity(object)
	            end
	        end
	    end
	end	local function setupClearAreaMenu(worldMenu)
	    menu.divider(worldMenu, UND_translations.world.clearArea .. " ")
	    local clearAreaSettings = menu.list(worldMenu, UND_translations.world.clearAreaSettings, {}, "")
	    local rangeSlider = menu.slider(clearAreaSettings, UND_translations.general.range, {Utils.getCommandName("clearrange")}, "", 2, 100, clearRange, 2, function(val)
	        clearRange = val
	    end)
	    clearRange = menu.get_value(rangeSlider)
	    menu.on_tick_in_viewport(rangeSlider, function()
	        local pos = Player.getPlayerPosition()
	        local rangePos = v3.new(pos)
	        v3.mul(rangePos, clearRange)
	        GRAPHICS.DRAW_MARKER_SPHERE(pos.x, pos.y, pos.z, clearRange, 0, 255, 0, 0.3)
	    end)
	    local includeMyVehicleToggle = menu.toggle(clearAreaSettings, UND_translations.general.includeMyVeh, {Utils.getCommandName("manipulateincludemyveh")}, "", function(on)
	        includeMyVehicle = on
	    end, includeMyVehicle)
	    includeMyVehicle = menu.get_value(includeMyVehicleToggle)
	    local includePlayerVehsToggle = menu.toggle(clearAreaSettings, UND_translations.general.includePlayerVehs, {Utils.getCommandName("manipulateincludeplayervehs")}, "",
	        function(on)
	            includePlayerVehs = on
	        end, includePlayerVehs)
	    includePlayerVehs = menu.get_value(includePlayerVehsToggle)
	    local removeVehiclesToggle = menu.toggle(clearAreaSettings, UND_translations.world.vehicles, {Utils.getCommandName("clearvehicles")}, UND_translations.world.vehiclesD,
	        function(on)
	            vehiclesEnabled = on
	        end, vehiclesEnabled)
	    vehiclesEnabled = menu.get_value(removeVehiclesToggle)
	    local removePedsToggle = menu.toggle(clearAreaSettings, UND_translations.world.peds, {Utils.getCommandName("clearpeds")}, UND_translations.world.pedsD, function(on)
	        pedsEnabled = on
	    end, pedsEnabled)
	    pedsEnabled = menu.get_value(removePedsToggle)
	    local removeObjectsToggle = menu.toggle(clearAreaSettings, UND_translations.world.objects, {Utils.getCommandName("clearobjects")}, UND_translations.world.objectsD,
	        function(on)
	            objectsEnabled = on
	        end, objectsEnabled)
	    objectsEnabled = menu.get_value(removeObjectsToggle)
	    menu.action(worldMenu, UND_translations.world.clearArea, {Utils.getCommandName("cleararea")}, UND_translations.world.clearAreaD, clearArea)
	    menu.toggle_loop(worldMenu, UND_translations.world.clearAreaLoop, {Utils.getCommandName("cleararealoop")}, "", function()
	        clearArea()
	        util.yield(500)
	    end)
	end
	return setupClearAreaMenu
end
package.loaded["src.lib.menus.world.clearArea"] = nil
package.preload["src.lib.menus.player.trolling"] = function(...)
	local setupPlayerSoundsMenu = require "src.lib.menus.player.sounds"
	local function setupPlayerTrollingMenu(trollingSubmenu, pid)
	    local soundsSubmenu = menu.list(trollingSubmenu, UND_translations.player.sounds, {}, UND_translations.player.soundsD)
	    setupPlayerSoundsMenu(soundsSubmenu, pid)
	    menu.toggle_loop(trollingSubmenu, UND_translations.player.waterJet, {Utils.getCommandName("waterjet")}, "", function()
	        Ped.waterJet(Player.getPlayerPed(pid))
	        util.yield(25)
	    end)
	    menu.toggle_loop(trollingSubmenu, UND_translations.general.fireworks, {Utils.getCommandName("fireworks")}, "", function()
	        Ped.fireworks(Player.getPlayerPed(pid))
	        util.yield(400)
	    end)
	    menu.divider(trollingSubmenu, UND_translations.general.cages)
	    local cageObjects = {}
	    local cageOptions = {UND_translations.general.visible, UND_translations.general.invisible}
	    menu.action_slider(trollingSubmenu, UND_translations.general.small, {Utils.getCommandName("smallcage")}, "", cageOptions, function(idx)
	        Ped.cage(Player.getPlayerPed(pid), UND_translations.general.small, cageObjects, idx == 2)
	    end)
	    menu.action_slider(trollingSubmenu, UND_translations.general.fence, {Utils.getCommandName("fencecage")}, "", cageOptions, function(idx)
	        Ped.cage(Player.getPlayerPed(pid), UND_translations.general.fence, cageObjects, idx == 2)
	    end)
	    menu.action_slider(trollingSubmenu, UND_translations.general.hell, {Utils.getCommandName("hellcage")}, "", cageOptions, function(idx)
	        Ped.cage(Player.getPlayerPed(pid), UND_translations.general.hell, cageObjects, idx == 2)
	    end)
	    menu.action_slider(trollingSubmenu, UND_translations.general.animal, {Utils.getCommandName("animalcage")}, "", cageOptions, function(idx)
	        Ped.cage(Player.getPlayerPed(pid), UND_translations.general.animal, cageObjects, idx == 2)
	    end)
	    menu.action_slider(trollingSubmenu, UND_translations.general.electric, {Utils.getCommandName("electriccage")}, "", cageOptions, function(idx)
	        Ped.cage(Player.getPlayerPed(pid), UND_translations.general.electric, cageObjects, idx == 2)
	    end)
	    local function removeCages()
	        for i = 1, #cageObjects do
	            Utils.deleteEntity(cageObjects[i])
	        end
	    end
	    menu.action(trollingSubmenu, UND_translations.general.removeCages, {Utils.getCommandName("removecages")}, "", removeCages)
	    menu.divider(trollingSubmenu, UND_translations.general.others)
	    menu.action(trollingSubmenu, UND_translations.player.hydrantFlood, {Utils.getCommandName("hydrants")}, "", function()
	        util.request_model(200846641)
	        local objects = {}
	        for i = 1, 40 do
	            local coords = Player.getPlayerPosition(pid)
	            objects[#objects + 1] = entities.create_object(200846641, v3.new(coords.x + Utils.rand(-5, 5), coords.y + Utils.rand(-5, 5), coords.z))
	            util.yield()
	        end
	        util.yield(3000)
	        for i = 1, 4 do
	            local coords = Player.getPlayerPosition(pid)
	            FIRE.ADD_EXPLOSION(coords.x + Utils.rand(-3, 3), coords.y + Utils.rand(-3, 3), coords.z, 64, 100, true, true, 0.5, true)
	            util.yield(400)
	        end
	        util.yield(5000)
	        for i = 1, #objects do
	            Utils.deleteEntity(objects[i])
	        end
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(200846641)
	    end)
	    local pedsPool = {}
	    local maxPeds = 50
	    local function npcCleanup()
	        for idx, ped in pedsPool do
	            Utils.deleteEntity(ped)
	            table.remove(pedsPool, idx)
	        end
	    end
	    menu.toggle_loop(trollingSubmenu, UND_translations.player.changeNPCCLones, {Utils.getCommandName("clones")}, "", function()
	        local playerPed = Player.getPlayerPed(pid)
	        local playerPos = Player.getPlayerPosition(pid)
	        local maxDist = 50
	        for idx, ped in pedsPool do
	            local coords = ENTITY.GET_ENTITY_COORDS(ped)
	            if v3.distance(playerPos, coords) > maxDist then
	                Utils.deleteEntity(ped)
	                table.remove(pedsPool, idx)
	            end
	        end
	        if #pedsPool < maxPeds then
	            for _, ped in entities.get_all_peds_as_handles() do
	                if not PED.IS_PED_A_PLAYER(ped) and not table.contains(pedsPool, ped) and not ENTITY.IS_ENTITY_DEAD(ped) then
	                    local coords = ENTITY.GET_ENTITY_COORDS(ped)
	                    if v3.distance(playerPos, coords) < maxDist and Network.requestControlOnce(ped) then
	                        local veh = Ped.getVehicle(ped)
	                        Utils.deleteEntity(ped)
	                        local clonePed = Ped.clone(playerPed)
	                        pedsPool[#pedsPool + 1] = clonePed
	                        if veh then
	                            if VEHICLE.IS_VEHICLE_SEAT_FREE(veh, -1, false) then
	                                PED.SET_PED_INTO_VEHICLE(clonePed, veh, -1)
	                                TASK.TASK_VEHICLE_DRIVE_WANDER(clonePed, veh, ENTITY.GET_ENTITY_SPEED(veh), 786603)
	                            else
	                                PED.SET_PED_INTO_VEHICLE(clonePed, veh, -2)
	                            end
	                        else
	                            ENTITY.SET_ENTITY_COORDS(clonePed, coords.x, coords.y, coords.z - 1, 0, 0, 0, 0)
	                        end
	                    end
	                end
	            end
	            util.yield(1500)
	        else
	            util.yield(500)
	        end
	    end, npcCleanup)
	    menu.toggle_loop(trollingSubmenu, UND_translations.player.makeWantedLoop, {Utils.getCommandName("wantedloop")}, "", function()
	        if Player.getWantedLevel(pid) == 0 then
	            Player.makeWanted(pid)
	        end
	        util.yield(2000)
	    end)
	    menu.toggle_loop(trollingSubmenu, UND_translations.player.bountyLoop, {Utils.getCommandName("bountyloop")}, UND_translations.player.bountyLoopD, function()
	        if not players.get_bounty(pid) then
	            Player.placeBounty(pid)
	        end
	        util.yield(2000)
	    end)
	    menu.action(trollingSubmenu, UND_translations.general.clone, {Utils.getCommandName("clone")}, "", function()
	        Ped.clone(Player.getPlayerPed(pid))
	    end)
	    players.on_leave(function(lpid)
	        if lpid == pid then
	            removeCages()
	            npcCleanup()
	        end
	    end)
	end
	return setupPlayerTrollingMenu
end
package.loaded["src.lib.menus.player.trolling"] = nil
package.preload["src.lib.menus.vehicle"] = function(...)
	local function driveNearestNPCVehicle()
	    local playerPed = Player.getPlayerPed()
	    local closestVehicle = Vehicle.getClosestVehicleTo(playerPed, false)
	    if not closestVehicle then
	        Utils.showToast(UND_translations.vehicle.noNearby)
	        util.request_model(418536135)
	        closestVehicle = entities.create_vehicle(418536135, Player.getPlayerPosition(), 0)
	        util.yield(500)
	        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(418536135)
	    end
	    Vehicle.drive(closestVehicle)
	end
	local function randomUpgrades()
	    local playerVehicle = Vehicle.getCurrentVehicle()
	    if playerVehicle == 0 then
	        return
	    end
	    Vehicle.randomUpgradeForVehicle(playerVehicle)
	end
	local function clean()
	    local playerVehicle = Vehicle.getCurrentVehicle()
	    if playerVehicle == 0 then
	        return
	    end
	    Vehicle.cleanVehicle(playerVehicle)
	end	local function speedUp(speedUpBySlider)
	    local playerVehicle = Vehicle.getCurrentVehicle()
	    if playerVehicle == 0 then
	        return
	    end
	    local currentSpeed = ENTITY.GET_ENTITY_SPEED(playerVehicle)
	    VEHICLE.SET_VEHICLE_FORWARD_SPEED(playerVehicle, currentSpeed + menu.get_value(speedUpBySlider) / 50)
	end	local function stopVehicle(speedUpToggle)
	    local playerVehicle = Vehicle.getCurrentVehicle()
	    if playerVehicle == 0 then
	        return
	    end
	    Vehicle.stop(playerVehicle)
	    menu.set_value(speedUpToggle, false)
	end	local function setLicensePlate(plateTextInput)
	    local playerVehicle = Vehicle.getCurrentVehicle(true, true)
	    if playerVehicle == 0 then
	        return
	    end
	    Vehicle.setVehiclePlate(playerVehicle, menu.get_value(plateTextInput))
	end
	local function hornBoost()
	    local playerVehicle = Vehicle.getCurrentVehicle(true, true)
	    if playerVehicle == 0 then
	        return
	    end
	    Vehicle.hornBoost(playerVehicle)
	end
	local function hornJump()
	    local playerVehicle = Vehicle.getCurrentVehicle(true, true)
	    if playerVehicle == 0 then
	        return
	    end
	    Vehicle.hornJump(playerVehicle)
	end
	local function hornExplosions()
	    local playerVehicle = Vehicle.getCurrentVehicle(true, true)
	    if playerVehicle == 0 then
	        return
	    end
	    Vehicle.hornExplosions(playerVehicle)
	end
	local autoUpgradedCars = {}
	local function autoUpgrade()
	    local playerVehicle = Vehicle.getCurrentVehicle(true, true)
	    if playerVehicle == 0 or VEHICLE.GET_PED_IN_VEHICLE_SEAT(playerVehicle, -1) ~= Player.getPlayerPed() or table.contains(autoUpgradedCars, playerVehicle) then
	        return
	    end
	    autoUpgradedCars[#autoUpgradedCars + 1] = playerVehicle
	    Vehicle.randomUpgradeForVehicle(playerVehicle)
	end
	local function spawnRandom()
	    local playerPed = Player.getPlayerPed()
	    local coords = Player.getPlayerPosition()
	    local rot = CAM.GET_GAMEPLAY_CAM_ROT(2):toDir()
	    v3.mul(rot, 8)
	    v3.add(coords, rot)
	    local vehicle = Vehicle.spawnRandom(coords)
	    local onFootDrive = menu.get_value(menu.ref_by_path("Vehicle>Spawner>On Foot Behaviour>Drive Spawned Vehicles"))
	    local inVehDrive = menu.get_value(menu.ref_by_path("Vehicle>Spawner>In Vehicle Behaviour>Drive Spawned Vehicles"))
	    if (Ped.getVehicle(playerPed) and inVehDrive) or (not Ped.getVehicle(playerPed) and onFootDrive) then
	        Vehicle.drive(vehicle)
	    end
	end
	local function flyVehicle()
	    local vehicle = Vehicle.getCurrentVehicle(true)
	    if vehicle > 0 then
	        CAM.DISABLE_CINEMATIC_BONNET_CAMERA_THIS_UPDATE()
	        VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, false, true, true)
	        local camRot = CAM.GET_GAMEPLAY_CAM_ROT(0)
	        ENTITY.SET_ENTITY_ROTATION(vehicle, camRot.x, 0, camRot.z, 2, true)
	        local flySpeedToUse = UND_settings.flySpeed
	        if PAD.IS_CONTROL_PRESSED(22, 22) then
	            flySpeedToUse = UND_settings.flySpeed * 2
	        end
	        ENTITY.SET_ENTITY_MAX_SPEED(vehicle, flySpeedToUse)
	        local xVel, yVel, zVel = 0.0, 0.0, 0.0
	        if PAD.IS_CONTROL_PRESSED(32, 32) then
	            xVel = flySpeedToUse
	        elseif PAD.IS_CONTROL_PRESSED(33, 33) then
	            xVel = -flySpeedToUse
	        end
	        if PAD.IS_CONTROL_PRESSED(63, 63) then
	            yVel = -flySpeedToUse
	        elseif PAD.IS_CONTROL_PRESSED(64, 64) then
	            yVel = flySpeedToUse
	        end
	        if PAD.IS_CONTROL_PRESSED(61, 61) then
	            zVel = flySpeedToUse / 2
	        elseif PAD.IS_CONTROL_PRESSED(62, 62) then
	            zVel = flySpeedToUse / -2
	        end
	        if xVel == 0.0 and yVel == 0.0 and zVel == 0.0 then
	            ENTITY.SET_ENTITY_VELOCITY(vehicle, 0.0, 0.0, 0.0)
	        else
	            local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 0)
	            local vel = ENTITY.GET_ENTITY_VELOCITY(vehicle)
	            if rot.x > 1.0 and vel.z < 0 then
	                zVel = -vel.z
	            elseif not PAD.IS_CONTROL_PRESSED(61, 61) and not PAD.IS_CONTROL_PRESSED(62, 62) then
	                zVel = 0.0
	            end
	            ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, yVel, xVel, zVel, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
	        end
	    end
	end
	local function setupVehicleMenu()
	    local vehicleMenu = menu.list(menu.my_root(), UND_translations.vehicle.name, {}, "")
	    if UND_privateMode then
	        local setupPrivateMenu = require(("lib.undefined.menus.vehicle.private"))
	        setupPrivateMenu(vehicleMenu)
	    end
	    menu.action(vehicleMenu, UND_translations.vehicle.driveNearest, {Utils.getCommandName("drivenearest")}, UND_translations.vehicle.driveNearestD, driveNearestNPCVehicle)
	    menu.action(vehicleMenu, UND_translations.vehicle.spawnRandom, {Utils.getCommandName("randomvehicle")}, "", spawnRandom)
	    menu.toggle_loop(vehicleMenu, UND_translations.vehicle.hornExplosions, {Utils.getCommandName("hornexplosions")}, "", hornExplosions)
	    menu.divider(vehicleMenu, UND_translations.general.general)
	    menu.action(vehicleMenu, UND_translations.vehicle.randomUpgrades, {Utils.getCommandName("randupgrades")}, UND_translations.vehicle.randomUpgradesD, randomUpgrades)
	    menu.toggle_loop(vehicleMenu, UND_translations.vehicle.autoUpgrade, {Utils.getCommandName("autoupgrade")}, UND_translations.vehicle.autoUpgradeD, autoUpgrade)
	    menu.action(vehicleMenu, UND_translations.vehicle.clean, {Utils.getCommandName("clean")}, UND_translations.vehicle.cleanD, clean)
	    menu.divider(vehicleMenu, UND_translations.general.movement)
	    local speedUpBySlider = menu.slider(vehicleMenu, UND_translations.vehicle.speedUpVal, {Utils.getCommandName("speedupby")}, UND_translations.vehicle.speedUpValD, 5, 500,
	        30, 5, Utils.emptyFunction)
	    local speedUpToggle = menu.toggle_loop(vehicleMenu, UND_translations.vehicle.speedUp, {Utils.getCommandName("speedup")}, UND_translations.vehicle.speedUpD, function()
	        speedUp(speedUpBySlider)
	    end)
	    menu.set_value(speedUpToggle, false)
	    menu.action(vehicleMenu, UND_translations.vehicle.stop, {Utils.getCommandName("stop")}, UND_translations.vehicle.stopD, function()
	        stopVehicle(speedUpToggle)
	    end)
	    menu.toggle_loop(vehicleMenu, UND_translations.vehicle.flyVehicle, {}, UND_translations.vehicle.flyVehicleD, flyVehicle, function()
	        local vehicle = Vehicle.getCurrentVehicle(true)
	        if vehicle > 0 then
	            ENTITY.SET_ENTITY_HAS_GRAVITY(vehicle, true)
	            VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, false)
	        end
	    end)
	    menu.toggle_loop(vehicleMenu, UND_translations.vehicle.hornBoost, {Utils.getCommandName("hornboost")}, "", hornBoost)
	    menu.toggle_loop(vehicleMenu, UND_translations.vehicle.hornJump, {Utils.getCommandName("hornjump")}, "", hornJump)
	    menu.divider(vehicleMenu, UND_translations.vehicle.plate)
	    local plateTextInput = menu.text_input(vehicleMenu, UND_translations.vehicle.customPlate, {Utils.getCommandName("platetext")}, UND_translations.vehicle.customPlateD,
	        Utils.emptyFunction, "UNDFD")
	    menu.toggle_loop(vehicleMenu, UND_translations.vehicle.enablePlate, {Utils.getCommandName("plateenable")}, UND_translations.vehicle.enablePlateD, function()
	        setLicensePlate(plateTextInput)
	    end)
	end
	return setupVehicleMenu
end
package.loaded["src.lib.menus.vehicle"] = nil
package.preload["src.lib.menus.teleport"] = function(...)
	local arg = __luapack_arg__
	local wpObjRel = menu.ref_by_path("World>Places>Waypoint On...>Objective")
	local function teleportToWaypoint()
	    local entityToTeleport = Vehicle.getPlayerOrVehicleEntity()
	    if not entityToTeleport then
	        return
	    end
	    local blip = HUD.GET_FIRST_BLIP_INFO_ID(8)
	    if blip == 0 then
	        menu.trigger_command(wpObjRel)
	        util.yield()
	        blip = HUD.GET_FIRST_BLIP_INFO_ID(8)
	        if blip == 0 then
	            return
	        end
	    end
	    local pos = Utils.getBlipCoords(blip)
	    ENTITY.SET_ENTITY_COORDS(entityToTeleport, pos.x, pos.y, pos.z, false, false, false)
	end	local function teleportForward(tpForwardDistanceSlider, tpForwardGroundZToggle, keepSpeedToggle)
	    local entityToTeleport = Vehicle.getPlayerOrVehicleEntity()
	    if not entityToTeleport then
	        return
	    end
	    local tpPosition = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entityToTeleport, 0, menu.get_value(tpForwardDistanceSlider) * 0.1, 0)
	    if menu.get_value(tpForwardGroundZToggle) then
	        tpPosition = Utils.getGroundZPosition(tpPosition)
	    end
	    local curSpeed = ENTITY.GET_ENTITY_SPEED(entityToTeleport)
	    ENTITY.SET_ENTITY_COORDS(entityToTeleport, tpPosition.x, tpPosition.y, tpPosition.z, false, false, false)
	    if menu.get_value(keepSpeedToggle) then
	        VEHICLE.SET_VEHICLE_FORWARD_SPEED(entityToTeleport, curSpeed)
	    end
	end
	local function teleportToRandomPlayer(tpInVehToggle)
	    local pid = Utils.getRandomPlayer()
	    if pid == -1 then
	        return
	    end
	    local pCoords = Player.getPlayerPosition(pid)
	    local tries = 0
	    while tries < 5 and (v3.distance(pCoords, Player.getPlayerPosition()) < 30 or Player.isDead(pid) or Player.getInterior(pid) or Player.isLoading(pid)) do
	        pid = Utils.getRandomPlayer()
	        if pid == -1 then
	            return
	        end
	        pCoords = Player.getPlayerPosition(pid)
	        tries = tries + 1
	    end
	    local myPed = Player.getPlayerPed()
	    local targetPed = Player.getPlayerPed(pid)
	    local myVeh = Ped.getVehicle(myPed)
	    local coords = Utils.rotateToEntity(targetPed, pCoords)
	    if myVeh and myVeh > 0 and VEHICLE.GET_PED_IN_VEHICLE_SEAT(myVeh, -1) == myPed and menu.get_value(tpInVehToggle) then
	        ENTITY.SET_ENTITY_COORDS(myVeh, coords.x, coords.y, coords.z, false, false, false)
	        Utils.rotateToEntity(targetPed)
	    else
	        ENTITY.SET_ENTITY_COORDS(myPed, coords.x, coords.y, coords.z, false, false, false)
	        Utils.rotateToEntity(targetPed)
	        local maxTime = Utils.getTime(1500)
	        while not PED.IS_PED_IN_ANY_VEHICLE(targetPed, false) do
	            if Utils.getTime() > maxTime then
	                break
	            end
	            util.yield()
	        end
	        if PED.IS_PED_IN_ANY_VEHICLE(targetPed, false) then
	            local vehicle = PED.GET_VEHICLE_PED_IS_IN(targetPed, false)
	            if VEHICLE.ARE_ANY_VEHICLE_SEATS_FREE(vehicle) then
	                PED.SET_PED_INTO_VEHICLE(myPed, vehicle, -2)
	            end
	        end
	    end
	end
	local function setupTeleportMenu()
	    local teleportMenu = menu.list(menu.my_root(), UND_translations.teleport.name, {}, "")
	    menu.action(teleportMenu, UND_translations.teleport.tpToWp, {Utils.getCommandName("tpwp")}, UND_translations.teleport.tpToWpD, teleportToWaypoint)
	    menu.divider(teleportMenu, UND_translations.teleport.tpFwd .. " ")
	    local tpForwardDistanceSlider = menu.slider(teleportMenu, UND_translations.teleport.tpFwdDist, {Utils.getCommandName("tpfwddist")}, "", 5, 500, 200, 5,
	        Utils.emptyFunction)
	    local tpForwardGroundZToggle = menu.toggle(teleportMenu, UND_translations.teleport.tpFwdForceGround, {Utils.getCommandName("tpfwdground")},
	        UND_translations.teleport.tpFwdForceGroundD, Utils.emptyFunction, true)
	    local keepSpeedToggle = menu.toggle(teleportMenu, UND_translations.teleport.keepSpeed, {Utils.getCommandName("tpfwdkeepspeed")}, UND_translations.teleport.keepSpeedD,
	        Utils.emptyFunction, true)
	    menu.action(teleportMenu, UND_translations.teleport.tpFwd, {Utils.getCommandName("tpfwd")}, "", function()
	        teleportForward(tpForwardDistanceSlider, tpForwardGroundZToggle, keepSpeedToggle)
	    end)
	    menu.divider(teleportMenu, UND_translations.teleport.tpToRandomPlayer .. " ")
	    local tpInVehToggle = menu.toggle(teleportMenu, UND_translations.teleport.tpInVehicle, {Utils.getCommandName("tpinvehicle")}, "", Utils.emptyFunction, true)
	    menu.action(teleportMenu, UND_translations.teleport.tpToRandomPlayer, {Utils.getCommandName("tprandomplayer")}, "", function()
	        teleportToRandomPlayer(tpInVehToggle)
	    end)
	end
	return setupTeleportMenu
end
package.loaded["src.lib.menus.teleport"] = nil
package.preload["src.lib.menus.settings"] = function(...)
	local upgradesKeys = {"performance", "bodyParts", "paint", "livery", "lights", "tyreSmoke", "windowTint", "horn", "plateType", "wheels", "neons", "weaponRoof",
	                             "grilleCounter"}
	local damageKeys = {"windows", "doors", "tyres", "popOnce", "smokeEngine"}
	local emptyTypes = {UND_translations.general.all, UND_translations.general.driver, UND_translations.general.passengers}
	local blameTypes = {UND_translations.general.owned, UND_translations.general.anonymous}
	local cageTypes = {UND_translations.general.small, UND_translations.general.fence, UND_translations.general.hell, UND_translations.general.animal,
	                          UND_translations.general.electric}
	local unitValues = {{
	    UND_translations.general.metric .. " - " .. UND_translations.general.kmh,
	    value = UND_translations.general.kmh
	}, {
	    UND_translations.general.imperial .. " - " .. UND_translations.general.mph,
	    value = UND_translations.general.mph
	}}
	local bountyValues = {UND_translations.general.random, "1000", "2000", "3000", "4000", "5000", "6000", "7000", "8000", "9000", "10000"}
	local wantedValues = {UND_translations.general.random, "0", "1", "2", "3", "4", "5"}
	local clonedPedTasks = {UND_translations.general.walk, UND_translations.general.attack, UND_translations.general.flee, UND_translations.general.stay}	local function setupRandomUpgradesSettings(randomUpgradesMenu)
	    if UND_privateMode then
	        UND_settings.randomUpgrades.maxPerformance = true
	        UND_settings.randomUpgrades.neons = true
	    end
	    local maxPerfToggle = menu.toggle(randomUpgradesMenu, UND_translations.vehicle.maxPerformance, {Utils.getCommandName("maxperformance")}, "", function(on)
	        UND_settings.randomUpgrades.maxPerformance = on
	    end, UND_settings.randomUpgrades.maxPerformance)
	    UND_settings.randomUpgrades.maxPerformance = menu.get_value(maxPerfToggle)
	    for _, key in upgradesKeys do
	        local toggle = menu.toggle(randomUpgradesMenu, UND_translations.vehicle[key], {Utils.getCommandName("random" .. key:lower())}, "", function(on)
	            UND_settings.randomUpgrades[key] = on
	        end, UND_settings.randomUpgrades[key])
	        UND_settings.randomUpgrades[key] = menu.get_value(toggle)
	    end
	end	local function setupDamageSettingsMenu(damageSettingsMenu)
	    for _, key in damageKeys do
	        local toggle = menu.toggle(damageSettingsMenu, UND_translations.vehicle[key], {Utils.getCommandName("damage" .. key:lower())},
	            UND_translations.vehicle[key .. "D"] or "", function(on)
	                UND_settings.damageSettings[key] = on
	            end, UND_settings.damageSettings[key])
	        UND_settings.damageSettings[key] = menu.get_value(toggle)
	    end
	end
	local function setupSettingsMenu()
	    local settingsMenu = menu.list(menu.my_root(), UND_translations.general.settings, {}, UND_translations.main.settingsD)
	    menu.divider(settingsMenu, UND_translations.general.general)
	    local hideTextOnActiveMenu = false
	    if UND_privateMode then
	        hideTextOnActiveMenu = true
	    end
	    local hideTextToggle = menu.toggle(settingsMenu, UND_translations.main.hideTextOnMenu, {Utils.getCommandName("hidetextonactivemenu")},
	        UND_translations.main.hideTextOnMenuD, function(on)
	            hideTextOnActiveMenu = on
	        end, hideTextOnActiveMenu)
	    hideTextOnActiveMenu = menu.get_value(hideTextToggle)
	    local unitsSelect = menu.list_select(settingsMenu, UND_translations.general.units, {Utils.getCommandName("units")}, "", unitValues, 1, function(idx)
	        UND_settings.units = unitValues[idx].value
	    end)
	    UND_settings.units = unitValues[menu.get_value(unitsSelect)].value
	    local explodeTypeSelect = menu.list_select(settingsMenu, UND_translations.general.explodeType, {Utils.getCommandName("explodetype")}, "", blameTypes, 2, function(val)
	        UND_settings.explodeType = blameTypes[val]
	    end)
	    UND_settings.explodeType = blameTypes[menu.get_value(explodeTypeSelect)]	    menu.divider(settingsMenu, UND_translations.player.players)
	    local makeWantedLevelSelect = menu.list_select(settingsMenu, UND_translations.player.makeWantedLevel, {Utils.getCommandName("wantedlevel")}, "", wantedValues,
	        #wantedValues, function(val)
	            UND_settings.makeWantedLevel = val
	        end)
	    UND_settings.makeWantedLevel = menu.get_value(makeWantedLevelSelect)
	    local bountyAmountSelect = menu.list_select(settingsMenu, UND_translations.player.bountyAmount, {Utils.getCommandName("bountyamount")}, "", bountyValues, #bountyValues,
	        function(val)
	            UND_settings.bountyAmount = val
	        end)
	    UND_settings.bountyAmount = menu.get_value(bountyAmountSelect)	    menu.divider(settingsMenu, UND_translations.world.peds)
	    local clonedPedTaskSelect = menu.list_select(settingsMenu, UND_translations.player.clonedPedTask, {Utils.getCommandName("clonedpedtask")}, "", clonedPedTasks, 1,
	        function(val)
	            UND_settings.clonedPedTask = clonedPedTasks[val]
	        end)
	    UND_settings.clonedPedTask = clonedPedTasks[menu.get_value(clonedPedTaskSelect)]
	    local cageTypeSelect = menu.list_select(settingsMenu, UND_translations.player.cageType, {Utils.getCommandName("cagetype")}, "", cageTypes, 2, function(val)
	        UND_settings.cageType = cageTypes[val]
	    end)
	    UND_settings.cageType = cageTypes[menu.get_value(cageTypeSelect)]
	    local shootTypeSelect = menu.list_select(settingsMenu, UND_translations.general.shootType, {Utils.getCommandName("shoottype")}, "", blameTypes, 1, function(val)
	        UND_settings.shootType = blameTypes[val]
	    end)
	    UND_settings.shootType = blameTypes[menu.get_value(shootTypeSelect)]	    menu.divider(settingsMenu, UND_translations.world.vehicles)
	    local vehModelToggle = menu.toggle(settingsMenu, UND_translations.vehicle.showVehModelName, {Utils.getCommandName("showvehiclemodelname")},
	        UND_translations.vehicle.showVehModelNameD, function(on)
	            UND_settings.showVehModelName = on
	        end, UND_settings.showVehModelName)
	    UND_settings.showVehModelName = menu.get_value(vehModelToggle)
	    local randomUpgradesMenu = menu.list(settingsMenu, UND_translations.vehicle.randomUpgrades, {}, UND_translations.vehicle.randomUpgradesSettingsD)
	    setupRandomUpgradesSettings(randomUpgradesMenu)
	    local damageSettingsMenu = menu.list(settingsMenu, UND_translations.vehicle.damageSettings, {}, UND_translations.vehicle.damageSettingsD)
	    setupDamageSettingsMenu(damageSettingsMenu)
	    local flySpeedSlider = menu.slider(settingsMenu, UND_translations.vehicle.flySpeed, {Utils.getCommandName("flyspeed")}, "", 10, 1000, UND_settings.flySpeed, 5,
	        function(val)
	            UND_settings.flySpeed = val
	        end)
	    UND_settings.flySpeed = menu.get_value(flySpeedSlider)
	    local hornBoostSpeedSlider = menu.slider(settingsMenu, UND_translations.vehicle.hornBoostSpeed, {Utils.getCommandName("hornboostspeed")}, "", 10, 100,
	        UND_settings.hornBoostSpeed, 10, function(val)
	            UND_settings.hornBoostSpeed = val
	        end)
	    UND_settings.hornBoostSpeed = menu.get_value(hornBoostSpeedSlider)
	    local hornJumpForceSlider = menu.slider(settingsMenu, UND_translations.vehicle.hornJumpForce, {Utils.getCommandName("hornjumpforce")}, "", 10, 100,
	        UND_settings.hornJumpForce, 10, function(val)
	            UND_settings.hornJumpForce = val
	        end)
	    UND_settings.hornJumpForce = menu.get_value(hornJumpForceSlider)
	    local emptyFromSelect = menu.list_select(settingsMenu, UND_translations.general.emptyFrom, {Utils.getCommandName("emptyfrom")}, UND_translations.general.emptyFromD,
	        emptyTypes, 1, function(val)
	            UND_settings.emptyFrom = emptyTypes[val]
	        end)
	    UND_settings.emptyFrom = emptyTypes[menu.get_value(emptyFromSelect)]
	    util.create_tick_handler(function()
	        if hideTextOnActiveMenu then
	            UND_gameMenuOpen = util.is_interaction_menu_open() or menu.command_box_is_open() or HUD.IS_PAUSE_MENU_ACTIVE() or
	                                   (not chat.is_open() and not PAD.IS_CONTROL_ENABLED(0, 1) and not PAD.IS_CONTROL_PRESSED(24, 24))
	        elseif UND_gameMenuOpen then
	            UND_gameMenuOpen = false
	        end
	        util.yield(300)
	    end)
	end
	return setupSettingsMenu
end
package.loaded["src.lib.menus.settings"] = nil
package.preload["src.lib.menus.player.vehicle"] = function(...)
	local function setupPlayerVehicleMenu(vehicleSubmenu, pid)
	    local pName = Player.getPlayerName(pid, false, true)
	    local pPed = Player.getPlayerPed(pid)
	    local kickFromVehRel = menu.ref_by_path("Players>" .. pName .. ">Trolling>Kick From Vehicle")
	    local function doActionWithPlayerVehicle(actionCallback, args, dontShowError)
	        local vehicle = Vehicle.getPlayerVehicle(pid, dontShowError)
	        if vehicle == 0 then
	            return
	        end
	        actionCallback(vehicle, args)
	    end
	    local function damage()
	        doActionWithPlayerVehicle(Vehicle.damage)
	    end
	    local function explode()
	        doActionWithPlayerVehicle(Vehicle.explode)
	    end
	    local function randomExplode()
	        doActionWithPlayerVehicle(Vehicle.explode, true)
	    end
	    local function burn()
	        doActionWithPlayerVehicle(Vehicle.burn)
	    end
	    local function killEngine()
	        doActionWithPlayerVehicle(Vehicle.killEngine)
	    end
	    local function delete()
	        doActionWithPlayerVehicle(Utils.deleteEntity)
	    end
	    local function deleteLoop()
	        doActionWithPlayerVehicle(Utils.deleteEntity, nil, true)
	        util.yield(500)
	    end
	    local function clone()
	        doActionWithPlayerVehicle(Vehicle.clone)
	    end
	    local function repair()
	        doActionWithPlayerVehicle(Vehicle.repairVehicle)
	    end
	    local function emp()
	        doActionWithPlayerVehicle(Vehicle.emp)
	    end	    local function flip(idx)
	        doActionWithPlayerVehicle(Vehicle.flip, idx == 2)
	    end
	    local function turnOffEngine()
	        doActionWithPlayerVehicle(Vehicle.turnOffEngine)
	    end
	    local function randomUpgrade()
	        doActionWithPlayerVehicle(Vehicle.randomUpgradeForVehicle)
	    end
	    local function stop()
	        doActionWithPlayerVehicle(Vehicle.stop)
	    end
	    local function spin()
	        doActionWithPlayerVehicle(Vehicle.spin)
	    end	    local function launch(idx)
	        local direction = "back"
	        if idx == 1 then
	            direction = "up"
	        elseif idx == 2 then
	            direction = "down"
	        elseif idx == 3 then
	            direction = "forward"
	        end
	        doActionWithPlayerVehicle(Vehicle.launch, direction)
	    end
	    local function empty()
	        doActionWithPlayerVehicle(Vehicle.empty)
	    end
	    local function tpToMe()
	        doActionWithPlayerVehicle(Vehicle.tpToPlayer)
	    end
	    local function tpToVehicle()
	        doActionWithPlayerVehicle(Vehicle.tpToVehicle)
	    end
	    local function tpToSky()
	        doActionWithPlayerVehicle(Vehicle.tpToSky)
	    end
	    local function slick()
	        doActionWithPlayerVehicle(Vehicle.slick)
	    end
	    local function bump()
	        doActionWithPlayerVehicle(Vehicle.bump)
	    end
	    local function clean()
	        doActionWithPlayerVehicle(Vehicle.cleanVehicle)
	    end
	    local function rotate()
	        doActionWithPlayerVehicle(Vehicle.rotate)
	    end
	    local function randomLaunch()
	        doActionWithPlayerVehicle(Vehicle.randomLaunch)
	    end
	    local function drive()
	        doActionWithPlayerVehicle(Vehicle.drive)
	    end
	    local function enter()
	        doActionWithPlayerVehicle(Vehicle.enter)
	    end
	    local function hornExplosions()
	        doActionWithPlayerVehicle(Vehicle.hornExplosions, nil, true)
	    end
	    local function glitch()
	        doActionWithPlayerVehicle(Vehicle.glitch, nil, true)
	        util.yield(1000)
	    end	    local function freeze(enabled)
	        doActionWithPlayerVehicle(Vehicle.freeze, enabled, true)
	        util.yield(1000)
	    end	    local function sink(idx)
	        doActionWithPlayerVehicle(Vehicle.sink, idx == 1)
	    end	    local function lockDoors(enabled)
	        local veh = Ped.getVehicle(pPed)
	        if veh and (enabled and VEHICLE.GET_VEHICLE_DOOR_LOCK_STATUS(veh) ~= 4) or (not enabled and VEHICLE.GET_VEHICLE_DOOR_LOCK_STATUS(veh) == 4) then
	            doActionWithPlayerVehicle(Vehicle.lockDoors, enabled, true)
	        end
	        util.yield(1000)
	    end
	    local function randomShutdowns()
	        util.yield(Utils.rand(1000, 30000))
	        doActionWithPlayerVehicle(Vehicle.turnOffEngine, nil, true)
	    end
	    local function keepEngineOff()
	        doActionWithPlayerVehicle(Vehicle.turnOffEngine, nil, true)
	        util.yield(500)
	    end	    local function toggleVisible(enabled)
	        doActionWithPlayerVehicle(Vehicle.toggleInvisible, enabled, true)
	        util.yield(1000)
	    end
	    menu.divider(vehicleSubmenu, UND_translations.teleport.name)
	    menu.action(vehicleSubmenu, UND_translations.general.tpToIt, {Utils.getCommandName("tpveh")}, "", tpToVehicle)
	    menu.action(vehicleSubmenu, UND_translations.general.tpToMe, {Utils.getCommandName("tpme")}, "", tpToMe)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.tpHigh, {Utils.getCommandName("tpsky")}, "", tpToSky)
	    menu.action_slider(vehicleSubmenu, UND_translations.vehicle.sink, {Utils.getCommandName("sink")}, "",
	        {UND_translations.vehicle.doorsLocked, UND_translations.vehicle.doorsOpen}, sink)
	    menu.divider(vehicleSubmenu, UND_translations.general.movement)
	    menu.toggle_loop(vehicleSubmenu, UND_translations.general.freeze, {Utils.getCommandName("freeze")}, "", function()
	        freeze(true)
	    end, function()
	        freeze(false)
	    end)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.stop, {Utils.getCommandName("stop")}, "", stop)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.randomForce, {Utils.getCommandName("randomforce")}, UND_translations.vehicle.randomForceD, randomLaunch)
	    menu.action_slider(vehicleSubmenu, UND_translations.vehicle.launch, {Utils.getCommandName("launch")}, "",
	        {UND_translations.general.up, UND_translations.general.down, UND_translations.general.forward, UND_translations.general.backward}, launch)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.slick, {Utils.getCommandName("slick")}, UND_translations.vehicle.slickD, slick)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.spin, {Utils.getCommandName("spin")}, "", spin)
	    menu.action_slider(vehicleSubmenu, UND_translations.general.flip, {Utils.getCommandName("flip")}, "", {UND_translations.general.vertical, UND_translations.general.horizontal},
	        flip)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.bump, {Utils.getCommandName("bump")}, "", bump)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.engineOff, {Utils.getCommandName("engineoff")}, "", turnOffEngine)
	    menu.toggle_loop(vehicleSubmenu, UND_translations.vehicle.keepEngineOff, {Utils.getCommandName("keepengineoff")}, "", keepEngineOff)
	    menu.toggle_loop(vehicleSubmenu, UND_translations.vehicle.randomShutdowns, {Utils.getCommandName("randomshutdowns")}, "", randomShutdowns)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.EMP, {Utils.getCommandName("emp")}, "", emp)
	    menu.action(vehicleSubmenu, UND_translations.general.rotate, {Utils.getCommandName("rotate")}, "", rotate)
	    menu.divider(vehicleSubmenu, UND_translations.general.health)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.repair, {Utils.getCommandName("repair")}, "", repair)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.damage, {Utils.getCommandName("damage")}, "", damage)
	    menu.action(vehicleSubmenu, UND_translations.general.burn, {Utils.getCommandName("burn")}, "", burn)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.killEngine, {Utils.getCommandName("killengine")}, "", killEngine)
	    menu.action(vehicleSubmenu, UND_translations.general.explode, {Utils.getCommandName("explodeveh")}, "", explode)
	    menu.action(vehicleSubmenu, UND_translations.general.randomExplosion, {Utils.getCommandName("randomexplodeveh")}, "", randomExplode)
	    local spectating = false
	    local function flyVehicle()
	        local vehicle = Vehicle.getPlayerVehicle(pid, true)
	        if vehicle > 0 then
	            if not spectating then
	                menu.trigger_commands("spectate" .. Player.getPlayerName(pid, true) .. " on")
	                spectating = true
	                if UND_flyVehicleEnabledFor > -1 and UND_flyVehicleEnabledFor ~= pid then
	                    menu.trigger_commands(Utils.getCommandName("flyvehicle") .. Player.getPlayerName(UND_flyVehicleEnabledFor, true) .. " off")
	                end
	                UND_flyVehicleEnabledFor = pid
	            end
	            CAM.DISABLE_CINEMATIC_BONNET_CAMERA_THIS_UPDATE()
	            VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, false, true, true)
	            local camRot = CAM.GET_GAMEPLAY_CAM_ROT(2)
	            ENTITY.SET_ENTITY_ROTATION(vehicle, camRot.x, 0, camRot.z, 2, true)
	            local flySpeedToUse = UND_settings.flySpeed
	            if PAD.IS_CONTROL_PRESSED(22, 22) then
	                flySpeedToUse = UND_settings.flySpeed * 2
	                Utils.showToast(flySpeedToUse)
	            end
	            ENTITY.SET_ENTITY_MAX_SPEED(vehicle, flySpeedToUse)
	            local xVel, yVel, zVel = 0.0, 0.0, 0.0
	            if PAD.IS_CONTROL_PRESSED(32, 32) then
	                xVel = flySpeedToUse
	            elseif PAD.IS_CONTROL_PRESSED(33, 33) then
	                xVel = -flySpeedToUse
	            end
	            if PAD.IS_CONTROL_PRESSED(63, 63) then
	                yVel = -flySpeedToUse
	            elseif PAD.IS_CONTROL_PRESSED(64, 64) then
	                yVel = flySpeedToUse
	            end
	            if PAD.IS_CONTROL_PRESSED(61, 61) then
	                zVel = flySpeedToUse / 2
	            elseif PAD.IS_CONTROL_PRESSED(62, 62) then
	                zVel = flySpeedToUse / -2
	            end
	            if xVel == 0.0 and yVel == 0.0 and zVel == 0.0 then
	                ENTITY.SET_ENTITY_VELOCITY(vehicle, 0.0, 0.0, 0.0)
	            else
	                local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 0)
	                local vel = ENTITY.GET_ENTITY_VELOCITY(vehicle)
	                if rot.x > 1.0 and vel.z < 0 then
	                    zVel = -vel.z
	                elseif not PAD.IS_CONTROL_PRESSED(61, 61) and not PAD.IS_CONTROL_PRESSED(62, 62) then
	                    zVel = 0.0
	                end
	                ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, yVel, xVel, zVel, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
	            end
	        else
	            Utils.showToast(Player.getPlayerName(pid) .. " " .. UND_translations.vehicle.playerNotInVehicle)
	            menu.trigger_commands(Utils.getCommandName("flyvehicle") .. Player.getPlayerName(pid, true) .. " off")
	        end
	    end
	    menu.toggle_loop(vehicleSubmenu, UND_translations.vehicle.flyVehicle, {Utils.getCommandName("flyvehicle")}, "", flyVehicle, function()
	        local vehicle = Vehicle.getPlayerVehicle(pid, true)
	        if vehicle > 0 then
	            ENTITY.SET_ENTITY_HAS_GRAVITY(vehicle, true)
	            VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, false)
	        end
	        menu.trigger_commands("spectate" .. Player.getPlayerName(pid, true) .. " off")
	        spectating = false
	    end)
	    menu.divider(vehicleSubmenu, UND_translations.general.others)
	    menu.toggle_loop(vehicleSubmenu, UND_translations.vehicle.lockDoors, {Utils.getCommandName("lockdoors")}, "", function()
	        lockDoors(true)
	        util.yield(2000)
	    end, function()
	        lockDoors(false)
	    end)
	    menu.toggle_loop(vehicleSubmenu, UND_translations.player.kickFromEveryVehicle, {Utils.getCommandName("kickfromveh")}, "", function()
	        if PED.IS_PED_IN_ANY_VEHICLE(Player.getPlayerPed(pid)) then
	            menu.trigger_command(kickFromVehRel)
	        end
	        util.yield(2000)
	    end)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.clean, {Utils.getCommandName("clean")}, "", clean)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.randomUpgrades, {Utils.getCommandName("randomupgrades")}, "", randomUpgrade)
	    menu.action(vehicleSubmenu, UND_translations.general.clone, {Utils.getCommandName("cloneveh")}, "", clone)
	    menu.action(vehicleSubmenu, UND_translations.general.delete, {Utils.getCommandName("delete")}, "", delete)
	    menu.toggle_loop(vehicleSubmenu, UND_translations.player.deleteVehicleLoop, {Utils.getCommandName("loopdelete")}, "", deleteLoop)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.empty, {Utils.getCommandName("empty")}, UND_translations.vehicle.emptyD, empty)
	    menu.toggle_loop(vehicleSubmenu, UND_translations.general.invisible, {Utils.getCommandName("invisible")}, "", function()
	        toggleVisible(true)
	    end, function()
	        toggleVisible(false)
	    end)
	    menu.toggle_loop(vehicleSubmenu, UND_translations.vehicle.hornExplosions, {Utils.getCommandName("hornexplosions")}, "", hornExplosions)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.enter, {Utils.getCommandName("enter")}, "", enter)
	    menu.action(vehicleSubmenu, UND_translations.vehicle.drive, {Utils.getCommandName("drive")}, "", drive)
	    menu.toggle_loop(vehicleSubmenu, UND_translations.vehicle.glitch, {Utils.getCommandName("glitch")}, "", glitch)
	end
	return setupPlayerVehicleMenu
end
package.loaded["src.lib.menus.player.vehicle"] = nil
package.preload["src.lib.menus.player.sounds"] = function(...)
	local function setupPlayerSoundsMenu(soundsSubmenu, pid)
	    menu.toggle_loop(soundsSubmenu, UND_translations.player.earsRaper, {}, "", function()
	        local pos = Player.getPlayerPosition(pid)
	        for i = 1, 30 do
	            AUDIO.PLAY_SOUND_FROM_COORD(-1, "Beep_Green", pos.x, pos.y, pos.z, "DLC_HEIST_HACKING_SNAKE_SOUNDS", true, 1, false)
	            AUDIO.PLAY_SOUND_FROM_COORD(-1, "DOOR_BUZZ", pos.x, pos.y, pos.z, "MP_PLAYER_APARTMENT", true, 1, false)
	            AUDIO.PLAY_SOUND_FROM_COORD(-1, "Hack_Fail", pos.x, pos.y, pos.z, "DLC_sum20_Business_Battle_AC_Sounds", true, 1, false)
	        end
	        util.yield(150)
	    end)
	    menu.toggle_loop(soundsSubmenu, UND_translations.player.yacht, {}, "", function()
	        local pos = Player.getPlayerPosition(pid)
	        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Horn", pos.x, pos.y, pos.z, "DLC_Apt_Yacht_Ambient_Soundset", true, 1, false)
	        util.yield(900)
	    end)
	    menu.toggle_loop(soundsSubmenu, UND_translations.player.airAct, {}, "", function()
	        local pos = Player.getPlayerPosition(pid)
	        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Air_Defences_Activated", pos.x, pos.y, pos.z, "DLC_sum20_Business_Battle_AC_Sounds", true, 1, false)
	        util.yield(8000)
	    end)
	    menu.toggle_loop(soundsSubmenu, UND_translations.player.airDeact, {}, "", function()
	        local pos = Player.getPlayerPosition(pid)
	        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Air_Defenses_Disabled", pos.x, pos.y, pos.z, "DLC_sum20_Business_Battle_AC_Sounds", true, 1, false)
	        util.yield(2000)
	    end)
	    menu.toggle_loop(soundsSubmenu, UND_translations.player.hackFailed, {}, "", function()
	        local pos = Player.getPlayerPosition(pid)
	        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Hack_Fail", pos.x, pos.y, pos.z, "DLC_sum20_Business_Battle_AC_Sounds", true, 1, false)
	        util.yield(1500)
	    end)
	    menu.toggle_loop(soundsSubmenu, UND_translations.player.hackSuccess, {}, "", function()
	        local pos = Player.getPlayerPosition(pid)
	        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Hack_Success", pos.x, pos.y, pos.z, "DLC_sum20_Business_Battle_AC_Sounds", true, 1, false)
	        util.yield(1500)
	    end)
	    menu.toggle_loop(soundsSubmenu, UND_translations.player.powerDown, {}, "", function()
	        local pos = Player.getPlayerPosition(pid)
	        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Power_Down", pos.x, pos.y, pos.z, "DLC_HEIST_HACKING_SNAKE_SOUNDS", true, 1, false)
	        util.yield(1500)
	    end)
	    menu.toggle_loop(soundsSubmenu, UND_translations.player.beeping, {}, "", function()
	        local pos = Player.getPlayerPosition(pid)
	        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Beep_Green", pos.x, pos.y, pos.z, "DLC_HEIST_HACKING_SNAKE_SOUNDS", true, 1, false)
	        util.yield(1500)
	    end)
	    menu.toggle_loop(soundsSubmenu, UND_translations.player.buzz, {}, "", function()
	        local pos = Player.getPlayerPosition(pid)
	        AUDIO.PLAY_SOUND_FROM_COORD(-1, "DOOR_BUZZ", pos.x, pos.y, pos.z, "MP_PLAYER_APARTMENT", true, 1, false)
	        util.yield(800)
	    end)
	end
	return setupPlayerSoundsMenu
end
package.loaded["src.lib.menus.player.sounds"] = nil
package.preload["src.lib.menus.aim"] = function(...)
	local setupAimTeleport = require "src.lib.menus.aim.teleport"
	local setupAimBeam = require "src.lib.menus.aim.beam"
	local setupAimSettings = require "src.lib.menus.aim.settings"
	local setupPedAimActions = require "src.lib.menus.aim.ped"
	local setupVehicleAimActions = require "src.lib.menus.aim.vehicle"
	local setupObjectAimActions = require "src.lib.menus.aim.object"
	local function setupAimMenu()
	    local aimMenu = menu.list(menu.my_root(), UND_translations.aim.name, {}, UND_translations.aim.nameD)
	    menu.divider(aimMenu, UND_translations.aim.name)
	    local aimPedsSubmenu = menu.list(aimMenu, UND_translations.aim.peds, {}, "")
	    local aimVehicleSubmenu = menu.list(aimMenu, UND_translations.vehicle.name, {}, "")
	    local aimObjectsSubmenu = menu.list(aimMenu, UND_translations.aim.objects, {}, "")
	    local aimTeleportAction = setupAimTeleport(aimMenu)
	    setupAimBeam(aimMenu)
	    setupPedAimActions(aimPedsSubmenu)
	    setupVehicleAimActions(aimVehicleSubmenu)
	    setupObjectAimActions(aimObjectsSubmenu)
	    setupAimSettings(aimMenu, aimPedsSubmenu, aimVehicleSubmenu, aimObjectsSubmenu, aimTeleportAction)
	end
	return setupAimMenu
end
package.loaded["src.lib.menus.aim"] = nil
package.preload["src.lib.menus.player"] = function(...)
	local setupPlayerFriendlyMenu = require "src.lib.menus.player.friendly"
	local setupPlayerTrollingMenu = require "src.lib.menus.player.trolling"
	local setupPlayerVehicleMenu = require "src.lib.menus.player.vehicle"
	local setupPlayerMaliciousMenu = require "src.lib.menus.player.malicious"
	local function setupPlayerMenu()
	    players.on_join(function(pid)
	        local playerNameLower = Player.getPlayerName(pid, true)
	        local playerRootMenu = menu.player_root(pid)
	        menu.divider(playerRootMenu, SCRIPT_NAME)	        local function follow()
	            if UND_followEnabledFor > -1 and UND_followEnabledFor ~= pid then
	                menu.trigger_commands(Utils.getCommandName("follow") .. Player.getPlayerName(UND_followEnabledFor, true) .. " off")
	            end
	            if pid == Player.getUserPlayer() then
	                menu.trigger_commands(Utils.getCommandName("follow") .. playerNameLower .. " off")
	                Utils.showToast(UND_translations.general.cantUseOnSelf)
	                return
	            end
	            UND_followEnabledFor = pid
	            local pCoords = Player.getPlayerPosition(pid)
	            ENTITY.SET_ENTITY_COORDS(Player.getPlayerPed(), pCoords.x, pCoords.y, pCoords.z - 1, false, false, false, false)
	            util.yield(800)
	        end
	        menu.toggle_loop(playerRootMenu, UND_translations.player.follow, {Utils.getCommandName("follow")}, UND_translations.player.followD, follow)	        local friendlySubmenu = menu.list(playerRootMenu, UND_translations.player.friendly, {}, "")
	        setupPlayerFriendlyMenu(friendlySubmenu, pid)	        local trollingSubmenu = menu.list(playerRootMenu, UND_translations.player.trolling, {}, "")
	        setupPlayerTrollingMenu(trollingSubmenu, pid)	        local vehicleSubmenu = menu.list(playerRootMenu, UND_translations.vehicle.name, {}, "")
	        setupPlayerVehicleMenu(vehicleSubmenu, pid)	        local maliciousSubmenu = menu.list(playerRootMenu, UND_translations.player.malicious, {}, "")
	        setupPlayerMaliciousMenu(maliciousSubmenu, pid)
	        if UND_privateMode then
	            local setupPlayerPrivateMenu = require(("lib.undefined.menus.player.private"))
	            local privateSubmenu = menu.list(playerRootMenu, "UNDFD", {}, "")
	            setupPlayerPrivateMenu(privateSubmenu, pid)
	        end
	    end)
	    players.dispatch_on_join()
	end
	return setupPlayerMenu
end
package.loaded["src.lib.menus.player"] = nil
package.preload["src.lib.menus.world.manipulateArea"] = function(...)
	local manipulateRange = 100
	local delay = 500
	local includePeds, includePedVehs, includeMyVehicle, includeMyPed, includePlayerVehs, includePlayerPeds = true, true, false, false, false, false
	local launchType = UND_translations.general.random
	local launchTypes = {UND_translations.general.random, UND_translations.general.up, UND_translations.general.down, UND_translations.general.forward,
	                     UND_translations.general.backward}
	local damage, explodeVehicle, burnVehicle, bump, spin, upgrade, empty, emp, stop, fireworksVehicles, repair, atomizeVehicles, launch, slick, rotate, flipV, flipH, killEngine,
	    engineOff, freezeVehicle, unfreezeVehicle, hornExplosions, setGodVehicle, removeGodVehicle, randomExplodeVehicle, airstrikeVehicle, glitch = true, false, false, false, false,
	    false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false
	local fireworksPeds, atomizePeds, healPeds, ragdoll, waterJet, flameJet, explodePeds, randomExplodePeds, airstrikePeds, shootPeds = false, false, false, false, false, false, false,
	    false, false, false
	local dropCasino, dropCards, makeWanted, giveAmmo, disarm, giveAllWeapons, otr, placeBounty, neverWanted, dropPQ, ceoMoney, giveCollectibles = false, false, false, false, false,
	    false, false, false, false, false, false, false
	local function manipulateArea()
	    if not util.is_session_started() then
	        return
	    end
	    local myPed = Player.getPlayerPed()
	    local pos = Player.getPlayerPosition()
	    local currentVehicle = Ped.getVehicle(myPed)
	    for _, vehicle in entities.get_all_vehicles_as_handles() do
	        if (includeMyVehicle or currentVehicle ~= vehicle) and v3.distance(pos, ENTITY.GET_ENTITY_COORDS(vehicle)) <= manipulateRange then
	            local vehData = Vehicle.getTargetVehicleData(vehicle)
	            if includePlayerVehs or (includePedVehs and vehData.player == -1) or (includeMyVehicle and vehicle == currentVehicle) then
	                util.create_thread(function()
	                    if bump then
	                        Vehicle.bump(vehicle)
	                    end
	                    if empty and not VEHICLE.IS_VEHICLE_SEAT_FREE(vehicle, -1, true) then
	                        Vehicle.empty(vehicle)
	                    end
	                    if emp and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(vehicle) then
	                        Vehicle.emp(vehicle)
	                    end
	                    if fireworksVehicles then
	                        Vehicle.fireworks(vehicle)
	                    end
	                    if atomizeVehicles then
	                        Vehicle.atomize(vehicle)
	                    end
	                    if slick then
	                        Vehicle.slick(vehicle)
	                    end
	                    if hornExplosions then
	                        Vehicle.hornExplosions(vehicle)
	                    end
	                    if airstrikeVehicle then
	                        Vehicle.airstrike(vehicle)
	                    end
	                    if Network.requestControl(vehicle, 500, true) then
	                        if damage then
	                            Vehicle.damage(vehicle)
	                        end
	                        if killEngine and VEHICLE.GET_VEHICLE_ENGINE_HEALTH(vehicle) > -4000 then
	                            Vehicle.killEngine(vehicle)
	                        end
	                        if engineOff and VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(vehicle) then
	                            Vehicle.turnOffEngine(vehicle)
	                        end
	                        if explodeVehicle and not ENTITY.IS_ENTITY_DEAD(vehicle) then
	                            Vehicle.explode(vehicle)
	                        end
	                        if randomExplodeVehicle and not ENTITY.IS_ENTITY_DEAD(vehicle) then
	                            Vehicle.explode(vehicle, true)
	                        end
	                        if burnVehicle and VEHICLE.GET_VEHICLE_ENGINE_HEALTH(vehicle) > -1 then
	                            Vehicle.burn(vehicle)
	                        end
	                        if spin then
	                            Vehicle.spin(vehicle)
	                        end
	                        if upgrade then
	                            Vehicle.randomUpgradeForVehicle(vehicle)
	                        end
	                        if stop then
	                            Vehicle.stop(vehicle)
	                        end
	                        if repair then
	                            Vehicle.repairVehicle(vehicle)
	                        end
	                        if rotate then
	                            Vehicle.rotate(vehicle)
	                        end
	                        if flipH then
	                            Vehicle.flip(vehicle, true)
	                        end
	                        if flipV then
	                            Vehicle.flip(vehicle, false)
	                        end
	                        if freezeVehicle then
	                            Vehicle.freeze(vehicle, true)
	                        end
	                        if unfreezeVehicle then
	                            Vehicle.freeze(vehicle, false)
	                        end
	                        if setGodVehicle then
	                            Vehicle.toggleVehicleGodMode(vehicle, true)
	                        end
	                        if removeGodVehicle then
	                            Vehicle.toggleVehicleGodMode(vehicle, false)
	                        end
	                        if glitch then
	                            Vehicle.glitch(vehicle)
	                        end
	                        if launch then
	                            if launchType == UND_translations.general.random then
	                                Vehicle.randomLaunch(vehicle)
	                            elseif launchType == UND_translations.general.up then
	                                Vehicle.launch(vehicle, "up")
	                            elseif launchType == UND_translations.general.down then
	                                Vehicle.launch(vehicle, "down")
	                            elseif launchType == UND_translations.general.forward then
	                                Vehicle.launch(vehicle, "forward")
	                            else
	                                Vehicle.launch(vehicle, "backward")
	                            end
	                        end
	                    end
	                    util.stop_thread()
	                end)
	            end
	        end
	    end
	    for _, ped in entities.get_all_peds_as_handles() do
	        if (includeMyPed or myPed ~= ped) and v3.distance(pos, ENTITY.GET_ENTITY_COORDS(ped)) <= manipulateRange then
	            if includePlayerPeds or (includePeds and not PED.IS_PED_A_PLAYER(ped)) or (includeMyPed and ped == myPed) then
	                if not Ped.getVehicle(ped) then
	                    if not ENTITY.IS_ENTITY_DEAD(ped) then
	                        if fireworksPeds then
	                            Ped.fireworks(ped)
	                        end
	                        if atomizePeds then
	                            Ped.atomize(ped)
	                        end
	                        if ragdoll then
	                            Ped.ragdoll(ped)
	                        end
	                        if waterJet then
	                            Ped.waterJet(ped)
	                        end
	                        if flameJet then
	                            Ped.flameJet(ped)
	                        end
	                        if explodePeds then
	                            Ped.explode(ped)
	                        end
	                        if randomExplodePeds then
	                            Ped.explode(ped, true)
	                        end
	                        if shootPeds then
	                            Ped.shoot(ped)
	                        end
	                        if airstrikePeds then
	                            Ped.airstrike(ped)
	                        end
	                    end
	                end
	                if healPeds then
	                    if PED.IS_PED_A_PLAYER(ped) then
	                        Player.heal(Network.getPlayerFromPed(ped))
	                    elseif ENTITY.IS_ENTITY_DEAD(ped) then
	                        Ped.revive(ped)
	                    end
	                end
	            end
	        end
	    end
	    for _, pid in players.list(false, true, true) do
	        local pName = Player.getPlayerName(pid, false, true)
	        local playerRef = menu.ref_by_path("Players>" .. pName)
	        if not playerRef:isValid() then
	            goto continue
	        end
	        local casinoRef = menu.ref_by_rel_path(playerRef, "Friendly>Drop Casino Figurines")
	        local cardsRef = menu.ref_by_rel_path(playerRef, "Friendly>Drop Playing Cards")
	        local pqRef = menu.ref_by_rel_path(playerRef, "Friendly>Drop P's & Q's")
	        local disarmRef = menu.ref_by_rel_path(playerRef, "Weapons>Disarm")
	        local ammoRef = menu.ref_by_rel_path(playerRef, "Weapons>Give Ammo")
	        local allWeaponsRef = menu.ref_by_rel_path(playerRef, "Weapons>Give All Weapons")
	        local otrRef = menu.ref_by_rel_path(playerRef, "Friendly>Off The Radar")
	        local ceoRef = menu.ref_by_rel_path(playerRef, "Friendly>CEO Money Loop")
	        local collectibleRef = menu.ref_by_rel_path(playerRef, "Friendly>Give Collectibles>All")
	        if v3.distance(pos, Player.getPlayerPosition(pid)) <= manipulateRange then
	            if casinoRef:isValid() and casinoRef.value ~= dropCasino then
	                menu.trigger_command(casinoRef, tostring(dropCasino))
	            end
	            if cardsRef:isValid() and cardsRef.value ~= dropCards then
	                menu.trigger_command(cardsRef, tostring(dropCards))
	            end
	            if pqRef:isValid() and pqRef.value ~= dropPQ then
	                menu.trigger_command(pqRef, tostring(dropPQ))
	            end
	            if disarmRef:isValid() and disarmRef.value ~= disarm then
	                menu.trigger_command(disarmRef, tostring(disarm))
	            end
	            if otrRef:isValid() and otrRef.value ~= otr then
	                menu.trigger_command(otrRef, tostring(otr))
	            end
	            if ceoRef:isValid() and ceoRef.value ~= ceoMoney then
	                menu.trigger_command(ceoRef, tostring(ceoMoney))
	            end
	            if giveAmmo and ammoRef:isValid() then
	                menu.trigger_command(ammoRef)
	            end
	            if giveAllWeapons and allWeaponsRef:isValid() then
	                menu.trigger_command(allWeaponsRef)
	            end
	            if giveCollectibles and collectibleRef:isValid() then
	                menu.trigger_command(collectibleRef)
	            end
	            if makeWanted and Player.getWantedLevel(pid) == 0 then
	                Player.makeWanted(pid)
	            end
	            if neverWanted and Player.getWantedLevel(pid) > 0 then
	                Player.makeWanted(pid, 0)
	            end
	            if placeBounty and not players.get_bounty(pid) then
	                Player.placeBounty(pid)
	            end
	        else
	            if casinoRef.value then
	                menu.trigger_command(casinoRef, "off")
	            end
	            if cardsRef.value then
	                menu.trigger_command(cardsRef, "off")
	            end
	            if disarmRef.value then
	                menu.trigger_command(disarmRef, "off")
	            end
	            if otrRef.value then
	                menu.trigger_command(otrRef, "off")
	            end
	        end
	        ::continue::
	    end
	end
	function onStopManipulate()
	    if not util.is_session_started() then
	        return
	    end
	    for _, pid in players.list(false, true, true) do
	        local pName = Player.getPlayerName(pid, false, true)
	        local playerRef = menu.ref_by_path("Players>" .. pName)
	        local casinoRef = menu.ref_by_rel_path(playerRef, "Friendly>Drop Casino Figurines")
	        local cardsRef = menu.ref_by_rel_path(playerRef, "Friendly>Drop Playing Cards")
	        local pqRef = menu.ref_by_rel_path(playerRef, "Friendly>Drop P's & Q's")
	        local disarmRef = menu.ref_by_rel_path(playerRef, "Weapons>Disarm")
	        local otrRef = menu.ref_by_rel_path(playerRef, "Friendly>Off The Radar")
	        local ceoRef = menu.ref_by_rel_path(playerRef, "Friendly>CEO Money Loop")
	        if casinoRef:isValid() and casinoRef.value then
	            menu.trigger_command(casinoRef, "off")
	        end
	        if cardsRef:isValid() and cardsRef.value then
	            menu.trigger_command(cardsRef, "off")
	        end
	        if pqRef:isValid() and pqRef.value then
	            menu.trigger_command(pqRef, "off")
	        end
	        if disarmRef:isValid() and disarmRef.value then
	            menu.trigger_command(disarmRef, "off")
	        end
	        if otrRef:isValid() and otrRef.value then
	            menu.trigger_command(otrRef, "off")
	        end
	        if ceoRef:isValid() and ceoRef.value then
	            menu.trigger_command(ceoRef, "off")
	        end
	    end
	end	local function setupManipulateAreaMenu(worldMenu)
	    menu.divider(worldMenu, UND_translations.world.manipulateArea .. " ")
	    local manipulateAreaSettings = menu.list(worldMenu, UND_translations.world.manipulateAreaSettings, {}, "")
	    local rangeSlider = menu.slider(manipulateAreaSettings, UND_translations.general.range, {Utils.getCommandName("manipulaterange")}, "", 2, 500, manipulateRange, 2,
	        function(val)
	            manipulateRange = val
	        end)
	    manipulateRange = menu.get_value(rangeSlider)
	    menu.on_tick_in_viewport(rangeSlider, function()
	        local pos = Player.getPlayerPosition()
	        local rangePos = v3.new(pos)
	        v3.mul(rangePos, manipulateRange)
	        GRAPHICS.DRAW_MARKER_SPHERE(pos.x, pos.y, pos.z, manipulateRange, 0, 255, 0, 0.3)
	    end)
	    local includeMyVehicleToggle = menu.toggle(manipulateAreaSettings, UND_translations.general.includeMyVeh, {Utils.getCommandName("manipulateincludemyveh")}, "",
	        function(on)
	            includeMyVehicle = on
	        end, includeMyVehicle)
	    includeMyVehicle = menu.get_value(includeMyVehicleToggle)
	    local includePlayerVehsToggle = menu.toggle(manipulateAreaSettings, UND_translations.general.includePlayerVehs, {Utils.getCommandName("manipulateincludeplayervehs")},
	        "", function(on)
	            includePlayerVehs = on
	        end, includePlayerVehs)
	    includePlayerVehs = menu.get_value(includePlayerVehsToggle)
	    local includePedVehsToggle = menu.toggle(manipulateAreaSettings, UND_translations.general.includePedVehs, {Utils.getCommandName("manipulateincludepedvehs")}, "",
	        function(on)
	            includePedVehs = on
	        end, includePedVehs)
	    includePedVehs = menu.get_value(includePedVehsToggle)
	    local includeMyPedToggle = menu.toggle(manipulateAreaSettings, UND_translations.general.includeMyPed, {Utils.getCommandName("manipulateincludemyped")}, "", function(on)
	        includeMyPed = on
	    end, includeMyPed)
	    includeMyPed = menu.get_value(includeMyPedToggle)
	    local includePlayerPedsToggle = menu.toggle(manipulateAreaSettings, UND_translations.general.includePlayerPeds, {Utils.getCommandName("manipulateincludeplayerpeds")},
	        "", function(on)
	            includePlayerPeds = on
	        end, includePlayerPeds)
	    includePlayerPeds = menu.get_value(includePlayerPedsToggle)
	    local includePedsToggle = menu.toggle(manipulateAreaSettings, UND_translations.general.includePeds, {Utils.getCommandName("manipulateincludepeds")}, "", function(on)
	        includePeds = on
	    end, includePeds)
	    includePeds = menu.get_value(includePedsToggle)
	    local delaySlider = menu.slider(manipulateAreaSettings, UND_translations.general.delay, {Utils.getCommandName("manipulateareadelay")}, "", 500, 2000, delay, 100,
	        function(val)
	            delay = val
	        end)
	    delay = menu.get_value(delaySlider)	    local actionsMenu = menu.list(worldMenu, UND_translations.world.manipulateAreaActions)
	    local vehsMenu = menu.list(actionsMenu, UND_translations.world.vehicles)
	    local pedsMenu = menu.list(actionsMenu, UND_translations.world.peds)
	    local playersMenu = menu.list(actionsMenu, UND_translations.player.players)	    local damageVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.damage, {Utils.getCommandName("manipulatedamage")}, "", function(on)
	        damage = on
	    end, damage)
	    damage = menu.get_value(damageVehToggle)
	    local killEngineVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.killEngine, {Utils.getCommandName("manipulatekillengine")}, "", function(on)
	        killEngine = on
	    end, killEngine)
	    killEngine = menu.get_value(killEngineVehToggle)
	    local explodeVehToggle = menu.toggle(vehsMenu, UND_translations.general.explode, {Utils.getCommandName("manipulateexplodeveh")}, "", function(on)
	        explodeVehicle = on
	    end, explodeVehicle)
	    explodeVehicle = menu.get_value(explodeVehToggle)
	    local randomExplodeVehToggle = menu.toggle(vehsMenu, UND_translations.general.randomExplosion, {Utils.getCommandName("manipulaterandomexplodeveh")}, "", function(on)
	        randomExplodeVehicle = on
	    end, randomExplodeVehicle)
	    randomExplodeVehicle = menu.get_value(randomExplodeVehToggle)
	    local airstrikeVehToggle = menu.toggle(vehsMenu, UND_translations.general.airstrike, {Utils.getCommandName("manipulateairstrikeveh")}, "", function(on)
	        airstrikeVehicle = on
	    end, airstrikeVehicle)
	    airstrikeVehicle = menu.get_value(airstrikeVehToggle)
	    local burnVehToggle = menu.toggle(vehsMenu, UND_translations.general.burn, {Utils.getCommandName("manipulateburnveh")}, "", function(on)
	        burnVehicle = on
	    end, burnVehicle)
	    burnVehicle = menu.get_value(burnVehToggle)
	    local empVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.EMP, {Utils.getCommandName("manipulateemp")}, "", function(on)
	        emp = on
	    end, emp)
	    emp = menu.get_value(empVehToggle)
	    local engineOffVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.engineOff, {Utils.getCommandName("manipulateengineoff")}, "", function(on)
	        engineOff = on
	    end, engineOff)
	    engineOff = menu.get_value(engineOffVehToggle)
	    local bumpVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.bump, {Utils.getCommandName("manipulatebump")}, "", function(on)
	        bump = on
	    end, bump)
	    bump = menu.get_value(bumpVehToggle)
	    local atomizeVehsToggle = menu.toggle(vehsMenu, UND_translations.general.atomize, {Utils.getCommandName("manipulateatomizeveh")}, "", function(on)
	        atomizeVehicles = on
	    end, atomizeVehicles)
	    atomizeVehicles = menu.get_value(atomizeVehsToggle)
	    local stopVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.stop, {Utils.getCommandName("manipulatestop")}, "", function(on)
	        stop = on
	    end, stop)
	    stop = menu.get_value(stopVehToggle)
	    local freezeVehToggle = menu.toggle(vehsMenu, UND_translations.general.freeze, {Utils.getCommandName("manipulatefreezeveh")}, "", function(on)
	        if on and unfreezeVehicle then
	            menu.trigger_commands(Utils.getCommandName("manipulateunfreezeveh") .. " off")
	        end
	        freezeVehicle = on
	    end, freezeVehicle)
	    freezeVehicle = menu.get_value(freezeVehToggle)
	    local unfreezeVehToggle = menu.toggle(vehsMenu, UND_translations.general.unfreeze, {Utils.getCommandName("manipulateunfreezeveh")}, "", function(on)
	        if on and freezeVehicle then
	            menu.trigger_command(freezeVehToggle, "off")
	        end
	        unfreezeVehicle = on
	    end, unfreezeVehicle)
	    unfreezeVehicle = menu.get_value(unfreezeVehToggle)
	    local slickVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.slick, {Utils.getCommandName("manipulateslick")}, "", function(on)
	        slick = on
	    end, slick)
	    slick = menu.get_value(slickVehToggle)
	    local spinVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.spin, {Utils.getCommandName("manipulatespin")}, "", function(on)
	        spin = on
	    end, spin)
	    spin = menu.get_value(spinVehToggle)
	    local rotateVehToggle = menu.toggle(vehsMenu, UND_translations.general.rotate, {Utils.getCommandName("manipulaterotate")}, "", function(on)
	        rotate = on
	    end, rotate)
	    rotate = menu.get_value(rotateVehToggle)
	    local flipHVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.hFlip, {Utils.getCommandName("manipulatefliph")}, "", function(on)
	        flipH = on
	    end, flipH)
	    flipH = menu.get_value(flipHVehToggle)
	    local flipVVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.vFlip, {Utils.getCommandName("manipulateflipv")}, "", function(on)
	        flipV = on
	    end, flipV)
	    flipV = menu.get_value(flipVVehToggle)
	    local launchTypeSelect = menu.list_select(vehsMenu, UND_translations.general.launchType, {Utils.getCommandName("manipulatelaunchtype")}, "", launchTypes, 1,
	        function(idx)
	            launchType = launchTypes[idx]
	        end)
	    launchType = launchTypes[menu.get_value(launchTypeSelect)]
	    local launchToggle = menu.toggle(vehsMenu, UND_translations.vehicle.launch, {Utils.getCommandName("manipulatelaunch")}, "", function(on)
	        launch = on
	    end, launch)
	    launch = menu.get_value(launchToggle)
	    local glitchToggle = menu.toggle(vehsMenu, UND_translations.vehicle.glitch, {Utils.getCommandName("manipulateglitch")}, "", function(on)
	        glitch = on
	    end, glitch)
	    glitch = menu.get_value(glitchToggle)
	    local emptyVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.empty, {Utils.getCommandName("manipulateempty")}, "", function(on)
	        empty = on
	    end, empty)
	    empty = menu.get_value(emptyVehToggle)
	    local upgradeVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.randomUpgrades, {Utils.getCommandName("manipulaterandomupgrade")}, "", function(on)
	        upgrade = on
	    end, upgrade)
	    upgrade = menu.get_value(upgradeVehToggle)
	    local repairVehToggle = menu.toggle(vehsMenu, UND_translations.vehicle.repair, {Utils.getCommandName("manipulaterepair")}, "", function(on)
	        repair = on
	    end, repair)
	    repair = menu.get_value(repairVehToggle)
	    local setVehGodToggle = menu.toggle(vehsMenu, UND_translations.general.setGod, {Utils.getCommandName("manipulatesetgodveh")}, "", function(on)
	        if on and removeGodVehicle then
	            menu.trigger_commands(Utils.getCommandName("manipulateremovegodveh") .. " off")
	        end
	        setGodVehicle = on
	    end, setGodVehicle)
	    setGodVehicle = menu.get_value(setVehGodToggle)
	    local removeVehGodToggle = menu.toggle(vehsMenu, UND_translations.general.removeGod, {Utils.getCommandName("manipulateremovegodveh")}, "", function(on)
	        if on and setGodVehicle then
	            menu.trigger_command(setVehGodToggle, "off")
	        end
	        removeGodVehicle = on
	    end, removeGodVehicle)
	    removeGodVehicle = menu.get_value(removeVehGodToggle)
	    local fireworkVehToggle = menu.toggle(vehsMenu, UND_translations.general.fireworks, {Utils.getCommandName("manipulatefireworksveh")}, "", function(on)
	        fireworksVehicles = on
	    end, fireworksVehicles)
	    fireworksVehicles = menu.get_value(fireworkVehToggle)
	    local hornExpToggle = menu.toggle(vehsMenu, UND_translations.vehicle.hornExplosions, {Utils.getCommandName("manipulatehornexplosions")}, "", function(on)
	        hornExplosions = on
	    end, hornExplosions)
	    hornExplosions = menu.get_value(hornExpToggle)	    local fireworksPedsToggle = menu.toggle(pedsMenu, UND_translations.general.fireworks, {Utils.getCommandName("manipulatefireworksped")}, "", function(on)
	        fireworksPeds = on
	    end, fireworksPeds)
	    fireworksPeds = menu.get_value(fireworksPedsToggle)
	    local atomizePedsToggle = menu.toggle(pedsMenu, UND_translations.general.atomize, {Utils.getCommandName("manipulateatomizeped")}, "", function(on)
	        atomizePeds = on
	    end, atomizePeds)
	    atomizePeds = menu.get_value(atomizePedsToggle)
	    local ragdollToggle = menu.toggle(pedsMenu, UND_translations.general.ragdoll, {Utils.getCommandName("manipulateragdoll")}, "", function(on)
	        ragdoll = on
	    end, ragdoll)
	    ragdoll = menu.get_value(ragdollToggle)
	    local waterJetToggle = menu.toggle(pedsMenu, UND_translations.player.waterJet, {Utils.getCommandName("manipulatewaterjet")}, "", function(on)
	        waterJet = on
	    end, waterJet)
	    waterJet = menu.get_value(waterJetToggle)
	    local flameJetToggle = menu.toggle(pedsMenu, UND_translations.player.flameJet, {Utils.getCommandName("manipulateflamejet")}, "", function(on)
	        flameJet = on
	    end, flameJet)
	    flameJet = menu.get_value(flameJetToggle)
	    local explodePedsToggle = menu.toggle(pedsMenu, UND_translations.general.explode, {Utils.getCommandName("manipulateexplodeped")}, "", function(on)
	        explodePeds = on
	    end, explodePeds)
	    explodePeds = menu.get_value(explodePedsToggle)
	    local randomExplodePedsToggle = menu.toggle(pedsMenu, UND_translations.general.randomExplosion, {Utils.getCommandName("manipulaterandomexplodeped")}, "", function(on)
	        randomExplodePeds = on
	    end, randomExplodePeds)
	    randomExplodePeds = menu.get_value(randomExplodePedsToggle)
	    local airstrikePedsToggle = menu.toggle(pedsMenu, UND_translations.general.airstrike, {Utils.getCommandName("manipulateairstrikeped")}, "", function(on)
	        airstrikePeds = on
	    end, airstrikePeds)
	    airstrikePeds = menu.get_value(airstrikePedsToggle)
	    local shootPedsToggle = menu.toggle(pedsMenu, UND_translations.general.shoot, {Utils.getCommandName("manipulateshootped")}, "", function(on)
	        shootPeds = on
	    end, shootPeds)
	    shootPeds = menu.get_value(shootPedsToggle)
	    local healPedsToggle = menu.toggle(pedsMenu, UND_translations.aim.heal, {Utils.getCommandName("manipulateheal")}, "", function(on)
	        healPeds = on
	    end, healPeds)
	    healPeds = menu.get_value(healPedsToggle)	    menu.divider(playersMenu, UND_translations.player.friendly)
	    local dropCasinoToggle = menu.toggle(playersMenu, UND_translations.world.dropCasino, {Utils.getCommandName("manipulatedropcasino")}, "", function(on)
	        dropCasino = on
	    end, dropCasino)
	    dropCasino = menu.get_value(dropCasinoToggle)
	    local dropCardsToggle = menu.toggle(playersMenu, UND_translations.world.dropCards, {Utils.getCommandName("manipulatedropcards")}, "", function(on)
	        dropCards = on
	    end, dropCards)
	    dropCards = menu.get_value(dropCardsToggle)
	    local dropPQToggle = menu.toggle(playersMenu, UND_translations.player.dropPQ, {Utils.getCommandName("manipulatedroppq")}, "", function(on)
	        dropPQ = on
	    end, dropPQ)
	    dropPQ = menu.get_value(dropPQToggle)
	    local collectiblesToggle = menu.toggle(playersMenu, UND_translations.general.giveCollectibles, {Utils.getCommandName("manipulategivecollectibles")}, "", function(on)
	        giveCollectibles = on
	    end, giveCollectibles)
	    giveCollectibles = menu.get_value(collectiblesToggle)
	    local ceoToggle = menu.toggle(playersMenu, UND_translations.player.ceoMoney, {Utils.getCommandName("manipulateceomoney")}, "", function(on)
	        ceoMoney = on
	    end, ceoMoney)
	    ceoMoney = menu.get_value(ceoToggle)
	    local neverWantedToggle = menu.toggle(playersMenu, UND_translations.player.neverWanted, {Utils.getCommandName("manipulateneverwanted")}, "", function(on)
	        if on and makeWanted then
	            menu.trigger_commands(Utils.getCommandName("manipulatemakewanted") .. " off")
	        end
	        neverWanted = on
	    end, neverWanted)
	    neverWanted = menu.get_value(neverWantedToggle)
	    local otrToggle = menu.toggle(playersMenu, UND_translations.player.otr, {Utils.getCommandName("manipulateotr")}, "", function(on)
	        otr = on
	    end, otr)
	    otr = menu.get_value(otrToggle)
	    local ammoToggle = menu.toggle(playersMenu, UND_translations.world.giveAmmo, {Utils.getCommandName("manipulategiveammo")}, "", function(on)
	        giveAmmo = on
	    end, giveAmmo)
	    giveAmmo = menu.get_value(ammoToggle)
	    local allWeaponsToggle = menu.toggle(playersMenu, UND_translations.player.giveAllWeapons, {Utils.getCommandName("manipulategiveweapons")}, "", function(on)
	        giveAllWeapons = on
	    end, giveAllWeapons)
	    giveAllWeapons = menu.get_value(allWeaponsToggle)
	    menu.divider(playersMenu, UND_translations.player.trolling)
	    local makeWantedToggle = menu.toggle(playersMenu, UND_translations.player.makeWanted, {Utils.getCommandName("manipulatemakewanted")}, "", function(on)
	        if on and neverWanted then
	            menu.trigger_command(neverWantedToggle, "off")
	        end
	        makeWanted = on
	    end, makeWanted)
	    makeWanted = menu.get_value(makeWantedToggle)
	    local placeBountyToggle = menu.toggle(playersMenu, UND_translations.player.placeBounty, {Utils.getCommandName("manipulateplacebounty")}, "", function(on)
	        placeBounty = on
	    end, placeBounty)
	    placeBounty = menu.get_value(placeBountyToggle)
	    local disarmToggle = menu.toggle(playersMenu, UND_translations.aim.disarm, {Utils.getCommandName("manipulatedisarm")}, "", function(on)
	        disarm = on
	    end, disarm)
	    disarm = menu.get_value(disarmToggle)
	    menu.toggle_loop(worldMenu, UND_translations.world.manipulateArea, {Utils.getCommandName("manipulatearea")}, UND_translations.world.manipulateAreaD, function()
	        manipulateArea()
	        util.yield(delay)
	    end, onStopManipulate)
	end
	return setupManipulateAreaMenu
end
package.loaded["src.lib.menus.world.manipulateArea"] = nil
package.preload["src.lib.network"] = function(...)
	local Network = {}
	function Network.getPlayerFromPed(ped)
	    return NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(ped)
	end
	function Network.requestControlOnce(entity)
	    if not util.is_session_started() then
	        return true
	    end
	    local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
	    if NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(entity) or NETWORK.NETWORK_HAS_CONTROL_OF_NETWORK_ID(netId) then
	        return true
	    end
	    NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netId, true)
	    local gotAccess = NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity) and NETWORK.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(netId)
	    if not gotAccess then
	        gotAccess = NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(entity) and NETWORK.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(netId)
	    end
	    return gotAccess
	end
	function Network.requestControl(entity, timeout, dontShowError)
	    if not ENTITY.DOES_ENTITY_EXIST(entity) then
	        return false
	    end
	    timeout = timeout or 700
	    local endTime = Utils.getTime(timeout)
	    while not Network.requestControlOnce(entity) and Utils.getTime() < endTime do
	        util.yield_once()
	    end
	    local success = Utils.getTime() < endTime
	    if not success and not dontShowError then
	        Utils.showToast(UND_translations.general.noAccess)
	    end
	    return success
	end
	return Network
end
package.loaded["src.lib.network"] = nil
package.preload["src.lib.menus.world"] = function(...)
	local setupClearAreaMenu = require "src.lib.menus.world.clearArea"
	local setupManipulateAreaMenu = require "src.lib.menus.world.manipulateArea"
	local function setupWorldMenu()
	    local worldMenu = menu.list(menu.my_root(), UND_translations.world.name, {}, "")
	    setupClearAreaMenu(worldMenu)
	    setupManipulateAreaMenu(worldMenu)
	end
	return setupWorldMenu
end
package.loaded["src.lib.menus.world"] = nil
package.preload["src.lib.menus.main"] = function(...)
	local setupAimMenu = require "src.lib.menus.aim"
	local setupSelfMenu = require "src.lib.menus.self"
	local setupSessionMenu = require "src.lib.menus.online"
	local setupTeleportMenu = require "src.lib.menus.teleport"
	local setupVehicleMenu = require "src.lib.menus.vehicle"
	local setupWorldMenu = require "src.lib.menus.world"
	local setupPlayerMenu = require "src.lib.menus.player"
	local setupSettingsMenu = require "src.lib.menus.settings"
	local function startScript()
	    math.randomseed(util.current_time_millis())
	    math.random()
	    math.random()
	    math.random()
	    util.require_natives(1672190175)
	    local rootMenu = menu.my_root()
	    menu.divider(rootMenu, SCRIPT_NAME .. " v" .. CONSTANTS.SCRIPT.VERSION)
	    menu.hyperlink(rootMenu, UND_translations.main.goToGitlab, "https://gitlab.com/undefinedscripts/undefined-for-stand/-/tree/main", UND_translations.main.goToGitlabD)
	    menu.hyperlink(rootMenu, UND_translations.main.checkChangelog, "https://gitlab.com/undefinedscripts/undefined-for-stand/-/releases", "")
	    menu.action(rootMenu, UND_translations.player.players, {}, UND_translations.player.playersD, function()
	        menu.trigger_command(menu.ref_by_path("Players", 37))
	    end)
	    menu.divider(rootMenu, UND_translations.main.features)
	    setupPlayerMenu()
	    setupSelfMenu()
	    setupAimMenu()
	    setupSessionMenu()
	    setupTeleportMenu()
	    setupVehicleMenu()
	    setupWorldMenu()
	    setupSettingsMenu()
	end
	startScript()
end
package.loaded["src.lib.menus.main"] = nil
package.preload["src.lib.vehicle"] = function(...)
	local allVehicles = util.get_vehicles()
	local Vehicle = {}
	function Vehicle.setVehiclePlate(vehicle, text)
	    if text and text:len() > 0 then
	        VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vehicle, text)
	    end
	end	function Vehicle.repairVehicle(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    VEHICLE.SET_VEHICLE_FIXED(vehicle)
	    VEHICLE.SET_VEHICLE_DEFORMATION_FIXED(vehicle)
	    VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, 1000)
	end
	function Vehicle.toggleVehicleGodMode(vehicle, on)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    if on then
	        VEHICLE.SET_VEHICLE_ENVEFF_SCALE(vehicle, 0.0)
	        VEHICLE.SET_VEHICLE_BODY_HEALTH(vehicle, 1000.0)
	        VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, 1000.0)
	        VEHICLE.SET_VEHICLE_FIXED(vehicle)
	        VEHICLE.SET_VEHICLE_DEFORMATION_FIXED(vehicle)
	        VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(vehicle, 1000.0)
	        VEHICLE.SET_VEHICLE_DIRT_LEVEL(vehicle, 0.0)
	        for i = 0, 10 do
	            VEHICLE.SET_VEHICLE_TYRE_FIXED(vehicle, i)
	        end
	    end
	    ENTITY.SET_ENTITY_CAN_BE_DAMAGED(vehicle, on)
	    ENTITY.SET_ENTITY_INVINCIBLE(vehicle, on)
	    ENTITY.SET_ENTITY_PROOFS(vehicle, on, on, on, on, on, on, true, on)
	    VEHICLE.SET_DISABLE_VEHICLE_PETROL_TANK_DAMAGE(vehicle, on)
	    VEHICLE.SET_DISABLE_VEHICLE_PETROL_TANK_FIRES(vehicle, on)
	    VEHICLE.SET_VEHICLE_CAN_BE_VISIBLY_DAMAGED(vehicle, not on)
	    VEHICLE.SET_VEHICLE_CAN_BREAK(vehicle, not on)
	    VEHICLE.SET_VEHICLE_ENGINE_CAN_DEGRADE(vehicle, not on)
	    VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(vehicle, not on)
	    VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, not on)
	    VEHICLE.SET_VEHICLE_WHEELS_CAN_BREAK(vehicle, not on)
	end	function Vehicle.cleanVehicle(vehicle)
	    GRAPHICS.REMOVE_DECALS_FROM_VEHICLE(vehicle)
	    VEHICLE.SET_VEHICLE_DIRT_LEVEL(vehicle, 0.0)
	end	local function getRandomColor()
	    local color = {
	        a = 255
	    }
	    color.r = Utils.rand(0, 255)
	    color.g = Utils.rand(0, 255)
	    color.b = Utils.rand(0, 255)
	    return color
	end	function Vehicle.randomUpgradeForVehicle(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    local performanceMods = {11, 12, 13, 15, 16}
	    local bodyPartsMods = {0, 1, 2, 3, 4, 5, 7, 8, 9, 25, 27}
	    VEHICLE.SET_VEHICLE_MOD_KIT(vehicle, 0)
	    for x = 0, 49 do
	        if table.contains(bodyPartsMods, x) and util.reverse_joaat(ENTITY.GET_ENTITY_MODEL(vehicle)) == "entity3" then
	            goto continue
	        end
	        if (x == 14 and not UND_settings.randomUpgrades.horn) or (x == 48 and not UND_settings.randomUpgrades.livery) or
	            ((x == 23 or x == 24) and not UND_settings.randomUpgrades.wheels) or
	            (table.contains(performanceMods, x) and (not UND_settings.randomUpgrades.performance or UND_settings.randomUpgrades.maxPerformance)) or
	            (table.contains(bodyPartsMods, x) and not UND_settings.randomUpgrades.bodyParts) or (x == 10 and not UND_settings.randomUpgrades.weaponRoof) or
	            (x == 6 and not UND_settings.randomUpgrades.grilleCounter) then
	            if table.contains(performanceMods, x) and UND_settings.randomUpgrades.maxPerformance then
	                local max = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, x) - 1
	                VEHICLE.SET_VEHICLE_MOD(vehicle, x, max)
	            end
	            goto continue
	        end
	        local max = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, x) - 1
	        local modVal = Utils.rand(-1, max)
	        if x == 34 and modVal == 3 then
	            modVal = 2
	        end
	        VEHICLE.SET_VEHICLE_MOD(vehicle, x, modVal)
	        ::continue::
	    end
	    if UND_settings.randomUpgrades.windowTint then
	        VEHICLE.SET_VEHICLE_WINDOW_TINT(vehicle, Utils.rand(0, 5))
	    end
	    if UND_settings.randomUpgrades.paint then
	        local primColor, secColor = getRandomColor(), getRandomColor()
	        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, primColor.r, primColor.g, primColor.b)
	        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, secColor.r, secColor.g, secColor.b)
	    end
	    if UND_settings.randomUpgrades.tyreSmoke then
	        local smokeColor = getRandomColor()
	        VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(vehicle, smokeColor.r, smokeColor.g, smokeColor.b)
	    end
	    if UND_settings.randomUpgrades.plateType then
	        VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle, Utils.rand(0, 5))
	    end
	    if UND_settings.randomUpgrades.lights then
	        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle, Utils.rand(0, 12))
	    end
	    if UND_settings.randomUpgrades.neons then
	        VEHICLE.SET_VEHICLE_NEON_COLOUR(vehicle, Utils.rand(0, 255), Utils.rand(0, 255), Utils.rand(0, 255))
	        local enabled = Utils.rand() == 1
	        for i = 0, 3 do
	            VEHICLE.SET_VEHICLE_NEON_ENABLED(vehicle, i, enabled)
	        end
	    end
	    for x = 17, 22 do
	        if x == 18 and (UND_settings.randomUpgrades.maxPerformance or UND_settings.randomUpgrades.performance) then
	            local value = true
	            if not UND_settings.randomUpgrades.maxPerformance then
	                value = Utils.rand() == 1
	            end
	            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, x, value)
	        else
	            VEHICLE.TOGGLE_VEHICLE_MOD(vehicle, x, true)
	        end
	    end
	    Vehicle.cleanVehicle(vehicle)
	end	function Vehicle.getCurrentVehicle(dontShowError, noRequest)
	    local playerVehicle = Ped.getVehicle(Player.getPlayerPed())
	    if not playerVehicle then
	        if not dontShowError then
	            Utils.showToast(UND_translations.vehicle.notInVehicle)
	        end
	        return 0
	    end
	    if noRequest or Network.requestControl(playerVehicle, nil, dontShowError) then
	        return playerVehicle
	    end
	    return 0, true
	end	function Vehicle.getPlayerVehicle(player, dontShowError)
	    local function notInVehicle()
	        if not dontShowError then
	            Utils.showToast(Player.getPlayerName(player) .. " " .. UND_translations.vehicle.playerNotInVehicle)
	        end
	    end
	    local playerPed = Player.getPlayerPed(player)
	    if not PED.IS_PED_IN_ANY_VEHICLE(playerPed, false) then
	        notInVehicle()
	        return 0
	    end
	    local playerVehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
	    if playerVehicle == 0 then
	        notInVehicle()
	        return 0
	    end
	    local vehicleDriver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(playerVehicle, -1, false)
	    if vehicleDriver == Player.getUserPlayer() or Network.requestControl(playerVehicle, nil, dontShowError) then
	        return playerVehicle
	    end
	    return 0
	end
	function Vehicle.getPlayerOrVehicleEntity(noRequest)
	    local vehicle, noAccess = Vehicle.getCurrentVehicle(true, noRequest)
	    if vehicle ~= 0 then
	        return vehicle
	    end
	    if noAccess and not noRequest then
	        Utils.showToast(UND_translations.vehicle.noAccess)
	        return nil
	    end
	    return Player.getPlayerPed()
	end
	function Vehicle.getTargetVehicleData(entity)
	    local vehicle = ENTITY.GET_VEHICLE_INDEX_FROM_ENTITY_INDEX(entity)
	    local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1, true)
	    local player = Network.getPlayerFromPed(driver)
	    local result = {}
	    result.vehicle = vehicle
	    result.driver = driver
	    result.player = player
	    return result
	end	function Vehicle.getClosestVehicleTo(entity, includePlayerVehicles)
	    local coords = ENTITY.GET_ENTITY_COORDS(entity, true)
	    local maxDistance = 10000
	    local closestVehicle
	    local curVehicle = Ped.getVehicle(Player.getPlayerPed())
	    for _, vehicle in entities.get_all_vehicles_as_handles() do
	        local modelHash = ENTITY.GET_ENTITY_MODEL(vehicle)
	        if vehicle ~= curVehicle and not ENTITY.IS_ENTITY_DEAD(vehicle) and ENTITY.IS_ENTITY_VISIBLE(vehicle) and VEHICLE.IS_VEHICLE_DRIVEABLE(vehicle, true) and
	            not VEHICLE.IS_THIS_MODEL_A_TRAIN(modelHash) and not util.is_this_model_a_trailer(modelHash) and ENTITY.GET_ENTITY_ALPHA(vehicle) == 255 and
	            Network.requestControlOnce(vehicle) then
	            local vehicleData = Vehicle.getTargetVehicleData(vehicle)
	            if includePlayerVehicles or vehicleData.player == -1 then
	                local vehicleCoords = ENTITY.GET_ENTITY_COORDS(vehicle, true)
	                local distance = v3.distance(coords, vehicleCoords)
	                if distance < maxDistance then
	                    maxDistance = distance
	                    closestVehicle = vehicle
	                end
	            end
	        end
	    end
	    return closestVehicle
	end	function Vehicle.getClosestVehicleToCoords(coords, includePlayerVehicles)
	    local maxDistance = 6
	    local closestVehicle
	    local curVehicle = PED.IS_PED_IN_ANY_VEHICLE(Player.getPlayerPed(), false) and entities.get_user_vehicle_as_pointer()
	    for _, vehicle in entities.get_all_vehicles_as_pointers() do
	        local modelHash = entities.get_model_hash(vehicle)
	        if vehicle ~= curVehicle and not VEHICLE.IS_THIS_MODEL_A_TRAIN(modelHash) then
	            if includePlayerVehicles or entities.get_owner(vehicle) == 0 then
	                local vehicleCoords = entities.get_position(vehicle)
	                local distance = v3.distance(coords, vehicleCoords)
	                if distance < maxDistance then
	                    maxDistance = distance
	                    closestVehicle = vehicle
	                end
	            end
	        end
	    end
	    if closestVehicle then
	        return entities.pointer_to_handle(closestVehicle)
	    end
	    return nil
	end
	function Vehicle.launch(entity, direction)
	    if not Network.requestControl(entity) then
	        return
	    end
	    if direction == "down" then
	        ENTITY.SET_ENTITY_VELOCITY(entity, 0, 0, -1000)
	    elseif direction == "up" then
	        ENTITY.SET_ENTITY_VELOCITY(entity, 0, 0, 1000)
	    elseif direction == "forward" then
	        VEHICLE.SET_VEHICLE_FORWARD_SPEED(entity, 200.0)
	    else
	        VEHICLE.SET_VEHICLE_FORWARD_SPEED(entity, -200.0)
	    end
	end	function Vehicle.randomLaunch(entity)
	    if not Network.requestControl(entity) then
	        return
	    end
	    local randX = Utils.rand(-200, 200)
	    local randY = Utils.rand(-200, 200)
	    local randZ = Utils.rand(-200, 200)
	    ENTITY.APPLY_FORCE_TO_ENTITY(entity, 1, randX, randY, randZ, randX, randY, randZ, 0, 0, 0, 0, 0, 0)
	end	function Vehicle.empty(vehicle)
	    local maxPassengers = VEHICLE.GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle)
	    for i = -1, maxPassengers do
	        if UND_settings.emptyFrom ~= UND_translations.general.all then
	            if (i == -1 and UND_settings.emptyFrom ~= UND_translations.general.driver) or (i > -1 and UND_settings.emptyFrom ~= UND_translations.general.passengers) then
	                goto continue
	            end
	        end
	        if not VEHICLE.IS_VEHICLE_SEAT_FREE(vehicle, i, false) then
	            local pedToKick = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, i, false)
	            Ped.kickFromVehicle(pedToKick)
	        end
	        ::continue::
	    end
	end	function Vehicle.spin(entity)
	    if not Network.requestControl(entity) then
	        return
	    end
	    util.create_thread(function()
	        ENTITY.SET_ENTITY_ANGULAR_VELOCITY(entity, 0, 0, 6000)
	        util.yield(300)
	        ENTITY.SET_ENTITY_ANGULAR_VELOCITY(entity, 0, 0, 3000)
	        util.stop_thread()
	    end)
	end
	function Vehicle.flip(entity, horizontal)
	    if not Network.requestControl(entity) then
	        return
	    end
	    local curRotation = ENTITY.GET_ENTITY_ROTATION(entity, 2)
	    if horizontal then
	        local speed = ENTITY.GET_ENTITY_SPEED(entity)
	        ENTITY.SET_ENTITY_ROTATION(entity, curRotation.x + 180, curRotation.y + 180, curRotation.z, 2, true)
	        VEHICLE.SET_VEHICLE_FORWARD_SPEED(entity, speed)
	    else
	        ENTITY.SET_ENTITY_ROTATION(entity, curRotation.x, curRotation.y + 180, curRotation.z, 2, true)
	    end
	end	function Vehicle.rotate(entity)
	    if not Network.requestControl(entity) then
	        return
	    end
	    local currentRotation = ENTITY.GET_ENTITY_ROTATION(entity, 2)
	    ENTITY.SET_ENTITY_ROTATION(entity, currentRotation.x, currentRotation.y, currentRotation.z + 40, 2, true)
	end	function Vehicle.stop(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, 0)
	end	function Vehicle.putOnWheels(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(vehicle, 5.0)
	end	function Vehicle.turnOffEngine(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, false, true, true)
	    VEHICLE.BRING_VEHICLE_TO_HALT(vehicle, 15.0, 0)
	    VEHICLE.SET_HELI_BLADES_SPEED(vehicle, 0.0)
	    if VEHICLE.IS_THIS_MODEL_A_PLANE(ENTITY.GET_ENTITY_MODEL(vehicle)) then
	        util.create_thread(function()
	            util.yield(Utils.rand(1000, 3000))
	            VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, false, false)
	            util.stop_thread()
	        end)
	    end
	end
	local colorR, colorG, colorB = memory.alloc(1), memory.alloc(1), memory.alloc(1)
	function Vehicle.copyVehicleData(vehicle, cloneVehicle)
	    VEHICLE.SET_VEHICLE_MOD_KIT(cloneVehicle, 0)
	    for i = 17, 22 do
	        VEHICLE.TOGGLE_VEHICLE_MOD(cloneVehicle, i, VEHICLE.IS_TOGGLE_MOD_ON(vehicle, i))
	    end
	    for i = 0, 49 do
	        local modValue = VEHICLE.GET_VEHICLE_MOD(vehicle, i)
	        VEHICLE.SET_VEHICLE_MOD(cloneVehicle, i, modValue)
	    end
	    if VEHICLE.GET_IS_VEHICLE_PRIMARY_COLOUR_CUSTOM(vehicle) then
	        VEHICLE.GET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vehicle, colorR, colorG, colorB)
	        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	    else
	        VEHICLE.GET_VEHICLE_MOD_COLOR_1(vehicle, colorR, colorG, colorB)
	        VEHICLE.SET_VEHICLE_MOD_COLOR_1(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	    end
	    if VEHICLE.GET_IS_VEHICLE_SECONDARY_COLOUR_CUSTOM(vehicle) then
	        VEHICLE.GET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vehicle, colorR, colorG, colorB)
	        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	    else
	        VEHICLE.GET_VEHICLE_MOD_COLOR_2(vehicle, colorR, colorG)
	        VEHICLE.SET_VEHICLE_MOD_COLOR_2(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG))
	    end
	    VEHICLE.GET_VEHICLE_COLOURS(vehicle, colorR, colorG)
	    VEHICLE.SET_VEHICLE_COLOURS(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG))
	    VEHICLE.GET_VEHICLE_EXTRA_COLOURS(vehicle, colorR, colorG)
	    VEHICLE.SET_VEHICLE_EXTRA_COLOURS(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG))
	    VEHICLE.GET_VEHICLE_EXTRA_COLOUR_5(vehicle, colorR)
	    VEHICLE.GET_VEHICLE_EXTRA_COLOUR_6(vehicle, colorG)
	    VEHICLE.SET_VEHICLE_EXTRA_COLOUR_5(cloneVehicle, memory.read_ubyte(colorR))
	    VEHICLE.SET_VEHICLE_EXTRA_COLOUR_6(cloneVehicle, memory.read_ubyte(colorG))
	    VEHICLE.GET_VEHICLE_TYRE_SMOKE_COLOR(vehicle, colorR, colorG, colorB)
	    VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	    VEHICLE.GET_VEHICLE_NEON_COLOUR(vehicle, colorR, colorG, colorB)
	    VEHICLE.SET_VEHICLE_NEON_COLOUR(cloneVehicle, memory.read_ubyte(colorR), memory.read_ubyte(colorG), memory.read_ubyte(colorB))
	    for i = 0, 3 do
	        VEHICLE.SET_VEHICLE_NEON_ENABLED(cloneVehicle, i, VEHICLE.GET_VEHICLE_NEON_ENABLED(vehicle, i))
	    end
	    local windowTint = VEHICLE.GET_VEHICLE_WINDOW_TINT(vehicle)
	    VEHICLE.SET_VEHICLE_WINDOW_TINT(cloneVehicle, windowTint)
	    local lightsColor = VEHICLE.GET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vehicle)
	    VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(cloneVehicle, lightsColor)
	    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(cloneVehicle, VEHICLE.GET_VEHICLE_NUMBER_PLATE_TEXT_INDEX(vehicle))
	    Vehicle.setVehiclePlate(cloneVehicle, VEHICLE.GET_VEHICLE_NUMBER_PLATE_TEXT(vehicle))
	    VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(cloneVehicle, VEHICLE.GET_VEHICLE_TYRES_CAN_BURST(vehicle))
	    VEHICLE.SET_VEHICLE_DIRT_LEVEL(cloneVehicle, VEHICLE.GET_VEHICLE_DIRT_LEVEL(vehicle))
	    for i = 1, 14 do
	        VEHICLE.SET_VEHICLE_EXTRA(cloneVehicle, i, not VEHICLE.IS_VEHICLE_EXTRA_TURNED_ON(vehicle, i))
	    end
	    local roofState = VEHICLE.GET_CONVERTIBLE_ROOF_STATE(vehicle)
	    if roofState == 1 or roofState == 2 then
	        VEHICLE.LOWER_CONVERTIBLE_ROOF(cloneVehicle, true)
	    end
	    VEHICLE.SET_VEHICLE_ENGINE_ON(cloneVehicle, VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(vehicle), true, true)
	end
	function Vehicle.clone(vehicle)
	    local vehicleHeading = ENTITY.GET_ENTITY_HEADING(vehicle)
	    local vehicleHash = ENTITY.GET_ENTITY_MODEL(vehicle)
	    local coords = ENTITY.GET_ENTITY_COORDS(vehicle)
	    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle)
	    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 2):toDir()
	    v3.mul(rot, -Utils.getDimensions(vehicle).x - 2)
	    v3.add(coords, rot)
	    local cloneVehicle = entities.create_vehicle(vehicleHash, coords, vehicleHeading)
	    Vehicle.copyVehicleData(vehicle, cloneVehicle)
	    return cloneVehicle
	end	function Vehicle.killEngine(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, -4000)
	end	function Vehicle.burn(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, -1)
	end
	function Vehicle.sink(vehicle, lockDoors)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    if lockDoors then
	        Vehicle.lockDoors(vehicle, true)
	    end
	    ENTITY.SET_ENTITY_COORDS(vehicle, -9725, -7276, -100, false, false, false, false)
	end	function Vehicle.tpToSky(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    local randX = Utils.rand(-2000, 2000)
	    local randY = Utils.rand(-2000, 2000)
	    ENTITY.SET_ENTITY_COORDS(vehicle, randX, randY, 2600, false, false, false, false)
	end
	function Vehicle.explode(vehicle, random)
	    Vehicle.killEngine(vehicle)
	    local coords = ENTITY.GET_ENTITY_COORDS(vehicle)
	    local vel = ENTITY.GET_ENTITY_VELOCITY(vehicle)
	    local speed = ENTITY.GET_ENTITY_SPEED(vehicle)
	    local divider = 20
	    if speed > 70 then
	        divider = 50
	    end
	    local expType = 28
	    if random then
	        expType = Utils.rand(0, 84)
	    end
	    if UND_settings.explodeType == UND_translations.general.owned then
	        FIRE.ADD_OWNED_EXPLOSION(Player.getPlayerPed(), coords.x + vel.x / divider, coords.y + vel.y / divider, coords.z + vel.z / divider, expType, 100, true, false, 0.5)
	    else
	        FIRE.ADD_EXPLOSION(coords.x + vel.x / divider, coords.y + vel.y / divider, coords.z + vel.z / divider, expType, 100, true, false, 0.5)
	    end
	end	function Vehicle.airstrike(vehicle)
	    local coords = ENTITY.GET_ENTITY_COORDS(vehicle)
	    local vel = ENTITY.GET_ENTITY_VELOCITY(vehicle)
	    local weaponHash = Utils.requestWeaponAsset("VEHICLE_WEAPON_PLANE_ROCKET")
	    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(coords.x + Utils.rand(-5, 5), coords.y + Utils.rand(-5, 5), coords.z + 50, coords.x + vel.x, coords.y + vel.y, coords.z + vel.z, 0,
	        false, weaponHash, 0, true, false, 2000)
	    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(weaponHash)
	end	function Vehicle.glitch(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle)
	    local glitchHash = -994492850
	    util.request_model(glitchHash)
	    util.create_thread(function()
	        for i = 1, 100 do
	            local coords = ENTITY.GET_ENTITY_COORDS(vehicle)
	            local glitchObj = entities.create_object(glitchHash, coords)
	            ENTITY.SET_ENTITY_VISIBLE(glitchObj, false)
	            ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0)
	            util.yield(10)
	            Utils.deleteEntity(glitchObj)
	        end
	        util.stop_thread()
	    end)
	    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(glitchHash)
	end	function Vehicle.slick(vehicle)
	    local coords = ENTITY.GET_ENTITY_COORDS(vehicle)
	    local vel = ENTITY.GET_ENTITY_VELOCITY(vehicle)
	    FIRE.ADD_EXPLOSION(coords.x + vel.x / 2, coords.y + vel.y / 2, coords.z + vel.z / 2, 67, 100, true, false, 0)
	end	function Vehicle.bump(vehicle)
	    local coords = ENTITY.GET_ENTITY_COORDS(vehicle)
	    local vel = ENTITY.GET_ENTITY_VELOCITY(vehicle)
	    FIRE.ADD_EXPLOSION(coords.x + vel.x / 8, coords.y + vel.y / 8, coords.z + vel.z / 8, 64, 1, true, true, 0)
	end	function Vehicle.emp(vehicle)
	    local coords = ENTITY.GET_ENTITY_COORDS(vehicle)
	    local vel = ENTITY.GET_ENTITY_VELOCITY(vehicle)
	    FIRE.ADD_EXPLOSION(coords.x + vel.x / 10, coords.y + vel.y / 10, coords.z + vel.z / 10, 83, 1, true, false, 0)
	end	function Vehicle.damage(vehicle)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    if UND_settings.damageSettings.smokeEngine then
	        VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vehicle, 300)
	    end
	    if UND_settings.damageSettings.tyres then
	        VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, true)
	        for i = 0, 7 do
	            if not UND_settings.damageSettings.popOnce or VEHICLE.GET_TYRE_HEALTH(vehicle, i) > 0 then
	                VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, i, true, 1000)
	            end
	        end
	    end
	    if UND_settings.damageSettings.windows then
	        for i = 0, 7 do
	            VEHICLE.SMASH_VEHICLE_WINDOW(vehicle, i)
	        end
	    end
	    if UND_settings.damageSettings.doors then
	        local doorsNum = VEHICLE.GET_NUMBER_OF_VEHICLE_DOORS(vehicle)
	        for i = 0, doorsNum do
	            VEHICLE.SET_VEHICLE_DOOR_BROKEN(vehicle, i, false)
	        end
	    end
	end	function Vehicle.turnOnEngine(vehicle)
	    if not Network.requestControl(vehicle, nil, true) then
	        return
	    end
	    VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, true, true, false)
	    VEHICLE.SET_HELI_BLADES_FULL_SPEED(vehicle)
	end
	function Vehicle.tpToPlayer(vehicle, pid)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    pid = pid or Player.getUserPlayer()
	    local pCoords = Player.getPlayerPosition(pid)
	    local rot = ENTITY.GET_ENTITY_ROTATION(Player.getPlayerPed(pid), 2):toDir()
	    local extraOffset = 0
	    if Ped.getVehicle(Player.getPlayerPed(pid)) then
	        extraOffset = Utils.getDimensions(Ped.getVehicle(Player.getPlayerPed(pid))).x
	    end
	    v3.mul(rot, Utils.getDimensions(vehicle).x + extraOffset + 2)
	    v3.add(pCoords, rot)
	    ENTITY.SET_ENTITY_COORDS(vehicle, pCoords.x, pCoords.y, pCoords.z, false, false, false)
	end
	function Vehicle.freeze(vehicle, enabled)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    ENTITY.FREEZE_ENTITY_POSITION(vehicle, enabled)
	end	function Vehicle.hornBoost(vehicle)
	    if AUDIO.IS_HORN_ACTIVE(vehicle) then
	        local speed = ENTITY.GET_ENTITY_SPEED(vehicle)
	        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, speed + UND_settings.hornBoostSpeed / 2)
	        util.yield(300)
	    end
	end	function Vehicle.hornJump(vehicle)
	    if AUDIO.IS_HORN_ACTIVE(vehicle) then
	        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 1, 0.0, 0.0, UND_settings.hornJumpForce, true, true, true, true)
	        util.yield(500)
	    end
	end	function Vehicle.hornExplosions(vehicle)
	    if AUDIO.IS_HORN_ACTIVE(vehicle) then
	        util.create_thread(function()
	            local coords = ENTITY.GET_ENTITY_COORDS(vehicle)
	            local shootCoords = v3.new(coords)
	            for i = 1, 3 do
	                local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 2):toDir()
	                local vel = ENTITY.GET_ENTITY_VELOCITY(vehicle)
	                v3.mul(rot, 25 + math.abs(vel.x))
	                v3.add(shootCoords, rot)
	                FIRE.ADD_OWNED_EXPLOSION(VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1), shootCoords.x + Utils.rand(-2, 2), shootCoords.y + Utils.rand(-2, 2), shootCoords.z, 10, 100,
	                    true, false, 0.1)
	                util.yield()
	            end
	            util.yield(300)
	            util.stop_thread()
	        end)
	    end
	end
	function Vehicle.lockDoors(vehicle, enabled)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    local val = 4
	    if not enabled then
	        val = 0
	    end
	    VEHICLE.SET_VEHICLE_DOORS_LOCKED(vehicle, val)
	end	function Vehicle.tpToVehicle(vehicle)
	    local entityToTeleport = Vehicle.getPlayerOrVehicleEntity()
	    if not entityToTeleport then
	        return
	    end
	    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(vehicle)
	    local coords = Utils.rotateToEntity(vehicle)
	    ENTITY.SET_ENTITY_COORDS(entityToTeleport, coords.x, coords.y, coords.z + 1, false, false, false, false)
	end
	function Vehicle.toggleInvisible(vehicle, enabled)
	    if not Network.requestControl(vehicle) then
	        return
	    end
	    if enabled ~= nil then
	        ENTITY.SET_ENTITY_VISIBLE(vehicle, not enabled, 0)
	    else
	        local isVisible = ENTITY.IS_ENTITY_VISIBLE(vehicle)
	        ENTITY.SET_ENTITY_VISIBLE(vehicle, not isVisible, 0)
	    end
	end	function Vehicle.atomize(vehicle)
	    local vehCoords = ENTITY.GET_ENTITY_COORDS(vehicle)
	    local weaponHash = Utils.requestWeaponAsset("WEAPON_RAYPISTOL")
	    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(vehCoords.x, vehCoords.y, vehCoords.z + 1, vehCoords.x, vehCoords.y, vehCoords.z, 1000, false, weaponHash, 0, true, false, 1000)
	    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(weaponHash)
	end	function Vehicle.fireworks(vehicle)
	    local vehCoords = ENTITY.GET_ENTITY_COORDS(vehicle)
	    local weaponHash = Utils.requestWeaponAsset("WEAPON_FIREWORK")
	    local zOffset = Utils.getDimensions(vehicle).z
	    if zOffset <= 2 then
	        zOffset = zOffset + 3
	    end
	    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(vehCoords.x, vehCoords.y, vehCoords.z + zOffset, vehCoords.x + Utils.rand(-5, 5), vehCoords.y + Utils.rand(-5, 5), vehCoords.z + 10, 0,
	        false, weaponHash, 0, true, false, 1000)
	    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(weaponHash)
	end	function Vehicle.drive(vehicle)
	    local vehicleData = Vehicle.getTargetVehicleData(vehicle)
	    if vehicleData.driver ~= 0 then
	        Ped.kickFromVehicle(vehicleData.driver)
	        if vehicleData.player == -1 then
	            Utils.deleteEntity(vehicleData.driver)
	        end
	        local maxTime = Utils.getTime(2000)
	        while ENTITY.DOES_ENTITY_EXIST(vehicleData.driver) and PED.IS_PED_IN_ANY_VEHICLE(vehicleData.driver, false) do
	            if Utils.getTime() > maxTime then
	                break
	            end
	            util.yield()
	        end
	    end
	    PED.SET_PED_INTO_VEHICLE(Player.getPlayerPed(), vehicle, -1)
	    if not VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(vehicle) then
	        Vehicle.turnOnEngine(vehicle)
	    end
	end	function Vehicle.enter(vehicle)
	    local vehicleData = Vehicle.getTargetVehicleData(vehicle)
	    if not VEHICLE.ARE_ANY_VEHICLE_SEATS_FREE(vehicle) then
	        Utils.showToast(UND_translations.vehicle.noFreeSeats)
	        return
	    end
	    local seatIdx = -1
	    if vehicleData.driver ~= 0 then
	        seatIdx = -2
	    end
	    PED.SET_PED_INTO_VEHICLE(Player.getPlayerPed(), vehicle, seatIdx)
	    if not VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(vehicle) then
	        Vehicle.turnOnEngine(vehicle)
	    end
	end
	function Vehicle.spawnRandom(coords)
	    local randIdx = Utils.rand(1, #allVehicles)
	    local hash = util.joaat(allVehicles[randIdx].name)
	    util.request_model(hash)
	    local vehicle = entities.create_vehicle(hash, coords, 0)
	    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
	    return vehicle
	end
	function Vehicle.getName(hash)
	    if not UND_settings.showVehModelName and util.get_label_text(hash) ~= "NULL" then
	        return util.get_label_text(hash)
	    end
	    return util.reverse_joaat(hash)
	end
	return Vehicle
end
package.loaded["src.lib.vehicle"] = nil
package.preload["src.lib.raycast"] = function(...)	local Raycast = {}
	local function aimLockEntityTicker()
	    if not UND_aimLockEndTime then
	        return
	    end
	    if not UND_aimLockEnabled or not ENTITY.DOES_ENTITY_EXIST(UND_aimLockEntity.entity) or (UND_aimLockTime > 0 and Utils.getTime() >= UND_aimLockEndTime) then
	        UND_aimLockEntity = nil
	        UND_aimLockEndTime = nil
	        return
	    end
	end
	local function resetAimLockTime()
	    if not UND_aimLockEndTime then
	        UND_aimLockEndTime = Utils.getTime(UND_aimLockTime * 1000)
	    end
	end
	function Raycast.getOffsetFromCam(dist)
	    local dir = CAM.GET_GAMEPLAY_CAM_ROT(2):toDir()
	    local pos = CAM.GET_GAMEPLAY_CAM_COORD()
	    dir:mul(dist)
	    local offset = v3.new(pos)
	    offset:add(dir)
	    return pos, offset
	end
	local hitPointer = memory.alloc(1)
	local entityShapePointer = memory.alloc_int()	local function getRaycastData()
	    local dist = 1000
	    local result = {}
	    local coords = v3.new()
	    local normal = v3.new()
	    local camPos, offset = Raycast.getOffsetFromCam(dist)
	    local handle = SHAPETEST.START_EXPENSIVE_SYNCHRONOUS_SHAPE_TEST_LOS_PROBE(camPos.x, camPos.y, camPos.z, offset.x, offset.y, offset.z, CONSTANTS.RAYCAST.TraceFlag.all,
	        players.user_ped(), 4)
	    SHAPETEST.GET_SHAPE_TEST_RESULT(handle, hitPointer, coords, normal, entityShapePointer)
	    result.hit = memory.read_ubyte(hitPointer) == 1
	    result.entity = memory.read_uint(entityShapePointer)
	    result.coords = coords
	    return result
	end
	local entityPointer = memory.alloc_int()
	local function getAimData(flag)
	    local allFlag = flag == CONSTANTS.RAYCAST.TraceFlag.all
	    local pedFlag = flag == CONSTANTS.RAYCAST.TraceFlag.peds or flag == CONSTANTS.RAYCAST.TraceFlag.all
	    local vehicleFlag = flag == CONSTANTS.RAYCAST.TraceFlag.vehicles or flag == CONSTANTS.RAYCAST.TraceFlag.all
	    local success = false
	    local result = {}
	    if WEAPON.GET_MAX_RANGE_OF_CURRENT_PED_WEAPON(Player.getPlayerPed()) < 130.0 then
	        return getRaycastData()
	    end
	    local pid = Player.getUserPlayer()
	    PLAYER.GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(pid, entityPointer)
	    if memory.addrof(entityPointer) == 0 then
	        return getRaycastData()
	    end
	    local entity = memory.read_uint(entityPointer)
	    if not PLAYER.IS_PLAYER_FREE_AIMING_AT_ENTITY(pid, entity) then
	        return getRaycastData()
	    end
	    local entityType = ENTITY.GET_ENTITY_TYPE(entity)
	    if entityType == 1 then
	        if PED.IS_PED_IN_ANY_VEHICLE(entity, false) then
	            if pedFlag and not allFlag then
	                return getRaycastData()
	            end
	            entity = PED.GET_VEHICLE_PED_IS_IN(entity)
	            success = true
	        elseif pedFlag then
	            success = true
	        end
	    elseif entityType == 2 and vehicleFlag then
	        success = true
	    end
	    if success and UND_aimModeActive then
	        result.hit = true
	        result.entity = entity
	        result.coords = ENTITY.GET_ENTITY_COORDS(entity)
	        return result
	    end
	    return getRaycastData()
	end	function Raycast.getPlayerAimData(flag, isAimTeleport)
	    flag = flag or CONSTANTS.RAYCAST.TraceFlag.all
	    local pedFlag = flag == CONSTANTS.RAYCAST.TraceFlag.peds
	    local vehFlag = flag == CONSTANTS.RAYCAST.TraceFlag.vehicles
	    local objFlag = flag == CONSTANTS.RAYCAST.TraceFlag.objects
	    if not UND_aimModeActive and not UND_aimLockEntity and not isAimTeleport then
	        return nil
	    end
	    local isUserAiming = Player.isUserAiming()
	    if not UND_aimLockEntity and not isUserAiming then
	        return nil
	    end
	    local aimResult = getAimData(CONSTANTS.RAYCAST.TraceFlag.all)
	    local aimingOnLockedEntity = UND_aimLockEntity and UND_aimLockEntity.entity == aimResult.entity
	    if (isUserAiming and isAimTeleport and not aimResult.hit) or (isUserAiming and not UND_aimModeActive and UND_aimLockEntity and not isAimTeleport and not aimingOnLockedEntity) then
	        return nil
	    end
	    if UND_aimLockEntity and (not isUserAiming or (isUserAiming and not UND_aimModeActive and aimingOnLockedEntity)) then
	        if pedFlag and not UND_aimLockEntity.isPed then
	            return nil
	        end
	        if vehFlag and not UND_aimLockEntity.isVehicle then
	            return nil
	        end
	        if objFlag and not UND_aimLockEntity.isObject then
	            return nil
	        end
	        if not UND_aimLockEntity.isObject then
	            resetAimLockTime()
	        end
	        return UND_aimLockEntity
	    end	    if isAimTeleport and not UND_aimModeActive then
	        return aimResult
	    end
	    local entCoords = ENTITY.GET_ENTITY_COORDS(aimResult.entity)
	    local isPed = ENTITY.IS_ENTITY_A_PED(aimResult.entity)
	    local isVehicle = not isPed and ENTITY.IS_ENTITY_A_VEHICLE(aimResult.entity) and not VEHICLE.IS_THIS_MODEL_A_TRAIN(ENTITY.GET_ENTITY_MODEL(aimResult.entity))
	    local isObject = not isPed and not isVehicle and ENTITY.IS_ENTITY_AN_OBJECT(aimResult.entity) and v3.distance(Player.getPlayerPosition(), entCoords) < 50
	    if not isVehicle and not isPed and not isObject then
	        local closePed = Ped.getClosestPedToCoords(aimResult.coords)
	        if closePed then
	            entCoords = ENTITY.GET_ENTITY_COORDS(closePed)
	            aimResult.entity = closePed
	            aimResult.hit = true
	            isPed = true
	        else
	            local closeVehicle = Vehicle.getClosestVehicleToCoords(aimResult.coords, true)
	            if closeVehicle then
	                entCoords = ENTITY.GET_ENTITY_COORDS(closeVehicle)
	                aimResult.entity = closeVehicle
	                aimResult.hit = true
	                isVehicle = true
	            end
	        end
	    end
	    if pedFlag and not isPed then
	        return nil
	    end
	    if vehFlag and not isVehicle then
	        return nil
	    end
	    if objFlag and not isObject then
	        return nil
	    end
	    aimResult.isPed = isPed
	    aimResult.isVehicle = isVehicle
	    aimResult.isObject = isObject
	    aimResult.player = nil
	    if isPed then
	        local player = Network.getPlayerFromPed(aimResult.entity)
	        if player ~= -1 then
	            aimResult.player = player
	        end
	    end
	    if isPed or isVehicle or isObject then
	        aimResult.coords = entCoords
	        if not isObject and UND_aimLockEnabled then
	            UND_aimLockEntity = aimResult
	            UND_aimLockEndTime = nil
	        end
	    end
	    if isVehicle then
	        aimResult.vehicle = ENTITY.GET_VEHICLE_INDEX_FROM_ENTITY_INDEX(aimResult.entity)
	        local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(aimResult.vehicle, -1, true)
	        if driver ~= 0 then
	            aimResult.driver = driver
	            local player = Network.getPlayerFromPed(aimResult.driver)
	            if player ~= -1 then
	                aimResult.player = player
	            end
	        end
	    end
	    return aimResult
	end
	util.create_tick_handler(aimLockEntityTicker)
	return Raycast
end
package.loaded["src.lib.raycast"] = nil
package.preload["src.lib.menus.online.playersList"] = function(...)
	local mainColor = CONSTANTS.SCRIPT.COLORS.LIST.main
	local interiorColor = CONSTANTS.SCRIPT.COLORS.LIST.interior
	local deadColor = CONSTANTS.SCRIPT.COLORS.LIST.dead
	local modderColor = CONSTANTS.SCRIPT.COLORS.LIST.modder
	local otrColor = CONSTANTS.SCRIPT.COLORS.LIST.otr
	local adminColor = CONSTANTS.SCRIPT.COLORS.LIST.admin
	local modderAdminColor = CONSTANTS.SCRIPT.COLORS.LIST.modderAdmin
	local selfColor = CONSTANTS.SCRIPT.COLORS.LIST.self
	local friendColor = CONSTANTS.SCRIPT.COLORS.LIST.friend
	local attackerColor = CONSTANTS.SCRIPT.COLORS.LIST.attacker
	local godColor = CONSTANTS.SCRIPT.COLORS.LIST.god
	local hostColor = CONSTANTS.SCRIPT.COLORS.LIST.host
	local sHostColor = CONSTANTS.SCRIPT.COLORS.LIST.scriptHost
	local bgColor = CONSTANTS.SCRIPT.COLORS.LIST.bg
	local showOrgColor = true
	local listEnabled = true	local maxPlayers = 30
	local speedAbove = 100
	local nearbyMaxDistance = 100
	local showYourself, showTags, showDistance, showRank, showKD, showHealth, showWantedLevel, showMoney, showVehicle, showLanguage, showSpeed, showInterior, showNearby, showBounty =
	    false, true, true, false, false, false, true, true, true, false, false, true, false, false
	local sortByValue = CONSTANTS.SCRIPT.PLAYER_SORT_OPTIONS[1]
	local reverseSort, hideInteriorValue, interiorLastValue = false, false, true	local columnsNumber, xValue, yValue, scaleValue, xMultiplier, yMultiplier, lPadding, rPadding, blurStrength = 4, 36, 2, 50, 8, 2, 0, 0, 0
	local bgEnabled = false
	local playersData = {}
	local blurInstance = directx.blurrect_new()
	local function sortByDistance(p1, p2)
	    if reverseSort then
	        return p1.distance > p2.distance
	    end
	    return p1.distance < p2.distance
	end	local function sortByRank(p1, p2)
	    if reverseSort then
	        return p1.rank > p2.rank
	    end
	    return p1.rank < p2.rank
	end	local function sortByMoney(p1, p2)
	    if reverseSort then
	        return p1.money > p2.money
	    end
	    return p1.money < p2.money
	end	local function sortByKD(p1, p2)
	    if reverseSort then
	        return p1.kd > p2.kd
	    end
	    return p1.kd < p2.kd
	end	local function sortByName(p1, p2)
	    if reverseSort then
	        return p1.name > p2.name
	    end
	    return p1.name < p2.name
	end	local function sortByHostPos(p1, p2)
	    if reverseSort then
	        return p1.hostPos > p2.hostPos
	    end
	    return p1.hostPos < p2.hostPos
	end	local function sortByLang(p1, p2)
	    if reverseSort then
	        return p1.lang > p2.lang
	    end
	    return p1.lang < p2.lang
	end	local function filterByInterior(playersData, inInterior)
	    local newPlayerData = {}
	    for _, playerData in playersData do
	        if (inInterior and playerData.interior) or (not inInterior and not playerData.interior) then
	            newPlayerData[#newPlayerData + 1] = playerData
	        end
	    end
	    return newPlayerData
	end	local function filterByLoading(playersData, isLoading)
	    local newPlayerData = {}
	    for _, playerData in playersData do
	        if (isLoading and playerData.interior and playerData.interior == "loading") or (not isLoading and (not playerData.interior or playerData.interior ~= "loading")) then
	            newPlayerData[#newPlayerData + 1] = playerData
	        end
	    end
	    return newPlayerData
	end
	local function getPlayersData()
	    if not listEnabled then
	        return
	    end
	    local playerCoords = Player.getPlayerPosition()
	    local playersList = {table.unpack(players.list(showYourself), 1, maxPlayers)}
	    playersData = {}
	    for i, pid in playersList do
	        local coords = Player.getPlayerPosition(pid)
	        local dist = math.floor(v3.distance(playerCoords, coords))
	        if showNearby and dist > nearbyMaxDistance then
	            goto continue
	        end
	        local playerData = {
	            distance = dist,
	            rank = Player.getPlayerRank(pid),
	            money = Player.getMoney(pid),
	            kd = Player.getKD(pid),
	            interior = Player.getInterior(pid),
	            name = Player.getPlayerName(pid),
	            hostPos = players.get_host_queue_position(pid),
	            lang = players.get_language(pid)
	        }
	        if not playerData.interior and Player.isLoading(pid) then
	            playerData.interior = "loading"
	        end
	        local colorToUse = mainColor
	        local orgColor = Player.getOrgColor(pid)
	        if pid == Player.getUserPlayer() then
	            colorToUse = selfColor
	        elseif Player.isFriend(pid) then
	            colorToUse = friendColor
	        elseif Player.isModder(pid) then
	            colorToUse = modderColor
	        elseif Player.isAdmin(pid) then
	            colorToUse = adminColor
	        elseif Player.isModderOrAdmin(pid) then
	            colorToUse = modderAdminColor
	        elseif pid == players.get_host() then
	            colorToUse = hostColor
	        elseif pid == players.get_script_host() then
	            colorToUse = sHostColor
	        elseif showOrgColor and orgColor ~= -1 then
	            colorToUse = orgColor
	        elseif playerData.interior then
	            colorToUse = interiorColor
	        elseif players.is_godmode(pid) then
	            colorToUse = godColor
	        elseif Player.isDead(pid) then
	            colorToUse = deadColor
	        elseif players.is_marked_as_attacker(pid) then
	            colorToUse = attackerColor
	        elseif Player.isOTR(pid) then
	            colorToUse = otrColor
	        end
	        playerData.colorToUse = colorToUse
	        local playerInfoText = {}
	        if showInterior and playerData.interior then
	            playerInfoText[#playerInfoText + 1] = "[" .. UND_translations.interior[playerData.interior] .. "]"
	        end
	        if showBounty and players.get_bounty(pid) then
	            playerInfoText[#playerInfoText + 1] = "$$" .. players.get_bounty(pid)
	        end
	        if showWantedLevel then
	            local wanted = Player.getWantedLevel(pid)
	            if wanted > 0 then
	                playerInfoText[#playerInfoText + 1] = wanted .. "*"
	            end
	        end
	        if showMoney then
	            local moneyShorten = Player.getMoney(pid, true)
	            playerInfoText[#playerInfoText + 1] = "$" .. moneyShorten
	        end
	        if showRank then
	            playerInfoText[#playerInfoText + 1] = "(" .. playerData.rank .. ")"
	        end
	        if showKD then
	            playerInfoText[#playerInfoText + 1] = "KD" .. playerData.kd
	        end
	        if showDistance then
	            playerInfoText[#playerInfoText + 1] = dist
	        end
	        if showLanguage then
	            playerInfoText[#playerInfoText + 1] = "[" .. CONSTANTS.GAME.LANGUAGES[playerData.lang] .. "]"
	        end
	        playerInfoText[#playerInfoText + 1] = playerData.name
	        if showTags then
	            local tags = players.get_tags_string(pid)
	            if tags:len() > 0 then
	                playerInfoText[#playerInfoText + 1] = "[" .. tags .. "]"
	            end
	        end
	        local ped = Player.getPlayerPed(pid)
	        if showHealth then
	            playerInfoText[#playerInfoText + 1] = Ped.getHealth(ped).total .. " "
	        end
	        if showVehicle or showSpeed then
	            local vehicle = players.get_vehicle_model(pid)
	            if vehicle ~= 0 then
	                if showVehicle then
	                    playerInfoText[#playerInfoText + 1] = "- " .. Vehicle.getName(vehicle)
	                end
	                if showSpeed then
	                    local speed = Utils.getSpeed(ped, true)
	                    if speed > speedAbove then
	                        playerInfoText[#playerInfoText + 1] = "(" .. Utils.getSpeed(ped) .. ")"
	                    end
	                end
	            end
	        end
	        playerData.text = table.concat(playerInfoText, " ")
	        playersData[i] = playerData
	        ::continue::
	    end
	    if hideInteriorValue then
	        playersData = filterByInterior(playersData, false)
	    end
	    if sortByValue == "Distance" then
	        table.sort(playersData, sortByDistance)
	    elseif sortByValue == "Money" then
	        table.sort(playersData, sortByMoney)
	    elseif sortByValue == "KD" then
	        table.sort(playersData, sortByKD)
	    elseif sortByValue == "Host position" then
	        table.sort(playersData, sortByHostPos)
	    elseif sortByValue == "Name" then
	        table.sort(playersData, sortByName)
	    elseif sortByValue == "Language" then
	        table.sort(playersData, sortByLang)
	    else
	        table.sort(playersData, sortByRank)
	    end
	    if not hideInteriorValue and interiorLastValue then
	        local notInteriorPlayers = filterByInterior(playersData, false)
	        local interiorPlayers = filterByInterior(playersData, true)
	        local result = {table.unpack(notInteriorPlayers)}
	        table.move(interiorPlayers, 1, #interiorPlayers, #result + 1, result)
	        playersData = result
	        local notLoadingPlayers = filterByLoading(playersData, false)
	        local loadingPlayers = filterByLoading(playersData, true)
	        local result = {table.unpack(notLoadingPlayers)}
	        table.move(loadingPlayers, 1, #loadingPlayers, #result + 1, result)
	        playersData = result
	    end
	    util.yield(1000)
	end
	local function renderList()
	    if not listEnabled or UND_gameMenuOpen then
	        return
	    end
	    local maxPlayersInColumn = math.ceil(#playersData / columnsNumber)
	    local curX = xValue
	    local curY = yValue
	    if bgEnabled then
	        local realColNum = math.ceil(#playersData / maxPlayersInColumn)
	        local maxX = (0.02 * xMultiplier * (realColNum)) + lPadding + rPadding
	        local maxY = 0.01 * yMultiplier * maxPlayersInColumn
	        local xPos = xValue - 0.08 - lPadding
	        local yPos = yValue - 0.01
	        directx.draw_rect_client(xPos, yPos, maxX, maxY, bgColor)
	        if blurStrength > 0 then
	            directx.blurrect_draw(blurInstance, xPos, yPos, maxX, maxY, blurStrength)
	        end
	    end
	    for idx, player in playersData do
	        directx.draw_text_client(curX, curY, player.text, 5, scaleValue, player.colorToUse)
	        curY = curY + 0.01 * yMultiplier
	        if idx % maxPlayersInColumn == 0 then
	            curX = curX + 0.02 * xMultiplier
	            curY = yValue
	        end
	    end
	end	local function setupPlayersListMenu(sessionMenu)
	    if UND_privateMode then
	        showYourself = true
	        showSpeed = true
	        bgEnabled = true
	        speedAbove = 200
	    end
	    local onlineList = menu.list(sessionMenu, UND_translations.online.playerList, {}, "")
	    local listEnabledToggle = menu.toggle(onlineList, UND_translations.online.enablePlayerList, {Utils.getCommandName("playerslist")}, "", function(on)
	        listEnabled = on
	    end, listEnabled)
	    listEnabled = menu.get_value(listEnabledToggle)
	    menu.divider(onlineList, "Player options")
	    local showYourselfToggle = menu.toggle(onlineList, UND_translations.online.showYourself, {Utils.getCommandName("playerslistshowme")}, "", function(on)
	        showYourself = on
	    end, showYourself)
	    showYourself = menu.get_value(showYourselfToggle)
	    local tagsToggle = menu.toggle(onlineList, UND_translations.online.showTags, {Utils.getCommandName("playerslistshowtags")}, "", function(on)
	        showTags = on
	    end, showTags)
	    showTags = menu.get_value(tagsToggle)
	    local distToggle = menu.toggle(onlineList, UND_translations.online.showDistance, {Utils.getCommandName("playerslistshowdistance")}, "", function(on)
	        showDistance = on
	    end, showDistance)
	    showDistance = menu.get_value(distToggle)
	    local rankToggle = menu.toggle(onlineList, UND_translations.online.showRank, {Utils.getCommandName("playerslistshowrank")}, "", function(on)
	        showRank = on
	    end, showRank)
	    showRank = menu.get_value(rankToggle)
	    local kdToggle = menu.toggle(onlineList, UND_translations.online.showKD, {Utils.getCommandName("playerslistshowkd")}, "", function(on)
	        showKD = on
	    end, showKD)
	    showKD = menu.get_value(kdToggle)
	    local hpToggle = menu.toggle(onlineList, UND_translations.online.showHealth, {Utils.getCommandName("playerslistshowhealth")}, "", function(on)
	        showHealth = on
	    end, showHealth)
	    showHealth = menu.get_value(hpToggle)
	    local wantedLevelToggle = menu.toggle(onlineList, UND_translations.online.showWanted, {Utils.getCommandName("playerslistshowanted")}, "", function(on)
	        showWantedLevel = on
	    end, showWantedLevel)
	    showWantedLevel = menu.get_value(wantedLevelToggle)
	    local bountyToggle = menu.toggle(onlineList, UND_translations.online.showBounty, {Utils.getCommandName("playerslistshowbounty")}, "", function(on)
	        showBounty = on
	    end, showBounty)
	    showBounty = menu.get_value(bountyToggle)
	    local moneyToggle = menu.toggle(onlineList, UND_translations.online.showMoney, {Utils.getCommandName("playerslistshowmoney")}, "", function(on)
	        showMoney = on
	    end, showMoney)
	    showMoney = menu.get_value(moneyToggle)
	    local vehicleToggle = menu.toggle(onlineList, UND_translations.online.showVehicle, {Utils.getCommandName("playerslistshowvehicle")}, "", function(on)
	        showVehicle = on
	    end, showVehicle)
	    showVehicle = menu.get_value(vehicleToggle)
	    local speedAboveSlider = menu.slider(onlineList, UND_translations.online.speedAbove, {Utils.getCommandName("playerslistspeedabove")}, "", 1, 500, speedAbove, 1,
	        function(val)
	            speedAbove = val
	        end)
	    speedAbove = menu.get_value(speedAboveSlider)
	    local speedToggle = menu.toggle(onlineList, UND_translations.online.showSpeed, {Utils.getCommandName("playerslistshowspeed")}, "", function(on)
	        showSpeed = on
	    end, showSpeed)
	    showSpeed = menu.get_value(speedToggle)
	    local langToggle = menu.toggle(onlineList, UND_translations.online.showLanguage, {Utils.getCommandName("playerslistshowlang")}, "", function(on)
	        showLanguage = on
	    end, showLanguage)
	    showLanguage = menu.get_value(langToggle)
	    local interiorToggle = menu.toggle(onlineList, UND_translations.online.showInterior, {Utils.getCommandName("playerslistshowinterior")}, "", function(on)
	        showInterior = on
	    end, showInterior)
	    showInterior = menu.get_value(interiorToggle)
	    local maxPlayersSlider = menu.slider(onlineList, UND_translations.online.maxPlayers, {Utils.getCommandName("playerslistmaxplayers")}, "", 1, 30, maxPlayers, 1,
	        function(val)
	            maxPlayers = val
	        end)
	    maxPlayers = menu.get_value(maxPlayersSlider)
	    local nearbyMaxDistSlider = menu.slider(onlineList, UND_translations.online.nearbyMaxDist, {Utils.getCommandName("playerslistnearbymaxdist")}, "", 10, 2000,
	        nearbyMaxDistance, 10, function(val)
	            nearbyMaxDistance = val
	        end)
	    nearbyMaxDistance = menu.get_value(nearbyMaxDistSlider)
	    local nearbyToggle = menu.toggle(onlineList, UND_translations.online.showOnlyNearby, {Utils.getCommandName("playerslistshownearby")}, "", function(on)
	        showNearby = on
	    end, showNearby)
	    showNearby = menu.get_value(nearbyToggle)
	    local sortValues = {}
	    for idx, v in CONSTANTS.SCRIPT.PLAYER_SORT_OPTIONS do
	        sortValues[idx] = UND_translations.online.sorting[v]
	    end
	    local sortBySelect = menu.list_select(onlineList, UND_translations.general.sortBy, {Utils.getCommandName("playerslistsortby")}, "", sortValues, 1, function(idx)
	        sortByValue = CONSTANTS.SCRIPT.PLAYER_SORT_OPTIONS[idx]
	    end)
	    sortByValue = CONSTANTS.SCRIPT.PLAYER_SORT_OPTIONS[menu.get_value(sortBySelect)]
	    local reverseSortToggle = menu.toggle(onlineList, UND_translations.general.reverseSort, {Utils.getCommandName("playerslistreversesort")}, "", function(on)
	        reverseSort = on
	    end, reverseSort)
	    reverseSort = menu.get_value(reverseSortToggle)
	    local hideInteriorToggle = menu.toggle(onlineList, UND_translations.online.hideInterior, {Utils.getCommandName("playerslisthideinterior")}, "", function(on)
	        hideInteriorValue = on
	    end, hideInteriorValue)
	    hideInteriorValue = menu.get_value(hideInteriorToggle)
	    local interiorLastToggle = menu.toggle(onlineList, UND_translations.online.interiorLast, {Utils.getCommandName("playerslistinteriorlast")}, "", function(on)
	        interiorLastValue = on
	    end, interiorLastValue)
	    interiorLastValue = menu.get_value(interiorLastToggle)
	    menu.divider(onlineList, "List options")
	    local columnsSlider = menu.slider(onlineList, UND_translations.online.colNum, {Utils.getCommandName("playerslistcolnum")}, "", 1, 10, columnsNumber, 1, function(val)
	        columnsNumber = val
	    end)
	    columnsNumber = menu.get_value(columnsSlider)
	    local spaceXSlider = menu.slider(onlineList, UND_translations.general.hSpace, {Utils.getCommandName("playerslisthcspace")}, "", 1, 30, xMultiplier, 1, function(val)
	        xMultiplier = val
	    end)
	    xMultiplier = menu.get_value(spaceXSlider)
	    local spaceYSlider = menu.slider(onlineList, UND_translations.general.vSpace, {Utils.getCommandName("playerslistvcspace")}, "", 1, 30, yMultiplier, 1, function(val)
	        yMultiplier = val
	    end)
	    yMultiplier = menu.get_value(spaceYSlider)
	    local xSlider = menu.slider(onlineList, UND_translations.general.hPos, {Utils.getCommandName("playerslisthpos")}, "", 0, 100, xValue, 1, function(val)
	        xValue = val / 100
	    end)
	    xValue = menu.get_value(xSlider) / 100
	    local ySlider = menu.slider(onlineList, UND_translations.general.vPos, {Utils.getCommandName("playerslistvpos")}, "", 0, 100, yValue, 1, function(val)
	        yValue = val / 100
	    end)
	    yValue = menu.get_value(ySlider) / 100
	    local scaleSlider = menu.slider(onlineList, UND_translations.general.scale, {Utils.getCommandName("playerslistscale")}, "", 1, 200, scaleValue, 1, function(val)
	        scaleValue = val / 100
	    end)
	    scaleValue = menu.get_value(scaleSlider) / 100
	    local colorsMenu = menu.list(onlineList, UND_translations.general.colors, {}, "")
	    menu.colour(colorsMenu, UND_translations.online.mainColor, {Utils.getCommandName("playerslistcolor")}, "", mainColor, true, function(c)
	        mainColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.selfColor, {Utils.getCommandName("playerslistselfcolor")}, "", selfColor, true, function(c)
	        selfColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.friendColor, {Utils.getCommandName("playerslistfriendcolor")}, "", friendColor, true, function(c)
	        friendColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.modderColor, {Utils.getCommandName("playerslistmoddercolor")}, "", modderColor, true, function(c)
	        modderColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.adminColor, {Utils.getCommandName("playerslistadmincolor")}, "", adminColor, true, function(c)
	        adminColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.modderAdminColor, {Utils.getCommandName("playerslistmodderadmincolor")}, "", modderAdminColor, true, function(c)
	        modderAdminColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.hostColor, {Utils.getCommandName("playerslisthostcolor")}, "", hostColor, true, function(c)
	        hostColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.sHostColor, {Utils.getCommandName("playerslistscripthostcolor")}, "", sHostColor, true, function(c)
	        sHostColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.interiorColor, {Utils.getCommandName("playerslistinteriorcolor")}, "", interiorColor, true, function(c)
	        interiorColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.godColor, {Utils.getCommandName("playerslistgodcolor")}, "", godColor, true, function(c)
	        godColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.deadColor, {Utils.getCommandName("playerslistdeadcolor")}, "", deadColor, true, function(c)
	        deadColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.attackerColor, {Utils.getCommandName("playerslistattackercolor")}, "", attackerColor, true, function(c)
	        attackerColor = c
	    end)
	    menu.colour(colorsMenu, UND_translations.online.OTRcolor, {Utils.getCommandName("playerslistotrcolor")}, "", otrColor, true, function(c)
	        otrColor = c
	    end)
	    local orgToggle = menu.toggle(colorsMenu, UND_translations.online.showOrgColors, {}, "", function(on)
	        showOrgColor = on
	    end, showOrgColor)
	    showOrgColor = menu.get_value(orgToggle)
	    menu.divider(onlineList, UND_translations.online.bgOptions)
	    local bgEnabledToggle = menu.toggle(onlineList, UND_translations.general.enabled, {Utils.getCommandName("playerslistbackground")}, "", function(on)
	        bgEnabled = on
	    end, bgEnabled)
	    bgEnabled = menu.get_value(bgEnabledToggle)
	    local lPaddingSlider = menu.slider(onlineList, UND_translations.general.lPadding, {Utils.getCommandName("playerslistlpadding")}, "", -50, 50, lPadding, 1, function(val)
	        lPadding = val / 100
	    end)
	    lPadding = menu.get_value(lPaddingSlider) / 100
	    local rPaddingSlider = menu.slider(onlineList, UND_translations.general.rPadding, {Utils.getCommandName("playerslistrpadding")}, "", -50, 50, rPadding, 1, function(val)
	        rPadding = val / 100
	    end)
	    rPadding = menu.get_value(rPaddingSlider) / 100
	    menu.colour(onlineList, UND_translations.general.color, {Utils.getCommandName("playerslistbackgroundcolor")}, "", bgColor, true, function(c)
	        bgColor = c
	    end)
	    local blurSlider = menu.slider(onlineList, UND_translations.general.blurStrength, {Utils.getCommandName("playerslistblur")}, "", 0, 255, blurStrength, 1, function(val)
	        blurStrength = val
	    end)
	    blurStrength = menu.get_value(blurSlider)
	    util.create_tick_handler(getPlayersData)
	    util.create_tick_handler(renderList)
	    util.on_stop(function()
	        directx.blurrect_free(blurInstance)
	    end)
	end
	return setupPlayersListMenu
end
package.loaded["src.lib.menus.online.playersList"] = nil
package.preload["src.lib.entity"] = function(...)
	local Entity = {}	function Entity.ram(entity)
	    util.create_thread(function()
	        local coords = ENTITY.GET_ENTITY_COORDS(entity)
	        local rot = ENTITY.GET_ENTITY_ROTATION(entity, 2):toDir()
	        local dir = 1
	        if Utils.rand() == 0 then
	            dir = -1
	        end
	        v3.mul(rot, 30 * dir)
	        v3.add(coords, rot)
	        local vehicle = Vehicle.spawnRandom(coords)
	        local curCoords = v3.lookAt(ENTITY.GET_ENTITY_COORDS(vehicle), ENTITY.GET_ENTITY_COORDS(entity))
	        ENTITY.SET_ENTITY_ROTATION(vehicle, curCoords.x, curCoords.y, curCoords.z, 2, true)
	        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, 300)
	        VEHICLE.SET_DISABLE_MAP_COLLISION(vehicle)
	        util.yield(800)
	        Utils.deleteEntity(vehicle)
	        util.stop_thread()
	    end)
	end
	return Entity
end
package.loaded["src.lib.entity"] = nil
package.preload["src.lib.menus.aim.teleport"] = function(...)
	local keepSpeed = true
	local function aimTeleport()
	    local entityToTeleport = Vehicle.getPlayerOrVehicleEntity()
	    if not entityToTeleport or not Player.isUserAiming() then
	        return
	    end
	    local aimResult = Raycast.getPlayerAimData(nil, true)
	    if not aimResult or not aimResult.hit then
	        local tpFwdRef = menu.ref_by_path("Stand>Lua Scripts>Undefined>Teleport>Teleport forward")
	        menu.trigger_command(tpFwdRef)
	        return
	    end
	    local aimCoords = aimResult.coords
	    local curSpeed = ENTITY.GET_ENTITY_SPEED(entityToTeleport)
	    ENTITY.SET_ENTITY_COORDS(entityToTeleport, aimCoords.x, aimCoords.y, aimCoords.z, false, false, false, false)
	    if keepSpeed then
	        VEHICLE.SET_VEHICLE_FORWARD_SPEED(entityToTeleport, curSpeed)
	    end
	end
	local function setupAimTeleport(aimMenu)
	    menu.divider(aimMenu, UND_translations.aim.teleport .. " ")
	    local aimTeleportAction = menu.action(aimMenu, UND_translations.aim.teleport, {}, UND_translations.aim.teleportD, aimTeleport)
	    local keepSpeedToggle = menu.toggle(aimMenu, UND_translations.teleport.keepSpeed, {Utils.getCommandName("aimtpkeepspeed")}, UND_translations.teleport.keepSpeedD,
	        function(on)
	            keepSpeed = on
	        end, keepSpeed)
	    keepSpeed = menu.get_value(keepSpeedToggle)
	    return aimTeleportAction
	end
	return setupAimTeleport
end
package.loaded["src.lib.menus.aim.teleport"] = nil
package.preload["src.lib.utils"] = function(...)
	local Utils = {}	function Utils.rand(min, max)
	    min = min or 0
	    max = max or 1
	    return math.random(min, max)
	end
	function Utils.showToast(message, dontAddScriptName)
	    local msg = tostring(message)
	    if not dontAddScriptName then
	        msg = "[" .. SCRIPT_NAME .. "] " .. msg
	    end
	    util.toast(tostring(msg))
	end
	function Utils.getCommandName(commandName)
	    commandName = commandName or ""
	    return CONSTANTS.SCRIPT.COMMAND_PREFIX .. commandName
	end	function Utils.logToFile(message)
	    local msg = tostring(message)
	    util.log(SCRIPT_NAME .. ": " .. msg, 8)
	end	function Utils.getTime(addTimeInMs)
	    local addTimeInMs = addTimeInMs or 0
	    return os.millis() + addTimeInMs
	end
	function Utils.getGroundZPosition(position)
	    local tick = 0
	    local success, groundZ = util.get_ground_z(position.x, position.y)
	    while not success and tick < 10 do
	        util.yield_once()
	        success, groundZ = util.get_ground_z(position.x, position.y)
	        tick = tick + 1
	    end
	    if success then
	        position.z = groundZ
	    end
	    return position
	end
	function Utils.getBlipCoords(blip)
	    local pos = HUD.GET_BLIP_COORDS(blip)
	    pos = Utils.getGroundZPosition(pos)
	    return pos
	end
	function Utils.emptyFunction()
	end
	function Utils.requestWeaponAsset(hash)
	    local weaponHash = util.joaat(hash)
	    WEAPON.REQUEST_WEAPON_ASSET(weaponHash, 31, 0)
	    while not WEAPON.HAS_WEAPON_ASSET_LOADED(weaponHash) do
	        util.yield_once()
	    end
	    return weaponHash
	end
	function Utils.convertColorToGame(color)
	    return {
	        r = math.floor(color.r * 255),
	        g = math.floor(color.g * 255),
	        b = math.floor(color.b * 255),
	        a = math.floor(color.a * 255)
	    }
	end	local minimum = memory.alloc()
	local maximum = memory.alloc()
	function Utils.getDimensions(entity)
	    MISC.GET_MODEL_DIMENSIONS(ENTITY.GET_ENTITY_MODEL(entity), minimum, maximum)
	    local minimum_vec = v3.new(minimum)
	    local maximum_vec = v3.new(maximum)
	    local dimensions = {
	        x = maximum_vec.y - minimum_vec.y,
	        y = maximum_vec.x - minimum_vec.x,
	        z = maximum_vec.z - minimum_vec.z
	    }
	    return dimensions
	end
	local upVector_pointer = memory.alloc()
	local rightVector_pointer = memory.alloc()
	local forwardVector_pointer = memory.alloc()
	local position_pointer = memory.alloc()
	function Utils.drawBox(entity, color)
	    ENTITY.GET_ENTITY_MATRIX(entity, rightVector_pointer, forwardVector_pointer, upVector_pointer, position_pointer);
	    local forward_vector = v3.new(forwardVector_pointer)
	    local right_vector = v3.new(rightVector_pointer)
	    local up_vector = v3.new(upVector_pointer)
	    MISC.GET_MODEL_DIMENSIONS(ENTITY.GET_ENTITY_MODEL(entity), minimum, maximum)
	    local minimum_vec = v3.new(minimum)
	    local maximum_vec = v3.new(maximum)
	    local dimensions = {
	        x = maximum_vec.y - minimum_vec.y,
	        y = maximum_vec.x - minimum_vec.x,
	        z = maximum_vec.z - minimum_vec.z
	    }
	    local top_right = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entity, maximum_vec.x, maximum_vec.y, maximum_vec.z)
	    local top_right_back = {
	        x = forward_vector.x * -dimensions.y + top_right.x,
	        y = forward_vector.y * -dimensions.y + top_right.y,
	        z = forward_vector.z * -dimensions.y + top_right.z
	    }
	    local bottom_right_back = {
	        x = up_vector.x * -dimensions.z + top_right_back.x,
	        y = up_vector.y * -dimensions.z + top_right_back.y,
	        z = up_vector.z * -dimensions.z + top_right_back.z
	    }
	    local bottom_left_back = {
	        x = -right_vector.x * dimensions.x + bottom_right_back.x,
	        y = -right_vector.y * dimensions.x + bottom_right_back.y,
	        z = -right_vector.z * dimensions.x + bottom_right_back.z
	    }
	    local top_left = {
	        x = -right_vector.x * dimensions.x + top_right.x,
	        y = -right_vector.y * dimensions.x + top_right.y,
	        z = -right_vector.z * dimensions.x + top_right.z
	    }
	    local bottom_right = {
	        x = -up_vector.x * dimensions.z + top_right.x,
	        y = -up_vector.y * dimensions.z + top_right.y,
	        z = -up_vector.z * dimensions.z + top_right.z
	    }
	    local bottom_left = {
	        x = forward_vector.x * dimensions.y + bottom_left_back.x,
	        y = forward_vector.y * dimensions.y + bottom_left_back.y,
	        z = forward_vector.z * dimensions.y + bottom_left_back.z
	    }
	    local top_left_back = {
	        x = up_vector.x * dimensions.z + bottom_left_back.x,
	        y = up_vector.y * dimensions.z + bottom_left_back.y,
	        z = up_vector.z * dimensions.z + bottom_left_back.z
	    }
	    GRAPHICS.DRAW_LINE(top_right.x, top_right.y, top_right.z, top_right_back.x, top_right_back.y, top_right_back.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(top_right.x, top_right.y, top_right.z, top_left.x, top_left.y, top_left.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(top_right.x, top_right.y, top_right.z, bottom_right.x, bottom_right.y, bottom_right.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(bottom_left_back.x, bottom_left_back.y, bottom_left_back.z, bottom_right_back.x, bottom_right_back.y, bottom_right_back.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(bottom_left_back.x, bottom_left_back.y, bottom_left_back.z, bottom_left.x, bottom_left.y, bottom_left.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(bottom_left_back.x, bottom_left_back.y, bottom_left_back.z, top_left_back.x, top_left_back.y, top_left_back.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(top_left_back.x, top_left_back.y, top_left_back.z, top_right_back.x, top_right_back.y, top_right_back.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(top_left_back.x, top_left_back.y, top_left_back.z, top_left.x, top_left.y, top_left.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(bottom_right_back.x, bottom_right_back.y, bottom_right_back.z, top_right_back.x, top_right_back.y, top_right_back.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(bottom_left.x, bottom_left.y, bottom_left.z, top_left.x, top_left.y, top_left.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(bottom_left.x, bottom_left.y, bottom_left.z, bottom_right.x, bottom_right.y, bottom_right.z, color.r, color.g, color.b, color.a)
	    GRAPHICS.DRAW_LINE(bottom_right_back.x, bottom_right_back.y, bottom_right_back.z, bottom_right.x, bottom_right.y, bottom_right.z, color.r, color.g, color.b, color.a)
	end	function Utils.getRandomPlayer()
	    if not util.is_session_started() then
	        Utils.showToast(UND_translations.general.onlyOnline)
	        return -1
	    end
	    local allPlayers = players.list(false)
	    if #allPlayers == 0 then
	        Utils.showToast(UND_translations.general.noPlayer)
	        return -1
	    end
	    local randPid = allPlayers[Utils.rand(1, #allPlayers)]
	    return randPid
	end	function Utils.rotateToEntity(entity, coords)
	    local newCoords = coords or ENTITY.GET_ENTITY_COORDS(entity)
	    local rot = ENTITY.GET_ENTITY_ROTATION(entity, 2)
	    local myPed = Player.getPlayerPed()
	    local myVeh = Ped.getVehicle(myPed)
	    local rotDir = rot:toDir()
	    local multiplier = 8
	    if not myVeh then
	        multiplier = 2
	    end
	    v3.mul(rotDir, -multiplier)
	    v3.add(newCoords, rotDir)
	    CAM.FORCE_CAMERA_RELATIVE_HEADING_AND_PITCH(0, 0, 0)
	    ENTITY.SET_ENTITY_ROTATION(myVeh or myPed, rot.x, rot.y, rot.z, 2, true)
	    return newCoords
	end	function Utils.getTableIdx(tbl, value)
	    if #tbl > 0 then
	        for i = 1, #tbl do
	            if tbl[i] == value then
	                return i
	            end
	        end
	    end
	    return nil
	end	function Utils.deleteEntity(entity)
	    entities.delete_by_handle(entity)
	end
	function Utils.getSpeed(entity, onlyValue)
	    local speed = ENTITY.GET_ENTITY_SPEED(entity)
	    local localSpeed
	    if UND_settings.units == UND_translations.general.kmh then
	        localSpeed = math.floor(speed * 3.6)
	    else
	        localSpeed = math.floor(speed * 2.236936)
	    end
	    if onlyValue then
	        return localSpeed
	    end
	    return localSpeed .. " " .. UND_settings.units
	end	function Utils.isTableEmpty(table)
	    local count = 0
	    for x in table do
	        count = count + 1
	    end
	    return count == 0
	end	function Utils.requestPtfxAsset(asset)
	    STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)
	    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
	        util.yield()
	    end
	end
	return Utils
end
package.loaded["src.lib.utils"] = nil
package.preload["__luapack_entry__"] = function(...)
	util.keep_running()	UND_translations = require "src.lib.translations"
	CONSTANTS = require "src.lib.constants"
	UND_settings = {
	    randomUpgrades = {
	        performance = true,
	        bodyParts = true,
	        paint = true,
	        livery = true,
	        lights = true,
	        tyreSmoke = true,
	        windowTint = true,
	        horn = true,
	        plateType = true,
	        wheels = true,
	        neons = false,
	        weaponRoof = true,
	        grilleCounter = true,
	        maxPerformance = false
	    },
	    damageSettings = {
	        windows = true,
	        doors = true,
	        tyres = true,
	        popOnce = false,
	        smokeEngine = true
	    },
	    units = "km/h",
	    hornBoostSpeed = 10,
	    hornJumpForce = 10,
	    flySpeed = 100,
	    makeWantedLevel = 5,
	    bountyAmount = 10000,
	    clonedPedTask = UND_translations.general.walk,
	    cageType = UND_translations.general.fence,
	    shootType = UND_translations.general.owned,
	    explodeType = UND_translations.general.anonymous,
	    showVehModelName = true,
	    emptyFrom = UND_translations.general.all
	}
	UND_gameMenuOpen = false	UND_instantRespawnEnabled = false	UND_followEnabledFor = -1
	UND_flyVehicleEnabledFor = -1	UND_aimModeActive = true
	UND_aimModeActiveAsAimButton = false
	UND_currentlyMovedObject = 0
	UND_aimLockEnabled = true
	UND_aimLockTime = 5
	UND_markedTargets = {}
	UND_aimLockEntity = nil
	UND_aimLockEndTime = nil
	if filesystem.exists(filesystem.scripts_dir() .. "lib/undefined/menus/self/private.lua") then
	    UND_privateMode = true
	end	Utils = require "src.lib.utils"
	Network = require "src.lib.network"
	Raycast = require "src.lib.raycast"
	Player = require "src.lib.player"
	Ped = require "src.lib.ped"
	Vehicle = require "src.lib.vehicle"
	Entity = require "src.lib.entity"	require "src.lib.updater"
	require "src.lib.menus.main"
end
package.loaded["__luapack_entry__"] = nil
package.preload["src.lib.constants"] = function(...)
	return {
	    SCRIPT = {
	        COMMAND_PREFIX = "u",
	        VERSION = "2.10.0",
	        PLAYER_SORT_OPTIONS = {"Distance", "Rank", "Money", "KD", "Name", "Host position", "Language"},
	        COLORS = {
	            LIST = {
	                main = {
	                    r = 1,
	                    g = 1,
	                    b = 1,
	                    a = 1
	                },
	                dead = {
	                    r = 0,
	                    g = 0,
	                    b = 0,
	                    a = 1
	                },
	                interior = {
	                    r = 1,
	                    g = 1,
	                    b = 1,
	                    a = 0.5
	                },
	                modder = {
	                    r = 1,
	                    g = 0,
	                    b = 0,
	                    a = 1
	                },
	                otr = {
	                    r = 1,
	                    g = 1,
	                    b = 0,
	                    a = 1
	                },
	                admin = {
	                    r = 1,
	                    g = 0,
	                    b = 0,
	                    a = 1
	                },
	                modderAdmin = {
	                    r = 1,
	                    g = 0,
	                    b = 0,
	                    a = 1
	                },
	                god = {
	                    r = 1,
	                    g = 0,
	                    b = 0.91,
	                    a = 1
	                },
	                self = {
	                    r = 1,
	                    g = 1,
	                    b = 1,
	                    a = 1
	                },
	                attacker = {
	                    r = 0.78,
	                    g = 0.31,
	                    b = 0,
	                    a = 1
	                },
	                host = {
	                    r = 0,
	                    g = 0.66,
	                    b = 1,
	                    a = 1
	                },
	                scriptHost = {
	                    r = 1,
	                    g = 1,
	                    b = 1,
	                    a = 1
	                },
	                friend = {
	                    r = 0,
	                    g = 1,
	                    b = 0,
	                    a = 1
	                },
	                bg = {
	                    r = 0,
	                    g = 0,
	                    b = 0,
	                    a = 0.5
	                }
	            },
	            AIM = {
	                hotkeys = {
	                    r = 0,
	                    g = 1,
	                    b = 0,
	                    a = 1
	                },
	                line = {
	                    r = 0,
	                    g = 1,
	                    b = 0,
	                    a = 0.6
	                },
	                highlight = {
	                    r = 0,
	                    g = 1,
	                    b = 0,
	                    a = 1
	                },
	                mark = {
	                    r = 1,
	                    g = 0,
	                    b = 0,
	                    a = 1
	                }
	            },
	            ESP = {
	                r = 0,
	                g = 1,
	                b = 0,
	                a = 1
	            }
	        },
	        MARK_ACTIONS = {
	            peds = {"shoot", "explode", "burn", "atomize", "fireworks"},
	            vehicles = {"explode", "burn", "damage", "emp", "atomize", "fireworks", "randForce"}
	        }
	    },
	    GAME = {
	        BULLET_TYPES = {{
	            "Up-n-Atomizer",
	            hash = "WEAPON_RAYPISTOL"
	        }, {
	            "Firework",
	            hash = "WEAPON_FIREWORK"
	        }, {
	            "RPG",
	            hash = "WEAPON_RPG"
	        }, {
	            "Grenade",
	            hash = "WEAPON_GRENADELAUNCHER"
	        }, {
	            "Smoke",
	            hash = "WEAPON_GRENADELAUNCHER_SMOKE"
	        }, {
	            "Unholy Hellbringer",
	            hash = "WEAPON_RAYCARBINE"
	        }, {
	            "Molotov",
	            hash = "WEAPON_MOLOTOV"
	        }, {
	            "Tennis Ball",
	            hash = "WEAPON_BALL"
	        }, {
	            "Snowball",
	            hash = "WEAPON_SNOWBALL"
	        }, {
	            "Flare",
	            hash = "WEAPON_FLAREGUN"
	        }},
	        LANGUAGES = {
	            [0] = "EN",
	            [1] = "FR",
	            [2] = "DE",
	            [3] = "IT",
	            [4] = "ES",
	            [5] = "BR",
	            [6] = "PL",
	            [7] = "RU",
	            [8] = "KR",
	            [9] = "CN",
	            [10] = "JP",
	            [11] = "MX",
	            [12] = "CN"
	        },
	        INTERIOR_IDS = {
	            pentGarage = 275457,
	            casino = 275201,
	            casinoGarage = 274945,
	            beeker = 179457,
	            lsCarMeet = 285697,
	            lsCarMeet2 = 286209,
	            benny = 196609,
	            barber = 165377,
	            barber2 = 198657,
	            barber3 = 171009,
	            barber4 = 199937,
	            barber5 = 140545,
	            barber6 = 180225,
	            barber7 = 155905,
	            vehWarehouse = 290817,
	            ammuNation = 248065,
	            ammuNation2 = 153857,
	            ammuNation3 = 168193,
	            ammuNation4 = 200961,
	            ammuNation5 = 164609,
	            ammuNation6 = 137729,
	            ammuNation7 = 140289,
	            ammuNation8 = 180481,
	            ammuNation9 = 178689,
	            ammuNation10 = 176385,
	            ammuNation11 = 175617,
	            lsc = 234753,
	            lsc2 = 164353,
	            lsc3 = 201729,
	            lsc4 = 153601,
	            twoCarGarage = 149249,
	            sixCarGarage = 148737,
	            tenCarGarage = 146433,
	            fiftyCarGarage = 290561,
	            eclipseTowers = 230657,
	            lombank = 255745,
	            lombank2 = 255489,
	            lombank3 = 256001,
	            lombank4 = 241921,
	            lombank5 = 256257,
	            arcadius = 253441,
	            arcadius2 = 237313,
	            arcadius3 = 253697,
	            arcadius4 = 253953,
	            arcadius5 = 254209,
	            mazeTower = 239617,
	            mazeTower2 = 254465,
	            mazeTower3 = 254721,
	            mazeTower4 = 254977,
	            mazeTower5 = 255233,
	            mazeBuilding = 244225,
	            mazeBuilding2 = 256513,
	            mazeBuilding3 = 256769,
	            mazeBuilding4 = 257025,
	            mazeBuilding5 = 257281,
	            apart = 206081,
	            apart2 = 206337,
	            apart3 = 206593,
	            apart4 = 149761,
	            apart5 = 148225,
	            delPerro = 145409,
	            delPerro2 = 145921,
	            delPerro3 = 145665,
	            fourWay = 147201,
	            fourWay2 = 141313,
	            fourWay3 = 147969,
	            docForgery = 246785,
	            methLab = 247041,
	            weedFarm = 247297,
	            counterfeitCash = 247809,
	            cocaineLockup = 247553,
	            yacht = 213249,
	            yacht2 = 212737,
	            yacht3 = 212225,
	            hangar = 260353,
	            strip = 197121,
	            tattoo = 199425,
	            tattoo2 = 140033,
	            tattoo3 = 180737,
	            tattoo4 = 180737,
	            tattoo5 = 251137,
	            tattoo6 = 176897,
	            alta = 141825,
	            alta2 = 141569,	            richards = 142849,
	            richards2 = 143361,
	            richards3 = 146177,
	            weazel = 143617,
	            weazel2 = 143105,
	            weazel3 = 142593,
	            clothes = 165633,
	            clothes2 = 235265,
	            clothes3 = 166145,
	            clothes4 = 140801,
	            clothes5 = 176129,
	            clothes6 = 169217,
	            clothes7 = 201473,
	            clothes8 = 171265,
	            clothes9 = 137217,
	            clothes10 = 198145,
	            clothes11 = 183553,
	            clothes12 = 175361,
	            clothes13 = 179713,
	            clothes14 = 202497
	        },
	        INTERIOR_COORDS = {	            kosatkaMissile = {1558.553, 1558.653, 387.213, 388.713, -200, 0},
	            kosatka = {1553, 1568, 361, 452, -200, 0},
	            pentGarage = {1248, 1315, 2218, 264, -200, 0},
	            musicLocker = {1537, 1583, 233, 263, -200, 0},
	            casino = {1082, 1168, 191, 286, -200, 0},
	            casinoGarage = {1333, 1413, 178, 259, -200, 0},
	            eclipseTowers = {-824, -738, 295, 363, 107, 230},
	            autoShop = {-1369, -1318.5, 134.5, 170.5, -200, 0},
	            subMission = {511, 517, 4816, 4906, -200, 0},
	            facility = {310, 511, 4755, 4885, -200, 0},
	            avenger = {504, 535, 4744, 4756, -200, 0},
	            beeker = {98, 115, 6613, 6631, 0, 35},
	            penthouse = {932, 994, -3, 84, 0, 120},
	            arcade = {2673, 2744, -403, -348, -200, 0},
	            docForgery = {1155, 1175, -3201, -3188, -200, 0},
	            mcClub = {1093, 1128, -3180, -3137, -200, 0},
	            counterfeitCash = {1113, 1141, -3200, -3191, -200, 0},
	            vehWarehouse = {926.5, 1014.5, -3039.5, -2985, -200, 0},
	            vehWarehouse2 = {553, 576.51, -456.60, -402.20, -200, 0},
	            methLab = {995, 1019, -3204, -3191, -200, 0},
	            cocaineLockup = {1084, 1104, -3201, -3185, -200, 0},
	            weedFarm = {1029, 1068, -3210, -3178, -200, 0},
	            moc = {1097, 1109, -3014, -2990, -200, 0},
	            twoCarGarage = {168, 180, -1009, -999, -200, -90},
	            sixCarGarage = {189, 208, -1008, -993, -200, -90},
	            tenCarGarage = {216, 242, -1010, -961, -200, 0},
	            fiftyCarGarage = {510, 533, -2640, -2599, -200, 0},
	            bunker = {822, 955, -3253, -3061, -200, 0},
	            fib = {74, 193, -797, -699, 40, 262},
	            agency = {345, 407, -98, -32, 70, 122},
	            agency2 = {-1047, -987, -795, -708, 26, 76},
	            agency3 = {-1042, -992, -447, -404, 42, 77},
	            agency4 = {-610, -568, -727, -704, 37, 129},
	            agencyGarage = {-1084, -1058, -93, -60, -200, 40},
	            lsc = {1172, 1189, 2635, 2644, 0, 43},
	            lsc2 = {723, 738, -1094, -1064, 0, 30},
	            lsc3 = {-355, -319, -147, -121, 0, 44},
	            lsc4 = {-1170, -1139, -2026, -2007, 0, 18},
	            mazeTower = {-118, -29, -868, -773, 0, 320},
	            hangar = {-1308, -1225, -3073, -2956, -200, 0},
	            nightclub = {-1648, -1564, -3022, -2983, -200, 0},
	            nightclubBasement = {-1526, -1480, -3048, -2960, -200, 0},
	            mazeBuilding = {-1421, -1328, -511, -440, 0, 84},
	            terrorbyte = {-1426, -1416, -3019, -3006, -200, 0},
	            benny = {-228.2, -195.2, -1334.2, -1314.1, 0, 39},
	            lombank = {-1595, -1549, -592, -550, 0, 114},
	            arcadius = {-200, -118, -650, -560, 34, 176},
	            apart = {323, 347, 420, 445, 0, 152},
	            apart2 = {323, 381, 400, 445, 0, 150},
	            apart3 = {112, 127, 540, 572, 0, 188},
	            apart4 = {254, 267, -1005, -994, -200, 0},
	            apart5 = {337, 353, -1004, -992, -200, 0},
	            ammuNation = {807, 828, -2165, -2148, 0, 35},
	            ammuNation2 = {838, 847, -1036, -1024, 0, 33},
	            ammuNation3 = {-667, -658, -945, -931, 0, 25},
	            ammuNation4 = {1688, 1702, 3751.5, 3764, 0, 39},
	            ammuNation5 = {-1315, -1302, -398, -387, 0, 38},
	            ammuNation6 = {3, 25, -1116, -1095, 0, 38},
	            ammuNation7 = {243, 256, -54, -43, 0, 74},
	            ammuNation8 = {-336, -322, 6075, 6088, 0, 34},
	            ammuNation9 = {2565, 2573, 290, 304, 0, 114},
	            ammuNation10 = {-3176, -3163, 1081, 1091, 0, 25},
	            ammuNation11 = {-1123, -1110, 2690, 2702, 0, 22},
	            delPerro = {-1483, -1434, -573, -509, 40, 84},
	            fourWay = {-52, -2, -607, -569, 40, 106},
	            lsCarMeet = {-2224, -2140, 1071, 1161, -200, 0},
	            lsCarMeet2 = {-2224, -1835, 970, 1250, 24, 30},
	            strip = {92, 138, -1307, -1277, 28, 32},
	            barber = {-825.1, -807, -191.3, -179, 37, 40},
	            barber2 = {132.5, 142, -1714.1, -1703, 29, 35},
	            barber3 = {-1289, -1277, -1120, -1115, 6, 10},
	            barber4 = {1928, 1937, 3725, 3736, 32, 36},
	            barber5 = {-37, -29, -157, -146, 57, 66},
	            barber6 = {-284.2, -274, 6223, 6233, 31, 37},
	            barber7 = {1206, 1217, -477, -469, 66, 78},
	            tattoo = {1860, 1867, 3744, 3752, 32, 36},
	            tattoo2 = {319, 327, 178, 187, 103, 127},
	            tattoo3 = {-297, -289, 6196, 6203, 31, 34},
	            tattoo4 = {-1158, -1148, -1430, -1422, 4, 11},
	            tattoo5 = {1319, 1329, -1657, -1649, 52, 57},
	            tattoo6 = {-3176, -3167, 1072, 1080, 20, 25},
	            alta = {-291, -252, -971, -937, 70, 100},
	            tinsel = {-630, -571, 36, 72, 50, 115},
	            richards = {-937, -893, -392, -359, 75, 116},
	            weazel = {-923, -875, -469, -420, 85, 128},
	            clothes = {-721, -699, -165, -145, 37, 40},
	            clothes2 = {-172, -154, -315, -293, 39, 43},
	            clothes3 = {-1462, -1443, -247, -225, 49, 52},
	            clothes4 = {116, 133, -235, -206, 54, 57},
	            clothes5 = {-3181, -3161, 1033, 1061, 20, 23},
	            clothes6 = {-1207, -1180, -784, -763, 17, 20},
	            clothes7 = {612, 624, 2747, 2776, 41, 45},
	            clothes8 = {-832, -814, -1084, -1066, 11, 15},
	            clothes9 = {418, 432, -813, -798, 29, 35},
	            clothes10 = {69, 83, -1401, -1386, 29, 34},
	            clothes11 = {1686, 1700, 4716, 4831, 41, 45},
	            clothes12 = {-1111, -1093, 2700, 2718, 18, 22},
	            clothes13 = {-4, 14, 6505, 6523, 31, 36},
	            clothes14 = {1188, 1203, 2703, 2716, 38, 41},
	            masks = {-1340.5, -1334, -1284, -1274, 4, 5},
	            cayoPerico = {3500, 5950, -6300, -3990},
	            ussLex = {2990, 3130, -4830, -4510},
	            arena = {147, 233, 5155, 5218}
	        }
	    },
	    RAYCAST = {
	        TraceFlag = {
	            all = 4294967295,
	            vehicles = 2,
	            peds = 8,
	            objects = 16
	        }
	    }
	};
end
package.loaded["src.lib.constants"] = nil
package.preload["src.lib.menus.aim.settings"] = function(...)
	local pedAimTextToRender = ""
	local vehicleAimTextToRender = ""
	local objectAimTextToRender = ""
	local aimTeleportHotkeyAssigned = false
	local hotkeysColor = CONSTANTS.SCRIPT.COLORS.AIM.hotkeys
	local lineColor = CONSTANTS.SCRIPT.COLORS.AIM.line
	local highlightColor = CONSTANTS.SCRIPT.COLORS.AIM.highlight
	local markColor = CONSTANTS.SCRIPT.COLORS.AIM.mark
	local typeColor = {}
	typeColor.r = hotkeysColor.r / 0.2
	typeColor.g = hotkeysColor.g / 0.2
	typeColor.b = hotkeysColor.b / 0.2
	typeColor.a = hotkeysColor.a
	local xValue, yValue, scaleValue = 50, 90, 60
	local nameEnabled, hotkeysEnabled, lineEnabled, highlightEnabled, beaconEnabled, showHealth = true, true, true, true, true, true
	local pedMarkAction = CONSTANTS.SCRIPT.MARK_ACTIONS.peds[1]
	local vehMarkAction = CONSTANTS.SCRIPT.MARK_ACTIONS.vehicles[1]
	local keepMarked = false
	local function setAimHotkeys()
	    local hotkeysFileName = filesystem.stand_dir() .. '\\' .. 'Hotkeys.txt'
	    local hotkeysFile = util.read_colons_and_tabs_file(hotkeysFileName)
	    pedAimTextToRender = ""
	    vehicleAimTextToRender = ""
	    objectAimTextToRender = ""
	    aimTeleportHotkeyAssigned = false
	    local assignedPedHotkeysCount = 0
	    local assignedPedHotkeys = false
	    local assignedVehicleHotkeysCount = 0
	    local assignedVehicleHotkeys = false
	    local assignedObjectHotkeysCount = 0
	    local maxHotkeysPerLine = 8
	    for key, hotkey in hotkeysFile do
	        if menu.ref_by_path(key):isValid() and key:contains(SCRIPT_NAME) and key:contains(UND_translations.aim.name) then
	            if key:contains(UND_translations.vehicle.name) then
	                local menuAction = menu.get_menu_name(menu.ref_by_path(key))
	                local hotkeyAction = menuAction .. ": " .. hotkey
	                assignedVehicleHotkeysCount = assignedVehicleHotkeysCount + 1
	                assignedVehicleHotkeys = true
	                if assignedVehicleHotkeysCount > maxHotkeysPerLine then
	                    hotkeyAction = hotkeyAction .. "\n"
	                    assignedVehicleHotkeysCount = 0
	                end
	                vehicleAimTextToRender = vehicleAimTextToRender .. "  " .. hotkeyAction
	            elseif key:contains(UND_translations.aim.peds) then
	                local menuAction = menu.get_menu_name(menu.ref_by_path(key))
	                local hotkeyAction = menuAction .. ": " .. hotkey
	                assignedPedHotkeysCount = assignedPedHotkeysCount + 1
	                assignedPedHotkeys = true
	                if assignedPedHotkeysCount > maxHotkeysPerLine then
	                    hotkeyAction = hotkeyAction .. "\n"
	                    assignedPedHotkeysCount = 0
	                end
	                pedAimTextToRender = pedAimTextToRender .. "  " .. hotkeyAction
	            elseif key:contains(UND_translations.aim.objects) then
	                local menuAction = menu.get_menu_name(menu.ref_by_path(key))
	                local hotkeyAction = menuAction .. ": " .. hotkey
	                assignedObjectHotkeysCount = assignedObjectHotkeysCount + 1
	                if assignedObjectHotkeysCount > maxHotkeysPerLine then
	                    hotkeyAction = hotkeyAction .. "\n"
	                    assignedObjectHotkeysCount = 0
	                end
	                objectAimTextToRender = objectAimTextToRender .. "  " .. hotkeyAction
	            end
	        end
	        if key:contains(SCRIPT_NAME) and key:contains(UND_translations.aim.teleport) then
	            aimTeleportHotkeyAssigned = true
	        end
	    end
	    if not assignedPedHotkeys then
	        pedAimTextToRender = UND_translations.aim.noAssignedHotkeysPeds
	    end
	    if not assignedVehicleHotkeys then
	        vehicleAimTextToRender = UND_translations.aim.noAssignedHotkeysVehs
	    end
	end
	local function onAim()
	    if not beaconEnabled and not aimTeleportHotkeyAssigned and not highlightEnabled and not hotkeysEnabled and not lineEnabled then
	        return
	    end
	    local aimResult = Raycast.getPlayerAimData(nil, true)
	    if not aimResult then
	        return
	    end
	    local isTargetable = aimResult.isVehicle or aimResult.isPed or aimResult.isObject
	    if aimTeleportHotkeyAssigned and beaconEnabled and not isTargetable and v3.distance(aimResult.coords, Player.getPlayerPosition()) > 15 then
	        util.draw_ar_beacon(aimResult.coords)
	    end
	    if (highlightEnabled or lineEnabled or hotkeysEnabled) and isTargetable then
	        if highlightEnabled then
	            Utils.drawBox(aimResult.entity, highlightColor)
	        end
	        if lineEnabled then
	            local pCoords = Player.getPlayerPosition()
	            local entCoords = ENTITY.GET_ENTITY_COORDS(aimResult.entity)
	            GRAPHICS.DRAW_LINE(pCoords.x, pCoords.y, pCoords.z, entCoords.x, entCoords.y, entCoords.z, lineColor.r, lineColor.g, lineColor.b, lineColor.a)
	        end
	        if hotkeysEnabled or nameEnabled then
	            local textToRender = ""
	            local typeToRender = ""
	            if aimResult.isVehicle then
	                if hotkeysEnabled then
	                    textToRender = vehicleAimTextToRender
	                end
	                if nameEnabled then
	                    typeToRender = UND_translations.vehicle.name
	                    local vehName = Vehicle.getName(ENTITY.GET_ENTITY_MODEL(aimResult.entity))
	                    if vehName ~= "" then
	                        typeToRender = typeToRender .. " - " .. vehName
	                    end
	                    if aimResult.player then
	                        typeToRender = typeToRender .. " (" .. Player.getPlayerName(aimResult.player, false, true) .. ")"
	                    end
	                end
	            elseif aimResult.isPed then
	                if hotkeysEnabled then
	                    textToRender = pedAimTextToRender
	                end
	                if nameEnabled then
	                    typeToRender = UND_translations.aim.ped
	                    if aimResult.player then
	                        typeToRender = typeToRender .. " (" .. Player.getPlayerName(aimResult.player, false, true) .. ")"
	                    end
	                end
	                if showHealth then
	                    local hpData = Ped.getHealth(aimResult.entity)
	                    typeToRender = typeToRender .. " [H: " .. hpData.health .. "/" .. hpData.maxHealth .. " "
	                    typeToRender = typeToRender .. "A: " .. hpData.armor .. "/50]"
	                end
	            elseif hotkeysEnabled then
	                textToRender = objectAimTextToRender
	            end
	            if nameEnabled or showHealth then
	                local offset = 0
	                if hotkeysEnabled then
	                    local multiplier = 0.1
	                    if textToRender:len() > 500 then
	                        multiplier = 0.12
	                    end
	                    offset = multiplier * scaleValue
	                end
	                directx.draw_text(xValue, yValue - offset, typeToRender, 5, scaleValue, typeColor, false)
	            end
	            if hotkeysEnabled then
	                directx.draw_text(xValue, yValue, textToRender, 5, scaleValue, hotkeysColor, false)
	            end
	        end
	    end
	end
	local function markTargets()
	    if #UND_markedTargets > 0 then
	        for idx, entity in UND_markedTargets do
	            if ENTITY.DOES_ENTITY_EXIST(entity) and not ENTITY.IS_ENTITY_DEAD(entity) then
	                Utils.drawBox(entity, markColor)
	            end
	        end
	    end
	end
	local function unmarkAll()
	    for i = 1, #UND_markedTargets do
	        table.remove(UND_markedTargets, 1)
	    end
	end
	local function triggerMarkAction()
	    if #UND_markedTargets > 0 then
	        for _, entity in UND_markedTargets do
	            if ENTITY.DOES_ENTITY_EXIST(entity) and not ENTITY.IS_ENTITY_DEAD(entity) then
	                if ENTITY.IS_ENTITY_A_PED(entity) then
	                    if pedMarkAction == "shoot" then
	                        Ped.shoot(entity)
	                    elseif pedMarkAction == "explode" then
	                        Ped.explode(entity)
	                    elseif pedMarkAction == "atomize" then
	                        Ped.atomize(entity)
	                    elseif pedMarkAction == "fireworks" then
	                        Ped.fireworks(entity)
	                    elseif pedMarkAction == "burn" then
	                        Ped.burn(entity)
	                    end
	                else
	                    if vehMarkAction == "explode" then
	                        Vehicle.explode(entity)
	                    elseif vehMarkAction == "damage" then
	                        Vehicle.damage(entity)
	                    elseif vehMarkAction == "emp" then
	                        Vehicle.emp(entity)
	                    elseif vehMarkAction == "atomize" then
	                        Vehicle.atomize(entity)
	                    elseif vehMarkAction == "fireworks" then
	                        Vehicle.fireworks(entity)
	                    elseif vehMarkAction == "burn" then
	                        Vehicle.burn(entity)
	                    elseif vehMarkAction == "randForce" then
	                        Vehicle.randomLaunch(entity)
	                    end
	                end
	            end
	        end
	        if not keepMarked then
	            unmarkAll()
	        end
	    end
	end	local function setupAimSettings(aimMenu, aimPedsSubmenu, aimVehicleSubmenu, aimObjectsSubmenu, aimTeleportAction)
	    if UND_privateMode then
	        UND_aimLockTime = 0
	    end
	    menu.divider(aimMenu, UND_translations.aim.aimLock)
	    local aimLockToggle = menu.toggle(aimMenu, UND_translations.aim.aimLockLastTarget, {Utils.getCommandName("aimlock")}, UND_translations.aim.aimLockLastTargetD,
	        function(on)
	            UND_aimLockEnabled = on
	        end, UND_aimLockEnabled)
	    UND_aimLockEnabled = menu.get_value(aimLockToggle)
	    local aimLockTimeSlider = menu.slider(aimMenu, UND_translations.aim.lockTime, {Utils.getCommandName("aimlocktime")}, UND_translations.aim.lockTimeD, 0, 30,
	        UND_aimLockTime, 1, function(val)
	            UND_aimLockTime = val
	        end)
	    UND_aimLockTime = menu.get_value(aimLockTimeSlider)
	    menu.action(aimMenu, UND_translations.aim.selectCurrentVehicle, {Utils.getCommandName("selectcurrentvehicle")}, UND_translations.aim.selectCurrentVehicleD, function()
	        local vehicle = Vehicle.getCurrentVehicle(true, true)
	        if vehicle == 0 then
	            Utils.showToast(UND_translations.vehicle.notInVehicle)
	            return
	        end
	        local player = Network.getPlayerFromPed(VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehicle, -1))
	        if player == -1 then
	            player = nil
	        end
	        UND_aimLockEndTime = Utils.getTime(UND_aimLockTime * 1000)
	        UND_aimLockEntity = {
	            entity = vehicle,
	            vehicle = vehicle,
	            isVehicle = true,
	            player = player
	        }
	    end)
	    local removeLockRel = menu.action(aimMenu, UND_translations.aim.removeAimLock, {Utils.getCommandName("removeaimlock")}, UND_translations.aim.removeAimLockD, function()
	        UND_aimLockEnabled = false
	        util.yield(1000)
	        UND_aimLockEnabled = true
	    end)
	    menu.divider(aimMenu, UND_translations.aim.markSettings)
	    menu.colour(aimMenu, UND_translations.aim.markColor, {Utils.getCommandName("markcolor")}, "", markColor, true, function(c)
	        markColor = Utils.convertColorToGame(c)
	    end)
	    markColor = Utils.convertColorToGame(markColor)
	    local pedMarkValues = {}
	    for idx, v in CONSTANTS.SCRIPT.MARK_ACTIONS.peds do
	        pedMarkValues[idx] = UND_translations.aim.markActions[v]
	    end
	    local pedMarkSelect = menu.list_select(aimMenu, UND_translations.aim.markedActionPed, {Utils.getCommandName("pedmarkaction")}, "", pedMarkValues, 1, function(idx)
	        pedMarkAction = CONSTANTS.SCRIPT.MARK_ACTIONS.peds[idx]
	    end)
	    pedMarkAction = CONSTANTS.SCRIPT.MARK_ACTIONS.peds[menu.get_value(pedMarkSelect)]
	    local vehMarkValues = {}
	    for idx, v in CONSTANTS.SCRIPT.MARK_ACTIONS.vehicles do
	        vehMarkValues[idx] = UND_translations.aim.markActions[v]
	    end
	    local vehMarkSelect = menu.list_select(aimMenu, UND_translations.aim.markedActionVeh, {Utils.getCommandName("vehmarkaction")}, "", vehMarkValues, 1, function(idx)
	        vehMarkAction = CONSTANTS.SCRIPT.MARK_ACTIONS.vehicles[idx]
	    end)
	    vehMarkAction = CONSTANTS.SCRIPT.MARK_ACTIONS.vehicles[menu.get_value(vehMarkSelect)]
	    local keepMarkedToggle = menu.toggle(aimMenu, UND_translations.aim.keepMark, {Utils.getCommandName("keepmarked")}, "", function(on)
	        keepMarked = on
	    end, keepMarked)
	    keepMarked = menu.get_value(keepMarkedToggle)
	    menu.action(aimMenu, UND_translations.aim.unmarkAll, {Utils.getCommandName("unmark")}, "", unmarkAll)
	    menu.action(aimMenu, UND_translations.aim.triggerMarkAction, {Utils.getCommandName("triggermark")}, "", triggerMarkAction)
	    menu.divider(aimMenu, UND_translations.general.settings)
	    local hotkeysPositionSubmenu = menu.list(aimMenu, UND_translations.aim.hotkeysPos, {}, "")
	    local xSlider = menu.slider(hotkeysPositionSubmenu, UND_translations.general.hPos, {Utils.getCommandName("hotkeyshpos")}, "", 0, 100, xValue, 1, function(val)
	        xValue = val / 100
	    end)
	    xValue = menu.get_value(xSlider) / 100
	    local ySlider = menu.slider(hotkeysPositionSubmenu, UND_translations.general.vPos, {Utils.getCommandName("hotkeysvpos")}, "", 0, 100, yValue, 1, function(val)
	        yValue = val / 100
	    end)
	    yValue = menu.get_value(ySlider) / 100
	    local scaleSlider = menu.slider(hotkeysPositionSubmenu, UND_translations.general.scale, {Utils.getCommandName("hotkeysscale")}, "", 1, 200, scaleValue, 1, function(val)
	        scaleValue = val / 100
	    end)
	    scaleValue = menu.get_value(scaleSlider) / 100
	    menu.colour(aimMenu, UND_translations.aim.hotkeysColor, {Utils.getCommandName("hotkeyscolor")}, "", hotkeysColor, true, function(c)
	        hotkeysColor = c
	        typeColor.r = hotkeysColor.r / 0.2
	        typeColor.g = hotkeysColor.g / 0.2
	        typeColor.b = hotkeysColor.b / 0.2
	        typeColor.a = hotkeysColor.a
	    end)
	    local hotkeysToggle = menu.toggle(aimMenu, UND_translations.aim.showHotkeys, {Utils.getCommandName("aimhotkeys")}, "", function(on)
	        hotkeysEnabled = on
	        setAimHotkeys()
	    end, true)
	    hotkeysEnabled = menu.get_value(hotkeysToggle)
	    local nameToggle = menu.toggle(aimMenu, UND_translations.aim.showName, {Utils.getCommandName("aimname")}, UND_translations.aim.showNameD, function(on)
	        nameEnabled = on
	    end, true)
	    nameEnabled = menu.get_value(nameToggle)
	    local hpToggle = menu.toggle(aimMenu, UND_translations.online.showHealth, {Utils.getCommandName("aimhealth")}, "", function(on)
	        showHealth = on
	    end, showHealth)
	    showHealth = menu.get_value(hpToggle)
	    menu.colour(aimMenu, UND_translations.aim.lineColor, {Utils.getCommandName("linecolor")}, "", lineColor, true, function(c)
	        lineColor = Utils.convertColorToGame(c)
	    end)
	    lineColor = Utils.convertColorToGame(lineColor)
	    local showLineToggle = menu.toggle(aimMenu, UND_translations.aim.showLine, {}, "", function(on)
	        lineEnabled = on
	    end, lineEnabled)
	    lineEnabled = menu.get_value(showLineToggle)
	    menu.colour(aimMenu, UND_translations.aim.hgColor, {Utils.getCommandName("highlightcolor")}, "", highlightColor, true, function(c)
	        highlightColor = Utils.convertColorToGame(c)
	    end)
	    highlightColor = Utils.convertColorToGame(highlightColor)
	    local highlightToggle = menu.toggle(aimMenu, UND_translations.aim.hgTarget, {}, "", function(on)
	        highlightEnabled = on
	    end, highlightEnabled)
	    highlightEnabled = menu.get_value(highlightToggle)
	    local tpBeaconToggle = menu.toggle(aimMenu, UND_translations.aim.showBeacon, {Utils.getCommandName("aimtpbeacon")}, "", function(on)
	        beaconEnabled = on
	    end, beaconEnabled)
	    beaconEnabled = menu.get_value(tpBeaconToggle)
	    local enableAimActionsToggle = menu.toggle(aimMenu, UND_translations.aim.enableAimActions, {Utils.getCommandName("enableaimactions")},
	        UND_translations.aim.enableAimActionsD, function(on)
	            UND_aimModeActive = on
	            if on and UND_aimLockEntity and not Player.isUserAiming() then
	                menu.trigger_command(removeLockRel)
	            end
	        end, UND_aimModeActive)
	    UND_aimModeActive = menu.get_value(enableAimActionsToggle)
	    local mainAimKeyToggle = menu.toggle(aimMenu, UND_translations.aim.enableAimHotkey, {Utils.getCommandName("enableaimhotkey")}, UND_translations.aim.enableAimHotkeyD,
	        function(on)
	            UND_aimModeActiveAsAimButton = on
	        end, UND_aimModeActiveAsAimButton)
	    UND_aimModeActiveAsAimButton = menu.get_value(mainAimKeyToggle)
	    setAimHotkeys()
	    menu.on_blur(aimPedsSubmenu, setAimHotkeys)
	    menu.on_blur(aimVehicleSubmenu, setAimHotkeys)
	    menu.on_blur(aimObjectsSubmenu, setAimHotkeys)
	    menu.on_blur(aimTeleportAction, setAimHotkeys)
	    util.create_tick_handler(onAim)
	    util.create_tick_handler(markTargets)
	end
	return setupAimSettings
end
package.loaded["src.lib.menus.aim.settings"] = nil
package.preload["src.lib.menus.online.allPlayers"] = function(...)
	local includeMyPed = false
	local function randomBlameKills()
	    if not util.is_session_started() then
	        Utils.showToast(UND_translations.general.onlyOnline)
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        if not Player.isDead(pid) then
	            local killerPid = playersList[Utils.rand(1, #playersList)]
	            local tries = 0
	            while killerPid == pid and tries < 3 do
	                tries = tries + 1
	                killerPid = playersList[Utils.rand(1, #playersList)]
	            end
	            Ped.explode(Player.getPlayerPed(killerPid), Player.getPlayerPed(pid))
	        end
	    end
	end
	local function waterJet()
	    if not util.is_session_started() then
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        if not Player.isDead(pid) then
	            Ped.waterJet(Player.getPlayerPed(pid))
	        end
	    end
	    util.yield(100)
	end
	local function flameJet()
	    if not util.is_session_started() then
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        if not Player.isDead(pid) then
	            Ped.flameJet(Player.getPlayerPed(pid))
	        end
	    end
	    util.yield(100)
	end
	local function explode()
	    if not util.is_session_started() then
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        if not Player.isDead(pid) then
	            Ped.explode(Player.getPlayerPed(pid))
	        end
	    end
	    util.yield(100)
	end
	local function randomExplode()
	    if not util.is_session_started() then
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        if not Player.isDead(pid) then
	            Ped.explode(Player.getPlayerPed(pid), true)
	        end
	    end
	    util.yield(100)
	end
	local function spawnRandom()
	    if not util.is_session_started() then
	        Utils.showToast(UND_translations.general.onlyOnline)
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        if not Player.getInterior(pid) then
	            local coords = Player.getPlayerPosition(pid)
	            local rot = ENTITY.GET_ENTITY_ROTATION(Player.getPlayerPed(pid), 2):toDir()
	            v3.mul(rot, 8)
	            v3.add(coords, rot)
	            Vehicle.spawnRandom(coords)
	        end
	    end
	end
	local function makeWanted()
	    if not util.is_session_started() then
	        Utils.showToast(UND_translations.general.onlyOnline)
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        Player.makeWanted(pid)
	        util.yield(100)
	    end
	end
	local function makeWantedLoop()
	    if not util.is_session_started() then
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        if Player.getWantedLevel(pid) == 0 then
	            Player.makeWanted(pid)
	            util.yield(100)
	        end
	    end
	end
	local function placeBounty()
	    if not util.is_session_started() then
	        Utils.showToast(UND_translations.general.onlyOnline)
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        Player.placeBounty(pid)
	        util.yield(100)
	    end
	end
	local function bountyLoop()
	    if not util.is_session_started() then
	        return
	    end
	    for _, pid in players.list(includeMyPed) do
	        if not players.get_bounty(pid) then
	            Player.placeBounty(pid)
	            util.yield(100)
	        end
	    end
	    util.yield(5000)
	end	local function setupAllPlayersMenu(sessionMenu)
	    local allPlayersMenu = menu.list(sessionMenu, UND_translations.online.allPlayers, {}, "")
	    local includeMyPedToggle = menu.toggle(allPlayersMenu, UND_translations.general.includeMyPed, {Utils.getCommandName("allincludemyped")}, "", function(on)
	        includeMyPed = on
	    end, includeMyPed)
	    includeMyPed = menu.get_value(includeMyPedToggle)
	    menu.divider(allPlayersMenu, UND_translations.player.friendly)
	    menu.action(allPlayersMenu, UND_translations.vehicle.spawnRandom, {Utils.getCommandName("allspawnrandomvehicle")}, "", spawnRandom)
	    menu.divider(allPlayersMenu, UND_translations.player.trolling)
	    menu.action(allPlayersMenu, UND_translations.player.makeWanted, {Utils.getCommandName("allmakewanted")}, "", makeWanted)
	    menu.toggle_loop(allPlayersMenu, UND_translations.player.makeWantedLoop, {Utils.getCommandName("allwantedloop")}, "", makeWantedLoop)
	    menu.action(allPlayersMenu, UND_translations.player.placeBounty, {Utils.getCommandName("allplacebounty")}, "", placeBounty)
	    menu.toggle_loop(allPlayersMenu, UND_translations.player.bountyLoop, {Utils.getCommandName("allbountyloop")}, UND_translations.player.bountyLoopD, bountyLoop)
	    menu.divider(allPlayersMenu, UND_translations.player.malicious)
	    menu.action(allPlayersMenu, UND_translations.online.randomBlameKills, {Utils.getCommandName("allrandomblamekills")}, "", randomBlameKills)
	    menu.toggle_loop(allPlayersMenu, UND_translations.player.waterJet, {Utils.getCommandName("allwaterjet")}, "", waterJet)
	    menu.toggle_loop(allPlayersMenu, UND_translations.player.flameJet, {Utils.getCommandName("allflamejet")}, "", flameJet)
	    menu.toggle_loop(allPlayersMenu, UND_translations.general.explode, {Utils.getCommandName("allexplode")}, "", explode)
	    menu.toggle_loop(allPlayersMenu, UND_translations.general.randomExplosion, {Utils.getCommandName("allrandomexplode")}, "", randomExplode)
	end
	return setupAllPlayersMenu
end
package.loaded["src.lib.menus.online.allPlayers"] = nil
package.preload["src.lib.menus.player.friendly"] = function(...)
	local function setupPlayerFriendlyMenu(friendlySubmenu, pid)
	    local playerName = Player.getPlayerName(pid, true)
	    local function fixLoading()
	        menu.trigger_commands("givesh" .. playerName)
	        menu.trigger_commands("aptme" .. playerName)
	        menu.trigger_commands("interiorkick" .. playerName)
	    end
	    local function spawnRandom()
	        local coords = Player.getPlayerPosition(pid)
	        local rot = ENTITY.GET_ENTITY_ROTATION(Player.getPlayerPed(pid), 2):toDir()
	        v3.mul(rot, 8)
	        v3.add(coords, rot)
	        Vehicle.spawnRandom(coords)
	    end
	    menu.action(friendlySubmenu, UND_translations.player.fixLoading, {Utils.getCommandName("fixloading")}, UND_translations.player.fixLoadingD, fixLoading)
	    menu.action(friendlySubmenu, UND_translations.vehicle.spawnRandom, {Utils.getCommandName("spawnrandomvehicle")}, "", spawnRandom)
	end
	return setupPlayerFriendlyMenu
end
package.loaded["src.lib.menus.player.friendly"] = nil
package.preload["src.lib.updater"] = function(...)
	local mainGitlabPath = "/undefinedscripts/undefined-for-stand/-/raw/main/"
	local mainFileName = "Undefined.lua"
	local updateActionRef
	local function runUpdater()
	    local updateInProgress = false
	    updateActionRef = menu.action(menu.my_root(), UND_translations.main.checkUpdates, {}, "", function(clickType)
	        if updateInProgress then
	            Utils.showToast(UND_translations.main.updateInProgress)
	            return
	        end
	        local onSuccess = function(resBody, _, statusCode)
	            if statusCode >= 200 and statusCode < 300 and resBody and resBody:len() > 0 and not resBody:contains(CONSTANTS.SCRIPT.VERSION) then
	                updateInProgress = true
	                menu.set_menu_name(updateActionRef, UND_translations.main.updating)
	                Utils.showToast(UND_translations.main.updatingToast)
	                local scriptFile = io.open(filesystem.scripts_dir() .. mainFileName, "wb")
	                if not scriptFile then
	                    Utils.showToast(UND_translations.main.updateFileFail)
	                    Utils.logToFile("Cannot write to file on update.")
	                    updateInProgress = false
	                    menu.set_menu_name(updateActionRef, UND_translations.main.update)
	                    return
	                end
	                scriptFile:write(resBody .. "\n")
	                scriptFile:close()
	                Utils.showToast(UND_translations.main.updateSuccess)
	                util.restart_script()
	            elseif clickType == 0 then
	                Utils.showToast(UND_translations.main.noUpdates)
	            end
	        end
	        async_http.init("https://gitlab.com", mainGitlabPath .. mainFileName, onSuccess)
	        async_http.dispatch()
	    end)
	    util.create_thread(function()
	        util.yield(3000)
	        menu.trigger_command(updateActionRef)
	        util.stop_thread()
	    end)
	end
	runUpdater()
end
package.loaded["src.lib.updater"] = nil
package.preload["src.lib.menus.aim.beam"] = function(...)
	local aimBeamWeapon = CONSTANTS.GAME.BULLET_TYPES[1]
	local aimBeamDelay = 200
	local function aimBeam()
	    local weaponHash = Utils.requestWeaponAsset(aimBeamWeapon.hash)
	    local playerCoords = Player.getPlayerPosition()
	    local _, shootCoords = Raycast.getOffsetFromCam(1000)
	    local zOffset = 1
	    local myPed = Player.getPlayerPed()
	    local vehicle = Ped.getVehicle(myPed)
	    local entityToIgnore = myPed
	    if vehicle then
	        zOffset = Utils.getDimensions(vehicle).z
	        entityToIgnore = vehicle
	        if ENTITY.GET_ENTITY_HEIGHT_ABOVE_GROUND(vehicle) > 10 and shootCoords.z < playerCoords.z + zOffset then
	            zOffset = zOffset * -1
	        end
	    end
	    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(playerCoords.x, playerCoords.y, playerCoords.z + zOffset, shootCoords.x, shootCoords.y, shootCoords.z, 200, false,
	        weaponHash, 0, true, false, 2000, entityToIgnore)
	    util.yield(aimBeamDelay)
	    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(weaponHash)
	end	local function setupAimBeam(aimMenu)
	    menu.divider(aimMenu, UND_translations.aim.aimBeam)
	    local aimBeamToggleLoop = menu.toggle_loop(aimMenu, UND_translations.aim.useBeam, {}, UND_translations.aim.useBeamD, aimBeam)
	    menu.set_value(aimBeamToggleLoop, false)
	    local aimBeamSelect = menu.list_select(aimMenu, UND_translations.general.bulletType, {Utils.getCommandName("beamtype")}, "", CONSTANTS.GAME.BULLET_TYPES, 1,
	        function(idx)
	            aimBeamWeapon = CONSTANTS.GAME.BULLET_TYPES[idx]
	        end)
	    aimBeamWeapon = CONSTANTS.GAME.BULLET_TYPES[menu.get_value(aimBeamSelect)]
	    local delaySlider = menu.slider(aimMenu, UND_translations.general.delay, {Utils.getCommandName("beamdelay")}, "", 50, 500, aimBeamDelay, 50, function(val)
	        aimBeamDelay = val
	    end)
	    aimBeamDelay = menu.get_value(delaySlider)
	end
	return setupAimBeam
end
package.loaded["src.lib.menus.aim.beam"] = nil
do
	local _result = package.preload["__luapack_entry__"](...)
	return _result
end
