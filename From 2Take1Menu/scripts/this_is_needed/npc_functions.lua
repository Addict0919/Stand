require("this_is_needed\\other_functions")
require("this_is_needed\\outfit_functions")
npc = {}

function npc.copy_headblend(freemode_ped, clone_ped)
    ped.set_ped_component_variation(clone_ped, 2, ped.get_ped_drawable_variation(freemode_ped, 2), ped.get_ped_texture_variation(freemode_ped, 2), 0)

    local headhair = {
        haircolor = ped.get_ped_hair_color(freemode_ped),
        hairhighlightcolor = ped.get_ped_hair_highlight_color(freemode_ped)
    }

    local age = {
        age_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 3),
        age_val = ped.get_ped_head_overlay_value(freemode_ped, 3),
        age_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 3),
        age_color = ped.get_ped_head_overlay_color(freemode_ped, 3),
        age_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 3)
    }

    local facial_hair = {
        facial_hair_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 1),
        facial_hair_val = ped.get_ped_head_overlay_value(freemode_ped, 1),
        facial_hair_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 1),
        facial_hair_color = ped.get_ped_head_overlay_color(freemode_ped, 1),
        facial_hair_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 1)
    }

    local blemishes = {
        blemishes_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 0),
        blemishes_val = ped.get_ped_head_overlay_value(freemode_ped, 0),
        blemishes_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 0),
        blemishes_color = ped.get_ped_head_overlay_color(freemode_ped, 0),
        blemishes_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 0)
    }

    local sun_damage = {
        sun_damage_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 7),
        sun_damage_val = ped.get_ped_head_overlay_value(freemode_ped, 7),
        sun_damage_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 7),
        sun_damage_color = ped.get_ped_head_overlay_color(freemode_ped, 7),
        sun_damage_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 7)
    }

    local freckles = {
        freckles_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 9),
        freckles_val = ped.get_ped_head_overlay_value(freemode_ped, 9),
        freckles_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 9),
        freckles_color = ped.get_ped_head_overlay_color(freemode_ped, 9),
        freckles_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 9)
    }

    local body_blemishes = {
        body_blemishes_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 11),
        body_blemishes_val = ped.get_ped_head_overlay_value(freemode_ped, 11),
        body_blemishes_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 11),
        body_blemishes_color = ped.get_ped_head_overlay_color(freemode_ped, 11),
        body_blemishes_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 11)
    }

    local hb = ped.get_ped_head_blend_data(freemode_ped)
    ped.set_ped_head_blend_data(clone_ped, hb["shape_first"], hb["shape_second"], hb["shape_third"], hb["skin_first"], hb["skin_second"], hb["skin_third"], hb["mix_shape"], hb["mix_skin"], hb["mix_third"])
    
    if (facial_hair["facial_hair_val"] ~= nil) then
        ped.set_ped_head_overlay(clone_ped, 1, facial_hair["facial_hair_val"], facial_hair["facial_hair_opacity"])
        ped.set_ped_head_overlay_color(clone_ped, 1, facial_hair["facial_hair_color_type"], facial_hair["facial_hair_color"], facial_hair["facial_hair_highlight"])
    end

    if (age["age_val"] ~= nil) then
        ped.set_ped_head_overlay(clone_ped, 3, age["age_val"], age["age_opacity"])
        ped.set_ped_head_overlay_color(clone_ped, 3, age["age_color_type"], age["age_color"], age["age_highlight"])
    end

    if (blemishes["blemishes_val"] ~= nil) then
        ped.set_ped_head_overlay(clone_ped, 0, blemishes["blemishes_val"], blemishes["blemishes_opacity"])
        ped.set_ped_head_overlay_color(clone_ped, 0, blemishes["blemishes_color_type"], blemishes["blemishes_color"], blemishes["blemishes_highlight"])
    end

    if (sun_damage["sun_damage_val"] ~= nil) then
        ped.set_ped_head_overlay(clone_ped, 7, sun_damage["sun_damage_val"], sun_damage["sun_damage_opacity"])
        ped.set_ped_head_overlay_color(clone_ped, 7, sun_damage["sun_damage_color_type"], sun_damage["sun_damage_color"], sun_damage["sun_damage_highlight"])
    end

    if (freckles["freckles_val"] ~= nil) then
        ped.set_ped_head_overlay(clone_ped, 9, freckles["freckles_val"], freckles["freckles_opacity"])
        ped.set_ped_head_overlay_color(clone_ped, 9, freckles["freckles_color_type"], freckles["freckles_color"], freckles["freckles_highlight"])
    end

    if (body_blemishes["body_blemishes_val"] ~= nil) then
        ped.set_ped_head_overlay(clone_ped, 11, body_blemishes["body_blemishes_val"], body_blemishes["body_blemishes_opacity"])
        ped.set_ped_head_overlay_color(clone_ped, 11, body_blemishes["body_blemishes_color_type"], body_blemishes["body_blemishes_color"], body_blemishes["body_blemishes_highlight"])
    end
    ped.set_ped_hair_colors(clone_ped, headhair["haircolor"], headhair["hairhighlightcolor"])

    -- From headblend profiles by GhostOne
    local face_features = {
        nose_width = 0,
        nose_height = 1,
        nose_length = 2,
        nose_bridge = 3,
        nose_tip = 4,
        nose_bridge = 5,
        brow_height = 6,
        brow_width = 7,
        cheekbone_height = 8,
        cheekbone_width = 9,
        cheeks_width = 10,
        eyes = 11,
        lips = 12,
        jaw_width = 13,
        jaw_height = 14,
        chin_length = 15,
        chin_position = 16,
        chin_width = 17,
        chin_shape = 18,
        neck_width = 19
    }

    for k, v in pairs(face_features) do
        hb[k] = ped.get_ped_face_feature(freemode_ped, v)
    end

    for k, v in pairs(face_features) do
		if hb[k] then
	        ped.set_ped_face_feature(clone_ped, v, hb[k])
        end
	end
