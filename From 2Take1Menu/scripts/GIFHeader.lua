local ScriptName = "GIF Header"
local Version = "1.3"

if GIFHeader then
	menu.notify("Script already loaded", ScriptName, 10, 0xFF0000FF)
	return
end

local Paths = {}
Paths.Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
Paths.Cfg = Paths.Root .. "\\cfg"
Paths.LogFile = Paths.Root .. "\\" .. ScriptName .. ".log"
Paths.Scripts = Paths.Root .. "\\scripts"
Paths.GIFHeader = Paths.Scripts .. "\\GIFHeader"

if not utils.dir_exists(Paths.GIFHeader) then
	menu.notify('"GIFHeader" folder not present in scripts.', ScriptName, 10, 0xFF0000FF)
	return
end

local headerDirs = utils.get_all_sub_directories_in_directory(Paths.GIFHeader)
local headerIndexes = {}

if #headerDirs == 0 then
	menu.notify('No headers found in "GIFHeader" folder.', ScriptName, 10, 0xFF0000FF)
	return
end

table.sort(headerDirs)
for i=1,#headerDirs do
	headerIndexes[headerDirs[i]] = i
end

GIFHeader = true

local Settings = {}
Settings.EnableHeader = false
Settings.DrawAboveHeader = true
Settings.CustomAlpha = false
Settings.AlphaValue = 160
Settings.YOffset = 1

