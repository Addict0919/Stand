-- MANUAL/release toggle_ui
-- AUTOGENERATED CODE ON Thursday 8th, September 2022 AT 08:08:03 AM
local SCRIPT_SOURCE = "MANUAL"
local SCRIPT_BRANCH = "release"
local BRANCH_LAST_COMMIT = "f1b0b67ab98e53a48ee4d308165f18adbd09b517"
local SCRIPT_BRANCH_IDS = {"master","release"}
local SCRIPT_BRANCH_NAMES = {{"dev"},{"release"}}
-- END AUTOGENERATED CODE --

-- Test - 1.0
-- Created By Jackz

require("natives-1627063482")

local radarEnabled = true
menu.toggle(menu.my_root(), "Toggle Radar", {"toggleradar"}, "", function(on)
    HUD.DISPLAY_RADAR(on)
end, true)

while true do
	util.yield()
end