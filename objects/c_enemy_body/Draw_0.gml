// Draw the feet
draw_sprite(spr_player_foot, 0, r_foot_x, r_foot_y);
draw_sprite(spr_player_foot, 0, l_foot_x, l_foot_y);

// Draw the body
draw_sprite_ext(spr_player_body, 0, x + body_offset_x, y + offset_y, 1, 1, 0, c_white, 255);
