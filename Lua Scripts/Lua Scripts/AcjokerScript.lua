   --credits to Hexarobi for more help with the script than anyone they are always helping me and let me use their Language library
   --credits to Jerry123 for major help with multiple portions of the script and his LangLib for the template maker
   --credits to Sapphire for the help in programming they are the real MVP for helping everyone
   --credits to Vsus and ghozt for pointing me in the right direction
   --credits to Nowiry for their script it was a heavy influence on the Charger and Lazer Space Docker weapons
   --credits to aaronlink127#0127 for the ScaleformLib script and help with executing it
   --Script made by acjoker8818
   -------------------------------------------------------------------------
require ('resources/AcjokerScript/translations')

local LOADING_START = util.current_time_millis()
LOADING_SCRIPT = true
local SCRIPT_VERSION = "0.22.0"

util.require_natives(1663599433)
util.ensure_package_is_installed('lua/ScaleformLib')

require ('resources/AcjokerScript/ACJSTables')
LANG_SETTINGS = {}
LANG_SETTINGS.LANG_DIR = filesystem.resources_dir() .. 'AcjokerScript\\Languages\\'
LANG_SETTINGS.STRING_FILES = {
    filesystem.scripts_dir() ..SCRIPT_RELPATH,
}

SEC = ENTITY.SET_ENTITY_COORDS
local set = {alert = true}
local my = menu.my_root() 
local menus = {}

local CONFIG_DIR = filesystem.resources_dir() .. 'AcjokerScript\\'
filesystem.mkdirs(CONFIG_DIR)
local Fav_Vehicles = CONFIG_DIR .. "FavVehicles.json"
local Kill_List = CONFIG_DIR .. "Kill_List.json"

menu.action(my, T('Player Options'), {}, T('Redirects you to the Player list in Stand for the Trolling and Friendly options'), function ()
    menu.ref_by_path("Players"):trigger()
end)

local selfroot = menu.list(my, T('Self'), {}, '')
local onlineroot = menu.list(my, T('Online'), {}, '')
local vehroot = menu.list(my, T('Vehicles'), {}, '')
local setroot = menu.list(my, T('Settings'), {}, '')

menu.toggle(setroot, T('Alerts Off'), {'ACAlert'}, T('Turn off the alerts you get from AcjokerScript'), function (on)
    set.alert = not on
end)


 ------------------


 --------------------Functions-------------------------------------
function ACutil(text)
   return util.toast(text)
end
 


function PFP(pedm, playerm)--Ped Facing Player adapted from PhoenixScript
    local ppos = ENTITY.GET_ENTITY_COORDS(playerm)
    local pmpos = ENTITY.GET_ENTITY_COORDS(pedm)
    local hx = ppos.x - pmpos.x
    local hy = ppos.y - pmpos.y
    local head = MISC.GET_HEADING_FROM_VECTOR_2D(hx, hy)
    return ENTITY.SET_ENTITY_HEADING(pedm, head)
end

function Streament(hash) --Streaming Model
    STREAMING.REQUEST_MODEL(hash)
    while STREAMING.HAS_MODEL_LOADED(hash) ==false do
    util.yield()
    end
end

function Streamptfx(lib)
    STREAMING.REQUEST_NAMED_PTFX_ASSET(lib)
    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(lib) do
        util.yield()
    end
    GRAPHICS.USE_PARTICLE_FX_ASSET(lib)
end

function Streamanim(anim) --Streaming Model
    STREAMING.REQUEST_ANIM_DICT(anim)
    while STREAMING.HAS_ANIM_DICT_LOADED(anim) ==false do
        STREAMING.REQUEST_ANIM_DICT(anim)
        util.yield()
    end
end

function Runanim(ent, animdict, anim)
    TASK.TASK_PLAY_ANIM(ent, animdict, anim, 1.0, 1.0, -1, 3, 0.5, false, false, false)
    while ENTITY.IS_ENTITY_PLAYING_ANIM(ent, animdict, anim, 3) ==false do
        TASK.TASK_PLAY_ANIM(ent, animdict, anim, 1.0, 1.0, -1, 3, 0.5, false, false, false)
        util.yield()
    end
end

local scaleform = require('ScaleformLib')
local sf = scaleform('instructional_buttons')
function Hudhide()
    HUD.HIDE_HUD_COMPONENT_THIS_FRAME(6)
    HUD.HIDE_HUD_COMPONENT_THIS_FRAME(7)
    HUD.HIDE_HUD_COMPONENT_THIS_FRAME(8)
    HUD.HIDE_HUD_COMPONENT_THIS_FRAME(9)
---@diagnostic disable-next-line: param-type-mismatch
    memory.write_int(memory.script_global(1645739+1121), 1)
    sf.CLEAR_ALL()
    sf.TOGGLE_MOUSE_BUTTONS(false)
end


function SF() --Scaleform Full credits to aaron
    Hudhide()
    sf.SET_DATA_SLOT(0,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 86, true), Str_trans('Push Away or Blow up'))
    sf.addButton(PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 76, true))
    sf.SET_DATA_SLOT(2,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 88, true) , Str_trans("Yeet"))
    sf.DRAW_INSTRUCTIONAL_BUTTONS()
    sf:draw_fullscreen()
end

function SFlsd() 
    Hudhide()
    sf.SET_DATA_SLOT(0,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 86, true), Str_trans('Lazers'))
    sf.DRAW_INSTRUCTIONAL_BUTTONS()
    sf:draw_fullscreen()
end

function SFle() 
    Hudhide()
    sf.SET_DATA_SLOT(0,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 25, true), Str_trans('Lazer Eyes'))
    sf.DRAW_INSTRUCTIONAL_BUTTONS()
    sf:draw_fullscreen()
end

function SFlev() 
    Hudhide()
    sf.SET_DATA_SLOT(0,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 68, true), Str_trans('Lazer Eyes'))
    sf.DRAW_INSTRUCTIONAL_BUTTONS()
    sf:draw_fullscreen()
end

function SFfly()
    Hudhide()
    sf.SET_DATA_SLOT(2,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 76, true), Str_trans('Fly forward or backward twice as fast'))
    sf.SET_DATA_SLOT(1,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 88, true), Str_trans('Backward'))
    sf.SET_DATA_SLOT(0,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 87, true), Str_trans('Forward'))
    sf.DRAW_INSTRUCTIONAL_BUTTONS()
    sf:draw_fullscreen()
end

function SFfly2()
    Hudhide()
    sf.SET_DATA_SLOT(6,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 62, true), Str_trans('Down'))
    sf.SET_DATA_SLOT(5,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 61, true), Str_trans('Up'))
    sf.SET_DATA_SLOT(4,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 34, true), Str_trans('Left'))
    sf.SET_DATA_SLOT(3,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 35, true), Str_trans('Right'))
    sf.SET_DATA_SLOT(2,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 76, true), Str_trans('Fly forward or backward twice as fast'))
    sf.SET_DATA_SLOT(1,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 88, true), Str_trans('Backward'))
    sf.SET_DATA_SLOT(0,PAD.GET_CONTROL_INSTRUCTIONAL_BUTTONS_STRING(0, 87, true), Str_trans('Forward'))
    sf.DRAW_INSTRUCTIONAL_BUTTONS()
    sf:draw_fullscreen()
end


function Pedspawn(pedhash, tar1)
    Streament(pedhash)
    local pedS = entities.create_ped(1, pedhash, tar1, 0)
    ENTITY.SET_ENTITY_INVINCIBLE(pedS, true)
    ENTITY.FREEZE_ENTITY_POSITION(pedS, true)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pedS, true)
    PED.SET_PED_CAN_LOSE_PROPS_ON_DAMAGE(pedS, false)
    if pedhash == util.joaat('ig_lestercrest') then
        PED.SET_PED_PROP_INDEX(pedS, 1)
    end

    return pedS
end

function SetEntCoor(tar1, ent)
    SEC(ent[1], tar1.x, tar1.y - 0.5, tar1.z - 1.0, false, true, true, false)
    SEC(ent[2], tar1.x - 0.5, tar1.y - 0.5, tar1.z - 1.0, false, true, true, false)
    SEC(ent[3], tar1.x - 0.5, tar1.y, tar1.z - 1.0, false, true, true, false)
    SEC(ent[4], tar1.x - 0.5, tar1.y + 0.5, tar1.z - 1.0, false, true, true, false)
    SEC(ent[5], tar1.x, tar1.y + 0.5, tar1.z - 1.0, false, true, true, false)
    SEC(ent[6], tar1.x + 0.5, tar1.y + 0.5, tar1.z - 1.0, false, true, true, false)
    SEC(ent[7], tar1.x + 0.5, tar1.y, tar1.z - 1.0, false, true, true, false)
    SEC(ent[8], tar1.x + 0.5, tar1.y - 0.5, tar1.z - 1.0, false, true, true, false)
    return ent
end


function Teabagtime(p1, p2, p3, p4, p5, p6, p7, p8)
    util.create_tick_handler (function ()
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(p1, 'LES1A_DHAC', 'LESTER', 'SPEECH_PARAMS_FORCE_SHOUTED', 1)
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(p2, 'TUSCO_AHAD', 'LESTER', 'SPEECH_PARAMS_FORCE_SHOUTED', 1)
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(p3, 'LES1A_DHAC', 'LESTER', 'SPEECH_PARAMS_FORCE_SHOUTED', 1)
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(p4, 'TUSCO_AHAD', 'LESTER', 'SPEECH_PARAMS_FORCE_SHOUTED', 1)
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(p5, 'LES1A_DHAC', 'LESTER', 'SPEECH_PARAMS_FORCE_SHOUTED', 1)
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(p6, 'TUSCO_AHAD', 'LESTER', 'SPEECH_PARAMS_FORCE_SHOUTED', 1)
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(p7, 'LES1A_DHAC', 'LESTER', 'SPEECH_PARAMS_FORCE_SHOUTED', 1)
        AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(p8, 'TUSCO_AHAD', 'LESTER', 'SPEECH_PARAMS_FORCE_SHOUTED', 1)
--AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(p1, 'HS3LE_ANAB', 'LESTER', 'SPEECH_PARAMS_FORCE_SHOUTED', 1)
        util.yield(100)
        end)
end



function Jesuslovesyou(ped_tab)
    util.create_tick_handler (function ()
        for _, pi in ipairs(ped_tab) do
            AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(pi, 'BUMP', 'JESSE', 'SPEECH_PARAMS_FORCE', 1)
            util.yield(250)
        end
    end)
end

function Trevortime(ped_tab)
    util.create_tick_handler (function ()
        for _, pi in ipairs(ped_tab) do
            AUDIO.PLAY_PED_AMBIENT_SPEECH_WITH_VOICE_NATIVE(pi, 'TR2_ABAJ', 'TREVOR', 'SPEECH_PARAMS_FORCE', 1)
            util.yield(100)
        end
    end)
end

function Fuckyou(ped_tab)
    util.create_tick_handler (function ()
        for _, pi in ipairs(ped_tab) do
            AUDIO.PLAY_PED_AMBIENT_SPEECH_NATIVE(pi, 'GENERIC_FUCK_YOU', 'SPEECH_PARAMS_FORCE', 1)
            util.yield(100)
        end
    end)
end

function Insulthigh(ped_tab)
    util.create_tick_handler (function ()
        for _, pi in ipairs(ped_tab) do
            AUDIO.PLAY_PED_AMBIENT_SPEECH_NATIVE(pi, 'Generic_Insult_High', 'SPEECH_PARAMS_FORCE', 1)
            util.yield(100)
        end
    end)
end

function Warcry(ped_tab)
    util.create_tick_handler (function ()
        for _, pi in ipairs(ped_tab) do
            AUDIO.PLAY_PED_AMBIENT_SPEECH_NATIVE(pi, 'GENERIC_WAR_CRY', 'SPEECH_PARAMS_FORCE', 1)
            util.yield(100)
        end

    end)
end

function Provoke(ped_tab)
    util.create_tick_handler (function ()
        for _, pi in ipairs(ped_tab) do
            AUDIO.PLAY_PED_AMBIENT_SPEECH_NATIVE(pi, 'Provoke_Trespass', 'Speech_Params_Force_Shouted_Critical', 1)
            util.yield(100)
        end

    end)
end


function DelEnt(ped_tab)
    for _, Pedm in ipairs(ped_tab) do
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(Pedm)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(Pedm)
        entities.delete_by_handle(Pedm)
    end
end

function Stopsound()
    for i = 0, 99 do
        AUDIO.STOP_SOUND(i)
    end
end

function IPM(targets, tar1, pname, cage_table, pid)
            local tar2 = ENTITY.GET_ENTITY_COORDS(targets)
            local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, tar1.x, tar1.y, tar1.z)
            if disbet <= 0.5  then
            if set.alert then
                ACutil(pname..Str_trans(' Caged'))
            end
            util.yield(800)

            elseif disbet >= 0.5  then
            util.yield(800)
            if set.alert then
                ACutil(pname..Str_trans(' Broke Free'))
            end
            DelEnt(cage_table[pid])
            cage_table[pid] = false
            Stopsound()
            end
end

function ObjSpawn(hsel, tar1)
    local objHash = hsel
  local objS =  OBJECT.CREATE_OBJECT(objHash, tar1.x, tar1.y, tar1.z, true, true, true)
  return objS
end

function ObjFrezSpawn(hsel, tar1)
    local objHash = hsel
  local objfS =  OBJECT.CREATE_OBJECT(objHash, tar1.x, tar1.y, tar1.z, true, true, true)
  ENTITY.FREEZE_ENTITY_POSITION(objfS, true)
  return objfS
end

function SetObjCo(objS, tarx, tary, tarz)
    SEC(objS, tarx, tary, tarz, false, true, true, false)
end

function Vmod(vmod, plate)
    VEHICLE.SET_VEHICLE_FIXED(vmod)
    for M=0, 49 do
        local modn = VEHICLE.GET_NUM_VEHICLE_MODS(vmod, M)
        VEHICLE.SET_VEHICLE_MOD(vmod, M, modn -1, false)
        VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vmod, plate)
        VEHICLE.GET_VEHICLE_MOD_KIT(vmod, 0)
        VEHICLE.SET_VEHICLE_MOD_KIT(vmod, 0)
        VEHICLE.SET_VEHICLE_MOD(vmod, 14, 0)
        VEHICLE.TOGGLE_VEHICLE_MOD(vmod, 22, true)
        VEHICLE.TOGGLE_VEHICLE_MOD(vmod, 18, true)
        VEHICLE.TOGGLE_VEHICLE_MOD(vmod, 20, true)
        VEHICLE.SET_VEHICLE_TYRE_SMOKE_COLOR(vmod, 0, 0, 0)
        VEHICLE.SET_VEHICLE_MAX_SPEED(vmod, 100)
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vmod, 40)
        VEHICLE.SET_VEHICLE_BURNOUT(vmod, false)
    end
end

function Vspawn(mod, pCoor, pedSi, plate)
    
    Streament(mod)
   local vmod = VEHICLE.CREATE_VEHICLE(mod, pCoor.x, pCoor.y, pCoor.z, 0, true, true, false)
    PED.SET_PED_INTO_VEHICLE(pedSi, vmod, -1)
    VEHICLE.SET_VEHICLE_COLOURS(vmod, math.random(0, 160), math.random(0, 160))
    Vmod(vmod, plate)
    local CV = CAM.GET_GAMEPLAY_CAM_RELATIVE_HEADING()
    ENTITY.SET_ENTITY_HEADING(vmod, CV)
end

function Delcar(vic, spec, pid)
    if PED.IS_PED_IN_ANY_VEHICLE(vic) ==true then
        local tarcar = PED.GET_VEHICLE_PED_IS_IN(vic, true)
        GetControl(tarcar, spec, pid)
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(tarcar)
        entities.delete_by_handle(tarcar)
    end
end

function SmashCar(Veh_h, tar1,  invis_aveh, rate)
   local  CC = VEHICLE.CREATE_VEHICLE(Veh_h, tar1.x, tar1.y, tar1.z + 5.0, 0, true, true, false)
   if invis_aveh then
    ENTITY.SET_ENTITY_VISIBLE(CC, false, 0)
end
    ENTITY.SET_ENTITY_INVINCIBLE(CC, true)
    ENTITY.SET_ENTITY_VELOCITY(CC, 0, 0, -1000)
    VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(CC, true)
    VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(CC, true)
    util.yield(rate)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(CC)
    entities.delete_by_handle(CC)
end

function RamCar(Veh_h, tar1x, tar1y, tar1z, invis_aveh, targets, rate)
    local RC = VEHICLE.CREATE_VEHICLE(Veh_h, tar1x, tar1y, tar1z, 0, true, true, false)
    if invis_aveh then
        ENTITY.SET_ENTITY_VISIBLE(RC, false, 0)
    end
    PFP(RC, targets)
    ENTITY.SET_ENTITY_INVINCIBLE(RC, true)
    VEHICLE.SET_VEHICLE_FORWARD_SPEED(RC, 1000)
    VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(RC, true)
    VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(RC, true)
    util.yield(rate)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(RC)
    entities.delete_by_handle(RC)
end

function JuggleCar(Vehj_h, tar1,  invisjugc, jugr)
    local  CC = VEHICLE.CREATE_VEHICLE(Vehj_h, tar1.x, tar1.y, tar1.z - 5.0, 0, true, true, false)
    if invisjugc then
     ENTITY.SET_ENTITY_VISIBLE(CC, false, 0)
 end
     ENTITY.SET_ENTITY_INVINCIBLE(CC, true)
     ENTITY.SET_ENTITY_VELOCITY(CC, 0, 0, 1000)
     VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(CC, true)
     VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(CC, true)
     util.yield(jugr)
     ENTITY.SET_ENTITY_AS_MISSION_ENTITY(CC)
     entities.delete_by_handle(CC)
end

function Getent(vic)
    local tick = 0
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vic)
    while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vic) do
        local nid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(vic)
        NETWORK.SET_NETWORK_ID_CAN_MIGRATE(nid, true)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vic)
        util.yield()
        tick =  tick + 1
        if tick > 10 then
            if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vic) then
                if set.alert then
                    util.toast('Could not gain control')
                end
                return vic
            end
        
        end
    end
    return NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vic)
end

function GetControl(vic, spec, pid)
    if not players.exists(pid) then
        util.stop_thread()
    end
    if pid == players.user() then
        return
    end    
    local tick = 0
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vic)
    while not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vic) do
        local nid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(vic)
        NETWORK.SET_NETWORK_ID_CAN_MIGRATE(nid, true)
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vic)
        util.yield()
        tick =  tick + 1
        if tick > 20 then
            if not NETWORK.NETWORK_HAS_CONTROL_OF_ENTITY(vic) then
                if set.alert then
                    util.toast('Could not gain control')
                end
                if not spec then
                    Specoff(pid)
                end
                util.stop_thread()
            end
        
        end
    end
    return NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vic)

end

function Disbet(pid)
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
    local play = ENTITY.GET_ENTITY_COORDS(players.user_ped(), true)
    local disbet = SYSTEM.VDIST2(play.x, play.y, play.z, tar1.x, tar1.y, tar1.z)
    return disbet
end

function Specon(pid)
    menu.trigger_commands("spectate".. players.get_name(pid).. ' on')
    util.yield(3000)
end

function Specoff(pid)
    menu.trigger_commands("spectate".. players.get_name(pid).. ' off')
end

function Maxoutcar(pid)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    GetControl(vmod, spec, pid)
     Vmod(vmod, T("URWLCUM"))
     VEHICLE.SET_VEHICLE_WHEEL_TYPE(vmod, math.random(0, 7))
     VEHICLE.SET_VEHICLE_MOD(vmod, 23, math.random(-1, 50))
     ENTITY.SET_ENTITY_INVINCIBLE(vmod, true)
     if set.alert then
     util.toast('Vehicle Maxed out')
     end
end

function Platechange(cusplate, pid)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(vmod, cusplate)
    if set.alert then
    util.toast('Vehicle plate changed')
    end
end

function Fixveh(pid)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_FIXED(vmod)
    VEHICLE.SET_VEHICLE_ENGINE_HEALTH(vmod, 1000)
    ENTITY.SET_ENTITY_INVINCIBLE(vmod, true)
    VEHICLE.SET_VEHICLE_IS_CONSIDERED_BY_PLAYER(vmod, true)
    ENTITY.SET_ENTITY_HEALTH(vmod, 200)
    if set.alert then
    util.toast('Vehicle Repaired')
    end
end

function Accelveh( speed, pid)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_FORWARD_SPEED(vmod, speed)
    if set.alert then
    util.toast('Vehicle Accelerated')
    end
end

function Topspeedveh(speed, pid)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_MAX_SPEED(vmod, 100000)
    VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vmod, speed)
    if set.alert then
    util.toast('Vehicles Max Speed Modified')
    end
end



function Stopveh(pid)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_FORWARD_SPEED(vmod, -1000)
    ENTITY.SET_ENTITY_VELOCITY(vmod, 0, 0, 0)
    VEHICLE.SET_VEHICLE_ENGINE_ON(vmod, false, false, false)
    if set.alert then
    util.toast('Slowing down Vehicle')
    end
end

function Rpaint(pid)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_FIXED(vmod)
    VEHICLE.SET_VEHICLE_COLOURS(vmod, math.random(0, 160), math.random(0, 160))
    if set.alert then
    util.toast('Vehicle Painted')
    end
end

function GetPlayVeh(pid, opt)

    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if not players.exists(pid) then
        util.stop_thread()
    end
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if set.alert then
        util.toast('Getting control of vehicle')
    end
    if Disbet(pid) > 750000  then
        Specon(pid)
    if PED.IS_PED_IN_ANY_VEHICLE(pedm, true) then
        opt()
        if not spec then
            Specoff(pid)
        end
        return
    else
        if set.alert then
        util.toast('Player not in vehicle')
        end
        Specoff(pid)
    end
    elseif Disbet(pid) < 750000 then
        if PED.IS_PED_IN_ANY_VEHICLE(pedm, true) then
            opt()
            if not spec then
                Specoff(pid)
            end
        return
        end
    else
        if set.alert then
        util.toast('Player not in vehicle')
        end
    end
end

function RGBNeonKit(pedm)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    for i = 0, 3 do
        VEHICLE.SET_VEHICLE_NEON_ENABLED(vmod, i, true)
    end
end

function Changewheel(pid, wtype, wheel)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
    local vhash = ENTITY.GET_ENTITY_MODEL(vmod)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if not players.exists(pid) then
        util.stop_thread()
    end
        GetControl(vmod, spec, pid)
    if VEHICLE.IS_THIS_MODEL_A_BIKE(vhash) then
        VEHICLE.SET_VEHICLE_WHEEL_TYPE(vmod, wtype)
        VEHICLE.SET_VEHICLE_MOD(vmod, 23, wheel)
        VEHICLE.SET_VEHICLE_MOD(vmod, 24, wheel)
    else
        VEHICLE.SET_VEHICLE_WHEEL_TYPE(vmod, wtype)
        VEHICLE.SET_VEHICLE_MOD(vmod, 23, wheel)
    end
end


function Changehead(pid, color)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if not players.exists(pid) then
        util.stop_thread()
    end
        GetControl(vmod, spec, pid)
    VEHICLE.TOGGLE_VEHICLE_MOD(vmod, 22, true)
    VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vmod, color)
end

function Changeneon(pid, color)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if not players.exists(pid) then
        util.stop_thread()
    end
        GetControl(vmod, spec, pid)
    RGBNeonKit(pedm)
    VEHICLE.SET_VEHICLE_NEON_INDEX_COLOUR(vmod, color)

end

function Changetint(pid, tint)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if not players.exists(pid) then
        util.stop_thread()
    end
        GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_FIXED(vmod)
    VEHICLE.SET_VEHICLE_WINDOW_TINT(vmod, tint)
end




function Changecolor(pid, color)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if not players.exists(pid) then
        util.stop_thread()
    end
        GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_FIXED(vmod)
    VEHICLE.SET_VEHICLE_COLOURS(vmod, color.prim, color.sec)
end


function Changewhepercolor(pid, color)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if not players.exists(pid) then
        util.stop_thread()
    end
        GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_FIXED(vmod)
    VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vmod, color.per, color.whe)
end

function Changeintcolor(pid, color)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if not players.exists(pid) then
        util.stop_thread()
    end
        GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_FIXED(vmod)
    VEHICLE.SET_VEHICLE_EXTRA_COLOUR_5(vmod, color)
end

function Changedashcolor(pid, color)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if not players.exists(pid) then
        util.stop_thread()
    end
        GetControl(vmod, spec, pid)
    VEHICLE.SET_VEHICLE_FIXED(vmod)
    VEHICLE.SET_VEHICLE_EXTRA_COLOUR_6(vmod, color)
end

function Changemod(pid, modtype, mod)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    if not players.exists(pid) then
        util.stop_thread()
    end
    if PED.IS_PED_IN_ANY_VEHICLE(pedm) ==true then
        local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
            GetControl(vmod, spec, pid)
        VEHICLE.GET_NUM_MOD_KITS(vmod)
        VEHICLE.GET_VEHICLE_MOD_KIT(vmod)
        VEHICLE.SET_VEHICLE_MOD_KIT(vmod, 0)
        VEHICLE.SET_VEHICLE_MOD(vmod, modtype, mod, false)
    end
end

function Getmodcou(pid, mod)
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    if PED.IS_PED_IN_ANY_VEHICLE(pedm) ==true then
        local max = VEHICLE.GET_NUM_VEHICLE_MODS(vmod, mod)
        return max
    end
    
end

function Combinetab(result, ...)
    for i, t in pairs({...}) do
        for _, v in pairs(t) do
            table.insert(result, v)
        end
    end
end



--memory stuff skidded from heist control
    local Int_PTR = memory.alloc_int()

    local function getMPX()
        return 'MP'.. util.get_char_slot() ..'_'
    end
    

    local function STAT_GET_INT(Stat)
        STATS.STAT_GET_INT(util.joaat(getMPX() .. Stat), Int_PTR, -1)
        return memory.read_int(Int_PTR)
    end
    function SET_INT_LOCAL(script, script_local, value)
        if memory.script_local(script, script_local) ~= 0 then
            memory.write_int(memory.script_local(script, script_local), value)
        end
    end
    function GET_INT_LOCAL(script, script_local)
        if memory.script_local(script, script_local) ~= 0 then
            local ReadLocal = memory.read_int(memory.script_local(script, script_local))
            if ReadLocal ~= nil then
                return ReadLocal
            end
        end
    end



    

    function Rolladown(pid)
        local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        GetControl(pedm, spec, pid)
        VEHICLE.ROLL_DOWN_WINDOWS(vmod)
    end

    function Rollaup(pid)
        local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        GetControl(pedm, spec, pid)
        for i = 0, 7 do
            VEHICLE.ROLL_UP_WINDOW(vmod, i)
        end
    end
    
    function Rolldindivid(pid, win)
        local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        GetControl(pedm, spec, pid)
        VEHICLE.ROLL_DOWN_WINDOW(vmod, win)
    end

    function Rolluindivid(pid, win)
        local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        GetControl(pedm, spec, pid)
        VEHICLE.ROLL_UP_WINDOW(vmod, win)
    end



    
    local next_preview
    local image_preview
    local function rotation_to_direction(rotation)
        local adjusted_rotation =
        {
            x = (math.pi / 180) * rotation.x,
            y = (math.pi / 180) * rotation.y,
            z = (math.pi / 180) * rotation.z
        }
        local direction =
        {
            x = -math.sin(adjusted_rotation.z) * math.abs(math.cos(adjusted_rotation.x)),
            y =  math.cos(adjusted_rotation.z) * math.abs(math.cos(adjusted_rotation.x)),
            z =  math.sin(adjusted_rotation.x)
        }
        return direction
    end
    local function get_offset_from_camera(distance)
        local cam_rot = CAM.GET_FINAL_RENDERED_CAM_ROT(0)
        local cam_pos = CAM.GET_FINAL_RENDERED_CAM_COORD()
        local direction = rotation_to_direction(cam_rot)
        local destination =
        {
            x = cam_pos.x + direction.x * distance,
            y = cam_pos.y + direction.y * distance,
            z = cam_pos.z + direction.z * distance
        }
        return destination
    end

    function Update_preview_tick(current_preview)
        if current_preview ~= nil then
            current_preview.position = get_offset_from_camera(current_preview.camera_distance)
            current_preview.rotation.z = current_preview.rotation.z + 2
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(
                    current_preview.handle,
                    current_preview.position.x,
                    current_preview.position.y,
                    current_preview.position.z,
                    true, false, false
            )
            ENTITY.SET_ENTITY_ROTATION(
                    current_preview.handle,
                    current_preview.rotation.x,
                    current_preview.rotation.y,
                    current_preview.rotation.z,
                    2, true
            )
            ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(current_preview.handle,  false, true)
            ENTITY.SET_ENTITY_ALPHA(current_preview.handle, 206, false)
            ENTITY.FREEZE_ENTITY_POSITION(current_preview.handle, true)
            ENTITY.SET_ENTITY_INVINCIBLE(current_preview.handle, true)
        end
    end

    function Player_rotate()
        local CV = CAM.GET_GAMEPLAY_CAM_COORD()
        local rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
        local he = MISC.GET_HEADING_FROM_VECTOR_2D(CV.x, CV.y)
        ENTITY.SET_ENTITY_HEADING(players.user_ped(), he)
        ENTITY.SET_ENTITY_ROTATION(players.user_ped(), rot.x, rot.y, rot.z, 0, true)
    end

    function Leyes(lazer, impact, camrot, weap)
        local reye, leye
        Player_rotate()
        if util.is_session_started() then
            reye = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(players.user_ped(), PED.GET_PED_BONE_INDEX(players.user_ped(), 0x6b52))
            leye = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(players.user_ped(), PED.GET_PED_BONE_INDEX(players.user_ped(), 0x62ac))
            else
            reye = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(players.user_ped(), PED.GET_PED_BONE_INDEX(players.user_ped(), 6468))
            leye = ENTITY.GET_WORLD_POSITION_OF_ENTITY_BONE(players.user_ped(), PED.GET_PED_BONE_INDEX(players.user_ped(), 5956))
        end
                -- credits to jinxscript
                local inst = v3.new()
                local cama = {}
                v3.set(inst,CAM.GET_FINAL_RENDERED_CAM_ROT(2))
                local tmp = v3.toDir(inst)
                v3.set(inst, v3.get(tmp))
                v3.mul(inst, 1000)
                v3.set(tmp, CAM.GET_FINAL_RENDERED_CAM_COORD())
                v3.add(inst, tmp)
                cama.x, cama.y, cama.z = v3.get(inst)
                if lazer.exp then
                    if WEAPON.GET_PED_LAST_WEAPON_IMPACT_COORD(players.user_ped(), memory.addrof(impact)) then
                        FIRE.ADD_EXPLOSION(impact.x, impact.y, impact.z, 81, 5000, true, false, 0.0, false)
                    end
                end
        Streamptfx('weap_xs_weapons')
        camrot.x += 90
        camrot.y += 180
        GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD('bullet_tracer_xs_sr', reye.x, reye.y, reye.z, camrot.x, camrot.y,  camrot.z, 1, true)
        Streamptfx('weap_xs_weapons')
        GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD('bullet_tracer_xs_sr', leye.x, leye.y, leye.z, camrot.x, camrot.y,  camrot.z, 1, true)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(reye.x, reye.y, reye.z, cama.x, cama.y,  cama.z , 200, 0, weap, players.user_ped(), true, false, 1000, players.user_ped())
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(leye.x, leye.y, leye.z, cama.x, cama.y,  cama.z, 200, 0, weap, players.user_ped(), true, false, 1000, players.user_ped())

    end






