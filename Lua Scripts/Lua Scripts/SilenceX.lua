local c = {} --  base short api
local a = {} --  feature table


 --  base short api
c.df = menu.add_feature
c.wait = system.wait
c.ped = player.get_player_ped
c.me = player.player_id
c.pdf = menu.add_player_feature
c.sR = streaming.request_model
c.time = utils.time_ms





menu.notify("Are sure you can handle the humbling process?", "Humbler Processer", 20, ff0000)
menu.notify("Dont Spectate when using options and dont be near player teleport across map", "Humbler Processer", 20, ff0000)


a.opption = c.pdf("Enter SkidLand","parent",0).id
local Crashs = menu.add_player_feature("Process Enders", "parent",a.opption).id




local function request_model(h, t)
			if not h then 
				return 
			end
			if not streaming.has_model_loaded(h) then
   				c.sR(h)
    			local time = c.time() + t
    			while not streaming.has_model_loaded(h) and time > c.time() do
       				c.wait(5)
   				end
			end
			return streaming.has_model_loaded(h)
		end


local function Cped(type, hash, coords, dir)
			request_model(hash, 300)
			local ped = ped.create_ped(type, hash, coords, dir, true, false)
			c.sR(hash)
			return ped
		end
		
		

bijiaodaxiao11= c.pdf("LoveFinder Crash","action",Crashs,function(k,pid)
menu.notify("LoveFinder Is currently finding your lover!", "LoveFinder Crash", 10, ff0000)
for i = 0 , 40 do 
ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
pos = player.get_player_coords(pid)
npc = Cped(26, 0xC0937202,pos, 0)
c.wait(0)
end
for i = 0 , 30 do 
ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
pos = player.get_player_coords(pid)
npc = Cped(26, 0x6D1E15F7,pos, 0)
c.wait(0)
end
for i = 0 , 40 do 
ped.clear_ped_tasks_immediately(player.get_player_ped(pid))
pos = player.get_player_coords(pid)
npc = Cped(26, 0x8D67EE7D,pos, 0)
c.wait(0)
end	
menu.notify("LoveFinder Found your long lost lover!", "LoverFinder Crash", 10, ff0000)
end)


local req = {}
local watcher = {}
req.ctrl = function(e, t)
    if entity.is_an_entity(e) then
        if not network.has_control_of_entity(e) then
            network.request_control_of_entity(e)
            t = t or 25
            local time = utils.time_ms() + t
            while entity.is_an_entity(e) and not network.has_control_of_entity(e) do
                system.wait(0)
                network.request_control_of_entity(e)
                if time < utils.time_ms() then
                    return false
                end
            end
        end
        return network.has_control_of_entity(e)
    end
    return false
end

local function s_coords(i, p)
    req.ctrl(i)
    entity.set_entity_velocity(i, v3())
    entity.set_entity_coords_no_offset(i, p)
end

function removes()
	system.wait(5000)
	remove = object.get_all_objects()
		for i = 1, #remove do
			local X = remove[i]
			req.ctrl(X, 250)
			entity.set_entity_velocity(X, v3())
			s_coords(X, v3(8000, 8000, -1000))
			entity.delete_entity(X)
			system.wait(0)
		end
	menu.notify("World Crash Object has been cleaned", "", 10, 2)
end
	
watcher.event = nil

menu.add_player_feature("Dont use fixing soon", "action", Crashs, function(playerfeat, pid)
	if watcher.event == nil then 
		entity.freeze_entity(player.get_player_ped(pid), true)
		object.create_world_object(2514224946, player.get_player_coords(pid), true, false)
		menu.notify("Crash Sent, Do Not Look At The Player", "", 15, 2)

		watcher.event = event.add_event_listener('player_leave', removes())
		if watcher.event then
			event.remove_event_listener('player_leave', watcher.event)	
		end
	end
end)

menu.add_player_feature("Love Letter Crash", "action",Crashs, function(feat, pid)
menu.notify("Your LoveLetter is being sent", "LoveLetter Crash", 10, ff0000)
    local function createped(type, hash, pos, dir)
        streaming.request_model(hash)
        while not streaming.has_model_loaded(hash) do
        system.wait(10)
        end
        local ped = ped.create_ped(type, hash, pos, dir, true, false)
            streaming.set_model_as_no_longer_needed(hash)
            return ped
        end
pos = player.get_player_coords(pid)
local pedp = player.get_player_ped(pid)
pos.z = pos.z + 0.6

npc1 = createped(26,0x917ED459,pos,0)
entity.attach_entity_to_entity(npc1,pedp, 0, v3(0.30,0,0.0),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc1, true)
local checkcount = 0
network.request_control_of_entity(npc1)
  while not network.has_control_of_entity(npc1) do
    system.wait(15)
    checkcount = checkcount + 1
    if checkcount > 10 then end
  end
   system.wait(500)
entity.delete_entity(npc1)

npc2 = createped(26,0xD2B27EC1,pos,0)
entity.attach_entity_to_entity(npc2,pedp, 0, v3(0.30,0,0.0),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc2, true)
local checkcount = 0
network.request_control_of_entity(npc2)
  while not network.has_control_of_entity(npc2) do
    system.wait(5)
    checkcount = checkcount + 1
    if checkcount > 10 then end
  end
   system.wait(2000)
entity.delete_entity(npc2)

npc3 = createped(26,0x56D38F95,pos,0)
entity.attach_entity_to_entity(npc3,pedp, 0, v3(0.10,0,0.0),v3(0.0,0,0.0), true, true, false, 0, true)
entity.freeze_entity(npc3, true)
local checkcount = 0
network.request_control_of_entity(npc3)
  while not network.has_control_of_entity(npc3) do
    system.wait(10)
    checkcount = checkcount + 1
    if checkcount > 10 then end
  end
    system.wait(20)
entity.delete_entity(npc3)
menu.notify("Your LoveLetter has been delivered", "LoverLetter Crash", 10, ff0000)
end)


local Lag = menu.add_player_feature("AntiLag?", "parent", a.opption).id
		
