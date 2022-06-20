// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyAttack(y1, y2) {
	attacking = true;

	var xx1, xx2; 
	switch(dir) {
		case LEFT:
			xx1 = xLeft1;
			xx2 = xLeft2;
			break;
		case RIGHT:
			xx1 = xRight1;
			xx2 = xRight2;
			break;
	}
	hitbox = instance_create_layer(x + xx1, y + y1, layer, obj_hitbox);
	hitbox.image_xscale = xx2 - xx1;
	hitbox.image_yscale = y2 - y1;

	alarm_set(3, 10);
}