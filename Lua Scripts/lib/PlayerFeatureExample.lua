script = {}

GenerateFeatures = function(pid) -- Here is where you will generate all your features 
menu.divider(menu.player_root(pid), "Script Features") -- This is creating a divider in the menu for a more clean look refer to the DOCS if confused
menu.list(menu.player_root(pid), "Script List", {}, "", function(); end) -- Here we are creating a parent/list that for later on we will be able to put features under 
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