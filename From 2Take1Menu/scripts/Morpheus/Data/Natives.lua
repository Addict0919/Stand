local natives = {}

function natives.SET_PROFILE_SETTING_PROLOGUE_COMPLETE()
	return native.call(0xB475F27C6A994D65)
end

function natives.NETWORK_GET_NETWORK_ID_FROM_ENTITY(Entityentity)
	return native.call(0xA11700682F3AD45C, Entityentity):__tointeger()
end

function natives.GET_ENTITY_MODEL(entity)
	return native.call(0x9F47B058362C84B5, entity):__tointeger()
end

function natives.GET_PED_IN_VEHICLE_SEAT(vehicle, seatIndex, p2)
	return native.call(0xBB40DD2270B65366, vehicle, seatIndex, p2):__tointeger()
end

function natives.IS_VEHICLE_SEAT_FREE(vehicle, seatIndex, isTaskRunning)
	return native.call(0x22AC59A870E6A669, vehicle, seatIndex, isTaskRunning):__tointeger() ~= 0
end

function natives.LOCK_DOORS_WHEN_NO_LONGER_NEEDED(vehicle)
	return native.call(0xCFD778E7904C255E, vehicle)
end

function natives.SET_VEHICLE_CAN_SAVE_IN_GARAGE(vehicle, toggle)
	return native.call(0x428BACCDF5E26EAD, vehicle, toggle)
end

function natives.GET_HAS_ROCKET_BOOST(Vehiclevehicle)
    return native.call(0x36D782F68B309BDA, Vehiclevehicle):__tointeger() == 1
end

function natives.SET_VEHICLE_ROCKET_BOOST_PERCENTAGE(Vehiclevehicle, floatpercentage)
    return native.call(0xFEB2DDED3509562E, Vehiclevehicle, floatpercentage)
end

function natives.SET_VEHICLE_ROCKET_BOOST_REFILL_TIME(Vehiclevehicle, floatseconds)
    return native.call(0xE00F2AB100B76E89, Vehiclevehicle, floatseconds)
end

function natives.SET_VEHICLE_ROCKET_BOOST_ACTIVE(Vehiclevehicle, BOOLactive)
    return native.call(0x81E1552E35DC3839, Vehiclevehicle, BOOLactive)
end

function natives.SET_INVERT_VEHICLE_CONTROLS(vehicle, state)
	return native.call(0x5B91B229243351A8, vehicle, state)
end

function natives.NETWORK_SESSION_CHANGE_SLOTS(p0, p1)
	return native.call(0xB4AB419E0D86ACAE, p0, p1)
end

function natives.PLAYER_ID()
	return native.call(0x4F8644AF03D0E0D6):__tointeger()
end

function natives.PLAYER_PED_ID()
	return native.call(0xD80958FC74E988A6):__tointeger()
end

function natives.SET_REMOTE_PLAYER_AS_GHOST(player, p1)
	return native.call(0xA7C511FA1C5BDA38, player, p1)
end

function natives.PED_TO_NET(Pedped)
	return native.call(0x0EDEC3C276198689, Pedped):__tointeger()
end

function natives.IS_PED_JACKING(ped)
	return native.call(0x4AE4FF911DFB61DA, ped):__tointeger() ~= 0
end

function natives.VEH_TO_NET(Vehiclevehicle)
	return native.call(0xB4C94523F023419C, Vehiclevehicle):__tointeger()
end

function natives.GET_VEHICLE_MODEL_VALUE(vehicleModel)
	return native.call(0x5873C14A52D74236, vehicleModel):__tointeger()
end

function natives.GET_VEHICLE_PED_IS_IN(ped, includeLastVehicle)
	return native.call(0x9A9112A0FE9A4713, ped, includeLastVehicle):__tointeger()
end

function natives.OBJ_TO_NET(Objectobject)
	return native.call(0x99BFDC94A603E541, Objectobject):__tointeger()
end

function natives.BREAK_OBJECT_FRAGMENT_CHILD(p0, p1, p2)
	return native.call(0xE7E4C198B0185900, p0, p1, p2)
end

function natives.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(player,model)
	return native.call(0xDC80A4C2F18A2B64, player, model)
end

function natives.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(player)
	return native.call(0x10C54E4389C12B42, player)
end

function natives.SET_RADAR_ZOOM_PRECISE(zoom)
	return native.call(0xBD12C5EEE184C337, zoom)
end

function natives.SET_ENTITY_PROOFS(Entityentity, BOOLbulletProof, BOOLfireProof, BOOLexplosionProof, BOOLcollisionProof, BOOLmeleeProof, BOOLsteamProof, BOOLp7, BOOLdrownProof)
	return native.call(0xFAEE099C6F890BB8, Entityentity, BOOLbulletProof, BOOLfireProof, BOOLexplosionProof, BOOLcollisionProof, BOOLmeleeProof, BOOLsteamProof, BOOLp7, BOOLdrownProof):__tointeger() ~= 0
end

function natives.NETWORK_CAN_BAIL()
	return native.call(0x580CE4438479CC61):__tointeger() == 1
end

function natives.NETWORK_BAIL(intp0, intp1, intp2)
	return native.call(0x95914459A87EBA28, intp0, intp1, intp2)
end

function natives.NETWORK_SESSION_END(BOOLp0, BOOLp1)
	return native.call(0xA02E59562D711006, BOOLp0, BOOLp1)
end

function natives.NETWORK_SESSION_LEAVE_SINGLE_PLAYER()
	return native.call(0x3442775428FD2DAA)
end

function natives.SET_VEHICLE_INTERIOR_COLOR(Vehiclevehicle, intcolor)
	return native.call(0xF40DD601A65F7F19, Vehiclevehicle, intcolor)
end

function natives.SET_VEHICLE_DASHBOARD_COLOR(Vehiclevehicle, intcolor)
	return native.call(0x6089CDF6A57F326C, Vehiclevehicle, intcolor)
end

function natives.SET_VEHICLE_LIVERY(Vehiclevehicle, intlivery)
	return native.call(0x60BF608F1B8CD1B6, Vehiclevehicle, intlivery)
end

function natives.SET_VEHICLE_DIRT_LEVEL(Vehiclevehicle, floatdirtLevel)
	return native.call(0x79D3B596FE44EE8B, Vehiclevehicle, floatdirtLevel)
end

function natives.RAISE_CONVERTIBLE_ROOF(Vehiclevehicle, BOOLinstantlyRaise)
	return native.call(0x8F5FB35D7E88FC70, Vehiclevehicle, BOOLinstantlyRaise)
end

function natives.SET_SIREN_WITH_NO_DRIVER(Vehiclevehicle, BOOLtoggle)
	return native.call(0x1FEF0683B96EBCF2, Vehiclevehicle, BOOLtoggle)
end

function natives.SET_SIREN_KEEP_ON(Vehiclevehicle, BOOLtoggle)
	return native.call(0xF584CF8529B51434, Vehiclevehicle, BOOLtoggle)
end

function natives.SET_VEHICLE_SIREN(Vehiclevehicle, BOOLtoggle)
	return native.call(0xF4924635A19EB37D, Vehiclevehicle, BOOLtoggle)
end

function natives.SET_VEHICLE_RADIO_LOUD(Vehiclevehicle, BOOLtoggle)
	return native.call(0xBB6F1CAEC68B0BCE, Vehiclevehicle, BOOLtoggle)
end

function natives.SET_VEHICLE_NEON_LIGHTS_COLOUR(Vehiclevehicle, intr, intg, intb)
	return native.call(0x8E0A582209A62695, Vehiclevehicle, intr, intg, intb)
end

function natives.SET_VEHICLE_DOOR_BROKEN(Vehiclevehicle, intdoorId, BOOLdeleteDoor)
	return native.call(0xD4D4F6A4AB575A33, Vehiclevehicle, intdoorId, BOOLdeleteDoor)
end

function natives.SET_VEHICLE_FIXED(vehicle)
	return native.call(0x115722B1B9C14C1C, vehicle)
end

function natives.SET_VEHICLE_ENGINE_HEALTH(vehicle, health)
	return native.call(0x45F6D8EEF34ABEF1, vehicle, health)
end

function natives.SET_VEHICLE_CAN_LEAK_PETROL(vehicle, toggle)
	return native.call(0x192547247864DFDD, vehicle, toggle)
end

function natives.GET_VEHICLE_PETROL_TANK_HEALTH(vehicle)
	return native.call(0x7D5DABE888D2D074, vehicle):__tonumber()
end

function natives.SET_ENTITY_LOD_DIST(Entityentity, intvalue)
	return native.call(0x5927F96A78577363, Entityentity, intvalue)
end

function natives.SET_ENTITY_MAX_HEALTH(Entityentity, intvalue)
	return native.call(0x166E7CF68597D8B5, Entityentity, intvalue)
end

function natives.SET_ENTITY_HEALTH(Entityentity, inthealth, intp2)
	return native.call(0x6B76DC1F3AE6E6A3, Entityentity, inthealth, intp2)
end

function natives.SET_ENTITY_HAS_GRAVITY(Entityentity, BOOLtoggle)
	return native.call(0x4A4722448F18EEF5, Entityentity, BOOLtoggle)
end

function natives.SET_ENTITY_ALPHA(entity, alphaLevel, skin)
	return native.call(0x44A0870B7E92D7C0, entity, alphaLevel, skin)
end

function natives.START_ENTITY_FIRE(Entityentity)
	return native.call(0xF6A9D9708F6F23DF, Entityentity)
