function update(){
    position.z += position.z_speed;
    if(position.z > position.z_ground){
        position.z_speed -= position.z_gravity;
    } else {
        /// if below ground, adjust to ground position
        position.z = max(position.z, position.z_ground);
        /// if falling, stop falling
        var _floor_spd = 0;
        position.z_speed = max(position.z_speed, _floor_spd);
    }
}

function update_ground(_targets){
	/// check for collision
    var _list = ds_list_create();
    /// default lowest point
    position.z_ground = 0;
	
    if(instance_place_list(x, y, _targets, _list, 0)){
        for(var _i = 0; _i < ds_list_size(_list); _i++){
            var _collide = _list[| _i];
        
            if(_collide != noone && variable_instance_exists(_collide, "position")){
                var _pos2 = _collide.position;
                if(position.z + position.z_step > _pos2.z_top()){
                    position.z_ground = max(position.z_ground, _pos2.z_top());
                } 
            }
        }
    }
    
    /// remove list to clear memory
    ds_list_destroy(_list);
}