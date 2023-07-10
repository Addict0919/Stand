util.keep_running()
util.require_natives(1672190175)

-- warning message
util.toast("WARNING: All features are considered risky and may result in a ban. Use at your own risk.")

local root = menu.my_root()
local helper = setmetatable({}, {})
helper.__index = helper

-- settings
helper.script_settings = {
    script_ver = "1.4.1", -- script version
    ownership_check = true, -- ownership check for properties,
    auto_accept_transaction_error = true, -- auto accept transaction error,
    abort_on_transaction_error = true, -- automatically stop money loops if transaction error occurs (prevents you getting stuck in a transaction error loop)
}

-- script states
helper.script_states = {
    nightclub = {
        safe_open = false,
        infront_of_safe = false,
    },
    arcade = {
        safe_open = false,
        infront_of_safe = false,
    },
}

-- predefined values
helper.MAX_INT = (2 << 30) - 1 -- max int value

-- command states
helper.states = {
    nightclub = { enabled = true, reason = "" },
    arcade = { enabled = true, reason = "Not clicking filter" },
    autoshop = { enabled = true, reason = "Not clicking filter" },
    hangar = { enabled = true, reason = "" },
    agency = { enabled = true, reason = "" },
}

-- meta table for afk loop
helper.afk = setmetatable(
    {
        ragdoll_timer = 1,
        nightclub = {
            locations = {}, 
            offset = 0.05
        },
        arcade = {
            locations = {},
            offset = 0.05
        },
        autoshop = {
            locations = {},
            offset = 0.05
        },
        hangar = {
            locations = {},
            offset = 0.05
        },
        facility = {
            locations = {},
            offset = 0.05
        },
    }, 
    {}
)

helper.property_ids = {
    nightclubs = {
        ["La Mesa"] = 1,
        ["Mission Row"] = 2,
        ["Strawberry"] = 3,
        ["West Vinewood"] = 4,
        ["Cypress Flats"] = 5,
        ["LSIA"] = 6,
        ["Elysian Island"] = 7,
        ["Downtown Vinewood"] = 8,
        ["Del Perro"] = 9,
        ["Vespucci Canals"] = 10
    },
    arcades = {
        ["Davis"] = 3,
        ["Eight Bit"] = 4,
        ["Insert Coin - Rockford Hills"] = 5,
        ["La Mesa"] = 6
    },
    autoshops = {
        ["La Mesa"] = 1,
        ["Strawberry"] = 2,
        ["Burton"] = 3,
        ["Rancho"] = 4,
        ["Mission Row"] = 5
    },
    agencies = {
        ["Hawick"] = 1,
        ["Rockford Hills"] = 2,
        ["Little Seoul"] = 3,
        ["Vespucci Canals"] = 4
    },
    hangars = {
        ["LSIA 1"] = 1,
        ["LSIA A17"] = 2,
        ["Fort Zancudo Hangar A2"] = 3,
        ["Fort Zancudo Hangar 3497"] = 4,
        ["Fort Zancudo Hangar 3499"] = 5
    },
    bunkers = {
        
    },
    facilities = {
        ["Grand Senora Desert"] = 1,
        ["Route 68"] = 2,
        ["Sandy Shores"] = 3,
        ["Mount Gordo"] = 4,
        ["Paleto Bay"] = 5,
        ["Fort Zancudo"] = 6,
        ["Ron Alternates Wind Farm"] = 8,
        ["Land Act Reservoir"] = 9
    }
}

helper.prices = {
    nightclub = {
        ["La Mesa"] = memory.script_global(262145 + 24838),
        ["Mission Row"] = memory.script_global(262145 + 24843),
        ["Vespucci Canals"] = memory.script_global(262145 + 24845)
    },
    arcade = {
        ["La Mesa"] = memory.script_global(262145 + 28441),
        ["Davis"] = memory.script_global(262145 + 28439),
        ["Eight Bit"] = memory.script_global(262145 + 28444)
    },
    autoshop = {
        ["La Mesa"] = memory.script_global(262145 + 31246),
        ["Mission Row"] = memory.script_global(262145 + 31248),
        ["Burton"] = memory.script_global(262145 + 31249)
    }
}

local options = {
    "50,000,000", "100,000,000", "150,000,000", "200,000,000",
    "250,000,000", "300,000,000", "350,000,000", "400,000,000",
    "450,000,000", "500,000,000", "550,000,000", "600,000,000",
    "650,000,000", "700,000,000", "750,000,000", "800,000,000", 
    "850,000,000", "900,000,000", "950,000,000","1,000,000,000"
}

-- selections for presets
helper.afk.nightclub_opts = {
    first = {"La Mesa", "Mission Row", "Vespucci Canals"},
    second = {"Vespucci Canals", "Mission Row", "La Mesa"},
    owned = nil
}

helper.afk.arcade_opts = {
    first = {"La Mesa", "Davis", "Eight Bit"},
    second = {"Eight Bit", "Davis", "La Mesa"},
    owned = nil
}

helper.afk.autoshop_opts = {
    first = {"La Mesa", "Mission Row", "Burton"},
    second = {"Burton", "Mission Row", "La Mesa"},
    owned = nil
}

helper.afk.hangar_opts = {
    first = {"Fort Zancudo A2", "Fort Zancudo 3497", "Fort Zancudo 3499"},
    second = {"Fort Zancudo 3499", "Fort Zancudo 3497", "Fort Zancudo A2"},
    owned = nil
}

helper.afk.facility_opts = {
    first = {"Land Act Reservoir", "Ron Alternates Wind Farm", "Fort Zancudo"},
    second = {"Fort Zancudo", "Ron Alternates Wind Farm", "Land Act Reservoir"},
    owned = nil
}

helper.afk.agency_opts = {
    first = {"Hawick", "Rockford Hills", "Little Seoul"},
    second = {"Little Seoul", "Rockford Hills", "Hawick"},
    owned = nil
}

-- collectibles
helper.joaat_pickups = {
    bst = "prop_drug_package_02",
    prbubble_figure = "vm_prop_vm_colle_prbubble"
}

-- objects
helper.joaat_objs = {
    nightclub = {
        safe_door = "ba_prop_door_safe_02"
    }
}

-- matrix of hashes
local matrix = { 0x5bc3b301, 0xeb9dbc36, 0x5c84309b, 0x88fb0e6c, 0x82474ede, 0xf6460c70, 0x12124443, 0xca11e96a, 0x2e1e6faa, 0xcdb0ce3f, 0x62d87e74, 0x51f1e888, 0xb9f6d27f, 0x1d1ea7d4, 0xf8bcfa00, 0xde52051, 0xb09bb7d1, 0xedb89689, 0xf7b715dd, 0x12070231, 0xe5fecdc2, 0xadd45e80, 0xc4859d52, 0x14159076, 0x83ba4249, 0xf9643156, 0x7f8c5a21, 0xbc0b7dc, 0x56f56335, 0x7be9f8d0, 0x3823872f, 0x53355d1b, 0x19ccab7, 0x3a3eea5f, 0x60167782, 0x571f0621, 0xffffffff2b9e817b, 0xffffffff73feac05, 0xffffffffcfeb060e, 0x42edbf2, 0xffffffff4e21223e, -0x273f1341, -0x20c5b6f4, 0xffffffff2f9a5675, -0x302a699b, 0x82f0d06, 0x4ecc798e, 0xbc3ad42, 0x14206516, 0x327ceaf4, 0xb0fb097, 0x61a11c4a, 0x8899adda, 0xb35403a8, 0xfe481bd6, 0xd37b58f2, 0x87fb0631, 0xf1f37d8b, 0xd7387deb, 0x941962d8, 0xa2e9aae0, 0xaefe85b7, 0x8033b494, 0x53b9de23, 0x15d94bb5, 0x39e9907f, 0x5b537bd6, 0x653d687c, 0xfedc378a, 0xe177953b, 0x8fc76360, 0xa9d3caf3, 0x2280d197, 0xdd9d34d5, 0xf5248f79, 0xfc5682b9, 0x468a620e, 0xc2c44d25, 0x4af9473f, 0xf4e6f5ba, 0x1ac9bc69, 0x59e16b98, 0x87795369, 0x46f3af2a, 0xeae622da, 0x6e1348f7, 0xc75798ef, 0x923f96a, 0x9bde433d, 0x64c283, 0x3ad8064, 0xedaeffac, 0x6a28fc95, 0xf921abe4, 0xd8c4fb2b, 0x972b7c26, 0x10afbde1, 0xb4658f3f, 0x2df4c690, 0x15c2074c, 0x7417b8c3, 0xd8b8ed07, 0x4c54332b, 0x377088f, 0x8e8ccc6d, 0x2357a296, 0x9052888d, 0xe74b91a2, 0xfc629cec, 0xb83e5b1e, 0x393b9a49, 0xf4349408, 0xca1ea9d5, 0x69b2072c, 0xe37f8e56, 0x6a65538f, 0xcdd9390f, 0x83a49d99, 0xd0ba7f42, 0xaeb2f08e, 0xc50203a, 0xb5ec521, 0x5e225107, 0x7237b79d, 0x31a350e1, 0xc521e014, 0xae588334, 0x76dd6a6e, 0x2c3c21c6, 0x9c21ea2b, 0xe2337a6, 0xce14aa05, 0xc47abf24, 0xd62da1ea, 0x8065325d, 0xfba807d2, 0x79fe6f47, 0xf3465f97, 0x6bbb47bd, 0x8654e313, 0x1feb8005, 0x5dd6499a, 0x62ccb065, 0x6cb2729f, 0xee3f1db6, 0xa87895c6, 0xb15a8cfe, 0x71b7159f, 0x44fd27bb, 0xe3274a82, 0x66b815cd, 0xfb61cb6f, 0xf4e66f43, 0xddda806b, 0x38e959aa, 0xc38f8a58, 0x51d4307b, 0xf5d42bae, 0x95ea7c48, 0x55c67653, 0x39c2899c, 0x5a776763, 0xe6560295, 0x58b41758, 0xa70806bc, 0x3d5ef31e, 0xf997e7b5, 0x1122a706, 0x7ded8c54, 0x47535d3a, 0x1eb854e0, 0x29a7b388, 0xf567639d, 0xc012ce45, 0x25847f1a, 0xb86743e4, 0x90936eb3, 0x2f917722, 0x477e67fa, 0x6997d8cf, 0x58bd4d77, 0x78751974, 0xf549ec12, 0xfbd68af5, 0xac554945, 0x3bd3f98f, 0x2438395a, 0x3ea2ab31, 0x5ee73573, 0xcb8bffa6, 0x4965bafc, 0x44f1ed34, 0x8e3c20eb, 0xb43b19ff, 0x80fe01c3, 0xb49619, 0x2db5659f, 0x530cc287, 0x2d6cd4f2, 0xb4815362, 0x16468f66, 0xc2d782c, 0x690e9400, 0x9f35447, 0x633e7323, 0x92e8eec7, 0xea5b2708, 0x8fd84cf2, 0x54aa4884, 0xa8eb41c1, 0x8e912182, 0x4302e097, 0x9d3a12df, 0x258ef8ba, 0xf48599dd, 0x36d9e7c0, 0x39884bbf, 0xebcedf54, 0x4b7e9db4, 0xcc4340b8, 0xbeb0d3f0, 0x380f143c, 0x78966c1b, 0x514bd830, 0x8a9fe5b8, 0x9f023dd1, 0xf0758fa7, 0x177ea28, 0x3cc8b3ac, 0x7ac4092d, 0xd5996780, 0xaf891b99, 0xb2202105, 0x346a2280, 0xe99252b7, 0xa90e4fcd, 0x27bc389d, 0x4e0733c5, 0xb148f936, 0xf90df9c0, 0x65bb362, 0xab84d76d, 0x39be3c08, 0xb8d379d6, 0x8b574ffe, 0xef644fa0, 0xf2f1f2eb, 0x56d7c95a, 0x763c635f, 0xa50f2edb, 0xbaa046cf, 0x146eee5c, 0xe2c381e7, 0x4f93709a, 0x6d1b4429, 0x707f024b }

