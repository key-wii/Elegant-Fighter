/// @description 
slowMo();

if (cooldownPunch > 0) cooldownPunch--;
if (cooldownKick > 0) cooldownKick--;

//Fall
if (!place_meeting(x, y + 1, oFloor) && y != instance_nearest(x, y, oFloor).y) {
	y += 10;
	falling = true;
} else {
	y = instance_nearest(x, y, oFloor).y;
	falling = false;
}