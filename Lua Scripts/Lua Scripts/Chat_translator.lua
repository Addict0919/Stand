util.keep_running()



local Languages = {
	{ Name = "Afrikaans", Key = "af" },
	{ Name = "Albanian", Key = "sq" },
	{ Name = "Arabic", Key = "ar" },
	{ Name = "Azerbaijani", Key = "az" },
	{ Name = "Basque", Key = "eu" },
	{ Name = "Belarusian", Key = "be" },
	{ Name = "Bengali", Key = "bn" },
	{ Name = "Bulgarian", Key = "bg" },
	{ Name = "Catalan", Key = "ca" },
	{ Name = "Chinese Simplified", Key = "zh-CN" },
	{ Name = "Chinese Traditional", Key = "zh-TW" },
	{ Name = "Croatian", Key = "hr" },
	{ Name = "Czech", Key = "cs" },
	{ Name = "Danish", Key = "da" },
	{ Name = "Dutch", Key = "nl" },
	{ Name = "English", Key = "en" },
	{ Name = "Esperanto", Key = "eo" },
	{ Name = "Estonian", Key = "et" },
	{ Name = "Filipino", Key = "tl" },
	{ Name = "Finnish", Key = "fi" },
	{ Name = "French", Key = "fr" },
	{ Name = "Galician", Key = "gl" },
	{ Name = "Georgian", Key = "ka" },
	{ Name = "German", Key = "de" },
	{ Name = "Greek", Key = "el" },
	{ Name = "Gujarati", Key = "gu" },
	{ Name = "Haitian Creole", Key = "ht" },
	{ Name = "Hebrew", Key = "iw" },
	{ Name = "Hindi", Key = "hi" },
	{ Name = "Hungarian", Key = "hu" },
	{ Name = "Icelandic", Key = "is" },
	{ Name = "Indonesian", Key = "id" },
	{ Name = "Irish", Key = "ga" },
	{ Name = "Italian", Key = "it" },
	{ Name = "Japanese", Key = "ja" },
	{ Name = "Kannada", Key = "kn" },
	{ Name = "Korean", Key = "ko" },
	{ Name = "Latin", Key = "la" },
	{ Name = "Latvian", Key = "lv" },
	{ Name = "Lithuanian", Key = "lt" },
	{ Name = "Macedonian", Key = "mk" },
	{ Name = "Malay", Key = "ms" },
	{ Name = "Maltese", Key = "mt" },
	{ Name = "Norwegian", Key = "no" },
	{ Name = "Persian", Key = "fa" },
	{ Name = "Polish", Key = "pl" },
	{ Name = "Portuguese", Key = "pt" },
	{ Name = "Romanian", Key = "ro" },
	{ Name = "Russian", Key = "ru" },
	{ Name = "Serbian", Key = "sr" },
	{ Name = "Slovak", Key = "sk" },
	{ Name = "Slovenian", Key = "sl" },
	{ Name = "Spanish", Key = "es" },
	{ Name = "Swahili", Key = "sw" },
	{ Name = "Swedish", Key = "sv" },
	{ Name = "Tamil", Key = "ta" },
	{ Name = "Telugu", Key = "te" },
	{ Name = "Thai", Key = "th" },
	{ Name = "Turkish", Key = "tr" },
	{ Name = "Ukrainian", Key = "uk" },
	{ Name = "Urdu", Key = "ur" },
	{ Name = "Vietnamese", Key = "vi" },
	{ Name = "Welsh", Key = "cy" },
	{ Name = "Yiddish", Key = "yi" },
}

local LangKeys = {}
local LangName = {}
local LangIndexes = {}
local LangLookupByName = {}
local LangLookupByKey = {}
local PlayerSpooflist = {}
local PlayerSpoof = {}

for i=1,#Languages do
	local Language = Languages[i]
	LangKeys[i] = Language.Name
	LangName[i] = Language.Name
	LangIndexes[Language.Key] = i
	LangLookupByName[Language.Name] = Language.Key
	LangLookupByKey[Language.Key] = Language.Name
end

table.sort(LangKeys)

function encode(text)
	return string.gsub(text, "%s", "+")
end

targetlangmenu = menu.slider_text(menu.my_root(), "Target Language", {}, "You need to click to aply change", LangName, function(s)
	targetlang = LangLookupByName[LangKeys[s]]
end)


