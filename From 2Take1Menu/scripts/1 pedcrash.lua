local pid
math.randomseed(utils.time_ms())
local delay_time
delay_time = 200
local modal = {
    0xCE5FF074,
    0x573201B8,
    0xAAB71F62,
    0xA8683715,
    0x14EC17EA,
    0x56E29962,
    0xFCFA9E1E,
    0x644AC75E,
    0x18012A9F,
    0xD86B5A95,
    0x8BBAB455,
    0x2FD800B7,
    0x6AF51FAF,
    0x471BE4B2,
    0x4E8F95A2,
    0x8D8AC8B9,
    0x1250D7BA,
    0xB11BAB56,
    0x06A20728,
    0x431D501C,
    0x6D362854,
    0xDFB55C81,
    0xC3B52966,
    0x349F33E1,
    0xC2D06F53,
    0x9563221D,
    0xD3939DFD,
    0x3C831724,
    0x06C3F072,
    0x431FC24C,
    0xA148614D,
    0xAD7844BB,
    0x303638A7,
    0xBE086EFD,
    0xA039335F,
    0x3BD99114,
    0x1FC37DBC,
    0x654AD86E,
    0x9D3DCB7A,
    0x63C8D891,
    0xFAB48BCB,
    0xB5CF80E4,
    0x38BAD33B,
    0x52C824DE,
    0x41018151,
    0x169BD1E1,
    0xDE0E0969,
    0xB097523B,
    0x745855A1,
    0xF322D338,
    0xCDE955D2,
    0x505603B9,
    0x48F96F5B,
    0x8CA0C266,
    0x61C81C85,
    0xBAD7BB80,
    0x47CF5E96,
    0xCCFF7D8A,
    0x3DFA1830,
    0xA56DE716,
    0xC79F6928,
    0x445AC854,
    0x5C2CF7F8,
    0x20C8012F,
    0x36DF2D5D,
    0x2799EFD8,
    0x31430342,
    0xAE86FDB4,
    0xB7C61032,
    0xF5B0079D,
    0x0438A4AE,
    0x51C03FA4,
    0x689C2A80,
    0x50610C43,
    0x457C64FB,
    0x13C4818C,
    0x2F4AEC3E,
    0x7DD8FB58,
    0x30830813,
    0x1475B827,
    0x8247D331,
    0x97F5FE8D,
    0xA5BA9A16,
    0x199881DC,
    0x092D9CC1,
    0xDB134533,
    0xC7496729,
    0x3F789426,
    0xDB5EC400,
    0x695FE666,
    0x2C641D7A,
    0x5A8EF9CF,
    0x87B25415,
    0x550C79C6,
    0x9CF26183,
    0x563B8570,
    0x9123FB40,
    0x19F41F65,
    0xDAB6A0EB,
    0x379DDAB8,
    0xFAE46146,
    0xC41B062E,
    0x5442C66B,
    0xD172497E,
    0x403DB4FD,
    0x787FA588,
    0x54DBEE1F,
    0x3FB5C3D3,
    0x7E6A64B7,
    0xF9A6F53F,
    0x07DD91AC,
    0x94562DD7,
    0x61D201B3,
    0x06DD569F,
    0x13AEF042,
    0xA9EB0E42,
    0x6BD9B68C,
    0x6C9B2849,
    0x7B0E452F,
    0xDDCAAA2C,
    0xD15D7E71,
    0x2FDE6EB7,
    0xDD817EAD,
    0xB25D16B2,
    0x681BD012,
    0xECCA8C15,
    0xA9D9B69E,
    0x9712C38F,
    0x3BAD4184,
    0x4F2E038A,
    0x60F4A717,
    0xB28C4A45,
    0x964511B7,
    0xD9D7588C,
    0x01EEA6BD,
    0x0B8D69E3,
    0x6857C9B7,
    0x9F6D37E1,
    0x8BD990BA,
    0xC2FBFEFE,
    0xC2A87702,
    0x546A5344,
    0xC89F0184,
    0x1EC93FD0,
    0x53B57EB0,
    0xE0E69974,
    0xF70EC5C4,
    0x55446010,
    0x4BA14CCA,
    0x8427D398,
    0xAD54E7A8,
    0x1536D95A,
    0x20208E4D,
    0x2AD8921B,
    0x4086BD77,
    0x0E32D8D0,
    0x174D4245,
    0xB564882B,
    0x80E59F2E,
    0xD1FEB884,
    0x23C7DC11,
    0xE7A963D9,
    0x7E0961B8,
    0xCA56FA52,
    0x76284640,
    0x668BA707,
    0x379F9596,
    0x9AD32FE9,
    0xC99F21C4,
    0xB3B3F5E6,
    0xA1435105,
    0xFDC653C7,
    0xFF3E88AB,
    0x2DADF4AA,
    0xA4471173,
    0x168775F6,
    0x77D41A3E,
    0xAA82FF9B,
    0xD1CCE036,
    0xA5720781,
    0x9877EF71,
    0x3521A8D2,
    0xD71FE131,
    0xE16D8F01,
    0x50F73C0C,
    0x7D03E617,
    0x2307A353,
    0x14D506EE,
    0x4E4179C6,
    0x2A22FBCE,
    0x2DB7EEF3,
    0x91CA3E2C,
    0x1AF6542C,
    0x297FF13F,
    0x132C1A8E,
    0x696BE0A9,
    0x3053E555,
    0x64FDEA7D,
    0x77AC8FDA,
    0x4B652906,
    0xC923247C,
    0x8384FC9F,
    0xF561A4C6,
    0x25305EEE,
    0x843D9D0F,
    0xD7606C30,
    0xC1C46677,
    0xAFFAC2E4,
    0xE716BDCB,
    0xACA3C8CA,
    0xC3F0F764,
    0x8A3703F1,
    0xCF92ADE9,
    0x98C7404F,
    0x8674D5FC,
    0x2418C430,
    0x36C6E98C,
    0xB7292F0C,
    0xEAC2C7EE,
    0xC19377E7,
    0x4B64199D,
    0x5D15BD00,
    0x1FDF4294,
    0x31C9E669,
    0xAB0A7155,
    0x95EF18E3,
    0xE7565327,
    0x26C3D079,
    0x9760192E,
    0x69591CF7,
    0xB46EC356,
    0xEFE5AFE6,
    0x7228AF60,
    0x8CCE790F,
    0xEA969C40,
    0x30DB9D7B,
    0xC1F380E6,
    0xDBCB9834,
    0x0CE81655,
    0x8587248C,
    0xECD04FE9,
    0x6F802738,
    0x2F016D02,
    0x4772AF42,
    0x3C60A153,
    0xA3A35C2F,
    0x47035EC1,
    0x585C0B52,
    0x062547E7,
    0x0F9513F1,
    0xC314F727,
    0x5B44892C,
    0x3034F9E2,
    0x4440A804,
    0x039677BD,
    0xB8CC92B4,
    0xF09D5E29,
    0xFA8AB881,
    0x459762CA,
    0x450EEF9D,
    0x4BAF381C,
    0x45463A0D,
    0x38951A1B,
    0xB594F5C3,
    0x72551375,
    0x5816C61A,
    0xFBB374CA,
    0x574DE134,
    0x43595670,
    0x0998C7AD,
    0x70AEB9C8,
    0xB76A330F,
    0x45918E44,
    0x4BBA84D9,
    0x8D67EE7D,
    0xC3CC9A75,
    0x4F921E6E,
    0xCBFDA3CF,
    0x4EFEB1F0,
    0x7896DA94,
    0xE1479C0B,
    0x1EEC7BDC,
    0x98F9E770,
    0x8B70B405,
    0xAD340F5A,
    0x6B38B8F8,
    0xDF8B1301,
    0x4D6DE57E,
    0x1E9314A2,
    0x46521A32,
    0xC0937202,
    0xF6D1E04E,
    0xA4E0A1FE,
    0x893D6805,
    0x42FE5370,
    0x8864083D,
    0x53536529,
    0x5C26040A,
    0x3A5201C5,
    0x69E8ABC3,
    0x8C0FD4E2,
    0x0609B130,
    0xD266D9D6,
    0xEAACAAF0,
    0x89768941,
    0xD770C9B4,
    0x0703F106,
    0xA5C787B6,
    0xABEF0004,
    0x82BF7EA1,
    0x8CDCC057,
    0x04430687,
    0x1383A508,
    0xA347CA8A,
    0xAE5BE23A,
    0xA8C22996,
    0xCAE9E5D5,
    0x9AB35F63,
    0xA44F6F8B,
    0xB58D2529,
    0x1BCC157B,
    0xA28E71D7,
    0x7AAB19D2,
    0xE8594E22,
    0xEC9E8F1C,
    0x6F139B54,
    0xE3420BDB,
    0x44BC7BB1,
    0xC2005A40,
    0xBCC475CB,
    0x989DFD9A,
    0x6DBBFC8B,
    0x613E626C,
    0xC0DB04CF,
    0xF41F399B,
    0x5B1FA0C3,
    0x617D89E2,
    0x2F4AFE35,
    0xF00B49DB,
    0x7FA2F024,
    0xC2800DBE,
    0x858C94B8,
    0x21F58BB4,
    0x616C97B9,
    0xF64ED7D0,
    0x188099A9,
    0x2E420A24,
    0xAA64168C,
    0x8BE12CEC,
    0xAEEA76B5,
    0x81441B71,
    0x6343DD19,
    0xDE2937F3,
    0xEF785A6A,
    0x48FF4CA9,
    0x84A1B11A,
    0x158C439C,
    0x4E0CE5D3,
    0xFD5537DE,
    0x5AA42C21,
    0xBCA2CCEA,
    0xF1E823A2,
    0xFDA94268,
    0xE7714013,
    0xF6157D8F,
    0xB9DD0300,
    0x106D9A99,
    0x7E4F763F,
    0xFF71F826,
    0x352A026F,
    0x5761F4AD,
    0x4914D813,
    0xC54E878A,
    0x68709618,
    0xF42EE883,
    0x231AF63F,
    0x23B88069,
    0xE83B93B7,
    0xDB729238,
    0x84302B09,
    0x247502A9,
    0x8FEDD989,
    0x7CCBE17A,
    0x4F46D607,
    0x3D843282,
    0x32B11CDC,
    0xBDDD5546,
    0x26EF3426,
    0x31A3498E,
    0x964D12DC,
    0x4F3FBA06,
    0xA2E86156,
    0x905CE0CA,
    0x278C8CB7,
    0x3273A285,
    0x03B8C510,
    0xFD1C49BB,
    0x0DA1EAC6,
    0x3B474ADF,
    0x0B881AEE,
    0x99BB00F8,
    0x400AEC41,
    0x246AF208,
    0x6D1E15F7,
    0x47E4EEA0,
    0x7EF440DB,
    0xFCE270C2,
    0xA70B4A92,
    0x909D9E7F,
    0x2F8845A3,
    0xC4B715D2,
    0x5746CD96,
    0xBDA21E5C,
    0xBDBB4922,
    0x6162EC47,
    0x84F9E937,
    0x75C34ACA,
    0xE0FA2554,
    0x49EADBF6,
    0x85889AC3,
    0xAAE4EA7B,
    0x286E54A7,
    0x6CCFE08A,
    0x9D0087A8,
    0xE6631195,
    0x467415E9,
    0x15CD4C33,
    0x820B33BD,
    0x7461A0B0,
    0x9C2DB088,
    0xDA890932,
    0xCBFC0DF5,
    0xD090C350,
    0x3AE4A33B,
    0xB1B196B2,
    0x841BA933,
    0xFECE8B85,
    0x65978363,
    0xCE1324DE,
    0x0D6D9C49,
    0x7A32EE74,
    0x0F5D26BB,
    0xEDA0082D,
    0x570462B9,
    0xBE204C9B,
    0x87CA80AE,
    0xE11A9FB4,
    0x799E9EEE,
    0xEB51D959,
    0x5B3BD90D,
    0x65B93076,
    0xDFE443E5,
    0x6E42FD26,
    0x4DA6E849,
    0x5389A93C,
    0x27BD51D4,
    0xFCDC910A,
    0xF1BCA919,
    0xFD418E10,
    0x188232D0,
    0xA36F9806,
    0x3BE8287E,
    0xBF9672F4,
    0xCB3059B2,
    0xAF03DDE1,
    0x37FACDA6,
    0xFBF98469,
    0xEDDCAB6D,
    0x1E04A96B,
    0x3862EEA8,
    0xDE17DD3B,
    0xBD006AF1,
    0xC8B7167D,
    0x719D27F4,
    0xEF154C47,
    0x60E6A7D8,
    0x2DC6D3E7,
    0x61D4C771,
    0x26A562B7,
    0x154FCF3F,
    0x999B00C6,
    0xC56E118C,
    0x267630FE,
    0x6437E77D,
    0x27B3AD75,
    0xE52E126C,
    0x45753032,
    0xDEEF9F6E,
    0xE6AC74A4,
    0x380C4DE6,
    0xD5BA52FF,
    0x3D0A5EB1,
    0xFFE63677,
    0x4C7B2F05,
    0x86BDFE26,
    0x382121C8,
    0x36984358,
    0xE793C8E8,
    0x0D810489,
    0xDC5C5EA5,
    0x7C851464,
    0xA23B5F57,
    0x67000B94,
    0xCD777AAA,
    0xCAC85344,
    0xDE352A35,
    0x5719786D,
    0x5265F707,
    0xF9FD068C,
    0x92991B72,
    0x0B34D6F5,
    0x3293B9CE,
    0x242C34A7,
    0xC3F6E385,
    0x4B657AF8,
    0xB788F1F5,
    0x73DEA88B,
    0x432CA064,
    0x5972CCF0,
    0x781A3CF8,
    0x9C9EFFD8,
    0x19B6FF06,
    0xD2B27EC1,
    0xD128FF9D,
    0x2970A494,
    0xB26573A3,
    0x6C9DD7C9,
    0x9C13CB95,
    0xC85F0A88,
    0x4D5696F7,
    0xC0F371B7,
    0x56D38F95,
    0x9855C974,
    0x45348DBB,
    0x3E8417BC,
    0x33A464E5,
    0x5CDEF405,
    0x613E709B,
    0x705E61F2,
    0xC4A617BD,
    0x38430167,
    0xEDB42F3F,
    0xEEDACFC9,
    0xDA2C984E,
    0x18CE57D0,
    0xF7A74139,
    0x36EA5B09,
    0x4186506E,
    0x917ED459,
    0xCDEF5408,
    0x9B22DBAF,
    0x9B810FA2,
    0x0D7114C9,
    0x163B875B,
    0xE093C5C6,
    0xAE47E4B0,
    0x312B5BC0,
    0x5D71A46F,
    0x780C01BD,
    0x4A8E5536,
    0x15F8700D,
    0x69F46BF3,
    0x028ABF95,
    0x14C3E407,
    0x031640AC,
    0xD55B2BF5,
    0x2300C816,
    0x9FC7F637,
    0xAB594AB6,
    0x4161D042,
    0xA96E2604,
    0x3EECBA5D,
    0x52580019,
    0x6E0FB794,
    0x5C14EDFA,
    0x8502B6B2,
    0x0DE9A30A,
    0x95C76ECD,
    0x63858A4A,
    0x040EABE3,
    0xF06B849D,
    0x9FD4292D,
    0xC9E5F56B,
    0x2EFEAFD5,
    0x625D6958,
    0x1A021B83,
    0x14D7B4E0,
    0xD47303AC,
    0xEDBC7546,
    0x26F067AD,
    0x7B8B434B,
    0xA956BD9E,
    0x49EA5685,
    0x1880ED06,
    0x418DFF92,
    0xF161D212,
    0x2930C1AB,
    0xA96BD9EC,
    0x9E80D2CE,
    0xDE0077FD,
    0xDB9C0997,
    0x765AAAE4,
    0x7EA4FFA6,
    0xF2DAA2ED,
    0xF0259D83,
    0xED0CE4C6,
    0x64611296,
    0xD85E6D28,
    0xE7B31432,
    0xB353629E,
    0xE75B4B1C,
    0xF63DE8E1,
    0x62599034,
    0x7367324F,
    0x56C96FC6,
    0x4117D39B,
    0xD768B228,
    0x1AE8BB58,
    0x795AC7A8,
    0x1C0077FB,
    0xCE9113A9,
    0x59511A6C,
    0x9FC37F22,
    0xD0BDE116,
    0xAD9EF1BB,
    0x62018559,
    0x9E08633D,
    0x62CC28E2,
    0xB2273D4E,
    0xE5A11106,
    0x0B4A6862,
    0xB3F3EE34,
    0x7A05FA59,
    0x5076A73B,
    0xD8F9CD47,
    0x0F977CEB,
    0x04498DDE,
    0xD7DA9E99,
    0xC5FEFADE,
    0x5E3DA4A4,
    0xE497BBEF,
    0x9B557274,
    0x867639D1,
    0x22911304,
    0x75D30A91,
    0xF5908A06,
    0x4163A158,
    0xB6B1EDA8,
    0xEE75A00F,
    0x309E7DEA,
    0x739B1EF5,
    0x65793043,
    0x58D696FE,
    0x72C0CAD2,
    0x3CDCA742,
    0x48114518,
    0xAB300C07,
    0x5F2113A1,
    0xB1BB9B59,
    0xEF7135AE,
    0xC05E1399,
    0xB144F9B9,
    0x6E122C06,
    0x927F2323,
    0x8D8F1B10,
    0xCA0050E9,
    0x3B96F23E,
    0xAD4C724C,
    0x550D8D9D,
    0x441405EC,
    0x69147A0D,
    0xBE20FA04,
    0x2E140314,
    0xD7F37609,
    0x414FA27B,
    0xA20899E7,
    0x35578634,
    0xC512DD23,
    0xFA389D4F,
    0xB6AA85CE,
    0x9C70109D,
    0x0D9C72F8,
    0x969B6DFE,
    0xF0D4BE2E,
    0x5DCA2528,
    0x23E9A09E,
    0xD2E3A284,
    0x5B81D86C,
    0xF0EC56E2,
    0xC306D6F5,
    0x76474545,
    0x621E6BFD,
    0x2A797197,
    0x342333D3,
    0x2B6E1BB6,
    0x45BB1666,
    0xC454BCBB,
    0xCE2CB751,
    0xACCCBDB6,
    0xE6CC3CDC,
    0x1C95CB0B,
    0x81F74DE7,
    0x709220C7,
    0xCE96030B,
    0x60D5D6DA,
    0xAC0EA5D8,
    0x6C19E962,
    0x90769A8F,
    0x2BACC2DB,
    0x46E39E63,
    0x9A1E5E52,
    0x6A8F1F9B,
    0xF0AC2626,
    0xCF623A2C,
    0xDA116E7E,
    0x5244247D,
    0x8B7D3766,
    0x24604B2B,
    0x94C2A03F,
    0x2D0EFCEB,
    0x85B9C668,
    0xC6B49A2F,
    0xB3229752,
    0xF041880B,
    0x348065F5,
    0x90EF5134,
    0x7DC3908F,
    0xC8BB1E52,
    0x4705974A,
    0x5048B328,
    0x36E70600,
    0xDC59940D,
    0x7B9B4BC0,
    0x855E36A3,
    0x3C438CD2,
    0x6AF4185D,
    0x9194CE03,
    0x94AE2B8C,
    0xAC4B4506
}

