util.keep_running()
require 'natives-1663599433'

while true do
    if not PAD.IS_CONTROL_ENABLED(0, 22) and not menu.command_box_is_open() then
        if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(0, 22) then
            MISC.SET_FORCED_JUMP_THIS_FRAME(players.user())
        end
    end
    util.yield()
end