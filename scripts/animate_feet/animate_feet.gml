// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animate_feet(arg1){
	var local0;
    var local1;
    var field15 = 10;  // Example value, replace with actual field
    var field31 = 0.0;  // Example value, replace with actual field
    var field67 = walk_phase;  // Example value, replace with actual field

    local0 = floor(field15);
    if (field31 > 0) {
        local0 = floor((1.0 - (field31 * 0.15)) * local0);
    }

    if (arg1 != 0) {
        field67 += local0;
        if (field67 < 0.0) {
            field67 += 360.0;
        } else if (field67 >= 360.0) {
            field67 -= 360.0;
        }
    } else if (field67 % 180.0 != 0.0) {
        local1 = floor(field67);
        field67 += local0;
        if (field67 >= 360.0) {
            field67 -= 360.0;
        }
        if ((local1 <= 180 && field67 > 180.0) || (local1 > 180 && field67 < 180.0)) {
            field67 = local1 <= 180 ? 180.0 : 0.0;
        }
    }

    walk_phase = field67;
}