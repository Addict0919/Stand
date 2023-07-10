local menu = menu
local players = players
local players_list = players.list

local SetRelationshipToPlayer = SetRelationshipToPlayer

local GhostState, _GhostState = {}, {}
local MenuPlayer = {}
local config, Menu
return{
	init	=	function()
					local toboolean = toboolean -- require'toboolean'
					config = configFileRead("MenuGhost.ini")
					if config.GhostAll == nil then
						config.GhostAll = false
					end
					config.GhostAll = toboolean(config.GhostAll)
					if config.GhostGod == nil then
						config.GhostGod = false
					end
					config.GhostGod = toboolean(config.GhostGod)
					
					Menu = menu.list(menu.my_root(), "Ghosting", {}, "")
					
					local menu_toggle = menu.toggle
					
					menu_toggle(Menu, "Ghost All", {}, "Automatically ghost all players?", function(state)
						config.GhostAll = state
						
						local Players = players_list(false,true,true)
						for i=1, #Players do
							local Player = Players[i]
							GhostState[Player] = state
							SetRelationshipToPlayer(Player, state)
						end
					end, config.GhostAll)
					
					menu_toggle(Menu, "Ghost God", {}, "Automatically ghost invincible players?", function(state)
						config.GhostGod = state
					end, config.GhostGod)
					
					local players_exists = players.exists
					local menu_player_root = menu.player_root
					local menu_divider = menu.divider
					local menu_action = menu.action
					local function MenuPlayerCreate(Player)
						if players_exists(Player) then
							local Menu = menu_player_root(Player)
							local _Menu = {0,0}
							_Menu[1] = menu_divider(Menu, "Ghosting")
							_Menu[2] = menu_action(Menu, "Toggle Ghost", {}, "", function()
								local state = not GhostState[Player]
								GhostState[Player] = state
								_GhostState[Player] = state
								SetRelationshipToPlayer(Player, state)
							end)
							MenuPlayer[Player] = _Menu
						end
					end
					
					local config = config
					do
						local config = config
						local Players = players_list(true,true,true)
						for i=1, #Players do
							local Player = Players[i]
							
							MenuPlayerCreate(Player)
							
							if config.GhostAll then
								GhostState[Player] = true
								SetRelationshipToPlayer(Player, true)
							end
						end
					end
					
					players.on_join(function(Player)
						MenuPlayerCreate(Player)
						if config.GhostAll then
							while players_exists(Player) and GetPlayerPed(Player) == 0 do
								Wait()
							end
							Wait(2500)
							if players_exists(Player) then
								GhostState[Player] = true
								SetRelationshipToPlayer(Player, true)
							end
						end
					end)
					players.on_leave(function(Player)
						GhostState[Player], _GhostState[Player], MenuPlayer[Player] = false, false, nil
					end)
				end,
	loop	=	function(Info)
					if config.GhostGod and not config.GhostAll then
						local Players = players_list(false,true,true)
						for i=1, #Players do
							local Player = Players[i]
							if not _GhostState[Player] then
								local Ped = GetPlayerPed(Player)
								local state = DoesEntityExist(Ped) and GetEntityCanBeDamaged(Ped) and IsEntityVisible(Ped)
								if state then
									local Veh = GetVehiclePedIsUsing(Ped)
									--local Veh = GetVehiclePedIsIn(Ped, false)
									if DoesEntityExist(Veh) then
										state = GetEntityCanBeDamaged(Veh) and IsEntityVisible(Veh)
									end
								end
								
								state = not state
								
								if state ~= GhostState[Player] then
									GhostState[Player] = state
									SetRelationshipToPlayer(Player, state)
								end
							end
						end
					end
				end,
	stop	=	function()
					config = configFileWrite("MenuGhost.ini", config) -- Writes settings to ini and sets config to nil
					
					local menu_delete = menu.delete
					menu_delete(Menu)
					
					local type = type
					for i=0,31 do
						local _MenuPlayer = MenuPlayer[i]
						if type(_MenuPlayer)=='table' then
							menu_delete(_MenuPlayer[1]) menu_delete(_MenuPlayer[2]) MenuPlayer[i] = nil
						end
						if GhostState[i] then
							GhostState[i], _GhostState[i] = false, false
							SetRelationshipToPlayer(i, false)
						end
					end
				end,
}