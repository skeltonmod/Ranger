event_inherited();
movement = use_tdmc();
gun_sprite = spr_rifle
_xx = 0;
_yy = 0;
dir = 0;
target_dir = 0;

max_wander_time = 50;
wander_timer = max_wander_time;

state = EnemyState.wander;
ik_init();

makeTarget = function () {
	var _target = noone;
	if (!instance_exists(_target)){
		target = -1
	}
	if (target = -1) {
	    if instance_exists(_target)
	    target = instance_nearest(x, y, target)
	}
}