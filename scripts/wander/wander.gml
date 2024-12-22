/// @desc Function Description
/// @param {any*} herd_leader Description
/// @param {real} wander_radius Description
/// @param {real} spd Description
function update_wander_behavior(herd_leader, wander_radius, spd) {
    if (distance_to_point(herd_leader.x, herd_leader.y) < (wander_radius + 10)) {
        timer -= (1 * global.dt);
        if (distance_to_point(wanderx, wandery) > spd) {
			timer = 0;
            //mp_potential_step(wanderx + irandom(20), wandery + irandom(20), 1, false);
            //face = (wanderx > x) ? 1 : -1;
            //b += (0.2 * global.dt);
        } else {
            //b = 0;
        }
        if (timer < 0) {
            wanderx = herd_leader.x - wander_radius + irandom(2 * wander_radius);
            wandery = herd_leader.y - wander_radius + irandom(2 * wander_radius);
            timer = 400 + irandom(500);
        }
        while (!place_free(wanderx, wandery)) {
            wanderx = herd_leader.x - wander_radius + irandom(2 * wander_radius);
            wandery = herd_leader.y - wander_radius + irandom(2 * wander_radius);
            timer = 400 + irandom(800);
        }
    } else {
        //face = (wanderx > x) ? 1 : -1;
        //b += (0.2 * global.dt);
        mp_potential_step(herd_leader.x, herd_leader.y, (spd + 0.3 * global.dt), 0);
        wanderx = herd_leader.x;
        wandery = herd_leader.y;
        timer = 10;
    }
}