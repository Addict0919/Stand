
-- nothing better to do?
--⠀⣞⢽⢪⢣⢣⢣⢫⡺⡵⣝⡮⣗⢷⢽⢽⢽⣮⡷⡽⣜⣜⢮⢺⣜⢷⢽⢝⡽⣝
--⠸⡸⠜⠕⠕⠁⢁⢇⢏⢽⢺⣪⡳⡝⣎⣏⢯⢞⡿⣟⣷⣳⢯⡷⣽⢽⢯⣳⣫⠇
--⠀⠀⢀⢀⢄⢬⢪⡪⡎⣆⡈⠚⠜⠕⠇⠗⠝⢕⢯⢫⣞⣯⣿⣻⡽⣏⢗⣗⠏⠀
--⠀⠪⡪⡪⣪⢪⢺⢸⢢⢓⢆⢤⢀⠀⠀⠀⠀⠈⢊⢞⡾⣿⡯⣏⢮⠷⠁⠀⠀
--⠀⠀⠀⠈⠊⠆⡃⠕⢕⢇⢇⢇⢇⢇⢏⢎⢎⢆⢄⠀⢑⣽⣿⢝⠲⠉⠀⠀⠀⠀
--⠀⠀⠀⠀⠀⡿⠂⠠⠀⡇⢇⠕⢈⣀⠀⠁⠡⠣⡣⡫⣂⣿⠯⢪⠰⠂⠀⠀⠀⠀
--⠀⠀⠀⠀⡦⡙⡂⢀⢤⢣⠣⡈⣾⡃⠠⠄⠀⡄⢱⣌⣶⢏⢊⠂⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⢝⡲⣜⡮⡏⢎⢌⢂⠙⠢⠐⢀⢘⢵⣽⣿⡿⠁⠁⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠨⣺⡺⡕⡕⡱⡑⡆⡕⡅⡕⡜⡼⢽⡻⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⣼⣳⣫⣾⣵⣗⡵⡱⡡⢣⢑⢕⢜⢕⡝⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⣴⣿⣾⣿⣿⣿⡿⡽⡑⢌⠪⡢⡣⣣⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⡟⡾⣿⢿⢿⢵⣽⣾⣼⣘⢸⢸⣞⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
--⠀⠀⠀⠀⠁⠇⠡⠩⡫⢿⣝⡻⡮⣒⢽⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀


util.require_natives("1660775568")
resources_dir = filesystem.resources_dir() .. '/kinkscript/'
if not filesystem.is_dir(resources_dir) then
    util.toast("ALERT: resources dir is missing! Please make sure you installed KinkScript properly.")
end

logo = directx.create_texture(resources_dir .. 'logo.png')

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


all_female_sex_voicenames = {
    "S_F_Y_HOOKER_01_WHITE_FULL_01",
    "S_F_Y_HOOKER_01_WHITE_FULL_02",
    "S_F_Y_HOOKER_01_WHITE_FULL_03",
    "S_F_Y_HOOKER_02_WHITE_FULL_01",
    "S_F_Y_HOOKER_02_WHITE_FULL_02",
    "S_F_Y_HOOKER_02_WHITE_FULL_03",
    "S_F_Y_HOOKER_03_BLACK_FULL_01",
    "S_F_Y_HOOKER_03_BLACK_FULL_03",
}

local female_speeches = {
    "SEX_GENERIC_FEM",
    "SEX_HJ",
    "SEX_ORAL_FEM",
    "SEX_CLIMAX",
    "SEX_GENERIC"
}

