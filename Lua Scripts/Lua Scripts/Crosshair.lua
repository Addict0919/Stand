--Crosshair lua by CocoW V0.1 (Thanks 41Baloo#4141 for the idea) 

local crosshair_file = "cr1.png" -- default file name

local crosshair_tex = directx.create_texture(filesystem.scripts_dir() .. crosshair_file) -- crosshair file

local cr_posX = 0.5 --default position X
local cr_posY = 0.5 --default position Y

local cr_size = 0.03 --default size

--Default rotation
local rotation = 0.0
local intensity = 0.01

GenerateFeatures = function()
 menu.divider(menu.my_root(), "Crosshair options")
menu.toggle(menu.my_root(),"Hide crosshair", {"crhide"}, "Hide the crosshair.",function(pog)	
	cr = pog --like an on / off
end)
menu.action(menu.my_root(), "Change crosshair file name", {"crfilename"}, "The new file file must be in Lua Scripts of stand (put .png / .jpeg in the name)", function(click_type)  --input text 
    menu.show_command_box_click_based(click_type, "crfilename ")
end, function(arg)
    crosshair_file = arg
	crosshair_tex = directx.create_texture(filesystem.scripts_dir() .. crosshair_file) 
end, "crfilename [text]")
menu.slider(menu.my_root(), "Resize crosshair", {"crsize"}, "", 1, 10000, 300, 1, function(size)
	cr_size=size/10000
end)
menu.slider(menu.my_root(), "Crosshair X position", {"crx"}, "", -100000, 100000, 5000, 1, function(x)
	cr_posX=x/10000
end)
menu.slider(menu.my_root(), "Crosshair Y position", {"cry"}, "", -100000, 100000, 5000, 1, function(y)
	cr_posY=y/10000
end)
menu.toggle(menu.my_root(),"Rotate corsshair", {"crrot"}, "Rotate the crosshair.",function(pog)	
	crot = pog --like an on / off
end)
menu.slider(menu.my_root(), "Rotation intensity", {"crotint"}, "", -100, 100, 10, 1, function(int)
	intensity=int/1000
end)
menu.action(menu.my_root(), "Default rotation", {}, "", function() --Default rotoation 
	rotation = 0.0
end)
end

GenerateFeatures()

while true do 
					-------rotation thing
	if crot then
		rotation = rotation+intensity
	else
	    
	end

	if cr then ---------------------------------CROSSHAIR----------------------------------------
		--nothing (hide it = off)
	else
		directx.draw_texture(		----crosshair (on)
		crosshair_tex,	-- id
		cr_size,			-- sizeX
		cr_size,			-- sizeY
		0.5,				-- centerX
		0.5,				-- centerY
		cr_posX,			-- posX
		cr_posY,			-- posY
		rotation,				-- rotation
		{					-- colour
			["r"] = 1.0,
			["g"] = 1.0,
			["b"] = 1.0,
			["a"] = 1.0
		}
	)
	end	
		util.yield() 
end

while true do  
	util.yield()
end