function RepairGod(veh)
    VEHICLE.SET_VEHICLE_FIXED(veh)
    VEHICLE.SET_VEHICLE_ENGINE_HEALTH(veh, 1000)
    ENTITY.SET_ENTITY_INVINCIBLE(veh, true)
    VEHICLE.SET_VEHICLE_IS_CONSIDERED_BY_PLAYER(veh, true)
    ENTITY.SET_ENTITY_HEALTH(veh, 200)
end

function AddBlip(entity, blipSprite, colour)-- wiri function
	local blip = HUD.ADD_BLIP_FOR_ENTITY(entity)
	HUD.SET_BLIP_SPRITE(blip, blipSprite)
	HUD.SET_BLIP_COLOUR(blip, colour)
	HUD.SHOW_HEIGHT_ON_BLIP(blip, false)

	util.create_tick_handler(function ()
		if not ENTITY.DOES_ENTITY_EXIST(entity)or ENTITY.IS_ENTITY_DEAD(entity, false) then
			util.remove_blip(blip)
			return false
		elseif not HUD.DOES_BLIP_EXIST(blip) then
			return false
		else
			local heading = ENTITY.GET_ENTITY_HEADING(entity)
        	HUD.SET_BLIP_ROTATION(blip, math.ceil(heading))
		end
	end)

	return blip
end






local pil_dri = {'S_M_M_Pilot_01'}
local gunners = {'s_m_y_blackops_01', 's_m_y_blackops_02', 's_m_y_blackops_03'}
local plneatkr = {}
local heliatkr = {}
local vehatkr = {}
local plneveh = {}
local heliveh = {}
local atkveh = {}
local atkset = {model = 'a_m_y_methhead_01', invis = false, invinc = true, weap = 'weapon_railgun', atkrdelete = false, p = 0, 
count = 1, delveh = false, clone = false}
local platkset = {invis = false, invinc = true, plane = 'lazer', p = 0, plcount = 1, plnedelete = false, weapon = 'weapon_railgun',
 disbetplne = nil, delveh = false}
local heliatkset = {invis = false, invinc = true, helicopter = 'buzzard', h = 0, hlcount = 1, helidelete = false, weapon = 'weapon_railgun',
disbetheli = nil, delveh = false}
local vehatkset = {invis = false, invinc = true, attkrveh = 'minitank', atkv = 0, vlcount = 1, vehdelete = false, weapon = 'weapon_railgun',
disbetveh = nil, delveh = false}

local spawatk = {}
local spawnatkset = {invis = false, invinc = true, weapon = 'weapon_railgun'}
function Atkrspawn(invinc, invis, pid, hash)
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(targets, 1, 0, 0)
    local mdl = util.joaat(hash)
    Streament(mdl)
    local attacker = entities.create_ped(1, mdl, tar1, 0)
    if invinc then
        ENTITY.SET_ENTITY_INVINCIBLE(attacker, true)
    end
    PED.SET_PED_COMBAT_ABILITY(attacker, 2)
    PED.SET_PED_RANDOM_PROPS(attacker)
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 5, true)--always fight
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 13, true)--aggressive
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 21, true)--can chase
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 27, true)--perf acc
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 27, true)--dis bull react
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 58, true)--disable flee
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 63, false)-- flee from invinc off
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 71, true)--allow charge beyond defense area
    PED.SET_PED_COMBAT_ATTRIBUTES(attacker, 54, true)-- best weapon
    TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(attacker, 300.0, 0)
    WEAPON.GIVE_WEAPON_TO_PED(attacker, util.joaat(spawnatkset.weapon), 9999, true, true)
    if invis then
        ENTITY.SET_ENTITY_VISIBLE(attacker, false, 0)
    end
    WEAPON.SET_PED_INFINITE_AMMO_CLIP(attacker, true)
    TASK.TASK_GO_TO_ENTITY(attacker, targets,  -1, -1, 500.0, 0, 0)
    TASK.TASK_COMBAT_PED(attacker, targets, 0, 16)
    TASK.TASK_AIM_GUN_AT_ENTITY(attacker, targets, -1, true)
    TASK.TASK_SHOOT_AT_ENTITY(attacker, targets, -1, util.joaat('FIRING_PATTERN_FULL_AUTO'))
    PED.SET_PED_KEEP_TASK(attacker, true)
    PED.SET_PED_RELATIONSHIP_GROUP_HASH(attacker, util.joaat('rgfm_aihateplyrlikeallai'))
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(attacker, true)
    AddBlip(attacker, 1, 1)
    if not players.exists(pid) then
        util.stop_thread()
    end
    return attacker
end

function Atkrrefresh(pid)
    if not players.exists(pid) or atkset.atkrdelete then
        util.stop_thread()
    end
    local pname = PLAYER.GET_PLAYER_NAME(pid)
    if set.alert then
        ACutil(Str_trans('Attackers sent after ')..pname)
    end
        for _, atk in pairs(spawatk) do
            local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local tar1 = ENTITY.GET_ENTITY_COORDS(atk)
            local tar2 = ENTITY.GET_ENTITY_COORDS(targets)
            local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, tar1.x, tar1.y, tar1.z)
            local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
            if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targets) then
                if atkset.delveh then
                    Delcar(targets, spec, pid)
                end
            end
             if  PED.IS_PED_DEAD_OR_DYING(targets, 1) or disbet >= 1000 then
                if set.alert then
                    ACutil(pname..Str_trans(' died or moved reseting attackers'))
                end
                    DelEnt(spawatk)
                    atkset.p = 0
                    spawatk = {}
                    util.yield(8000)
                    while atkset.p < atkset.count and players.exists(pid) do
                        local atkr = Atkrspawn(atkset.invinc, atkset.invis, pid , atkset.model)
                        if atkset.clone then
                            PED.CLONE_PED_TO_TARGET(targets, atkr)
                        end
                        NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.PED_TO_NET(atkr), true)
                        NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.PED_TO_NET(atkr), players.user(), true)
                        table.insert(spawatk, atkr)
                        atkset.p = atkset.p + 1
                        if #spawatk == atkset.count then
                            return
                        end
                    end
                end
    end
end 

function Refreshplnes(pid)
    if not players.exists(pid) or platkset.plnedelete then
        util.stop_thread()
    end
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pname = PLAYER.GET_PLAYER_NAME(pid)
    if set.alert then
        ACutil(Str_trans('Planes sent after ')..pname)
    end
    for key, plne in pairs(plneveh) do
        local tarv = ENTITY.GET_ENTITY_COORDS(plne)
        local tar2 = ENTITY.GET_ENTITY_COORDS(targets)
        platkset.disbetplne = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, tarv.x, tarv.y, tarv.z)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targets) then
            if platkset.delveh then
                Delcar(targets, spec, pid)
            end
        end
        if  PED.IS_PED_DEAD_OR_DYING(targets, 1) or platkset.disbetplne >= 1000000 then
            if set.alert then
                ACutil(pname..Str_trans(' died or moved reseting planes'))
            end
            DelEnt(plneveh)
            DelEnt(plneatkr)
        plneveh = {}
        plneatkr = {}
        platkset.p = 0
            util.yield(8000)
            while platkset.p < platkset.plcount and players.exists(pid)  do
                local veh, pil = Plneatkr(platkset.invinc, platkset.invis, pid, platkset.plane)
                NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(veh), true)
                NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(veh), players.user(), true)
                table.insert(plneveh, veh)
                table.insert(plneatkr, pil)
                util.yield(150)
                platkset.p = platkset.p + 1
                if #plneveh == platkset.plcount then
                    return
                end
            end
        end  
    end
end
function RefreshHeli(pid)
    if not players.exists(pid) or heliatkset.helidelete then
        util.stop_thread()
    end
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pname = PLAYER.GET_PLAYER_NAME(pid)
    if set.alert then
        ACutil(Str_trans('Helicopters sent after ')..pname)
    end
    for key, heli in pairs(heliveh) do
        local tarv = ENTITY.GET_ENTITY_COORDS(heli)
        local tar2 = ENTITY.GET_ENTITY_COORDS(targets)
        heliatkset.disbetheli = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, tarv.x, tarv.y, tarv.z)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targets) then
            if heliatkset.delveh then
                Delcar(targets, spec, pid)
            end
        end

        if  PED.IS_PED_DEAD_OR_DYING(targets, 1) or heliatkset.disbetheli >= 340000  then
            if set.alert then
                ACutil(pname..Str_trans(' died or moved reseting helicopters'))
            end
            DelEnt(heliatkr)
            DelEnt(heliveh)
        
            heliatkr = {}
            heliveh = {}
            heliatkset.h = 0
            util.yield(8000)
            while heliatkset.h < heliatkset.hlcount and players.exists(pid) do
                local atk, pil = Heliatkr(heliatkset.invinc, heliatkset.invis, pid, heliatkset.helicopter)
                NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(atk), true)
                NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(atk), players.user(), true)
                table.insert(heliveh, atk)
                table.insert(heliatkr, pil)
                util.yield(250)
                heliatkset.h = heliatkset.h + 1
                if #heliveh == heliatkset.hlcount then
                    return
                end
            end
        end
    end
end



function Refreshveh(pid)
    
    if not players.exists(pid) or vehatkset.vehdelete then
        util.stop_thread()
    end
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local pname = PLAYER.GET_PLAYER_NAME(pid)
    if set.alert then
        ACutil(Str_trans('Attack vehicles sent after ')..pname)
    end
    for key, veh in pairs(atkveh) do
        local tarv = ENTITY.GET_ENTITY_COORDS(veh)
        local tar2 = ENTITY.GET_ENTITY_COORDS(targets)
        vehatkset.disbetveh = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, tarv.x, tarv.y, tarv.z)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targets) then
            if vehatkset.delveh then
                Delcar(targets, spec, pid)
            end
        end

        if  PED.IS_PED_DEAD_OR_DYING(targets, 1) or vehatkset.disbetveh >= 1000  then
            if set.alert then
                ACutil(pname..Str_trans(' died or moved reseting attack vehicles'))
            end
            DelEnt(vehatkr)
            DelEnt(atkveh)
        
            vehatkr = {}
            atkveh = {}
            vehatkset.atkv = 0
            util.yield(8000)
            while vehatkset.atkv < vehatkset.vlcount and players.exists(pid) do
                local v, dri = Vehatkr(vehatkset.invinc, vehatkset.invis, pid, vehatkset.attkrveh)
                NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(v), true)
                NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(v), players.user(), true)
                table.insert(atkveh, v)
                table.insert(vehatkr, dri)
                util.yield(250)
                vehatkset.atkv = vehatkset.atkv + 1
                if #atkveh == vehatkset.vlcount then
                    return
                end
            end
        end
        
    end
end



function Atk(tab, targets, weapon, pilot)
    for key, atkr in pairs(tab) do
        local playerRelGroup = PED.GET_PED_RELATIONSHIP_GROUP_HASH(targets)
        PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("ARMY"), playerRelGroup)
        PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, playerRelGroup, util.joaat("ARMY"))
        PED.SET_RELATIONSHIP_BETWEEN_GROUPS(0, util.joaat("ARMY"), util.joaat("ARMY"))
        WEAPON.GIVE_WEAPON_TO_PED(atkr, util.joaat(weapon), -1, false, true)
        
        PED.SET_PED_COMBAT_ATTRIBUTES(atkr, 20, true)

        PED.SET_PED_MAX_HEALTH(atkr, 500)
        ENTITY.SET_ENTITY_HEALTH(atkr, 500, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(atkr, true)
        PED.SET_PED_SHOOT_RATE(atkr, 1000)
        PED.SET_PED_RELATIONSHIP_GROUP_HASH(atkr, util.joaat("ARMY"))
        TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(atkr, 200.0, 0)
        TASK.TASK_COMBAT_PED(atkr , targets, 0, 16)
        TASK.CONTROL_MOUNTED_WEAPON(atkr)
        PED.SET_PED_KEEP_TASK(pilot, true)
        PED.SET_PED_ACCURACY(atkr , 100.0)
        PED.SET_PED_COMBAT_ABILITY(atkr , 2)
    end
end


function Plneatkr(invinc, invis, pid, hash)
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(targets, 1.0, 0.0, 500.0)
    local pilhs = util.joaat(pil_dri[1])
    local plne = util.joaat(hash)
    Streament(plne)
    Streament(pilhs)
    for key, gunner in pairs(gunners) do
        local gunh = util.joaat(gunner)
        Streament(gunh)
    end

    for i= 1 , 100 do
        tar1.x = tar1.x + i * 2
        tar1.y = tar1.y + i * 2
   
        local atkplne = VEHICLE.CREATE_VEHICLE(plne, tar1.x, tar1.y, tar1.z, 0.0, true, true, false)
        Vmod(atkplne, 'fuckoff')
        local nid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(atkplne)
        --entities.set_can_migrate(nid, false)
        if invinc then
            ENTITY.SET_ENTITY_INVINCIBLE(atkplne, true)
        end
        if invis then
            ENTITY.SET_ENTITY_VISIBLE(atkplne, false, 0)
        end

            local plpilot = entities.create_ped(1, pilhs, tar1, 0)
            local plnid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(plpilot)
            --entities.set_can_migrate(plnid, false)
            PED.SET_PED_INTO_VEHICLE(plpilot , atkplne, -1)
            table.insert(plneatkr, plpilot)
            local seatnum = VEHICLE.GET_VEHICLE_MODEL_NUMBER_OF_SEATS(plne) - 1
                for j = 1, seatnum do
                    if ENTITY.DOES_ENTITY_EXIST(atkplne) then
                        util.yield(10)
                            local gunner = entities.create_ped(1, util.joaat(gunners[j]), tar1, 0) 
                            PED.SET_PED_INTO_VEHICLE(gunner , atkplne, -2)
                            table.insert(plneatkr, gunner)
                    end
                end

                Atk(plneatkr, targets, platkset.weapon, plpilot)
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(atkplne, 80)
            VEHICLE.CONTROL_LANDING_GEAR(atkplne, 3)
            TASK.TASK_PLANE_MISSION(plpilot , atkplne, 0, targets, 0, 0, 0, 6, 0.0, 0, 0.0, 50.0, 40.0)
            TASK.TASK_COMBAT_PED(plpilot , targets, 0, 16)
            PED.SET_PED_ACCURACY(plpilot , 100.0)
            PED.SET_PED_COMBAT_ABILITY(plpilot , 2)
            TASK.CONTROL_MOUNTED_WEAPON(plpilot)
            PED.SET_PED_KEEP_TASK(plpilot, true)
            AddBlip(atkplne, 424, 1)
            util.yield()
            


 
    return atkplne, plpilot
    end
end

function Heliatkr(invinc, invis, pid, hash)
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(targets, 1.0, 0.0, 100.0)
    local pilhs = util.joaat(pil_dri[1])
    for key, gunner in pairs(gunners) do
        local gunh = util.joaat(gunner)
        Streament(gunh)
    end

    local heli = util.joaat(hash)
    Streament(heli)
    Streament(pilhs)


    for i= 1 , 100 do
        tar1.x = tar1.x + i * 2
        tar1.y = tar1.y + i * 2
   
        local atkheli = VEHICLE.CREATE_VEHICLE(heli, tar1.x, tar1.y, tar1.z, 0.0, true, true, false)
        Vmod(atkheli, 'fuckoff')
        local nid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(atkheli)
        --entities.set_can_migrate(nid, false)
        if invinc then
            ENTITY.SET_ENTITY_INVINCIBLE(atkheli, true)
        end
        if invis then
            ENTITY.SET_ENTITY_VISIBLE(atkheli, false, 0)
        end
        local pilot = entities.create_ped(1, pilhs, tar1, 0)
        PED.SET_PED_INTO_VEHICLE(pilot , atkheli, -1)
        table.insert(heliatkr, pilot)
        local seatnum = VEHICLE.GET_VEHICLE_MODEL_NUMBER_OF_SEATS(heli) - 1
            for j = 1, seatnum do
                if ENTITY.DOES_ENTITY_EXIST(atkheli) then
                    util.yield(10)
                    
                        local gunner = entities.create_ped(1, util.joaat(gunners[j]), tar1, 0) 
                        PED.SET_PED_INTO_VEHICLE(gunner , atkheli, -2)
                        table.insert(heliatkr, gunner)
                end
            end
			PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pilot, true)
			
			TASK.TASK_HELI_MISSION(pilot, heli, 0, targets, 0.0, 0.0, 0.0, 6, 150.0, 40.0, -1.0, 0, 10, -1.0, 16)
            TASK.CONTROL_MOUNTED_WEAPON(pilot)
            
            
            Atk(heliatkr, targets, heliatkset.weapon, pilot)
            if hash == 'akula' or 'annihilator2' then
                VEHICLE.SET_DEPLOY_FOLDING_WINGS(atkheli, true, true)
            end
            VEHICLE.SET_HELI_BLADES_FULL_SPEED(atkheli)
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(atkheli, 80)
            VEHICLE.CONTROL_LANDING_GEAR(atkheli, 3)
            AddBlip(atkheli, 422, 1)
            util.yield()
       

    return atkheli, pilot
    end
end

function Vehatkr(invinc, invis, pid, hash)
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(targets, math.random(-1, 1), math.random(-1, 1), 0.0)
    local drihs = util.joaat(pil_dri[1])
    for key, gunner in pairs(gunners) do
        local gunh = util.joaat(gunner)
        Streament(gunh)
    end

    local vhash = util.joaat(hash)
    Streament(vhash)
    Streament(drihs)

    for i= 1 , 100 do
        tar1.x = tar1.x + i * 2
        tar1.y = tar1.y + i * 2
   
        local vatkr = VEHICLE.CREATE_VEHICLE(vhash, tar1.x, tar1.y, tar1.z, 0.0, true, true, false)
        Vmod(vatkr, 'fuckoff')
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vatkr, 150)
        local nid = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(vatkr)
        --entities.set_can_migrate(nid, false)
        if invinc then
            ENTITY.SET_ENTITY_INVINCIBLE(vatkr, true)
        end
        if invis then
            ENTITY.SET_ENTITY_VISIBLE(vatkr, false, 0)
        end
        local driver = entities.create_ped(1, drihs, tar1, 0)
        PED.SET_PED_INTO_VEHICLE(driver , vatkr, -1)
        table.insert(vehatkr, driver)
        local seatnum = VEHICLE.GET_VEHICLE_MODEL_NUMBER_OF_SEATS(vhash) - 1
            for j = 1, seatnum do
                if ENTITY.DOES_ENTITY_EXIST(vatkr) then
                    util.yield(10)
                    
                        local gunner = entities.create_ped(1, util.joaat(gunners[j]), tar1, 0) 
                        PED.SET_PED_INTO_VEHICLE(gunner , vatkr, -2)
                        table.insert(vehatkr, gunner)
                end
            end
			PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(driver, true)
			
			TASK.TASK_VEHICLE_MISSION(driver, vatkr, 0, targets, 9, 150.0, 40.0, -1.0, 0, 10, -1.0, 16)
            TASK.CONTROL_MOUNTED_WEAPON(driver)
            

            Atk(vehatkr, targets, vehatkset.weapon, driver)

           
            TASK.TASK_VEHICLE_DRIVE_WANDER(driver, vatkr, 10.0, 786603) 
            PED.SET_PED_KEEP_TASK(driver, true)
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(vatkr, 20)
            if hash == 'minitank' then
                AddBlip(vatkr, 742, 1)
            elseif hash == 'ruiner2'  then
                AddBlip(vatkr, 530, 1)
            else
                AddBlip(vatkr, 421, 1)
            end
            
            util.yield()
       

    return vatkr, driver
    end
end

local ped_hash =  {SPC, AMC, AfC, CSP, GM, Mpp, MSF, MCM, SMC, Ssf, Ssm, Dlcp}
local ped_names = {SPClist, AMClist, AfClist, Csplist, GM, Mpplist, MSFlist, MCMlist, SMClist, Ssflist, Ssmlist, Dlcplist}

function PedList(menusel, action_function)
    for i, description in pairs(Pedlistname) do
        menu.list_action(menusel, description[1], {''}, description[2], ped_names[i], function(pedsel)
            action_function(ped_hash[i][pedsel])
        end)
    end
end


function RGBpaintplayer(pid, oprgb, osprgb)
    GetPlayVeh(pid, function ()
        if not players.exists(pid) then
            util.stop_thread()
        end
        local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, true)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
            GetControl(vmod, spec, pid)
        VEHICLE.SET_VEHICLE_FIXED(vmod)
        local red = math.floor(oprgb.color.r * 255)
        local green = math.floor(oprgb.color.g * 255)
        local blue = math.floor(oprgb.color.b * 255)
        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vmod, red, green, blue)
        local sred = math.floor(osprgb.color.r * 255)
        local sgreen = math.floor(osprgb.color.g * 255)
        local sblue = math.floor(osprgb.color.b * 255)
        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vmod, sred, sgreen, sblue)
end)
end






-------------------------------------------------------------------------------------------------------


-------------------------------- Teleports---------------------------------------------------
TeleRoot = menu.list(selfroot, T('Teleports'), {}, '')
-- credits to Jerry this is a modified version of his property TP
local ownedprops = {
    {T('Agency'), 826},
    {T('Arcade'), 740},
    {T('Auto shop'), 779},
    {T('Bunker'), 557},
    {T('Cargo Warehouses'), 473},
    {T('CEO Office'),   475 },
    {T('Facility'), 590},
    {T('Hangar'), 569},
    {T('MC Clubhouse'), 492,
    mcprops = {T('MC Businesses'), loc = {
        {T('Cocaine Lockup'), 497 },
        {T('Counterfeit Cash'), 500 },
        {T('Document Forgery'), 498 },
        {T('Methamphetamine Lab'), 499 },
        {T('Weed Farm'), 496 },
    }}},
    {T('Night Club'), 614},
    {T('Vehicle Warehouse'), 524}
}

local function getblip(id)
    local blip = HUD.GET_FIRST_BLIP_INFO_ID(id)
    while blip ~= 0 do
        local blipColour = HUD.GET_BLIP_COLOUR(blip)
        if HUD.DOES_BLIP_EXIST(blip) and blipColour != 55 and blipColour != 3 then return blip end
        blip = HUD.GET_NEXT_BLIP_INFO_ID(id)
    end
end

local function tpToBlip(blip)
    local pos = HUD.GET_BLIP_COORDS(blip)
    SEC(players.user_ped(), pos.x, pos.y, pos.z, false, false, false, false)
end

local properties = {}
local function regenerateTpLocations(root)
    for k, _ in pairs(properties) do
        menu.delete(properties[k])
        properties[k] = nil
    end
    for i = 1, #ownedprops do
        local propblip = getblip(ownedprops[i][2])
        if propblip == nil then break end

        properties[ownedprops[i][1]] = menu.action(root, ownedprops[i][1], {}, '', function()
            if not HUD.DOES_BLIP_EXIST(propblip) then
                util.toast('Could not find property.')
                return
            end
            tpToBlip(propblip)
        end)
        if ownedprops[i].mcprops then
            local mcprops = ownedprops[i].mcprops
            local listName = mcprops[1]
            properties[listName] = menu.list(root, listName, {}, '')
            for j = 1, #mcprops.loc do
                local mcproploc = getblip(mcprops.loc[j][2])
                if propblip == nil then break end

                menu.action(properties[listName], mcprops.loc[j][1], {}, '', function() 
                    if not HUD.DOES_BLIP_EXIST(propblip) then
                        util.toast('Could not find property.')
                        return
                    end
                    tpToBlip(mcproploc)
                end)
            end
        end
    end
end

Proptp = menu.list(TeleRoot, T('Property Teleports'), {'tpprop'}, T('Lets you teleport to the properties you own.'), function()
    regenerateTpLocations(Proptp)
end)

