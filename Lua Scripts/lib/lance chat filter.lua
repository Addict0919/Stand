require("natives-1614644776")
util.toast('Thanks for using Lance\'s chat filter!')
util.toast('FAIR WARNING if someone has kick reactions on this may get you kicked.')

file_name = filesystem.scripts_dir() .. 'banned_words.txt'
banned_words = {}

-- this is taken from lua docs at http://lua-users.org/wiki/FileInputOutput
-- check if the file exists so if it doesnt we dont encounter errors
function file_exists(path)
    local file = io.open(path, "rb")
    if file then file:close() end
    return file ~= nil
end

if not file_exists(file_name) then
  util.toast(file_name .. ' was not found, please make sure the script is installed correctly.')
  util.stop_script()
else
    file = io.open(file_name, "r")
    i = 0
    for l in file:lines() do
        i = i + 1
        banned_words[i] = string.lower(l)
    end
    file:close()
    util.toast('Banned words loaded!')
end

chat.on_message(function(sender_player_id, sender_player_name, message, is_team_chat)
    if sender_player_id ~= players.user() then
        for n, w in pairs(banned_words) do
            if string.find(string.lower(message), w) then
                util.toast(sender_player_name .. ' said a banned word (' .. w .. '). Kicking them.')
                menu.trigger_commands("kick ".. sender_player_name)
            end
        end
    end
end)

while true do
    util.yield()
end