end

function natives.SET_ENTITY_ONLY_DAMAGED_BY_PLAYER(Entityentity, BOOLtoggle)
	return native.call(0x79F020FF9EDC0748, Entityentity, BOOLtoggle)
end

function natives.PROCESS_ENTITY_ATTACHMENTS(Entityentity)
	return native.call(0xF4080490ADC51C6F, Entityentity)
end

function natives.DETACH_ENTITY(entity, dynamic, collision)
	return native.call(0x961AC54BF0613F5D, entity, dynamic, collision)
end

function natives.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(ped, p1)
	return native.call(0x3B390A939AF0B5FC, ped, p1):__tointeger()
end

function natives.REMOVE_ALL_PROJECTILES_OF_TYPE(weaponHash, explode)
	return native.call(0xFC52E0F37E446528, weaponHash, explode)
end

function natives.SET_PICKUP_AMMO_AMOUNT_SCALER(p0)
	return native.call(0xE620FD3512A04F18, p0)
end

function natives.IS_PED_ARMED(ped, typeFlags)
	return native.call(0x475768A975D5AD17, ped, typeFlags):__tointeger() ~= 0
end

function natives.TASK_STAND_STILL(Pedped, inttime)
	return native.call(0x919BE13EED931959, Pedped, inttime)
end

function natives.TASK_VEHICLE_HELI_PROTECT(pilot, vehicle, entityToFollow, targetSpeed, drivingFlags, radius, altitude, heliFlags)
	return native.call(0x1E09C32048FEFD1C, pilot, vehicle, entityToFollow, targetSpeed, drivingFlags, radius, altitude, heliFlags)
end

function natives.GET_PLAYER_NAME(Playerplayer)
	return native.call(0x6D0DE6A7B5DA71F8, Playerplayer):__tostring(true)
end

function natives.NETWORK_PLAYER_GET_NAME(Playerplayer)
	return native.call(0x7718D2E2060837D2, Playerplayer):__tostring(true)
end

function natives.NETWORK_HANDLE_FROM_PLAYER(Playerplayer, intgamerHandleSize)
	local Buffer16 = native.ByteBuffer16()
	native.call(0x388EB2B86C73B6B3, Playerplayer, Buffer16, intgamerHandleSize)
	return Buffer16
end

function natives.NETWORK_GAMERTAG_FROM_HANDLE_START(AnygamerHandle)
	return native.call(0x9F0C0A981D73FA56, AnygamerHandle):__tointeger() == 1
end

function natives.NETWORK_GET_GAMERTAG_FROM_HANDLE(AnygamerHandle)
	return native.call(0x426141162EBE5CDB, AnygamerHandle):__tostring(true)
end

function natives.NETWORK_GAMERTAG_FROM_HANDLE_SUCCEEDED()
	return native.call(0xFD00798DBA7523DD):__tointeger() == 1
end

function natives.NETWORK_PLAYER_IS_ROCKSTAR_DEV(Playerplayer)
	return native.call(0x544ABDDA3B409B6D, Playerplayer):__tointeger() == 1
end

function natives.NETWORK_PLAYER_INDEX_IS_CHEATER(Playerplayer)
	return native.call(0x565E430DB3B05BEC, Playerplayer):__tointeger() == 1
end

function natives.GET_NUMBER_OF_REFERENCES_OF_SCRIPT_WITH_NAME_HASH(HashscriptHash)
	return native.call(0x2C83A9DA6BFFC4F9, HashscriptHash):__tointeger()
end

function natives.REQUEST_SCRIPT(constcharscriptName)
	return native.call(0x6EB5F71AA68F2E8E, constcharscriptName)
end

function natives.NETWORK_REQUEST_TO_BE_HOST_OF_THIS_SCRIPT()
	return native.call(0x741A3D8380319A81)
end

function natives.NETWORK_GET_THIS_SCRIPT_IS_NETWORK_SCRIPT()
	return native.call(0x2910669969E9535E):__tointeger() == 1
end

function natives.NETWORK_OVERRIDE_SEND_RESTRICTIONS_ALL(toggle)
	return native.call(0x57B192B4D4AD23D5, toggle)
end

function natives.NETWORK_OVERRIDE_RECEIVE_RESTRICTIONS(player, toggle)
	return native.call(0xDDF73E2B1FEC5AB4, player, toggle)
end

function natives.NETWORK_OVERRIDE_RECEIVE_RESTRICTIONS_ALL(toggle)
	return native.call(0x0FF2862B61A58AF9, toggle)
end

function natives.NETWORK_OVERRIDE_CHAT_RESTRICTIONS(player, toggle)
	return native.call(0x3039AE5AD2C9C0C4, player, toggle)
end

function natives.NETWORK_SET_NO_SPECTATOR_CHAT(toggle)
	return native.call(0xF46A1E03E8755980, toggle)
end

function natives.NETWORK_OVERRIDE_SEND_RESTRICTIONS(player, toggle)
	return native.call(0x97DD4C5944CC2E6A, player, toggle)
end

function natives.NETWORK_PLAYER_IS_ROCKSTAR_DEV(player)
	return native.call(0x544ABDDA3B409B6D, player):__tointeger() ~= 0
end

function natives.NETWORK_PLAYER_INDEX_IS_CHEATER(player)
	return native.call(0x565E430DB3B05BEC, player):__tointeger() ~= 0
end

function natives.GET_VEHICLE_DIRT_LEVEL(Vehiclevehicle)
	return native.call(0x8F17BC8BA08DA62B, Vehiclevehicle):__tonumber()
end

function natives.GET_VEHICLE_INTERIOR_COLOR(Vehiclevehicle)
	local Buffer16 = native.ByteBuffer16()
	native.call(0x7D1464D472D32136, Vehiclevehicle, Buffer16)
	return Buffer16:__tointeger()
end

function natives.GET_VEHICLE_DASHBOARD_COLOR(Vehiclevehicle)
	local Buffer16 = native.ByteBuffer16()
	native.call(0xB7635E80A5C31BFF, Vehiclevehicle, Buffer16)
	return Buffer16:__tointeger()
end

function natives.SET_ENTITY_PROOFS(Entityentity, BOOLbulletProof, BOOLfireProof, BOOLexplosionProof, BOOLcollisionProof, BOOLmeleeProof, BOOLsteamProof, BOOLp7, BOOLdrownProof)
	return native.call(0xFAEE099C6F890BB8, Entityentity, BOOLbulletProof, BOOLfireProof, BOOLexplosionProof, BOOLcollisionProof, BOOLmeleeProof, BOOLsteamProof, BOOLp7, BOOLdrownProof)
end

function natives.SET_ENTITY_CAN_BE_DAMAGED(entity, toggle)
	return native.call(0x1760FFA8AB074D66, entity, toggle)
end

function natives.SET_ENTITY_INVINCIBLE(entity, toggle)
	return native.call(0x3882114BDE571AD4, entity, toggle)
end

function natives.GET_ENTITY_PROOFS(entity,bulletProof,fireProof,explosionProof,collisionProof,meleeProof,steamProof,p7,drownProof) -- Special Thanks Jay Montana
	local bulletProof = bulletProof or native.ByteBuffer8()
	local fireProof = fireProof or native.ByteBuffer8()
	local explosionProof = explosionProof or native.ByteBuffer8()
	local collisionProof = collisionProof or native.ByteBuffer8()
	local meleeProof = meleeProof or native.ByteBuffer8()
	local steamProof = steamProof or native.ByteBuffer8()
	local p7 = p7 or native.ByteBuffer8()
	local drownProof = drownProof or native.ByteBuffer8()
	local success = native.call(0xBE8CD9BE829BBEBF,entity,bulletProof,fireProof,explosionProof,collisionProof,meleeProof,steamProof,p7,drownProof):__tointeger() ~= 0
	return success, bulletProof:__tointeger() ~= 0 ,fireProof:__tointeger() ~= 0 ,explosionProof:__tointeger() ~= 0 ,collisionProof:__tointeger() ~= 0 ,meleeProof:__tointeger() ~= 0 ,steamProof:__tointeger() ~= 0 ,p7:__tointeger() ~= 0 ,drownProof:__tointeger() ~= 0
end

function natives.SET_NETWORK_ID_CAN_MIGRATE(intnetId, BOOLtoggle)
	return native.call(0x299EEB23175895FC, intnetId, BOOLtoggle)
end

function natives.GET_PED_MONEY(Pedped)
	return native.call(0x3F69145BBA87BAE7, Pedped):__tointeger()
end

function natives.SET_PED_MONEY(Pedped, intamount)
	return native.call(0xA9C8960E8684C1B5, Pedped, intamount)
end

function natives.NETWORK_GET_AVERAGE_LATENCY_FOR_PLAYER_2(Playerplayer)
	return native.call(0x0E3A041ED6AC2B45, Playerplayer):__tonumber()
end

function natives.NETWORK_GET_AVERAGE_PACKET_LOSS_FOR_PLAYER(Playerplayer)
	return native.call(0x350C23949E43686C, Playerplayer):__tonumber()
end

function natives.NETWORK_GET_ENTITY_IS_NETWORKED(Entityentity)
	return native.call(0xC7827959479DCC78, Entityentity):__tointeger() == 1
end

function natives.NETWORK_GET_ENTITY_NET_SCRIPT_ID(Entityentity)
	return native.call(0x815F18AD865F057F, Entityentity):__tointeger()
end

