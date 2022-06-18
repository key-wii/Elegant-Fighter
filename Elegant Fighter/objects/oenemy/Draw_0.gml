/// @description Draw punch/kick
draw_self();

if (atk > -1) {
	if (attacking) {
		var xx1 = 0, yy1 = 0, xx2 = 0, yy2 = 0;
		switch (atk) {
			case HIGH:
				yy1 = yHigh1;
				yy2 = yHigh2;
				break;
			case LOW:
				yy1 = yLow1;
				yy2 = yLow2;
				break;
		}
		switch (dir) {
			case LEFT:
				xx1 = xLeft1;
				xx2 = xLeft2;
				break;
			case RIGHT:
				xx1 = xRight1;
				xx2 = xRight2;
				break;
		}
		draw_rectangle_color(x + xx1, y + yy1, x + xx2, y + yy2,
			c_red, c_red, c_red, c_red, false);
	}
}