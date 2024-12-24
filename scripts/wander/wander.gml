function update_wander_behavior(herd_leader, wander_radius, spd) {
    if (distance_to_point(herd_leader.x, herd_leader.y) < (wander_radius + 10)) {
        timer -= (1 * global.dt);
        
        if (distance_to_point(wanderx, wandery) > spd) {
            timer = 0;
        }
        
        if (timer < 0) {
            var attempts = 0;
            var found_position = false;
            
            // Try to find a free position without any other instances
            while (!found_position && attempts < 10) {
                wanderx = herd_leader.x - wander_radius + irandom(2 * wander_radius);
                wandery = herd_leader.y - wander_radius + irandom(2 * wander_radius);
                
                // Check if position is free from both walls and other instances
                if (place_free(wanderx, wandery) && 
                    !place_meeting(wanderx, wandery, all)) {
                    found_position = true;
                }
                
                attempts++;
            }
            
            // If we couldn't find a completely free spot, try to find the least crowded area
            if (!found_position) {
                var min_distance = -1;
                var best_x = wanderx;
                var best_y = wandery;
                
                for (var i = 0; i < 8; i++) {
                    var test_x = herd_leader.x + lengthdir_x(wander_radius, i * 45);
                    var test_y = herd_leader.y + lengthdir_y(wander_radius, i * 45);
                    
                    if (place_free(test_x, test_y)) {
                        var dist = distance_to_object(instance_nearest(test_x, test_y, all));
                        if (min_distance == -1 || dist > min_distance) {
                            min_distance = dist;
                            best_x = test_x;
                            best_y = test_y;
                        }
                    }
                }
                
                wanderx = best_x;
                wandery = best_y;
            }
            
            timer = 400 + irandom(500);
        }
    } else {
        // Use mp_potential_paths for smoother movement and collision avoidance
        mp_potential_step_object(herd_leader.x, herd_leader.y, (spd + 0.3 * global.dt), all);
        wanderx = herd_leader.x;
        wandery = herd_leader.y;
        timer = 10;
    }
}