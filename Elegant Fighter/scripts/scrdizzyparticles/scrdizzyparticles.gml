function dizzyParticles() {
	var dazeObj = instance_create_layer(x, y - sprite_height, "Particle", oDaze);
	with (dazeObj) {
		owner = other.id;
		xMax = other.sprite_width * .7;
		xx = xMax;
		stars = 1;
		alarm_set(0, 30);
	}
}