modalcrash = function(feat)
    if feat.on then
        local wt = tonumber(feat.value_i)
        local myped = player.get_player_ped(player.player_id())
        if player.get_player_health(player.player_id()) < 1 then
            system.wait(wt)

            local y = #modal
            local hash = math.random(1, y)

            modhash = modal[hash]

            streaming.request_model(modhash)
            while (not streaming.has_model_loaded(modhash)) do
                system.wait(0)
            end

            player.set_player_model(modhash)
            streaming.set_model_as_no_longer_needed(modhash)
        end
        ped.set_ped_health(myped, 0)
        system.wait(wt)
    end
    return HANDLER_CONTINUE
end

attach_self = function(feat)
    if feat.on then
        pid = feat.value_i

        local pedd = player.get_player_ped(player.player_id())
        local rot = v3()
        local offset = v3()
        offset.x = 0.0
        offset.y = 0.0
        offset.z = 0.0
        if ped.get_ped_health(pedd) < 1 then return end else
        local pped = player.get_player_ped(pid)
        rot = entity.get_entity_rotation(pedd)
        

        entity.attach_entity_to_entity(pedd, pped, 1356, offset, rot, true, true, true, 0, false)
    end
    return HANDLER_CONTINUE
end

set_delay = function(feat)

if playerseid.on == true then
    playerseid.on = false
if start_crash.on == true then    
    start_crash.on = false

    delay_time = feat.value_i
    system.wait(200)
end
    playerseid.on = true
    start_crash.on = true
    else
    delay_time = feat.value_i

end
end
    

function main()
    local parent = menu.add_feature("Moists pedcrash", "parent", 0)
    playerseid = menu.add_feature("Attach to Player ID:", "value_i", parent.id, attach_self)
    playerseid.on = false
    playerseid.max_i = 32
    playerseid.min_i = -1
    playerseid.value_i = -1

    start_crash = menu.add_feature("Model Swap Crash Session", "toggle", parent.id, modalcrash)
    start_crash.on = false
    start_crash.threaded = true

    
    crash = menu.add_feature("pedcrash: Swap Delay = ", "action_value_i", parent.id, set_delay)
    crash.threaded = true
    crash.max_i = 1000
    crash.min_i = 5
    crash.value_i = 200
    crash.mod_i = 5
end

main()