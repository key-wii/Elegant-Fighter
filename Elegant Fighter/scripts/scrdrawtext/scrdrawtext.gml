function drawText(fnt, halign, valign, xx, yy, txt, col1, col2, colOl1, colOl2, xscale, yscale, angle) {
	draw_set_font(fnt);
	draw_set_halign(halign);
	draw_set_valign(valign);
	/*draw_text_transformed_color(x, y, text, 1, 1,
		dir - 90, col1, col1, col2, col2, image_alpha);*/
	draw_text_colour_outline(xx, yy, txt, col1, col2, image_alpha, colOl1, colOl2, image_alpha,
		4, 10, xscale, yscale, angle);
}