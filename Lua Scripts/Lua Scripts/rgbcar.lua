require("natives-1640181023")

util.keep_running()

local scriptName = "SneakyE V.1.5"

local menuroot = menu.my_root()
local menuAction = menu.action
local menuToggle = menu.toggle
local menuToggleLoop = menu.toggle_loop
local joaat = util.joaat
local wait = util.yield

--

local createPed = PED.CREATE_PED
local getEntityCoords = ENTITY.GET_ENTITY_COORDS
local getPlayerPed = PLAYER.GET_PLAYER_PED
local requestModel = STREAMING.REQUEST_MODEL
local hasModelLoaded = STREAMING.HAS_MODEL_LOADED
local noNeedModel = STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED
local setPedCombatAttr = PED.SET_PED_COMBAT_ATTRIBUTES
local giveWeaponToPed = WEAPON.GIVE_WEAPON_TO_PED

--

local function getLocalPed()
    return PLAYER.PLAYER_PED_ID()
end

local function preload()
    local ped = getLocalPed()
    local veh = PED.GET_VEHICLE_PED_IS_IN(ped, true)
    for i = 0, 3, 1 do
        VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(veh, i, true)
    end
end

menu.divider(menuroot, "RGB_Car (Gamble)")

R_val = 255
G_val = 0
B_val = 0
XEN_val = 1

RGB_Values = {
    {255, 0, 0},
    {255, 127, 0},
    {255, 255, 0},
    {0, 255, 0},
    {0, 0, 255},
    {75, 0, 130},
    {148, 0, 211}
}

RGB_Count = 1
RGB_Countp2 = 1

RGB_Delay = 300

--preload
RGB_Headlights = true
RGB_NeonLights = true
RGB_Paint = false

menuToggleLoop(menuroot, "RGB Car", {}, "", function ()
    local ped = getLocalPed()
    local veh = PED.GET_VEHICLE_PED_IS_IN(ped, true)
    if RGB_NeonLights then
        for i = 0, 3, 1 do
            VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(veh, i, true)
        end
    end
    ----
    if RGB_Headlights then
        if XEN_val > 12 then XEN_val = 1 end
        VEHICLE._SET_VEHICLE_XENON_LIGHTS_COLOR(veh, XEN_val)
        XEN_val = XEN_val + 1
    end
    ----
    if RGB_NeonLights then
        VEHICLE._SET_VEHICLE_NEON_LIGHTS_COLOUR(veh, RGB_Values[RGB_Countp2][1], RGB_Values[RGB_Countp2][2], RGB_Values[RGB_Countp2][3])
        if RGB_Countp2 >= 7 then RGB_Countp2 = 0 end
        RGB_Countp2 = RGB_Countp2 + 1
    end
    if RGB_Paint then
        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(veh, RGB_Values[RGB_Count][1], RGB_Values[RGB_Count][2], RGB_Values[RGB_Count][3])
        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(veh, RGB_Values[RGB_Count][1], RGB_Values[RGB_Count][2], RGB_Values[RGB_Count][3])
        if RGB_Count >= 7 then RGB_Count = 0 end
        RGB_Count = RGB_Count + 1
    end
    ----
    wait(RGB_Delay)
end)

menuAction(menuroot, "Enable Xenon Lights (color lights)", {}, "Use this button to enable xenon lights to use color lights.", function ()
    local ped = getLocalPed()
    local veh = PED.GET_VEHICLE_PED_IS_IN(ped, true)
    VEHICLE.TOGGLE_VEHICLE_MOD(veh, 22, true)
end)

menu.slider(menuroot, "RGB Delay", {"rgbdelay"}, "Setting a too low value may not network the colors to other players!", 1, 20000, 300, 100, function (value)
    RGB_Delay = value
end)

menu.toggle(menuroot, "Enable RGB Paint", {}, "", function(toggle)
    if toggle then
        RGB_Paint = true
    else
        RGB_Paint = false
    end
end, true)

menu.toggle(menuroot, "Enable RGB Neon Lights", {}, "", function(toggle)
    if toggle then
        RGB_NeonLights = true
    else
        RGB_NeonLights = false
    end
end, true)

menu.toggle(menuroot, "Enable RGB Xenon Headlights", {}, "", function(toggle)
    if toggle then
        RGB_Headlights = true
    else
        RGB_Headlights = false
    end
end, true)

--[[
menuAction(menuroot, "Car neon lights?", {}, "", function ()
    local ped = getLocalPed()
    local veh = PED.GET_VEHICLE_PED_IS_IN(ped, true)
    for i = 0, 3, 1 do
        VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(veh, i, true)
    end
end)]]