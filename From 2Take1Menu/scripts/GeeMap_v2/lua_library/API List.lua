
local API = {}

API.ver_text = "Gee-Map 2.0"

API.sys={}
API.sys.yld = system.yield

API.plyr={}
API.plyr.get_coords = player.get_player_coords
API.plyr.my_id = player.player_id
API.plyr.is_in_veh = player.is_player_in_any_vehicle
API.plyr.get_veh =  player.get_player_vehicle
API.plyr.get_heading = player.get_player_heading
API.plyr.is_friend = player.is_player_friend
API.plyr.get_name = player.get_player_name
API.plyr.is_valid = player.is_player_valid
API.plyr.get_ped = player.get_player_ped

API.ent={}
API.ent.is_a_ent = entity.is_an_entity
API.ent.is_a_veh = entity.is_entity_a_vehicle
API.ent.get_model_hash = entity.get_entity_model_hash

API.cam={}
API.cam.get_rot = cam.get_gameplay_cam_rot

API.mth={}
API.mth.flr = math.floor
API.mth.rad = math.rad
API.mth.sin = math.sin
API.mth.cos = math.cos

API.SD={}
API.SD.draw_sprt = scriptdraw.draw_sprite

API.util={}
API.util.t_ms = utils.time_ms

API.cntrl={}
API.cntrl.is_just_pressed = controls.is_control_just_pressed
API.cntrl.get_normal = controls.get_control_normal

API.gfx={}
API.gfx.get_width = graphics.get_screen_width
API.gfx.get_height = graphics.get_screen_height

API.veh={}
API.veh.get_class_name = vehicle.get_vehicle_class_name
API.veh.get_model = vehicle.get_vehicle_model

API.strm={}
API.strm.is_valid = streaming.is_model_valid

API.intrr={}
API.intrr.get_intrr_from_ent = interior.get_interior_from_entity

return API

