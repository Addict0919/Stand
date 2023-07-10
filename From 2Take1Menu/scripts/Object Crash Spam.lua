menu.add_player_feature("BowlingBallSpam", "toggle", 0, function(feat, pid)
	if feat.on then
		for i = 1, 9999 do
		object.create_world_object(3731636222, player.get_player_coords(pid), true, false)
		object.create_world_object(3731636222, player.get_player_coords(pid), true, false)
		object.create_world_object(3731636222, player.get_player_coords(pid), true, false)
		object.create_world_object(3731636222, player.get_player_coords(pid), true, false)
		object.create_world_object(3731636222, player.get_player_coords(pid), true, false)
		end
	end
end)

menu.add_player_feature("Xmas Tree Spam", "toggle", 0, function(feat, pid)
	if feat.on then
		for i = 1, 9999 do
		object.create_world_object(2527806139, player.get_player_coords(pid), true, false)
		object.create_world_object(2527806139, player.get_player_coords(pid), true, false)
		object.create_world_object(2527806139, player.get_player_coords(pid), true, false)
		object.create_world_object(2527806139, player.get_player_coords(pid), true, false)
		object.create_world_object(2527806139, player.get_player_coords(pid), true, false)
		end
	end
end)