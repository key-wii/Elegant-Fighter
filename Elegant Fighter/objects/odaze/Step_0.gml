/// @description 
image_angle += 6;

if (!instance_exists(owner)) instance_destroy();
if (goLeft) {
	xx -= 2;
	if (xx <= -xMax) {
		layer = layer_get_id("Particle");
		goLeft = false;
	} else if (xx >= 0) {
		yy -= .25;
		image_xscale -= .005;
		image_yscale -= .005;
	} else {
		yy += .25;
		image_xscale += .005;
		image_yscale += .005;
	}
} else {
	xx += 2;
	if (xx >= xMax) {
		layer = layer_get_id("Floor");
		goLeft = true;
	} else if (xx <= 0) {
		yy -= .25;
		image_xscale += .0075;
		image_yscale += .0075;
	} else {
		yy += .25;
		image_xscale -= .0075;
		image_yscale -= .0075;
	}
}
x = owner.x + xx;
y = owner.y + yy - owner.sprite_height * .99;