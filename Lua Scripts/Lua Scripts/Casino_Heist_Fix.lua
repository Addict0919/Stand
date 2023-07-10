local function STAT_SET_INT(--[[Hash (int)]] statName,--[[int]] value,--[[BOOL (bool)]] save)native_invoker.begin_call();native_invoker.push_arg_int(statName);native_invoker.push_arg_int(value);native_invoker.push_arg_bool(save);native_invoker.end_call("B3271D7AB655B441");return native_invoker.get_return_value_bool();end

STAT_SET_INT(util.joaat("MP0_H3OPT_POI"), 0, true)
STAT_SET_INT(util.joaat("MP0_H3OPT_ACCESSPOINTS"), 0, true)