menus.acid = menu.list(TeleRoot, T('Acid Lab Helpers'), {'alhelpers'}, '')




    menu.action(menus.acid,  T('TP into Acid Lab'), {'tplab'},  T('Teleports you into the Acid Lab if it is called in'), function ()
        local acid = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(840))
        if acid.x ==0 and acid.y ==0 and acid.z ==0 then
            if set.alert then
                util.toast('Acid Lab not found')
            end
        else    SEC(players.user_ped(), 480.80365, -2626.1143, -48.66407, false, false, false, false)
        end
    end)

    menu.action(menus.acid, T('TP to Crash Site'), {'tpcrash'}, T('Teleports you to the Crash Site'), function ()
        local objTable = entities.get_all_objects_as_pointers()
        local spill = -1643088134
        local box = 1714593198
        util.yield(250)
        for i = 1, #objTable do
            if entities.get_model_hash(objTable[i]) == spill then
                local h = entities.pointer_to_handle(objTable[i])
                local spill_coor = ENTITY.GET_ENTITY_COORDS(h)
                if spill_coor.x ~= 0 and spill_coor.y ~= 0 and spill_coor.z ~= 0 then
                    SEC(players.user_ped(), spill_coor.x , spill_coor.y + 3, spill_coor.z, false, false, false, false)
                end
                break
            end
        end
        menu.trigger_commands('tpMCproduct')
        util.yield(250)
        for i = 1, #objTable do
            if entities.get_model_hash(objTable[i]) == box then
                local h = entities.pointer_to_handle(objTable[i])
                local box_coor = ENTITY.GET_ENTITY_COORDS(h)
                if box_coor.x ~= 0 and box_coor.y ~= 0 and box_coor.z ~= 0 then
                    SEC(players.user_ped(), box_coor.x, box_coor.y, box_coor.z, false, false, false, false)
                end
                break
            end
        end
        menu.trigger_commands('tplab')
        end)         


        menu.action(menus.acid, T('TP to Deludamol'), {'tpdelud'}, T('Teleport to the Deludamol Van with the product'), function ()
            local objTable = entities.get_all_objects_as_pointers()
            local vehh = -1776615689
            local delud = 331463704
            for i = 1, #objTable do
                if entities.get_model_hash(objTable[i]) == delud then
                    local h = entities.pointer_to_handle(objTable[i])
                    local prod_coor = ENTITY.GET_ENTITY_COORDS(h)
                    if prod_coor.x ~= 0 and prod_coor.y ~= 0 and prod_coor.z ~= 0 then
                        SEC(players.user_ped(), prod_coor.x, prod_coor.y, prod_coor.z, false, false, false, false)
                        for j = 1, #objTable do
                        if entities.get_model_hash(objTable[j]) == vehh  then
                            local hv = entities.pointer_to_handle(objTable[j])
                            local driver = VEHICLE.GET_PED_IN_VEHICLE_SEAT(hv, -1)
                            if driver ~= 0 then
                                PED.SET_PED_INTO_VEHICLE(players.user_ped(), hv, -1)
                                util.yield(14000)
                                menu.trigger_commands('wanted')
                                util.yield(1000)
                                util.toast('delud')   
                                menu.trigger_commands('tpobjective') 
                            else
                                PED.SET_PED_INTO_VEHICLE(players.user_ped(), hv, -1)
                                util.yield(14000)
                                menu.trigger_commands('wanted')
                                util.yield(1000)
                                util.toast('delud')   
                                menu.trigger_commands('tpobjective') 
                            end
                            break
                        end
                        end
                    end
                end
                
            end
            end)         

            
        menu.action(menus.acid, T('TP Product into Truck'), {'tpfork'}, T('Teleport You and the Product into Truck'), function ()
            local objTable = entities.get_all_objects_as_pointers()
            local product = 414057361
        
            for i = 1, #objTable do
                if entities.get_model_hash(objTable[i]) == product then
                    local h = entities.pointer_to_handle(objTable[i])
                    local prod_coor = ENTITY.GET_ENTITY_COORDS(h)
                    if prod_coor.x ~= 0 and prod_coor.y ~= 0 and prod_coor.z ~= 0 then
                        SEC(players.user_ped(), prod_coor.x, prod_coor.y, prod_coor.z, false, false, false, false)
                    end
                    break
                end
            end
            util.yield(750)
            local prod_blip = HUD.GET_NEXT_BLIP_INFO_ID(501)
            local prod_ent = HUD.GET_BLIP_INFO_ID_ENTITY_INDEX(prod_blip)
            SEC(prod_ent, 810.2107, -3002.9395, -68.5483, false, false, false, false)
            util.yield(750)
            local vhndle = entities.get_all_vehicles_as_handles()
            for key, hndle in pairs(vhndle) do
                local vhash = ENTITY.GET_ENTITY_MODEL(hndle)
                if util.reverse_joaat(vhash) == 'mule4' then
                    PED.SET_PED_INTO_VEHICLE(players.user_ped(), hndle, -1)
                end
            end
            util.yield(100)
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 71, 1)
            util.yield(2000)
            menu.trigger_commands('tpobjective')

            end)      

         local blippickups = {535, 536, 537, 538, 539}
        menu.action(menus.acid, T('TP to Acid Lab Supplies or Sale'), {'tpacproduct'}, T('Teleport to Acid Lab Product Pickup/Sale'), function ()
            for key, blip in pairs(blippickups) do
                local bPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(blip))  
                if bPickup.x == 0 and bPickup.y == 0 and bPickup.z == 0 then

                elseif bPickup.x ~= 0 and bPickup.y ~= 0 and bPickup.z ~= 0 then
                    PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), bPickup.x, bPickup.y, bPickup.z, false, false, false, false)
                    if set.alert then
                        util.toast('TP to Sale')
                    end
                end
            end
    local Acidprod_coor
        local pPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(501))
                    local objTable = entities.get_all_objects_as_pointers()-- modified from keramiscript
                    local chutecord = 2103413525
                    local trailer = 1375611915
                    local v = {}
                    for i = 1, #objTable do
                        if entities.get_model_hash(objTable[i]) == chutecord or entities.get_model_hash(objTable[i]) == trailer then
                            local h = entities.pointer_to_handle(objTable[i])
                            Acidprod_coor = ENTITY.GET_ENTITY_COORDS(h)
                            if Acidprod_coor.x == 0 and Acidprod_coor.y == 0 and Acidprod_coor.z == 0 then

                            elseif Acidprod_coor.x ~= 0 and Acidprod_coor.y ~= 0 and Acidprod_coor.z ~= 0 then
                                if entities.get_model_hash(objTable[i]) == 1375611915 then
                                    SEC(players.user_ped(), Acidprod_coor.x - 3.5, Acidprod_coor.y - 3.5, Acidprod_coor.z, false, false, false, false)
                                    menu.trigger_commands('tractor2')


                                elseif entities.get_model_hash(objTable[i]) == 2103413525 then
                                    SEC(players.user_ped(), Acidprod_coor.x, Acidprod_coor.y, Acidprod_coor.z + 1, false, false, false, false)
                                    util.yield(100)
                                    local loopTable = entities.get_all_objects_as_pointers()
                                    local loop = -1367041250
                                    for i = 1, #loopTable do
                                        if entities.get_model_hash(loopTable[i]) == loop then
                                            local l = entities.pointer_to_handle(loopTable[i])
                                            local loop_coor = ENTITY.GET_ENTITY_COORDS(l)
                                            if loop_coor.x ~= 0 and loop_coor.y ~= 0 and loop_coor.z ~= 0 then
                                                local weap = util.joaat('WEAPON_TACTICALRIFLE')
                                                for j = 1, 5 do
                                                    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(loop_coor.x-1, loop_coor.y, loop_coor.z, loop_coor.x + 1, loop_coor.y, loop_coor.z, 200, 0, weap, 0, true, false, 1000)
                                                end
                                               
                                            end
                                            break
                                        end
                                    end
                                    util.yield(1000)
                                    menu.trigger_commands('tplab')
                                end
                                
                                if set.alert then
                                    util.toast('TP to Van or Product')
                                end
                            end
                            break
                        end
                    end



        


       if  Acidprod_coor == nil
         then
            menu.trigger_commands('tpobjective')
            util.yield(250)
            menu.trigger_commands('tpobjective')
         
        else                 
        if set.alert then
            util.toast('No Acid Lab Product Found')
        end
        end
    

    end)          


local vteles = menu.list(TeleRoot, T('Vehicle Teleports'), {}, '')

menu.action(vteles,  T('TP into Acid Lab'), {'tplab'},  T('Teleports you into the Acid Lab if it is called in'), function ()
    local acid = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(840))
    if acid.x ==0 and acid.y ==0 and acid.z ==0 then
        if set.alert then
            util.toast('Acid Lab not found')
        end
    else    SEC(players.user_ped(), 480.80365, -2626.1143, -48.66407, false, false, false, false)
    end
     end)

menu.action(vteles, T('TP into Avenger'), {'tpaven'}, T('Teleport into Avengers holding area/facility'), function ()
    SEC(players.user_ped(), 514.31335, 4750.5264, -68.99592, false, false, false, false)
    end)

menu.action(vteles, T('TP into Kosatka'), {'tpkosatka'}, T('MUST HAVE CALLED IN Teleport to Kosatka Cayo Perico Heist board'), function ()
    local kos = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(760))
    if kos.x ==0 and kos.y ==0 and kos.z ==0 then
        if set.alert then
            util.toast('Kosatka not found')
        end
    else    SEC(players.user_ped(), 1561.1543, 385.98312, -49.68535, false, false, false, false)
    end
    end)

menu.action(vteles, T('TP into MOC'), {'tpMOC'}, T('Teleport into MOC command center/bunker'), function ()
    SEC(players.user_ped(), 1103.3782, -3011.6018, -38.999435, false, false, false, false)
    end)

menu.action(vteles, T('TP into Terrorbyte'), {'tpterro'}, T('Teleport to Terrorbyte Business control'), function ()
    local ter = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(632))
    if ter.x == 0 and ter.y == 0 and ter.z == 0 then
        if set.alert then
            util.toast('Terrorbyte not found')
        end
    else    SEC(players.user_ped(), -1421.2347, -3012.9988, -79.04994, false, false, false, false)
    end
    end)

    local cargoteles = menu.list(TeleRoot, T('CEO Cargo Teleports'), {}, '')

menu.action(cargoteles, T('TP to Special Cargo'), {'tpscargo'}, T('Teleport to Special Cargo pickup'), function ()
    local cPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(478))
    HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(478))
        if cPickup.x == 0 and cPickup.y == 0 and cPickup.z == 0 then
            if set.alert then
                util.toast('No Special Cargo Found') 
            end
        else
            SEC(players.user_ped(), cPickup.x, cPickup.y, cPickup.z, false, false, false, false)
        end
    end)


menu.action(cargoteles, T('TP to Vehicle Cargo'), {'tpvcargo'}, T('Teleport to Vehicle Cargo pickup'), function ()
    local vPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(523))
    HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(523))
        if vPickup.x == 0 and vPickup.y == 0 and vPickup.z == 0 then
            if set.alert then
                util.toast('No Vehicle Cargo Found')
            end
        else
            SEC(players.user_ped(), vPickup.x, vPickup.y, vPickup.z, false, false, false, false)
        end
    end)

    local intteles = menu.list(TeleRoot, T('Interior Teleports'), {}, '')

menu.action(intteles, T('TP to PC'), {'tpdesk'}, T('Teleport to PC at the Desk'), function ()
    local pcD = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(521))
    HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(521))
        if pcD.x ~= 0 and pcD.y ~= 0 and pcD.z ~= 0 then
            SEC(players.user_ped(), pcD.x- 1.0, pcD.y + 1.0 , pcD.z, false, false, false, false)
        else
            if set.alert then
                util.toast('No PC Found')
            end
        end
    end)


    menu.action(intteles, T('TP to Nightclub Person'), {'tpNCPerson'}, T('Teleport to the Nightclub Person'), function ()
        local nigh1 = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(143))
        local nigh2 = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(480))
        HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(143))
        HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(480))
            if nigh1.x ~= 0 and nigh1.y ~= 0 and nigh1.z ~= 0 then
                SEC(players.user_ped(), nigh1.x, nigh1.y, nigh1.z, false, false, false, false)
            elseif nigh2.x ~= 0 and nigh2.y ~= 0 and nigh2.z ~= 0 then
                SEC(players.user_ped(), nigh2.x, nigh2.y, nigh2.z, false, false, false, false)
            else 
                if set.alert then
                util.toast('No Person Found')
                end
            end

        end)

    menu.action(intteles, T('TP to Safe'), {'tpsafe'}, T('Teleport to Safe inside Agency, Arcade, or Nightclub'), function ()
        local saf1 = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(108))
        local saf2 = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(207))
            if saf1.x ~= 0 and saf1.y ~= 0 and saf1.z ~= 0 then
                SEC(players.user_ped(), saf1.x - 1.0, saf1.y + 1.0 , saf1.z, false, false, false, false)
            elseif saf2.x ~= 0 and saf2.y ~= 0 and saf2.z ~= 0 then
                SEC(players.user_ped(), saf2.x, saf2.y + 1.0 , saf2.z, false, false, false, false)
            else
                if set.alert then
                    util.toast('No Safe Found')
                end
            end
        end)
            

menu.action(TeleRoot, T('TP to MC Product'), {'tpMCproduct'}, T('Teleport to MC Club Product Pickup/Sale'), function ()
    local pPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(501))
    local hPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(64))
    local bPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(427))
    local plPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(423))
        if pPickup.x == 0 and pPickup.y == 0 and pPickup.z == 0 then

        elseif pPickup.x ~= 0 and pPickup.y ~= 0 and pPickup.z ~= 0 then
            SEC(players.user_ped(), pPickup.x - 1.5, pPickup.y , pPickup.z, false, false, false, false)
            if set.alert then
                util.toast('TP to MC Product')
            end
            
        end
        if hPickup.x == 0 and hPickup.y == 0 and hPickup.z == 0 then

        elseif hPickup.x ~= 0 and hPickup.y ~= 0 and hPickup.z ~= 0 then
            SEC(players.user_ped(), hPickup.x- 1.5, hPickup.y, hPickup.z, false, false, false, false)
            if set.alert then
                util.toast('TP to Heli')
            end
        end
        if bPickup.x == 0 and bPickup.y == 0 and bPickup.z == 0 then

        elseif bPickup.x ~= 0 and bPickup.y ~= 0 and bPickup.z ~= 0 then
            SEC(players.user_ped(), bPickup.x, bPickup.y, bPickup.z + 1.0 , false, false, false, false)
            if set.alert then
                util.toast('TP to Boat')
            end
        end
        if plPickup.x == 0 and plPickup.y == 0 and plPickup.z == 0 then

        elseif plPickup.x ~= 0 and plPickup.y ~= 0 and plPickup.z ~= 0 then
            SEC(players.user_ped(), plPickup.x, plPickup.y + 1.5, plPickup.z - 1, false, false, false, false)
            if set.alert then
                util.toast('TP to Plane')
            end
        else                 
        if set.alert then
            util.toast('No MC Product Found')
        end
        end


    end)

menu.action(TeleRoot, T('TP to Bunker Supplies/Sale'), {'tpBSupplies'}, T('Teleport to Bunker Supplies/Sale Pickup'), function ()
        local sPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(556))
        local dPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(561))
        local fPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(477))
        local plPickup = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(423))
                        HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(556))
                        HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(561))
                        HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(477))
                        HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(423))
            if sPickup.x == 0 and sPickup.y == 0 and sPickup.z == 0 then
            elseif sPickup.x ~= 0 and sPickup.y ~= 0 and sPickup.z ~= 0 then
                SEC(players.user_ped(), sPickup.x, sPickup.y + 2.0, sPickup.z - 1.0, false, false, false, false)
                if set.alert then
                    util.toast('TP to Supplies')
                end
            end
            if dPickup.x == 0 and dPickup.y == 0 and dPickup.z == 0 then
            elseif dPickup.x ~= 0 and dPickup.y ~= 0 and dPickup.z ~= 0 then
                SEC(players.user_ped(), dPickup.x, dPickup.y, dPickup.z, false, false, false, false)
                if set.alert then
                    util.toast('TP to Dune')
                end
            end
            if fPickup.x == 0 and fPickup.y == 0 and fPickup.z == 0 then
            elseif fPickup.x ~= 0 and fPickup.y ~= 0 and fPickup.z ~= 0 then
                SEC(players.user_ped(), fPickup.x, fPickup.y, fPickup.z + 1.0 , false, false, false, false)
                if set.alert then
                    util.toast('TP to Flatbed')
                end
            else
                 if set.alert then
                    util.toast('No Bunker Supplies Found')
                 end
            end

        end)

menu.action(TeleRoot, T('TP to Payphone'), {'tppayphone'}, T('Teleport to Payphone (must have called Franklin already)'), function ()
        local payPhon = HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(817))
            HUD.GET_BLIP_COORDS(HUD.GET_NEXT_BLIP_INFO_ID(817))
            if payPhon.x == 0 and payPhon.y == 0 and payPhon.z == 0 then
                if set.alert then
                    util.toast('No Payhone Found')
                end
                else
                    SEC(players.user_ped(), payPhon.x, payPhon.y, payPhon.z + 1, false, false, false, false)
            end
    end)

    menu.action(TeleRoot, T('TP to Exotic Export Dock'), {'tpEED'}, T('Teleport to Exotic Export Dock'), function ()
        if HUD.DOES_BLIP_EXIST(HUD.GET_CLOSEST_BLIP_INFO_ID(780)) then
           local eDock = HUD.GET_BLIP_COORDS(HUD.GET_CLOSEST_BLIP_INFO_ID(780))
           if  eDock.x == 0 and eDock.y == 0 and eDock.z == 0
           then
            if set.alert then
            util.toast('Dock Not Found')
           end
            elseif eDock.x ~= 0 and eDock.y ~= 0 and eDock.z ~= 0 then
                PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), 1169.5736, -2971.932, 5.9021106)
            end
        end
    end)





    local forwteles = menu.list(TeleRoot, T('TP Forward Teleports'), {}, '')

    local forw = {amount = 0.5} --credits to lance#8011
    menu.action(forwteles, T('TP Foward'), {'tpforw'}, T('Teleport Forward your set amount'), function ()
        if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) then
            return
        end
        local fv = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, forw.amount, -1.0)
            SEC(players.user_ped(), fv.x , fv.y, fv.z, false, false, false, false)
    end)

     menu.toggle_loop(forwteles, T('TP Foward Toggle'), {''}, T('Teleport Forward toggle for your gamepad RB and DPAD Down'), function ()
        local fv = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, forw.amount, -1.0)
        if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) then
            return
        end
        if PAD.IS_CONTROL_PRESSED(0, 187) or PAD.IS_CONTROL_PRESSED(0, 47) or PAD.IS_CONTROL_PRESSED(0, 19) and PAD.IS_CONTROL_PRESSED(0, 44) then
            SEC(players.user_ped(), fv.x , fv.y, fv.z, false, false, false, false)
        else util.yield()
        end
        util.yield(250)
    end)

    menu.slider(forwteles, T('TP Forward Amount'), {'tpslider'}, T('Adjust the amount you teleport forward by'), 1, 10000, 1, 1, function (a)
        forw.amount = a*0.1
    end)


    menu.toggle_loop(TeleRoot, T('Levitate Toggle'), {''}, T('Leveitate toggle for your gamepad RB and DPAD Down'), function ()
        local fv = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, forw.amount, -1.0)
        if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) then
            return
        end
        if  PAD.IS_CONTROL_PRESSED(0, 44) then
         if PAD.IS_CONTROL_PRESSED(0, 187) or PAD.IS_CONTROL_PRESSED(0, 47) or PAD.IS_CONTROL_PRESSED(0, 19) then
            menu.trigger_commands('levitate')
         end
        end
        util.yield(250)
    end)


  -- From GridSpawn credits to Tonk
  local  colour = {r=0,g=255,b=0,a=255}
  if colour == nil then
      colour = {r=255,g=0,b=0,a=255}
  end
  local minimum = memory.alloc()
  local maximum = memory.alloc()
  local upVector_pointer = memory.alloc()
  local rightVector_pointer = memory.alloc()
  local forwardVector_pointer = memory.alloc()
  local position_pointer = memory.alloc()
  local draw_bounding_box = function (entity, colour)
      ENTITY.GET_ENTITY_MATRIX(entity, rightVector_pointer, forwardVector_pointer, upVector_pointer, position_pointer);
      local forward_vector = v3.new(forwardVector_pointer)
      local right_vector = v3.new(rightVector_pointer)
      local up_vector = v3.new(upVector_pointer)
  
      MISC.GET_MODEL_DIMENSIONS(ENTITY.GET_ENTITY_MODEL(entity), minimum, maximum)
      local minimum_vec = v3.new(minimum)
      local maximum_vec = v3.new(maximum)
      local dimensions = {x = maximum_vec.y - minimum_vec.y, y = maximum_vec.x - minimum_vec.x, z = maximum_vec.z - minimum_vec.z}
  
      local top_right =           ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entity,       maximum_vec.x, maximum_vec.y, maximum_vec.z)
      local top_right_back =      {x = forward_vector.x * -dimensions.y + top_right.x,        y = forward_vector.y * -dimensions.y + top_right.y,         z = forward_vector.z * -dimensions.y + top_right.z}
      local bottom_right_back =   {x = up_vector.x * -dimensions.z + top_right_back.x,        y = up_vector.y * -dimensions.z + top_right_back.y,         z = up_vector.z * -dimensions.z + top_right_back.z}
      local bottom_left_back =    {x = -right_vector.x * dimensions.x + bottom_right_back.x,  y = -right_vector.y * dimensions.x + bottom_right_back.y,   z = -right_vector.z * dimensions.x + bottom_right_back.z}
      local top_left =            {x = -right_vector.x * dimensions.x + top_right.x,          y = -right_vector.y * dimensions.x + top_right.y,           z = -right_vector.z * dimensions.x + top_right.z}
      local bottom_right =        {x = -up_vector.x * dimensions.z + top_right.x,             y = -up_vector.y * dimensions.z + top_right.y,              z = -up_vector.z * dimensions.z + top_right.z}
      local bottom_left =         {x = forward_vector.x * dimensions.y + bottom_left_back.x,  y = forward_vector.y * dimensions.y + bottom_left_back.y,   z = forward_vector.z * dimensions.y + bottom_left_back.z}
      local top_left_back =       {x = up_vector.x * dimensions.z + bottom_left_back.x,       y = up_vector.y * dimensions.z + bottom_left_back.y,        z = up_vector.z * dimensions.z + bottom_left_back.z}
  
      GRAPHICS.DRAW_LINE(
          top_right.x, top_right.y, top_right.z,
          top_right_back.x, top_right_back.y, top_right_back.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          top_right.x, top_right.y, top_right.z,
          top_left.x, top_left.y, top_left.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          top_right.x, top_right.y, top_right.z,
          bottom_right.x, bottom_right.y, bottom_right.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          bottom_left_back.x, bottom_left_back.y, bottom_left_back.z,
          bottom_right_back.x, bottom_right_back.y, bottom_right_back.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          bottom_left_back.x, bottom_left_back.y, bottom_left_back.z,
          bottom_left.x, bottom_left.y, bottom_left.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          bottom_left_back.x, bottom_left_back.y, bottom_left_back.z,
          top_left_back.x, top_left_back.y, top_left_back.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          top_left_back.x, top_left_back.y, top_left_back.z,
          top_right_back.x, top_right_back.y, top_right_back.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          top_left_back.x, top_left_back.y, top_left_back.z,
          top_left.x, top_left.y, top_left.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          bottom_right_back.x, bottom_right_back.y, bottom_right_back.z,
          top_right_back.x, top_right_back.y, top_right_back.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          bottom_left.x, bottom_left.y, bottom_left.z,
          top_left.x, top_left.y, top_left.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          bottom_left.x, bottom_left.y, bottom_left.z,
          bottom_right.x, bottom_right.y, bottom_right.z,
         colour.r, colour.g, colour.b, colour.a
      )
      GRAPHICS.DRAW_LINE(
          bottom_right_back.x, bottom_right_back.y, bottom_right_back.z,
          bottom_right.x, bottom_right.y, bottom_right.z,
         colour.r, colour.g, colour.b, colour.a
      )
  end
    

 ------------------------------------------
 
 local function save_kill_list(kill_list)
    local file = io.open(Kill_List, "wb")
    if file == nil then ACutil(Str_trans("Error opening Kill List list file for writing: ")..Kill_List, TOAST_ALL) return end
    file:write(soup.json.encode(kill_list))
    file:close()
end

local function load_kill_list()
    local file = io.open(Kill_List)
    if file then
        local version = file:read()
        file:close()
        local load_kill_list_status, kill_list = pcall(soup.json.decode, version)
        if not load_kill_list_status then
            error("Could not decode Kill List list file")
        end
        return kill_list
    else
        return {}
    end
end

local function add_victim(name)
    local new_victim = {name=name}
    local kill_list = load_kill_list()
    for _, victim in pairs(kill_list) do
        if victim.name == new_victim.name then
            return true
        end
    end
    table.insert(kill_list, new_victim)
    save_kill_list(kill_list)
    return true
end

local function remove_victim(name)
    
    local kill_list = load_kill_list()
    for index, victim in pairs(kill_list) do
        if victim.name == name then
            kill_list[index] = nil
            save_kill_list(kill_list)
            return true
        end
    end
    return false
end




local kill_list_menus = {}

local function regen_kill_list(root)
    local kload = load_kill_list()
    for i, kill_list_menu in pairs(kill_list_menus) do
        if menu.is_ref_valid(kill_list_menu) then menu.delete(kill_list_menu) end
    end
    kill_list_menus = {}
    for _, kill_list_load in pairs(kload) do
        for i, v in pairs(kill_list_load ) do
            local kill_list_menu = menu.list(root, v, {''}, v)
            menu.action(kill_list_menu, Str_trans('Remove from Kill List'), {}, Str_trans('Remove Player from Kill List'), function ()
                remove_victim(v)
                ACutil(v..Str_trans(' Removed from Kill List'))
                return true
            end)

            table.insert(kill_list_menus, kill_list_menu)

        end
    end

end
local players_list_menus = {}
local function rebuild_player_list()
    local players_list = players.list(false, true, true)
    for i, players_list_menu in pairs(players_list_menus) do
        if menu.is_ref_valid(players_list_menu) then menu.delete(players_list_menu) end
    end
    for index, pid in pairs(players_list) do
        local pname = PLAYER.GET_PLAYER_NAME(pid)
       local players_list_menu = menu.action(menus.aimbotkilla, pname, {''}, Str_trans('Add or Remove Player to the Kill List'), function ()
            for _, name in ipairs(load_kill_list()) do
                if name.name == pname then
                    remove_victim(pname)
                    if set.alert then
                        ACutil(pname..Str_trans(' Removed from Kill List'))
                    end
                    return true
                end
            end
            add_victim(pname)
            if set.alert then
                ACutil(pname..Str_trans(' Added to Kill List'))
            end
        return true
        end)
        table.insert(players_list_menus, players_list_menu)
   end
end

local function AimbotTarget(aimbot, aim_target, ESPrgb)
    if PED.IS_PED_A_PLAYER(aim_target) then
        local pid = NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(aim_target)
        local pname = PLAYER.GET_PLAYER_NAME(pid)
        if set.alert then
            ACutil(Str_trans('Target is ')..pname)
        end
    end
    
    if aimbot.esp then
        Draw_esp(aim_target)
    end
    if aimbot.box then
        local color = {
            r = ESPrgb.color.r * 255,
            g = ESPrgb.color.g * 255,
            b = ESPrgb.color.b * 255,
            a = ESPrgb.color.a * 255
        }
        draw_bounding_box(aim_target, color)
    end
    if aimbot.curweap and PED.IS_PED_SHOOTING(players.user_ped()) then
       aimbot.weapon = util.reverse_joaat(WEAPON.GET_SELECTED_PED_WEAPON(players.user_ped()))
       ShootPed(aim_target, util.joaat(aimbot.weapon))
    elseif not aimbot.curweap and PED.IS_PED_SHOOTING(players.user_ped()) then
        ShootPed(aim_target, util.joaat(aimbot.weapon))
    end
end



menus.aimbot = menu.list(selfroot, T('Aimbot'), {''}, '')
local aimbot = {esp = true, box = true, bone = 31086, curweap = true, weapon = 'WEAPON_TACTICALRIFLE', damage = 200, targetveh = true,
 fov = 3, tarplayers = true, tarnpcs = true, tarfriends = false, owner = players.user_ped(), stw = false, kill_list = false}
 local ESPrgb = {color= {r= 0, g = 1, b = 0, a = 1}}
 local ESPcolor = {
    r = math.floor(ESPrgb.color.r * 255),
    g = math.floor(ESPrgb.color.g * 255),
    b = math.floor(ESPrgb.color.b * 255),
    a = math.floor(ESPrgb.color.a * 255)
}


local aim_target
local target = true
function Ped_aim_pool(fov)
   
    local ped_handles = entities.get_all_peds_as_handles()
    for key, ped in pairs(ped_handles) do
        if players.user_ped() ~= ped and not PED.IS_PED_DEAD_OR_DYING(ped, 1) and ENTITY.DOES_ENTITY_EXIST(ped) then

        local ped_coor = ENTITY.GET_ENTITY_COORDS(ped, true)
        local player_coor = ENTITY.GET_ENTITY_COORDS(players.user_ped(), true)
        local disbet = SYSTEM.VDIST2(ped_coor.x, ped_coor.y, ped_coor.z, player_coor.x, player_coor.y, player_coor.z)
        local too_far = 1000
        if disbet >= too_far then
            target = false
        end
            
        if not PED.IS_PED_FACING_PED(players.user_ped(), ped, fov) then
            target = false
            else
                target = true
        end

        if PED.IS_PED_A_PLAYER(ped) and not aimbot.tarplayers or aimbot.kill_list then
            target = false
        end

        if not PED.IS_PED_A_PLAYER(ped) and not aimbot.tarnpcs or aimbot.kill_list then
            target = false
        end

        if PED.IS_PED_IN_ANY_VEHICLE(ped, true) and not aimbot.targetveh then
            target = false
        end

        if not ENTITY.HAS_ENTITY_CLEAR_LOS_TO_ENTITY(players.user_ped(), ped, 17) and not aimbot.stw then
            target = false
        end
        local handle_ptr = memory.alloc(13*8)
        local function pid_to_handle(pid)--credits to lance
            NETWORK.NETWORK_HANDLE_FROM_PLAYER(pid, handle_ptr, 13)
            return handle_ptr
        end
        if PED.IS_PED_A_PLAYER(ped) and aimbot.tarplayers and not aimbot.tarfriends then
            local pid = NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(ped)
            local hdl = pid_to_handle(pid)
            if NETWORK.NETWORK_IS_FRIEND(hdl) then
                target = false
            end
        end
        if PED.IS_PED_A_PLAYER(ped) and aimbot.kill_list then
            local pid = NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(ped)
            local pname = PLAYER.GET_PLAYER_NAME(pid)
            for _, Names in pairs(load_kill_list()) do
                for _, name in pairs(Names) do
                    if name == pname then
                        target = true
                    end
                end
            end       
        end


        if target and PLAYER.IS_PLAYER_FREE_AIMING(players.user()) then
            aim_target = ped
            AimbotTarget(aimbot, aim_target, ESPrgb)
        if aim_target > 1 then
            break
        end
        else aim_target = 0
        end
        end
    end
    return aim_target
end



function Draw_esp(ped) --credits to Totaw Annihiwation
        local screenX = memory.alloc(4)
        local screenY = memory.alloc(4)
        local pos = ENTITY.GET_ENTITY_COORDS(ped)
        GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(pos.x, pos.y, pos.z, screenX, screenY)
        directx.draw_line(0.5, 0.5, memory.read_float(screenX), memory.read_float(screenY), ESPrgb.color) 