function helper:FIND_MATRIX_HASH(key) return matrix[16 * (key >> 4 & 0xF) + (key & 0xF) + 1] end

function helper:MATRIX_LOOKUP(prop, ptype)
    local slot = util.get_char_slot()

    if prop == "nightclub" then
        if ptype == 0 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A) + helper:FIND_MATRIX_HASH(0x1A + 10)
            end
        end

        if ptype == 1 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A + 5)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A + 5) + helper:FIND_MATRIX_HASH(0x1A + 11)
            end
        end
    end

    if prop == "arcade" then
        if ptype == 0 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A + 1)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A + 1) + helper:FIND_MATRIX_HASH(0x1A + 12)
            end
        end

        if ptype == 1 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A + 6)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A + 6) + helper:FIND_MATRIX_HASH(0x1A + 13)
            end
        end
    end

    if prop == "autoshop" then
        if ptype == 0 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A + 2)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A + 2) + helper:FIND_MATRIX_HASH(0x1A + 14)
            end
        end

        if ptype == 1 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A + 7)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A + 7) + helper:FIND_MATRIX_HASH(0x1A + 15)
            end
        end
    end

    if prop == "hangar" then
        if ptype == 0 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A + 3)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A + 3) + helper:FIND_MATRIX_HASH(0x1A + 16)
            end
        end

        if ptype == 1 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A + 8)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A + 8) + helper:FIND_MATRIX_HASH(0x1A + 17)
            end
        end
    end

    if prop == "agency" then
        if ptype == 0 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A + 4)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A + 4) + helper:FIND_MATRIX_HASH(0x1A + 18)
            end
        end

        if ptype == 1 then
            if slot == 0 then
                return helper:FIND_MATRIX_HASH(0x1A + 9)
            end

            if slot == 1 then
                return helper:FIND_MATRIX_HASH(0x1A + 9) + helper:FIND_MATRIX_HASH(0x1A + 19)
            end
        end
    end
end

-- function to convert selected option to a usable value
function helper:CONVERT_VALUE(value)
    value = string.gsub(value, ",", "")
    return tonumber(value, 10)
end

-- add property function (replaces individual functions)
function helper.afk:ADD_PROPERTY(property, name, purchase)
    local location = {
        name = name,
        purchase = purchase
    }

    table.insert(helper.afk[property].locations, location)
end

-- purchase property function (replaces individual functions)
function helper.afk:PURCHASE_PROPERTY(property, name)
    if menu.ref_by_rel_path(helper.presets_nightclub, "AFK Loop").value == false then
        if property == "nightclub" then
            if helper:IS_SCREEN_OPEN() then
                helper.afk:CLOSE_BROWSER()
            end

            return
        end
    end

    if menu.ref_by_rel_path(helper.presets_arcade, "AFK Loop").value == false then
        if property == "arcade" then
            if helper:IS_SCREEN_OPEN() then
                helper.afk:CLOSE_BROWSER()
            end
        end
    end

    if menu.ref_by_rel_path(helper.presets_autoshop, "AFK Loop").value == false then
        if property == "autoshop" then
            if helper:IS_SCREEN_OPEN() then
                helper.afk:CLOSE_BROWSER()
            end
        end
    end

    if menu.ref_by_rel_path(helper.presets_hangar, "AFK Loop").value == false then
        if property == "hangar" then
            if helper:IS_SCREEN_OPEN() then
                helper.afk:CLOSE_BROWSER()
            end
        end
    end

    if menu.ref_by_rel_path(helper.presets_agency, "AFK Loop").value == false then
        if property == "agency" then
            if helper:IS_SCREEN_OPEN() then
                helper.afk:CLOSE_BROWSER()
            end
        end
    end

    local properties = helper.afk[property]
    local locations = properties.locations

    for key, value in pairs(locations) do
        if value.name == name then
            return value.purchase()
        end
    end
end

-- determine if a property is owned
function helper.afk:IS_PROPERTY_OWNED(property)
    if not helper.script_settings.ownership_check then
        return true -- return true if ownership check is disabled to bypass the check
    end

    local hash = helper:MATRIX_LOOKUP(property, 1) 
    local ptr = memory.alloc(4)

    if STATS.STAT_GET_INT(hash, ptr, -1) then
        return memory.read_int(ptr) ~= 0
    else
        return false
    end
end

-- get the property id of the property that is owned
function helper:GET_OWNED_PROPERTY_NAME(property)
    local owned = helper.afk:IS_PROPERTY_OWNED(property)
    if owned then
        local hash = helper:MATRIX_LOOKUP(property, 1)
        local ptr = memory.alloc(4)

        if STATS.STAT_GET_INT(hash, ptr, -1) then
            local id = memory.read_int(ptr)
            for key, value in pairs(helper.property_ids[property .. "s"]) do
                if value == id then
                    return key
                end
            end
        else
            return nil
        end
    else
        return nil
    end
end

-- get property price
function helper:GET_PROPERTY_PRICE(property, name)
    local prices = helper.prices[property]
    local price = prices[name]

    return memory.read_int(price)
end

-- determine if player can make a purchase of x amount
function helper:CAN_MAKE_PURCHASE(amount)
    local wallet = players.get_wallet(players.user()) -- players wallet
    local bank = players.get_bank(players.user()) -- players bank

    if wallet ~= nil and bank ~= nil then
        return (wallet + bank) >= amount -- return true if player can make the purchase
    end

    return false -- return false if wallet or bank is nil
end

-- add reference to helper
function helper:add(ref, name)
    self[name] = ref
end

-- get memory address for globals
function helper:TUNABLE(start, offset)
    start = start or 262145
    return memory.script_global(start + offset)
end

-- read stats
function helper:STAT_GET_INT(stat)
    local char_slot = util.get_char_slot() -- get character slot
    local ptr = memory.alloc(4) -- allocate memory for stat

    if type(stat) == "string" then
        
        stat = util.joaat("MP" .. char_slot .. "_" .. stat) -- get the hash of the stat

        if STATS.STAT_GET_INT(stat, ptr, -1) then
            return memory.read_int(ptr) -- return the stat value
        else
            return nil -- return nil if reading the stat failed
        end
    else
        if STATS.STAT_GET_INT(stat, ptr, -1) then
            return memory.read_int(ptr) -- return the stat value
        else
            return nil -- return nil if reading the stat failed
        end
    end
end

-- write stats
function helper:STAT_SET_INT(stat, value, save)
    save = save or true -- set default value for save argument

    if type(stat) == "string" then
        local char_slot = util.get_char_slot() -- get character slot
        stat = util.joaat("MP" .. char_slot .. "_" .. stat) -- get the hash of the stat

        return STATS.STAT_SET_INT(stat, value, save) -- set the stat value
    else
        return STATS.STAT_SET_INT(stat, value, save) -- set the stat value
    end
end

-- simulate user input
function SIMULATE_CONTROL_KEY(key, times, control=0, delay=300)
    for i = 1, times do
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(control, key, 1)
        util.yield(delay)
    end

    util.yield(100)
end

-- move cursor
function MOVE_CURSOR(x, y, delay=300, autoclick=false)
    PAD.SET_CURSOR_POSITION(x, y)
    util.yield(delay)

    if autoclick then
        SIMULATE_CONTROL_KEY(201, 1)
    end
end

-- close internet
function helper.afk:CLOSE_BROWSER()
    PED.SET_PED_TO_RAGDOLL(players.user_ped(), helper.afk.ragdoll_timer, helper.afk.ragdoll_timer, 2, 0, 0, 0) -- ragdoll to close browser
end

-- notify wrapper for util.toast and show_corner_help
function helper:NOTIFY(text, func)
    func = func or util.toast
    func(text)
end

-- quick notification for stand being open when purchasing a property
function helper:STAND_OPEN_ERROR()
    while menu.is_open() do
        helper:NOTIFY("Close Stand Mod Menu to continue")
        util.yield()
    end
end

-- not implemented notification
function helper:NOT_IMPLEMENTED()
    helper:NOTIFY("Not implemented yet")
end

-- add the location for nightclub 1/3 (La Mesa)
helper.afk:ADD_PROPERTY("nightclub", "La Mesa", function()
    MOVE_CURSOR(0.69, 0.58, 300, true) -- select the nightclub
    MOVE_CURSOR(0.30, 0.73, 300, true) -- press the first buy button
    MOVE_CURSOR(0.30, 0.93, 300, true) -- press the second buy button
    MOVE_CURSOR(0.78, 0.91, 300, true) -- press the third buy butwton
    SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
    SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
    util.yield(1500) -- wait for transaction to complete
    helper.afk:CLOSE_BROWSER() -- close browser
end)

-- add the location for nightclub 2/3 (Mission Row)
helper.afk:ADD_PROPERTY("nightclub", "Mission Row", function()
    MOVE_CURSOR(0.64, 0.51, 300, true) -- select the nightclub
    MOVE_CURSOR(0.30, 0.73, 300, true) -- press the first buy button
    MOVE_CURSOR(0.30, 0.93, 300, true) -- press the second buy button
    MOVE_CURSOR(0.78, 0.91, 300, true) -- press the third buy button
    SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
    SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
    util.yield(1500) -- wait for transaction to complete
    helper.afk:CLOSE_BROWSER() -- close browser
end)

