update();

update_ground(c_block);
motion.x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
motion.y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var move_vector = new Vector2(motion.x * max_spd, motion.y * max_spd);
depth = -y;

dir = point_direction(x, y, mouse_x, mouse_y);

body_offset_x = lengthdir_x(2, point_direction(x, y, mouse_x, mouse_y));
offset_y = lengthdir_y(2, point_direction(x, y, mouse_y, mouse_y));

// Firing the weapon
var muzzle_offset_x = x + lengthdir_x(19, point_direction(x, y, mouse_x, mouse_y)) + _xx;
var muzzle_offset_y = y + lengthdir_y(19, point_direction(x, y, mouse_x, mouse_y)) + _yy;

if(mouse_check_button(mb_left) && projectile_delay <= 0){
	projectile_delay = max_delay;
	var random_dir = irandom_range(-10, 10);
	instance_create_depth(muzzle_offset_x + random_dir, muzzle_offset_y + random_dir, -y, c_muzzle);
	var b = instance_create_depth(muzzle_offset_x + random_dir, muzzle_offset_y + random_dir, -y, c_bullet);
	
	b.speed = 20;
	b.direction = dir;
	b.image_angle = dir;
}


if(motion.length() > 0){
    offset_x = lengthdir_x(4, point_direction(0, 0, motion.x, motion.y));
	offset_y = lengthdir_y(1, point_direction(0, 0, motion.x, motion.y));
    motion.normalize();    
	
    /// detect collision on x axis
    if(collision_check(x+move_vector.x, y, p_solid_parent)){
        move_vector.x = 0;
    }
    
    /// detect collision on y axis
    if(collision_check(x, y+move_vector.y, p_solid_parent)){
        move_vector.y = 0;
    }
	
    x += move_vector.x;
    y += move_vector.y;
}

ik_step(dir);