local function SaveSettings(SettingsFile, SettingsTbl)
	assert(SettingsFile, "Nil passed for SettingsFile to SaveSettings")
	assert(type(SettingsTbl) == "table", "Not a table passed for SettingsTbl to SaveSettings")
	local file <close> = io.open(Paths.Cfg .. "\\" .. SettingsFile .. ".cfg", "w")
	local keys = {}
	for k in pairs(SettingsTbl) do
		keys[#keys + 1] = k
	end
	table.sort(keys)
	for i=1,#keys do
		file:write(tostring(keys[i]) .. "=" .. tostring(SettingsTbl[keys[i]]) .. "\n")
	end
	file:close()
end

local function LoadSettings(SettingsFile, SettingsTbl)
	assert(SettingsFile, "Nil passed for SettingsFile to LoadSettings")
	assert(type(SettingsTbl) == "table", "Not a table passed for SettingsTbl to LoadSettings")
	SettingsFile = Paths.Cfg .. "\\" .. SettingsFile .. ".cfg"
	if not utils.file_exists(SettingsFile) then
		return false
	end
	for line in io.lines(SettingsFile) do
		local separator = line:find("=", 1, true)
		if separator then
			local key = line:sub(1, separator - 1)
			local value = line:sub(separator + 1)
			local num = tonumber(value)
			if num then
				value = num
			elseif value == "true" then
				value = true
			elseif value == "false" then
				value = false
			end
			num = tonumber(key)
			if num then
				key = num
			end
			SettingsTbl[key] = value
		end
	end
	return true
end

LoadSettings(ScriptName, Settings)

local function UnregisterSprits(frames)
	if type(frames) ~= "table" then
		return
	end
	
	for i=1,#frames do
		local id = frames[i][3]
		if type(id) == "number" then
			print("Unregistering sprite ID: " ..id)
			system.wait(0)
		end
	end
end

local MenuXFeat = menu.get_feature_by_hierarchy_key("local.settings.menu_x")
local MenuYFeat = menu.get_feature_by_hierarchy_key("local.settings.menu_y")
local MenuElementWidthFeat = menu.get_feature_by_hierarchy_key("local.settings.menu_ui.menu_layout.element_width")
local MenuHeaderAlphaFeat = menu.get_feature_by_hierarchy_key("local.settings.menu_ui.menu_colors.header_alpha")

local is_open = menu.is_open

local ParentId = menu.add_feature(ScriptName, "parent").id

local table_unpack = table.unpack
local scriptdraw_register_sprite = scriptdraw.register_sprite
local scriptdraw_get_sprite_size = scriptdraw.get_sprite_size
local scriptdraw_pos_pixel_to_rel_x = scriptdraw.pos_pixel_to_rel_x
local scriptdraw_pos_pixel_to_rel_y = scriptdraw.pos_pixel_to_rel_y
local scriptdraw_draw_sprite = scriptdraw.draw_sprite
local utils_time_ms = utils.time_ms
local enabledFeat = menu.add_feature("Enabled", "value_str", ParentId, function(f)
	local lastHeader
	local frames
	local index
	local nextFrame
	while f.on do
		if lastHeader == nil or lastHeader ~= f.value then
			Settings.HeaderDir = nil
			UnregisterSprits(frames)
			
			lastHeader = f.value
			frames = {}
			index = 1
			nextFrame = nil
			
			local rootDirName = headerDirs[f.value + 1]
			print("Loading frames from: " .. rootDirName)
			
			local rootDir = Paths.GIFHeader .. "\\" .. rootDirName
			if not utils.dir_exists(rootDir) then
				menu.notify("Could not find header folder: " .. rootDirName, ScriptName, 10, 0xFF0000FF)
				f.on = false
				return
			end
			
			local files = utils.get_all_files_in_directory(rootDir, "gif")
			for i=1,#files do
				local file = files[i]
				local frame, delay = file:match("^(%d+)%_(%d+).gif$")
				frame, delay = tonumber(frame), tonumber(delay)
				if not frame or not delay then
					menu.notify("Invalid frame found: " .. file, ScriptName, 10, 0xFF0000FF)
					f.on = false
					return
				else
					frames[frame] = {delay, rootDir .. "\\" .. file}
				end
			end
			
			if #frames == 0 then
				files = utils.get_all_files_in_directory(rootDir, "png")
				for i=1,#files do
					local file = files[i]
					local frame, delay = file:match("^(%d+)%_(%d+).png$")
					frame, delay = tonumber(frame), tonumber(delay)
					if not frame or not delay then
						menu.notify("Invalid frame found: " .. file, ScriptName, 10, 0xFF0000FF)
						f.on = false
						return
					else
						frames[frame] = {delay, rootDir .. "\\" .. file}
					end
				end
				
				if #frames == 0 then
					menu.notify("No frames found in: " .. rootDirName, ScriptName, 10, 0xFF0000FF)
					f.on = false
					return
				end
			end
			
			print("Found " .. #frames .. " frames. Displaying...")
			Settings.HeaderDir = rootDirName
		elseif is_open() then
			local delay, path, id = table_unpack(frames[index])
			if id == nil then
				id = scriptdraw_register_sprite(path)
				frames[index][3] = id
			end
			
			local spriteSize = scriptdraw_get_sprite_size(id)
			local scale = MenuElementWidthFeat.value / spriteSize.x
			spriteSize = spriteSize * scale
			
			local menuX = MenuXFeat.value
			local menuY = MenuYFeat.value
			
			local topLeftX = (menuX + spriteSize.x / 2)
			local rootY = menuY + Settings.YOffset
			local topLeftY = Settings.DrawAboveHeader and (rootY - spriteSize.y / 2) or (rootY + spriteSize.y / 2)
			
			local x = scriptdraw_pos_pixel_to_rel_x(topLeftX)
			local y = scriptdraw_pos_pixel_to_rel_y(topLeftY)
			
			local alpha = Settings.CustomAlpha and Settings.AlphaValue or MenuHeaderAlphaFeat.value
			scriptdraw_draw_sprite(id, v2(x, y), scale, 0, alpha << 0x18 | 0xFFFFFF)
			
			if nextFrame then
				if utils_time_ms() >= nextFrame then
					index = index + 1
					if index > #frames then
						index = 1
					end
					nextFrame = nil
				end
			else
				nextFrame = utils_time_ms() + delay
			end
		end
		system.wait(0)
	end
	
	UnregisterSprits(frames)
end)
enabledFeat:set_str_data(headerDirs)
if Settings.HeaderDir and headerIndexes[Settings.HeaderDir] then
	enabledFeat.value = headerIndexes[Settings.HeaderDir] - 1
end
if Settings.EnableHeader then
	enabledFeat.on = true
end

local drawAboveHeaderFeat = menu.add_feature("Draw Above Header", "toggle", ParentId, function(f)
	Settings.DrawAboveHeader = f.on
end)
if Settings.DrawAboveHeader then
	drawAboveHeaderFeat.on = true
end

local customAlphaFeat = menu.add_feature("Custom Header Alpha", "value_i", ParentId, function(f)
	Settings.CustomAlpha = f.on
	Settings.AlphaValue = f.value
end)
customAlphaFeat.min = 1
customAlphaFeat.max = 255
customAlphaFeat.mod = 1
if type(Settings.AlphaValue) == "number" then
	if Settings.AlphaValue > customAlphaFeat.max then
		customAlphaFeat.vaelu = customAlphaFeat.max
	elseif Settings.AlphaValue < customAlphaFeat.min then
		customAlphaFeat.value = customAlphaFeat.min
	else
		customAlphaFeat.value = Settings.AlphaValue
	end
else
	customAlphaFeat.value = 160
end
if Settings.CustomAlpha then
	customAlphaFeat.on = true
end

local yOffsetFeat = menu.add_feature("Y Offset", "autoaction_value_i", ParentId, function(f)
	if f.value == Settings.YOffset then
		local r, s
		repeat
			r, s = input.get("Enter Y Offset", f.value, 4, eInputType.IT_NUM)
			if r == 2 then return end
			system.wait(0)
		until r == 0
		
		s = tonumber(s)
		if s > f.max then
			s = f.max
		elseif s < f.min then
			s = f.min
		end
		f.value = s
	end
	Settings.YOffset = f.value
end)
yOffsetFeat.min = -500
yOffsetFeat.max = 500
yOffsetFeat.mod = 1
if type(Settings.YOffset) == "number" then
	if Settings.YOffset > yOffsetFeat.max then
		yOffsetFeat.vaelu = yOffsetFeat.max
	elseif Settings.YOffset < yOffsetFeat.min then
		yOffsetFeat.value = yOffsetFeat.min
	else
		yOffsetFeat.value = Settings.YOffset
	end
else
	yOffsetFeat.value = 1
end

menu.add_feature("Save Settings", "action", ParentId, function(f)
	Settings.EnableHeader = enabledFeat.on
	Settings.CustomAlpha = customAlphaFeat.on
	Settings.AlphaValue = customAlphaFeat.value
	SaveSettings(ScriptName, Settings)
	menu.notify("Settings saved successfully.", ScriptName, 10, 0xFF00FF00)
end)