function moan(pos, gender)
    util.create_thread(function()
        local hash = util.joaat('s_f_y_hooker_01')
        request_model_load(hash)
        local new_ped = entities.create_ped(28, hash, pos, 0)
        ENTITY.SET_ENTITY_VISIBLE(new_ped, false, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(new_ped, true)
        local voice_name
        local speech_nam
        if gender == 'f' then
            voice_name = all_female_sex_voicenames[math.random(#all_female_sex_voicenames)]
            speech_name = female_speeches[math.random(#female_speeches)]
        else
            voice_name = "MICHAEL_NORMAL"
            speech_name = "SEX_GENERIC"
        end
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(new_ped, speech_name, voice_name, "SPEECH_PARAMS_FORCE", 0)
        local st_time = os.time()
        while true do 
            if os.time() - st_time >= 5 then 
                entities.delete(new_ped)
                util.stop_thread()
            end
            local c = players.get_position(players.user())
            ENTITY.SET_ENTITY_COORDS(new_ped, c.x, c.y, c.z+3, false, false, false, false)
            util.yield()
        end
    end)
end

if SCRIPT_MANUAL_START then
    moan(players.get_position(players.user()), 'f')
    logo_alpha = 0
    logo_alpha_incr = 0.01
    logo_alpha_thread = util.create_thread(function (thr)
        while true do
            logo_alpha = logo_alpha + logo_alpha_incr
            if logo_alpha > 1 then
                logo_alpha = 1
            elseif logo_alpha < 0 then 
                logo_alpha = 0
                util.stop_thread()
            end
            util.yield()
        end
    end)

    logo_thread = util.create_thread(function (thr)
        starttime = os.clock()
        local alpha = 0
        while true do
            directx.draw_texture(logo, 0.14, 0.14, 0.5, 0.5, 0.5, 0.5, 0, 1, 1, 1, logo_alpha)
            timepassed = os.clock() - starttime
            if timepassed > 3 then
                logo_alpha_incr = -0.01
            end
            if logo_alpha == 0 then
                util.stop_thread()
            end
            util.yield()
        end
    end)
end

function request_ptfx_asset(asset)
    local request_time = os.time()
    STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)
    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
        if os.time() - request_time >= 10 then
            break
        end
        util.yield()
    end
end



attire_root = menu.list(menu.my_root(), "Attire", {"sexluaattire"}, "")


escort_root = menu.list(menu.my_root(), "Escort services", {"sexluaescorts"}, "")

local custom_hooker_model = 'ig_lestercrest'
menu.text_input(escort_root, "Custom escort model", {"customescortmdl"}, "Enter the model, then go to request escort > custom.", function(on_input)
    custom_hooker_model = on_input
end, 'ig_lestercrest')

local custom_hooker_options = {"Clone of me", "Tracy", "Paige", "Bartender", "Topless", "Femboy", "Custom"}
menu.list_action(escort_root, "Request escort", {"requestescort"}, "Request the most high-end escorts in Los Santos", custom_hooker_options, function(index)
    local hooker
    local c
    pluto_switch index do
        case 1:
            hooker = PED.CLONE_PED(players.user_ped(), true, true, true)
            break
        case 2:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('cs_tracydisanto'))
            hooker = entities.create_ped(28, util.joaat('cs_tracydisanto'), c, math.random(270))
            break
        case 3:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('ig_paige'))
            hooker = entities.create_ped(28, util.joaat('ig_paige'), c, math.random(270))
            break
        case 4:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('s_f_y_bartender_01'))
            hooker = entities.create_ped(28, util.joaat('s_f_y_bartender_01'), c, math.random(270))
            break
        case 5:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('a_f_y_topless_01'))
            hooker = entities.create_ped(28, util.joaat('a_f_y_topless_01'), c, math.random(270))
            break
        case 6:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat('u_m_y_staggrm_01'))
            hooker = entities.create_ped(28, util.joaat('u_m_y_staggrm_01'), c, math.random(270))
            break
        case 7:
            c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
            request_model_load(util.joaat(custom_hooker_model))
            hooker = entities.create_ped(28, util.joaat(custom_hooker_model), c, math.random(270))
            break
    end
    local c = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), -5.0, 0.0, 0.0)
    ENTITY.SET_ENTITY_COORDS(hooker, c.x, c.y, c.z)
    TASK.TASK_START_SCENARIO_IN_PLACE(hooker, "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS", 0, false)
    util.toast("Your escort has arrived to your left.")
end)

locations_root = menu.list(menu.my_root(), "Locations", {"sexlualocations"}, "")
music_root = menu.list(menu.my_root(), "Music", {"sexluamusic"}, "")
anims_root = menu.list(menu.my_root(), "Animations", {"sexluaanims"}, "")
moans_root = menu.list(menu.my_root(), "Moans", {"sexluamoans"}, "")

menu.action(menu.my_root(), "Cum", {"cum"}, "", function ()
    local ptfx_asset = "scr_indep_fireworks"
    local effect_name = "scr_indep_firework_trailburst"
    request_ptfx_asset(ptfx_asset)
    GRAPHICS.USE_PARTICLE_FX_ASSET(ptfx_asset)
    GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY(effect_name, players.user_ped(), 0.0, 0.0, -0.3, 90.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0)
    for i=1, 10 do 
        local coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0.0, i, 0.0)
        FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], 67, 0.0, false, false, 0.0, true)
    end
end)

menu.action(anims_root, "Stop all anims", {"sexstopanims"}, "", function(on_click)
    TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.PLAYER_PED_ID())
end)

dances_root = menu.list(anims_root, "Lap dances", {"sexanimslapdance"}, "")
pole_root = menu.list(anims_root, "Pole dance", {"sexanimspoledance"}, "")
anims_vroot = menu.list(anims_root, "Vehicle", {"sexanimsveh"}, "")
anims_vroot_receiver = menu.list(anims_vroot, "Receiver", {"sexanimsvehreceiver"}, "")
anims_vroot_giver = menu.list(anims_vroot, "Giver", {"sexanimsvehgiver"}, "")