-- add the location for nightclub 3/3 (Vespucci Canals)
helper.afk:ADD_PROPERTY("nightclub", "Vespucci Canals", function()
    MOVE_CURSOR(0.479, 0.54, 300, true) -- select the nightclub
    MOVE_CURSOR(0.30, 0.73, 300, true) -- press the first buy button
    MOVE_CURSOR(0.30, 0.93, 300, true) -- press the second buy button
    MOVE_CURSOR(0.78, 0.91, 300, true) -- press the third buy button
    SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
    SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
    util.yield(1500) -- wait for transaction to complete
    helper.afk:CLOSE_BROWSER() -- close browser
end)

-- add the location for arcade 1/3 (La Mesa)
helper.afk:ADD_PROPERTY("arcade", "La Mesa", function()
    MOVE_CURSOR(0.687, 0.48, 300, true) -- select the arcade
    MOVE_CURSOR(0.30, 0.78, 300, true) -- press the first buy button
    MOVE_CURSOR(0.30, 0.92, 300, true) -- press the second buy button
    MOVE_CURSOR(0.78, 0.91, 300, true) -- press the third buy button
    SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
    SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
    util.yield(1500) -- wait for transaction to complete
    helper.afk:CLOSE_BROWSER() -- close browser
end)

-- add the location for arcade 2/3 (Davis)
helper.afk:ADD_PROPERTY("arcade", "Davis", function()
    MOVE_CURSOR(0.593, 0.67, 300, true) -- select the arcade
    MOVE_CURSOR(0.30, 0.81, 300, true) -- press the first buy button
    MOVE_CURSOR(0.30, 0.92, 300, true) -- press the second buy button
    MOVE_CURSOR(0.78, 0.91, 300, true) -- press the third buy button
    SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
    SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
    util.yield(1500) -- wait for transaction to complete
    helper.afk:CLOSE_BROWSER() -- close browser
end)

-- add the location for arcade 3/3 (Eight Bit)
helper.afk:ADD_PROPERTY("arcade", "Eight Bit", function()
    MOVE_CURSOR(0.54, 0.27, 300, true) -- select the arcade
    MOVE_CURSOR(0.30, 0.81, 300, true) -- press the first buy button
    MOVE_CURSOR(0.30, 0.92, 300, true) -- press the second buy button
    MOVE_CURSOR(0.78, 0.91, 300, true) -- press the third buy button
    SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
    SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
    util.yield(1500) -- wait for transaction to complete
    helper.afk:CLOSE_BROWSER() -- close browser
end)

-- add the location for autoshop 1/3 (La Mesa)
helper.afk:ADD_PROPERTY("autoshop", "La Mesa", function()
    MOVE_CURSOR(0.687, 0.455, 300, true) -- select the autoshop
    MOVE_CURSOR(0.30, 0.75, 300, true) -- press the first buy button
    MOVE_CURSOR(0.30, 0.92, 300, true) -- press the second buy button
    MOVE_CURSOR(0.78, 0.94, 300, true) -- press the third buy button
    SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
    SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
    util.yield(1500) -- wait for transaction to complete
    helper.afk:CLOSE_BROWSER() -- close browser
end)

-- add the location for autoshop 2/3 (Mission Row)
helper.afk:ADD_PROPERTY("autoshop", "Mission Row", function()
    MOVE_CURSOR(0.66, 0.49, 300, true) -- select the autoshop
    MOVE_CURSOR(0.30, 0.75, 300, true) -- press the first buy button
    MOVE_CURSOR(0.30, 0.92, 300, true) -- press the second buy button
    MOVE_CURSOR(0.78, 0.94, 300, true) -- press the third buy button
    SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
    SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
    util.yield(1500) -- wait for transaction to complete
    helper.afk:CLOSE_BROWSER() -- close browser
end)

-- add the location for autoshop 3/3 (Butron)
helper.afk:ADD_PROPERTY("autoshop", "Burton", function()
    MOVE_CURSOR(0.585, 0.32, 300, true) -- select the autoshop
    MOVE_CURSOR(0.30, 0.75, 300, true) -- press the first buy button
    MOVE_CURSOR(0.30, 0.92, 300, true) -- press the second buy button
    MOVE_CURSOR(0.78, 0.94, 300, true) -- press the third buy button
    SIMULATE_CONTROL_KEY(176, 1) -- press enter to purchase
    SIMULATE_CONTROL_KEY(201, 1, 2) -- confirm purchase
    util.yield(1500) -- wait for transaction to complete
    helper.afk:CLOSE_BROWSER() -- close browser
end)

-- function to open internet for afk loop
function helper.afk:OPEN_INTERNET(filter)
    if menu.ref_by_rel_path(helper.presets_nightclub, "AFK Loop").value == false then
        if filter == "nightclub" then
            if helper:IS_SCREEN_OPEN() then
                helper.afk:CLOSE_BROWSER()
            end

            return
        end
    end

    if menu.ref_by_rel_path(helper.presets_arcade, "AFK Loop").value == false then
        if filter == "arcade" then
            if helper.afk:IS_SCREEN_OPEN() then
                helper:CLOSE_BROWSER()
            end

            return
        end
    end

    if menu.ref_by_rel_path(helper.presets_autoshop, "AFK Loop").value == false then
        if filter == "autoshop" then
            if helper:IS_SCREEN_OPEN() then
                helper.afk:CLOSE_BROWSER()
            end

            return
        end
    end

    if menu.ref_by_rel_path(helper.presets_hangar, "AFK Loop").value == false then
        if filter == "hangar" then
            if helper:IS_SCREEN_OPEN() then
                helper.afk:CLOSE_BROWSER()
            end

            return
        end
    end

    if menu.ref_by_rel_path(helper.presets_agency, "AFK Loop").value == false then
        if filter == "agency" then
            if helper:IS_SCREEN_OPEN() then
                helper.afk:CLOSE_BROWSER()
            end

            return
        end
    end

    helper:STAND_OPEN_ERROR()

    local xptr, yptr = memory.alloc(4), memory.alloc(4)
    GRAPHICS.GET_ACTUAL_SCREEN_RESOLUTION(xptr, yptr)
    local x, y = tonumber(memory.read_int(xptr)), tonumber(memory.read_int(yptr))

    SIMULATE_CONTROL_KEY(27, 1) -- open phone
    SIMULATE_CONTROL_KEY(173, 2) -- scroll down
    SIMULATE_CONTROL_KEY(176, 1) -- select internet
    MOVE_CURSOR(0.25, 0.70, 300, true) -- mazebank hyperlink
    MOVE_CURSOR(0.5, 0.83, 300, true) -- enter mazebank button
    
    switch x do
        case 1920:
            if filter == "nightclub" then MOVE_CURSOR(0.78, 0.28) end -- nightclub filter
            if filter == "arcade" then MOVE_CURSOR(0.86, 0.28) end -- arcade filter
            if filter == "autoshop" then MOVE_CURSOR(0.94, 0.28) end -- autoshop filter
            if filter == "facility" then MOVE_CURSOR(0.70, 0.28) end -- facility filter
            break
        case 1680:
            if filter == "nightclub" then MOVE_CURSOR(0.78 - helper.afk.nightclub.offset, 0.28) end -- nightclub filter
            if filter == "arcade" then MOVE_CURSOR(0.86 - helper.afk.arcade.offset, 0.28) end -- arcade filter
            if filter == "autoshop" then MOVE_CURSOR(0.94 - helper.afk.autoshop.offset, 0.28) end -- autoshop filter
            if filter == "facility" then MOVE_CURSOR(0.70 - helper.afk.facility.offset, 0.28) end -- facility filter
            break
        case 1600:
            if y == 1024 then
                if filter == "nightclub" then MOVE_CURSOR(0.78 - (helper.afk.nightclub.offset + 0.01), 0.28) end -- nightclub filter
                if filter == "arcade" then MOVE_CURSOR(0.86 - (helper.afk.arcade.offset + 0.01), 0.28) end -- arcade filter
                if filter == "autoshop" then MOVE_CURSOR(0.94 - (helper.afk.autoshop.offset + 0.01), 0.28) end -- autoshop filter
                if filter == "facility" then MOVE_CURSOR(0.70 - (helper.afk.facility.offset + 0.01), 0.28) end -- facility filter
            end

            if y == 900 then
                if filter == "nightclub" then MOVE_CURSOR(0.78, 0.28) end -- nightclub filter
                if filter == "arcade" then MOVE_CURSOR(0.86, 0.28) end -- arcade filter
                if filter == "autoshop" then MOVE_CURSOR(0.94, 0.28) end -- autoshop filter
                if filter == "facility" then MOVE_CURSOR(0.70, 0.28) end -- facility filter
            end
            break
        case 1440:
            if filter == "nightclub" then MOVE_CURSOR(0.78 - helper.afk.nightclub.offset, 0.28) end -- nightclub filter
            if filter == "arcade" then MOVE_CURSOR(0.86 - helper.afk.arcade.offset, 0.28) end -- arcade filter
            if filter == "autoshop" then MOVE_CURSOR(0.94 - helper.afk.autoshop.offset, 0.28) end -- autoshop filter
            if filter == "facility" then MOVE_CURSOR(0.70 - helper.afk.facility.offset, 0.28) end -- facility filter
            break
        case 1366:
            if filter == "nightclub" then MOVE_CURSOR(0.78, 0.28) end -- nightclub filter
            if filter == "arcade" then MOVE_CURSOR(0.86, 0.28) end -- arcade filter
            if filter == "autoshop" then MOVE_CURSOR(0.94, 0.28) end -- autoshop filter
            if filter == "facility" then MOVE_CURSOR(0.70, 0.28) end -- facility filter
            break
        case 1360:
            if filter == "nightclub" then MOVE_CURSOR(0.78, 0.28) end -- nightclub filter
            if filter == "arcade" then MOVE_CURSOR(0.86, 0.28) end -- arcade filter
            if filter == "autoshop" then MOVE_CURSOR(0.94, 0.28) end -- autoshop filter
            if filter == "facility" then MOVE_CURSOR(0.70, 0.28) end -- facility filter
            break
        case 1280: 
            if y == 1024 then
                if filter == "nightclub" then MOVE_CURSOR(0.78 - (helper.afk.nightclub.offset * 3), 0.28) end -- nightclub filter
                if filter == "arcade" then MOVE_CURSOR(0.86 - (helper.afk.arcade.offset * 3), 0.28) end -- arcade filter
                if filter == "autoshop" then MOVE_CURSOR(0.94 - (helper.afk.autoshop.offset * 3), 0.28) end -- autoshop filter
                if filter == "facility" then MOVE_CURSOR(0.70 - (helper.afk.facility.offset * 3), 0.28) end -- facility filter
            end

            if y == 960 then
                if filter == "nightclub" then MOVE_CURSOR(0.78 - (helper.afk.nightclub.offset * 2.5), 0.28) end -- nightclub filter
                if filter == "arcade" then MOVE_CURSOR(0.86 - (helper.afk.arcade.offset * 2.5), 0.28) end -- arcade filter
                if filter == "autoshop" then MOVE_CURSOR(0.94 - (helper.afk.autoshop.offset * 2.5), 0.28) end -- autoshop filter
                if filter == "facility" then helper:OVE_CURSOR(0.70 - (helper.afk.facility.offset * 2.5), 0.28) end -- facility filter
            end

            if y == 800 then
                if filter == "nightclub" then MOVE_CURSOR(0.78 - helper.afk.nightclub.offset, 0.28) end -- nightclub filter
                if filter == "arcade" then MOVE_CURSOR(0.86 - helper.afk.arcade.offset, 0.28) end -- arcade filter
                if filter == "autoshop" then MOVE_CURSOR(0.94 - helper.afk.autoshop.offset, 0.28) end -- autoshop filter
                if filter == "facility" then MOVE_CURSOR(0.70 - helper.afk.facility.offset, 0.28) end -- facility filter
            end

            if y == 768 then
                if filter == "nightclub" then MOVE_CURSOR(0.78 - (helper.afk.nightclub.offset / 2), 0.28) end -- nightclub filter
                if filter == "arcade" then MOVE_CURSOR(0.86 - (helper.afk.arcade.offset / 2), 0.28) end -- arcade filter
                if filter == "autoshop" then MOVE_CURSOR(0.94 - (helper.afk.autoshop.offset / 2), 0.28) end -- autoshop filter    
                if filter == "facility" then MOVE_CURSOR(0.70 - (helper.afk.facility.offset / 2), 0.28) end -- facility filter
            end

            if y == 720 then
                if filter == "nightclub" then MOVE_CURSOR(0.78, 0.28) end -- nightclub filter
                if filter == "arcade" then MOVE_CURSOR(0.86, 0.28) end -- arcade filter
                if filter == "autoshop" then MOVE_CURSOR(0.94, 0.28) end -- autoshop filter 
                if filter == "facility" then MOVE_CURSOR(0.70, 0.28) end -- facility filter
            end
            break
        case 1176:
            if filter == "nightclub" then MOVE_CURSOR(0.78, 0.28) end -- nightclub filter
            if filter == "arcade" then MOVE_CURSOR(0.86, 0.28) end -- arcade filter
            if filter == "autoshop" then MOVE_CURSOR(0.94, 0.28) end -- autoshop filter
            if filter == "facility" then MOVE_CURSOR(0.70, 0.28) end -- facility filter
            break
        case 1152:
            if filter == "nightclub" then MOVE_CURSOR(0.78 - (helper.afk.nightclub.offset * 2.5), 0.28) end -- nightclub filter
            if filter == "arcade" then MOVE_CURSOR(0.86 - (helper.afk.arcade.offset * 2.5), 0.28) end -- arcade filter
            if filter == "autoshop" then MOVE_CURSOR(0.94 - (helper.afk.autoshop.offset * 2.5), 0.28) end -- autoshop filter
            if filter == "facility" then MOVE_CURSOR(0.70 - (helper.afk.facility.offset * 2.5), 0.28) end -- facility filter
            break
        case 1024:
            if filter == "nightclub" then MOVE_CURSOR(0.78 - (helper.afk.nightclub.offset * 2.5), 0.28) end -- nightclub filter
            if filter == "arcade" then MOVE_CURSOR(0.86 - (helper.afk.arcade.offset * 2.5), 0.28) end -- arcade filter
            if filter == "autoshop" then MOVE_CURSOR(0.94 - (helper.afk.autoshop.offset * 2.5), 0.28) end -- autoshop filter
            if filter == "facility" then MOVE_CURSOR(0.70 - (helper.afk.facility.offset * 2.5), 0.28) end -- facility filter
            break
        case 800:
            if filter == "nightclub" then MOVE_CURSOR(0.78 - (helper.afk.nightclub.offset * 2.5), 0.28) end -- nightclub filter
            if filter == "arcade" then MOVE_CURSOR(0.86 - (helper.afk.arcade.offset * 2.5), 0.28) end -- arcade filter
            if filter == "autoshop" then MOVE_CURSOR(0.94 - (helper.afk.autoshop.offset * 2.5), 0.28) end -- autoshop filter
            if filter == "facility" then MOVE_CURSOR(0.70 - (helper.afk.facility.offset * 2.5), 0.28) end -- facility filter
            break
        default: 
            util.toast("Unsupported resolution: " .. x .. "x" .. y)
    end

    SIMULATE_CONTROL_KEY(201, 1) -- select filter
