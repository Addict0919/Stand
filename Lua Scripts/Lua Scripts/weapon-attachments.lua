require("natives-1627063482")
local last_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
local attachments_table = {
    ---------------------PISTOLS--------------------------------------
    ["0xFED0FD71"] = "Default Clip", --Default Clip
    ["0xED265A1C"] = "Extended Clip", --Extended Clip
    ["0x359B7AAE"] = "Flashlight", --Flashlight
    ["0x65EA7EBB"] = "Suppressor", --Suppressor
    ["0xD7391086"] = "Yusuf Amir Luxury Finish", --Yusuf Amir Luxury Finish
    ["0x721B079"] = "Default Clip", --Default Clip
    ["0xD67B4F2D"] = "Extended Clip", --Extended Clip
    ["0xC304849A"] = "Suppressor", --Suppressor
    ["0xC6654D72"] = "Yusuf Amir Luxury Finish", --Yusuf Amir Luxury Finish
    ["0x31C4B22A"] = "Default Clip", --Default Clip
    ["0x249A17D5"] = "Extended Clip", --Extended Clip
    ["0x9B76C72C"] = "Gilded Gun Metal Finish", --Gilded Gun Metal Finish
    ["0x2297BE19"] = "Default Clip", --Default Clip
    ["0xD9D3AC92"] = "Extended Clip", --Extended Clip
    ["0xA73D4664"] = "Suppressor", --Suppressor
    ["0x77B8AB2F"] = "Platinum Pearl Deluxe Finish", --Platinum Pearl Deluxe Finish
    ["0x16EE3040"] = "VIP Variant", --VIP Variant
    ["0x9493B80D"] = "Bodyguard Variant", --Bodyguard Variant
    ["0xE9867CE3"] = "Default Clip", --Default Clip
    ["0xF8802ED9"] = "Default Clip", --Default Clip
    ["0x7B0033B3"] = "Extended Clip", --Extended Clip
    ["0x8033ECAF"] = "Etched Wood Grip Finish", --Etched Wood Grip Finish
    ["0xD4A969A"] = "Default Clip", --Default Clip
    ["0x64F9C62B"] = "Extended Clip", --Extended Clip
    ["0x7A6A7B7B"] = "Etched Wood Grip Finish", --Etched Wood Grip Finish
    ["0xBA23D8BE"] = "Default Rounds", --Default Rounds
    ["0xC6D8E476"] = "Tracer Rounds", --Tracer Rounds
    ["0xEFBF25"] = "Incendiary Rounds", --Incendiary Rounds
    ["0x10F42E8F"] = "Hollow Point Rounds", --Hollow Point Rounds
    ["0xDC8BA3F"] = "Full Metal Jacket Rounds", --Full Metal Jacket Rounds
    ["0x420FD713"] = "Holographic Sight", --Holographic Sight
    ["0x49B2945"] = "Small Scope", --Small Scope
    ["0x27077CCB"] = "Compensator", --Compensator
    ["0xC03FED9F"] = "Digital Camo", --Digital Camo
    ["0xB5DE24"] = "Brushstroke Camo", --Brushstroke Camo
    ["0xA7FF1B8"] = "Woodland Camo", --Woodland Camo
    ["0xF2E24289"] = "Skull", --Skull
    ["0x11317F27"] = "Sessanta Nove", --Sessanta Nove
    ["0x17C30C42"] = "Perseus", --Perseus
    ["0x257927AE"] = "Leopard", --Leopard
    ["0x37304B1C"] = "Zebra", --Zebra
    ["0x48DAEE71"] = "Geometric", --Geometric
    ["0x20ED9B5B"] = "Boom!", --Boom!
    ["0xD951E867"] = "Patriotic", --Patriotic
    ["0x1466CE6"] = "Default Clip", --Default Clip
    ["0xCE8C0772"] = "Extended Clip", --Extended Clip
    ["0x902DA26E"] = "Tracer Rounds", --Tracer Rounds
    ["0xE6AD5F79"] = "Incendiary Rounds", --Incendiary Rounds
    ["0x8D107402"] = "Hollow Point Rounds", --Hollow Point Rounds
    ["0xC111EB26"] = "Full Metal Jacket Rounds", --Full Metal Jacket Rounds
    ["0x4A4965F3"] = "Flashlight", --Flashlight
    ["0x47DE9258"] = "Mounted Scope", --Mounted Scope
    ["0xAA8283BF"] = "Compensator", --Compensator
    ["0xF7BEEDD"] = "Digital Camo", --Digital Camo
    ["0x8A612EF6"] = "Brushstroke Camo", --Brushstroke Camo
    ["0x76FA8829"] = "Woodland Camo", --Woodland Camo
    ["0xA93C6CAC"] = "Skull", --Skull
    ["0x9C905354"] = "Sessanta Nove", --Sessanta Nove
    ["0x4DFA3621"] = "Perseus", --Perseus
    ["0x42E91FFF"] = "Leopard", --Leopard
    ["0x54A8437D"] = "Zebra", --Zebra
    ["0x68C2746"] = "Geometric", --Geometric
    ["0x2366E467"] = "Boom!", --Boom!
    ["0x441882E6"] = "Boom!", --Boom!
    ["0xE7EE68EA"] = "Digital Camo", --Digital Camo
    ["0x29366D21"] = "Brushstroke Camo", --Brushstroke Camo
    ["0x3ADE514B"] = "Woodland Camo", --Woodland Camo
    ["0xE64513E9"] = "Skull", --Skull
    ["0xCD7AEB9A"] = "Sessanta Nove", --Sessanta Nove
    ["0xFA7B27A6"] = "Perseus", --Perseus
    ["0xE285CA9A"] = "Leopard", --Leopard
    ["0x2B904B19"] = "Zebra", --Zebra
    ["0x22C24F9C"] = "Geometric", --Geometric
    ["0x8D0D5ECD"] = "Boom!", --Boom!
    ["0x1F07150A"] = "Patriotic", --Patriotic
    ["0x94F42D62"] = "Default Clip", --Default Clip
    ["0x5ED6C128"] = "Extended Clip", --Extended Clip
    ["0x25CAAEAF"] = "Tracer Rounds", --Tracer Rounds
    ["0x2BBD7A3A"] = "Incendiary Rounds", --Incendiary Rounds
    ["0x85FEA109"] = "Hollow Point Rounds", --Hollow Point Rounds
    ["0x4F37DF2A"] = "Full Metal Jacket Rounds", --Full Metal Jacket Rounds
    ["0x8ED4BB70"] = "Mounted Scope", --Mounted Scope
    ["0x43FD595B"] = "Flashlight", --Flashlight
    ["0x21E34793"] = "Compensator", --Compensator
    ["0x5C6C749C"] = "Digital Camo", --Digital Camo
    ["0x15F7A390"] = "Brushstroke Camo", --Brushstroke Camo
    ["0x968E24DB"] = "Woodland Camo", --Woodland Camo
    ["0x17BFA99"] = "Skull", --Skull
    ["0xF2685C72"] = "Sessanta Nove", --Sessanta Nove
    ["0xDD2231E6"] = "0xDD2231E6", --Perseus
    ["0xBB43EE76"] = "Leopard", --Leopard
    ["0x4D901310"] = "Zebra", --Zebra
    ["0x5F31B653"] = "Geometric", --Geometric
    ["0x697E19A0"] = "Boom!", --Boom!
    ["0x930CB951"] = "Patriotic", --Patriotic
    ["0xB4FC92B0"] = "Digital Camo", --Digital Camo
    ["0x1A1F1260"] = "Digital Camo", --Digital Camo
    ["0xE4E00B70"] = "Digital Camo",
    ["0x2C298B2B"] = "Digital Camo",
    ["0xDFB79725"] = "Digital Camo",
    ["0x6BD7228C"] = "Digital Camo",
    ["0x9DDBCF8C"] = "Digital Camo",
    ["0xB319A52C"] = "Digital Camo",
    ["0xC6836E12"] = "Digital Camo",
    ["0x43B1B173"] = "Digital Camo",
    ["0x4ABDA3FA"] = "Patriotic", --Patriotic
    ["0x45A3B6BB"] = "Default Clip", --Default Clip
    ["0x33BA12E8"] = "Extended Clip", --Extended Clip
    ["0xD7DBF707"] = "Festive tint", --Festive tint
    ["0x54D41361"] = "Default Clip", --Default Clip
    ["0x81786CA9"] = "Extended Clip", --Extended Clip
    ["0x9307D6FA"] = "Suppressor", --Suppressor
    ----------------SUBMACHINE-GUNS------------------------
    ["0xCB48AEF0"] = "Default Clip",
    ["0x10E6BA2B"] = "Extended Clip",
    ["0x359B7AAE"] = "Flashlight",
    ["0x9D2FBF29"] = "Scope",
    ["0x487AAE09"] = "Yusuf Amir Luxury Finish",
    ["0x26574997"] = "Default Clip",
    ["0x350966FB"] = "Extended Clip",
    ["0x79C77076"] = "Drum Magazine",
    ["0x7BC4CDDC"] = "Flashlight",
    ["0x3CC6BA57"] = "Scope",
    ["0x27872C90"] = "Yusuf Amir Luxury Finish",
    ["0x8D1307B0"] = "Default Clip",
    ["0xBB46E417"] = "Extended Clip",
    ["0x278C78AF"] = "Yusuf Amir Luxury Finish",
    ["0x84C8B2D3"] = "Default Clip",
    ["0x937ED0B7"] = "Extended Clip",
    ["0x4C24806E"] = "Default Clip",
    ["0xB9835B2E"] = "Extended Clip",
    ["0x7FEA36EC"] = "Tracer Rounds",
    ["0xD99222E5"] = "Incendiary Rounds",
    ["0x3A1BD6FA"] = "Hollow Point Rounds",
    ["0xB5A715F"] = "Full Metal Jacket Rounds",
    ["0x9FDB5652"] = "Holographic Sight",
    ["0xE502AB6B"] = "Small Scope",
    ["0x3DECC7DA"] = "Medium Scope",
    ["0xB99402D4"] = "Flat Muzzle Brake",
    ["0xC867A07B"] = "Tactical Muzzle Brake",
    ["0xDE11CBCF"] = "Fat-End Muzzle Brake",
    ["0xEC9068CC"] = "Precision Muzzle Brake",
    ["0x2E7957A"] = "Heavy Duty Muzzle Brake",
    ["0x347EF8AC"] = "Slanted Muzzle Brake",
    ["0x4DB62ABE"] = "Split-End Muzzle Brake",
    ["0xD9103EE1"] = "Default Barrel",
    ["0xA564D78B"] = "Heavy Barrel",
    ["0xC4979067"] = "Digital Camo",
    ["0x3815A945"] = "Brushstroke Camo",
    ["0x4B4B4FB0"] = "Woodland Camo",
    ["0xEC729200"] = "Skull",
    ["0x48F64B22"] = "Sessanta Nove",
    ["0x35992468"] = "Perseus",
    ["0x24B782A5"] = "Leopard",
    ["0xA2E67F01"] = "Zebra",
    ["0x2218FD68"] = "Geometric",
    ["0x45C5C3C5"] = "Boom!",
    ["0x399D558F"] = "Patriotic",
    ["0x476E85FF"] = "Default Clip",
    ["0xB92C6979"] = "Extended Clip",
    ["0xA9E9CAF4"] = "Drum Magazine",
    ["0x4317F19E"] = "Default Clip",
    ["0x334A5203"] = "Extended Clip",
    ["0x6EB8C8DB"] = "Drum Magazine",
    ["0xC164F53"] = "Grip",
    ["0xAA2C45B4"] = "Scope",
    ------------Shotguns-------------
    ["0xE608B35E"] = "Suppressor",
    ["0xA2D79DDB"] = "Yusuf Amir Luxury Finish",
    ["0x85A64DF9"] = "Gilded Gun Metal Finish",
    ["0x94E81BC7"] = "Default Clip",
    ["0x86BD7F72"] = "Extended Clip",
    ["0x837445AA"] = "Suppressor",
    ["0xCD940141"] = "Default Shells",
    ["0x9F8A1BF5"] = "Dragon's Breath Shells",
    ["0x4E65B425"] = "Steel Buckshot Shells",
    ["0xE9582927"] = "Flechette Shells",
    ["0x3BE4465D"] = "Explosive Slugs",
    ["0x3F3C8181"] = "Medium Scope",
    ["0xAC42DF71"] = "Suppressor",
    ["0x5F7DCE4D"] = "Squared Muzzle Brake	",
    ["0xE3BD9E44"] = "Digital Camo",
    ["0x17148F9B"] = "Brushstroke Camo",
    ["0x24D22B16"] = "Woodland Camo",
    ["0xF2BEC6F0"] = "Skull",
    ["0x85627D"] = "Sessanta Nove",
    ["0xDC2919C5"] = "Perseus",
    ["0xE184247B"] = "Leopard",
    ["0xD8EF9356"] = "Zebra",
    ["0xEF29BFCA"] = "Geometric",
    ["0x67AEB165"] = "Boom!",
    ["0x46411A1D"] = "Patriotic",
    ["0x324F2D5F"] = "Default Clip",
    ["0x971CF6FD"] = "Extended Clip",
    ["0x88C7DA53"] = "Drum Magazine",
    ---------Rifles-------------------------------
    ["0xBE5EEA16"] = "Default Clip",
    ["0xB1214F9B"] = "Extended Clip",
    ["0xDBF0A53D"] = "Drum Magazine",
    ["0x4EAD7533"] = "Yusuf Amir Luxury Finish",
    ["0x9FBE33EC"] = "Default Clip",
    ["0x91109691"] = "Extended Clip",
    ["0xBA62E935"] = "Box Magazine",
    ["0xA0D89C42"] = "Scope",
    ["0xD89B9658"] = "Yusuf Amir Luxury Finish",
    ["0xFA8FA10F"] = "Default Clip",
    ["0x8EC1C979"] = "Extended Clip",
    ["0x377CD377"] = "Gilded Gun Metal Finish",
    ["0xC6C7E581"] = "Default Clip",
    ["0x7C8BD10E"] = "Extended Clip",
    ["0x6B59AEAA"] = "Drum Magazine",
    ["0x730154F2"] = "Etched Gun Metal Finish",
    ["0xC5A12F80"] = "Default Clip",
    ["0xB3688B0F"] = "Extended Clip",
    ["0xA857BC78"] = "Gilded Gun Metal Finish",
    ["0x18929DA"] = "Default Clip",
    ["0xEFB00628"] = "Extended Clip",
    ["0x822060A9"] = "Tracer Rounds",
    ["0xA99CF95A"] = "Incendiary Rounds",
    ["0xFAA7F5ED"] = "Armor Piercing Rounds",
    ["0x43621710"] = "Full Metal Jacket Rounds",
    ["0xC7ADD105"] = "Small Scope",
    ["0x659AC11B"] = "Default Barrel",
    ["0x3BF26DC7"] = "Heavy Barrel",
    ["0x9D65907A"] = "Grip",
    ["0xAE4055B7"] = "Digital Camo",
    ["0xB905ED6B"] = "Brushstroke Camo",
    ["0xA6C448E8"] = "Woodland Camo",
    ["0x9486246C"] = "Skull",
    ["0x8A390FD2"] = "Sessanta Nove",
    ["0x2337FC5"] = "Perseus",
    ["0xEFFFDB5E"] = "Leopard",
    ["0xDDBDB6DA"] = "Zebra",
    ["0xCB631225"] = "Geometric",
    ["0xA87D541E"] = "Boom!",
    ["0xC5E9AE52"] = "Patriotic",
    ["0x16C69281"] = "Default Clip",
    ["0xDE1FA12C"] = "Extended Clip",
    ["0x8765C68A"] = "Tracer Rounds",
    ["0xDE011286"] = "Incendiary Rounds",
    ["0x51351635"] = "Armor Piercing Rounds",
    ["0x503DEA90"] = "Full Metal Jacket Rounds",
    ["0xC66B6542"] = "Large Scope",
    ["0xE73653A9"] = "Default Barrel",
    ["0xF97F783B"] = "Heavy Barrel",
    ["0xD40BB53B"] = "Digital Camo",
    ["0x431B238B"] = "Brushstroke Camo",
    ["0x34CF86F4"] = "Woodland Camo",
    ["0xB4C306DD"] = "Skull",
    ["0xEE677A25"] = "Sessanta Nove",
    ["0xDF90DC78"] = "Perseus",
    ["0xA4C31EE"] = "Leopard",
    ["0x89CFB0F7"] = "Zebra",
    ["0x7B82145C"] = "Geometric",
    ["0x899CAF75"] = "Boom!",
    ["0x5218C819"] = "Patriotic",
    ["0x8610343F"] = "Default Clip",
    ["0xD12ACA6F"] = "Extended Clip",
    ["0xEF2C78C1"] = "Tracer Rounds",
    ["0xFB70D853"] = "Incendiary Rounds",
    ["0xA7DD1E58"] = "Armor Piercing Rounds",
    ["0x63E0A098"] = "Full Metal Jacket Rounds",
    ["0x43A49D26"] = "Default Barrel",
    ["0x5646C26A"] = "Heavy Barrel",
    ["0x911B24AF"] = "Digital Camo",
    ["0x37E5444B"] = "Brushstroke Camo",
    ["0x538B7B97"] = "Woodland Camo",
    ["0x25789F72"] = "Skull",
    ["0xC5495F2D"] = "Sessanta Nove",
    ["0xCF8B73B1"] = "Perseus",
    ["0xA9BB2811"] = "Leopard",
    ["0xFC674D54"] = "Zebra",
    ["0x7C7FCD9B"] = "Geometric",
    ["0xA5C38392"] = "Boom!",
    ["0xB9B15DB0"] = "Patriotic",
    ["0x4C7A391E"] = "Default Clip",
    ["0x5DD5DBD5"] = "Extended Clip",
    ["0x1757F566"] = "Tracer Rounds",
    ["0x3D25C2A7"] = "Incendiary Rounds",
    ["0x255D5D57"] = "Armor Piercing Rounds",
    ["0x44032F11"] = "Full Metal Jacket Rounds",
    ["0x833637FF"] = "Default Barrel",
    ["0x8B3C480B"] = "Heavy Barrel",
    ["0x4BDD6F16"] = "Digital Camo",
    ["0x406A7908"] = "Brushstroke Camo",
    ["0x2F3856A4"] = "Woodland Camo",
    ["0xE50C424D"] = "Skull",
    ["0xD37D1F2F"] = "Sessanta Nove	",
    ["0x86268483"] = "Perseus",
    ["0xF420E076"] = "Leopard",
    ["0xAAE14DF8"] = "Zebra",
    ["0x9893A95D"] = "Geometric",
    ["0x6B13CD3E"] = "Boom!",
    ["0xDA55CD3F"] = "Patriotic",
    ["0x513F0A63"] = "Default Clip",
    ["0x59FF9BF8"] = "Extended Clip",
    ["0xC607740E"] = "Drum Magazine",
    ["0x2D46D83B"] = "Default Clip",
    ["0x684ACE42"] = "Extended Clip",
    ["0x6B82F395"] = "Iron Sights",
    -------------Machine-Guns-----------
    ["0xF434EF84"] = "Default Clip",
    ["0x82158B47"] = "Extended Clip",
    ["0x3C00AFED"] = "Scope",
    ["0xD6DABABE"] = "Yusuf Amir Luxury Finish",
    ["0xE1FFB34A"] = "Default Clip",
    ["0xD6C59CD6"] = "Extended Clip",
    ["0x92FECCDD"] = "Etched Gun Metal Finish",
    ["0x492B257C"] = "Default Clip",
    ["0x17DF42E9"] = "Extended Clip",
    ["0xF6649745"] = "Tracer Rounds",
    ["0xC326BDBA"] = "Incendiary Rounds",
    ["0x29882423"] = "Armor Piercing Rounds",
    ["0x57EF1CC8"] = "Full Metal Jacket Rounds",
    ["0xC34EF234"] = "Default Barrel",
    ["0xB5E2575B"] = "Heavy Barrel",
    ["0x4A768CB5"] = "Digital Camo",
    ["0xCCE06BBD"] = "Brushstroke Camo",
    ["0xBE94CF26"] = "Woodland Camo",
    ["0x7609BE11"] = "Skull",
    ["0x48AF6351"] = "Sessanta Nove",
    ["0x9186750A"] = "Perseus",
    ["0x84555AA8"] = "Leopard",
    ["0x1B4C088B"] = "Zebra",
    ["0xE046DFC"] = "Geometric",
    ["0x28B536E"] = "Boom!",
    ["0xD703C94D"] = "Patriotic",
    ["0x1CE5A6A5"] = "Default Clip",
    ["0xEAC8C270"] = "Extended Clip",
    --------------Sniper---------------
    ["0x9BC64089"] = "Default Clip",
    ["0xD2443DDC"] = "Scope",
    ["0xBC54DA77"] = "Advanced Scope",
    ["0x4032B5E7"] = "Etched Wood Grip Finish",
    ["0x476F52F4"] = "Default Clip",
    ["0x94E12DCE"] = "Default Clip",
    ["0xE6CFD1AA"] = "Extended Clip",
    ["0xD77A22D2"] = "Tracer Rounds",
    ["0x6DD7A86E"] = "Incendiary Rounds",
    ["0xF46FD079"] = "Armor Piercing Rounds",
    ["0xE14A9ED3"] = "Full Metal Jacket Rounds",
    ["0x5B1C713C"] = "Zoom Scope",
    ["0x381B5D89"] = "Default Barrel",
    ["0x68373DDC"] = "Heavy Barrel",
    ["0x9094FBA0"] = "Digital Camo",
    ["0x7320F4B2"] = "Brushstroke Camo",
    ["0x60CF500F"] = "Woodland Camo",
    ["0xFE668B3F"] = "Skull",
    ["0xF3757559"] = "Sessanta Nove",
    ["0x193B40E8"] = "Perseus",
    ["0x107D2F6C"] = "Leopard",
    ["0xC4E91841"] = "Zebra",
    ["0x9BB1C5D3"] = "Geometric",
    ["0x3B61040B"] = "Boom!",
    ["0xB7A316DA"] = "Boom!",
    ["0xFA1E1A28"] = "Default Clip",
    ["0x2CD8FF9D"] = "Extended Clip",
    ["0xEC0F617"] = "Incendiary Rounds",
    ["0xF835D6D4"] = "Armor Piercing Rounds",
    ["0x3BE948F6"] = "Full Metal Jacket Rounds",
    ["0x89EBDAA7"] = "Explosive Rounds",
    ["0x82C10383"] = "Zoom Scope",
    ["0xB68010B0"] = "Night Vision Scope",
    ["0x2E43DA41"] = "Thermal Scope",
    ["0x5F7DCE4D"] = "Squared Muzzle Brake",
    ["0x6927E1A1"] = "Bell-End Muzzle Brake",
    ["0x909630B7"] = "Default Barrel",
    ["0x108AB09E"] = "Heavy Barrel",
    ["0xF8337D02"] = "Digital Camo",
    ["0xC5BEDD65"] = "Brushstroke Camo",
    ["0xE9712475"] = "Woodland Camo",
    ["0x13AA78E7"] = "Skull",
    ["0x26591E50"] = "Sessanta Nove",
    ["0x302731EC"] = "Perseus",
    ["0xAC722A78"] = "Leopard",
    ["0xBEA4CEDD"] = "Zebra",
    ["0xCD776C82"] = "Geometric",
    ["0xABC5ACC7"] = "Boom!",
    ["0x6C32D2EB"] = "Patriotic",
    ["0xD83B4141"] = "Default Clip",
    ["0xCCFD2AC5"] = "Extended Clip",
    ["0x1C221B1A"] = "Scope",
    ["0x161E9241"] = "Yusuf Amir Luxury Finish",
    --------Heavy-Weapons---------
    ["0x11AE5C97"] = "Default Clip"
}

