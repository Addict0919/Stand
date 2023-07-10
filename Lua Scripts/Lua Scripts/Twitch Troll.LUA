    util.keep_running()
    
    online = menu.list(menu.my_root(), "Check Online Streamers", {"onlinestreamers"}, "Check if streamer target is online.", function(); end)

        menu.action(online, "DarkViper", {"onlinedarkviper"}, "Player has to be in public session or edit the code if they are in [Invite] session. DarkViper, RID: 64839021", function(on)
            menu.trigger_commands("historyadd" .. " RealDarkViperAU")
            menu.trigger_commands("findplayer" .. " RealDarkViperAU")
        end)


    watching = menu.list(menu.my_root(), "Watch Streamers", {"watchstreamers"}, "", function(); end)

        menu.hyperlink(watching, "Watch DarkViper", "https://www.twitch.tv/darkviperau")


    kicks = menu.list(menu.my_root(), "Kick Streamers", {"kickstreamers"}, "Kick streamers", function(); end)

        menu.toggle_loop(kicks, "DarkViper", {"kickdarkviper"}, "Player has to be in public session or edit the code if they are in [Invite] session. DarkViper, RID: 64839021", function(on)
            menu.trigger_commands("historyadd" .. " RealDarkViperAU")
            util.yield(3000)
            local BlindFire = menu.ref_by_path("Online>Player History>RealDarkViperAU [Offline]>Blind-Fire Kick>Breakup")
            menu.trigger_command(BlindFire)
        end)

--[[
    crashes = menu.list(menu.my_root(), "Crash Streamers", {"crashstreamers"}, "", function(); end)

        menu.toggle_loop(crashes, "DarkViper", {"crashdarkviper"}, "Player has to be in public session or edit the code if they are in [Invite] session. DarkViper, RID: 64839021", function(on)
            menu.trigger_commands("historyadd" .. " RealDarkViperAU")
            util.yield(3000)
            local BlindFire = menu.ref_by_path("Online>Player History>RealDarkViperAU [Public]>Send Pipebomb")
            menu.trigger_command(BlindFire)
        end)
]]
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    util.on_stop(function()
end)