menu.add_player_feature("Lagv1", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0x149BD32A

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(90)
end


local tableOfVehicles = {}
for i = 1, 832 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(2)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Lagv2 op", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0x82CAC433

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(423)
end


local tableOfVehicles = {}
for i = 1, 850 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(2)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Lagv3", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
	if feat.on then
		local pos = player.get_player_coords(pid)
		local veh_hash = 0x41D149AA

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(50)
end

local tableOfVehicles = {}
for i = 1, 430 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(920)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)



		end
	return HANDLER_CONTINUE
end)

menu.add_player_feature("Lagv4 ", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0xC58DA34A

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(90)
end


local tableOfVehicles = {}
for i = 1, 832 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(920)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Lagv5 combo", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0xC6C3242D

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(90)
end


local tableOfVehicles = {}
for i = 1, 95 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(920)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Lagv6", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0x4008EABB

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(50)
end


local tableOfVehicles = {}
for i = 1, 105 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(600)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Lagv7", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0xD138A6BB

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(75)
end


local tableOfVehicles = {}
for i = 1, 250 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(40)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Lagv8", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0x829A3C44

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(452)
end


local tableOfVehicles = {}
for i = 1, 130 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(284)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Lagv9 Super fast", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0x18606535

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(50)
end


local tableOfVehicles = {}
for i = 1, 10000 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.x, true, false)
end
system.wait(0)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Fuck His eyes", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0x94DA98EF

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(200)
end


local tableOfVehicles = {}
for i = 1, 1 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.x, true, false)
end
system.wait(60)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Love Letter Ragdoll", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0x11CBC051

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(300)
end


local tableOfVehicles = {}
for i = 1, 35 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.x, true, false)
end
system.wait(300)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("Thruster OP Lag non visable", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
	if feat.on then
		local pos = player.get_player_coords(pid)
		local veh_hash = 0x58CDAF30

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(50)
end

local tableOfVehicles = {}
for i = 1, 430 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
end
system.wait(920)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)



		end
	return HANDLER_CONTINUE
end)

