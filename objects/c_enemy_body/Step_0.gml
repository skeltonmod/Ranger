depth = -y;
var bobbing_offset = sin(bobbing_time) * bobbing_amplitude;
bobbing_time += bobbing_speed;
update_wander_behavior(c_player_body, 40, 2);

enemy_head.x = x;
enemy_head.y = y + bobbing_offset;
enemy_head.dir = direction;

enemy_arms.dir = direction;
	
enemy_arms.x = x + body_offset_x;
enemy_arms.y = y;

ik_step_npc(direction, timer);