function pushEnemies() {
	if (place_meeting(x, y, oEnemy_parent))
	with (oEnemy_parent) if (place_meeting(x, y, other)) {
		x += 1;
	}
}