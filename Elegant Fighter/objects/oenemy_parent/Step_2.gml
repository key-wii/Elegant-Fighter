/// @description Fall
for (var i = 0; i < 10; i++) {
	if (!place_meeting(x, y + 1, oFloor)) {
		y += 1;
		falling = true;
	} else {
		y = instance_nearest(x, y, oFloor).y;
		falling = false;
		exit;
	}
}

/*if (y > instance_nearest(x, y, oFloor).y - 5 && y < instance_nearest(x, y, oFloor).y + 5) {
	y = instance_nearest(x, y, oFloor).y// + 2;
	falling = false;
	exit;
}
if (!place_meeting(x, y + 1, oFloor) && y != instance_nearest(x, y, oFloor).y) {
	y += 10;
	falling = true;
} else {
	y = instance_nearest(x, y, oFloor).y;
	falling = false;
}*/