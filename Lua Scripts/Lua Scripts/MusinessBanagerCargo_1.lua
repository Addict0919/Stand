--[[ 

	Made by akatozi#0691
	Credits
	Ren, ICYPhoenix: MusinessBanager 
	luigistyle: AHK Loop
	Aiko: Tester
	IceDoomfist: TP Function
	Prisuhm: Auto-Update

--]]

util.require_natives(1660775568)

local pid = players.user()
local localVer = 1.911
local mb_version = "0.3.2"
local loop_speed = 1.3
local warehouse_capacity = 111
local full_protection = 1
local luaname = "MusinessBanagerCargo Add-On v"..localVer.."\n"
local main_menu = menu.my_root()

local response = false
async_http.init("raw.githubusercontent.com", "/akatozi/BusinessManager-Cargo-Add-On/main/Version", function(output)
    currentVer = tonumber(output)
    response = true
    if localVer < currentVer then
            async_http.init('raw.githubusercontent.com','/akatozi/BusinessManager-Cargo-Add-On/main/MusinessBanager Cargo Add-On.lua',function(a)
                local err = select(2,load(a))
                if err then
                    util.toast("Script failed to download. Please try again later. If this continues to happen then manually update via github.")
                return end
                local f = io.open(filesystem.scripts_dir()..SCRIPT_RELPATH, "wb")
                f:write(a)
                f:close()
                util.toast(luaname.." Updated !")
                util.stop_script()
            end)
            async_http.dispatch()
    end
end, function() response = true end)
async_http.dispatch()
repeat 
    util.yield()
until response

util.toast(luaname.."MusinessBanager v"..mb_version.."\n\nIMPORTANT! Make sure to check everything in MusinessBanager > Special Cargo")

menu.divider(main_menu, "Special Cargo")

menu.list_select(main_menu, 'Warehouse Size ', {""}, "Chose the size of your warehouse.", {"Large (111)","Medium (42)","Small (16)"}, 1, function(warehouse_type)
	if warehouse_type == 3 then
		warehouse_capacity = 16
	elseif warehouse_type == 2 then
		warehouse_capacity = 42
	elseif warehouse_type == 1 then
		warehouse_capacity = 111
	end
end)

menu.list_select(main_menu, 'Loop Speed ', {""}, "Chose speed of one loop.\nIf you get stuck in the warehouse menu, chose slower speed.", {"Extremely Fast","Very Fast","Fast","Normal","Slow","Very Slow","Extremely Slow"}, 4, function(sell_value)
	loop_speed = 1 + 0.1*(sell_value-1)
	if sell_value < 4 then
		util.toast(luaname.."Faster loop speed can get you stuck in the warehouse menu !\nDo it at your own risk.")
	end
end)

afkMoneyCargo = menu.toggle(main_menu, 'Money Loop', {""}, "Auto resupply and sell crates.\nIMPORTANT If resupply doesn't work, change your selected warehouse ! This is because the NPC to resupply doesn't appear. (GTA Bug)", function()
	while menu.get_value(afkMoneyCargo) do
        menu.trigger_commands("removeloader")
        menu.trigger_commands("nophonespam on")
		local i = 0
        if full_protection == 1 then
            sell_crates()
            sell_crates()
            full_protection = 0
        end
		refill_crates()
		while i <= warehouse_capacity and menu.get_value(afkMoneyCargo) do
			sell_crates()
			i = i + 1
		end
    end
    full_protection = 1
end)

menu.divider(main_menu, "Version "..localVer)
settings_menu = menu.list(menu.my_root(), "Options", {}, "", function(); end)
menu.divider(settings_menu, "Settings")
opti_settings = menu.toggle(settings_menu,'Optimised Settings', {""}, 'Improve FPS and stability of the lua.\nNOTE: Reducing resolution and play on windowed mode also helps a lot.', function()
	if menu.get_value(opti_settings) then
        opti_value = "on"
    else
        opti_value = "off"
    end
    menu.trigger_commands("anticrashcamera "..opti_value)
    menu.trigger_commands("potatomode "..opti_value)
    menu.trigger_commands("nosky "..opti_value)
    menu.trigger_commands("noidlekick "..opti_value)
    menu.trigger_commands("noidlecam "..opti_value)
    menu.trigger_commands("monitorcargo "..opti_value)
    menu.trigger_commands("maxsellcargo "..opti_value)
    menu.trigger_commands("nobuycdcargo "..opti_value)
    menu.trigger_commands("nosellcdcargo "..opti_value)
    menu.trigger_commands("autocompletespecialbuy "..opti_value)
    menu.trigger_commands("autocompletespecialsell "..opti_value)
end)

