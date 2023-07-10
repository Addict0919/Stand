require("natives-1614644776")
util.toast("Thanks for using Lance\'s Infinibounty! Good luck with the hussle.")

enabled = false
menu.toggle(menu.my_root(), "Enabled", {"infinibounty"}, "Places a bounty on the entire session again and again. For the poor.", function(on)
    if on then
        enabled = true
    else
        enabled = false
    end
end, false)

while true do
    if enabled then
        menu.trigger_commands("bountyall 10000")
    end
    util.yield(60000)
end