menu.add_player_feature("Naughty basic verison ", "toggle", Lag, function(feat, pid)                                                                                                                                                                                                                                                           
    if feat.on then
        local pos = player.get_player_coords(pid)
        local veh_hash = 0xEF813606

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(500)
end


local tableOfVehicles = {}
for i = 1, 85 do
  tableOfVehicles[#tableOfVehicles + 1] = vehicle.create_vehicle(veh_hash, pos, pos.x, true, false)
end
system.wait(500)
for i = 1, #tableOfVehicles do
  entity.delete_entity(tableOfVehicles[i])
end
tableOfVehicles = {}

streaming.set_model_as_no_longer_needed(veh_hash)


        end
    return HANDLER_CONTINUE
end)

menu.add_player_feature("WorldFucker", "toggle", Lag, function(feat, pid)
	if feat.on then
		local pos = player.get_player_coords(pid)
		local veh_hash = 0x58CDAF30

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(10)
end


veh_spawn = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn1 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn2 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn3 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn4 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn5 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn6 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn7 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn8 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn9 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn10 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn11 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn12 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn13 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn14 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn15 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn16 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn17 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn18 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn19 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn20 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn21 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn22 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn23 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn24 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn25 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn1 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn2 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn3 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn4 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn5 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn6 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn7 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn8 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn9 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn10 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn11 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn12 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn13 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn14 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn15 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn16 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn17 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn18 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn19 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn20 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn21 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn22 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn23 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn24 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn25 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn1 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn2 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn3 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn4 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn5 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn6 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn7 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn8 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn9 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn10 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn11 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn12 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn13 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn14 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn15 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn16 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn17 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn18 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn19 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn20 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn21 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn22 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn23 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn24 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn25 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
entity.set_entity_visible(veh_spawn, false)
entity.set_entity_visible(veh_spawn1, false)
entity.set_entity_visible(veh_spawn2, false)
entity.set_entity_visible(veh_spawn3, false)
entity.set_entity_visible(veh_spawn4, false)
entity.set_entity_visible(veh_spawn5, false)
entity.set_entity_visible(veh_spawn6, false)
entity.set_entity_visible(veh_spawn7, false)
entity.set_entity_visible(veh_spawn8, false)
entity.set_entity_visible(veh_spawn9, false)
entity.set_entity_visible(veh_spawn10, false)
entity.set_entity_visible(veh_spawn11, false)
entity.set_entity_visible(veh_spawn12, false)
entity.set_entity_visible(veh_spawn13, false)
entity.set_entity_visible(veh_spawn14, false)
entity.set_entity_visible(veh_spawn15, false)
entity.set_entity_visible(veh_spawn16, false)
entity.set_entity_visible(veh_spawn17, false)
entity.set_entity_visible(veh_spawn18, false)
entity.set_entity_visible(veh_spawn19, false)
entity.set_entity_visible(veh_spawn20, false)
entity.set_entity_visible(veh_spawn21, false)
entity.set_entity_visible(veh_spawn22, false)
entity.set_entity_visible(veh_spawn23, false)
entity.set_entity_visible(veh_spawn24, false)
entity.set_entity_visible(veh_spawn25, false)
entity.set_entity_visible(v2_veh_spawn, false)
entity.set_entity_visible(v2_veh_spawn1, false)
entity.set_entity_visible(v2_veh_spawn2, false)
entity.set_entity_visible(v2_veh_spawn3, false)
entity.set_entity_visible(v2_veh_spawn4, false)
entity.set_entity_visible(v2_veh_spawn5, false)
entity.set_entity_visible(v2_veh_spawn6, false)
entity.set_entity_visible(v2_veh_spawn7, false)
entity.set_entity_visible(v2_veh_spawn8, false)
entity.set_entity_visible(v2_veh_spawn9, false)
entity.set_entity_visible(v2_veh_spawn10, false)
entity.set_entity_visible(v2_veh_spawn11, false)
entity.set_entity_visible(v2_veh_spawn12, false)
entity.set_entity_visible(v2_veh_spawn13, false)
entity.set_entity_visible(v2_veh_spawn14, false)
entity.set_entity_visible(v2_veh_spawn15, false)
entity.set_entity_visible(v2_veh_spawn16, false)
entity.set_entity_visible(v2_veh_spawn17, false)
entity.set_entity_visible(v2_veh_spawn18, false)
entity.set_entity_visible(v2_veh_spawn19, false)
entity.set_entity_visible(v2_veh_spawn20, false)
entity.set_entity_visible(v2_veh_spawn21, false)
entity.set_entity_visible(v2_veh_spawn22, false)
entity.set_entity_visible(v2_veh_spawn23, false)
entity.set_entity_visible(v2_veh_spawn24, false)
entity.set_entity_visible(v2_veh_spawn25, false)
entity.set_entity_visible(v3_veh_spawn, false)
entity.set_entity_visible(v3_veh_spawn1, false)
entity.set_entity_visible(v3_veh_spawn2, false)
entity.set_entity_visible(v3_veh_spawn3, false)
entity.set_entity_visible(v3_veh_spawn4, false)
entity.set_entity_visible(v3_veh_spawn5, false)
entity.set_entity_visible(v3_veh_spawn6, false)
entity.set_entity_visible(v3_veh_spawn7, false)
entity.set_entity_visible(v3_veh_spawn8, false)
entity.set_entity_visible(v3_veh_spawn9, false)
entity.set_entity_visible(v3_veh_spawn10, false)
entity.set_entity_visible(v3_veh_spawn11, false)
entity.set_entity_visible(v3_veh_spawn12, false)
entity.set_entity_visible(v3_veh_spawn13, false)
entity.set_entity_visible(v3_veh_spawn14, false)
entity.set_entity_visible(v3_veh_spawn15, false)
entity.set_entity_visible(v3_veh_spawn16, false)
entity.set_entity_visible(v3_veh_spawn17, false)
entity.set_entity_visible(v3_veh_spawn18, false)
entity.set_entity_visible(v3_veh_spawn19, false)
entity.set_entity_visible(v3_veh_spawn20, false)
entity.set_entity_visible(v3_veh_spawn21, false)
entity.set_entity_visible(v3_veh_spawn22, false)
entity.set_entity_visible(v3_veh_spawn23, false)
entity.set_entity_visible(v3_veh_spawn24, false)
entity.set_entity_visible(v3_veh_spawn25, false)
system.wait(1000)
entity.delete_entity(veh_spawn)
	entity.delete_entity(veh_spawn1)
	entity.delete_entity(veh_spawn2)
	entity.delete_entity(veh_spawn3)
	entity.delete_entity(veh_spawn4)
	entity.delete_entity(veh_spawn5)
	entity.delete_entity(veh_spawn6)
	entity.delete_entity(veh_spawn7)
	entity.delete_entity(veh_spawn8)
	entity.delete_entity(veh_spawn9)
	entity.delete_entity(veh_spawn10)
	entity.delete_entity(veh_spawn11)
	entity.delete_entity(veh_spawn12)
	entity.delete_entity(veh_spawn13)
	entity.delete_entity(veh_spawn14)
	entity.delete_entity(veh_spawn15)
	entity.delete_entity(veh_spawn16)
	entity.delete_entity(veh_spawn17)
	entity.delete_entity(veh_spawn18)
	entity.delete_entity(veh_spawn19)
	entity.delete_entity(veh_spawn20)
			  entity.delete_entity(veh_spawn21)
			  entity.delete_entity(veh_spawn22)
			  entity.delete_entity(veh_spawn23)
			  entity.delete_entity(veh_spawn24)
			  entity.delete_entity(veh_spawn25)
			  entity.delete_entity(v2_veh_spawn)
	entity.delete_entity(v2_veh_spawn1)
	entity.delete_entity(v2_veh_spawn2)
	entity.delete_entity(v2_veh_spawn3)
	entity.delete_entity(v2_veh_spawn4)
	entity.delete_entity(v2_veh_spawn5)
	entity.delete_entity(v2_veh_spawn6)
	entity.delete_entity(v2_veh_spawn7)
	entity.delete_entity(v2_veh_spawn8)
	entity.delete_entity(v2_veh_spawn9)
	entity.delete_entity(v2_veh_spawn10)
	entity.delete_entity(v2_veh_spawn11)
	entity.delete_entity(v2_veh_spawn12)
	entity.delete_entity(v2_veh_spawn13)
	entity.delete_entity(v2_veh_spawn14)
	entity.delete_entity(v2_veh_spawn15)
	entity.delete_entity(v2_veh_spawn16)
	entity.delete_entity(v2_veh_spawn17)
	entity.delete_entity(v2_veh_spawn18)
	entity.delete_entity(v2_veh_spawn19)
	entity.delete_entity(v2_veh_spawn20)
			  entity.delete_entity(v2_veh_spawn21)
			  entity.delete_entity(v2_veh_spawn22)
			  entity.delete_entity(v2_veh_spawn23)
			  entity.delete_entity(v2_veh_spawn24)
			  entity.delete_entity(v2_veh_spawn25)
			  entity.delete_entity(v3_veh_spawn)
	entity.delete_entity(v3_veh_spawn1)
	entity.delete_entity(v3_veh_spawn2)
	entity.delete_entity(v3_veh_spawn3)
	entity.delete_entity(v3_veh_spawn4)
	entity.delete_entity(v3_veh_spawn5)
	entity.delete_entity(v3_veh_spawn6)
	entity.delete_entity(v3_veh_spawn7)
	entity.delete_entity(v3_veh_spawn8)
	entity.delete_entity(v3_veh_spawn9)
	entity.delete_entity(v3_veh_spawn10)
	entity.delete_entity(v3_veh_spawn11)
	entity.delete_entity(v3_veh_spawn12)
	entity.delete_entity(v3_veh_spawn13)
	entity.delete_entity(v3_veh_spawn14)
	entity.delete_entity(v3_veh_spawn15)
	entity.delete_entity(v3_veh_spawn16)
	entity.delete_entity(v3_veh_spawn17)
	entity.delete_entity(v3_veh_spawn18)
	entity.delete_entity(v3_veh_spawn19)
	entity.delete_entity(v3_veh_spawn20)
	entity.delete_entity(v3_veh_spawn21)
	entity.delete_entity(v3_veh_spawn22)
	entity.delete_entity(v3_veh_spawn23)
	entity.delete_entity(v3_veh_spawn24)
	entity.delete_entity(v3_veh_spawn25)





		  streaming.set_model_as_no_longer_needed(veh_hash)

end
return HANDLER_CONTINUE
end)

menu.add_player_feature("naughty Humbler", "toggle", Lag, function(feat, pid)
	if feat.on then
		local pos = player.get_player_coords(pid)
		local veh_hash = 0xEF813606

streaming.request_model(veh_hash)
while (not streaming.has_model_loaded(veh_hash)) do
system.wait(10)
end


veh_spawn = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn1 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn2 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn3 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn4 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn5 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn6 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn7 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn8 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn9 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn10 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn11 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn12 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn13 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn14 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn15 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn16 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn17 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn18 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn19 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn20 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn21 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn22 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn23 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn24 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
veh_spawn25 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn1 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn2 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn3 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn4 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn5 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn6 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn7 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn8 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn9 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn10 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn11 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn12 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn13 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn14 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn15 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn16 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn17 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn18 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn19 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn20 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn21 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn22 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn23 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn24 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v2_veh_spawn25 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn1 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn2 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn3 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn4 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn5 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn6 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn7 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn8 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn9 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn10 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn11 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn12 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn13 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn14 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn15 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn16 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn17 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn18 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn19 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn20 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn21 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn22 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn23 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn24 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
v3_veh_spawn25 = vehicle.create_vehicle(veh_hash, pos, pos.z, true, false)
entity.set_entity_visible(veh_spawn, false)
entity.set_entity_visible(veh_spawn1, false)
entity.set_entity_visible(veh_spawn2, false)
entity.set_entity_visible(veh_spawn3, false)
entity.set_entity_visible(veh_spawn4, false)
entity.set_entity_visible(veh_spawn5, false)
entity.set_entity_visible(veh_spawn6, false)
entity.set_entity_visible(veh_spawn7, false)
entity.set_entity_visible(veh_spawn8, false)
entity.set_entity_visible(veh_spawn9, false)
entity.set_entity_visible(veh_spawn10, false)
entity.set_entity_visible(veh_spawn11, false)
entity.set_entity_visible(veh_spawn12, false)
entity.set_entity_visible(veh_spawn13, false)
entity.set_entity_visible(veh_spawn14, false)
entity.set_entity_visible(veh_spawn15, false)
entity.set_entity_visible(veh_spawn16, false)
entity.set_entity_visible(veh_spawn17, false)
entity.set_entity_visible(veh_spawn18, false)
entity.set_entity_visible(veh_spawn19, false)
entity.set_entity_visible(veh_spawn20, false)
entity.set_entity_visible(veh_spawn21, false)
entity.set_entity_visible(veh_spawn22, false)
entity.set_entity_visible(veh_spawn23, false)
entity.set_entity_visible(veh_spawn24, false)
entity.set_entity_visible(veh_spawn25, false)
entity.set_entity_visible(v2_veh_spawn, false)
entity.set_entity_visible(v2_veh_spawn1, false)
entity.set_entity_visible(v2_veh_spawn2, false)
entity.set_entity_visible(v2_veh_spawn3, false)
entity.set_entity_visible(v2_veh_spawn4, false)
entity.set_entity_visible(v2_veh_spawn5, false)
entity.set_entity_visible(v2_veh_spawn6, false)
entity.set_entity_visible(v2_veh_spawn7, false)
entity.set_entity_visible(v2_veh_spawn8, false)
entity.set_entity_visible(v2_veh_spawn9, false)
entity.set_entity_visible(v2_veh_spawn10, false)
entity.set_entity_visible(v2_veh_spawn11, false)
entity.set_entity_visible(v2_veh_spawn12, false)
entity.set_entity_visible(v2_veh_spawn13, false)
entity.set_entity_visible(v2_veh_spawn14, false)
entity.set_entity_visible(v2_veh_spawn15, false)
entity.set_entity_visible(v2_veh_spawn16, false)
entity.set_entity_visible(v2_veh_spawn17, false)
entity.set_entity_visible(v2_veh_spawn18, false)
entity.set_entity_visible(v2_veh_spawn19, false)
entity.set_entity_visible(v2_veh_spawn20, false)
entity.set_entity_visible(v2_veh_spawn21, false)
entity.set_entity_visible(v2_veh_spawn22, false)
entity.set_entity_visible(v2_veh_spawn23, false)
entity.set_entity_visible(v2_veh_spawn24, false)
entity.set_entity_visible(v2_veh_spawn25, false)
entity.set_entity_visible(v3_veh_spawn, false)
entity.set_entity_visible(v3_veh_spawn1, false)
entity.set_entity_visible(v3_veh_spawn2, false)
entity.set_entity_visible(v3_veh_spawn3, false)
entity.set_entity_visible(v3_veh_spawn4, false)
entity.set_entity_visible(v3_veh_spawn5, false)
entity.set_entity_visible(v3_veh_spawn6, false)
entity.set_entity_visible(v3_veh_spawn7, false)
entity.set_entity_visible(v3_veh_spawn8, false)
entity.set_entity_visible(v3_veh_spawn9, false)
entity.set_entity_visible(v3_veh_spawn10, false)
entity.set_entity_visible(v3_veh_spawn11, false)
entity.set_entity_visible(v3_veh_spawn12, false)
entity.set_entity_visible(v3_veh_spawn13, false)
entity.set_entity_visible(v3_veh_spawn14, false)
entity.set_entity_visible(v3_veh_spawn15, false)
entity.set_entity_visible(v3_veh_spawn16, false)
entity.set_entity_visible(v3_veh_spawn17, false)
entity.set_entity_visible(v3_veh_spawn18, false)
entity.set_entity_visible(v3_veh_spawn19, false)
entity.set_entity_visible(v3_veh_spawn20, false)
entity.set_entity_visible(v3_veh_spawn21, false)
entity.set_entity_visible(v3_veh_spawn22, false)
entity.set_entity_visible(v3_veh_spawn23, false)
entity.set_entity_visible(v3_veh_spawn24, false)
entity.set_entity_visible(v3_veh_spawn25, false)
system.wait(1000)
entity.delete_entity(veh_spawn)
	entity.delete_entity(veh_spawn1)
	entity.delete_entity(veh_spawn2)
	entity.delete_entity(veh_spawn3)
	entity.delete_entity(veh_spawn4)
	entity.delete_entity(veh_spawn5)
	entity.delete_entity(veh_spawn6)
	entity.delete_entity(veh_spawn7)
	entity.delete_entity(veh_spawn8)
	entity.delete_entity(veh_spawn9)
	entity.delete_entity(veh_spawn10)
	entity.delete_entity(veh_spawn11)
	entity.delete_entity(veh_spawn12)
	entity.delete_entity(veh_spawn13)
	entity.delete_entity(veh_spawn14)
	entity.delete_entity(veh_spawn15)
	entity.delete_entity(veh_spawn16)
	entity.delete_entity(veh_spawn17)
	entity.delete_entity(veh_spawn18)
	entity.delete_entity(veh_spawn19)
	entity.delete_entity(veh_spawn20)
			  entity.delete_entity(veh_spawn21)
			  entity.delete_entity(veh_spawn22)
			  entity.delete_entity(veh_spawn23)
			  entity.delete_entity(veh_spawn24)
			  entity.delete_entity(veh_spawn25)
			  entity.delete_entity(v2_veh_spawn)
	entity.delete_entity(v2_veh_spawn1)
	entity.delete_entity(v2_veh_spawn2)
	entity.delete_entity(v2_veh_spawn3)
	entity.delete_entity(v2_veh_spawn4)
	entity.delete_entity(v2_veh_spawn5)
	entity.delete_entity(v2_veh_spawn6)
	entity.delete_entity(v2_veh_spawn7)
	entity.delete_entity(v2_veh_spawn8)
	entity.delete_entity(v2_veh_spawn9)
	entity.delete_entity(v2_veh_spawn10)
	entity.delete_entity(v2_veh_spawn11)
	entity.delete_entity(v2_veh_spawn12)
	entity.delete_entity(v2_veh_spawn13)
	entity.delete_entity(v2_veh_spawn14)
	entity.delete_entity(v2_veh_spawn15)
	entity.delete_entity(v2_veh_spawn16)
	entity.delete_entity(v2_veh_spawn17)
	entity.delete_entity(v2_veh_spawn18)
	entity.delete_entity(v2_veh_spawn19)
	entity.delete_entity(v2_veh_spawn20)
			  entity.delete_entity(v2_veh_spawn21)
			  entity.delete_entity(v2_veh_spawn22)
			  entity.delete_entity(v2_veh_spawn23)
			  entity.delete_entity(v2_veh_spawn24)
			  entity.delete_entity(v2_veh_spawn25)
			  entity.delete_entity(v3_veh_spawn)
	entity.delete_entity(v3_veh_spawn1)
	entity.delete_entity(v3_veh_spawn2)
	entity.delete_entity(v3_veh_spawn3)
	entity.delete_entity(v3_veh_spawn4)
	entity.delete_entity(v3_veh_spawn5)
	entity.delete_entity(v3_veh_spawn6)
	entity.delete_entity(v3_veh_spawn7)
	entity.delete_entity(v3_veh_spawn8)
	entity.delete_entity(v3_veh_spawn9)
	entity.delete_entity(v3_veh_spawn10)
	entity.delete_entity(v3_veh_spawn11)
	entity.delete_entity(v3_veh_spawn12)
	entity.delete_entity(v3_veh_spawn13)
	entity.delete_entity(v3_veh_spawn14)
	entity.delete_entity(v3_veh_spawn15)
	entity.delete_entity(v3_veh_spawn16)
	entity.delete_entity(v3_veh_spawn17)
	entity.delete_entity(v3_veh_spawn18)
	entity.delete_entity(v3_veh_spawn19)
	entity.delete_entity(v3_veh_spawn20)
	entity.delete_entity(v3_veh_spawn21)
	entity.delete_entity(v3_veh_spawn22)
	entity.delete_entity(v3_veh_spawn23)
	entity.delete_entity(v3_veh_spawn24)
	entity.delete_entity(v3_veh_spawn25)





		  streaming.set_model_as_no_longer_needed(veh_hash)

end
return HANDLER_CONTINUE
end)

local sms = menu.add_player_feature("sms spammer", "parent", a.opption).id

menu.add_player_feature("Send Get Humbled Peasant", "toggle", sms, function(feat, pid)
if feat.on then
player.send_player_sms(pid, "Get Humbled Peasant")
end
return HANDLER_CONTINUE
end)

menu.add_player_feature("Send Enjoy Your Desktop wallpaper idiotic fool", "toggle", sms, function(feat, pid)
if feat.on then
player.send_player_sms(pid, "Enjoy Your Desktop wallpaper idiotic fool")
end
return HANDLER_CONTINUE
end)

menu.add_player_feature("Send i Am lord humbler the 2nd kneel before me and swear your loyalty", "toggle", sms, function(feat, pid)
if feat.on then
player.send_player_sms(pid, "i Am lord humbler the 2nd kneel before me and swear your loyalty")
end
return HANDLER_CONTINUE
end)

menu.add_player_feature("Send i Am Lord Humbler the 1st The terrible", "toggle", sms, function(feat, pid)
if feat.on then
player.send_player_sms(pid, "i Am Lord Humbler the 1st The terrible")
end
return HANDLER_CONTINUE
end)


    -- are you ready to skid the world?
    -- Special thanks to Kektram for making this!

-- Locals    
    local gottenModel_NameV
    local gottenModel_NameP
    local syswait = system.yield
    local rand = math.random
    local spawnAmountV = 20
    local spawnAmountP = 10
    local vradiusNUM = 5
    local vheightNUM = 5
    local pradiusNUM = 5
    local pheightNUM = 5
    local tableOfEntities = {}
    local cooldown

-- Functions
    local function request_model(model_name)
      local Hash = gameplay.get_hash_key(model_name)
      if streaming.is_model_valid(Hash) then
        streaming.request_model(Hash)
        while not streaming.has_model_loaded(Hash) do
            system.yield(0)
        end
        return true
      end
    end

    local function request_control(tableOfEntities1)
      for i, Entity in pairs(tableOfEntities1) do
        if not network.has_control_of_entity(Entity) then
          network.request_control_of_entity(Entity)
          local time = utils.time_ms() + 500
          while not network.has_control_of_entity(Entity) and time > utils.time_ms() do
            syswait(0)
          end
        end
        return true
      end
    end


    local function remove_entities(pid, tableOfEntities2)
      request_control(tableOfEntities2)
      while not request_control(tableOfEntities2) do
        syswait(0)
      end
      for i, Entity in pairs(tableOfEntities2) do
        entity.set_entity_coords_no_offset(Entity, v3(16000, 16000, -2000))
        syswait(10)
        entity.delete_entity(Entity)
      end
    end


    local function spawn_vehicle(pid, model_name)
      if not model_name then
        ui.notify_above_map("You Almost Broke The Function!\nGo set a model name", "~h~~r~C~y~o~o~n~g~g~b~r~r~a~y~t~o~s~g~!", 151)
        return HANDLER_POP
      end
      local Veh_Hash = gameplay.get_hash_key(model_name)
      if not spawnAmountV then
        spawnAmountV = 5
        ui.notify_above_map("~h~Invaild Spawn Amount\nsetting to 5", "~h~Error", 6)
      end
      if request_model(model_name) == true then
        if streaming.is_model_a_vehicle(Veh_Hash) then
          for i = 1, spawnAmountV do
              local car = vehicle.create_vehicle(Veh_Hash, player.get_player_coords(pid) + v3(rand(-vradiusNUM, vradiusNUM), rand(-vradiusNUM, vradiusNUM), vheightNUM), 0, true, false)
              entity.set_entity_as_no_longer_needed(car)
              syswait(10)
          end
            streaming.set_model_as_no_longer_needed(Veh_Hash)
            ui.notify_above_map("Successfully Rained " ..model_name.. " For " ..player.get_player_name(pid), "Vehicle Spawner", 210)
          else
            ui.notify_above_map("~h~Model has to be a car", "~h~Error", 6)
        end
      end
    end

    local function spawn_ped(pid, model_name)
      if not cooldown then
        local spectating = network.get_player_player_is_spectating(player.player_id())
        if spectating == pid or pid == player.player_id() then
          if not model_name then
            ui.notify_above_map("You Almost Broke The Function!\nGo set a model name", "~h~~r~C~y~o~o~n~g~g~b~r~r~a~y~t~o~s~g~!", 151)
            return HANDLER_POP
          end
          local Ped_Hash = gameplay.get_hash_key(model_name)
          if not spawnAmountP then
            spawnAmountP = 5
            ui.notify_above_map("~h~Invaild Spawn Amount\nsetting to 5", "~h~Error", 6)
          end
          if request_model(model_name) == true then
            if streaming.is_model_a_ped(Ped_Hash) then
              for i = 1, spawnAmountP do
                tableOfEntities[#tableOfEntities + 1] = ped.create_ped(4, Ped_Hash, player.get_player_coords(pid) + v3(rand(-pradiusNUM, pradiusNUM), rand(-pradiusNUM, pradiusNUM), pheightNUM), 0, true, false)
                syswait(150)
              end
              streaming.set_model_as_no_longer_needed(Ped_Hash)
              ui.notify_above_map("Successfully Rained " ..model_name.. " For " ..player.get_player_name(pid), "Ped Spawner", 210)
              ui.notify_above_map("Clearing peds in 15 seconds, there will be a cooldown", "Ped Spawner", 210)
              cooldown = true
              syswait(15000)
              cooldown = false
              for i, Entity in pairs(tableOfEntities) do
                entity.set_entity_as_no_longer_needed(Entity)
              end
              remove_entities(pid, tableOfEntities)
              for i, Entity in pairs(tableOfEntities) do
                entity.set_entity_coords_no_offset(Entity, v3(16000, 16000, -2000))
                entity.delete_entity(Entity)
              end
              ui.notify_above_map("Done deleting", "Ped Spawner", 210)
              tableOfEntities = {}
            else
              ui.notify_above_map("~h~Model has to be a ped", "~h~Error", 6)
            end
          else
            ui.notify_above_map("~h~Invalid model_name", "~h~Error", 6)
          end
        else
          ui.notify_above_map("You have to spectate.", "Ped Spawner", 151)
        end
      end
    end

--Player Features
    RainParent = menu.add_player_feature("Spawn shit dude", "parent", 0).id
    pedSpwn = menu.add_player_feature("Ped Spawner", "parent", RainParent).id
    vehSpwn = menu.add_player_feature("Vehicle Spawner", "parent", RainParent).id

    menu.add_player_feature("Set Vehicle", "action", vehSpwn, function() 
      DefinedInput, gottenModel_NameV = input.get("Set Model Name To Rain", "", 128, 0)
      while DefinedInput == 1 do
        DefinedInput, gottenModel_NameV = input.get("Set Model Name To Rain", "", 128, 0)
        syswait(2)
      end
    end)

    menu.add_player_feature("Set Ped", "action", pedSpwn, function() 
      DefinedInput3, gottenModel_NameP = input.get("Set Model Name To Rain", "", 128, 0)
      while DefinedInput3 == 1 do
        DefinedInput3, gottenModel_NameP = input.get("Set Model Name To Rain", "", 128, 0)
        syswait(2)
      end
    end)

    menu.add_player_feature("Set The Vehicle Spawn Amount", "action", vehSpwn, function() 
      DefinedInput1, spawnAmountV = input.get("Amount of vehicles to rain on player (900 vehicle limit)", "", 3, 3)
      while DefinedInput1 == 1 do
        DefinedInput1, spawnAmountV = input.get("Amount of vehicles to rain on player (900 vehicle limit)", "", 3, 3)
        syswait(2)
      end
      spawnAmountV = tonumber(spawnAmountV)
      if not spawnAmountV then
        return HANDLER_POP
      end
      if spawnAmountV > 900 then
        spawnAmountV = 900
      elseif spawnAmountV < 1 then
        spawnAmountV = 1
      elseif spawnAmountV == nil then
        spawnAmountV = 5
      end
    end)

    menu.add_player_feature("Set The Ped Spawn Amount", "action", pedSpwn, function() 
      DefinedInput2, spawnAmountP = input.get("Amount of peds to rain on player (900 ped limit)", "", 3, 3)
      while DefinedInput2 == 1 do
        DefinedInput2, spawnAmountP = input.get("Amount of peds to rain on player (900 ped limit)", "", 3, 3)
        syswait(0)
      end
      spawnAmountP = tonumber(spawnAmountP)
      if not spawnAmountP then
        return HANDLER_POP
      end
      if spawnAmountP > 900 then
        spawnAmountP = 900
      elseif spawnAmountP < 1 then
        spawnAmountP = 1
      elseif spawnAmountP == nil then
        spawnAmountP = 5
      end
    end)

    menu.add_player_feature("Set Vehicle Radius", "autoaction_value_i", vehSpwn, function(f)
      f.min_i = 0
      f.max_i = 45
      f.mod_i = 1
      vradiusNUM = f.value_i
    end)

    menu.add_player_feature("Set Vehicle Height", "autoaction_value_i", vehSpwn, function(f)
      f.min_i = 0
      f.max_i = 50
      f.mod_i = 1
      vheightNUM = f.value_i
    end)

    menu.add_player_feature("Set Ped Radius", "autoaction_value_i", pedSpwn, function(f)
      f.min_i = 0
      f.max_i = 30
      f.mod_i = 1
      pradiusNUM = f.value_i
    end)

    menu.add_player_feature("Set Ped Height", "autoaction_value_i", pedSpwn, function(f)
      f.min_i = 0
      f.max_i = 20
      f.mod_i = 1
      pheightNUM = f.value_i
    end)

    menu.add_player_feature("Rain Set Vehicle", "action", vehSpwn, function(f, pid) 
      spawn_vehicle(pid, gottenModel_NameV)
    end)

    menu.add_player_feature("Rain Set Ped", "action", pedSpwn, function(f, pid) 
      spawn_ped(pid, gottenModel_NameP)
    end)

    menu.add_player_feature("Fake Crash some idiotic modders", "action", pedSpwn, function(f, pid) 
      spawn_ped(pid, "MP_M_G_VagFun_01")
    end)

local Sound = menu.add_player_feature("Sound Crashes", "parent", a.opption).id

menu.add_player_feature("Sound Crash", "action_value_str", Sound, function(f, id)
    if f.value == 0 then
    local time = utils.time_ms() + 100
    while time > utils.time_ms() do
        local pos = player.get_player_coords(id)
        for i = 1, 10 do
   
       end
        system.wait(0)
    end
    menu.notify(""..player.get_player_name(id).." has been humbled", "Sound Crash v1", 10, 0xff0000ff)
    elseif f.value == 1 then
    local time = utils.time_ms() + 100
    while time > utils.time_ms() do
        local pos = player.get_player_coords(id)
        for i = 1, 10 do
            audio.play_sound_from_coord(-1, 'Checkpoint_Cash_Hit', pos, 'GTAO_FM_Events_Soundset', true, 1, false)
        end
        system.wait(0)
    end
    menu.notify(""..player.get_player_name(id).." is currently raging!", "Sound Crash v2", 10, 0xff0000ff)
    end
end):set_str_data({"v1","v2"})

local god = menu.add_player_feature("Godmode Killers", "parent", a.opption).id

menu.add_player_feature("car kill", "toggle", god, function(feat, pid)
if feat.on then
        if pid ~= me then
          local activveee = player.is_player_in_any_vehicle(pid)
          if activveee == true then
            local their_ped = player.get_player_ped(pid)
    local their_v =  ped.get_vehicle_ped_is_using(player.get_player_ped(pid))
    local hash = entity.get_entity_model_hash(their_v)
    local plane = streaming.is_model_a_vehicle(hash)
    system.wait(0)
        if not network.has_control_of_entity(their_v) then
            network.request_control_of_entity(their_v)	
        end	
        vehicle.add_vehicle_phone_explosive_device(their_v)
        vehicle.detonate_vehicle_phone_explosive_device(their_v)
system.wait(400)
                                           
    end
  end


end


return HANDLER_CONTINUE
end)

menu.add_player_feature("Stand Lagger {coload}", "toggle", Lag, function(feat, pid)
    if feat.on then
    --	fire.add_explosion(player.get_player_coords(pid), -1337, true, false, 200, pid)
    --	system.wait(0)
--		fire.add_explosion(player.get_player_coords(pid), 29, true, false, 200, pid)
    --	system.wait(0)
    --	weapon.remove_all_ped_weapons(pid)
    --	system.wait(0)
        graphics.set_next_ptfx_asset("scr_recartheft")
        while not graphics.has_named_ptfx_asset_loaded("scr_recartheft") do
            graphics.request_named_ptfx_asset("scr_recartheft")
            system.wait(0)
        end
        graphics.start_networked_particle_fx_non_looped_at_coord(
            "scr_wheel_burnout",
            player.get_player_coords(pid),
            v3(0, -5, 0),
            100.33,
            true,
            true,
            true
        )
        graphics.set_next_ptfx_asset("scr_indep_fireworks")
        while not graphics.has_named_ptfx_asset_loaded("scr_indep_fireworks") do
            graphics.request_named_ptfx_asset("scr_indep_fireworks")
            system.wait(0)
        end
        graphics.start_networked_particle_fx_non_looped_at_coord(
            "scr_indep_firework_trail_spawn",
            player.get_player_coords(pid),
            v3(0, -5, 0),
            10.33,
            true,
            true,
            true
        )
        graphics.set_next_ptfx_asset("scr_recartheft")
        while not graphics.has_named_ptfx_asset_loaded("scr_recartheft") do
            graphics.request_named_ptfx_asset("scr_recartheft")
            system.wait(0)
        end
        graphics.start_networked_particle_fx_non_looped_at_coord(
            "scr_wheel_burnout",
            player.get_player_coords(pid),
            v3(0, 100, 100),
            100,
            true,
            true,
            true
        )
        graphics.set_next_ptfx_asset("scr_recartheft")
        while not graphics.has_named_ptfx_asset_loaded("scr_recartheft") do
            graphics.request_named_ptfx_asset("scr_recartheft")
            system.wait(0)
        end
        graphics.start_networked_particle_fx_non_looped_at_coord(
            "scr_wheel_burnout",
            player.get_player_coords(pid),
            v3(100, 0, 100),
            100,
            true,
            true,
            true
        )
        graphics.set_next_ptfx_asset("scr_recartheft")
        while not graphics.has_named_ptfx_asset_loaded("scr_recartheft") do
            graphics.request_named_ptfx_asset("scr_recartheft")
            system.wait(0)
        end
        graphics.start_networked_particle_fx_non_looped_at_coord(
            "scr_wheel_burnout",
            player.get_player_coords(pid),
            v3(100, 100, 0),
            100,
            true,
            true,
            true
        )

        
        
    end
       return HANDLER_CONTINUE
   end)

menu.add_player_feature("Stand Combo", "toggle", Lag, function(feat, pid)
    pos= player.get_player_coords(pid)
            pos.y= pos.y + math.random(-1, 1)
            pos.z= pos.z + math.random(-0, 5)
        streaming.request_model(0xEA313705, 1000)
        local A = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(A)
        local B = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(B)
        local C = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(C)
        local D = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(D)
        local E = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(E)
        local F = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(F)
        local G = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(G)
        local H = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(H)
        local I = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(I)
        local J = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(J)
        local K = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(K)
        local L = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(L)
        local M = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(M)
        local N = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(N)
        local O = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(O)
        local P = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(P)
        local Q = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(Q)
        local R = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(R)
        local S = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(S)
        local T = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(T)
        local U = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(U)
        local V = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(V)
        local W = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(W)
        local X = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(X)
        local Y = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(Y)
        local Z = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(Z)
        local a = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(a)
        local b = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(b)
        local c = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(c)
        local d = vehicle.create_vehicle(0xEA313705, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(d)
        system.yield(10)
        entity.set_entity_gravity(A, false)
        entity.set_entity_gravity(B, false)
        entity.set_entity_gravity(C, false)
        entity.set_entity_gravity(D, false)
        entity.set_entity_gravity(E, false)
        entity.set_entity_gravity(F, false)
        entity.set_entity_gravity(G, false)
        entity.set_entity_gravity(H, false)
        entity.set_entity_gravity(I, false)
        entity.set_entity_gravity(J, false)
        entity.set_entity_gravity(K, false)
        entity.set_entity_gravity(L, false)
        entity.set_entity_gravity(M, false)
        entity.set_entity_gravity(N, false)
        entity.set_entity_gravity(O, false)
        entity.set_entity_gravity(P, false)
        entity.set_entity_gravity(Q, false)
        entity.set_entity_gravity(R, false)
        entity.set_entity_gravity(S, false)
        entity.set_entity_gravity(T, false)
        entity.set_entity_gravity(U, false)
        entity.set_entity_gravity(V, false)
        entity.set_entity_gravity(W, false)
        entity.set_entity_gravity(X, false)
        entity.set_entity_gravity(Y, false)
        entity.set_entity_gravity(Z, false)
        entity.set_entity_gravity(a, false)
        entity.set_entity_gravity(b, false)
        entity.set_entity_gravity(c, false)
        entity.set_entity_gravity(d, false)
        menu.notify("Status", "Wait im gonna nut", 10, 2)
        for netlag = 100, -100 do
            script.trigger_script_event(27382701, pid, {netlag, math.random(-5000, 5000), math.random(-5000, 5000), math.random(-1, 1)})
        end
        system.yield(10)
end)

menu.add_player_feature("Stand killer", "toggle", Lag, function(feat, pid)
    pos= player.get_player_coords(pid)
            pos.y= pos.y + math.random(-1, 1)
            pos.z= pos.z + math.random(-0, 5)
        streaming.request_model(0x3F119114, 1000)
        local A = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(A)
        local B = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(B)
        local C = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(C)
        local D = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(D)
        local E = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(E)
        local F = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(F)
        local G = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(G)
        local H = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(H)
        local I = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(I)
        local J = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(J)
        local K = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(K)
        local L = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(L)
        local M = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(M)
        local N = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(N)
        local O = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(O)
        local P = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(P)
        local Q = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(Q)
        local R = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(R)
        local S = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(S)
        local T = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(T)
        local U = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(U)
        local V = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(V)
        local W = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(W)
        local X = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(X)
        local Y = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(Y)
        local Z = vehicle.create_vehicle(0xEF813606, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(Z)
        local a = vehicle.create_vehicle(0x7CAB34D0, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(a)
        local b = vehicle.create_vehicle(0xCB44B1CA, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(b)
        local c = vehicle.create_vehicle(0xBE66F5AA, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(c)
        local d = vehicle.create_vehicle(0x58CDAF30, pos, pos.z, true, false)
        entity.set_entity_as_mission_entity(d)
        system.yield(10)
        entity.set_entity_gravity(A, false)
        entity.set_entity_gravity(B, false)
        entity.set_entity_gravity(C, false)
        entity.set_entity_gravity(D, false)
        entity.set_entity_gravity(E, false)
        entity.set_entity_gravity(F, false)
        entity.set_entity_gravity(G, false)
        entity.set_entity_gravity(H, false)
        entity.set_entity_gravity(I, false)
        entity.set_entity_gravity(J, false)
        entity.set_entity_gravity(K, false)
        entity.set_entity_gravity(L, false)
        entity.set_entity_gravity(M, false)
        entity.set_entity_gravity(N, false)
        entity.set_entity_gravity(O, false)
        entity.set_entity_gravity(P, false)
        entity.set_entity_gravity(Q, false)
        entity.set_entity_gravity(R, false)
        entity.set_entity_gravity(S, false)
        entity.set_entity_gravity(T, false)
        entity.set_entity_gravity(U, false)
        entity.set_entity_gravity(V, false)
        entity.set_entity_gravity(W, false)
        entity.set_entity_gravity(X, false)
        entity.set_entity_gravity(Y, false)
        entity.set_entity_gravity(Z, false)
        entity.set_entity_gravity(a, false)
        entity.set_entity_gravity(b, false)
        entity.set_entity_gravity(c, false)
        entity.set_entity_gravity(d, false)
    for netlag = 100, -100 do
        script.trigger_script_event(27382701, pid, {netlag, math.random(-5000, 5000), math.random(-5000, 5000), math.random(-1, 1)})
    end
    menu.notify("Status", "Goth Girl Nutted on successfully", 10, 2)
end)