

-- Rimuru❦ — Today at 6:46 PM
-- script events for 1.66
-- scriptEvents = {
    -- kick = {hash=1810531023},  
    -- kickv2 = {hash=-1681767521}, 
    -- crash = {hash= 1775863255}, 
    -- destroyPersonalVehicle = {hash=-2101545224}, 
    -- vehicleKick = {hash= -1603050746}, 
    -- jobInvite = {hash= -2138393348},  
    -- cayo = {hash= -369672308}, 
    -- eclipse = {hash=-702866045}, 
    -- loadingscreen = {hash=891653640}, 
    -- cutscene = {hash=2139870214},  
    -- sendMessage = {hash = 53975141}, 
    -- penthouse = {hash=150518680}, --??
    -- fakeInvite = {hash=-440720795}, 
    -- apartmentInivte = {hash=603406648}, --??
    -- message = {hash=2041805809},  
    -- cameraManipulation = {hash= -1428749433}, 
    -- peyote = {hash= 1839167950}, 
    -- bounty = {hash= 1459520933}, 
    -- fakeBan = {hash = -1387723751}, 
    
    -- PlayerStateEvents = { 
        -- vip = {hash= 2041805809}, 
        -- exitedVip = {hash= 374302127}, 
        -- typing = {hash= 1941550153}, 
        -- noLongerTyping = {hash= 3455447503}, 
        -- paused = {hash= 4059617132 }, 
        -- noLongerPaused = {hash= 2137631138} 
    -- }
-- }  

local glbls = {}
glbls.ver_text = "Gee-Skid v2.02"
local qk={}
qk.math_abs = math.abs
qk.get_i = script.get_global_i
qk.get_f = script.get_global_f
qk.trigger = script.trigger_script_event

glbls.typing_start = 1941550153
glbls.typing_stop = 3455447503
glbls.pause_start = 4059617132
glbls.pause_stop = 2137631138

-- glbls.typing_start = 1640286562
-- glbls.typing_stop = 3155712895
-- glbls.pause_start = 4241509123
-- glbls.pause_stop = 1835182208
function qk.to_int(_num)
	local first, second = tostring(_num):find('%.')
	if first then
		return tonumber(tostring(_num):sub(1, first-1))
	end
	return second
end

function glbls.team_rgb_int(_pid)
	--local associate_id = qk.get_i(1894573 + 1 + 10 + 2 + (_pid*599)) -- could be used to determine actual ceo/mc, but i cant figure out how to determine if its mc or ceo
	-- qk.get_i(1894573 + 1 + 10 + (_pid*599)) --returns the current tally of ceos or mcs that have been in session when that ceo/mc was made
	if qk.get_i(1894573 + 1 + 10 + (_pid*608)) > -1 then -- iirc the previous org color int shows up if not in org
		return qk.get_i(1894573 + 1 + 10 + 104 + (_pid*608)) --sometimes a player has a org color of -1 (white) even when in a org (briefly)
	end
	return -1
end

function glbls.give_otr(_pid)
	script.trigger_script_event_2(1 << _pid, 1141648445, player.player_id(), utils.time() - 60, utils.time(), 1, 1, script.get_global_i(1894573 + 1 + 510 + (_pid * 608)))
end

function glbls.is_mission_active(_pid)
	return (qk.get_i(1894573 + 1 + 10 + 103 + (_pid*608)) == 8)
end

function glbls.is_pid_otr(_pid)
	return (qk.get_i(2657589 + 1 + 210 + (_pid*466)) == 1) --
end

function glbls.get_pid_rank(_pid)
	return (qk.get_i(1853910  + (1 + (_pid * 862)) + 205 + 6) or 0)
end

function glbls.get_pid_kd(_pid)
	return (qk.get_f(1853910  + (1 + (_pid * 862)) + 205 + 26) or 0)
end

function glbls.get_pid_total_money(_pid)
	local val = qk.get_i(1853910  + (1 + (_pid * 862)) + 205 + 56)
	if val == nil then
		return 0
	end
	-- local function getUint32(val) -- need to test proddy code....doesnt seem to show anumber highher than 2,147,483,647
		return val & 0xffffffff
	-- end
	--return qk.math_abs(val) --gta reports a lot of money as a negative
end

function glbls.get_pid_veh(_pid)
	return qk.get_i(2672505  + 1 + 173 + (_pid * 1))
end

function glbls.kick_from_veh(_pid)
	qk.trigger(-1603050746, _pid, {0, 4294967295, 4294967295, 4294967295})
end

function glbls.send_to_cayo(_pid)
	qk.trigger(-369672308, _pid, {1, 1})
end

function glbls.give_bounty(_pid,_val)
	for i = 0, 31 do
		qk.trigger(1459520933, i, {69, _pid, 1, _val, 0, 1,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, qk.get_i(1923597 + 9), qk.get_i(1920255 + 10)})
	end
end

function glbls.drone_emp(trgt_pid,blame_pid)--aaaaaaaaaaaaa
	qk.trigger(267489225, trgt_pid, {blame_pid, qk.to_int(player.get_player_coords(trgt_pid).x), qk.to_int(player.get_player_coords(trgt_pid).y), qk.to_int(player.get_player_coords(trgt_pid).z), 0})
end

function glbls.remove_wanted(_pid)
	qk.trigger(-113023613, _pid, {_pid, 125033661}) --aaaaaaaaaaaaa
end

return glbls