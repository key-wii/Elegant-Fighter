/// @description Draw self, text, & target diamond
//shader_set(shd_shockwave);


draw_self();
drawText(fntText2, fa_center, fa_middle, x, room_height * .9, strState, c_white, c_white, pColor, pColor, 1, 1, 0);
draw_set_circle_precision(4);
if (instance_exists(target)) {
	draw_circle(target.x, target.y - target.sprite_height / 2,
	target.sprite_width * 1.25, true);
}
draw_set_circle_precision(360);

//shader_reset();