end

-- automatically pickup the specified pickup
function helper:COLLECT_PICKUP(model)
    for _, pickup in pairs(entities.get_all_pickups_as_handles()) do
        local pickup_model = ENTITY.GET_ENTITY_MODEL(pickup)

        if util.reverse_joaat(pickup_model) == model then
            local coords = ENTITY.GET_ENTITY_COORDS(players.user_ped(), true)
            ENTITY.SET_ENTITY_COORDS(pickup, coords.x, coords.y, coords.z, true, true, true, true)
        end
    end
end

-- purchases bst
function helper:BUY_BST(value=1000)
    local interaction_menu = memory.script_global(2766485)
    local interaction_menu_item = memory.script_global(2766576 + 7531) 
    local bst_cost = helper:TUNABLE(262145, 12849)
    local bst_cooldown = helper:TUNABLE(262145, 12836)
    local disable_bst = helper:TUNABLE(262145, 12902)
    local delay = 1

    if value < 1000 then value = 1000 end

    memory.write_int(interaction_menu, 30) -- render VIP/CEO abilties in interaction menu
    memory.write_int(bst_cost, value)
    memory.write_int(bst_cooldown, 0)
    memory.write_int(disable_bst, 0)

    SIMULATE_CONTROL_KEY(244, 1, 0, delay) -- open interaction menu
    SIMULATE_CONTROL_KEY(173, 1, 0, delay) -- scroll down to bst
    
    if memory.read_int(interaction_menu_item) == 1 then -- make sure correct item is selected
        SIMULATE_CONTROL_KEY(176, 1, 0, delay) -- press enter on bst
        util.yield(100)
        helper:COLLECT_PICKUP(helper.joaat_pickups.bst) -- collect bst
        memory.write_int(bst_cost, 1000)
    else
        helper:NOTIFY("Next time don\'t press any buttons dumbass")
    end
end

-- check if screen is open (internet browser, terrorbyte etc)
function helper:IS_SCREEN_OPEN()
    local screen = memory.script_global(75693)
    return memory.read_int(screen) ~= 0
end

-- check if getting transaction error
function helper:TRANSACTION_ERROR_DISPLAYED()
    local banner = memory.script_global(4536673)
    local notif = memory.script_global(4536674)

    if helper.script_settings.abort_on_transaction_error then
        return memory.read_int(banner) ~= 0 or memory.read_int(notif) ~= 0
    else
        return false
    end
end

-- automatically accept transaction errors
function helper:ACCEPT_TRANSACTION_ERROR()
    if helper:TRANSACTION_ERROR_DISPLAYED() then
        SIMULATE_CONTROL_KEY(201, 1, 2, 1)
    end
end

-- transition state
function helper:GET_TRANSITION_STATE()
    local state = memory.script_global(1574993)
    return memory.read_int(state)
end

-- bug message
function helper:BUG_FOUND()
    helper:NOTIFY("The AFK loop bug has been reported and will be fixed asap, the bug doesn\'t occur for me at all which will make it harder to find the cause", util.show_corner_help)
end

-- create the update button
helper:add(
    root:action("Update", {}, "Update script to the latest version", function()
        async_http.init("sodamnez.xyz", "lua/recovery/Recovery.lua", function(body, headers, status_code)
            if status_code == 200 then
                local file = io.open(filesystem.scripts_dir() .. SCRIPT_RELPATH, 'wb')
                file:write(body)
                file:close()

                util.toast("Updated successfully, restarting script...")
                util.restart_script()
            else
                util.toast("Update failed (" .. status_code .. ")")
            end
        end)

        async_http.dispatch()
    end),
    "update"
)

-- hide update button until update check is finished
helper.update.visible = false

-- show bug message
helper:BUG_FOUND()

-- json related functions
helper.json = {}

function helper.json:stringify(obj)
    local function stringify(obj)
        local str = ""

        if type(obj) == "table" then
            str = str .. "{"
            for k, v in pairs(obj) do
                str = str .. stringify(k) .. ":" .. stringify(v) .. ","
            end
            str = str .. "}"
        elseif type(obj) == "string" then
            str = str .. "\"" .. obj .. "\""
        else
            str = str .. tostring(obj)
        end

        return str
    end

    return stringify(obj)
end

function helper.json:parse(str)
    local obj = {}

    str = str:gsub("{", "")
    str = str:gsub("}", "")
    str = str:gsub("\"", "")
    str = str:gsub(" ", "")

    local split = str:split(",")

    for i = 1, #split do
        local split2 = split[i]:split(":")
        obj[split2[1]] = split2[2]
    end

    return obj
end

-- checking for updates function
function helper:check_for_updates(update_callback)
    async_http.init("sodamnez.xyz", "lua/recovery/update.php?version=" .. helper.script_settings.script_ver, function(body, headers, status_code)
        if status_code == 200 then
            local update = body
            local version = headers["Version"]
            
            if update == "1" then
                update_callback(version)
            end
        end
    end)

    async_http.dispatch()
end

-- check for updates
helper:check_for_updates(function(version)
    util.toast("New update available! ")

    helper.update.visible = true
end)

-- add settings list to menu
helper:add(
    root:list("Settings", {"rssettings"}, ""),
    "settings"
)

-- add tools list to menu
helper:add(
    root:list("Tools", {"rstools"}, ""),
    "tools"
)

-- create divider for recovery
root:divider("Recovery")

-- add presets list to menu
helper:add(
    root:list("Presets", {"rspresets"}, "", function()
        helper:NOTIFY("Without unlocking arcades and autoshops the afk money loop option will not work as intended!", util.show_corner_help)
    end),
    "presets"
)

-- add custom list to menu
helper:add(
    root:list("Custom", {"rscustom"}, ""),
    "custom"
)

-- add dax missions to the menu
helper:add(
    root:list("Dax Missions", {"rsdax"}, ""),
    "dax"
)

-- add casino figures to the menu
helper:add(
    root:list("Casino Figures", {"rscasino"}, ""),
    "casino"
)

-- add heists to the menu
helper:add(
    root:list("Heists", {"rsheists"}, ""),
    "heists"
)

-- add nightclub to the menu
helper:add(
    root:list("Nightclub", {"rsnightclub"}, "", function() helper:NOTIFY("Please make sure that the nightclub safe is closed before enabling AFK loop", util.show_corner_help) end),
    "nightclub"
)

-- add arcade to the menu
helper:add(
    root:list("Arcade", {"rsarcade"}, "", function() helper:NOTIFY("Please make sure that the arcade safe is closed before enabling AFK loop", util.show_corner_help) end),
    "arcade"
)