function natives.GET_ENTITY_SCRIPT(Entityentity, ScrHandlescript)
	return native.call(0xA6E9C38DB51D7748, Entityentity, ScrHandlescript):__tostring(true)
end

function natives.GET_ENTITY_COORDS(entity, alive)
	native.call(0x3FEF770D40960D5A, entity, alive):__tov3()
end

function natives.GET_VEHICLE_BODY_HEALTH(Vehiclevehicle)
	return native.call(0xF271147EB7B40F12, Vehiclevehicle):__tonumber()
end

function natives.SET_VEHICLE_PETROL_TANK_HEALTH(Vehiclevehicle, floathealth)
	return native.call(0x70DB57649FA8D0D8, Vehiclevehicle, floathealth)
end

function natives.DOES_CARGOBOB_HAVE_PICKUP_MAGNET(cargobob)
	return native.call(0x6E08BF5B3722BAC9, cargobob):__tointeger() ~= 0
end

function natives.SET_CARGOBOB_PICKUP_ROPE_TYPE(p0, p1) 
	return native.call(0x0D5F65A8F4EBDAB5, p0, p1)
end

function natives.CREATE_PICK_UP_ROPE_FOR_CARGOBOB(cargobob, state)
	return native.call(0x7BEB0C7A235F6F3B, cargobob, state) 
end

function natives.REMOVE_PICK_UP_ROPE_FOR_CARGOBOB(cargobob)
	return native.call(0x9768CF648F54C804, cargobob)
end

function natives.SET_CARGOBOB_PICKUP_MAGNET_STRENGTH(cargobob, strength)
	return native.call(0xBCBFCD9D1DAC19E2, cargobob, strength)
end

function natives.SET_CARGOBOB_PICKUP_MAGNET_FALLOFF(cargobob, p1)
	return native.call(0xA17BAD153B51547E, cargobob, p1)
end

function natives.SET_CARGOBOB_PICKUP_MAGNET_PULL_ROPE_LENGTH(vehicle, p1)
	return native.call(0x685D5561680D088B, vehicle, p1)
end

function natives.SET_PICKUP_ROPE_LENGTH_FOR_CARGOBOB(cargobob, length1, length2, p3)
	return native.call(0x877C1EAEAC531023, cargobob, length1, length2, p3)
end

function natives.SET_CARGOBOB_PICKUP_MAGNET_PULL_STRENGTH(cargobob, p1) 
	return native.call(0xED8286F71A819BAA, cargobob, p1)
end

function natives.GET_WORLD_POSITION_OF_ENTITY_BONE(Entityentity, intboneIndex)
	return native.call(0x44A8FCB8ED227738, Entityentity, intboneIndex)
end

function natives.GET_FIRST_BLIP_INFO_ID(intblipSprite)
	return native.call(0x1BEDE233E6CD2A1F, intblipSprite):__tointeger()
end

function natives.SET_BLIP_ROTATION(blip, rotation)
	return native.call(0xF87683CDF73C3F6E, blip, rotation)
end

function natives.GET_PLAYER_PED_SCRIPT_INDEX(player)
	return native.call(0x50FAC3A3E030A6E1, player):__tointeger()
end

function natives.SET_PED_INTO_VEHICLE(ped, vehicle, seatIndex)
	return native.call(0xF75B0D629E1C063D, ped, vehicle, seatIndex)
end

function natives.FREEZE_ENTITY_POSITION(Entityentity, BOOLtoggle)
	return native.call(0x428CA6DBD1094446, Entityentity, BOOLtoggle)
end

function natives.CHANGE_FAKE_MP_CASH(intcash, intbank)
	return native.call(0x0772DF77852C2E30, intcash, intbank)
end

function natives.CREATE_CAM_WITH_PARAMS(constcharcamName, floatposX, floatposY, floatposZ, floatrotX, floatrotY, floatrotZ, floatfov, BOOLp8, intp9)
	return native.call(0xB51194800B257161, constcharcamName, floatposX, floatposY, floatposZ, floatrotX, floatrotY, floatrotZ, floatfov, BOOLp8, intp9):__tointeger()
end

function natives.SET_CAM_ACTIVE(Camcam, BOOLactive)
	return native.call(0x026FB97D0A425F84, Camcam, BOOLactive)
end

function natives.RENDER_SCRIPT_CAMS(BOOLrender, BOOLease, inteaseTime, BOOLp3, BOOLp4, Anyp5)
	return native.call(0x07E5B515DB0636FC, BOOLrender, BOOLease, inteaseTime, BOOLp3, BOOLp4, Anyp5)
end

function natives.SET_CAM_COORD(Camcam, floatposX, floatposY, floatposZ)
	return native.call(0x4D41783FB745E42E, Camcam, floatposX, floatposY, floatposZ)
end

function natives.SET_CAM_ROT(Camcam, floatrotX, floatrotY, floatrotZ, introtationOrder)
	return native.call(0x85973643155D0B07, Camcam, floatrotX, floatrotY, floatrotZ, introtationOrder)
end

function natives.DESTROY_CAM(Camcam, BOOLbScriptHostCam)
	return native.call(0x865908C81A2C22E9, Camcam, BOOLbScriptHostCam)
end

function natives.IS_PLAYER_CONTROL_ON(Playerplayer)
	return native.call(0x49C32D60007AFA47, Playerplayer):__tointeger() == 1
end

function natives.GET_PED_PALETTE_VARIATION(Pedped, intcomponentId)
	return native.call(0xE3DD5F2A84B42281, Pedped, intcomponentId):__tointeger()
end

function natives.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(intnetId, Playerplayer, BOOLtoggle)
	return native.call(0xA8A024587329F36A, intnetId, Playerplayer, BOOLtoggle)
end

function natives.SET_NETWORK_ID_CAN_BE_REASSIGNED(intnetId, BOOLtoggle)
	return native.call(0x9D724B400A7E8FFC, intnetId, BOOLtoggle)
end

function natives.NETWORK_CONCEAL_ENTITY(Entityentity, BOOLtoggle)
	return native.call(0x1632BE0AC1E62876, Entityentity, BOOLtoggle)
end

function natives.IS_BIT_SET(intaddress, intoffset)
	return native.call(0xA921AA820C25702F, intaddress, intoffset):__tointeger() == 1
end

function natives.SET_BIT(intaddress, intoffset)
	native.call(0x933D6A9EEC1BACD0, intaddress, intoffset)
	return intaddress
end

function natives.NETWORK_DOES_NETWORK_ID_EXIST(intnetId)
	return native.call(0x38CE16C96BD11344, intnetId):__tointeger() == 1
end

function natives.SET_ENTITY_CLEANUP_BY_ENGINE(Entityentity, BOOLtoggle)
	return native.call(0x3910051CCECDB00C, Entityentity, BOOLtoggle)
end

function natives.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(intnetId, BOOLtoggle)
	return native.call(0xE05E81A888FA63C8, intnetId, BOOLtoggle)
end

function natives.NETWORK_GET_ENTITY_IS_LOCAL(Entityentity)
	return native.call(0x0991549DE4D64762, Entityentity):__tointeger() == 1
end

function natives.SET_PED_PATH_MAY_ENTER_WATER(Pedped, BOOLmayEnterWater)
	return native.call(0xF35425A4204367EC, Pedped, BOOLmayEnterWater)
end

function natives.SET_PED_PATH_PREFER_TO_AVOID_WATER(Pedped, BOOLavoidWater)
	return native.call(0x38FE1EC73743793C, Pedped, BOOLavoidWater)
end

function natives.SET_PED_TO_INFORM_RESPECTED_FRIENDS(Pedped, floatradius, intmaxFriends)
	return native.call(0x112942C6E708F70B, Pedped, floatradius, intmaxFriends)
end

function natives.SET_PED_KEEP_TASK(Pedped, BOOLtoggle)
	return native.call(0x971D38760FBC02EF, Pedped, BOOLtoggle)
end

function natives.SET_PED_CONFIG_FLAG(Pedped, intflagId, BOOLvalue)
	return native.call(0x1913FE4CBF41C463, Pedped, intflagId, BOOLvalue)
end

function natives.SET_PED_USING_ACTION_MODE(Pedped, BOOLp1, intp2, constcharaction)
	return native.call(0xD75ACCF5E0FB5367, Pedped, BOOLp1, intp2, constcharaction)
end

function natives.SET_PED_FLEE_ATTRIBUTES(Pedped, intattributeFlags, BOOLenable)
	return native.call(0x70A2D1137C8ED7C9, Pedped, intattributeFlags, BOOLenable)
end

function natives.TASK_LOOK_AT_ENTITY(Pedped, EntitylookAt, intduration, intunknown1, intunknown2)
	return native.call(0x69F4BE8C8CC4796C, Pedped, EntitylookAt, intduration, intunknown1, intunknown2)
end

function natives.SET_NETWORK_ID_PASS_CONTROL_IN_TUTORIAL(intnetId, BOOLstate)
	return native.call(0x3FA36981311FA4FF, intnetId, BOOLstate)
end

function natives.GET_ENTITY_HEALTH(Entityentity)
	return native.call(0xEEF059FAD016D209, Entityentity):__tointeger()
end

function natives.DECOR_IS_REGISTERED_AS_TYPE(constcharpropertyName, inttype)
	return native.call(0x4F14F9F870D6FBC8, constcharpropertyName, inttype):__tointeger() == 1
end

function natives.SET_PED_MOVEMENT_CLIPSET(Pedped, constcharclipSet, floattransitionSpeed)
	return native.call(0xAF8A94EDE7712BEF, Pedped, constcharclipSet, floattransitionSpeed)
