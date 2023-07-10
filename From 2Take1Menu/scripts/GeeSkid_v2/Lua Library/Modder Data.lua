local mddrs  = {}
mddrs.ver_text = "Gee-Skid v2.02"

mddrs.otr_flag = player.add_modder_flag("OTR > 3 Min")
mddrs.high_kd_flag = player.add_modder_flag("High K/D")
mddrs.neg_kd_flag = player.add_modder_flag("Negative K/D")
mddrs.high_money_flag = player.add_modder_flag("High $")
mddrs.high_rank_flag = player.add_modder_flag("High rank")
mddrs.god_flag = player.add_modder_flag("God-Mode")
mddrs.undead_flag = player.add_modder_flag("Un-Dead")
	
mddrs.str = {}
mddrs.str_is_int = {}
mddrs.list={}
--thank you toph
local flag = 1
while flag < player.get_modder_flag_ends() do
	mddrs.list[flag]=player.get_modder_flag_text(flag)
	mddrs.str[#mddrs.str+1]=player.get_modder_flag_text(flag)
	mddrs.str_is_int[player.get_modder_flag_text(flag)]=flag
    flag = flag * 2
end

return mddrs
