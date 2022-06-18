atk = -1;
dir = LEFT;
pickerMin = 0;
pickerMax = 99;
attacking = false;

text = noone;
/*text = instance_create_layer(x + xx, y + yy, "Text", obj_text_parent);
instance_destroy(text);*/

alarm_set(0, 1);


yHigh1 = sprite_height * -1;
yHigh2 = sprite_height * -.5 - 1;
yLow1 = sprite_height * -.5;
yLow2 = 0 - 1;
xLeft1 = sprite_width * -2 + 1;
xLeft2 = sprite_width * -.5 + 1;
xRight1 = sprite_width * .5 - 1;
xRight2 = sprite_width * 2 - 1;