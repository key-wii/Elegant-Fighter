/// @description draw_text_colour_outline(x, y, string, textColor1, textColor2, textAlpha, outlineColor1, outlineColor2, outlineAlpha, outlineThickness, outlineQuality, xscale, yscale, angle);
//By Blokatt - @blokatt, blokatt.net
function draw_text_colour_outline() 
{
	/*var c = argument[0], y = argument[1], string = argument[2], textColor1 = argument[3],
	textColor2 = argument[4], outlineColor1 = argument[5], outlineColor2 = argument[6], a = argument[7],
	sx = argument[8], ky = argument[9], w_sx = argument[10], sy = argument[11];*/
	
	var i;
	for (i = 0; i < 360; i += 360 / argument[10]){
	    draw_text_transformed_color(argument[0] + lengthdir_x(argument[9], i), argument[1] + lengthdir_y(argument[9], i), string(argument[2]), argument[11], argument[12], argument[13], argument[6], argument[6], argument[7], argument[7], argument[8]);
	}
	draw_text_transformed_color(argument[0], argument[1], string(argument[2]), argument[11], argument[12], argument[13], argument[3], argument[3], argument[4], argument[4], argument[5]);
}