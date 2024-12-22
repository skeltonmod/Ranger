offset_x = lengthdir_x(5, point_direction(x, y, c_player_body.x, c_player_body.y));
offset_y = lengthdir_y(3, point_direction(x, y, c_player_body.x, c_player_body.y));

if(array_contains(depth_frames, createFrameFrmAngle(8, dir))){
	depth = c_enemy_body.depth + -y;
}else{
	depth = -y;
}