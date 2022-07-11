function pushEnemies() {
	var _spd = other.spd / 2;
	if (place_meeting(x +  other.spd, y, oEnemy_parent))
		with (oEnemy_parent) if (place_meeting(x -  other.spd, y, other)) {
			x += clamp(_spd, 0, maxPushSpd);
		}
	if (place_meeting(x -  other.spd, y, oEnemy_parent))
		with (oEnemy_parent) if (place_meeting(x +  other.spd, y, other)) {
			x -= clamp(_spd, 0, maxPushSpd);
		}
}