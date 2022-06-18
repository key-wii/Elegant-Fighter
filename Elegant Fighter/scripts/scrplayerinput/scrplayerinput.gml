function playerInput() {
	if (keyboard_check(inputU1) || keyboard_check(inputU2)) {
		instance_change(oPlayer_hop, true);
	}
	if (keyboard_check(inputD1) || keyboard_check(inputD2)) {
		instance_change(oPlayer_duck, true);
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
}