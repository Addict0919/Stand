
local glbls = {}
glbls.ver_text = "Gee-Map 2.0"

function glbls.team_rgb_int(_pid)
	--local associate_id = script.get_global_i(1892703 + 1 + 10 + 2 + (_pid*599)) -- could be used to determine actual ceo/mc, but i cant figure out how to determine if its mc or ceo
	-- script.get_global_i(1892703 + 1 + 10 + (_pid*599)) --returns the current tally of ceos or mcs that have been in session when that ceo/mc was made
	if script.get_global_i(1892703 + 1 + 10 + (_pid*599)) > -1 then
		return script.get_global_i(1892703 + 1 + 10 + 104 + (_pid*599)) --sometimes a player has a org color of -1 (white) even when in a org (briefly)
	end
	return -1
end

function glbls.is_pid_otr(_pid)
	return (script.get_global_i(2689235 + 1 + 208 + (_pid*453)) == 1)
end

function glbls.is_mission_active(_pid)
	return (script.get_global_i(1892703 + 1 + 10 + 103 + (_pid*599)) == 8)
end

return glbls