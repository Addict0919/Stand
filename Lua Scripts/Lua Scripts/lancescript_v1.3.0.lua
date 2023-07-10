-- coded by lance#8213, from scratch
-- if you are stealing my code to use it in another menu actually kys
require("natives-1614644776")

self_root = menu.list(menu.my_root(), "Self", {"lancescriptself"}, "")
world_root = menu.list(menu.my_root(), "World", {"lancescriptworld"}, "")
entity_root = menu.list(menu.my_root(), "Nearby vehicles/objects", {"lancescriptentity"}, "")
npc_root = menu.list(menu.my_root(), "Nearby NPCs", {"lancescriptnpcs"}, "")
vehicle_root = menu.list(menu.my_root(), "Vehicle", {"lanceobjecttroll"}, "")
allplayers_root = menu.list(menu.my_root(), "All players", {"lancescriptallplayers"}, "")
gametweaks_root = menu.list(menu.my_root(), "Game tweaks", {"lancescriptgametweaks"}, "")
fakemessages_root = menu.list(gametweaks_root, "Fake messages", {"lancescriptfakemessages"}, "")
lancescript_root = menu.list(menu.my_root(), "LanceScript", {"lancescriptutil"}, "")

menu.toggle(lancescript_root, "Show active entity pools", {"entitypoolupdates"}, "Toasts what entity pools are being updated every tick. The more you see, the more performance loss; getting all entities is a heavy task.", function(on)
    if on then
        show_updates = true
    else
        show_updates = false
    end
end)

vehicle_uses = 0
ped_uses = 0
player_uses = 0
object_uses = 0
all_vehicles = {}
all_objects = {}
all_players = {}
all_peds = {}
player_cur_car = 0

infibounty = false
infibounty_thread = util.create_thread(function (thr)
    while true do
        if infibounty then
            menu.trigger_commands("bountyall 10000")
        end
        util.yield(60000)
    end
end)

rgb_thread = util.create_thread(function (thr)
    rgb = {}
    cur_col = 1
    rgb = {255, 0, 0}
    while true do
        if cur_col == 1 then
            rgb = {255, 0, 0}
            cur_col = 2
        elseif cur_col == 2 then
            rgb = {0, 255, 0}
            cur_col = 3
        elseif cur_col == 3 then
            rgb = {0, 0, 255}
            cur_col = 1
        end
        util.yield(200)
    end
end)

util.toast("I hope you enjoy this! If you have any suggestions, let me know! :)")
util.toast("Welcome to Lancescript v1.3.0!")

player_cur_car = 0
function is_ped_player(ped)
    if PED.GET_PED_TYPE(ped) >= 4 then
        return false
    else
        return true
    end
end

function request_model_load(hash)
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do
        util.toast("Loading model hash " .. hash)
        util.yield()
    end
end

function get_random_ped()
    peds = entities.get_all_peds_as_handles()
    npcs = {}
    valid = 0
    for k,p in pairs(peds) do
        if p ~= nil and not is_ped_player(p) then
            table.insert(npcs, p)
            valid = valid + 1
        end
    end
    return npcs[math.random(valid)]
end


function spawn_object_in_front_of_ped(ped, hash, ang, room, zoff)
    coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0.0, room, zoff)
    request_model_load(hash)
    hdng = ENTITY.GET_ENTITY_HEADING(ped)
    new = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, coords['x'], coords['y'], coords['z'], true, false, false)
    ENTITY.SET_ENTITY_HEADING(new, hdng+ang)
    return new
end

menu.toggle(self_root, "Make me a cop", {"makemecop"}, "Sets your ped as a cop. To make you not a cop, it will suicide you. Will make you invisible to almost all cops, but you will report your own crimes, get a cop voice, have a vision cone, and will not be able to shoot at other cops. SWAT and army will still shoot you.", function(on)
    ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    if on then
        PED.SET_PED_AS_COP(ped, true);
    else
        menu.trigger_commands("suicide")
    end
end)


hud_rainbow = false
menu.toggle(gametweaks_root, "RGB hud", {"rgbhud"}, "RGB\'s your hud. This is AIDS, and requires a game restart to reset.", function(on)
    if on then
        hud_rainbow = true
    else
        hud_rainbow = false
    end
end)

ban_msg = "HUD_ROSBANPERM"
--_SET_WARNING_MESSAGE_WITH_ALERT(char* labelTitle, char* labelMsg, int p2, int p3, char* labelMsg2, BOOL p5, int p6, int p7, char* p8, char* p9, BOOL background, int errorCode);

