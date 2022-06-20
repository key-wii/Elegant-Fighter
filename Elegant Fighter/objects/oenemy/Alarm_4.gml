/// @description Move to player
var player = oPlayer_parent;
var inFront = false;
var _spd = spd;
var xx1 = 0, xx2 = 0;
switch (dir) {
	case LEFT:
		xx1 = x + xLeft1 * .6;
		xx2 = x + xLeft2 * .6;
		if (player.x <= x) inFront = true;
		_spd = spd * -1;
		break;
	case RIGHT:
		xx1 = x + xRight1 * .6;
		xx2 = x + xRight2 * .6;
		if (player.x >= x) inFront = true;
		_spd = spd;
		break;
}
var inRange = player.x >= xx1 && player.x <= xx2;
if (!inRange) {
	if (inFront) {
		x += _spd;
		alarm_set(4, 1);
	} else {
		switch (dir) {
			case LEFT: dir = RIGHT; image_xscale = -1; break;
			case RIGHT: dir = LEFT; image_xscale = 1; break;
		}
		alarm_set(4, 15);
	}
}
else alarm_set(0, 1);