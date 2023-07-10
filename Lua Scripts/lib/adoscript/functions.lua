function request_model(model)
    STREAMING.REQUEST_MODEL(model)

    while not STREAMING.HAS_MODEL_LOADED(model) do
        util.yield()
    end
end

function request_ptfx_asset(asset)
    STREAMING.REQUEST_NAMED_PTFX_ASSET(asset)

    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(asset) do
        util.yield()
    end
end

function get_pickups_in_range(pos, range)
    pos = pos or v3.new(0, 0, 0)
    range = range or 16000

    local all_pickups <const> = entities.get_all_pickups_as_pointers()
    local pickups = {}

    for i, pickup in pairs(all_pickups) do
        local pickup_pos <const> = entities.get_position(pickup)
        local is_pickup_in_range <const> = v3.distance(pos, pickup_pos) <= range

        if is_pickup_in_range then
            table.insert(pickups, pickup)
        end
    end
    return pickups
end