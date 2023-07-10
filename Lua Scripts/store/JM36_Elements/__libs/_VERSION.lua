do
	local config = configFileRead'Version.txt'
	if config.Version ~= 5.0 then
		config.Version = 5.0
		configFileWrite('Version.txt', config)
	end
	config = nil
	util.create_thread(function()
		util.yield(5)
		unrequire'_VERSION'
	end)
end