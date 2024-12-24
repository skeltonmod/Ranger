// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ik_init() {
    thigh_length = 6;
    calf_length = 3;

    // Right leg variables
    r_move = 0;

    r_hip_x = x;
    r_hip_y = y;
    r_knee_x = x;
    r_knee_y = y;
    r_foot_x = x;
    r_foot_y = y;

    // Left leg variables
    l_move = 90;

    l_hip_x = x;
    l_hip_y = y;
    l_knee_x = x;
    l_knee_y = y;
    l_foot_x = x;
    l_foot_y = y;

    // Look direction
    look_direction = 0;
}

function ik_step(dir = 0, motion_length = 0) {
	var _hipoffset = 5;
	r_hip_x = x + lengthdir_x(_hipoffset, dir + 90);
    r_hip_y = y + lengthdir_y(_hipoffset, dir + 90);

    l_hip_x = x - lengthdir_x(_hipoffset, dir + 90);
    l_hip_y = y - lengthdir_y(_hipoffset, dir + 90);
    if (motion_length > 0) {
        // Make legs move
        var _movespd = 2;
        r_move += _movespd;
        l_move += _movespd;
        // Right Leg
        // Knee
        r_knee_x = r_hip_x + lengthdir_x(cos(r_move / 10) * thigh_length, dir);
        r_knee_y = r_hip_y + lengthdir_y(cos(r_move / 10) * thigh_length, dir) + thigh_length;
        r_knee_y = clamp(r_knee_y, y - thigh_length, y + thigh_length);

        // Foot
        r_foot_x = r_knee_x - lengthdir_x(abs(cos(r_move / 10)) * calf_length, dir);
        r_foot_y = r_knee_y + (lengthdir_y(cos(r_move / 10) * calf_length, dir) + sin(r_move / 10) * calf_length / 2) + calf_length / 2;
        r_foot_y = clamp(r_foot_y, y - (thigh_length + calf_length), y + (thigh_length + calf_length));

        // Left Leg
        // Knee
        l_knee_x = l_hip_x + lengthdir_x(cos(l_move / 10) * thigh_length, dir);
        l_knee_y = l_hip_y + lengthdir_y(cos(l_move / 10) * thigh_length, dir) + thigh_length;
        l_knee_y = clamp(l_knee_y, y - thigh_length, y + thigh_length);

        // Foot
        l_foot_x = l_knee_x - lengthdir_x(abs(cos(l_move / 10)) * calf_length, dir);
        l_foot_y = l_knee_y + (lengthdir_y(cos(l_move / 10) * calf_length, dir) + sin(l_move / 10) * calf_length / 2) + calf_length / 2;
        l_foot_y = clamp(l_foot_y, y - (thigh_length + calf_length), y + (thigh_length + calf_length));
    } else {
        // Make legs stop moving	
        var _lerpspd = 0.3;
        r_knee_x = lerp(r_knee_x, r_hip_x, _lerpspd);
        r_knee_y = lerp(r_knee_y, r_hip_y + thigh_length, _lerpspd);
        r_foot_x = lerp(r_foot_x, r_knee_x + 6, _lerpspd);
        r_foot_y = lerp(r_foot_y, r_knee_y + calf_length, _lerpspd);

        l_knee_x = lerp(l_knee_x, l_hip_x, _lerpspd);
        l_knee_y = lerp(l_knee_y, l_hip_y + thigh_length, _lerpspd);
        l_foot_x = lerp(l_foot_x, l_knee_x - 6, _lerpspd);
        l_foot_y = lerp(l_foot_y, l_knee_y + calf_length, _lerpspd);
    }
}