function show_alert_until_enter(p1, p2)
    while true do
        if PAD.IS_CONTROL_JUST_PRESSED(18, 18) then
            break
        end
        HUD._SET_WARNING_MESSAGE_WITH_ALERT(0x127109A3, p1, 2, 0, p2, 0, -1, 0, 0x4F4B0621, 0x4F4B0621, true, 0)
        --HUD._SET_WARNING_MESSAGE_WITH_ALERT("0x127109A3", p1, 2, 0, p2, 0, -1, 0, 0x4F4B0621, 0x4F4B0621, true, 0)
        util.yield()
    end
end

function show_custom_alert_until_enter(l1)
    while true do
        if PAD.IS_CONTROL_JUST_PRESSED(18, 18) then
            break
        end
        --HUD.SET_WARNING_MESSAGE_WITH_HEADER_AND_SUBSTRING_FLAGS("ALERT", "JL_INVITE_ND", 2, "", true, -1, -1, l1, nil, true, 0)
        native_invoker.begin_call()
        native_invoker.push_arg_string("ALERT")
        native_invoker.push_arg_string("JL_INVITE_ND")
        native_invoker.push_arg_int(2)
        native_invoker.push_arg_string("")
        native_invoker.push_arg_bool(true)
        native_invoker.push_arg_int(-1)
        native_invoker.push_arg_int(-1)
        -- line here
        native_invoker.push_arg_string(l1)
        -- optional second line here
        native_invoker.push_arg_int(0)
        native_invoker.push_arg_bool(true)
        native_invoker.push_arg_int(0)
        native_invoker.end_call("701919482C74B5AB")
        util.yield()
    end
end

menu.action(fakemessages_root, "Fake perma ban message", {"fakeban"}, "Shows a completely fake ban message. Maybe use this to get free accounts from cheat devs or cause a scare on r/Gta5modding.", function(on_click)
    show_alert_until_enter(ban_msg, "HUD_QURETSP")
end)
--0x252F03F2

menu.click_slider(fakemessages_root, "Ban message to show", {"banmsg"}, "The ban message to show. 1 just says you\'ve been banned, the other says you\'ve been banned permanently. I\'m not really sure of the difference but yeah.", 1, 2, 1, 1, function(s)
    if s == 1 then
        ban_msg = "HUD_ROSBANNED"
    else
        ban_msg = "HUD_ROSBANPERM"
    end
  end)

menu.action(fakemessages_root, "Services unavailable", {"fakeservicedown"}, "rOcKstaR GaMe ServICeS ArE UnAvAiLAbLe RiGht NoW", function(on_click)
    show_alert_until_enter("CLAN_NOT_FAILED", "HUD_SPRETURNTRY")
end)

menu.action(fakemessages_root, "Custom alert", {"customalert"}, "Shows a custom alert of your liking. Credit to QuickNUT and Sainan for help with this.", function(on_click)
    util.toast("Please type what you want the alert to say. Type ~n~ for new line, ie foo~n~bar will show up as 2 lines.")
    menu.show_command_box("customalert ")
end, function(on_command)
    show_custom_alert_until_enter(on_command)
end)

menu.action(menu.my_root(), "Players shortcut", {}, "Quickly opens session players list, for convenience", function(on_click)
    menu.trigger_commands("playerlist")
end)

make_peds_cops = false
menu.toggle(npc_root, "Make nearby peds cops", {"makecops"}, "They\'re not actually real cops, but kind of are. They seem to flee very easily, but will snitch on you. Sort of like mall cops.", function(on)
    if on then
        make_peds_cops = true
        ped_uses = ped_uses + 1
    else
        make_peds_cops = false
        ped_uses = ped_uses - 1
    end
end, false)

play_ped_ringtones = false
menu.toggle(npc_root, "Ring all peds phones", {"ringtones"}, "Turns all nearby ped ringtones on", function(on)
    if on then
        play_ped_ringtones = true
        ped_uses = ped_uses +1
    else
        play_ped_ringtones = false
        ped_uses = ped_uses - 1
    end
end, false)

dumb_peds= false
menu.toggle(npc_root, "Make all peds dumb", {"dumbpeds"}, "Makes nearby peds dumb / marks them as \"not highly perceptive\" in the engine. Whatever that means tbh.", function(on)
    if on then
        dumb_peds = true
        ped_uses = ped_uses + 1
    else
        dumb_peds = false
        ped_uses = ped_uses - 1
    end
end, false)

safe_peds= false
menu.toggle(npc_root, "Give peds helmets", {"safepeds"}, "First-time drivers need safety.", function(on)
    if on then
        safe_peds = true
        ped_uses = ped_uses + 1
    else
        safe_peds = false
        ped_uses = ped_uses - 1
    end
end, false)

deaf_peds= false
menu.toggle(npc_root, "Make all peds deaf", {"deafpeds"}, "Makes nearby peds deaf. Probably only noticeable for stealth missions.", function(on)
    if on then
        deaf_peds = true
        ped_uses = ped_uses + 1
    else
        deaf_peds = false
        ped_uses = ped_uses - 1
    end
end, false)

