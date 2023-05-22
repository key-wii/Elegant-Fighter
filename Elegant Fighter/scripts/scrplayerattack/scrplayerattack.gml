function playerAttack(last, atkType, kBack_power) {
	var kdir = 90;
	var xx1, xx2; 
	switch(dir) {
		case LEFT:
			xx1 = xLeft1;
			xx2 = xLeft2;
			if (last) kdir += 60;
			break;
		case RIGHT:
			xx1 = xRight1;
			xx2 = xRight2;
			if (last) kdir -= 60;
			break;
	}
	hitbox = instance_create_layer(x + xx1, y + y1, "Attack", oHitbox_player);
	hitbox.image_xscale = xx2 - xx1;
	hitbox.image_yscale = y2 - y1;
	hitbox.kDir = kdir;
	hitbox.owner = id;
	if (last) hitbox.last = true;
	hitbox.atkType = atkType;
	hitbox.kBack_power = kBack_power;
	hitbox.dir = dir;

	alarm_set(3, 10);
}