end

function npc.create_clone(freemode_ped, clone_ped)
    npc.copy_headblend(freemode_ped, clone_ped)
    outfit.copy_outfit(freemode_ped, clone_ped)
end


function npc.randomize_skin_tone(freemode_ped)
    local hb = ped.get_ped_head_blend_data(freemode_ped)
    ped.set_ped_head_blend_data(freemode_ped, hb["shape_first"], hb["shape_second"], hb["shape_third"], math.random(0, 45), math.random(0, 45), math.random(0, 45), hb["mix_shape"], math.random(), hb["mix_third"])
end

function npc.wipe_head_blend(freemode_ped)
    ped.set_ped_head_blend_data(freemode_ped, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    ped.set_ped_component_variation(freemode_ped, 2, 0, 0, 0)
    local headhair = {
        haircolor = ped.get_ped_hair_color(freemode_ped),
        hairhighlightcolor = ped.get_ped_hair_highlight_color(freemode_ped)
    }

    local age = {
        age_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 3),
        age_val = ped.get_ped_head_overlay_value(freemode_ped, 3),
        age_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 3),
        age_color = ped.get_ped_head_overlay_color(freemode_ped, 3),
        age_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 3)
    }

    local facial_hair = {
        facial_hair_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 1),
        facial_hair_val = ped.get_ped_head_overlay_value(freemode_ped, 1),
        facial_hair_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 1),
        facial_hair_color = ped.get_ped_head_overlay_color(freemode_ped, 1),
        facial_hair_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 1)
    }

    local blemishes = {
        blemishes_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 0),
        blemishes_val = ped.get_ped_head_overlay_value(freemode_ped, 0),
        blemishes_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 0),
        blemishes_color = ped.get_ped_head_overlay_color(freemode_ped, 0),
        blemishes_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 0)
    }

    local sun_damage = {
        sun_damage_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 7),
        sun_damage_val = ped.get_ped_head_overlay_value(freemode_ped, 7),
        sun_damage_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 7),
        sun_damage_color = ped.get_ped_head_overlay_color(freemode_ped, 7),
        sun_damage_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 7)
    }

    local freckles = {
        freckles_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 9),
        freckles_val = ped.get_ped_head_overlay_value(freemode_ped, 9),
        freckles_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 9),
        freckles_color = ped.get_ped_head_overlay_color(freemode_ped, 9),
        freckles_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 9)
    }

    local body_blemishes = {
        body_blemishes_opacity = ped.get_ped_head_overlay_opacity(freemode_ped, 11),
        body_blemishes_val = ped.get_ped_head_overlay_value(freemode_ped, 11),
        body_blemishes_color_type = ped.get_ped_head_overlay_color_type(freemode_ped, 11),
        body_blemishes_color = ped.get_ped_head_overlay_color(freemode_ped, 11),
        body_blemishes_highlight = ped.get_ped_head_overlay_highlight_color(freemode_ped, 11)
    }
    
    if (facial_hair["facial_hair_val"] ~= nil) then
        ped.set_ped_head_overlay(freemode_ped, 1, -1, 0)
        ped.set_ped_head_overlay_color(freemode_ped, 1, 0, 0, 0)
    end

    if (age["age_val"] ~= nil) then
        ped.set_ped_head_overlay(freemode_ped, 3, -1, 0)
        ped.set_ped_head_overlay_color(freemode_ped, 3, 0, 0, 0)
    end

    if (blemishes["blemishes_val"] ~= nil) then
        ped.set_ped_head_overlay(freemode_ped, 0, -1, 0)
        ped.set_ped_head_overlay_color(freemode_ped, 0, 0, 0, 0)
    end

    if (sun_damage["sun_damage_val"] ~= nil) then
        ped.set_ped_head_overlay(freemode_ped, 7, -1, 0)
        ped.set_ped_head_overlay_color(freemode_ped, 7, 0, 0, 0)
    end

    if (freckles["freckles_val"] ~= nil) then
        ped.set_ped_head_overlay(freemode_ped, 9, -1, 0)
        ped.set_ped_head_overlay_color(freemode_ped, 9, 0, 0, 0)
    end

    if (body_blemishes["body_blemishes_val"] ~= nil) then
        ped.set_ped_head_overlay(freemode_ped, 11, -1, 0)
        ped.set_ped_head_overlay_color(freemode_ped, 11, 0, 0, 0)
    end
    ped.set_ped_hair_colors(freemode_ped, 0, 0)

    for i = 0, 19 do
        ped.set_ped_face_feature(freemode_ped, i, 0)
    end
