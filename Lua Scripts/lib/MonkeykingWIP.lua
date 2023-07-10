script = {}
require ("natives-1614644776")
local toggle = false

---create root in menu
GenerateFeatures = function() 
menu.divider(menu.my_root(), "monke") 
parent = menu.list(menu.my_root(), "ooh ooh ah ah", {}, "", function(); end) 

menu.action(parent, "become monke", {}, "", function() ---creates button
util.toast("you are now the king of monkeys") ---notification sent when script is run
---put feature(s) here
while not STREAMING.HAS_MODEL_LOADED(0xA8683715) and not STREAMING.HAS_MODEL_LOADED(0xC2D06F53) do
  STREAMING.REQUEST_MODEL(0xA8683715)
  STREAMING.REQUEST_MODEL(0xC2D06F53)
  util.yield(10)
end

util.create_ped(28, 0xA8683715, ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()), true), CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
util.create_ped(28, 0xA8683715, ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()), true), CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
util.create_ped(28, 0xA8683715, ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()), true), CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
util.create_ped(28, 0xA8683715, ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()), true), CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)
util.create_ped(28, 0xA8683715, ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID()), true), CAM.GET_FINAL_RENDERED_CAM_ROT(2).z)

--- change model
util.yield(10)
PLAYER.SET_PLAYER_MODEL(PLAYER.PLAYER_ID(), 0xC2D06F53)
end
)
menu.action(parent, "set the mood", {}, "", function() ---creates another button
util.toast("setting the mood...")
util.set_weather(14)
end
)
end
GenerateFeatures() 
while true do
	util.yield()
end