// Calculate directions
var sprite_direction = createFrameFrmAngle(8, dir);
var gun_direction = createFrameFrmAngle(34, dir);
var draw_behind = (sprite_direction >= 4);

// Initialize hand positions
var hand_offset_x = 8;
var hand_offset_y = 0;
var gun_offset_x = 0;
var gun_offset_y = 0;


draw_sprite(spr_player_foot, 0, r_foot_x, r_foot_y);
draw_sprite(spr_player_foot, 0, l_foot_x, l_foot_y);
switch(sprite_direction) {
    case 0: // Up
        hand_offset_x = 0;
        hand_offset_y = 2;
        gun_offset_x = 0;
        gun_offset_y = 0;
        _xx = 8;
        _yy = 5;
        break;
    case 1: // Up-right
        hand_offset_x = 3;
        hand_offset_y = -1;
        gun_offset_x = 0;
        gun_offset_y = 0;
        _yy = -1;
        break;
    case 2: // Right
        hand_offset_x = 8;
        hand_offset_y = 0;
        gun_offset_x = 7;
        gun_offset_y = 2;
        _xx = 13;
        _yy = 2;
        break;
    case 3: // Down-right
        hand_offset_x = 8;
        hand_offset_y = 0;
        gun_offset_x = -8;
        gun_offset_y = 2;
        _xx = -8;
        _yy = -2;
        break;
    case 4: // Down
        hand_offset_x = 8;
        hand_offset_y = 0;
        gun_offset_x = -8;
        gun_offset_y = 0;
        _xx = -13;
        _yy = -2;
        break;
    case 5: // Down-left
    case 6: // Left
        hand_offset_x = 0;
        hand_offset_y = 2;
        gun_offset_x = -8;
        gun_offset_y = 0;
        _xx = -8;
        break;
    case 7: // Up-left
        hand_offset_x = 8;
        hand_offset_y = 2;
        gun_offset_x = -8;
        gun_offset_y = 0;
        _xx = -10;
        _yy = 5;
        break;
}

if (draw_behind) {
	draw_sprite_ext(spr_player_body, 0, x, y + offset_y, 1, 1, 0, c_white, 255);
	draw_sprite_ext(spr_player_head, createFrameFrmAngle(8, dir), x, (y - 5), 1, 1, 0, c_white, 255);
	switch(sprite_direction) {
        case 4:
            draw_sprite(gun_sprite, gun_direction, x - 8, y);
            draw_sprite(spr_player_hands, sprite_direction, x - 8, y);
            _xx = -13;
            _yy = -2;
            break;
        case 5:
			draw_sprite(gun_sprite, gun_direction, x - 8, y);
            draw_sprite(spr_player_hands, sprite_direction, x, y + 2);
            _xx = -8;
            break;
        case 6:
            draw_sprite(gun_sprite, gun_direction, x - 8, y);
            draw_sprite(spr_player_hands, sprite_direction, x + 4, y + 2);
            _xx = -8;
            break;
        case 7:
            draw_sprite(gun_sprite, gun_direction, x - 8, y);
            draw_sprite(spr_player_hands, sprite_direction, x + 8, y + 2);
            draw_sprite(spr_player_hands, sprite_direction, x - 8, y + 2);
            _xx = -10;
            _yy = 5;
            break;
    }
	
} else {
	draw_sprite_ext(spr_player_head, createFrameFrmAngle(8, dir), x, (y - 5), 1, 1, 0, c_white, 255);
    draw_sprite_ext(spr_player_body, 0, x, y + offset_y, 1, 1, 0, c_white, 255);
	switch(sprite_direction) {
        case 0:
            draw_sprite(gun_sprite, gun_direction, x, y);
            draw_sprite(spr_player_hands, sprite_direction, x, y + 2);
            _xx = 8;
            _yy = 5;
            break;
        case 1:
            draw_sprite(gun_sprite, gun_direction, x, y);
            draw_sprite(spr_player_hands, sprite_direction, x + 3, y - 1);
            _yy = -1;
            break;
        case 2:
            draw_sprite(gun_sprite, gun_direction, x + 7, y + 2);
            draw_sprite(spr_player_hands, sprite_direction, x + 8, y);
            draw_sprite(spr_player_hands, sprite_direction, x - 8, y);
            _xx = 13;
            _yy = 2;
            break;
        case 3:
            draw_sprite(gun_sprite, gun_direction, x - 8, y + 2);
            draw_sprite(spr_player_hands, sprite_direction, x + 8, y);
            draw_sprite(spr_player_hands, sprite_direction, x - 8, y);
            _xx = -8;
            _yy = -2;
            break;
    }
}
