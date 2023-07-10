require("natives-1606100775")

util.toast("Anti Oppressor by Puchi loaded. gl hf")

excludeAntiOppressor = {}
for b = 0,30 do
    excludeAntiOppressor[b] = false
end

function PlayerlistFeatures(playerID)
    menu.divider(menu.player_root(playerID), "Anti Oppressor")
    menu.toggle(menu.player_root(playerID), "Exclude from Anti Oppressor", {"excludeAntiOppressor"}, "Excludes the player from Anti Oppressor feature.", function(on)
        if on then
            excludeAntiOppressor[playerID] = true
        else
            excludeAntiOppressor[playerID] = false
        end
    end)
end

for pid = 0,30 do
    if players.exists(pid) then
        PlayerlistFeatures(pid)
    end
end
players.on_join(PlayerlistFeatures)

local antiOppressor = true
menu.toggle(menu.my_root(), "Toggle", {"antioppressor", "antimk2"}, "Enables/Disables the Anti Oppressor feature.", function(on)
    if on then
        antiOppressor = true
    else
        antiOppressor = false
    end
end, true)

function isOnOppressor(playerID)
    local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(playerID)
    local vehicle = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
    local hash = util.joaat("oppressor2")
    if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
        return true
    else
        return false
    end
end

function isSocialclubFriend(playerID)
    local playerHandle = memory.alloc(13)
    NETWORK.NETWORK_HANDLE_FROM_PLAYER(playerID, playerHandle, 13)
    local isFriend = NETWORK.NETWORK_IS_FRIEND(playerHandle)
    return isFriend
end

local lastReaction = util.current_time_millis()
local delay = 1500
while true do
    for a = 0,30 do
        if players.exists(a) then
            local isLocalPlayer = a == PLAYER.PLAYER_ID()
            local isFriend = isSocialclubFriend(a)
            if antiOppressor and isOnOppressor(a) and not isLocalPlayer and not isFriend and (lastReaction + delay <= util.current_time_millis()) and not excludeAntiOppressor[a] then
                util.toast("Found N00bbike user: " .. PLAYER.GET_PLAYER_NAME(a) .. "\nKicking...")
                util.trigger_script_event(1 << a, {-1333236192})
                lastReaction = util.current_time_millis()
            end
        end
    end
    util.yield()
end