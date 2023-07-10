local os_time = os.time
local IsModelValid = IsModelValid
local HasModelLoaded = HasModelLoaded
local RequestModel = RequestModel
local util_yield = util.yield
local util_create_thread = util.create_thread
local SetModelAsNoLongerNeeded = SetModelAsNoLongerNeeded

return function(EntityHash, TimeOutTime)
    local _TimeOutTime = (TimeOutTime or 5)
	local CurrentTime = os_time()
    local TimeOutTime = CurrentTime + _TimeOutTime
    local ModelExists = IsModelValid(EntityHash)
    local ModelLoaded = HasModelLoaded(EntityHash)
    while ModelExists and not ModelLoaded and TimeOutTime > CurrentTime do
        RequestModel(EntityHash)
		util_yield()
        CurrentTime = os_time()
		ModelLoaded = HasModelLoaded(EntityHash)
    end
	if ModelExists then
		util_create_thread(function()
			util_yield(_TimeOutTime--[[*1000]])
			SetModelAsNoLongerNeeded(EntityHash)
		end)
	end
    return ModelLoaded and ModelExists
end