menu.hyperlink(main_menu, "How to Use Tutorial", "https://github.com/akatozi/BusinessManager-Cargo-Add-On/blob/main/README.md")

menu.action(settings_menu,'Solo Spoofed Session', {""}, 'Reduces even more risks.\nNOTE: Will make you go in solo session with spoofed session so you cant be crashed or checked by R* Admins.', function()
	if menu.get_value(afkMoneyCargo) then
        util.toast(luaname.."You need to turn off Money Loop !")
    else
	    menu.trigger_commands("go solo")
	    menu.trigger_commands("spoofsession storymode")
    end
end)

moneyMultiplier = menu.toggle_loop(settings_menu, 'Disable RP', {""}, 'Dont earn anymore RP with cargo sells.', function()
	if menu.get_value(moneyMultiplier) then
        util.draw_debug_text("RP Disabled")
		memory.write_float(memory.script_global(262145 + 1), 0)
	else
		memory.write_float(memory.script_global(262145 + 1), 1)
	end
end)

menu.divider(settings_menu, "Misc")
menu.action(settings_menu,'Restart the game', {""}, 'Use it if you are stuck in the warehouse screen.', function()
	default_settings()
	menu.trigger_commands("stopluamusinessbanager")
	menu.trigger_commands("forcequittosp")
	menu.trigger_commands("stopluamusinessbanagercargoaddon")
end)

function sell_crates()
	menu.trigger_commands("sellacrate")
	util.yield(1750*loop_speed)
end

function refill_crates()
	menu.trigger_commands("tptocargowarehouse")
    util.yield(100)
    menu.trigger_commands("tptocargowarehouse")
    util.yield(100)
    local entry_coo = players.get_position(pid)
    local res_made = 0
	while res_made == 0 do
        util.yield(50)
        local p_coo = players.get_position(pid)
        pos_difference = math.ceil(MISC.GET_DISTANCE_BETWEEN_COORDS(p_coo.x, p_coo.y, p_coo.z, 993.774, -3099.921, -38.99581))
        if pos_difference <= 2 then
            util.yield(500*loop_speed)
            tp1()
            util.yield(150*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 51, 1)
            util.yield(20*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 51, 1)
            util.yield(20*loop_speed)
            tp2()
            util.yield(150*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 51, 1)
            util.yield(20*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 51, 1)
            util.yield(20*loop_speed)
            tp3()
            util.yield(150*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 51, 1)
            util.yield(20*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 51, 1)
            util.yield(20*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 201, 1)
            util.yield(20*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 201, 1)
            util.yield(20*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 201, 1)
            util.yield(20*loop_speed)
            tpexit()
            util.yield(200*loop_speed)
            PAD._SET_CONTROL_NORMAL(0, 201, 1)
            res_made = 1
        end
    end
    while res_made == 1 or res_made == 2 do
        util.yield(50)
        PAD._SET_CONTROL_NORMAL(0, 201, 1)
        local p_coo = players.get_position(pid)
        pos_difference = math.ceil(MISC.GET_DISTANCE_BETWEEN_COORDS(p_coo.x, p_coo.y, p_coo.z, entry_coo.x, entry_coo.y, entry_coo.z))
        if pos_difference <= 10 and res_made == 1 then
            res_made = 2
        elseif pos_difference > 2 and res_made == 2 then
            tpfps()
            util.yield(100)
            res_made = 3
        end
    end
end

function tp1()
	TELEPORT(997.9699, -3108.72, -38.999863)
	SET_HEADING(145)
end

function tp2()
	TELEPORT(1024.3882, -3098.5376, -38.99992)
	SET_HEADING(260)
end

function tp3()
	TELEPORT(1002.05, -3093.4438, -38.999928)
	SET_HEADING(20)
end

function tpexit()
	TELEPORT(992.33, -3097.64, -38.999928)
	SET_HEADING(90)
end

function tpfps()
	TELEPORT(457.25537, 5571.8975, 781.1837)
end

function TELEPORT(X, Y, Z)
    local Handle = PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) and PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false) or players.user_ped()
    ENTITY.SET_ENTITY_COORDS(Handle, X, Y, Z)
end

function SET_HEADING(Heading)
    ENTITY.SET_ENTITY_HEADING(players.user_ped(), Heading)
end

function format_int(number) -- Credits to Bart Kiers from stackoverflow
  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
  int = int:reverse():gsub("(%d%d%d)", "%1,")
  return minus .. int:reverse():gsub("^,", "") .. fraction
end

util.keep_running()
