var sprite_direction = createFrameFrmAngle(8, dir);
var on_top = false;
// DRAW THE GUN OH YIS
var gun_direction = createFrameFrmAngle(34, dir);
// Draw the fucking hands
switch(sprite_direction){
	case 0:
		draw_sprite(gun_sprite, gun_direction, x, y);
		draw_sprite(spr_player_hands, sprite_direction, x, y + 2);
		_xx = 8;
		_yy = 5;
		break;
	case 1:
		draw_sprite(gun_sprite, gun_direction, x, y);
		draw_sprite(spr_player_hands, sprite_direction, x + 3, y - 1);
		
		//_xx = x;
		_yy = -1
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
		on_top = true;
		
		_xx = -8;
		_yy = -2;
		break;
	case 4:
		draw_sprite(gun_sprite, gun_direction, x - 8, y);
		draw_sprite(spr_player_hands, sprite_direction, x - 8, y);
		_xx = -13;
		_yy = -2;
		break;
	case 5:
		draw_sprite(gun_sprite, gun_direction, x - 8, y);
		draw_sprite(spr_player_hands, sprite_direction, x, y + 2);
		//_xx = x;
		_xx = -8;
		break;
	case 6:
		draw_sprite(gun_sprite, gun_direction, x - 8, y);
		draw_sprite(spr_player_hands, sprite_direction, x, y + 2);
		//_xx = x;
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