// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Vector2(vx = 0, vy = 0) constructor{
	self.x = vx;
    self.y = vy;
    static normalize = function(){
        var dis = self.length();
        if(dis == 0){
            return;    
        }
        self.x /= dis;
        self.y /= dis;
    };
    static length = function(){
        return(point_distance(0,0,self.x,self.y));
    };
}