function collision_check(_xto, _yto, _targets, _get_obj = false){
	/// check for collision
    var _list = ds_list_create();
    if(instance_place_list(_xto, _yto, _targets, _list, 0)){
    
        /// loop through all collision instances
        for(var _i = 0; _i < ds_list_size(_list); _i++){
            var _collide = _list[| _i];
        
            /// if collision occurs, we want to get on top of that object if possible
            if(_collide != noone && variable_instance_exists(_collide, "position")){
				
                var _pos2 = _collide.position;
				
                var _zfeet = position.z + position.z_step;
                var _zhead = position.z_top();
				
                if(_zfeet < _pos2.z_top() && _zhead > _pos2.z){
                    /// also, going to fall into this!
                    if(position.z_ground - position.z_step < _pos2.z_top()){
                        ds_list_destroy(_list);
                        if(_get_obj){
                            return _collide;    
                        }
                        return true;
                    }
                } 
            }
        }
    }
    /// remove list to clear memory
    ds_list_destroy(_list);
    if(_get_obj){
        return noone;    
    }
    return false;
	
}