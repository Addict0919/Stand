util.require_natives("1651208000")
util.keep_running()
local player = players.user_ped()
local agroup = "missfbi3ig_0"
local anim = "shit_loop_trev"
local mshit = util.joaat("prop_big_shit_02")
local rshit = util.joaat("prop_big_shit_01")

list = menu.list(menu.my_root(), "Poop", {"lpoop"}, "Poo list", function(); end)

menu.action(list, "Massive shit", {"mshit"}, "Make a massive shit", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(1000)
    entities.create_object(mshit, c)
end)

menu.action(list, "Normal shit", {"nshit"}, "Make a normale sized shit", function()
    local c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
    c.z = c.z -1
    while not STREAMING.HAS_ANIM_DICT_LOADED(agroup) do 
        STREAMING.REQUEST_ANIM_DICT(agroup)
        util.yield()
    end
    TASK.TASK_PLAY_ANIM(player, agroup, anim, 8.0, 8.0, 3000, 0, 0, true, true, true)
    util.yield(1000)
    entities.create_object(rshit, c)
end)

--What am I doing with my life