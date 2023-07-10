util.keep_running()
util.require_natives(1672190175)

local root = menu.my_root()
local check = memory.script_global(78558)

local function BitTest(value, bit)
    return value & (1 << bit) ~= 0
end

local function BitSet(value, bit)
    return value | (1 << bit)
end

local function BitClear(value, bit)
    return value & ~(1 << bit)
end

root:divider("Vehicle Gifting")

root:action("Gift Spawned Vehicle", {"giftveh"}, "Allows you to drive any vehicle into your garage", function()
    local ped = players.user_ped()
    local hash = NETWORK.NETWORK_HASH_FROM_PLAYER_HANDLE(players.user())
    local veh = entities.get_user_vehicle_as_pointer(false)

    if veh ~= 0 then
        local start = os.time() + 15

        if veh ~= 0 then
            local spawned_model = util.reverse_joaat(entities.get_model_hash(veh))

            if hash ~= 0 then
                memory.write_int(check, 0)

                local handle = entities.pointer_to_handle(veh)
                local bitset = DECORATOR.DECOR_GET_INT(handle, "MPBitset")

                bitset = BitClear(bitset, 3)
                bitset = BitSet(bitset, 24)

                DECORATOR.DECOR_SET_INT(handle, "MPBitset", bitset)
                DECORATOR.DECOR_SET_INT(handle, "Previous_Owner", 0)
                DECORATOR.DECOR_SET_INT(handle, "PV_Slot", 0)
                DECORATOR.DECOR_SET_INT(handle, "Player_Vehicle", hash)
                DECORATOR.DECOR_SET_INT(handle, "Veh_Modded_By_Player", hash)

                local interior = INTERIOR.GET_INTERIOR_FROM_ENTITY(ped)
                local pos = ENTITY.GET_ENTITY_COORDS(ped, true)
                
                while interior == 0 do
                    interior = INTERIOR.GET_INTERIOR_FROM_ENTITY(ped)
                    if os.time() >= start then
                        memory.write_int(check, 1)
                        util.stop_thread()
                    end
                    util.yield_once()
                end

                memory.write_int(check, 1)

                while interior ~= 0 do
                    interior = INTERIOR.GET_INTERIOR_FROM_ENTITY(ped)
                    util.yield_once()
                end

                menu.ref_by_rel_path(root, "Clear Blockage"):trigger()
            end
        end
    else
        util.toast("You\'re not in a vehicle!")
    end
end)

root:action("Add Insurance", {}, "Adds insurance to your vehicle for free", function()
    local pv_slot = memory.script_global(2359296 + 1 + (0 * 5568) + 681 + 2)
    local veh = memory.script_global(1586468 + 1 + (memory.read_int(pv_slot) * 142) + 103)
    local bitfield = memory.read_int(veh)

    memory.write_int(veh, bitfield | 0xC)
    util.toast("Your vehicle is now insured permanently!")
end)

root:action("Clear Blockage", {}, "Clears the blockage infront of your garage", function()
    for i, veh in pairs(entities.get_all_vehicles_as_handles()) do
        if not ENTITY.IS_ENTITY_VISIBLE(veh) then
            entities.delete_by_handle(veh)
        end
    end
end)