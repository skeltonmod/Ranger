// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init(_height = 16){
	position = {
        z: 0,            /// position on z axis
        z_speed: 0,        /// speed in z direction
        z_gravity: 0.5,    /// accelerate down 
        z_ground: 0,    /// lowest position you can fall
        z_height: _height,    /// height of object
        z_step: 4,        /// climb on object a little higher
        z_top: function(){
            return z + z_height;    
        }
   };
}