-- add a divider for other stuff
root:divider("Other", "other")

-- add credits to the menu
helper:add(
    root:list("Credits", {"rscredits"}, "Credits for the script"),
    "credits"
)

helper.credits:divider("Resources", "resources")

-- add root-cause to the menu
helper.credits:hyperlink("Root-Cause", "https://github.com/root-cause/v-decompiled-scripts", "Provided updated decomiled scripts for latest patch (1.64) which is where most of the globals used in this script came from")

-- add unknowncheats to the menu
helper.credits:hyperlink("UnknownCheats", "https://www.unknowncheats.me/forum/grand-theft-auto-v/500059-globals-locals-discussion-read-page-1-a-5.html", "Has a bunch of other useful globals and locals that didn\'t get around to finding myself")

-- add docs.fivem to the menu
helper.credits:hyperlink("FiveM docs", "https://docs.fivem.net/docs/game-references/", "Has a list of all the controls (used for afk functionality) and blip ids used in the script")

-- add nativedb
helper.credits:hyperlink("NativeDB", "https://nativedb.dotindustries.dev/natives", "Provided an enormous list of natives that were used in the script")

-- add a divider for discord
helper.credits:divider("Discord", "discord")

-- add discord link to the menu
helper.credits:hyperlink("Discord", "https://discord.gg/bx8WEZQa49", "Join the discord to report bugs")

-- add disable ownership check setting
helper:add(
    helper.settings:toggle("Ownership Check", {"rsdisableownershipcheck"}, "Enable/disable ownership check for properties", function(state)
        helper.script_settings.ownership_check = state
    end, helper.script_settings.ownership_check),
    "settings_ownership_check"
)

-- add auto accept transaction errors
helper:add(
    helper.settings:toggle("Auto Accept Transaction Errors", {}, "Automatically accepts transaction errors", function()
        local ref = menu.ref_by_rel_path(helper.settings, "Auto Accept Transaction Errors")
        util.create_tick_handler(function()
            if ref.value then
                if helper:TRANSACTION_ERROR_DISPLAYED() then
                    helper:ACCEPT_TRANSACTION_ERROR()
                    helper:NOTIFY("Handling transaction error...")

                    for _, i in pairs(entities.get_all_pickups_as_handles()) do
                        local model = ENTITY.GET_ENTITY_MODEL(i)
                        local pos = ENTITY.GET_ENTITY_COORDS(i, true)
                        local player_pos = ENTITY.GET_ENTITY_COORDS(players.user_ped(), true)

                        if MISC.GET_DISTANCE_BETWEEN_COORDS(pos.x, pos.y, pos.z, player_pos.x, player_pos.y, player_pos.z, true) < 10.0 then
                            entities.delete_by_handle(i)
                        end
                    end
                end
            else
                return false
            end
        end)
    end),
    "settings_auto_accept_transaction_errors"
)

-- add abort on transaction error
helper:add(
    helper.settings:toggle("Abort On Transaction Error", {}, "Prevents transaction error spam (disables casino figures automatically on transaction error)", function(state)
        helper.script_settings.abort_on_transaction_error = state
    end, helper.script_settings.abort_on_transaction_error),
    "settings_abort_on_transaction_error"
)

-- toggle setting on to start accepting transaction errors
menu.ref_by_rel_path(helper.settings, "Auto Accept Transaction Errors").value = helper.script_settings.auto_accept_transaction_error

-- add unlocks dividers
helper.tools:divider("Unlocks", "unlocks")
-- add unlock arcades to tools
helper:add(
    helper.tools:action("Unlock Arcades On MazeBank", {}, "Unlocks arcades", function()
        ENTITY.SET_ENTITY_COORDS(players.user_ped(), 1120.0100097656, -225.07000732422, 69.084953308105, true, true, true, true)
        SIMULATE_CONTROL_KEY(51, 2)
        ENTITY.SET_ENTITY_COORDS(players.user_ped(), 1048.7941894531, -721.57751464844, 57.227325439453, true, true, true, true)
        util.yield(300)
        menu.trigger_commands("skipcutscene")
    end),
    "tools_unlock_arcades"
)

-- add unlock autoshops
helper:add(
    helper.tools:action("Unlock Autoshops On MazeBank", {}, "Unlock Autoshops", function()
        local pos = v3.new(778.99708076172, -1867.5257568359, 28.296264648438)
        ENTITY.SET_ENTITY_COORDS(players.user_ped(), pos.x, pos.y, pos.z, true, true, true, true)
        util.yield(4000)
        menu.trigger_commands("skipcutscene")
    end),
    "tools_unlock_autoshops"
)

helper.tools:action("Deposit Money", {}, "Deposits all money in your wallet", function()
    local amount = players.get_wallet(players.user())

    if NETSHOPPING.NET_GAMESERVER_TRANSFER_WALLET_TO_BANK(util.get_char_slot(), players.get_wallet(players.user())) then
        helper:NOTIFY("Deposited $" .. string.format("%d", amount))
    end
end)

-- add money remover divider
helper.tools:divider("Money Remover", "money_remover")

-- add money remover
helper:add(
    helper.tools:text_input("Money Remover", {"rsremovemoney"}, "Removes money from your account", function() end, "0"),
    "tools_money_remover"
)

-- add button to remove money
helper:add(
    helper.tools:action("Remove Money", {"rsremovemoney"}, "Removes money from your account", function()
        local amount = tonumber(helper.tools_money_remover.value)
    
        if amount == nil then
            helper:NOTIFY("Invalid money amount")
            return
        end
    
        if amount < 0 then
            helper:NOTIFY("Money amount must be greater than 0")
            return
        end
    
        helper:BUY_BST(amount)
        util.yield(200)
        PED.SET_PED_TO_RAGDOLL(players.user_ped(), 1, 1, 0, 0, 0, 0) -- ensures player picks up bst
        util.yield(100)
        menu.trigger_commands("bst off")
    end),
    "tools_remove_money_button"
)

helper.tools:action("Remove Max Money", {"rsremovemaxmoney"}, "Removes max money from your account", function()
    helper:BUY_BST(helper.MAX_INT)
    util.yield(200)
    PED.SET_PED_TO_RAGDOLL(players.user_ped(), 1, 1, 0, 0, 0, 0) -- ensures player picks up bst
    util.yield(100)
    menu.trigger_commands("bst off")
end)
-- add a divider to presets
helper.presets:divider("MazeBank Foreclusure Properties")

-- add presets to presets list (mazebank foreclusure properties)
helper:add(helper.presets:list("Nightclub", {"rsprenightclub"}, "Nightclub recovery options"), "presets_nightclub")
helper:add(helper.presets:list("Arcade", {"reprearcade"}, "Arcade recovery options"), "presets_arcade")
helper:add(helper.presets:list("Autoshop", {"repreautoshop"}, "Autoshop recovery options"), "presets_autoshop")
helper:add(helper.presets:list("Hangar", {"reprehangar"}, "Hangar recovery options"), "presets_hangar")

-- add a divider for Dynasty8 properties
helper.presets:divider("Dynasty8Executive Properties", "dynasty8")

-- add presets to presets list (dynasty8 properties)
helper:add(helper.presets:list("Agency", {"repreagency"}, "Agency recovery options", "dynasty8"), "presets_agency")

-- disable according to states
helper.presets_nightclub.visible = helper.states.nightclub.enabled
helper.presets_arcade.visible = helper.states.arcade.enabled
helper.presets_autoshop.visible = helper.states.autoshop.enabled
helper.presets_hangar.visible = helper.states.hangar.enabled
helper.presets_agency.visible = helper.states.agency.enabled

if not helper.states.nightclub.enabled then helper:NOTIFY("Nightclub preset temporarily disabled\n\nReason: " .. helper.states.nightclub.reason, util.show_corner_help) end
if not helper.states.arcade.enabled then helper:NOTIFY("Arcade preset temporarily disabled\n\nReason: " .. helper.states.arcade.reason , util.show_corner_help) end
if not helper.states.autoshop.enabled then helper:NOTIFY("Autoshop preset temporarily disabled\n\nReason: " .. helper.states.autoshop.reason, util.show_corner_help) end
if not helper.states.hangar.enabled then helper:NOTIFY("Hangar preset temporarily disabled\n\nReason: " .. helper.states.hangar.reason, util.show_corner_help) end
if not helper.states.agency.enabled then helper:NOTIFY("Agency preset temporarily disabled\n\nReason: " .. helper.states.agency.reason, util.show_corner_help) end

-- add money options for nightclub
helper.presets_nightclub:divider("Settings", "nightclub")
helper:add(helper.presets_nightclub:list_select("Money", {}, "The nightclub value", options, 1, function() end), "presets_nightclub_money")

-- add money options for arcade
helper.presets_arcade:divider("Settings", "arcade")
helper:add(helper.presets_arcade:list_select("Money", {}, "The arcade value", options, 1, function() end), "presets_arcade_money")

-- add money options for autoshop
helper.presets_autoshop:divider("Settings", "autoshop")
helper:add(helper.presets_autoshop:list_select("Money", {}, "The autoshop value", options, 1, function() end), "presets_autoshop_money")

-- add money options for hangar
helper.presets_hangar:divider("Settings", "hangar")
helper:add(helper.presets_hangar:list_select("Money", {}, "The hangar value", options, 1, function() end), "presets_hangar_money")

-- add money options for agency
helper.presets_agency:divider("Settings", "agency")
helper:add(helper.presets_agency:list_select("Money", {}, "The agency value", options, 1, function() end), "presets_agency_money")