end

function Draw_fov(ped) --credits to Totaw Annihiwation
    local screenX = memory.alloc(4)
    local screenY = memory.alloc(4)
    local pos = ENTITY.GET_ENTITY_COORDS(ped)
    GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(pos.x, pos.y, pos.z, screenX, screenY)
    directx.draw_line(0.5, 0.5, memory.read_float(screenX), memory.read_float(screenY), ESPrgb.color) 
end

function ShootPed(ped, weap)
    local bone_coor = PED.GET_PED_BONE_COORDS(ped, aimbot.bone, 0, 0, 0)
    local bone_coor2 = PED.GET_PED_BONE_COORDS(ped, aimbot.bone, -0.1, 0, 0)
    local bone_coor3 = PED.GET_PED_BONE_COORDS(ped, aimbot.bone, 0.1, 0, 0)
    --local currentWeapon = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(players.user_ped(), false)
    --local gun_muz = ENTITY.GET_ENTITY_BONE_POSTION(currentWeapon, ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(currentWeapon, 'gun_muzzle'))
    for i = 1, 3 do
     MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(bone_coor2.x, bone_coor2.y, bone_coor2.z, bone_coor3.x, bone_coor3.y, bone_coor3.z, aimbot.damage, 0, weap, aimbot.owner, false, false, 1000)
     MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(bone_coor.x, bone_coor.y, bone_coor.z + 1 , bone_coor.x, bone_coor.y, bone_coor.z - 1, aimbot.damage, 0, weap, aimbot.owner , false, false, 1000)
     MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(bone_coor.x, bone_coor.y, bone_coor.z - 1 , bone_coor.x, bone_coor.y, bone_coor.z + 1, aimbot.damage, 0, weap, aimbot.owner , false, false, 1000)
    end
    
end

    menu.toggle_loop(menus.aimbot, T('Activate Aimbot'), {'aimbotact'}, T('Activates Aimbot with your settings'), function ()
        if PLAYER.IS_PLAYER_FREE_AIMING(players.user()) then
            Ped_aim_pool(aimbot.fov)
        
        else
            util.yield()
        end

    end)


    menu.toggle(menus.aimbot, T('Turn off Target Vehicles'), {''}, T('Turns off targeting peds in vehicles with Aimbot'), function (on)
        aimbot.targetveh = not on
    end)

    menu.toggle(menus.aimbot, T('Turn off Target Players'), {''}, T('Turns off targeting Players with Aimbot'), function (on)
        aimbot.tarplayers = not on
    end)

    
    menu.toggle(menus.aimbot, T('Turn off Target NPCs'), {''}, T('Turns off targeting NPCs with Aimbot'), function (on)
        aimbot.tarnpcs = not on
    end)

    menu.toggle(menus.aimbot, T('Turn on Target Friends'), {''}, T('Turns on targeting Friends with Aimbot'), function (on)
        aimbot.tarfriends = on
    end)

    menu.toggle(menus.aimbot, T('Turn on Shoot Through Walls'), {''}, T('Turns on Shoot Through Walls with Aimbot'), function (on)
        aimbot.stw = on
    end)

    menu.toggle(menus.aimbot, T('Make Kills Anonymous'), {''}, T('Turn off credit for the kills and make them anonymous made with Aimbot also activates current weapon off because bullets wont hurt players anonymously'), function (on)
        if on then
            aimbot.owner = 0
            menu.trigger_commands('Curweapoff')
        else
            aimbot.owner = players.user_ped()
            menu.trigger_commands('Curweapoff')
        end

    end)


    menu.slider_float(menus.aimbot, T('Field of View'), {'tpslider'}, T('Adjust the amount of your Field of View is with Aimbot'), 100, 36000, 300, 100, function (s)
        aimbot.fov = s*.01
    end)


    menus.aimbotkillist = menu.list(menus.aimbot, T('Kill List'), {''}, '')

    menu.toggle(menus.aimbotkillist, T('Turn on Kill List'), {''}, T('Turns on Kill List only targeting players on the list with Aimbot'), function (on)
        aimbot.kill_list = on
    end)

    menus.aimbotvic = menu.list(menus.aimbotkillist, T('Your Kill List'), {''}, '')

    Kill_tab = menu.list(menus.aimbotvic, T('Your Kill List'), {''}, T('A list of the people on your kill list'), function ()
        regen_kill_list(Kill_tab)
    end)



   menus.aimbotkilla =  menu.list(menus.aimbotvic, 'Add Player from Player List', {''}, 'Add a name to the Kill List from the Player List', function ()
        rebuild_player_list()
   end)

   menu.toggle_loop(menus.aimbotkillist, T('Add Strangers to Kill List'), {''}, T('Add Strangers that kill you to Kill List'), function (on)
    if PED.IS_PED_DEAD_OR_DYING(players.user_ped()) then
        local killer = PED.GET_PED_SOURCE_OF_DEATH(players.user_ped())
        local handle_ptr = memory.alloc(13*8)
        local function pid_to_handle(pid)
            NETWORK.NETWORK_HANDLE_FROM_PLAYER(pid, handle_ptr, 13)
            return handle_ptr
        end
        if not PED.IS_PED_A_PLAYER(killer) then
            return
        end
            local pid = NETWORK.NETWORK_GET_PLAYER_INDEX_FROM_PED(killer)
            local hdl = pid_to_handle(pid)
            if not NETWORK.NETWORK_IS_FRIEND(hdl) then
                local pname = PLAYER.GET_PLAYER_NAME(pid)
                for _, name in ipairs(load_kill_list()) do
                    if name.name == pname  then
                        return
                    end
                end
                add_victim(pname)
                if set.alert then
                    ACutil(pname..Str_trans(' Added to Kill List'))
                end

 
            end
    end
end)


    menus.aimbotweap = menu.list(menus.aimbot, T('Weapon Settings'), {''}, '')

    menu.toggle(menus.aimbotweap, T('Turn off Current Weapon Bullets'), {'Curweapoff'}, T('Does not use the current weapons bullets and uses your selected weapon in Aimbot instead'), function (on)
        aimbot.curweap = not on
        menu.set_value(menus.aimbotchw, 1)
        menu.set_value(menus.aimbotchw, 2)
        menu.set_value(menus.aimbotchw, 1)
    end)

    menus.aimbotchw = menu.list_select(menus.aimbotweap, T('Change Weapons'), {'vatkweap'}, T('Choose the weapon for Aimbot'), Leyen, 1, function (weapsel)
        if not aimbot.curweap then
            aimbot.weapon = Leyel[weapsel] 
        end
    end)

    menus.shot_coords = menu.list(menus.aimbotweap, T('Shot Coordinates'), {''}, T('Choose where to shoot the target'))
    for i, bone in pairs(BoneIds) do
        menu.action(menus.shot_coords, bone[1], {''}, '', function(pedsel)
            aimbot.bone = bone[2]
            ACutil(Str_trans('Now aiming at ')..bone[1])
        end)
    end


    menu.slider(menus.aimbotweap, T('Damage Amount'), {'tpslider'}, T('Adjust the amount of Damage you do with Aimbot'), 0, 1000, 200, 1, function (s)
        aimbot.damage = s
    end)




menus.ESP_Box = menu.list(menus.aimbot, T('ESP and Box settings'), {''}, '')
    
menu.toggle(menus.ESP_Box, T('ESP Deactivate'), {''}, T('Turns off ESP used in Aimbot'), function (on)
    aimbot.esp = not on
end)

menu.toggle(menus.ESP_Box, T('Box Deactivate'), {''}, T('Turns off the box that surrounds them used in Aimbot'), function (on)
    aimbot.box = not on
end)


menu.colour(menus.ESP_Box, T('Box and ESP Color'), {''}, T('Choose the Box and ESP color to be changed to'), ESPrgb.color, false, function(bcolor)
    ESPrgb.color = bcolor
end)


   --[[menus.aimbotkillr = menu.list(menus.aimbotvic, 'Remove Player from Player List', {''}, 'Remove a name from the Kill List from the Player List')
   for index, pid in ipairs(players.list()) do
    local pname = PLAYER.GET_PLAYER_NAME(pid)
    menu.action(menus.aimbotkillr, pname, {''}, 'Remove Player from Kill List', function ()
        remove_victim(pname)
        if set.alert then
            ACutil(pname..Str_trans(' Removed from Kill List'))
        end
   end)
   end]]

--[[menus.create_from_vehicle_list = menu.list(vlistroot, Str_trans("From Vehicle List"), {}, Str_trans("Change Vehicle Sound from a list of vehicles"), function()
    for _, curated_section in pairs(Curated_attachments) do
        if curated_section.name == "Vehicles" then
            for _, curated_item in pairs(curated_section.items) do
                build_curated_constructs_menu(menus.create_from_vehicle_list, curated_item)
            end
        end
    end
end)]]





local function objams(obj_hash, obj, camcoords)
    local CV = CAM.GET_GAMEPLAY_CAM_RELATIVE_HEADING()
    if STREAMING.IS_MODEL_A_VEHICLE(obj_hash) then
        obj.prev = VEHICLE.CREATE_VEHICLE(obj_hash, camcoords.x, camcoords.y, camcoords.z, CV, true, true, false)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj.prev, players.user_ped(), false)
      elseif STREAMING.IS_MODEL_A_PED(obj_hash) then
        obj.prev = entities.create_ped(1, obj_hash, camcoords, CV)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj.prev, players.user_ped(), false)
      elseif STREAMING.IS_MODEL_VALID(obj_hash) then
        obj.prev = OBJECT.CREATE_OBJECT(obj_hash, camcoords.x, camcoords.y, camcoords.z, true, true, true)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(obj.prev, players.user_ped(), false)
    end

    if obj.prev then

        ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(obj.prev , false, true)
        ENTITY.SET_ENTITY_ALPHA(obj.prev , 206, false)
        ENTITY.FREEZE_ENTITY_POSITION(obj.prev, true)
        ENTITY.SET_ENTITY_INVINCIBLE(obj.prev, true)
        SEC(obj.prev, camcoords.x, camcoords.y, camcoords.z, false, true, true, false)
        end
end
local objtab = {}
local vsh
local psh
local obj_shot
local function vshot(hash, camcoords, CV, rot)
    if not ENTITY.DOES_ENTITY_EXIST(vsh) then
        vsh = entities.create_vehicle(hash, camcoords, CV)
        ENTITY.SET_ENTITY_ROTATION(vsh, rot.x, rot.y, rot.z, 0, true)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vsh, 1000)
        VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vsh, true)
        VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vsh, true)
        table.insert(objtab, vsh)
    else
            local veh_sec = entities.create_vehicle(hash, camcoords, CV)
            ENTITY.SET_ENTITY_ROTATION(veh_sec, rot.x, rot.y, rot.z, 0, true)
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh_sec, 1000)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vsh, true)
            VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_NON_SCRIPT_PLAYERS(vsh, true)
            table.insert(objtab, veh_sec)
    end

end
local function pshot(hash, camcoords, CV, rot)
    if not ENTITY.DOES_ENTITY_EXIST(psh) then
        psh = entities.create_ped(1, hash, camcoords, CV)
        ENTITY.SET_ENTITY_INVINCIBLE(psh, true)
        util.yield(30)
        ENTITY.SET_ENTITY_ROTATION(psh, rot.x, rot.y, rot.z, 0, true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(psh, 1, 0, 5000, 0, 0, true, true, true, true)
        table.insert(objtab, psh)
    else
        local sped = entities.create_ped(1, hash, camcoords, CV)
        ENTITY.SET_ENTITY_INVINCIBLE(sped, true)
        util.yield(30)
        ENTITY.SET_ENTITY_ROTATION(sped, rot.x, rot.y, rot.z, 0, true)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(sped, 1, 0, 5000, 0, 0, true, true, true, true)
        table.insert(objtab, sped)
    end
end
local function oshot(hash, camcoords, rot)
    if not ENTITY.DOES_ENTITY_EXIST(obj_shot) then
        local objs = OBJECT.CREATE_OBJECT(hash, camcoords.x, camcoords.y, camcoords.z, true, true, true)
        ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(objs, players.user_ped(), false)
        util.yield(20)
        ENTITY.SET_ENTITY_ROTATION(objs, rot.x, rot.y, rot.z, 0, true)
        
        ENTITY.APPLY_FORCE_TO_ENTITY(objs, 2, camcoords.x ,  15000, camcoords.z , 0, 0, 0, 0,  true, false, true, false, true)
        table.insert(objtab, objs)
        else
            local sobjs = OBJECT.CREATE_OBJECT(hash, camcoords.x, camcoords.y, camcoords.z, true, true, true)
            ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(sobjs, players.user_ped(), false)
            util.yield(20)
            ENTITY.SET_ENTITY_ROTATION(sobjs, rot.x, rot.y, rot.z, 0, true)
            ENTITY.APPLY_FORCE_TO_ENTITY(sobjs, 2, camcoords.x ,  15000, camcoords.z , 0, 0, 0, 0,  true, false, true, false, true)
            table.insert(objtab, sobjs)
    end

end

local function objshots(hash, obj, camcoords)
    local CV = CAM.GET_GAMEPLAY_CAM_RELATIVE_HEADING()
    local rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
    if STREAMING.IS_MODEL_A_VEHICLE(hash) then
        vshot(hash, camcoords, CV, rot)
        
        for i, car in ipairs(objtab) do
            if obj.expl then
                if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(car) then
                    local expcoor = ENTITY.GET_ENTITY_COORDS(car)
                    FIRE.ADD_EXPLOSION(expcoor.x, expcoor.y, expcoor.z, 81, 5000, true, false, 0.0, false)
                    entities.delete_by_handle(car)
                end


            end
            if i >= 150 then
                for index, vehs in ipairs(objtab) do
                    entities.delete_by_handle(vehs)
                    objtab ={}
                end
            end
            local carc = ENTITY.GET_ENTITY_COORDS(car)
            local tar2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())
            local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, carc.x, carc.y, carc.z)
            if disbet > 15000 then
                entities.delete_by_handle(car)
            end
        end

    elseif STREAMING.IS_MODEL_A_PED(hash) then
       pshot(hash, camcoords, CV, rot)

    
        for i, psho in ipairs(objtab) do
        if obj.expl then
            if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(psho) then
                local expcoor = ENTITY.GET_ENTITY_COORDS(psho)
                FIRE.ADD_EXPLOSION(expcoor.x, expcoor.y, expcoor.z, 81, 5000, true, false, 0.0, false)
                entities.delete_by_handle(psho)
            end
                
                    local pedc = ENTITY.GET_ENTITY_COORDS(psh)
                    local tar2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())
                    local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, pedc.x, pedc.y, pedc.z)
                    if disbet > 15000 then
                        entities.delete_by_handle(psh)
                    end
        end
        if i >= 40 then
            for index, p_shot in ipairs(objtab) do
                entities.delete_by_handle(p_shot)
                objtab ={}
            end
        end
    end
    elseif STREAMING.IS_MODEL_VALID(hash) then
       oshot(hash, camcoords, rot)



       for i, objs in ipairs(objtab) do
       if obj.expl then
        if ENTITY.HAS_ENTITY_COLLIDED_WITH_ANYTHING(objs) then
            local expcoor = ENTITY.GET_ENTITY_COORDS(objs)
            FIRE.ADD_EXPLOSION(expcoor.x, expcoor.y, expcoor.z, 81, 5000, true, false, 0.0, false)
            entities.delete_by_handle(objs)
        end

                local objc = ENTITY.GET_ENTITY_COORDS(objs)
                local tar2 = ENTITY.GET_ENTITY_COORDS(players.user_ped())
                local disbet = SYSTEM.VDIST2(tar2.x, tar2.y, tar2.z, objc.x, objc.y, objc.z)

                if disbet > 15000 then
                    entities.delete_by_handle(objs)
                end
            end
            if i >= 40 then
                for index, p_shot in ipairs(objtab) do
                    entities.delete_by_handle(p_shot)
                    objtab ={}
                end
            end
        end
    end
   
end
local obj_hash = 'vigilante'
local objgun = menu.list(selfroot, T('Custom Object Gun'), {}, '')
local obj = {expl = false}
OBJgun = menu.toggle_loop(objgun, T('Custom Object Gun'), {'objgun'}, T('Fires the object you have selected'), function ()
     
   local hash = util.joaat(obj_hash)
    Streament(hash)
    if PLAYER.IS_PLAYER_FREE_AIMING(players.user()) and not PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
        local rot = CAM.GET_GAMEPLAY_CAM_ROT(0)
        local camcoords = get_offset_from_camera(10)
        if not ENTITY.DOES_ENTITY_EXIST(obj.prev) then
            objams(hash, obj, camcoords)
        else
            SEC(obj.prev, camcoords.x, camcoords.y, camcoords.z, false, true, true, false)
        end
        ENTITY.SET_ENTITY_ROTATION(obj.prev, rot.x, rot.y, rot.z, 0, true)
        
    elseif ENTITY.DOES_ENTITY_EXIST(obj.prev) and not PLAYER.IS_PLAYER_FREE_AIMING(players.user()) then
        entities.delete_by_handle(obj.prev)
    end
    if PED.IS_PED_SHOOTING(players.user_ped()) and not PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
        local camcoords = get_offset_from_camera(15)
        objshots(hash, obj, camcoords)
        entities.delete_by_handle(obj.prev)
        util.yield(20)
    end
    
end)

menu.list_select(objgun, T('Object to Shoot'), {''}, T('Change the object that you shoot'), Objn, 1, function (sel)
    obj_hash = Objl[sel]
end)





  menu.toggle(objgun, T('Make Objects Explosive'), {}, T('Makes the objects you shoot explosive when hitting something'), function (on)
    obj.expl =  on
  end)


  menu.text_input(objgun, T('Custom Object'), {'cusobj'}, T('Enter the model name of an object to change the object you shoot example "prop_keg_01"'), function(cusobj)

    if STREAMING.IS_MODEL_A_VEHICLE(util.joaat(cusobj)) then
        obj_hash = cusobj
      elseif STREAMING.IS_MODEL_A_PED(util.joaat(cusobj)) then
        obj_hash = cusobj
      elseif STREAMING.IS_MODEL_VALID(util.joaat(cusobj)) then
        obj_hash = cusobj
    else
       if set.alert then
           util.toast('Improper Object Name (check the spelling)')
       end
    end
end, 'toreador')

local lsrmenu = menu.list(selfroot, T('Lazer Eyes'), {}, '')

local lazereyes = false
local impact = v3.new()
local lazer = {exp = false, bull = 'WEAPON_TACTICALRIFLE', crosshair = true}
menu.toggle_loop(lsrmenu, T('Lazer Eyes'), {'Leyeson'}, T('Shoot lazers out of your eyes also works in vehicles'), function (on)
    lazereyes = on
    if lazer.crosshair then
        HUD.DISPLAY_SNIPER_SCOPE_THIS_FRAME()
    end
    
    local weap = util.joaat(lazer.bull)
    local camrot = CAM.GET_FINAL_RENDERED_CAM_ROT(2)
    WEAPON.REQUEST_WEAPON_ASSET(weap)
    if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped())  then
        SFlev()
    else
        SFle()
    end
    if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) and PAD.IS_CONTROL_PRESSED(0, 68) then
        Leyes(lazer, impact, camrot, weap)
        ENTITY.SET_ENTITY_ROTATION(entities.get_user_vehicle_as_handle(), 0, 0, camrot.z, 2, true)
    elseif not PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) and PAD.IS_CONTROL_PRESSED(0, 25) then
        Leyes(lazer, impact, camrot, weap)
    end
    
    

end)

menu.toggle(lsrmenu, T('Explosions'), {'leexp'}, T('Turn on Explosions with Lazer Eyes'), function (on)
    lazer.exp = on
end)


menu.list_select(lsrmenu, T('Change Bullets'), {'lebullets'}, T('Change the Bullets used for Lazer eyes'), Leyen, 1, function (bulsel)
    lazer.bull = Leyel[bulsel] 
end)

menu.toggle(lsrmenu, T('No Crosshair'), {''}, T('Turn off crosshair with Lazer Eyes'), function (on)
    lazer.crosshair = not on
end)







menu.toggle_loop(selfroot, T('Money Trail'), {}, T('Everywhere you walk fake money appears'), function ()
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local tar1 = ENTITY.GET_ENTITY_COORDS(players.user_ped(), true)
    Streamptfx('scr_exec_ambient_fm')
    if TASK.IS_PED_WALKING(targets) or TASK.IS_PED_RUNNING(targets) or TASK.IS_PED_SPRINTING(targets) then
        GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD('scr_ped_foot_banknotes', tar1.x, tar1.y, tar1.z - 1, 0, 0, 0, 1.0, true, true, true)
    end
    
end)

menu.action(selfroot, T('Stop Spectating'), {'sspect'}, T('Stop Spectating anyone in the lobby'), function ()
    Specon(players.user())
    Specoff(players.user())
end)

menu.action(selfroot, T('Stop Sounds'), {'ssound'}, T('Stop all sounds incase they are going off constantly'), function ()
    Stopsound()
end)

local jump = {height = 0.6 }
menu.toggle_loop(selfroot, T('Ultra Jump'), {}, T('Keep going higher the longer you press jump (can also be used to fly)'), function ()
    if PAD.IS_CONTROL_PRESSED(0, 22) or PAD.IS_CONTROL_JUST_PRESSED(0, 21) then
        PED.SET_PED_CAN_RAGDOLL(players.user_ped(), false)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(players.user_ped(), 1, 0.0, 0.6, jump.height, 0, 0, 0, 0, true, true, true, true)
        if ENTITY.IS_ENTITY_IN_AIR(players.user_ped()) then
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(players.user_ped(), 1, 0.0, 0.6, jump.height, 0, 0, 0, 0, true, true, true, true)
        end
    end
end)

menu.slider(selfroot, T('Ultra Jump Amount'), {'tpslider'}, T('Adjust the amount you move upwards by'), 6, 1000, 6, 1, function (a)
    jump.height = a*0.1
    
end)

menu.toggle_loop(selfroot, T('Turn Radio Off'), {'radoff'}, T('Turn off the radio completely(only for you)'), function ()
    local veh = PED.GET_VEHICLE_PED_IS_IN(players.user_ped())
    if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), false) then
        AUDIO.SET_VEHICLE_RADIO_ENABLED(veh, false)
        util.yield()
    end
end, function ()
    local veh = PED.GET_VEHICLE_PED_IS_IN(players.user_ped())
    AUDIO.SET_VEHICLE_RADIO_ENABLED(veh, true)
end)





 ------------------------------------------


local function create_cam(veh) --credits to Hexarobi for the functions and help with them.
    local cam_pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(veh, 0, 2, 5)
    local camera = CAM.CREATE_CAM_WITH_PARAMS(
        "DEFAULT_SCRIPTED_CAMERA",
        cam_pos.x, cam_pos.y, cam_pos.z,
        0.0, 0.0, 0.0, 70.0, false, false
    )
    CAM.POINT_CAM_AT_ENTITY(camera, veh, 0, 0, 0, true)
    CAM.SET_CAM_ACTIVE(camera, true)
    CAM.RENDER_SCRIPT_CAMS(true, true, 1000, true, true, 0)
    util.yield(1000)
    CAM.STOP_CAM_POINTING(camera)
    return camera
end

local function destroy_cam(camera)
    CAM.RENDER_SCRIPT_CAMS(false, false, 1000, true, false, 0)
    CAM.DESTROY_CAM(camera, true)
    CAM.DESTROY_ALL_CAMS(true)
end

local selected_vehicle
local nearby_vehicle_cam

local function focus_on_nearby_vehicle(vehicle)
    util.yield(1000)
    selected_vehicle = vehicle

    nearby_vehicle_cam = create_cam(selected_vehicle)
end

local function blur_from_nearby_vehicle(vehicle)
    if selected_vehicle ~= selected_vehicle then
            selected_vehicle = nil
    destroy_cam(nearby_vehicle_cam)
    end
    nearby_vehicle_cam = nil
    util.yield(1000)

end
function humanReadableNumber(num) -- from vehicle options by Jackz
    return tostring(math.floor(num)):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end


local nearby_vehicle_menus = {}


local function rebuild_nearby_vehicles_menu()
    for _, nearby_vehicle_menu in pairs(nearby_vehicle_menus) do
        if nearby_vehicle_menu:isValid() then
            menu.delete(nearby_vehicle_menu)
        end
    end
    local handles = entities.get_all_vehicles_as_handles()
    menu.on_focus(menus.vehlist, function ()
     if CAM.DOES_CAM_EXIST(nearby_vehicle_cam) then
         destroy_cam(nearby_vehicle_cam)
         selected_vehicle = nil
         menus.nearby_menu = {}
     end
    end) 

 for _, nearby_vehicle_menu in pairs(nearby_vehicle_menus) do
     if nearby_vehicle_menu:isValid() then
         menu.delete(nearby_vehicle_menu)
     end
 end


local player_pos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
 table.sort(handles, function(a,b)
     local pos_a = ENTITY.GET_ENTITY_COORDS(a, true)
     local pos_b = ENTITY.GET_ENTITY_COORDS(b, true)
     return SYSTEM.VDIST2(player_pos.x, player_pos.y, player_pos.z, pos_b.x, pos_b.y, pos_b.z) > SYSTEM.VDIST2(player_pos.x, player_pos.y, player_pos.z, pos_a.x, pos_a.y, pos_a.z)
 end)
    for _, handle in handles do
    

        local entity_pos = ENTITY.GET_ENTITY_COORDS(handle, 1)
        local dist = SYSTEM.VDIST(player_pos.x, player_pos.y, player_pos.z, entity_pos.x, entity_pos.y, entity_pos.z)
        if dist <= 750 and ENTITY.GET_ENTITY_HEALTH(handle) ~= 0 and ENTITY.GET_ENTITY_SPEED(handle) <= 0 then
            local mod = ENTITY.GET_ENTITY_MODEL(handle)
            local vname = VEHICLE.GET_DISPLAY_NAME_FROM_VEHICLE_MODEL(mod)
            local vmodel = VEHICLE.GET_MAKE_NAME_FROM_VEHICLE_MODEL(mod)
            menus.nearby_menu = menu.list(menus.vehlist, vname..' '..vmodel..' '..humanReadableNumber(dist)..T(' meters'))
            menus.seatmen = menu.list(menus.nearby_menu, T('Takeover Seat'), {}, "")
            local seatnum = VEHICLE.GET_VEHICLE_MODEL_NUMBER_OF_SEATS(mod) + 1
            for i = 1, seatnum do
                local text = Seats[i] or (T("Extra Seat") .. (i - 1))
                menu.action(menus.seatmen, text, {''}, '', function ()
                    local ped = VEHICLE.GET_PED_IN_VEHICLE_SEAT(handle, i - 3)
                    if PED.IS_PED_A_PLAYER(ped) then
                        util.toast('Players Vehicle Seat Occupied')
                    else
                    if ped > 0 then 
                        PED.SET_PED_INTO_VEHICLE(ped, handle, -2)
                    end
                        PED.SET_PED_INTO_VEHICLE(players.user_ped(), handle, i -3)
                        VEHICLE.SET_VEHICLE_ENGINE_ON(handle, true, true, false)
                    end
                end)
            end

            menus.rep = menu.action(menus.nearby_menu, T('Repair and Godmode'), {''}, T('Repair the engine and body of the Vehicle and set Godmode'), function ()
                RepairGod(handle)
            end)

            menus.max = menu.action(menus.nearby_menu, T('Max Out The Vehicle'), {''}, T('Max out the Vehicle and increase speed'), function ()
                Vmod(handle, 'Acjoker')
            end)
        
            menus.exp = menu.action(menus.nearby_menu, T('Explode Vehicle'), {''}, T('Explode the Vehicle'), function ()
                local car = ENTITY.GET_ENTITY_COORDS(handle)
                FIRE.ADD_EXPLOSION(car.x, car.y, car.z, 81, 5000, false, true, 0.0, false)
            end)
        
            menus.yeet = menu.action(menus.nearby_menu, T('Yeet'), {''}, T('Yeet the Vehicle'), function ()
                ENTITY.APPLY_FORCE_TO_ENTITY(handle, 1, math.random(1, 100) * 100, math.random(1, 100)* 100, math.random(1, 100)* 100, 0.0, 0.0, 0.0, 0, false, false, true, false, false)
            end)

            menus.del = menu.action(menus.nearby_menu, T('Delete'), {''}, T('Delete the Vehicle'), function ()
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(handle)
                entities.delete_by_handle(handle)
                destroy_cam(nearby_vehicle_cam)
                menu.focus(menus.vehlist)
            end)



            table.insert(nearby_vehicle_menus, menus.nearby_menu)
            menu.on_focus(menus.nearby_menu, function ()
            destroy_cam(nearby_vehicle_cam)
            menus.create_from_nearby_vehicle = {}
            end)
                menu.on_focus(menus.nearby_menu, function(direction) if direction ~= 0 then focus_on_nearby_vehicle(handle) end end)
                menu.on_blur(menus.nearby_menu, function(direction) if direction ~= 0 then blur_from_nearby_vehicle(handle) end end)

        end
    end
end

