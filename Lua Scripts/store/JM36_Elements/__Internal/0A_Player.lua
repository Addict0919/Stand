    local PlayerId, PlayerPedId, GetEntityCoords, IsPedInAnyVehicle, GetVehiclePedIsIn, GetPedInVehicleSeat, NetworkGetNetworkIdFromEntity, GetEntityModel, GetDisplayNameFromVehicleModel, IsThisModelABicycle, IsThisModelABike, IsThisModelABoat, IsThisModelACar, IsThisModelAHeli, IsThisModelAJetski, IsThisModelAPlane, IsThisModelAQuadbike, IsThisModelATrain, IsThisModelAnAmphibiousCar, IsThisModelAnAmphibiousQuadbike
    = players.user or PlayerId or PLAYER.PLAYER_ID, PlayerPedId or PLAYER.PLAYER_PED_ID, GetEntityCoords or ENTITY.GET_ENTITY_COORDS, IsPedInAnyVehicle or PED.IS_PED_IN_ANY_VEHICLE, GetVehiclePedIsIn or PED.GET_VEHICLE_PED_IS_IN, GetPedInVehicleSeat or PED.GET_PED_IN_VEHICLE_SEAT, NetworkGetNetworkIdFromEntity or NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY, GetEntityModel or ENTITY.GET_ENTITY_MODEL, GetDisplayNameFromVehicleModel or VEHICLE.GET_DISPLAY_NAME_FROM_VEHICLE_MODEL, IsThisModelABicycle or VEHICLE.IS_THIS_MODEL_A_BICYCLE, IsThisModelABike or VEHICLE.IS_THIS_MODEL_A_BIKE, IsThisModelABoat or VEHICLE.IS_THIS_MODEL_A_BOAT, IsThisModelACar or VEHICLE.IS_THIS_MODEL_A_CAR, IsThisModelAHeli or VEHICLE.IS_THIS_MODEL_A_HELI, IsThisModelAJetski or VEHICLE._IS_THIS_MODEL_A_JETSKI, IsThisModelAPlane or VEHICLE.IS_THIS_MODEL_A_PLANE, IsThisModelAQuadbike or VEHICLE.IS_THIS_MODEL_A_QUADBIKE, IsThisModelATrain or VEHICLE.IS_THIS_MODEL_A_TRAIN, IsThisModelAnAmphibiousCar or VEHICLE._IS_THIS_MODEL_AN_AMPHIBIOUS_CAR, IsThisModelAnAmphibiousQuadbike or VEHICLE_IS_THIS_MODEL_AN_AMPHIBIOUS_QUADBIKE
    local Player =
    setmetatable({
		InfoKeyName	=	"Player",
        Id          =    0,
        Ped         =    0,
        Handle      =    0,
        Coords      =    0,
        Vehicle     =   {
                            IsIn    =    0,
                            IsOp    =    0,
                            Id      =    0,
                            Handle  =    0,
                            NetId   =    0,
                            Model   =    0,
                            Name    =    0,
                            Type    =    setmetatable({},{__index=function() return false end}),
                        }
    },
    {
        __call  =   function(Self)
                        Self.Id             = PlayerId()
                        local Ped           = PlayerPedId() Self.Ped,Self.Handle=Ped,Ped
                        Self.Coords         = GetEntityCoords(Ped, false)
                        local IsIn          = IsPedInAnyVehicle(Ped, false) Self.Vehicle.IsIn = IsIn
                        if IsIn then
                            local Vehicle   = Self.Vehicle
                            local Veh       = GetVehiclePedIsIn(Ped, false)
                            Vehicle.IsOp    = Ped == GetPedInVehicleSeat(Veh, -1)
                            
                            if Veh == Vehicle.Id then return end
                            
                            Vehicle.Id,Vehicle.Handle=Veh,Veh
                            Vehicle.NetId   = NetworkGetNetworkIdFromEntity(Veh)
                            local VehModel  = GetEntityModel(Veh) Vehicle.Model = VehModel
                            Vehicle.Name    = GetDisplayNameFromVehicleModel(VehModel)
                            
                            local Vehicle_Type = Vehicle.Type
                            Vehicle_Type.Bicycle            = IsThisModelABicycle(VehModel)
                            Vehicle_Type.Bike               = IsThisModelABike(VehModel)
                            Vehicle_Type.Boat               = IsThisModelABoat(VehModel)
                            Vehicle_Type.Car                = IsThisModelACar(VehModel)
                            Vehicle_Type.Heli               = IsThisModelAHeli(VehModel)
                            Vehicle_Type.Jetski             = IsThisModelAJetski(VehModel)
                            Vehicle_Type.Plane              = IsThisModelAPlane(VehModel)
                            Vehicle_Type.Quadbike           = IsThisModelAQuadbike(VehModel)
                            Vehicle_Type.Train              = IsThisModelATrain(VehModel)
                            Vehicle_Type.AmphibiousCar      = IsThisModelAnAmphibiousCar(VehModel)
                            Vehicle_Type.AmphibiousQuadbike = IsThisModelAnAmphibiousQuadbike(VehModel)
                        end
                    end
    })
	return Player