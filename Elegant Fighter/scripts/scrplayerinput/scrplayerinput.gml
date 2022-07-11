function playerInput() {
	//NOTE: gamepad port 0-3 is for XInput (XBox), port 4-11 is for DirectInput (everything else)
	
	//Pause
	/*if (keyboard_check(inputPause1) || keyboard_check(inputPause2)) {
		
	}*/
	
	//Attack
	punchInput(false);
	kickInput(false);
	
	//Dodge
	dodgeInput();
	
	//Movement
	var xMove = 0;
	if (keyboard_check(inputL1) || keyboard_check(inputL2) ||
		gamepad_button_check(0, gp_padl) || gamepad_axis_value(0, gp_axislh) <= -.5 ||
		gamepad_button_check(4, gp_padl) || gamepad_axis_value(4, gp_axislh) <= -.5
		/*&& !place_meeting(x - topSpeed, y, obj_wall)*/) {
			xMove -= spd;
	}
	if (keyboard_check(inputR1) || keyboard_check(inputR2) ||
		gamepad_button_check(0, gp_padr) || gamepad_axis_value(0, gp_axislh) >= .5 ||
		gamepad_button_check(4, gp_padr) || gamepad_axis_value(4, gp_axislh) >= .5
		/*&& !place_meeting(x + topSpeed, y, obj_wall)*/) {
			xMove += spd;
	}
	x += xMove;
	if (xMove > 0) {
		dir = RIGHT;
		image_xscale = 1;
	} else if (xMove < 0) {
		dir = LEFT;
		image_xscale = -1;
	}
	//if (xMove != 0) pushEnemies();
	pushEnemies();
}