menus.create_from_nearby_vehicle = menu.list(vehroot, Str_trans('Nearby Vehicles'), {}, "")
local brgb = {color= {r= 0, g = 1, b = 0, a = 1}}
 menu.colour(menus.create_from_nearby_vehicle, T('Box Color'), {''}, T('Choose the Box color to be changed to'), brgb.color, false, function(ncolor)
    brgb.color = ncolor
end)
    menus.vehlist = menu.list(menus.create_from_nearby_vehicle, T('Vehicles List'), {}, T('Vehicle must not be moving'), function ()
        rebuild_nearby_vehicles_menu()
end)
menus.refreshl = menu.action(menus.vehlist, T('Refresh List'), {''}, T('Refresh list of vehicles'), function ()
    if CAM.DOES_CAM_EXIST(nearby_vehicle_cam) then
        destroy_cam(nearby_vehicle_cam)
        selected_vehicle = nil
 
    end
    for _, nearby_vehicle_menu in pairs(nearby_vehicle_menus) do
        if nearby_vehicle_menu:isValid() then
            menu.delete(nearby_vehicle_menu)
        end
    end
    rebuild_nearby_vehicles_menu()
end)

local function nearby_vehicle_tick()
    if menu.is_open() then
        if selected_vehicle then
        
            local color = {
                r = brgb.color.r * 255,
                g = brgb.color.g * 255,
                b = brgb.color.b * 255,
                a = brgb.color.a * 255
            }
            draw_bounding_box(selected_vehicle, color)
        end
    end

end
util.create_tick_handler(nearby_vehicle_tick)
menu.on_focus(vehroot, function ()
    destroy_cam(nearby_vehicle_cam)
    selected_vehicle = nil
    nearby_vehicle_cam = nil
end)
menu.on_focus(menus.refreshl, function ()
    destroy_cam(nearby_vehicle_cam)
    selected_vehicle = nil
    nearby_vehicle_cam = nil
end)





 --------------------------------------------------------
-- Vehicles





local plscm = menu.list(vehroot, T('Los Santos Customs'), {}, '')

local pbodym = menu.list(plscm, T('Body Modifications'), {}, T('Only shows what is available to be changed. If they get in a new vehicle back out of Body Modifications to refresh options'))

local plighm = menu.list(plscm, T('Lights'), {}, '')

  local pcolm  = menu.list(plscm, T('Vehicle Colors'), {}, '')

  local pwmenu = menu.list(plscm, T('Wheels'), {}, '')

    local vehmenu = {}
  menu.on_focus(pbodym, function ()
    for _, m in ipairs(vehmenu) do
        menu.delete(m)
    end
    vehmenu = {}
    if not players.exists(players.user()) then
        util.stop_thread()
    end
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    if PED.IS_PED_IN_ANY_VEHICLE(pedm, false) then
        for _, v in pairs(Vehopts) do
            local current = VEHICLE.GET_VEHICLE_MOD(vmod, v[1] -1)
            local maxmods = Getmodcou(players.user(), v[1] - 1)
            if maxmods > 0  then
                local modnames = v[2]
                local s = menu.slider(pbodym, modnames , {''}, '',  -1, maxmods  , current, 1, function (mod)
                    Changemod(players.user(), v[1] -1, mod)
                end)
              table.insert(vehmenu, s)
            util.yield()
            end
        end

          for i, v in pairs(Vehtogs) do
            local current = VEHICLE.IS_TOGGLE_MOD_ON(vmod, v[1] -1)
            local tognames = v[2]
            local t = menu.toggle(pbodym, tognames, {''}, '', function (on)
                VEHICLE.TOGGLE_VEHICLE_MOD(vmod, v[1] - 1, on)
              end, current)         
            table.insert(vehmenu, t)
          util.yield()
        end
        end


end)
local colmem = {}

util.create_tick_handler(function ()
    colmem.red = memory.alloc()
    colmem.green = memory.alloc()
    colmem.blue = memory.alloc()
    local vcolor = entities.get_user_vehicle_as_handle()
    VEHICLE.GET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vcolor, colmem.red, colmem.green, colmem.blue)
    colmem.sred = memory.alloc()
    colmem.sgreen = memory.alloc()
    colmem.sblue = memory.alloc()
    VEHICLE.GET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vcolor, colmem.sred, colmem.sgreen, colmem.sblue)
end)


local pcolor = {}
local prgb = {color= {r = memory.read_int(colmem.red) / 255, g =  memory.read_int(colmem.green) / 255, b = memory.read_int(colmem.blue) / 255, a = 1}}
 menus.uservehpai = menu.colour(pcolm, T('Primary Color RGB'), {''}, T('Changes the Primary Color on the Vehicle to RGB'), prgb.color, false, function(prbgc)
    prgb.color = prbgc
    local vcolor = entities.get_user_vehicle_as_handle()
    local red = math.floor(prgb.color.r * 255)
    local green = math.floor(prgb.color.g * 255)
    local blue = math.floor(prgb.color.b * 255)
    VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vcolor, red, green, blue)
end)


local psrgb = {color= {r = memory.read_int(colmem.sred)/ 255, g =  memory.read_int(colmem.sgreen)/ 255, b = memory.read_int(colmem.sblue) / 255, a = 1}}
 menus.uservehspai = menu.colour(pcolm, T('Secondary Color RGB'), {''}, T('Changes the Secondary Color on the Vehicle to RGB'), psrgb.color, false, function(prbgsc)
    psrgb.color = prbgsc
    local vcolor = entities.get_user_vehicle_as_handle()
    local sred = math.floor(psrgb.color.r * 255)
    local sgreen = math.floor(psrgb.color.g * 255)
    local sblue = math.floor(psrgb.color.b * 255)
    VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vcolor, sred, sgreen, sblue)
end)




menu.list_select(pcolm, T('Primary Color'), {''}, T('Changes the Primary Color on the Vehicle'), Mainc, 1, 
function (t)
    pcolor.prim = t - 1
        Changecolor(players.user(), pcolor)
end)

menu.list_select(pcolm, T('Secondary Color'), {''}, T('Changes the Secondary Color on the Vehicle'), Mainc, 1, 
function (t)
    pcolor.sec = t - 1
        Changecolor(players.user(), pcolor)
end)

menu.list_select(pcolm, T('Pearlescent Color'), {''}, T('Changes the Pearlescent Color on the Vehicle'), Mainc, 1, 
function (t)
    pcolor.per = t - 1
        Changewhepercolor(players.user(), pcolor)
end)

menu.list_select(pcolm, T('Wheel Color'), {''}, T('Changes the Wheel Color on the Vehicle'), Mainc, 1, 
function (t)
    pcolor.whe = t - 1
        Changewhepercolor(players.user(), pcolor)
end)

menu.list_select(pcolm, T('Interior Color'), {''}, T('Changes the Interior Color on the Vehicle'), Mainc, 1, 
function (t)
    pcolor.int = t - 1
        Changeintcolor(players.user(), pcolor.int)
end)

menu.list_select(pcolm, T('Dashboard Color'), {''}, T('Changes the Dashboard Color on the Vehicle'), Mainc, 1, 
function (t)
    pcolor.das = t - 1
        Changedashcolor(players.user(), pcolor.das)
end)

menu.list_select(plighm, T('Neons'), {''}, T('Changes the Neons to different colors'), Mainc, 1, 
function(c)
    local ncolor = c - 1
        Changeneon(players.user(), ncolor)
end)

menu.list_select(plscm, T('Window Tints'), {''}, T('Changes the Tint on the Vehicle'), Til, 1, 
function (t)
    local tint = t - 1
        Changetint(players.user(), tint)
end)

menu.list_select(plighm, T('Headlights'), {''}, T('Changes the Headlights to different colors'), Lighc, 1, 

function(c)
    local hcolor = c - 1

        Changehead(players.user(), hcolor)

end)




local pnrgb = {color= {r= 0, g = 1, b = 0, a = 1}}

menu.action(plighm, T('Change RGB Neons'), {}, T('Change the Color for the Neons to RGB of your choice'), function ()
    local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
    RGBNeonKit(pedm)
    local red = math.floor(pnrgb.color.r * 255)
    local green = math.floor(pnrgb.color.g * 255)
    local blue = math.floor(pnrgb.color.b * 255)
    VEHICLE.SET_VEHICLE_NEON_COLOUR(vmod, red, green, blue)
end)

menu.colour(plighm, T('RGB Neon Color'), {'rgbsc'}, T('Choose the Color for the Neons be changed to '), pnrgb.color, false, function(ncolor)
    pnrgb.color = ncolor
end)

menu.list_select(pwmenu, T('Bennys Bespoke'), {''}, T('Changes the wheels to Bennys Bespoke wheels'), Bbw, 1, 
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 9, wheel)
end)


menu.list_select(pwmenu, T('Bennys Originals'), {''}, T('Changes the wheels to Bennys Originals wheels'), Bow, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 8, wheel)

end)


menu.list_select(pwmenu, T('Bike'), {''}, T('Changes the wheels to Bike(motorcycle) wheels'), Bw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 6, wheel)

end)


menu.list_select(pwmenu, T('High End'), {''}, T('Changes the wheels to High End wheels'), Hew, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 7, wheel)
end)


menu.list_select(pwmenu, T('Lowrider'), {''}, T('Changes the wheels to Lowrider wheels'), Lw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 2, wheel)
    
end)

menu.list_select(pwmenu, T('Muscle'), {''}, T('Changes the wheels to Muscle wheels'), Mw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 1, wheel)

end)


menu.list_select(pwmenu, T('Offroad'), {''}, T('Changes the wheels to Offroad wheels'), Orw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 4, wheel)
end)


menu.list_select(pwmenu, T('Racing(Formula 1 Wheels)'), {''}, T('Changes the wheels to Racing(Formula 1 Wheels) wheels'), Rw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 10, wheel)
end)


menu.list_select(pwmenu, T('Sport'), {''}, T('Changes the wheels to Sport wheels'), Spw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 0, wheel)
end)


menu.list_select(pwmenu, T('Street'), {''}, T('Changes the wheels to Street wheels'), Stw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 11, wheel)
end)


menu.list_select(pwmenu, T('SUV'), {''}, T('Changes the wheels to SUV wheels'), Suw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 3, wheel)
    
end)

menu.list_select(pwmenu, T('Tracks'), {''}, T('Changes the wheels to Track wheels'), Trw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 12, wheel)
end)


menu.list_select(pwmenu, T('Tuner'), {''}, T('Changes the wheels to Tuner wheels'), Tuw, 1,
function(w)
    local wheel = w - 1
        Changewheel(players.user(), 5, wheel)
end)

local pwinmenu = menu.list(vehroot, T('Windows'), {}, '')

menu.action(pwinmenu, T('Roll Up All Windows'), {'upwin'}, T('Rolls up all windows at once'), function ()
        Rollaup(players.user())
end)

menu.action(pwinmenu, T('Roll Down All Windows'), {'downwin'}, T('Rolls up all windows at once'), function ()
        Rolladown(players.user())
end)


local winmen = menu.list(pwinmenu, T('Roll Up and Down Windows'), {''}, T('Roll Up and Down Individual Windows'))
        
for index, name in ipairs(Windows) do
    menu.toggle(winmen, T('Roll up or down ')..name, {''}, T('Roll up or down ')..name, function (on)
        local win = index - 1
        local curcar = entities.get_user_vehicle_as_handle()
        local winup= on
        if winup ~= nil then
            if winup then
                VEHICLE.ROLL_DOWN_WINDOW(curcar, win)
            else
                VEHICLE.ROLL_UP_WINDOW(curcar, win)
            end
        end

    end)
    end

    





local rgbvm = menu.list(vehroot, T('RGB Vehicle'), {}, '')
local rgb = {cus = 100}

    

    menu.toggle_loop(rgbvm, T('Custom RGB Synced'), {}, T('Change the vehicle color and neon lights to custom RGB with a synced color'), function ()
       if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), true) ~= 0 then
        local vmod = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), true)
        RGBNeonKit(players.user_ped())
        local red = (math.random(0, 255))
        local green = (math.random(0, 255))
        local blue = (math.random(0, 255))
        VEHICLE.SET_VEHICLE_NEON_COLOUR(vmod, red, green, blue)
        VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(vmod, red, green, blue)
        VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(vmod, red, green, blue)
        util.yield(rgb.cus)
       end
    end)

    menu.slider(rgbvm, T('Custom RGB Speed'), {''}, T('Adjust the speed of the custom RGB'), 1, 1000, 100, 10, function (c)
        rgb.cus = c
    end)


    local srgb = {cus = 100}
    menu.toggle_loop(rgbvm, T('Synced Color with Headlights'), {}, T('Change the neons, headlights, interior and vehicle color to the same color'), function ()
        local color = {
          {64, 1}, --blue
          {73, 2}, --eblue  
          {51, 3}, --mgreen
          {92, 4}, --lgreen
          {89, 5}, --yellow
          {88, 6}, --gshower
          {38, 7}, --orange
          {39 , 8}, --red
          {137, 9}, --ponypink
          {135, 10}, --hotpink
          {145, 11}, --purple
          {142, 12} --blacklight
        }
       if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) ~= 0 then
        local vmod = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), true)
        RGBNeonKit(players.user_ped())
        local rcolor = math.random(1, 12)
        VEHICLE.TOGGLE_VEHICLE_MOD(vmod, 22, true)
        VEHICLE.SET_VEHICLE_NEON_INDEX_COLOUR(vmod, color[rcolor][1])
        VEHICLE.SET_VEHICLE_COLOURS(vmod, color[rcolor][1], color[rcolor][1])
        VEHICLE.SET_VEHICLE_EXTRA_COLOURS(vmod, 0, color[rcolor][1])
        VEHICLE.SET_VEHICLE_EXTRA_COLOUR_5(vmod, color[rcolor][1])
        VEHICLE.SET_VEHICLE_XENON_LIGHT_COLOR_INDEX(vmod, color[rcolor][2])
        util.yield(srgb.cus)
       end
    end)
  
    menu.slider(rgbvm, T('Synced RGB Speed'), {''}, T('Adjust the speed of the synced RGB'), 1, 1000, 100, 10, function (c)
        srgb.cus = c
    end)
 ---------------------------------Space Docker------------------------------------------------
    local sdroot = menu.list(vehroot, T('Lazer Space Docker'), {}, T('Space Docker with lazers')) --credits to Nowiry for the functions to make this work
    local lsd ={weap = 'WEAPON_RAYCARBINE', hash = util.joaat('dune2')}
    local function SDcreate(pCoor, pedSi)
        Lsdcar = VEHICLE.CREATE_VEHICLE(lsd.hash, pCoor.x, pCoor.y, pCoor.z, 0, true, true, false)
        PED.SET_PED_INTO_VEHICLE(pedSi, Lsdcar, -1)
        Vmod(Lsdcar, 'Lazers')
       local CV = CAM.GET_GAMEPLAY_CAM_RELATIVE_HEADING()
       ENTITY.SET_ENTITY_HEADING(Lsdcar, CV)
     
       local lsdweap = {
        T('Unholy Hellbringer'),
        T('Up-n-Atomizer'),
    }
    local lsdh = {
        'weapon_raycarbine',
        'weapon_raypistol',
    }

    Lsd_w = menu.list_select(sdroot, T('LSD Weapon'), {'lsdweap'}, T('Changes weapon for Lazer Space Docker'), lsdweap, 1, function(vweap)
        lsd.weap = lsdh[vweap]
        end)
     
       util.create_tick_handler(function ()
            if PED.IS_PED_IN_VEHICLE(players.user_ped(), Lsdcar, false) ==true then
            VEHICLE.SET_VEHICLE_DIRT_LEVEL(Lsdcar, 0)
            ENTITY.SET_ENTITY_INVINCIBLE(Lsdcar, true)
            VEHICLE.SET_VEHICLE_CAN_BE_VISIBLY_DAMAGED(Lsdcar, false)
            SFlsd()
            end
        end)


    end


    local get_vehicle_cam_relative_heading = function(vehicle)
        local camDir = CAM.GET_GAMEPLAY_CAM_ROT(0):toDir()
        local fwdVector = ENTITY.GET_ENTITY_FORWARD_VECTOR(vehicle)
        camDir.z, fwdVector.z = 0.0, 0.0
        local angle = math.acos(fwdVector:dot(camDir) / (#camDir * #fwdVector))
        return math.deg(angle)
    end
    local shoot_from_vehicle = function (vehicle, damage, weaponHash, ownerPed, isAudible, isVisible, speed, target, position)
        local min, max = v3.new(), v3.new()
        local offset
        MISC.GET_MODEL_DIMENSIONS(ENTITY.GET_ENTITY_MODEL(vehicle), min, max)
        if position == 0 then
            offset = v3.new(min.x + 0.3, max.y + 0.25, 0.5)
        elseif position == 1 then
            offset = v3.new(min.x + 0.3, min.y + 4, 0.5)
        elseif position == 2 then
            offset = v3.new(max.x - 0.3, max.y + 0.25, 0.5)
        elseif position == 3 then
            offset = v3.new(max.x - 0.3, min.y + 4, 0.5)
        else
            error("got unexpected position")offset = v3.new(min.x + 0.25, max.y, 0.5)
        end
        local a = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(vehicle, offset.x, offset.y - 3.15, offset.z + 1.05)
        local direction = ENTITY.GET_ENTITY_ROTATION(vehicle, 2):toDir()
        if get_vehicle_cam_relative_heading(vehicle) > 95.0 then
            direction:mul(-1)
        end
        local b = v3.new(direction)
        b:mul(300.0); b:add(a)
    
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY_NEW(
            a.x, a.y, a.z,
            b.x, b.y, b.z - 15,
            damage,
            true,
            weaponHash,
            ownerPed,
            isAudible,
            not isVisible,
            speed,
            vehicle,
            false, false, target, false, 0, 0, 0
        )
    end


    SDspawn = menu.toggle_loop(sdroot, T('Spawn Lazer Space Docker'), {'lsdspawn'}, T('Space Docker that can shoot lazers'), function ()

        Streament(lsd.hash)
        local pedSi = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        local pCoor = ENTITY.GET_ENTITY_COORDS(players.user_ped())
        local pH = ENTITY.GET_ENTITY_HEADING(pCoor)
    
            if players.is_in_interior(players.user()) ==true then
                if set.alert then
                    util.toast('Lazer Space Docker will not Spawn in interior')
                end
                menu.set_value(SDspawn, false)
                return
            end
            
        if PED.IS_PED_IN_VEHICLE(players.user_ped(), Lsdcar, true) ==false and PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) ==true then
            local curcar = entities.get_user_vehicle_as_handle()
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(curcar)
            entities.delete_by_handle(curcar)
            if set.alert then
                util.toast('Fuck that car')
            end
            for i = 1, 1 do
                SDcreate(pCoor, pedSi)
            end

    
            elseif PED.IS_PED_IN_VEHICLE(players.user_ped(), Lsdcar, true) ==true then
                local weap = util.joaat(lsd.weap)
                WEAPON.REQUEST_WEAPON_ASSET(weap)
            
                if not ENTITY.DOES_ENTITY_EXIST(Lsdcar) or not PAD.IS_CONTROL_PRESSED(0, 86)
                then
                    return
                elseif get_vehicle_cam_relative_heading(Lsdcar) < 95.0 then
                    shoot_from_vehicle(Lsdcar, 200, weap, players.user_ped(), true, true, 2000.0, 0, 0)
                    shoot_from_vehicle(Lsdcar, 200, weap, players.user_ped(), true, true, 2000.0, 0, 2)
                else
                    shoot_from_vehicle(Lsdcar, 200, weap, players.user_ped(), true, true, 2000.0, 0, 1)
                    shoot_from_vehicle(Lsdcar, 200, weap, players.user_ped(), true, true, 2000.0, 0, 3)
                end


            elseif PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) ==false and not ENTITY.DOES_ENTITY_EXIST(Lsdcar) then
                SDcreate(pCoor, pedSi)
                     if set.alert then
                        util.toast('Lazer Space Docker Spawned')
                     end
            end
    
    if PED.IS_PED_GETTING_INTO_A_VEHICLE(players.user_ped()) ==false and PED.IS_PED_IN_VEHICLE(players.user_ped(), Lsdcar , false) ==false
                then
                    if set.alert then
                        util.toast('Player has left the Lazer Space Docker and it has been deleted')
                    end
            ---@diagnostic disable-next-line: param-type-mismatch
                  menu.set_value(SDspawn, false)
                  STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(lsd.hash)
                  ENTITY.SET_ENTITY_AS_MISSION_ENTITY(Lsdcar)
                  entities.delete_by_handle(Lsdcar)
                  menu.delete(Lsd_w)
                  util.stop_thread()
                end
        
    end)

    ----------------------------------------------



---------------------------------- FF9 Charger ----------------------------------
local charroot = menu.list(vehroot, T('Charger'), {}, T('Duke O Death with Electro Magnet capabilities'))
local charger = {charg = util.joaat('dukes2'), emp = util.joaat('hei_prop_heist_emp')}
local function Ccreate(pCoor, pedSi)

        FFchar = VEHICLE.CREATE_VEHICLE(charger.charg, pCoor.x, pCoor.y, pCoor.z + 1, 0, true, true, false)
        PED.SET_PED_INTO_VEHICLE(pedSi, FFchar, -1)
        VEHICLE.SET_VEHICLE_COLOURS(FFchar, 118, 0)
        Vmod(FFchar, 'Mopar')
        VEHICLE.SET_VEHICLE_WHEEL_TYPE(FFchar, 7)
        VEHICLE.SET_VEHICLE_MOD(FFchar, 23, 26)
        util.yield(150)

       local ccoor = ENTITY.GET_ENTITY_COORDS(FFchar)

        if  ENTITY.DOES_ENTITY_EXIST(charger.emp) ==false
        then Empa = OBJECT.CREATE_OBJECT(charger.emp, ccoor.x, ccoor.y -1, ccoor.z -1, true, true, true)
            ENTITY.ATTACH_ENTITY_TO_ENTITY(Empa, FFchar, 0, 0.0, -2.0, 0.5, 0.0, 0.0, 0.0, false, true, false, false, 0, true)
            local CV = CAM.GET_GAMEPLAY_CAM_RELATIVE_HEADING()
            ENTITY.SET_ENTITY_HEADING(FFchar, CV)
            util.yield()
        end

    local magtf = {true, false}
    local maglist = {Str_trans('Push Away'), Str_trans('Blow Up')}
    local magval = {scale = 5000, nodam = true}
    function Magout()
        if  PAD.IS_CONTROL_PRESSED(0, 86) then
        local car = ENTITY.GET_ENTITY_COORDS(players.user_ped())
        for x = 0, 10 do
            FIRE.ADD_EXPLOSION(car.x + x, car.y, car.z, 81, magval.scale, false, true, 0.0, magval.nodam)
        end
        for y = 0, 10 do
            FIRE.ADD_EXPLOSION(car.x, car.y + y, car.z, 81, magval.scale, false, true, 0.0, magval.nodam)
        end
        end
    util.yield()
end

local closeveh = {}
function Yeet()
    local car = entities.get_all_vehicles_as_handles()
    for key, value in pairs(car) do
        
   
    local cvc = ENTITY.GET_ENTITY_COORDS(value)
    local chc = ENTITY.GET_ENTITY_COORDS(FFchar)
    local disbet = SYSTEM.VDIST2(chc.x, chc.y, chc.z, cvc.x, cvc.y, cvc.z)
    if  PAD.IS_CONTROL_PRESSED(0, 72) and PAD.IS_CONTROL_PRESSED(0, 76) then
        for _, pveh in ipairs(car) do
            if disbet >= 5 then
                table.insert(closeveh, pveh)
            end
            if #closeveh >= 50 then break end
        for _, cv in ipairs(closeveh) do
            if cv ~= car then
                ENTITY.FREEZE_ENTITY_POSITION(FFchar, true)
                Getent(cv)
                ENTITY.APPLY_FORCE_TO_ENTITY(cv, 1, math.random(1, 100), math.random(1, 100), math.random(1, 100), 0.0, 0.0, 0.0, 0, false, false, true, false, false)
                closeveh = {}
            end

        end
        end
        if set.alert then
            util.toast('Yeet')
        end

    else closeveh = {}
    end
    ENTITY.FREEZE_ENTITY_POSITION(FFchar, false)
end

end

    Mag_int = menu.list_action(charroot, Str_trans('Magnet Intensity'), {'Magint'}, Str_trans('Changes Magnet to Push Away or Blow up'), maglist, function(magint)
        magval.nodam = magtf[magint]
        end)

    Mag_sca = menu.slider(charroot, Str_trans('Magnet Push Away Scale'), {}, Str_trans('Change how far you push away objects'), 0, 10000, 5000, 5000, function (s)
        magval.scale = s
    end)    
      util.create_tick_handler(function ()
            if PED.IS_PED_IN_VEHICLE(players.user_ped(), FFchar, false) ==true then
            VEHICLE.SET_VEHICLE_DIRT_LEVEL(FFchar, 0)
            ENTITY.SET_ENTITY_INVINCIBLE(FFchar, true)
            VEHICLE.SET_VEHICLE_CAN_BE_VISIBLY_DAMAGED(FFchar, false)
            SF()
            end
        end)
    end
 Spawn = menu.toggle_loop(charroot, T('Spawn FF9 EMP Charger'), {'FF9Wspawn'}, T('Spawn Charger from FF9 with Electro Magnet capabilities'), function ()

    Streament(charger.charg)
    Streament(charger.emp)
    


        if players.is_in_interior(players.user()) ==true then
            if set.alert then
                util.toast('Charger will not Spawn in interior')
            end
            menu.set_value(Spawn, false)
            return
        end

    if PED.IS_PED_IN_VEHICLE(players.user_ped(), FFchar, true) ==false and PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) ==true then
        local curcar = entities.get_user_vehicle_as_handle()
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(curcar)
        entities.delete_by_handle(curcar)
        if set.alert then
            util.toast('Fuck that car')
        end
        for i = 1, 1 do
            local pedSi = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
            local pCoor = ENTITY.GET_ENTITY_COORDS(players.user_ped(), true)
            Ccreate(pCoor, pedSi)
        end
        

        elseif PED.IS_PED_IN_VEHICLE(players.user_ped(), FFchar, true) ==true then
            Magout()
            Yeet()
        elseif PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) ==false then
            local pedSi = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
            local pCoor = ENTITY.GET_ENTITY_COORDS(players.user_ped(), true)
                Ccreate(pCoor, pedSi)
                 if set.alert then
                    util.toast('Charger Spawned')
                 end
        end

if PED.IS_PED_GETTING_INTO_A_VEHICLE(players.user_ped()) ==false and PED.IS_PED_IN_VEHICLE(players.user_ped(), FFchar , false) ==false
            then
                if set.alert then
                    util.toast('Player has left Charger and it has been deleted')
                end
        ---@diagnostic disable-next-line: param-type-mismatch
              menu.set_value(Spawn, false)
              ENTITY.SET_ENTITY_AS_MISSION_ENTITY(FFchar)
              entities.delete_by_handle(FFchar)
              ENTITY.SET_ENTITY_AS_MISSION_ENTITY(Empa)
              entities.delete_by_handle(Empa)
              menu.delete(Mag_int)
              menu.delete(Mag_sca)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(charger.charg)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(charger.emp)

              util.stop_thread()

            end
end)


menu.toggle(vehroot, T('Reduce Burnout'), {'Rburnout'}, T('Makes it to where the vehicle does not burnout as easily'), function (tog)
    PHYSICS.SET_IN_ARENA_MODE(tog)
end)

menu.toggle_loop(vehroot, T('Stick to Walls'), {'sticktg'}, T('Makes it to where the vehicle sticks to walls(using horn boost on the lowest setting helps get up on the walls)'), function ()
    local curcar = entities.get_user_vehicle_as_handle()
    if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(curcar, 1, 0, 0, - 0.5, 0, true, true, true, true)
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(curcar, 40)
    else
        util.yield()
    end

end)


local horn = {speed = 40}
menu.toggle_loop(vehroot, T('Horn Boost'), {'horn'}, T('Boost the car when the horn is pressed you can hold it down to go continously'), function ()
        local vmod = entities.get_user_vehicle_as_handle()
        if PLAYER.IS_PLAYER_PRESSING_HORN(players.user()) then
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(vmod, horn.speed)
        end
end)

menu.slider(vehroot, T('Change Speed for Horn Boost'), {''}, T('Change Speed for Horn Boost (actual speed is roughly double the number in MPH)'), 10, 2147483647, 40, 10, function (s)
    horn.speed = s
 end)

menu.toggle_loop(vehroot, T('Unlimited Submarine Crush Depth'), {'subdepth'}, T('Increases Submarine Crush Depth limit to Unlimited'), function ()
    local subs = {'submersible','submersible2','avisa','kosatka', 'toreador'}
    local cursub = ENTITY.GET_ENTITY_MODEL(entities.get_user_vehicle_as_handle())
    for _, s in ipairs(subs) do
        if cursub == util.joaat(s) then
            VEHICLE.SET_SUBMARINE_CRUSH_DEPTHS(entities.get_user_vehicle_as_handle(), false, 2000, 2000, 2000)
        end
    end
end)

