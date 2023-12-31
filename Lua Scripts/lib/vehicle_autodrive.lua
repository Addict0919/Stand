-- Vehicle Autodrive - 1.0
-- Created By Jackz

require("natives-1627063482")

local drive_speed = 50.0
local drive_style = 0
local is_driving = false

local DRIVING_STYLES = {
    { 786603,       "Normal" },
    { 6,            "Avoid Extremely" },
    { 5,            "Sometimes Overtake" },
    { 1074528293,   "Rushed" },
    { 2883621,      "Ignore Lights" },
    { 786468,       "Avoid Traffic" },
    { 1076,         "Reversed" },
    { 8388614,      "Supposedly Good Driving" }
}

local styleMenu = menu.list(menu.my_root(), "Driving Style", {}, "Sets how the ai will drive")

for _, style in pairs(DRIVING_STYLES) do
    menu.action(styleMenu, style[2], { }, "Sets driving style to " .. style[2], function(v) 
        driving_mode = style[1]
        if is_driving then
            local ped = PLAYER.GET_PLAYER_PED(players.user())
            TASK.SET_DRIVE_TASK_DRIVING_STYLE(ped, style[1])
        end
        util.toast("Set driving style to " .. style[2])
    end)
end

menu.slider(menu.my_root(), "Driving Speed", {"setaispeed"}, "", 0, 200, drive_speed, 5.0, function(speed, prev)
    drive_speed = speed
end)

menu.divider(menu.my_root(), "Drive Actions")

menu.action(menu.my_root(), "Drive to Waypoint", {"aiwaypoint"}, "", function(v)
    local ped = PLAYER.GET_PLAYER_PED(players.user())
    local vehicle = util.get_vehicle()
    is_driving = true

    local vehicleModel = ENTITY.GET_ENTITY_MODEL(vehicle)
    if HUD.IS_WAYPOINT_ACTIVE() then
        local blip = HUD.GET_FIRST_BLIP_INFO_ID(8)
        local pos = HUD.GET_BLIP_COORDS(blip)
        TASK.TASK_VEHICLE_DRIVE_TO_COORD(ped, vehicle, pos.x, pos.y, pos.z, drive_speed, 1.0, vehicleModel, drive_mode, 5.0, 1.0)
    else
        util.toast("You have no waypoint to drive to")
    end
end)

menu.action(menu.my_root(), "Wander", {"aiwander"}, "", function(v)
    local ped = PLAYER.GET_PLAYER_PED(players.user())
    local vehicle = util.get_vehicle()
    is_driving = true

    TASK.TASK_VEHICLE_DRIVE_WANDER(ped, vehicle, drive_speed, drive_style)
end)

menu.action(menu.my_root(), "Stop Driving", {"aistop"}, "", function(v)
    local ped = PLAYER.GET_PLAYER_PED(players.user())
    is_driving = false

    TASK.CLEAR_PED_TASKS(ped)
end)

util.on_stop(function()
    local ped = PLAYER.GET_PLAYER_PED(players.user())
    local vehicle = util.get_vehicle()

    TASK.CLEAR_PED_TASKS(ped)
    TASK._CLEAR_VEHICLE_TASKS(vehicle)
end)

while true do
    util.yield()
end
