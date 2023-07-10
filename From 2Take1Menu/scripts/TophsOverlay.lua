--[[
v1.2.0:
Added: 
- Current vehicle gear (transmission) 
- Loaded Entities (peds/vehicle/objects/pickups)
- Players invulnerable count.
- Players in interior count.
- Additional player counts are now "indented" when primary player count option is also enabled.  

Moved: 
- FPS display to top of displayed list
- Coords display to bottom of displayed list
- Moved all the additional "Player Counts" into thier own submenu.
--]]
local OLFeatures = {}
local OLSettings = {}
local Paths = {}
Paths.Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
Paths.Cfg = Paths.Root .. "\\cfg"

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
		local key, value = line:match("^(.-)=(.-)$")
		if key and value then
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

local function RGBAToInt(R, G, B, A)
	A = A or 255
	return ((R&0x0ff)<<0x00)|((G&0x0ff)<<0x08)|((B&0x0ff)<<0x10)|((A&0x0ff)<<0x18)
end

local function SessionType()
	if menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
		if network.is_session_started() then
        	if native.call(0xF3929C2379B60CCE):__tointeger() == 1 then 
            	return "Solo"
        	elseif native.call(0xCEF70AA5B3F89BA1):__tointeger() == 1 then
            	return "Invite Only"
        	elseif native.call(0xFBCFA2EA2E206890):__tointeger() == 1 then
            	return "Friends Only"
        	elseif native.call(0x74732C6CA90DA2B4):__tointeger() == 1 then 
            	return "Crew Only"
        	end
    		return "Public"
    	end
    	return "Singleplayer"
	else 
		return "Natives Trusted Mode Not Enabled."
	end
end

local function SessionHidden()
	if menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_NATIVES) then
    	if native.call(0xBA416D68C631496A):__tointeger() == 0 then
        	return "True"
    	end
    	return "False"
	else
		return "Natives Trusted Mode Not Enabled."
	end
end

OLSettings.OverlayEnabled = false
--Feature Defaults
OLSettings.FPS = false
OLSettings.SessionType = false
OLSettings.SessionHost = false
OLSettings.ScriptHost = false
OLSettings.SessionHidden = false
OLSettings.PlayerCount = false
OLSettings.AliveDead = false
OLSettings.ModderCount = false
OLSettings.FriendCount = false
OLSettings.SpectatorCount = false
OLSettings.GodCount = false
OLSettings.InIntCount = false
OLSettings.Health = false
OLSettings.Armor = false
OLSettings.Wanted = false
OLSettings.Speed = false
OLSettings.VehicleGears = false
OLSettings.VehicleInfo = false
OLSettings.IGTime = false
OLSettings.IRLTime = false
OLSettings.IRLDate = false
OLSettings.EntityInfo = false
OLSettings.Coords = false

--Settings Default
OLSettings.Red = 255
OLSettings.Green = 255
OLSettings.Blue = 255
OLSettings.Alpha = 255
OLSettings.XPos = 0
OLSettings.YPos = 0
OLSettings.TextAlign = 0
OLSettings.Scale = 0.80
OLSettings.Shadow = false
OLSettings.Font = 0
OLSettings.SpeedoType = 1

LoadSettings("OverlaySettings", OLSettings)