local fly = {speed = 100, coll = false, stop = true, contr = false}
local function vehflight(curcar, speed)
    if fly.stop then
        ENTITY.FREEZE_ENTITY_POSITION(curcar, true)
    end
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(curcar)
    local camr = CAM.GET_GAMEPLAY_CAM_ROT(0)
    
    ENTITY.SET_ENTITY_ROTATION(curcar, camr.x, camr.y, camr.z, 1, true)

if PAD.IS_CONTROL_PRESSED(0, 71) then
    ENTITY.FREEZE_ENTITY_POSITION(curcar, false)
    VEHICLE.SET_VEHICLE_FORWARD_SPEED(curcar, speed)
    if PAD.IS_CONTROL_PRESSED(0, 76) then
        ENTITY.FREEZE_ENTITY_POSITION(curcar, false)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(curcar, 2 * speed)
    
    end

elseif PAD.IS_CONTROL_PRESSED(0, 72) then
    ENTITY.FREEZE_ENTITY_POSITION(curcar, false)
    VEHICLE.SET_VEHICLE_FORWARD_SPEED(curcar, - speed)
    if PAD.IS_CONTROL_PRESSED(0, 76) then
        ENTITY.FREEZE_ENTITY_POSITION(curcar, false)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(curcar, - 2 * speed)
    
    end

end


if fly.contr then
    SFfly2()
    if PAD.IS_CONTROL_PRESSED(0, 61) then
        ENTITY.FREEZE_ENTITY_POSITION(curcar, false)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(curcar, 1, 0, 0, speed, 0, true, true, true, true)
    elseif PAD.IS_CONTROL_PRESSED(0, 62) then
        ENTITY.FREEZE_ENTITY_POSITION(curcar, false)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(curcar, 1, 0, 0, - speed, 0, true, true, true, true)
    elseif PAD.IS_CONTROL_PRESSED(0, 64) then
        ENTITY.FREEZE_ENTITY_POSITION(curcar, false)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(curcar, 1, speed/2, 0, 0, 0, true, true, true, true)
    elseif PAD.IS_CONTROL_PRESSED(0, 63) then
        ENTITY.FREEZE_ENTITY_POSITION(curcar, false)
        ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(curcar, 1, - speed/2, 0, 0, 0, true, true, true, true)
    end
else SFfly()
end

    
end
local flyroot = menu.list(vehroot, T('Vehicle Fly'), {}, T('Fly your vehicle'))

Vflight = menu.toggle_loop(flyroot, T('Vehicle Flight'), {'vfly'}, T('Turn on Vehicle Flight (best to have this as a hotkey for easy access)'), function ()
    
    local curcar = PED.GET_VEHICLE_PED_IS_IN(players.user_ped())
    if fly.coll then
        ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(curcar , false, true)
        else 
            ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(curcar , true, true) 
    end
    

    if PED.IS_PED_IN_ANY_VEHICLE(players.user_ped()) then
        if curcar ~= 0 then
            vehflight(curcar, fly.speed)
        end
       
       
    else 
        util.toast('You are not in a vehicle flight off')
        ENTITY.FREEZE_ENTITY_POSITION(curcar, false) 
        menu.set_value(Vflight, false)
    end
end, function ()
    local curcar = PED.GET_VEHICLE_PED_IS_IN(players.user_ped())
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(curcar)
    ENTITY.FREEZE_ENTITY_POSITION(curcar, false)
    menu.set_value(Discol, false)
    ENTITY.SET_ENTITY_HAS_GRAVITY(curcar, true)
end)

menu.slider(flyroot, T('Change how fast you fly'), {'flyspeed'}, T('Change Speed for Vehicle Flight (actual speed is roughly double the number in MPH)'), 10, 2147483647, 150, 10, function (s)
   fly.speed = s
 end)

Discol = menu.toggle(flyroot, T('Disable Collision'), {'discol'}, T('Disable the Collision with other objects when you are flying'), function (on)
    fly.coll = on
end)

menu.toggle(flyroot, T('Disable Stop'), {''}, T('Disable stopping after letting go of the button'), function (on)
    fly.stop = not on
end)

menu.toggle(flyroot, T('Add more controls'), {''}, T('Add up, down, left and right controls.'), function (on)
    fly.contr = on
end)

menu.action(vehroot, T('Change Speed Limit'), {}, T('Change Speed Limit to Max if you have not already so you can fly or boost faster'), function ()
    menu.set_value(menu.ref_by_path("Vehicle>Movement>Speed Limit (KMH)"), 10000)
    if set.alert then
        ACutil(Str_trans('Speed Limit Changed to ')..tostring(menu.get_value(menu.ref_by_path("Vehicle>Movement>Speed Limit (KMH)"))))
    end
end)











 local current_preview = nil
 local function remove_preview()
    if current_preview ~= nil then
        if current_preview.handle ~= nil then
            entities.delete_by_handle(current_preview.handle)
        end
    end

    
    
    end
--Vehicle Aliases added by Hexarobi
    menu.toggle(vehroot, T('Vehicle Aliases'), {'Valiases'}, T('Activate the list of vehicle name aliases used for spawning, you can use this to turn it off if mulitple people have it running'), function (on)
        menus.vehicle_alias = on
    end)
    menus.vehicle_aliases = menu.list(vehroot, Str_trans('Vehicle Aliases List'), {}, Str_trans('A list of vehicle name aliases used for spawning'))


    
    for alias, vehicle in pairs(VEHICLE_ALIASES) do
        local alias_menu_item = menu.action(menus.vehicle_aliases, alias, {alias}, T("Spawn ")..vehicle, function(click_type, pid)
                local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
                menus.veh = util.joaat(vehicle)

                if menus.vehicle_alias then
                    Vspawn(menus.veh, tar1, targets, tostring(players.get_name(pid)))
                    else
                        if set.alert then
                            util.toast('Vehicle Aliases not set')
                        end
                         
                end
        end, nil, nil, COMMANDPERM_SPAWN)

        menu.on_focus(alias_menu_item, function ()
          --local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
          --local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
            local hash = util.joaat(vehicle)
            Streament(hash)
            local handle = entities.create_vehicle(hash, {x=0, y=0, z=0}, 0)
            if handle then
                ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(handle , false, true)
                ENTITY.SET_ENTITY_INVINCIBLE(handle, true)
                ENTITY.SET_ENTITY_ALPHA(handle , 206, false)
                ENTITY.FREEZE_ENTITY_POSITION(handle, true)
                current_preview = {
                    handle = handle,
                    position={x=0,y=0,z=0},
                    rotation={x=0,y=0,z=0},
                    camera_distance=5
                }
            end
        end)
        menu.on_blur(alias_menu_item, function()
          entities.delete_by_handle(current_preview.handle)
          current_preview = nil
        end)
      end
      util.create_tick_handler(function ()
        if current_preview ~= nil then
            if menu.is_open() then
                Update_preview_tick(current_preview)
            else
                remove_preview()
          
            end
        end
        
      end)

      local function add_preview(vehicle)
   
        Streament(vehicle)
        local handle = entities.create_vehicle(vehicle, {x=0, y=0, z=0}, 0)
        if handle then
            ENTITY.SET_ENTITY_COMPLETELY_DISABLE_COLLISION(handle , false, true)
            ENTITY.SET_ENTITY_INVINCIBLE(handle, true)
            ENTITY.SET_ENTITY_ALPHA(handle , 206, false)
            ENTITY.FREEZE_ENTITY_POSITION(handle, true)
            current_preview = {
                handle = handle,
                position={x=0,y=0,z=0},
                rotation={x=0,y=0,z=0},
                camera_distance=5
            }
        end
      end




      local function save_vehicles(vehicles_list)
        local file = io.open(Fav_Vehicles, "wb")
        if file == nil then ACutil(Str_trans("Error opening vehicles list file for writing: ")..Fav_Vehicles, TOAST_ALL) return end
        file:write(soup.json.encode(vehicles_list))
        file:close()
    end
    
    local function load_vehicles()
        local file = io.open(Fav_Vehicles)
        if file then
            local version = file:read()
            file:close()
            local load_vehicles_status, vehicles_list = pcall(soup.json.decode, version)
            if not load_vehicles_status then
                error("Could not decode vehicles list file")
            end
            return vehicles_list
        else
            return {}
        end
    end

    
    local function add_vehicle(hash)
        local new_vehicle = {hash=hash}
        local vehicles_list = load_vehicles()
        for _, vehicle in pairs(vehicles_list) do
            if vehicle.hash == new_vehicle.hash then
                return true
            end
        end
        table.insert(vehicles_list, new_vehicle)
        save_vehicles(vehicles_list)
        return true
    end
    
    local function remove_vehicle(hash)
        
        local vehicles_list = load_vehicles()
        for index, vehicle in pairs(vehicles_list) do
            if vehicle.hash == hash then
                vehicles_list[index] = nil
                save_vehicles(vehicles_list)
                return true
            end
        end
        return false
    end
        
    local eng = { soun = 'monster'}
      local vlistroot = menu.list(vehroot, T('Vehicles Sounds'), {}, T('List of Vehicles to change the sounds to'))
      local function build_curated_constructs_menu(root_menu, curated_item)
          if curated_item.is_folder then
              local child_menu = menu.list(root_menu, curated_item.name)
              for _, child_item in pairs(curated_item.items) do
                  build_curated_constructs_menu(child_menu, child_item)
              end
          else
            
              curated_item.load_menu = menu.action(root_menu, curated_item.name or "Unknown", {}, util.reverse_joaat(curated_item.hash) or "", function()
                menu.set_menu_name(menus.curvtog, T('Current Sound ')..util.reverse_joaat(curated_item.hash))
                AUDIO.FORCE_USE_AUDIO_GAME_OBJECT(entities.get_user_vehicle_as_handle(),  util.reverse_joaat(curated_item.hash))
                ACutil(Str_trans('Vehicle Sound changed to ')..util.reverse_joaat(curated_item.hash))
                if util.reverse_joaat(curated_item.hash) ~= "" then
                    local vehicles_list = load_vehicles()
                    for index, vehicle in pairs(vehicles_list) do
                        if vehicle.hash == util.reverse_joaat(curated_item.hash) then
                            remove_vehicle(util.reverse_joaat(curated_item.hash))
                            ACutil(util.reverse_joaat(curated_item.hash)..Str_trans(' removed'))
                            return true
                        end
                    end
                    if STREAMING.IS_MODEL_A_VEHICLE(util.joaat(util.reverse_joaat(curated_item.hash))) then
                        add_vehicle(util.reverse_joaat(curated_item.hash))  
                        ACutil(util.reverse_joaat(curated_item.hash)..Str_trans(' added'))     
                    else
                        util.toast('Improper Vehicle Name (check the spelling)')
                    end
                    return true
                end
                
                
                
                
              end)
              
              menu.on_focus(curated_item.load_menu, function(direction) if direction ~= 0 then add_preview(curated_item.hash) end end)
              menu.on_blur(curated_item.load_menu, function(direction) if direction ~= 0 then remove_preview() end end)
    
            end

         

      end

      menus.create_from_vehicle_list = menu.list(vlistroot, Str_trans("From Vehicle List"), {}, Str_trans("Change Vehicle Sound from a list of vehicles"), function()
          for _, curated_section in pairs(Curated_attachments) do
              if curated_section.name == "Vehicles" then
                  for _, curated_item in pairs(curated_section.items) do
                      build_curated_constructs_menu(menus.create_from_vehicle_list, curated_item)
                  end
              end
          end
      end)





    local vehicle_menus = {}
    
    local function regen_veh_tab(root)
        local vload = load_vehicles()
        for i, vehicle_menu in pairs(vehicle_menus) do
            if menu.is_ref_valid(vehicle_menu) then menu.delete(vehicle_menu) end
        end
        vehicle_menus = {}
        for _, vehicle_load in pairs(vload) do
            for i, v in pairs(vehicle_load ) do
                local vehicle_menu = menu.list(root, v, {''}, v)
                menu.action(vehicle_menu, T('Apply Sound'), {}, T('Apply Vehicle Sound'), function ()
                        AUDIO.FORCE_USE_AUDIO_GAME_OBJECT(entities.get_user_vehicle_as_handle(), v)
                        eng.soun = v
                        menu.set_menu_name(menus.curvtog, T('Current Vehicle Sound ')..eng.soun)
                        ACutil(Str_trans('Vehicle Sound changed to ')..eng.soun)
                end)
                menu.action(vehicle_menu, T('Delete Sound'), {}, T('Delete sound from your favorites(back out of the list for it to be removed)'), function ()
                    remove_vehicle(v)
                    ACutil(v..Str_trans(' removed'))
                    return true
                end)
                menu.on_focus(vehicle_menu, function(direction) if direction ~= 0 then add_preview(util.joaat(v)) end end)
                menu.on_blur(vehicle_menu, function(direction) if direction ~= 0 then remove_preview() end end)
 
                table.insert(vehicle_menus, vehicle_menu)

            end
        end

    end


        


      menu.text_input(vlistroot, T('Add/Remove a Favorite vehicle'), {'favveh'}, T('Add/Remove a Favorite Vehicle to the list'), function (favveh)
 
        if favveh ~= "" then
            local vehicles_list = load_vehicles()
            for index, vehicle in pairs(vehicles_list) do
                if vehicle.hash == favveh then
                    remove_vehicle(favveh)
                    ACutil(favveh..Str_trans(' removed'))
                    return true
                end
            end
            if STREAMING.IS_MODEL_A_VEHICLE(util.joaat(favveh)) then
                add_vehicle(favveh)    
                ACutil(favveh..Str_trans(' added'))       
            else
                util.toast('Improper Vehicle Name (check the spelling)')
            end
            return true
        end
      end)



        Fav_tab = menu.list(vlistroot, T('Your Favorites'), {''}, T('A list of Your Favorites'), function ()
            regen_veh_tab(Fav_tab)
        end)
        
        local engtog = {}
        
        menu.toggle_loop(vlistroot, T('Automatically Apply Engine Sound'), {}, T('Automatically Apply Engine Sound when you enter a vehicle'), function ()
                engtog.veh = entities.get_user_vehicle_as_handle()
                if PED.IS_PED_GETTING_INTO_A_VEHICLE(players.user_ped()) or not VEHICLE.GET_IS_VEHICLE_ENGINE_RUNNING(engtog.veh) then
                    AUDIO.FORCE_USE_AUDIO_GAME_OBJECT(engtog.veh, eng.soun)
                end            
        end, function ()
            util.stop_thread()
        end)

        menus.curvtog = menu.action(vlistroot, Str_trans('Current Engine Sound ')..eng.soun, {}, T('Current Engine Sound that is automtically applied'), function ()
        end)


--------------------------------------------------------------
menus.speedruns = menu.list(onlineroot, T('Speed Run'), {}, '')



menu.toggle_loop(menus.speedruns, T('Instant Finish Criminal Damage'), {'instacrimdam'}, T('Instantly win Criminal Damage Session Event'), function ()
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(util.joaat("am_criminal_damage")) ~= 0 then
          SET_INT_LOCAL('am_criminal_damage', 105,  2147483647)
          util.yield(3000)
          SET_INT_LOCAL('am_criminal_damage', 110 + 39, 0)
      end
      
  end)





menus.taxi = menu.list(onlineroot, T('Taxi Service'), {}, '')

menu.action(menus.taxi, T('Go to Pegasus Taxi'), {'taxipeg'}, T('Teleports you to the Pegasus Taxi and starts the auto teleport (taxi must be called in already)'), function ()
    local taxi_blip = HUD.GET_NEXT_BLIP_INFO_ID(198)
    local taxi_ent = HUD.GET_BLIP_INFO_ID_ENTITY_INDEX(taxi_blip)
    local taxi = HUD.GET_BLIP_COORDS(taxi_blip)
    local pcoor = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(players.user_ped(), 0, 3, 0)
    if taxi.x ~= 0 and taxi.y ~= 0 and taxi.z ~= 0 then
        SEC(players.user_ped(), taxi.x, taxi.y, taxi.z, false, true, true, false)
        util.yield(150)
    else util.toast('No Taxi Found')
    end

    while not PED.IS_PED_IN_VEHICLE(players.user_ped(), taxi_ent, true) do
         taxi_blip = HUD.GET_NEXT_BLIP_INFO_ID(198)
         taxi_ent = HUD.GET_BLIP_INFO_ID_ENTITY_INDEX(taxi_blip)
        PED.SET_PED_INTO_VEHICLE(players.user_ped(), taxi_ent, -1)
        util.yield()
    end

    
    if HUD.DOES_BLIP_EXIST(taxi_blip) and PED.IS_PED_IN_VEHICLE(players.user_ped(), taxi_ent, true) then

        if taxi.x ~= 0 and taxi.y ~= 0 and taxi.z ~= 0  then
            SEC(taxi_ent, pcoor.x, pcoor.y, pcoor.z, false, true, true, false)
            
        else
            if set.alert then
            util.toast('No Taxi Found')
            end
        end
    end
    menu.trigger_commands('tptaxi')
end)

local curcoords = {}
menus.taxitog = menu.toggle_loop(menus.taxi, T('Auto TP to Taxi Pickup'), {'tptaxi'}, T('Auto teleports to the Taxi Pickup Person, picks them up and drops them off until you are not in a taxi anymore'), function ()
    if curcoords.x == nil then
        curcoords = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    return curcoords
    end
        local play_car = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)
        local vhash = ENTITY.GET_ENTITY_MODEL(play_car)
        if play_car == 0 or util.reverse_joaat(vhash) ~= 'taxi' then
            SEC(players.user_ped(), 895.1739, -179.2708, 74.70049, false, true, true, false)
            util.yield(2500)
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 51, 1)
            util.yield(10000)
            elseif play_car ~= 0 and util.reverse_joaat(vhash) == 'taxi' then
                while not HUD.DOES_BLIP_EXIST(HUD.GET_CLOSEST_BLIP_INFO_ID(280)) do
                    PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 29, 1)
                    util.yield(1000)
                    return
                end
     
        end

        local taxi_blip = HUD.GET_CLOSEST_BLIP_INFO_ID(280)
        local taxi_ent = HUD.GET_BLIP_INFO_ID_ENTITY_INDEX(taxi_blip)
        local taxi = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(taxi_ent, 0, 6, 0)
        if HUD.DOES_BLIP_EXIST(HUD.GET_CLOSEST_BLIP_INFO_ID(280)) then
            if taxi.x ~= 0 and taxi.y ~= 0 and taxi.z ~= 0 then
                util.yield(500)
                PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), taxi.x, taxi.y, taxi.z, false, false, false, false)
                util.yield(1000)
                PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 86, 1)
                while HUD.DOES_BLIP_EXIST(HUD.GET_CLOSEST_BLIP_INFO_ID(280)) do
                    util.yield()
                end
                util.yield(500)
                menu.trigger_commands('tpobjective')
                
            else
                if set.alert then
                util.toast('No Person Found')
                end
            end
            else
                util.yield()
        end




    end, function ()
        SEC(players.user_ped(), curcoords.x, curcoords.y, curcoords.z, false, true, true, false)
            util.toast('Not in a taxi turning off auto teleport')
            curcoords = {}
    end)

menu.action(onlineroot, T('Snowball Fight'), {}, T('Gives everyone in the lobby Snowballs and notifies them via text'), function ()
    local plist = players.list()
    local snowballs = util.joaat('WEAPON_SNOWBALL')
    for i = 1, #plist do
        local plyr = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(plist[i])
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(plyr, snowballs, 20, true)
        WEAPON.SET_PED_AMMO(plyr, snowballs, 20)
        players.send_sms(plist[i], players.user(), Str_trans('Snowball Fight! You now have snowballs'))
        util.yield()
    end
   
end)


menu.action(onlineroot, T('Murica'), {}, T('Gives everyone in the lobby Firework Launchers and notifies them via text'), function ()
    local plist = players.list()
    local fireworks = util.joaat('weapon_firework')
    for i = 1, #plist do
        local plyr = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(plist[i])
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(plyr, fireworks, 20, true)
        WEAPON.SET_PED_AMMO(plyr, fireworks, 20)
        players.send_sms(plist[i], players.user(), Str_trans('Murica f*** ya! You now have Fireworks'))
        util.yield()
    end
   
end)



menu.toggle_loop(onlineroot, T('Nightclub Popularity'), {'ncmax'}, T('Keeps the Nightclub Popularity at max'), function ()
    if util.is_session_started() then
        local ncpop = math.floor(STAT_GET_INT('CLUB_POPULARITY') / 10)
        if ncpop < 100 then
            menu.trigger_commands('clubpopularity 100')
            util.yield(250)
        end
    end

end)


menu.toggle_loop(onlineroot, T('Increase Kosatka Missile Range'), {'krange'}, T('You can use it anywhere in the map now'), function ()
    if util.is_session_started() then
    memory.write_float(memory.script_global(262145 + 30176), 200000.0)
    end
end)

menu.toggle_loop(onlineroot, T('See who is using Voice chat'), {'seevoicec'}, T('Lets you see who is using Voice chat with a notification'), function ()
    for _, pid in pairs(players.list()) do
        if NETWORK.NETWORK_IS_PLAYER_TALKING(pid) then
            ACutil(players.get_name(pid)..Str_trans(' is using voice chat'))
        end
    end
end)
  

-------------------------------Player Options-----------------------------------------------

players.on_join(function(pid)

    menu.divider(menu.player_root(pid), T('AcjokerScript'))
    local frienm = menu.list(menu.player_root(pid), T('Friendly'), {}, '')
    local pvehmenu = menu.list(frienm, T('Vehicles'), {}, T('If you are too far away from them it will spectate them to complete task'))
    local plamenu = menu.list(frienm, T('Player Menu'), {}, '')

    local firw = {speed = 1000}
    menu.toggle_loop(frienm, T('Fireworks Show'), {'firew'}, T('Start a fireworks show at the players location'), function ()
          local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
          local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
          local weap = util.joaat('weapon_firework')
          WEAPON.REQUEST_WEAPON_ASSET(weap)
          for y = 0, 1 do
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x, tar1.y, tar1.z + 4.0, tar1.x - math.random(-100, 100), tar1.y - math.random(-100, 100), tar1.z + math.random(10, 15), 200, 0, weap, 0, false, false, firw.speed)
            MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x, tar1.y, tar1.z + 4.0, tar1.x + math.random(-100, 100), tar1.y + math.random(-100, 100), tar1.z + math.random(10, 15), 200, 0, weap, 0, false, false, firw.speed)
            FIRE.ADD_EXPLOSION(tar1.x + math.random(-100, 100), tar1.y + math.random(-100, 100), tar1.z + math.random(50, 75), 38, 1, false, false, 0, false)
            FIRE.ADD_EXPLOSION(tar1.x - math.random(-100, 100), tar1.y - math.random(-100, 100), tar1.z + math.random(50, 75), 38, 1, false, false, 0, false) 
        end


          if not players.exists(pid) then
              util.stop_thread()
          end
      end)

menu.toggle_loop(frienm, T('Fake Money Rain'), {}, T('Rains Fake Money on the Player'), function ()
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
    Streamptfx('core')
    GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD( 'ent_brk_banknotes', tar1.x, tar1.y, tar1.z + 1, 0, 0, 0, 3.0, true, true, true)
    if not players.exists(pid) then
        util.stop_thread()
    end
end)

    menu.action(plamenu, T('Max Protect Player'), {'max'}, T('Turns on Auto Heal, All Weapons, and Never wanted commands all at once'), function ()
        menu.trigger_commands("bail".. players.get_name(pid))
        menu.trigger_commands("autoheal".. players.get_name(pid))
        menu.trigger_commands("arm".. players.get_name(pid))
        menu.trigger_commands("givevehgodmode".. players.get_name(pid))
    end, nil, nil, COMMANDPERM_FRIENDLY)

    menu.action(plamenu, T('TP Player to Waypoint'), {'tele'}, T('Teleports Player to the waypoint the player sets on their map(stand users must be in a vehicle) can be used by others and will reset your waypoint if one is set'), function ()
       local x, y, z, b = players.get_waypoint(pid)
       local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
       if HUD.IS_WAYPOINT_ACTIVE() then
        local curway = HUD.GET_BLIP_INFO_ID_COORD(HUD.GET_FIRST_BLIP_INFO_ID(8))
        HUD.SET_WAYPOINT_OFF()
        HUD.SET_NEW_WAYPOINT(x, y)
        menu.trigger_commands("WPTP".. players.get_name(pid))
        if PED.IS_PED_IN_ANY_VEHICLE(targets) then
            local car = PED.GET_VEHICLE_PED_IS_IN(targets)
            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(car)
            VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(car, 5.0)
        end
        
        util.yield(1500)
        HUD.SET_NEW_WAYPOINT(curway.x, curway.y)
        else
            HUD.SET_NEW_WAYPOINT(x, y)
            menu.trigger_commands("WPTP".. players.get_name(pid))
            if PED.IS_PED_IN_ANY_VEHICLE(targets) then
                local car = PED.GET_VEHICLE_PED_IS_IN(targets)
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(car)
                VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(car, 5.0)
            end
            HUD.SET_WAYPOINT_OFF()
       end

    end, nil, nil, COMMANDPERM_FRIENDLY)






    local winmenu = menu.list(pvehmenu, T('Windows Menu'), {}, T('Works better/faster if you are near them'))

    menu.action(winmenu, T('Roll Up All Windows'), {'rolluwin'}, T('Rolls up all windows at once'), function ()
        GetPlayVeh(pid, function ()
            Rollaup(pid)
        end)
    end, nil, nil, COMMANDPERM_FRIENDLY)

    menu.action(winmenu, T('Roll Down All Windows'), {'rolldwin'}, T('Rolls up all windows at once'), function ()
        GetPlayVeh(pid, function ()
            Rolladown(pid)
        end)
    end, nil, nil, COMMANDPERM_FRIENDLY)

    menu.list_action(winmenu, T('Roll Up Individual Windows'), {''}, T('Roll Up Individual Windows'), Windows,
    function(index)
        local win = index - 1
        GetPlayVeh(pid, function ()
            Rolluindivid(pid, win)
        end)
    end)

    menu.list_action(winmenu, T('Roll Down Individual Windows'), {''}, T('Roll Down Individual Windows'), Windows,
    function(index)
        local win = index - 1
        GetPlayVeh(pid, function ()
            Rolldindivid(pid, win)
        end)
    end)


    



    local lscm = menu.list(pvehmenu, T('Los Santos Customs'), {}, T('Works better/faster if you are near them'))

  local bodym = menu.list(lscm, T('Body Modifications'), {}, T('Only shows what is available to be changed. If they get in a new vehicle back out of Body Modifications to refresh options'))

  local lighm = menu.list(lscm, T('Lights'), {}, '')

    local colm  = menu.list(lscm, T('Vehicle Colors'), {}, '')

    local wmenu = menu.list(lscm, T('Wheels'), {}, '')



      local vehmenus = {}


        menu.on_focus(bodym, function ()
            for _, m in ipairs(vehmenus) do
                menu.delete(m)
            end
            vehmenus = {}
            if not players.exists(pid) then
                util.stop_thread()
            end
            GetPlayVeh(pid, function ()
            local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
            if PED.IS_PED_IN_ANY_VEHICLE(pedm, false) then    
               
                for _, v in pairs(Vehopts) do
                    local current = VEHICLE.GET_VEHICLE_MOD(vmod, v[1] -1)
                    local maxmods = Getmodcou(pid, v[1] - 1)
                    if maxmods > 0  then
                        local modnames = v[2]
                        local s = menu.slider(bodym, modnames , {''}, '',  -1, maxmods  , current, 1, function (mod)
                            GetPlayVeh(pid, function ()
                            Changemod(pid, v[1] -1, mod)
                            end)
                        end)
              
                     
                      table.insert(vehmenus, s)
                    util.yield()
                    end
                end

                  for i, v in pairs(Vehtogs) do
                    local current = VEHICLE.IS_TOGGLE_MOD_ON(vmod, v[1] -1)
                    local tognames = v[2]
                    local t = menu.toggle(bodym, tognames, {''}, '', function (on)
                        VEHICLE.TOGGLE_VEHICLE_MOD(vmod, v[1] - 1, on)
                      end, current)         
                    table.insert(vehmenus, t)
                  util.yield()
                end

                
                 end
                end)

        end)
           

    local color = {}

    local oprgb = {color= {r= 0, g = 0, b = 1, a = 1}}
        menu.colour(colm, T('Primary Color RGB'), {''}, T('Changes the Primary Color on their Vehicle to RGB'), oprgb.color, false, function(oprbgc)
            oprgb.color = oprbgc
end)

