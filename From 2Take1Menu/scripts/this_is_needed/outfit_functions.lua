outfit = {}

function outfit.head_component()
    return 0
end

function outfit.mask_component()
    return 1
end

function outfit.hair_style_component()
    return 2
end

function outfit.torso_component()
    return 3
end

function outfit.leg_component()
    return 4
end

function outfit.bag_parachute_component()
    return 5
end

function outfit.foot_component()
    return 6
end

function outfit.accessory_component()
    return 7
end

function outfit.undershirt_component()
    return 8
end

function outfit.armor_component()
    return 9
end

function outfit.decal_component()
    return 10
end

function outfit.top_component()
    return 11
end

function outfit.get_random_drawable_variation(freemode_ped, component, drawable)
    return math.random(0, ped.get_number_of_ped_texture_variations(freemode_ped, component, drawable) - 1)
end



function outfit.wipe_outfit(freemode_ped)
    local hair = ped.get_ped_drawable_variation(freemode_ped, 2)
    local hair_tex = ped.get_ped_texture_variation(freemode_ped, 2)

    ped.set_ped_component_variation(freemode_ped, outfit.mask_component(), 0, 0, 0)
    ped.set_ped_component_variation(freemode_ped, outfit.hair_style_component(), hair, hair_tex, 0)
    ped.set_ped_component_variation(freemode_ped, outfit.torso_component(), 0, 0, 0)
    ped.set_ped_component_variation(freemode_ped, outfit.armor_component(), 0, 0, 0)
    ped.set_ped_component_variation(freemode_ped, outfit.accessory_component(), 0, 0, 0)
    ped.set_ped_component_variation(freemode_ped, outfit.top_component(), 0, 0, 0)
    ped.set_ped_component_variation(freemode_ped, outfit.undershirt_component(), 15, 0, 0)
    ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 0, 0, 0)
    ped.set_ped_component_variation(freemode_ped, outfit.foot_component(), 0, 0, 0) 
    ped.clear_all_ped_props(freemode_ped)
end

function outfit.copy_outfit(freemode_ped, clone_ped)
    local plyr_clothes = {
        player_mask = ped.get_ped_drawable_variation(freemode_ped, outfit.mask_component()),
        player_torso = ped.get_ped_drawable_variation(freemode_ped, outfit.torso_component()),
        player_armor = ped.get_ped_drawable_variation(freemode_ped, outfit.armor_component()),
        player_accessories = ped.get_ped_drawable_variation(freemode_ped, outfit.accessory_component()),
        player_top = ped.get_ped_drawable_variation(freemode_ped, outfit.top_component()),
        player_undershirts = ped.get_ped_drawable_variation(freemode_ped, outfit.undershirt_component()),
        player_legs = ped.get_ped_drawable_variation(freemode_ped, outfit.leg_component()),
        player_feet = ped.get_ped_drawable_variation(freemode_ped, outfit.foot_component()),
        player_hats = ped.get_ped_prop_index(freemode_ped, 0),
        player_glasses = ped.get_ped_prop_index(freemode_ped, 1),
        player_ears = ped.get_ped_prop_index(freemode_ped, 2),
        player_watches = ped.get_ped_prop_index(freemode_ped, 6),
        player_bracelets = ped.get_ped_prop_index(freemode_ped, 7),
    }
    local plyr_cloth_tex = {
        player_mask_tex = ped.get_ped_texture_variation(freemode_ped, outfit.mask_component()),
        player_torso_tex = ped.get_ped_texture_variation(freemode_ped, outfit.torso_component()),
        player_armor_tex = ped.get_ped_texture_variation(freemode_ped, outfit.armor_component()),
        player_accessories_tex = ped.get_ped_texture_variation(freemode_ped, outfit.accessory_component()),
        player_top_tex = ped.get_ped_texture_variation(freemode_ped, outfit.top_component()),
        player_undershirts_tex = ped.get_ped_texture_variation(freemode_ped, outfit.undershirt_component()),
        player_legs_tex = ped.get_ped_texture_variation(freemode_ped, outfit.leg_component()),
        player_feet_tex = ped.get_ped_texture_variation(freemode_ped, outfit.foot_component()),
        player_hats_tex = ped.get_ped_prop_texture_index(freemode_ped, 0),
        player_glasses_tex = ped.get_ped_prop_texture_index(freemode_ped, 1),
        player_ears_tex = ped.get_ped_prop_texture_index(freemode_ped, 2),
        player_watches_tex = ped.get_ped_prop_texture_index(freemode_ped, 6),
        player_bracelets_tex = ped.get_ped_prop_texture_index(freemode_ped, 7)
    }

    ped.set_ped_component_variation(clone_ped, outfit.mask_component(), plyr_clothes["player_mask"], plyr_cloth_tex["player_mask_tex"], 0)
    ped.set_ped_component_variation(clone_ped, outfit.torso_component(), plyr_clothes["player_torso"], plyr_cloth_tex["player_torso_tex"], 0)
    ped.set_ped_component_variation(clone_ped, outfit.armor_component(), plyr_clothes["player_armor"], plyr_cloth_tex["player_armor_tex"], 0)
    ped.set_ped_component_variation(clone_ped, outfit.accessory_component(), plyr_clothes["player_accessories"], plyr_cloth_tex["player_accessories_tex"], 0)
    ped.set_ped_component_variation(clone_ped, outfit.top_component(), plyr_clothes["player_top"], plyr_cloth_tex["player_top_tex"], 0)
    ped.set_ped_component_variation(clone_ped, outfit.undershirt_component(), plyr_clothes["player_undershirts"], plyr_cloth_tex["player_undershirts_tex"], 0)
    ped.set_ped_component_variation(clone_ped, outfit.leg_component(), plyr_clothes["player_legs"], plyr_cloth_tex["player_legs_tex"], 0)
    ped.set_ped_component_variation(clone_ped, outfit.foot_component(), plyr_clothes["player_feet"], plyr_cloth_tex["player_feet_tex"], 0)
    ped.set_ped_prop_index(clone_ped, 0, plyr_clothes["player_hats"], plyr_cloth_tex["player_hats_tex"], 0)
    ped.set_ped_prop_index(clone_ped, 1, plyr_clothes["player_glasses"], plyr_cloth_tex["player_glasses_tex"], 0)
    ped.set_ped_prop_index(clone_ped, 2, plyr_clothes["player_ears"], plyr_cloth_tex["player_ears_tex"], 0)
    ped.set_ped_prop_index(clone_ped, 6, plyr_clothes["player_watches"], plyr_cloth_tex["player_watches_tex"], 0)
    ped.set_ped_prop_index(clone_ped, 7, plyr_clothes["player_bracelets"], plyr_cloth_tex["player_bracelets_tex"], 0)