end

function natives.RESET_PED_MOVEMENT_CLIPSET(Pedped, floatp1)
	return native.call(0xAA74EC0CB0AAEA2C, Pedped, floatp1)
end

function natives.SHAKE_GAMEPLAY_CAM(constcharshakeName, floatintensity)
	return native.call(0xFD55E49555E017CF, constcharshakeName, floatintensity)
end

function natives.SET_TIMECYCLE_MODIFIER(constcharmodifierName)
	return native.call(0x2C933ABF17A1DF41, constcharmodifierName)
end

function natives.SET_PED_IS_DRUNK(Pedped, BOOLtoggle)
	return native.call(0x95D2D383D5396B8A, Pedped, BOOLtoggle)
end

function natives.SET_PED_RAGDOLL_ON_COLLISION(Pedped, BOOLtoggle)
	return native.call(0xF0A4F1BBF4FA7497, Pedped, BOOLtoggle)
end

function natives.SET_ENTITY_MOTION_BLUR(Entityentity, BOOLtoggle)
	return native.call(0x295D82A8559F9150, Entityentity, BOOLtoggle)
end

function natives.CLEAR_AREA_OF_PROJECTILES(floatx, floaty, floatz, floatradius, intflags)
	return native.call(0x0A1CB9094635D1A6, floatx, floaty, floatz, floatradius, intflags)
end

function natives.FORCE_SOCIAL_CLUB_UPDATE()
	return native.call(0xEB6891F03362FB12)
end

function natives.UNLOCK_MINIMAP_POSITION()
	return native.call(0x3E93E06DB8EF1F30)
end

function natives.LOCK_MINIMAP_POSITION(floatx, floaty)
	return native.call(0x1279E861A329E73F, floatx, floaty)
end

function natives.GET_CAM_COORD(Camcam)
	return native.call(0xBAC038F7459AE5AE, Camcam):__tov3()
end

function natives.GET_CAM_ROT(Camcam, introtationOrder)
	return native.call(0x7D304C1C955E3E12, Camcam, introtationOrder):__tov3()
end

function natives.NETWORK_SESSION_MARK_VISIBLE(BOOLtoggle)
	return native.call(0x271CC6AB59EBF9A5, BOOLtoggle)
end

function natives.NETWORK_SESSION_BLOCK_JOIN_REQUESTS(BOOLtoggle)
	return native.call(0xA73667484D7037C3, BOOLtoggle)
end

function natives.NETWORK_SESSION_IS_VISIBLE()
	return native.call(0xBA416D68C631496A):__tointeger() == 1
end

function natives.CLEAR_PED_TASKS(Pedped)
	return native.call(0xE1EF3C1216AFF2CD, Pedped)
end

function natives.CLEAR_PED_SECONDARY_TASK(Pedped)
	return native.call(0x176CECF6F920D707, Pedped)
end

function natives.REQUEST_ADDITIONAL_COLLISION_AT_COORD(floatx, floaty, floatz)
	return native.call(0xC9156DC11411A9EA, floatx, floaty, floatz)
end

function natives.DISABLE_ALL_CONTROL_ACTIONS(intpadIndex)
	return native.call(0x5F4B6931816E599B, intpadIndex)
end

function natives.ENABLE_ALL_CONTROL_ACTIONS(intpadIndex)
	return native.call(0xA5FFE9B05F199DE7, intpadIndex)
end

function natives.ENABLE_CONTROL_ACTION(intpadIndex, intcontrol, BOOLenable)
	return native.call(0x351220255D64C155, intpadIndex, intcontrol, BOOLenable)
end

function natives.DISABLE_CONTROL_ACTION(intpadIndex, intcontrol, BOOLdisable)
	return native.call(0xFE99B66D079CF6BC, intpadIndex, intcontrol, BOOLdisable)
end

function natives.CREATE_AMBIENT_PICKUP(HashpickupHash, floatposX, floatposY, floatposZ, intflags, intvalue, HashmodelHash, BOOLp7, BOOLp8)
	return native.call(0x673966A0C0FD7171, HashpickupHash, floatposX, floatposY, floatposZ, intflags, intvalue, HashmodelHash, BOOLp7, BOOLp8):__tointeger()
end

function natives.CREATE_PORTABLE_PICKUP(pickupHash, x, y, z, placeOnGround, modelHash)
	return native.call(0x2EAF1FDB2FB55698, pickupHash, x, y, z, placeOnGround, modelHash):__tointeger()
end

function natives.SET_RIOT_MODE_ENABLED(BOOLtoggle)
	return native.call(0x2587A48BC88DFADF, BOOLtoggle)
end

function natives.PLAY_PAIN(Pedped, intpainID, intp1, Anyp3)
	return native.call(0xBC9AE166038A5CEC, Pedped, intpainID, intp1, Anyp3)
end

function natives.GET_RENDERING_CAM()
	return native.call(0x5234F9F10919EABA):__tointeger()
end

function natives.STOP_CAM_SHAKING(Camcam, BOOLp1)
	return native.call(0xBDECF64367884AC3, Camcam, BOOLp1)
end

function natives.FORCE_LIGHTNING_FLASH()
	return native.call(0xF6062E089251C898)
end

function natives.SET_SNOW_LEVEL(floatlevel)
	return native.call(0x7F06937B0CDCBC1A, floatlevel)
end

function natives.SET_RAIN_LEVEL(floatintensity)
	return native.call(0x643E26EA6E024D92, floatintensity)
end

function natives.SET_WIND(floatspeed)
	return native.call(0xAC3A74E8384A9919, floatspeed)
end

function natives.IS_PAUSE_MENU_ACTIVE()
	return native.call(0xB0034A223497FFCB):__tointeger() == 1
end

function natives.SET_FOCUS_POS_AND_VEL(floatx, floaty, floatz, floatoffsetX, floatoffsetY, floatoffsetZ)
	return native.call(0xBB7454BAFF08FE25, floatx, floaty, floatz, floatoffsetX, floatoffsetY, floatoffsetZ)
end

function natives.CLEAR_FOCUS()
	return native.call(0x31B73D1EA9F01DA2)
end

function natives.IS_ENTITY_STATIC()
	return native.call(0x1218E6886D3D8327, Entityentity):__tointeger() == 1
end

function natives.SET_ENTITY_ONLY_DAMAGED_BY_RELATIONSHIP_GROUP(Entityentity, BOOLp1, Anyp2)
	return native.call(0x7022BD828FA0B082, Entityentity, BOOLp1, Anyp2)
end

function natives.GET_ENTITY_HEIGHT_ABOVE_GROUND(Entityentity)
	return native.call(0x1DD55701034110E5, Entityentity):__tonumber()
end

function natives.IS_PED_JUMPING_OUT_OF_VEHICLE(Pedped)
	return native.call(0x433DDFFE2044B636, Pedped):__tointeger() == 1
end

function natives.IS_PED_FALLING(Pedped)
	return native.call(0xFB92A102F1C4DFA3, Pedped):__tointeger() == 1
end

function natives.IS_PED_IN_PARACHUTE_FREE_FALL(Pedped)
	return native.call(0x7DCE8BDA0F1C1200, Pedped):__tointeger() == 1
end

function natives.NETWORK_SET_FRIENDLY_FIRE_OPTION(BOOLtoggle)
	return native.call(0xF808475FA571D823, BOOLtoggle)
end

function natives.ATTACH_CAM_TO_ENTITY(Camcam, Entityentity, floatxOffset, floatyOffset, floatzOffset, BOOLisRelative)
	return native.call(0xFEDB7D269E8C60E3, Camcam, Entityentity, floatxOffset, floatyOffset, floatzOffset, BOOLisRelative)
end

function natives.TASK_VEHICLE_TEMP_ACTION(Peddriver, Vehiclevehicle, intaction, inttime)
	return native.call(0xC429DCEEB339E129, Peddriver, Vehiclevehicle, intaction, inttime)
end

function natives.NETWORK_HASH_FROM_PLAYER_HANDLE(Playerplayer)
	return native.call(0xBC1D768F2F5D6C05, Playerplayer):__tointeger()
end

function natives.INT_TO_PLAYERINDEX(value)
	return native.call(0x41BD2A6B006AF756, value):__tointeger()
end

function natives.IS_EXPLOSION_IN_AREA(intexplosionType, floatx1, floaty1, floatz1, floatx2, floaty2, floatz2)
	return native.call(0x2E2EBA0EE7CED0E0, intexplosionType, floatx1, floaty1, floatz1, floatx2, floaty2, floatz2):__tointeger() == 1
end

function natives.GET_OWNER_OF_EXPLOSION_IN_ANGLED_AREA(intexplosionType, floatx1, floaty1, floatz1, floatx2, floaty2, floatz2, floatradius)
	return native.call(0x14BA4BA137AF6CEC, intexplosionType, floatx1, floaty1, floatz1, floatx2, floaty2, floatz2, floatradius):__tointeger()
end

function natives.IS_PLAYER_IN_CUTSCENE(Playerplayer)
	return native.call(0xE73092F4157CD126, Playerplayer):__tointeger() == 1
end

function natives.NETWORK_PREVENT_SCRIPT_HOST_MIGRATION()
	return native.call(0x2302C0264EA58D31)
end

function natives.NETWORK_PLAYER_GET_USERID(Playerplayer)
	local Buffer32 = native.ByteBuffer32()
	local useridchar = native.call(0x4927FC39CD0869A0, Playerplayer, Buffer32):__tostring(true)
	return useridchar, Buffer32
