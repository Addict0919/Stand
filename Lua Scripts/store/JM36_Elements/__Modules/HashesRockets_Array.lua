local HashesRocketObjectsNum
local HashesRocketObjects = {
	"w_lr_rpg_rocket",
	"w_lr_homing_rocket",
	"w_lr_firework_rocket",
	"w_battle_airmissile_01",
	"w_smug_airmissile_01b",
	"w_ex_vehiclemissile_3",
	"w_ex_vehiclemissile_1",
	"w_ex_vehiclemissile_2",
	"w_ex_vehiclemissile_4",
	"w_smug_airmissile_02",
}
HashesRocketObjectsNum = #HashesRocketObjects
do
	local GetHashKey = GetHashKey
	for i=1, HashesRocketObjectsNum do
		HashesRocketObjects[i] = GetHashKey(HashesRocketObjects[i])
	end
end
return function() return HashesRocketObjects, HashesRocketObjectsNum end