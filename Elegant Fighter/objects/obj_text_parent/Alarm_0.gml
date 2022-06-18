/// @description Disappear
if (image_alpha <= .6) {
	image_alpha -= .05;
	speed += .05;
}
image_alpha -= .05;
if (image_alpha <= 0) instance_destroy();
speed += .02 + random(.01);
direction += random_range(.02, -.02);
alarm_set(0, 1);