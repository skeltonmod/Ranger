event_inherited();
wanderx = x
wandery = y
// b = 0;

enemy_arms = instance_create_layer(x, y, "Instances", c_enemy_hands);
enemy_head = instance_create_layer(x, y, "Instances", c_enemy_head);
ik_init();