end

function natives.NETWORK_SEND_TEXT_MESSAGE(constcharmessage, AnygamerHandle)
	return native.call(0x3A214F2EC889B100, constcharmessage, AnygamerHandle):__tointeger() == 1
end

function natives.NETWORK_HANDLE_FROM_USER_ID(constcharuserId, intgamerHandleSize)
	local Buffer32 = native.ByteBuffer32()
	native.call(0xDCD51DD8F87AEC5C, constcharuserId, Buffer32, intgamerHandleSize)
	return Buffer32
end

function natives.SET_DISPATCH_COPS_FOR_PLAYER(player, toggle)
	return native.call(0xDB172424876553F4, player, toggle)
end

function natives.SET_PLAYER_CAN_BE_HASSLED_BY_GANGS(player, toggle)
	return native.call(0xD5E460AD7020A246, player, toggle)
end

function natives.NETWORK_GAMER_HAS_HEADSET(gamerHandle)
	return native.call(0xF2FD55CB574BCC55, gamerHandle):__tointeger() ~= 0
end

function natives.GET_ANIM_DURATION(constcharanimDict, constcharanimName)
	return native.call(0xFEDDF04D62B8D790):__tonumber()
end

function natives.SET_ENTITY_NO_COLLISION_ENTITY(Entityentity1, Entityentity2, BOOLthisFrameOnly)
	return native.call(0xA53ED5520C07654A, Entityentity1, Entityentity2, BOOLthisFrameOnly)
end

function natives.IS_ENTITY_PLAYING_ANIM(Entityentity, constcharanimDict, constcharanimName, inttaskFlag)
	return native.call(0x1F0B79228E461EC9, Entityentity, constcharanimDict, constcharanimName, inttaskFlag):__tointeger() == 0
end

function natives.HAS_ENTITY_CLEAR_LOS_TO_ENTITY_IN_FRONT(entity1, entity2)
	return native.call(0x0267D00AF114F17A, entity1, entity2):__tointeger() == 1
end

function natives.RELEASE_SOUND_ID(intsoundId)
	return native.call(0x353FC880830B88FA, intsoundId)
end

function natives.GET_SOUND_ID()
	return native.call(0x430386FE9BF80B45):__tointeger()
end

function natives.TRIGGER_PLAYER_CRC_HACKER_CHECK(Playerplayer, intp1, HashscriptHash)
	return native.call(0x46FB3ED415C7641C, Playerplayer, intp1, HashscriptHash):__tointeger() == 1
end

function natives.GET_HASH_OF_THIS_SCRIPT_NAME()
	return native.call(0x8A1C8B1738FFE87E):__tointeger()
end

function natives.REMOTE_CHEAT_DETECTED(Playerplayer, inta, intb)
	return native.call(0x472841A026D26D8B, Playerplayer, inta, intb):__tointeger() == 1
end

function natives.GET_ENTITY_COLLISION_DISABLED(Entityentity)
	return native.call(0xCCF1E97BEFDAE480, Entityentity):__tointeger() == 1
end

function natives.SPECIAL_ABILITY_CHARGE_ABSOLUTE(Playerplayer, intp1, BOOLp2, Anyp3)
	return native.call(0xB7B0870EB531D08D, Playerplayer, intp1, BOOLp2, Anyp3)
end

function natives.SPECIAL_ABILITY_RESET(Playerplayer, Anyp1)
	return native.call(0x375F0E738F861A94, Playerplayer, Anyp1)
end

function natives.IS_SPECIAL_ABILITY_METER_FULL(Playerplayer, Anyp1)
	return native.call(0x05A1FE504B7F2587, Playerplayer, Anyp1):__tointeger() == 1
end

function natives.SPECIAL_ABILITY_ACTIVATE(Playerplayer, intp1)
	return native.call(0x821FDC827D6F4090, Playerplayer, intp1)
end

function natives.SPECIAL_ABILITY_DEACTIVATE(Playerplayer, intp1)
	return native.call(0xD6A953C6D1492057, Playerplayer, intp1)
end

function natives.SET_ENTITY_DYNAMIC(Entityentity, BOOLtoggle)
	return native.call(0x1718DE8E3F2823CA, Entityentity, BOOLtoggle)
end

function natives.GET_PICKUP_OBJECT(Pickuppickup)
	return native.call(0x5099BC55630B25AE, Pickuppickup):__tointeger()
end

function natives.DELETE_ALL_TRAINS()
	return native.call(0x736A718577F39C7D)
end

function natives.SET_TRAIN_SPEED(Vehicletrain, floatspeed)
	return native.call(0xAA0BC91BE0B796E3, Vehicletrain, floatspeed)
end

function natives.SET_TRAIN_CRUISE_SPEED(Vehicletrain, floatspeed)
	return native.call(0x16469284DB8C62B5, Vehicletrain, floatspeed)
end

function natives.SET_RENDER_TRAIN_AS_DERAILED(Vehicletrain, BOOLtoggle)
	return native.call(0x317B11A312DF5534, Vehicletrain, BOOLtoggle)
end

function natives.SET_DISABLE_RANDOM_TRAINS_THIS_FRAME(BOOLtoggle)
	return native.call(0xD4B8E3D1917BC86B, BOOLtoggle)
end

function natives.SWITCH_TRAIN_TRACK(trackId, state)
	return native.call(0xFD813BB7DB977F20, trackId, state)
end

function natives.SET_TRAIN_TRACK_SPAWN_FREQUENCY(trackIndex, frequency)
	return native.call(0x21973BBF8D17EDFA, trackIndex, frequency)
end

function natives.SET_RANDOM_TRAINS(toggle)
	return native.call(0x80D9F74197EA47D9, toggle)
end

function natives.SET_MISSION_FLAG(toggle)
	return native.call(0xC4301E5121A0ED73, toggle)
end

function natives.CREATE_MISSION_TRAIN(variation, x, y, z, direction, p5, p6)
	return native.call(0x63C6CCA8E68AE8C8, variation, x, y, z, direction, p5, p6):__tointeger()
end

function natives.CREATE_MONEY_PICKUPS(floatx, floaty, floatz, intvalue, intamount, Hashmodel)
	return native.call(0x0589B5E791CE9B2B, floatx, floaty, floatz, intvalue, intamount, Hashmodel)
end

function natives.NETWORK_SHOW_PROFILE_UI(AnygamerHandle)
	return native.call(0x859ED1CEA343FCA8, AnygamerHandle)
end

function natives.NETWORK_IS_FRIEND(AnygamerHandle)
	return native.call(0x1A24A179F9B31654, AnygamerHandle):__tointeger() == 1
end

function natives.NETWORK_CAN_PLAY_MULTIPLAYER_WITH_GAMER(AnygamerHandle)
	return native.call(0x07DD29D5E22763F1, AnygamerHandle):__tointeger() == 1
end

function natives.NETWORK_CAN_GAMER_PLAY_MULTIPLAYER_WITH_ME(AnygamerHandle)
	return native.call(0x135F9B7B7ADD2185, AnygamerHandle):__tointeger() == 1
end

function natives._0x021ABCBD98EC4320(AnygamerHandle)
	return native.call(0x021ABCBD98EC4320, AnygamerHandle):__tointeger() == 1
end

function natives._0x421E34C55F125964(AnygamerHandle)
	return native.call(0x421E34C55F125964, AnygamerHandle):__tointeger() == 1
end

function natives.NETWORK_IS_FRIEND_HANDLE_ONLINE(AnygamerHandle)
	return native.call(0x87EB7A3FFCB314DB, AnygamerHandle):__tointeger() == 1
end

function natives.NETWORK_IS_PLAYER_TALKING(Playerplayer)
	return native.call(0x031E11F3D447647E, Playerplayer):__tointeger() == 1
end

function natives.SET_MINIMAP_IN_SPECTATOR_MODE(BOOLtoggle, Pedped)
	return native.call(0x1A5CD7752DD28CD3, BOOLtoggle, Pedped)
end

function natives.SET_PLANE_TURBULENCE_MULTIPLIER(Vehiclevehicle, floatmultiplier)
	return native.call(0xAD2D28A1AFDFF131, Vehiclevehicle, floatmultiplier)
end

function natives.SET_VEHICLE_DAMAGE(Vehiclevehicle, floatxOffset, floatyOffset, floatzOffset, floatdamage, floatradius, BOOLfocusOnModel)
	return native.call(0xA1DD317EA8FD4F29, Vehiclevehicle, floatxOffset, floatyOffset, floatzOffset, floatdamage, floatradius, BOOLfocusOnModel)
end

function natives.SET_VEHICLE_CAN_DEFORM_WHEELS(Vehiclevehicle, BOOLtoggle)
	return native.call(0x0CDDA42F9E360CA6, Vehiclevehicle, BOOLtoggle)
end

function natives.REMOVE_ALL_AIR_DEFENCE_SPHERES()
	return native.call(0x1E45B34ADEBEE48E)
end

function natives.NETWORK_UNREGISTER_NETWORKED_ENTITY(Entityentity)
	return native.call(0x7368E683BB9038D6, Entityentity)
end

function natives.NETWORK_REGISTER_ENTITY_AS_NETWORKED(Entityentity)
	return native.call(0x06FAACD625D80CAA, Entityentity)
end

function natives.NETWORK_GET_PLAYER_KILLER_OF_PLAYER(Playerplayer)
	local Buffer32 = native.ByteBuffer32()
	local Any = native.call(0x2DA41ED6E1FCD7A5, Playerplayer, Buffer32):__tointeger()
	return Any, Buffer32:__tointeger()