local opsrgb = {color= {r= 0, g = 1, b = 0, a = 1}}
        menu.colour(colm, T('Secondary Color RGB'), {''}, T('Changes the Secondary Color on their Vehicle to RGB'), opsrgb.color, false, function(prbgsc)
            opsrgb.color = prbgsc
end)
    menu.action(colm, T('Apply Paint Selection'), {}, T('Paints their vehicle the color you have selected above'), function ()
        RGBpaintplayer(pid, oprgb, opsrgb)
    end)


    menu.list_select(colm, T('Primary Color'), {''}, T('Changes the Primary Color on the Vehicle'), Mainc, 1, 
    function (t)
        color.prim = t - 1
        GetPlayVeh(pid, function ()
            Changecolor(pid, color)
        end)
    end)

    menu.list_select(colm, T('Secondary Color'), {''}, T('Changes the Secondary Color on the Vehicle'), Mainc, 1, 
    function (t)
        color.sec = t - 1
        GetPlayVeh(pid, function ()
            Changecolor(pid, color)
        end)
    end)

    menu.list_select(colm, T('Pearlescent Color'), {''}, T('Changes the Pearlescent Color on the Vehicle'), Mainc, 1, 
    function (t)
        color.per = t - 1
        GetPlayVeh(pid, function ()
            Changewhepercolor(pid, color)
        end)
    end)
   
    menu.list_select(colm, T('Wheel Color'), {''}, T('Changes the Wheel Color on the Vehicle'), Mainc, 1, 
    function (t)
        color.whe = t - 1
        GetPlayVeh(pid, function ()
            Changewhepercolor(pid, color)
        end)
    end)

    menu.list_select(colm, T('Interior Color'), {''}, T('Changes the Interior Color on the Vehicle'), Mainc, 1, 
    function (t)
        color.int = t - 1
        GetPlayVeh(pid, function ()
            Changeintcolor(pid, color.int)
        end)
    end)

    menu.list_select(colm, T('Dashboard Color'), {''}, T('Changes the Dashboard Color on the Vehicle'), Mainc, 1, 
    function (t)
        color.das = t - 1
        GetPlayVeh(pid, function ()
            Changedashcolor(pid, color.das)
        end)
    end)

    
    menu.list_select(lighm, T('Neons'), {''}, T('Changes the Neons to different colors'), Mainc, 1, 
    function(c)
        local ncolor = c - 1
        GetPlayVeh(pid, function ()
            Changeneon(pid, ncolor)
        end)
    end)


    menu.list_select(lscm, T('Window Tints'), {''}, T('Changes the Tint on the Vehicle'), Til, 1, 
    function (t)
        local tint = t - 1
        GetPlayVeh(pid, function ()
            Changetint(pid, tint)
        end)
        
    end)



    
    menu.list_select(lighm, T('Headlights'), {''}, T('Changes the Headlights to different colors'), Lighc, 1, 

    function(c)
        local hcolor = c - 1

        GetPlayVeh(pid, function ()
            Changehead(pid, hcolor)
        end)
    end)


    
local nrgb = {color= {r= 0, g = 1, b = 0, a = 1}}

    menu.action(lighm, T('Change RGB Neons'), {}, T('Change the Color for the Neons to RGB of your choice'), function ()

        GetPlayVeh(pid, function ()
            local pedm = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
            local vmod = PED.GET_VEHICLE_PED_IS_IN(pedm, false)
            GetControl(vmod, spec, pid)
            RGBNeonKit(pedm)
            local red = math.floor(nrgb.color.r * 255)
            local green = math.floor(nrgb.color.g * 255)
            local blue = math.floor(nrgb.color.b * 255)
            VEHICLE.SET_VEHICLE_NEON_COLOUR(vmod, red, green, blue)
            if not spec then
                Specoff(pid)
            end
        end)
    end)


    menu.colour(lighm, T('RGB Neon Color'), {'rgbsc'}, T('Choose the Color for the Neons be changed to '), nrgb.color, false, function(ncolor)
        nrgb.color = ncolor
    end)




    menu.list_select(wmenu, T('Bennys Bespoke'), {''}, T('Changes the wheels to Bennys Bespoke wheels'), Bbw, 1, 
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid, function ()
            Changewheel(pid, 9, wheel)
        end)
        
    end)


    menu.list_select(wmenu, T('Bennys Originals'), {''}, T('Changes the wheels to Bennys Originals wheels'), Bow, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid, function ()
            Changewheel(pid, 8, wheel)
        end)
        
    end)


    menu.list_select(wmenu, T('Bike'), {''}, T('Changes the wheels to Bike(motorcycle) wheels'), Bw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid, function ()
            Changewheel(pid, 6, wheel)
        end)
        
    end)


    menu.list_select(wmenu, T('High End'), {''}, T('Changes the wheels to High End wheels'), Hew, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid,  function ()
            Changewheel(pid, 7, wheel)

        end)
        
    end)


    menu.list_select(wmenu, T('Lowrider'), {''}, T('Changes the wheels to Lowrider wheels'), Lw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid, function ()
            Changewheel(pid, 2, wheel)
        end)
        
    end)

    menu.list_select(wmenu, T('Muscle'), {''}, T('Changes the wheels to Muscle wheels'), Mw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid, function ()
            Changewheel(pid, 1, wheel)

        end)
        
    end)


    menu.list_select(wmenu, T('Offroad'), {''}, T('Changes the wheels to Offroad wheels'), Orw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid, function ()
            Changewheel(pid, 4, wheel)

        end)
        
    end)


    menu.list_select(wmenu, T('Racing(Formula 1 Wheels)'), {''}, T('Changes the wheels to Racing(Formula 1 Wheels) wheels'), Rw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid,  function ()
            Changewheel(pid, 10, wheel)

        end)
        
    end)


    menu.list_select(wmenu, T('Sport'), {''}, T('Changes the wheels to Sport wheels'), Spw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid,  function ()
            Changewheel(pid, 0, wheel)

        end)
        
    end)
    

    menu.list_select(wmenu, T('Street'), {''}, T('Changes the wheels to Street wheels'), Stw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid, function ()
            Changewheel(pid, 11, wheel)

        end)
        
    end)


    menu.list_select(wmenu, T('SUV'), {''}, T('Changes the wheels to SUV wheels'), Suw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid,  function ()
            Changewheel(pid, 3, wheel)
        end)
      
        
    end)

    menu.list_select(wmenu, T('Tracks'), {''}, T('Changes the wheels to Track wheels'), Trw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid,  function ()
            Changewheel(pid, 12, wheel)
        end)

    end)


    menu.list_select(wmenu, T('Tuner'), {''}, T('Changes the wheels to Tuner wheels'), Tuw, 1,
    function(w)
        local wheel = w - 1
        GetPlayVeh(pid, function ()
            Changewheel(pid, 5, wheel)
        end)
    end)

    menu.click_slider(pvehmenu, T('Change Vehicle Speed'), {'vspeed'}, T('Increases the Vehicles top speed'), 0, 100000, 40, 10, function (s)
        local  speed = s
         GetPlayVeh(pid, function ()
            Topspeedveh( speed, pid)
            util.yield(1000)
         end)
     end)



    menu.action(pvehmenu, T('Max out their Vehicle'), {'maxv'}, T('Max out their Vehicle with an increased top speed (will put random wheels on the Vehicle each time you press it)'), function ()
        GetPlayVeh(pid,  function ()
            Maxoutcar(pid)
        end)
     end, nil, nil, COMMANDPERM_FRIENDLY)


    menu.text_input(pvehmenu, T('Change their license plate'), {'lplate'}, T('Change the license plate to a custom text'), function (cusplate)
        GetPlayVeh(pid,  function ()
           Platechange(cusplate, pid)
        end)
    end)


    menu.action(pvehmenu, T('Repair Vehicle'), {'repv'}, T('Repair their vehicle'), function ()
        GetPlayVeh(pid,  function ()
            Fixveh(pid)
        end)
     end, nil, nil, COMMANDPERM_FRIENDLY)

     
     menu.click_slider(pvehmenu, T('Accelerate Vehicle'), {'accel'}, T('Accelerate Vehicle Forward by your set amount (actual speed is roughly double the number in MPH)'), 10, 150, 40, 10, function (s)
       local  speed = s
        GetPlayVeh(pid, function ()
           Accelveh( speed, pid)
           util.yield(1000)
        end)
    end)

    menu.toggle_loop(pvehmenu, T('Slow Vehicle Down'), {'slowv'}, T('Does not freeze them just slows down the vehicles velocity'), function ()
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        Specon(pid)
        GetPlayVeh(pid, function ()
            Stopveh(pid)
        end)
        return spec
    end, function ()
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        if not spec then
            Specoff(pid)
        end
    end)

    local cvmenu = menu.list(pvehmenu, T('Give Them a Vehicle'), {}, '')

    local cus = {veh = util.joaat('toreador')}
    menu.action(cvmenu, T('Spawn Vehicle'), {'spv'}, T('Spawn them a custom vehicle the default is toreador'), function ()
        local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
        Vspawn(cus.veh, tar1, targets, 'custveh')
    end, nil, nil, COMMANDPERM_FRIENDLY)

    menu.text_input(cvmenu, T('Enter Custom Vehicle Hash'), {'cussmash'}, T('Enter Vehicle Hash to change Vehicle given to player'), function(cusveh)
        if not players.exists(pid) then
            util.stop_thread()
        end
        if STREAMING.IS_MODEL_A_VEHICLE(util.joaat(cusveh)) then
           cus.veh = util.joaat(cusveh)
        else
           if set.alert then
            util.toast('Improper Vehicle Name (check the spelling)')
           end
        end
    end, 'toreador')

    menu.action(pvehmenu, T('Randomize Paint'), {'rpaint'}, T('Randomize the Paint of their vehicle'), function ()
        GetPlayVeh(pid, function ()
            Rpaint(pid)
        end)
    end, nil, nil, COMMANDPERM_FRIENDLY)

    menu.action(pvehmenu, T('Spectate Player'), {''}, T('Turn on/off spectating of player'), function ()
        menu.trigger_commands("spectate".. players.get_name(pid))
    end)



    
    local trollm = menu.list(menu.player_root(pid), T('Trolling'), {}, '' )
    menu.action(trollm, T('Add or Remove from Kill List'), {''}, T('Add or Remove Player to the Kill List'), function ()
        local pname = PLAYER.GET_PLAYER_NAME(pid)
        for _, name in ipairs(load_kill_list()) do
            if name.name == pname  then
                remove_victim(pname)
                if set.alert then
                    ACutil(pname..Str_trans(' Removed from Kill List'))
                end
                return
            end
        end
        add_victim(pname)
        if set.alert then
            ACutil(pname..Str_trans(' Added to Kill List'))
        end
    end)
    local atkmenu = menu.list(trollm, T('Attackers'), {}, '')
    local vatkmenu = menu.list(trollm, T('Vehicle Attackers'), {}, '')
    local pcagem = menu.list(trollm, T('Cages'), {}, '')
    local cplaym = menu.list(trollm, T('Vehicular Assault'), {}, '')
    local jplaym = menu.list(trollm, T('Juggle Player'), {}, '')
    local mrplaym = menu.list(trollm, T('Make it Rain'), {}, '')
    local eplaym = menu.list(trollm, T('Explode Player'), {}, '')
    local metmenu = menu.list(trollm, T('Big Object Shower'), {}, '')
    local ptfxmenu = menu.list(trollm, T('PTFX Spam'), {}, '')

    


    local mir = {weap = 'WEAPON_SNOWBALL', speed = 1000}
    menu.action(trollm, T('The Full Monty'), {}, T('Activate ped cage, object cage, explode loop, PTFX Spam, Make it Rain Rockets, Juggle Player, and Vehicular Assualt at the same time'), function ()
        menu.trigger_commands("EXPL".. players.get_name(pid))
        menu.trigger_commands("PCAGE".. players.get_name(pid))
        menu.trigger_commands("ObjCage".. players.get_name(pid))
        menu.trigger_commands("ptfxloop".. players.get_name(pid))
        mir.weap = 'WEAPON_RPG'
        menu.trigger_commands("rain".. players.get_name(pid))
        menu.trigger_commands("SmashPla".. players.get_name(pid))
        menu.set_value(menus.assaultrate, 100)
        menu.trigger_commands("JuggleC".. players.get_name(pid))
        menu.set_value(menus.jugglerate, 100)
        set.alert = false
    end)

 
  local mirloop =  menu.toggle_loop(mrplaym, T('Make it Rain'), {'rain'}, T('Make it Rain your choice of weapon in all directions'), function ()
        local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
        local weap = util.joaat(mir.weap)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        Delcar(targets, spec, pid)
        WEAPON.REQUEST_WEAPON_ASSET(weap)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x, tar1.y, tar1.z, tar1.x , tar1.y, tar1.z - 2.0, 200, 0, weap, 0, true, false, mir.speed)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x, tar1.y, tar1.z + 1.0, tar1.x , tar1.y, tar1.z, 200, 0, weap, 0, true, false, mir.speed)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x, tar1.y + 1.0, tar1.z, tar1.x , tar1.y, tar1.z, 200, 0, weap, 0, true, false, mir.speed)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x + 1.0, tar1.y , tar1.z, tar1.x , tar1.y, tar1.z, 200, 0, weap, 0, true, false, mir.speed)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x + 1.0, tar1.y + 1.0, tar1.z, tar1.x , tar1.y, tar1.z, 200, 0, weap, 0, true, false, mir.speed)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x - 1.0, tar1.y, tar1.z, tar1.x , tar1.y, tar1.z, 200, 0, weap, 0, true, false, mir.speed)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x, tar1.y - 1.0, tar1.z, tar1.x , tar1.y, tar1.z, 200, 0, weap, 0, true, false, mir.speed)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(tar1.x - 1.0, tar1.y - 1.0, tar1.z, tar1.x , tar1.y, tar1.z, 200, 0, weap, 0, true, false, mir.speed)
    
        if not players.exists(pid) then
            if set.alert then
                util.toast('You made them rage quit')
            end
            util.stop_thread()
        end
    end)
    
    menu.list_select(mrplaym, T('Weapon Choices'), {''}, T('Changes the weapon that rains down on them'), Weaplist, 1, function(weapsel)
        mir.weap = Weap[weapsel]
    end)

   local weaspeed = menu.slider(mrplaym, T('Weapon Speed'), {''}, T('Adjust the speed of the Weapons'), 100, 6000, 1000, 100, function (s)
        mir.speed = s
    end)
        
    menu.action(trollm, T('Katy Perry'), {}, T('Turn them into a Firework by hitting them up in the air with Juggle and activating Make it Rain Fireworks'), function ()
        menu.set_value(weaspeed, 100)
        mir.weap = 'weapon_firework'
        menu.trigger_commands("rain".. players.get_name(pid))
        menu.trigger_commands("JuggleC".. players.get_name(pid))
    end)

    menu.action(trollm, T('Stop the Madness'), {}, T('Turn off The Full Monty and Katy Perry and stop them from being targeted'), function ()
        menu.trigger_commands("FreePedcage".. players.get_name(pid))
        menu.trigger_commands("FreeObjcage".. players.get_name(pid))
        menu.trigger_commands("EXPL".. players.get_name(pid)..' off')
        menu.trigger_commands("rain".. players.get_name(pid)..' off')
        mir.weap = 'WEAPON_SNOWBALL'
        menu.trigger_commands("JuggleC".. players.get_name(pid)..' off')
        menu.trigger_commands("ptfxloop".. players.get_name(pid)..' off')
        menu.trigger_commands("SmashPla".. players.get_name(pid)..' off')
        menu.set_value(menus.assaultrate, 1000)
        menu.set_value(menus.jugglerate, 1000)
        set.alert = true
    end)


    menu.toggle_loop(trollm , T('Delete Players Vehicle'), {'delv'}, T('Delete the Players Vehicle and every vehicle around them you must be spectacting'), function ()
        local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        Specon(pid)
        local surcars = {}
        local hndl = entities.get_all_vehicles_as_handles()
        for index, value in ipairs(hndl) do
            for i = 1, 5 do
               table.insert(surcars, value)
               DelEnt(surcars)
            end
        end

        if PED.IS_PED_IN_ANY_VEHICLE(targets, true) then
            while PED.IS_PED_IN_ANY_VEHICLE(targets, true) do
                local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
                Delcar(targets, spec, pid)
                util.yield(100)
            end
            if not players.exists(pid) then
                util.stop_thread()
            end
        else
            util.yield(100)
        end
    end, function ()
                Specoff(pid)
    end)






local bigolist = {} 
local bigobjset  = {obj= util.joaat('prop_asteroid_01'), ptfx = false, exp = false, speed = 1000}
menu.toggle_loop(metmenu, T('Big Object Shower'), {'Oshower'}, T('Make Objects rain down from the sky'), function ()
    
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local oha = bigobjset.obj --credits to lance#8011 for this function
    local r1 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS( targets, math.random(-500, 500), math.random(-500, 500), 300.0)
    local r2 = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS( targets, math.random(-500, 500), math.random(-500, 500), 0)
    local diff = {}
    diff.x = (r2.x - r1.x)*500
    diff.y = (r2.y - r1.y)*500
    diff.z = (r2.z - r1.z)*500
    Streament(oha)
    local bigobj = OBJECT.CREATE_OBJECT(oha, r1.x, r1.y, r1.z, true, true, true)
    ENTITY.SET_ENTITY_HAS_GRAVITY(bigobj, true)
    ENTITY.APPLY_FORCE_TO_ENTITY(bigobj, 2, diff.x, diff.y, diff.z, 0, 0, 0, 0, true, false, true, false, true)
    OBJECT.SET_OBJECT_PHYSICS_PARAMS(bigobj, 100000, 5, 1, 0, 0, .5, 0, 0, 0, 0, 0)
    util.yield(100)

    bigolist[#bigolist + 1] = bigobj
    for _, met in ipairs(bigolist) do
        local mcoor = ENTITY.GET_ENTITY_COORDS(met)
    if ENTITY.GET_ENTITY_HEIGHT_ABOVE_GROUND(bigolist) < 0.5 then
        Streamptfx("scr_xm_orbital")
        if bigobjset.exp then
            FIRE.ADD_EXPLOSION(mcoor.x, mcoor.y, mcoor.z, 8, 100, true, bigobjset.ptfx, 1, false)
            FIRE.ADD_EXPLOSION(mcoor.x, mcoor.y, mcoor.z, 59, 100, true, bigobjset.ptfx, 1, false)
            GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD('scr_xm_orbital_blast', mcoor.x, mcoor.y, mcoor.z + 10, 0, 180, 0, 10.0, true, true, true)
        end
    end
end
if #bigolist > 175 then
    DelEnt(bigolist)
    bigolist= {}
end
    util.yield(bigobjset.speed)
    if not players.exists(pid) then
        util.stop_thread()
    end

end)

menu.toggle(metmenu, T('Orbital Cannon Explosions'), {''}, T('Turn on Orbital Cannon Explosions'), function (on)
    bigobjset.exp = on
end)

menu.slider(metmenu, T('Object Speed'), {''}, T('Adjust the rate objects spawn'), 0, 3000, 1000, 100, function (s)
    bigobjset.speed = s
end)

menu.list_action(metmenu, T('Object List'), {''}, T('Changes Objects used for Big Object Shower'), Bigobjlist, function(objsel)
    bigobjset.obj = util.joaat(Bigobj[objsel])
end)




local ptfx = {lib = 'scr_rcbarry2', sel = 'scr_clown_appears'}
menu.toggle_loop(ptfxmenu, T('PTFX Spam'), {'ptfxloop'}, T('Spam your selection of Particle Effects'), function ()
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
    Streamptfx(ptfx.lib)
    GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD( ptfx.sel, tar1.x, tar1.y, tar1.z + 1, 0, 0, 0, 10.0, true, true, true)
end)

menu.list_action(ptfxmenu, T('Ptfx List'), {''}, T('Choose a PTFX from the list'), Fxcorelist, function(fxsel)
    ptfx.sel = Fxha[fxsel]
    ptfx.lib = 'core'
end)





 -------------------------------------
    local exset = {exsel = 0, scale = 1000, isaud = true, invis = false, shake = 0, damage = false, delay = 1}
   local exloop = menu.toggle_loop(eplaym, T('Explode Player Loop'), {'EXPL'}, T('Explode Player in a continous loop'), function ()
        local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)

        for i = -1.5, 1.5, 0.5 do
            FIRE.ADD_EXPLOSION(tar1.x, tar1.y, tar1.z + i, exset.exsel, exset.scale, exset.isaud, exset.invis, exset.shake, exset.damage)
        end
        util.yield(exset.delay)

        if not players.exists(pid) then
            if set.alert then
                util.toast('You made them rage quit')
            end
            util.stop_thread()
        end
    end)

   
    menu.list_select(eplaym, T('Change Explosion Type'), {''}, T('Changes Explosion used for exploding the player'), Exlist, 1,
    function(index)
        exset.exsel = index - 1
    end)

    menu.slider(eplaym, T('Explosion Damage Scale'), {''}, T('Adjust the Damage Scale of the Explosions'), 100, 6000, 1000, 100, function (s)
        exset.scale = s
     end)

     menu.toggle(eplaym, T('Invisible Explosions'), {''}, T('Change the Explosions to invisible'), function (on)
        exset.invis = on
    end)

    menu.toggle(eplaym, T('Inaudible Explosions'), {''}, T('Change the Explosions so that you can no longer hear them'), function (on)
        exset.isaud = not on
    end)

    menu.slider(eplaym, T('Explosion Shake'), {''}, T('Adjust the Camera Shake caused by the Explosions'), 0, 100, 0, 10, function (sh)
        exset.shake = sh
     end)

     menu.toggle(eplaym, T('Damage Off'), {''}, T('Change the Explosions to not cause Damage'), function (on)
        exset.damage = on
    end)

    menu.slider(eplaym, T('Explosion Delay'), {''}, T('Adjust the Delay in between Explosions'), 0, 1000, 100, 10, function (de)
        exset.delay = de
     end)

  -------------------------------------------------






    local vehaset = {invis_aveh = false, vehasel = util.joaat('speedo2') , vehra = 1000}
   local vehaloop =  menu.toggle_loop(cplaym, T('Vehicular Assault'), {'SmashPla'}, T('Will Smash or Run the Player over every time they try and stand up'), function ()
        local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
        local pname = PLAYER.GET_PLAYER_NAME(pid)
        local UV = ENTITY.GET_ENTITY_UPRIGHT_VALUE(targets)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        Delcar(targets, spec, pid)
        Streament(vehaset.vehasel)

        if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) then
            SmashCar(vehaset.vehasel, tar1, vehaset.invis_aveh, vehaset.vehra)
            if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) ==false then
                if set.alert then
                    ACutil(pname.. Str_trans(' has been smashed'))
                end
            elseif ENTITY.IS_ENTITY_UPRIGHT(targets, UV) then
            RamCar(vehaset.vehasel, tar1.x + 15, tar1.y, tar1.z, vehaset.invis_aveh, targets, vehaset.vehra)
                if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) ==false then
                    if set.alert then
                        ACutil(pname.. Str_trans(' has been run over'))
                    end
            elseif ENTITY.IS_ENTITY_UPRIGHT(targets, UV) then
            RamCar(vehaset.vehasel, tar1.x - 15, tar1.y, tar1.z, vehaset.invis_aveh, targets, vehaset.vehra)
                if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) ==false then
                    if set.alert then
                        ACutil(pname.. Str_trans(' has been run over'))
                    end
            elseif ENTITY.IS_ENTITY_UPRIGHT(targets, UV) then
            RamCar(vehaset.vehasel, tar1.x, tar1.y + 15, tar1.z, vehaset.invis_aveh, targets, vehaset.vehra)
                if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) ==false then
                    if set.alert then
                        ACutil(pname.. Str_trans(' has been run over'))
                    end
            elseif ENTITY.IS_ENTITY_UPRIGHT(targets, UV) then
            RamCar(vehaset.vehasel, tar1.x, tar1.y - 15, tar1.z, vehaset.invis_aveh, targets, vehaset.vehra)
                if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) ==false then
                    if set.alert then
                        ACutil(pname.. Str_trans(' has been run over'))
                    end
            elseif ENTITY.IS_ENTITY_UPRIGHT(targets, UV) then
            RamCar(vehaset.vehasel, tar1.x - 15, tar1.y - 15, tar1.z, vehaset.invis_aveh, targets, vehaset.vehra)
                if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) ==false then
                    if set.alert then
                        ACutil(pname.. Str_trans(' has been run over'))
                    end
            elseif ENTITY.IS_ENTITY_UPRIGHT(targets, UV) then
            RamCar(vehaset.vehasel, tar1.x + 15, tar1.y + 15, tar1.z, vehaset.invis_aveh, targets, vehaset.vehra)
                if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) ==false then
                    if set.alert then
                        ACutil(pname.. Str_trans(' has been run over'))
                    end
            elseif ENTITY.IS_ENTITY_UPRIGHT(targets, UV) then
            RamCar(vehaset.vehasel, tar1.x + 15, tar1.y - 15, tar1.z, vehaset.invis_aveh, targets, vehaset.vehra)
                if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) ==false then
                    if set.alert then
                        ACutil(pname.. Str_trans(' has been run over'))
                    end
            elseif ENTITY.IS_ENTITY_UPRIGHT(targets, UV) then
            RamCar(vehaset.vehasel, tar1.x - 15, tar1.y + 15, tar1.z, vehaset.invis_aveh, targets, vehaset.vehra)
                if ENTITY.IS_ENTITY_UPRIGHT(targets, UV) ==false then
                    if set.alert then
                        ACutil(pname.. Str_trans(' has been run over'))
                    end


            else
                if set.alert then
                    ACutil(Str_trans('Could not reach ') ..pname)
                end

            end
            end
            end
            end
            end
            end
            end
            end
            end
        end

        if not players.exists(pid) then

            if set.alert then
                util.toast('You made them rage quit')
            end
            util.stop_thread()

            
        end
    end)

    menu.set_value(vehaloop, nil)

    menu.toggle(cplaym, T('Invisible Vehicles'), {}, T('Change the assault vehicles to invisible'), function (on)
        vehaset.invis_aveh = on
    end)
    local cclist = menu.list(cplaym, T('Change Vehicle used for Vehicular Assault'), {}, '')
    menu.list_action(cclist, T('Vehicle List'), {''}, T('Changes Vehicles used for Vehicular Assault'), Vehlist, function(vehsel)
        vehaset.vehasel = util.joaat(Vehha[vehsel])
    end)

    menus.assaultrate =  menu.slider(cplaym, T('Assault Rate'), {'assaultrate'}, T('Adjust rate at which vehicles attack'), 100, 4000, 1000, 100, function (ar)
        vehaset.vehra = ar
   
     end)


     menu.text_input(cclist, T('Enter Custom Vehicle Hash'), {'cussmash'}, T('Enter Vehicle Hash to change Vehicular Assault Vehicle'), function(cussma)
        if not players.exists(pid) then
            util.stop_thread()
        end
         if STREAMING.IS_MODEL_A_VEHICLE(util.joaat(cussma)) then
            vehaset.vehasel = util.joaat(cussma)
         else
            if set.alert then
                util.toast('Improper Vehicle Name (check the spelling)')
            end
         end

  end, 'toreador')

  local juglset = {invisjugc = false, jugsel = util.joaat('speedo2') , jugr = 1000}


  local jugloop = menu.toggle_loop(jplaym, T('Juggle Player with Vehicles'), {'JuggleC'}, T('Juggles Player by hitting them upwards repeatedly'), function ()
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
    local pname = PLAYER.GET_PLAYER_NAME(pid)

    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    Delcar(targets, spec, pid)
        Streament(juglset.jugsel)

    if not PED.IS_PED_RAGDOLL(targets) then
        JuggleCar(juglset.jugsel, tar1, juglset.invisjugc, juglset.jugr)
        else
            if set.alert then
                ACutil(pname..Str_trans(' is being juggled'))
            end
    end

    if not players.exists(pid) then
        if set.alert then
            ACutil(Str_trans('You made them rage quit'))
        end
        util.stop_thread()
    end

  end)

  menu.set_value(jugloop, nil)

   menu.toggle(jplaym, T('Invisible Vehicles'), {}, T('Change the Juggle vehicles to invisible'), function (on)
    juglset.invisjugc = on
end)

local jclist = menu.list(jplaym, T('Change Vehicle used for Juggling'), {}, '')
menu.list_action(jclist, T('Vehicle List'), {''}, T('Changes Vehicles used for Juggling'), Vehlist, function(jugsel)
    juglset.jugsel = util.joaat(Vehha[jugsel])
end)

menus.jugglerate = menu.slider(jplaym, T('Juggle Rate'), {'jugglerate'}, T('Adjust rate at which vehicles shoot upwards'), 100, 4000, 1000, 100, function (jr)
    juglset.jugr = jr
 end)

 menu.text_input(jclist, T('Enter Custom Vehicle Hash'), {'cusjug'}, T('Enter Vehicle Hash to change Juggle Vehicle'), function(cusveh)
    if STREAMING.IS_MODEL_A_VEHICLE(util.joaat(cusveh)) then
        juglset.jugsel = util.joaat(cusveh)
    else
        if set.alert then
            util.toast('Improper Vehicle Name (check the spelling)')
        end
    end

end, 'toreador')