anims_nroot = menu.list(anims_root, "Normal", {"sexanimsnormal"}, "")
anims_nroot_self = menu.list(anims_nroot, "Self", {"sexanimsnormalself"}, "")
anims_nroot_receiver = menu.list(anims_nroot, "Receiver", {"sexanimsnormalreceiver"}, "")
anims_nroot_giver = menu.list(anims_nroot, "Giver", {"sexanimsnormalgiver"}, "")

function play_anim(dict, name, duration)
    ped = PLAYER.PLAYER_PED_ID()
    while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do
        STREAMING.REQUEST_ANIM_DICT(dict)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(ped, dict, name, 1.0, 1.0, duration, 3, 0.5, false, false, false)
    --TASK_PLAY_ANIM(Ped ped, char* animDictionary, char* animationName, float blendInSpeed, float blendOutSpeed, int duration, int flag, float playbackRate, BOOL lockX, BOOL lockY, BOOL lockZ)
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

function attachto(offx, offy, offz, pid, angx, angy, angz, hash, bone, isnpc, isveh)
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local bone = PED.GET_PED_BONE_INDEX(ped, bone)
    local coords = ENTITY.GET_ENTITY_COORDS(ped, true)
    coords.x = coords['x']
    coords.y = coords['y']
    coords.z = coords['z']
    if isnpc then
        obj = entities.create_ped(1, hash, coords, 90.0)
    elseif isveh then
        obj = entities.create_vehicle(hash, coords, 90.0)
    else
        obj = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, coords['x'], coords['y'], coords['z'], true, false, false)
    end
    ENTITY.SET_ENTITY_INVINCIBLE(obj, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(obj, ped, bone, offx, offy, offz, angx, angy, angz, false, false, true, false, 0, true)
    ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(obj, false, true)
end

menu.action(moans_root, "Female moan", {"sexmoanfsex"}, "", function(on_click)
    moan(players.get_position(players.user()), 'f')
end)

menu.action(moans_root, "Male moan", {"sexmoanfsex"}, "", function(on_click)
    moan(players.get_position(players.user()), 'm')
end)

menu.action(attire_root, "Topless female", {"sextoplessf"}, "", function(on_click)
    menu.trigger_commands("toplessfemale")
end)

menu.action(attire_root, "Tracy", {"sextracy"}, "", function(on_click)
    menu.trigger_commands("igtracydisanto")
end)

menu.action(attire_root, "Penis dude", {"penisguy"}, "", function(on_click)
    menu.trigger_commands("amyacult01")
end)


menu.action(attire_root, "Attach strap-on", {"sexstrapon"}, "", function(on_click)
    request_model_load(-422877666)
    attachto(0.15, 0.15, 0.0, players.user(), -90.0, 0.0, 0.0, -422877666, 11816, false, false)
end)

menu.action(locations_root, "Motel room", {"sexinmotel"}, "", function(on_click)
    menu.trigger_commands("tpmotelroom")
end)

menu.action(locations_root, "Bahama mamas", {"sexinbahamasmamas"}, "", function(on_click)
    menu.trigger_commands("tpbahamamamas")
end)

menu.action(locations_root, "Torture room", {"sexintorturerooms"}, "", function(on_click)
    menu.trigger_commands("tptortureroom")
end)

menu.action(locations_root, "Cinema", {"sexincinema"}, "", function(on_click)
    menu.trigger_commands("tpcinema")
end)


menu.action(locations_root, "Floyd\'s house", {"sexinfloydhouse"}, "", function(on_click)
    menu.trigger_commands("tpfloyd")
end)


menu.action(dances_root, "Lapdance 1", {"sexanimlapdance1"}, "", function(on_click)
    play_anim("mini@strip_club@private_dance@part1", "priv_dance_p1", -1)
end)

menu.action(dances_root, "Lapdance 2", {"sexanimlapdance1"}, "", function(on_click)
    play_anim("mini@strip_club@private_dance@part2", "priv_dance_p2", -1)
end)

menu.action(dances_root, "Lapdance 3", {"sexanimlapdance1"}, "", function(on_click)
    play_anim("mini@strip_club@private_dance@part3", "priv_dance_p3", -1)
end)

menu.action(pole_root, "Pole dance 1", {"sexanimpoledance1"}, "", function(on_click)
    play_anim("mini@strip_club@pole_dance@pole_a_2_stage", "pole_a_2_stage", -1)
end)

menu.action(pole_root, "Pole dance 2", {"sexanimpoledance2"}, "", function(on_click)
    play_anim("mini@strip_club@pole_dance@pole_b_2_stage", "pole_b_2_stage", -1)
end)


menu.action(pole_root, "Pole dance 3", {"sexanimpoledance3"}, "", function(on_click)
    play_anim("mini@strip_club@pole_dance@pole_c_2_prvd_a", "pole_c_2_prvd_a", -1)
end)


menu.action(pole_root, "Pole dance 4", {"sexanimpoledance4"}, "", function(on_click)
    play_anim("mini@strip_club@pole_dance@pole_c_2_prvd_b", "pole_c_2_prvd_b", -1)
end)

menu.action(pole_root, "Pole dance 5", {"sexanimpoledance5"}, "", function(on_click)
    play_anim("mini@strip_club@pole_dance@pole_c_2_prvd_c", "pole_c_2_prvd_c", -1)
end)


menu.action(pole_root, "Pole dance 6", {"sexanimpoledance6"}, "", function(on_click)
    play_anim("mini@strip_club@pole_dance@pole_c_2_stage", "pole_c_2_stage", -1)
end)


menu.action(pole_root, "Pole dance 7", {"sexanimpoledance7"}, "", function(on_click)
    play_anim("mini@strip_club@pole_dance@pole_dance1", "pd_dance_01", -1)
end)

menu.action(pole_root, "Pole dance 8", {"sexanimpoledance8"}, "", function(on_click)
    play_anim("mini@strip_club@pole_dance@pole_dance2", "pd_dance_02", -1)
end)

menu.action(pole_root, "Pole dance 9", {"sexanimpoledance9"}, "", function(on_click)
    play_anim("mini@strip_club@pole_dance@pole_dance3", "pd_dance_03", -1)
end)





menu.action(anims_vroot_receiver, "Car blowjob", {"sexanimcarblowjobr"}, "", function(on_click)
    play_anim("mini@prostitutes@sexlow_veh", "low_car_bj_loop_player", -1)
end)

menu.action(anims_vroot_giver, "Car blowjob", {"sexanimcarblowjobg"}, "", function(on_click)
    play_anim("mini@prostitutes@sexlow_veh", "low_car_bj_loop_female", -1)
end)

menu.action(anims_vroot_receiver, "Car sex", {"sexanimcarsexr"}, "", function(on_click)
    play_anim("mini@prostitutes@sexlow_veh", "low_car_sex_loop_player", -1)
end)

menu.action(anims_vroot_giver, "Car sex", {"sexanimcarsexg"}, "", function(on_click)
    play_anim("mini@prostitutes@sexlow_veh", "low_car_sex_loop_female", -1)
end)

menu.action(anims_nroot_self, "Masturbation", {"sexanimmasturbation"}, "", function(on_click)
    play_anim("switch@trevor@jerking_off", "trev_jerking_off_loop", -1)
end)

menu.action(anims_nroot_giver, "Anal", {"sexanimnanalg"}, "", function(on_click)
    play_anim("rcmpaparazzo_2", "shag_loop_a", -1)
end)

menu.action(anims_nroot_receiver, "Anal", {"sexanimnanalr"}, "", function(on_click)
    play_anim("rcmpaparazzo_2", "shag_loop_poppy", -1)
end)


menu.hyperlink(music_root, "Rezz - Sweet Dreams", "https://www.youtube.com/watch?v=vQloPg7_cfI", "")
menu.hyperlink(music_root, "Ghost Data - Projekt Melody", "https://www.youtube.com/watch?v=mqoEplBvXkI", "")
menu.hyperlink(music_root, "Ghost Data - Full Bodied", "https://www.youtube.com/watch?v=yahcmltC3ZA", "")
menu.hyperlink(music_root, "One True God - Addicted", "https://youtu.be/dfwofTtASo4", "")
menu.hyperlink(music_root, "The Weeknd - Starboy", "https://www.youtube.com/watch?v=34Na4j8AVgA", "")
menu.hyperlink(music_root, "The Weeknd - Heartless", "https://www.youtube.com/watch?v=1DpH-icPpl0", "")
menu.hyperlink(music_root, "One True God - Careless", "https://www.youtube.com/watch?v=8zik3_lBH8g", "")
menu.hyperlink(music_root, "FORD commercial music", "https://youtu.be/bpOSxM0rNPM", "")
menu.hyperlink(music_root, "Tank - Fuckin with me", "https://www.youtube.com/watch?v=HCEdRI5smm4", "")
menu.hyperlink(music_root, "Ty Dolla $ign - Or nah", "https://www.youtube.com/watch?v=Xx8EC34j3yE", "")
menu.hyperlink(music_root, "RIP AND TEAR THAT PUSSY UP", "https://youtu.be/zZMg9ryeWOw", "")

while true do
    util.yield()
end