end

function npc.randomize_head_blend(freemode_ped)
    local hb_randomizer = {
        regular_hair_colors = select(math.random(1, 29), 4, 1, 8, 17, 2, 16, 60, 56, 27, 5, 14, 9, 26, 0, 28, 15, 57, 10, 11, 29, 55, 6, 18, 13, 7, 59, 12, 3, 58),
        regular_hair_highlight_colors = select(math.random(1, 29), 12, 59, 9, 4, 17, 14, 56, 11, 15, 18, 13, 6, 0, 8, 29, 57, 5, 27, 58, 55, 60, 2, 28, 26, 3, 1, 16, 10, 7),

        fem_face_shapes1 = select(math.random(1, 17), 29, 23, 22, 35, 31, 36, 28, 33, 32, 26, 37, 25, 21, 40, 34, 27, 45),
        fem_face_shapes2 = select(math.random(1, 17), 26, 32, 22, 45, 31, 21, 35, 36, 29, 37, 28, 23, 33, 25, 40, 27, 34),

        male_face_shapes1 = select(math.random(1, 23), 13, 2, 44, 10, 0, 7, 43, 18, 12, 9, 5, 1, 17, 11, 6, 16, 4, 39, 3, 8, 19, 20, 42),
        male_face_shapes2 = select(math.random(1, 23), 39, 1, 18, 19, 13, 42, 17, 16, 20, 7, 10, 8, 12, 44, 5, 2, 4, 6, 11, 0, 9, 3, 43),

        skin_tone1 = select(math.random(1, 46), 8, 33, 24, 42, 9, 14, 5, 22, 43, 20, 30, 41, 15, 44, 19, 11, 18, 3, 45, 12, 32, 34, 16, 7, 36, 29, 21, 6, 1, 10, 23, 28, 31, 4, 17, 27, 2, 25, 35, 40, 37, 38, 39, 26, 0, 13),
        skin_tone2 = select(math.random(1, 46), 4, 36, 19, 26, 16, 20, 24, 15, 45, 21, 41, 28, 1, 37, 42, 13, 7, 38, 12, 32, 27, 34, 30, 40, 5, 35, 3, 43, 9, 8, 10, 23, 18, 22, 17, 29, 6, 33, 2, 0, 39, 14, 31, 44, 25, 11)
    }

    if (entity.get_entity_model_hash(freemode_ped) == 2627665880) then
        ped.set_ped_head_blend_data(freemode_ped, hb_randomizer["fem_face_shapes1"], hb_randomizer["fem_face_shapes2"], 0, math.random(0, 45), math.random(0, 45), 0, math.random(), math.random(), 0)
        local xyz = math.random(0, 80)
        if (xyz ~= 24) then
            ped.set_ped_component_variation(freemode_ped, 2, xyz, 0, 0) --hair 
        end
    else
        ped.set_ped_head_blend_data(freemode_ped, hb_randomizer["male_face_shapes1"], hb_randomizer["male_face_shapes1"], 0, math.random(0, 45), math.random(0, 45), 0, math.random(), math.random(), 0) -- base headblend
        local xyz = math.random(0, 76)
        if (xyz ~= 23) then
            ped.set_ped_component_variation(freemode_ped, 2, xyz, 0, 0) --hair 
        end
        ped.set_ped_head_overlay(freemode_ped, 1, math.random(-1, 28), math.random()) -- facial hair
        ped.set_ped_head_overlay(freemode_ped, 2, math.random(-1, 33), math.random()) -- eyebrows
    end

    ped.set_ped_eye_color(freemode_ped, select(math.random(1, 8), 6, 5, 1, 3, 0, 7, 2, 4)) -- eye colors
    ped.set_ped_hair_colors(freemode_ped, hb_randomizer["regular_hair_colors"], hb_randomizer["regular_hair_highlight_colors"]) -- hair colors
    ped.set_ped_head_overlay_color(freemode_ped, 1, 1, hb_randomizer["regular_hair_colors"], hb_randomizer["regular_hair_highlight_colors"]) -- facial hair colors
    ped.set_ped_head_overlay_color(freemode_ped, 2, 1, hb_randomizer["regular_hair_colors"], hb_randomizer["regular_hair_highlight_colors"]) -- eyebrow colors
    ped.set_ped_head_overlay(freemode_ped, 3, math.random(-1, 14), math.random()) -- skin aging
