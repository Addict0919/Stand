local colorchanger = func.add_feature("Color Changer", "action_value_str", 0, function(f, data)
	local veh = player.get_player_vehicle(player.player_id())
	if veh ~= 0 then
		vehicle.set_vehicle_colors(veh, f.value, f.value)
		data.originalp, data.originals = f.value, f.value
		func.notification("Applied color")
	end
end)
colorchanger.hl_func = function(f, data)
	local veh = player.get_player_vehicle(player.player_id())
	if veh ~= 0 then
		data.originalp, data.originals = vehicle.get_vehicle_primary_color(veh), vehicle.get_vehicle_secondary_color(veh)
		local cachedfvalue
		while f.is_highlighted do
			if cachedfvalue ~= f.value then
				vehicle.set_vehicle_colors(veh, f.value, f.value)
				cachedfvalue = f.value
			end
			system.wait(0)
		end
		if data.originalp and data.originals then
			vehicle.set_vehicle_colors(veh, data.originalp, data.originals)
		end
	end
end
colorchanger.data = {}
colorchanger:set_str_data({
	"Metallic Black",
	"Metallic Graphite Black",
	"Metallic Black Steal",
	"Metallic Dark Silver",
	"Metallic Silver",
	"Metallic Blue Silver",
	"Metallic Steel Gray",
	"Metallic Shadow Silver",
	"Metallic Stone Silver",
	"Metallic Midnight Silver",
	"Metallic Gun Metal",
	"Metallic Anthracite Grey",
	"Matte Black",
	"Matte Gray",
	"Matte Light Grey",
	"Util Black",
	"Util Black Poly",
	"Util Dark silver",
	"Util Silver",
	"Util Gun Metal",
	"Util Shadow Silver",
	"Worn Black",
	"Worn Graphite",
	"Worn Silver Grey",
	"Worn Silver",
	"Worn Blue Silver",
	"Worn Shadow Silver",
	"Metallic Red",
	"Metallic Torino Red",
	"Metallic Formula Red",
	"Metallic Blaze Red",
	"Metallic Graceful Red",
	"Metallic Garnet Red",
	"Metallic Desert Red",
	"Metallic Cabernet Red",
	"Metallic Candy Red",
	"Metallic Sunrise Orange",
	"Metallic Classic Gold",
	"Metallic Orange",
	"Matte Red",
	"Matte Dark Red",
	"Matte Orange",
	"Matte Yellow",
	"Util Red",
	"Util Bright Red",
	"Util Garnet Red",
	"Worn Red",
	"Worn Golden Red",
	"Worn Dark Red",
	"Metallic Dark Green",
	"Metallic Racing Green",
	"Metallic Sea Green",
	"Metallic Olive Green",
	"Metallic Green",
	"Metallic Gasoline Blue Green",
	"Matte Lime Green",
	"Util Dark Green",
	"Util Green",
	"Worn Dark Green",
	"Worn Green",
	"Worn Sea Wash",
	"Metallic Midnight Blue",
	"Metallic Dark Blue",
	"Metallic Saxony Blue",
	"Metallic Blue",
	"Metallic Mariner Blue",
	"Metallic Harbor Blue",
	"Metallic Diamond Blue",
	"Metallic Surf Blue",
	"Metallic Nautical Blue",
	"Metallic Bright Blue",
	"Metallic Purple Blue",
	"Metallic Spinnaker Blue",
	"Metallic Ultra Blue",
	"Metallic Bright Blue",
	"Util Dark Blue",
	"Util Midnight Blue",
	"Util Blue",
	"Util Sea Foam Blue",
	"Util Lightning blue",
	"Util Maui Blue Poly",
	"Util Bright Blue",
	"Matte Dark Blue",
	"Matte Blue",
	"Matte Midnight Blue",
	"Worn Dark blue",
	"Worn Blue",
	"Worn Light blue",
	"Metallic Taxi Yellow",
	"Metallic Race Yellow",
	"Metallic Bronze",
	"Metallic Yellow Bird",
	"Metallic Lime",
	"Metallic Champagne",
	"Metallic Pueblo Beige",
	"Metallic Dark Ivory",
	"Metallic Choco Brown",
	"Metallic Golden Brown",
	"Metallic Light Brown",
	"Metallic Straw Beige",
	"Metallic Moss Brown",
	"Metallic Biston Brown",
	"Metallic Beechwood",
	"Metallic Dark Beechwood",
	"Metallic Choco Orange",
	"Metallic Beach Sand",
	"Metallic Sun Bleeched Sand",
	"Metallic Cream",
	"Util Brown",
	"Util Medium Brown",
	"Util Light Brown",
	"Metallic White",
	"Metallic Frost White",
	"Worn Honey Beige",
	"Worn Brown",
	"Worn Dark Brown",
	"Worn straw beige",
	"Brushed Steel",
	"Brushed Black steel",
	"Brushed Aluminium",
	"Chrome",
	"Worn Off White",
	"Util Off White",
	"Worn Orange",
	"Worn Light Orange",
	"Metallic Securicor Green",
	"Worn Taxi Yellow",
	"police car blue",
	"Matte Green",
	"Matte Brown",
	"Worn Orange",
	"Matte White",
	"Worn White",
	"Worn Olive Army Green",
	"Pure White",
	"Hot Pink",
	"Salmon pink",
	"Metallic Vermillion Pink",
	"Orange",
	"Green",
	"Blue",
	"Mettalic Black Blue",
	"Metallic Black Purple",
	"Metallic Black Red",
	"hunter green",
	"Metallic Purple",
	"Metaillic V Dark Blue",
	"MODSHOP BLACK1",
	"Matte Purple",
	"Matte Dark Purple",
	"Metallic Lava Red",
	"Matte Forest Green",
	"Matte Olive Drab",
	"Matte Desert Brown",
	"Matte Desert Tan",
	"Matte Foilage Green",
	"DEFAULT ALLOY COLOR",
	"Epsilon Blue",
	"Pure Gold",
	"Brushed Gold"
})
