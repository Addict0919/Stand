util.require_natives("1663599433")
util.ensure_package_is_installed("lua/ScaleformLib")
--HUD.MP_TEXT_CHAT_DISABLE(true)
local chat_scaleform = require("lib.ScaleformLib")("multiplayer_chat")
local message_history = {}

function new_chat_obj(player_name, player_color, tag, text, networked)
    local chat = {
        player_name = player_name,
        player_color = player_color,
        tag = tag, 
        text = text,
        networked = networked
    }
    return chat
end


local main_root = menu.my_root()
conditional_coloring_root = main_root:list("Conditional coloring", {}, "Conditionally color player names based on criteria. In hierarchy. Me > Modders > Friends > Strangers")
tags_root = main_root:list("Tags", {}, "Give everyone tags based off certain criteria")
general_settings = main_root:list("General settings", {}, "Max chat length, etc")

max_chat_len = 254
general_settings:slider("Max chat length", {"chatmaxlength"}, "Anything over this will automatically be trimmed down. Does not apply to your chats.", 1, 254, 254, 1, function(value)
    max_chat_len = value
end)

max_chats = 10
general_settings:slider("Max chats", {"chatmaxchats"}, "The max chats that can be displayed/in history. Anything over this value will not be shown.", 1, 20, 10, 1, function(value)
    max_chats = value
end)

local uwuify = false
general_settings:toggle("UwU", {}, "OK I ADMIT IT I LOVE YOU OK i fucking love you and it breaks my heart when i see you play with someone else or anyone commenting in your profile i just want to be your girlfriend and put a heart in my profile linking to your profile and have a walltext of you commenting cute things i want to play video games talk in discord all night and watch a movie together but you just seem so uninsterested in me it fucking kills me and i cant take it anymore i want to remove you but i care too much about you so please i’m begging you to eaither love me back or remove me and never contact me again it hurts so much to say this because i need you by my side but if you dont love me then i want you to leave because seeing your icon in my friendlist would kill me everyday of my pathetic life.", function(on)
    uwuify = on
end)


local conditional_coloring = true
conditional_coloring_root:toggle("Conditional coloring", {}, "", function(on)
    conditional_coloring = on
end, true)

local hud_colors = {
    me = 224,
    friends = 225,
    strangers = 226,
    modders = 227
}

function replace_hud_color(index, color)
    HUD.REPLACE_HUD_COLOUR_WITH_RGBA(index, color.r * 255, color.g * 255, color.b * 255, color.a * 255)
end

me_color = {r = 1, g = 0, b = 1, a = 1}
conditional_coloring_root:colour("Me", {"chatmecolor"}, "", me_color, true, function(rgb)
    replace_hud_color(hud_colors.me, rgb)
end)

friends_color = {r = 0, g = 1, b = 0, a = 1}
conditional_coloring_root:colour("Friends", {"chatfriendcolor"}, "", friends_color, true, function(rgb)
    replace_hud_color(hud_colors.friends, rgb)
end)

strangers_color = {r = 1, g = 1, b = 1, a = 1}
conditional_coloring_root:colour("Strangers", {"chatstrangercolor"}, "", strangers_color, true, function(rgb)
    replace_hud_color(hud_colors.strangers, rgb)
end)

modders_color = {r = 1, g = 0, b = 0, a = 1}
conditional_coloring_root:colour("Modders", {"chatmoddercolor"}, "", modders_color, true, function(rgb)
    replace_hud_color(hud_colors.modders, rgb)
end)


replace_hud_color(hud_colors.me, me_color)
replace_hud_color(hud_colors.friends, friends_color)
replace_hud_color(hud_colors.strangers, strangers_color)
replace_hud_color(hud_colors.modders, modders_color)


custom_tag = "SEX"
tag_mode = 4
tags_root:list_select("Tag mode", {"chattagmode"}, "Select what tags should be applied", {"GTA V Default", "Stand tags", "Custom text", "No tags"}, 4, function(index)
    tag_mode = index
end)

tags_root:text_input("Custom tag text", {"chatcustomtag"}, "This must be configured under tag mode to be used", function(input)
    custom_tag = input
end, "SEX")

async_http.init("pastebin.com", "/raw/nrMdhHwE", function(result)
    main_root:hyperlink("Join Discord", result, "")
end)
async_http.dispatch()

-- player options

local muted_players = {}
local function player(pid)
    menu.divider(menu.player_root(pid), "chatPlus") 
    menu.toggle(menu.player_root(pid), "Mute user", {}, "Mute this player.\nNo chats from them will be displayed, but the animation of a new chat will still play (unfortunately) due to limitations and everything else will work, such as typing notification and luas/features that affect chat.", function(on)
        if on then 
            muted_players[pid] = true
        else
            muted_players[pid] = nil
        end
    end)
end
players.on_leave(function(pid)
    muted_players[pid] = nil 
end)

players.on_join(player)
players.dispatch_on_join()

util.create_tick_handler(function()
    chat_scaleform:draw_fullscreen()
end)

handle_ptr = memory.alloc(13*8)
local function pid_to_handle(pid)
    NETWORK.NETWORK_HANDLE_FROM_PLAYER(pid, handle_ptr, 13)
    return handle_ptr
end

-- some code from https://github.com/cummodore69/uwuifier/blob/main/uwuifier/uwuifier.lua
function uwu(text)
    text = string.lower(text):gsub("l", "w"):gsub("r", "w"):gsub("v", "f"):gsub("i", "i-i"):gsub("d", "d-d"):gsub("n", "n-n")
    local ran = math.random(5)
    pluto_switch ran do 
        case 2:
            text = text .. " uwu"
            break 
        case 3:
            text = text .. " nya.."
            break
        case 4:
            text = text .. " ><"
            break
    end
    return text
end

chat.on_message(function(sender, reserved, text, team_chat, networked, is_auto)
        if players.user() ~= sender then 
            text = text:sub(1, max_chat_len)
        end

        if uwuify then 
            text = uwu(text)
        end
        -- coloring player names
        local player_color = 1
        if conditional_coloring then
            local hdl = pid_to_handle(sender)
            if sender == players.user() then 
                player_color = hud_colors.me
            elseif players.is_marked_as_modder(sender) then 
                player_color = hud_colors.modders
            elseif NETWORK.NETWORK_IS_FRIEND(hdl) then
                player_color = hud_colors.friends
            else
                player_color = hud_colors.strangers
            end
        end

        -- custom tags
        -- technically there is also CEO chat but whatever
        local tag = if team_chat then "TEAM" else "ALL"
        if tag_mode == 2 then 
            tag = players.get_tags_string(sender)
        elseif tag_mode == 3 then
            tag = custom_tag
        elseif tag_mode == 4 then
            tag = ""
        end

        if muted_players[sender] == nil then
            local this_chat = new_chat_obj(players.get_name(sender), player_color, tag, text, networked)
            message_history[#message_history + 1] = this_chat
        end
        chat_scaleform.RESET()
        if #message_history > max_chats then
            table.remove(message_history, 1)
        end

        for _, chat in pairs(message_history) do
            chat_scaleform.ADD_MESSAGE(chat.player_name, chat.text, chat.tag, chat.networked, chat.player_color)
        end

        chat_scaleform.showFeed()

        -- fix for if a message incomes while we're typing
        local chat_state = chat.get_state()
        if chat_state ~= 0 then
            local chat_draft = chat.get_draft()
            chat.close()
            chat.ensure_open_with_empty_draft(chat_state == 1)
            chat.add_to_draft(chat_draft)
        end
end)



util.keep_running()