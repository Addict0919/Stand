require("Rimuru.tables.weatherTypes")

local world = func.add_feature("World", "parent", 0)
local weather = func.add_feature("Weather", "parent", world.id)

menu.create_thread(function()
  for index, var in ipairs(weatherTypes) do 
      local feat = func.add_feature(var, "autoaction_value_f", weather.id, function(f)
          local weather = native.call(0x711327CD09C8F162):__tointeger()--GET_NEXT_WEATHER_TYPE_HASH_NAME

          for region=0, 1 do
              for frame=0,12 do
                  timecycle.set_timecycle_keyframe_var(weather, region, frame, var, f.value);
              end
          end
      end)
      feat.mod = 0.01
      feat.min = 0.0
      feat.max = 10.0
      feat.value = 0.1
  end
end)

local trainOpt = func.add_feature("Train", "parent", world.id)

func.add_feature("Hijack Train", "action", trainOpt.id, function(f)
	local train = get_closest_train()
	if train ~= 0 and not ped.is_ped_in_any_vehicle(PLAYER.PLAYER_PED_ID()) then
		entity.delete_entity(vehicle.get_ped_in_vehicle_seat(train, -1))
		ped.set_ped_into_vehicle(player.get_player_ped(player.player_id()), train, -1)
	end
	if train == 0 then
		func.notification("Could not find any train nearby")
	end
end)

local trainSpeed = 10.0
local trainMaxSpeed = 300.0
local trainMax = func.add_feature("Train Max Speed", "autoaction_value_f", trainOpt.id, function(f)
	trainMaxSpeed = f.value
end)
trainMax.max = 9999.0
trainMax.min = 0
trainMax.mod = 2.0
trainMax.value = trainMaxSpeed

func.add_feature("Drive Train", "toggle", trainOpt.id, function(f)
	while f.on do

		local speed = entity.get_entity_speed(ped.get_vehicle_ped_is_using(PLAYER.PLAYER_PED_ID()))*2.236936
		
		ui.set_text_scale(0.35)
		ui.set_text_font(0)
		ui.set_text_centre(0)
		ui.set_text_color(255, 255, 255, 255)
		ui.set_text_outline(true)
		ui.draw_text(math.floor(speed).." mph", v2(0.5, 0.95)) 

		func.do_key(500, 0x57, true, function()
			if trainSpeed < trainMaxSpeed then
				trainSpeed = trainSpeed + 1.0
			end
		end)

		func.do_key(500, 0x53, true, function()
			if trainSpeed > -trainMaxSpeed then
				trainSpeed = trainSpeed - 1.0
			end
		end)
		
		VEHICLE.SET_TRAIN_SPEED(get_closest_train(), trainSpeed)
		VEHICLE.SET_TRAIN_CRUISE_SPEED(get_closest_train(), trainSpeed)
		system.wait(0)
	end
end)

local trainTrack = func.add_feature("Change Track", "value_i", trainOpt.id, function(f)
	while f.on do
		VEHICLE.SWITCH_TRAIN_TRACK(f.value, true)
		system.wait(0)
	end
end)
trainTrack.max = 12
trainTrack.min = 0
trainTrack.mod = 1
trainTrack.value = 0


func.add_feature("De-Rail Train", "toggle", trainOpt.id, function(f)
	local train = get_closest_train()
	if train ~= 0 then
		VEHICLE.SET_RENDER_TRAIN_AS_DERAILED(train, f.on)
	end
end)

func.add_feature("Delete Train", "action", trainOpt.id, function(f)
	local train = get_closest_train()
	if train ~= 0 then
		entity.delete_entity(train)
	end
end)

func.add_feature("Delete All Trains", "action", trainOpt.id, function(f)
	VEHICLE.DELETE_ALL_TRAINS()
end)
----------


func.add_feature("Party Traffic Lights", "toggle", world.id, function(f)
	while f.on do
		local obs = object.get_all_objects()
		for i=1, #obs do
			if obs[i] == 1043035044 or 862871082 or 3639322914 then
				ENTITY.SET_ENTITY_TRAFFICLIGHT_OVERRIDE(obs[i], math.random(0, 2))
			end
		end
		system.wait(30)
	end
end)