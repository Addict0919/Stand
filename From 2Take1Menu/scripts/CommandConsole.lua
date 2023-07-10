if not menu.is_trusted_mode_enabled(4) then
	menu.notify("This Script requires Natives Trusted Mode to be executed", "Initialization Cancelled", 12, 211) 
	return
end

local KeysList
if utils.file_exists(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\scripts\\CommandConsole", "KeysList.lua")) then
	KeysList = require("CommandConsole/KeysList")
else
	menu.notify("Missing or broken script library: KeysList.lua", "Initialization Cancelled", 12, 211)
	return
end

local CommandList
if utils.file_exists(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\scripts\\CommandConsole", "CommandList.lua")) then
	CommandList = require("CommandConsole/CommandList")
else
	menu.notify("Missing or broken script library: CommandList.lua", "Initialization Cancelled", 12, 211)
	return
end

local CommandConsoleSprite
if utils.file_exists(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\scripts\\CommandConsole", "CommandConsole.png")) then
	CommandConsoleSprite = scriptdraw.register_sprite(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\scripts\\CommandConsole", "CommandConsole.png"))
else
	menu.notify("Missing or broken script library: CommandConsole.png", "Initialization Cancelled", 12, 211)
	return
end

if not KeysList or not CommandList then
	menu.notify("Missing or broken script library", "Initialization Cancelled", 12, 211)
	return
end

do
	if not utils.dir_exists(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "")) then
		utils.make_dir(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", ""))
	end
	if not utils.file_exists(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg")) then
		local file = io.open(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg"), "w")
		file:write("")
		file:close(io.open(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg"), "w"))
	end
end

local MainParent = menu.add_feature("Command Console", "parent", 0)

local feature = {}

local console_text = ""
local input_key = {}

-- Credits to Proddy for this function
local VK = {}
local function get_vk(vkkey)
	if vkkey then
		if not VK[vkkey] then
			local key = MenuKey()
			key:push_vk(vkkey)
			VK[vkkey] = key
		end
		return VK[vkkey]
	end
end

menu.add_feature("Open Command Console", "toggle", MainParent.id, function(f)
	if CommandConsoleSprite then
		local can_press_key = true
		while f.on do
			native.call(0x5F4B6931816E599B, 0) -- PAD::DISABLE_ALL_CONTROL_ACTIONS
			for i = 1, 6 do
				native.call(0x351220255D64C155, 0, i, true) -- PAD::ENABLE_CONTROL_ACTION
			end
			scriptdraw.draw_sprite(CommandConsoleSprite, v2(feature["X Position"].value / 100, feature["Y Position"].value / 100), feature["Box Size"].value, 0, ((255 & 0x0ff) << 0x00) | ((255 & 0x0ff) << 0x08) | ((255 & 0x0ff) << 0x10) | ((feature["Box Alpha"].value & 0x0ff) <<0x18))
			local input_string = ""
			if #input_key > 0 then
				for i = 1, #input_key do
					input_string = input_string .. input_key[i]
				end
			end
			scriptdraw.draw_text("> " .. tostring(input_string), v2(feature["X Position"].value / 100 - feature["Box Size"].value / 1.86, feature["Y Position"].value / 100 - feature["Box Size"].value / 2.5), v2(feature["Box Size"].value, feature["Box Size"].value), feature["Box Size"].value + 0.11, ((feature["Text R"].value & 0x0ff) << 0x00) | ((feature["Text G"].value & 0x0ff) << 0x08) | ((feature["Text B"].value & 0x0ff) << 0x10) | ((feature["Text A"].value & 0x0ff) <<0x18), 0, feature["Text Font"].value)
			scriptdraw.draw_text(console_text, v2(feature["X Position"].value / 100 - feature["Box Size"].value / 1.86, feature["Y Position"].value / 100 + feature["Box Size"].value / 2.4), v2(feature["Box Size"].value, feature["Box Size"].value), feature["Box Size"].value + 0.11, ((feature["Text R"].value & 0x0ff) << 0x00) | ((feature["Text G"].value & 0x0ff) << 0x08) | ((feature["Text B"].value & 0x0ff) << 0x10) | ((feature["Text A"].value & 0x0ff) <<0x18), 0, feature["Text Font"].value)
			if #input_key < 24 then
				if get_vk(0x10):is_down() and get_vk(0x37):is_down_stepped() then
					input_key[#input_key + 1] = "/"
				end
				if not get_vk(0x10):is_down() then
					for i = 1, #KeysList do
						if get_vk(KeysList[i].vk):is_down_stepped() then
							input_key[#input_key + 1] = KeysList[i].key
						end
					end
				end
			end
			if get_vk(0x8):is_down_stepped() then
				input_key[#input_key] = nil
			end
			if get_vk(0x0D):is_down_stepped() then
				local input_string = ""
				if #input_key > 0 then
					for i = 1, #input_key do
						input_string = input_string .. input_key[i]
					end
				end
				input_key = {}
				local is_valid = false
				if string.find(input_string, "/") then
					local parts = {}
					for match in (input_string .. "/"):gmatch("(.-)/") do
						parts[#parts + 1] = match
					end
					if parts[1] == "" then
						is_valid = true
					end
				end
				if is_valid then
					if not string.find(input_string, "/help") and not string.find(input_string, "/armin") then
						local found_index = false
						for i = 1, #CommandList do
							if string.find(input_string, CommandList[i].command) then
								if CommandList[i].feattype == 1 then
									if CommandList[i].feat then
										CommandList[i].feat:toggle()
										console_text = "Successfully executed Command: \"" .. input_string .. "\""
									end
								elseif CommandList[i].feattype == 2 then
									if not string.find(input_string, " on") and not string.find(input_string, " off") then
										console_text = "Invalid Syntax, use: \"" .. CommandList[i].command .. " <on/off>\""
									else
										if CommandList[i].feat then
											local turn_on = false
											if string.find(input_string, " on") then
												turn_on = true
											end
											CommandList[i].feat.on = turn_on
											console_text = "Successfully executed Command: \"" .. input_string .. "\""
										end
									end
								elseif CommandList[i].feattype == 3 then
									if string.find(input_string, " ") then
										local parts = {}
										for match in (input_string .. " "):gmatch("(.-) ") do
											parts[#parts + 1] = match
										end
										if math.type(tonumber(parts[#parts])) == "integer" or math.type(tonumber(parts[#parts])) == "float" or string.find(input_string, " on") or string.find(input_string, " off") then
											if CommandList[i].feat then
												local Type = 1
												local turn_on = false
												if string.find(input_string, " on") then
													turn_on = true
													Type = 2
												end
												if string.find(input_string, " off") then
													Type = 2
												end
												if Type == 1 then
													CommandList[i].feat.value = tonumber(parts[#parts])
												else
													CommandList[i].feat.on = turn_on
												end
												console_text = "Successfully executed Command: \"" .. input_string .. "\""
											end
										else
											if CommandList[i].feat then
												console_text = "Invalid Syntax, use: \"" .. CommandList[i].command .. " <" .. CommandList[i].feat.min .. "-" .. CommandList[i].feat.max .. "> or <on/off>\""
											end
										end
									else
										if CommandList[i].feat then
											console_text = "Invalid Syntax, use: \"" .. CommandList[i].command .. " <" .. CommandList[i].feat.min .. "-" .. CommandList[i].feat.max .. "> or <on/off>\""
										end
									end
								end
								found_index = true
							end
						end
					else
						found_index = true
					end
					if string.find(input_string, "/help") then
						local commandstring = ""
						local count = 0
						for i = 1, #CommandList do
							if i == #CommandList then
								commandstring = commandstring .. CommandList[i].command
							else
								commandstring = commandstring .. CommandList[i].command .. ", "
							end
							count = count + 1
							if count > 7 then
								commandstring = commandstring .. "\n"
								count = 0
							end
						end
						console_text = "Commands:\n" .. tostring(commandstring)
					elseif string.find(input_string, "/armin") then
						console_text = "<3"
					end
					if not found_index then
						console_text = "Invalid Command: \"" .. input_string .. "\"\nType /help for a list of commands"
					end
				else
					console_text = "Invalid Command: \"" .. input_string .. "\"\nType /help for a list of commands"
				end
			end
			system.yield(0)
		end
	end
	native.call(0xA5FFE9B05F199DE7, 0) -- PAD::ENABLE_ALL_CONTROL_ACTIONS
end)

feature["X Position"] = menu.add_feature("X Position", "autoaction_value_f", MainParent.id, function(f)
end)
feature["X Position"].max = 100.0
feature["X Position"].min = -100.0
feature["X Position"].mod = 0.5
feature["X Position"].value = 72.0

feature["Y Position"] = menu.add_feature("Y Position", "autoaction_value_f", MainParent.id, function(f)
end)
feature["Y Position"].max = 100.0
feature["Y Position"].min = -100.0
feature["Y Position"].mod = 0.5
feature["Y Position"].value = 71.0

feature["Box Size"] = menu.add_feature("Box Size", "autoaction_value_f", MainParent.id, function(f)
end)
feature["Box Size"].max = 1.00
feature["Box Size"].min = 0.10
feature["Box Size"].mod = 0.01
feature["Box Size"].value = 0.47

feature["Box Alpha"] = menu.add_feature("Box Alpha", "autoaction_value_i", MainParent.id, function(f)
end)
feature["Box Alpha"].max = 255
feature["Box Alpha"].min = 0
feature["Box Alpha"].mod = 5
feature["Box Alpha"].value = 255

feature["Text Font"] = menu.add_feature("Text Font", "autoaction_value_i", MainParent.id, function(f)
end)
feature["Text Font"].max = 8
feature["Text Font"].min = 0
feature["Text Font"].mod = 1
feature["Text Font"].value = 1

feature["Text R"] = menu.add_feature("Text R", "autoaction_value_i", MainParent.id, function(f)
end)
feature["Text R"].max = 255
feature["Text R"].min = 0
feature["Text R"].mod = 5
feature["Text R"].value = 255

feature["Text G"] = menu.add_feature("Text G", "autoaction_value_i", MainParent.id, function(f)
end)
feature["Text G"].max = 255
feature["Text G"].min = 0
feature["Text G"].mod = 5
feature["Text G"].value = 255

feature["Text B"] = menu.add_feature("Text B", "autoaction_value_i", MainParent.id, function(f)
end)
feature["Text B"].max = 255
feature["Text B"].min = 0
feature["Text B"].mod = 5
feature["Text B"].value = 255

feature["Text A"] = menu.add_feature("Text A", "autoaction_value_i", MainParent.id, function(f)
end)
feature["Text A"].max = 255
feature["Text A"].min = 0
feature["Text A"].mod = 5
feature["Text A"].value = 255

local MainProfileParent = menu.add_feature("Settings", "parent", MainParent.id)

menu.add_feature("Save Settings", "action", MainProfileParent.id, function(f)
	if utils.file_exists(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg")) then
		local file = io.open(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg"), "w")
		file:write("")
		file:close()
		local file = io.open(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg"), "a")
		local savestring = ""
		for k, v in pairs(feature) do
			savestring = savestring .. tostring(k) .. "|" .. tostring(feature[k].value) .. "\n"
		end
		file:write(savestring)
		file:close()
		menu.notify("Successfully saved settings!", "Command Console", 3, 0x00ff00)
	end
end)

menu.add_feature("Reset Settings", "action", MainProfileParent.id, function(f)
	if utils.file_exists(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg")) then
		local file = io.open(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg"), "w")
		file:write("")
		file:close()
		menu.notify("Successfully reset settings!", "Command Console", 3, 0x00ff00)
	end
end)

do
	if utils.file_exists(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg")) then
		local file = io.open(utils.get_appdata_path("PopstarDevs\\2Take1Menu\\luaconfig\\CommandConsole", "Default.cfg"), "r")
		for line in file:lines() do
			if string.find(line, "|") then
				local parts = {}
				for match in (line .. "|"):gmatch("(.-)|") do
					parts[#parts + 1] = match
				end
				if feature[parts[1]] then
					feature[parts[1]].value = tonumber(parts[2])
				end
			end
		end
		file:close()
	end
end