require("natives-1627063482")
resources_dir = filesystem.resources_dir() .. '/sexlua/'
if not filesystem.is_dir(resources_dir) then
    util.toast("ALERT: resources dir is missing! Please make sure you installed sex lua properly.")
end

logo = directx.create_texture(resources_dir .. 'sexlualogo.png')

if SCRIPT_MANUAL_START then
    AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(PLAYER.PLAYER_PED_ID(), "SEX_GENERIC_FEM", "S_F_Y_HOOKER_01_WHITE_FULL_01", "SPEECH_PARAMS_FORCE_SHOUTED", 0)
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

attire_root = menu.list(menu.my_root(), "Attire", {"sexluaattire"}, "")
locations_root = menu.list(menu.my_root(), "Sex locations", {"sexlualocations"}, "")
music_root = menu.list(menu.my_root(), "Sex music", {"sexluamusic"}, "")
anims_root = menu.list(menu.my_root(), "Sex animations", {"sexluaanims"}, "")
moans_root = menu.list(menu.my_root(), "Moans", {"sexluamoans"}, "")
menu.action(anims_root, "Stop all anims", {"sexstopanims"}, "", function(on_click)
    TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.PLAYER_PED_ID())
end)

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
    AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(PLAYER.PLAYER_PED_ID(), "SEX_GENERIC_FEM", "S_F_Y_HOOKER_01_WHITE_FULL_01", "SPEECH_PARAMS_FORCE_SHOUTED", 0)
end)

menu.action(moans_root, "Male moan", {"sexmoanfsex"}, "", function(on_click)
    AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(PLAYER.PLAYER_PED_ID(), "SEX_GENERIC", "MICHAEL_NORMAL", "SPEECH_PARAMS_FORCE_SHOUTED", 0)
end)

menu.action(moans_root, "Female blowjob", {"sexmoanfblow"}, "", function(on_click)
    AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(PLAYER.PLAYER_PED_ID(), "SEX_ORAL_FEM", "S_F_Y_HOOKER_01_WHITE_FULL_01", "SPEECH_PARAMS_FORCE_SHOUTED", 0)
end)

menu.action(moans_root, "Male climax", {"sexmoanfsex"}, "", function(on_click)
    AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(PLAYER.PLAYER_PED_ID(), "SEX_CLIMAX", "MICHAEL_NORMAL", "SPEECH_PARAMS_FORCE_SHOUTED", 0)
end)

menu.action(attire_root, "Topless female", {"sextoplessf"}, "", function(on_click)
    menu.trigger_commands("toplessfemale")
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

menu.action(locations_root, "Floyd\'s house", {"sexinfloydhouse"}, "", function(on_click)
    menu.trigger_commands("tpfloyd")
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


menu.hyperlink(music_root, "MoxiFloxi - Brat", "https://www.youtube.com/watch?v=0YO7Wq6RpRQ", "")
menu.hyperlink(music_root, "Ghost Data - Projekt Melody", "https://www.youtube.com/watch?v=mqoEplBvXkI", "")
menu.hyperlink(music_root, "Tank - Fuckin with me", "https://www.youtube.com/watch?v=HCEdRI5smm4", "")
menu.hyperlink(music_root, "Ty Dolla $ign - Or nah", "https://www.youtube.com/watch?v=Xx8EC34j3yE", "")

while true do
    util.yield()
end