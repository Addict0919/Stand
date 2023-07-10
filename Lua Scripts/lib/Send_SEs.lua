script = {}
function script.trigger_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
end

GenerateFeatures = function(pid) -- Here is where you will generate all your features 
menu.divider(menu.player_root(pid), "Script Features") -- This is creating a divider in the menu for a more clean look refer to the DOCS if confused
menu.action(menu.player_root(pid), "Send SE's", {}, "", function(on_click)
script.trigger_script_event(1620254541, pid, {-32190, -71399, 19031, 85474, 4468, -2112})
script.trigger_script_event(-1789621123, pid, {-1000000, -10000000, -100000000, -100000000, -100000000})
script.trigger_script_event(1294893057 , pid, {14, 20, 22, -67, 33, -10})
script.trigger_script_event(1129105265, pid, {28, -1, -1})
script.trigger_script_event(-1243454584 , pid, {28, -1, -1})
script.trigger_script_event(-345371965, pid, {28, -1, -1})
script.trigger_script_event(-920663435, pid, {-1000000, -10000, -100000000})
script.trigger_script_event(-72590627, pid, {-38, -30, -75, -59, 85, 82})
script.trigger_script_event(1430093873, pid, {28, -1, -1})
script.trigger_script_event(-87967637, pid, {90734864, -79797364, -19940186, -56109619, -42346192, 94232178, -30041504, -70703125, 63098145, 12066650, 56524658, -78369141, 13214111, -69244385, -57812500, 92993165, -46472168, -71722412})
script.trigger_script_event(-891346918, pid, {28, -1, -1})
script.trigger_script_event(-442306200, pid, {-1, 0})
script.trigger_script_event(1119498954, pid, {8477783, 96960450})
script.trigger_script_event(1213808185, pid, {28, -1, -1})
script.trigger_script_event(858406863, pid, {28, -1, -1})
script.trigger_script_event(550741583, pid, {-1, 1, -1, -1, 1, -1, 1, -1, -10000, 0})
script.trigger_script_event(1317868303, pid, {-1000000, -10000000, -100000000, -100000000, -100000000})
script.trigger_script_event(1347850743, pid, {-1, 0})
script.trigger_script_event(-2065346036, pid, {28, -1, -1})
script.trigger_script_event(-1549630786, pid, {28, -1, -1})
script.trigger_script_event(-1990292823, pid, {28, -1, -1})
script.trigger_script_event(-338399516, pid, {-1000000, -10000000, -100000000, -100000000, -100000000})
script.trigger_script_event(823645419, pid, {-1, 6, -1, -1, 6, -1, 6, -1, -10000, 0})
script.trigger_script_event(1070934291, pid, {28, -1, -1})
script.trigger_script_event(1240585650, pid, {-1, 0})
script.trigger_script_event(-1212832151, pid, {-1, 10178, 0, 48, 0, 0, 0, 0, 0, 0})
script.trigger_script_event(1428412924, pid, {28, -1, -1})
script.trigger_script_event(1998625272, pid, {28, -1, -1})
script.trigger_script_event(620255745, pid, {28, -1, -1})
script.trigger_script_event(1977655521, pid, {-1000000, -10000, -100000000})
script.trigger_script_event(1045342179, pid, {-1, 6, -1, -1, 6, -1, 6, -1, -10000, 0})
script.trigger_script_event(-1990292823, pid, {-1, 0})
script.trigger_script_event(830707189, pid, {-1, 0, -1, -1, 6, -1, 6, -1, -10000, 0})
script.trigger_script_event(1000351374, pid, {-1, 1, -1, -1, 1, -1, 1, -1, -10000, 0})
script.trigger_script_event(-171207973, pid, {28, -1, -1})
script.trigger_script_event(1119498954, pid, {8477783, 96960450})
script.trigger_script_event(-2042143896,  pid,{94732666, 30853272, -79370118, -16662598})
script.trigger_script_event(-1729804184, pid, {31689453, 91436768, 9588623, -50805664, -10510254})
script.trigger_script_event(-1054826273, pid, {-33111572, -28521729, -7891846})
script.trigger_script_event(-966559987, pid, {18707275, 55963135, 20806885, 56512451, -21520996})
script.trigger_script_event(348119077, pid, {-1,-1,-1,-1,-1,-1})
script.trigger_script_event(-545396442, pid, {71398926, -88073731, -1824951, 26403809, 49438477})
script.trigger_script_event(1881968783, pid, {-61907959, 98449708, -25860596, 5969238, 46203614})
script.trigger_script_event(665709549, pid, {-7946777, 69866944, -76568604, -22979736})
script.trigger_script_event(1401831542, pid, {62438965, 11663818, 31390381, 76538086, 8465576})
script.trigger_script_event(2017765964, pid, {55999756, 54260254})
script.trigger_script_event(-961190199, pid, {6329346, 73571778, 71569825, -41625977})
script.trigger_script_event(1437305856, pid, {88067627, -10833740, -37829590, -85064698, 39263916, 24578858}) 
script.trigger_script_event(-1252906024, pid, {-1})
script.trigger_script_event(-1890951223, pid, {-1})
script.trigger_script_event(-1559754940, pid, {50531006})
script.trigger_script_event(127054992, pid, {-84716797, 77111817, -62121582, -75842286, -62390137, 46289063, -24603272, 15899658, -68865967, 14544678, -41094971, -3723145, 10235596, 77917481, -17199707})
script.trigger_script_event(1119498954, pid, {-7586670, -92486573, -71978760})
script.trigger_script_event(4123759323, pid, {-49456787, -71105957, -99676514, -87799073, 61242676, 70520020, -57885742, -76879883, 10638428, -97149659, -77246094, -9100342, 50439453, 37225342, 8685303, -85223389, -12658691, -59613037, 39239502, -41931153, -12664795, -53515625, 15570068, 6512451, 25732422, -67962647, 823975, 92602540, 39147949, 84954834})
end) -- Here we are creating a parent/list that for later on we will be able to put features under 
end

for pid = 0,30 do -- This is where the features are being applied 
	if players.exists(pid) then -- we do a check to see if they are valid then if they are then we go through our GenerateFeatures function to create the features for every valid player
		GenerateFeatures(pid)
	end
end

players.on_join(GenerateFeatures) -- refer to docs but this is creating features for every new player that joins the lobby 

while true do -- this is what makes your script keep running 
	util.yield()
end