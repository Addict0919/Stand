-- Made by GhostOne
-- Credits to Aren's original console, stole some ideas from it

local complete_feats = {
	["action"] = {"r"},
	["toggle"] = {
		"on",
		"off",
	}
}
local help_text = {
	["action"] = "r [optional command] - used when you wanna use another command and run the action at the same time 'name r value 10'",
	["toggle"] = "on - turns it on\noff - turns it off\nnothing - switches state",
	["value_num"] = "value [num] - sets the value of the feature to the number you chose"
}

local function clone_table(from, to)
	if not from or not to then return end
	for k, v in pairs(from) do
		if type(v) == "table" then
			to[k] = {}
			clone_table(v, to[k])
		end
		to[k] = v
	end
end

local function value_function(feat, value)
	if feat.type & 140 ~= 0 then
		value = tonumber(value)
		if not value then return end
		if feat.type >> 3 & 1 ~= 0 then
			value = value // 1
		end
		feat.value = value
	end
end

local blacklisted_parents = {
	["Weapon Management"] = true,
	["Weapon Loadout"] = true,
	["Weapon Attachments"] = true,
	["Player Info Window"] = true,
	["Info Overlay"] = true,
	["Notifications"] = true,
	["Menu UI"] = true,
	["Mods"] = true,
	["Extras"] = true,
	["Colors"] = true,
}
local function get_children_in_table(parent, Table, deepin)
	if blacklisted_parents[parent.name] then
		return
	end
	for k, v in pairs(parent.children) do
		if v.type >> 11 & 1 ~= 0 then
			get_children_in_table(v, Table, deepin + 1)
		else
			if Table[v.name:lower():gsub("%s", "_")] then
				Table[v.parent.name:lower():gsub("%s", "_"):sub(1, 3).."_"..v.name:lower():gsub("%s", "_")] = v
			else
				Table[v.name:lower():gsub("%s", "_")] = v
			end
		end
	end
	Table[#Table+1] = parent
end

local menu_get_feature_by_hierarchy_key = menu.get_feature_by_hierarchy_key
local feats_by_name = {}
local complete_by_name = {}
local commands = {}
for tab, names in pairs({
		["local"] = {
			"player_options",
			"vehicle_options",
			"weapons",
			"misc",
			"settings"
		},
		["online"] = {
			"lobby",
			"services",
		}
	}) do
	for _, name in pairs(names) do
		for _, feat in pairs(menu_get_feature_by_hierarchy_key(tab..'.'..name).children) do
			if feat.type >> 11 & 1 ~= 0 then
				get_children_in_table(feat, feats_by_name, 0)
			else
				if feats_by_name[feat.name:lower():gsub("%s", "_")] then
					feats_by_name[feat.parent.name:lower():gsub("%s", "_"):sub(1, 3).."_"..feat.name:lower():gsub("%s", "_")] = feat
				else
					feats_by_name[feat.name:lower():gsub("%s", "_")] = feat
				end
			end
		end
	end
end

local name_blacklist = {
	save = true,
}
for _, key in pairs({
	"spawn.vehicles.saved_vehicles",
	"spawn.editor.editor_mode",
	"spawn.vehicles.options.max_vehicles",
	"local.aim_assist.no_spread",
	"local.aim_assist.no_recoil",
	"local.aim_assist.triggerbot",
	"local.aim_assist.aimbot",
	"local.weather_and_time.pause_clock",
	"local.weather_and_time.clear_time_override",
	"local.teleport.waypoint",
	"local.outfits.saved_outfits",
	"local.settings.info_overlay.toggle_overlay",
	"local.settings.notifications.disable_all_notifications",
}) do
	local feat = menu_get_feature_by_hierarchy_key(key)
	if not name_blacklist[feat.name] then
		if feat.type >> 11 & 1 ~= 0 then
			get_children_in_table(feat, feats_by_name, 0)
		else
			if feats_by_name[feat.name:lower():gsub("%s", "_")] then
				feats_by_name[feat.parent.name:lower():gsub("%s", "_"):sub(1, 3).."_"..feat.name:lower():gsub("%s", "_")] = feat
			else
				feats_by_name[feat.name:lower():gsub("%s", "_")] = feat
			end
		end
	end
end

local runFunctions = {
	action = function(str)
		local featName = str:match("[^%s]+") or ""
		local feat = feats_by_name[featName]
		if feat then
			if string.find(str, "value") then
				local value = str:match("value%s+(.+)")
				value_function(feat, value)
				print("Set value of "..featName.." to "..value.." - Parent: "..feat.parent.name)
			end
			if string.find(str:match(".-%s+(.+)") or "", "r") or str:match("(.-)%s*$") == featName then
				feat:toggle()
				print("Activated - Parent: "..feat.parent.name)
			end
		end
	end,

	toggle = function(str)
		local featName = str:match("[^%s]+") or ""
		local feat = feats_by_name[featName]
		if feat then
			if string.find(str, "value") then
				local value = str:match("value%s+(.+)")
				value_function(feat, value)
				print("Set value of "..featName.." to "..value.." - Parent: "..feat.parent.name)
			end
			if str:match("(.-)%s*$") == featName then
				feat:toggle()
				print("Switched "..(feat.on and "on" or "off").." - Parent: "..feat.parent.name)
			elseif string.find(str, "on") then
				feat.on = true
				print("Turned on - Parent: "..feat.parent.name)
			elseif string.find(str, "off") then
				feat.on = false
				print("Turned off - Parent: "..feat.parent.name)
			end
		end
	end,

	complete = function(str)
		local complete = complete_by_name[str:match("[^%s]+") or ""]
		if complete then
			local matches = {}
			for k, v in ipairs(complete) do
				if string.find(v, str) then
					matches[#matches+1] = v
				end
			end
			return matches
		end
	end,
}

for featName, feat in pairs(feats_by_name) do
	local featType = feat.type & 1536 ~= 0 and "action" or feat.type & 1 ~= 0 and "toggle" or ""
	local complete = {}
	if featType ~= "" then
		complete_by_name[featName] = complete
		clone_table(complete_feats[featType], complete)
		local help_str = help_text[featType]
		if feat.type & 140 ~= 0 then
			help_str = help_str.."\n"..help_text["value_num"].." Min: "..(feat.min or "unknown").." Max: "..(feat.max or "unknown")
			complete[#complete+1] = "value"
		end
		for k,v in ipairs(complete) do
			complete[k] = featName..' '..v
		end
		console.register_command(featName, help_str, runFunctions[featType], runFunctions["complete"])
		commands[#commands+1] = featName
	end
end

event.add_event_listener("exit", function()
	for k, v in pairs(commands) do
		console.remove_command(v)
	end
end)
