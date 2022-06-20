// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemyAttack(y1, y2) {
	attacking = true;

	var kdir;
	var upDegrees = 30;
	var xx1, xx2; 
	switch(dir) {
		case LEFT:
			xx1 = xLeft1;
			xx2 = xLeft2;
			kdir = 180 - upDegrees;
			break;
		case RIGHT:
			xx1 = xRight1;
			xx2 = xRight2;
			kdir = 0 + upDegrees;
			break;
	}
	hitbox = instance_create_layer(x + xx1, y + y1, layer, obj_hitbox);
	hitbox.image_xscale = xx2 - xx1;
	hitbox.image_yscale = y2 - y1;
	hitbox.kDir = kdir;

	alarm_set(3, 10);
}