-- purchase nightclub
helper.presets_nightclub:action("Buy Nightclub", {}, "Automatically purchases a random nightclub", function()
    if helper:GET_TRANSITION_STATE() ~= 66 then
        return helper:NOTIFY("You have not loaded yet, aborting purchase")
    end
    
    local nightclubs = helper.afk.nightclub_opts.first
    local nightclub = nightclubs[math.random(#nightclubs)]
    local owned = helper:GET_OWNED_PROPERTY_NAME("nightclub")
    local value = helper:CONVERT_VALUE(options[helper.presets_nightclub_money.value])
    local hash = helper:MATRIX_LOOKUP("nightclub", 0)

    while owned == nightclub do
        nightclub = nightclubs[math.random(#nightclubs)]
        util.yield()
    end

    if hash == nil then
        helper:NOTIFY("Hash lookup failed")
        return
    end

    local price = helper:GET_PROPERTY_PRICE("nightclub", nightclub)

    value = (value + price) * 2
    if nightclub == "La Mesa" then value = value - 400000 end

    if not helper:CAN_MAKE_PURCHASE(price) then
        helper:NOTIFY("You need $" .. price .. " to purchase this nightclub")
        return
    end

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set nightclub value")
        return
    end

    helper:STAND_OPEN_ERROR()
    helper.afk:OPEN_INTERNET("nightclub")

    if helper:IS_SCREEN_OPEN() then
        helper.afk:PURCHASE_PROPERTY("nightclub", nightclub)
    end
end)

-- add set value to nightclub preset
helper.presets_nightclub:action("Set Value", {}, "Sets the value of the nightclub", function()
    local value = helper:CONVERT_VALUE(options[helper.presets_nightclub_money.value])
    local hash = helper:MATRIX_LOOKUP("nightclub", 0)

    if hash == nil then
        helper:NOTIFY("Hash lookup failed")
        return
    end

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set nightclub value")
        return
    end

    helper:NOTIFY("Set nightclub value to $" .. value)
end)

-- afk loop divider
helper.presets_nightclub:divider("AFK Money Loop", "afk")

-- add first nightclub selection to nightclub preset
helper:add(helper.presets_nightclub:list_select("First Nightclub", {}, "The first nightclub to purchase", helper.afk.nightclub_opts.first, 1, function() end), "presets_nightclub_first")

-- add second nightclub selection to nightclub preset
helper:add(helper.presets_nightclub:list_select("Second Nightclub", {}, "The second nightclub to purchase", helper.afk.nightclub_opts.second, 1, function() end), "presets_nightclub_second")

-- add afk loop button
helper:add(
    helper.presets_nightclub:toggle_loop("AFK Loop", {}, "AFK money loop", function()
        local hash = helper:MATRIX_LOOKUP("nightclub", 0)
        local ref = menu.ref_by_rel_path(helper.presets_nightclub, "AFK Loop")
        local nightclub_first = helper.afk.nightclub_opts.first[helper.presets_nightclub_first.value]
        local nightclub_second = helper.afk.nightclub_opts.second[helper.presets_nightclub_second.value]
        local owned = helper:GET_OWNED_PROPERTY_NAME("nightclub")

        if ref.value == false then return false end
        
        if hash == nil then
            helper:NOTIFY("Hash lookup failed")
            return false
        end

        if ref.value then
            if nightclub_first == owned then
                helper:NOTIFY("You already own " .. nightclub_first .. ", please choose another nightclub")
                ref.value = false
                return false
            end

            if nightclub_first == nightclub_second then
                helper:NOTIFY("First and second nightclub cannot be the same, please choose another nightclub")
                ref.value = false
                return false
            end

            helper:STAT_SET_INT(hash, helper.MAX_INT, true)
            helper.afk:OPEN_INTERNET("nightclub")
            helper.afk:PURCHASE_PROPERTY("nightclub", nightclub_first)
            util.yield(1000)
            helper:STAT_SET_INT(hash, helper.MAX_INT, true)
            helper.afk:OPEN_INTERNET("nightclub")
            helper.afk:PURCHASE_PROPERTY("nightclub", nightclub_second)
            util.yield(1000)
        else
            return false
        end
    end),
    "presets_nightclub_afkloop"
)

-- purchase arcade
helper.presets_arcade:action("Buy Arcade", {}, "Automatically purchases a random arcade", function()
    if helper:GET_TRANSITION_STATE() ~= 66 then
        return helper:NOTIFY("You have not loaded yet, aborting purchase")
    end
    
    local arcades = helper.afk.arcade_opts.first
    local arcade = arcades[math.random(#arcades)]
    local owned = helper:GET_OWNED_PROPERTY_NAME("arcade")
    local value = helper:CONVERT_VALUE(options[helper.presets_arcade_money.value])
    local hash = helper:MATRIX_LOOKUP("arcade", 0)

    while owned == arcade do
        arcade = arcades[math.random(#arcades)]
        util.yield()
    end

    if hash == nil then
        helper:NOTIFY("Hash lookup failed")
        return
    end

    local price = helper:GET_PROPERTY_PRICE("arcade", arcade)
    value = (value + price) * 2

    if not helper:CAN_MAKE_PURCHASE(price) then
        helper:NOTIFY("You need $" .. price .. " to purchase this arcade")
        return
    end

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set arcade value")
        return
    end

    helper.afk:OPEN_INTERNET("arcade")

    if helper:IS_SCREEN_OPEN() then
        helper.afk:PURCHASE_PROPERTY("arcade", arcade)
    end
end)

-- add set value to arcade preset
helper:add(
    helper.presets_arcade:action("Set Value", {}, "Sets the value of the arcade", function()
        local value = helper:CONVERT_VALUE(options[helper.presets_arcade_money.value])
        local hash = helper:MATRIX_LOOKUP("arcade", 0)

        if hash == nil then
            helper:NOTIFY("Hash lookup failed")
            return
        end

        if not helper:STAT_SET_INT(hash, value, true) then
            helper:NOTIFY("Failed to set arcade value")
            return
        end

        helper:NOTIFY("Set arcade value to $" .. value)
    end),
    "presets_arcade_setvalue"
)

-- afk loop divider
helper.presets_arcade:divider("AFK Money Loop", "afk")

-- add first arcade selection to arcade preset
helper:add(helper.presets_arcade:list_select("First Arcade", {}, "The first arcade to purchase", helper.afk.arcade_opts.first, 1, function() end), "presets_arcade_first")

-- add second arcade selection to arcade preset
helper:add(helper.presets_arcade:list_select("Second Arcade", {}, "The second arcade to purchase", helper.afk.arcade_opts.second, 1, function() end), "presets_arcade_second")

-- add afk loop button
helper:add(
    helper.presets_arcade:toggle_loop("AFK Loop", {}, "AFK money loop", function()
        local hash = helper:MATRIX_LOOKUP("arcade", 0)

        local ref = menu.ref_by_rel_path(helper.presets_arcade, "AFK Loop")
        local arcade_first = helper.afk.arcade_opts.first[helper.presets_arcade_first.value]
        local arcade_second = helper.afk.arcade_opts.second[helper.presets_arcade_second.value]
        local owned = helper:GET_OWNED_PROPERTY_NAME("arcade")

        if ref.value == false then return false end

        if hash == nil then
            helper:NOTIFY("Hash lookup failed")
            return false
        end

        if ref.value then
            if arcade_first == owned then
                helper:NOTIFY("You already own " .. arcade_first .. ", please choose another arcade")
                ref.value = false
                return false
            end

            if arcade_first == arcade_second then
                helper:NOTIFY("First and second arcade cannot be the same, please choose another arcade")
                ref.value = false
                return false
            end

            helper:STAT_SET_INT(hash, helper.MAX_INT, true)
            helper.afk:OPEN_INTERNET("arcade")
            helper.afk:PURCHASE_PROPERTY("arcade", arcade_first)
            util.yield(1000)
            helper:STAT_SET_INT(hash, helper.MAX_INT, true)
            helper.afk:OPEN_INTERNET("arcade")
            helper.afk:PURCHASE_PROPERTY("arcade", arcade_second)
            util.yield(1000)
        else
            return false
        end
    end),
    "presets_arcade_afkloop"
)

-- purchase autoshop
helper.presets_autoshop:action("Buy Auto Shop", {}, "Automatically purchases a random auto shop", function()
    if helper:GET_TRANSITION_STATE() ~= 66 then
        return helper:NOTIFY("You have not loaded yet, aborting purchase")
    end
    
    local autoshops = helper.afk.autoshop_opts.first
    local autoshop = autoshops[math.random(#autoshops)]
    local owned = helper:GET_OWNED_PROPERTY_NAME("autoshop")
    local value = helper:CONVERT_VALUE(options[helper.presets_autoshop_money.value])
    local hash = helper:MATRIX_LOOKUP("autoshop", 0)

    while owned == autoshop do
        autoshop = autoshops[math.random(#autoshops)]
        util.yield()
    end

    if hash == nil then
        helper:NOTIFY("Hash lookup failed")
        return
    end

    local price = helper:GET_PROPERTY_PRICE("autoshop", autoshop)
    value = (value + price) * 2

    switch autoshop do
        case "Mission Row":
            value = value - (160000 * 2)
            break
        case "Burton":
            value = value + (80000 * 2)
            break
    end

    if not helper:CAN_MAKE_PURCHASE(price) then
        helper:NOTIFY("You need $" .. price .. " to purchase this auto shop")
        return
    end

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set auto shop value")
        return
    end

    helper.afk:OPEN_INTERNET("autoshop")

    if helper:IS_SCREEN_OPEN() then
        helper.afk:PURCHASE_PROPERTY("autoshop", autoshop)
    end
end)

-- add set value to autoshop preset
helper:add(
    helper.presets_autoshop:action("Set Value", {}, "Sets the value of the auto shop", function()
        local value = helper:CONVERT_VALUE(options[helper.presets_autoshop_money.value])
        local hash = helper:MATRIX_LOOKUP("autoshop", 0)

        if hash == nil then
            helper:NOTIFY("Hash lookup failed")
            return
        end

        if not helper:STAT_SET_INT(hash, value, true) then
            helper:NOTIFY("Failed to set auto shop value")
            return
        end

        helper:NOTIFY("Set auto shop value to $" .. value)
    end),
    "presets_autoshop_setvalue"
)

-- afk loop divider
helper.presets_autoshop:divider("AFK Money Loop", "afk")

-- add first autoshop selection to autoshop preset
helper:add(helper.presets_autoshop:list_select("First Auto Shop", {}, "The first auto shop to purchase", helper.afk.autoshop_opts.first, 1, function() end), "presets_autoshop_first")

-- add second autoshop selection to autoshop preset
helper:add(helper.presets_autoshop:list_select("Second Auto Shop", {}, "The second auto shop to purchase", helper.afk.autoshop_opts.second, 1, function() end), "presets_autoshop_second")

-- add afk loop button
helper:add(
    helper.presets_autoshop:toggle_loop("AFK Loop", {}, "AFK money loop", function()
        local hash = helper:MATRIX_LOOKUP("autoshop", 0)

        local ref = menu.ref_by_rel_path(helper.presets_autoshop, "AFK Loop")
        local autoshop_first = helper.afk.autoshop_opts.first[helper.presets_autoshop_first.value]
        local autoshop_second = helper.afk.autoshop_opts.second[helper.presets_autoshop_second.value]
        local owned = helper:GET_OWNED_PROPERTY_NAME("autoshop")

        if ref.value == false then return false end

        if hash == nil then
            helper:NOTIFY("Hash lookup failed")
            return false
        end

        if ref.value then
            if autoshop_first == owned then
                helper:NOTIFY("You already own " .. autoshop_first .. ", please choose another auto shop")
                ref.value = false
                return false
            end

            if autoshop_first == autoshop_second then
                helper:NOTIFY("First and second auto shop cannot be the same, please choose another auto shop")
                ref.value = false
                return false
            end

            helper:STAT_SET_INT(hash, helper.MAX_INT, true)
            helper.afk:OPEN_INTERNET("autoshop")
            helper.afk:PURCHASE_PROPERTY("autoshop", autoshop_first)
            util.yield(1000)
            helper:STAT_SET_INT(hash, helper.MAX_INT, true)
            helper.afk:OPEN_INTERNET("autoshop")
            helper.afk:PURCHASE_PROPERTY("autoshop", autoshop_second)
            util.yield(1000)
        else
            return false
        end
    end),
    "presets_autoshop_afkloop"
)

-- purchase hangar
helper.presets_hangar:action("Buy Hangar", {}, "Automatically purchases a random hangar", function()
    -- TODO: implement hangar purchase
    helper:NOT_IMPLEMENTED()
end)

-- add set value to hangar preset
helper:add(
    helper.presets_hangar:action("Set Value", {}, "Sets the value of the hangar", function()
        -- TODO: implement hangar set value
        helper:NOT_IMPLEMENTED()
    end),
    "presets_hangar_setvalue"
)

-- afk loop divider
helper.presets_hangar:divider("AFK Money Loop", "afk")

-- add first hangar selection to hangar preset
helper:add(helper.presets_hangar:list_select("First Hangar", {}, "The first hangar to purchase", helper.afk.hangar_opts.first, 1, function() end), "presets_hangar_first")

-- add second hangar selection to hangar preset
helper:add(helper.presets_hangar:list_select("Second Hangar", {}, "The second hangar to purchase", helper.afk.hangar_opts.second, 1, function() end), "presets_hangar_second")

-- add afk loop button
helper:add(
    helper.presets_hangar:toggle_loop("AFK Loop", {}, "AFK money loop", function()
        helper:NOT_IMPLEMENTED()
        local ref = menu.ref_by_rel_path(helper.presets_hangar, "AFK Loop")
        ref.value = false
    end),
    "presets_hangar_afkloop"
)

-- purchase agency
helper.presets_agency:action("Buy Agency", {}, "Automatically purchases a random agency", function()
    helper:NOT_IMPLEMENTED()
end)

-- add set value to agency preset
helper:add(
    helper.presets_agency:action("Set Value", {}, "Sets the value of the agency", function()
        helper:NOT_IMPLEMENTED()
    end),
    "presets_agency_setvalue"
)

-- afk loop divider
helper.presets_agency:divider("AFK Money Loop", "afk")

-- add first agency selection to agency preset
helper:add(helper.presets_agency:list_select("First Agency", {}, "The first agency to purchase", helper.afk.agency_opts.first, 1, function() end), "presets_agency_first")

-- add second agency selection to agency preset
helper:add(helper.presets_agency:list_select("Second Agency", {}, "The second agency to purchase", helper.afk.agency_opts.second, 1, function() end), "presets_agency_second")

-- add afk loop button
helper:add(
    helper.presets_agency:toggle_loop("AFK Loop", {}, "AFK money loop", function()
        helper:NOT_IMPLEMENTED()
        local ref = menu.ref_by_rel_path(helper.presets_agency, "AFK Loop")
        ref.value = false
    end),
    "presets_agency_afkloop"
)

-- finish adding rest of presets once locations are added

-- add mazebank foreclosure divider
helper.custom:divider("Mazebank Foreclosure Properties", "mazebank")

-- add mazebank foreclosure properties
helper:add(helper.custom:list("Nightclub", {}, "Nightclub recovery options"), "custom_nightclub")
helper:add(helper.custom:list("Arcade", {}, "Arcade recovery options"), "custom_arcade")
helper:add(helper.custom:list("Autoshop", {}, "Auto Shop recovery options"), "custom_autoshop")
helper:add(helper.custom:list("Hangar", {}, "Hangar recovery options"), "custom_hangar")

-- add dynasty8 divider
helper.custom:divider("Dynasty8Executive Properties", "dynasty8")

-- add dynasty8 properties
helper:add(helper.custom:list("Agency", {}, "Agency recovery options"), "custom_agency")

-- add money option for nightclub
helper.custom_nightclub:divider("Money", "money")
helper:add(helper.custom_nightclub:text_input("Money", {"rsnightclubvalue"}, "The nightclub value", function(value)
    local owned = helper.afk:IS_PROPERTY_OWNED("nightclub")
    local hash = helper:MATRIX_LOOKUP("nightclub", 0)

    if not owned then
        helper:NOTIFY("You do not own a nightclub")
        return
    end

    value = tonumber(value)

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set nightclub value")
        return
    end
end), "custom_nightclub_money")

-- add money option for arcade
helper.custom_arcade:divider("Money", "money")
helper:add(helper.custom_arcade:text_input("Money", {"rsarcadevalue"}, "The arcade value", function(value)
    local owned = helper.afk:IS_PROPERTY_OWNED("arcade")
    local hash = helper:MATRIX_LOOKUP("arcade", 0)

    if not owned then
        helper:NOTIFY("You do not own an arcade")
        return
    end

    value = tonumber(value)

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set arcade value")
        return
    end
end), "custom_arcade_money")

-- add money option for autoshop
helper.custom_autoshop:divider("Money", "money")
helper:add(helper.custom_autoshop:text_input("Money", {"rsautoshopvalue"}, "The auto shop value", function(value)
    local owned = helper.afk:IS_PROPERTY_OWNED("autoshop")
    local hash = helper:MATRIX_LOOKUP("autoshop", 0)

    if not owned then
        helper:NOTIFY("You do not own an auto shop")
        return
    end

    value = tonumber(value)

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set auto shop value")
        return
    end
end), "custom_autoshop_money")

-- add money option for hangar
helper.custom_hangar:divider("Money", "money")
helper:add(helper.custom_hangar:text_input("Money", {"rshangarvalue"}, "The hangar value", function(value)
    local owned = helper.afk:IS_PROPERTY_OWNED("hangar")
    local hash = helper:MATRIX_LOOKUP("hangar", 0)

    if not owned then
        helper:NOTIFY("You do not own a hangar")
        return
    end

    value = tonumber(value)

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set hangar value")
        return
    end
end), "custom_hangar_money")

-- add money option for agency
helper.custom_agency:divider("Money", "money")
helper:add(helper.custom_agency:text_input("Money", {"rsagencyvalue"}, "The agency value", function(value)
    local owned = helper.afk:IS_PROPERTY_OWNED("agency")
    local hash = helper:MATRIX_LOOKUP("agency", 0)

    if not owned then
        helper:NOTIFY("You do not own an agency")
        return
    end

    value = tonumber(value)

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set agency value")
        return
    end
end), "custom_agency_money")

-- purchase nightclub button
helper.custom_nightclub:action("Buy Nightclub", {}, "Automatically purchases a random nightclub", function()
    local nightclubs = helper.afk.nightclub_opts.first
    local nightclub = nightclubs[math.random(#nightclubs)]
    local owned = helper:GET_OWNED_PROPERTY_NAME("nightclub")
    local value = helper.custom_nightclub_money.value
    local hash = helper:MATRIX_LOOKUP("nightclub", 0)

    while owned == nightclub do
        nightclub = nightclubs[math.random(#nightclubs)]
        util.yield()
    end

    if hash == nil then
        helper:NOTIFY("Hash lookup failed")
        return
    end

    local price = helper:GET_PROPERTY_PRICE("nightclub", nightclub)

    value = (value + price) * 2
    if nightclub == "La Mesa" then value = value - 400000 end

    if not helper:CAN_MAKE_PURCHASE(price) then
        helper:NOTIFY("You need $" .. price .. " to purchase this nightclub")
        return
    end

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set nightclub value")
        return
    end

    helper:STAND_OPEN_ERROR()
    helper.afk:OPEN_INTERNET("nightclub")
    helper.afk:PURCHASE_PROPERTY("nightclub", nightclub)
end)

-- purchase arcade button
helper.custom_arcade:action("Buy Arcade", {}, "Automatically purchases a random arcade", function()
    local arcades = helper.afk.arcade_opts.first
    local arcade = arcades[math.random(#arcades)]
    local owned = helper:GET_OWNED_PROPERTY_NAME("arcade")
    local value = helper.custom_arcade_money.value
    local hash = helper:MATRIX_LOOKUP("arcade", 0)

    while owned == arcade do
        arcade = arcades[math.random(#arcades)]
        util.yield()
    end

    if hash == nil then
        helper:NOTIFY("Hash lookup failed")
        return
    end

    local price = helper:GET_PROPERTY_PRICE("arcade", arcade)

    value = (value + price) * 2
    if arcade == "La Mesa" then value = value - 400000 end

    if not helper:CAN_MAKE_PURCHASE(price) then
        helper:NOTIFY("You need $" .. price .. " to purchase this arcade")
        return
    end

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set arcade value")
        return
    end

    helper:STAND_OPEN_ERROR()
    helper.afk:OPEN_INTERNET("arcade")
    helper.afk:PURCHASE_PROPERTY("arcade", arcade)
end)

-- purchase autoshop button
helper.custom_autoshop:action("Buy Auto Shop`", {}, "Automatically purchases a random auto shop", function()
    local autoshops = helper.afk.autoshop_opts.first
    local autoshop = autoshops[math.random(#autoshops)]
    local owned = helper:GET_OWNED_PROPERTY_NAME("autoshop")
    local value = helper.custom_autoshop_money.value
    local hash = helper:MATRIX_LOOKUP("autoshop", 0)

    while owned == autoshop do
        autoshop = autoshops[math.random(#autoshops)]
        util.yield()
    end

    if hash == nil then
        helper:NOTIFY("Hash lookup failed")
        return
    end

    local price = helper:GET_PROPERTY_PRICE("autoshop", autoshop)

    value = (value + price) * 2
    if autoshop == "La Mesa" then value = value - 400000 end

    if not helper:CAN_MAKE_PURCHASE(price) then
        helper:NOTIFY("You need $" .. price .. " to purchase this auto shop")
        return
    end

    if not helper:STAT_SET_INT(hash, value, true) then
        helper:NOTIFY("Failed to set auto shop value")
        return
    end

    helper:STAND_OPEN_ERROR()
    helper.afk:OPEN_INTERNET("autoshop")
    helper.afk:PURCHASE_PROPERTY("autoshop", autoshop)
end)

-- purchase hangar button
helper.custom_hangar:action("Buy Hangar", {}, "Automatically purchases a random hangar", function()
    -- TODO: implement hangar purchase
    helper:NOT_IMPLEMENTED()
end)

-- purchase agency button
helper.custom_agency:action("Buy Agency", {}, "Automatically purchases a random agency", function()
    -- TODO: implement agency purchase
    helper:NOT_IMPLEMENTED()
end)

-- add help divider to dax missions
helper.dax:divider("Help", "help")

-- add help button
helper.dax:action("How To Use", {}, "Shows a help message", function()
    helper:NOTIFY("Check 'enable cash boost' option and start one of the new dax missions (if you haven't completed the first mission the 'Start Mission' will automatically start the first mission for you, the R on the map at sandy shores), once the mission has started you need to kill yourself immediately to fail the mission and you will recieve $1,000,000, take too long to kill yourself during the mission and you won\'t get any money", util.show_corner_help)
end)

-- add compatible missions divider
helper.dax:divider("Compatible Missions", "missions")

-- add readonly items to compatible missions
helper.dax:readonly("First Dose - Welcome to the Troupe")
helper.dax:readonly("First Dose - Designated Driver")
helper.dax:readonly("First Dose - Fatal Incursion")
helper.dax:readonly("First Dose - Uncontrolled Substance")
helper.dax:readonly("First Dose - Make War not Love")
helper.dax:readonly("First Dose - Off the Rails")

-- add options divider
helper.dax:divider("Options", "options")

-- add make 1M button
helper.dax:action("Make $1M - First Dose 1", {}, "Automatically completes requirements to make $1M from First Dose 1 mission", function()
    while helper:GET_TRANSITION_STATE() != 66 do
        util.yield()
    end

    local cash = helper:TUNABLE(262145, 0)
    local ped = players.user_ped()
    ENTITY.SET_ENTITY_COORDS(ped, 1394.4620361328, 3598.4528808594, 34.990489959717)
    util.yield(200)
    SIMULATE_CONTROL_KEY(51, 1)
    util.yield(1500)
    SIMULATE_CONTROL_KEY(188, 1, 2)
    SIMULATE_CONTROL_KEY(201, 1)
    SIMULATE_CONTROL_KEY(188, 1, 2)
    SIMULATE_CONTROL_KEY(201, 1)
    SIMULATE_CONTROL_KEY(201, 1, 2)
    util.yield(6000)
    memory.write_float(cash, 5000.0)
    menu.trigger_commands("suicide")
    util.yield(3000)
    menu.trigger_commands("suicide")
    util.yield(3000)
    menu.trigger_commands("suicide")
    util.yield(4500)
    SIMULATE_CONTROL_KEY(201, 10)
end)

-- add cash boost buttotn
helper:add(
    helper.dax:toggle_loop("Enable Cash Boost", {}, "Modifies cash multiplier", function()
        local cash = helper:TUNABLE(262145, 0)
        memory.write_float(cash, 5000.0)
    end,
    function()
        local cash = helper:TUNABLE(262145, 0)
        memory.write_float(cash, 1.0)
    end),
    "dax_cash_boost"
)

-- add rp boost
helper:add(
    helper.dax:toggle_loop("Enable RP Boost", {}, "Modifies rp multiplier", function()
        local rp = helper:TUNABLE(262145, 1)
        memory.write_float(rp, 2000.0)
    end,
    function()
        local rp = helper:TUNABLE(262145, 1)
        memory.write_float(rp, 1.0)
    end),
    "dax_rp_boost"
)

-- add enable toggle for casino figures
helper:add(
    helper.casino:toggle_loop("Enable", {}, "Drops figures that give you $200,000", function()
        local cash = helper:TUNABLE(262145, 27123)
        memory.write_int(cash, 200000)
        menu.trigger_commands("rp" .. players.get_name(players.user()) .. " on")
        if helper:TRANSACTION_ERROR_DISPLAYED() then
            menu.trigger_commands("rp" .. players.get_name(players.user()) .. " off")
            helper:NOTIFY("Transaction error detected!")
            menu.ref_by_rel_path(helper.casino, "Enable").value = false
        end
    end,
    function()
        local cash = helper:TUNABLE(262145, 27123)
        memory.write_int(cash, 1000)
        menu.trigger_commands("rp" .. players.get_name(players.user()) .. " off")
    end),
    "casino_figures_toggle"
)

-- add disable rp toggle for casino figures
helper.casino:toggle("Disable RP", {}, "Prevents you from gaining RP", function(state)
    local rp = helper:TUNABLE(262145, 1)

    if state then
        memory.write_float(rp, 0.0)
    else
        memory.write_float(rp, 1.0)
    end
end)

-- add globals divider
helper.heists:divider("Globals", "globals")

-- disable payouts for heists
helper.heists:toggle("Disable Payout", {}, "Prevents you from gaining money from heists (this also affects missions)", function(state)
    local cash = helper:TUNABLE(262145, 0)

    util.create_tick_handler(function()
        local state = menu.ref_by_rel_path(helper.heists, "Disable Payout").value
        if state then
            memory.write_float(cash, 0.0)
        else
            memory.write_float(cash, 1.0)
            return false
        end
    end)
end)

-- teleport to nightclub
helper.nightclub:action("Teleport to Nightclub", {}, "Teleports you to the nightclub", function()
    local ped = players.user_ped()
    local ncblip = HUD.GET_FIRST_BLIP_INFO_ID(614)

    if HUD.DOES_BLIP_EXIST(ncblip) then
        local coords = HUD.GET_BLIP_INFO_ID_COORD(ncblip)
        ENTITY.SET_ENTITY_COORDS(ped, coords.x, coords.y, coords.z)
    end
end)

-- trigger production
helper.nightclub:action("Trigger Production", {}, "Triggers production so your nightclub safe is nice and full", function()
    local safe = helper:TUNABLE(262145, 24045)
    local income = helper:TUNABLE(262145, 24041)
    memory.write_int(safe, 300000)
    memory.write_int(income, 300000)

    helper:STAT_SET_INT("CLUB_PAY_TIME_LEFT", 1, true)
    helper:STAT_SET_INT("CLUB_POPULARITY", 10000, true)
end)

-- fill safe
helper.nightclub:toggle_loop("Fill Safe", {}, "Fills your safe with $300,000", function()
    local safe = helper:TUNABLE(262145, 24045)
    local income = helper:TUNABLE(262145, 24041)
    memory.write_int(safe, 300000)
    memory.write_int(income, 300000)

    helper:STAT_SET_INT("CLUB_PAY_TIME_LEFT", 1, true)
    helper:STAT_SET_INT("CLUB_POPULARITY", 10000, true)
end)

-- afk money
helper.nightclub:toggle("AFK Loop", {}, "Easy AFK money", function()
    local fill = menu.ref_by_rel_path(helper.nightclub, "Fill Safe")
    local afk = menu.ref_by_rel_path(helper.nightclub, "AFK Loop")

    fill.value = true
    
    util.create_tick_handler(function()
        if afk.value then
            if not helper:TRANSACTION_ERROR_DISPLAYED() then
                if not helper.script_states.nightclub.safe_open then
                    ENTITY.SET_ENTITY_COORDS(players.user_ped(), -1615.5490722656, -3015.6804199219, -75.205093383789)
                    SIMULATE_CONTROL_KEY(51, 1)
                    helper.script_states.nightclub.safe_open = true
                    util.yield(8000)
                    ENTITY.SET_ENTITY_COORDS(players.user_ped(), -1615.6691894531, -3015.728515625, -75.205001831055)
                else
                    if not helper.script_states.nightclub.infront_of_safe then
                        ENTITY.SET_ENTITY_COORDS(players.user_ped(), -1615.6691894531, -3015.728515625, -75.205001831055)
                        helper.script_states.nightclub.infront_of_safe = true
                        util.yield(3000)
                    else
                        ENTITY.SET_ENTITY_COORDS(players.user_ped(), -1618.3752441406, -3011.5810546875, -75.205078125)
                        util.yield(1000)
                        ENTITY.SET_ENTITY_COORDS(players.user_ped(), -1615.6691894531, -3015.728515625, -75.205001831055)
                    end
                end
            end
        else
            util.yield(1000)
            SIMULATE_CONTROL_KEY(51, 1)
            fill.value = false
            helper.script_states.nightclub.safe_open = false
            helper.script_states.nightclub.infront_of_safe = false
            return false
        end

        util.yield(1)
    end)
end)

-- add teleport to arcade
helper.arcade:action("Teleport to Arcade", {}, "Teleports you to the arcade", function()
    local ped = players.user_ped()
    local arcadeblip = HUD.GET_FIRST_BLIP_INFO_ID(740)

    if HUD.DOES_BLIP_EXIST(arcadeblip) then
        local coords = HUD.GET_BLIP_INFO_ID_COORD(arcadeblip)
        ENTITY.SET_ENTITY_COORDS(ped, coords.x, coords.y, coords.z)
    end
end)

-- trigger production
helper.arcade:action("Trigger Production", {}, "Triggers production so your nightclub safe is nice and full", function()
    helper:STAT_SET_INT("ARCADE_PAY_TIME_LEFT", 1, true)
end)

helper.arcade:toggle_loop("Fill Safe", {}, "Fills your safe with $200,000", function()
    helper:STAT_SET_INT("ARCADE_PAY_TIME_LEFT", 1, true)
    local safe = memory.script_global(262145 + 29250)
    local income = memory.script_global(262145 + 29251)
    local income2 = memory.script_global(262145 + 29252)
    memory.write_int(safe, 200000)
    memory.write_int(income, 200000)
    memory.write_int(income2, 200000)
end)

helper.arcade:toggle("AFK Loop", {}, "Easy AFK Money", function()
    local fill = menu.ref_by_rel_path(helper.arcade, "Fill Safe")
    local afk = menu.ref_by_rel_path(helper.arcade, "AFK Loop")

    fill.value = true

    util.create_tick_handler(function()
        if afk.value then
            if not helper:TRANSACTION_ERROR_DISPLAYED() then
                if not helper.script_states.arcade.safe_open then
                    ENTITY.SET_ENTITY_COORDS(players.user_ped(), 2728.4833984375, -374.21838378906, -47.392971038818)
                    SIMULATE_CONTROL_KEY(51, 2)
                    helper.script_states.arcade.safe_open = true
                    util.yield(6000)
                    ENTITY.SET_ENTITY_COORDS(players.user_ped(), 2728.5122070312, -374.37905883789, -47.392944335938)
                else
                    if not helper.script_states.arcade.infront_of_safe then
                        ENTITY.SET_ENTITY_COORDS(players.user_ped(), 2728.5122070312, -374.37905883789, -47.392944335938)
                        helper.script_states.arcade.infront_of_safe = true
                    else
                        ENTITY.SET_ENTITY_COORDS(players.user_ped(), 2726.9116210938, -374.23046875, -47.38952255249)
                        util.yield(1000)
                        ENTITY.SET_ENTITY_COORDS(players.user_ped(), 2728.5122070312, -374.37905883789, -47.392944335938)
                        util.yield(1000)
                    end
                end
            end
        else
            util.yield(1000)
            SIMULATE_CONTROL_KEY(51, 1)
            fill.value = false
            helper.script_states.arcade.safe_open = false
            helper.script_states.arcade.infront_of_safe = false
            return false
        end

        util.yield(1)
    end)
end)