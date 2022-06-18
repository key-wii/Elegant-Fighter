/// @description High Punch
switch (dir) {
	case LEFT:
		xx = sprite_width * -1;
		break;
	case RIGHT:
		xx = sprite_width * 1;
		break;
}
var yy = sprite_height * -.75;
text = instance_create_layer(x + xx, y + yy, "Text", obj_text_parent);
text.txt = "PUNCH";
text.col1 = c_red;
text.col2 = c_red;
text.colOl1 = c_black;
text.colOl2 = c_black;
attacking = true;

alarm_set(3, 10);
pickerMin += 10; //Increase odds of kick by 10%
pickerMax = 99;