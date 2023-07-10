util.require_natives("1663599433")

local all_data_dir = filesystem.store_dir() .. "\\anim8"
if not filesystem.exists(all_data_dir) then
    filesystem.mkdir(all_data_dir)
end

-- load anims 
local all_anims_path = all_data_dir .. '\\all_anims.txt'
local installing_anims = false
if not filesystem.exists(all_anims_path) then 
    installing_anims = true
    async_http.init('gist.githubusercontent.com', '/xSetrox/dcf6d87a273353373da0d810d93ff437/raw', function(data)
        local file = io.open(all_anims_path, 'w')
        file:write(data)
        file:close()
        installing_anims = false
    end, function()
        util.toast("Could not install anim data. Stopping script.")
        util.stop_script()
    end)
    async_http.dispatch()
end

while installing_anims do 
    util.toast("Installing animation data, please wait...")
    util.yield()
end

local fp = io.open(all_anims_path, "r")
if not fp then
    util.toast("Error opening anims data. The script will now stop.")
    util.stop_script()
    return
end

local all_anims = {}
for l in io.lines(all_anims_path) do
    all_anims[#all_anims+1] = l
end

-- load scenarios 
-- https://gist.github.com/xSetrox/edbd91cf2faaa11761bf5de0e9e394e3/raw

local all_scenarios_path = all_data_dir .. '\\all_scenarios.txt'
local installing_scenarios = false
if not filesystem.exists(all_scenarios_path) then 
    installing_scenarios = true
    async_http.init('gist.githubusercontent.com', '/xSetrox/edbd91cf2faaa11761bf5de0e9e394e3/raw', function(data)
        local file = io.open(all_scenarios_path, 'w')
        file:write(data)
        file:close()
        installing_scenarios = false
    end, function()
        util.toast("Could not install scenarios data.")
    end)
    async_http.dispatch()
end

while installing_scenarios do 
    util.toast("Installing scenario data, please wait...")
    util.yield()
end

local fp = io.open(all_scenarios_path, "r")
if not fp then
    util.toast("Error opening scenario data. The script will now stop.")
    util.stop_script()
    return
end

local all_scenarios = {}
for l in io.lines(all_scenarios_path) do
    all_scenarios[#all_scenarios+1] = l
end

local anim_search_result_dicts = {}
local anim_search_result_anim_names = {}
local scenario_search_results = {}

local function request_anim_dict(dict)
    while not STREAMING.HAS_ANIM_DICT_LOADED(dict) do
        util.toast("Loading anim...")
        STREAMING.REQUEST_ANIM_DICT(dict)
        util.yield()
    end
end

local function stop()
    TASK.CLEAR_PED_TASKS_IMMEDIATELY(players.user_ped())
end

local function search_for_anim_by_name(query, search_dict)
    local found = false
    search_result_dics = {}
    anim_search_result_anim_names = {}
    for _, v in pairs(all_anims) do
        local dict, anim_name = string.partition(v, ' ')
        if (search_dict and string.contains(dict, string.lower(query))) or (not search_dict and string.contains(anim_name, string.lower(query))) then 
            anim_search_result_dicts[#anim_search_result_dicts+1] = dict 
            anim_search_result_anim_names[#anim_search_result_anim_names+1] = anim_name
            found = true
        end
        util.toast("Searching, please wait.")   
    end
    return found
end

local function search_for_scenario(query)
    local found = false
    scenario_search_results = {}
    for _, v in pairs(all_scenarios) do
        if string.contains(string.lower(v), string.lower(query)) then
            scenario_search_results[#scenario_search_results+1] = v
            found = true
        end
        util.toast("Searching, please wait.")   
    end
    return found
end


local main_root = menu.my_root()
main_root:divider("Animations")

local anim_search_result_list = 0
local scenario_search_result_list = 0

main_root:action("Search by anim dict (recommended)", {"searchanimdict"}, "", function(on_click)
    menu.show_command_box("searchanimdict ")
end, function(search)
    local search = search_for_anim_by_name(search, true)
    if search then 
        menu.set_list_action_options(anim_search_result_list, anim_search_result_anim_names)
        menu.trigger_command(anim_search_result_list)
        menu.set_visible(anim_search_result_list, true)
    else
        util.toast("No results :(")
        menu.set_visible(anim_search_result_list, false)
    end
end)

main_root:action("Search by anim name", {"searchanimname"}, "", function(on_click)
    menu.show_command_box("searchanimname ")
end, function(search)
    local search = search_for_anim_by_name(search, false)
    if search then 
        menu.set_list_action_options(anim_search_result_list, anim_search_result_anim_names)
        menu.trigger_command(anim_search_result_list)
        menu.set_visible(anim_search_result_list, true)
    else
        util.toast("No results :(")
        menu.set_visible(anim_search_result_list, false)
    end
end)

-- anims settings
local blend_in_speed = 8.0
local blend_out_speed = 8.0
local playback_rate = 0.0
local anim_flags = {0, 1, 2, 16, 32, 120}
local anim_flag = 0
local lock_x = false 
local lock_y = false 
local lock_z = false 
-- scenarios settings
local scen_play_enter_anim = true 
anim_search_result_list = main_root:list_action("Animation search results", {"animsearchresults"}, "", anim_search_result_anim_names, function(index, value)
    local dict = anim_search_result_dicts[index]
    local anim_name = value
    stop()
    request_anim_dict(dict)
    should_lock_z = lock_z
    if lock_z and not util.is_session_started() then 
        should_lock_z = false 
    end
    TASK.TASK_PLAY_ANIM(players.user_ped(), dict, anim_name, blend_in_speed, blend_out_speed, -1, anim_flag, playback_rate, lock_x, lock_y, should_lock_z)
end)

main_root:divider("Scenarios")
main_root:action("Search", {"searchscenario"}, "", function(on_click)
    menu.show_command_box("searchscenario ")
end, function(search)
    local search = search_for_scenario(search)
    if search then 
        menu.set_list_action_options(scenario_search_result_list, scenario_search_results)
        menu.trigger_command(scenario_search_result_list)
        menu.set_visible(scenario_search_result_list, true)
    else
        util.toast("No results :(")
        menu.set_visible(scenario_search_result_list, false)
    end
end)

scenario_search_result_list = main_root:list_action("Scenario search results", {"scenariosearchresults"}, "", scenario_search_results, function(index, value)
    stop()
    TASK.TASK_START_SCENARIO_IN_PLACE(players.user_ped(), value, 0, scen_play_enter_anim)
end)


main_root:divider("Misc")
local settings_root = main_root:list("Settings", {}, "")
settings_root:divider("Animations")


settings_root:slider_float("Blend-in speed", {"blendinspeed"}, "", 0, 2000, 800, 1, function(s)
    blend_in_speed = s*0.1
end)


settings_root:slider_float("Blend-out speed", {"blendoutspeed"}, "", 0, 2000, 800, 1, function(s)
    blend_out_speed = s*0.01
end)


settings_root:slider_float("Playback rate", {"playbackrate"}, "", 0, 100, 0, 1, function(s)
    playback_rate = s*0.1
end)

settings_root:list_select("Animation flag", {"animflag"}, "", {"Normal", "Repeat", "Stop last frame", "Upper body", "Enable player control", "Cancelable"}, 1, function(index, value)
    anim_flag = anim_flags[index]
end)


settings_root:toggle("Lock X", {"lockx"}, "", function(on)
    lock_x = on
end)


settings_root:toggle("Lock Y", {"locky"}, "", function(on)
    lock_y = on
end)


settings_root:toggle("Lock Z", {"lockz"}, "", function(on)
    lock_z = on
end)

settings_root:divider("Scenarios")
settings_root:toggle("Play enter anim", {"playscenenteranim"}, "", function(on)
    scen_play_enter_anim = on
end, true)

menu.set_visible(anim_search_result_list, false)
menu.set_visible(scenario_search_result_list, false)

menu.action(menu.my_root(), "Stop everything", {"stopanim"}, "", function()
    stop()
end)

async_http.init("pastebin.com", "/raw/nrMdhHwE", function(result)
    menu.hyperlink(menu.my_root(), "Join discord", result, "")
end)
async_http.dispatch()



util.keep_running()