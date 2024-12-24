makeTarget();
depth = -y;
switch (state){
	case EnemyState.wander:
		wander_timer -= 1;
		
		if (x < 0 || x > room_width || y < 0 || y > room_height) {
            // Steer back toward the room center
            target_dir = point_direction(x, y, clamp(x, 0, room_width), clamp(y, 0, room_height));
        }
		
		if(movement.against_wall.hori || movement.against_wall.vert){
			target_dir = point_direction(x, y, clamp(x, 0, room_width), clamp(y, 0, room_height));
		}
		
		if(wander_timer <= 0){
			target_dir = random(360)
			wander_timer = max_wander_time;
		}
		
	break;
}

// move the character based on the dir
dir = lerp(dir, target_dir, 0.1); // Adjust 0.1 for the rate of interpolation (higher = faster)


movement.speed_direction(max_spd, dir);

ik_step(dir, movement.get_motion_length());