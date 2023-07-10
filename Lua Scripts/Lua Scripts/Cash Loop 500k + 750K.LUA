function STEALTH_LOOP_COMBINED()
    memory.script_global(1968313, 1) -- ??
 util.log("$ 500K Added")
  util.yield(1)
  memory.script_global(1968313, 2) -- ??
    util.log("$ 750K Added")
    util.yield(1)
 end
 function timer(timer)
     i = timer * 1400
     x = 0
     while(x < i)
     do
         wait()
         x = x + 1
     end
 end

menu.divider(cashloops, "Start $$$ Loop")

cashloop = menu.list(cashloops, "500k + 750k Loop", {}, "$$$ Loop", function(); end)

cashMultiplier = menu.toggle_loop(cashloop, 'Start $$$ Loop', {""}, '$$$ Loop', function()
	if menu.get_value(cashMultiplier) then
		memory.write_float(memory.script_global(262145 + 1), 0)
	else
		memory.write_float(memory.script_global(262145 + 1), 1)
	end
end)