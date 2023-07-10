
local ntv = {}
ntv.ver_text = "Gee-Skid v2.02"
ntv.c = native.call
ntv.b8=native.ByteBuffer8
ntv.b16=native.ByteBuffer16
ntv.ped_rltshp_grp_hash = ped.get_ped_relationship_group_hash

ntv.get = {}

function ntv.get.last_ped_in_seat(_veh,_seat)
	return (ntv.c(0x83F969AA1EE2A664,_veh):__tointeger())--GetLastPedInVehicleSeat
end

function ntv.get.veh_mod_kit(_veh)
	return (ntv.c(0x6325D1A044AE510D,_veh):__tointeger())--GetVehicleModKit (65535) for street  vehicles
end

function ntv.get.veh_tires_can_burst(_veh)
	return (ntv.c(0x678B9BB8C3F58FEB,_veh):__tointeger()==1)--GetVehicleTyresCanBurst
end

function ntv.get.veh_interior_color(_veh)
	return (ntv.c(0x7D1464D472D32136,_veh):__tointeger())--GetVehicleInteriorColor GET_VEHICLE_EXTRA_COLOUR_5
end

function ntv.get.veh_dashboard_color(_veh)
	return (ntv.c(0xB7635E80A5C31BFF,_veh):__tointeger())--GetVehicleDashboardColor GET_VEHICLE_EXTRA_COLOUR_6
end

function ntv.get.veh_plate_text(_veh)
	return (ntv.c(0x7CE1CCB9B293020E,_veh):__tostring(true)) -- GetVehicleNumberPlateText
end

function ntv.get.veh_ped_try_enter(_ped)
	return (ntv.c(0x814FA8BE5449445D,_ped):__tointeger())--GetVehiclePedIsTryingToEnter
end

function ntv.get.veh_smoke_color(_veh)
    local bufferR = ntv.b8()
    local bufferG = ntv.b8()
	local bufferB = ntv.b8()
	ntv.c(0xB635392A4938B3C3,_veh,bufferR,bufferG,bufferB)--GetVehicleTyreSmokeColor
    return bufferR:__tointeger(),bufferG:__tointeger(),bufferB:__tointeger()
end

function ntv.get.veh_primary_color_custom_rgb(_veh)
    local bufferR = ntv.b8()
    local bufferG = ntv.b8()
	local bufferB = ntv.b8()
	ntv.c(0xB64CF2CCA9D95F52,_veh,bufferR,bufferG,bufferB)--GetVehicleCustomPrimaryColour
    return bufferR:__tointeger(),bufferG:__tointeger(),bufferB:__tointeger()
end

function ntv.get.veh_secondary_color_custom_rgb(_veh)
    local bufferR = ntv.b8()
    local bufferG = ntv.b8()
	local bufferB = ntv.b8()
	ntv.c(0x8389CD56CA8072DC,_veh,bufferR,bufferG,bufferB)--GetVehicleCustomSecondaryColour
    return bufferR:__tointeger(),bufferG:__tointeger(),bufferB:__tointeger()
end

