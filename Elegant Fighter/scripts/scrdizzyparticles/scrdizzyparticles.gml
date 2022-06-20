function dizzyParticles() {
	var dazeObj = instance_create_layer(x, y - sprite_height, "Particle", oDaze);
	with (dazeObj) {
		image_xscale = .5;
		image_yscale = .5;
		owner = other.id;
		xMax = other.sprite_width * .7;
		stars = 1;
		alarm_set(0, 30);
	}
}