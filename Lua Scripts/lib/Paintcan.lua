--[[special thanks to 
HoppaC4
Bunny_
jayphen
lance
for helping me with my first script and being patiences with me and my small brain power
]]

require("natives-1614644776")
script = {}

GenerateFeatures = function(pid) -- Here is where you will generate all your features 
menu.divider(menu.player_root(pid), "Paint Bucket") -- This is creating a divider in the menu for a more clean look refer to the DOCS if confused
menu.action(
	menu.player_root(pid),
	"trap in cage",
	{},
	"",
	function(on_click)
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid),true)
		OBJECT.CREATE_OBJECT(MISC.GET_HASH_KEY("prop_gold_cont_01"), pos.x, pos.y, pos.z - 1, true, true)	
	end)
menu.action(
	menu.player_root(pid),
	"paint can",
	{},
	"",
	function(on_click)
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid),true)
		OBJECT.CREATE_OBJECT(MISC.GET_HASH_KEY("prop_paints_can07"), pos.x, pos.y, pos.z - 1, true, true)	
	end)
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
