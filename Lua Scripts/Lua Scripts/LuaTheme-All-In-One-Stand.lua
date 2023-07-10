-- All lua theme in one place - V0.6
-- Might have somme issues, to customize it change all the variables below (search for the theme you want to modify..)
-- By CocoW#3060

local defaultheme = "default" --better than list for default, put the default theme you want (look name in the list below)

--themes list
local theme = {{0, "default"},{1, "2stand1"},{2, "2take1"},{3, "paragon"},{4, "cherax"},{5, "luna"},{6, "ozark"},{7, "xcheat"},{8, "impulse"},{9, "rebound"},{10, "standipity"},{11, "stanggy"},{12, "zanium"},{13, "deathride"},{14, "modern"},{15, "futur"},{16, "iphone"},{17, "s20"},{18, "ipad"},{19, "fold"},{20, "standwatch"},{21, "stand3310"},{22, "switch"},{23, "wii"},{24, "dslite"},{25, "dsi"},{26, "standfridge"},{27, "discord"},{28, "guilded"},{29, "windows11"},{30, "sfr"}}

util.require_natives("1606100775")
local currentheme = defaultheme
local themedirectory = "theme_textures"

--help text
util.show_corner_help("To make a theme as default : go in the lua and change the first variable with the name of the theme you want.")

--profile pic 
local profile_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/profile.png")

--some theme var 
local bt_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/footer_arrows.png") --bottom arrow in paragon / ozark / and other

--2take1 / 2stand1 var
local max_show_options = 14
local head_opacity = 0.75
local header_size = 0.0348
local header_size_show = 348
local header_posX  = 0.0005
local header_posY = 0.0695
local bg_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 0.75}
local btbar_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local bttxt_colours1 = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
local bttxt2 = "2.69.0"  --bottom text
local bttxt_colours2 = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
local btline_colours1 = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
local btline_colours2 = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
local topline_colours1 = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
local topline_colours2 = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
if menu.get_edition() == 0 then currentedition = "Free" end
if menu.get_edition() == 1 then currentedition = "Basic" end
if menu.get_edition() == 2 then currentedition = "Regular" end
if menu.get_edition() == 3 then currentedition = "Ultimate" end
if currentheme == "2take1" then
	header_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/header_2t1.png")
	header_size = 0.0348
	header_posY = 0.0695
	header_posX = 0.0005
	bttxt1 = "2Take1Menu "..currentedition  --bottom text
end
if currentheme == "2stand1" then
	header_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/header_2s1.png" )
	header_size = 0.0311
	header_posY = 0.0618
	header_posX = 0
	bttxt1 = "2Stand1Menu "..currentedition  --bottom text
end


--paragon var
local cr_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/para_corner_line.png")
local cri_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/para_corner_inside.png")
local max_show_options = 14 --Default Max options (change here to make default)
local height = 0.08 
local pbg_colour = {["r"] = 0.117,["g"] = 0.125,["b"] = 0.129,["a"] = 1.0}
local select_colour = {["r"] = 0.333,["g"] = 0.337,["b"] = 0.347,["a"] = 1.0}
local line_colours = {["r"] = 0.309,["g"] = 0.603,["b"] = 0.964,["a"] = 1.0}

--cherax var
local ch_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/header1.png") 
local cbg_colour = {["r"] = 0.050,["g"] = 0.003,["b"] = 0.082,["a"] = 1.0}
local head_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
local headbar_right_colour = {["r"] = 0.439,["g"] = 0.137,["b"] = 0.886,["a"] = 1.0}

--luna var
local lheader_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/header_luna1.PNG")
local size_head = 0.0532
local max_show_options = 12
local lbg_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 0.65}
local lbtbar_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local topsep_1_colours = {["r"] = 0.992,["g"] = 0.670,["b"] = 0.364,["a"] = 1.0}
local topsep_2_colours = {["r"] = 0.301,["g"] = 0.749,["b"] = 0.788,["a"] = 1.0}
local btsep_1_colours = {["r"] = 0.992,["g"] = 0.670,["b"] = 0.364,["a"] = 1.0}
local btsep_2_colours = {["r"] = 0.301,["g"] = 0.749,["b"] = 0.788,["a"] = 1.0}
local lbttxt = "v3.0"  --bottom text default
local lbttxt_posX = 0.18 --bottom text position default x 
local lbttxt_colours = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}

--ozark var
local ohead_text = "ØZARK" --Default text header
local osize_head = 0.052 -- Default header image size
--Default Max options (change here to make default)
local omax_show_options = 12
--Default rgb state (false disabled / true enabled) 
local orgb = false
local ocursor_info = true --defaut show cursor position (true = show / false = hide)
--Default color background
local obg_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 0.8}
--Default color header
local ohead_colour = {["r"] = 0.298,["g"] = 0.145,["b"] = 1.0,["a"] = 1.0}
--Default text color header
local ohead_txt_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
--Default bar color header
local ohead_bar_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
--Default color bottom bar
local obtbar_colour = {["r"] = 0.298,["g"] = 0.145,["b"] = 1.0,["a"] = 1.0}

--xcheat var
local head_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/xch_header.png")
local xtheme = 1 --Default theme (change to 1 for XCheats and 2 for XStand)
if xtheme == 1 then 
	head_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/xch_header.png")
end
if xtheme == 2 then  
	head_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/xch_header_stand.png")
end
local xbg_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local select_colours = {["r"] = 0.5,["g"] = 0.5,["b"] = 0.5,["a"] = 1.0}		
local text_offset = 0.1 --default text posX

--standipity var
local syhead_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/header_txt.png") --  file
--Default color background
local sybg_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 0.4}
--Default color top bar
local sytopbar_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 0.75}
--Default color bottom bar
local sybtbar_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 0.75}
local sybttxt1 = "Created by CocoW"  --bottom text
--Default bottom text color
local sybttxt_colours1 = {["r"] = 0.8,["g"] = 0.8,["b"] = 0.8,["a"] = 1.0}
--Default top line colours
local sylines_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}

--Stanggy var
--Default color background
local ggbg_colour1 = {["r"] = 0.03,["g"] = 0.0,["b"] = 0.1,["a"] = 0.9}
--Default color background (annimated)
local ggbg_colour2 = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.050,["a"] = 0.8}
local ggmaintxt = "Stanggy Menu 0.71"  --top text
--Default top text color
local ggtptxt_colours1 = {["r"] = 1.0,["g"] = 0.05,["b"] = 1.0,["a"] = 1.0}
local ggtptxt1 = "By CocoW"  --top text
--Default top text color
local ggstptxt_colours1 = {["r"] = 0.0,["g"] = 0.0,["b"] = 1.0,["a"] = 1.0}

--zanium var
local zbg_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/zbg.png")
local zlg_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/zlogo.png")
local zhead_txt = "STAND TRAINER"
local zposx_txt = 0.03
local zhsize_txt = 0.9
--Default text head color
local zheadtxt_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
--Default text head color
local zbg_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
--Default text head color
local zlg_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
--Default cmd top color
local zbcmd_colour = {["r"] = 1.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}

--deathrider var 
local dbg_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/background.png") --  file 
local dbg_op = 0.9
local dhtxt = "Death Rider"  --head text
local dbttxt1 = "Created by CocoW"  --bottom text under header
local dbttxt2 = "Stand menu"  --bottom text 
--Default bottom text color
local dtxt_colours = {["r"] = 0.8,["g"] = 0.8,["b"] = 0.8,["a"] = 1.0}
--Default top line colours
local dlines_colours = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0
}

--modern var
local mhead_text = "Stand.gg" --Text header
--Default color background
local mbg_colour = {["r"] = 0.784,["g"] = 0.674,["b"] = 0.580,["a"] = 1.0}
--Default color header
local mhead_colour = { ["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
--Default text color header
local mhead_txt_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
--Default color clock
local mclk_bg_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
--Defaut color clock text
local mclk_txt_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}

--futur var
local fmain_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/main.png") 
local ftp_circ_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/top_circle.png" ) 
local fbt_circ_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/btbar_circle.png" )
--Default rotation
local frotation = 0.0
local fintensity = 0.01

--standphone var
local fw_iphone_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/frame_iphone_white.png") -- iphone frame
local fw_s21_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/frame_s21_white.png") -- s21 frame
local wp_home_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/wallpaper_home.jpg") 
local wp_lock_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/wallpaper_lock.jpg") 
local hwp_posX = 0.0748 -- default X postion wallpaper home
local hwp_posY = 0.258  -- default Y postion wallpaper home 
local lwp_posX = 0.0748 -- default X postion wallpaper lockscreen
local lwp_posY = 1.07   -- default Y postion wallpaper lockscreen
local sbtxt ="6G+" --Default status bar text
--Default status bar text color
local sb_txt_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
--Default status bar clock color
local sb_clk_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local size_wlhome = 0.075 --Default wallpaper size
local lc_lefttxt ="Stand" --Default lockscreen left status bar text
--Default lockscreen status bar left text color
local lc_lefttxt_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local lc_rightxt ="6G+" --Default lockscreen right status bar text
--Default lockscreen status bar right text color
local lc_rightxt_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}	
--Default lockscreen clock color
local lc_clk_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local size_wlovlay = 0.075 --Default overlay wallpaper size

--standpad var
local fw_ipad_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/frame_ipad_white.png") -- ipad frame
local fw_fold_open_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/frame_fold_open.png") -- fold frame
local wp_fold_closed_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/frame_fold_dark_closed.png") -- fold frame closed (can't change background/wallpaper atm)
local pwp_home_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/tab_wallpaper_home.jpg") -- homscreen wallpaper
local wp_ipad_lock_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/ipad_wallpaper_lockscreen.jpg") -- lockscreen wallpaper ipad
local wp_fold_lock_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/wallpaper_lock2.png") -- lockscreen wallpaper fold
local phwp_posX = 0.0948 -- default X postion wallpaper home
local phwp_posY = 0.238  -- default Y postion wallpaper home 
local lwp_ipad_posX = 0.1505 -- default X postion wallpaper lockscreen ipad
local lwp_ipad_posY = 1.22   -- default Y postion wallpaper lockscreen ipad
local lwp_fold_posX = 0.07 -- default X postion wallpaper lockscreen fold
local lwp_fold_posY = 1.03   -- default Y postion wallpaper lockscreen fold
--Default status bar text color
local psb_txt_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
--Default status bar clock color
local psb_clk_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local psize_wlhome = 0.1505 --Default wallpaper size
local plc_lefttxt ="Stand" --Default lockscreen left status bar text
--Default lockscreen status bar left text color
local plc_lefttxt_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}

local plc_rightxt ="6G+" --Default lockscreen right status bar text
local plc_rightxt_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}		
--Default fold lockscreen clock color
local lc_clk_colours_fold = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}

--Default ipad lockscreen clock color
local lc_clk_colours_ipad = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local size_ipad_wlovlay = 0.1505 --Default overlay wallpaper size
local size_fold_wlovlay = 0.06 --Default overlay wallpaper size

--standwatch var
local face = 1 --default watch face
local fw_wt_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/Frame_Watch.png") --  frame
local wp_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/Wallpaper_Watch.jpg") -- wallpaper default
local whwp_posX = 0.04 -- default X postion wallpaper home
local whwp_posY = 0.08  -- default Y postion wallpaper home 
local wlwp_posX = 0.04 -- default X postion wallpaper lockscreen
local wlwp_posY = 0.93   -- default Y postion wallpaper lockscreen
local wsize_wlhome = 0.057 --Default wallpaper size
local wsize_wlovlay = 0.057 --Default overlay wallpaper size
--Default clock color
local wclk_colours = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}
local wclk_posX = 0.038 --default pos X
--Default lockscreen clock color
local wlc_clk_colours = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}

--stand3310 var
local nfw_test_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/Frame_nokia.png") -- 3310 frame
--Default clock color
local nclk_colours = {["r"] = 0.2,["g"] = 0.8,["b"] = 0.2,["a"] = 1.0}
--Default lockscreen clock color
local nlc_clk_colours = {["r"] = 0.2,["g"] = 0.8,["b"] = 0.2,["a"] = 1.0}

--standDs var
local dsi_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/Frame_Dsi.png") -- frame 1
local dsl_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/Frame_Dsl.png") -- frame 2
local wpl_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/wallpaper1_ds.png") -- wallpaper1 bottom
local wp2_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/wallpaper2_ds.jpg") -- wallpaper2 top
local wp1_posX = 0.015 -- default X postion wallpaper1 bottom
local wp1_posY = 0.025  -- default Y postion wallpaper1 bottom
local wp2_posX = 0.015 -- default X postion wallpaper2 t0p
local wp2_posY = 0.3   -- default Y postion wallpaper2 top
--Default clock color
local dsclk_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local dstoptxt =  "Stand" --Default text
--Default text color
local dstxt_colours = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
-- Default wallpapers size
local size_btwl = 0.08
local size_topwl = 0.08		

--standfridge var
local f_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/f_closed.png") -- fridge frame
local fol_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/f_openleft.png") -- fridge openned left frame
local f_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0} --fridge default colour
--Default clock color
local fclk_colours = {["r"] = 1.0,["g"] = 0.0,["b"] = 1.0,["a"] = 1.0}

