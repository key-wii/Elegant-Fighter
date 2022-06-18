/// @description Draw warning indicator
if (atk > -1 && !attacking) {
	var xx = 0, yy = 0;
	switch (atk) {
		case HIGH:
			yy = sprite_height * -.75;
			break;
		case LOW:
			yy = sprite_height * -.25;
			break;
	}
	switch (dir) {
		case LEFT:
			xx = sprite_width * -1.25;
			break;
		case RIGHT:
			xx = sprite_width * 1.25;
			break;
	}
	draw_sprite_ext(sprWarning, 0, x + xx, y + yy, 1, 1, 0, c_white, 1);
}