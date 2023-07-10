require("natives-1614644776") 

local waiting = false
local enabled = false

menu.toggle(menu.my_root(), "Enable Script", {"enableorblitorate"}, "Drop Those Frames kekw", function(on_toggle)                         
    enabled = on_toggle
end, false)

function do_fade_in(pid) 
    CAM.DO_SCREEN_FADE_OUT(500)
    util.yield(500)
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " on")
    orbital_cannon_effects(true)
    util.yield(1000)
    CAM.DO_SCREEN_FADE_IN(1000)
    waiting = false
end
function do_fade_out(pid)
    util.yield(2500)
    CAM.DO_SCREEN_FADE_OUT(1000)
    util.yield(1000)
    orbital_cannon_effects(false)
    menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(pid) .. " off;nightvision off")
    util.yield(1000)
    CAM.DO_SCREEN_FADE_IN(1000)
    waiting = false
end
function orbital_cannon_effects(on)
    if on then
        menu.trigger_commands("becomeorbitalcannon on;nightvision on;fov 130")
    else 
        menu.trigger_commands("becomeorbitalcannon off;fov 0;nightvision off")
    end
end
function orbital(pid) 
    for i = 0, 30 do 
        pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        for j = -2, 2 do 
            for k = -2, 2 do 
                local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
                FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x + j, pos.y + j, pos.z + (30 - i), 29, 999999.99, true, false, 8)
            end
        end
        util.yield(20)
    end
end
selected_player_options = function(pid)
    menu.action(menu.player_root(pid), "O\"r\"bliterate", {}, "Kills them via the orbital cannon", function(on_click)
        if waiting then
            do_fade_in(pid)
            util.toast("Click again to fire!")
            return 
        end
        waiting = true
        if not NETWORK.NETWORK_IS_IN_SPECTATOR_MODE() then
            do_fade_in(pid)
            return
        end
        util.toast("FIRE!")
        orbital(pid) 
        do_fade_out(pid)
        
    end) 
end
for pid = 0,32 do
	if players.exists(pid) then
        selected_player_options(pid)
	end
end
players.on_join(selected_player_options)
while true do
    if enabled then 
        orbital_cannon_effects(NETWORK.NETWORK_IS_IN_SPECTATOR_MODE())
        util.yield(1000)
    end
    util.yield()
end