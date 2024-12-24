var x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));
depth = -y;
var x_vel = x_input * max_spd;
var y_vel = y_input * max_spd;

var m = movement.move_by(x_vel, y_vel);

dir = point_direction(x, y, mouse_x, mouse_y);

body_offset_x = lengthdir_x(2, point_direction(x, y, mouse_x, mouse_y));
offset_y = lengthdir_y(2, point_direction(x, y, mouse_y, mouse_y));

// Firing the weapon
var muzzle_offset_x = x + lengthdir_x(19, point_direction(x, y, mouse_x, mouse_y)) + _xx;
var muzzle_offset_y = y + lengthdir_y(19, point_direction(x, y, mouse_x, mouse_y)) + _yy;

if(mouse_check_button(mb_left) && projectile_delay <= 0){
	projectile_delay = max_delay;
	var random_dir = irandom_range(-5, 5);
	instance_create_depth(muzzle_offset_x + random_dir, muzzle_offset_y + random_dir, -y, c_muzzle);
	var b = instance_create_depth(muzzle_offset_x + random_dir, muzzle_offset_y + random_dir, -y, c_bullet);
	
	b.speed = 20;
	b.direction = dir;
	b.image_angle = dir;
}

projectile_delay -= 1;


if(x_input != 0 || y_input != 0){
	offset_x = lengthdir_x(4, point_direction(0, 0, x_vel, y_vel));
	offset_y = lengthdir_y(1, point_direction(0, 0, x_vel, y_vel));
}

ik_step(dir, movement.get_motion_length());