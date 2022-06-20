function dizzyParticles(th) {
	var dazeObj = instance_create_layer(x, y - sprite_height, "Particle", oDaze);
	with (dazeObj) {
		image_xscale = .4;
		image_yscale = .4;
		theta = th;
		owner = other.id;
		stars = 1;
		alarm_set(0, 6);
	}
}