menu.action(atkmenu, T('Spawn Attacker'), {'spatkr'}, T('Spawn attacker on the person'), function ()
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    atkset.atkrdelete = false
    if not players.exists(pid) then
        util.stop_thread()
    end
    if not spec then
        Specon(pid)
    end
    
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targets) then
        if atkset.delveh then
            Delcar(targets, spec, pid)
        end
    end
    spawatk = {}


        while atkset.p < atkset.count and players.exists(pid) do
            local atkr = Atkrspawn(atkset.invinc, atkset.invis, pid , atkset.model)
            if atkset.clone then
                PED.CLONE_PED_TO_TARGET(targets, atkr)
            end
            table.insert(spawatk, atkr)
            atkset.p = atkset.p + 1
            if #spawatk == atkset.count then
                break
            end
        end
        util.create_tick_handler(function ()
            Atkrrefresh(pid)
        end)
end)


menus.atkrch = menu.list(atkmenu, T('Change Attacker'), {''}, T('Change the Attackers you send'), function ()

 end)
 PedList(menus.atkrch, function(model)
    atkset.model = model
end)

menu.toggle(atkmenu, T('Clone Attackers'), {''}, T('Make the Attackers Clones of the Player'), function (on)
    atkset.clone = on
    if on then
        local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local hash
        if not PED.IS_PED_MALE(targets) then
            hash = 'mp_f_freemode_01'
        else
            hash = 'mp_m_freemode_01'
        end
        atkset.model = hash
    end
end)


menu.slider(atkmenu, T('Number of Attackers'), {''}, T('Number of attackers to send'), 1, 20, 1, 1, function (s)
    atkset.count = s
end)

menu.toggle(atkmenu, T('Invincible Attackers Off'), {''}, T('Make the Attackers not Invincible anymore'), function (on)
    atkset.invinc = not on
end)

menu.toggle(atkmenu, T('Invisible Attackers'), {''}, T('Make the Attackers Invisible'), function (on)
    atkset.invis = on
end)

menu.list_select(atkmenu, T('Attacker Weapon'), {''}, T('Change the Weapon of the Attackers'), Leyen, 1, function (w)
    atkset.weap = Leyel[w]
end)

menu.toggle(atkmenu, T('Delete Players Vehicle'), {''}, T('Delete Players Vehicle'), function (on)
    atkset.delveh = on
end)

menu.action(atkmenu, T('Delete Attackers'), {'delatkr'}, T('Delete Attackers'), function ()
    atkset.p = 0
    DelEnt(spawatk)
    atkset.atkrdelete = true
 end)

   
 local plnemenu = menu.list(vatkmenu, T('Plane Attackers'), {}, '')

   menu.list_action(plnemenu, T('Spawn Plane Attacker'), {'spplatkr'}, T('Spawn plane attacker on the person'), Planel,  function (planesel)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    platkset.plnedelete = false
    if not players.exists(pid) then
        util.stop_thread()
    end
    if not spec then
        Specon(pid)
    end
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    
    if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targets) then
        if platkset.delveh then
            Delcar(targets, spec, pid)
        end
    end

    platkset.plane = Planeh[planesel]

    while platkset.p < platkset.plcount and players.exists(pid) do
        local plne, pil = Plneatkr(platkset.invinc, platkset.invis, pid, platkset.plane)
        table.insert(plneveh, plne)
        table.insert(plneatkr, pil)
        util.yield(150)
        
        platkset.p = platkset.p + 1
        if #plneveh == platkset.plcount then
            break
        end
    end
    util.create_tick_handler(function ()
        Refreshplnes(pid)
    end)
end) 

menu.slider(plnemenu, T('Number of Plane Attackers'), {''}, T('Number of plane attackers to send'), 1, 10, 1, 1, function (s)
    platkset.plcount = s
end)

menu.toggle(plnemenu, T('Invincible Attackers Off'), {''}, T('Make the Plane Attackers not Invincible anymore'), function (on)
    platkset.invinc = not on
end)

menu.toggle(plnemenu, T('Invisible Attackers'), {''}, T('Make the Plane Attackers Invisible'), function (on)
    platkset.invis = on
end)

menu.list_select(plnemenu, T('Change Weapons'), {'patkweap'}, T('Change the Weapons used by the gunners'), Leyen, 1, function (weapsel)
    platkset.weapon = Leyel[weapsel] 
end)

menu.toggle(plnemenu, T('Delete Players Vehicle'), {''}, T('Delete the Players Vehicle'), function (on)
    platkset.delveh = on
end)

menu.action(plnemenu, T('Delete Plane Attackers'), {'delplatkr'}, T('Delete Plane Attackers'), function ()
    util.yield(100)
    platkset.p = 0
    platkset.plnedelete = true
    DelEnt(plneveh)
    DelEnt(plneatkr)


 end)

 local helimenu = menu.list(vatkmenu, T('Helicopter Attackers'), {}, '')



   menu.list_action(helimenu, T('Spawn Helicopter Attacker'), {'sphelatkr'}, T('Spawn Helicopter attackers on the person'), Helil,  function (heliesel)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    heliatkset.helidelete = false
    if not players.exists(pid) then
        util.stop_thread()
    end
    if not spec then
        Specon(pid)
    end
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    heliatkset.helicopter = Helih[heliesel]
    if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targets) then
        if heliatkset.delveh then
            Delcar(targets, spec, pid)
        end
    end
    while heliatkset.h < heliatkset.hlcount and players.exists(pid) do
        local atk, pil = Heliatkr(heliatkset.invinc, heliatkset.invis, pid, heliatkset.helicopter)
        table.insert(heliveh, atk)
        table.insert(heliatkr, pil)
        util.yield(250)
        heliatkset.h = heliatkset.h + 1
        if #heliveh == heliatkset.hlcount then
            break
        end
    end
 
    util.create_tick_handler(function ()
        RefreshHeli(pid)
    end)
end)


menu.slider(helimenu, T('Number of Helicopter Attackers'), {''}, T('Number of Helicopter attackers to send'), 1, 10, 1, 1, function (s)
    heliatkset.hlcount = s
end)

menu.toggle(helimenu, T('Invincible Attackers Off'), {''}, T('Make the Helicopter Attackers not Invincible anymore'), function (on)
    heliatkset.invinc = not on
end)

menu.toggle(helimenu, T('Invisible Attackers'), {''}, T('Make the Helicopter Attackers Invisible'), function (on)
    heliatkset.invis = on
end)

menu.list_select(helimenu, T('Change Weapons'), {'hatkweap'}, T('Change the Weapons used by the gunners'), Leyen, 1, function (weapsel)
    heliatkset.weapon = Leyel[weapsel] 
end)

menu.toggle(helimenu, T('Delete Players Vehicle'), {''}, T('Delete the Players Vehicle'), function (on)
    heliatkset.delveh = on
end)

menu.action(helimenu, T('Delete Helicopter Attackers'), {'delhlatkr'}, T('Delete Helicopter Attackers'), function ()
    util.yield(100)
        heliatkset.h = 0
        heliatkset.helidelete = true
        DelEnt(heliatkr)
        DelEnt(heliveh)

 end)




local vehatkrmenu = menu.list(vatkmenu, T('Vehicle Attackers'), {}, '')

menu.list_action(vehatkrmenu, T('Spawn Vehicle Attacker'), {'spvehatkr'}, T('Spawn Vehicle attackers on the person'), Vehatkl,  function (vehsel)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    vehatkset.vehdelete = false
    if not players.exists(pid) then
        util.stop_thread()
    end
    if not spec then
        Specon(pid)
    end
    
    vehatkset.attkrveh = Vehatkh[vehsel]
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)     
    if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targets) then
        if heliatkset.delveh then
            Delcar(targets, spec, pid)
        end
    end
    while vehatkset.atkv < vehatkset.vlcount and players.exists(pid) do
        local atk, dri = Vehatkr(vehatkset.invinc, vehatkset.invis, pid, vehatkset.attkrveh)
        NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(atk), true)
        NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(atk), players.user(), true)
        table.insert(atkveh, atk)
        table.insert(vehatkr, dri)
        util.yield(250)
        vehatkset.atkv = vehatkset.atkv + 1
        if #atkveh == vehatkset.vlcount then
            break
        end
    end

    util.create_tick_handler(function ()
        Refreshveh(pid)
    end)
    
end)

menu.text_input(vehatkrmenu, T('Custom Vehicle'), {'cusvatk'}, T('Change the attackers vehicle to a custom one not listed, use the string of the vehicle example rhino'), function (cusveh)
    local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
    vehatkset.vehdelete = false
    if STREAMING.IS_MODEL_A_VEHICLE(util.joaat(cusveh)) then
        vehatkset.attkrveh = cusveh
    else
        if set.alert then
            util.toast('Improper Vehicle Name (check the spelling)')
        end
    end
    if not players.exists(pid) then
        util.stop_thread()
    end
    if not spec then
        Specon(pid)
    end
    
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

    if PED.IS_PED_SITTING_IN_ANY_VEHICLE(targets) then
        if vehatkset.delveh then
            Delcar(targets, spec, pid)
        end
    end
    while vehatkset.atkv < vehatkset.vlcount and players.exists(pid) do
        local atk, dri = Vehatkr(vehatkset.invinc, vehatkset.invis, pid, vehatkset.attkrveh)
        NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(atk), true)
        NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(atk), players.user(), true)
        table.insert(atkveh, atk)
        table.insert(vehatkr, dri)
        util.yield(250)
        vehatkset.atkv = vehatkset.atkv + 1
        if #atkveh == vehatkset.vlcount then
            break
        end
    end
    
    util.create_tick_handler(function ()
        Refreshveh(pid)
    end)
end, '')

menu.slider(vehatkrmenu, T('Number of Vehicle Attackers'), {''}, T('Number of Vehicle attackers to send'), 1, 10, 1, 1, function (s)
    vehatkset.vlcount = s
end)

menu.toggle(vehatkrmenu, T('Invincible Vehicle Off'), {''}, T('Make the Vehicle Attackers not Invincible anymore'), function (on)
    vehatkset.invinc = not on
end)

menu.toggle(vehatkrmenu, T('Invisible Attackers'), {''}, T('Make the Vehicle Attackers Invisible'), function (on)
    vehatkset.invis = on
end)

menu.list_select(vehatkrmenu, T('Change Weapons'), {'vatkweap'}, T('Change the Weapons used by the gunners'), Leyen, 1, function (weapsel)
    vehatkset.weapon = Leyel[weapsel] 
end)

menu.toggle(vehatkrmenu, T('Delete Players Vehicle'), {''}, T('Delete the Players Vehicle'), function (on)
    vehatkset.delveh = on
end)


menu.action(vehatkrmenu, T('Delete Vehicle Attackers'), {'delvehatkr'}, T('Delete Vehicle Attackers'), function ()
        

        DelEnt(vehatkr)
        DelEnt(atkveh)
        vehatkset.atkv = 0
        vehatkset.vehdelete = true
        

 end)

    


menus.atkr_selmenu = menu.list(vatkmenu, T('Change Pilot/Driver and Gunners'), {}, '')

menus.atkr_pildri = menu.list(menus.atkr_selmenu, T('Change Pilot/Driver'), {}, '', function ()

end)
PedList(menus.atkr_pildri, function(model)
    pil_dri[1] = model
end)


menus.atkr_gun1 = menu.list(menus.atkr_selmenu, T('Change Gunner 1'), {}, '', function ()

end)
PedList(menus.atkr_gun1 , function(model)
    gunners[1] = model
end)

menus.atkr_gun2 = menu.list(menus.atkr_selmenu, T('Change Gunner 2'), {}, '', function ()

end)
PedList(menus.atkr_gun2 , function(model)
    gunners[2] = model
end)
menus.atkr_gun3 = menu.list(menus.atkr_selmenu, T('Change Gunner 3'), {}, '', function ()

end)
PedList(menus.atkr_gun3 , function(model)
    gunners[3] = model
end)

    local wall = {invis = false}
  local cage_table = {}
  local pedset = {mdl = 'u_m_m_jesus_01'}
 local pedca =  menu.toggle_loop(pcagem, T('Ped Cage'), {'PCAGE'}, T('Traps Player in a Cage of Peds'), function ()
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
    local pname = PLAYER.GET_PLAYER_NAME(pid)
    if not cage_table[pid] then
        local peds = {}
        local pedhash = util.joaat(pedset.mdl)
        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        Delcar(targets, spec, pid)

        local ped_tab = {'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8'}
        for _, spawned_ped in ipairs(ped_tab) do
            spawned_ped = Pedspawn(pedhash, tar1)
            table.insert(peds,  spawned_ped)
        end

    SetEntCoor(tar1, peds)


    if wall.invis then
        for index, ent in ipairs(peds) do
            ENTITY.SET_ENTITY_VISIBLE(ent, false, 0)
        end
    end

    ---------Audio--------------
    if pedhash == util.joaat('IG_LesterCrest')  then
        Teabagtime(peds[1], peds[2], peds[3], peds[4], peds[5], peds[6], peds[7], peds[8])
    elseif pedhash == util.joaat('player_two') then
        Trevortime(peds)
    elseif pedhash == util.joaat('u_m_m_jesus_01') then
        Jesuslovesyou(peds)  
    elseif pedhash ~= util.joaat('IG_LesterCrest') or util.joaat('player_two') then
    if AUDIO.DOES_CONTEXT_EXIST_FOR_THIS_PED(peds[1], 'GENERIC_FUCK_YOU') ==true
    then Fuckyou(peds)

    elseif AUDIO.DOES_CONTEXT_EXIST_FOR_THIS_PED(peds[1], 'Provoke_Trespass')
    then Provoke(peds)

    elseif AUDIO.DOES_CONTEXT_EXIST_FOR_THIS_PED(peds[1], 'Generic_Insult_High')
    then Insulthigh(peds)

    elseif AUDIO.DOES_CONTEXT_EXIST_FOR_THIS_PED(peds[1], 'GENERIC_WAR_CRY')
    then Warcry(peds)
    else
    end
    end

          -----------Anim-------------------------
        Streamanim('rcmpaparazzo_2')
        Streamanim('mp_player_int_upperfinger')
        Streamanim('misscarsteal2peeing')
        Streamanim('mp_player_int_upperpeace_sign')
        local ped_anim = {peds[2], peds[3], peds[4], peds[5], peds[6], peds[7], peds[8]}
        for _, Pedanim in ipairs(ped_anim) do
            if pedhash == util.joaat('player_two') then
                Runanim(Pedanim, 'misscarsteal2peeing','peeing_loop')
               local tre = PED.GET_PED_BONE_INDEX(Pedanim, 0x2e28)
                Streamptfx('core')
               --credits to saltyscript for gfx part
               GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("ent_amb_peeing", Pedanim, 0, 0, 0, -90, 0, 0, tre, 2, false, false, false)
            elseif pedhash == util.joaat('u_m_m_jesus_01') then
                Runanim(peds[1], 'mp_player_int_upperpeace_sign', 'mp_player_int_peace_sign')
                Runanim(Pedanim, 'mp_player_int_upperpeace_sign', 'mp_player_int_peace_sign')
            else
                Runanim(Pedanim, 'mp_player_int_upperfinger', 'mp_player_int_finger_02_fp')
                Runanim(peds[1], 'rcmpaparazzo_2', 'shag_loop_a')
            end

    end


    for _, Pedm in ipairs(peds) do
        PFP(Pedm, targets) --- ped facing player
    end


    cage_table[pid] = peds
    end --if not cage_table[pid] end

   while cage_table[pid] do
    IPM(targets, tar1, pname, cage_table, pid)


   end


    if not players.exists(pid) then

        if set.alert then
            util.toast('You made them rage quit')
        end
        util.stop_thread()

        cage_table[pid] = nil
    end


    end)

    menus.pedclist = menu.list(pcagem, T('Change Ped for Cage'), {}, T('Will Change the Ped if they move or if you delete current ped'), function ()

     end)
     PedList(menus.pedclist, function(model)
        pedset.mdl = model
    end)

    menu.action(pcagem, T('Free from Ped Cage'), {'FreePedcage'}, T('Free Player from Ped Cage'), function ()
        if cage_table[pid] then
            DelEnt(cage_table[pid])
            menu.set_value(pedca, false)
            cage_table[pid] = false
            else
                 if set.alert then
                    util.toast('No Ped Cage Found')
                 end
        end
    end)
    local atkhash = {}

    
    local rcage_table = {}
    local rpedca =  menu.toggle_loop(pcagem, T('Random Ped Cage'), {'PCAGE'}, T('Traps Player in a Cage of Random Peds'), function ()
      local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
      local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
      local pname = PLAYER.GET_PLAYER_NAME(pid)
      if not rcage_table[pid] then
        Combinetab(atkhash, AMC, AfC, CSP, GM, Mpp, MSF, MCM, SMC, Ssf, Ssm, Dlcp)
          local rpeds = {}
          local rpedind = math.random(1, #atkhash)
          local rpedset = atkhash[rpedind]
          local pedhash = util.joaat(rpedset)
          local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
          Delcar(targets, spec, pid)
  
          local ped_tab = {'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8'}
        for _, spawned_ped in ipairs(ped_tab) do
            spawned_ped = Pedspawn(pedhash, tar1)
            table.insert(rpeds,  spawned_ped)
        end

  
        SetEntCoor(tar1, rpeds)

  
        if wall.invis then
            for index, ent in ipairs(rpeds) do
                ENTITY.SET_ENTITY_VISIBLE(ent, false, 0)
            end
        end

      ---------Audio--------------
      if pedhash == util.joaat('IG_LesterCrest')  then
        Teabagtime(rpeds[1], rpeds[2], rpeds[3], rpeds[4], rpeds[5], rpeds[6], rpeds[7], rpeds[8])
      elseif pedhash == util.joaat('player_two') then
          Trevortime(rpeds)
      elseif pedhash == util.joaat('u_m_m_jesus_01') then
          Jesuslovesyou(rpeds)  
      elseif pedhash ~= util.joaat('IG_LesterCrest') or util.joaat('player_two') then
      if AUDIO.DOES_CONTEXT_EXIST_FOR_THIS_PED(rpeds[1], 'GENERIC_FUCK_YOU') ==true
      then Fuckyou(rpeds)
  
      elseif AUDIO.DOES_CONTEXT_EXIST_FOR_THIS_PED(rpeds[1], 'Provoke_Trespass')
      then Provoke(rpeds)
  
      elseif AUDIO.DOES_CONTEXT_EXIST_FOR_THIS_PED(rpeds[1], 'Generic_Insult_High')
      then Insulthigh(rpeds)
  
      elseif AUDIO.DOES_CONTEXT_EXIST_FOR_THIS_PED(rpeds[1], 'GENERIC_WAR_CRY')
      then Warcry(rpeds)
      else
      end
      end
  
            -----------Anim-------------------------
          Streamanim('rcmpaparazzo_2')
          Streamanim('mp_player_int_upperfinger')
          Streamanim('misscarsteal2peeing')
          Streamanim('mp_player_int_upperpeace_sign')
          local ped_anim = {rpeds[2], rpeds[3], rpeds[4], rpeds[5], rpeds[6], rpeds[7], rpeds[8]}
          for _, Pedanim in ipairs(ped_anim) do
              if pedhash == util.joaat('player_two') then
                  Runanim(Pedanim, 'misscarsteal2peeing','peeing_loop')
                 local tre = PED.GET_PED_BONE_INDEX(Pedanim, 0x2e28)
                  Streamptfx('core')
                 --credits to saltyscript for gfx part
                 GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE("ent_amb_peeing", Pedanim, 0, 0, 0, -90, 0, 0, tre, 2, false, false, false)
              elseif pedhash == util.joaat('u_m_m_jesus_01') then
                  Runanim(rpeds[1], 'mp_player_int_upperpeace_sign', 'mp_player_int_peace_sign')
                  Runanim(Pedanim, 'mp_player_int_upperpeace_sign', 'mp_player_int_peace_sign')
              else
                  Runanim(Pedanim, 'mp_player_int_upperfinger', 'mp_player_int_finger_02_fp')
                  Runanim(rpeds[1], 'rcmpaparazzo_2', 'shag_loop_a')
              end
  
      end

  
      for _, Pedm in ipairs(rpeds) do
          PFP(Pedm, targets) --- ped facing player
      end
  
  
      rcage_table[pid] = rpeds
      end --if not cage_table[pid] end
  
     while rcage_table[pid] do
      IPM(targets, tar1, pname, rcage_table, pid)
     end

      if not players.exists(pid) then
  
          if set.alert then
            util.toast('You made them rage quit')
          end
          util.stop_thread()
  
          rcage_table[pid] = nil
      end
  
  
      end)
  
    
      menu.action(pcagem, T('Free from Random Ped Cage'), {'FreeRPedcage'}, T('Free Player from Random Ped Cage'), function ()
          if rcage_table[pid] then
              DelEnt(rcage_table[pid])
              menu.set_value(rpedca, false)
              rcage_table[pid] = false
              else
                   if set.alert then
                      util.toast('No Ped Cage Found')
                   end
          end
      end)

      local ccage_table = {}
      local cpedca =  menu.toggle_loop(pcagem, T('Clone Ped Cage'), {'PCAGE'}, T('Traps Player in a Cage of Cloned Peds'), function ()
        local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
        local pname = PLAYER.GET_PLAYER_NAME(pid)
        local target_ped
        if not PED.IS_PED_MALE(targets) then
            target_ped = 2627665880
        else
            target_ped = 1885233650
        end
        Streament(target_ped)
        if not ccage_table[pid] then
            local cpeds = {}
            local pedhash = target_ped
            
            local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
            Delcar(targets, spec, pid)
    
            local ped_tab = {'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8'}
          for _, spawned_ped in ipairs(ped_tab) do
              spawned_ped = Pedspawn(pedhash, tar1)
              PED.CLONE_PED_TO_TARGET(targets, spawned_ped)
              table.insert(cpeds,  spawned_ped)
          end
  
    
          SetEntCoor(tar1, cpeds)
  
    
          if wall.invis then
              for index, ent in ipairs(cpeds) do
                  ENTITY.SET_ENTITY_VISIBLE(ent, false, 0)
              end
          end
  
        ---------Audio--------------

    
              -----------Anim-------------------------
            Streamanim('rcmpaparazzo_2')
            Streamanim('mp_player_int_upperfinger')
            Streamanim('misscarsteal2peeing')
            Streamanim('mp_player_int_upperpeace_sign')
            local ped_anim = {cpeds[2], cpeds[3], cpeds[4], cpeds[5], cpeds[6], cpeds[7], cpeds[8]}
            for _, Pedanim in ipairs(ped_anim) do
                
                    Runanim(Pedanim, 'mp_player_int_upperfinger', 'mp_player_int_finger_02_fp')
                    Runanim(cpeds[1], 'rcmpaparazzo_2', 'shag_loop_a')
               
    
        end
  
    
        for _, Pedm in ipairs(cpeds) do
            PFP(Pedm, targets) --- ped facing player
        end
    
    
        ccage_table[pid] = cpeds
        end --if not cage_table[pid] end
    
       while ccage_table[pid] do
        IPM(targets, tar1, pname, ccage_table, pid)
       end
  
        if not players.exists(pid) then
    
            if set.alert then
              util.toast('You made them rage quit')
            end
            util.stop_thread()
    
            ccage_table[pid] = nil
        end
    
    
        end)
    
      
        menu.action(pcagem, T('Free from Clone Ped Cage'), {'FreeCPedcage'}, T('Free Player from Clone Ped Cage'), function ()
            if ccage_table[pid] then
                DelEnt(ccage_table[pid])
                menu.set_value(cpedca, false)
                ccage_table[pid] = false
                else
                     if set.alert then
                        util.toast('No Ped Cage Found')
                     end
            end
        end) 

    local obj_table = {}
    local objset = {mdl = 'prop_mineshaft_door', invis = false}
 local objca = menu.toggle_loop(pcagem, T('Object Cage'), {'ObjCage'}, T('Traps Player in a Cage of Objects'), function ()
    local targets = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local tar1 = ENTITY.GET_ENTITY_COORDS(targets, true)
    local pname = PLAYER.GET_PLAYER_NAME(pid)

    if not obj_table[pid] then
        local objs = {}

        local spec = menu.get_value(menu.ref_by_rel_path(menu.player_root(pid), "Spectate>Nuts Method"))
        Delcar(targets, spec, pid)
        
        local hsel = util.joaat(objset.mdl)
        Streament(hsel)
        local obj_tab = {'o1', 'o2', 'o3', 'o4', 'o5', 'o6', 'o7', 'o8'}
        for _, spawned_obj in ipairs(obj_tab) do
            spawned_obj =  ObjFrezSpawn(hsel, tar1)
            table.insert(objs,  spawned_obj)

        end
        obj_table[pid] = objs



        SetEntCoor(tar1, objs)
        local rot_tab = {180, 135, 90, 45, 0, 315, 270, 225}
        for i = 1, #rot_tab do
                ENTITY.SET_ENTITY_ROTATION(objs[i], 0, 0, rot_tab[i], 1, true)
        end

        if wall.invis then
            for index, ent in ipairs(objs) do
                ENTITY.SET_ENTITY_VISIBLE(ent, false, 0)
            end
        end

        for _, alarm in ipairs(objs) do
            AUDIO.PLAY_SOUND_FROM_ENTITY(-1, 'Alarm_Interior', alarm, 'DLC_H3_FM_FIB_Raid_Sounds', 0, 0)
        end


    
    end
while obj_table[pid] do
    IPM(targets, tar1, pname, obj_table, pid)
end

if not players.exists(pid) then

    if set.alert then
        util.toast('You made them rage quit')
    end
    util.stop_thread()

    obj_table[pid] = nil
end

 end)

 local ObjSlist = menu.list(pcagem, T('Change Object for Cage'), {}, T('Will Change the Object if they move or if you delete current object'))

 menu.action(pcagem, T('Free from Object Cage'), {'FreeObjcage'}, T('Free Player from Object Cage'), function ()
    if obj_table[pid] then
        DelEnt(obj_table[pid])
        menu.set_value(objca, false)
        Stopsound()
        obj_table[pid] = false
        else
            if set.alert then
                util.toast('No Obj Cage Found')
            end
    end

end)

menu.toggle(pcagem, T('Invisible Walls'), {}, T('Will turn the Ped Cage, Object Cage and Random Ped Cage Invisible'), function (on)
    wall.invis = on
end)



 -----------------Object Actions----------
 -----signs---
 menu.list_action(ObjSlist, T('Street Signs'), {''}, T('Changes Objects to Street Signs'), Siglist, function(objsel)
    objset.mdl = Sigha[objsel]
end)

 -----Doors---
 menu.list_action(ObjSlist, T('Doors'), {''}, T('Changes Objects to Doors'), Dolist, function(objsel)
    objset.mdl = Doha[objsel]
end)

 ------Interior---
 menu.list_action(ObjSlist, T('Interior'), {''}, T('Changes Objects to Interior Props'), Interlist, function(objsel)
    objset.mdl = Intob[objsel]
end)

 ------Exterior---
 menu.list_action(ObjSlist, T('Exterior'), {''}, T('Changes Objects to Exterior Props'), Extlist, function(objsel)
    objset.mdl = Extob[objsel]
end)

 -------------------------------Player Join End-----------------------------------------------------------------------------

end)





players.dispatch_on_join()



 -------------------
 menu.readonly(setroot, T('Version Number'), tostring(SCRIPT_VERSION))

 menu.hyperlink(setroot, T('Join the Discord'), 'https://discord.gg/fn4uBbFNnA', T('Join the AcjokerScript Discord if you have any problems, want to suggest features, or want to help with translations'))

 Credroot = menu.list(setroot, T('Credits'), {}, '')
 menu.action(Credroot, T('hexarobi'), {}, T('For all the help with the script they are always a big help'), function ()
 end)
 menu.action(Credroot, T('Jerry123'), {}, T('For major help with multiple portions of the script and his LangLib for translations'), function ()
 end)
 menu.action(Credroot, T('Keramis'), {}, T('For the tutorial I would have had a harder time without it'), function ()
 end)
 menu.action(Credroot, T('aaron'), {}, T('For the ScaleformLib script and help with executing it'), function ()
 end)
 menu.action(Credroot, T('Nowiry'), {}, T('For their script it was a heavy influence on the Charger weapon'), function ()
 end)
 menu.action(Credroot, T('=)'), {}, T('For the peeing animation for Trevor'), function ()
 end)
 menu.action(Credroot, T('ICYPhoenix'), {}, T('For the Ped Facing Ped function used in Ped Cage'), function ()
 end)
 Troot = menu.list(Credroot, T('Translators'), {}, '')
 menu.action(Troot, T('lu_zi'), {}, T('For the Chinese translations'), function ()
 end)
 menu.action(Troot, T('akaitawa'), {}, T('For the Portuguese translations'), function ()
 end)
 menu.action(Troot, T('- THEKING -'), {}, T('For the German translations'), function ()
 end)
 menu.action(Troot, T('Laavi'), {}, T('For the Dutch translations'), function ()
 end)
 menu.action(Troot, T('akatozi and BloodyStall_'), {}, T('For the French translations'), function ()
 end)
  -------------------------------------------------------------------------------------------------------



util.keep_running()

util.log('Loaded AcjokerScript in '.. util.current_time_millis() - LOADING_START ..' ms.')


LOADING_SCRIPT = false
if Template and not LOADING_SCRIPT then
    EndTranslate()
end
