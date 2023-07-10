util.keep_running()

util.require_natives("natives-1663599433-uno")


local Credits = menu.list(menu.my_root(), "Credits", {"addictcredits"}, "<3")



---------------------------------------------------------------------------------
menu.divider(Credits, "Great Coders <3")
---------------------------------------------------------------------------------
menu.action(Credits, "Unseemly", {}, "Great coder wouldn't even have an auto updater or certain mods fixed if it wasn't for this guy <3.", function() end)

---------------------------------------------------------------------------------
menu.divider(Credits, "Great Supporters <3")
---------------------------------------------------------------------------------
menu.action(Credits, "Mr's Candy <3", {}, "(Candy's Girlfriend) Great morel support kept me smiling, happy and aloud me to code without a bother <3.", function() end)

util.toast("Welcome To Addicted! v" .. "\n" .. "\n" .. "Keep your eyes peeled for updates..\n" .. "\n" .. "WARNING! Notifications aren't always accurate")



local bountyloop = menu.list(menu.my_root(), "Loops/toggles", {""}, "")


menu.toggle(bountyloop, "mentstate", {""}, "", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("mentalstate" .. " 100") -- 5 seconds
        util.yield(5000)
    else
        menu.trigger_commands("mentalstate" .. " 0")
        util.yield(5000) -- 5 seconds
    end
end)

menu.toggle_loop(bountyloop, "mentstate", {""}, "", function(on_toggle)
    if on_toggle then
        menu.trigger_commands("mentalstate" .. " 100") -- 5 seconds
        util.yield(5000)
    else
        menu.trigger_commands("mentalstate" .. " 0")
        util.yield(5000) -- 5 seconds
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
util.on_stop(function()
	util.toast("Later pussy (Yawn)")
end)