local main = menu.add_feature("Info Overlay", "parent", 0)
OLFeatures.OverlayEnabled = menu.add_feature("Enable Overlay", "toggle", main.id, function(f)
	while f.on do
		local AlivePlayers = 0
		local DeadPlayers = 0
		local ModderCount = 0
		local SpectatorCount = 0
		local FriendCount = 0
		local GodCount = 0
		local InIntCount = 0 

		local pid = player.player_id()
		local pped = player.player_ped(pid)

		for i = 0, 31 do
			if player.is_player_valid(i) then
				if player.get_player_health(i) > 0 then
					AlivePlayers = AlivePlayers + 1
				else
					DeadPlayers = DeadPlayers + 1
				end
				
				if player.is_player_modder(i, -1) then
					ModderCount = ModderCount + 1
				end
				
				if player.is_player_spectating(i) then
					SpectatorCount = SpectatorCount + 1
				end
				
				if player.is_player_friend(i) then
					FriendCount = FriendCount + 1
				end

				if player.is_player_god(i) then
					GodCount = GodCount + 1
				end

				if interior.get_interior_from_entity(player.get_player_ped(i)) ~= 0 then
					InIntCount = InIntCount + 1
				end
			end
		end
		
		local CurrentSpeed, VehModelLabel, VehBrand, VehModel, VehCGear, VehMGear
		if ped.is_ped_in_any_vehicle(pped) then
			local veh = ped.get_vehicle_ped_is_using(pped)
			CurrentSpeed = entity.get_entity_speed(veh)
			VehModelLabel = vehicle.get_vehicle_model_label(veh)
			VehBrand = vehicle.get_vehicle_brand(veh) or ""
			VehModel = vehicle.get_vehicle_model(veh)
			VehCGear = vehicle.get_vehicle_current_gear(veh)
			VehMGear = vehicle.get_vehicle_max_gear(veh)
		else
			CurrentSpeed = entity.get_entity_speed(pped)
			VehModelLabel = "N/A"
			VehBrand = "No Vehicle"
			VehModel = ""
			VehCGear = "-"
			VehMGear = "-"
		end

		local playercoords = player.get_player_coords(pid)
		local fps = math.ceil(1 / gameplay.get_frame_time())
		local CurrentHealth = player.get_player_health(pid)
		local MaxHealth = player.get_player_max_health(pid)
		local CurrentArmor = player.get_player_armour(pid)
		local WantedLevel = player.get_player_wanted_level(pid)
		
		local host = player.get_host()
		local SessionHost = host >= 0 and player.get_player_name(host) or "N/A"
		local SessionType = SessionType()

		local PedCount = 0
		local VehCount = 0
		local ObjCount = 0
		local PupCount = 0

		local allpeds = ped.get_all_peds()
		local allvehs = vehicle.get_all_vehicles()
		local allobjs = object.get_all_objects()
		local allpups = object.get_all_pickups()
		for i = 0, #allpeds do
			PedCount = PedCount + 1
		end
		for i = 0, #allvehs do
			VehCount = VehCount + 1
		end
		for i = 0, #allobjs do
			ObjCount = ObjCount + 1
		end
		for i = 0, #allpups do
			PupCount = PupCount + 1
		end

		if OLFeatures.SpeedometerType.value == 1 then --KPH
			CurrentSpeed = CurrentSpeed * 3.6
		elseif OLFeatures.SpeedometerType.value == 2 then --MPH
			CurrentSpeed = CurrentSpeed * 2.236936
		end

		local flags = 0
		if OLFeatures.Shadow.on then
			flags = flags | 1 << 1
		end
		if OLFeatures.TextAlign.value == 1 or OLFeatures.TextAlign.value == 3 then
			flags = flags | 1 << 4
		end
		if OLFeatures.TextAlign.value == 2 or OLFeatures.TextAlign.value == 3 then
			flags = flags | 1 << 3
		end

		local font = OLFeatures.Font.value
		local pos = v2(scriptdraw.pos_pixel_to_rel_x(OLFeatures.Xpos.value), scriptdraw.pos_pixel_to_rel_y(OLFeatures.Ypos.value))
		local color = RGBAToInt(OLFeatures.Red.value, OLFeatures.Green.value, OLFeatures.Blue.value, OLFeatures.Alpha.value)
		
		local info = {}

		if OLFeatures.FPS.on then 
			info[#info + 1] = "FPS: " .. fps
		end
		if OLFeatures.SessionType.on then
			info[#info + 1] = "Session Type: " .. SessionType
		end
		if OLFeatures.SessionHost.on then
			info[#info + 1] = "Session Host: " .. SessionHost
		end
		if OLFeatures.ScriptHost.on then
			info[#info + 1] = "Script Host: " .. player.get_player_name(script.get_host_of_this_script())
		end
		if OLFeatures.SessionHidden.on then
			info[#info + 1] = "Session Hidden: " .. SessionHidden()
		end
		if OLFeatures.PlayerCount.on then
			info[#info + 1] = "Player Count: " .. player.player_count()
		end
		if OLFeatures.AliveDead.on then
			if OLFeatures.PlayerCount.on then
				info[#info + 1] = "\tAlive: " .. AlivePlayers .. " | Dead: " .. DeadPlayers
			else
				info[#info + 1] = "Alive: " .. AlivePlayers .. " | Dead: " .. DeadPlayers
			end
		end
		if OLFeatures.ModderCount.on then
			if OLFeatures.PlayerCount.on then
				info[#info + 1] = "\tModders: " .. ModderCount
			else
				info[#info + 1] = "Modders: " .. ModderCount
			end
		end
		if OLFeatures.FriendCount.on then
			if OLFeatures.PlayerCount.on then
				info[#info + 1] = "\tFriends: " .. FriendCount
			else
				info[#info + 1] = "Friends: " .. FriendCount
			end
		end
		if OLFeatures.SpectatorCount.on then
			if OLFeatures.PlayerCount.on then
				info[#info + 1] = "\tSpectators: " .. SpectatorCount
			else
				info[#info + 1] = "Spectators: " .. SpectatorCount
			end
		end
		if OLFeatures.GodCount.on then 
			if OLFeatures.PlayerCount.on then
				info[#info + 1] = "\tInvulnerable: " .. GodCount
			else
				info[#info + 1] = "Invulnerable: " .. GodCount
			end
		end
		if OLFeatures.InIntCount.on then
			if OLFeatures.PlayerCount.on then
				info[#info + 1] = "\tIn Interior: " .. InIntCount
			else
				info[#info + 1] = "In Interior: " .. InIntCount
			end
		end
		if OLFeatures.Health.on then
			info[#info + 1] = string.format("Health: %.0f", CurrentHealth) ..  string.format(" / %.0f", MaxHealth)
		end
		if OLFeatures.Armor.on then 
			info[#info + 1] = string.format("Armor: %.0f", CurrentArmor) .. " / 50"
		end
		if OLFeatures.Wanted.on then
			info[#info + 1] = "Wanted Level: " .. WantedLevel
		end
		if OLFeatures.Speed.on then
			info[#info + 1] = "Current Speed (" .. OLFeatures.SpeedometerType.str_data[OLFeatures.SpeedometerType.value+1] .. "): " .. math.floor(CurrentSpeed + 0.5)
		end
		if OLFeatures.VehicleGears.on then
			info[#info + 1] = "Current Gear: " .. VehCGear .. "/" .. VehMGear
		end
		if OLFeatures.VehicleInfo.on then
			info[#info + 1] = "Current Vehicle: " .. VehBrand .. " " .. VehModel .. " " .. "[" .. VehModelLabel .. "]"
		end
		if OLFeatures.IGTime.on then
			info[#info + 1] = "In-game Time: " .. time.get_clock_hours() .. ":" .. time.get_clock_minutes() .. ":" .. time.get_clock_seconds()
		end
		if OLFeatures.IRLTime.on then
			info[#info + 1] = "IRL Time: " .. os.date("%I:%M:%S %p")
		end
		if OLFeatures.IRLDate.on then
			info[#info + 1] = "IRL Date: " .. os.date("%x")
		end
		if OLFeatures.EntityInfo.on then
			info[#info + 1] = "Loaded Entities:\n\tPeds: " .. PedCount .. "\n\tVehicles: " .. VehCount .. "\n\tObjects: " .. ObjCount .. "\n\tPickups: " .. PupCount
		end

		if OLFeatures.Coords.on then
			info[#info + 1] = string.format("Current Coordinates:\n\tX: %.3f\n\tY: %.3f\n\tZ: %.3f", playercoords.x, playercoords.y, playercoords.z)
		end


		--draw_text(string text, v2 pos, v2 size, float scale, uint32_t color, uint32_t flags, int|nil font)
		scriptdraw.draw_text(table.concat(info, "\n"), pos, v2(1, 1), OLFeatures.Scale.value, color, flags, font)
		system.wait()
	end
end)
OLFeatures.OverlayEnabled.on = OLSettings.OverlayEnabled

local DisplayOptions = menu.add_feature("Displayable Options", "parent", main.id)
OLFeatures.FPS = menu.add_feature("Calculated FPS", "toggle", DisplayOptions.id)
OLFeatures.FPS.on = OLSettings.FPS

OLFeatures.SessionType = menu.add_feature("Session Type", "toggle", DisplayOptions.id)
OLFeatures.SessionType.on = OLSettings.SessionType

OLFeatures.SessionHost = menu.add_feature("Session Host", "toggle", DisplayOptions.id)
OLFeatures.SessionHost.on = OLSettings.SessionHost

OLFeatures.ScriptHost = menu.add_feature("Script Host", "toggle", DisplayOptions.id)
OLFeatures.ScriptHost.on = OLSettings.ScriptHost

OLFeatures.SessionHidden = menu.add_feature("Is Session Hidden", "toggle", DisplayOptions.id)
OLFeatures.SessionHidden.on = OLSettings.SessionHidden

OLFeatures.PlayerCount = menu.add_feature("Player Count", "toggle", DisplayOptions.id)
OLFeatures.PlayerCount.on = OLSettings.PlayerCount

local MoreCounts = menu.add_feature("Additional Player Counts", "parent", DisplayOptions.id)

OLFeatures.AliveDead = menu.add_feature("Alive / Dead Player Count", "toggle", MoreCounts.id)
OLFeatures.AliveDead.on = OLSettings.AliveDead

OLFeatures.ModderCount = menu.add_feature("Modder Count", "toggle", MoreCounts.id)
OLFeatures.ModderCount.on = OLSettings.ModderCount

OLFeatures.FriendCount = menu.add_feature("Friend Count", "toggle", MoreCounts.id)
OLFeatures.FriendCount.on = OLSettings.FriendCount

OLFeatures.SpectatorCount = menu.add_feature("Spectator Count", "toggle", MoreCounts.id)
OLFeatures.SpectatorCount.on = OLSettings.SpectatorCount

OLFeatures.GodCount = menu.add_feature("God Mode / Invulnerable Count", "toggle", MoreCounts.id)
OLFeatures.GodCount.on = OLSettings.GodCount

OLFeatures.InIntCount = menu.add_feature("In an Interior Count", "toggle", MoreCounts.id)
OLFeatures.InIntCount.on = OLSettings.InIntCount

OLFeatures.Health = menu.add_feature("Current Health", "toggle", DisplayOptions.id)
OLFeatures.Health.on = OLSettings.Health

OLFeatures.Armor = menu.add_feature("Current Armor", "toggle", DisplayOptions.id)
OLFeatures.Armor.on = OLSettings.Armor

OLFeatures.Wanted = menu.add_feature("Wanted Level", "toggle", DisplayOptions.id)
OLFeatures.Wanted.on = OLSettings.Wanted

OLFeatures.Speed = menu.add_feature("Speedometer", "toggle", DisplayOptions.id)
OLFeatures.Speed.on = OLSettings.Speed

OLFeatures.VehicleGears = menu.add_feature("Vehicle Gear", "toggle", DisplayOptions.id)
OLFeatures.VehicleGears.on = OLSettings.VehicleGears

OLFeatures.VehicleInfo = menu.add_feature("Vehicle Info", "toggle", DisplayOptions.id)
OLFeatures.VehicleInfo.on = OLSettings.VehicleInfo

OLFeatures.IGTime = menu.add_feature("In-game Time", "toggle", DisplayOptions.id)
OLFeatures.IGTime.on = OLSettings.IGTime

OLFeatures.IRLTime = menu.add_feature("IRL Time", "toggle", DisplayOptions.id)
OLFeatures.IRLTime.on = OLSettings.IRLTime

OLFeatures.IRLDate = menu.add_feature("IRL Date", "toggle", DisplayOptions.id)
OLFeatures.IRLDate.on = OLSettings.IRLDate

OLFeatures.EntityInfo = menu.add_feature("Nearby Entity Counts", "toggle", DisplayOptions.id)
OLFeatures.EntityInfo.on = OLSettings.EntityInfo

OLFeatures.Coords = menu.add_feature("Current Coordinates", "toggle", DisplayOptions.id)
OLFeatures.Coords.on = OLSettings.Coords

local SDSettings = menu.add_feature("Settings", "parent", main.id)
OLFeatures.Red = menu.add_feature("Red", "autoaction_value_i", SDSettings.id)
OLFeatures.Red.min = 0
OLFeatures.Red.max = 255
OLFeatures.Red.mod = 1
OLFeatures.Red.value = OLSettings.Red

OLFeatures.Green = menu.add_feature("Green", "action_value_i", SDSettings.id)
OLFeatures.Green.min = 0
OLFeatures.Green.max = 255
OLFeatures.Green.mod = 1
OLFeatures.Green.value = OLSettings.Green

OLFeatures.Blue = menu.add_feature("Blue", "action_value_i", SDSettings.id)
OLFeatures.Blue.min = 0
OLFeatures.Blue.max = 255
OLFeatures.Blue.mod = 1
OLFeatures.Blue.value = OLSettings.Blue

OLFeatures.Alpha = menu.add_feature("Alpha", "action_value_i", SDSettings.id)
OLFeatures.Alpha.min = 0
OLFeatures.Alpha.max = 255
OLFeatures.Alpha.mod = 10
OLFeatures.Alpha.value = OLSettings.Alpha

OLFeatures.Xpos = menu.add_feature("X Position", "action_value_i", SDSettings.id)
OLFeatures.Xpos.min = 0
OLFeatures.Xpos.max = graphics.get_screen_width()
OLFeatures.Xpos.mod = 5
OLFeatures.Xpos.value = OLSettings.XPos

OLFeatures.Ypos = menu.add_feature("Y Position", "action_value_i", SDSettings.id)
OLFeatures.Ypos.min = 0
OLFeatures.Ypos.max = graphics.get_screen_height()
OLFeatures.Ypos.mod = 5
OLFeatures.Ypos.value = OLSettings.YPos

OLFeatures.TextAlign = menu.add_feature("Text Align", "action_value_str", SDSettings.id)
OLFeatures.TextAlign:set_str_data({"Top Left", "Top Right", "Bottom Left", "Bottom Right"})
OLFeatures.TextAlign.value = OLSettings.TextAlign

OLFeatures.Scale = menu.add_feature("Scale", "action_value_f", SDSettings.id)
OLFeatures.Scale.min = 0.1
OLFeatures.Scale.max = 5
OLFeatures.Scale.mod = 0.1
OLFeatures.Scale.value = OLSettings.Scale

OLFeatures.Shadow = menu.add_feature("Text Shadow", "toggle", SDSettings.id)
OLFeatures.Shadow.on = OLSettings.Shadow

OLFeatures.Font = menu.add_feature("Match Font To: ", "action_value_str", SDSettings.id)
OLFeatures.Font:set_str_data({"Menu Head", "Menu Tab", "Menu Entry", "Menu Foot", "Script 1", "Script 2", "Script 3", "Script 4", "Script 5"})
OLFeatures.Font.value = OLSettings.Font

OLFeatures.SpeedometerType = menu.add_feature("Speedometer Measurement", "action_value_str", SDSettings.id)
OLFeatures.SpeedometerType.set_str_data(OLFeatures.SpeedometerType, ({"MPS", "KPH", "MPH"}))
OLFeatures.SpeedometerType.value = OLSettings.SpeedoType

menu.add_feature("Save Settings", "action", SDSettings.id, function(f)
	OLSettings.OverlayEnabled = OLFeatures.OverlayEnabled.on

	OLSettings.FPS = OLFeatures.FPS.on 
	OLSettings.SessionType = OLFeatures.SessionType.on
	OLSettings.SessionHost = OLFeatures.SessionHost.on
	OLSettings.ScriptHost = OLFeatures.ScriptHost.on 
	OLSettings.SessionHidden = OLFeatures.SessionHidden.on
	OLSettings.PlayerCount = OLFeatures.PlayerCount.on 
	OLSettings.AliveDead = OLFeatures.AliveDead.on
	OLSettings.ModderCount = OLFeatures.ModderCount.on 
	OLSettings.FriendCount = OLFeatures.FriendCount.on 
	OLSettings.SpectatorCount = OLFeatures.SpectatorCount.on 
	OLSettings.GodCount = OLFeatures.GodCount.on
	OLSettings.InIntCount = OLFeatures.InIntCount.on
	OLSettings.Health = OLFeatures.Health.on 
	OLSettings.Armor = OLFeatures.Armor.on 
	OLSettings.Wanted = OLFeatures.Wanted.on 
	OLSettings.Speed = OLFeatures.Speed.on
	OLSettings.VehicleGears = OLFeatures.VehicleGears.on
	OLSettings.VehicleInfo = OLFeatures.VehicleInfo.on 
	OLSettings.IGTime = OLFeatures.IGTime.on 
	OLSettings.IRLTime = OLFeatures.IRLTime.on 
	OLSettings.IRLDate = OLFeatures.IRLDate.on
	OLSettings.EntityInfo = OLFeatures.EntityInfo.on
	OLSettings.Coords = OLFeatures.Coords.on 

	OLSettings.Red = OLFeatures.Red.value
	OLSettings.Green = OLFeatures.Green.value
	OLSettings.Blue = OLFeatures.Blue.value
	OLSettings.Alpha = OLFeatures.Alpha.value
	OLSettings.XPos = OLFeatures.Xpos.value
	OLSettings.YPos = OLFeatures.Ypos.value
	OLSettings.TextAlign = OLFeatures.TextAlign.value
	OLSettings.Scale = OLFeatures.Scale.value
	OLSettings.Shadow = OLFeatures.Shadow.on
	OLSettings.Font = OLFeatures.Font.value
	OLSettings.SpeedoType = OLFeatures.SpeedometerType.value
	SaveSettings("OverlaySettings", OLSettings)
	
	menu.notify("Settings Saved", "Toph's Overlay", 7, 0xFF00FF00)
end)