end

function natives.NETWORK_GET_ENTITY_KILLER_OF_PLAYER(Playerplayer)
	local Buffer32 = native.ByteBuffer32()
	local Entity = native.call(0x42B2DAA6B596F5F8, Playerplayer, Buffer32):__tointeger()
	return Entity, Buffer32:__tointeger()
end

function natives.NETWORK_IS_HANDLE_VALID(AnygamerHandle, intgamerHandleSize)
	return native.call(0x6F79B93B0A8E4133, AnygamerHandle, intgamerHandleSize):__tointeger() == 1
end

function natives.NETWORK_MEMBER_ID_FROM_GAMER_HANDLE(AnygamerHandle)
	return native.call(0xC82630132081BB6F, AnygamerHandle):__tostring(true)
end

function natives.NETWORK_GET_PLAYER_FROM_GAMER_HANDLE(AnygamerHandle)
	return native.call(0xCE5F689CF5A0A49D, AnygamerHandle):__tointeger()
end

function natives.NETWORK_HANDLE_FROM_MEMBER_ID(constcharmemberId, intgamerHandleSize)
	local Buffer32 = native.ByteBuffer32()
	native.call(0xA0FD21BED61E5C4C, constcharmemberId, Buffer32, intgamerHandleSize)
	return Entity, Buffer32:__tointeger()
end

function natives.NETWORK_IS_GAMER_IN_MY_SESSION(AnygamerHandle)
	return native.call(0x0F10B05DDF8D16E9, AnygamerHandle):__tointeger() == 1
end

function natives.NETWORK_GET_HOST_OF_SCRIPT(constcharscriptName, intinstance_id, intposition_hash)
	return native.call(0x1D6A14F1F9A736FC, constcharscriptName, intinstance_id, intposition_hash):__tointeger()
end

function natives.GET_CURRENT_PED_VEHICLE_WEAPON(Pedped)
	local Buffer32 = native.ByteBuffer32()
	local success = native.call(0x1017582BCD3832DC, Pedped, Buffer32):__tointeger()
	return success == 1, Buffer32:__tointeger()
end

function natives.GET_GROUND_Z_FOR_3D_COORD(floatx, floaty, floatz, BOOLignoreWater, BOOLp5)
	local Buffer32 = native.ByteBuffer32()
	local success = native.call(0xC906A7DAB05C8D2B, floatx, floaty, floatz, Buffer32, BOOLignoreWater, BOOLp5):__tointeger()
	return success == 1, Buffer32:__tonumber()
end

function natives.SET_MULTIPLAYER_WALLET_CASH()
	return native.call(0xC2D15BEF167E27BC)
end

function natives.SET_MULTIPLAYER_BANK_CASH()
	return native.call(0xDD21B55DF695CD0A)
end

function natives.REMOVE_MULTIPLAYER_WALLET_CASH()
	return native.call(0x95CF81BD06EE1887)
end

function natives.REMOVE_MULTIPLAYER_BANK_CASH()
	return native.call(0xC7C6789AA1CFEDD0)
end

function natives.IS_PED_USING_ANY_SCENARIO(ped)
	return native.call(0x57AB4A3080F85143, ped):__tointeger() ~= 0
end

function natives.HAS_PED_GOT_WEAPON(ped, weaponHash, p2)
	return native.call(0x8DECB02F88F428BC, ped, weaponHash, p2):__tointeger() ~= 0
end

function natives.SET_WEAPON_EXPLOSION_RADIUS_MULTIPLIER(HashweaponHash, floatmultiplier)
	return native.call(0x4AE5AC8B852D642C, HashweaponHash, floatmultiplier)
end

function natives.ADD_EXPLOSION(x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake, noDamage)
	return native.call(0xE3AD2BDBAEE269AC, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake, noDamage)
end

function natives.SET_PLAYER_LOCKON_RANGE_OVERRIDE(Playerplayer, floatrange)
	return native.call(0x29961D490E5814FD, Playerplayer, floatrange)
end

function natives.NETWORK_IS_SIGNED_IN()
	return native.call(0x054354A99211EB96):__tointeger() == 1
end

function natives.CLEAR_AREA_OF_PEDS(floatx, floaty, floatz, floatradius, intflags)
	return native.call(0xBE31FD6CE464AC59, floatx, floaty, floatz, floatradius, intflags)
end

function natives.CLEAR_AREA_OF_COPS(floatx, floaty, floatz, floatradius, intflags)
	return native.call(0x04F8FC8FCF58F88D, floatx, floaty, floatz, floatradius, intflags)
end

function natives.CLEAR_AREA_OF_OBJECTS(floatx, floaty, floatz, floatradius, intflags)
	return native.call(0xDD9B9B385AAC7F5B, floatx, floaty, floatz, floatradius, intflags)
end

function natives.CLEAR_AREA_OF_VEHICLES(floatx, floaty, floatz, floatradius, BOOLp4, BOOLp5, BOOLp6, BOOLp7, BOOLp8, BOOLp9, Anyp10)
	return native.call(0x01C7B9B38428AEB6, floatx, floaty, floatz, floatradius, BOOLp4, BOOLp5, BOOLp6, BOOLp7, BOOLp8, BOOLp9, Anyp10)
end

function natives.GET_PLAYER_INVINCIBLE(Playerplayer)
	return native.call(0xB721981B2B939E07, Playerplayer):__tointeger() == 1
end

function natives.GET_ENTITY_CAN_BE_DAMAGED(Entityentity)
	return native.call(0xD95CC5D2AB15A09F, Entityentity):__tointeger() == 1
end

function natives.TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME(constcharscriptName)
	return native.call(0x9DC711BC69C548DF, constcharscriptName)
end

function natives.SET_SCRIPT_WITH_NAME_HASH_AS_NO_LONGER_NEEDED(HashscriptHash)
	return native.call(0xC5BC038960E9DB27, HashscriptHash)
end

function natives.ADD_OWNED_EXPLOSION(Pedped, floatx, floaty, floatz, intexplosionType, floatdamageScale, BOOLisAudible, BOOLisInvisible, floatcameraShake)
	return native.call(0x172AA1B624FA1013, Pedped, floatx, floaty, floatz, intexplosionType, floatdamageScale, BOOLisAudible, BOOLisInvisible, floatcameraShake)
end

function natives.GET_AMMO_IN_PED_WEAPON(Pedped, Hashweaponhash)
	return native.call(0x015A522136D7F951, Pedped, Hashweaponhash):__tointeger()
end

function natives.GET_AMMO_IN_CLIP(Pedped, Hashweaponhash)
	local Buffer32 = native.ByteBuffer32()
	local success = native.call(0x2E1202248937775C, Pedped, Hashweaponhash, Buffer32):__tointeger()
	return success == 1, Buffer32:__tointeger()
end

function natives.GET_MAX_AMMO_IN_CLIP(Pedped, Hashweaponhash, BOOLp2)
	return native.call(0xA38DCFFCEA8962FA, Pedped, Hashweaponhash, BOOLp2):__tointeger()
end

function natives.GIVE_WEAPON_TO_PED(ped, weaponHash, ammoCount, isHidden, bForceInHand)
	return native.call(0xBF0FD6E56C964FCB, ped, weaponHash, ammoCount, isHidden, bForceInHand)
end

function natives.IS_PED_RELOADING(Pedped)
	return native.call(0x24B100C68C645951, Pedped):__tointeger() == 1
end

function natives.DESTROY_MOBILE_PHONE()
	return native.call(0x3BC861DF703E5097)
end

function natives.CREATE_MOBILE_PHONE(intphoneType)
	return native.call(0xA4E8E696C532FBC7, intphoneType)
end

function natives.GET_GROUND_Z_AND_NORMAL_FOR_3D_COORD(floatx, floaty, floatz)
	local Buffer32 = native.ByteBuffer32()
	local Buffer32_2 = native.ByteBuffer32()
	local success = native.call(0x8BDC7BFC57A81E76, floatx, floaty, floatz, Buffer32, Buffer32_2):__tointeger()
	return success == 1, Buffer32:__tonumber(), Buffer32_2:__tov3()
end

function natives.USE_PARTICLE_FX_ASSET(constcharname)
	return native.call(0x6C38AF3693A69A91, constcharname)
end

function natives.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD(constchareffectName, floatxPos, floatyPos, floatzPos, floatxRot, floatyRot, floatzRot, floatscale, BOOLxAxis, BOOLyAxis, BOOLzAxis, BOOLp11)
	return native.call(0xF56B8137DF10135D, constchareffectName, floatxPos, floatyPos, floatzPos, floatxRot, floatyRot, floatzRot, floatscale, BOOLxAxis, BOOLyAxis, BOOLzAxis, BOOLp11):__tointeger() == 1
end

function natives.PLAY_SOUND_FROM_COORD(intsoundId, constcharaudioName, floatx, floaty, floatz, constcharaudioRef, BOOLisNetwork, intrange, BOOLp8)
	return native.call(0x8D8686B622B88120, intsoundId, constcharaudioName, floatx, floaty, floatz, constcharaudioRef, BOOLisNetwork, intrange, BOOLp8)
end

function natives.PLAY_SOUND_FROM_ENTITY(intsoundId, constcharaudioName, Entityentity, constcharaudioRef, BOOLisNetwork, Anyp5)
	return native.call(0xE65F427EB70AB1ED, intsoundId, constcharaudioName, Entityentity, constcharaudioRef, BOOLisNetwork, Anyp5)