--windows11 var 
local prof_size = 0.01 --default profile pic size
local profile_name = PLAYER.GET_PLAYER_NAME(players.user()) --get current player name
local wbg_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/bg_w11.png") 
local profilename_color = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}-- default line below addess bar colour
local wbg_c = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}-- default window colour
local line_color = {["r"] = 0.247,["g"] = 0.282,["b"] = 0.8,["a"] = 1.0}	-- default line below addess bar colour
local winame_color = {["r"] = 0.5,["g"] = 0.5,["b"] = 0.5,["a"] = 1.0}	-- default line below addess bar colour
local window_name = "Stand" --default window name 		

--rebound var
local rbheader_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/rebound.bmp")
local rsize_head = 0.0418 --header size
local rmax_show_options = 14 --Default Max options (change here to make default)
local rheight = 0.01 
local rpbg_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local rbars_colour = {["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
local rselect_colour = {["r"] = 1.0,["g"] = 0.478,["b"] = 0.223,["a"] = 1.0}

--switch var
local sw_frame = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/switch_frame.png") -- switch frame
local swp_home_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/switch_wallpaper.jpg" ) -- homscreen wallpaper
local shwp_posX = 0.06 -- default X postion wallpaper home
local shwp_posY = 0.1 -- default Y postion wallpaper home 
local ssize_wlhome = 0.12 --Default wallpaper size

--discord var
local dcprof_size = 0.008 --default profile pic size
local dcprofile_name = PLAYER.GET_PLAYER_NAME(players.user()) --get current player name
local dcbg_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/discord_bg.bmp")  --discord background
local dccmd_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/discord_cmd.bmp")  --discord cmd search 
local dcprofilenametext_color = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}-- default profile colour
local dcprofileimage_color = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0} --default window colour
local dcbg_c = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0} --default window colour
local dciname_color = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}	-- default name colour
local dcwindow_name = "Stand" --default window name 		

--guilded var
local gprof_size = 0.008 --default profile pic size
local gprofile_name = PLAYER.GET_PLAYER_NAME(players.user()) --get current player name
local gbg_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/guilded_bg.bmp")  --guilded background
local gcmd_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/guilded_cmd.bmp")  --guilded cmd search 
local gprofilenametext_color = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}-- default profile colour
local gprofileimage_color = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0} --default window colour
local gbg_c = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0} --default window colour
local giname_color = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}	-- default name colour
local gwindow_name = "Stand" --default window name 		

