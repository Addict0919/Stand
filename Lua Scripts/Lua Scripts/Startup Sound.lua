local aalib = require("aalib")
local PlaySound = aalib.play_sound
local SND_ASYNC<const> = 0x0001
local SND_FILENAME<const> = 0x00020000

store_dir = filesystem.store_dir() .. '\\startup_sound\\'
sound_selection_dir = store_dir .. '\\sound.txt'

if not filesystem.is_dir(store_dir) then
    util.toast("Startup Sound is not installed properly.")
    util.stop_script()
end

fp = io.open(sound_selection_dir, 'r')
local file_selection = fp:read('*a')
fp:close()

local sound_location = store_dir .. '\\' .. file_selection
if not filesystem.exists(sound_location) then
    util.toast("[Startup Sound] " .. file_selection .. " was not found.")
else
    PlaySound(sound_location, SND_FILENAME | SND_ASYNC)
end
util.keep_running()