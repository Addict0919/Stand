util.keep_running()
util.require_natives(1651208000)

local getEntityCoords = ENTITY.GET_ENTITY_COORDS
local getPlayerPed = PLAYER.GET_PLAYER_PED

function RqModel (hash)
    STREAMING.REQUEST_MODEL(hash)
    local count = 0
    util.toast("Requesting model...")
    while not STREAMING.HAS_MODEL_LOADED(hash) and count < 100 do
        STREAMING.REQUEST_MODEL(hash)
        count = count + 1
        util.yield(10)
    end
    if not STREAMING.HAS_MODEL_LOADED(hash) then
        util.toast("Tried for 1 second, couldn't load this specified model!")
    end
end

local function spawnObjectAtCoords(hash, coord)
    RqModel(hash)
    local ob = entities.create_object(hash, coord)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
    return ob
end

local function vDist2(coord1, coord2)
    return SYSTEM.VDIST2(coord1.x, coord1.y, coord1.z, coord2.x, coord2.y, coord2.z)
end

local function getAllPlayersAsHandles(you, friends, strangers)
    local plist = players.list(you, friends, strangers)
    local pedTable = {}
    for i = 1, #plist do pedTable[#pedTable+1] = getPlayerPed(plist[i]) end
    return pedTable
end

local function isEntityNearPlayer(entity, you, friends, strangers, range)
    local players = getAllPlayersAsHandles(you, friends, strangers)
    for i = 1, #players do
        local r = range * range --vdist2 is without square root
        local ec = getEntityCoords(entity); local pc = getEntityCoords(players[i])
        local vdist = vDist2(ec, pc)
        if vdist <= r then return true end
    end
    return false
end

local function explodeAndDelete(entity, exploID, ownerPed, dmgscale, audible, invisible, camshake)
    local ec = getEntityCoords(entity)
    FIRE.ADD_OWNED_EXPLOSION(ownerPed, ec.x, ec.y, ec.z, exploID, dmgscale, audible, invisible, camshake)
    entities.delete_by_handle(entity)
end

local menuroot = menu.my_root()
local drop_bombs = {
    delay = 250,
    hash = util.joaat("w_smug_airmissile_02")
}
menu.toggle_loop(menuroot, "Drop Bombs", {}, "", function ()
    local localc = getEntityCoords(getPlayerPed(players.user()))
    localc.z = localc.z - 5
    util.create_thread(function ()
        local object = spawnObjectAtCoords(drop_bombs.hash, localc)
        local isnear = false
        for i = 1, 100 do
            if isEntityNearPlayer(object, false, true, true, 5) then explodeAndDelete(object, 47, getPlayerPed(players.user()), 5, true, false, 3) isnear = true return 0 end
            if ENTITY.DOES_ENTITY_EXIST(object) then ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(object, 1, 0, 0, -10000, true, false, true, true) end
            util.yield(20)
        end
        if not isnear then explodeAndDelete(object, 47, getPlayerPed(players.user()), 5, true, false, 3) end --bypass access violation
    end)
    util.yield(drop_bombs.delay)
end)

menu.slider(menuroot, "Drop Bomb Delay (ms)", {"bombmsdelay"}, "The delay, in milliseconds, before another bomb spawning.", 1, 10000, 250, 50, function (value)
    drop_bombs.delay = value
end)