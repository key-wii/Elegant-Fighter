/// @description 
slowMo();

//Fall
if (!place_meeting(x, y + 1, oFloor) && y != instance_nearest(x, y, oFloor).y) {
	y += 10;
	falling = true;
} else {
	y = instance_nearest(x, y, oFloor).y;
	falling = false;
}