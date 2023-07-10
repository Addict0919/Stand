script = {}

local toggle = false

GenerateFeatures = function() -- Here is where you will generate all your features 
menu.divider(menu.my_root(), "Script Features") -- This is creating a divider in the menu for a more clean look refer to the DOCS if confused
parent = menu.list(menu.my_root(), "Script List", {}, "", function(); end) -- Here we are creating a parent/list/id that for later on we will be able to put features under 
menu.action(parent, "Test Action", {}, "", function() -- we are putting an action under our parent/id called parent
util.toast("This is a Test Action Buton :)") -- read docs but this will just print above the map 
 end)
 
menu.toggle(parent, "Test Toggle button ", {}, "", function(on) -- this is creating the actual toggle button
toggle = on -- this is setting the toggle on
end)
	while true do -- We do a While true do if toggle is on then do the code inside and we have to run this inside our main loop 
		if toggle then
			util.log("Printing To Log.txt")
		end
		util.yield() -- must have this or you go crashy 
	end
end

GenerateFeatures() -- This is making our function run on start of the script 

while true do -- this is what makes your script keep running 
	util.yield()
end