end

function natives.GET_CLOSEST_OBJECT_OF_TYPE(floatx, floaty, floatz, floatradius, HashmodelHash, BOOLisMission, BOOLp6, BOOLp7)
	return native.call(0xE143FA2249364369, floatx, floaty, floatz, floatradius, HashmodelHash, BOOLisMission, BOOLp6, BOOLp7):__tointeger()
end

function natives.START_AUDIO_SCENE(constcharscene)
	return native.call(0x013A80FC08F6E4F2, constcharscene):__tointeger() == 1
end

function natives.REQUEST_SCRIPT_AUDIO_BANK(p0, p1, p2)
	return native.call(0x2F844A8B08D76685, p0, p1, p2):__tointeger() ~= 0
end

function natives.SET_VARIABLE_ON_SOUND(soundId, p1, p2)
	return native.call(0xAD6B3148A78AE9B6, soundId, p1, p2)
end

function natives.STOP_AUDIO_SCENE(constcharscene)
	return native.call(0xDFE8422B3B94E688, constcharscene)
end

function natives.RELEASE_NAMED_SCRIPT_AUDIO_BANK(audioBank)
	return native.call(0x77ED170667F50170, audioBank)
end

function natives.GET_OFFSET_FROM_ENTITY_GIVEN_WORLD_COORDS(Entityentity, floatposX, floatposY, floatposZ)
	return native.call(0x2274BC1C4885E333, Entityentity, floatposX, floatposY, floatposZ):__tov3()
end

function natives.NETWORK_SET_IN_FREE_CAM_MODE(BOOLtoggle)
	return native.call(0xFC18DB55AE19E046, BOOLtoggle)
end

function natives.SHAKE_CAM(Camcam, constchartype, floatamplitude)
	return native.call(0x6A25241C340D3822, Camcam, constchartype, floatamplitude)
end

function natives.PLAY_SOUND_FRONTEND(intsoundId, constcharaudioName, constcharaudioRef, BOOLp3)
	return native.call(0x67C540AA08E4A6F5, intsoundId, constcharaudioName, constcharaudioRef, BOOLp3)
end

function natives.CASCADE_SHADOWS_SET_AIRCRAFT_MODE(BOOLtoggle)
	return native.call(0x6DDBF9DFFC4AC080, BOOLtoggle)
end

function natives.DO_SCREEN_FADE_IN(intduration)
	return native.call(0xD4E8E24955024033, intduration)
end

function natives.DO_SCREEN_FADE_OUT(intduration)
	return native.call(0x891B5B39AC6302AF, intduration)
end

function natives.IS_ENTITY_GHOSTED_TO_LOCAL_PLAYER(Entityentity)
	return native.call(0x21D04D7BC538C146, Entityentity):__tointeger() == 1
end

function natives.HAS_STREAMED_TEXTURE_DICT_LOADED(constchartextureDict)
	return native.call(0x0145F696AAAAD2E4, constchartextureDict):__tointeger() == 1
end

function natives.GET_CAM_FOV(Camcam)
	return native.call(0xC3330A45CCCDB26A, Camcam):__tonumber()
end

function natives.GET_ASPECT_RATIO(BOOLb)
	return native.call(0xF1307EF624A80D87, BOOLb):__tonumber()
end

function natives.SET_DRAW_ORIGIN(floatx, floaty, floatz, Anyp3)
	return native.call(0xAA0008F3BBB8F416, floatx, floaty, floatz, Anyp3)
end

function natives.DRAW_SPRITE(constchartextureDict, constchartextureName, floatscreenX, floatscreenY, floatwidth, floatheight, floatheading, intred, intgreen, intblue, intalpha, BOOLp11, Anyp12)
	return native.call(0xE7FFAE5EBF23D890, constchartextureDict, constchartextureName, floatscreenX, floatscreenY, floatwidth, floatheight, floatheading, intred, intgreen, intblue, intalpha, BOOLp11, Anyp12)
end

function natives.CLEAR_DRAW_ORIGIN()
	return native.call(0xFF0B610F6BE0D7AF)
end

function natives.SET_DOOR_ALLOWED_TO_BE_BROKEN_OFF(vehicle, doorId, isBreakable)
	return native.call(0x2FA133A4A9D37ED8, vehicle, doorId, isBreakable)
end

function natives.REQUEST_STREAMED_TEXTURE_DICT(constchartextureDict, BOOLp1)
	return native.call(0xDFA2EF8E04127DD5, constchartextureDict, BOOLp1)
end

function natives.REQUEST_CLIP_SET(constcharclipSet)
	return native.call(0xD2A71E1A77418A49, constcharclipSet)
end

function natives.REMOVE_CLIP_SET(constcharclipSet)
	return native.call(0x01F73A131C18CD94, constcharclipSet)
end

function natives.SET_PED_STRAFE_CLIPSET(Pedped, constcharclipSet)
	return native.call(0x29A28F3F8CF6D854, Pedped, constcharclipSet)
end

function natives.RESET_PED_STRAFE_CLIPSET(Pedped)
	return native.call(0x20510814175EA477, Pedped)
end

function natives.SET_PED_CAN_PLAY_AMBIENT_ANIMS(Pedped, BOOLtoggle)
	return native.call(0x6373D1349925A70E, Pedped, BOOLtoggle)
end

function natives.SET_PED_CAN_PLAY_AMBIENT_BASE_ANIMS(Pedped, BOOLtoggle)
	return native.call(0x0EB0585D15254740, Pedped, BOOLtoggle)
end

function natives.SET_THIRD_PERSON_AIM_CAM_NEAR_CLIP_THIS_UPDATE(floatp0)
	return native.call(0x42156508606DE65E, floatp0)
end

function natives.DISABLE_AIM_CAM_THIS_UPDATE()
	return native.call(0x1A31FE0049E542F6)
end

function natives.GET_PED_LAST_DAMAGE_BONE(Pedped)
	local Buffer32 = native.ByteBuffer32()
	local success = native.call(0xD75960F6BD9EA49C, Pedped, Buffer32):__tointeger()
	return success == 1, Buffer32:__tointeger()
end

function natives.PLAY_SYNCHRONIZED_ENTITY_ANIM(Entityentity, intsyncedScene, constcharanimation, constcharpropName, floatp4, floatp5, Anyp6, floatp7)
	return native.call(0xC77720A12FE14A86, Entityentity, intsyncedScene, constcharanimation, constcharpropName, floatp4, floatp5, Anyp6, floatp7)
end

function natives.SET_THREAD_PRIORITY(intpriority)
	return native.call(0x42B65DEEF2EDF2A1, intpriority)
end

function natives.CREATE_SYNCHRONIZED_SCENE(floatx, floaty, floatz, floatroll, floatpitch, floatyaw, intp6)
	return native.call(0x8C18E0F9080ADD73, floatx, floaty, floatz, floatroll, floatpitch, floatyaw, intp6)
end

function natives.NETWORK_START_SYNCHRONISED_SCENE(intnetScene)
	return native.call(0x9A1B3FCDB36C8697, intnetScene)
end

function natives.TASK_SYNCHRONIZED_SCENE(Pedped, intscene, constcharanimDictionary, constcharanimationName, floatspeed, floatspeedMultiplier, intduration, intflag, floatplaybackRate, Anyp9)
	return native.call(0xEEA929141F699854, Pedped, intscene, constcharanimDictionary, constcharanimationName, floatspeed, floatspeedMultiplier, intduration, intflag, floatplaybackRate, Anyp9)
end

function natives.TASK_SWEEP_AIM_POSITION(ped, animDict, lowAnimName, medAnimName, hiAnimName, runtime, x, y, z, turnRate, blendInDuration)
	return native.call(0x7AFE8FDC10BC07D2, ped, animDict, lowAnimName, medAnimName, hiAnimName, runtime, x, y, z, turnRate, blendInDuration)
end

function natives.NETWORK_STOP_SYNCHRONISED_SCENE(intnetScene)
	return native.call(0xC254481A4574CB2F, intnetScene)
end

function natives.SET_SYNCHRONIZED_SCENE_PHASE(intnetScene, floatphase)
	return native.call(0x734292F4F0ABF6D0, intnetScene, floatphase)
end

function natives.FORCE_PED_AI_AND_ANIMATION_UPDATE(Pedped, BOOLp1, BOOLp2)
	return native.call(0x2208438012482A1A, Pedped, BOOLp1, BOOLp2)
end

function natives.FORCE_ENTITY_AI_AND_ANIMATION_UPDATE(Entityentity)
	return native.call(0x40FDEDB72F8293B2, Entityentity)
end

function natives.GET_SYNCHRONIZED_SCENE_PHASE(intnetScene)
	return native.call(0xE4A310B1D7FA73CC, intnetScene):__tonumber()
end

function natives.SET_VEHICLE_STRONG(Vehiclevehicle, BOOLtoggle)
	return native.call(0x3E8C8727991A8A0B, Vehiclevehicle, BOOLtoggle)
end

function natives.GET_VEHICLE_DEFORMATION_AT_POS(Vehiclevehicle, floatoffsetX, floatoffsetY, floatoffsetZ)
	return native.call(0x4EC6CFBC7B2E9536, Vehiclevehicle, floatoffsetX, floatoffsetY, floatoffsetZ):__tov3()
end

function natives.SET_PED_CAN_BE_TARGETTED_BY_PLAYER(Pedped, Playerplayer, BOOLtoggle)
	return native.call(0x66B57B72E0836A76, Pedped, Playerplayer, BOOLtoggle)