remove_attachment_tab = menu.action(menu.my_root(), "Give Ammo", {"giveammo"}, "Give ammo for current weapon (fix for stand unlimited ammo not working with special ammo)", --done
    function(on_click)
        local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
        WEAPON.ADD_AMMO_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, 10)
    end
)
remove_attachment_tab = menu.action(menu.my_root(), "Give All Attachments", {"giveallattachments"}, "Give all attachments from your current weapon", --done
    function(on_click)
        util.toast("Giving all attachments ...")
        local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
        for key, value in pairs(attachments_table) do
          WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, key)
        end
        util.toast("Done :D")
    end
)
remove_attachment_tab = menu.action(menu.my_root(), "Remove All Attachments", {"removeallattachments"}, "Removes all attachments from your current weapon", --done
    function(on_click)
        util.toast("Removing all attachments ...")
        local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
        for key, value in pairs(attachments_table) do
            WEAPON.REMOVE_WEAPON_COMPONENT_FROM_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, key)
        end
        util.toast("Done :D")
    end
)
attachment_tab =
    menu.list(menu.my_root(), "Add Attachments", {"addattachments"}, "Add attachments to your current weapon")
for key, value in pairs(attachments_table) do
    local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
    if WEAPON.DOES_WEAPON_TAKE_WEAPON_COMPONENT(curr_equipped_weapon, key) == true then --done
        --util.toast(curr_equipped_weapon .. " takes " .. key .. " as attachment") --done
        menu.action(
            attachment_tab,
            value, --done
            {value}, --done
            "Attach " .. value .. "to your current weapon", --done
            function(on_click)
                WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(PLAYER.GET_PLAYER_PED(players.user()), curr_equipped_weapon, key) --done
                --util.toast("Your Weapon '" .. curr_equipped_weapon .. "' should now have the attachment '" .. key) --done
            end
        )
    end
