draw_set_font(fnt);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
/*draw_text_transformed_color(x, y, text, 1, 1,
	dir - 90, col1, col1, col2, col2, image_alpha);*/
var edge = 0;
//var edge = global.cameraAdjust + 40;
drawTextColourOutline(clamp(x, edge, room_width - edge), clamp(y, edge, room_height - edge),
	txt, col1, col2, image_alpha, colOl1, colOl2, image_alpha,
	4, 10, image_xscale, image_xscale, image_angle);