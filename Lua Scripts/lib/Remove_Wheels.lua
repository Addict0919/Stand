local veh = util.get_vehicle()
if veh ~= 0 then
	native_invoker.begin_call()
	native_invoker.push_arg_int(veh)
	native_invoker.push_arg_float(3.402823466e+38)
	native_invoker.end_call("93A3996368C94158") -- VEHICLE.MODIFY_VEHICLE_TOP_SPEED
end
