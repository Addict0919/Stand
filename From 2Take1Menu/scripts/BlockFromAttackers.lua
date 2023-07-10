--[[ USABLE MODDER FLAGS FOR "AttackFlags" ARRAY
MDF_MANUAL                  = 1 << 0x00,
MDF_PLAYER_MODEL            = 1 << 0x01,
MDF_SCID_SPOOF              = 1 << 0x02,
MDF_INVALID_OBJECT          = 1 << 0x03,
MDF_INVALID_PED_CRASH       = 1 << 0x04,
MDF_MODEL_CHANGE_CRASH      = 1 << 0x05,
MDF_PLAYER_MODEL_CHANGE     = 1 << 0x06,
MDF_RAC                     = 1 << 0x07,
MDF_MONEY_DROP              = 1 << 0x08,
MDF_SEP                     = 1 << 0x09,
MDF_ATTACH_OBJECT           = 1 << 0x0A,
MDF_ATTACH_PED              = 1 << 0x0B,
MDF_NET_ARRAY_CRASH         = 1 << 0x0C,
MDF_SYNC_CRASH              = 1 << 0x0D,
MDF_NET_EVENT_CRASH         = 1 << 0x0E,
MDF_HOST_TOKEN              = 1 << 0x0F,
MDF_SE_SPAM                 = 1 << 0x10,
MDF_INVALID_VEHICLE         = 1 << 0x11,
MDF_FRAME_FLAGS             = 1 << 0x12,
MDF_IP_SPOOF                = 1 << 0x13,
MDF_KAREN                   = 1 << 0x14,
MDF_SESSION_MISMATCH        = 1 << 0x15,
MDF_SOUND_SPAM              = 1 << 0x16,
MDF_SEP_INT                 = 1 << 0x17,
MDF_SUSPICIOUS_ACTIVITY     = 1 << 0x18,
MDF_CHAT_SPOOF              = 1 << 0x19,
]]
local AttackFlags = {
    MDF_MANUAL                  = 1 << 0x00,
    MDF_INVALID_OBJECT            = 1 << 0x03,
    MDF_INVALID_PED_CRASH        = 1 << 0x04,
    MDF_MODEL_CHANGE_CRASH        = 1 << 0x05,
    MDF_SEP                        = 1 << 0x09,
    MDF_ATTACH_OBJECT            = 1 << 0x0A,
    MDF_ATTACH_PED                = 1 << 0x0B,
    MDF_NET_ARRAY_CRASH            = 1 << 0x0C,
    MDF_SYNC_CRASH                = 1 << 0x0D,
    MDF_NET_EVENT_CRASH            = 1 << 0x0E,
    MDF_INVALID_VEHICLE            = 1 << 0x11,
    MDF_KAREN                    = 1 << 0x14,
    MDF_SOUND_SPAM                = 1 << 0x16,
}

-- For now, no config file. change these to true or false manually to "save" settings.
local BlockFlags = {
    {"block_chat", false},
    {"block_script_events", false},
    {"block_global_broadcast", false},
    {"block_net_automobiles", false},
    {"block_net_bikes", false},
    {"block_net_boats", false},
    {"block_net_doors", false},
    {"block_net_helis", false},
    {"block_net_objects", false},
    {"block_net_peds", false},
    {"block_net_pickups", false},
    {"block_net_pickups_placements", false},
    {"block_net_plane", false},
    {"block_net_submarines", false},
    {"block_net_cunts", false},
    {"block_net_trailers", false},
    {"block_net_train", false}
}
-- Reset Blocks when "attacker" is unmarked
local ResetBlocks = false


-- end of configuration. dont bother touching rest of this file :)
local bfap = menu.add_feature("Block From Attackers", "parent", 0).id

menu.add_feature("Unblock when UnMarked", "toggle", bfap, function(f)
    local playersmdf = {}
    while f.on do
        for pid = 0, 31 do
            local player_mdf = player.get_player_modder_flags(pid)
            if playersmdf[pid] ~= player_mdf then
                if player_mdf == 0 then
                    for b = 1, #BlockFlags do
                        menu.get_feature_by_hierarchy_key("online.online_players.player_"..pid..".block."..BlockFlags[b][1]).on = false
                    end
                end
                playersmdf[pid] = player_mdf
            end
        end
        system.wait(0)
    end
end).on = ResetBlocks

for i=1, #BlockFlags do
    menu.add_feature("Block "..BlockFlags[i][1].." From Attackers", "toggle", bfap, function(f)
        if f.on then
            BlockFlags[i][2] = true
        else
            BlockFlags[i][2] = false
        end
    end).on = BlockFlags[i][2]
end

local allAttackFlags = 0
for name, bitflag in pairs(AttackFlags) do
    allAttackFlags = allAttackFlags | bitflag
end

local mdl = event.add_event_listener("modder", function(listener)
    if (listener.flag & allAttackFlags) ~= 0 then
        for b = 1, #BlockFlags do
            if BlockFlags[b][2] then
                menu.get_feature_by_hierarchy_key("online.online_players.player_"..listener.player..".block."..BlockFlags[b][1]).on = true -- .on = true might be better as :toggle() could turn it off if it was already on
                -- or do .on = BlockFlags[b][2] but that will turn stuff off as well
            end
        end
        menu.notify("Player: "..player.get_player_name(listener.player), "Attacker Blocked")
    end
end)

event.add_event_listener("exit", function()
    event.remove_event_listener("modder", mdl)
end)