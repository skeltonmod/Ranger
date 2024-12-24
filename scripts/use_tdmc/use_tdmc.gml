///@func use_tdmc([place_meeting_func = place_meeting], [corner_slip = 16], [corner_slip_speed = .5], [sprite_catchup_factor = .5])
function use_tdmc(
  _place_meeting = function(_x, _y){
    return place_meeting(_x, _y, p_solid_parent);
  }, 
  _corner_slip = 16, 
  _slip_speed = .5, 
  _catchup_factor = .5) {    
  return {
    draw_x: id.x,
    draw_y: id.y,
    against_wall: { hori: 0, vert: 0 },
    
    _x_speed_left: 0,
    _y_speed_left: 0,
    _corner_slip: _corner_slip,
    _corner_slip_speed_factor: _slip_speed,
    _owner: id,
    _ignore_collision: false,
    _sprite_catchup_factor: _catchup_factor,
    _last_motion_length: 0,
    
    _place_meeting: _place_meeting,
    
    _corner_slip_vert: function(_dir) {
      for(var _i = 1; _i <= _corner_slip; _i++) {
        if(!_place_meeting(_owner.x + _dir, _owner.y - _i)) return -1;  
        if(!_place_meeting(_owner.x + _dir, _owner.y + _i)) return 1;
      }
      return 0;
    },

    _corner_slip_hori: function(_dir) {
      for(var _i = 1; _i <= _corner_slip; _i++) {
        if(!_place_meeting(_owner.x - _i, _owner.y + _dir)) return -1;  
        if(!_place_meeting(_owner.x + _i, _owner.y + _dir)) return 1;
      }
      return 0;
    },
    
    _approach: function(_start, _target, _step) {
      if (_start < _target)
          return min(_start + _step, _target); 
      else
          return max(_start - _step, _target);
    },
    
    _update_draw_pos: function() {
      draw_x = lerp(draw_x, _owner.x, _sprite_catchup_factor);
      draw_y = lerp(draw_y, _owner.y, _sprite_catchup_factor);
    },
    
    _get_out: function() {
      var _precision = 1;
      if(!_place_meeting(_owner.x, _owner.y)) return;
      var _cur_rad = _precision;
      var _start_x = _owner.x;
      var _start_y = _owner.y;
      while(true) {
        for(var _x = -_cur_rad; _x <= _cur_rad; _x += _precision) {
          for(var _y = -_cur_rad; _y <= _cur_rad; _y += _precision) {
            if(_x > _cur_rad && _y > _cur_rad && _x < _cur_rad && _y < _cur_rad) continue;
            _owner.x = _start_x + _x; 
            _owner.y = _start_y + _y;
            if(!_place_meeting(_owner.x, _owner.y)) {
              show_debug_message("Got out after " + string(_cur_rad / _precision) + " iterations");  
              return;
            }
          }
        }
        _cur_rad += _precision
      }
    },
    
    ///@func speed_direction(speed, direction)
    speed_direction: function(_spd, _dir) {
      move_by(lengthdir_x(_spd, _dir), lengthdir_y(_spd, _dir))
    },
    
    ///@func move_by(x speed, y speed)
    move_by: function(_x_speed, _y_speed) {
      var _start_x = _owner.x;
      var _start_y = _owner.y;
      
      _get_out();
      
      against_wall.hori = 0; against_wall.vert = 0;
      
      _x_speed_left += _x_speed;
      _y_speed_left += _y_speed;
      
      var _against_vert = 0, _against_hori = 0;
      var _timeout = ceil(abs(_x_speed_left) + abs(_y_speed_left)) * 10;
      var _timeout_timer = 0;
      while(abs(_x_speed_left) >= 1 || abs(_y_speed_left) >= 1) {
        
        //Horizontal
        if(abs(_x_speed_left) >= 1) {
          var _dir = sign(_x_speed_left);
          _x_speed_left = _approach(_x_speed_left, 0, 1);
          if(_ignore_collision || !_place_meeting(_owner.x + _dir, _owner.y)) {
            _owner.x += _dir;
            _against_hori = 0;
          } else {
            _against_hori = _dir;
            if(!_place_meeting(_owner.x + _dir, _owner.y - 1))
              _y_speed_left -= 1;
            else if(!_place_meeting(_owner.x + _dir, _owner.y + 1))
              _y_speed_left += 1;
            else
              against_wall.hori = _dir;  
          }
        } 
        
        //Vertical
        if(abs(_y_speed_left) >= 1) {
          var _dir = sign(_y_speed_left);
          _y_speed_left = _approach(_y_speed_left, 0, 1);
          if(_ignore_collision || !_place_meeting(_owner.x, _owner.y + _dir)) {
            _owner.y += _dir;
            _against_vert = 0;
          } else {
            _against_vert = _dir;
            if(!_place_meeting(_owner.x - 1, _owner.y + _dir))
              _x_speed_left -= 1;
            else if(!_place_meeting(_owner.x + 1, _owner.y + _dir))
              _x_speed_left += 1;  
            else
              against_wall.vert = _dir;  
          }
        } 
        _timeout_timer++;
        if(_timeout_timer > _timeout) {
          _x_speed_left = 0;
          _y_speed_left = 0;
          break;  
        }
      }
      
      //Go around Corners
      if(against_wall.hori != 0 && against_wall.vert == 0) {
          _y_speed_left += (_corner_slip_vert(against_wall.hori) * _corner_slip_speed_factor);
      }
      
      if(against_wall.vert != 0 && against_wall.hori == 0) {
          _x_speed_left += (_corner_slip_hori(against_wall.vert) * _corner_slip_speed_factor);
      }
      
      if(_against_vert != 0 || _against_hori != 0) {
        against_wall.hori = _against_hori;
        against_wall.vert = _against_vert;
      }
      
      // Calculate motion length
      _last_motion_length = point_distance(_start_x, _start_y, _owner.x, _owner.y);
      
      _update_draw_pos();
    },
    
    ///@func get_motion_length()
    get_motion_length: function() {
      return _last_motion_length;
    }
  }
}