vehicle_fuckup = false
menu.toggle(entity_root, "Fuck up all cars", {"fuckupcars"}, "Beats the SHIT out of all nearby cars. But this damage is only local.", function(on)
    if on then
        vehicle_fuckup = true
        vehicle_uses = vehicle_uses + 1
    else
        vehicle_fuckup = false
        vehicle_uses = vehicle_uses - 1
    end
end, false)

godmode_vehicles = false
menu.toggle(entity_root, "Godmode all vehicles nearby", {"godmodecars"}, "Makes all cars nearby undamageable. Built for NPC cars, so don\'t whine when Mr. ||||||||||| sticky bombs your itali.", function(on)
    if on then
        godmode_vehicles = true
        vehicle_uses = vehicle_uses + 1
    else
        godmode_vehicles = false
        vehicle_uses = vehicle_uses - 1
    end
end)

disable_veh_colls = false
menu.toggle(entity_root, "Hole all nearby cars", {"nocolcars"}, "Makes all nearby cars fall through the world, or \"into a hole\".", function(on)
    if on then
        disable_veh_colls = true
        vehicle_uses = vehicle_uses + 1
    else
        disable_veh_colls = false
        vehicle_uses = vehicle_uses - 1
    end
end)


vehicle_rainbow = false
menu.toggle(entity_root, "Rainbow vehicles", {"rainbowvehicles"}, "Rainbows all nearby vehicles!", function(on)
    if on then
        vehicle_rainbow = true
        vehicle_uses = vehicle_uses + 1
    else
        vehicle_rainbow = false
        vehicle_uses = vehicle_uses - 1
    end
end, false)

clear_radius = 100
function clear_area(radius)
    target_pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()))
    MISC.CLEAR_AREA(target_pos['x'], target_pos['y'], target_pos['z'], radius, true, false, false, false)
end

menu.action(world_root, "Clear area", {"cleararea"}, "Clears the nearby area of everything", function(on_click)
    clear_area(clear_radius)
    util.toast('Area cleared :)')
end)

-- SET_PED_SHOOTS_AT_COORD(Ped ped, float x, float y, float z, BOOL toggle);

menu.action(world_root, "Clear world", {"clearworfld"}, "Clears literally everything that can be cleared within the world (well, everything that\'s rendered in). Don\'t tell them, but it\'s really just a huge number as radius.", function(on_click)
    clear_area(1000000)
    util.toast('World cleared :)')
end)

cont_clear = false
menu.toggle(world_root, "Continuous area clear", {"contareaclear"}, "Area clear, but looped", function(on)
    if on then
        cont_clear = true
    else
        cont_clear = false
    end
end, false)

menu.click_slider(world_root, "Clear radius", {"clearradius"}, "Radius to clear things within", 100, 10000, 100, 100, function(s)
    radius = s
  end)

menu.click_slider(world_root, "World gravity level", {"worldgravity"}, "World gravity level (0 is normal, higher number = less gravity)", 0, 3, 1, 1, function(s)
  MISC.SET_GRAVITY_LEVEL(s)
end)

effects_root = menu.list(world_root, "Screen effects", {"lancescriptfx"}, "")

