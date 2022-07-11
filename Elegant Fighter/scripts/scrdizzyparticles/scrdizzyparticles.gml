function dizzyParticles() {
	var obj = oDaze_CcWise;
	var xm = 1;
	if (dir == RIGHT) {
		xm = -1;
		obj = oDaze_cWise
	}
	
	var dazeObj = instance_create_layer(x, y - sprite_height, "Particle", obj);
	with (dazeObj) {
		owner = other.id;
		xMax = other.sprite_width * .7 * xm;
		
		xx = xMax * xm;
		stars = 1;
		alarm_set(0, 30);
		dazeLen = other.dazeLen;
		dir = other.dir;
		rot = xm;
		if (rot == -1) goLeft = true;
	}
}