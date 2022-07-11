/// @description Draw text & warning indicator
if (dazed) var strState = "Dazed";
else if (attacking) var strState = "Attack";
else if (atk > -1) var strState = "Windup";
else if (speed != 0) var strState = "Knockback";
else var strState = "Default";
drawText(fntText3, fa_center, fa_middle, x, room_height * .9, strState, c_orange, c_orange, c_black, c_black, 1, 1, 0);

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
	xx = sprite_width * -1.25;
	draw_sprite_ext(sprWarning, 0, x + xx, y + yy, 1, 1, 0, c_white, 1);
}