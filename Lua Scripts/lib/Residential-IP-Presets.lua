require("natives-1614644776")
script = {}

spoofpresets = menu.list(menu.my_root(), "Residential IP Spoofer", {}, "This feature will spoof your IP to a real residential IP that will make it less sus", function(); end)

menu.action(spoofpresets, "Enable IP Spoofer", {}, "", function(on_click)
	menu.trigger_commands("spoofip on")
end)

menu.action(spoofpresets, "Disable IP Spoofer", {}, "", function(on_click)
	menu.trigger_commands("spoofip off")
end)

menu.divider(spoofpresets, "IP Presets")

menu.action(spoofpresets, "Italy", {}, "", function(on_click)
	menu.trigger_commands("spoofedip " .. "5.89.190." .. tostring(math.random(0, 255)))
end)

menu.action(spoofpresets, "Austria", {}, "", function(on_click)
	menu.trigger_commands("spoofedip " .. "194.166.250." .. tostring(math.random(0, 255)))
end)

menu.action(spoofpresets, "Germany", {}, "", function(on_click)
	menu.trigger_commands("spoofedip " .. "84.56.218." .. tostring(math.random(0, 255)))
end)

menu.action(spoofpresets, "Netherlands", {}, "", function(on_click)
	menu.trigger_commands("spoofedip " .. "217.123.124." .. tostring(math.random(0, 255)))
end)

menu.action(spoofpresets, "United Kingdom", {}, "", function(on_click)
	menu.trigger_commands("spoofedip " .. "81.109.120." .. tostring(math.random(0, 255)))
end)

while true do
	util.yield()
end