end

function outfit.barefoot(freemode_ped)
    if (entity.get_entity_model_hash(freemode_ped) == gameplay.get_hash_key("mp_f_freemode_01")) then
        ped.set_ped_component_variation(freemode_ped, 6, 35, 0, 0)
    else
        ped.set_ped_component_variation(freemode_ped, 6, 34, 0, 0)
    end
end

function outfit.shirtless(freemode_ped)
    if (entity.get_entity_model_hash(freemode_ped) == gameplay.get_hash_key("mp_f_freemode_01")) then
        ped.set_ped_component_variation(freemode_ped, outfit.torso_component(), 15, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.top_component(), 15, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.undershirt_component(), 14, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.accessory_component(), 0, 0, 0)
    else
        ped.set_ped_component_variation(freemode_ped, outfit.torso_component(), 15, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.top_component(), 15, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.undershirt_component(), 15, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.accessory_component(), 0, 0, 0)
    end
end

function outfit.random_tuxedo_outfit(freemode_ped)
    if (entity.get_entity_model_hash(freemode_ped) == gameplay.get_hash_key("mp_f_freemode_01")) then
        ped.set_ped_component_variation(freemode_ped, outfit.torso_component(), 3, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.top_component(), 305, outfit.get_random_drawable_variation(freemode_ped, outfit.top_component(), 305), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.undershirt_component(), math.random(216, 217), outfit.get_random_drawable_variation(freemode_ped, outfit.undershirt_component(), math.random(216, 217)), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.accessory_component(), select(math.random(1, 2), 0, 22), select(math.random(1, 5), 0, 1, 2, 6, 12), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 133, outfit.get_random_drawable_variation(freemode_ped, outfit.leg_component(), 133), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.foot_component(), select(math.random(1, 3), 6, 13, 15), 0, 0)
    else
        ped.set_ped_component_variation(freemode_ped, outfit.torso_component(), 4, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.top_component(), 23, outfit.get_random_drawable_variation(freemode_ped, outfit.top_component(), 23), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.undershirt_component(), 10, outfit.get_random_drawable_variation(freemode_ped, outfit.undershirt_component(), 10), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.accessory_component(), select(math.random(1, 2), 0, 21), select(math.random(1, 3), 9, 10, 11), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 28, outfit.get_random_drawable_variation(freemode_ped, outfit.leg_component(), 28), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.foot_component(), select(math.random(1, 3), 20, 21, 105), outfit.get_random_drawable_variation(freemode_ped, outfit.foot_component(), select(math.random(1, 3), 20, 21, 105)), 0)
    end
