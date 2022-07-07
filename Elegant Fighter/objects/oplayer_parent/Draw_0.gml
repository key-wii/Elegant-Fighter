/// @description Draw self, text, & target diamond
//shader_set(shd_shockwave);

draw_self();
drawText(fntText2, fa_center, fa_middle, x, room_height * .9, strState, c_white, c_white, pColor, pColor, 1, 1, 0);
//draw_set_circle_precision(4);
if (instance_exists(target)) {
	var maxShrink = .25;
	var shrinkSpd = .01;
	var sin1 = sin(targetRot * shrinkSpd) * maxShrink - maxShrink;
	var sin2 = sin(targetRot2 * shrinkSpd) * maxShrink - maxShrink;
	var targetAlpha = .6
	draw_sprite_ext(sprTarget, 0, target.x, target.y - target.sprite_height / 2,
		1 - sin1, 1 - sin1, targetRot, c_white, targetAlpha);
	draw_sprite_ext(sprTarget2, 0, target.x, target.y - target.sprite_height / 2,
		1 - sin2, 1 - sin2, targetRot2, c_white, targetAlpha);
	targetRot++;
	targetRot2--;
} else {
	targetRot = 0;
	targetRot2 = 0;
}
//draw_set_circle_precision(360);

//shader_reset();