end

function npc.randomize_hair_styles(freemode_ped)
    if (entity.get_entity_model_hash(freemode_ped) == 2627665880) then
        local xyz = math.random(0, 80)
        if (xyz ~= 24) then
            ped.set_ped_component_variation(freemode_ped, 2, xyz, 0, 0) --hair 
        end
    else
        local xyz = math.random(0, 76)
        if (xyz ~= 23) then
            ped.set_ped_component_variation(freemode_ped, 2, xyz, 0, 0) --hair 
        end
    end
end

function npc.extra_face_features(freemode_ped)
    for i = 0, 19 do
        ped.set_ped_face_feature(freemode_ped, i, math.random())
    end
end

function npc.more_extra_face_features(freemode_ped)
    ped.set_ped_head_overlay(freemode_ped, 0, math.random(-1, 23), math.random()) -- Blemishes
    ped.set_ped_head_overlay(freemode_ped, 7, math.random(-1, 10), math.random()) -- Sun Damage
    ped.set_ped_head_overlay(freemode_ped, 9, math.random(-1, 17), math.random()) -- Freckles
    ped.set_ped_head_overlay(freemode_ped, 11, math.random(-1, 11), math.random()) -- Body Blemishes
end

function npc.wipe_extra_face_features(freemode_ped)
    for i = 0, 19 do
        ped.set_ped_face_feature(freemode_ped, i, 0)
    end

    ped.set_ped_head_overlay(freemode_ped, 0, 0, 0) -- Blemishes
    ped.set_ped_head_overlay(freemode_ped, 7, 0, 0) -- Sun Damage
    ped.set_ped_head_overlay(freemode_ped, 9, 0, 0) -- Freckles
    ped.set_ped_head_overlay(freemode_ped, 11, 0, 0) -- Body Blemishes
end

function npc.entity_ai(entity1, entity2, anim_dict, anim_string)    
    if (utility.get_distance_between_coords(entity.get_entity_coords(entity1), entity.get_entity_coords(entity2)) < 4) then
        if (math.random(1, 5) == 2) then
            ai.task_play_anim(entity1, anim_dict, anim_string, 8.0, 0, -1, 9, 0, false, false, false)
        else
            ai.stop_anim_task(entity1, anim_dict, anim_string, 1.0)
            ai.task_go_to_coord_by_any_means(entity1, entity.get_entity_coords(entity2) + v3(math.random(-4, 4), math.random(-4, 4), 0), 1, 0, true, 1, 0.0)
        end
    else
        ai.task_goto_entity(entity1, entity2, -1, -1, 25.0)
    end
end

return npc