menu.toggle(effects_root, "DMT", {"dmt"}, "", function(on)
    if on then
        GRAPHICS.ANIMPOSTFX_PLAY("DMT_flight", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("DMT_flight")
    end
end, false)

menu.toggle(effects_root, "Clowns", {"clowns"}, "", function(on)
    if on then
        GRAPHICS.ANIMPOSTFX_PLAY("DrugsTrevorClownsFight", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("DrugsTrevorClownsFight")
    end
end, false)

menu.toggle(effects_root, "Dog vision", {"dogvision"}, "", function(on)
    if on then
        GRAPHICS.ANIMPOSTFX_PLAY("ChopVision", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("ChopVision")
    end
end, false)

menu.toggle(effects_root, "Rampage", {"rampage"}, "", function(on)
    if on then
        GRAPHICS.ANIMPOSTFX_PLAY("Rampage", 0, true)
    else
        GRAPHICS.ANIMPOSTFX_STOP("Rampage")
    end
end, false)

menu.action(effects_root, "Input custom effect", {"effectinput"}, "Makes everyone in the session except you say something.", function(on_click)
    util.toast("Please type the effect name")
    menu.show_command_box("effectinput ")
end, function(on_command)
    GRAPHICS.ANIMPOSTFX_PLAY(on_command, 0, true)
end)

menu.action(effects_root, "Stop all effects", {"stopfx"}, "Use only as emergency, to stop custom inputted effects, or to stop regularly-triggered effects. If you can, try untoggling the effect first here.", function(on_click)
    GRAPHICS.ANIMPOSTFX_STOP_ALL()
end)



function entity_reaper()
  for k,veh in pairs(all_vehicles) do
      if not is_ped_player(VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1)) then
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh)
      end
  end
  for k,ped in pairs(all_peds) do
    if not is_ped_player(ped) then
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
    end
  end
  for k,obj in pairs(all_objects) do
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(obj)
  end
end

entity_reap = false
menu.toggle(entity_root, "Entity reap", {"entityreap"}, "Reap all nearby entities (requests ownership)", function(on)
    if on then
        util.toast("Entity reaper is ON. This may cause performance issues.")
        entity_reap = true
        vehicle_uses = vehicle_uses + 1
        ped_uses = ped_uses + 1
        object_uses = object_uses + 1
    else
        entity_reap = false
        vehicle_uses = vehicle_uses - 1
        ped_uses = ped_uses - 1
        object_uses = object_uses - 1
    end
end, false)

ascend_vehicles = false
menu.toggle(entity_root, "Ascend all nearby vehicles", {"ascendvehicles"}, "It\'s supposed to neatly make them levitate.. but it just spends them spinning in mid air. Which is fucking hilarious.", function(on)
    if on then
        ascend_vehicles = true
        vehicle_uses = vehicle_uses + 1
    else
        ascend_vehicles = false
        vehicle_uses = vehicle_uses - 1
    end
end)

no_radio = false
menu.toggle(entity_root, "Disable radio on all cars", {"noradio"}, "serenity.", function(on)
    if on then
        no_radio = true
        vehicle_uses = vehicle_uses + 1
    else
        no_radio = false
        vehicle_uses = vehicle_uses - 1
    end
end)

loud_radio = false
menu.toggle(entity_root, "Loud radio on all cars", {"loudradio"}, "I CAN\'T HEAR YOU OVER ALL THIS BULLSHIT", function(on)
    if on then
        loud_radio = true
        vehicle_uses = vehicle_uses + 1
    else
        loud_radio = false
        vehicle_uses = vehicle_uses - 1
    end
end)


halt_traffic = false
menu.toggle(entity_root, "Halt traffic", {"halttraffic"}, "Prevents all nearby vehicles from moving, at all. Not even an inch. Irreversible so be careful.", function(on)
    if on then
        halt_traffic = true
        vehicle_uses = vehicle_uses + 1
    else
        halt_traffic = false
        vehicle_uses = vehicle_uses - 1
    end
end)

vehicle_chaos = false
menu.toggle(entity_root, "Vehicle chaos", {"chaos"}, "Enables the chaos...", function(on)
    if on then
        vehicle_chaos = true
        vehicle_uses = vehicle_uses + 1
    else
        vehicle_chaos = false
        vehicle_uses = vehicle_uses - 1
    end
end, false)

vc_gravity = true
menu.toggle(entity_root, "Vehicle chaos gravity", {"chaosgravity"}, "Gravity on/off", function(on)
    if on then
        vc_gravity = true
    else
        vc_gravity = false
    end
end, true)

vc_speed = 100
menu.click_slider(entity_root, "Vehicle chaos speed", {"chaosspeed"}, "The speed to force the vehicles to. Higher = more chaos.", 30, 300, 100, 10, function(s)
  vc_speed = s
end)

bullet_rain = false
bullet_rain_target = -1

num_of_spam = 30
function spam_entity_on_player(ped, hash)
    request_model_load(hash)
    coords = ENTITY.GET_ENTITY_COORDS(ped, false)
    for i=1, num_of_spam do
        OBJECT.CREATE_OBJECT_NO_OFFSET(hash, coords['x'], coords['y'], coords['z'], true, false, false)
    end
    util.toast('Done spamming entities.')
end

menu.toggle(vehicle_root, "Invisible boatmobile", {"everythingproof"}, "Makes your vehicle everything-proof. But not invincible. Glass seems to be bulletproof though. Don\'t judge me, I didn\'t make this native.", function(on)
    if not player_cur_car then
        return
    end
    if on then
        ENTITY.SET_ENTITY_ALPHA(player_cur_car, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(player_cur_car, false, false);
    else
        ENTITY.SET_ENTITY_ALPHA(player_cur_car, 255, true)
        ENTITY.SET_ENTITY_VISIBLE(player_cur_car, true, false);
    end
end)

everythingproof = false
menu.toggle(vehicle_root, "Everything-proof", {"everythingproof"}, "Makes your vehicle everything-proof. But not invincible. Glass seems to be bulletproof though. Don\'t judge me, I didn\'t make this native.", function(on)
    if on then
        everythingproof = true
    else
        everythingproof = false
    end
end)

menu.click_slider(vehicle_root, "Vehicle top speed", {"topspeed"}, "Sets vehicle top speed (this is known as engine power multiplier elsewhere)", 1, 2000, 200, 50, function(s)
    VEHICLE.MODIFY_VEHICLE_TOP_SPEED(player_cur_car, s);
end)

menu.click_slider(vehicle_root, "Dirt level", {"dirtlevel"}, "Arctic Monkeys - Do I Wanna Know", 0, 15.0, 0, 1, function(s)
    if player_cur_car then
        VEHICLE.SET_VEHICLE_DIRT_LEVEL(player_cur_car, s)
    end
end)

swiss_cheese_dmg = 0
hit_times = 1
function set_up_player_actions(pid)
    menu.divider(menu.player_root(pid), "LanceScript")
    entspam_root = menu.list(menu.player_root(pid), "Entity spam", {"entityspam"}, "")
    npctrolls_root = menu.list(menu.player_root(pid), "NPC trolling", {"npctrolls"}, "")
    objecttrolls_root = menu.list(menu.player_root(pid), "Object trolling", {"objecttrolls"}, "")

    menu.action(entspam_root, "Traffic cones", {"conespam"}, "Spams traffic cones", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        spam_entity_on_player(target_ped, 3760607069)
    end)

    menu.click_slider(entspam_root, "Number of entities", {"entspamnum"}, "Number of ents to spam. Obviously, setting this to a high number will crash you or freeze your game indefinitely.", 1, 1000, 30, 10, function(s)
        num_of_spam = s
    end)

    menu.action(objecttrolls_root, "Ramp in front of player", {"ramp"}, "Spawns a ramp right in front of the player. Most nicely used when they are in a car.", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        hash = 2282807134
        request_model_load(hash)
        spawn_object_in_front_of_ped(target_ped, hash, 90, 50.0, -0.5)
    end)

    menu.action(objecttrolls_root, "Barrier in front of player", {"barrier"}, "Spawns a *frozen* barrier right in front of the player. Good for causing accidents.", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        hash = 3729169359
        obj = spawn_object_in_front_of_ped(target_ped, hash, 0, 5.0, -0.5)
        ENTITY.FREEZE_ENTITY_POSITION(obj, true)
    end)
    menu.action(objecttrolls_root, "Hit with football", {"football"}, "Just fucking YEETS a football into the player\'s head at skull-cracking speed. Truly an American sport.", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        hash = 516221692
        for i=1,hit_times do
            obj = spawn_object_in_front_of_ped(target_ped, hash, 90.0, 10.0, 0.6)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(obj, 1, -1000.0, 0.0, 0.0, true, true, true, true)
        end
    end)

    menu.action(objecttrolls_root, "Hit with bowling ball", {"bowlingball"}, "For those obsessed with oil patterns on a lane", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        hash = 3731636222
        for i=1, hit_times do
            obj = spawn_object_in_front_of_ped(target_ped, hash, 90.0, 10.0, 0.6)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(obj, 1, -1000.0, 0.0, 0.0, true, true, true, true)
        end
    end)

    menu.click_slider(objecttrolls_root, "Num of objects to hit player with each time", {"hittimes"}, "How many times the player\'s skull should be fucked each time you tap an object to hit them with. I know it looks convincing but be careful, too many ents will crash you.", 1, 10, 1, 1, function(s)
        hit_times = s
      end)


    menu.action(menu.player_root(pid), "Owned snipe", {"snipe"}, "Snipes the player with you as the attacker [Will not work if you do not have LOS with the target]", function(on_click)
        owner = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, 300.0, true, 100416529, owner, true, false, 100.0)
    end)
    menu.action(menu.player_root(pid), "Anon snipe", {"selfsnipe"}, "Snipes the player anonymously, as if a random ped did it [The randomly selected ped needs to have LOS, I think]", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        target = ENTITY.GET_ENTITY_COORDS(target_ped)
        random_ped = get_random_ped()
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, 300.0, true, 100416529, random_ped, true, false, 100.0)
    end)

    --SET_VEHICLE_WHEEL_HEALTH(Vehicle vehicle, int wheelIndex, float health);
    menu.action(menu.player_root(pid), "Cage", {"lscage"}, "Basic cage option. Cause you cant handle yourself. We are a little more ethical here at Lance Studios though, so the cage has some wiggle room (our special cage model also means that like, no menu blocks the model).", function(on_click)
        ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        coords = ENTITY.GET_ENTITY_COORDS(ped, true)
        hash = 779277682
        request_model_load(hash)
        cage1 = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, coords['x'], coords['y'], coords['z'], true, false, false)
        ENTITY.SET_ENTITY_ROTATION(cage1, 0.0, -90.0, 0.0, 1, true)
        cage2 = OBJECT.CREATE_OBJECT_NO_OFFSET(hash, coords['x'], coords['y'], coords['z'], true, false, false)
        ENTITY.SET_ENTITY_ROTATION(cage2, 0.0, 90.0, 0.0, 1, true)
    end)

    menu.action(npctrolls_root, "NPC jack last car", {"npcjack"}, "Sends an NPC to steal their car. Works best if they are out of their car.", function(on_click)
        player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        last_veh = PED.GET_VEHICLE_PED_IS_IN(player_ped, true)
        cur_veh = PED.GET_VEHICLE_PED_IS_IN(player_ped, false)
        if last_veh ~= 0 then
            hash = 0x9C9EFFD8
            request_model_load(hash)
            coords = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(player_ped, -2.0, 0.0, 0.0)
            coords.x = coords['x']
            coords.y = coords['y']
            coords.z = coords['z']
            ped = util.create_ped(28, hash, coords, 30.0)
            if cur_veh ~= last_veh then
                PED.SET_PED_INTO_VEHICLE(ped, last_veh, -1)
            end
            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true);
            PED.SET_PED_FLEE_ATTRIBUTES(ped, 0, false);
            PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true);
            PED.SET_PED_CAN_BE_DRAGGED_OUT(ped, false);
            PED.SET_PED_CAN_BE_KNOCKED_OFF_VEHICLE(ped, false);
            --TASK.TASK_GO_TO_COORD_ANY_MEANS(ped, math.random(1000), math.random(1000), math.random(100), 80.0, 0, true, 262144, 1)
            TASK.TASK_COMBAT_PED(ped, playerped, 0, 16);
            TASK.TASK_VEHICLE_DRIVE_TO_COORD(ped, last_veh, math.random(1000), math.random(1000), math.random(100), 100, 1, ENTITY.GET_ENTITY_MODEL(last_veh), 4, 5, 0)
        end
    end)

    menu.action(npctrolls_root, "Bri'ish mode", {"british"}, "God save the queen.", function(on_click)
        hash = 0x9C9EFFD8
        player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        request_model_load(hash)
        coords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
        coords.x = coords['x']
        coords.y = coords['y']
        coords.z = coords['z']
        for i=1, 5 do
            coords.x = coords['x']
            coords.y = coords['y']
            ped = util.create_ped(28, hash, coords, 30.0)
            PED.SET_PED_AS_ENEMY(ped, true);
            PED.SET_PED_FLEE_ATTRIBUTES(ped, 0, false);
            PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
            WEAPON.GIVE_WEAPON_TO_PED(ped, -1834847097, 0, false, true);
            TASK.TASK_COMBAT_PED(ped, player_ped, 0, 16);
        end
    end)

    menu.action(npctrolls_root, "Tell nearby peds to arrest", {"arrest"}, "Tells nearby peds to arrest the player. Obviously there is no arrest mechanic in GTA:O. So they don\'t actually arrest. But they will try.", function(on_click)
        player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        for k, ped in pairs(peds) do
            if not is_ped_player(ped) then
                NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
                PED.SET_PED_AS_COP(ped, true)
                PED.SET_PED_FLEE_ATTRIBUTES(ped, 0, false);
                PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
                WEAPON.GIVE_WEAPON_TO_PED(ped, 453432689, 0, false, true)
                TASK.TASK_ARREST_PED(ped, player_ped)
            end
        end
    end)

    menu.action(npctrolls_root, "Fill car with peds", {"fillcar"}, "Fills the player\'s car with nearby peds", function(on_click)
        target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        if PED.IS_PED_IN_ANY_VEHICLE(target_ped, true) then
                veh = PED.GET_VEHICLE_PED_IS_IN(target_ped, false);
                success = true
                while VEHICLE.ARE_ANY_VEHICLE_SEATS_FREE(veh) do
                    util.yield()
                    --  sometimes peds fail to get seated, so we will have something to break after 10 attempts if things go south
                    iteration = 0
                    if iteration >= 20 then
                        util.toast("Failed to fully fill vehicle after 20 attempts. Please try again.")
                        success = false
                        iteration = 0
                        break
                    end
                    iteration = iteration + 1
                    nearby_peds = util.get_all_peds()
                    for k,ped in pairs(nearby_peds) do
                        if PED.GET_VEHICLE_PED_IS_IN(ped, false) ~= veh and ENTITY.GET_ENTITY_HEALTH(ped) > 0 and not PED.IS_PED_FLEEING(ped) then
                            --dont touch player peds
                            if(PED.GET_PED_TYPE(ped) > 4) then
                                veh = PED.GET_VEHICLE_PED_IS_IN(target_ped, false);
                                    iteration = iteration + 1
                                    for index = 0, VEHICLE.GET_VEHICLE_MODEL_NUMBER_OF_SEATS(ENTITY.GET_ENTITY_MODEL(veh)) do
                                        if VEHICLE.IS_VEHICLE_SEAT_FREE(veh, index) then
                                            -- i think requesting control and clearing task deglitches the peds
                                            -- this is specifically to counter weird A-posing
                                            -- EDIT: it doesnt. why the fuck do some peds a-pose??? maybe ill find out eventually. oh well.
                                            NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(ped)
                                            TASK.CLEAR_PED_TASKS(ped)
                                            PED.SET_PED_INTO_VEHICLE(ped, veh, index);
                                            PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true);
                                            PED.SET_PED_FLEE_ATTRIBUTES(ped, 0, false);
                                            PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
                                            PED.SET_PED_CAN_BE_DRAGGED_OUT(ped, false);
                                            PED.SET_PED_CAN_BE_KNOCKED_OFF_VEHICLE(ped, false);
                                        end
                                    end
                                break
                            end
                        end
                    end
                end
                if success then
                    util.toast("Every available seat should now be full of peds. If it isn\'t, try spamming this or try again in a bit.")
                end
        else
            util.toast("Player is not in a car :(")
        end
    end)
    --TASK_ARREST_PED(Ped ped, Ped target)

    menu.toggle(menu.player_root(pid), "Dispatch cops for player", {"dispatchcops"}, "Dispatches cops on the player.", function(on)
        ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
        if on then
            PLAYER.SET_DISPATCH_COPS_FOR_PLAYER(ped, true)
        else
            PLAYER.SET_DISPATCH_COPS_FOR_PLAYER(ped, true)
        end
    end)

    menu.toggle(menu.player_root(pid), "Swiss cheese", {"swisscheese"}, "Rains a shit ton of bullets on the player. Anonymously.", function(on)
        if on then
            bullet_rain = true
            bullet_rain_target = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
            bullet_rain_scapegoat = get_random_ped()
        else
            bullet_rain = false
        end
    end)

    menu.click_slider(menu.player_root(pid), "Swiss cheese damage", {"swisscheesedmg"}, "Sets what damage swiss cheese option should do", 0, 1000, 0, 100, function(s)
        swiss_cheese_dmg = s
      end)