tradlocamenu = menu.slider_text(menu.my_root(), "Location of Traducted Message", {}, "You need to click to aply change", {"Team Chat not networked", "Team Chat networked", "Global Chat not networked", "Global Chat networked", "Notification"}, function(s)
	Tradloca = s
end)

traductself = true
menu.toggle(menu.my_root(), "Traduct Yourself", {}, "", function(on)
	traductself = on	
end, true)
traductsamelang = false
menu.toggle(menu.my_root(), "Traduct even if the language is the same as the desired one", {}, "might not work correctly because google is dumb", function(on)
	traductsamelang = on	
end)

traductmymessage = menu.list(menu.my_root(), "Send Traducted message")
finallangmenu = menu.slider_text(traductmymessage, "Final Language", {"finallang"}, "Final Languge of your message.																	  You need to click to aply change", LangName, function(s)
   targetlangmessagesend = LangLookupByName[LangKeys[s]]
end)

spoofsend = menu.slider_text(traductmymessage, "Spoofed as", {"Spoofas"}, "Default is yourself.											  You need to click to aply change", PlayerSpooflist, function(s)
	spoofingas = PlayerSpoof[s]
end)
menu.action(traductmymessage, "Send Message", {"Sendmessage"}, "Input the text For your message", function(on_click)
    util.toast("Please input your message")
    menu.show_command_box("Sendmessage ")
end, function(on_command)
    mytext = on_command
    async_http.init("translate.googleapis.com", "/translate_a/single?client=gtx&sl=auto&tl="..targetlangmessagesend.."&dt=t&q="..encode(mytext), function(Sucess)
		if Sucess ~= "" then
			translation, original, sourceLang = Sucess:match("^%[%[%[\"(.-)\",\"(.-)\",.-,.-,.-]],.-,\"(.-)\"")
			for _, pId in ipairs(players.list()) do
				chat.send_targeted_message(pId, spoofingas,string.gsub(translation, "%+", " "), false)
			end
		end
	end)
    async_http.dispatch()
end)
botsend = false
ran = 0
chat.on_message(function(packet_sender, message_sender, text, team_chat)
	if not botsend then
		if not traductself and (packet_sender == players.user()) then
		else
		async_http.init("translate.googleapis.com", "/translate_a/single?client=gtx&sl=auto&tl="..targetlang.."&dt=t&q="..encode(text), function(Sucess)
			if Sucess ~= "" then
				translation, original, sourceLang = Sucess:match("^%[%[%[\"(.-)\",\"(.-)\",.-,.-,.-]],.-,\"(.-)\"")
				if not traductsamelang and (sourceLang == targetlang)then
				else
					if (Tradloca == 1) then	
						chat.send_message(players.get_name(packet_sender).." : "..string.gsub(translation, "%+", " "), true, true, false)
					end if (Tradloca == 2) then
						botsend = true
						chat.send_message(players.get_name(packet_sender).." : "..string.gsub(translation, "%+", " "), true, true, true)
					end if (Tradloca == 3) then
						chat.send_message(players.get_name(packet_sender).." : "..string.gsub(translation, "%+", " "), false, true, false)
					end if (Tradloca == 4) then
						botsend = true
						chat.send_message(players.get_name(packet_sender).." : "..string.gsub(translation, "%+", " "), false, true, true)
					end if (Tradloca == 5) then
						util.toast(players.get_name(packet_sender).." : "..string.gsub(translation, "%+", " "), TOAST_ALL)
					end
				end
			end
		end)
		async_http.dispatch()
		end
	end
	botsend = false
end)

players.on_join(function(pid)
	PlayerSpooflist[pid] = players.get_name(pid)
	PlayerSpoof[pid] = pid
	menu.set_action_slider_options(spoofsend, PlayerSpooflist)
	if (pid == players.user()) then
		spoofingas = pid
		menu.set_value(spoofsend, pid)
	end
end)
players.dispatch_on_join()

players.on_leave(function(pid)
	PlayerSpooflist[pid] = nil
	PlayerSpoof[pid] = nil
	menu.set_action_slider_options(spoofsend, PlayerSpooflist)
end)

run = 0
while run<10 do 
	Tradloca = menu.get_value(tradlocamenu)
	targetlangmessagesend = LangLookupByName[LangKeys[menu.get_value(finallangmenu)]]
	targetlang = LangLookupByName[LangKeys[menu.get_value(targetlangmenu)]]
	util.yield()
	run = run+1
end


