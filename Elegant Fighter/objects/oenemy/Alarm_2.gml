/// @description Low Kick
switch (dir) {
	case LEFT:
		xx = sprite_width * -1;
		break;
	case RIGHT:
		xx = sprite_width * 1;
		break;
}
var yy = sprite_height * -.25;
text = instance_create_layer(x + xx, y + yy, "Text", obj_text_parent);
text.txt = "KICK";
text.col1 = c_red;
text.col2 = c_red;
text.colOl1 = c_black;
text.colOl2 = c_black;
text.direction = 270;
attacking = true;

alarm_set(3, 10);
pickerMin = 0;
pickerMax -= 10; //Increase odds of punch by 10%