end

menu.action(allplayers_root, "Session-wide chat", {"sessionwidechat"}, "Makes everyone in the session except you say something.", function(on_click)
    util.toast("Please type what you want the entire session to say.")
    menu.show_command_box("sessionwidechat ")
end, function(on_command)
    if #on_command > 140 then
        util.toast("That message is too long to show fully! I just saved you from humiliation.")
        return
    end
    for k,p in pairs(players.list(false, true, true)) do
        name = PLAYER.GET_PLAYER_NAME(p)
        menu.trigger_commands("chatas" .. name .. " on")
        chat.send_message(on_command, false, true, true)
        menu.trigger_commands("chatas" .. name .. " off")
    end
end)

menu.action(allplayers_root, "Toast best mug target", {"best mug"}, "Toasts you the player with the most wallet money, so you can mug them nicely.", function(on_click)
    most = 0
    for k,p in pairs(players.list(false, true, true)) do
        cur_wallet = players.get_wallet(p)
        if cur_wallet > most then
            most = p
        end
    end
    if most ~= nil then
        util.toast(PLAYER.GET_PLAYER_NAME(most) .. " has the most money in their wallet ($" .. cur_wallet .. ")")
    else
        util.toast("Couldn\'t find best mug target.")
    end
end)

antioppressor = false
menu.toggle(allplayers_root, "Antioppressor", {"antioppressor"}, "Automatically blows up oppressor mkII\'s", function(on)
    if on then
        antioppressor = true
    else
        antioppressor = false
    end
end, false)

