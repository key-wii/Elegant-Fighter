function playerInput() {
	//Dodge
	if (!falling) {
		if (keyboard_check(inputU1) || keyboard_check(inputU2)) {
			instance_change(oPlayer_hop, true);
		}
		if (keyboard_check(inputD1) || keyboard_check(inputD2)) {
			instance_change(oPlayer_duck, true);
		}
	}
	
	//Movement
	var xMove = 0;
	if (keyboard_check(inputL1) || keyboard_check(inputL2)/* && !place_meeting(x - topSpeed, y, obj_wall)*/) {
		xMove -= spd;
	}
	if (keyboard_check(inputR1) || keyboard_check(inputR2)/* && !place_meeting(x + topSpeed, y, obj_wall)*/) {
		xMove += spd;
	}
	x += xMove;
	
	//Push away enemies
	if (place_meeting(x, y, oEnemy_parent))
		with (oEnemy_parent) if (place_meeting(x, y, other)) {
			x += clamp(other.spd / 2, 0, maxPushSpd);
		}
}