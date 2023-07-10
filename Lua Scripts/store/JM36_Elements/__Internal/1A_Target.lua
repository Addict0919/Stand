--local Distance = 1250.0
local Distance = 2500.0
local Radius = 1.25



local TargetTable =
{
	InfoKeyName	=	"Target",
	InfoKeyOnly	=	true,
	CollisionA	=	0,
	EndCoordsA	=	0,
	EntityHitA	=	0,
	EntOffsetA	=	0,
	CollisionB	=	0,
	EndCoordsB	=	0,
	EntityHitB	=	0,
	EntOffsetB	=	0,
}

local util = util
local util_create_thread = util.create_thread
util_create_thread(function()
	local memory = memory
	local memory_alloc = memory.alloc
	local memory_read_byte = memory.read_byte
	local memory_read_vector3 = memory.read_vector3
	local memory_read_int = memory.read_int
	
	local util_yield = util.yield
	local util_rot_to_dir = util.rot_to_dir
	
	local HitA, EndCoordsA, SurfaceNormalA, EntityHitA = memory_alloc(), memory_alloc(), memory_alloc(), memory_alloc()
	local function ShapeTestLosProbe(StartCoords, EndCoords, EntityToIgnore)
		local shapeTestHandle = StartExpensiveSynchronousShapeTestLosProbe(StartCoords.x, StartCoords.y, StartCoords.z, EndCoords.x, EndCoords.y, EndCoords.z, 14--[[15]], EntityToIgnore, 0)
		while GetShapeTestResult(shapeTestHandle, HitA, EndCoordsA, SurfaceNormalA, EntityHitA) ~= 2 do
			util_yield()
		end
		local TargetTable = TargetTable
		local CollisionA = memory_read_byte(HitA) == 1
		if CollisionA then
			TargetTable.EndCoordsA = memory_read_vector3(EndCoordsA)
			TargetTable.EntOffsetA = memory_read_vector3(SurfaceNormalA)
		else
			TargetTable.EndCoordsA = EndCoords
			TargetTable.EntOffsetA = EndCoords
		end
		TargetTable.CollisionA = CollisionA
		TargetTable.EntityHitA = memory_read_int(EntityHitA)
	end
	
	HitB, EndCoordsB, SurfaceNormalB, EntityHitB = memory_alloc(), memory_alloc(), memory_alloc(), memory_alloc()
	local function ShapeTestCapsule(StartCoords, EndCoords, EntityToIgnore)
		local shapeTestHandle = StartShapeTestCapsule(StartCoords.x, StartCoords.y, StartCoords.z, EndCoords.x, EndCoords.y, EndCoords.z, Radius, 14--[[15]], EntityToIgnore, 0)
		while GetShapeTestResult(shapeTestHandle, HitB, EndCoordsB, SurfaceNormalB, EntityHitB) ~= 2 do
			util_yield()
		end
		local TargetTable = TargetTable
		local CollisionB = memory_read_byte(HitB) == 1
		if CollisionB then
			TargetTable.EndCoordsB = memory_read_vector3(EndCoordsB)
			TargetTable.EntOffsetB = memory_read_vector3(SurfaceNormalB)
		else
			TargetTable.EndCoordsB = EndCoords
			TargetTable.EntOffsetB = EndCoords
		end
		TargetTable.CollisionB = CollisionB
		TargetTable.EntityHitB = memory_read_int(EntityHitB)
	end
	while true do
		local Entity
		do
			local PlayerPed = PlayerPedId()
			local PlayerVeh = GetVehiclePedIsIn(PlayerPed, false)
			if PlayerVeh ~= 0 then
				Entity = PlayerVeh
			else
				Entity = PlayerPed
			end
		end
		
		local StartCoords = --[[GetGameplayCamCoord()]]GetFinalRenderedCamCoord()
		local EndCoords
		do
			local VectorForward = util_rot_to_dir(GetGameplayCamRot(2))
			VectorForward.x, VectorForward.y, VectorForward.z = VectorForward.x*Distance, VectorForward.y*Distance, VectorForward.z*Distance
			
			EndCoords =
			{
				x=StartCoords.x+VectorForward.x,
				y=StartCoords.y+VectorForward.y,
				z=StartCoords.z+VectorForward.z,
			}
		end
		
		ShapeTestLosProbe(StartCoords, EndCoords, Entity)
		util_create_thread(ShapeTestCapsule, StartCoords, EndCoords, Entity)
		
		util_yield()
	end
end)

return TargetTable