end

function outfit.random_tropical_outfit(freemode_ped)
    if (entity.get_entity_model_hash(freemode_ped) == gameplay.get_hash_key("mp_f_freemode_01")) then
        ped.set_ped_component_variation(freemode_ped, outfit.torso_component(), 11, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.top_component(), 269, outfit.get_random_drawable_variation(freemode_ped, outfit.top_component(), 269), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 137, outfit.get_random_drawable_variation(freemode_ped, outfit.leg_component(), 137), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.foot_component(), select(math.random(1, 2), 15, 16), outfit.get_random_drawable_variation(freemode_ped, outfit.foot_component(), select(math.random(1, 2), 15, 16)), 0)
        
        if (math.random(0, 15) == 5) then
            outfit.barefoot(freemode_ped)
        elseif (math.random(0, 15) == 9) then
            outfit.shirtless(freemode_ped)
        elseif (math.random(0, 15) == 11) then
            outfit.shirtless(freemode_ped)
            outfit.barefoot(freemode_ped)
        end
    else
        ped.set_ped_component_variation(freemode_ped, outfit.top_component(), 260, outfit.get_random_drawable_variation(freemode_ped, outfit.top_component(), 260), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 15, outfit.get_random_drawable_variation(freemode_ped, outfit.leg_component(), 15), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.foot_component(), 16, outfit.get_random_drawable_variation(freemode_ped, outfit.foot_component(), 16), 0)

        if (math.random(0, 15) == 5) then
            outfit.barefoot(freemode_ped)
        elseif (math.random(0, 15) == 9) then
            outfit.shirtless(freemode_ped)
        elseif (math.random(0, 15) == 11) then
            outfit.shirtless(freemode_ped)
            outfit.barefoot(freemode_ped)
        end
    end
end

function outfit.random_golf_outfit(freemode_ped)
    if (entity.get_entity_model_hash(freemode_ped) == gameplay.get_hash_key("mp_f_freemode_01")) then
        ped.set_ped_component_variation(freemode_ped, outfit.torso_component(), 14, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.top_component(), math.random(400, 401), outfit.get_random_drawable_variation(freemode_ped, outfit.top_component(), math.random(400, 401)), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 137, outfit.get_random_drawable_variation(freemode_ped, outfit.leg_component(), 137), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.foot_component(), 103, outfit.get_random_drawable_variation(freemode_ped, outfit.foot_component(), 103), 0)
    else
        ped.set_ped_component_variation(freemode_ped, outfit.torso_component(), 0, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.top_component(), math.random(382, 383), outfit.get_random_drawable_variation(freemode_ped, outfit.top_component(), math.random(382, 383)), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 12, select(math.random(1, 5), 0, 4, 5, 7, 12), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.foot_component(), 99, outfit.get_random_drawable_variation(freemode_ped, outfit.foot_component(), 99), 0)
    end
end

function outfit.random_beach_outfit(freemode_ped)
    if (entity.get_entity_model_hash(freemode_ped) == gameplay.get_hash_key("mp_f_freemode_01")) then    
        ped.set_ped_component_variation(freemode_ped, outfit.torso_component(), 15, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.undershirt_component(), 14, 0, 0)
        ped.set_ped_component_variation(freemode_ped, outfit.foot_component(), select(math.random(1, 2), 15, 16), outfit.get_random_drawable_variation(freemode_ped, outfit.foot_component(), select(math.random(1, 2), 15, 16)), 0)

        if (math.random(1, 2) == 1) then
            ped.set_ped_component_variation(freemode_ped, outfit.top_component(), 15, select(math.random(1, 4), 0, 3, 10, 11), 0)
            ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 15, select(math.random(1, 4), 0, 3, 10, 11), 0)
        else
            ped.set_ped_component_variation(freemode_ped, outfit.top_component(), 18, outfit.get_random_drawable_variation(freemode_ped, outfit.top_component(), 18), 0)
            ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 17, outfit.get_random_drawable_variation(freemode_ped, outfit.leg_component(), 17), 0)
        end

        if (math.random(0, 15) == 5) then
            outfit.barefoot(freemode_ped)
        end
    else
        outfit.shirtless(freemode_ped)
        ped.set_ped_component_variation(freemode_ped, outfit.leg_component(), 15, outfit.get_random_drawable_variation(freemode_ped, outfit.leg_component(), 15), 0)
        ped.set_ped_component_variation(freemode_ped, outfit.foot_component(), 16, outfit.get_random_drawable_variation(freemode_ped, outfit.foot_component(), 16), 0)

        if (math.random(0, 15) == 5) then
            outfit.barefoot(freemode_ped)
        end
    end
end

return outfit