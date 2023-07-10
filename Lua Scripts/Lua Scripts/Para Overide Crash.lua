util.require_no_lag("natives-1614644776")

---bitescript nofity function
local spinbot_vehicles = false
local rotation = 0
local override = false
local breaksession = false
local dontexit = true
local host = 0
local green = 184
local red = 6
local yellow = 190
local black = 2
local white = 1
local gray = 3
local pink = 201
local purple = 49 
local blue = 11
local attachhash = {
"FM_Tat_Award_F_000",

}
local attachveh = {}

function notification(message, color)
	HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)
	local picture = "CHAR_SOCIAL_CLUB"
	GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 0)
	while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
		util.yield()
	end
	util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)
	title = "P&J PrivateScript"
	if color == green or color == red then
		subtitle = "~u~Notification"
	elseif color == black then
		subtitle = "~c~Notification"
	else
		subtitle = "~u~Notification"
	end
	HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, picture, true, 4, title, subtitle)
	HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)
	util.log(message)
end

function requesthash(hash)
	STREAMING.REQUEST_MODEL(hash)
	    while not STREAMING.HAS_MODEL_LOADED(hash) do
		   util.yield()
	    end
end

function spawnveh(hash,pos)
requesthash(hash)
entities.create_vehicle(hash,pos,CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
return vehicle
end

function spawnped(hash,pos)
requesthash(hash)
local ped = entities.create_ped(28, hash, pos, CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
return ped
end



---Player list function

GenerateFeatures = function(pid)
dvdr = menu.divider(menu.player_root(pid), "P&J PrivateScript")
main = menu.list(menu.player_root(pid), "P&J PrivateScript", {}, "", function(); end)
crashopption = menu.list(main, "RemovePlayer", {}, "", function(); end)

---parachute crash
menu.action(crashopption, "PACrash", {"ParaCrash"}, "Good", function()
			for n = 0 , 5 do
			PEDP = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID())
			object_hash = 1043035044
			            		    	STREAMING.REQUEST_MODEL(object_hash)
	      while not STREAMING.HAS_MODEL_LOADED(object_hash) do
		       util.yield()
	         end
			PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),object_hash)
			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PEDP, 0,0,500, 0, 0, 1)
            WEAPON.GIVE_DELAYED_WEAPON_TO_PED(PEDP, 0xFBAB5776, 1000, false)
			util.yield(1000)
			for i = 0 , 20 do
			PED.FORCE_PED_TO_OPEN_PARACHUTE(PEDP)
			end
			util.yield(1000)
			menu.trigger_commands("tplsia")
			bush_hash = 1585741317
			            		    	STREAMING.REQUEST_MODEL(bush_hash)
	      while not STREAMING.HAS_MODEL_LOADED(bush_hash) do
		       util.yield()
	         end
		    PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),bush_hash)
			ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PEDP, 0,0,500, 0, 0, 1)
            WEAPON.GIVE_DELAYED_WEAPON_TO_PED(PEDP, 0xFBAB5776, 1000, false)
           	util.yield(1000)
			for i = 0 , 20 do
			PED.FORCE_PED_TO_OPEN_PARACHUTE(PEDP)
			end
			util.yield(1000)
			menu.trigger_commands("tplsia")
			end
end)

	


	

	








	
	
end







local InitialPlayersList = players.list(true, true, true) -- Obtain list of players from Stand API
for i=1, #InitialPlayersList do -- Loop through the received player list
	GenerateFeatures(InitialPlayersList[i]) -- Generate Features for every player
end
InitialPlayersList = nil -- Discard the table as it is no longer needed (optional; most beginners will not do this)

players.on_join(function(pid)
	while true do
		if joining then
			notification(PLAYER.GET_PLAYER_NAME(pid) .. " joined", black)
		end
		util.yield()
	end
end)

players.on_join(GenerateFeatures)



local last_call_time = util.current_time_millis()
local redo_boost = false

util.create_thread(function()
	while true do
		if (chaos) then
			vehicles = entities.get_all_vehicles_as_handles()
			cur_players = players.list(true,true,true)
			for k,v in pairs(vehicles) do
				driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(v, -1)
				if(PED.GET_PED_TYPE(driver) > 4) then
					VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(v, false, true)
					VEHICLE.SET_VEHICLE_FORWARD_SPEED(v, speed)
					VEHICLE.SET_VEHICLE_GRAVITY(v, gravity)
				end
			end
		end
		util.yield()
	end
end)


util.on_stop(function()
	notification("Ok", black)
end)