infibounty = false
menu.toggle(allplayers_root, "Infibounty", {"infibounty"}, "Applies $10k bounty to all players, every 60 seconds", function(on)
    if on then
        infibounty = true
    else
        infibounty = false
    end
end, false)

for k,p in pairs(players.list(true, true, true)) do
    set_up_player_actions(p)
end
players.on_join(function(pid)
    set_up_player_actions(pid)
end)

vehicles_thread = util.create_thread(function (thr)
    while true do
        for k,veh in pairs(all_vehicles) do
            if player_cur_car ~= veh and not is_ped_player(VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1)) then
                if vehicle_chaos then
                    VEHICLE.SET_VEHICLE_OUT_OF_CONTROL(veh, false, true)
                    VEHICLE.SET_VEHICLE_FORWARD_SPEED(veh, vc_speed)
                    VEHICLE.SET_VEHICLE_GRAVITY(veh, vc_gravity)
                end
    
                if halt_traffic then
                    VEHICLE.BRING_VEHICLE_TO_HALT(veh, 0.0, -1, true)
                    coords = ENTITY.GET_ENTITY_COORDS(veh, false)
                end
                if ascend_vehicles then
                    VEHICLE.SET_VEHICLE_UNDRIVEABLE(veh, true)
                    VEHICLE.SET_VEHICLE_GRAVITY(veh, false)
                    ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(veh, 4, 5.0, 0.0, 0.0, true, true, true, true)
                end
    
                if vehicle_fuckup then
                    VEHICLE.SET_VEHICLE_DAMAGE(veh, math.random(-5.0, 5.0), math.random(-5.0, 5.0), math.random(-5.0,5.0), 200.0, 10000.0, true)
                end
    
                if godmode_vehicles then
                    ENTITY.SET_ENTITY_CAN_BE_DAMAGED(veh, false)
                end
    
                if disable_veh_colls then
                    util.toast("yes")
                    VEHICLE._DISABLE_VEHICLE_WORLD_COLLISION(veh);
                end
    
                if vehicle_rainbow then
                    VEHICLE.SET_VEHICLE_CUSTOM_PRIMARY_COLOUR(veh, rgb[1], rgb[2], rgb[3])
                    VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(veh, rgb[1], rgb[2], rgb[3])
                    for i=0, 3 do
                        VEHICLE._SET_VEHICLE_NEON_LIGHT_ENABLED(veh, i, true)
                    end
                    VEHICLE._SET_VEHICLE_NEON_LIGHTS_COLOUR(veh, rgb[1], rgb[2], rgb[3])
                    VEHICLE.SET_VEHICLE_LIGHTS(veh, 2)
                end
    
                if no_radio then
                    AUDIO.SET_VEHICLE_RADIO_ENABLED(veh, false);
                end
    
                if loud_radio then
                    AUDIO.SET_VEHICLE_RADIO_LOUD(veh, true)
                end
            end
        end
        util.yield()
    end