function ntv.get.veh_node(root, nodeFlags, p5, p6) --proddy thank you....but it doesnt work :(
    local pos = native.ByteBuffer64()
    local result = native.call(0x240A18690AE96513, root.x, root.y, root.z, pos, nodeFlags, p5, p6)--GetClosestVehicleNode
    if result:__tointeger() == 0 then
        return false, nil
    end
    return true, pos:__tov3()
end

function ntv.get.veh_tire_health(_veh,_indx)
	return ntv.c(0x55EAB010FAEE9380,_veh,_indx):__tonumber(true)
end

function ntv.get.veh_engine_health(_veh,_prcnt)
	local hlth = ntv.c(0xC45D23BAF168AAB8,_veh):__tonumber(true)
	if _prcnt then
		if hlth >= 0 then
			return hlth/10
		end
		return hlth/40
	end
	return hlth
end

function ntv.get.helo_main_rtr_health(_veh,_prcnt)
	local hlth = ntv.c(0xE4CB7541F413D2C5,_veh):__tonumber(true) --GetHeliMainRotorHealth
	if _prcnt then
		if hlth >= 0 then
			return hlth/10
		end
		return hlth
	end
	return hlth
end

function ntv.get.helo_tail_rtr_health(_veh,_prcnt)
	local hlth = ntv.c(0xAE8CE82A4219AC8C,_veh):__tonumber(true) --GetHeliTailRotorHealth
	if _prcnt then
		if hlth >= 0 then
			return hlth/10
		end
		return hlth
	end
	return hlth
end

function ntv.get.what_ent_killed_ped(_ped)
	return (ntv.c(0x93C8B64DEB84728C,_ped):__tointeger(true))
end

function ntv.get.my_veh_lock_trgt()
	local hash = ntv.b16()
	local success = ntv.c(0x8F5EBAB1F260CFCE,player.get_player_vehicle(player.player_id()),hash)--GetVehicleLockOnTarget
	return (hash:__tointeger())
end
		
function ntv.get.ped_veh_weap(_ped) -- thank you proddy
    local hash = ntv.b16()
    local success = ntv.c(0x1017582BCD3832DC, _ped, hash) --GetCurrentPedVehicleWeapon
    --return success:__tointeger() ~= 0, hash:__tointeger64()
	return (hash:__tointeger64())
end

function ntv.get.veh_body_health(_veh,_prcnt)
	if _prcnt then
		return ((ntv.c(0xF271147EB7B40F12,_veh):__tonumber(true))/10)
	end
	return (ntv.c(0xF271147EB7B40F12,_veh):__tonumber(true))
end

function ntv.get.num_windows_good(_veh) --IsVehicleWindowIntact
	local count = 0
	for i=0,7 do
		count = count+ntv.c(0x46E571A0E20D01F1,_veh,i):__tointeger()
	end
	return count
end

function ntv.get.ped_id(_ped) --PedToNet
	return (ntv.c(0x0EDEC3C276198689, _ped):__tointeger())
end

function ntv.get.obj_id(_obj) --ObjToNet
	return (ntv.c(0x99BFDC94A603E541, _obj):__tointeger())
end

function ntv.get.veh_id(_veh) --VehToNet
	return (ntv.c(0xB4C94523F023419C, _veh):__tointeger())
end

function ntv.get.ent_height(_ent) --GetEntityHeightAboveGround
	return (ntv.c(0x1DD55701034110E5, _ent):__tonumber())
end




ntv.doo={}

function ntv.doo.clear_veh_task(_veh)
	ntv.c(0xDBBC7A2432524127,_veh) --ClearVehicleTasks
end

function ntv.doo.clear_task( _ped)
	ntv.c(0xE1EF3C1216AFF2CD,_ped) --ClearPedTasks
end

function ntv.doo.drive_veh(_ped, _veh, _action, _time)
	ntv.c(0xC429DCEEB339E129,_ped, _veh, _action, _time) --TaskVehicleTempAction
end

-- '1 - brake
-- '3 - brake + reverse
-- '4 - turn left 90 + braking
-- '5 - turn right 90 + braking
-- '6 - brake strong (handbrake?) until time ends
-- '13 - turn left + go reverse
-- '14 - turn left + go reverse
-- '19 - strong brake + turn left/right
-- '20 - weak brake + turn left then turn right
-- '21 - weak brake + turn right then turn left
-- '22 - brake + reverse
-- '24 - brake
-- '25 - brake turning left then when almost stopping it turns left more
-- '26 - brake turning right then when almost stopping it turns right more
-- '27 - brake until car stop or until time ends
-- '28 - brake + strong reverse acceleration

-- '7 - turn left + accelerate
-- '8 - turn right + accelerate
-- '9 - weak acceleration
-- '23 - accelerate fast ---------------------------------------- wrong -- this is accel and turn
-- '32 - accelerate very strong --------------------------------- wrong -- this is accel and turn

-- '10 - turn left + restore wheel pos to center in the end ------pretty sure this is right
-- '11 - turn right + restore wheel pos to center in the end -----pretty sure this is left


-- '30 - performs a burnout (brake until stop + brake and accelerate)
-- '31 - accelerate + handbrake

-- '16 - crash the game after like 2 seconds :)
-- '17 - keep actual state, game crashed after few tries
-- '18 - game crash



function ntv.doo.climb(_ped)
	ntv.c(0x89D9FCC2435112F1,_ped,1) --TaskClimb
end

function ntv.doo.climb_ladder(_ped)
	ntv.c(0xB6C987F9285A3814,_ped,1) --TaskClimbLadder
end




function ntv.doo.enter_veh(_ped, _veh, _timeout, _seat, _speed, _flag, p6)
	return ntv.c(0xC20E50AA46D09CA8,_ped, _veh, _timeout, _seat, _speed, _flag, p6) --TaskEnterVehicle
end

	
function ntv.doo.amb_pickup(p_hash, pos, flags, value, m_hash, p7, p8)
	return (ntv.c(0x673966A0C0FD7171, p_hash, pos.x, pos.y, pos.z, flags, value, m_hash, p7, p8):__tointeger()) --CreateAmbientPickup
end

function ntv.doo.rmv_veh_weap(_veh)
	for i=0,2 do
		ntv.c(0x44CD1F493DB2A0A6,_veh,i,0)
	end
end

function ntv.doo.brk_veh_wndws(_veh)
	for i=0,7 do
		ntv.c(0x9E5B5E4D2CCD2259,_veh,i)
	end
end

function ntv.doo.fix_veh_wndws(_veh)
	for i=0,7 do
		ntv.c(0x772282EBEB95E682,_veh,i)
	end
end

function ntv.doo.ped_refill_ammo_now(_ped)
	ntv.c(0x8C0D57EA686FAD87,_ped) --RefillAmmoInstantly
end

function ntv.doo.ped_mag_infinite(_ped)
	ntv.c(0x183DADC6AA953186,_ped) --SetPedInfiniteAmmoClip
end

function ntv.doo.ped_revive(_ped) 
	ntv.c(0x8D8ACD8388CD99CE,_ped)--revive ped
end

function ntv.doo.ped_jump(_ped,super,SUPER)
	ntv.c(0x0AE4086104E067B1,_ped,0,super,SUPER) ---- TaskJump
end

function ntv.doo.create_ped_in_veh(_veh,_p_type,_hash,_seat,_ntwrk,_shost) --CreatePedInsideVehicle
	return (ntv.c(0x7DD959874C1FD534,_veh,_p_type,_hash,_seat,_ntwrk,_shost):__tointeger())
end

function ntv.doo.fake_glow(_pos,_index) --RenderFakePickupGlow
	ntv.c(0x3430676B11CDF21D,_pos.x,_pos.y,_pos.z,_index)
end

function ntv.doo.spotlight(_pos,_dir,_r,_g,_b,_dist,_brght,_hard,_rds,_falloff) --DrawSpotLight
	ntv.c(0xD0F64B265C8C8B33,_pos.x,_pos.y,_pos.z,_dir.x,_dir.y,_dir.z,_r,_g,_b,_dist,_brght,_hard,_rds,_falloff)
end

function ntv.doo.spotlight_w_shadow(_pos,_dir,_r,_g,_b,_dist,_brght,_hard,_rds,_falloff,_shdw_id) --DrawSpotLightWithShadow
	ntv.c(0x5BCA583A583194DB,_pos.x,_pos.y,_pos.z,_dir.x,_dir.y,_dir.z,_r,_g,_b,_dist,_brght,_hard,_rds,_falloff,_shdw_id)
end

function ntv.doo.hide_weapon_wheel_from_mouse()
	ntv.c(0x0AFC4AF510774B47) --HudWeaponWheelIgnoreSelection
end

ntv.is={}

function ntv.is.voice_active(_pid)
	return (ntv.c(0x031E11F3D447647E, _pid):__tointeger()==1) --NetworkIsPlayerTalking
end

function ntv.is.chat_active()
	return (ntv.c(0xB118AF58B5F332A1):__tointeger()==1)--IsMultiplayerChatActive (hud)
end

function ntv.is.veh_seat_free(_veh,_seat)
	return (ntv.c(0x22AC59A870E6A669,_veh,_seat,1):__tointeger()==1) --IsVehicleSeatFree
end
	
function ntv.is.ent_static(_ent)
	return (ntv.c(0x1218E6886D3D8327,aim):__tointeger()==1)
end

function ntv.is.ped_has_weap(_ped,_weap) --HasPedGotWeapon
	return (ntv.c(0x8DECB02F88F428BC,_ped,_weap,0):__tointeger() == 1)
end	
	
function ntv.is.veh_can_jump(_veh)
	return (ntv.c(0x9078C0C5EF8C19E9,_veh):__tointeger(true) == 1)
end

function ntv.is.veh_have_weap(_veh)
	return (ntv.c(0x25ECB9F8017D98E0,_veh):__tointeger(true)==1)
end

function ntv.is.veh_bomb_open(_veh)
	return (ntv.c(0xD0917A423314BBA8,_veh):__tointeger()==1) -- AreBombBayDoorsOpen
end

function ntv.is.veh_emp_disabled(_veh)
	return (ntv.c(0x0506ED94363AD905,_veh):__tointeger()==1) --GetIsVehicleEmpDisabled
end

function ntv.is.veh_alarm_on(_veh)
	return (ntv.c(0x4319E335B71FFF34,_veh):__tointeger(true) == 1)
end

function ntv.is.veh_horn_on(_veh)
	return (ntv.c(0x9D6BFC12B05C6121,_veh):__tointeger(true) == 1)
end

function ntv.is.plane_damaged(_veh)
	return (ntv.c(0x755D6D5267CBBD7E,_veh):__tointeger()==0 or --ArePlanePropellersIntact
	ntv.c(0x5991A01434CE9677,_veh):__tointeger()==0 or --ArePlaneWingsIntact
	ntv.c(0x4198AB0022B15F87,_veh):__tointeger()==0) --IsPlaneLandingGearIntact
end

function ntv.is.ents_touch(_ent1,_ent2)
	return (ntv.c(0x17FFC1B2BA35A494,_ent1,_ent2):__tointeger()==1)
end

function ntv.is.wanted_over(_pid,_num)
	return (ntv.c(0x238DB2A2C23EE9EF,_pid,_num):__tointeger(true)==1)
end

function ntv.is.windows_good(_veh)
	return (ntv.c(0x11D862A3E977A9EF,_veh):__tointeger(true) == 1)
end

ntv.group_mean = {[4] = true, [5] = true}
function ntv.is.ped_dislikes(_check,_if_dislikes)
	return (ntv.group_mean[ntv.c(0x9E6B70061662AE5C,ntv.ped_rltshp_grp_hash(_if_dislikes),ntv.ped_rltshp_grp_hash(_check)):__tointeger()])
end

ntv.group_nice = {[0] = true, [1] = true, [2] = true}
function ntv.is.ped_nice(_check,_if_likes)
	return (ntv.group_nice[ntv.c(0x9E6B70061662AE5C,ntv.ped_rltshp_grp_hash(_if_likes),ntv.ped_rltshp_grp_hash(_check)):__tointeger()])
end

function ntv.is.ped_attack_ped(_check,_if_attack)
	return (ntv.c(0x18A3E9EE1297FD39,_check):__tointeger() == _if_attack or
	ntv.c(0x32C27A11307B01CC,_check):__tointeger() == _if_attack)
end

function ntv.is.ents_in_los(_start_ent,_end_ent,_val,_bool)
	if _bool then
		return ((ntv.c(0x394BDE2A7BBA031E,_start_ent,_end_ent,_val):__tointeger(true) == 1) or
		(ntv.c(0x394BDE2A7BBA031E,_end_ent,_start_ent,_val):__tointeger(true) == 1))
	end
	return (ntv.c(0x394BDE2A7BBA031E,_start_ent,_end_ent,_val):__tointeger(true) == 1)
end
function ntv.is.ent_in_los_front(_ent1,_ent2)
	return (ntv.c(0x0267D00AF114F17A,_ent1,_ent2):__tointeger(true) == 1) --HasEntityClearLosToEntityInFront
end

function ntv.is.blip_exist(_blip)
	return (ntv.c(0xA6DB27D19ECBB7DA,_blip):__tointeger()==1) --DoesBlipExist
end

ntv.set = {}

function ntv.set.blip_rot(_blip,_val)
	ntv.c(0xF87683CDF73C3F6E,_blip,_val)
end

function ntv.set.veh_neon_rgb(_veh,_r,_g,_b)
	ntv.c(0x8E0A582209A62695,_veh,_r,_g,_b)--SetVehicleNeonLightsColour
end

function ntv.set.veh_primary_color_custom_rgb(_veh,_r,_g,_b)
	ntv.c(0x7141766F91D15BEA,_veh,_r,_g,_b)--SetVehicleCustomPrimaryColour
end

function ntv.set.veh_secondary_color_custom_rgb(_veh,_r,_g,_b)
	ntv.c(0x36CED73BFED89754,_veh,_r,_g,_b)--SetVehicleCustomSecondaryColour
end

function ntv.set.veh_locked_on(_veh,_bool)
	ntv.c(0x407DC5E97DB1A4D3,_veh,_bool) --SET_VEHICLE_HOMING_LOCKEDONTO_STATE
end

function ntv.set.veh_interior_color(_veh,_color)
	ntv.c(0xF40DD601A65F7F19,_veh,_color)--SetVehicleInteriorColor
end
function ntv.set.veh_dashboard_color(_veh,_color)
	ntv.c(0x6089CDF6A57F326C,_veh,_color)--SetVehicleDashboardColor
end

function ntv.set.can_climb(_ped,_bool)
	ntv.c(0x8E06A6FE76C9EFF4,_ped,_bool) --SetPedPathCanUseClimbovers
end

function ntv.set.rmv_all_ped_weap(_ped)	--RemoveAllPedWeapons --doesnt seem to work (tested on players)
	ntv.c(0xF25DF915FA38C5F3,_ped,0)
end

function ntv.set.ped_critical_dmg(_ped,_bool) --SetPedSuffersCriticalHits
	ntv.c(0xEBD76F2359F190AC,_ped,_bool)
end

function ntv.set.id_can_migrate(_id,_bool) --SetNetworkIdCanMigrate
	ntv.c(0x299EEB23175895FC,_id,_bool)
end

function ntv.set.id_can_migrate(_id,_bool) --SetNetworkIdCanMigrate
	ntv.c(0x299EEB23175895FC,_id,_bool)
end

function ntv.set.id_always_exist(_id,_pid,_bool) --SetNetworkIdAlwaysExistsForPlayer
	ntv.c(0xA8A024587329F36A,_id,_pid,_bool)
end

function ntv.is.id_exists(_id)
	return (ntv.c(0x38CE16C96BD11344,_id):__tointeger()==1) --NetworkDoesNetworkIdExist
end

function ntv.set.veh_gas_health(_veh,_val)	
	ntv.c(0x70DB57649FA8D0D8,_veh,_val) --SetVehiclePetrolTankHealth
end

function ntv.set.ped_no_high_fall_damage(_ped,_bool)
	ntv.c(0x711794453CFD692B,_ped,_bool) --SET_DISABLE_HIGH_FALL_DEATH
end

 


function ntv.set.blip_add_to_ent(_ent) 
	return (ntv.c(0x5CDE92C702A8FCE7,_ent):__tointeger()) --AddBlipForEntity
end

function ntv.set.blip_cone(_blip,_bool) -- like a police cone
	ntv.c(0x13127EC3665E8EE1,_blip,_bool) --SetBlipShowCone
end

function ntv.set.blip_sprite(_blip,_id) 
	ntv.c(0xDF735600A4696DAF,_blip,_id) --SetBlipSprite
end

function ntv.set.blip_scale(_blip,_num) 
	ntv.c(0xD38744167B2FA257,_blip,_num) --SetBlipScale
end

function ntv.set.veh_dirt_level(_veh,_val)	
	ntv.c(0x79D3B596FE44EE8B,_veh,_val)
end

function ntv.set.ped_weap(_ped,_weap_hash)
	ntv.c(0xADF692B254977C0C,_ped,_weap_hash,true)--	SetCurrentPedWeapon
end
function ntv.set.veh_invncbl_wndws(_veh,_bool)
	ntv.c(0x1087BC8EC540DAEB,_veh,_bool)
end
function ntv.set.veh_considered(_veh,_val)
	ntv.c(0x31B927BBC44156CD,_veh,_val)--SetVehicleIsConsideredByPlayer
end

function ntv.set.veh_body_health(_veh,_val)
	ntv.c(0xB77D05AC8C78AADB,_veh,_val) -- set body health
end

function ntv.set.veh_tire_health(_veh,_tire,_health)
	ntv.c(0x74C68EF97645E79D,_veh, _tire, _health) --SetTyreHealth
end
function ntv.set.wanted_lvl(_pid,_val)
	ntv.c(0x39FF19C64EF7DA5B,_pid,_val,0)	--SetPlayerWantedLevel
	ntv.c(0xE0A7D1E497FFCD6F,_pid,0)	--SetPlayerWantedLevelNow
end

function ntv.set.veh_horn_on(_veh,_time,_mode,_forever)
	ntv.c(0x9C8C6504B5B63D2C,_veh,_time,_mode,_forever)-- StartVehicleHorn
end
function ntv.set.veh_turret_rot(_veh,_rot_z)
	ntv.c(0x56B94C6D7127DFBA,_veh,_rot_z) --SetVehicleTankTurretPosition
end
function ntv.set.veh_high_jump(_veh,_val)
	ntv.c(0xF06A16CA55D138D8,_veh,_val) --SetUseHigherVehicleJumpForce
end

function ntv.set.plane_trblnc(_veh,_val)
	ntv.c(0xAD2D28A1AFDFF131,_veh,_val) --SetPlaneTurbulenceMultiplier
end


ntv.cam={}
ntv.cam.set={}
function ntv.cam.set.on_ped(_ped)
	ntv.c(0x8BBACBF51DA047A8,_ped)
end

function ntv.cam.set.focus_pos(_pos)
	ntv.c(0xBB7454BAFF08FE25,_pos.x,_pos.y,_pos.z,0,0,0) --SetFocusPosAndVel
end

function ntv.cam.set.no_focus_pos()
	ntv.c(0x31B73D1EA9F01DA2) --ClearFocus
end

function ntv.cam.set.active(_cam,_active)
	ntv.c(0x026FB97D0A425F84,_cam,_active) -- SetCamActive
end

function ntv.cam.set.rot(_cam,_rot,_rot_order)
	ntv.c(0x85973643155D0B07,_cam,_rot.x,0,_rot.z,_rot_order)-- SetCamRot
end

function ntv.cam.set.render_script(_rndr,_ease,_ease_t,_p3,p4)
	ntv.c(0x07E5B515DB0636FC,_rndr,_ease,_ease_t,_p3,p4) --RenderScriptCams
end

function ntv.cam.set.coords(_cam,_pos)
	ntv.c(0x4D41783FB745E42E,_cam,_pos.x,_pos.y,_pos.z) -- SetCamCoord
end


ntv.cam.is={}
function ntv.cam.is.exist(_cam)
	return (ntv.c(0xA7A932170592B50E,_cam):__tointeger()==1) --DoesCamExist
end


ntv.cam.doo={}


function ntv.cam.doo.destroy_all()
	ntv.c(0x8E5FB15663F79120,1)-- DestroyAllCams
end

function ntv.cam.doo.create_w_params(_str,_pos,_rot,_fov,_active,_rot_order)
	return (ntv.c(0xB51194800B257161, _str, _pos.x,_pos.y,_pos.z, _rot.x,_rot.y,_rot.z, _fov, _active, _rot_order):__tointeger()) --CreateCamWithParams
end

function ntv.cam.doo.attach_to_ent(_cam,_ent,_ofst,_isrel)
	ntv.c(0xFEDB7D269E8C60E3,	_cam, _ent,_ofst.x,_ofst.y,_ofst.z,_isrel) --AttachCamToEntity
end

ntv.map={}
function ntv.map.lock_mini_pos(_pos)
	ntv.c(0x1279E861A329E73F,_pos.x,_pos.y) --LockMinimapPosition
end

function ntv.map.unlock_mini_pos()
	ntv.c(0x3E93E06DB8EF1F30) --UnlockMinimapPosition
end

ntv.task={}



function ntv.task.ped_seat_shuffle(_ped,_veh)
	ntv.c(0x7AA80209BDA643EB,_ped,_veh)--   TaskShuffleToNextVehicleSeat
end

function ntv.task.thow_prjctl(_ped,_pos)
	ntv.c(0x7285951DBF6B5A51,_ped,_pos.x,_pos.y,_pos.z,-1,0)--   TaskThrowProjectile
end


function ntv.task.drive_by(_driver,_t_ped,_t_veh,_t_coords,_shoot_dist,_accuracy,p8,_s_fire_pattern)
	ntv.c(0x2F8AF0E82773A171,_driver,_t_ped,_t_veh,_t_coords.x,_t_coords.y,_t_coords.z,_shoot_dist,_accuracy,p8,_s_fire_pattern) --TaskDriveBy
end

function ntv.task.go_aim_coords(_ped,_go,_aim,_speed,_shoot,_p9,p10,p11,_flags,p13,_fire_pattern)
	ntv.c(0x11315AB3385B8AC0,_ped,_go.x,_go.y,_go.z,_aim.x,_aim.y,_aim.z,_speed,_shoot,_p9,p10,p11,_flags,p13,_fire_pattern) --TaskGoToCoordWhileAimingAtCoord
end

function ntv.task.go_straight_coords(_ped,_pos,_speed,_timeout,_heading,_slide)
	ntv.c(0xD76B57B44F1E6F8B,_ped,_pos.x,_pos.y,_pos.z,_speed,1,0.0,0.5)--TaskGoStraightToCoord
end

function ntv.task.pause(_ped)
	ntv.c(0xE73A266DB0CA9042,_ped,0)--TaskPause
end

function ntv.task.veh_mission_ped(_ped,_veh,_trgt,_type,_speed,_style,_mindist,_p7,_against_traffic)	
	ntv.c(0x9454528DF15D657A,_ped,_veh,_trgt,_type,_speed,_style,_mindist,_p7,_against_traffic) --TaskVehicleMissionPedTarget
end

function ntv.task.helo_chase(_ped,_ent,_pos)
	ntv.c(0xAC83B1DB38D0ADA0,_ped,_ent,_pos.x,_pos.y,_pos.z) --	TaskHeliChase
end

return ntv