--wii var (thx QuickNET#9999 for the wii background)
local tv_frame = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/tv_frame.png") -- tv frame
local wii_home_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/wii_bg.png" ) -- homscreen wallpaper
local wii_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/wii.png" ) -- wii
local wiiu_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/wiiu_bg.png" ) -- wii u
local wiihwp_posX = 0.09 -- default X postion wallpaper home
local wiihwp_posY = 0.069 -- default Y postion wallpaper home 
local wiisize_wlhome = 0.15 --Default wallpaper size

--sfr var
local sfrbg_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/SFRMeme_bg.png")
local sfrbg_size = 0.11
local sfrbg_colour = {["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}

--impulse var
local imp_logo_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/implogo.png")
local imp_size_head = 0.05 --header size
local imp_max_show_options = 14 --Default Max options (change here to make default)
local imp_bars_colour = {["r"] = 0.027,["g"] = 0.043,["b"] = 0.058,["a"] = 1.0}
local imp_select_colour = {["r"] = 0.078,["g"] = 0.607,["b"] = 0.643,["a"] = 1.0}

GenerateFeatures = function()
    menu.divider(menu.my_root(), "Lua Theme Settings")
	menu.slider(menu.my_root(), "Default Theme", {"defaultheme"}, "Click to set default lua theme that you want to have (might lag a lot) and verify/save your Stand state.", 1, 30, 0, 1, function(themenum)
		defaultheme = theme[themenum][2]
		menu.trigger_commands("luatheme"..defaultheme)
		util.toast("The default theme is now "..defaultheme)
	end)
	local themelist = menu.list(menu.my_root(), "Lua theme list", {"selectheme"}, "List of all lua theme made by CocoW.")
	for i,v in pairs(theme) do
		menu.action(themelist, v[2],{"luatheme"..v[2]}, "", function()
			currentheme = v[2]
			
			if currentheme == "default" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabswidth 110")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment left")
				menu.trigger_commands("commandinfotextposition belowtabs")
				menu.trigger_commands("menuheight 11")
				menu.trigger_commands("cursorpadding 2")
				menu.trigger_commands("menuwidth 450")
				menu.trigger_commands("blur 4")
				menu.trigger_commands("spacersize 3")
				menu.trigger_commands("primary FF00FF")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("background 00000066")
				menu.trigger_commands("notifybg 00000066")
				menu.trigger_commands("notifyflash FF00FF")
				menu.trigger_commands("notifyborder FF00FF")
				menu.trigger_commands("bigtextscale 15")
				menu.trigger_commands("bigtextxoffset -2")
				menu.trigger_commands("bigtextyoffset 2")
				menu.trigger_commands("smalltextscale 12")
				menu.trigger_commands("smalltextxoffset -2")
				menu.trigger_commands("smalltextyoffset 1")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if (currentheme == "2stand1" or currentheme == "2take1") then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("header hide")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabswidth 62")
				menu.trigger_commands("tabsposition top")
				menu.trigger_commands("tabsalignment centre")
				menu.trigger_commands("menuheight 12")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("commandinfotextposition left")
				menu.trigger_commands("menuwidth 434")
				menu.trigger_commands("spacersize 1")
				menu.trigger_commands("primary FFFFFFFF")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("notifybg 00000088")
				menu.trigger_commands("notifyflash FFFFFFFF")
				menu.trigger_commands("notifyborder FFFFFFFF")
				menu.trigger_commands("bigtextscale 11")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 3")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "2take1" then
				header_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/header_2t1.png")
				header_size = 0.0348
				header_posY = 0.0695
				header_posX = 0.0005
				bttxt1 = "2Take1Menu "..currentedition  --bottom text
			end
			if currentheme == "2stand1" then
				header_tex = directx.create_texture(filesystem.scripts_dir() ..themedirectory.."/header_2s1.png" )
				header_size = 0.0311
				header_posY = 0.0618
				header_posX = 0
				bttxt1 = "2Stand1Menu "..currentedition  --bottom text
			end
			if currentheme == "paragon" then
				menu.trigger_commands("header custom")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 20")
				menu.trigger_commands("cursorpos on")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("menuheight 14")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("cursorborderwidth 2")
				menu.trigger_commands("cursorborder 4F9AF6FF")
				menu.trigger_commands("menuwidth 400")
				menu.trigger_commands("commandinfotextposition left")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 7")				
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("background 1E2021FF")
				menu.trigger_commands("notifybg 1e2021")
				menu.trigger_commands("notifyflash 4E99F5FF")
				menu.trigger_commands("notifyborder 4E99F5FF")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset -1")
				menu.trigger_commands("bigtextyoffset 5")
				menu.trigger_commands("smalltextscale 13")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")	
			end
			if currentheme == "cherax" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 25")
				menu.trigger_commands("cursorpos on")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabswidth 92")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment left")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 9")
				menu.trigger_commands("menuwidth 484")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 0")
				menu.trigger_commands("primary 7023E2FF")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext 3904FFFF")
				menu.trigger_commands("unfocusedrighttext 3904FFFF")
				menu.trigger_commands("unfocusedtexture 3904FFFF")
				menu.trigger_commands("background 0D0115FF")
				menu.trigger_commands("notifybg 0D0115FF")
				menu.trigger_commands("notifyflash 7023E2FF")
				menu.trigger_commands("notifyborder 7023E2FF")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 3")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset -4")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "luna" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 25")
				menu.trigger_commands("cursorpos on")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition left")
				menu.trigger_commands("menuheight 12")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("menuwidth 400")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 2")
				menu.trigger_commands("primary 000000FF")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 00000088")
				menu.trigger_commands("notifyflash 55b9cb")
				menu.trigger_commands("notifyborder f3ad72")
				menu.trigger_commands("bigtextscale 11")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset 0")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "ozark" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition left")
				menu.trigger_commands("menuheight 12")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("menuwidth 400")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 8")
				menu.trigger_commands("primary 4C25FFFF")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 00000088")
				menu.trigger_commands("notifyflash 4C25FFFF")
				menu.trigger_commands("notifyborder 4C25FFFF")
				menu.trigger_commands("bigtextscale 12")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 3")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "xcheat" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 23")
				menu.trigger_commands("cursorpos on")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition left")
				menu.trigger_commands("menuheight 12")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 346")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 7")
				menu.trigger_commands("primary 969696FF")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("background 000000FF")
				menu.trigger_commands("notifybg 000000FF")
				menu.trigger_commands("notifyflash 969696FF")
				menu.trigger_commands("notifyborder 969696FF")
				menu.trigger_commands("bigtextscale 13")
				menu.trigger_commands("bigtextxoffset -1")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "standipity" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 20")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("menuwidth 400")
				menu.trigger_commands("spacersize 30")
				menu.trigger_commands("primary 000000FF")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 00000055")
				menu.trigger_commands("notifyflash 000000FF")
				menu.trigger_commands("notifyborder 000000FF")
				menu.trigger_commands("bigtextscale 12")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("smalltextxoffset 5")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "stanggy" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 25")
				menu.trigger_commands("cursorpadding 3")
				menu.trigger_commands("menuwidth 384")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 8")
				menu.trigger_commands("primary 0000FFFF")
				menu.trigger_commands("focustext FF96FFFF")
				menu.trigger_commands("focusrighttext FF96FFFF")
				menu.trigger_commands("focustexture FF96FFFF")
				menu.trigger_commands("unfocusedtext FF96FFFF")
				menu.trigger_commands("unfocusedrighttext FF96FFFF")
				menu.trigger_commands("unfocusedtexture FF96FFFF")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 1a112699")
				menu.trigger_commands("notifyflash 0000FFFF")
				menu.trigger_commands("notifyborder 0000FFFF")
				menu.trigger_commands("bigtextscale 13")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 6")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 5")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "zanium" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment left")
				menu.trigger_commands("tabswidth 80")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 9")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("menuwidth 300")
				menu.trigger_commands("spacersize 4")
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext FF0000FF")
				menu.trigger_commands("focustexture FF0000FF")
				menu.trigger_commands("focusrighttext FF0000FF")
				menu.trigger_commands("unfocusedtext FFABAFFF")
				menu.trigger_commands("unfocusedtexture FFABAFFF")
				menu.trigger_commands("unfocusedrighttext FFABAFFF")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 00000077")
				menu.trigger_commands("notifyflash FF0000FF")
				menu.trigger_commands("notifyborder FF0000FF")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 3")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset 0")
				menu.trigger_commands("smalltextyoffset 5")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "deathride" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 35")
				menu.trigger_commands("cursorpos on")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 8")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 400")
				menu.trigger_commands("spacersize 0")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext 3196DEFF")
				menu.trigger_commands("focustexture 3196DEFF")
				menu.trigger_commands("focusrighttext 3196DEFF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 00000099")
				menu.trigger_commands("notifyflash 2a91f7")
				menu.trigger_commands("notifyborder 2a91f7")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 13")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "modern" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("cursorpos on")
				menu.trigger_commands("addressbarheight 24")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment left")
				menu.trigger_commands("tabswidth 101")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("menuheight 10")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 400")
				menu.trigger_commands("spacersize 0")
				menu.trigger_commands("primary FFFFFFFF")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg c8ac94")
				menu.trigger_commands("notifyflash FFFFFFFF")
				menu.trigger_commands("notifyborder FFFFFFFF")
				menu.trigger_commands("bigtextscale 15")
				menu.trigger_commands("bigtextxoffset -5")
				menu.trigger_commands("bigtextyoffset 2")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 2")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "futur" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 10")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 400")
				menu.trigger_commands("spacersize 18")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 8b8b8b")
				menu.trigger_commands("notifyflash 000000FF")
				menu.trigger_commands("notifyborder 000000FF")
				menu.trigger_commands("bigtextscale 12")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("smalltextxoffset 0")
				menu.trigger_commands("smalltextyoffset 5")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "iphone" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 24")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 12")
				menu.trigger_commands("cursorpadding 3")
				menu.trigger_commands("menuwidth 282")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 0")
				menu.trigger_commands("primary FFFFFFFF")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg DCDCDC66")
				menu.trigger_commands("notifyflash 1E90FFFF")
				menu.trigger_commands("notifyborder 1E90FFFF")
				menu.trigger_commands("bigtextscale 12")
				menu.trigger_commands("bigtextxoffset -4")
				menu.trigger_commands("bigtextyoffset 6")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset -4")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "s20" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 24")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 12")
				menu.trigger_commands("cursorpadding 3")
				menu.trigger_commands("menuwidth 282")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 0")
				menu.trigger_commands("primary FFFFFFFF")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg DCDCDC66")
				menu.trigger_commands("notifyflash 1E90FFFF")
				menu.trigger_commands("notifyborder 1E90FFFF")
				menu.trigger_commands("bigtextscale 12")
				menu.trigger_commands("bigtextxoffset -4")
				menu.trigger_commands("bigtextyoffset 6")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset -4")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "ipad" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabswidth 100")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment centre")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 12")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 457")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 8")
				menu.trigger_commands("primary FFFFFFFF")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg DCDCDC66")
				menu.trigger_commands("notifyflash 1E90FFFF")
				menu.trigger_commands("notifyborder 1E90FFFF")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset -4")
				menu.trigger_commands("bigtextyoffset 5")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("smalltextxoffset -3")
				menu.trigger_commands("smalltextyoffset 2")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "fold" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabswidth 100")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment centre")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 12")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 457")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 8")
				menu.trigger_commands("primary FFFFFFFF")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg DCDCDC66")
				menu.trigger_commands("notifyflash 1E90FFFF")
				menu.trigger_commands("notifyborder 1E90FFFF")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset -4")
				menu.trigger_commands("bigtextyoffset 5")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("smalltextxoffset -3")
				menu.trigger_commands("smalltextyoffset 2")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "standwatch" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 6")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 162")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 0")
				menu.trigger_commands("primary C8C8C8C8")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg DCDCDC66")
				menu.trigger_commands("notifyflash 1E90FFFF")
				menu.trigger_commands("notifyborder 1E90FFFF")
				menu.trigger_commands("bigtextscale 10")
				menu.trigger_commands("bigtextxoffset -1")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 8")
				menu.trigger_commands("smalltextxoffset -3")
				menu.trigger_commands("smalltextyoffset 5")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "stand3310" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 3")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 162")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 0")
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext 008C00FF")
				menu.trigger_commands("unfocusedtexture 008C00FF")
				menu.trigger_commands("unfocusedrighttext 008C00FF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 11240a")
				menu.trigger_commands("notifyflash 008C00FF")
				menu.trigger_commands("notifyborder 008C00FF")
				menu.trigger_commands("bigtextscale 9")
				menu.trigger_commands("bigtextxoffset -2")
				menu.trigger_commands("bigtextyoffset 10")
				menu.trigger_commands("smalltextscale 8")
				menu.trigger_commands("smalltextxoffset -3")
				menu.trigger_commands("smalltextyoffset 5")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "dslite" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 5")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 246")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 0")
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext 0064FFFF")
				menu.trigger_commands("focustexture 0064FFFF")
				menu.trigger_commands("focusrighttext 0064FFFF")
				menu.trigger_commands("unfocusedtext 000000FF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext 000000FF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg a1a1a1")
				menu.trigger_commands("notifyflash 7dcfff")
				menu.trigger_commands("notifyborder 7dcfff")
				menu.trigger_commands("bigtextscale 12")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 8")
				menu.trigger_commands("smalltextscale 9")
				menu.trigger_commands("smalltextxoffset 5")
				menu.trigger_commands("smalltextyoffset 0")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "dsi" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 5")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 246")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 0")
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext 0064FFFF")
				menu.trigger_commands("focustexture 0064FFFF")
				menu.trigger_commands("focusrighttext 0064FFFF")
				menu.trigger_commands("unfocusedtext 000000FF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext 000000FF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg a1a1a1")
				menu.trigger_commands("notifyflash 7dcfff")
				menu.trigger_commands("notifyborder 7dcfff")
				menu.trigger_commands("bigtextscale 12")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 8")
				menu.trigger_commands("smalltextscale 9")
				menu.trigger_commands("smalltextxoffset 5")
				menu.trigger_commands("smalltextyoffset 0")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "standfridge" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 7")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 155")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 7")
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext FF00FF")
				menu.trigger_commands("focustexture FF00FF")
				menu.trigger_commands("focusrighttext FF00FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 00000077")
				menu.trigger_commands("notifyflash FF00FF")
				menu.trigger_commands("notifyborder FF00FF")
				menu.trigger_commands("bigtextscale 10")
				menu.trigger_commands("bigtextxoffset -1")
				menu.trigger_commands("bigtextyoffset 5")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "windows11" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 20")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabswidth 100")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment left")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 10")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 480")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 10")
				menu.trigger_commands("primary FFFFFFFF")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("unfocusedtext 000000FF")
				menu.trigger_commands("unfocusedtexture 000000FF")
				menu.trigger_commands("unfocusedrighttext 000000FF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg FFFFFFFF")
				menu.trigger_commands("notifyflash 6169d3FF")
				menu.trigger_commands("notifyborder 6169d3FF")
				menu.trigger_commands("bigtextscale 12")
				menu.trigger_commands("bigtextxoffset -1")
				menu.trigger_commands("bigtextyoffset 6")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 2")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("cursorborderwidth 2")
				menu.trigger_commands("cursorborder FFFFFFFF")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "rebound" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 20")
				menu.trigger_commands("cursorpos on")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("menuheight 14")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("menuwidth 400")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("commandinfotextposition left")
				menu.trigger_commands("spacersize 11")				
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("background 090909")
				menu.trigger_commands("notifybg 000000FF")
				menu.trigger_commands("notifyflash ff7a39")
				menu.trigger_commands("notifyborder ff7a39")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset -1")
				menu.trigger_commands("bigtextyoffset 5")
				menu.trigger_commands("smalltextscale 13")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 1")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "switch" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabswidth 100")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment centre")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 7")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 338")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 6")
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext 000000FF")
				menu.trigger_commands("focustexture 000000FF")
				menu.trigger_commands("focusrighttext 000000FF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 000000FF")
				menu.trigger_commands("notifyflash 4b535d")
				menu.trigger_commands("notifyborder 4b535d")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset -4")
				menu.trigger_commands("bigtextyoffset 5")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("smalltextxoffset 0")
				menu.trigger_commands("smalltextyoffset 5")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "discord" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("addressbarheight 20")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabslefticon on")
				menu.trigger_commands("tabswidth 160")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment left")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 7")
				menu.trigger_commands("cursorpadding 5")
				menu.trigger_commands("menuwidth 430")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 18")
				menu.trigger_commands("primary 40444b")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext 8e8d91")
				menu.trigger_commands("unfocusedtexture 8e8d91")
				menu.trigger_commands("unfocusedrighttext 8e8d91")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 36393f")
				menu.trigger_commands("notifyflash 202225")
				menu.trigger_commands("notifyborder 202225")
				menu.trigger_commands("bigtextscale 13")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset 15")
				menu.trigger_commands("smalltextyoffset 3")
				menu.trigger_commands("cursorborderwidth 2")
				menu.trigger_commands("cursorborder 40444b")
				menu.trigger_commands("cursorborderrounded on")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "guilded" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("addressbarheight 20")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabslefticon on")
				menu.trigger_commands("tabswidth 200")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment left")
				menu.trigger_commands("commandinfotextposition belowtabs")
				menu.trigger_commands("menuheight 10")
				menu.trigger_commands("cursorpadding 5")
				menu.trigger_commands("menuwidth 380")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 18")
				menu.trigger_commands("primary 4e4f59")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext 9b9ba3")
				menu.trigger_commands("unfocusedtexture 9b9ba3")
				menu.trigger_commands("unfocusedrighttext 9b9ba3")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg 373943")
				menu.trigger_commands("notifyflash 191b1f")
				menu.trigger_commands("notifyborder 191b1f")
				menu.trigger_commands("bigtextscale 13")
				menu.trigger_commands("bigtextxoffset 0")
				menu.trigger_commands("bigtextyoffset 7")
				menu.trigger_commands("smalltextscale 11")
				menu.trigger_commands("smalltextxoffset -8")
				menu.trigger_commands("smalltextyoffset 4")
				menu.trigger_commands("cursorborderwidth 2")
				menu.trigger_commands("cursorborder 4e4f59")
				menu.trigger_commands("cursorborderrounded on")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "wii" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar off")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabswidth 100")
				menu.trigger_commands("tabsposition left")
				menu.trigger_commands("tabsalignment left")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 6")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("menuwidth 450")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("spacersize 6")
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext 00d8ec")
				menu.trigger_commands("focustexture 00d8ec")
				menu.trigger_commands("focusrighttext 00d8ec")
				menu.trigger_commands("unfocusedtext 808080")
				menu.trigger_commands("unfocusedtexture 808080")
				menu.trigger_commands("unfocusedrighttext 808080")
				menu.trigger_commands("background 00000000")
				menu.trigger_commands("notifybg FFFFFFFF")
				menu.trigger_commands("notifyflash 00d8ec")
				menu.trigger_commands("notifyborder 00d8ec")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset -4")
				menu.trigger_commands("bigtextyoffset 5")
				menu.trigger_commands("smalltextscale 10")
				menu.trigger_commands("smalltextxoffset -14")
				menu.trigger_commands("smalltextyoffset 3")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("cursorborderrounded on")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "sfr" then
				menu.trigger_commands("header hide")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("tabs on")
				menu.trigger_commands("tabswidth 60")
				menu.trigger_commands("tabsposition top")
				menu.trigger_commands("tabslefticon on")
				menu.trigger_commands("tabsname off")
				menu.trigger_commands("tabsalignment center")
				menu.trigger_commands("commandinfotextposition bottom")
				menu.trigger_commands("menuheight 10")
				menu.trigger_commands("cursorpadding 2")
				menu.trigger_commands("menuwidth 420")
				menu.trigger_commands("blur 4")
				menu.trigger_commands("spacersize 3")
				menu.trigger_commands("primary eb0003")
				menu.trigger_commands("focustext 000000")
				menu.trigger_commands("focustexture 000000")
				menu.trigger_commands("focusrighttext 000000")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("background 00000066")
				menu.trigger_commands("notifybg 00000066")
				menu.trigger_commands("notifyflash eb0003")
				menu.trigger_commands("notifyborder eb0003")
				menu.trigger_commands("bigtextscale 15")
				menu.trigger_commands("bigtextxoffset 1")
				menu.trigger_commands("bigtextyoffset 2")
				menu.trigger_commands("smalltextscale 12")
				menu.trigger_commands("smalltextxoffset -2")
				menu.trigger_commands("smalltextyoffset 1")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
			if currentheme == "impulse" then
				menu.trigger_commands("header custom")
				menu.trigger_commands("addressbar on")
				menu.trigger_commands("addressbarheight 17")
				menu.trigger_commands("cursorpos off")
				menu.trigger_commands("tabs off")
				menu.trigger_commands("menuheight 14")
				menu.trigger_commands("cursorpadding 0")
				menu.trigger_commands("cursorborderwidth 0")
				menu.trigger_commands("menuwidth 438")
				menu.trigger_commands("blur 0")
				menu.trigger_commands("commandinfotextposition left")
				menu.trigger_commands("spacersize 11")				
				menu.trigger_commands("primary 00000000")
				menu.trigger_commands("focustext FFFFFFFF")
				menu.trigger_commands("focustexture FFFFFFFF")
				menu.trigger_commands("focusrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtext FFFFFFFF")
				menu.trigger_commands("unfocusedrighttext FFFFFFFF")
				menu.trigger_commands("unfocusedtexture FFFFFFFF")
				menu.trigger_commands("background 0c1224")
				menu.trigger_commands("notifybg 0c1224")
				menu.trigger_commands("notifyflash 149aa5")
				menu.trigger_commands("notifyborder 38b7be")
				menu.trigger_commands("bigtextscale 14")
				menu.trigger_commands("bigtextxoffset -1")
				menu.trigger_commands("bigtextyoffset 5")
				menu.trigger_commands("smalltextscale 13")
				menu.trigger_commands("smalltextxoffset -1")
				menu.trigger_commands("smalltextyoffset 1")
				menu.trigger_commands("tabslefticon off")
				menu.trigger_commands("tabsname on")
				menu.trigger_commands("cursorborderrounded off")
				menu.trigger_commands("lualuathemeallinonestand")
			end
		end)
	end
	
    end
    
    GenerateFeatures()
    
	menu.trigger_commands("luatheme"..defaultheme)

    while true do 
					local hc = CLOCK.GET_CLOCK_HOURS()
					local mc = CLOCK.GET_CLOCK_MINUTES()
					local sc = CLOCK.GET_CLOCK_SECONDS()
					local x, y, width, menu_height = menu.get_main_view_position_and_size() --get menu info
					local cmd_x, cmd_y, cmd_width, cmd_height = menu.command_box_get_dimensions() --get command box inofo
					local pos_txt = menu.get_active_list_cursor_text(true,false)

		if (currentheme == "2stand1" or currentheme == "2take1") then
			if menu.command_box_is_open() then 
				directx.draw_rect(	------------------- background black rect
				0.358,				-- X
				0.094,				-- Y 
				0.2848,				-- width
				cmd_height+0.005,				-- height
				bg_colour			-- colour
				)
			end
		end
        if currentheme=="2take1" then
			
            if menu.is_open() then ---------------------------------THEME------------------
				
				width=width+0.0001 
				y=y-(32/1080) --remove a row
				local list = menu.get_active_list_cursor_text(true,false)
				local cursor_pos, total_opt = string.match(list, "(.*)/%s*(%d*)")
				
				cursor_pos = tonumber(cursor_pos)
				total_opt = tonumber(total_opt)
				
				directx.draw_rect(	------------------- background black rect
				x,				-- X 0.628
				y,				-- Y 0.4
				width,				-- width
				menu_height+(32/1080)+0.0011,				-- height
				bg_colour			-- colour
			)
				directx.draw_rect(	------------------ small bottom rect
				x,				-- X 0.628
				y+menu_height+(32/1080)+0.001,			-- Y 0.79
				width,				-- width
				0.025,				-- height
				btbar_colour			-- colour
			)
			directx.draw_texture(	---------------- header 
			header_tex,			-- id
				header_size,				-- sizeX
				header_size,				-- sizeY
				0.0,				-- centerX
				0.0,				-- centerY
				x-header_posX,			-- posX
				y-header_posY,			-- posY
				0.0,				-- rotation
				{	
					["r"] = 1.0,		-- colour
					["g"] = 1.0,
					["b"] = 1.0,
					["a"] = head_opacity
				}				
			)
			directx.draw_line(	----------small top line just change colours top
				x,				-- x1 
				y+0.029,			-- y1
				x+width,			-- x2
				y+0.029,			-- y2
				topline_colours1,      --colour 1
				topline_colours2      --colour 2
			)
			directx.draw_line(	----------small bottom line just change colours bottom
				x,				-- x1 
				y+menu_height+(32/1080),			-- y1
				x+width,			-- x2
				y+menu_height+(32/1080),			-- y2
				btline_colours1,      --colour 1
				btline_colours2      --colour 2
			)
			directx.draw_text(	-------------------  small text bottom left
				x+0.015,		-- x 
				y+menu_height+(32/1080)+0.005,		-- y 
				bttxt1,			-- text
				ALIGN_TOP_LEFT,		-- alignment
				0.55,			-- scale
				bttxt_colours1,		-- colour
				false				
			)	
			directx.draw_text(	-------------------  small text bottom right
				x+(width)-0.046,			-- x 
				y+menu_height+(32/1080)+0.005,		-- y 
				bttxt2,			-- text
				ALIGN_TOP_LEFT,		-- alignment
				0.55,			-- scale
				bttxt_colours2,		-- colour
				false				
			)		
          
        end
        end
		if currentheme=="2stand1" then
						
            if menu.is_open() then ---------------------------------THEME------------------
			
				width=width+0.0001 
				y=y-(32/1080) --remove a row
				local list = menu.get_active_list_cursor_text(true,false)
				local cursor_pos, total_opt = string.match(list, "(.*)/%s*(%d*)")
				
				cursor_pos = tonumber(cursor_pos)
				total_opt = tonumber(total_opt)
				
				directx.draw_rect(	------------------- background black rect
				x,				-- X 0.628
				y,				-- Y 0.4
				width,				-- width
				menu_height+(32/1080)+0.0011,				-- height
				bg_colour			-- colour
			)
				directx.draw_rect(	------------------ small bottom rect
				x,				-- X 0.628
				y+menu_height+(32/1080)+0.001,			-- Y 0.79
				width,				-- width
				0.025,				-- height
				btbar_colour			-- colour
			)
			directx.draw_texture(	---------------- header 
			header_tex,			-- id
				header_size,				-- sizeX
				header_size,				-- sizeY
				0.0,				-- centerX
				0.0,				-- centerY
				x-header_posX,			-- posX
				y-header_posY,			-- posY
				0.0,				-- rotation
				{	
					["r"] = 1.0,		-- colour
					["g"] = 1.0,
					["b"] = 1.0,
					["a"] = head_opacity
				}				
			)
			directx.draw_line(	----------small top line just change colours top
				x,				-- x1 
				y+0.029,			-- y1
				x+width,			-- x2
				y+0.029,			-- y2
				topline_colours1,      --colour 1
				topline_colours2      --colour 2
			)
			directx.draw_line(	----------small bottom line just change colours bottom
				x,				-- x1 
				y+menu_height+(32/1080),			-- y1
				x+width,			-- x2
				y+menu_height+(32/1080),			-- y2
				btline_colours1,      --colour 1
				btline_colours2      --colour 2
			)
			directx.draw_text(	-------------------  small text bottom left
				x+0.015,		-- x 
				y+menu_height+(32/1080)+0.005,		-- y 
				bttxt1,			-- text
				ALIGN_TOP_LEFT,		-- alignment
				0.55,			-- scale
				bttxt_colours1,		-- colour
				false				
			)	
			directx.draw_text(	-------------------  small text bottom right
				x+(width)-0.046,			-- x 
				y+menu_height+(32/1080)+0.005,		-- y 
				bttxt2,			-- text
				ALIGN_TOP_LEFT,		-- alignment
				0.55,			-- scale
				bttxt_colours2,		-- colour
				false				
			)		
           
        end
        end
        if currentheme=="paragon" then
            if menu.is_open() then ---------------------------------THEME------------------
              
					width=width+0.0001 
					y=y-(32/1080) --remove a row
					directx.draw_rect(	------------------- background black rect
					x,				-- X
					y-height,				-- Y 
					width,				-- width
					0.15,				-- height
					pbg_colour			-- colour
				)
				directx.draw_rect(	------------------- background black rect top
					x+0.005,				-- X 
					y-height-0.006,				-- Y 
					width-0.01,				-- width
					0.06,				-- height
					pbg_colour			-- colour
				)
					
					directx.draw_rect(	------------------- background select rect
					x,				-- X 
					y+(32/1080),				-- Y 
					width,				-- width
					menu_height,				-- height
					select_colour			-- colour
				)
				directx.draw_rect(	------------------- background black rect footer
					x,				-- X 
					y+menu_height+(32/1080),				-- Y 
					width,				-- width
					0.03,				-- height
					pbg_colour			-- colour
				)
				
				directx.draw_rect(	------------------- background black rect footer bottom
					x+0.005,				-- X 
					y+menu_height+(32/1080)+0.03,				-- Y 
					width-0.01,				-- width
					0.0065,				-- height
					pbg_colour			-- colour
				)
				directx.draw_texture(	---------------- footer arrow 
				bt_tex,			-- id
					0.009,				-- sizeX
					0.009,				-- sizeY
					0.5,				-- centerX
					0.0,				-- centerY
					x+(width/2)+0.001,			-- posX
					y+menu_height+0.03,			-- posY
					0.0,				-- rotation
					{	
						["r"] = 1.0,		-- colour
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}				
				)
				directx.draw_rect(	-------------------line left
					x-0.001,				-- X 
					y-height,				-- Y 
					0.001,				-- width
					menu_height+(32/1080)*4.5,				-- height
					line_colours			-- colour
				)
				directx.draw_rect(	-------------------line right
					x+width,				-- X 
					y-height,				-- Y 
					0.001,				-- width
					menu_height+(32/1080)*4.5,				-- height
					line_colours			-- colour
				)
				
				directx.draw_rect(	-------------------line top
					x+0.004,				-- X 
					y-height-0.007,				-- Y 
					width-0.009,				-- width
					0.002,				-- height
					line_colours			-- colour
				)
				directx.draw_rect(	-------------------line bottom
					x+0.004,				-- X 
					y+menu_height+0.0645,				-- Y 
					width-0.009,				-- width
					0.002,				-- height
					line_colours			-- colour
				)
			
				
				
				directx.draw_texture(	---------------- corner 1 up right
				cr_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-0.001,			-- posX
					y-height-0.007,			-- posY
					0.0,				-- rotation
					line_colours			
				)
				directx.draw_texture(	---------------- corner 2 up left
				cr_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x+width+0.001,			-- posX
					y-height-0.007,			-- posY
					0.25,				-- rotation
					line_colours	
				)
				directx.draw_texture(	---------------- corner 3 bottom right
				cr_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-0.001,			-- posX
					y+menu_height+0.0665,			-- posY
					0.75,				-- rotation
					line_colours
				)
				directx.draw_texture(	---------------- corner 4 bottom left
				cr_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x+width+0.001,			-- posX
					y+menu_height+0.0665,			-- posY
					0.5,				-- rotation
					line_colours
				)
				directx.draw_texture(	---------------- corner 1 up right inside
				cri_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-0.001,			-- posX
					y-height-0.007,			-- posY
					0.0,				-- rotation
					pbg_colour
				)
				directx.draw_texture(	---------------- corner 2 up left inside
				cri_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x+width+0.001,			-- posX
					y-height-0.007,			-- posY
					0.25,				-- rotation
					pbg_colour
				)
				directx.draw_texture(	---------------- corner 3 bottom right inside
				cri_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-0.001,			-- posX
					y+menu_height+0.0665,			-- posY
					0.75,				-- rotation
					pbg_colour
				)
				directx.draw_texture(	---------------- corner 4 bottom left inside
				cri_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x+width+0.001,			-- posX
					y+menu_height+0.0665,			-- posY
					0.5,				-- rotation
					pbg_colour
				)
			
			end

			  --command box theme
			  if menu.command_box_is_open() then 
			
        
				directx.draw_rect(	------------------- background black rect
				0.35,				-- X
				0.08,				-- Y 
				cmd_width+0.01,				-- width
				cmd_height+(32/1080),				-- height
				pbg_colour			-- colour
			)
			directx.draw_rect(	------------------- background black rect top
				0.355,				-- X
				0.075,				-- Y 
				cmd_width+0.002,				-- width
				0.02,				-- height
				pbg_colour			-- colour
			)
			directx.draw_rect(	------------------- background black rect bottom
      			0.355,				-- X
     			cmd_height+(105/1080),				-- Y 
				cmd_width+0.002,				-- width
				0.02,				-- height
				pbg_colour			-- colour
			)
			directx.draw_texture(	---------------- corner 1 up left
				cr_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					0.349,			-- posX
					0.073,			-- posY
					0.0,				-- rotation
					line_colours			
				)
			directx.draw_texture(	---------------- corner 2 up right
				cr_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					0.36+cmd_width,			-- posX
					0.073,			-- posY
					0.25,				-- rotation
					line_colours	
				)
				directx.draw_texture(	---------------- corner 3 bottom right
				cr_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					0.36+cmd_width,			-- posX
					cmd_height+(128/1080),			-- posY
					0.5,				-- rotation
					line_colours
				)
				directx.draw_texture(	---------------- corner 4 bottom left
				cr_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					0.349,			-- posX
					cmd_height+(128/1080),			-- posY
					0.75,				-- rotation
					line_colours
				)
				directx.draw_texture(	---------------- corner inside 1 up left
				cri_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					0.349,			-- posX
					0.073,			-- posY
					0.0,				-- rotation
					pbg_colour			
				)
			directx.draw_texture(	---------------- corner inside 2 up right
				cri_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					0.36+cmd_width,			-- posX
					0.073,			-- posY
					0.25,				-- rotation
					pbg_colour	
				)
				directx.draw_texture(	---------------- corner inside 3 bottom right
				cri_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					0.36+cmd_width,			-- posX
					cmd_height+(128/1080),			-- posY
					0.5,				-- rotation
					pbg_colour
				)
				directx.draw_texture(	---------------- corner inside 4 bottom left
				cri_tex,			-- id
					0.0035,				-- sizeX
					0.0035,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					0.349,			-- posX
					cmd_height+(128/1080),			-- posY
					0.75,				-- rotation
					pbg_colour
				)
			directx.draw_rect(	-------------------line left
          			0.349,				-- X 
					0.08,				-- Y 
					0.001,				-- width
					cmd_height+(32/1080),				-- height
					line_colours			-- colour
				)
				directx.draw_rect(	-------------------line top
					0.353,				-- X 
					0.073,				-- Y 
					cmd_width+0.002,				-- width 0.294
					0.002,				-- height
					line_colours			-- colour
				)
				directx.draw_rect(	-------------------line right
        			0.359+cmd_width,				-- X 
					0.08,				-- Y 
					0.001,				-- width
					cmd_height+(32/1080),				-- height
					line_colours			-- colour
				)
				directx.draw_rect(	-------------------line bottom
					0.353,				-- X 
					cmd_height+(128/1080)-0.002,				-- Y 
					cmd_width+0.002,				-- width
					0.002,				-- height
					line_colours			-- colour
				)
			  end
			end
			if currentheme=="cherax" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					cbg_colour			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					--Cherax textures
						
						
						
						directx.draw_texture(		---------------------------- header texture
						ch_tex,				-- id
						0.030,				-- sizeX
						0.030,				-- sizeY
						0.5,				-- centerX
						0.5,				-- centerY
						x-0.078,				-- posX 
						y+0.191,		 	-- posY 
						0.0,				-- rotation
						head_colour			--colour
					)
						directx.draw_rect(		----------------------- background rectangle
						x-0.05,		    		-- x 
						y,					-- y 
						0.302,				-- width
						0.382,				-- height
						cbg_colour			--colour
					)
						directx.draw_rect(		---------------------small purple rectangle top left
						x-0.108,			-- x 
						y-0.023,					-- y 
						0.060,				-- width
						0.023,				-- height
						headbar_right_colour --colour
					)
							else
							--no Cherax textures :(
					end	
				end
			if currentheme=="luna" then
				if menu.command_box_is_open() then 
					directx.draw_line(			------ cbox seperator
					0.358,				-- x1
					0.092,				-- y1
					0.6428,			-- x2
					0.092,				-- y2
					btsep_1_colours,      --colour 1
					btsep_2_colours		--colour 2
				)
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					lbg_colour			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
					width=width+0.0001 
					y=y-(32/1080) --remove a row
					local list = menu.get_active_list_cursor_text(true,false)
					local cursor_pos, total_opt = string.match(list, "(.*)/%s*(%d*)")
					cursor_pos = tonumber(cursor_pos)
					total_opt = tonumber(total_opt)
					
					
					directx.draw_rect(	------------------- background black rect
					x,				-- X 0.628
					y+0.03,				-- Y 0.4
					width,				-- width
					menu_height+0.025,				-- height
					lbg_colour			-- colour
				)
					directx.draw_rect(	------------------ small bottom top rect
					x,				-- X 0.628
					y+0.028,			-- Y 0.79
					width,				-- width
					0.002,				-- height
					lbtbar_colour			-- colour
				)
				
				directx.draw_rect(	------------------ small top rect
					x,				-- X 0.628
					y+menu_height+0.03,			-- Y 0.79
					width,				-- width
					0.024,				-- height
					lbtbar_colour			-- colour
				)
					
				
					directx.draw_texture(	---------------- header
					lheader_tex,			-- id
					size_head,				-- sizeX
					size_head,				-- sizeY
					0.0,				-- centerX
					1.0,				-- centerY
					x,				-- posX
					y+0.006,			-- posY
					0.0,				-- rotation
					{				-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_line(		----- top separator
					x,					-- x1
					y+0.029,				-- y1
					x+width,				-- x2
					y+0.029,				-- y2
					topsep_1_colours,      	--colour 1
					topsep_2_colours		--colour 2
				)
				directx.draw_line(			------ bottom seperator
					x,				-- x1
					y+menu_height+0.03,				-- y1
					x+width,			-- x2
					y+menu_height+0.03,				-- y2
					btsep_1_colours,      --colour 1
					btsep_2_colours		--colour 2
				)
				
				directx.draw_text(	-------------------  small text bottom
					x+lbttxt_posX,			-- x 
					y+menu_height+0.034,		-- y 
					lbttxt,			-- text bttxt
					ALIGN_TOP_LEFT,		-- alignment
					0.5,			-- scale
					lbttxt_colours,		-- colour
					false				
				)	
				
				end
			end
			if currentheme=="ozark" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line top
				0.357,			-- x 0.635
				0.093,			-- y 0.386
				0.0015,				-- width
				cmd_height+0.006,				-- height
				ohead_bar_colour		-- colour
			)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					obg_colour			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
					width=width+0.0001 
					local list = menu.get_active_list_cursor_text(true,false)
					local cursor_pos, total_opt = string.match(list, "(.*)/%s*(%d*)")
					cursor_pos = tonumber(cursor_pos)
					total_opt = tonumber(total_opt)
					
					
					directx.draw_rect(	------------------- background black rect
					x,					-- X 0.628
					y-0.002,			-- Y 0.4
					width,				-- width
					menu_height+0.005,				-- height 0.33
					obg_colour			-- colour
				)
					if ohead == true then
				
				directx.draw_texture(	---------------- header images
				header_tex,			-- id
					osize_head,			-- sizeX
					osize_head,			-- sizeY
					0.0,				-- centerX
					1.0,				-- centerY
					x,					-- posX
					y-0.0016,			-- posY
					0.0,				-- rotation
					{	
						["r"] = 1.0,	-- colour
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}				
				)
				else
					directx.draw_rect(	---------------------- header blue top rect
					x,				    -- X 0.628
					y-0.106,			-- Y 0.37
					width,				-- width
					0.104,				-- height
					ohead_colour			-- colour	
				)
					directx.draw_rect(	------------------ line top
					x+0.007,			-- x 0.635
					y-0.093,			-- y 0.386
					0.0015,				-- width
					0.08,				-- height
					ohead_bar_colour		-- colour
				)
				
					directx.draw_text(	-------------------  head text
					x+0.013,			-- x 0.64
					y-0.07,				-- y 0.405
					ohead_text,			-- text
					ALIGN_TOP_LEFT,		-- alignment
					1.1,				-- scale
					ohead_txt_colour,	-- colour
					false				
				)
					end
					directx.draw_rect(	------------------ small bottom blue rect
					x,				    -- X 0.628
					y+menu_height+0.002,			-- Y 0.79
					width,				-- width
					0.025,				-- height
					obtbar_colour		-- colour
				)
				directx.draw_texture(	---------------- footer arrow 
				bt_tex,			-- id
					0.0069,				-- sizeX
					0.0069,				-- sizeY
					0.5,				-- centerX
					0.0,				-- centerY
					x+(width/2),			-- posX
					y+menu_height+0.002,			-- posY
					0.0,				-- rotation
					{	
						["r"] = 1.0,		-- colour
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}				
				)
			
				end
			end
			if currentheme=="xcheat" then
				if menu.command_box_is_open() then 
				
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					xbg_colour			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
				
					width=width+0.0001 
					y=y-(32/1080) --remove a row

					directx.draw_rect(	------------------- head top black rect
					x,				-- X 0.628
					y-0.0715,				-- Y 0.4
					0.18,				-- width
					0.102,				-- height
					xbg_colour			-- colour
				)
					directx.draw_texture(	---------------- header
				head_tex,			-- id
					0.0342,				-- sizeX
					0.0342,				-- sizeY
					0.0,				-- centerX
					1.0,				-- centerY
					x+0.0015,			-- posX
					y,			-- posY
					0.0,				-- rotation
					{	
						["r"] = 1.0,		-- colour
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}				
				)	
					directx.draw_rect(	------------------- bottom black rect
					x,				-- X 0.628
					y+menu_height+0.03,				-- Y 0.4
					0.18,				-- width
					0.025,				-- height
					xbg_colour			-- colour
				)
				directx.draw_texture(	---------------- footer arrow 
				bt_tex,			-- id
					0.008,				-- sizeX
					0.008,				-- sizeY
					0.5,				-- centerX
					0.0,				-- centerY
					x+0.09,			-- posX
					y+menu_height+0.028,			-- posY
					0.0,				-- rotation
					{	
						["r"] = 0.231,		-- colour
						["g"] = 0.776,
						["b"] = 0.560,
						["a"] = 1.0
					}				
				)

				end
			end
			if currentheme == "standipity" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					sybg_colour			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
					directx.draw_rect(	------------------- background black rect
					x,				-- X 0.628
					y-0.05,				-- Y 0.4
					0.2085,				-- width
					0.7,				-- height
					sybg_colour			-- colour
				)
				
				directx.draw_rect(	------------------ top header rect
					x,				-- X 0.628
					y-0.131,			-- Y 0.79
					0.2085,				-- width
					0.08,				-- height
					sytopbar_colour			-- colour
				)
				
					directx.draw_rect(	------------------ small bottom rect
					x,				-- X 0.628
					y+0.65,			-- Y 0.79
					0.2085,				-- width
					0.03,				-- height
					sybtbar_colour			-- colour
				)

				directx.draw_texture(		----logo 
					syhead_tex,	-- id
					0.04,			-- sizeX
					0.04,			-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.098,			-- posX
					y-0.088,			-- posY
					1.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_line(	----------small bottom line left
					x,				-- x1 
					y-0.05,			-- y1
					x,			-- x2
					y+0.65,			-- y2
					sylines_colours      --colour 2
				)
				directx.draw_line(	----------small bottom line  right
					x+0.2085,				-- x1 
					y-0.05,			-- y1
					x+0.2085,			-- x2
					y+0.65,			-- y2
					sylines_colours     --colour 2
				)
				directx.draw_line(	----------small bottom line  top
					x-0.0005,				-- x1 
					y-0.05,			-- y1
					x+0.209,			-- x2
					y-0.05,			-- y2
					sylines_colours      --colour 2
				)
				
				directx.draw_line(	----------small bottom line  bottom
					x-0.0005,				-- x1 
					y+0.65,			-- y1
					x+0.209,			-- x2
					y+0.65,			-- y2
					sylines_colours     --colour 2
				)
				directx.draw_text(	-------------------  small text bottom left
					x+0.015,		-- x 
					y+0.655,		-- y 
					sybttxt1,			-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.6,			-- scale
					sybttxt_colours1,		-- colour
					false				
				)	
				
				end
			end
			if currentheme == "stanggy" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					ggbg_colour1			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
		
					directx.draw_rect(	------------------- background black rect
					x,				-- X 0.628
					y-0.15,				-- Y 0.4
					0.2,				-- width
					1.1,				-- height
					ggbg_colour1			-- colour
				)
				if abg then 
					--hide the annimated background
				else
				directx.draw_rect(	------------------- long width black rect math.random(1,10)/100
					x,				-- X 0.628
					y+math.random(-200,800)/1000,				-- Y 0.2 math.random(-2,8)/10
					0.2,				-- width
					0.1,				-- height
					ggbg_colour2			-- colour
				)
				
				directx.draw_rect(	------------------- long height black rect
					x+math.random(0,185)/1000,				-- X 0.628
					y-0.15,				-- Y 0.4
					0.015,				-- width
					1.0,				-- height
					ggbg_colour2			-- colour
				)
				end
				directx.draw_text(	-------------------  big text top 
					x+0.002,		-- x 
					y-0.06,		-- y 
					ggmaintxt,			-- text
					ALIGN_TOP_LEFT,		-- alignment
					1.1,			-- scale
					ggtptxt_colours1,		-- colour
					false				
				)	
				directx.draw_text(	-------------------  small text top 
					x+0.002,		-- x 
					y-0.025,		-- y 
					ggtptxt1,			-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.6,			-- scale
					ggstptxt_colours1,		-- colour
					false				
				)	
				
				end
			end
			if currentheme == "zanium" then
				if menu.command_box_is_open() then 

					directx.draw_line(			------ cbox seperator
					0.358,				-- x1
					0.0936,				-- y1
					0.6428,			-- x2
					0.0936,				-- y2
					zbcmd_colour
				)
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.0,["g"] = 0.003,["b"] = 0.015,["a"] = 0.8}			-- colour
					)
					
				end
				if menu.is_open() then ---------------------------------THEME------------------
				
					directx.draw_texture(		---------------------------- background 
					zbg_tex,				-- id
					0.16,				-- sizeX
					0.16,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-0.1,				-- posX 
					y-0.1,		 		-- posY 
					0.0,				-- rotation
					zbg_colour			--colour
				)

				directx.draw_texture(		---------------------------- background logo 
					zlg_tex,				-- id
					0.2,				-- sizeX
					0.2,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-0.119,				-- posX 
					y-0.144,		 		-- posY 
					0.0,				-- rotation
					zlg_colour			--colour
				)
				directx.draw_text(	-------------------  head text
					x+zposx_txt,			-- x 
					y-0.066,		-- y 
					zhead_txt,			-- text
					ALIGN_TOP_LEFT,		-- alignment
					zhsize_txt,			-- scale
					zheadtxt_colour,		-- colour
					false				
				)		
				
				end
			end
			if currentheme == "deathride" then
				if menu.command_box_is_open() then 

					directx.draw_line(			------ cbox seperator
					0.358,				-- x1
					0.092,				-- y1
					0.6428,			-- x2
					0.092,				-- y2
					{["r"] = 0.192,["g"] = 0.588,["b"] = 0.870,["a"] = 1.0}	
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 0.9}			-- colour
					)
				directx.draw_rect(	------------------- top rect 
				0.358,				-- X
				0.093,				-- Y 
				0.2848,				-- width
				0.029,				-- height
				dlines_colours			-- colour
				)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
		
					directx.draw_texture(		----bg 
						dbg_tex,	-- id
						0.15,			-- sizeX
						0.15,			-- sizeY
						0.5,				-- centerX
						0.5,				-- centerY
						x+0.098,			-- posX
						y+0.12,			-- posY
						1.0,				-- rotation
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = dbg_op
						}
					)
					
					
					directx.draw_line(	----------header separator line 
						x+0.075,				-- x1 
						y-0.056,			-- y1
						x+0.125,			-- x2
						y-0.056,			-- y2
						dlines_colours     --colour 2
					)
					
					directx.draw_line(	----------address bar separator line
						x-0.026,				-- x1 
						y,			-- y1
						x+0.22,			-- x2
						y,			-- y2
						dlines_colours     --colour 2
					)
					
					directx.draw_line(	----------small bottom line 
						x-0.036,				-- x1 
						y+0.34,			-- y1
						x+0.23,			-- x2
						y+0.34,			-- y2
						dlines_colours     --colour 2
					)
					
					directx.draw_text(	-------------------  header text 
						x+0.1,		-- x 
						y-0.08,		-- y 
						dhtxt,			-- text
						ALIGN_CENTRE,		-- alignment
						1.2,			-- scale
						dtxt_colours,		-- colour
						false				
					)	
					
					directx.draw_text(	-------------------  small text bottom under header
						x+0.1,		-- x 
						y-0.042,		-- y 
						dbttxt1,			-- text
						ALIGN_CENTRE,		-- alignment
						0.5,			-- scale
						dtxt_colours,		-- colour
						false				
					)	
					
					directx.draw_text(	-------------------  small text bottom 
						x+0.1,		-- x 
						y+0.348,		-- y 
						dbttxt2,			-- text
						ALIGN_CENTRE,		-- alignment
						0.5,			-- scale
						dtxt_colours,		-- colour
						false				
					)	
					
				
				end
			end
			if currentheme == "modern" then
				if menu.command_box_is_open() then 

					
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					mbg_colour			-- colour
					)
				directx.draw_rect(	------------------- top rect 
				0.358,				-- X
				0.093,				-- Y 
				0.2848,				-- width
				0.008,				-- height
				mhead_colour			-- colour
				)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
					directx.draw_rect(	-------------------background theme
					x-0.056,	-- x 
					y-0.086,	-- y 
					0.27,				-- width
					0.488,				-- height
					mbg_colour			-- Background main colour 
				)
					directx.draw_rect(	---------------- big white top rect
					x-0.0525,					-- X 
					y-0.078,			-- Y 
					0.264,				-- width
					0.07,				-- height
					mhead_colour			-- colour
				)
					directx.draw_rect(	----------small left bottom rect
					x-0.0525,					-- X 
					y+0.201,				-- Y 
					0.0525,				-- width
					0.188,				-- height
					mclk_bg_colour			-- colour
				)	
					directx.draw_text(	------------  head text
					x+0.05,			-- x 
					y-0.065,			-- y 
					mhead_text,			-- text
					ALIGN_TOP_LEFT,			-- alignment
					0.8,				-- scale
					mhead_txt_colour,		-- colour
					false				
				)
					directx.draw_rect(	--------------- hour ractangle
					x-0.048,			-- x 
					y+0.21,			-- y 
					hc/600,				-- width
					0.05,				-- height
					mbg_colour			-- colour
				)
					directx.draw_text(	------------hour clock
					x-0.045,			-- X 
					y+0.222,				-- y 
					hc,				-- text
					ALIGN_TOP_LEFT,			-- alignment
					1.0,				-- scale
					mclk_txt_colour,			-- colour
					false				
				)
					directx.draw_rect(	--- minutes ractangle
					x-0.048,			-- x
					y+0.27,			-- y 
					mc/1500,			-- width
					0.05,				-- height
					mbg_colour			-- colour
				)
				
					directx.draw_text(	--------------minutes clock
					x-0.045,			-- X
					y+0.28,				-- y
					mc,				-- text
					ALIGN_TOP_LEFT,			-- alignment
					0.9,				-- scale
					mclk_txt_colour,			-- colour
					false				
				)
					directx.draw_rect(	---------------- seconds ractangle
					x-0.048,			-- x
					y+0.33,			-- y 
					sc/1500,			-- width
					0.05,				-- height
					mbg_colour			-- colour
				)
					directx.draw_text(	----------------seconds clock
					x-0.045,			-- X
					y+0.346,			-- y
					sc,				-- text
					ALIGN_TOP_LEFT,			-- alignment
					0.8,				-- scale
					mclk_txt_colour,			--colour
					false				
				)
				
				end
			end
			if currentheme == "futur" then
				if menu.command_box_is_open() then 

					directx.draw_line(			------ cbox seperator
					0.358,				-- x1
					0.0936,				-- y1
					0.6428,			-- x2
					0.0936,				-- y2
					{["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}
				)
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.545,["g"] = 0.545,["b"] = 0.545,["a"] = 1.0}			-- colour
					)
					
				end
				if menu.is_open() then ---------------------------------THEME------------------
					frotation = frotation+fintensity --rotate the circle
					
					
					directx.draw_texture(				---- top circle
					ftp_circ_tex,			-- id
					0.1,				-- sizeX
					0.1,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.122,				-- posX 
					y-0.05,				-- posY 
					frotation,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)	
					directx.draw_texture(				---- main bg
					fmain_tex,			-- id
					0.11,				-- sizeX
					0.11,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-0.005,				-- posX
					y-0.21,				-- posY 
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
					directx.draw_texture(				---- small round bt
					fbt_circ_tex,			-- id
					0.015,				-- sizeX
					0.015,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.194,				-- posX
					y+0.363,				-- posY 
					-frotation,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)

				end
			end
			if currentheme == "iphone" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.093,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.006,				-- height
					{["r"] = 0.117,["g"] = 0.564,["b"] = 1.0,["a"] = 1.0}		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.4,["g"] = 0.4,["b"] = 0.4,["a"] = 0.6}			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
				
					
					---------------------Iphone frame wallpaper
					
					directx.draw_texture(				---- wallpaper
					wp_home_tex,			-- id
					size_wlhome,				-- sizeX
					size_wlhome,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+hwp_posX,				-- posX
					y+hwp_posY-0.0155,				-- posY 
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)	
					directx.draw_texture(				----iphone frame
					fw_iphone_tex,			-- id
					0.0848,				-- sizeX
					0.0845,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.0748,				-- posX
					y+0.245,				-- posY 
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_text(	------------hour clock
					x+0.026,				-- X
					y-0.038,				-- y 
					hc..":"..mc,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.5,				-- scale
					sb_clk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ status bar text right
					x+0.115,				-- X
					y-0.038,				-- y
					sbtxt,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.5,				-- scale
					sb_txt_colours,		-- colour
					false				
				)
					
				else			
			
					if ovlay then 
								--open overlay by default
					else 
						-----------------OVERLAY---------------------------------
						

					directx.draw_texture(				----iphone frame lockscreen
					fw_iphone_tex,			-- id
					0.085,				-- sizeX
					0.085,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.0748,				-- posX
					1.1,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_texture(				----iphone wallpaper
					wp_lock_tex,			-- id
					size_wlovlay,				-- sizeX
					size_wlovlay,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+lwp_posX,				-- posX
					lwp_posY,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				
					directx.draw_text(	------------ clock lockscreen hour
					x+0.034,				-- X
					0.87,				-- y
					hc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					1.1,				-- scale
					lc_clk_colours,
					false				
				)
					directx.draw_text(	------------ clock lockscreen min
					x+0.068,				-- X
					0.875,				-- y
					mc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					lc_clk_colours,
					false				
				)
					directx.draw_text(	------------ clock lockscreen sec
					x+0.09,				-- X
					0.875,				-- y
					sc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					lc_clk_colours,
					false				
				)
					directx.draw_text(	------------ status bar lockscreen menu name left
					x+0.028,				-- X
					0.815,				-- y
					lc_lefttxt,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.5,				-- scale
					lc_lefttxt_colours,  --colours
					false				
				)
					directx.draw_text(	------------ status lockscreen bar text right
					x+0.115,				-- X
					0.815,				-- y
					lc_rightxt,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.5,				-- scale
					lc_rightxt_colours, --colours
					false				
				)
			end
					end
			end
			if currentheme == "s20" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.093,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.006,				-- height
					{["r"] = 0.117,["g"] = 0.564,["b"] = 1.0,["a"] = 1.0}		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.4,["g"] = 0.4,["b"] = 0.4,["a"] = 0.6}			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					directx.draw_texture(                ---- s21 wallpaper
                    wp_home_tex,            -- id
                    size_wlhome,                -- sizeX
                    size_wlhome,                -- sizeY
                    0.5,                -- centerX
                    0.5,                -- centerY
                    x+hwp_posX,                -- posX 
                    y+hwp_posY+0.005,                -- posY 
                    0.0,                -- rotation
                    {                    -- colour
                        ["r"] = 1.0,
                        ["g"] = 1.0,
                        ["b"] = 1.0,
                        ["a"] = 1.0
                    }
                )
                    directx.draw_texture(                ---- s21 frame
                    fw_s21_tex,            -- id
                    0.0814,                -- sizeX
                    0.0845,                -- sizeY
                    0.5,                -- centerX
                    0.5,                -- centerY
                    x+0.0753,                -- posX 
                    y+0.254,                -- posY 
                    0.0,                -- rotation
                    {                    -- colour
                        ["r"] = 1.0,
                        ["g"] = 1.0,
                        ["b"] = 1.0,
                        ["a"] = 1.0
                    }
                )

				directx.draw_text(	------------hour clock
					x+0.026,				-- X
					y-0.038,				-- y 
					hc..":"..mc,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.5,				-- scale
					sb_clk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ status bar text right
					x+0.115,				-- X
					y-0.038,				-- y
					sbtxt,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.5,				-- scale
					sb_txt_colours,		-- colour
					false				
				)
			else
				if ovlay then
					--no overlay
					else
				
	
					directx.draw_texture(				---- s21 frame
					fw_s21_tex,			-- id
					0.0814,				-- sizeX
					0.0814,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.0753,				-- posX
					1.11,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_texture(				---- s21 wallpaper
					wp_lock_tex,			-- id
					size_wlovlay,				-- sizeX
					size_wlovlay,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+lwp_posX,				-- posX
					lwp_posY,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_text(	------------ clock lockscreen hour
					x+0.034,				-- X
					0.87,				-- y
					hc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					1.1,				-- scale
					lc_clk_colours,
					false				
				)
					directx.draw_text(	------------ clock lockscreen min
					x+0.068,				-- X
					0.875,				-- y
					mc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					lc_clk_colours,
					false				
				)
					directx.draw_text(	------------ clock lockscreen sec
					x+0.09,				-- X
					0.875,				-- y
					sc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					lc_clk_colours,
					false				
				)
			
					directx.draw_text(	------------ status bar lockscreen menu name left
					x+0.028,				-- X
					0.815,				-- y
					lc_lefttxt,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.5,				-- scale
					lc_lefttxt_colours,  --colours
					false				
				)
					directx.draw_text(	------------ status lockscreen bar text right
					x+0.115,				-- X
					0.815,				-- y
					lc_rightxt,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.5,				-- scale
					lc_rightxt_colours, --colours
					false				
				)
			end
				end
			end
			if currentheme == "ipad" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.093,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.006,				-- height
					{["r"] = 0.117,["g"] = 0.564,["b"] = 1.0,["a"] = 1.0}		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.4,["g"] = 0.4,["b"] = 0.4,["a"] = 0.6}			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
				
					
					directx.draw_texture(				---- wallpaper
					pwp_home_tex,			-- id
					psize_wlhome,				-- sizeX
					psize_wlhome,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+phwp_posX-0.0008,				-- posX
					y+phwp_posY,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)	
					directx.draw_texture(				----ipad frame
					fw_ipad_tex,			-- id
					0.178,				-- sizeX
					0.178,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.0926,				-- posX
					y+0.316,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				
					directx.draw_text(	------------ clock
					x-0.03,				-- X
					y-0.0398,				-- y
					hc..":"..mc,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.4,				-- scale
					psb_clk_colours,					-- colour
					false				
				)
					
					directx.draw_text(	------------ status bar text right
					x+0.22,				-- X
					y-0.0398,				-- y
					sbtxt,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.4,				-- scale
					psb_txt_colours,					-- colour
					false				
				)
						else
						
							if ovlay then
								--no overlay
								else
					
			
					directx.draw_texture(				----ipad wallpaper
					wp_ipad_lock_tex,			-- id
					size_ipad_wlovlay,				-- sizeX
					size_ipad_wlovlay,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+lwp_ipad_posX,				-- posX
					lwp_ipad_posY,						-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)	
					directx.draw_texture(				----ipad frame lockscreen
					fw_ipad_tex,			-- id
					0.18,				-- sizeX
					0.18,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.151,					-- posX
					1.25,					-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
					directx.draw_text(	------------ clock lockscreen hour
					x+0.175,				-- X
					0.93,				-- y
					hc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					1.1,				-- scale
					lc_clk_colours_ipad,
					false				
				)
					directx.draw_text(	------------ clock lockscreen min
					x+0.202,				-- X
					0.935,				-- y
					mc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					lc_clk_colours_ipad,
					false				
				)
					directx.draw_text(	------------ clock lockscreen sec
					x+0.225,				-- X
					0.935,				-- y
					sc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					lc_clk_colours_ipad,
					false				
				)
					directx.draw_text(	------------ status bar lockscreen menu name left
					x+0.03,				-- X
					0.892,				-- y
					lc_lefttxt,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.5,				-- scale
					plc_lefttxt_colours,
					false				
				)
					directx.draw_text(	------------ status lockscreen bar text right
					x+0.27,				-- X
					0.892,				-- y
					lc_rightxt,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.5,				-- scale
					plc_rightxt_colours,
					false				
				)
					
			end
			end	
			end
			if currentheme == "fold" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.093,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.006,				-- height
					{["r"] = 0.117,["g"] = 0.564,["b"] = 1.0,["a"] = 1.0}		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.4,["g"] = 0.4,["b"] = 0.4,["a"] = 0.6}				-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
					
					
					directx.draw_texture(				---- wallpaper
					pwp_home_tex,			-- id
					psize_wlhome,				-- sizeX
					psize_wlhome,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+phwp_posX-0.0008,				-- posX 0.66
					y+phwp_posY,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)	
					directx.draw_texture(				----fold frame open
					fw_fold_open_tex,			-- id
					0.1597,				-- sizeX
					0.1597,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.0942,				-- posX
					y+0.295,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_text(	------------ clock
					x-0.03,				-- X
					y-0.0398,				-- y
					hc..":"..mc,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.4,				-- scale
					psb_clk_colours,					-- colour
					false				
				)
					
					directx.draw_text(	------------ status bar text right
					x+0.22,				-- X
					y-0.0398,				-- y
					sbtxt,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.4,				-- scale
					psb_txt_colours,					-- colour
					false				
				)
				else
					if ovlay then
						--no overlay
						else
							
					directx.draw_texture(				----fold wallpaper
					wp_fold_lock_tex,			-- id
					size_fold_wlovlay,				-- sizeX
					size_fold_wlovlay,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+lwp_fold_posX,				-- posX
					lwp_fold_posY,						-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				
				directx.draw_texture(				----fold frame closed lockscreen 
					wp_fold_closed_tex,			-- id
					0.07,				-- sizeX
					0.07,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.067,					-- posX
					1.1,					-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
					directx.draw_text(	------------ clock lockscreen hour
					x+0.028,				-- X
					0.87,				-- y
					hc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					1.1,				-- scale
					lc_clk_colours_fold,
					false				
				)
					directx.draw_text(	------------ clock lockscreen min
					x+0.06,				-- X
					0.876,				-- y
					mc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					lc_clk_colours_fold,
					false				
				)
					directx.draw_text(	------------ clock lockscreen sec
					x+0.086,				-- X
					0.876,				-- y
					sc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					lc_clk_colours_fold,
					false				
				)
					directx.draw_text(	------------ status bar lockscreen menu name left
					x+0.04,				-- X
					0.83,				-- y
					lc_lefttxt,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.45,				-- scale
					plc_lefttxt_colours,
					false				
				)
					directx.draw_text(	------------ status lockscreen bar text right
					x+0.11,				-- X
					0.83,				-- y
					lc_rightxt,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.45,				-- scale
					plc_rightxt_colours,
					false				
				)
			end
				end
			end
			if currentheme == "standwatch" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.093,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.006,				-- height
					{["r"] = 0.117,["g"] = 0.564,["b"] = 1.0,["a"] = 1.0}		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.4,["g"] = 0.4,["b"] = 0.4,["a"] = 0.6}			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
				
					directx.draw_texture(				---- wallpaper
					wp_tex,			-- id
					wsize_wlhome,				-- sizeX
					wsize_wlhome,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+whwp_posX,				-- posX
					y+whwp_posY,				-- posY
					1.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
					directx.draw_texture(				---- watch frame
					fw_wt_tex,			-- id
					0.065,				-- sizeX
					0.065,				-- sizeY
					0.15,				-- centerX
					0.3,				-- centerY
					x,				-- posX
					y,				-- posY
					1.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				
					directx.draw_text(	------------hour clock
					x+wclk_posX,				-- X
					y-0.015,				-- y
					hc,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.44,				-- scale
					wclk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ clock separator
					x+wclk_posX+0.001,				-- X
					y-0.015,				-- y
					":",	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.44,				-- scale
					wclk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------hour minutes
					x+wclk_posX+0.014,				-- X
					y-0.015,				-- y
					mc,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.44,				-- scale
					wclk_colours,					-- colour
					false				
				)
						else
						if ioverlay then ---------------------------------watch OVERLAY------------------
						--no overlay
						else
					
					directx.draw_texture(				---- wallpaper
					wp_tex,			-- id
					wsize_wlovlay,				-- sizeX
					wsize_wlovlay,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+wlwp_posX,				-- posX
					wlwp_posY,				-- posY
					1.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
					
					directx.draw_texture(				---- watch frame lockscreen
					fw_wt_tex,			-- id
					0.065,				-- sizeX
					0.065,				-- sizeY
					0.15,				-- centerX
					0.3,				-- centerY
					x,				-- posX
					0.85,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				
					if face == 1 then --watch face 1
					directx.draw_text(	------------ clock lockscreen hour
					x+0.01,				-- X
					0.87,				-- y
					hc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					wlc_clk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ clock lockscreen min
					x+0.032,				-- X
					0.872,				-- y
					mc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.8,				-- scale
					wlc_clk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ clock lockscreen sec
					x+0.055,				-- X
					0.874,				-- y
					sc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.7,				-- scale
					wlc_clk_colours,					-- colour
					false				
				)
					end
					
					if face == 2 then --watch face 2
					directx.draw_text(	------------ clock lockscreen hour
					x,				-- X
					0.84,				-- y
					hc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.95,				-- scale
					wlc_clk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ clock lockscreen min
					x,				-- X
					0.87,				-- y
					mc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.86,				-- scale
					wlc_clk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ clock lockscreen sec
					x,				-- X
					0.9,				-- y
					sc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.75,				-- scale
					wlc_clk_colours,					-- colour
					false				
				)
						
					end
					end
					end
	
			end
			if currentheme == "stand3310" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.094,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.2,["g"] = 0.8,["b"] = 0.2,["a"] = 1.0}		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.094,				-- Y 
					0.2848,				-- width
					cmd_height+0.005,				-- height
					{["r"] = 0.066,["g"] = 0.141,["b"] = 0.039,["a"] = 1.0}			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
					directx.draw_texture(				---- 3310 frame
					nfw_test_tex,			-- id
					0.085,				-- sizeX
					0.085,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.046,				-- posX
					y+0.12,				-- posY
					1.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
					directx.draw_text(	------------hour clock
					x+0.06,				-- X
					y-0.01,				-- y
					hc,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.45,				-- scale
					nclk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ clock separator
					x+0.061,				-- X
					y-0.01,				-- y
					":",	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.45,				-- scale
					nclk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------hour minutes
					x+0.074,				-- X
					y-0.01,				-- y
					mc,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.45,				-- scale
					nclk_colours,					-- colour
					false				
				)
						else
						if ioverlay then ---------------------------------3310 OVERLAY------------------
						--no overlay
						else
					
					directx.draw_texture(				---- 3310 frame lockscreen
					nfw_test_tex,			-- id
					0.085,				-- sizeX
					0.085,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.046,				-- posX
					0.98,				-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
					directx.draw_text(	------------ clock lockscreen hour
					x+0.01,				-- X
					0.87,				-- y
					hc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					nlc_clk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ clock lockscreen min
					x+0.032,				-- X
					0.872,				-- y
					mc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.8,				-- scale
					nlc_clk_colours,					-- colour
					false				
				)
					directx.draw_text(	------------ clock lockscreen sec
					x+0.055,				-- X
					0.874,				-- y
					sc,	-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.7,				-- scale
					nlc_clk_colours,					-- colour
					false				
				)
					
					end
					
					end
			end
			if currentheme == "dslite" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.09,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.007,				-- height
					{["r"] = 0.490,["g"] = 0.811,["b"] = 1.0,["a"] = 1.0}		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.09,				-- Y 
					0.2848,				-- width
					cmd_height+0.007,				-- height
					{["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 0.5}			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					directx.draw_texture(				---- wallpaper bottom
					wpl_tex,			-- id
					size_btwl,			-- sizeX
					size_btwl,			-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-wp1_posX,			-- posX
					y-wp1_posY,			-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_texture(				---- wallpaper top
					wp2_tex,			-- id
					size_topwl,			-- sizeX
					size_topwl,			-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-wp2_posX,			-- posX
					y-wp2_posY,			-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_texture(				---- ds lite frame
					dsl_tex,			-- id
					0.14,				-- sizeX
					0.14,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.065,			-- posX
					y-0.068,			-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_text(	------------left text
				x+0.03,				-- X
				y-0.28,				-- y
				dstoptxt,	-- text
				ALIGN_TOP_RIGHT,		-- alignment
				0.5,				-- scale
				dstxt_colours,					-- colour
				false				
			)
			
				directx.draw_text(	------------hour clock
				x+0.10,				-- X
				y-0.28,				-- y
				hc..":"..mc,	-- text
				ALIGN_TOP_RIGHT,	-- alignment
				0.5,				-- scale
				dsclk_colours,		-- colour
				false				
			)
				
				end
			end
			if currentheme == "dsi" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.09,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.007,				-- height
					{["r"] = 0.490,["g"] = 0.811,["b"] = 1.0,["a"] = 1.0}		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.09,				-- Y 
					0.2848,				-- width
					cmd_height+0.007,				-- height
					{["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 0.5}			-- colour
					)
				end
				
				if menu.is_open() then ---------------------------------THEME------------------
					directx.draw_texture(				---- wallpaper bottom
					wpl_tex,			-- id
					size_btwl,			-- sizeX
					size_btwl,			-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-wp1_posX,			-- posX
					y-wp1_posY,			-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_texture(				---- wallpaper top
					wp2_tex,			-- id
					size_topwl,			-- sizeX
					size_topwl,			-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-wp2_posX,			-- posX
					y-wp2_posY,			-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)

				directx.draw_texture(				---- dsi frame
					dsi_tex,			-- id
					0.14,				-- sizeX
					0.14,				-- sizeY
					0.5,				-- centerX
					0.5,				-- centerY
					x+0.065,			-- posX
					y-0.065,			-- posY
					0.0,				-- rotation
					{					-- colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}
				)
				directx.draw_text(	------------left text
					x+0.03,				-- X
					y-0.29,				-- y
					dstoptxt,	-- text
					ALIGN_TOP_RIGHT,		-- alignment
					0.5,				-- scale
					dstxt_colours,					-- colour
					false				
				)
				
					directx.draw_text(	------------hour clock
					x+0.10,				-- X
					y-0.29,				-- y
					hc..":"..mc,	-- text
					ALIGN_TOP_RIGHT,	-- alignment
					0.5,				-- scale
					dsclk_colours,		-- colour
					false				
				)
				
				end
			end
			if currentheme == "standfridge" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.09,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.007,				-- height
					{["r"] = 1.0,["g"] = 0.0,["b"] = 1.0,["a"] = 1.0}		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.09,				-- Y 
					0.2848,				-- width
					cmd_height+0.007,				-- height
					{["r"] = 0.6,["g"] = 0.6,["b"] = 0.6,["a"] = 0.7}			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					
					open_left = PAD.IS_CONTROL_PRESSED(0,170) --F3
					if open_left then
						directx.draw_texture(				---- fridge frame open left
							fol_tex,			-- id
							0.18,				-- sizeX
							0.18,				-- sizeY
							0.5,				-- centerX
							0.5,				-- centerY
							x-0.03,				-- posX
							y+0.3,				-- posY
							1.0,			-- rotation
							f_colour			-- colour
						)
						else
						directx.draw_texture(				---- fridge frame
							f_tex,			-- id
							0.19,				-- sizeX
							0.19,				-- sizeY
							0.5,				-- centerX
							0.5,				-- centerY
							x-0.03,				-- posX
							y+0.3,				-- posY
							1.0,			-- rotation
							f_colour			-- colour
						)
						end
						directx.draw_text(	------------hour clock
						x+0.075,				-- X
						y-0.013,				-- y
						hc.." : "..mc,	-- text
						ALIGN_TOP_RIGHT,		-- alignment
						0.45,				-- scale
						fclk_colours,					-- colour
						false				
					)
				
				end
			end
			if currentheme == "windows11" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------ line 
					0.357,			-- x 0.635
					0.09,			-- y 0.386
					0.0015,				-- width
					cmd_height+0.007,				-- height
					line_color		-- colour
				)
			
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.09,				-- Y 
					0.2848,				-- width
					cmd_height+0.007,				-- height
					{["r"] = 1.0,["g"] = 1.0,["b"] = 1.0,["a"] = 1.0}			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
					

					directx.draw_texture(				---- profile 
					profile_tex,		-- id
					prof_size,				-- sizeX
					prof_size,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-0.07,					-- posX 
					y-0.078,					-- posY
					0.0,				-- rotation
					{					-- default colour
						["r"] = 1.0,
						["g"] = 1.0,
						["b"] = 1.0,
						["a"] = 1.0
					}				
				)	
					
					directx.draw_texture(				---- window
					wbg_tex,				-- id
					0.17,				-- sizeX
					0.17,				-- sizeY
					0.0,				-- centerX
					0.0,				-- centerY
					x-0.075,					-- posX 
					y-0.105,					-- posY
					0.0,				-- rotation
					wbg_c				-- colour
				)	
				
				directx.draw_rect(	------------------- line top (below address bar)
								x-0.065,				-- X 
								y-0.0036,			-- Y 
								0.318,				-- width
								0.001,				-- height
								line_color			-- colour
					)
					
				directx.draw_text(	-------------------  profile name text
					x-0.048,			-- x 
					y-0.075,				-- y 
					profile_name,			-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.9,				-- scale
					profilename_color,	-- colour
					false				
				)
						directx.draw_text(	-------------------  window name text
					x-0.06,			-- x 
					y-0.095,				-- y 
					window_name,			-- text
					ALIGN_TOP_LEFT,		-- alignment
					0.5,				-- scale
					winame_color,	-- colour
					false				
				)
				end
			end
			if currentheme=="rebound" then
				if menu.command_box_is_open() then 
					directx.draw_rect(	------------------- top rect 
					0.358,				-- X
					0.092,				-- Y 
					0.2848,				-- width
					0.05,				-- height
					rselect_colour			-- colour
					)
					directx.draw_rect(	------------------- background black rect
					0.358,				-- X
					0.13,				-- Y 
					0.2848,				-- width
					cmd_height-0.03,				-- height
					{["r"] = 0.035,["g"] = 0.035,["b"] = 0.035,["a"] = 1.0}			-- colour
					)
				end
				if menu.is_open() then ---------------------------------THEME------------------
				   
						width=width+0.0001 
						y=y-(32/1080) --remove a row
						directx.draw_rect(	------------------- background black rect
						x,				-- X
						y-rheight,				-- Y 
						width,				-- width
						0.05,				-- height
						rpbg_colour			-- colour
					)
						directx.draw_texture(	---------------- header images
						rbheader_tex,			-- id
						rsize_head,			-- sizeX
						rsize_head,			-- sizeY
						0.0,				-- centerX
						1.0,				-- centerY
						x,					-- posX
						y-0.0016,			-- posY
						0.0,				-- rotation
						{	
							["r"] = 1.0,	-- colour
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						}				
					)
					
						
						directx.draw_rect(	------------------- background select rect
						x,				-- X 
						y+0.03,				-- Y 
						width,				-- width
						menu_height,				-- height
						rselect_colour			-- colour
					)
					directx.draw_rect(	------------------- background black rect footer
						x,				-- X 
						y+menu_height+(32/1080),				-- Y 
						width,				-- width
						0.03,				-- height
						rbars_colour			-- colour
					)
					
					directx.draw_texture(	---------------- footer arrow 
					bt_tex,			-- id
						0.009,				-- sizeX
						0.009,				-- sizeY
						0.5,				-- centerX
						0.0,				-- centerY
						x+(width/2)+0.001,			-- posX
						y+menu_height+0.028,			-- posY
						0.0,				-- rotation
						{	
							["r"] = 1.0,		-- colour
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						}				
					)
					
				end
				end
				if currentheme=="switch" then
					if menu.command_box_is_open() then 
						
						directx.draw_rect(	------------------- background black rect
						0.358,				-- X
						0.09,				-- Y 
						0.2848,				-- width
						cmd_height+0.005,				-- height
						{["r"] = 0.0,["g"] = 0.0,["b"] = 0.0,["a"] = 1.0}			-- colour
						)
						directx.draw_rect(	------------------- top rect 
						0.358,				-- X
						0.09,				-- Y 
						0.2846,				-- width
						0.025,				-- height
						{["r"] = 0.6,["g"] = 0.6,["b"] = 0.6,["a"] = 1.0}			-- colour
						)
					end
					if menu.is_open() then ---------------------------------THEME------------------
					   

						directx.draw_texture(				---- wallpaper
						swp_home_tex,			-- id
						ssize_wlhome,				-- sizeX
						ssize_wlhome,				-- sizeY
						0.5,				-- centerX
						0.5,				-- centerY
						x+shwp_posX-0.0002,				-- posX
						y+shwp_posY,				-- posY
						0.0,				-- rotation
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						}
					)	
						directx.draw_texture(				----swicth frame
						sw_frame,			-- id
						0.151,				-- sizeX
						0.151,				-- sizeY
						0.0,				-- centerX
						0.0,				-- centerY
						x-0.137,				-- posX
						y-0.057,				-- posY
						0.0,				-- rotation
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						}
					)
					end
					end
					if currentheme == "discord" then
						if menu.command_box_is_open() then 
						
						
						directx.draw_rect(	------------------- background  rect
						0.345,				-- X
						0.088,				-- Y 
						0.3105,				-- width
						cmd_height+0.005,				-- height
						{["r"] = 0.211,["g"] = 0.223,["b"] = 0.247,["a"] = 1.0}			-- colour
						)
						directx.draw_texture(				----discord chat cmd box
						dccmd_tex,			-- id
							0.036,				-- sizeX
							0.036,				-- sizeY
							0.0,				-- centerX
							0.0,				-- centerY
							0.345,				-- posX
							0.08,				-- posY
							0.0,				-- rotation
							{					-- colour
								["r"] = 1.0,
								["g"] = 1.0,
								["b"] = 1.0,
								["a"] = 1.0
								}
						)
						end
						if menu.is_open() then ---------------------------------THEME------------------
							
							directx.draw_texture(				---- profile 
							profile_tex,		-- id
							dcprof_size,				-- sizeX
							dcprof_size,				-- sizeY
							0.0,				-- centerX
							0.0,				-- centerY
							x-0.0955,					-- posX 
							y+0.2488,					-- posY
							0.0,				-- rotation
							dcprofileimage_color --color			
						)	
							
							directx.draw_texture(				---- window
							dcbg_tex,				-- id
							0.18,				-- sizeX
							0.18,				-- sizeY
							0.0,				-- centerX
							0.0,				-- centerY
							x-0.131,					-- posX 
							y-0.06,					-- posY
							0.0,				-- rotation
							dcbg_c				-- colour
						)	
						
							
						directx.draw_text(	-------------------  profile name text
							x-0.077,			-- x 
							y+0.258,				-- y 
							dcprofile_name,			-- text
							ALIGN_TOP_LEFT,		-- alignment
							0.37,				-- scale
							dcprofilenametext_color,	-- colour
							false				
						)
								directx.draw_text(	-------------------  window name text
							x-0.082,			-- x 
							y-0.035,				-- y 
							dcwindow_name,			-- text
							ALIGN_TOP_LEFT,		-- alignment
							0.7,				-- scale
							dciname_color,	-- colour
							false				
						)

						directx.draw_text(	-------------------  address bar text
						x+0.013,			-- x 
						y-0.035,				-- y 
						pos_txt,			-- text
						ALIGN_TOP_LEFT,		-- alignment
						0.6,				-- scale
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						},	-- colour
						false				
					)
				
						end
					end
					if currentheme == "guilded" then
						if menu.command_box_is_open() then 
						
						
							directx.draw_rect(	------------------- background  rect
							0.345,				-- X
							0.088,				-- Y 
							0.3175,				-- width
							cmd_height+0.006,				-- height
							{["r"] = 0.215,["g"] = 0.223,["b"] = 0.262,["a"] = 1.0}			-- colour
							)
							directx.draw_texture(				----discord chat cmd box
							gcmd_tex,			-- id
								0.036,				-- sizeX
								0.036,				-- sizeY
								0.0,				-- centerX
								0.0,				-- centerY
								0.345,				-- posX
								0.08,				-- posY
								0.0,				-- rotation
								{					-- colour
									["r"] = 1.0,
									["g"] = 1.0,
									["b"] = 1.0,
									["a"] = 1.0
									}
							)
							end
						if menu.is_open() then ---------------------------------THEME------------------
							
							directx.draw_texture(				---- profile 
							profile_tex,		-- id
							gprof_size,				-- sizeX
							gprof_size,				-- sizeY
							0.0,				-- centerX
							0.0,				-- centerY
							x-0.113,					-- posX 
							y+0.345,					-- posY
							0.0,				-- rotation
							gprofileimage_color --color			
						)	
							
							directx.draw_texture(				---- window
							gbg_tex,				-- id
							0.18,				-- sizeX
							0.18,				-- sizeY
							0.0,				-- centerX
							0.0,				-- centerY
							x-0.149,					-- posX 
							y-0.095,					-- posY
							0.0,				-- rotation
							gbg_c				-- colour
						)	
						
							
						directx.draw_text(	-------------------  profile name text
							x-0.095,			-- x 
							y+0.353,				-- y 
							dcprofile_name,			-- text
							ALIGN_TOP_LEFT,		-- alignment
							0.4,				-- scale
							gprofilenametext_color,	-- colour
							false				
						)
						
						directx.draw_text(	-------------------  address bar text
						x+0.013,			-- x 
						y-0.06,				-- y 
						pos_txt,			-- text
						ALIGN_TOP_LEFT,		-- alignment
						0.6,				-- scale
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						},	-- colour
						false				
					)
				
						end
					end
					if currentheme == "wii" then
						if menu.command_box_is_open() then 
						
							directx.draw_texture(				----wiiu for cmd box
						wiiu_tex,			-- id
						0.155,				-- sizeX
						0.155,				-- sizeY
						0.0,				-- centerX
						0.0,				-- centerY
						0.28,				-- posX
						0.012,				-- posY
						0.0,				-- rotation
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						}
					)
						
						end
						if menu.is_open() then ---------------------------------THEME------------------
							
							
							
						directx.draw_texture(				---- wallpaper
						wii_home_tex,			-- id
						wiisize_wlhome,				-- sizeX
						wiisize_wlhome,				-- sizeY
						0.5,				-- centerX
						0.5,				-- centerY
						x+wiihwp_posX,				-- posX
						y+wiihwp_posY,				-- posY
						0.0,				-- rotation
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						}
					)	
						directx.draw_texture(				----tv frame
						tv_frame,			-- id
						0.151,				-- sizeX
						0.151,				-- sizeY
						0.0,				-- centerX
						0.0,				-- centerY
						x-0.06,				-- posX
						y-0.082,				-- posY
						0.0,				-- rotation
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						}
					)

					directx.draw_texture(				----wii 
						wii_tex,			-- id
						0.1,				-- sizeX
						0.1,				-- sizeY
						0.0,				-- centerX
						0.0,				-- centerY
						0.86,				-- posX
						0.6,				-- posY
						0.0,				-- rotation
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						}
					)

					directx.draw_text(	-------------------  clock text
						x+0.07,			-- x 
						y-0.027,				-- y 
						hc..":"..mc,			-- text
						ALIGN_TOP_LEFT,		-- alignment
						0.9,				-- scale
						{					-- colour
							["r"] = 0.5,
							["g"] = 0.5,
							["b"] = 0.5,
							["a"] = 1.0
						},	-- colour
						false				
					)

					directx.draw_text(	------------------- address bar text
						x+0.07,			-- x 
						y-0.07,				-- y 
						pos_txt,			-- text
						ALIGN_TOP_LEFT,		-- alignment
						0.8,				-- scale
						{					-- colour
							["r"] = 0.8,
							["g"] = 0.8,
							["b"] = 0.8,
							["a"] = 1.0
						},	-- colour
						false				
					)
				
					end
				end
				if currentheme == "sfr" then
						if menu.is_open() then ---------------------------------THEME------------------
								
							directx.draw_texture(		---------------------------- bg texture
							sfrbg_tex,				-- id
							sfrbg_size,			-- sizeX
							sfrbg_size,			-- sizeY
							0.0,				-- centerX
							0.0,				-- centerY
							x,			-- posX 
							y-0.055,		 	-- posY 
							1.0,			-- rotation
							sfrbg_colour			--colour
						)
						directx.draw_text(	-------------------  clock text
						x+0.2,			-- x 
						y+0.342,				-- y 
						hc..":"..mc,			-- text
						ALIGN_TOP_LEFT,		-- alignment
						0.4,				-- scale
						{					-- colour
							["r"] = 1.0,
							["g"] = 1.0,
							["b"] = 1.0,
							["a"] = 1.0
						},	-- colour
						false				
					)
					
						end
					end
					if currentheme=="impulse" then
						if menu.command_box_is_open() then 
							directx.draw_rect(	------------------- rect (select)
							0.358,				-- X
							0.092,				-- Y 
							0.2848,				-- width
							0.05,				-- height
							imp_select_colour			-- colour
							)
							directx.draw_rect(	------------------- background black rect
							0.358,				-- X
							0.13,				-- Y 
							0.2848,				-- width
							cmd_height-0.03,				-- height
							{["r"] = 0.047,["g"] = 0.070,["b"] = 0.141,["a"] = 1.0}			-- colour
							)
						end
						if menu.is_open() then ---------------------------------THEME------------------
						   
								width=width+0.0001 
								y=y-(32/1080) --remove a row
		
								directx.draw_rect(	------------------- background select rect
								x,				-- X 
								y-0.0065,				-- Y 
								width,				-- width
								menu_height+0.04,				-- height
								imp_select_colour			-- colour
							)

							directx.draw_rect(	------------------- background top rect
								x,				-- X
								y-0.005,				-- Y 
								width,				-- width
								0.035,				-- height
								imp_bars_colour			-- colour
							)
							directx.draw_rect(	------------------- background rect footer
								x,				-- X 
								y+menu_height+(32/1080)+0.002,				-- Y 
								width,				-- width
								0.035,				-- height
								imp_bars_colour			-- colour
							)
							
							directx.draw_texture(	---------------- footer logo  
							imp_logo_tex,			-- id
								0.008,				-- sizeX
								0.008,				-- sizeY
								0.5,				-- centerX
								0.0,				-- centerY
								x+(width/2),			-- posX
								y+menu_height+0.035,			-- posY
								0.0,				-- rotation
								{	
									["r"] = 1.0,		-- colour
									["g"] = 1.0,
									["b"] = 1.0,
									["a"] = 1.0
								}				
							)
							directx.draw_text(	-------------------  address bar text
								x+0.002,			-- x 
								y+menu_height+0.04,				-- y 
								pos_txt,			-- text
								ALIGN_TOP_LEFT,		-- alignment
								0.6,				-- scale
								{					-- colour
									["r"] = 1.0,
									["g"] = 1.0,
									["b"] = 1.0,
									["a"] = 1.0
								},	-- colour
								false				
							)
						
						end
						end
					
			util.yield() 
		end
		
	while true do  
		util.yield()
	end