end)

peds_thread = util.create_thread(function (thr)
    while true do
        for k,ped in pairs(all_peds) do
            if not is_ped_player(ped) then
                if play_ped_ringtones then
                    AUDIO.PLAY_PED_RINGTONE("Dial_and_Remote_Ring", ped, true)
                end
    
                if dumb_peds then
                    PED.SET_PED_HIGHLY_PERCEPTIVE(ped, false)
                    PED.SET_PED_ALERTNESS(ped, 0)
                    PED.SET_PED_FLEE_ATTRIBUTES(ped, 0, false);
                end
    
                if peds_arrest_player then
                    TASK.TASK_ARREST_PED(ped, arrest_target)
                end
    
                if deaf_peds then
                    PED.SET_PED_HEARING_RANGE(ped, 0.0)
                end
    
                if safe_peds then
                    PED.GIVE_PED_HELMET(ped, true, 4096, 0)
                end
            end
        end
        util.yield()
    end
end)

players_thread = util.create_thread(function (thr)
    while true do
        for k,pid in pairs(all_players) do
            if antioppressor then
                local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
                local vehicle = PED.GET_VEHICLE_PED_IS_IN(ped, false)
                if vehicle then
                  local hash = util.joaat("oppressor2")
                  if VEHICLE.IS_VEHICLE_MODEL(vehicle, hash) then
                    menu.trigger_commands("explode".. PLAYER.GET_PLAYER_NAME(pid))
                  end
                end
            end
        end    
        util.yield()
    end
end)

