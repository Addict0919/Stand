require("natives-1614644776")   

menu.divider(menu.my_root(), "Free Prize Ride")

menu.action(menu.my_root(), "Char Slot 1 - Complete Prize Ride Challenge", {}, "", function(on_click)
	STATS.STAT_SET_BOOL(MISC.GET_HASH_KEY("MP0_CARMEET_PV_CHLLGE_CMPLT"), true, true);
	util.toast("Done. Gave prize to char slot 1")
end)

menu.action(menu.my_root(), "Char Slot 2 - Complete Prize Ride Challenge", {}, "", function(on_click)
    STATS.STAT_SET_BOOL(MISC.GET_HASH_KEY("MP1_CARMEET_PV_CHLLGE_CMPLT"), true, true);
    util.toast("Done. Gave prize to char slot 2")
end)

menu.action(menu.my_root(), "Char Slot 1 - Reset Prize Ride Challenge", {}, "", function(on_click)
	STATS.STAT_SET_BOOL(MISC.GET_HASH_KEY("MP0_CARMEET_PV_CLMED"), false, true);
	util.toast("Done. Reset prize to char slot 1")
end)

menu.action(menu.my_root(), "Char Slot 2 - Reset Prize Ride Challenge", {}, "", function(on_click)
    STATS.STAT_SET_BOOL(MISC.GET_HASH_KEY("MP1_CARMEET_PV_CLMED"), false, true);
    util.toast("Done. Reset prize to char slot 2")
end)

menu.divider(menu.my_root(), "Set Prize Car ID")

menu.action(menu.my_root(), "Char Slot 1 - Set ID", {"setpvidchar1"}, "", function(click_type)
	menu.show_command_box_click_based(click_type, "setpvidchar1 ")
end, function(car_id)
	STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_CARMEET_PV_ID"), car_id, true);
	util.toast("Done. Set prize car id to " .. tostring(car_id) .. " on char slot 1")
end, "setpvidchar1 [id]")

menu.action(menu.my_root(), "Char Slot 2 - Set ID", {"setpvidchar2"}, "", function(click_type)
	menu.show_command_box_click_based(click_type, "setpvidchar2 ")
end, function(car_id)
	STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_CARMEET_PV_ID"), car_id, true);
	util.toast("Done. Set prize car id to " .. tostring(car_id) .. " on char slot 1")
end, "setpvidchar2 [id]")

menu.divider(menu.my_root(), "Get Current Prize Car ID")

menu.action(menu.my_root(), "Get The Current Prize Ride Car ID", {}, "", function(on_click)
	local id_ptr = memory.alloc()
    STATS.STAT_GET_INT(MISC.GET_HASH_KEY("MP0_CARMEET_PV_ID"), id_ptr, -1);
    local id = memory.read_int(id_ptr)
    util.toast("Current ID: " .. tostring(id))
    memory.free(id_ptr)
end)

while true do 
	util.yield()  
end