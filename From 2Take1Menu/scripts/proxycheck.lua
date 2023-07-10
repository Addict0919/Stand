menu.create_thread(function()
    function dec_to_ipv4(ip)
        return string.format("%i.%i.%i.%i", ip >> 24 & 255, ip >> 16 & 255, ip >> 8 & 255, ip & 255)
    end
    menu.add_player_feature(
            "VPN/Proxy Check",
            "action",
            0,
            function(f, pid)
                pIp = dec_to_ipv4(player.get_player_ip(pid))
                statusCode, response = web.get("https://proxycheck.io/v2/"..pIp.."?vpn=1")
                if response ~= nil then
                    if response:find('"proxy": "no"') then
                        menu.notify"Player is not using VPN/Proxy"
                    elseif response:find('"proxy": "yes"') then
                        menu.notify('Player is using a VPN/Proxy\nVPN: '..response:match("\"name\":%s+\"([^\"]+)\","))
                    end
                end
            end
    )
end,nil)
--[[
credits:
dec to ip stolen from kek's menu,
string manipulation by GhostOne#0991 & RulyPancake the 5th#1345
]]