end

function natives.SET_TREAT_AS_AMBIENT_PED_FOR_DRIVER_LOCKON(p0, p1)
	return native.call(0x2F3C3D9F50681DE4, p0, p1)
end

function natives.SET_ALLOW_LOCKON_TO_PED_IF_FRIENDLY(ped, toggle)
	return native.call(0x061CB768363D6424, ped, toggle)
end

function natives.GET_INTERIOR_FROM_COLLISION(x, y, z)
	return native.call(0xEC4CF9FCB29A4424, x, y, z)
end

function natives.CLEAR_INTERIOR_STATE_OF_ENTITY(entity)
	return native.call(0x85D5422B2039A70D, entity)
end

function natives.GET_INTERIOR_AT_COORDS(x, y, z)
	return native.call(0x3F6167F351168730, pickup, roomName)
end

function natives.CAP_INTERIOR(interior, toggle)
	return native.call(0xD9175F941610DB54, interior, toggle)
end

function natives.DISABLE_INTERIOR(interior, toggle)
	return native.call(0x6170941419D7D8EC, interior, toggle)
end

function natives.APPLY_DAMAGE_TO_PED(ped, damageAmount, p2, p3)
	return native.call(0x697157CED63F18D4, ped, damageAmount, p2, p3)
end

function natives.START_VEHICLE_HORN(Vehiclevehicle, intduration, Hashmode, BOOLforever)
	return native.call(0x9C8C6504B5B63D2C, Vehiclevehicle, intduration, Hashmode, BOOLforever)
end

function natives.NETWORK_GET_TRANSITION_HOST()
	local Buffer32 = native.ByteBuffer32()
	local success = native.call(0x65042B9774C4435E, Buffer32):__tointeger()
	return success == 1, Buffer32
end

function natives.NETWORK_QUEUE_GAMER_FOR_STATUS(Anyp0)
	return native.call(0x85A0EF54A500882C, Anyp0):__tointeger() == 1
end

function natives.NETWORK_SEND_QUEUED_JOIN_REQUEST()
	return native.call(0xFA2888E3833C8E96)
end

function natives.FIND_SPAWN_POINT_IN_DIRECTION(floatposX, floatposY, floatposZ, floatfwdVecX, floatfwdVecY, floatfwdVecZ, floatdistance)
	local Buffer32 = native.ByteBuffer32()
	local success = native.call(0x6874E2190B0C1972, floatposX, floatposY, floatposZ, floatfwdVecX, floatfwdVecY, floatfwdVecZ, floatdistance, Buffer32):__tointeger()
	return success == 1, Buffer32:__tov3()
end

function natives.GET_PED_PARACHUTE_STATE(Pedped)
	return native.call(0x79CFD9827CC979B6, Pedped):__tointeger()
end

function natives.GET_PLAYER_PARACHUTE_PACK_TINT_INDEX(Playerplayer)
	local Buffer32 = native.ByteBuffer32()
	native.call(0x6E9C742F340CE5A2, Playerplayer, Buffer32)
	return Buffer32:__tointeger()
end

function natives.NETWORK_IS_PLAYER_FADING(Playerplayer)
	return native.call(0x631DC5DFF4B110E3, Playerplayer):__tointeger() == 1
end

function natives.IS_PED_CLIMBING(Pedped)
	return native.call(0x53E8CB4F48BFE623, Pedped):__tointeger() == 1
end

function natives.IS_PED_VAULTING(Pedped)
	return native.call(0x117C70D1F5730B5E, Pedped):__tointeger() == 1
end

function natives.IS_PED_DIVING(Pedped)
	return native.call(0x5527B8246FEF9B11, Pedped):__tointeger() == 1
end

function natives._IS_PED_OPENING_A_DOOR(Pedped)
	return native.call(0x26AF0E8E30BD2A2C, Pedped):__tointeger() == 1
end

function natives.IS_PED_USING_SCENARIO(Pedped, constcharscenario)
	return native.call(0x1BF094736DD62C2E, Pedped, constcharscenario):__tointeger() == 1
end

function natives.IS_PED_STILL(Pedped)
	return native.call(0xAC29253EEF8F0180, Pedped):__tointeger() == 1
end

function natives.NETWORK_SESSION_IS_CLOSED_FRIENDS()
	return native.call(0xFBCFA2EA2E206890):__tointeger() == 1
end

function natives.NETWORK_SESSION_IS_CLOSED_CREW()
	return native.call(0x74732C6CA90DA2B4):__tointeger() == 1
end

function natives.NETWORK_SESSION_IS_SOLO()
	return native.call(0xF3929C2379B60CCE):__tointeger() == 1
end

function natives.NETWORK_SESSION_IS_PRIVATE()
	return native.call(0xCEF70AA5B3F89BA1):__tointeger() == 1
end

function natives.PLAY_PED_RINGTONE(constcharringtoneName, Pedped, BOOLp2)
	return native.call(0xF9E56683CA8E11A5, constcharringtoneName, Pedped, BOOLp2)
end

function natives.IS_PED_RINGTONE_PLAYING(Pedped)
	return native.call(0x1E8E5E20937E3137, Pedped):__tointeger() == 1
end

function natives.STOP_PED_RINGTONE(Pedped)
	return native.call(0x6C5AE23EFA885092, Pedped)
end

function natives.GET_VEHICLE_DEFAULT_HORN(Vehiclevehicle)
	return native.call(0x02165D55000219AC, Vehiclevehicle):__tointeger()
end

function natives.NETWORK_RESURRECT_LOCAL_PLAYER(floatx, floaty, floatz, floatheading, BOOLunk, BOOLchangetime, BOOLp6, intp7, intp8)
	return native.call(0xEA23C49EAA83ACFB, floatx, floaty, floatz, floatheading, BOOLunk, BOOLchangetime, BOOLp6, intp7, intp8)
end

function natives.IS_PED_IN_MELEE_COMBAT(Pedped)
	return native.call(0x4E209B2C1EAD5159, Pedped):__tointeger() == 1
end

function natives.GET_MELEE_TARGET_FOR_PED(Pedped)
	return native.call(0x18A3E9EE1297FD39, Pedped):__tointeger()
end

function natives.GET_COLLISION_NORMAL_OF_LAST_HIT_FOR_ENTITY(Entityentity)
	return native.call(0xE465D4AB7CA6AE72, Entityentity):__tov3()
end

function natives.IS_PED_PERFORMING_STEALTH_KILL(Pedped)
	return native.call(0xFD4CCDBCC59941B7, Pedped):__tointeger() == 1
end

function natives.IS_ENTITY_A_MISSION_ENTITY(Entityentity)
	return native.call(0x0A7B270912999B3C, Entityentity):__tointeger() == 1
end

function natives.HAS_PLAYER_LEFT_THE_WORLD(Playerplayer)
	return native.call(0xD55DDFB47991A294, Playerplayer):__tointeger() == 1
end

function natives.SC_EMAIL_MESSAGE_PUSH_GAMER_TO_RECIP_LIST(AnygamerHandle)
	return native.call(0x2330C12A7A605D16, AnygamerHandle)
end

function natives.SC_EMAIL_MESSAGE_CLEAR_RECIP_LIST()
	return native.call(0x55DF6DB45179236E)
end

function natives.SC_EMAIL_SEND_EMAIL(constcharp0)
	return native.call(0x116FB94DC4B79F17, constcharp0)
end

function natives.NETWORK_GET_PLAYER_ACCOUNT_ID(Playerplayer)
	return native.call(0xDB663CC9FF3407A9, Playerplayer):__tointeger()
end

function natives.SET_NIGHTVISION(toggle)
	return native.call(0x18F621F7A5B1F85D, toggle)
end

function natives.SET_HEATVISION(toggle)
    return native.call(0x7E08924259E08CE0, toggle)
end

function natives.SET_PLAYER_WANTED_LEVEL(player, wantedLevel, disableNoMission)
	return native.call(0x39FF19C64EF7DA5B, player, wantedLevel, disableNoMission)
end

function natives.SET_STORE_ENABLED(toggle)
	return native.call(0x9641A9FF718E9C5E, toggle)
end

function natives.SET_STUNT_JUMPS_CAN_TRIGGER(toggle)
	return native.call(0xD79185689F8FD5DF, toggle)
end

function natives.REPLAY_PREVENT_RECORDING_THIS_FRAME()
	return native.call(0xEB2D525B57F42B40)
end

function natives.INVALIDATE_IDLE_CAM()
	return native.call(0xF4F2C0D4EE209E20)
end

function natives.INVALIDATE_CINEMATIC_VEHICLE_IDLE_MODE()
	return native.call(0x9E4CFFF989258472)
end

function natives.SET_RADIO_TO_STATION_NAME(stationName)
	return native.call(0xC69EDA28699D5107, stationName)
end

function natives.IS_CONTROL_RELEASED(padIndex, control)
	return native.call(0x648EE3E7F38877DD, padIndex, control):__tointeger() ~= 0
end

function natives.STAT_GET_STRING(statHash, p1)
	return native.call(0xE50384ACC2C3DB74, statHash, p1):__tostring(true)
end

function natives.STAT_SET_STRING(statName, value, save)
	return native.call(0xA87B2335D12531D7, statName, value, save):__tointeger() ~= 0
end

function natives.SET_USE_ISLAND_MAP(toggle)
	return native.call(0x5E1460624D194A38, toggle)
end

return natives