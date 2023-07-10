util.keep_running()

util.toast("Loaded Ozark protections.lua!")

local function scriptedGameEventHandler(pid, _, args)
    if (args[1] == 1279059857) then
        util.toast("Blocked remote global change V1 from " .. PLAYER.GET_PLAYER_NAME(pid))
        return false
    end
    if (args[1] == -343495611) then
        util.toast("Blocked remote global change V2 from " .. PLAYER.GET_PLAYER_NAME(pid))
        return false
    end
    return true
end

while true do
    util.yield(10)
    memory.script_global(1669394 + 792, 1)
    memory.script_global(1669394 + 504, 1)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
util.on_stop(function()
	util.toast("Later pussy (Yawn)")
end)