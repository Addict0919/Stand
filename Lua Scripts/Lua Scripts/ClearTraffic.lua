-- ClearTraffic
-- by Hexarobi
-- ported from https://github.com/YimMenu/YimMenu

local SCRIPT_VERSION = "0.3"

---
--- Data
---

local config = {
    disable_traffic = true,
    disable_peds = true,
}

---
--- Dependencies
---

util.ensure_package_is_installed('lua/natives-1672190175')
local status_natives, natives = pcall(require, "natives-1672190175")
if not status_natives then error("Could not natives lib. Make sure it is selected under Stand > Lua Scripts > Repository > natives-1672190175") end

---
--- Menus
---

local pop_multiplier_id

menu.toggle(menu.my_root(), "No Traffic", {}, "", function(on)
    if on then
        local ped_sphere, traffic_sphere
        if config.disable_peds then ped_sphere = 0.0 else ped_sphere = 1.0 end
        if config.disable_traffic then traffic_sphere = 0.0 else traffic_sphere = 1.0 end
        pop_multiplier_id = MISC.ADD_POP_MULTIPLIER_SPHERE(1.1, 1.1, 1.1, 15000.0, ped_sphere, traffic_sphere, false, true)
        MISC.CLEAR_AREA(1.1, 1.1, 1.1, 19999.9, true, false, false, true)
    else
        MISC.REMOVE_POP_MULTIPLIER_SPHERE(pop_multiplier_id, false);
    end
end)