while true do

    if vehicle_uses > 0 then
        if show_updates then
            util.toast("Vehicle pool is being updated")
        end
        all_vehicles = util.get_all_vehicles()
    end
    if player_uses > 0 then
        if show_updates then
            util.toast("Player pool is being updated")
        end
        all_players = players.list(true, true, true)
    end
    if ped_uses > 0 then
        if show_updates then
            util.toast("Ped pool is being updated")
        end
        all_peds = util.get_all_peds()
    end
    if object_uses > 0 then
        if show_updates then
            util.toast("Object pool is being updated")
        end
        all_objects = util.get_all_objects()
    end

    player_cur_car = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()))
    
    if hud_rainbow then
        for i=0,215 do
            HUD.REPLACE_HUD_COLOUR_WITH_RGBA(i, rgb[1], rgb[2], rgb[3], 255)
        end
    end

    if player_cur_car then
        if everythingproof then
            ENTITY.SET_ENTITY_PROOFS(player_cur_car, true, true, true, true, true, true, true, true)
        end
    end

    if cont_clear then
        clear_area(clear_radius)
    end
    if entity_reap then
        entity_reaper()
    end

    if bullet_rain then
        target = ENTITY.GET_ENTITY_COORDS(bullet_rain_target)
        MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(target['x'], target['y'], target['z'], target['x'], target['y'], target['z']+0.1, swiss_cheese_dmg, true, 100416529, bullet_rain_scapegoat, true, false, 100.0)
    end
	util.yield()
end