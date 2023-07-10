
local API = {}

	API.ver_text = "Gee-Skid v2.02"

	API.get_hash_key = gameplay.get_hash_key
	
	API.plyr={}
	
		API.plyr.my_id = 					player.player_id
		API.plyr.pers_veh = 				player.get_personal_vehicle
		API.plyr.count = 					player.player_count
		
		API.plyr.get={} --get returns a value
			API.plyr.get.coords = 			player.get_player_coords
			API.plyr.get.veh =  			player.get_player_vehicle
			API.plyr.get.heading = 			player.get_player_heading
			API.plyr.get.name = 			player.get_player_name
			API.plyr.get.ped = 				player.get_player_ped
			API.plyr.get.plyr_from_ped = 	player.get_player_from_ped
			API.plyr.get.scid = 			player.get_player_scid
			API.plyr.get.wanted = 			player.get_player_wanted_level
			API.plyr.get.max_health = 		player.get_player_max_health
			API.plyr.get.armor = 			player.get_player_armour
			API.plyr.get.health = 			player.get_player_health
			API.plyr.get.aim_at = 			player.get_entity_player_is_aiming_at
			API.plyr.get.ip = 				player.get_player_ip
			API.plyr.get.host_priority = 	player.get_player_host_priority
			
		API.plyr.is={}
			API.plyr.is.in_veh = 			player.is_player_in_any_vehicle
			API.plyr.is.friend = 			player.is_player_friend
			API.plyr.is.valid = 			player.is_player_valid
			API.plyr.is.god = 				player.is_player_god
			API.plyr.is.veh_god = 			player.is_player_vehicle_god
			API.plyr.is.modder = 			player.is_player_modder
			API.plyr.is.aim = 				player.is_player_free_aiming
			API.plyr.is.host = 				player.is_player_host
			API.plyr.is.playing = 			player.is_player_playing
			API.plyr.is.spectating = 		player.is_player_spectating
			
	API.ent={}
	
		API.ent.force = 					entity.apply_force_to_entity
		API.ent.freeze = 					entity.freeze_entity
		API.ent.delete = 					entity.delete_entity
		
		API.ent.is={} --is returns a bool
			API.ent.is.ent = 				entity.is_an_entity
			API.ent.is.veh = 				entity.is_entity_a_vehicle
			API.ent.is.obj =				entity.is_entity_an_object
			API.ent.is.dead = 				entity.is_entity_dead
			API.ent.is.in_air = 			entity.is_entity_in_air
			API.ent.is.ped = 				entity.is_entity_a_ped
			API.ent.is.visible = 			entity.is_entity_visible
			API.ent.is.attached = 			entity.is_entity_attached
			API.ent.is.collided = 			entity.has_entity_collided_with_anything
			API.ent.is.upside_down = 		entity.is_entity_upside_down
			API.ent.is.on_fire = 			entity.is_entity_on_fire

		API.ent.get={} --get returns a value
			API.ent.get.model_hash = 		entity.get_entity_model_hash
			API.ent.get.coords = 			entity.get_entity_coords
			API.ent.get.god = 				entity.get_entity_god_mode
			API.ent.get.heading = 			entity.get_entity_heading
			API.ent.get.rotation = 			entity.get_entity_rotation
			API.ent.get.dimensions = 		entity.get_entity_model_dimensions
			API.ent.get.velocity = 			entity.get_entity_velocity
			API.ent.get.speed = 			entity.get_entity_speed
			API.ent.get.collided_with = 	entity.get_entity_entity_has_collided_with

		API.ent.set={} --set sets a value/bool
			API.ent.set.max_speed = 		entity.set_entity_max_speed
			API.ent.set.velocity = 			entity.set_entity_velocity
			API.ent.set.gravity = 			entity.set_entity_gravity
			API.ent.set.rotation = 			entity.set_entity_rotation
			API.ent.set.visible = 			entity.set_entity_visible
			API.ent.set.god = 				entity.set_entity_god_mode
			API.ent.set.coords = 			entity.set_entity_coords_no_offset
			API.ent.set.no_need = 			entity.set_entity_as_no_longer_needed
			API.ent.set.heading = 			entity.set_entity_heading
			API.ent.set.collision = 		entity.set_entity_collision
			API.ent.set.collision_ent = 	entity.set_entity_no_collision_entity
			API.ent.set.alpha = 			entity.set_entity_alpha

	API.cam={}

		API.cam.get={}
			API.cam.get.rot = 				cam.get_gameplay_cam_rot
			API.cam.get.pos = 				cam.get_gameplay_cam_pos
			API.cam.get.rot_final = 		cam.get_final_rendered_cam_rot
			API.cam.get.pos_final = 		cam.get_final_rendered_cam_pos

	API.SD={}
		API.SD.draw_sprt = 					scriptdraw.draw_sprite
		API.SD.draw_line = 					scriptdraw.draw_line
		API.SD.draw_rect =					scriptdraw.draw_rect
		API.SD.draw_text = 					scriptdraw.draw_text
		
	API.util={}
		API.util.t_ms = 					utils.time_ms
		API.util.t_s = 						utils.time

	API.cntrl={}

		API.cntrl.is={}
			API.cntrl.is.just_pressed = 	controls.is_control_just_pressed
			API.cntrl.is.disabled_pressed = controls.is_disabled_control_pressed

		API.cntrl.get={}
			API.cntrl.get.normal = 			controls.get_control_normal

	API.gfx={}
		API.gfx.get_w = 					graphics.get_screen_width
		API.gfx.get_h = 					graphics.get_screen_height

	API.veh={}
	


		
		API.veh.get={}
			API.veh.get.class_name = 			vehicle.get_vehicle_class_name
			API.veh.get.model = 				vehicle.get_vehicle_model
			API.veh.get.all	= 					vehicle.get_all_vehicles
			API.veh.get.ped_in_seat = 			vehicle.get_ped_in_vehicle_seat
			API.veh.get.brand = 				vehicle.get_vehicle_brand
			API.veh.get.number_of_seats = 		vehicle.get_vehicle_model_number_of_seats
			API.veh.get.class = 				vehicle.get_vehicle_class
			API.veh.get.num_mods = 				vehicle.get_num_vehicle_mods
			API.veh.get.been_owned = 			vehicle.get_vehicle_has_been_owned_by_player
			API.veh.get.neon_color = 			vehicle.get_vehicle_neon_lights_color
			API.veh.get.mod = 					vehicle.get_vehicle_mod
			API.veh.get.pearl_color = 			vehicle.get_vehicle_pearlecent_color
			API.veh.get.pearl_color_custom = 	vehicle.get_vehicle_custom_pearlescent_colour
			API.veh.get.wheel_type = 			vehicle.get_vehicle_wheel_type
			API.veh.get.wheel_color = 			vehicle.get_vehicle_wheel_color
			API.veh.get.wheel_color_custom = 	vehicle.get_vehicle_custom_wheel_colour
			API.veh.get.headlight_color = 		vehicle.get_vehicle_headlight_color
			API.veh.get.plate_i = 				vehicle.get_vehicle_number_plate_index
			API.veh.get.tint = 					vehicle.get_vehicle_window_tint
			API.veh.get.primary_color = 		vehicle.get_vehicle_primary_color
			API.veh.get.secondary_color = 		vehicle.get_vehicle_secondary_color
			API.veh.get.drift_tires = 			vehicle.get_vehicle_drift_tires
		API.veh.set={}
			API.veh.set.drift_tires = 			vehicle.set_vehicle_drift_tires
			API.veh.set.kit_type = 				vehicle.set_vehicle_mod_kit_type
			API.veh.set.colors = 				vehicle.set_vehicle_colors
			API.veh.set.wheel_color_custom = 	vehicle.set_vehicle_custom_wheel_colour
			API.veh.set.neon_on = 				vehicle.set_vehicle_neon_light_enabled
			API.veh.set.engine_health = 		vehicle.set_vehicle_engine_health
			API.veh.set.on_ground = 			vehicle.set_vehicle_on_ground_properly
			API.veh.set.forward_speed = 		vehicle.set_vehicle_forward_speed
			API.veh.set.undriveable = 			vehicle.set_vehicle_undriveable
			API.veh.set.fixed = 				vehicle.set_vehicle_fixed
			API.veh.set.deform_fixed = 			vehicle.set_vehicle_deformation_fixed
			API.veh.set.engine_on = 			vehicle.set_vehicle_engine_on
			API.veh.set.bulletproof = 			vehicle.set_vehicle_bulletproof_tires
			API.veh.set.doors_locked = 			vehicle.set_vehicle_doors_locked
			API.veh.set.doors_locked_all = 		vehicle.set_vehicle_doors_locked_for_all_players
			API.veh.set.plate_index = 			vehicle.set_vehicle_number_plate_index
			API.veh.set.plate_text = 			vehicle.set_vehicle_number_plate_text
			API.veh.set.tire_burst = 			vehicle.set_vehicle_tire_burst
			API.veh.set.tires_can_burst = 		vehicle.set_vehicle_tires_can_burst			
			API.veh.set.tire_fixed = 			vehicle.set_vehicle_tire_fixed
			API.veh.set.out_of_control = 		vehicle.set_vehicle_out_of_control
			API.veh.set.top_speed = 			vehicle.modify_vehicle_top_speed						
			API.veh.set.be_locked_on = 			vehicle.set_vehicle_can_be_locked_on
			API.veh.set.extra = 				vehicle.set_vehicle_extra
			API.veh.set.mod	= 					vehicle.set_vehicle_mod
			API.veh.set.wheel_type = 			vehicle.set_vehicle_wheel_type
			API.veh.set.tire_smoke_color = 		vehicle.set_vehicle_tire_smoke_color
			API.veh.set.fullbeam = 				vehicle.set_vehicle_fullbeam
			API.veh.set.headlight_color = 		vehicle.set_vehicle_headlight_color
			API.veh.set.neon_color = 			vehicle.set_vehicle_neon_lights_color
			API.veh.set.primary_color_custom = 	vehicle.set_vehicle_custom_primary_colour
			API.veh.set.secondary_color_custom= vehicle.set_vehicle_custom_secondary_colour
			API.veh.set.pearl_color_custom = 	vehicle.set_vehicle_custom_pearlescent_colour
			API.veh.set.extra_colors = 			vehicle.set_vehicle_extra_colors
			API.veh.set.tog_mod = 				vehicle.toggle_vehicle_mod
			API.veh.set.helo_blades_full = 		vehicle.set_heli_blades_full_speed
			API.veh.set.tint = 					vehicle.set_vehicle_window_tint
		API.veh.is={}
			API.veh.is.tog_on = 				vehicle.is_toggle_mod_on
			API.veh.is.neon_on = 				vehicle.is_vehicle_neon_light_enabled
			API.veh.is.damaged = 				vehicle.is_vehicle_damaged
			API.veh.is.extra = 					vehicle.does_extra_exist
			API.veh.is.extra_on = 				vehicle.is_vehicle_extra_turned_on
			API.veh.is.on_all_wheels = 			vehicle.is_vehicle_on_all_wheels
			API.veh.is.secondary_color_custom = vehicle.is_vehicle_secondary_colour_custom
			API.veh.is.primary_color_custom = 	vehicle.is_vehicle_primary_colour_custom
	API.strm={}
	
		API.strm.req_anim = 	streaming.request_anim_dict
		API.strm.req_model = 	streaming.request_model
			
		API.strm.is={}
			API.strm.is.valid = 		streaming.is_model_valid
			API.strm.is.valid_helo = 	streaming.is_model_a_heli
			API.strm.is.valid_plane = 	streaming.is_model_a_plane
			API.strm.is.valid_ped = 	streaming.is_model_a_ped
			API.strm.is.anim_loaded = 	streaming.has_anim_dict_loaded
			API.strm.is.model_loaded = 	streaming.has_model_loaded
			

	API.Ped = {}
	
		API.Ped.create = 			ped.create_ped
		API.Ped.clear_tasks = 		ped.clear_ped_tasks_immediately
		API.Ped.remove_from_group = ped.remove_ped_from_group
		API.Ped.create_group = 		ped.create_group
		API.Ped.resurrect = 		ped.resurrect_ped
		
		API.Ped.get={}
			API.Ped.get.veh = 				ped.get_vehicle_ped_is_using
			API.Ped.get.all = 				ped.get_all_peds
			API.Ped.get.bone_coords = 		ped.get_ped_bone_coords
			API.Ped.get.weapon = 			ped.get_current_ped_weapon	
			API.Ped.get.last_weap_impact = 	ped.get_ped_last_weapon_impact
			API.Ped.get.rel_group_hash = 	ped.get_ped_relationship_group_hash
			API.Ped.get.group = 			ped.get_ped_group
			API.Ped.get.max_health = 		ped.get_ped_max_health
			API.Ped.get.health = 			ped.get_ped_health
		
		API.Ped.is={}
			API.Ped.is.plyr = 		ped.is_ped_a_player
			API.Ped.is.in_veh = 	ped.is_ped_in_any_vehicle
			API.Ped.is.shooting = 	ped.is_ped_shooting
			API.Ped.is.swimming = 	ped.is_ped_swimming
			API.Ped.is.ragdoll = 	ped.is_ped_ragdoll

		API.Ped.set={}
			API.Ped.set.config_flag = 			ped.set_ped_config_flag
			API.Ped.set.into_veh = 				ped.set_ped_into_vehicle
			API.Ped.set.rel_between_groups = 	ped.set_relationship_between_groups
			API.Ped.set.ragdoll = 				ped.set_ped_to_ragdoll
			API.Ped.set.combat_range = 			ped.set_ped_combat_range
			API.Ped.set.combat_ability = 		ped.set_ped_combat_ability
			API.Ped.set.combat_attributes = 	ped.set_ped_combat_attributes
			API.Ped.set.never_leaves_group = 	ped.set_ped_never_leaves_group
			API.Ped.set.can_attack_friendly = 	ped.set_can_attack_friendly
			API.Ped.set.max_health = 			ped.set_ped_max_health
			API.Ped.set.health = 				ped.set_ped_health
			API.Ped.set.rel_group_hash = 		ped.set_ped_relationship_group_hash
			API.Ped.set.combat_movement = 		ped.set_ped_combat_movement
			API.Ped.set.can_ragdoll = 			ped.set_ped_can_ragdoll
			API.Ped.set.ragdoll_flags = 		ped.set_ped_ragdoll_blocking_flags
			API.Ped.set.accuracy = 				ped.set_ped_accuracy
			
	API.wpn = {}
		API.wpn.ped_remove = 		weapon.remove_weapon_from_ped
		API.wpn.ped_has = 			weapon.has_ped_got_weapon
		API.wpn.ped_give = 			weapon.give_delayed_weapon_to_ped
		API.wpn.ped_give_comp = 	weapon.give_weapon_component_to_ped
		API.wpn.ped_set_ammo = 		weapon.set_ped_ammo
		API.wpn.ped_set_tint = 		weapon.set_ped_weapon_tint_index
		API.wpn.get_tint_count = 	weapon.get_weapon_tint_count
		API.wpn.get_max_ammo = 		weapon.get_max_ammo
		API.wpn.get_name = 			weapon.get_weapon_name

	API.rope={}
		API.rope.load			=	rope.rope_load_textures
		API.rope.unload			=	rope.rope_unload_textures
		API.rope.loaded			=	rope.rope_are_textures_loaded
		API.rope.add			=	rope.add_rope
		API.rope.exists			=	rope.does_rope_exist
		API.rope.delete			=	rope.delete_rope
		API.rope.attach_rope	=	rope.attach_rope_to_entity
		API.rope.attach_ents	=	rope.attach_entities_to_rope
		API.rope.detach_ent		=	rope.detach_rope_from_entity
		API.rope.start_unwind	=	rope.start_rope_unwinding_front
		API.rope.start_wind		=	rope.start_rope_winding
		API.rope.stop_undwind	=	rope.stop_rope_unwinding
		API.rope.stop_wind		=	rope.stop_rope_winding
		API.rope.length			=	rope.rope_force_length
		API.rope.physics		=	rope.activate_physics


return API
