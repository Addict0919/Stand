local os_time = os.time
local HasAnimDictLoaded = HasAnimDictLoaded
local RequestAnimDict = RequestAnimDict
local util_yield = util.yield

return function(AnimDict, TimeOutTime)
	local CurrentTime = os_time()
    local TimeOutTime = CurrentTime + (TimeOutTime or 5)
    local AnimDictLoaded = HasAnimDictLoaded(AnimDict)
    while not AnimDictLoaded and TimeOutTime > CurrentTime do
        RequestAnimDict(AnimDict)
		util_yield()
        CurrentTime = os_time()
		AnimDictLoaded = HasAnimDictLoaded(AnimDict)
    end
    return AnimDictLoaded
end