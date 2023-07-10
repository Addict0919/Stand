local Info = Info
local RequestEntityModel = require'RequestEntityModel'
local RequestAnimDict = require'RequestAnimDict'
local util_yield = util.yield
local IsEntityDead = IsEntityDead
local util_create_thread = util.create_thread
local CreateObject = CreateObject
local AttachEntityToEntity = AttachEntityToEntity
local GetPedBoneIndex = GetPedBoneIndex
local ClearPedTasks = ClearPedTasks
local SetCurrentPedWeapon = SetCurrentPedWeapon
local TaskTurnPedToFaceEntity = TaskTurnPedToFaceEntity
local TaskPlayAnim = TaskPlayAnim
local HasEntityAnimFinished = HasEntityAnimFinished
local RemoveAnimDict = RemoveAnimDict
local DetachEntity = DetachEntity
local memory_write_int = memory.write_int
local DeleteObject = DeleteObject
local DoesEntityExist = DoesEntityExist
local PlaySoundFromEntity = PlaySoundFromEntity

local Weapon = GetHashKey("WEAPON_UNARMED")
local KeyFobHash = GetHashKey("p_car_keys_01")
local KeyFobAnimDict = "anim@mp_player_intmenu@key_fob@"--[[memory.alloc() memory.write_string(KeyFobAnimDict, "anim@mp_player_intmenu@key_fob@")]]
local KeyFobAnimName = "fob_click"--[[memory.alloc() memory.write_string(KeyFobAnimName, "fob_click")]]
--local KeyFobAudioName = "Remote_Control_Fob"
local KeyFobAudioName = memory.alloc() memory.write_string(KeyFobAudioName, "Remote_Control_Fob")
--local KeyFobAudioRef = "PI_Menu_Sounds"
local KeyFobAudioRef = memory.alloc() memory.write_string(KeyFobAudioRef, "PI_Menu_Sounds")
local _KeyFobObject = memory.alloc()

return function(Vehicle_Id, SkipAnims)
	local Player = Info.Player
	local Player_Ped = Player.Ped
	local Vehicle = Player.Vehicle
	local Vehicle_Id = Vehicle_Id or Vehicle.Id
	local KeyFobObject = 0
	local AudioSource = 0
	if not IsEntityDead(Player_Ped, false) and not Vehicle.IsIn then
		util_create_thread(function()
			if not SkipAnims and RequestEntityModel(KeyFobHash) then
				KeyFobObject = CreateObject(KeyFobHash, 0.0, 0.0, 0.0, true, true, true)
				AttachEntityToEntity(KeyFobObject, Player_Ped, GetPedBoneIndex(Player_Ped, 57005), 0.09, 0.03, -0.02, -76, 13, 28, false, true, true, true, 0, true)
				
				ClearPedTasks(Player_Ped)
				SetCurrentPedWeapon(Player_Ped, Weapon, true)
				
				TaskTurnPedToFaceEntity(Player_Ped, (Vehicle_Id), 1000)
				
				if RequestAnimDict(KeyFobAnimDict) then
					TaskPlayAnim(Player_Ped, KeyFobAnimDict, "fob_click_fp", 8.0, 8.0, -1, 48, 1.0, false, false, false)
					--[[
					local Finished = HasEntityAnimFinished(Player_Ped, KeyFobAnimDict, KeyFobAnimName, 3)
					while not Finished do
						util_yield()
						Finished = HasEntityAnimFinished(Player_Ped, KeyFobAnimDict, KeyFobAnimName, 3)
						print(Finished)
					end
					]]
					RemoveAnimDict(KeyFobAnimDict)
				end
				
				util_yield(1000)
				
				DetachEntity(KeyFobObject, false, false)
				memory_write_int(_KeyFobObject, KeyFobObject)
				DeleteObject(_KeyFobObject)
				KeyFobObject = 0
			end
		end)
	end
	if not SkipAnims then
		util_yield(250)
	end
	AudioSource = KeyFobObject
	if not DoesEntityExist(AudioSource) then
		AudioSource = Player_Ped
	end
	PlaySoundFromEntity(-1, KeyFobAudioName, AudioSource, KeyFobAudioRef, true, 0)
end