end

while true do
    if menu.is_open() == true then
        local current_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
        if current_equipped_weapon == last_equipped_weapon then
        else
            last_equipped_weapon = current_equipped_weapon
            menu.delete(attachment_tab)
            attachment_tab =
                menu.list(
                menu.my_root(),
                "Attachments",
                {"attachments"},
                "See available attachments for your equipped weapon"
            )
            for key, value in pairs(attachments_table) do
                local curr_equipped_weapon = WEAPON.GET_SELECTED_PED_WEAPON(PLAYER.GET_PLAYER_PED(players.user()))
                if WEAPON.DOES_WEAPON_TAKE_WEAPON_COMPONENT(curr_equipped_weapon, key) == true then --done
                    --util.toast(curr_equipped_weapon .. " takes " .. key .. " as attachment") --done
                    menu.action(
                        attachment_tab,
                        value, --done
                        {value}, --done
                        "Attach " .. value .. "to your current weapon", --done
                        function(on_click)
                            WEAPON.GIVE_WEAPON_COMPONENT_TO_PED(
                                PLAYER.GET_PLAYER_PED(players.user()),
                                curr_equipped_weapon,
                                key
                            ) --done
                            --util.toast(
                            --    "Your Weapon '" .. curr_equipped_weapon .. "' should now have the attachment '" .. key
                            --) --done
                        end
                    )
                end
            end
        end
    end
    util.yield()
end
